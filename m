Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9074D6C287
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 18:44:31 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.29139.1732041866514308206
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 10:44:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dh6yH06r;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ee9b571665so21659467b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 10:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732041865; x=1732646665; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L2jwHOjVV3tJt8Hqh4WC9DYD4Edw/CnXMbN2GTWUKzM=;
        b=Dh6yH06rl6ZXkhJ6JFw25ryaIsm677fJNPXJDgemr6pWjwmhPoxk0VWO5ntL9ADZjS
         okgCq9LZMIkreE1XRMcijzF4mmvpxQlK7B+XZOGBuXCakDRUSaGs8nWcMNk0Q41y+d4Q
         CewuTpw4rQBMnD/8svQqrsTVErClMLAruyMiNBUFzrXAv3bDSwmhUkbYUwbVjE8P8eRN
         pph1Y/VeMbPo/vvm31RRcT/89VPxBAhKhoXQeAMgjUvROxXkf51WfErDMd2tDz5KXOcL
         6Y5QrlU3s5vvKfBLjR1mURImu1v+iL6haO0Mdcm+lw6YgTpwUI3p9VuNeVpHejBXOuMI
         abJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732041865; x=1732646665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2jwHOjVV3tJt8Hqh4WC9DYD4Edw/CnXMbN2GTWUKzM=;
        b=qFttJNy1qDQpPHYvunhbFfS3a6GmT4bCUd+bVUdopf9BBJSaJfG8I4vaWRVHKRySkJ
         CawXVJdXxs6O6SJU5fC+0fRbjGN3i67plm60uJeyxSNOfY7uOVjso4rZxvNA8sg+KCMl
         DPVZJmWTOX07wfZqaJYuhYhckO9pzaDNVaBTUru+DZXM6HeOmESiBQFxj8aYeYz4nUmv
         2PzlV4q4K9bOeaYkhmQJSDUy+YFW0wClsm1iWLcv3dqpBCeNvnNbheqk2HTS65jjvr5L
         qA3Jdku6r1qsMoJw0fIvyHGVqqIbhVyZfS3WAxIRTeYq0WAHl+VexhVVOI7u2wu3tveK
         PdwQ==
X-Gm-Message-State: AOJu0YxFhw2K1znBznogt39M1JjIcS98KHs7dnr/ZgI2SeVjCK9t557H
	Zg2ZMNauT2dkE1btI3dgIuQI2BPI0tVIZJzh5PxbZ3HXZXn9eAGtNxvpNjy8
X-Google-Smtp-Source: AGHT+IE2bBnztUeUkSJnRd8iaXY/Ui+QdzzvlScoS0AvplF2854o9Lvcw0D+MlYWbaVHbV6YjPFe4w==
X-Received: by 2002:a05:690c:60c5:b0:6e3:153a:ff62 with SMTP id 00721157ae682-6ee55c1f684mr178772487b3.23.1732041865121;
        Tue, 19 Nov 2024 10:44:25 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eeae65b093sm3839827b3.105.2024.11.19.10.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 10:44:24 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [OE-core][PATCH] icu: upgrade 75-1 -> 76-1
Date: Tue, 19 Nov 2024 13:44:11 -0500
Message-ID: <20241119184411.76770-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 18:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207405

License-Update: add JSON parsing library under MIT license.

Drop backported patches which have been merged into the new version.
  ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch - https://github.com/unicode-org/icu/pull/3058/commits/db70adaddcfa8050db6a69cdfef080a7f1423ad7
  fix-install-manx.patch

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...813_rise_buffer_sizes_pkgdata_PR3058.patch | 72 -------------------
 .../icu/icu/fix-install-manx.patch            | 53 --------------
 .../icu/{icu_75-1.bb => icu_76-1.bb}          |  8 +--
 3 files changed, 3 insertions(+), 130 deletions(-)
 delete mode 100644 meta/recipes-support/icu/icu/ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch
 delete mode 100644 meta/recipes-support/icu/icu/fix-install-manx.patch
 rename meta/recipes-support/icu/{icu_75-1.bb => icu_76-1.bb} (93%)

