Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9157E6B249
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:45:08 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88338.1766436307425921133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:45:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UhqJo8+c;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so834740166b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766436306; x=1767041106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkAtLSBoLiUNNWZD5x6IFbta0cIsgE9UQlWsgDR8EjE=;
        b=UhqJo8+cjsq+RY6iVGBg5g1NFaSrVwyrwmkQorwf9mO+1EbUwd1EHEH63BtUW8EY4E
         FRAPTQ/7k/3VxjkX6jsI0vyA4hUrATuXUE/YaoiJyx9ohWCdd4u2/CUQ5NLVB7jxustG
         bTC0purRY1kwsSDOpfBwW8/qh3/vI61xGqg6JRum0cAjkZIIxnUoiPbZvaOVoAklAx9G
         aDMQPnBUas5wVG2LTRIVXi4uXDmXy4PHuVh7bBkrCbLAqSPsLZj0YCqEmMg6I7w3/CaQ
         W3383JoqkmJC1QFA9vBIqmf6C+AdFnn8fdFlt6S2DZcelZslX65OstCFtn+cqiW1tAhn
         +KXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766436306; x=1767041106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pkAtLSBoLiUNNWZD5x6IFbta0cIsgE9UQlWsgDR8EjE=;
        b=JTdrZlC/LM65Vw0laWFGB9/4bLRcDJqhYHaXpHABkWHfrgL8eZdRcMZBISmJ841zwK
         w9rZ+3RLvFR+Rty0g9i6zPkZK2P66M0bBBBfy0zh0YbDe1XdZcj/T6I1vvhZIpgFeUAn
         bHeLS1bqgOwdzBEMbWytHdfCVF7SYpSf7i8FRkq4BkuIR0n5NjQx9IFroidsKk5Rp2Ty
         m2u8kRHEgkuMEoxprF30+iyJ4oXyD+UHBdwqId3R0HS/2vo3IBcR5BIBmjJbjFqe7Le2
         P6W3U2jykSzt3UYWeKDhoc4ErIiur0mRBoINxCn2FhlcrnQZPRkBd4+3F8OwwGektd40
         lgVQ==
X-Gm-Message-State: AOJu0YyGI6D318SGiuqED5y2eE2OjxzmwV8BuBKbsTBHJM4bSioJa+MA
	gPHskbKnHEXp/nOGujqrAhA3A2MuiM+bm3zdiqzUMJrKIU2FPjjlFh0y1Q8jPQ==
X-Gm-Gg: AY/fxX6m8RNOj8I1EYFKrLapgkJdYyTbygAhnxfRj2nZcnvuNkmPT1ev2TUvenv6MZh
	YYxIn/k43Po+yknowlL3bVYDtTkh8fyjkxtTBCPtzovaTde7yKC3FWXks5U1uq+g8OjnJ/aZb96
	wUTybuen0brJbJL64CEke69ulCVYKcazgGpEnROeKuM+kFLGDet2a/EluvdMDbQ7qDBMpEisyaI
	8/wh0FIyND2A1T4bBCgmmuF8aRCLemtnRDUaENaJ3RnD8onsdDwjgqnsnEl6vJ8G4qFKZZp75b2
	mH81m3Q0RyrbeUVSkPuwQ5RkGDPJRSPjOXLQA9mHDNHha0LRe17cLZNu4kYzCU0qKQOmDrKcpDm
	qS/kZCHoDfNBihidlM0BCB5wAcmi01jQE1dfHKraZ0N8NG8u8C01Szfi5PCi2T+aI/LJnNWNZuN
	eHISoEKp4/oQpokoPkTwpkNqLM/Ro0aMQB0O5QIbW3tR702o8=
X-Google-Smtp-Source: AGHT+IEmL2+2Vz0JxmLhvvYtxtDr48kiOGOkIipXi8ryW3fP8cKnNxBN47wxeYqD3OqruQ44hgndew==
X-Received: by 2002:a17:907:7f05:b0:b72:9961:dc04 with SMTP id a640c23a62f3a-b8036f86950mr1407918666b.28.1766436305605;
        Mon, 22 Dec 2025 12:45:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1189860066b.60.2025.12.22.12.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:45:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/15] xcb-util-cursor: upgrade 0.1.5 -> 0.1.6
Date: Mon, 22 Dec 2025 21:44:29 +0100
Message-ID: <20251222204455.2284529-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222204455.2284529-1-alex.kanavin@gmail.com>
References: <20251222204455.2284529-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228436

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{xcb-util-cursor_0.1.5.bb => xcb-util-cursor_0.1.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xcb-util-cursor_0.1.5.bb => xcb-util-cursor_0.1.6.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.5.bb b/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.6.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.5.bb
rename to meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.6.bb
index cd442db210..7c54f6d7a9 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.5.bb
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.6.bb
@@ -7,4 +7,4 @@ DEPENDS += "xcb-util xcb-util-renderutil xcb-util-image"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ce469b61c70ff8d7cce0547476891974"
 
-SRC_URI[sha256sum] = "0caf99b0d60970f81ce41c7ba694e5eaaf833227bb2cbcdb2f6dc9666a663c57"
+SRC_URI[sha256sum] = "fdeb8bd127873519be5cc70dcd0d3b5d33b667877200f9925a59fdcad8f7a933"
-- 
2.47.3


