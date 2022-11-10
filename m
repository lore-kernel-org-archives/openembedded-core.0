Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7619C46467
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:13:15 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.7.1668103985679797768
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 10:13:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gBSzElzr;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id t4so1628116wmj.5
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 10:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyT8WTv4aKK+TEuV+eSbQ77ZwVbC8I5z6iUPtWftS1M=;
        b=gBSzElzry2p6j02DCXw2uMCOdDiFlduF2anPgcR8JiQF/LO8Dt2/gzrkBs4o8a5flc
         2H7F6+wU2JLBb3+SFH8XNPZcN17RFizEZmB7Igk4HmDURVSOaWHAKYVDQluD4QHOIkt1
         ZO9gxS+4w3a5f9bCvJ0qKahJ95o2lLGpJrbS23HxiMNr7DgwZyXWGCruWaDFXulxLDcD
         CkEMxwfeSV5Hq1XcvdEpngWayxewiTSbpzP1DCWlqoarAEoD7eJ/V9S9KJ/g84Nr7VSu
         o3ZY+0CRPC4wPLbHOUPiWp6tP/cPm9te37bxw0P6TmFu8VpL/rzvuoE6oAwG+4feeSDj
         ZI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyT8WTv4aKK+TEuV+eSbQ77ZwVbC8I5z6iUPtWftS1M=;
        b=M0NvWOEsAlFAd/PvVh5F8z5vxozCDZL/fRLHdoCTCscjLg1aRIRUQCGLOnp92ChEH0
         tmCL9+GLW3YPxLylK8ej+oD2ZNKAJ2fN64ccu1UsZcolS/LOwO4h1uXVEcMm+1dI+ooq
         WXS7+cX2KFpswZa9JTta/lOKE3cI13VTdRA3V+NGPxc5BEwl1+qBhq6FqtK37Pw235oS
         9vnrYQ4Nxcklz305umHdfWTCfDl7/kvEd8vm3vyDKRTwYaiw+XkKLGeMU9sZsImiP8/R
         /OEvN+M1UpVR2xV4HJZoU7GVVg3DTFE8DIXcikRVudJ63rCDPB9oKvwyyU00W0mtAvrg
         G3Aw==
X-Gm-Message-State: ACrzQf2eAMXcRKkEnOB0HpUQQ1pYo84GGTwY9zjXM0DO50M1oXhNmoVA
	DT3jXtdu2xZoz/YrBRNmr6K1DR9VHQU=
X-Google-Smtp-Source: AMsMyM46cTvbfuFXGVi1VH4KDh+NPbePm29NNMUSmx1kA+sZ68gPc5gEX/o9n+uj1Ft2V0m66LyQSA==
X-Received: by 2002:a05:600c:4496:b0:3b3:3084:5ddb with SMTP id e22-20020a05600c449600b003b330845ddbmr1052161wmo.108.1668103987925;
        Thu, 10 Nov 2022 10:13:07 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm8400477wms.3.2022.11.10.10.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:13:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/19] xf86-input-vmmouse: update 13.1.0 -> 13.2.0
Date: Thu, 10 Nov 2022 19:12:42 +0100
Message-Id: <20221110181249.1240200-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110181249.1240200-1-alex@linutronix.de>
References: <20221110181249.1240200-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 18:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173095

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-input-vmmouse_13.1.0.bb => xf86-input-vmmouse_13.2.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-vmmouse_13.1.0.bb => xf86-input-vmmouse_13.2.0.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.1.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.2.0.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.1.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.2.0.bb
index 5e740037d9..7567b1ef2b 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.1.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.2.0.bb
@@ -6,8 +6,9 @@ protocol that is provided by VMware virtual machines to give absolute \
 pointer positioning. The vmmouse driver is capable of falling back to the \
 standard 'mouse' driver if a VMware virtual machine is not detected."
 
-SRC_URI[md5sum] = "85e2e464b7219c495ad3a16465c226ed"
-SRC_URI[sha256sum] = "0af558957ac1be1b2863712c2475de8f4d7f14921fd01ded2e2fde4921b19319"
+XORG_DRIVER_COMPRESSOR = ".tar.xz"
+
+SRC_URI[sha256sum] = "56f077580ab8f02e2f40358c5c46b0ae3e1828fc77744526b24adf1ceea339b8"
 
 RDEPENDS:${PN} += "xf86-input-mouse"
 
-- 
2.30.2


