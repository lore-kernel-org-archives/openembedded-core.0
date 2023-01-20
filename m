Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017E1C05027
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:20 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.82047.1674238270372454591
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cUlDOwCG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id 200so4581685pfx.7
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urLriLf3f4SoV8UtPI/rGAIFXTEMbllsJlQ0FcDbdrc=;
        b=cUlDOwCGxzOaIhLb165CqgYnFfSEaPIVKxS+g5+29CPbcZh6nrpYdyFjhc6HJMp258
         FYLAoXiQhlZzmmMLLyCZ7DnzKLDSLgvAdrKkl3IA3l1a7Fi7KPY6jIf2TTTu2We0MT29
         QODj0LkCdK+BXt9CDVjAo0kccG2MjFcST/auancSovlFr3b+3CE0waHSkbtleioGXlSB
         8nonQngB02vaycY8PJRrdAI4LNJJtgSrKYGGDfuG7zAMiSN3IcSBz6V/Qgv4kGJZbnil
         t0rkorxIGasmcUCnkQTCZmkRwnMg/wsElSPBi2C3mUDRtOWQeV6f39q+hSDW/MfkUuEu
         pFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urLriLf3f4SoV8UtPI/rGAIFXTEMbllsJlQ0FcDbdrc=;
        b=ulO/t0WE/pb9waE52TYVEOh+K7O5bSjE6YKqQvk7SdRxogHs1r/i1Z7Le5ouCJLwpF
         6wLcr0bJyYE/E3fTlbdVKq+wyXuhlbBdgSiLERw6J/vCOfAprq5mi/ldnHw1NXyPhsQd
         85MiP0PcAww2AX67Yc1XbC+HOiBe6qjgrfdekesku576FP/pcXvFwhGWAPS2n0C38mFy
         x0jsuOCPgRZFLkcYI3cTAKWXa+A7redOtvoQrcIaTVhajyobu14OzJuZnsLZa6nuoOCe
         oFxWG/hUgRK/EU0ohjxAJi/kaVHszedtyBqBWz9Yj8dn4VITbZq/aGBo/pF8ZRd9bPi8
         iG8Q==
X-Gm-Message-State: AFqh2kp2BuwSlf/yVFjiwP2sSnJrXH/xOXP8crDkBAW3qiBlT6YnaiCG
	gvtHuBPB+TXgJaD23zAUNQF51pBlLPGp8r6hQPY=
X-Google-Smtp-Source: AMrXdXv+9BsxiQ0l1031RYfCXIIluIr/Ch0jU4UEEiSURqvo8RjxEeh3mpm9zMPjQzj64D1fd5kkPQ==
X-Received: by 2002:a05:6a00:4291:b0:573:f869:2115 with SMTP id bx17-20020a056a00429100b00573f8692115mr16335859pfb.9.1674238269387;
        Fri, 20 Jan 2023 10:11:09 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 03/41] cve-check: write the cve manifest to IMGDEPLOYDIR
Date: Fri, 20 Jan 2023 08:10:20 -1000
Message-Id: <7d4179576c32c3464cb1a612840fd6aa37f7ff1f.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176209

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
(cherry picked from commit 00fb2aae22ce0d7ff5f3f8766fa770eeb4e73483)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


