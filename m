Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <julian.pidancet@gmail.com>) id 1RQTAq-0005ei-0a
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 01:16:20 +0100
Received: by wwf25 with SMTP id 25so7101294wwf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 16:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=QONHVdSD7T2+WaSQ2rqptpKYYNicaGuhISRKUGKLEdE=;
	b=XftyvWir7jg1KwfjsLi8gzPY1LiPuFrUlT57R5gesPeChrFIsfQPqWQpd9JSlcbe0u
	D9mXcTs5tG1/YnSBZ9AJfLEcEDq8yHelMdGxtS61sju5GjWMam/0K7aJ2aF9TT4kofxo
	oOSa2kfwVxhhR3Zt0qYIgbuSR9KiCgjARy1Co=
Received: by 10.180.14.134 with SMTP id p6mr10490866wic.25.1321402195804;
	Tue, 15 Nov 2011 16:09:55 -0800 (PST)
Received: from localhost.localdomain (188-223-88-44.zone14.bethere.co.uk.
	[188.223.88.44])
	by mx.google.com with ESMTPS id v10sm15368798wiy.23.2011.11.15.16.09.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Nov 2011 16:09:54 -0800 (PST)
From: Julian Pidancet <julian.pidancet@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2011 01:01:59 +0000
Message-Id: <689a6fbace429988bf14f144e9a93dc828a7e7bf.1321391467.git.julian.pidancet@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Cc: B29882@freescale.com, Julian Pidancet <julian.pidancet@gmail.com>
Subject: [PATCH v2] Introduce multiarch DISTRO_FEATURE
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
X-List-Received-Date: Wed, 16 Nov 2011 00:16:20 -0000

This patch introduces a distro feature which enables gcc to produce
both 32bit and 64bit code, and enables binutils to operate on both
32bit and 64bit binaries. It differs from multilib toolchains in
that it does not require to compile a version of the libc for each
architecture variant. However, the code produced for the secondary
architecture will not be linkable against the libc.

v2: - Renamed the feature name from "biarch" to "multiarch". The GCC
installation manual claims that the mips-linux can be made a tri-arch
compiler (http://gcc.gnu.org/install/configure.html)
    - For x86_64, the compiler is made bi-arch by default, so nothing
has to be done in particular.
    - I analyzed the gcc/config.gcc from GCC sources and added in this
patch all the architectures that could be made biarch with the version
of gcc currently used in OE, which are powerpc, and sparc, in addition
to x86. mips and s390 will probably be supported in future versions of
gcc. For x86 and sparc, only the --enable-targets=all option is valid
to make this work (this option doesn't have any other side effects than
making the compiler bi-arch). For powerpc, I used the
--enable-targets=powerpc64 option (although 'all' also works).

Note: - Untested on powerpc and sparc. But I believe it works the same
as with x86.
      - gcc in meta-toolchain is also made multiarch.

Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-cross.inc  |    3 ++-
 meta/recipes-devtools/binutils/binutils.inc        |    3 ++-
 meta/recipes-devtools/gcc/gcc-common.inc           |   10 ++++++++++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    3 ++-
 4 files changed, 16 insertions(+), 3 deletions(-)

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
index 69e0213..7ec2f7e 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -21,6 +21,16 @@ def get_gcc_mips_plt_setting(bb, d):
         return "--with-mips-plt"
     return ""
 
+def get_gcc_multiarch_setting(bb, d):
+    if 'multiarch' in bb.data.getVar('DISTRO_FEATURES',d,1).split() :
+        if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'i586', 'i686' ] :
+            return "--enable-targets=all"
+        if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'powerpc' ] :
+            return "--enable-targets=powerpc64"
+        if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'sparc' ] :
+            return "--enable-targets=all"
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
-- 
Julian Pidancet



