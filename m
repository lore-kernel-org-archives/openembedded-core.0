Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EB310987A5
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 16:44:05 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17646.1774025044703693453
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 09:44:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QpHx2QWc;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-829ac8d56c5so1859904b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 09:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774025043; x=1774629843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4m+clY306uBWg8tlLjv7fUQp/6bpYOLoTuuNdB1XtA=;
        b=QpHx2QWckBbyFKffc3zOj6l9vdgnQXRt2EdrAz8NGuEf9+TkCavGsx17n7x3R0LNOv
         O0AVeQ4DpY0yVMehhJ5+OuSKmYNN6YsfI0vmjt63dy+QI0oKtk/vPayevV0yl1AG63op
         52dmPgGYyK8CqA0v38SVjq42kyYMOmpSH7QVayDAcP3oGp9Um2G14iT+SJQO/MTFg7XY
         5Jy38hytmRTlJUOLi0X5BamGQGPezgUHGPdjyqBU9vgTyEZ3nROCiwuY8qxnNxiCmGgU
         +akps2gNI1PduDKdVysAW1ZRFKv4a8/oIzqQjoLufzRiwnveHZ5kCDTSXOIpK+EgTY4K
         S89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774025043; x=1774629843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E4m+clY306uBWg8tlLjv7fUQp/6bpYOLoTuuNdB1XtA=;
        b=JdKxbMidKESUQxT1W4Y4Rmp7Tj8eeWkWnsPa+P7elsFN2GW0pNffcMSnzwlraQO3cB
         R/VTzeu1I3RwsAfIHdMVVt3LuyO9q4jYtxkNKmcRVvKl5P2B8uRbl9brA4o/Nkpvrhfp
         8zAX7WaLKqY/cT5d0bBUB04fIUsuH+myC6mJvsP1U/8+47giHvxF1bAHxOBfCTaMIFFq
         GswCQ+0nFO9BvmrWIaHUn9XR5K0RTSI+AuLwKghheu8KJ1GAg7HkVOpThopsUP7QmTye
         wzV4QqaNncNGdjllw5MxDZM/o9bm7Udh8BfLUo0ceD77pXuE9bmMRFcyczd/2+sNzf2G
         cg4Q==
X-Gm-Message-State: AOJu0Yw0EtaneqJ2/eLoaiva33FgirCT5Lc/awxtiggiGMZ6d+bKUQ1F
	unOohpTekAiqjh7vgA3afqmXUb0zF3ps1KwVk7Z1f159vFNWZUv4DWiOLIblxA==
X-Gm-Gg: ATEYQzzRwzsDzpLNW7tM0uEZJF0brA9i9Qhvttzrl1Dq2pLy5npKyAPZR15oQBlcjbE
	CstUDHxBmRE/zS/fsu4CO6RJ8jVz+XyJf+Wsa57OwGasmgQgeKLM58v3Cqv5gdIviKKg83oIF2U
	3T02W2dbk5SM7BGQtD3BnkQN9qTzrzT/UsJek/J7dEL03bUAbJch7/m++fPGqkhjduTo0uiZCGp
	DXJFggRPckRQaAcNMaOa6FVFgZ9cetEcArrizXsQCnBnxR02kHVpDO1cnLXFDRkYd1VXKGHxF/U
	Rwr0FHC94U6c21Qo1MmDQdOt4f/+7O83boFfOI+WB6lO/w0q1JutJ9Dr/1+hDMuKgsVNW3XGhZU
	Jdq3oItpC4AdCoyQHmIuyQZiu1PDBQPX3HUdyYMnnlPH7OT9bBSwdB+Ei55bj3/fPQoZ8cEiZeA
	4KdzQv1edQzgM/IJT9mF4KWzE2RPIEropIrUxJBVJCmdV4u2U5rvDpLIeCrI9oxGnce4lAm6oka
	/LyaDydkoisA1pRa61vVQ==
X-Received: by 2002:a05:6a00:198d:b0:828:f1d9:22cc with SMTP id d2e1a72fcca58-82a8c234f59mr2982447b3a.20.1774025043477;
        Fri, 20 Mar 2026 09:44:03 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409f409sm2402379b3a.31.2026.03.20.09.44.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Mar 2026 09:44:02 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: marta.rybczynska@syslinbit.com
Subject: [PATCH 1/1] vex: rename rootfs CVE manifest JSON to include .vex. suffix
Date: Fri, 20 Mar 2026 09:43:52 -0700
Message-ID: <ac5a6479b1e481c4c5411ea069cf51ea4959e2a6.1774024001.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1774024001.git.tim.orling@konsulko.com>
References: <cover.1774024001.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 16:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233619

Rename the rootfs CVE manifest output file and its deploy
directory symlink from ${IMAGE_NAME}.json to
${IMAGE_NAME}.vex.json, and from ${IMAGE_LINK_NAME}.json
to ${IMAGE_LINK_NAME}.vex.json.

This avoids ambiguity in the image deploy directory where
other rootfs JSON files exist (e.g. SPDX/SBOM output), making
the VEX origin and purpose explicit in the filename.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/vex.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index 402d8e0d964..c57b8209c23 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -33,7 +33,7 @@ CVE_CHECK_SUMMARY_INDEX_PATH = "${CVE_CHECK_SUMMARY_DIR}/cve-summary-index.txt"
 
 CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
 CVE_CHECK_RECIPE_FILE_JSON ?= "${CVE_CHECK_DIR}/${PN}_cve.json"
-CVE_CHECK_MANIFEST_JSON ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.json"
+CVE_CHECK_MANIFEST_JSON ?= "${IMGDEPLOYDIR}/${IMAGE_NAME}.vex.json"
 
 # Skip CVE Check for packages (PN)
 CVE_CHECK_SKIP_RECIPE ?= ""
@@ -201,7 +201,7 @@ python vex_write_rootfs_manifest () {
 
     d.setVar("PN", save_pn)
 
-    link_path = os.path.join(deploy_dir, "%s.json" % link_name)
+    link_path = os.path.join(deploy_dir, "%s.vex.json" % link_name)
     manifest_name = d.getVar("CVE_CHECK_MANIFEST_JSON")
 
     with open(manifest_name, "w") as f:
-- 
2.50.1 (Apple Git-155)


