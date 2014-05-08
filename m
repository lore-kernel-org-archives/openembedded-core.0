Return-Path: <valentin.popa@intel.com>
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 262E365F99
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 15:07:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2014 08:06:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1010,1389772800"; d="scan'208";a="537126468"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2014 08:06:22 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 May 2014 18:05:59 +0300
Message-Id: <ce5bc858728c5ff3d22965a7d8bfdf1309760520.1399561398.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1399561398.git.valentin.popa@intel.com>
References: <cover.1399561398.git.valentin.popa@intel.com>
In-Reply-To: <cover.1399561398.git.valentin.popa@intel.com>
References: <cover.1399561398.git.valentin.popa@intel.com>
Subject: [PATCH 4/4] icu: upgrade to 53.1
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
X-List-Received-Date: Thu, 08 May 2014 15:07:16 -0000

Removed patches:
(*) add_buffer_length_check_to_UTF_16_or_32_detector.patch
    - not needed anymore

License is the same. BSD-like copyright inserted for lao-dictionary.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 ...fer_length_check_to_UTF_16_or_32_detector.patch | 33 ----------------------
 .../0001-Disable-LDFLAGSICUDT-for-Linux.patch      |  0
 .../{icu-51.2 => icu}/icu-pkgdata-large-cmd.patch  |  0
 .../icu/{icu_51.2.bb => icu_53.1.bb}               | 15 ++++++----
 4 files changed, 10 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-support/icu/icu-51.2/add_buffer_length_check_to_UTF_16_or_32_detector.patch
 rename meta/recipes-support/icu/{icu-51.2 => icu}/0001-Disable-LDFLAGSICUDT-for-Linux.patch (100%)
 rename meta/recipes-support/icu/{icu-51.2 => icu}/icu-pkgdata-large-cmd.patch (100%)
 rename meta/recipes-support/icu/{icu_51.2.bb => icu_53.1.bb} (40%)

diff --git a/meta/recipes-support/icu/icu-51.2/add_buffer_length_check_to_UTF_16_or_32_detector.patch b/meta/recipes-support/icu/icu-51.2/add_buffer_length_check_to_UTF_16_or_32_detector.patch
deleted file mode 100644
index ad4d61c..0000000
--- a/meta/recipes-support/icu/icu-51.2/add_buffer_length_check_to_UTF_16_or_32_detector.patch
+++ /dev/null
@@ -1,33 +0,0 @@
---- source/i18n/csrucode.cpp
-+++ source/i18n/csrucode.cpp
-@@ -33,8 +33,9 @@ UBool CharsetRecog_UTF_16_BE::match(Inpu
- {
-     const uint8_t *input = textIn->fRawInput;
-     int32_t confidence = 0;
-+    int32_t length = textIn->fRawLength;
- 
--    if (input[0] == 0xFE && input[1] == 0xFF) {
-+    if (length >=2 && input[0] == 0xFE && input[1] == 0xFF) {
-         confidence = 100;
-     }
- 
-@@ -57,8 +58,9 @@ UBool CharsetRecog_UTF_16_LE::match(Inpu
- {
-     const uint8_t *input = textIn->fRawInput;
-     int32_t confidence = 0;
-+    int32_t length = textIn->fRawLength;
- 
--    if (input[0] == 0xFF && input[1] == 0xFE && (input[2] != 0x00 || input[3] != 0x00)) {
-+    if (length >= 4 && input[0] == 0xFF && input[1] == 0xFE && (input[2] != 0x00 || input[3] != 0x00)) {
-         confidence = 100;
-     }
- 
-@@ -81,7 +83,7 @@ UBool CharsetRecog_UTF_32::match(InputTe
-     bool hasBOM = FALSE;
-     int32_t confidence = 0;
- 
--    if (getChar(input, 0) == 0x0000FEFFUL) {
-+    if (limit > 0 && getChar(input, 0) == 0x0000FEFFUL) {
-         hasBOM = TRUE;
-     }
- 
diff --git a/meta/recipes-support/icu/icu-51.2/0001-Disable-LDFLAGSICUDT-for-Linux.patch b/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
similarity index 100%
rename from meta/recipes-support/icu/icu-51.2/0001-Disable-LDFLAGSICUDT-for-Linux.patch
rename to meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
diff --git a/meta/recipes-support/icu/icu-51.2/icu-pkgdata-large-cmd.patch b/meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch
similarity index 100%
rename from meta/recipes-support/icu/icu-51.2/icu-pkgdata-large-cmd.patch
rename to meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch
diff --git a/meta/recipes-support/icu/icu_51.2.bb b/meta/recipes-support/icu/icu_53.1.bb
similarity index 40%
rename from meta/recipes-support/icu/icu_51.2.bb
rename to meta/recipes-support/icu/icu_53.1.bb
index 2d1fd42..d93af68 100644
--- a/meta/recipes-support/icu/icu_51.2.bb
+++ b/meta/recipes-support/icu/icu_53.1.bb
@@ -1,16 +1,21 @@
 require icu.inc
 
-LIC_FILES_CHKSUM = "file://../license.html;md5=443a74288a72fad9069a74e7637192c1"
+LIC_FILES_CHKSUM = "file://../license.html;md5=8b139ac5b93769623bd343318048238c"
 
+def icu_download_version(d):
+    pvsplit = d.getVar('PV', True).split('.')
+    return pvsplit[0] + "_" + pvsplit[1]
 
-BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-51_2-src.tgz"
+ICU_PV = "${@icu_download_version(d)}"
+
+BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV}-src.tgz"
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
-           file://add_buffer_length_check_to_UTF_16_or_32_detector.patch \
           "
 
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[md5sum] = "072e501b87065f3a0ca888f1b5165709"
-SRC_URI[sha256sum] = "deb027a05f1b3bec03298b96fb93b28c84e9683c22e6f94effa67fdc7bd704cc"
+
+SRC_URI[md5sum] = "b73baa6fbdfef197608d1f69300919b9"
+SRC_URI[sha256sum] = "6fa74fb5aac070c23eaba1711a7178fe582c59867484c5ec07c49002787a9a28"
-- 
1.9.1


