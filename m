Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45448C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:02 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34927.1788788161505748401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jSl85l8W;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48444ec4fe2so2150252f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788160; x=1789392960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hkRY3tJ41NlrnUvTjKfEAHj/lfBCKuSlv55EBnWIoCY=;
        b=jSl85l8WnoOkpN3j1noyDZv9JklJxVNJJFu64YjQbJSDb/WY6S4g9MBf9Ps03M0FPG
         vQs7Xjo1q1I618LyHeNuOfpKf1ek5Lx+rOJi8b5VoAZRfnSvKTYZWxwpgfg7U4oU9IH1
         HrgChjJnuTJJAr+6J7IWbALgVHweOVDQS+xgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788160; x=1789392960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hkRY3tJ41NlrnUvTjKfEAHj/lfBCKuSlv55EBnWIoCY=;
        b=TkNXoknRIbeXJEALE/6F5As6SEdf70PcqrMerr0BWMJAdMI1jw/7wiD7J24sUCR3M4
         /9ANJ0pqHOTiqe7V5+63kXGDMwNmJWAJCu0saC97UJvQs5EqQVhUNLWQ3Yw31cryH8b5
         ZWIaRxrsU4BCrdzekjs/ayUcZtyUdgX9hR4gLKIpgZGvqRpYZWAH7WYYohSCQkVaT19Q
         V3dy79y/BgIT3dcGOU6vTPkN9qvSzVYjx9obU5ygSK+I8d6gAMxl2EpoaPIc0HmdeTas
         JwXWP+erJdmHIW2nXB7kHYduEYDwZBaspq1bd/dw1hadfVwLACSZ2Bnw0aY9OQ5IvF/O
         r6PQ==
X-Gm-Message-State: AFuF++n+vxzJzvWdihmckhzRiMO3gfkTUBJVevLeB3EGCNoQQFe8+rBM
	7z3EUAPsroQf11ECuUeaECG/RgcqkyGvizJLPuLownrVwm5yNbacI1BVoyzY45Lxl/tS5Gz+kdY
	yssPkSRI=
X-Gm-Gg: AYBFou1rP5mDan89Ied4xjVUMj6WIlixf4mgwLkZvYzyqYZTOwkjBmcznIHlS9NhKA7
	+lUbK6PAM68deeXYv3sK1eU/az5L2xFDWvDPQAtyTsHFJwLsbAJWaiVZOaG73qFNnuRxwUsecB8
	RchtgPUZ++Jtsy2CeTJlcBzsxA7v1QEjxGosZko8bSo1Y90H6da2rxgirOYWhYNv71MhPNEYkHB
	iZm6hqyvJFZIsLFR7wGqpFcRVAcULsyobyEBMavvOX87W/5rtELh+6FAR4eX0bnF4RuTDmmNmNO
	5JUpv685EmvMnRZ2Ji2uTLpH5JKSMCjg4OMX9XKfnSyd4DmxlfcdfgcR5Bcvooz4Ys7HAznl+pM
	m+NdM0PKLIU/WBMcQC8IccJD4U44uEKXj30mdwD4/Q/GAuOvKKce1/gYbF7GAwghzHTgyOJLj7L
	OQ4XO1xycY2BV7UmjAbtJcAwEDaqaLBjI0J88Rm2dfcOpjiBP1jJvyQKlr2Fgo6ksyICOU0s4BR
	WMUPgaGjX/vfJC8rMc8Hi9UUfKm3bsuLiU5Mm+NT6JhWhrtS9hMDw+j/l5MKzodJg==
X-Received: by 2002:adf:e19e:0:b0:482:dac8:cd0d with SMTP id ffacd0b85a97d-48587288cddmr48720283f8f.21.1788788159669;
        Mon, 07 Sep 2026 06:35:59 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.35.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:35:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/35] python3-click: fix CVE_PRODUCT
Date: Mon,  7 Sep 2026 15:35:12 +0200
Message-ID: <0aa95f67c7e0363b59faa9d9bb60ee7c2d09b137.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245274

From: Tim Orling <tim.orling@konsulko.com>

Recipe (PV): python3-click (8.1.7)
Before -> After python:click -> palletsprojects:click
Newly caught: CVE-2026-7246 (command injection in click.edit())
Status: unpatched (fixed 8.3.3)

Note: The original commit targeted python3-click_8.4.2.bb. This is
adjusted for Scarthgap, where the recipe version is 8.1.7. The unrelated
DESCRIPTION cleanup from the original commit is intentionally omitted.

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 30357a26d7ce490725d1b0ac3375047d00595a5c)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-click_8.1.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-click_8.1.7.bb b/meta/recipes-devtools/python/python3-click_8.1.7.bb
index 7d91e1af838..b75d9108893 100644
--- a/meta/recipes-devtools/python/python3-click_8.1.7.bb
+++ b/meta/recipes-devtools/python/python3-click_8.1.7.bb
@@ -14,6 +14,8 @@ inherit pypi setuptools3 ptest
 
 SRC_URI += "file://run-ptest"
 
+CVE_PRODUCT = "palletsprojects:click"
+
 RDEPENDS:${PN}-ptest += " \
 	python3-pytest \
 	python3-terminal \

