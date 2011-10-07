Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RCAVI-0007DJ-TP for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 15:30:21 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97DVFTR007632 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 14:31:16 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JxeA+Rraveya
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2011 14:31:15 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97DVCdg007623
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 14:31:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Oct 2011 14:24:33 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317993881.2405.9.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] gcc/binutils: Disable NLS/gettext dependencies
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
X-List-Received-Date: Fri, 07 Oct 2011 13:30:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We force the C locale when running builds for determinstic error messages. We
therefore have no need to NLS support in binutils cross or gcc cross.

We also don't need the standard base/autotools dependencies for our
toolchain components since we don't autoreconf these.

This patch turns off nls and cleans up some of the dependencies resulting
in a slightly less convoluted set of build dependencies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---

Note: This isn't the full potential gain of the NLS changes, the bigger
speedup comes from breaking the binutils dependency on flex/bison which
depend on gettext-native. This patch sets the scene though and is a
first step.

diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index 5a41970..982224f 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -1,10 +1,14 @@
 inherit cross
 PROVIDES = "virtual/${TARGET_PREFIX}binutils"
 
+INHIBIT_DEFAULT_DEPS = "1"
+INHIBIT_AUTOTOOLS_DEPS = "1"
+
 EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_TARGET} \
                 --program-prefix=${TARGET_PREFIX} \
                 --disable-install-libbfd \
                 --disable-werror \
+                --disable-nls \
                 --enable-poison-system-directories \
 		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default', '', d)}"
 
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index a352e36..8ca3174 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -23,7 +23,7 @@ BRANCH = "gcc-4_6-branch"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.6' ], d)}"
 
 DEPENDS =+ "mpfr gmp libmpc"
-NATIVEDEPS = "mpfr-native gmp-native gettext-native libmpc-native"
+NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
 
 LICENSE="GPL-3.0-with-GCC-exception & GPLv3"
 
@@ -108,3 +108,4 @@ EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap \
 EXTRA_OECONF_append_linux-uclibc = " --disable-decimal-float "
 EXTRA_OECONF_append_linux-uclibceabi = " --disable-decimal-float "
 EXTRA_OECONF_append_linux-uclibcspe = " --disable-decimal-float "
+
diff --git a/meta/recipes-devtools/gcc/gcc-configure-cross.inc b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
index 36edb81..d2d9081 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
@@ -4,8 +4,11 @@ USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
 
 EXTRA_OECONF += " --enable-poison-system-directories \
 		  --with-headers=${STAGING_DIR_TARGET}${SYSTEMHEADERS} \
+                  --disable-nls \
 		"
 
+INHIBIT_DEFAULT_DEPS = "1"
+
 EXTRA_OECONF_PATHS = "--with-local-prefix=${STAGING_DIR_TARGET}${target_exec_prefix} \
 		      --with-gxx-include-dir=${target_includedir}/c++ \
                       --with-sysroot=${STAGING_DIR_TARGET} \
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index 4e2e343..d58bf70 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -1,7 +1,10 @@
-DEPENDS = "virtual/${TARGET_PREFIX}binutils gettext-native ${NATIVEDEPS}"
+DEPENDS = "virtual/${TARGET_PREFIX}binutils ${NATIVEDEPS}"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc-initial"
 PACKAGES = ""
 
+INHIBIT_AUTOTOOLS_DEPS = "1"
+INHIBIT_DEFAULT_DEPS = "1"
+
 CROSS_TARGET_SYS_DIR_append = ".${PN}"
 
 # This is intended to be a -very- basic config
@@ -11,6 +14,7 @@ EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
 		--without-headers \
 		--disable-shared \
 		--disable-threads \
+		--disable-nls \
 		--disable-multilib \
 		--disable-__cxa_atexit \
 		--enable-languages=c \
diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
index 7b1bb38..f368ae9 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
@@ -1,8 +1,11 @@
 DEPENDS = "virtual/${TARGET_PREFIX}binutils ${NATIVEDEPS}"
-DEPENDS += "virtual/${TARGET_PREFIX}libc-initial gettext-native"
+DEPENDS += "virtual/${TARGET_PREFIX}libc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc-intermediate"
 PACKAGES = ""
 
+INHIBIT_DEFAULT_DEPS = "1"
+INHIBIT_AUTOTOOLS_DEPS = "1"
+
 CROSS_TARGET_SYS_DIR_append = ".${PN}"
 
 # This is intended to be a -very- basic config
@@ -13,6 +16,7 @@ CROSS_TARGET_SYS_DIR_append = ".${PN}"
 # preferred linker.
 EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
 		--enable-shared \
+		--disable-nls \
 		--disable-multilib \
 		--disable-threads \
 		--enable-languages=c \




