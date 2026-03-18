Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84907103E18F
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 13:47:10 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14442.1773841628123874849
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 06:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NFfVuXar;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4670676ba03so2437625b6e.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 06:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773841627; x=1774446427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GQr03avjj4R9pZ+lu2O4W8U9AvEqC/e3JtfjqlshRU=;
        b=NFfVuXarA1jFTY7izgzHmM3ysry32D8dZ2QzMJM28P9BDDftPaLFEVy8bTCtuWyUOJ
         dA5C9fAAy1RLDqc8V8fUUyrF2CirVbBd+zJdq3JEBtKFRpoRuRTROKvXP+mRZLjPinTG
         cZpL1i00p3nD0/HwX4DfQJwXvzvW6Zf+L4HRfQLwleodUwMQc/KgpECkZ9925Y5hgPbN
         +hY0w8neRKmRysLeeLv8JT/eVNOarSYWz2emqhRsvB7X2K+KolmGX4zPGu5DdoC/rMK3
         B8Nr5g03PaSIkTqsLnwY8QcMV3p7sBa7BUze7HPwkiaFIu7YiV2rjQh83r8+PyDIrR45
         Gptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841627; x=1774446427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4GQr03avjj4R9pZ+lu2O4W8U9AvEqC/e3JtfjqlshRU=;
        b=cOqdNMNq8ESBC9LjXXyXw2X4CAIhnb1QtDM0oZTPVaZ/hBNzbsGi5VZj0IdvVdQ0ku
         34pd1jq81xUViH8j9y2JEtT3Dh2PLapTMWHpaoi15GxwoMIKSgbVJMlRLDcAvNxbs7N8
         A2rQwWOP1SDF5/kPBMOxZETJpKxvzcPEBFrFNGOqTeOeiQKSULaxxyUIfEyDIha6nlbb
         iJRQzMl9oA2GBxyDJarZMdYPEuNZBAVjileDy43iIt5QsLWnaAU8BwPyAamvN6LFoXs/
         sldC8u80GDKDJ5lMEV+arSrQWNGWBY7NhLkWyY5Mjr7f4/7tCIvHt1QwyTf3vY3Bme7l
         12ww==
X-Gm-Message-State: AOJu0YyFrEbt49mIVbDL9nB1073nWFv5ibAMIx1oNdsdFn5xydXwMcm9
	0J72NFoJ/HrRVlcWaYPFhT+298ielPR0PXFWz6nr4EQaACh3aLMY9fnOfSC4Gg==
X-Gm-Gg: ATEYQzy63hc0q8IDe1Jw4vvwf8xOk3szxNxmZ12YJsbkycjG/4Iot7PVr6SbJFysmSJ
	KDFe/vMW9BEtbJfserfKAUjbjkhy6Tw/1TtsYfkQrXvThI3TktDMUmJif9ItsXYgJ+5uDvK3dVe
	ovIQ/5M6gy029LRmiJHDVVg8irRQMwxmufNrh0GBAbHws5GxHfj7Y3DNbbAvWWoO6SmRcGrwU00
	LjqOE5CHc85GlmizMa6XCdiMOC/X01MW0WRnjJQBuWo7uRl9QM3XxhI3b3COki9Xaw5jeDDtogY
	ZubmgBz8BlWFmhSrBcld66aLozjNEEK3NrtNAQ+59KDPYOHCDJiLKoCT+h5qZ4iiuGg65Fgepxr
	rTnLXo4bGy+/El7gOzxtBocrz1gcHgLvtsHjL0Ai2xT9eaUZ/562jYJdNZZBPRqWeGRQe9dlaAc
	zmjihnOzGTx79hx0hbix0N6wz3Li+lkHQ=
X-Received: by 2002:a05:6820:f029:b0:67b:b01c:5887 with SMTP id 006d021491bc7-67c0db41fecmr2309940eaf.56.1773841627100;
        Wed, 18 Mar 2026 06:47:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::8279])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c0d89c739sm1763625eaf.13.2026.03.18.06.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:47:06 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v7 09/12] spdx3: Use common variable for vardeps
Date: Wed, 18 Mar 2026 07:44:37 -0600
Message-ID: <20260318134655.953233-10-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318134655.953233-1-JPEWhacker@gmail.com>
References: <20260310184058.533343-1-JPEWhacker@gmail.com>
 <20260318134655.953233-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 13:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233399

Instead of repeating the vardeps for each SPDX task with the necessary
variables, use a common variable to make it easier to manage

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-3.0.bbclass | 33 ++++++++++------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index c3ea95b8bc..869bbd472f 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -163,6 +163,14 @@ SPDX3_DEP_FILES = "\
     ${SPDX_LICENSES}:True \
     "
 
+SPDX3_VAR_DEPS = "\
+    SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
+    SPDX_PACKAGE_ADDITIONAL_PURPOSE \
+    SPDX_PROFILES \
+    SPDX_NAMESPACE_PREFIX \
+    SPDX_UUID_NAMESPACE \
+    "
+
 python do_create_recipe_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_recipe_spdx(d)
@@ -174,13 +182,7 @@ do_create_recipe_spdx[sstate-inputdirs] = "${SPDXRECIPEDEPLOY}"
 do_create_recipe_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
 do_create_recipe_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
 do_create_recipe_spdx[cleandirs] = "${SPDXRECIPEDEPLOY}"
-do_create_recipe_spdx[vardeps] += "\
-    SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
-    SPDX_PACKAGE_ADDITIONAL_PURPOSE \
-    SPDX_PROFILES \
-    SPDX_NAMESPACE_PREFIX \
-    SPDX_UUID_NAMESPACE \
-    "
+do_create_recipe_spdx[vardeps] += "${SPDX3_VAR_DEPS}"
 
 python do_create_recipe_spdx_setscene () {
     sstate_setscene(d)
@@ -211,13 +213,7 @@ do_create_spdx[depends] += " \
     ${PATCHDEPENDENCY} \
     ${@create_spdx_source_deps(d)} \
 "
-do_create_spdx[vardeps] += "\
-    SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
-    SPDX_PACKAGE_ADDITIONAL_PURPOSE \
-    SPDX_PROFILES \
-    SPDX_NAMESPACE_PREFIX \
-    SPDX_UUID_NAMESPACE \
-    "
+do_create_spdx[vardeps] += "${SPDX3_VAR_DEPS}"
 
 python do_create_spdx_setscene () {
     sstate_setscene(d)
@@ -238,6 +234,7 @@ do_create_package_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
 do_create_package_spdx[dirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_package_spdx[cleandirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_package_spdx[rdeptask] = "do_create_spdx"
+do_create_package_spdx[vardeps] += "${SPDX3_VAR_DEPS}"
 
 python do_create_package_spdx_setscene () {
     sstate_setscene(d)
@@ -259,13 +256,7 @@ do_create_recipe_sbom[sstate-inputdirs] = "${SPDXRECIPESBOMDEPLOY}"
 do_create_recipe_sbom[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_create_recipe_sbom[file-checksums] += "${SPDX3_DEP_FILES}"
 do_create_recipe_sbom[cleandirs] = "${SPDXRECIPESBOMDEPLOY}"
-do_create_recipe_sbom[vardeps] += "\
-    SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
-    SPDX_PACKAGE_ADDITIONAL_PURPOSE \
-    SPDX_PROFILES \
-    SPDX_NAMESPACE_PREFIX \
-    SPDX_UUID_NAMESPACE \
-    "
+do_create_recipe_sbom[vardeps] += "${SPDX3_VAR_DEPS}"
 
 python do_create_recipe_sbom_setscene () {
     sstate_setscene(d)
-- 
2.53.0


