Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EE4F8E493
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:38 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28589.1776378810551750138
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1Za3GPdo;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso367835e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378809; x=1776983609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvestLG+2fVfR2dHIKIgfyF55VeM3T3KshMVwHxPZoI=;
        b=1Za3GPdodow9lW7tzNsj694UXsOHxl5F4GC7CSNtrcHafPncOyCaoBOeVy5gdhSE+D
         8U9M3HN3+b7wccGqIgc80Grb0Bst8ss5YmOEt0GrnQzioU+alRNnbrbK3u2DYbufGOp5
         r6houjBuVVLefiQC09a/0JGOyba4ECoR8rnnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378809; x=1776983609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wvestLG+2fVfR2dHIKIgfyF55VeM3T3KshMVwHxPZoI=;
        b=Mm4MC3UegruBM5tvUwhTk3/EtzI1T58rewusEmUsrB0E8FUG32NcMLiNwuvP701sP6
         0P8kF0Ls79UJ8wXTZj/3gp4EdsPekYfdELqH66akXlSGT8pnqwiFvQr4IQflCKTec9XJ
         COEQve4LFC7MxY/Uv5denS+Oyl/S2ZOPWnuSFmuF0M8CSVQV9PVUXpGN1DkI7pzwYgmX
         ShDAjSux4AcJ5nqjWRTLlk/SOB1hopD5vIAURhkl9wUGsrxFy5ZNtZXUNFnO32gdApWa
         eZ7l7n0wUeReZ8Z/PS7614Dh3lEEEbv5082TuWCeSDUMTIxA8sboa19nGn68DtMrbrLP
         Yqpw==
X-Gm-Message-State: AOJu0YxnJQrOJAacllFXTE1OCmd+q7s4pWD9eXN4uBXaPTqydct9A7vC
	hq3yjMRDgwuZrA+KmigPWeNLtauTh03gGISsps1c6JEHes6T0tQkFVksbqqWiTfIIKCsBZsXbxO
	QfGBv4fr/uz2k
X-Gm-Gg: AeBDieu1qZderR2N6rjfzyuELccqAZD/Kbgza2krny614SXeR3u7Bm27tfhq+8VcLvM
	dGJBsxyAC1zbbUHy/1+0VNw0IjIUkqH+GMf13q4lKbsV8u2rMlDcRMHFH7UfW+2r6kd7z/0CdAB
	APb5AGq7imIDonxX/bl8aul4uwK/0joJ2eZqVY7CYBMrwjm8iesQZUM+bNzVZUy5gHUwXvI44xO
	wyG2EI5nEc0YwpMKU4zNqw6EGU7T4iacUQH67XUbfWM8j4jIu2IUgp50HfZ2S9PsOBaCdLNyR2F
	FrAl+yBFLqlfb77W84jIF0HMDOoHdP0Zr0EU2Vu0BJpwnCkrSa0lq2cXhQX6LV3QsSvEw9C698U
	oA0yehq6b7BMlAgjQZf5MH2q7q7GdNtGO96KPJ1orNe2Sa5rp+D0NtOeM4uaCNKNWICXH6UZize
	2p4RGYXK8ZEmylS9jkuGDuVD9AGImjxEbCdVPeIiushlJyIpUxcgTgRD+yQcRGcZDm9U9uutAYb
	9dNNZsdQ56V7H/34afM9gQ4568emOyS+7B4/g==
X-Received: by 2002:a05:600c:1993:b0:485:3dfc:569 with SMTP id 5b1f17b1804b1-488fb768e62mr5461695e9.16.1776378808644;
        Thu, 16 Apr 2026 15:33:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 46/51] build-appliance-image: switch SRC_URI to https protocol
Date: Fri, 17 Apr 2026 00:30:29 +0200
Message-ID: <148737aa32d34aee65428db552f63d7842215a6f.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235475

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

