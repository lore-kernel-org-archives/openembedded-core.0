Return-Path: <jussi.laako@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3718578639
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 11:59:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 15 Sep 2017 04:59:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,396,1500966000"; d="scan'208";a="900567787"
Received: from jlaako-lnx.fi.intel.com (HELO jlaako-lnx.fi.intel.com.)
	([10.237.72.200])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Sep 2017 04:59:08 -0700
From: Jussi Laako <jussi.laako@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 14:56:19 +0300
Message-Id: <20170915115619.39118-2-jussi.laako@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170915115619.39118-1-jussi.laako@linux.intel.com>
References: <20170915115619.39118-1-jussi.laako@linux.intel.com>
Subject: [meta-oe][PATCH v2 2/2] libgcrypt: provide libgcrypt-config wrapper around pkg-config
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
X-List-Received-Date: Fri, 15 Sep 2017 11:59:09 -0000

This patch adds a libgcrypt-config wrapper for pkg-config support in
order to avoid patching all upstream packages using libgcrypt, while
otherwise keeping pkg-config functionality.

Signed-off-by: Jussi Laako <jussi.laako@linux.intel.com>
---
 .../libgcrypt/files/libgcrypt-config-wrapper.patch | 113 +++++++++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt_1.8.1.bb  |   7 +-
 2 files changed, 116 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/libgcrypt/files/libgcrypt-config-wrapper.patch

diff --git a/meta/recipes-support/libgcrypt/files/libgcrypt-config-wrapper.patch b/meta/recipes-support/libgcrypt/files/libgcrypt-config-wrapper.patch
new file mode 100644
index 0000000000..167706535b
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/libgcrypt-config-wrapper.patch
@@ -0,0 +1,113 @@
+diff -ur libgcrypt-1.8.1.orig/src/libgcrypt-config.in libgcrypt-1.8.1.new/src/libgcrypt-config.in
+--- libgcrypt-1.8.1.orig/src/libgcrypt-config.in	2013-03-15 21:25:38.000000000 +0200
++++ libgcrypt-1.8.1.new/src/libgcrypt-config.in	2017-09-15 13:56:20.368277151 +0300
+@@ -11,30 +11,6 @@
+ #
+ # File: @configure_input@
+ 
+-# General.
+-prefix="@prefix@"
+-exec_prefix="@exec_prefix@"
+-version="@VERSION@"
+-includedir="@includedir@"
+-libdir="@libdir@"
+-gpg_error_libs="@GPG_ERROR_LIBS@"
+-gpg_error_cflags="@GPG_ERROR_CFLAGS@"
+-
+-# libgcrypt values.
+-libs="@LIBGCRYPT_CONFIG_LIBS@"
+-cflags="@LIBGCRYPT_CONFIG_CFLAGS@"
+-
+-# API info
+-api_version="@LIBGCRYPT_CONFIG_API_VERSION@"
+-
+-# Configured for host
+-my_host="@LIBGCRYPT_CONFIG_HOST@"
+-
+-# Misc information.
+-symmetric_ciphers="@LIBGCRYPT_CIPHERS@"
+-asymmetric_ciphers="@LIBGCRYPT_PUBKEY_CIPHERS@"
+-digests="@LIBGCRYPT_DIGESTS@"
+-
+ # State variables.
+ echo_libs=no
+ echo_cflags=no
+@@ -122,68 +98,35 @@
+ done
+ 
+ if test "$echo_prefix" = "yes"; then
+-    echo "$prefix"
++    pkg-config --variable=prefix libgcrypt
+ fi
+ 
+ if test "$echo_exec_prefix" = "yes"; then
+-    echo "$exec_prefix"
++    pkg-config --variable=exec_prefix libgcrypt
+ fi
+ 
+ if test "$echo_cflags" = "yes"; then
+-    includes=""
+-    cflags_final="$cflags"
+-
+-    # Set up `includes'.
+-    if test "x$includedir" != "x/usr/include" -a "x$includedir" != "x/include"; then
+-	includes="-I$includedir"
+-    fi
+-    # Set up `cflags_final'.
+-    cflags_final="$cflags_final $gpg_error_cflags"
+-
+-    tmp=""
+-    for i in $includes $cflags_final; do
+-       if echo "$tmp" | fgrep -v -- "$i" >/dev/null; then
+-           tmp="$tmp $i"
+-       fi
+-    done
+-    echo $tmp
++    pkg-config --cflags libgcrypt
+ fi
+ 
+ if test "$echo_libs" = "yes"; then
+-    libdirs=""
+-    libs_final="$libs"
+-
+-    # Set up `libdirs'.
+-    if test "x$libdir" != "x/usr/lib" -a "x$libdir" != "x/lib"; then
+-	libdirs="-L$libdir"
+-    fi
+-
+-    # Set up `libs_final'.
+-    libs_final="$libs_final $gpg_error_libs"
+-
+-    tmp=""
+-    for i in $libdirs $libs_final; do
+-       if echo "$tmp" | fgrep -v -- "$i" >/dev/null; then
+-           tmp="$tmp $i"
+-       fi
+-    done
+-    echo $tmp
++    pkg-config --libs libgcrypt
+ fi
+ 
+ if test "$echo_version" = "yes"; then
+-    echo "$version"
++    pkg-config --modversion libgcrypt
+ fi
+ 
+ if test "$echo_api_version" = "yes"; then
+-    echo "$api_version"
++    pkg-config --variable=api_version libgcrypt
+ fi
+ 
+ if test "$echo_host" = "yes"; then
+-    echo "$my_host"
++    pkg-config --variable=host libgcrypt
+ fi
+ 
+ if test "$echo_algorithms" = "yes"; then
+-    echo "Symmetric cipher algorithms: $symmetric_ciphers"
+-    echo "Public-key cipher algorithms: $asymmetric_ciphers"
+-    echo "Message digest algorithms: $digests"
++    pkg-config --variable=symmetric_ciphers libgcrypt
++    pkg-config --variable=asymmetric_ciphers libgcrypt
++    pkg-config --variable=digests libgcrypt
+ fi
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.1.bb
index 5bd815ae55..529882d8a4 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.1.bb
@@ -20,13 +20,12 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch \
            file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
+           file://libgcrypt-config-wrapper.patch \
 "
 SRC_URI[md5sum] = "b21817f9d850064d2177285f1073ec55"
 SRC_URI[sha256sum] = "7a2875f8b1ae0301732e878c0cca2c9664ff09ef71408f085c50e332656a78b3"
 
-BINCONFIG = "${bindir}/libgcrypt-config"
-
-inherit autotools texinfo binconfig-disabled pkgconfig
+inherit autotools texinfo pkgconfig binconfig
 
 EXTRA_OECONF = "--disable-asm"
 EXTRA_OEMAKE_class-target = "LIBTOOLFLAGS='--tag=CC'"
@@ -47,7 +46,7 @@ do_install_append() {
 
 PACKAGES =+ "dumpsexp-dev"
 
-FILES_${PN}-dev += "${bindir}/hmac256"
+FILES_${PN}-dev += "${bindir}/hmac256 ${bindir}/libgcrypt-config"
 FILES_dumpsexp-dev += "${bindir}/dumpsexp"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


