Return-Path: <petter@technux.se>
Received: from vsp-authed-01-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 863FB60167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 14:28:41 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-01-02.binero.net (Halon Mail Gateway) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 16:28:44 +0200 (CEST)
Received: from localhost.localdomain
	(host-90-236-245-133.mobileonline.telia.com [90.236.245.133])
	(Authenticated sender: petter@technux.se)
	by smtp-10-01.atm.binero.net (Postfix) with ESMTPSA id 7905E3A236;
	Mon, 12 May 2014 15:55:47 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 15:55:38 +0200
Message-Id: <93cd270eb35bc3fffb1bd55e01c04ba82085f799.1399868537.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1da008f3d9c89cfaf931e94d18154acfed49d636.1399868537.git.petter@technux.se>
References: <1da008f3d9c89cfaf931e94d18154acfed49d636.1399868537.git.petter@technux.se>
In-Reply-To: <cover.1399868537.git.petter@technux.se>
References: <cover.1399868537.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCHv3 13/13] eglibc: remove usage of FILESPATH
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
X-List-Received-Date: Mon, 12 May 2014 14:28:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #4497]

Usage of FILESPATH is discouraged, since it can make recipes harder
to bbappend. Instead FILESEXTRAPATHS should be used to extend the path.
If possible try to use any of the default FILESPATH dirs.

Also remove superfluous comment and do minor indentation fix.

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 .../fix_for_centos_5.8.patch                       |    0
 .../eglibc/cross-localedef-native_2.19.bb          |    3 +--
 meta/recipes-core/eglibc/eglibc_2.19.bb            |    4 +---
 meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb |    2 +-
 4 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-core/eglibc/{eglibc-2.19 => cross-localedef-native-2.19}/fix_for_centos_5.8.patch (100%)

diff --git a/meta/recipes-core/eglibc/eglibc-2.19/fix_for_centos_5.8.patch b/meta/recipes-core/eglibc/cross-localedef-native-2.19/fix_for_centos_5.8.patch
similarity index 100%
rename from meta/recipes-core/eglibc/eglibc-2.19/fix_for_centos_5.8.patch
rename to meta/recipes-core/eglibc/cross-localedef-native-2.19/fix_for_centos_5.8.patch
diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.19.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.19.bb
index 3ce0e1d..1c13eb8 100644
--- a/meta/recipes-core/eglibc/cross-localedef-native_2.19.bb
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.19.bb
@@ -13,8 +13,7 @@ LIC_FILES_CHKSUM = "file://${LIC_DIR}/LICENSES;md5=e9a558e243b36d3209f380deb394b
 inherit native
 inherit autotools
 
-# pick up an eglibc patch
-FILESPATH = "${FILE_DIRNAME}/eglibc-${PV}"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/${P}:"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr25243.tar.bz2 \
 	   file://fix_for_centos_5.8.patch;patchdir=.. \
diff --git a/meta/recipes-core/eglibc/eglibc_2.19.bb b/meta/recipes-core/eglibc/eglibc_2.19.bb
index 8f09676..1ddce82 100644
--- a/meta/recipes-core/eglibc/eglibc_2.19.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.19.bb
@@ -24,7 +24,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr25
            file://0001-R_ARM_TLS_DTPOFF32.patch \
            file://0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch \
            file://fix-tibetian-locales.patch \
-	   file://ppce6500-32b_slow_ieee754_sqrt.patch \
+           file://ppce6500-32b_slow_ieee754_sqrt.patch \
           "
 SRC_URI[md5sum] = "197836c2ba42fb146e971222647198dd"
 SRC_URI[sha256sum] = "baaa030531fc308f7820c46acdf8e1b2f8e3c1f40bcd28b6e440d1c95d170d4c"
@@ -49,8 +49,6 @@ TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
 
 GLIBC_BROKEN_LOCALES = " _ER _ET so_ET yn_ER sid_ET tr_TR mn_MN gez_ET gez_ER bn_BD te_IN es_CR.ISO-8859-1"
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc-${PV}', '${FILE_DIRNAME}/eglibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
-
 #
 # For now, we will skip building of a gcc package if it is a uclibc one
 # and our build is not a uclibc one, and we skip a glibc one if our build
diff --git a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
index 75ffbf6..7c34635 100644
--- a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
+++ b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
 
 PR = "r2"
 
-FILESPATH = "${FILE_DIRNAME}/${PN}-${PV}/"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/${P}:"
 
 inherit native
 
-- 
1.7.9.5


