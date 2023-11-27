Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19AFC0755A
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:18:17 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.91952.1701080287661721404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:18:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b6644rxh;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a00b01955acso575220366b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080286; x=1701685086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbL735aln9CB9UQe46nDeOtD2f0IHeniFx1wjQVuMhQ=;
        b=b6644rxhfrpH897OBYnI0QeiM8epPPxECx/mojdj13mG84CyaCFiLr0kIXn1m4+kiO
         AsZ9ZbVkDqrUzYJbt5/A36lWXwVyMPw8XuREAVHmvQL7P6dAbVs693rGQws4UPTS06ir
         BPczC8gpgkIWsYcqUDcnnsUth4JmFIyI07saiM0x4ag28qXplGP+jS0RjnOuIWkzW47a
         dVwFrjLmDk9XSzzydilS3Ls/kmTQAm06FWWvuOrhve/5Mwz8vXQRZG40d5aMWWB2P52g
         Nr6CmOo3pMpmQb0cfCErHgbCTI3ua6WEe+KtXVyWtI5xb+LK8Db2ZZfM3QD1nX31Duak
         JmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080286; x=1701685086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbL735aln9CB9UQe46nDeOtD2f0IHeniFx1wjQVuMhQ=;
        b=mfDsyTkN7N+DCHISlkiGPO1cddTJ+ntrnGGINdnBVpzyJ2z9pliCjoBhrxVXpCwhk0
         HIZbfnlYIToUDSUnt7Bxs2eme57lE1DnAloRi9Ks6i6WFHUOfRoACBtW3ALM3Eitcc8h
         E9Ch3V7KENken3KpbFyj8ODVS6hegSmaPGJWjpNbAEVsCiqmkQItjhQ3encSz+U9jBDq
         wF/H+zna/MkS5EtjPP3bSDwFLJfFcTful5jNomV/qiPImDhz43lwx0oP/cYmb4MVcE1E
         t+KuUWYEhwvFQ5YwfpQt8Rdj8E5k62FWL8uY+8ywp1BwvCXQxBXblwcwcwJ/LtzVSBuA
         csGA==
X-Gm-Message-State: AOJu0YzwD81Aj8O950+P8XZFiulPlHqgcBAGg82tmZtZaorL6tOXqaiq
	OliaTOj465OpM7mif/1YXyJQVX8r5R4=
X-Google-Smtp-Source: AGHT+IG1wuRnqFtvLmLc22uyp+gAGq2lJczkLAWjq1wIh6EhYr3t9A5VfFqYimQra+iZGqnc0jKLIg==
X-Received: by 2002:a17:906:2cb:b0:a0c:d99b:7ad with SMTP id 11-20020a17090602cb00b00a0cd99b07admr4066593ejk.23.1701080286109;
        Mon, 27 Nov 2023 02:18:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906585a00b00a0bf09c9483sm2757203ejs.35.2023.11.27.02.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:18:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/19] libxkbcommon: upgrade 1.5.0 -> 1.6.0
Date: Mon, 27 Nov 2023 11:17:44 +0100
Message-Id: <20231127101751.3187950-12-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127101751.3187950-1-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191279

Add bash-completion support for xkbcli.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxkbcommon_1.5.0.bb => libxkbcommon_1.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.5.0.bb => libxkbcommon_1.6.0.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb
index 62e9b158e43..02045cc2122 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb
@@ -9,11 +9,11 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "560f11c4bbbca10f495f3ef7d3a6aa4ca62b4f8fb0b52e7d459d18a26e46e017"
+SRC_URI[sha256sum] = "0edc14eccdd391514458bc5f5a4b99863ed2d651e4dd761a90abf4f46ef99c2b"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-inherit meson pkgconfig
+inherit meson pkgconfig bash-completion
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)} xkbregistry"
 
-- 
2.39.2


