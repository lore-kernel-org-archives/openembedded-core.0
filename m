Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <julian.pidancet@gmail.com>) id 1RTuCk-0003Np-Eg
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 12:44:34 +0100
Received: by bkbzs2 with SMTP id zs2so4004159bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 03:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=T0wmkN1yKry23R9tU5W8zoOI18rFhMJtWBAxi+wMe5Y=;
	b=lvMlqjBVzIGVrqohYi5odphYjB5x9wMaSbaRE1UFUm2RZv5Zz9TzKBvkd84MOgtlCF
	k+TdZRJYAgn7OyjZ2/ZneO5R6GTXQLnB9fDbw6bdRdcQvDbrocLbh8zXziB+ztFKLmVc
	sOf+E6VqN2fYD5jkEYYzfFnFkld+zfixHxbwA=
Received: by 10.204.8.16 with SMTP id f16mr7550847bkf.134.1322221076415;
	Fri, 25 Nov 2011 03:37:56 -0800 (PST)
Received: from localhost.localdomain (188-223-88-44.zone14.bethere.co.uk.
	[188.223.88.44])
	by mx.google.com with ESMTPS id e18sm18516766bkr.15.2011.11.25.03.37.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Nov 2011 03:37:54 -0800 (PST)
From: Julian Pidancet <julian.pidancet@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Nov 2011 12:29:17 +0000
Message-Id: <5ca10bdeed6e90862311b8417c0e6de353d1dc70.1322223227.git.julian.pidancet@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Cc: Julian Pidancet <julian.pidancet@gmail.com>
Subject: [PATCH v3] Introduce multiarch DISTRO_FEATURE
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
X-List-Received-Date: Fri, 25 Nov 2011 11:44:34 -0000

This patch introduces a distro feature which enables gcc to produce
both 32bit and 64bit code, and enables binutils to operate on both
32bit and 64bit binaries.

v3: - Make get_gcc_multiarch_setting more elegant. Use a dictionnary
to store the config options and replace bb.data.getVar with d.getVar.
    - Remove i686 from the architecture list because it doesn't seem
to be a valid TARGET_ARCH any more in OE.
    - Configure gdb (gdb and gdb-cross) with --enable-64-bit-bfd if
multiarch DISTRO_FEATURE is present

Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-cross.inc  |    3 ++-
 meta/recipes-devtools/binutils/binutils.inc        |    3 ++-
 meta/recipes-devtools/gcc/gcc-common.inc           |   13 +++++++++++++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    3 ++-
 meta/recipes-devtools/gdb/gdb-common.inc           |    1 +
 5 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index 982224f..f07907e 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -10,7 +10,8 @@ EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_TARGET} \
                 --disable-werror \
                 --disable-nls \
                 --enable-poison-system-directories \
-		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default', '', d)}"
+                ${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default', '', d)} \
+                ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 58fee85..51e4257 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -49,7 +49,8 @@ B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
 
 EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
                 --enable-install-libbfd \
-                --enable-shared"
+                --enable-shared \
+                ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
 
 EXTRA_OECONF_virtclass-native = "--enable-target=all --enable-64-bit-bfd --enable-install-libbfd"
 
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 69e0213..fe112d9 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -21,6 +21,19 @@ def get_gcc_mips_plt_setting(bb, d):
         return "--with-mips-plt"
     return ""
 
+def get_gcc_multiarch_setting(bb, d):
+    target_arch = d.getVar('TARGET_ARCH', True)
+    multiarch_options = {
+        "i586":    "--enable-targets=all",
+        "powerpc": "--enable-targets=powerpc64",
+        "sparc":   "--enable-targets=all",
+    }
+
+    if 'multiarch' in d.getVar('DISTRO_FEATURES', True).split() :
+        if target_arch in multiarch_options :
+            return multiarch_options[target_arch]
+    return ""
+
 # We really need HOST_SYS here for some packages and TARGET_SYS for others.
 # For now, libgcc is most important so we fix for that - RP.
 SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index ae23e8e..d014980 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -42,7 +42,8 @@ EXTRA_OECONF = "${@['--enable-clocale=generic', ''][d.getVar('USE_NLS', 1) != 'n
                 ${EXTRA_OECONF_BASE} \
                 ${EXTRA_OECONF_FPU} \
                 ${EXTRA_OECONF_PATHS} \
-                ${@get_gcc_mips_plt_setting(bb, d)}"
+                ${@get_gcc_mips_plt_setting(bb, d)} \
+                ${@get_gcc_multiarch_setting(bb, d)}"
 
 # Build uclibc compilers without cxa_atexit support
 EXTRA_OECONF_append_linux               = " --enable-__cxa_atexit"
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index e01b57c..d728139 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -41,6 +41,7 @@ EXPAT = "--without-expat"
 EXTRA_OECONF = "--disable-gdbtk --disable-tui --disable-x \
                 --with-curses --disable-multilib --with-system-readline --disable-sim \
                 ${GDBPROPREFIX} --with-libelf=${STAGING_DIR_TARGET} ${EXPAT} \
+                ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
                "
 
 GDBPROPREFIX = "--program-prefix=''"
-- 
Julian Pidancet



