Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54E2D5B174
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 10:05:13 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45039.1765793105622234498
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 02:05:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=P4MxN+EE;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.51, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b79f698aa91so58513366b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 02:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1765793104; x=1766397904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfbymjVqmTRLCGavhA4WUXJdBy1KHmliPei8eahndYs=;
        b=P4MxN+EEohUFDI5EeEIMaVP+kAsME2wb8r2/+tvfItNYqLweRIPOzoBNWp7/vYS6zr
         kbuTPM3CMI99eeyrAh/Y84+nrphMgWglYNj1Ql+JSUtECS9e7WhIEQghNcEcR1jtTmU2
         3QCVk7VjmHQeCQVwwFYVrwm0sU/MKdbb8BRwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765793104; x=1766397904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lfbymjVqmTRLCGavhA4WUXJdBy1KHmliPei8eahndYs=;
        b=wbTjpImsdNQ74PsyJbzcYUo8adIByCaRRllh24KNAefqrmZ3MOaDxs+mSuZZgnl0ZO
         HE11m6K0d1ck1ku//XC0hVYvU7cLEW310UnliHzgVTpA21C78vzjhO1SHepdp7zmMCid
         jcnVM0uZg3VwpcRUSF/0/KhJ4qwkP8BXPqKCfrriYP4BvoIGSOEA2HMIv38Hw19PGUzK
         L6uUg5J9qGEvruEF8ZETcxuRBWpvDPhHELRUHmblL1ThXOPsKbWn8D/zqXAS2vhSnBEc
         7OKN/gApP3ka/vx/H8Wz6XQ+s8VT8wUVaeUrBhiuz3Gtdy42AbAtNPQVxSKwg7qRrwcY
         p85g==
X-Gm-Message-State: AOJu0YzndpkDGFLjFzg5Q4e1eDpBnpahQaH84CUMlsvHA1yNe283Lp5c
	Q/4rbMzOzWxfid0PUQyk3njRIom5xZbxQtM/X6pRdpB0JYCZctnuiunH0X9BUto6HSuXvrpkfl7
	IVciA
X-Gm-Gg: AY/fxX73nmwknHHKHNXWvQFyUjwMBF7FeG9aJuVhUtm/QaUkhZhSCep/IPiMO4vbyws
	9w3gfzjOv5lCjOiBE7t4Cc/xvN5Gu3pNnWDXElmRvoYRRetHbifqADNGFH4Rg14eKWlMFCfliYw
	/UCvAk2i2TNO/e3mi/xWkVLUFiU0OOdprExuIxpXURm1Ot0n/c2ZMgu2oCz+5ekF33uXgDQ7V0/
	7qUDFWS3YuLzNlx8XGKcSNbXUSzUbr6JJzKU7xz4Z+I0nGsp2YNJjjEn6Xh3tjOjJyWhdEoKcOV
	/H6WHGmahCayXbRSwZ4CURdPLTMLXP98GU8btXqrfDbxJdYbbr1TsLfvGErNUAG+FGCO5xON+/L
	xyPkbZFde1YgC9ve0DfqZfDYGhlzuqk4Qm5I1qFUfNt4RDGcCgSDeCwoMD3QRxAFDhTv++Sq6KL
	M37/WibJloiwSjl7m7VS1zmvEMw87wVGecv5qXKgADVBGM5I3og3PsJSExPlspiF14KrkgXKznA
	lARggXjJStTcUSv0anZ04SNtl3eQUdZn0gNSbrzPkPGtLLBHihFTjGAbg==
X-Google-Smtp-Source: AGHT+IGpt+Dm8rzizukdK4DizjRjKDxY28RHes6sNsAN2wmKNElbVWgRNfEa/yQCkPdQ0BJVA32zgg==
X-Received: by 2002:a17:907:9689:b0:b73:8bdb:9608 with SMTP id a640c23a62f3a-b7d235b1605mr569118466b.2.1765793103829;
        Mon, 15 Dec 2025 02:05:03 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa57192bsm1336898366b.53.2025.12.15.02.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 02:05:03 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v3 3/6] libtoml11: cleanup package to adhere to the recipe style guide
Date: Mon, 15 Dec 2025 11:04:57 +0100
Message-ID: <20251215100500.1626964-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215100500.1626964-1-adam.duskett@amarulasolutions.com>
References: <20251215100500.1626964-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227708

  - Add a BUGTRACKER link

  - Move SRCREV to below SRC_URI

  - Use gitsm instead of multiple git entries in the SRC_URI

  - Remove SRCEV_FORMAT as it is not needed.

  - Add a tag to the SRC_URI

  - Add a UPSTREAM_CHECK_GITTAGREGEX field

  - Use `PTEST_ENABLED 1` instead of `DISTRO_FEATURES ptest`

  - Change "Submitted" in 0001-Remove-whitespace-in-operator.patch
    to "Backport" with the appropraite link to the relevant commit hash.

  - Clean up run-ptest.

  - Add libtoml11 to maintainers.inc and ptest-packagelist.inc

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
V1 -> V2: Add this patch to the series

 .../0001-Remove-whitespace-in-operator.patch  |  2 +-
 .../libtoml11/files/run-ptest                 | 15 +++++----
 .../libtoml11/libtoml11_4.4.0.bb              | 33 +++++++++----------
 3 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch b/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
