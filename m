Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D6DD5B173
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 10:20:54 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45238.1765794046783139949
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 02:20:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=qCutcnRN;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.54, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b735e96872eso64961466b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 02:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1765794045; x=1766398845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfbymjVqmTRLCGavhA4WUXJdBy1KHmliPei8eahndYs=;
        b=qCutcnRNhsJNc5pOvCLcH4EeIHqwpOBEJ1ANukvPJDR5G6QidI6hMjUeClxpc4t2BS
         lIVizGEhbkvXYXeQYB4kqhatmX7eE/zAhB8oLDDbJcrvikUwDL1PFLHyJcPjFWAjHZcM
         p/KzzsyRVXAFvtHyAiFFsof1/2uYbAh+nBo4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765794045; x=1766398845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lfbymjVqmTRLCGavhA4WUXJdBy1KHmliPei8eahndYs=;
        b=Jsx+qhLHcWydeVsWZVk+4zvPxJGAhU2xahsLhuC8OroqRA/+MLx5Cph8vIHq45Ya9u
         720Jv+/0AKtIb7xehkmGNJjpkg0oruKXIPPz6AoZfDzfmEAPDcJs76S4dfVlenwunvsL
         uIR8FKKfUNyVitPS3o/3ADw9+e+SbvZonmznK3u2ZpPzoypfXAHzwOmM6iO2x523iQdS
         jfRb5DmCvq77iz5zBJNIjuQEBnBWk0JdwKLfwIphbP7AhQrBqMPqhde8KKZs/QE/XIv8
         aYd1+33KtW7zKNO4sLYKIDTRMhixhfMLBa8hrcn73pqHZaR+FxnXudtJYFwIlpYAQpT4
         Htjw==
X-Gm-Message-State: AOJu0Yz6LPdIJgt122NGbVsid7TSS1B76CL+TbiBFf9qNuc9G7sHbcYM
	aXrZQKUOVkU3lNsoZio1trYMqXf+ldTHGRKZVua81sKCAOBOuf6QTVX9qOBX2/MEO4qtU2UcD3G
	Ddr8K
X-Gm-Gg: AY/fxX4COT8wSlQSkm5yqNkm3zqqpmnKbENTQzjjJNu7L5+MtFwYT9Sm6RZd+WFnIJd
	a+65wcl9gAHZXSP1qErP3rZLQx1eYUxZ2DWHw9hEjLbhI/4JVYxwTML495S3HhONFviGZPZemIy
	gehR0UKHc1yqfnkEp5jZ0lOMABR1wmP2btBlA44QxsQYniqGPRDzKBHom8xqH11ZPQQg0Zh8+zu
	HsWSvi0KbS80YRMxGhtxy/keVG/KAooPAsXlQsVoYnaoQ0+oabe9+1eZkY5AyCZNaedvFnK+hgA
	lbea0s6YFlNMtp2LWr78WW3+ZK61u2MCVKCC6h9ruM69dkx6+zXAxUMd7JQDjwbPp9QVr5fWLcF
	ar4tnjXJ0fxyTut7JwfxgoCZdEUrunxAbc5eAdboRmVifbr/nEyM8OosXxpyEvMSYqPlZjOG5ps
	7uXtfksBzuooMpwxOjc+pY0RGqOfqBA7wnEdUMRo3xYOumrYs7MzUKFpOKW5ELfIJFteoInojrm
	xI0MIQd/QR7q9/yc6ZsE8NFnMulgppnvF5SOyy8JE1GVUUblSaXXTMScg==
X-Google-Smtp-Source: AGHT+IGB3JxI7lGRnzuRztqZmlbisvIIM66mJKdDEjKgcrntNYowTCbbmS55h5kUmJVvU8GFA3kHWg==
X-Received: by 2002:a17:907:8693:b0:b76:2667:7736 with SMTP id a640c23a62f3a-b7d23b6fbd5mr638199266b.4.1765794044997;
        Mon, 15 Dec 2025 02:20:44 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa51757asm1357193566b.45.2025.12.15.02.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 02:20:44 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v4 3/7] libtoml11: cleanup package to adhere to the recipe style guide
Date: Mon, 15 Dec 2025 11:20:37 +0100
Message-ID: <20251215102041.1630567-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215102041.1630567-1-adam.duskett@amarulasolutions.com>
References: <20251215102041.1630567-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227719

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


