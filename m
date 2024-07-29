Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A81C52D1D
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:06 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.55647.1722258783448391705
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xaNOxmnT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2cd34c8c588so1856624a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258783; x=1722863583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loSsdSCnBhc3p2Pnl1kV5T0ktXPAtBdV3J4zPCNaXCU=;
        b=xaNOxmnTR5H47Vsr0KqK35MHfQejCw785NsjCMN9PsoztZoVZUb1+lgnfeKMYrC9ph
         KpQnNL2YHXeWIxA41Ob23G1y+C8HeltRWEJxTPg4V4ZuZieAxrkf9bnULItBy4SozCGT
         76wX5lCXPEZkAFWezuVjV7DTY98XYQZMCHo8XZHoC5cMGzN70dNAT381mJ1Cmj0/Ne8A
         l37AGKpYHaG61ML3ixJxS/eClTNRFjsEM53Zg8NOEor6ISFoRILMstRZo04Z/Pu4jbeh
         Mz4tgQdDFCta4nEZ+4dJ7+UA9VI7gy2/M4s2/W2q8y/tS17EVkkJ5srRYYaRdbYIxgfQ
         rWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258783; x=1722863583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loSsdSCnBhc3p2Pnl1kV5T0ktXPAtBdV3J4zPCNaXCU=;
        b=uZ9qBp01VIoYrdU5krwL1BW7aPaW856BTuTv25tP38+krZLgFPlj1rTQf80tnUFdnh
         q+1YixFRKHx8hKwQ5OY1AXIHvS2wJWS/GtZtqlbtHKfcZE3HYCD6jAEZ1UqJGXERChba
         aTWPN9FoK42DJLsvy01KBbUwVkKQukMvpLTrTUdrTf9m2Cx+aApPfCLyyUrfJ+DeYVuO
         CzK2jNkXEvT/FO4pjXnAQI77YmOjc9Rx3NfxmzBBxsCFWOoyDYtFdkC7Q1nYX2h4dBUe
         80yjl9fGrUavmwMIM3/m3/JRnU5DEAoNd7YlI+PO0JpyaWGSKT9W3GYVQVRECNIrSLc5
         E5Tg==
X-Gm-Message-State: AOJu0YyOQLL4BqvhHAuKyTjcidqJMTQskR2yid0vtQHnpYaKx8nIx+La
	Lw4heqgSyzSq7LEECud96uAroKDaDTXentiGfRYNOjvob+x8ZmLjVB4FZW9KGtGGpSR1oQ8/BTP
	ac6xDdA==
X-Google-Smtp-Source: AGHT+IFzTpN6s/aoTVHSgakmGegvkSL5aaEBjOrg+u5upfAu2G+am2zrcTIOKIQ2Rhn+BcQe71iykg==
X-Received: by 2002:a17:90a:c7c5:b0:2c8:6793:456 with SMTP id 98e67ed59e1d1-2cf7d3e7c22mr5089672a91.0.1722258782684;
        Mon, 29 Jul 2024 06:13:02 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/37] cve-check: Introduce CVE_CHECK_MANIFEST_JSON_SUFFIX
Date: Mon, 29 Jul 2024 06:12:15 -0700
Message-Id: <0cb103430d0505a3cd135e727379489bc3fe6e46.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202619

From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>

The variable contains the suffix of the CVE JSON manifest file.
By default, this variable is set to 'json', so the current behavior
is not changed, but enables developers to use some other suffix,
e.g., cve.json (similar to spdx.json).

Signed-off-by: Aleksandar Nikolic <an010@live.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d99eee76923659c0b95bf9ef415ae5d44f736d01)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 56ba8bceef..93a2a1413d 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -49,7 +49,8 @@ CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
 CVE_CHECK_RECIPE_FILE ?= "${CVE_CHECK_DIR}/${PN}"
 CVE_CHECK_RECIPE_FILE_JSON ?= "${CVE_CHECK_DIR}/${PN}_cve.json"
 CVE_CHECK_MANIFEST ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.cve"
-CVE_CHECK_MANIFEST_JSON ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.json"
+CVE_CHECK_MANIFEST_JSON_SUFFIX ?= "json"
+CVE_CHECK_MANIFEST_JSON ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.${CVE_CHECK_MANIFEST_JSON_SUFFIX}"
 CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
 
@@ -278,7 +279,8 @@ python cve_check_write_rootfs_manifest () {
         bb.plain("Image CVE report stored in: %s" % manifest_name)
 
     if enable_json:
-        link_path = os.path.join(deploy_dir, "%s.json" % link_name)
+        manifest_name_suffix = d.getVar("CVE_CHECK_MANIFEST_JSON_SUFFIX")
+        link_path = os.path.join(deploy_dir, "%s.%s" % (link_name, manifest_name_suffix))
         manifest_name = d.getVar("CVE_CHECK_MANIFEST_JSON")
 
         with open(manifest_name, "w") as f:
-- 
2.34.1


