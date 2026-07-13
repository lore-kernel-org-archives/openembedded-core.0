Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFF6C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 07:22:08 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5756.1783927323285283237
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 00:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LGBHT1gE;
 spf=pass (domain: mvista.com, ip: 209.85.216.41, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-384c94c9414so2562310a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 00:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1783927323; x=1784532123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Em3TwzHx/62SYb2JQKEOQOS3gTAJJbDVlz10ql1Ri8Y=;
        b=LGBHT1gENPmcMNDWRcVpEyIdRnhPURwtY+Q10xVrzfuUgpF4r7ka1VqVbnOFhCAJDt
         YVUMkKebtZQXfzW165kIdoglaDmaUTKxjYMGF83AFAmTeppnheoRjYl9qUoBPtrtbOKP
         spXQUs1TuOyNAryvN8+mvtFpVM0t+I35xGbXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927323; x=1784532123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Em3TwzHx/62SYb2JQKEOQOS3gTAJJbDVlz10ql1Ri8Y=;
        b=tTkfWZzaadEsQaWjVRmXTEVQ/WzGjr8MFNUSZOUDTg4pzNgOFi+GY0W44qX5miLbfC
         W1F+FrG5R/oqjC4ns65LHqWUaSSzVzenFYphL/4tPeOjKGccGVVFD/smWzehtjdfIhNL
         IXWr1rKT/dpbuU+zZpuGDC34MorP0zGsM4g1Y7WOR+b0/bpvhgeUDwSYpqKMi4bOLLcv
         qheaEJ3cUaticgojIeOo7OA7X7xcwAxw0qU2dHLAWJqiUPkE/8bxouVsPoYCgj16a8kw
         NzqjWaom3dwryJzZVbG6swb4fF0xKY0a6SphNY4S08slG6fsO7176xQcAzQ2kuqotjPI
         Po8A==
X-Gm-Message-State: AOJu0Yzj/TqhWqQsNQ9lSUqloCLii6WTiHOgfqtn62xwBxoWX96PEnCC
	M/SoxDYUQ6zVUNxcMXq46ilHp/VgHkrjX5thP1aVk19HbUb36N9ynsnBH8nJWVvre1BoqRhyUVx
	DNzhLaIA=
X-Gm-Gg: AfdE7cloStu+tog87LRpfN5NlBJebdvtzCBC2fbQn0caDw0l6LqYmCogj/jZPrlLWBY
	wCCpDrFUq1ZjIFPs10lH0a4pUuyeWQaLUkwxx0/F4VD7b+x9qQvQyEJuWWsD6SaNbg+qgDYw5ty
	QJ3wuBtdTPwfb0Hfcr66Z/BBg7jtKky2igyTxAaoXzRvufI5mCDfVAZipGyRxOXpFHqWIUSx9sn
	/bPt9LrfiSY1DZJeziSlY5Lf5e7Uhq5zQ0vMRjZbcu88V0e6Mybc7sEXgN2pa20zNIbf/mYy9wX
	irtwSPN76Cau0Z0LQyYiV3yrEwPI9V80lLChD7wlB8USfzgnAiPwxL9OwXSEeCTFQLg5wE0cxs/
	DDzDamJo6SosFCtvRpCoYmAyq5km/WvjaHsX4R57ZDbmKzskCFVD8IHMApp/G5XwG7ao4tN/RhW
	Q0lryevwBzlnLF31Hhjw/KBw==
X-Received: by 2002:a05:6a21:6e0c:b0:3c1:85d:fa22 with SMTP id adf61e73a8af0-3c110bcce4emr8099343637.65.1783927322586;
        Mon, 13 Jul 2026 00:22:02 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm67086701eec.2.2026.07.13.00.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:22:02 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][wrynose][PATCH] screen: upgrade 5.0.1 -> 5.0.2
Date: Mon, 13 Jul 2026 12:49:50 +0530
Message-Id: <20260713071950.39540-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 07:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240832

From: Siddharth Doshi <sdoshi@mvista.com>

For detailed information, see the link below:
https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?h=v.5.0.2&id=e9206eff9c9c97bdae4809c97c801e221fcf641c

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../screen/{screen_5.0.1.bb => screen_5.0.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/screen/{screen_5.0.1.bb => screen_5.0.2.bb} (95%)

diff --git a/meta/recipes-extended/screen/screen_5.0.1.bb b/meta/recipes-extended/screen/screen_5.0.2.bb
similarity index 95%
rename from meta/recipes-extended/screen/screen_5.0.1.bb
rename to meta/recipes-extended/screen/screen_5.0.2.bb
index 0155ece374..b88d3e7346 100644
--- a/meta/recipes-extended/screen/screen_5.0.1.bb
+++ b/meta/recipes-extended/screen/screen_5.0.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'file://screen.pam', '', d)} \
            "
 
-SRC_URI[sha256sum] = "2dae36f4db379ffcd14b691596ba6ec18ac3a9e22bc47ac239789ab58409869d"
+SRC_URI[sha256sum] = "ca9a2c7e240919bc7ac12124593ae4529bb4eb5f7349d8857829b7e3f0b3b332"
 
 inherit autotools-brokensep texinfo
 
-- 
2.34.1


