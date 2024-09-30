Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF4ACF64A2
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:58:16 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.45297.1727661489981324558
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qj3k7Vtn;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e0a950e2f2so2904100a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661489; x=1728266289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jrutfl3At8q7htEqkf9Lu8+hnaqCFs9fD1wGPNwyoaU=;
        b=qj3k7Vtn6SF3poMxij9zIXdKV23MS8fvy1Ps8BK0UCQXWLJb0IH9bfE7eqARxmqpAR
         GSduKZEQS3nkJdR+mFafN/cq/occkNuv10Yy+G0pbWa5yoFeglk1vsqko08lWU6yP6q0
         NK4iNV1MyA9cU4In49FRQw8ylJoxqekKwOOSERvVl4stzwhN/Uf0cvy1Xs0SvIMM1e5E
         pu4yGl+VsY4gmnXtt1h47OxZyUfzKcpGAK74uQt0tUS1yzR8sUxyRhRW6hwsNDUFMdgl
         fPYZRo+xsEtZgyE5o/4/aNkWUlZW27/cvKbfAL9lYjmbvjhyH7uw/t+G7oJn2iyi1Ewt
         N8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661489; x=1728266289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jrutfl3At8q7htEqkf9Lu8+hnaqCFs9fD1wGPNwyoaU=;
        b=IMZ2Gn9fM+wY7/EOca0kEQd0bFN04N9hAmCRS3cRX7yd2ZUR1zomPeG+omWf0tvySg
         +zdnso5ejsPtTZN7Y5BbgjIjad1tK5gO97DIaKMVu5vg7S7s6EaccKzqRJI2i1KDoUJm
         FXjtIs3xX21616qA8zDoGonHmXl0AvH1wA7ymeAVPDCckdRrZOF/9oEl/rRZZ4kmKU4q
         aNqE5gngorMExul3JdfZyw0ki7vlIjeiZLjPVLQoGpbO1Wm6tj3VfYvdQM9Ib97c8m/h
         EH/zyrcnrbp4TDlEUaBUFeXMWRtE/O20FeN9Zqj7A+iGniG64oepAirbGWUBKZlt0C9K
         Bqzw==
X-Gm-Message-State: AOJu0YyfJSmb3I2L26MlehTtreXn2x89+8nHDuCDTfGsNv605E/TuA8P
	LppaKfmAH0pTBqaXo3psFfe2ZzdX7NLbZ8Y2Ckl31WsSkR+DYLHLCLUvqSMWWFXCdFClpIr9ifW
	vKiA=
X-Google-Smtp-Source: AGHT+IHmgCugaWKVh7gHI7Ocy6GkLRKbqcPXMugyipE81DMy3c+QNyh6pEtSnR4swPENOohrwTJ/Rw==
X-Received: by 2002:a17:90a:684d:b0:2e0:adb6:d0ab with SMTP id 98e67ed59e1d1-2e0b79765f2mr12451669a91.0.1727661489161;
        Sun, 29 Sep 2024 18:58:09 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.58.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:58:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/27] pulseaudio, desktop-file-utils: correct freedesktop.org -> www.freedesktop.org SRC_URI
Date: Sun, 29 Sep 2024 18:57:19 -0700
Message-Id: <60f411d19a9ea5297911eed64902e1cb65358e35.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205086

From: Alexander Kanavin <alex@linutronix.de>

Server's https certificate isn't valid for freedesktop.org without www prefix.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d7ce9da33498869384b26a6fda05c37e7b2c3565)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../desktop-file-utils/desktop-file-utils_0.27.bb               | 2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb
index 55c88afcc9..5285a6c6ea 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/validator.c;beginline=4;endline=27;md5=281e1114ee6c486a1a0a4295986b9416"
 
-SRC_URI = "http://freedesktop.org/software/${BPN}/releases/${BP}.tar.xz"
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/releases/${BP}.tar.xz"
 SRC_URI[sha256sum] = "a0817df39ce385b6621880407c56f1f298168c040c2032cedf88d5b76affe836"
 
 DEPENDS = "glib-2.0"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
index 54c79b4097..6c172b4ec7 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
+SRC_URI = "http://www.freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
            file://0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch \
            file://volatiles.04_pulse \
-- 
2.34.1


