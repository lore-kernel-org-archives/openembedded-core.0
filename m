Return-Path: <Yash.Shinde.oss.dev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1401C61DC4
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 07:20:36 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30708.1787815227040082220
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 00:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PBRuLSDd;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: yash.shinde.oss.dev@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso550090a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 00:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787815226; x=1788420026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QUdUa7q2vdgz55WotowPvr2JM9OkjFSRd3qfoslTgWY=;
        b=PBRuLSDdTYnuHtf0x4Q43GvBBO9tJE8vnt6S6hPefJO5dZaEF8ciiyA7gBsIXyYaa9
         ApaAePhwmQXTAZ8dKlc+TZY0793NhyJICD7Opui5g6rJdHDYO7AIhCGdZ95vOeS02h6E
         AzwUT+Q00BM9Ou0l9d25MML+10+FNyKHTmhXZITDH44ENIIHac3ivJZ/lqDE7NbEnkJE
         jN3OMzKBDynX+rL9NCa7ar9F3Lg2NFzKaCIl0mWoZ7K+xHRA41K63o3liTptsof5fukT
         C+k34VLyQ/uFAWtjpuNS+8Y7148FAtOi4c7rRmuGbISpNFvDRpKRBPGAQG3FLUgegemx
         zzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815226; x=1788420026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QUdUa7q2vdgz55WotowPvr2JM9OkjFSRd3qfoslTgWY=;
        b=rIOk70f/2WJ2tLg4yBVrgJtvZW2fvtb9e/jTLJ74+FL/zZUiBUu13DND7Q0j1TYZH8
         nBM47xb0Ju+8ssvfPA958zwnpqV+Ur6K+RhGmJ6TH7LHr47X+tJaqyV2WDVoiSIi23mz
         KcY5OtDYXbyrb+ljyzVVpCom1EVfTFrll0F/ABVirCNCjtNigNWnudc2uWtAWSViXXqI
         0/uOfqoFYZyqgKGqQVBoNTO2Pkli18Oe8qfUBYbP0S+su7EC0gH7GGFt6lTD88YHou9E
         594cuL+Zu/4o6YlurPQkuUFA6X9SvOY6zvzqVFNMuAlA2ppiyjxFGsFr1/TOB2u8Sx52
         +eug==
X-Gm-Message-State: AFuF++mNDcGetnP6kv3mZbkIR6HIiYSy27V3VzEVeCpjX9EVOTGhFnE/
	GmElJkg3KMBCs7f8pPDvVAsxSPGnEcvE3zCiUzE20e8Xfpn5xFlccI1JXvOaHg==
X-Gm-Gg: AR+sD11I8go1AmoN7KZEfTWNcnTVMfqBQWBoiquscuSTAJjt8c/o0aziQNrx1ZuTLl8
	5wpEflYXcDOU7ObBe01vg94oKuFqXOscRv+gO0dEfOAigU0qjt747dyXm2R3MW4Mo02sYrEU1yH
	NjxE/6C7LXu/ORBGBbJBdCsjbyUyjcps5c/Tqtye/xuHRHeooDd8jM1wFh9fXhdRRDKZypIIJ+j
	ebndvjnVUbQyX4qnOaUuprIJbcol9K+wIe846MMhu4o28GhPwhyd1VU1z5UlfIQxnH549akcrnw
	68KWYN8LlhVoSlTSvF8vVdwiGCMi7qjpCWPz4k3T1x7Kh3THO7v/sdpnwIEnf9pUlbcGyWqfaUQ
	EihWZqXs4hkR+bYOvUOAIde73VgnDwstHqakz1poHtg3sBBYvbNbpYcNrDPmkjAdaEO0aiDi3uJ
	L/zAcwei+Kj/cHPCOjNj81QHUqGpbRL/NMUkwifdzKYHUuPsndAD9MZcLHCMUZUqEcPpLLKgSSe
	tT6fz2htw5ghe9EF15SBckMDMSlQJyexCd4sC8UbClnATefvyM+Fdz29iTBFT/I/7Q/+noaOKZe
	/Soh6wda
X-Received: by 2002:a17:90b:2e41:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-3969bc7ac49mr6694639a91.18.1787815226259;
        Thu, 27 Aug 2026 00:20:26 -0700 (PDT)
Received: from QCOM-V9bhWph2GA.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283fa89e8fsm22860700eec.8.2026.08.27.00.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:20:25 -0700 (PDT)
From: yash.shinde.oss.dev@gmail.com
X-Google-Original-From: Yash.Shinde.oss.dev@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
Subject: [PATCH 2/3] python3-scons: upgrade 4.11.0 -> 4.11.1
Date: Thu, 27 Aug 2026 12:50:09 +0530
Message-ID: <20260827072010.394532-2-Yash.Shinde.oss.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827072010.394532-1-Yash.Shinde.oss.dev@gmail.com>
References: <20260827072010.394532-1-Yash.Shinde.oss.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 07:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244462

From: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>

https://scons.org/scons-4111-is-available.html
https://github.com/SCons/scons/compare/4.11.0...4.11.1

Signed-off-by: Yash Shinde <Yash.Shinde.oss.dev@gmail.com>
---
 .../python/{python3-scons_4.11.0.bb => python3-scons_4.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-scons_4.11.0.bb => python3-scons_4.11.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-scons_4.11.0.bb b/meta/recipes-devtools/python/python3-scons_4.11.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-scons_4.11.0.bb
rename to meta/recipes-devtools/python/python3-scons_4.11.1.bb
index 585cad271c..c1c56856c6 100644
--- a/meta/recipes-devtools/python/python3-scons_4.11.0.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.11.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
-SRC_URI[sha256sum] = "5ba48f9e2eb6b9178cabdc9893792418e6970c84f43f4b027e4468e20616a89c"
+SRC_URI[sha256sum] = "4210d1a80a62e986029208117991b6347ccaaaab37b67463a3ff31ee065dc487"
 
 inherit pypi python_setuptools_build_meta
 

