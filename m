Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65380C44510
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 19:04:31 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1651.1784055864373970952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 12:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mcg+jQu4;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6a38d83a480so767590eaf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784055863; x=1784660663; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pc+eaclg8vSOjinXmnN+zBjbFbAzT7vcFvrnDvut6bs=;
        b=mcg+jQu4Qv/FqmaXzjqIA3teFSIYL4APKDk5AWMTlmi4DXBCMDSL8CeO01OB8IREwM
         r2u8XhX5tiImy3FAmB0DixYJ2CM+fQmdTL3LB3b1CKSZL2ZGFimUiFbthdYhN2DJtjXg
         DM2jYDvFW1sIdMesEMszyqugoz4ozedMZ9oFtJ9e/7HtUHVHWSszC+gP0R2VdPEng4Zf
         WL41nwC8xibJ+UYfLTve6dAD0KFlUt8AKnEOMshe1GZWS4od7oUn8y4BBnzTIu0MkaUH
         HAlzPsO9QknKjrNxRFLHe3nQJ9NdwRc22PajiyocMB+BdqV50s/zvby3w9Kv3uiuKWnJ
         JUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055863; x=1784660663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pc+eaclg8vSOjinXmnN+zBjbFbAzT7vcFvrnDvut6bs=;
        b=SMoMoxCcRrBLQLPrccnFmdBSW3a+em7/LzftJXsf9khKg2yjZMm/18kLDqpXOWlHAm
         mXLlXj5qYa5Jnqeod+qR/FljEf46gFiRieWpZz5IMh50CbcWUK8lhGRTpY+kt4trD5fh
         LCCILPsXGpjC8CddwMOGy/ob0ErqceYToR3Xd9Ums727RDOu7BlFz1GdcFt5EcgnAgn5
         jXUFDWQxbkrKUaN7+5Wr32YEFnESYMEdq1T9RxQPcEZHVB8kpWef6obzuobNQy68Qo8U
         LjaYrFlxtp3VyY/M5qP871qHS+tCYPuo0FOofUfQoJt/yGTBbnGYRz/5YOnh3tGDzoUa
         2qUg==
X-Gm-Message-State: AOJu0YwCCCP+J8lXuZwhIzlum2KCUO6/IzfAknM2Laces0N2dnPjuivm
	5Qeml+FLH0nmGGsUdjVoOyPpyyvVSsNUhY4o9sza7VR2x5n9RGjIFDINIVCV/g==
X-Gm-Gg: AfdE7cmdK36u0NEFS9QWmBc63WsRyZWevLjKRwV/aB5G5jGRYu1oY5eYhAITCnCyQVy
	XtQWPtxQ8f+Doy42tiC/A6VpT3vv70TwD5Sjv1ViascarM0XMNCUo+H837WmlLsbPwh2O1ymmGi
	QxS95GUuPfWrjDCjFfUv0ObS4NdVNBP/xTSK1R4XFtCxZuu3NQReFHcKnbZZI2+trTNnTGlUFbK
	7RFLq27sl02P4np1CKUNvDSGlAkeN5HmjCnhACMjeQGPNos4I5C2nxosj/nDXqHKydugXNEhnyD
	jGGarv5DDu3RRBq4TpeygnR2HPeUB+EKuJD/8a7g//2GHmA5OCFsn6PqcokOICqBym7uSX2MfU4
	HTsMC0+YxxbfdkxCepQkfKnjgCgoD7pesvyLreNsKf3TyEB2Y2Rzh9lSfE3qWDgh4sitl69GAKW
	7TjRWxmVZYVQ==
X-Received: by 2002:a05:6820:810c:b0:69d:7fdb:3416 with SMTP id 006d021491bc7-6a38b9a0e29mr8876808eaf.21.1784055863492;
        Tue, 14 Jul 2026 12:04:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::7b52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451916f31d4sm17695629fac.16.2026.07.14.12.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:04:23 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 20/22] meta-selftest: Change license on test recipes
Date: Tue, 14 Jul 2026 12:31:30 -0600
Message-ID: <20260714190405.3328796-21-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714190405.3328796-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 19:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240928

