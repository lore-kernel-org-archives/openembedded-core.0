Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF6AEF900F
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:48:57 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23113.1772642928410754231
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 08:48:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UI/Wkwgi;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-40ee9b945d5so1344507fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 08:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772642927; x=1773247727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIWNp+jA9fLjpsXG4iRqhfv6oO7L/BK8ilevIn/RjTk=;
        b=UI/WkwgiRLuA0nMQe3wBhR/2xzbC53uA8KgXW7p8r0JZpNj7uPn7elHmKqXCKZKFvp
         JVlrGrjdC6iWYjnHf72EO5+HXRUoCuw+pMhuNSPbMF7mSH2V0rms6cH1ZdBh9DBxQvKV
         X9xtDFIo0yhUylVkAyA/Oab0MqR1Vs172DWmMWsm6qJZFC39yqRDcJy/xBzEw3EPTuUK
         A/Xs48LaYczCDFuJYErGmBOISVKWFG3PJXQ2kV3lQ9ARKbH+GLGGsoKCuHOSu4xCqkyX
         s/zABI+4kP30PrEJwYxv47hVda5/bU7UG1qHGRlw27Uo0fnjcKha5jVmY5WDPjXw4jVe
         iemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772642927; x=1773247727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XIWNp+jA9fLjpsXG4iRqhfv6oO7L/BK8ilevIn/RjTk=;
        b=dZgUxGl5bmF8N7Yk3/ja1tepF5hSf+VKJwta8Yu+IVJIyEXSLuUvUYS5OqAktfljFm
         3CDnhhWADNdA2flzr8QMnzb0aorEbTl7XCAaxbiLr/p/3w6K+tcDvcGoxeXu/zLZVQvQ
         Qvx6dLyBx5wjdEgrEnRGjU4TKopVjhSNVBYQFRhOqj1j5TRWh5lhKZCteJPSwoiT4JVk
         6ok0WDMQ/H4VQdWm09W4ngVAtPWbQ/zasJFAetN9QdBjdR2G7ElYjUwBUuKWmVbe1HIf
         Q104h5OkJbVsvpX5hvM54fLUKVkbz+Org2CrCSAE7s6EH299Ed/mbsb9P73xQfxbFWdb
         1R9A==
X-Gm-Message-State: AOJu0YwO2T38StBybZFwDVpx4xa0c9Ts14oznfKITR/qZVN7otUXjZfE
	eNV1BN27zWwsLPpDuJU1o8nwh7uGzud7X7TSPOttM5XRrQNS8ZnllAtYkk9iIQ==
X-Gm-Gg: ATEYQzyZ+1LbuStbhF91a5XlMe3PqYfDyeDMQF0e5nBgJKcMbib7T2QDeM5IJmM8Yvo
	TjKKixgC9QSfNxH94XY/xxjYdUNn31aYXvcTH26vYWEvmu9lksYEnokXNkH6xWwrkih2N1GNkJg
	7yl9ECIjp7lapZZbA+klhhRwVWDJyYga/S+9gtgpHcn61CTJh5YpSp0BpSwi082Td5DL6OGdOWo
	tlFyJTEiSpOoCGmuExoLm9d9RJ+bszNxj6CGm98p8nFUPbWyMOQQxB42WFABOgu86/Ujfp9/Ed0
	xWK8vtHTTY3xt5GRKhxauIVt2UA5WSi/CLH3ziM7PJ8Yk6ly9lfP+RKtne07XA0XIcrGF6+PKiw
	YaxuGL7PIihUZ1NMB31d01KKnpr1YRXAF5Ylv6oIHIxhfqfmL8PXLZU0kySocUzf+jDPFm72Ivc
	LNkPj7j/IPqcBk954cdLqVLDvxRXs4+Uc=
X-Received: by 2002:a05:6870:ed96:b0:40a:40d3:8727 with SMTP id 586e51a60fabf-416abaec29emr1989197fac.47.1772642927363;
        Wed, 04 Mar 2026 08:48:47 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::f681])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d2c9fc2sm18466442fac.18.2026.03.04.08.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:48:47 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 12/13] spdx3: Use common variable for vardeps
Date: Wed,  4 Mar 2026 09:44:23 -0700
Message-ID: <20260304164835.3072507-13-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304164835.3072507-1-JPEWhacker@gmail.com>
References: <20260303004550.650726-1-JPEWhacker@gmail.com>
 <20260304164835.3072507-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 16:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232401

Instead of repeating the vardeps for each SPDX task with the necessary
variables, use a common variable to make it easier to manage

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-3.0.bbclass | 33 ++++++++++------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 88b7ef9f42..6df66c193b 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -174,6 +174,14 @@ SPDX3_DEP_FILES = "\
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
@@ -185,13 +193,7 @@ do_create_recipe_spdx[sstate-inputdirs] = "${SPDXRECIPEDEPLOY}"
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
@@ -222,13 +224,7 @@ do_create_spdx[depends] += " \
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
@@ -249,6 +245,7 @@ do_create_package_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
 do_create_package_spdx[dirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_package_spdx[cleandirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_package_spdx[rdeptask] = "do_create_spdx"
+do_create_package_spdx[vardeps] += "${SPDX3_VAR_DEPS}"
 
 python do_create_package_spdx_setscene () {
     sstate_setscene(d)
@@ -270,13 +267,7 @@ do_create_recipe_sbom[sstate-inputdirs] = "${SPDXRECIPESBOMDEPLOY}"
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