diff --git a/meta/recipes-support/icu/icu/ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch b/meta/recipes-support/icu/icu/ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch
deleted file mode 100644
index 5b97350e6f..0000000000
--- a/meta/recipes-support/icu/icu/ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From db70adaddcfa8050db6a69cdfef080a7f1423ad7 Mon Sep 17 00:00:00 2001
-From: Carlos Alberto Lopez Perez <clopez@igalia.com>
-Date: Mon, 1 Jul 2024 22:15:18 +0100
-Subject: [PATCH] ICU-22813 Rise the size of the buffers used for the command
- strings at pkgdata
-
-The tool pkgdata uses snprintf() to build the strings of the commands that
-will execute later during the install process. But the maximum size of this
-buffers is not enough when there is a long path.
-
-This has caused issues on some CI systems that use very long paths, causing
-the install process to produce a wrong result.
-
-The maximum path on Linux is 4096 (defined as PATH_MAX at <linux/limits.h>)
-So the size of SMALL_BUFFER_MAX_SIZE should be 4096 to avoid errors related
-to truncated paths.
-
-Upstream-Status: Backport [https://github.com/unicode-org/icu/pull/3058]
-
-Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
----
- tools/pkgdata/pkgdata.cpp | 6 +++---
- tools/toolutil/pkg_genc.h | 5 ++---
- 2 files changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/tools/pkgdata/pkgdata.cpp b/tools/pkgdata/pkgdata.cpp
-index c2ac112..8d08c85 100644
---- a/tools/pkgdata/pkgdata.cpp
-+++ b/tools/pkgdata/pkgdata.cpp
-@@ -1134,7 +1134,7 @@ static int32_t pkg_createSymLinks(const char *targetDir, UBool specialHandling)
- 
- static int32_t pkg_installLibrary(const char *installDir, const char *targetDir, UBool noVersion) {
-     int32_t result = 0;
--    char cmd[SMALL_BUFFER_MAX_SIZE];
-+    char cmd[LARGE_BUFFER_MAX_SIZE];
- 
-     auto ret = snprintf(cmd,
-             sizeof(cmd),
-@@ -1205,7 +1205,7 @@ static int32_t pkg_installLibrary(const char *installDir, const char *targetDir,
- 
- static int32_t pkg_installCommonMode(const char *installDir, const char *fileName) {
-     int32_t result = 0;
--    char cmd[SMALL_BUFFER_MAX_SIZE] = "";
-+    char cmd[LARGE_BUFFER_MAX_SIZE] = "";
- 
-     if (!T_FileStream_file_exists(installDir)) {
-         UErrorCode status = U_ZERO_ERROR;
-@@ -1237,7 +1237,7 @@ static int32_t pkg_installCommonMode(const char *installDir, const char *fileNam
- #endif
- static int32_t pkg_installFileMode(const char *installDir, const char *srcDir, const char *fileListName) {
-     int32_t result = 0;
--    char cmd[SMALL_BUFFER_MAX_SIZE] = "";
-+    char cmd[LARGE_BUFFER_MAX_SIZE] = "";
- 
-     if (!T_FileStream_file_exists(installDir)) {
-         UErrorCode status = U_ZERO_ERROR;
-diff --git a/tools/toolutil/pkg_genc.h b/tools/toolutil/pkg_genc.h
-index 2dd1b45..f811fe5 100644
---- a/tools/toolutil/pkg_genc.h
-+++ b/tools/toolutil/pkg_genc.h
-@@ -59,9 +59,8 @@
- #define PKGDATA_FILE_SEP_STRING U_FILE_SEP_STRING
- #endif
- 
--#define LARGE_BUFFER_MAX_SIZE 2048
--#define SMALL_BUFFER_MAX_SIZE 512
--#define SMALL_BUFFER_FLAG_NAMES 32
-+#define LARGE_BUFFER_MAX_SIZE 16384
-+#define SMALL_BUFFER_MAX_SIZE 4096
- #define BUFFER_PADDING_SIZE 20
- 
- /** End platform defines **/
diff --git a/meta/recipes-support/icu/icu/fix-install-manx.patch b/meta/recipes-support/icu/icu/fix-install-manx.patch
deleted file mode 100644
index 7b1ca81451..0000000000
--- a/meta/recipes-support/icu/icu/fix-install-manx.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 2d544cac238eccbfc32cafc9502ddf6e00994211 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Fri, 9 Oct 2015 17:50:41 +0100
-Subject: [PATCH] icu: fix install race
-
-The generic recursive target calls target-local so also adding it to the
-dependency list results in races due to install-local being executed twice in
-parallel.  For example, install-manx can fail if the two install processes race
-and one process tries to chown a file that the other process has just deleted.
-
-Also install-manx should be a phony target, and for clarity use $^ instead of $?
-in the install command.
-
-Upstream-Status: Backport [0f022dca90cfe6bbf6a74f605dcaf1b489d58a9b]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- Makefile.in | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 8366f01..79b91c9 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -77,7 +77,7 @@ EXTRA_DATA =
- 
- ## List of phony targets
- .PHONY : all all-local all-recursive install install-local install-udata install-udata-files install-udata-dlls		\
--install-recursive clean clean-local clean-recursive distclean		\
-+install-recursive install-manx clean clean-local clean-recursive distclean		\
- distclean-local distclean-recursive doc dist dist-local dist-recursive	\
- check check-local check-recursive clean-recursive-with-twist install-icu \
- doc install-doc tests icu4j-data icu4j-data-install update-windows-makefiles xcheck-local xcheck-recursive xperf xcheck xperf-recursive \
-@@ -88,9 +88,9 @@ check-exhaustive check-exhaustive-local check-exhaustive-recursive releaseDist
- 
- ## List of standard targets
- all: all-local all-recursive
--install: install-recursive install-local
-+install: install-recursive
- clean: clean-recursive-with-twist clean-local
--distclean : distclean-recursive distclean-local
-+distclean : distclean-recursive
- dist: dist-recursive
- check: all check-recursive
- check-recursive: all
-@@ -357,7 +357,7 @@ config.status: $(srcdir)/configure $(srcdir)/common/unicode/uvernum.h
- install-manx: $(MANX_FILES)
- 	$(MKINSTALLDIRS) $(DESTDIR)$(mandir)/man$(SECTION)
- ifneq ($(MANX_FILES),)
--	$(INSTALL_DATA) $? $(DESTDIR)$(mandir)/man$(SECTION)
-+	$(INSTALL_DATA) $^ $(DESTDIR)$(mandir)/man$(SECTION)
- endif
- 
- config/%.$(SECTION): $(srcdir)/config/%.$(SECTION).in
diff --git a/meta/recipes-support/icu/icu_75-1.bb b/meta/recipes-support/icu/icu_76-1.bb
similarity index 93%
rename from meta/recipes-support/icu/icu_75-1.bb
rename to meta/recipes-support/icu/icu_76-1.bb
index 8f7f5e6cc7..08dabde3ae 100644
--- a/meta/recipes-support/icu/icu_75-1.bb
+++ b/meta/recipes-support/icu/icu_76-1.bb
@@ -92,7 +92,7 @@ FILES:libicuio = "${libdir}/libicuio.so.*"
 
 BBCLASSEXTEND = "native nativesdk"
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=9cf7c317c3f2a0962437465a9022dbe9"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=7c364a0debecf16d5a13de2b7f1aaabd"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV').split('-')
@@ -118,16 +118,14 @@ DATA_SRC_URI = "${GITHUB_BASE_URI}/download/release-${ICU_FOLDER}/icu4c-${ICU_PV
 SRC_URI = "${BASE_SRC_URI};name=code \
            ${DATA_SRC_URI};name=data \
            file://filter.json \
-           file://fix-install-manx.patch \
            file://0001-icu-Added-armeb-support.patch \
-           file://ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch \
            "
 
 SRC_URI:append:class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "cb968df3e4d2e87e8b11c49a5d01c787bd13b9545280fc6642f826527618caef"
-SRC_URI[data.sha256sum] = "a5104212dc317a64f9b035723ea706f2f4fd5a0f37b7923fae7aeb9d1d0061b1"
+SRC_URI[code.sha256sum] = "dfacb46bfe4747410472ce3e1144bf28a102feeaa4e3875bac9b4c6cf30f4f3e"
+SRC_URI[data.sha256sum] = "133ae58a67d68b46f7296822904cd3c30126a0b4b2f65f0f905e7f47c0ef9e47"
 
 UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>(?!.+rc).+)"
 GITHUB_BASE_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.43.0


