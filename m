Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442D1C00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 09:40:10 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.41946.1674121199995087126
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 01:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M1IPdIWO;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id v6so4110550ejg.6
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 01:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D/DD5vmm8of9QPw+TAaE1xTmW8hM7ZgtSqvzKFTeyzE=;
        b=M1IPdIWOx07PB35BE/8nXlKDIJz+OuEQzrHMFVTdzK+RjAvuFv4uul7ec1IHwbsxuO
         Cq00aMvdC5bQDebyTv3bE4WHb0hzVmkTCSNoKCmgzrJCD2jAtSnXoeChKaH36hsu9Sbs
         05kGDUpT4ZW+J9O3wDlGBWo7XARU78kbTBhY8pBaAI0VhmNkb6Q4kIJhT5aG1Qa4X7vL
         JYeHB+wRqvqZt8Z4ZSA7AH2uJerRQZmB+cHH+w+Eo/0hkrw1OBFNflN5fwA+E5l9LX3M
         uJ+f70vrkfCv7/amWHitV9Ki5LwpjUxTU7juqrAYk4xykwTPCjTCCxyWWVkTPGOf+D4i
         vwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/DD5vmm8of9QPw+TAaE1xTmW8hM7ZgtSqvzKFTeyzE=;
        b=vUuyPoFfHKD5B0/rs/W7NmDfjRyidm6QBh3biGDi7LxunK152E5JLaLo3Yc2TUtUvR
         X/S/dvrzy7CAWuCwGrJLIelZJhigxfG2OkKlvZWEwPYcnMXgDntp6hRTe4rsb8OeU5nG
         nVqRMUXHSu+Gtd6dan6pfY/WbCk6YYdN5J65DMKdASpLlkooNhIyhURPSDn93Z7BQo7C
         rzJRTfXKP7BfnNKtZPNXrI5crG0SNegJVDfLIGfMNcSH3A6CcBWRInV2MH1ls9jkV/TL
         1L2wdX8r1uhA/oxtEQ7Gbd/Cuu4suW7JHwSCYujEGpClsW9nXjR1VieCgAQ0qVJTM8r8
         xA9A==
X-Gm-Message-State: AFqh2kpy55dHNfEMpy7cWyoIDJEeYqba6vQl/OLpgZqbakNK1YVx1ebG
	e/gT0GsPbZsyTCAVCQMtk1hicrwc/9Flaw==
X-Google-Smtp-Source: AMrXdXtzcpEpnUj0uSWFPwVEm2N4c4QXKu++H+h2VXp0wBFjd4fsLc04PEGtGeqNOV4OwgO+A+pB3w==
X-Received: by 2002:a17:906:ad82:b0:872:e6fd:1c79 with SMTP id la2-20020a170906ad8200b00872e6fd1c79mr10002993ejb.77.1674121198288;
        Thu, 19 Jan 2023 01:39:58 -0800 (PST)
Received: from NVC4181.nedap.local (smtp3.nedap.com. [87.249.123.12])
        by smtp.gmail.com with ESMTPSA id v17-20020a170906293100b007be301a1d51sm15864494ejd.211.2023.01.19.01.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 01:39:57 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] cve-check: write the cve manifest to IMGDEPLOYDIR
Date: Thu, 19 Jan 2023 10:39:13 +0100
Message-Id: <20230119093913.1403-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 09:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176130

From: Jermain Horsman <jermain.horsman@nedap.com>

When building an image cve_check_write_rootfs_manifest() would sometimes fail
with a FileNotFoundError when writing the manifest.cve due to the parent
directory (DEPLOY_DIR_IMAGE) not (yet) existing.

The image task will provide the manifest in the deploy directory afterwards,
so other recipes depending on the manifest being in DEPLOY_DIR_IMAGE should
continue to function properly.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/classes/cve-check.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 4fc4e545e4..87a59d5c6d 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -42,8 +42,8 @@ CVE_CHECK_LOG_JSON ?= "${T}/cve.json"
 CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
 CVE_CHECK_RECIPE_FILE ?= "${CVE_CHECK_DIR}/${PN}"
 CVE_CHECK_RECIPE_FILE_JSON ?= "${CVE_CHECK_DIR}/${PN}_cve.json"
-CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
-CVE_CHECK_MANIFEST_JSON ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.json"
+CVE_CHECK_MANIFEST ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
+CVE_CHECK_MANIFEST_JSON ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.json"
 CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
 
@@ -195,7 +195,7 @@ python cve_check_write_rootfs_manifest () {
         recipies.add(pkg_data["PN"])
 
     bb.note("Writing rootfs CVE manifest")
-    deploy_dir = d.getVar("DEPLOY_DIR_IMAGE")
+    deploy_dir = d.getVar("IMGDEPLOYDIR")
     link_name = d.getVar("IMAGE_LINK_NAME")
 
     json_data = {"version":"1", "package": []}
-- 
2.38.1.windows.1