The "CLOSED" license now issues a warning that it should be replaced
with a LicenseRef, so remove it from the test file in favor of declaring
an MIT license

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-selftest/recipes-test/devtool/devtool-patch-overrides.bb  | 3 ++-
 meta-selftest/recipes-test/devtool/devtool-test-ignored.bb     | 3 ++-
 meta-selftest/recipes-test/devtool/devtool-test-localonly.bb   | 3 ++-
 .../recipes-test/devtool/devtool-test-long-filename.bb         | 3 ++-
 meta-selftest/recipes-test/devtool/devtool-test-reset-re++.bb  | 3 ++-
 meta-selftest/recipes-test/devtool/devtool-test-subdir.bb      | 3 ++-
 meta-selftest/recipes-test/logging-test/logging-test.bb        | 3 ++-
 meta-selftest/recipes-test/sysroot-test/sysroot-la-test_1.0.bb | 3 ++-
 meta-selftest/recipes-test/sysroot-test/sysroot-pc-test_1.0.bb | 3 ++-
 .../recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb      | 3 ++-
 .../recipes-test/sysroot-test/sysroot-test-arch1_1.0.bb        | 3 ++-
 .../recipes-test/sysroot-test/sysroot-test-arch2_1.0.bb        | 3 ++-
 meta-selftest/recipes-test/sysroot-test/sysroot-test_1.0.bb    | 3 ++-
 13 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/meta-selftest/recipes-test/devtool/devtool-patch-overrides.bb b/meta-selftest/recipes-test/devtool/devtool-patch-overrides.bb
index f12bee0b3d..467df669df 100644
--- a/meta-selftest/recipes-test/devtool/devtool-patch-overrides.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-patch-overrides.bb
@@ -1,5 +1,6 @@
 SUMMARY = "devtool test for overrides and patches"
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-ignored.bb b/meta-selftest/recipes-test/devtool/devtool-test-ignored.bb
index c7740eb118..6ea4fa71fb 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-ignored.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-ignored.bb
@@ -1,4 +1,5 @@
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://${BPN}.tar.gz \
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb b/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
index 54463fed98..aad3a62f1f 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
@@ -1,4 +1,5 @@
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://file1 \
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-long-filename.bb b/meta-selftest/recipes-test/devtool/devtool-test-long-filename.bb
index 3653403a2e..ce0a468403 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-long-filename.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-long-filename.bb
@@ -1,4 +1,5 @@
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://${BPN}.tar.gz \
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-reset-re++.bb b/meta-selftest/recipes-test/devtool/devtool-test-reset-re++.bb
index 0146be4c52..fbfb456bf9 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-reset-re++.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-reset-re++.bb
@@ -1,4 +1,5 @@
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://file1"
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-subdir.bb b/meta-selftest/recipes-test/devtool/devtool-test-subdir.bb
index 966142431b..0351a1e3bb 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-subdir.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-subdir.bb
@@ -1,4 +1,5 @@
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "file://devtool-test-subdir.tar.gz \
diff --git a/meta-selftest/recipes-test/logging-test/logging-test.bb b/meta-selftest/recipes-test/logging-test/logging-test.bb
index ac3fb46f45..b08678ac58 100644
--- a/meta-selftest/recipes-test/logging-test/logging-test.bb
+++ b/meta-selftest/recipes-test/logging-test/logging-test.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Destined to fail"
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 deltask do_patch
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-la-test_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-la-test_1.0.bb
index 21f06782fb..76ea0e895d 100644
--- a/meta-selftest/recipes-test/sysroot-test/sysroot-la-test_1.0.bb
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-la-test_1.0.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Produce a broken la file"
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-pc-test_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-pc-test_1.0.bb
index e748310fc4..ee1c99a97e 100644
--- a/meta-selftest/recipes-test/sysroot-test/sysroot-pc-test_1.0.bb
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-pc-test_1.0.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Produce a broken pc file"
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb
index 106ddd5426..3926bd9bf2 100644
--- a/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-shebang-test_1.0.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Check that shebang does not exceed 256 characters"
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 
 EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch1_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch1_1.0.bb
index 36a682c53d..9e5c72e5b1 100644
--- a/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch1_1.0.bb
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch1_1.0.bb
@@ -1,4 +1,5 @@
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 PROVIDES = "virtual/sysroot-test"
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch2_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch2_1.0.bb
index 67172f3cab..d84b8c6282 100644
--- a/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch2_1.0.bb
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-test-arch2_1.0.bb
@@ -1,4 +1,5 @@
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 PROVIDES = "virtual/sysroot-test"
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta-selftest/recipes-test/sysroot-test/sysroot-test_1.0.bb b/meta-selftest/recipes-test/sysroot-test/sysroot-test_1.0.bb
index 560487c159..dc265dbe35 100644
--- a/meta-selftest/recipes-test/sysroot-test/sysroot-test_1.0.bb
+++ b/meta-selftest/recipes-test/sysroot-test/sysroot-test_1.0.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Virtual provider sysroot test"
-LICENSE = "CLOSED"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/sysroot-test"
 
-- 
2.54.0


