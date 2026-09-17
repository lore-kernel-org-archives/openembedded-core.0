Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3389C982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:07:53 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1554.1789682872505545381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vDZ1wM3S;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso1333485e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682870; x=1790287670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p1k89c+HjF1r8L1YEfsDallpilPWI6ndc4Xy6xccvEc=;
        b=vDZ1wM3SzsCVU4Ulua9xC/gY6mSUmWqRTSMa0ijVChHuRy6T2WuMvxhFZNl4K4x4wV
         ajGYukann7SGpV+FQ2Z3ndgeRhpVaBD18aXeM3hRHJ1y8Nr0nKo8bY1bsImH57oPXBuE
         tazNCuaakdWhl+Rt9mg39e8MPKoyBYU5DNqPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682870; x=1790287670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p1k89c+HjF1r8L1YEfsDallpilPWI6ndc4Xy6xccvEc=;
        b=nWUDy3PxZ0o9qbVQZNEaj9LLYFwuR17Z0g5vek3MDzdMQjKG0K2wLBxsQEAqn0L56v
         4U/buK8jWO6hSxRPKbW+rBL103azrhO1Dte5v+ASMZaQr1EDSZ9MiBEwouz6srjOJecs
         hrWrJVBrlSae16rD6fAYyHAhRCs2RTtZajGArxxAaB/rEYmsGUcsy8ahh7Q5xwQBLXUu
         GYVRdEf9D/MOO2j7DJnrGOmR3Osg9U2HBjytX8Qxn81TgZXr4Rp1i4L4RhIS8fSWLIiC
         Lj87X0/BoItq+3E3gmiYQK7Ysg59napaEu0viCTQYMWgyQxDtNUMHkUdYvvT9xz0OsbE
         ynAQ==
X-Gm-Message-State: AFuF++n3eloM4NoDGt1IfjZ1riIMoMt9dFvXekEkV/k+LRt/haZ24h1S
	Xb0e4qiAvITnjzyH6DQavWpnQVqzxhzBgTeEfy5XydTBM5cH8Mp2THriPud4LK4TGqo5ruYF781
	joizFF+E=
X-Gm-Gg: AYBFou0Y7DJKbEPIMLy0kpznNYMsR/BU38WOt6DMM8UbN2nE9Or8Gnlgf52V3OyJ8U3
	5EWV6tCCh7chC4OHhujZnoiVLDtdn+UZov5XwxNbG5IBPQRZUltoaObFzY4KaG8U8R4O3rkrth9
	pFXOH03C9u0ZT7caGZfIxLTboxe3yM6YjG8SeyrX2NLXeTHwncBH2tBbf1xC9OdkuvYMlwpWlsz
	ycv6JvnfbGSbsCjucVoeq5j7/2GsChGMVEftzWP2qgnO8gGRfNRfpUIo9EQIlsIpJPGS7H7oUp2
	qM8TZAwMGT/r1tTs7tyqzSUxEU5VyMKf0KwWM2KVyZNNBHBqIwvFxOZfMPLucvrsEXCW7pi9wzl
	hYTJxelzacG+3C02NgfVZawNlGpXQAfj1SOfHv+e15Tp7YsmGQJGA15eZq26audRI2ySa+8G/kP
	W/FEhedTro5Bi42nDa77u7MsNgNaBfsyYvjcT/YyQXz6pgIIKm01UtwtJ7XofSKZfILIA4B4y+G
	ytp/YVsJWrtKVy/nS6Ueh5xfhC6IIMsW4Kz7WqSKSWbZlaMJ9HbiFFiPCmSWvIpEFzg8gGYC7A=
X-Received: by 2002:a05:600c:a14:b0:49d:1e09:694a with SMTP id 5b1f17b1804b1-49fc568f869mr3137165e9.11.1789682870568;
        Thu, 17 Sep 2026 15:07:50 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 02/79] wireless-regdb: upgrade 2026.05.30 -> 2026.09.03
Date: Fri, 18 Sep 2026 00:05:47 +0200
Message-ID: <09f0ff20c780957661214759771b0345eeda66c1.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:07:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246097

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7e92e1fe36a5767a7b31d96b9897357e0aa28cec)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ireless-regdb_2026.05.30.bb => wireless-regdb_2026.09.03.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.05.30.bb => wireless-regdb_2026.09.03.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.09.03.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.09.03.bb
index e544b729656..ad84208f6e9 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.09.03.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "8a27bfc081bafed8c24dd70fab0d96f098e5a0bfcd08d3da672595f225ab8993"
+SRC_URI[sha256sum] = "b22e0901227b820cd1c280abe681a15b773a5103a5e10dc442e94ebb34cbf58d"
 
 inherit bin_package allarch
 

