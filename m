Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C0610987B8
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 07:38:36 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7274.1774078712349373501
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2026 00:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D2VUNnmb;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4870206f73bso5763345e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 00:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774078710; x=1774683510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuC16S4Ez5VCB+TADjL+7yMaesf6i1h8m+LY0NdRykU=;
        b=D2VUNnmbFtTqSyb1Panz7ole8BpzC1B7yfiIKYNVppbeQubQjE8B1GpT//oPOpvAAS
         SUCbvclr8h2BSuaHr5ugybgeWM/RSwf1TKTnkR2Z8NStzWXi1GE6Kcz6myBt27FyL2EJ
         EH54sDWGQsNGh+vS/RX52PSvdN2EOBk9oCdkmfCZbPxK9KkNOehzmWwEafvHAM358Cp7
         RkHXDjzBVgVEWnFZhGFpx0cHLhMKtAYUaiGhUSm4PZvq4FVY7NNNO2n+ZbP/bs/w+Klx
         2Zex08+mY1tL0era4HMR5LrLqPZ38alegwl9Whf08JvrxvX5OiBnjAZmWGAJ+/ljdEn5
         yFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774078710; x=1774683510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RuC16S4Ez5VCB+TADjL+7yMaesf6i1h8m+LY0NdRykU=;
        b=OkZsYgd6Y6cvDvEbSi+9Zm68/YPBs5ryLO3978z0ROAPYwV+t9gYD7khodNzGWGQGU
         CmWspMkH+RgaTJRTCCQX2U9410fT3MUZs6iS2Tm0Wtym911ZNcD6ICRSkDGQDoCUAS9G
         6zmxfHNz2yg8W3XgedMGDGMEGvxgHtwEGIZyRaGSFr8TF1ijbRP59/godQwR32y4avFr
         J948bR80NAszNEK/YaVTM1q4JYycenxqWpZTpY9ObZxGEKNH62Bb318k33X/8mBrBVSh
         Bha1bJILnr/QfKCgVZmvP8ICwuQkTvaIsaS1/0Sl3PiFzE+qr+qPJN6bt3y7sOrrZOr9
         hi6Q==
X-Gm-Message-State: AOJu0YziX0NAehN68jch62izWWHR7ouXWtVuNXXwm33Asf3Q4HTatPy5
	v3ES/KLbUPbDrbFzpYswQ4t4P3advUA+jRGMACRMNMhn6iJZaimuLoi6ySuvFw==
X-Gm-Gg: ATEYQzyS6srVLwhsis12UQf0p82eqHy6JJVVe2l86hvzN1nrXRastVVk+kL/RooHUNu
	I2nlIqE/Zwbe11r8VKe0AjqdbUBpR1YcH0CcK2Hrq0lfirtfsJWbshwRf88ifRQN4aT5H3zS3sH
	XzpxnJ+lMml05fYwT9CGcXbphAC7lJBh+sbVRi8x1AZqjdTrD4qd+RSe8TwAllh4ep5sW+B0+ug
	Fu1yXL0LPSUWZSHNWI1soh3N72YSXXQp3lBvL/NYoDVmmuPNzDWNQalsqawe+UoX0UCQwgTKlSH
	+3gaFegK1Gie3Rn+RWhtp4kpG7lzqOuoRqnWeG5bi8cwmn0+g2P3wZikrapZKv2LhftcP6YYe91
	0JGxYZvTHg9krseUHymoyIdT4uVe7UUzjhtH57F/Du6uIodxz8rpi30e5XlG+CBogS0tHdsrVQe
	Q3MUPQ5Bl57cX3HA==
X-Received: by 2002:a05:600c:8b45:b0:486:fbe1:2499 with SMTP id 5b1f17b1804b1-486fee0d6ebmr75094935e9.22.1774078710302;
        Sat, 21 Mar 2026 00:38:30 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700658441sm149916245e9.4.2026.03.21.00.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 00:38:30 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [whinlatter][PATCH 1/4] gn: upgrade to latest revision
Date: Sat, 21 Mar 2026 08:36:37 +0100
Message-ID: <20260321073820.1403645-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321073820.1403645-1-zboszor@gmail.com>
References: <20260321073820.1403645-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 07:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233647

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 11acd84d42608ae8838506e2fbe27878b1429a33)
---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index d8896609b1..8637216988 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "81b24e01531ecf0eff12ec9359a555ec3944ec4e"
+SRCREV = "092f4f0d612e5982728c8b872c2e69cf3d04b21f"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.53.0


