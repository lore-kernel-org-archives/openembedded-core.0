Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5861AFF5119
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 16:16:24 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85274.1775578582644029757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 09:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OkdvgFCV;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso40561525e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 09:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775578580; x=1776183380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCGN8BUF5urP1YIACI5hJZJcaPbWT21zdmBon9wV9V4=;
        b=OkdvgFCVtvEJH1BagNSaTzXSL2q1rrktYr+IJ760FjFBiJLYzARazZe0/BWJmtTIYK
         ljq+eD8VRJ2SVmFNNKDYHHgC3by9MCfUBorLbT+/8XcHyKTLoAZSX/63p19/01ZsXGt7
         V6KI0WqW661oWeTR9+eJP8PmQLtmhIxdS3g8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578580; x=1776183380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NCGN8BUF5urP1YIACI5hJZJcaPbWT21zdmBon9wV9V4=;
        b=oM12DvmXLwkIsdLLy0DJudFWxH/K+lAGUKuF0DBLvWDypUVyO8Z4nmG6CY9aN//vas
         L+Y5kMZWZCdWB3FPa0ClaKSgUvBJ1EjmzePi/pUQBFBzu1iuN45bK5YlYYz0sxBVCxdd
         FAGrKx9ro4DmWrLDbPODSbpp+vmjKj6CMxDqsQjdUUnLIBfS1/vr0l65dUrIQQU2mlf+
         4lf7djZo/NzfdD58L23njEU8D3veKbix6XAyu74vBslrsBYfQeq3SYtJYkIM6oUxuw1I
         g1VbQZpGd5BmpSRNqoCZVjUtzOImK02YY8BYec7zAofbf2FjQYwzOCQ+rug3XOZc4z1H
         G3+w==
X-Gm-Message-State: AOJu0YxCM5DeObBdxBB3LN2TFMMsIOQY/IE4BHlTAeJdfbpRuc0ooL3V
	jYg5MYYm8fIUrRz3njYLjwTfh+vj+9oYchXIWfd2y+sdG5BPKi672I90JeWFdOfWLTe1TgQ2Q7M
	rjNC7oCw=
X-Gm-Gg: AeBDiet3JFCP7OtdhpOksC9IJg6PYnRDcBVHKvRII20E8lXmAQCw+wMlrCMlrl95jcl
	k5f7XosQzGiGPOb9vACpStYR71iVlbKll+AUkejPU4KBIcc0Bex8t5uqHobdQ7t7n/oYwRPrsNB
	dE6H9hpOYAkCc74cZPr8We1fxX2ge9ypYobPQDlTxC2GonHV01iic7w+oeUTqJ8K3OvCGGaq0Gh
	YwpQwYBgfzs4v2w77F+0kRlTotQlgPnrhr0wM6yr/uGA1O98/snHiLmvssEasbwf/A3AeYHWOm1
	HbsJDvp2oVCOpMERueC26PTMMnl+j9Kf2/MgSzyJcWOHZ7qT82prAq491Ax1f4ALILMMi3iPDz7
	VDw+BJfNNsyoBz9LI6niVmhEi1GhH43iznY3rox8PV/tF8EqZ4++JnJ7KTuHUWTRz9ctEgrF2T9
	71dsXJyZss4yBC02YRKJf6+gSbVCDie7lvFYJK1E01909wItUY+QsvycosWpipss7Flb1m9FiHZ
	jbqTPf64W80siTo/Zfzr6wnd7sP
X-Received: by 2002:a05:600c:4e86:b0:480:4a8f:2d5c with SMTP id 5b1f17b1804b1-488997c9b69mr237349715e9.29.1775578580417;
        Tue, 07 Apr 2026 09:16:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa003bbe8013556e3516.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3bbe:8013:556e:3516])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c4b57febsm1195665e9.4.2026.04.07.09.16.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:16:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v3 07/19] tzdata/tzcode-native: upgrade 2025c -> 2026a
Date: Tue,  7 Apr 2026 18:15:44 +0200
Message-ID: <d7e7612a5b7db3b435f3d0cdc512ee356befdbfd.1775578386.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775578386.git.yoann.congal@smile.fr>
References: <cover.1775578386.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 16:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234760

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 217ede26d64901d9a38fc119efa684487714c08a)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 1c08d4b1023..c498c0c9ffa 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025c"
+PV = "2026a"
 
 SRC_URI =" https://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            https://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "https://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
-SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"
+SRC_URI[tzcode.sha256sum] = "f80a17a2eddd2b54041f9c98d75b0aa8038b016d7c5de72892a146d9938740e1"
+SRC_URI[tzdata.sha256sum] = "77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7"