index c8c9922d55..9516ee5cb1 100644
--- a/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
+++ b/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.patch
@@ -11,7 +11,7 @@ include/toml11/impl/../fwd/literal_fwd.hpp:22:26: error: identifier '_toml' prec
 |       |               ~~~~~~~~~~~^~~~~
 |       |               operator""_toml
 
-Upstream-Status: Submitted [https://github.com/ToruNiina/toml11/pull/285]
+Upstream-Status: Backport [https://github.com/ToruNiina/toml11/commit/dee78f822d8a5b985e565e5c1ef42a59557aa8fc]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  include/toml11/fwd/literal_fwd.hpp   | 2 +-
diff --git a/meta/recipes-devtools/libtoml11/files/run-ptest b/meta/recipes-devtools/libtoml11/files/run-ptest
index 9bc480aa7f..22d6f7e0e1 100755
--- a/meta/recipes-devtools/libtoml11/files/run-ptest
+++ b/meta/recipes-devtools/libtoml11/files/run-ptest
@@ -1,12 +1,13 @@
-#!/bin/sh
+#!/usr/bin/env sh
 
 cd tests
-for atest in test_* ; do
-    rm -rf tests.log
-    ./${atest} > tests.log 2>&1
-    if [ $? = 0 ] ; then
-        echo "PASS: ${atest}"
+
+rm -rf tests.log
+
+for i in test_* ; do
+    if ./"${i}" >> tests.log 2>&1; then
+        echo "PASS: ${i}"
     else
-        echo "FAIL: ${atest}"
+        echo "FAIL: ${i}"
     fi
 done
diff --git a/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
index 38786b79ed..c3b00511ae 100644
--- a/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
+++ b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
@@ -1,9 +1,10 @@
 SUMMARY = "TOML for Modern C++"
-DESCRIPTION = "toml11 is a feature-rich TOML language library for \
-               C++11/14/17/20."
-
+DESCRIPTION = "\
+    toml11 is a feature-rich TOML language library for \
+    C++11/14/17/20. \
+"
 HOMEPAGE = "https://github.com/ToruNiina/toml11"
-
+BUGTRACKER = "https://github.com/ToruNiina/toml11/issues"
 SECTION = "libs"
 
 LICENSE = "MIT"
@@ -11,23 +12,19 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=44d1fcf70c7aa6991533c38daf7befa3"
 
 PE = "1"
 
-SRCREV = "be08ba2be2a964edcdb3d3e3ea8d100abc26f286"
-SRCREV_json = "8c391e04fe4195d8be862c97f38cfe10e2a3472e"
-SRCREV_doctest = "ae7a13539fb71f270b87eb2e874fbac80bc8dda2"
-
-SRC_URI = "git://github.com/ToruNiina/toml11;branch=main;protocol=https \
-           git://github.com/nlohmann/json;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/tests/extlib/json;name=json;branch=develop;protocol=https \
-           git://github.com/doctest/doctest;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/tests/extlib/doctest;name=doctest;branch=master;protocol=https \
-           file://0001-Remove-whitespace-in-operator.patch \
-           file://run-ptest \
+SRC_URI = "\
+    gitsm://github.com/ToruNiina/toml11.git;protocol=https;branch=main;tag=v${PV} \
+    file://0001-Remove-whitespace-in-operator.patch \
+    file://run-ptest \
 "
-SRCREV_FORMAT = "json_doctest"
-
+SRCREV = "be08ba2be2a964edcdb3d3e3ea8d100abc26f286"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 inherit cmake ptest
 
-EXTRA_OECMAKE += "-DTOML11_PRECOMPILE=ON \
-                  -DTOML11_BUILD_TESTS=${@bb.utils.contains("DISTRO_FEATURES", "ptest", "ON", "OFF", d)} \
+EXTRA_OECMAKE += "\
+    -DTOML11_PRECOMPILE=ON \
+    -DTOML11_BUILD_TESTS=${@bb.utils.contains("PTEST_ENABLED", "1", "ON", "OFF", d)} \
 "
 
 ALLOW_EMPTY:${PN} = "1"
@@ -36,3 +33,5 @@ do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
     cp -r ${B}/tests/test_* ${D}${PTEST_PATH}/tests
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.52.0


