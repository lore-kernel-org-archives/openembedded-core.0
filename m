Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 90821601E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 12:37:06 +0000 (UTC)
IronPort-SDR: Z2/ObEEzabEXePXhln92omLj8JWKsr14bDxktpov2fev0T0gPmAaNfp0XTcGH0Gdd3zCALB8oX
	Tms5c9OqDV329C5SlxmH7bUU2kZycEaAxsGuUnhmkXsF+TlTqZjfYi7V2ffg1HamF6grMZLj2f
	PRZ76J9RF00HeeBPIQnhZASdcX7PueuuKkvi+AbTU3oX/FfCaD5YGKzaVNxg3DFbCFV3CeDMzx
	OOWUqLALdnBUMXrnq5nHxa+GB/rXtoONphkCQd8r6ZhfBE+y5vtBwoBmg9kYaYyuvRyfYU0n/8
	xT0=
X-IronPort-AV: E=Sophos;i="5.70,377,1574118000"; 
   d="scan'208";a="4720651"
From: Peter Kjellerstedt <pkj@axis.com>
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jan 2020 09:32:12 +0100
Message-ID: <20200129083212.17559-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [PATCH] glibc: Make it possible to use PTHREAD_MUTEX_INITIALIZER with -std=c11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jan 2020 09:28:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This avoids the following error when building with -std=c11:

  In file included from /usr/include/bits/thread-shared-types.h:74,
                   from /usr/include/bits/pthreadtypes.h:23,
                   from /usr/include/pthread.h:26,
                   from bug25271.c:1:
  bug25271.c:3:21: error: ‘PTHREAD_MUTEX_DEFAULT’ undeclared here (not in a function)
      3 | pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;
        |                     ^~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...-PTHREAD_MUTEX_DEFAULT-in-macro-defi.patch | 48 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0030-nptl-Avoid-using-PTHREAD_MUTEX_DEFAULT-in-macro-defi.patch

diff --git a/meta/recipes-core/glibc/glibc/0030-nptl-Avoid-using-PTHREAD_MUTEX_DEFAULT-in-macro-defi.patch b/meta/recipes-core/glibc/glibc/0030-nptl-Avoid-using-PTHREAD_MUTEX_DEFAULT-in-macro-defi.patch
new file mode 100644
index 0000000000..215c717773
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0030-nptl-Avoid-using-PTHREAD_MUTEX_DEFAULT-in-macro-defi.patch
@@ -0,0 +1,48 @@
+From 1ad498474920d9cb879f934dd5781b872bb65fec Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 27 Jan 2020 14:53:00 +0100
+Subject: [PATCH] nptl: Avoid using PTHREAD_MUTEX_DEFAULT in macro definition
+ [BZ #25271]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Commit 1c3f9acf1f1f75faa7a28bf39af64afd ("nptl: Add struct_mutex.h")
+replaced a zero constant with the identifier PTHREAD_MUTEX_DEFAULT
+in the macro PTHREAD_MUTEX_INITIALIZER.  However, that constant
+is not available in ISO C11 mode:
+
+In file included from /usr/include/bits/thread-shared-types.h:74,
+                 from /usr/include/bits/pthreadtypes.h:23,
+                 from /usr/include/pthread.h:26,
+                 from bug25271.c:1:
+bug25271.c:3:21: error: ‘PTHREAD_MUTEX_DEFAULT’ undeclared here (not in a function)
+    3 | pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;
+      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
+
+This commit change the constant to the equivalent
+PTHREAD_MUTEX_TIMED_NP, which is in the POSIX extension namespace
+and thus always available.
+
+Tested on x86_64-linux-gnu and i686-linux-gnu.  Verified that a
+minimal example now builds in -std=c11 mode.
+
+Upstream-Status: Submitted [https://patchwork.ozlabs.org/patch/1229855]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ sysdeps/nptl/pthread.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysdeps/nptl/pthread.h b/sysdeps/nptl/pthread.h
+index 7825737840..44dd707896 100644
+--- a/sysdeps/nptl/pthread.h
++++ b/sysdeps/nptl/pthread.h
+@@ -84,7 +84,7 @@ enum
+ 
+ 
+ #define PTHREAD_MUTEX_INITIALIZER \
+- { {  __PTHREAD_MUTEX_INITIALIZER (PTHREAD_MUTEX_DEFAULT) } }
++ { {  __PTHREAD_MUTEX_INITIALIZER (PTHREAD_MUTEX_TIMED_NP) } }
+ #ifdef __USE_GNU
+ # define PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP \
+  { {  __PTHREAD_MUTEX_INITIALIZER (PTHREAD_MUTEX_RECURSIVE_NP) } }
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 9f299a7bc3..0c12eb5517 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -40,6 +40,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0027-intl-Emit-no-lines-in-bison-generated-files.patch \
            file://0028-inject-file-assembly-directives.patch \
            file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
+           file://0030-nptl-Avoid-using-PTHREAD_MUTEX_DEFAULT-in-macro-defi.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.21.1


