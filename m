Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
 by mx.groups.io with SMTP id smtpd.web10.6433.1588322777924764634
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 01:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.28, mailfrom: andrej.valek@siemens.com)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0418kFuv027897
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Fri, 1 May 2020 10:46:16 +0200
Received: from dev.vm6.ccp.siemens.com ([158.226.192.212])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id 0418kF3A024246;
	Fri, 1 May 2020 10:46:15 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 0ED0398021E;
	Fri,  1 May 2020 10:46:14 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v2] icu: upgrade 66.1 -> 67.1
Date: Fri,  1 May 2020 10:45:23 +0200
Message-Id: <20200501084523.12956-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200501082616.11296-1-andrej.valek@siemens.com>
References: <20200501082616.11296-1-andrej.valek@siemens.com>

- 0001-icu-Added-armeb-support.patch - rebased
- 0001-Fix-big-endian-build.patch - removed, already included in new version
- icu-pkgdata-large-cmd.patch - removed, implemented correct size

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../icu/icu/0001-Fix-big-endian-build.patch        | 28 -------------
 .../icu/icu/0001-icu-Added-armeb-support.patch     |  6 +--
 .../icu/icu/icu-pkgdata-large-cmd.patch            | 49 ----------------------
 .../icu/{icu_66.1.bb => icu_67.1.bb}               |  7 +---
 4 files changed, 5 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch
 delete mode 100644 meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch
 rename meta/recipes-support/icu/{icu_66.1.bb => icu_67.1.bb} (84%)

