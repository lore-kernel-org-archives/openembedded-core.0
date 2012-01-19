Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoKW-0004D6-EC
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:30:48 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:22:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472098"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:22:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:32 -0800
Message-Id: <c0cd44bb5588e96b00631de1f1f8a8143b338c02.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/33] gnutls: Fix compilation on uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2012 09:30:48 -0000

From: Khem Raj <raj.khem@gmail.com>

Examples do not compile correctly on latest uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../correct_rpl_gettimeofday_signature.patch       |   57 ++++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_2.12.14.bb      |    6 ++-
 2 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.14/correct_rpl_gettimeofday_signature.patch

diff --git a/meta/recipes-support/gnutls/gnutls-2.12.14/correct_rpl_gettimeofday_signature.patch b/meta/recipes-support/gnutls/gnutls-2.12.14/correct_rpl_gettimeofday_signature.patch
new file mode 100644
index 0000000..b8f0d72
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls-2.12.14/correct_rpl_gettimeofday_signature.patch
@@ -0,0 +1,57 @@
+Currently we fail on uclibc like below
+
+| In file included from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/sys/procfs.h:32:0,
+|                  from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/sys/ucontext.h:26,
+|                  from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/signal.h:392,
+|                  from ../../gl/signal.h:52,
+|                  from ../../gl/sys/select.h:58,
+|                  from /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemuarm/usr/include/sys/types.h:220,
+|                  from ../../gl/sys/types.h:28,
+|                  from ../../lib/includes/gnutls/gnutls.h:46,
+|                  from ex-cxx.cpp:3:
+| ../../gl/sys/time.h:396:66: error: conflicting declaration 'void* restrict'
+| ../../gl/sys/time.h:396:50: error: 'restrict' has a previous declaration as 'timeval* restrict'
+| make[4]: *** [ex-cxx.o] Error 1
+| make[4]: *** Waiting for unfinished jobs....
+
+
+GCC detects that we call 'restrict' as param name in function
+signatures and complains since both params are called 'restrict'
+therefore we use __restrict to denote the C99 keywork
+
+This only happens of uclibc since this code is not excercised with
+eglibc otherwise we will have same issue there too
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: gnutls-2.12.14/gl/sys_time.in.h
+===================================================================
+--- gnutls-2.12.14.orig/gl/sys_time.in.h	2012-01-15 10:54:39.517285351 -0800
++++ gnutls-2.12.14/gl/sys_time.in.h	2012-01-15 10:59:23.773299108 -0800
+@@ -82,20 +82,20 @@
+ #    define gettimeofday rpl_gettimeofday
+ #   endif
+ _GL_FUNCDECL_RPL (gettimeofday, int,
+-                  (struct timeval *restrict, void *restrict)
++                  (struct timeval *__restrict, void *__restrict)
+                   _GL_ARG_NONNULL ((1)));
+ _GL_CXXALIAS_RPL (gettimeofday, int,
+-                  (struct timeval *restrict, void *restrict));
++                  (struct timeval *__restrict, void *__restrict));
+ #  else
+ #   if !@HAVE_GETTIMEOFDAY@
+ _GL_FUNCDECL_SYS (gettimeofday, int,
+-                  (struct timeval *restrict, void *restrict)
++                  (struct timeval *__restrict, void *__restrict)
+                   _GL_ARG_NONNULL ((1)));
+ #   endif
+ /* Need to cast, because on glibc systems, by default, the second argument is
+                                                   struct timezone *.  */
+ _GL_CXXALIAS_SYS_CAST (gettimeofday, int,
+-                       (struct timeval *restrict, void *restrict));
++                       (struct timeval *__restrict, void *__restrict));
+ #  endif
+ _GL_CXXALIASWARN (gettimeofday);
+ # elif defined GNULIB_POSIXCHECK
diff --git a/meta/recipes-support/gnutls/gnutls_2.12.14.bb b/meta/recipes-support/gnutls/gnutls_2.12.14.bb
index 21fd187..6a50cec 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.14.bb
@@ -1,9 +1,11 @@
 require gnutls.inc
 
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 
 SRC_URI += "file://gnutls-openssl.patch \
-            file://configure-fix.patch"
+            file://correct_rpl_gettimeofday_signature.patch \
+            file://configure-fix.patch \
+           "
 
 python() {
     if not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1):
-- 
1.7.6.5



