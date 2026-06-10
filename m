Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42CACD98D4
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:30 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33652.1781132123720861384
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pu3efXfu;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so5031962f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132122; x=1781736922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmexZbQtmTu+UxMcr76/aMvDGf1idNIoO8wWtMroHrs=;
        b=pu3efXfuk0GPUKqAwyeWlZcgxZV51GY3ljyf+ab3AYXf5R2pTnB8dDecSvyijuegqJ
         8RoXcn5ZXUdF6kAs5AEbtlK6Uiax5/AXgKGaT+P+kWOPwapSF1X2ggXemrgEeD40sUwb
         U7ppOM7h+pkrsohEQ3cp8rliR2qzYgb4VFVUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132122; x=1781736922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YmexZbQtmTu+UxMcr76/aMvDGf1idNIoO8wWtMroHrs=;
        b=O4m5Fphut0hrzbXuAejaNQt/9eCEXxJVFq8l5OtXgKjHwu+5RIjD/C+FY6vzmEjhdr
         KhZ1Ae92rQ6iZm+6p2Ue1dn6U7xPfB/pIzHADOLtAd4cI01fdpucpICI0eOTSWQOKKp7
         nC8Tq1m5wK8uTieEMqlko5hhKgD1Mnt7SIzU293nltKfc5XDPkWjYGssCqbPDr/uob8/
         mexfQcTdxh3TeEjNSYVBPBhtIAi3jpTzdFoPJYjCvUM3dtfNJYDREX5WD2ButLUHtstn
         v8KlPg25FKpUiU9Uv5E1t5s63YPjIySz4riYFr7PS3TvhmSyi0x1wtQOvdJD3eWLyofi
         UFmw==
X-Gm-Message-State: AOJu0YzUOchkayJIFEFWo8wNDLhLCyb1ncr9IPjM86ltoyNFHl8FOi/7
	U8jZZIEPaXcm4AM4UHNy5W2ofQHAisYFSyqNB3GmJNkTsKnMPRkdWNFTVuaTsm4ioxXF9YE4dNH
	FGUDG
X-Gm-Gg: Acq92OGSq3RpS52HXaSiPoRVt2GazABFw64gmt2hLGq42kMaVXCodEVlihljysIX0nE
	mPCGryWa2rX513XnFaP5x10NQL7nUNKLz0kms4gDFVBc5EK/YG+SGpvPMQCRnsBAqaxYUbZ2LNO
	LWNXuhKWgQFfz0i86UD8uHkHUgZ0DFZuyjk0N2uT+r6Bvh00u0Bc65huurTelnw7aiIaUT+ePO7
	6f67uGVmhmYdRMMBP8knxPXhce1241Pzf3VdONpC+ivPBghpzR8tsankkgvJ8mQ3lXRKb48ksVt
	meh6F0ClYef4xjovlnHUKdusCZLb77ebkhiagxkJfAcCEQGXb1DW7+FhpZF+jEV27ODcMSOa7GQ
	qQDVhVTKtI2W5vDCpB9L9k5TSle9pFNF31yB4NBEQNqZu58CW70uKOhaXlFu6URsdeojzWAhWPP
	DP8Nxb8gJe0upV5ZdyVDSvjbw9pc1ritHjgUcbwLWh8PbWoB6QxGfG4JQsLcBIBxTqeqFlonywW
	gKBysw/X9aUt4Y16N7LkvlABRa5aiE/BKn03Nk=
X-Received: by 2002:adf:f34f:0:b0:43d:7dcf:ae26 with SMTP id ffacd0b85a97d-460677b583bmr164189f8f.34.1781132122033;
        Wed, 10 Jun 2026 15:55:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/21] bind: upgrade 9.20.22 -> 9.20.23
Date: Thu, 11 Jun 2026 00:55:02 +0200
Message-ID: <736f6b50355081254147af7fd5f58536a256328b.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238407

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Solves CVE-2026-3592, CVE-2026-3039, CVE-2026-5950, CVE-2026-5947, CVE-2026-3593, CVE-2026-5946.

Release notes 9.20.23: [1]

[1] https://bind9.readthedocs.io/en/stable/changelog.html#bind-9-20-23

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(master rev: ef00c353d3c77fcfd70300fa25ed86555d011b34)
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../bind/{bind_9.20.22.bb => bind_9.20.23.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.22.bb => bind_9.20.23.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.22.bb b/meta/recipes-connectivity/bind/bind_9.20.23.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.22.bb
rename to meta/recipes-connectivity/bind/bind_9.20.23.bb
index 318412a62c0..ebc4422b674 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.22.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.23.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
 		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
-SRC_URI[sha256sum] = "cba92ff631b949655f475fe4b54290f6860fd0070d399f2279f6437c0d383ec6"
+SRC_URI[sha256sum] = "5d4475aed3f9e500ef554b2b14d972bdb83d33de214a9b3be92918ea46908371"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2