diff --git a/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch b/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch
deleted file mode 100644
index 91d68848c7..0000000000
--- a/meta/recipes-support/icu/icu/0001-Fix-big-endian-build.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 9be0b489a94b57419202c552022f25cb95bfac51 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 17 Apr 2019 16:41:58 +0200
-Subject: [PATCH] Fix big-endian build
-
-Bug-report: https://unicode-org.atlassian.net/browse/ICU-20533
-Patch taken from: https://bugs.gentoo.org/682170
-
-it is applied upstream and will be in version 67+
-
-Upstream-Status: Backport [https://github.com/unicode-org/icu/commit/4a3a457b38cd828b7b3fa4fdbc6e2504a57275e9]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- data/Makefile.in | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
---- a/data/Makefile.in
-+++ b/data/Makefile.in
-@@ -148,7 +148,8 @@ ICUDATA_ARCHIVE = $(firstword $(wildcard
- # and convert it to the current type.
- ifneq ($(ICUDATA_ARCHIVE),)
- ICUDATA_SOURCE_ARCHIVE = $(OUTDIR)/$(ICUDATA_PLATFORM_NAME).dat
--$(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE) $(OUTDIR)
-+$(ICUDATA_SOURCE_ARCHIVE): $(ICUDATA_ARCHIVE)
-+	$(MKINSTALLDIRS) $(OUTDIR)
- 	$(INVOKE) $(TOOLBINDIR)/icupkg -t$(ICUDATA_CHAR) $(ICUDATA_ARCHIVE) $(ICUDATA_SOURCE_ARCHIVE)
- endif
- else
diff --git a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
index 299689d95c..145efc0e01 100644
--- a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
+++ b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
@@ -13,10 +13,10 @@ Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/i18n/double-conversion-utils.h b/i18n/double-conversion-utils.h
-index 1e44fca..e4f2a8b 100644
+index 8c6a0e1..cf89907 100644
 --- a/i18n/double-conversion-utils.h
 +++ b/i18n/double-conversion-utils.h
-@@ -92,7 +92,7 @@ int main(int argc, char** argv) {
+@@ -115,7 +115,7 @@ int main(int argc, char** argv) {
  //
  // If it prints "correct" then the architecture should be here, in the "correct" section.
  #if defined(_M_X64) || defined(__x86_64__) || \
@@ -24,7 +24,7 @@ index 1e44fca..e4f2a8b 100644
 +    defined(__arm__) || defined(__avr32__) || defined(_M_ARM) || defined(_M_ARM64) || \
      defined(__hppa__) || defined(__ia64__) || \
      defined(__mips__) || \
-     defined(__powerpc__) || defined(__ppc__) || defined(__ppc64__) || \
+     defined(__nios2__) || \
 -- 
 2.7.4
 
diff --git a/meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch b/meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch
deleted file mode 100644
index e758a623ef..0000000000
--- a/meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-pkgdata.cpp: use LARGE_BUFFER_MAX_SIZE for cmd
-
-Use LARGE_BUFFER_MAX_SIZE for cmd rather than SMALL_BUFFER_MAX_SIZE,
-otherwise there was a Segmentation fault error when the command line is
-long, this should be a misplay since other cmd uses
-LARGE_BUFFER_MAX_SIZE.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- tools/pkgdata/pkgdata.cpp | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/tools/pkgdata/pkgdata.cpp b/tools/pkgdata/pkgdata.cpp
-index 60167dd..506dd32 100644
---- a/tools/pkgdata/pkgdata.cpp
-+++ b/tools/pkgdata/pkgdata.cpp
-@@ -1084,7 +1084,7 @@ normal_symlink_mode:
- 
- static int32_t pkg_installLibrary(const char *installDir, const char *targetDir, UBool noVersion) {
-     int32_t result = 0;
--    char cmd[SMALL_BUFFER_MAX_SIZE];
-+    char cmd[LARGE_BUFFER_MAX_SIZE];
- 
-     sprintf(cmd, "cd %s && %s %s %s%s%s",
-             targetDir,
-@@ -1152,7 +1152,7 @@ static int32_t pkg_installLibrary(const char *installDir, const char *targetDir,
- 
- static int32_t pkg_installCommonMode(const char *installDir, const char *fileName) {
-     int32_t result = 0;
--    char cmd[SMALL_BUFFER_MAX_SIZE] = "";
-+    char cmd[LARGE_BUFFER_MAX_SIZE] = "";
- 
-     if (!T_FileStream_file_exists(installDir)) {
-         UErrorCode status = U_ZERO_ERROR;
-@@ -1184,7 +1184,7 @@ static int32_t pkg_installCommonMode(const char *installDir, const char *fileNam
- #endif
- static int32_t pkg_installFileMode(const char *installDir, const char *srcDir, const char *fileListName) {
-     int32_t result = 0;
--    char cmd[SMALL_BUFFER_MAX_SIZE] = "";
-+    char cmd[LARGE_BUFFER_MAX_SIZE] = "";
- 
-     if (!T_FileStream_file_exists(installDir)) {
-         UErrorCode status = U_ZERO_ERROR;
--- 
-1.9.1
-
diff --git a/meta/recipes-support/icu/icu_66.1.bb b/meta/recipes-support/icu/icu_67.1.bb
similarity index 84%
rename from meta/recipes-support/icu/icu_66.1.bb
rename to meta/recipes-support/icu/icu_67.1.bb
index f2bb344e33..58638507c9 100644
--- a/meta/recipes-support/icu/icu_66.1.bb
+++ b/meta/recipes-support/icu/icu_67.1.bb
@@ -22,17 +22,15 @@ DATA_SRC_URI = "https://github.com/unicode-org/icu/releases/download/release-${I
 SRC_URI = "${BASE_SRC_URI};name=code \
            ${DATA_SRC_URI};name=data \
            file://filter.json \
-           file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
-           file://0001-Fix-big-endian-build.patch;apply=no \
            file://0001-icu-Added-armeb-support.patch \
            "
 
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "52a3f2209ab95559c1cf0a14f24338001f389615bf00e2585ef3dbc43ecf0a2e"
-SRC_URI[data.sha256sum] = "8be647f738891d2beb79d48f99077b3499948430eae6f1be112553b15ab0243e"
+SRC_URI[code.sha256sum] = "94a80cd6f251a53bd2a997f6f1b5ac6653fe791dfab66e1eb0227740fb86d5dc"
+SRC_URI[data.sha256sum] = "7c16a59cc8c06128b7ecc1dc4fc056b36b17349312829b17408b9e67b05c4a7e"
 
 UPSTREAM_CHECK_REGEX = "icu4c-(?P<pver>\d+(_\d+)+)-src"
 UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
@@ -43,7 +41,6 @@ do_make_icudata_class-target () {
     cd ${S}
     rm -rf data
     cp -a ${WORKDIR}/data .
-    patch -p1 < ${WORKDIR}/0001-Fix-big-endian-build.patch
     AR='${BUILD_AR}' \
     CC='${BUILD_CC}' \
     CPP='${BUILD_CPP}' \
-- 
2.11.0

