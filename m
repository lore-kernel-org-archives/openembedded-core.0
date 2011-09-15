Received: from mailbackup.inode.at ([213.229.60.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1R47QP-0005Lr-Ha
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 10:36:01 +0200
Received: from [62.99.145.13] (port=31034 helo=mx.inode.at)
	by mailbackup.inode.at with esmtp (Exim 4.76)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1R47FK-0008Dk-HE
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 10:24:34 +0200
Received: from [83.64.51.210] (port=13283 helo=gateway1.hale)
	by smartmx-11.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <Bernhard.Guillon@hale.at>)
	id 1R47FH-0007iK-Py for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 10:24:31 +0200
Received: from mail1.hale.at (mail2.hale [192.168.100.12])
	by gateway1.hale (8.13.8/8.13.7) with ESMTP id p8F8OObH010852
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 10:24:24 +0200
Received: from entw59.HALE ([192.168.100.102]) by hale.at with MailEnable
	ESMTP; Thu, 15 Sep 2011 10:24:17 +0200
From: Bernhard Guillon <Bernhard.Guillon@hale.at>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 10:23:58 +0200
Message-Id: <1316075038-2729-1-git-send-email-Bernhard.Guillon@hale.at>
X-Mailer: git-send-email 1.7.6
MIME-Version: 1.0
X-HALE-MailScanner-Information: Please contact the ISP for more information
X-MailScanner-ID: p8F8OObH010852
X-HALE-MailScanner: Found to be clean
X-HALE-MailScanner-From: bernhard.guillon@hale.at
MailScanner-NULL-Check: 1316679866.01506@qD7vXYZd0LoTKmQV6HM8Tg
X-Spam-Status: No
Subject: [PATCH] liboil-0.3.17: add upstream Fix-enable-vfp-flag patch
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
X-List-Received-Date: Thu, 15 Sep 2011 08:36:02 -0000

Add upstream 1921498bcc06408e8b051a3a9e9ce4182998f748 patch to fix
compiling with vfp

Without this patch this error occours on arm with vfp and softfloat:

| math_vfp_asm.S:273: Error: selected processor does not support `fnegd d12,d4'
| math_vfp_asm.S:273: Error: selected processor does not support `fstmiad r0!,{d12,d13,d14,d15}'
| math_vfp_asm.S:273: Error: selected processor does not support `fmxr fpscr,lr'
| make[3]: *** [math_vfp_asm.lo] Error 1

Signed-off-by: Bernhard Guillon <Bernhard.Guillon@hale.at>
---
 .../liboil-0.3.17/0001-Fix-enable-vfp-flag.patch   |   39 ++++++++++++++++++++
 meta/recipes-support/liboil/liboil_0.3.17.bb       |    3 +-
 2 files changed, 41 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch

diff --git a/meta/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch b/meta/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch
new file mode 100644
index 0000000..5b7dd4e
--- /dev/null
+++ b/meta/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch
@@ -0,0 +1,39 @@
+From 1921498bcc06408e8b051a3a9e9ce4182998f748 Mon Sep 17 00:00:00 2001
+From: David Schleef <ds@schleef.org>
+Date: Fri, 8 Apr 2011 10:05:49 -0700
+Subject: [PATCH 10/10] Fix --enable-vfp flag
+
+Patch from Christophe Lyon, fixes #36084.
+---
+ configure.ac           |    4 ++--
+ liboil/arm/Makefile.am |    1 +
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 98c81fb..407d88c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -188,8 +188,8 @@ fi
+ AC_ARG_ENABLE(vfp,
+   AC_HELP_STRING([--enable-vfp],[compile with Vector Floating-point unit support]),
+   enable_vfp=$enableval,enable_vfp=yes)
+-if test "x$enable-vfp" = xyes -a x$HAVE_GCC_ASM = xyes -a x$HAVE_ARM = xyes; then
+-  AS_COMPILER_FLAG(["-Wa,-mfpu=vfp"],
++if test "x$enable_vfp" = xyes -a x$HAVE_GCC_ASM = xyes -a x$HAVE_ARM = xyes; then
++  AS_COMPILER_FLAG(["-mfpu=vfp"],
+     [VFP_CFLAGS="$VFP_CFLAGS -mfpu=vfp"],
+     true)
+   #AS_COMPILER_FLAG(["-Wa,-mfloat-abi=softfp"],
+diff --git a/liboil/arm/Makefile.am b/liboil/arm/Makefile.am
+index ead08ed..cd8d9fa 100644
+--- a/liboil/arm/Makefile.am
++++ b/liboil/arm/Makefile.am
+@@ -6,4 +6,5 @@ libarm_la_SOURCES = \
+ 	math_vfp_asm.S
+ 
+ libarm_la_CFLAGS = $(LIBOIL_CFLAGS) $(VFP_CFLAGS)
++libarm_la_CCASFLAGS = $(LIBOIL_CFLAGS) $(VFP_CFLAGS)
+ 
+-- 
+1.7.6
+
diff --git a/meta/recipes-support/liboil/liboil_0.3.17.bb b/meta/recipes-support/liboil/liboil_0.3.17.bb
index 64e1ddd..10a845e 100644
--- a/meta/recipes-support/liboil/liboil_0.3.17.bb
+++ b/meta/recipes-support/liboil/liboil_0.3.17.bb
@@ -10,11 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ad80780d9c5205d63481a0184e199a15 \
                     file://testsuite/trans.c;endline=29;md5=380ecd43121fe3dcc0d8d7e5984f283d"
 
 DEPENDS = "glib-2.0"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://liboil.freedesktop.org/download/${BPN}-${PV}.tar.gz \
            file://no-tests.patch \
            file://fix-unaligned-whitelist.patch \
+           file://0001-Fix-enable-vfp-flag.patch \
           "
 
 SRC_URI[md5sum] = "47dc734f82faeb2964d97771cfd2e701"
-- 
1.7.6



--
Scanned by MailScanner.



