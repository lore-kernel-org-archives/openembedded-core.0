Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B76C48286
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 02:38:09 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.8375.1706323086097892519
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 18:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FKyUo1nu;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.172, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5ff7a098ab8so11585857b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706323084; x=1706927884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oiPSnp7M6OzpdgVwpDTLl9eDbFzLCcXuMeiRjJO71fk=;
        b=FKyUo1nu3Jzqtj0I7o3+xQxnnPzOf/JDRaK9NS3D4K5+CX2h20vMfOV/yipAJaakp/
         ox5Uhng53Ml84GTPmEmsNHapaIxW9k3gV2bDknnlQeiBzqjI6pdNGtbyx1h9CdvR197Q
         x0o08vtGAhyq4uTMRtYWJxe8x0YetXTAc+jOffQAlB7MUL4lubFhPonr0d4HX17lGZlT
         K71iQtBZTynH0Z4qfd391froxJgJkJFlBlgnG+jozgA4NmtS0EEbczwBuOgzWytxHIuU
         0BrHK19AzxHRXo3AD9pdCq441Wz+d/Le2y61o3+vw/lPZ3Tqq5Bqr00eh3/cAxTa0usG
         eR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706323084; x=1706927884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiPSnp7M6OzpdgVwpDTLl9eDbFzLCcXuMeiRjJO71fk=;
        b=Xl5YHl/JG/YBVR5uKbAwl5wl7zWOkasyKZ/4mysI6kW1vuq2B4tFbjPrwql5TNSyZR
         XVqhJfnZXtyRwX0IoLc4NVuKofI7YVMmp5FBt1Eb88EEscpe9Ujzjv40Y8qq0KB89/Ri
         Ia89CVDHhFMmUA1Tjt0oiFa6vSyUubVp8KNzAnFUeS7qLmeSGHbp/xjQWeN+nA2TBAzd
         9vkQ6tXCsX4zG7KpP5Ik7tYiaVRyLnFM3XSAHBk7CENpJ96sWFLla02xz6g69o/Jy2it
         gK3SozTBySLy8hsbpj46xDVzz7BXL8UTREG9+V9Crq1ydhf9ovYFCZjPP7BGoiZpWunJ
         xewA==
X-Gm-Message-State: AOJu0Yy7gHVOWC45z/YCdcYfDBiAjdA2icj4EPmRDrvqJWCg/gWseZbd
	lX8xkxBvhDOu3ZE4K9vfSib/uXrVAFfstsNnHR7DPxIwsVMFUUHLuZxKbzqT7TsAtKmFzcgRlVv
	Et2L1oA==
X-Google-Smtp-Source: AGHT+IFVpRsLatZdN1Laz19ZcXDTb7mKPk/90QSRFEx/hf2Zem8r3QxqjKbzjdFRxCmttQGeNsgDLQ==
X-Received: by 2002:a81:ad4b:0:b0:5ff:7890:17e4 with SMTP id l11-20020a81ad4b000000b005ff789017e4mr1125238ywk.27.1706323084367;
        Fri, 26 Jan 2024 18:38:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id r8-20020a170902be0800b001d7405022ecsm1547045pls.159.2024.01.26.18.38.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 18:38:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 14/23] python3-license-expression: Fix the ptest failure
Date: Fri, 26 Jan 2024 16:37:22 -1000
Message-Id: <f69530a3b86b512c5c60da4da34fc287ff0d1366.1706322780.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706322780.git.steve@sakoman.com>
References: <cover.1706322780.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 02:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194423

From: Mingli Yu <mingli.yu@windriver.com>

Fix the below ptest failure:
 self = <test_skeleton_codestyle.BaseTests testMethod=test_skeleton_codestyle>
 def test_skeleton_codestyle(self):
 """
 This test shouldn't run in proliferated repositories.
 """
 setup_cfg = configparser.ConfigParser()
 setup_cfg.read("setup.cfg")
 > if setup_cfg["metadata"]["name"] != "skeleton":
 tests/test_skeleton_codestyle.py:22:
 self = <configparser.ConfigParser object at 0x7fd87cf55110>, key = 'metadata'
 def _getitem_(self, key):
 if key != self.default_section and not self.has_section(key):
 > raise KeyError(key)
 E KeyError: 'metadata'

After the patch:
 # ./run-ptest
 [snip]
 PASS: tests/test_license_expression.py::LicensingValidateTest::test_validation_bad_syntax
 PASS: tests/test_license_expression.py::LicensingValidateTest::test_validation_exception_as_regular_key
 PASS: tests/test_license_expression.py::LicensingValidateTest::test_validation_exception_with_choice
 PASS: tests/test_license_expression.py::LicensingValidateTest::test_validation_invalid_license_exception
 PASS: tests/test_license_expression.py::LicensingValidateTest::test_validation_invalid_license_exception_strict_false
 PASS: tests/test_license_expression.py::LicensingValidateTest::test_validation_invalid_license_key
 PASS: tests/test_license_expression.py::UtilTest::test_build_licensing
 PASS: tests/test_license_expression.py::UtilTest::test_build_spdx_licensing
 PASS: tests/test_license_expression.py::UtilTest::test_get_license_key_info
 PASS: tests/test_license_expression.py::UtilTest::test_get_license_key_info_vendored
 PASS: tests/test_license_expression.py::CombineExpressionTest::test_combine_expressions_with_duplicated_elements
 PASS: tests/test_license_expression.py::CombineExpressionTest::test_combine_expressions_with_empty_input
 PASS: tests/test_license_expression.py::CombineExpressionTest::test_combine_expressions_with_or_relationship
 PASS: tests/test_license_expression.py::CombineExpressionTest::test_combine_expressions_with_regular
 PASS: tests/test_skeleton_codestyle.py::BaseTests::test_skeleton_codestyle
============================================================================
Testsuite summary
 # TOTAL: 175
 # PASS: 175
 # SKIP: 0
 # XFAIL: 0
 # FAIL: 0
 # XPASS: 0

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>

Changed in v4:
Add python3-license-expression to PTESTS_FAST

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6b06ad7a9f1dd5900483102f5723a6821f961dab)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3-license-expression/run-ptest                 | 2 +-
 .../python/python3-license-expression_30.1.1.bb                 | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-license-expression/run-ptest b/meta/recipes-devtools/python/python3-license-expression/run-ptest
index 5cec711696..8d2017d39c 100644
--- a/meta/recipes-devtools/python/python3-license-expression/run-ptest
+++ b/meta/recipes-devtools/python/python3-license-expression/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest
+pytest --automake
diff --git a/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb b/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
index 31fb88d6e5..92ca419e4a 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.1.1.bb
@@ -26,6 +26,7 @@ SRC_URI += " \
 
 RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-unittest-automake-output \
 "
 
 do_install_ptest() {
@@ -33,4 +34,5 @@ do_install_ptest() {
     install -d ${D}${PTEST_PATH}/src
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
     cp -rf ${S}/src/* ${D}${PTEST_PATH}/src/
+    cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
 }
-- 
2.34.1


