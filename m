Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95E0CD4F3D
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 19:23:18 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1895.1779391389901988895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 12:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lTTJJ7Bq;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so519325e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 12:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779391388; x=1779996188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KqcCRlW9jBvzV/KAH2phnKfLH4wIpxNBo/N5Ok9e1jk=;
        b=lTTJJ7BqLKR3b4+jxkVdI3NLukzsSbEaDlUHRJMO7GCixz1cPuXzcK/aK/2Zwf68LD
         CDtyqhdKboiPEu2avDpW/swT/i36xhQbslDCK0PPrcyJ7sGFncGh4+ZRigV1YhPZvmXq
         GQ/Jnqni7UvUBZtqvlpDa1IcuWW4af0zxrbo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779391388; x=1779996188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqcCRlW9jBvzV/KAH2phnKfLH4wIpxNBo/N5Ok9e1jk=;
        b=bVM7DqJfpmJw2CQ917ouB6SzysQoU5lW4LF4+u9AvK8UNeANTT5BQczWtkdv9jhEy9
         xZV23BLlMCFO1PgM+RQgNW0bUewLyZ1q9GDm3QAy0ElA9mXwmrWRFuHSO/7U18nlUzzL
         lwnsprs3JKlOjzWoQugfvL689va/FZWs5FQQ0uzW0Ymx+Urrm39odCJPpGbwYp8rnWKm
         Uk2x2IjbNiPpMPOwmvqe4PvkeuGqjD4OsNzh2zaD916f8oLR1sWH6+q9EmQenr88z36w
         yKmV6RlTmN7UQ8728w8l9OvL70MmCHirxgNfCv9N6E715eD6WPszXmE6D4gHg+LStAJD
         VwiQ==
X-Gm-Message-State: AOJu0YxRaEcePoyTGctKVQJMC/iHniz/wZcSKeHtDuWFxXs+gkAF4AiL
	BBQ63fmouFjgp5/EvLXPiVRl5VzWLuhXLW1SCnO/IrqPwZVjk3fwxmndggQeF9iYCKyFE40EzYu
	ZJGgy
X-Gm-Gg: Acq92OFF90r+QOnKyZQW+y+kPLBLGJS3beTYjMlR+A2ZOktnRaf9IR96VpFtDTRE2dc
	ELr7WT8NdzL8SdaCYcZyGL0a6Ny1tmbBF5Lt6I8JCPf3fd5PG1CM52IyocZHOueOftjM2OT9rpx
	X/nQXMAkOG0incvhEC9LcjRZnLpMe2PjeIgYxdjaLR1Ykrd99mw4irhYH9hfJ/9cr3pmvlJ0/vY
	aMTuANM6eS0QYJUcxcSy7qAZ1WNi4yIHkZ48xa3PtsoLRju6jZAdt/25pSwhIOtkcLSn2K5KD9t
	h0NM//2n0Wb+tRFPRTC/aI53OSxTyIsKQKMs+b+kng3tfGcPnovpeH9EA6fLXsPdxjAmegBz2QZ
	ewBPelUJU/sjGg/NmBIg00P6oi5x3PqEJG10qsMt6O78K4m6xT2fGJIxck0ciexME1JviEAqKH9
	rVeSkgroS71GjbZ3q8z7wwsNsojUV6y+HRzILRX2gvJsRHlkmqzRbLjzLV0gZe5+ZAnSF5UVXPG
	zyfcRSkv4w2M9CrvpqBwOQoI561uu7ahxtTrQ==
X-Received: by 2002:a05:600c:c04b:20b0:490:3cec:52f6 with SMTP id 5b1f17b1804b1-490424ac920mr1287835e9.2.1779391388271;
        Thu, 21 May 2026 12:23:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903c9abbadsm45449705e9.8.2026.05.21.12.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 12:23:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Paul Barker <paul@pbarker.dev>
Subject: [wrynose][PATCH] build-appliance-image: fix branches for wrynose revisions
Date: Thu, 21 May 2026 21:22:46 +0200
Message-ID: <20260521192246.2362916-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 19:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237522

From: Yoann Congal <yoann.congal@smile.fr>

The current SRCREV_* commits do not exist on "master" branch but on
"wrynose" or "2.18" branches.

Cc: Paul Barker <paul@pbarker.dev>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 560df8e002..0da29c18a8 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -31,9 +31,9 @@ SRCREV_oe-core ?= "42adcd87a15f5921f0cc95424efd930876743824"
 SRCREV_yocto ?= "8251bdad5fda780a000fb41e6eda82eadf0fa39e"
 SRCREV_FORMAT = "bitbake_oe-core_yocto"
 
-SRC_URI = "git://git.openembedded.org/bitbake;name=bitbake;branch=master;destsuffix=bitbake;protocol=https \
-           git://git.openembedded.org/openembedded-core;name=oe-core;branch=master;destsuffix=openembedded-core;protocol=https \
-           git://git.yoctoproject.org/meta-yocto;name=yocto;branch=master;destsuffix=meta-yocto;protocol=https \
+SRC_URI = "git://git.openembedded.org/bitbake;name=bitbake;branch=2.18;destsuffix=bitbake;protocol=https \
+           git://git.openembedded.org/openembedded-core;name=oe-core;branch=wrynose;destsuffix=openembedded-core;protocol=https \
+           git://git.yoctoproject.org/meta-yocto;name=yocto;branch=wrynose;destsuffix=meta-yocto;protocol=https \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
            file://README_VirtualBox_Guest_Additions.txt \

