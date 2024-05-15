Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFFCC25B7D
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 11:56:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.12846.1715774190264692177
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 04:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OUkpQAqU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42011507a54so24338295e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 04:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715774188; x=1716378988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULB+pxFYQRicgAODjCYbWaw+F2H9h6KYM0pd1jidD1U=;
        b=OUkpQAqU/5QlN9kzMZtsce8DmMrReAy62Ovn8fQ2aN9tL4cZNtHd8G3lzhIp8MEEe0
         sfnBnzkuD61BumtFD7kORRg6PamEDL9bRINR6TNiVhMgOk9skF147Wa8rWgBKcAuoW4Y
         Aso/oarkREWN1okZ5DlriQG2gSMg06b/I27CI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715774188; x=1716378988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ULB+pxFYQRicgAODjCYbWaw+F2H9h6KYM0pd1jidD1U=;
        b=F5EFhlXYYB6AGayi6mQvozWA8udYGRlHNoRvefj/husfGhTAsK16cs5lRk3tHR1tEI
         RpBrl2mU/Egg+uEQX6EaX2VhEqmIYYgbkqcHhkLu1Cznrwzvk40qpexQOuNrQ6Mlmi9M
         2CWsezhJaZVLGfp2YTtCR0MOhVTahmCpRQO7c2f0EvwqjSPAg7zol2VC2pgeYkAqK7fO
         znjdr3BlrXA+WoPyWOWc35+Wo99ncJv5/twEk3dzu7v1tfhrEQrLAUMzd/AJ91hXfRsa
         2F3A7IwzfJLMIxUMlb/pqa+horNusMpcaOJQPCPrd7XhOl5FqsAiqILPDS934iv+Yg3Q
         2Y8A==
X-Gm-Message-State: AOJu0YyvYqLHxZZSVirR1teHLRhukOPxowNR1pbaSk800x2f4gwTmXkJ
	mvKeRMmosn4SdA+cUjGM6UPF8MJi/HOoNowOW6jM07O57NUS1ioxoyXCkaOFnRlw7VGR8GyCIYG
	kcUw=
X-Google-Smtp-Source: AGHT+IFCU/iQEhWeuVpMq+HS3xkE2XCACr5Sl3gkqWPWOIx7U5wtGQtWAg8m4+7C/qGNYI3VKCIm4A==
X-Received: by 2002:a05:600c:35cd:b0:420:1a72:69dd with SMTP id 5b1f17b1804b1-4201a726bfamr65889125e9.10.1715774188497;
        Wed, 15 May 2024 04:56:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:13b6:dedd:c8fc:b915])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce2449sm232555825e9.16.2024.05.15.04.56.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 04:56:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] recipes: Ensure S is set to a valid directory
Date: Wed, 15 May 2024 12:56:19 +0100
Message-Id: <20240515115620.420558-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
References: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 11:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199285

Several recipes have S pointing at a directory that does not exist.
Set S in these cases to somethig valid making the metadata and
recipe behaviour more consistent.

Tweak one of the QA test diff offsets to match the changed recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-test/recipeutils/recipeutils-test_1.2.bb          | 3 +++
 meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb           | 3 +++
 meta/lib/oeqa/selftest/cases/recipeutils.py                   | 4 ++--
 .../ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb            | 3 +++
 meta/recipes-extended/watchdog/watchdog-config.bb             | 3 +++
 meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb   | 3 +++
 meta/recipes-support/user-creation/xuser-account_0.1.bb       | 3 +++
 7 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
index c64c4693964..8b314d396ee 100644
--- a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
+++ b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
@@ -6,6 +6,9 @@ LICENSE = "HPND"
 LIC_FILES_CHKSUM = "file://${UNPACKDIR}/somefile;md5=d41d8cd98f00b204e9800998ecf8427e"
 DEPENDS += "zlib"
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI += "file://somefile"
diff --git a/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb b/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb
index 5e8761ab554..db674d0efc2 100644
--- a/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb
+++ b/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb
@@ -6,6 +6,9 @@ LICENSE = "MIT"
 SRC_URI = "file://testfile.txt"
 INHIBIT_DEFAULT_DEPS = "1"
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 do_compile(){
 	echo "testdata" > ${B}/"file with [brackets].txt"
 	echo "testdata" > ${B}/"file with (parentheses).txt"
diff --git a/meta/lib/oeqa/selftest/cases/recipeutils.py b/meta/lib/oeqa/selftest/cases/recipeutils.py
index 2cb4445f81b..99497371724 100644
--- a/meta/lib/oeqa/selftest/cases/recipeutils.py
+++ b/meta/lib/oeqa/selftest/cases/recipeutils.py
@@ -72,7 +72,7 @@ class RecipeUtilsTests(OESelftestTestCase):
         expected_patch = """
 --- a/recipes-test/recipeutils/recipeutils-test_1.2.bb
 +++ b/recipes-test/recipeutils/recipeutils-test_1.2.bb
-@@ -8,6 +8,4 @@
+@@ -11,6 +11,4 @@
  
  BBCLASSEXTEND = "native nativesdk"
  
@@ -97,7 +97,7 @@ class RecipeUtilsTests(OESelftestTestCase):
         expected_patch = """
 --- a/recipes-test/recipeutils/recipeutils-test_1.2.bb
 +++ b/recipes-test/recipeutils/recipeutils-test_1.2.bb
-@@ -8,6 +8,3 @@
+@@ -11,6 +11,3 @@
  
  BBCLASSEXTEND = "native nativesdk"
  
diff --git a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
index 4a62ddacd5f..db5a0eb8ce5 100644
--- a/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
+++ b/meta/recipes-connectivity/ssh-pregen-hostkeys/ssh-pregen-hostkeys_1.0.bb
@@ -6,6 +6,9 @@ SRC_URI = "file://dropbear_rsa_host_key \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 INHIBIT_DEFAULT_DEPS = "1"
 
 COMPATIBLE_MACHINE = "^qemu.*$"
diff --git a/meta/recipes-extended/watchdog/watchdog-config.bb b/meta/recipes-extended/watchdog/watchdog-config.bb
index e826a7d4a66..17151ced5ec 100644
--- a/meta/recipes-extended/watchdog/watchdog-config.bb
+++ b/meta/recipes-extended/watchdog/watchdog-config.bb
@@ -13,6 +13,9 @@ SRC_URI = " \
     file://watchdog.conf \
 "
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 # The default value is 60 seconds when null.
 WATCHDOG_TIMEOUT ??= ""
 
diff --git a/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb b/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
index 332525f5c92..a766b00bef0 100644
--- a/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
+++ b/meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
@@ -7,6 +7,9 @@ SRC_URI = "file://dt-doc-validate \
            file://dt-mk-schema \
            file://dt-validate"
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 do_install() {
     install -d ${D}${bindir}/
     install -m 755 ${UNPACKDIR}/dt-doc-validate ${D}${bindir}/
diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb b/meta/recipes-support/user-creation/xuser-account_0.1.bb
index 2bd3699e74b..80a429c6d33 100644
--- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
+++ b/meta/recipes-support/user-creation/xuser-account_0.1.bb
@@ -6,6 +6,9 @@ SRC_URI = "file://system-xuser.conf"
 
 inherit allarch useradd
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 do_configure() {
     :
 }
-- 
2.40.1


