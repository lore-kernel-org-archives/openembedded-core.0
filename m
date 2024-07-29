Return-Path: <clopez@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4B9C3DA61
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 23:28:25 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [178.60.130.6])
 by mx.groups.io with SMTP id smtpd.web10.6150.1722295702137652526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 16:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=fYjV83o2;
 spf=pass (domain: igalia.com, ip: 178.60.130.6, mailfrom: clopez@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=a+TcchQpwlOrYteocDLRsSlE4UuQis7T+EO6uzOE3fI=; b=fYjV83o2KqIgRMIkrD5whlE9aD
	GkfmQiweaYMdFPTDqtkZNuPwQZSCqpvNEJ1CkZtEMk7IXJPfMSXZ6U019Szm3Y67HPvR6hrYhQtZ5
	4huRG/02aEPZ+QhH83dkMOvnrcLaq6X1FbS+qIdt0VFDJpXXkm22NaKnjgcENv4Q54T0fZZJW3NUz
	uSUhK8JB3F/0tP52uMpw42vSjcIcxUp2Scf8OaSZf6pVvlAABiD3PaBlhBvwdcdGLfZaIoa52bMUm
	gJCCJGOJn5EVavY9oeyu6jPMOPrzJxIo2duvENNc3XcUwXNLAXaLzBFVecADILVw+HFyzeAdvEfLW
	D2BfQWgQ==;
Received: from 141.90.219.87.dynamic.jazztel.es ([87.219.90.141] helo=trinity.bot.igalia.com)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1sYZmt-004agR-8N
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 01:28:19 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] icu: Backport patch to fix build issues with long paths (>512 chars)
Date: Tue, 30 Jul 2024 00:28:18 +0100
Message-Id: <20240729232818.794526-1-clopez@igalia.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 23:28:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202663

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 ...813_rise_buffer_sizes_pkgdata_PR3058.patch | 70 +++++++++++++++++++
 meta/recipes-support/icu/icu_75-1.bb          |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch

diff --git a/meta/recipes-support/icu/icu/ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch b/meta/recipes-support/icu/icu/ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch
new file mode 100644
index 0000000000..367ac75502
--- /dev/null
+++ b/meta/recipes-support/icu/icu/ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch
@@ -0,0 +1,70 @@
+From db70adaddcfa8050db6a69cdfef080a7f1423ad7 Mon Sep 17 00:00:00 2001
+From: Carlos Alberto Lopez Perez <clopez@igalia.com>
+Date: Mon, 1 Jul 2024 22:15:18 +0100
+Subject: [PATCH] ICU-22813 Rise the size of the buffers used for the command
+ strings at pkgdata
+
+The tool pkgdata uses snprintf() to build the strings of the commands that
+will execute later during the install process. But the maximum size of this
+buffers is not enough when there is a long path.
+
+This has caused issues on some CI systems that use very long paths, causing
+the install process to produce a wrong result.
+
+The maximum path on Linux is 4096 (defined as PATH_MAX at <linux/limits.h>)
+So the size of SMALL_BUFFER_MAX_SIZE should be 4096 to avoid errors related
+to truncated paths.
+
+Upstream-Status: Backport [https://github.com/unicode-org/icu/pull/3058]
+---
+ tools/pkgdata/pkgdata.cpp | 6 +++---
+ tools/toolutil/pkg_genc.h | 5 ++---
+ 2 files changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/tools/pkgdata/pkgdata.cpp b/tools/pkgdata/pkgdata.cpp
+index c2ac112..8d08c85 100644
+--- a/tools/pkgdata/pkgdata.cpp
++++ b/tools/pkgdata/pkgdata.cpp
+@@ -1134,7 +1134,7 @@ static int32_t pkg_createSymLinks(const char *targetDir, UBool specialHandling)
+ 
+ static int32_t pkg_installLibrary(const char *installDir, const char *targetDir, UBool noVersion) {
+     int32_t result = 0;
+-    char cmd[SMALL_BUFFER_MAX_SIZE];
++    char cmd[LARGE_BUFFER_MAX_SIZE];
+ 
+     auto ret = snprintf(cmd,
+             sizeof(cmd),
+@@ -1205,7 +1205,7 @@ static int32_t pkg_installLibrary(const char *installDir, const char *targetDir,
+ 
+ static int32_t pkg_installCommonMode(const char *installDir, const char *fileName) {
+     int32_t result = 0;
+-    char cmd[SMALL_BUFFER_MAX_SIZE] = "";
++    char cmd[LARGE_BUFFER_MAX_SIZE] = "";
+ 
+     if (!T_FileStream_file_exists(installDir)) {
+         UErrorCode status = U_ZERO_ERROR;
+@@ -1237,7 +1237,7 @@ static int32_t pkg_installCommonMode(const char *installDir, const char *fileNam
+ #endif
+ static int32_t pkg_installFileMode(const char *installDir, const char *srcDir, const char *fileListName) {
+     int32_t result = 0;
+-    char cmd[SMALL_BUFFER_MAX_SIZE] = "";
++    char cmd[LARGE_BUFFER_MAX_SIZE] = "";
+ 
+     if (!T_FileStream_file_exists(installDir)) {
+         UErrorCode status = U_ZERO_ERROR;
+diff --git a/tools/toolutil/pkg_genc.h b/tools/toolutil/pkg_genc.h
+index 2dd1b45..f811fe5 100644
+--- a/tools/toolutil/pkg_genc.h
++++ b/tools/toolutil/pkg_genc.h
+@@ -59,9 +59,8 @@
+ #define PKGDATA_FILE_SEP_STRING U_FILE_SEP_STRING
+ #endif
+ 
+-#define LARGE_BUFFER_MAX_SIZE 2048
+-#define SMALL_BUFFER_MAX_SIZE 512
+-#define SMALL_BUFFER_FLAG_NAMES 32
++#define LARGE_BUFFER_MAX_SIZE 16384
++#define SMALL_BUFFER_MAX_SIZE 4096
+ #define BUFFER_PADDING_SIZE 20
+ 
+ /** End platform defines **/
diff --git a/meta/recipes-support/icu/icu_75-1.bb b/meta/recipes-support/icu/icu_75-1.bb
index 88103e4eca..8f7f5e6cc7 100644
--- a/meta/recipes-support/icu/icu_75-1.bb
+++ b/meta/recipes-support/icu/icu_75-1.bb
@@ -120,6 +120,7 @@ SRC_URI = "${BASE_SRC_URI};name=code \
            file://filter.json \
            file://fix-install-manx.patch \
            file://0001-icu-Added-armeb-support.patch \
+           file://ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch \
            "
 
 SRC_URI:append:class-target = "\
-- 
2.39.2


