Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A2CD2ED18
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:26 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6488.1768916300248772889
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mMV/4bt+;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47edffe5540so46723355e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916298; x=1769521098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxFzTdELuvDyhxJP5nyZKkd9y3lisDk3ncC6TvuEu2Y=;
        b=mMV/4bt+g2KbI1MmDP+Ji61SilZompVm4VYevenrqBV0kkenweQUGXFvynGL36PsPz
         ZmY408v+oQanutjiIKDcqiM0mzsApbl2qD19cp1BEH5lTXdaG8kPXj0cfJKJMpjeyRsQ
         8Og5FdNr/okurrnotiawvrz4KxHA2NLsci0Ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916298; x=1769521098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CxFzTdELuvDyhxJP5nyZKkd9y3lisDk3ncC6TvuEu2Y=;
        b=u5mpo2OS09osHMYfIAg8MkfSapWooiWgRJ0hKLFrFayFXoU6Pc+fzvH/+4TPEABrV+
         38YCyH0PJQcxa9LoVTSGxqauTgGs+82fMnDXF3nGR7h9HpnzajyrnVwRcGFGvfVnLAA6
         mNUCFK/o5G3R2RUNkIDpuGjpz4zEm2uFREe7HFmCiktU/NfQOV5HCDUqIq814n3Su4Up
         xGO8yFzRE18OVDkMuYwUcdbYKvNHuDR6XxNqqIs0Wi3mPFRWKFcUHjQ2wbve+VMHbYQX
         ULKAwU3855AlwCxCEzZ6r02crb0xWNiiUDOJPL7YEdUUzAPVUCw6FpBNoBUWu2Sl8kzf
         gkWQ==
X-Gm-Message-State: AOJu0YzZ9fOfurqCxROdaiJKs//nOov0C+p9oRoKvvGfMqi14eBfIFyz
	4VFT/1k4I/3v57LuX34HcE8LPH8ri0Z5KeRPiQ9M5NiPKA8HXFLU44Jzn2FUNPv5oHqLA95SlTo
	Ubmsf
X-Gm-Gg: AY/fxX7vvb3SpzogS3bx+/ixGkVyVY1yVJ4EI2Idw3LqpB8wqqFmh0Neycv6emcu/Mq
	j34mPgJY9vLgqv0h26oh/ouhKaoGG51sBmiqFy4C8/Ay5bT5HUr2w9OEKU2YnxK/JF9QIL6VEeA
	P2V1F5k/t3Ny3t+kDZl3USMqJvk7rsdaNEz+ilfHbEGgju1b7YPMPj400Sk3pDsrgSjocHKmdUH
	k3n2GrSwf9nO0vELSS1/zKW/7+iepD9BJ+6MDNEn65wLhDI9etKJNJzzU0M/34xz9M7lCTNgCmx
	IdN1aIK5COE7XSV54dYZl3Z06cXcLYlB6cSk3hPv4cztSVU96C77ed+eVvTMhQJidHrKv/QgQpP
	HoWPcLpVyq21FHnhh7KBSvlYbtQaQdI6u763wIqRfaCm4hK0WwxvUxsHvhyhGSRz9kiP0Mltese
	P3hhmvJ7FG9uxRyz9j7xI1C+Z9RrRITayXL6dnwGjhaxRLsM0cr8iYNa4na0i/5zaED5ZTYofP6
	gQD74jwxmJmqtSAStbzyA==
X-Received: by 2002:a05:600c:8b75:b0:477:9574:d641 with SMTP id 5b1f17b1804b1-4803e7e8531mr28254215e9.22.1768916298438;
        Tue, 20 Jan 2026 05:38:18 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:17 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/26] pseudo: Update to pull in memleak fix
Date: Tue, 20 Jan 2026 14:37:44 +0100
Message-ID: <57d6e1370748d227d8cb21ca1a04b470a345c383.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229728

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 42137b6f97da0672af365cd841678f39ce5907d2)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index a4053ac2b3..4e31748cc4 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,9 +12,9 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "b4645cb30573c5b3d5e94b9d50e1e2f8beefe9be"
+SRCREV = "d1db9c219abf92f15303486a409292237f1fc790"
 S = "${WORKDIR}/git"
-PV = "1.9.2"
+PV = "1.9.2+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

