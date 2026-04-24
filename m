Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC44AFF8858
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:14 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32596.1777064223564254753
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Jpg6Mp39;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so49528705e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064222; x=1777669022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEsIz4X2ymYrlB8LwQW309giaifP7vZaXJxgf+BYxFE=;
        b=Jpg6Mp39Y1+5zLqXAuxosvLTJwONgfNQhH4Nww7f2LEiko+8on9YHTSATGf6l4JSK8
         rvXDvJUNj0W+1WcSps5V1YIUCDSD99s3z4lajyh+257A/LH6v1HQB7og/jSfMX4NakQ2
         QHLija7uGyipW1hq1hwHP34Z8E9bbbQ6uZCrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064222; x=1777669022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yEsIz4X2ymYrlB8LwQW309giaifP7vZaXJxgf+BYxFE=;
        b=X/IdfX7xjhQDZhk0dYx3NzB4iD085DFOqwYCyCny7A26/0ccUPCWICdVSYrjsP6nm1
         lw1QAKxd5qP47oSivNalI04677tbWGZ/ftXi3O/vIOVb/dsV6SMQxu1t4owoPGRrUaFa
         uxkbZViveAnXIUyHHF/QI9DDivWBFz0uqa47xamQLq2qqGmAN7xkU2Tq4aiSiIEwUF+h
         ZCC2XuGPz40TaoL5/uAkkgyaHAa49BgDkxN5uuDW5n4hV3i9w1+n9i0Dhwr2AFin8NGD
         wS1Dlt+xCNC6/1ty11LPX191IdoZ/EIUxvtLDYW/PJ5yY19jwEy3tuDsPYX72D5Zz1j2
         Fg/A==
X-Gm-Message-State: AOJu0Yy30hyThO6tB5p0d87PCINI6Rk4hTdFS2YDE4OboE96fLjUWc8a
	M9zeNljmwL6kRY0w5w3I7pdQdMSTv+tMyr7vTFJw/SsotVcI+or5Ro2dXxjhCVamhEVqQeolhZR
	I4+0SUaM5pkns
X-Gm-Gg: AeBDiet1SdM1yqQ5xz0r5OFVNCapjmw6aFoM378rQz+dyMdVEF3xNfJYsGd/6hJcnrr
	84cOv+O8UX+Wj6EaVGM0hJJGDBarEJM+JtMx0qtjvWssNJfcULg78bxm3nTfMXbLbqA5u9lu5q1
	rSzxjmQXTy2DQgM3h7VxheSdGHZIHW8m3SQThXiS3REtSkRx7LFuyM1uNCRiDSsGtWc22J/lnyG
	hwxtcXtlkrOpbV5VdXed7k7WCNEvKBZQFkHl1o++N3TynPQeG3Yj7YS68ux0dFExMM9FLi6ZPFW
	bxS26+zo41ZaNcYVRt95yucrLJ1TVyVAEvuQYqyNFcUQuTt22nYQDL7R1mnKqELqHzTC6q8wrhv
	AKxEZ1QGnQgHM/bPsxvP0vHDoYuak1dITmL21f8k386QyvlN8iqwActVNmfewlG3l3fhvdPY6ny
	iKvhTgMu4rwGwdx/NlwsXuyWFnhPPjGwon+DNVXJN0LpTnUBbXTjwVwDL19lhPq593jf2F3qBEb
	mpslua/utA5zbB7x3/KiiN9JDMAIHUsiejfGw==
X-Received: by 2002:a05:600c:5297:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-488fb74a431mr527618275e9.8.1777064221674;
        Fri, 24 Apr 2026 13:57:01 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 42/66] build-appliance-image: switch SRC_URI to https protocol
Date: Fri, 24 Apr 2026 22:55:41 +0200
Message-ID: <6cfdf7fc1a63a3c2ee8093462fedc80d6358c54c.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235914

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

(cherry picked from commit 9bab238d26a3317a6212dc711427f4917eaac50e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 85521b6026a..3f6fcbcb3e3 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -27,7 +27,7 @@ inherit core-image setuptools3 features_check
 REQUIRED_DISTRO_FEATURES += "xattr"
 
 SRCREV ?= "f4877d8e682ed22e339fe6c07f3ffa28e50c7b98"
-SRC_URI = "git://git.yoctoproject.org/poky;branch=scarthgap \
+SRC_URI = "git://git.yoctoproject.org/poky;branch=scarthgap;protocol=https \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
            file://README_VirtualBox_Guest_Additions.txt \

