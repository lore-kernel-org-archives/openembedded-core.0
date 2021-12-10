Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBB8C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 12:05:28 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.6440.1639137926644486726
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 04:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gzZtsw70;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id q3so14547308wru.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 04:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3uSVBf5U8qVaCR7sGG3T3hUU8Y0nfgMBkDXc9i9DeVY=;
        b=gzZtsw70WTP2jhDLprmCDfF5s8t/H4aTJqn80zzyQHcff57+1x2X9tSRj2Dvi9L8bf
         esKaNWDJy+sKpZsL+X6b+yRohOp1O8p+jFpEEwTYLDKnhPx3fRM2R2tGOQapaXc45mW1
         sB/womCla3VYyo43JOD7uj7uogNwt6EW6lzoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3uSVBf5U8qVaCR7sGG3T3hUU8Y0nfgMBkDXc9i9DeVY=;
        b=HXLla0lPJsx/Gl1lsLe8KEUy7qzsPZC94MliN9u+WrojrGPvj0AjhW1WU8k8FAzEwM
         RLYwEmw6ckvGMWOUa8BrbT82FC/OTtcb0jquNAaKWmdA81SB71+CyEJ9/PWZ3SlpZVjy
         iMeYRLMZDr1P85JQJpZz1dj0d+5yDp2g+SYLFJoInYYQnxM8uA6aEhCTRrKAV7DP0c4C
         8yGF51px2zI0574kzJplWEeKLRhgN8a/IHCsVor/2lAdZhBUjK28uF9b4p0USOf8PDKI
         8EwswFkxCnNyqdSfptrxIzH84n4qwCnt+wMo2zdttHw4boAEZVuRwJqcX2MC1WWFmTOF
         a3hA==
X-Gm-Message-State: AOAM532EvR+T3nKiyhg3oOKWUgQZx4l2nM3W/v5Ig531D3uSLcthZsCo
	PG+EPqriOhPv8TpNRCJR5aQb1MLfacuYaA==
X-Google-Smtp-Source: 
 ABdhPJyQUHZ4c2goZSotITnVwMbOXNbZBm45KznqPBNzrrdyUNXJwmK32rPFz7KzHSluV3gkURrGJQ==
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr13540002wrq.210.1639137924873;
        Fri, 10 Dec 2021 04:05:24 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1746:a8bd:1fb1:93fc])
        by smtp.gmail.com with ESMTPSA id
 e18sm2413142wrs.48.2021.12.10.04.05.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 04:05:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf: Tweak for mips n64
Date: Fri, 10 Dec 2021 12:05:24 +0000
Message-Id: <20211210120524.670148-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 12:05:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159507

With the changes to binutils, perf's direct calls to ld break for mips n64.
We already have tweaks for n32 so match those with the ones for n64.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/perf/perf.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 7bbc1ad70c5..ec0c6efe15f 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -125,9 +125,11 @@ PERF_SRC ?= "Makefile \
 
 PERF_EXTRA_LDFLAGS = ""
 
-# MIPS N32
+# MIPS N32/N64
 PERF_EXTRA_LDFLAGS:mipsarchn32eb = "-m elf32btsmipn32"
 PERF_EXTRA_LDFLAGS:mipsarchn32el = "-m elf32ltsmipn32"
+PERF_EXTRA_LDFLAGS:mipsarchn64eb = "-m elf64btsmip"
+PERF_EXTRA_LDFLAGS:mipsarchn64el = "-m elf64ltsmip"
 
 do_compile() {
 	# Linux kernel build system is expected to do the right thing
-- 
2.32.0


