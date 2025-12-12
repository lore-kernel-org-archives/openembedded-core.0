Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37280D4417F
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 10:33:24 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9994.1765535597020551465
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 02:33:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=Wfx4vQcB;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.48, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6415fc4093bso143189a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 02:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1765535595; x=1766140395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfbymjVqmTRLCGavhA4WUXJdBy1KHmliPei8eahndYs=;
        b=Wfx4vQcBAnBZ/KVHpR4qEwiZq/S2oGQ/tlThl/71OTTjQZURq3zM2gUH42oei5a0W/
         1Ip6fVOMyHY2YAJ4gJEGpOpR+NP0ntUZcK//t76mXg1t4EhxTJScaoJFPOwsEtI+ewpP
         jynUi0kVEOIhhuVhLtm3ZCj9oREnR1kcP+Q5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765535595; x=1766140395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lfbymjVqmTRLCGavhA4WUXJdBy1KHmliPei8eahndYs=;
        b=TTAEH72Qh3FxvOEEMni3h9AY9+eipDzXMONhCUjZyGom2ysXW4wWr6mKOpgBZqQFKi
         QOiX9yagPw/zEbobA2Ib9/F1Ngvg3JhTkk3dwZWhsaSffvYJed41J9c4+DzyYN7uULT9
         xubJhyQ9PsGMp6OZ3JOR/XVGdwaYaqUq0CvUPRvi5Gb6rdQjhBQGUSradZd83kYPKB0w
         c0rY2WrgcMrh9ni3Ur1WhXj+D+s4SwFqNYiAUlrEVckHJGPOsOVGkMQv0MDVvXM3gy3i
         MQlFaAxwFgH4krJ1vG7DLoPXGZDD0L+8AWW/+ZaXnFPzYZdRih3G6qNlPWRlgWZmTUVn
         dxJg==
X-Gm-Message-State: AOJu0YzDvRaYb5WyKlj11qzM7RaH7jf9ECc1nwVVuUTGdVkLWkagBJoA
	rjbaFV6nbu54WAkEE0I4kLU7GCDETzl8+J9xzunC69Q8EInmq5K8KhJCFxsKrZgFu0F68uFc8m5
	fuGQp
X-Gm-Gg: AY/fxX6GaCsPpZoVCgxPa+rDaYe3FQRwRLntFQBFr5dZ1dCoTs2b8oAEunjgPhB+Cbp
	By1YxzVh+THqD0K/GEd2Fe8AUHwVEjTOgtCo8ecWr2g3WKtPzDh51drLcM5TmeIdCDB9+AeAOD2
	5a5u/3fCV2PRJGznku1aDMF8sPsiEJSNlF+eifiz/zog8teG++Leyw0huKo/B0qZqV7KkiqY7TD
	xf38PfSdensuaThcc9jYPNuol8hCfIKp0zz96lMb4H0VSzhvFbVXMTzWozju1X5X28zf6kQI+Xg
	gTpnr/Pzl8proELBkoJIIXIygsgl7v+Q5ElozvLP9Zx3VE/bd4bFXvoFpk5vOsJ26H8x3UrzfoK
	1Yoan3FQkUZndVmk5jA90cnam3o7MUqXk854T9EHH0ip0FLNSufuA+KyLrruIIEwopMAG9jr3PT
	XcAidAVsRNHrFQYyw+4w5zueZPWq0EjJCWIKXybyWURK/aMe7DDLGOdJRudkvHSyM2bql+xEoIx
	Ac9Er8RF4c9PxeXz7z7pEnN49awHJY6UGGTV+9+4BmuJP0yaHOAXm4sf1qvG6/+cCx9
X-Google-Smtp-Source: AGHT+IHtLRxqAr8qJuOhOS2H2Eu/nIU3lGzBvNv/pFDqVE+jFUtzMYwdmGyxlWmkPCfhuCjQXFTXuw==
X-Received: by 2002:a05:6402:348a:b0:645:7d1b:e151 with SMTP id 4fb4d7f45d1cf-6499b1836dfmr767585a12.1.1765535595334;
        Fri, 12 Dec 2025 02:33:15 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-649820516desm4935216a12.14.2025.12.12.02.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 02:33:14 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v2 3/6] libtoml11: cleanup package to adhere to the recipe style guide
Date: Fri, 12 Dec 2025 11:33:09 +0100
Message-ID: <20251212103312.2077322-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212103312.2077322-1-adam.duskett@amarulasolutions.com>
References: <20251212103312.2077322-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 10:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227582

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


