Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqnhT-0006sq-S0
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:59:08 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 08:47:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193443371"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2012 08:47:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 08:47:31 -0700
Message-Id: <4fc7b5634376696d28fec53a331950c32b7164b4.1342453118.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/30] crosssdk/nativesdk: Ensure EXTRA_OECONF_FPU is unset
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
X-List-Received-Date: Mon, 16 Jul 2012 15:59:09 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If EXTRA_OECONF_FPU is left set, certain ARM variables related to hard-float
can get pulled in and trigger rebuilds of the crosssdk code. The best solution
is to simply force the variable to a known correct value for the SDK targets
currently supported in the same way as TARGET_FPU.

There is some slight rearrangement of the gcc code to ensure the variable is
always used to call the fpu function.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/crosssdk.bbclass                      |    3 +++
 meta/classes/nativesdk.bbclass                     |    1 +
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |    3 ++-
 .../gcc/gcc-cross-intermediate.inc                 |    2 +-
 4 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index 93aba70..f3a502a 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -28,3 +28,6 @@ baselib = "lib"
 
 do_populate_sysroot[stamp-extra-info] = ""
 do_package[stamp-extra-info] = ""
+
+# Need to force this to ensure consitency accross architectures
+EXTRA_OECONF_FPU = ""
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index a58fce2..7deaafc 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -36,6 +36,7 @@ TARGET_CC_ARCH = "${SDK_CC_ARCH}"
 TARGET_LD_ARCH = "${SDK_LD_ARCH}"
 TARGET_AS_ARCH = "${SDK_AS_ARCH}"
 TARGET_FPU = ""
+EXTRA_OECONF_FPU = ""
 
 CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
 CFLAGS = "${BUILDSDK_CFLAGS}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index faec391..93a6d78 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -21,7 +21,8 @@ EXTRA_OECONF = "--with-newlib \
 		--with-sysroot=${STAGING_DIR_TARGET} \
 		--with-build-sysroot=${STAGING_DIR_TARGET} \
 		${EXTRA_OECONF_INITIAL} \
-		${@get_gcc_fpu_setting(bb, d)}"
+		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)} \
+		${EXTRA_OECONF_FPU}"
 
 do_compile () {
     oe_runmake all-gcc all-target-libgcc
diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
index c940e54..e06926d 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
@@ -23,7 +23,7 @@ EXTRA_OECONF = "--enable-shared \
 		--with-sysroot=${STAGING_DIR_TCBOOTSTRAP} \
 		--with-build-sysroot=${STAGING_DIR_TCBOOTSTRAP} \
 		${EXTRA_OECONF_INTERMEDIATE} \
-		${@get_gcc_fpu_setting(bb, d)} \
+		${EXTRA_OECONF_FPU} \
 		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)}"
 
 do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_HOST} ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdir}"
-- 
1.7.7.6



