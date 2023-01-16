Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D22C54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 11:46:47 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.164524.1673869603663789710
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 03:46:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=emT2iHAV;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id ud5so67492573ejc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 03:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xwNBABL3fGAWBqHEyj8HykRp7kuXrYuVKObHo39cEzU=;
        b=emT2iHAVsEzNX4bnxbifY2lwDF5tiHl9h9z4RA0ClHUVFPHb9j1cvrYZUhETm1ORL7
         Lub7+Ky5F/ajwfDbVk5vRiXLM2G0C4vaRd6kVfIexUztLUSmANykc/ndmKrHz418gftE
         llrHaGijWllGGGx5IkTiLRN1qUdX6VW+FYj/G7lu7xHoS9NQFKOkETbjlB2gVTRNG/Ml
         0xfFXso28EK5T1B0PNxrMtabVAxFBABBBU+l2LytiwJ1tnvsQT8BRHZuf61JBRbIGy/7
         QbJEsqv+nz6VO0UuGcLUF+4/z7PJKRzC4fHMpuU/kQz74S+T6KOfDCG85dziN9FtEWMe
         j+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwNBABL3fGAWBqHEyj8HykRp7kuXrYuVKObHo39cEzU=;
        b=QJJJHtUHYpIpVHDWltXM12CAutV8FeNElFU92d7WTw+8iNihjEZ/nUS1D4EUr1HHwy
         /h4mfU3bkEa2wSCPvfLsYnYANeJIonyiUrL7FKUM5y4lIW/AtEY/8zpXNOXRSPXDwjkd
         5GHy2Ii9sijcsgX8UwudqpfrlXP8hVhE3sCNVA/xhaTXpUfgV09Q0q9W3RZ79SbvEv2x
         10METPEJ64J3DnQf5wZ6fBeuxEQ3gdSNajX/eq9zfcSXdN9/1aRJB/TNpsah1KyQo3Sw
         enlysPoUKrfxYUEDzpQ/j75njh53rVEcSnTKm6X083WCjSacwfWt6ObSkUstONozCMPf
         Ky5A==
X-Gm-Message-State: AFqh2kqTmlUg5v2IIg2vEwhFC6Gg5Hp9whbvLsbeYhBvbYT3OiiLMNXQ
	uZr11SUkPMma+kc960jF33xf4WHL0+mDTBWg
X-Google-Smtp-Source: AMrXdXtFC9S3zfrrTFhk4EBq/ZhC1/gW7qeVmrUfujEI+dsbM3lGy2xBgN2NTrK+K4Fx2lVhnu4tsA==
X-Received: by 2002:a17:907:a0ca:b0:86f:1283:7b1d with SMTP id hw10-20020a170907a0ca00b0086f12837b1dmr5693833ejc.71.1673869602018;
        Mon, 16 Jan 2023 03:46:42 -0800 (PST)
Received: from NVC4181.nedap.local (159-210-178-143.ftth.glasoperator.nl. [143.178.210.159])
        by smtp.gmail.com with ESMTPSA id ku12-20020a170907788c00b0084d4564c65fsm9494567ejc.42.2023.01.16.03.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 03:46:41 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [PATCH] cve-check: write the cve manifest to IMGDEPLOYDIR
Date: Mon, 16 Jan 2023 12:46:37 +0100
Message-Id: <20230116114637.1838-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 11:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175976

From: Jermain Horsman <jermain.horsman@nedap.com>

When building an image cve_check_write_rootfs_manifest() would sometimes fail
with a FileNotFoundError when writing the manifest.cve due to the parent
directory (DEPLOY_DIR_IMAGE) not (yet) existing.

The image task will provide the manifest in the deploy directory afterwards,
so other recipes depending on the manifest being in DEPLOY_DIR_IMAGE should
continue to function properly.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/classes/cve-check.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 4b4ea7893e..41fdf8363f 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -48,8 +48,8 @@ CVE_CHECK_LOG_JSON ?= "${T}/cve.json"
 CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
 CVE_CHECK_RECIPE_FILE ?= "${CVE_CHECK_DIR}/${PN}"
 CVE_CHECK_RECIPE_FILE_JSON ?= "${CVE_CHECK_DIR}/${PN}_cve.json"
-CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
-CVE_CHECK_MANIFEST_JSON ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.json"
+CVE_CHECK_MANIFEST ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
+CVE_CHECK_MANIFEST_JSON ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.json"
 CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
 
@@ -202,7 +202,7 @@ python cve_check_write_rootfs_manifest () {
         recipies.add(pkg_data["PN"])
 
     bb.note("Writing rootfs CVE manifest")
-    deploy_dir = d.getVar("DEPLOY_DIR_IMAGE")
+    deploy_dir = d.getVar("IMGDEPLOYDIR")
     link_name = d.getVar("IMAGE_LINK_NAME")
 
     json_data = {"version":"1", "package": []}
-- 
2.38.1.windows.1


