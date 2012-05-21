Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWWJV-0006kD-6e
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 19:22:33 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so6181608dal.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 10:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=IdJc5dK+zVZ0akBfKzvIBefw80OKqc4OpQmZB9/9upQ=;
	b=ZQPBonFl66p9KuTDqTq5/pEvCyTBYMR4/LsFnk/zGQsbTpNOdg5Y9YGEvdxO84gxbZ
	Y+q/cN7SSrLZCYD0YgxBl71XU5am7Sw7UyHstx0yT/jglno3KqFRGcNIR6prnIZgmzAH
	uUriYBlUOIwOaD5+pax5/uDo6Lb9MCHVL0+SJjdQX4cAmChU9bWLcd0YXAPeM2qF7dAI
	vI65i0GxwQTxBadTEulzIxnPP238g0aGiLxD5PlLw1E3+RThvGIxdqAWSLA/a28GgD4C
	5kOilDZXAPIpjP/XnC4FxgQ2D1ApzMjuk0vXr3SM97YHVAG6GxLe7W+I8HsL75sXmu9+
	gu/Q==
Received: by 10.68.200.68 with SMTP id jq4mr26266450pbc.42.1337620347324;
	Mon, 21 May 2012 10:12:27 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ou2sm2547652pbb.53.2012.05.21.10.12.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 May 2012 10:12:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 May 2012 10:11:52 -0700
Message-Id: <8ac9f59bcdf94101768690b5888346dc4315f050.1337620159.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1337620159.git.raj.khem@gmail.com>
References: <cover.1337620159.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] gcc-4.7: Add knowledge about arm hf dynamic loader
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
X-List-Received-Date: Mon, 21 May 2012 17:22:33 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    1 +
 .../gcc/gcc-4.7/arm-hard-float-loader.patch        |   48 ++++++++++++++++++++
 2 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/arm-hard-float-loader.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index efd166c..0321776 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -65,6 +65,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 	   file://libgcc-sjlj-check.patch \
 	   file://cpp-honor-sysroot.patch \
 	   file://mips64-default-n64.patch \
+	   file://arm-hard-float-loader.patch \
 	  "
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${BRANCH}"
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/arm-hard-float-loader.patch b/meta/recipes-devtools/gcc/gcc-4.7/arm-hard-float-loader.patch
new file mode 100644
index 0000000..dfa0d19
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/arm-hard-float-loader.patch
@@ -0,0 +1,48 @@
+This patch is still being discussed by probably is almost
+final version. We add the OE notion of multilib on top
+
+Upstream-Status: Backport [ adapted ]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gcc-4_7-branch/gcc/config/arm/linux-eabi.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/arm/linux-eabi.h	2012-04-30 15:28:31.891863845 -0700
++++ gcc-4_7-branch/gcc/config/arm/linux-eabi.h	2012-04-30 15:37:11.531888994 -0700
+@@ -32,7 +32,8 @@
+   while (false)
+ 
+ /* We default to a soft-float ABI so that binaries can run on all
+-   target hardware.  */
++   target hardware.  If you override this to use the hard-float ABI then
++   change the setting of GLIBC_DYNAMIC_LINKER_DEFAULT as well.  */
+ #undef  TARGET_DEFAULT_FLOAT_ABI
+ #define TARGET_DEFAULT_FLOAT_ABI ARM_FLOAT_ABI_SOFT
+ 
+@@ -59,10 +60,23 @@
+ #undef  SUBTARGET_EXTRA_LINK_SPEC
+ #define SUBTARGET_EXTRA_LINK_SPEC " -m " TARGET_LINKER_EMULATION
+ 
+-/* Use ld-linux.so.3 so that it will be possible to run "classic"
+-   GNU/Linux binaries on an EABI system.  */
++/* GNU/Linux on ARM currently supports three dynamic linkers:
++   - ld-linux.so.2 - for the legacy ABI
++   - ld-linux.so.3 - for the EABI-derived soft-float ABI
++   - ld-linux-armhf.so.3 - for the EABI-derived hard-float ABI.
++   All the dynamic linkers live in /lib.
++   We default to soft-float, but this can be overridden by changing both
++   GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
++
+ #undef  GLIBC_DYNAMIC_LINKER
+-#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.3"
++#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT SYSTEMLIBS_DIR "ld-linux.so.3"
++#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT SYSTEMLIBS_DIR "ld-linux-armhf.so.3"
++#define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
++
++ #define GLIBC_DYNAMIC_LINKER \
++    "%{mfloat-abi=hard:" GLIBC_DYNAMIC_LINKER_HARD_FLOAT "} \
++     %{mfloat-abi=soft*:" GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "} \
++     %{!mfloat-abi=*:" GLIBC_DYNAMIC_LINKER_DEFAULT "}"
+ 
+ /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
+    use the GNU/Linux version, not the generic BPABI version.  */
-- 
1.7.5.4



