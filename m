Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <julian.pidancet@gmail.com>) id 1RIUw9-00006Y-6t
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 02:32:13 +0200
Received: by wwf10 with SMTP id 10so8125010wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 17:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=hQW+PUXN60PjFZiVptHAordkO1PQKSPfS4bT81gXgyE=;
	b=YJZLJri8FUqS5cxWUfR7JkIyDl9oN/BDZXsQH/0RrDByx+Z+sYOZDrce3rI9mT24Oa
	hh0XRPEOpELijw/wnsrVt76ROD5jWVDoN59yBGKKCUowPCRedpN2WAMYTKmKXbYH7HSZ
	d5xxQzcqDz0j68f0IpFsscHJthy7bI4QgBN0A=
Received: by 10.227.197.71 with SMTP id ej7mr136836wbb.15.1319502372636;
	Mon, 24 Oct 2011 17:26:12 -0700 (PDT)
Received: from localhost.localdomain (188-223-88-44.zone14.bethere.co.uk.
	[188.223.88.44])
	by mx.google.com with ESMTPS id gd18sm41982592wbb.5.2011.10.24.17.26.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 17:26:10 -0700 (PDT)
From: Julian Pidancet <julian.pidancet@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Oct 2011 02:18:51 +0100
Message-Id: <1319505532-23199-1-git-send-email-julian.pidancet@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Cc: Julian Pidancet <julian.pidancet@gmail.com>
Subject: [PATCH] Introduce biarch DISTRO_FEATURE
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
X-List-Received-Date: Tue, 25 Oct 2011 00:32:13 -0000

This patch introduces a distro feature which enables gcc to produce
both 32bit and 64bit code, and enables binutils to operate on both
32bit and 64bit binaries. It differs from multilib toolchains in
that it does not require to compile a version of the libc for each
architecture variant. However, the code produced for the secondary
architecture will not be linkable against the libc.

This patch only works with x86 and x86_64 architectures, but can
probably be extended to support other architectures as well.

One use-case would be when one wants to compile a system which runs
32bit userspace applications with a 64bit kernel without having to
deal with two separate libc.

Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-cross.inc  |    3 ++-
 meta/recipes-devtools/binutils/binutils.inc        |    3 ++-
 meta/recipes-devtools/gcc/gcc-common.inc           |    5 +++++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    3 ++-
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index 982224f..3f76c59 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -10,7 +10,8 @@ EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_TARGET} \
                 --disable-werror \
                 --disable-nls \
                 --enable-poison-system-directories \
-		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default', '', d)}"
+                ${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default', '', d)} \
+                ${@base_contains('DISTRO_FEATURES', 'biarch', '--enable-64-bit-bfd', '', d)}"
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 58fee85..fe16b18 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -49,7 +49,8 @@ B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
 
 EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
                 --enable-install-libbfd \
-                --enable-shared"
+                --enable-shared \
+                ${@base_contains('DISTRO_FEATURES', 'biarch', '--enable-64-bit-bfd', '', d)}"
 
 EXTRA_OECONF_virtclass-native = "--enable-target=all --enable-64-bit-bfd --enable-install-libbfd"
 
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index f83f4da..fdbb77b 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -21,6 +21,11 @@ def get_gcc_mips_plt_setting(bb, d):
         return "--with-mips-plt"
     return ""
 
+def get_gcc_x86_biarch_setting(bb, d):
+    if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'i586', 'i686', 'x86_64' ] and 'biarch' in bb.data.getVar('DISTRO_FEATURES',d,1).split() :
+        return "--enable-targets=all"
+    return ""
+
 # We really need HOST_SYS here for some packages and TARGET_SYS for others.
 # For now, libgcc is most important so we fix for that - RP.
 SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 2ddc3d7..55a0626 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -42,7 +42,8 @@ EXTRA_OECONF = "${@['--enable-clocale=generic', ''][bb.data.getVar('USE_NLS', d,
                 ${EXTRA_OECONF_BASE} \
                 ${EXTRA_OECONF_FPU} \
                 ${EXTRA_OECONF_PATHS} \
-                ${@get_gcc_mips_plt_setting(bb, d)}"
+                ${@get_gcc_mips_plt_setting(bb, d)} \
+                ${@get_gcc_x86_biarch_setting(bb, d)}"
 
 # Build uclibc compilers without cxa_atexit support
 EXTRA_OECONF_append_linux               = " --enable-__cxa_atexit"
-- 
Julian Pidancet



