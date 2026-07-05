Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94303C44501
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:19 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140042.1783291395684619419
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hnGGP/+4;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47d70879764so427532f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291394; x=1783896194; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98t4rFL+EJvAYWvAHuRfUCLh/JjeVyCX9TFX5fuVgXo=;
        b=hnGGP/+4AqP+wujdcNJikH6x9mk8cgmViuSr/LaS5D1tRGamnkiFPzP/q8xgpghkvU
         uVt04kdgOADo6kpU0WbVP/FQWTCKh+nqQ9dho1I09tiy532hmF0Z33vTZd6ix4G7AbWK
         lBP5adhwEnxnbGbhYCsjN6njlEWYYxeTPkXbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291394; x=1783896194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=98t4rFL+EJvAYWvAHuRfUCLh/JjeVyCX9TFX5fuVgXo=;
        b=bl/ydEMfsETh1uRLZKyRcOuS+aQB0O6H0opdgMrzpKBrP1D6kdfiSWyVQEi2Hu+4Q/
         kF4/nbBuP64mEJnIqE65+9VHlwPNBobczpDJhdNgSs5DiU/AbpPf2qlB965TLx9oVml8
         j+1mAipwS5GfxHbOQZ0d52Dbf8ZywsXxhNPQdpHwTomUnECvKW2ivnXZ5CDvPatucX7A
         Z0oPVRGaI+dmz+Q1r/v2dombkooYuD7MZuIjSl+4r7V/bYSwbz+rBSPl/wOQzXjH1/L6
         h/VWWni+ySCuKqe7dAxLG+BxiCvcAS8VmgCYYugsNhe2YtPUDfXjGT5gJb0IJM4tOCfm
         AjsA==
X-Gm-Message-State: AOJu0Ywa/tqmdmKf+IR43lMe9paqAejI7hE2m1tsYCkDWKllj1aNnQDr
	znkqTMCec4rrTO3/UrzR/G0P91dj7g+Clf9rpaBv9I64klf4RJDTewQEIMXS0jLBx3x7Mza4e0X
	gxQgzFmo=
X-Gm-Gg: AfdE7cllKk3cLBJack4QrMCuXHJ0IWZrk+s9LyPVjZQsgLycDt5P9YVL/9b0oRhBb4g
	T1xSTvyZcs/puCRXDmbbipvG0JuOozURNCtfHe0Ec59XueFcsgmXdFbeA6OEAw177IFz7io6OPn
	1QPDk76oPhfiojLeGoge8PL+jHIghnsgf82s0xx981eAnS1B9cZFpb3JtGVCYroaiAodeyw243a
	8BDDx5gZLJzt2vKw4lfIRkaDIr9LHPurjT10+KFwW5Eu8Pv6mL1NetUTY9U3g9t0npx/aHwej42
	0peFFF6gXNfls/UnjHvWm+K15L6CjZ49araGzMasoRw1Cra0rOx0bq+ETyEbc2CyOAjbf4YK4Ta
	B6sRDnI/f4QdFAGi3iXR7JDyMUta1pmDXmEfW77xMMaBFpHpyo/tbV49+axn1bCWcAuWy+TbNiO
	WCCjXhpf/a5Ezt3gEyL+o0KdJCtQ==
X-Received: by 2002:a05:6000:716:b0:46e:98a7:232b with SMTP id ffacd0b85a97d-47aa92c0786mr9638494f8f.10.1783291393961;
        Sun, 05 Jul 2026 15:43:13 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 51/55] baremetal-helloworld: Fix override order
Date: Mon,  6 Jul 2026 00:41:41 +0200
Message-ID: <e1ce8b80c872c5ebca62ea886e76adcab977adb5.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240205

From: Khem Raj <raj.khem@gmail.com>

In current state it does not work as intended.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a02059069443cfe0dc5860eae4aebba68b9a4ec4)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../baremetal-example/baremetal-helloworld_git.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
index 43077160697..5af09d4a8f5 100644
--- a/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
+++ b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
@@ -22,7 +22,7 @@ IMAGE_NAME_SUFFIX ?= ""
 inherit baremetal-image
 
 # startup code for x86 uses NASM syntax
-DEPENDS:qemux86:append = " nasm-native"
+DEPENDS:append:qemux86 = " nasm-native"
 
 # These parameters are app specific for this example
 # This will be translated automatically to the architecture and

