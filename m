Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59DCF88095
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:53 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7594.1776322130978192411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0oMQ31SI;
 spf=pass (domain: smile.fr, ip: 209.85.221.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-43eb012ac4fso519025f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322129; x=1776926929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvestLG+2fVfR2dHIKIgfyF55VeM3T3KshMVwHxPZoI=;
        b=0oMQ31SIVSYUtyVhOjStMQCMLli3effv7Xr9Ia8IQO2qrlYVdWjNWrvP6gG8ASUeAd
         kmwCJzj80Ed37hiFG681dsFEEdVIJQkPvj9/3t955gn0j/Fan2DrMdLvwpiyBFZ8nGfS
         4CkEHLImS4N84Wpqql0DTWn3Rv8umdidp4NT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322129; x=1776926929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wvestLG+2fVfR2dHIKIgfyF55VeM3T3KshMVwHxPZoI=;
        b=l1HVrj/sxHIS4iUQR9b9nExLpeZFT4pam3Ye3VFnm5gaQ1p7mJlS50QjPoqsn5u9qA
         5jbjY8aec7qaXDZkS3f8iFxydnx2h7X8YOV3Jso9m+IJ5AmzjLimaBp06Y0tsIpnFvEQ
         xBVfgud4P2tcsRupQtesprxhY1L490ajgwvg9fceX9Y0pwTH5jp9ZyMqcCkQjedpOmb8
         HrzX4f3DmkUCsWju+7yZIFmkBnm2IQ7ydOX4+5UkVZSbbNDar/viSkjGtN7n3vUPeH2f
         EiKio3ZYS9PjFrmOfV0Lf+ko2iTWPXaEz795AB1B8GEQmxA6GzkVDWwtDqdDqT1dlsA8
         A60w==
X-Gm-Message-State: AOJu0Yxh5dPV8sE8W/78eKvPG4z17bTz5uGjr1FilCP3HB6TnMnO+Q+9
	jTbIZBhbD7tit1we+ZQrGWWcgt0eNx6kSHelIihdTatbArQMZMDxo4IujnHqGDyHK6qVaZ5M/hg
	KhWSI42jh1YQW
X-Gm-Gg: AeBDievukDI697z+O5nxnxEcIHPk09eeCzXez2Oid3w1oIoSK4/lkeQ+4e5R/+8zzlE
	JjSYxDoa86xbH4LqB33LjCkQ33zEwnCMnBaw9gz4UKo6Q2ECVVmYrCDwQ+96DXSvGo6Q9b+NBIR
	oPJ/sIfUVFY9nYRBxaMliqRjCoKlbtl+DSmuglqxC6VAbWOfkGrWzFs7SygSwgIoWwd6ow+MA8B
	5vy9aHY9GTw45EXR/7JYTawDnKP1YNPSNveDUeDTDpaje8sPrxwD+aX1TKokULlHsIVlap71FKb
	QGytsJ98/6b3p1S7++Y0vCOc7qIZKZe3G0Ua+XhlorLSJhX3owh8jyhJAwbxDbRJFofNkyzUn+v
	DvfQUyVDSDkDQOzCK9igm/cFp9RFliXWU7lgkZsqLxxHFYtH72f7A+CPOSGYHnRkyOYsnDxXRlB
	79+1QiO0gkHgwZ+tjfYJaNpUVe+EEqfXGMuxpe5xnkJ+wA3PW1VBrd3+wANgAAFkMoLTrju+i8Z
	uPNU5+N2urIOSWnTyWRx2D63VajYVknw7+8n/8dWveRnR/P
X-Received: by 2002:a05:6000:1847:b0:43b:4f0c:aefd with SMTP id ffacd0b85a97d-43d642b9e05mr35251016f8f.23.1776322128952;
        Wed, 15 Apr 2026 23:48:48 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:48 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 46/47] build-appliance-image: switch SRC_URI to https protocol
Date: Thu, 16 Apr 2026 08:47:47 +0200
Message-ID: <148737aa32d34aee65428db552f63d7842215a6f.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235388

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index dd6b5081c10..b40ebf51d02 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -31,9 +31,9 @@ SRCREV_oe-core ?= "05d149ee0905cbce655a9e0c3767e8fdfcbb8997"
 SRCREV_yocto ?= "9b98ec5e6cfb6c9dc74d3c2e6304eeb274f7c487"
 SRCREV_FORMAT = "bitbake_oe-core_yocto"
 
-SRC_URI = "git://git.openembedded.org/bitbake;name=bitbake;branch=2.16;destsuffix=bitbake \
-           git://git.openembedded.org/openembedded-core;name=oe-core;branch=whinlatter;destsuffix=openembedded-core \
-           git://git.yoctoproject.org/meta-yocto;name=yocto;branch=whinlatter;destsuffix=meta-yocto \
+SRC_URI = "git://git.openembedded.org/bitbake;name=bitbake;branch=2.16;destsuffix=bitbake;protocol=https \
+           git://git.openembedded.org/openembedded-core;name=oe-core;branch=whinlatter;destsuffix=openembedded-core;protocol=https \
+           git://git.yoctoproject.org/meta-yocto;name=yocto;branch=whinlatter;destsuffix=meta-yocto;protocol=https \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
            file://README_VirtualBox_Guest_Additions.txt \

