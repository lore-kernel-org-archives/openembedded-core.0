Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B218C79FA8
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:25 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2479.1788641118423131302
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TmfEuON6;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4858303de5dso2674757f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641117; x=1789245917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GsPFdaWrb4UmpwJCIE5xLa7aS8XLzLljJ6Bam4ypQP4=;
        b=TmfEuON61qUQAETOaAdCj7hDauL6kiF8/WQbXVjljH9iexKhckk3frnr0VOCaTX3yi
         jBFelGq8tAD8iX+2c0aqsXhhmn5PA4vo/qEGMPFrV86v7Mjjy2TZnL/hyMSmbdanUjiJ
         6rWNF6I1hWW5pTdPKRsg6csmDhb1XKNZw0mgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641117; x=1789245917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GsPFdaWrb4UmpwJCIE5xLa7aS8XLzLljJ6Bam4ypQP4=;
        b=ADmLYPsrbEIevm+j0v7+JWAOgrA3mgBGyPI6rlwceOtpSH/gQnVzJRmMEY5hL3SflI
         pf7hkkXgXSbG1m2a1T2X4UmjbfCt2fCHWBRAo/+OGygeeuCkmhOKwpasXsT7ltPU0+FX
         HdT+rD3c21loZtslPMRRt3hD6ttER8TM33pe3oSO9Op0Ciq0S8MTCCu6LghAGHu11IzI
         ksoDetu89k1gxtrFbySSXwUprdEqNr/1lbtNxvrVR4/OAgV2+KnMRhpri7TCzTGfPIIB
         66zCmzhzIPeOanFz1fBGv2w4+TO6QuXxEELnhg5dATwAdiEEJXtkeyzKqhQQ0xYIUixr
         bg7A==
X-Gm-Message-State: AFuF++keXn96ZpM5srb2A4Uv62TSwzpnXao3eYXeuSf//cZhGS3rAW3x
	yP6unxpddOp1mQNbuB2Mhn2+48jyW3cdjSLg5AD6pjCu0YQEEmtkbgqC0zOgfNGe3MmKNaT3x4D
	SZnamVZg=
X-Gm-Gg: AYBFou1dyowxXd4xabqtlleuhvoQuVh5Bxg2Kj3QPWEbO3CSBLVyzgOvnBZ/cpgOah0
	SyrNHOyOosrqCuNAOdEJ6IKFV36yeI+L8mMoHnw6mGeA+iMkiJWkkPsq2pJ4aFtcSksH5/AJi28
	/in6c6ljkxr2EO5VsAKCq2mWlSjd+K1cL/Zs+tO7u61wvdWUJVVLvaoaaWfs86nssRR5aZLqtzF
	O0aNuCKSkWmzCCXsSyckfNSJYx8gswAi5zx6Rm5PyZ/E2DtOrGC6WIrxWYcZYKf6nG5XbA1Cm7l
	pTw4icHwZFTau/wC7ToNIxrtMDBP7P3dtOYyHfqc4Jor2gx89fYnM8+vk3OovQrIUTak/u27xI7
	RuiPMHWky7D5kw26TwDc5sBIBURE1GiiTVe7H4ka/shpzpf6I2By7j2VyvoVDmxxuR2vtJlplM/
	wuO3+Bvnoof1C6zvS1QVE/GEzMV9qXwZdsu5f+BLpv1IEyW2JpbWZLaH4a064wic9thOBKOaylt
	IhecQxZ0D7CqMLX3gi4yk/Dq0NtJ1Ra+/LFzzLUuZoY9Nu6o9gCyFx2lM44WJajFg==
X-Received: by 2002:a05:6000:1a8d:b0:485:8c16:a32f with SMTP id ffacd0b85a97d-4858c16a6cemr11053288f8f.36.1788641116638;
        Sat, 05 Sep 2026 13:45:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/40] python3-click: fix CVE_PRODUCT
Date: Sat,  5 Sep 2026 22:44:12 +0200
Message-ID: <a292a41c03fab1268d0406ec6a1e428ed460baff.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245163

From: Tim Orling <tim.orling@konsulko.com>

Recipe (PV): python3-click (8.3.1)
Before -> After python:click -> palletsprojects:click
Newly caught: CVE-2026-7246 (command injection in click.edit())
Status: unpatched (fixed 8.3.3)

Note: The original commit targeted python3-click_8.4.2.bb. This is
adjusted for Wrynose, where the recipe version is 8.3.1. The unrelated
DESCRIPTION cleanup from the original commit is intentionally omitted.

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 30357a26d7ce490725d1b0ac3375047d00595a5c)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-click_8.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-click_8.3.1.bb b/meta/recipes-devtools/python/python3-click_8.3.1.bb
index 1f42fe1a50c..49204e96e1f 100644
--- a/meta/recipes-devtools/python/python3-click_8.3.1.bb
+++ b/meta/recipes-devtools/python/python3-click_8.3.1.bb
@@ -12,6 +12,8 @@ SRC_URI[sha256sum] = "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2f
 
 inherit pypi python_flit_core ptest-python-pytest
 
+CVE_PRODUCT = "palletsprojects:click"
+
 RDEPENDS:${PN}-ptest += " \
 	python3-pytest \
 	python3-terminal \

