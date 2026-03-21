Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3648A10987BB
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 07:38:36 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7275.1774078713182489220
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2026 00:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RR2o4ubi;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fd27754bso17478745e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 00:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774078711; x=1774683511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cf2/JVv7cm96CQx0NqxTKA1blT/U/CiA+J7PSodXyWw=;
        b=RR2o4ubitvV8ju1BKnQbw7TklFq+eLepMwXv4pXhHdgXgrQSB+99qoUn8jSTIonoof
         hU2FuU86DVaq29YPLmQKUB3K9w3P+5kir6WAw2cPRlgPMXP70KcyOkBMF6Mh6T/4/18d
         RtXUkdA+obUv5nwjeEvLA8uY7QSXQWc0wv5XPMv1oz+mZF2hyzo9Y86LjWmfQZ1OSrct
         PsVnG4aUUfMGSAS3/86sskJBMxaaIuzfZYlR59cO90cZgp6FjrLakevuFamFc1W/eNa1
         6LvKSmUCYMhkiZUKcHD++kEsl+px+D4bizbc5iz1532FQDy4Vr92c8xK2qIyCkovKFTC
         8Xeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774078711; x=1774683511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cf2/JVv7cm96CQx0NqxTKA1blT/U/CiA+J7PSodXyWw=;
        b=Ju3xAig2NDUVAznTIqen9bNUHllbDn01p5UVuRG7sMOh4CtHljYcQV83eYlx5O7DJI
         jNv6m37qApUx9gSIThLaDC0T1g+sZxpZruH5wpMp3alyWmZ19dovam2W+792xVGPdJwx
         y3sU8Asc6bLZACE5gfzef9i6b5ylUrMaH5qC0no1mRdOs8SqSm8nsIw0mrh20glsmLje
         t7jBfzEz8Bx1H2G+R4+shJ7O2bBnEIwxzoS1ZVA9s9xra0+PARt2TAKXkAdmJDBbwaU9
         rgowSYdhGaLVOpNqHW2TG+2ZMrxo7CbP77B4pEnvIGzEKWpsQeZNCqmOR+sQP1oDleZe
         49ZA==
X-Gm-Message-State: AOJu0YzoOvUOp+jLbsWmiJ8FGHXfCuEnkXaB57Oe2kO5RosLLscYxdUV
	TSkTMt1OiFdJDYt6d9AlTNa7xgAeYmKwxKHZNqO4K9juUYRGl7wsBDjjkxTYzQ==
X-Gm-Gg: ATEYQzyfaIeuKhQ4ijloWUwYIOpcmbdFt7+0YzvKewUEpYwDmg8do94RQKbRVgvbVYn
	mLMWtq3fs4mkhJX5e5Rh0z/mcQ+EXpsUg6WTDTdf+ZX0WllodKdd6+pxBSszdSRUAVSt54q0f/a
	NnG6y5gpf3i62QREIPoNU0nRhsxeXullK7Ugw9Pkf+meW+0sM2DLzxF9LX/2nauxfek/XiToNAw
	0ZSpWwNsPdNIAZLjHdLyRGukcGLOGdscw0iClZu0Hu70NVGNUhafxTTKs0oEDdo718pwLHNdizk
	FFS+D8Fqj08ZMLRWfnA8RkHQSu0L/zgfENalndrVcWgJmVm+rGivdjK5ypg+JyfrlMWL9CExHmz
	uGH9Vpcxp57V9SmGUkO7U5g4FG9dbzL+cy1SRtg+FeWOQwghi/lmV5jG4dsBjzs6pJAwE16QeOh
	c9Su5z7kguQktlkQ==
X-Received: by 2002:a05:600c:8b18:b0:485:3dfc:57d with SMTP id 5b1f17b1804b1-486ff01ca8dmr72584145e9.30.1774078711190;
        Sat, 21 Mar 2026 00:38:31 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700658441sm149916245e9.4.2026.03.21.00.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 00:38:30 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [whinlatter][PATCH 2/4] gn: upgrade to latest revision
Date: Sat, 21 Mar 2026 08:36:38 +0100
Message-ID: <20260321073820.1403645-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321073820.1403645-1-zboszor@gmail.com>
References: <20260321073820.1403645-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 07:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233648

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 67419b9a5a03b68bd5df0b080f923b1e513e4537)
---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index 8637216988..e61f3936c9 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "092f4f0d612e5982728c8b872c2e69cf3d04b21f"
+SRCREV = "64d35867ca0a1088f13de8f4ccaf1a5687d7f1ce"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.53.0


