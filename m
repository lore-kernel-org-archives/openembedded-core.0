Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A86CA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 08:44:33 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15737.1791189871839153918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 01:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1cl7W07+;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso12570095e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 01:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791189870; x=1791794670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XT9z6zKW5vh6x8DjWZ2hdtCpQwQj4sbA1GSCyv4oAyM=;
        b=1cl7W07+sxbvHZDx78F+2DJMsVAwyPWYpsWte7xinHVQjS9MaHfhd0mxW3LM5mw5CD
         iBtUi3sCgwqn7RTQ2rE+yz+xEzmlahYxGMuwDCGy8D0jM7ppJOl8i+hGag7wUgvYHwoS
         r1pUpuWl3YZyywyxusmu4M3hm0+o6YwpNdEUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791189870; x=1791794670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XT9z6zKW5vh6x8DjWZ2hdtCpQwQj4sbA1GSCyv4oAyM=;
        b=ifrZIRFA65SMQ1hlD5KsCK7rpdGHg8ui202lwxWVVG487Qg7h+of9IwO87p/qLD73L
         1ROkVCq5PxJXrdngDVlZDmNzHmkz03a9CaE4lxpFSSbZ2Afx2rT84fPyUbljGM00Ihl4
         OQj9c7NiLkh588Yd11gFDushh9sQBmWwfCJ8mpZubvSFyuv2Jb8jToKi+L+vLGPStvnu
         Fp8nmovJXqrgips7PX91l9EEo4ir5H0ncmw5vTiu8i18QePpYWWL/JUoFEvRGl0eqBGI
         UJTcV2k1LiUvOb5ZSP+2OQPHYATDPq+dwXJBFT3M+XUH1d26LMH7lP42GXZbvISXm0Pd
         5XOg==
X-Gm-Message-State: AFuF++lCHZYNvUYdvUS5INqEcMD/XGQdqjRlHtdXikv7hrx9UW2nxNjS
	0tPeeVQwfgiOecsSFlGStBlAaGwmEJi1l3hQfEjnXKFP8/V58vpW95fdOWIl7V6EZXYfTMRyDyM
	sjETGfYM=
X-Gm-Gg: AYBFou3fCVm3q8zJCbZEvjxal0vlnsfuFiyo22qb6o58P5/tI8dIb+aiV/W9xnQjoU8
	w/3HvB9Mn8jk8tgPA64GvLWCyPk0ObrFxiidMUP/+iTF5qKNybWrAlnjQw6TvuQ842Jri66q39s
	/1k2upVxLlbOgXqAn1eFbF3jL5qd5rnXGDGstIzOuEiRCE050fjlTcZb0f0bRHkxVMKWOkBfEYH
	4y+Ibh7k+o9wDD0vkjUkJs3n7PLW/pwRZbIoMKEjmXydriqVsuHKAApKl1UhhTbVVw4lJQFSL4F
	VQdptzcieGnf9amLgwB43UUFu5hxDrCeiQDHlqb1UJtMIeIiyUUu8+rYe+RbG73tFXcT/GYnPeT
	eroPUDCZsoNCceV2DAzPNGg2vqk0tw3C+yCV199oKMhu03WkvSitGHC7L7svfzlehaEC8iqZoiQ
	zOndVekcWGMynxR/1AbbXMOarY02Bm8EXUU9fkpzXR/ln0xIwq14fSSGV0C/+QtdcCo6y7EfCOP
	8Az7+hepfOv2wFM0alPdDqKLBjZHapzgdr3xlaot86g8QjtG/EOgN0NCapY8ZMgO17gm6Knsb8e
	bDuyFw==
X-Received: by 2002:a05:600c:37c9:b0:4a0:159b:d2a2 with SMTP id 5b1f17b1804b1-4a1680f4309mr103725535e9.29.1791189869919;
        Mon, 05 Oct 2026 01:44:29 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a16bcb9a21sm291662475e9.10.2026.10.05.01.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:44:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] opkg: update Upstream-Status for a merged patch
Date: Mon,  5 Oct 2026 10:44:12 +0200
Message-ID: <20261005084412.1273877-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 08:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247223

From: Yoann Congal <yoann.congal@smile.fr>

The patch was merged in
https://git.yoctoproject.org/opkg/commit/?id=0682b36c898fb81a40a068481062512bcea9b66b

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...3-CMakeLists-take-the-default-architecture-from-the-ta.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch b/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch
index ee7d35e34c4..5142fff7f42 100644
--- a/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch
+++ b/meta/recipes-devtools/opkg/opkg/0003-CMakeLists-take-the-default-architecture-from-the-ta.patch
@@ -14,7 +14,7 @@ cross build doesn't set it.
 
 Fixes Bugzilla: #15784
 
-Upstream-Status: Submitted [https://lists.yoctoproject.org/g/opkg/message/218]
+Upstream-Status: Backport [https://git.yoctoproject.org/opkg/commit/?id=0682b36c898fb81a40a068481062512bcea9b66b]
 
 Suggested-by: Alex Stewart <alex.stewart@emerson.com>
 Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>

