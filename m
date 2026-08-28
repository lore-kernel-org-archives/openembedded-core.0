Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E129C61DF0
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:34 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3054.1787945903153077335
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=m3VNojnx;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso12488295e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945901; x=1788550701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4+E1jL+UpQDN/0ALishB/S4mZYSMwoWOZ33gbXyR41I=;
        b=m3VNojnx6jiXOsm1ohTjgCaTawtfK3xzIDgHlESf6s87quH/cPfZQKR6BK+5nEKEwG
         rYgB9CYRHjtRuk71nSGQZv1oPWmad51Xt1geC2GFOAljYw7brLXpUQwzYH7IQr+FPe3P
         qbQXmGR8VHT3j/YKo7JnIk7MU4cPOebSLX50Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945901; x=1788550701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4+E1jL+UpQDN/0ALishB/S4mZYSMwoWOZ33gbXyR41I=;
        b=CKG8GbbsMS2OOEUaCi5XiG/DOxUYSZhlNYUh+Al4Bnm9POeWnfMu09f7+XiaEKLjVO
         HBHoaJ1hMPFo+0vKHnYvtPqdrjp3Ue1LKrRgIutz8KZPXrG+H+H69yCf1i50UgmDyd6a
         T8axBHZcEROpQXivJ5ql3bsODKjvBkkIKt0O9EZ5+O1Oj+Gw772S+SnwhF3Za5GxYd+l
         FYk+8HzQxi8u1QCFvehsWgUPk6mpwk4EiavgERLLQwr47p0H5GXpMG8qJzqexsNbaWdi
         HhnWsCscdDxEkh++GKPwH7d3MdJyHcY2Dt6ButoRIXRDDH8qAOgyfHo5VcOwU3w+20Hz
         nnFw==
X-Gm-Message-State: AFuF++mu/ISIaJDWFaUqGRePLSMakQm4cth6ev65RA19O5axk1NfDT+f
	U5G8nCwAE+ogkpXKXhkfChBqFq9x3gfpGfWBQglSjbL+sQbGLGzduXyPEB14Fv5YnkAHFghDSLx
	PhNX6sO4=
X-Gm-Gg: AR+sD13zxQDy2Xv3NzhgthLX3+feNG7bLQWJE85LD7peptTZlLO213jTBXaZNNX4FFB
	by7CnNA+d7gt1w/T2ReNwFY9K9hwQeosvtN9XdJTxHz0Y8qhECmUyu8KEEo6JLqzvw+Rmmx3WXs
	n3bTp72ZuaoxcrlB7GpwmM9FC0KjMR67uhYD7f7WeiRXRzPFkGT0stLQk4w9GdKiZLLeOMatCSZ
	Rz7fkHPucYMhvpgo7TOw+8gcbGdvphKJxSj3epj2jVracijmlnK4j0mlHa2sHuWqaJSbZ7hIwlJ
	EYswPPt1Sj5wi0tX/OILM/2Wli0On6lOqGcbInLHzqI5Q4Suk8XXdx2M2bJ0yt6pQ82DmCH3zdm
	wJfvhM1pclcTtp/jhUxUybahjRZK+FzIlw1TC0bLLg0WpEmbjP8NhXC5sQWIcGFjRPlxRpEDY9L
	YAKwyoX+BVANriYLf2yMGsWV9Exfv6iDLLVa2d/ldXbeUmGgVUMyNR+RATm/YHHFupq4StQdj7i
	sqwGZMujg3qrDkj7po7j6nfx+qdbKG1TWx2TO7PK/8QP5mVCJ6lqMndJLT0NU8MlyPStR2GgqM=
X-Received: by 2002:a05:600c:1d8c:b0:49b:916f:1471 with SMTP id 5b1f17b1804b1-49b91c1df21mr152520255e9.3.1787945901344;
        Fri, 28 Aug 2026 12:38:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 30/56] xserver-xorg: upgrade 21.1.22 -> 21.1.23
Date: Fri, 28 Aug 2026 21:35:40 +0200
Message-ID: <c823c48604318636a20ba534bf94234f5499dfba.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244591

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: ad22af929c5928ac202cb84ef07ee25689f928b4)

Release notes:
* https://lists.x.org/archives/xorg-announce/2026-June/003702.html
* https://lists.x.org/archives/xorg-announce/2026-June/003703.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...1-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 2 +-
 .../{xserver-xorg_21.1.22.bb => xserver-xorg_21.1.23.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.22.bb => xserver-xorg_21.1.23.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
index 7d151aaa63f..4a5bf4ba437 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -1,4 +1,4 @@
-From 6d23037f48f3d534286fc2bda927c9b6ee5d1445 Mon Sep 17 00:00:00 2001
+From fec2a3c8922ee7526d59e9fa2c6ad0943018b7b0 Mon Sep 17 00:00:00 2001
 From: California Sullivan <california.l.sullivan@intel.com>
 Date: Fri, 16 Mar 2018 17:23:11 -0700
 Subject: [PATCH] xf86pciBus.c: use Intel ddx only for pre-gen4 hardware
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb
index 6a9826d959a..d3c00e087e5 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.23.bb
@@ -1,7 +1,7 @@
 require xserver-xorg.inc
 
 SRC_URI += " file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
-SRC_URI[sha256sum] = "1a242c8917c49ba29ccc1f6021613d8a2b9805dd0d271a66ae9d09f4b0bb06b3"
+SRC_URI[sha256sum] = "e39832e5617dadaf072fdf9f0e19e5d2e1c2a13607ac280bac1aba9f8fe14634"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.

