Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 031916B4EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:24 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg9fb001261; Thu, 22 Aug 2013 12:42:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id i3PUZqDwdvk1; Thu, 22 Aug 2013 12:42:15 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg7ld001226
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:08 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5b-0001iP-3Y; Thu, 22 Aug 2013 12:30:07 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:45 +0100
Message-Id: <1377171000-6469-13-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 13/28] gcc-cross-canadian: Merge 4.7 and 4.8 recipes into common include
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
X-List-Received-Date: Thu, 22 Aug 2013 11:30:27 -0000

This removes duplication and follows the pattern of the other gcc recipes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   | 19 ++++++++++++++++++
 .../recipes-devtools/gcc/gcc-cross-canadian_4.7.bb | 23 ----------------------
 .../recipes-devtools/gcc/gcc-cross-canadian_4.8.bb | 20 -------------------
 3 files changed, 19 insertions(+), 43 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 10ddacf..85c3166 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -7,3 +7,22 @@ BPN = "gcc"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc nativesdk-gettext"
 
 GCCMULTILIB = "--enable-multilib"
+
+require gcc-configure-sdk.inc
+require gcc-package-sdk.inc
+
+ELFUTILS = "nativesdk-elfutils"
+DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc ${ELFUTILS} nativesdk-zlib"
+RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc ${ELFUTILS}"
+
+SYSTEMHEADERS = "/usr/include"
+SYSTEMLIBS = "${target_base_libdir}/"
+SYSTEMLIBS1 = "${target_libdir}/"
+
+EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
+		--disable-libgomp --disable-libmudflap \
+		--with-mpfr=${STAGING_DIR_HOST}${layout_exec_prefix} \
+		--with-mpc=${STAGING_DIR_HOST}${layout_exec_prefix}"
+
+# gcc 4.7 needs -isystem
+export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET} -isystem=${target_includedir}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
index 53c4632..355757c 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
@@ -1,26 +1,3 @@
-inherit cross-canadian
-
 require recipes-devtools/gcc/gcc-${PV}.inc
 require gcc-cross-canadian.inc
-require gcc-configure-sdk.inc
-require gcc-package-sdk.inc
-
-DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc nativesdk-elfutils"
-RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc nativesdk-elfutils"
-
-SYSTEMHEADERS = "/usr/include"
-SYSTEMLIBS = "${target_base_libdir}/"
-SYSTEMLIBS1 = "${target_libdir}/"
-
-EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
-		--disable-libgomp --disable-libmudflap \
-		--with-mpfr=${STAGING_DIR_HOST}${layout_exec_prefix} \
-		--with-mpc=${STAGING_DIR_HOST}${layout_exec_prefix}"
-
-# to find libmpfr
-# export LD_LIBRARY_PATH = "{STAGING_DIR_HOST}${layout_exec_prefix}"
-
-PARALLEL_MAKE = ""
 
-# gcc 4.7 needs -isystem
-export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET} -isystem=${target_includedir}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.8.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.8.bb
index bf49c3d..bf53c5c 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.8.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.8.bb
@@ -1,25 +1,5 @@
-inherit cross-canadian
-
 require recipes-devtools/gcc/gcc-${PV}.inc
 require gcc-cross-canadian.inc
-require gcc-configure-sdk.inc
-require gcc-package-sdk.inc
-
-ELFUTILS = "nativesdk-elfutils"
-DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc ${ELFUTILS} nativesdk-zlib"
-RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc ${ELFUTILS}"
-
-SYSTEMHEADERS = "/usr/include"
-SYSTEMLIBS = "${target_base_libdir}/"
-SYSTEMLIBS1 = "${target_libdir}/"
 
-EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
-		--disable-libgomp --disable-libmudflap \
-		--with-mpfr=${STAGING_DIR_HOST}${layout_exec_prefix} \
-		--with-mpc=${STAGING_DIR_HOST}${layout_exec_prefix}"
 
-# to find libmpfr
-# export LD_LIBRARY_PATH = "{STAGING_DIR_HOST}${layout_exec_prefix}"
 
-# gcc 4.7 needs -isystem
-export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET} -isystem=${target_includedir}"
-- 
1.8.1.2


