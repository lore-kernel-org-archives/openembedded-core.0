Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4493BC44508
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:44 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155328.1783358260913840898
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LNT+tIjt;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493b27c7451so534675e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358259; x=1783963059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Vc/C/GnmVVESAeTWs4iGKr07CPAYLCS1S+VhRL1kiw=;
        b=LNT+tIjtBTJSIl+rWtgs1+CPpaMlZh8TnWAJLRTO+7VURzLIiNOmrU9o5WpRpSsWeN
         4LSdXF2IK2ELu2Xrpdj6UDioLFsSXzvUMCWNCvy2GMrSPncRozaLOpjggUPYO5AOU+hg
         1zAAsdMz9fdFW4DKCp9jfOyjunuWsQgHkVENtwqMFyGJc87PHmCIQsBaGRcj4fSFWZD7
         YvK2xgJIuOsFjuVPvylu0P8Ug+cVKssblV1Yv/qU8EjnO5eVJWpHDYAo5x5vR+mB+9MC
         5Ne6a/YUCbVN9Rswo8lcaaNJxqAAa0LXIRanz8x7woid+HekBFPuZCxUvnElxTUMfpEI
         2sRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358259; x=1783963059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Vc/C/GnmVVESAeTWs4iGKr07CPAYLCS1S+VhRL1kiw=;
        b=PyiYFBEQ9DKGyT0/tlBbZAQKtQ2KieEubyFbSb8WtaNTFYahtUsvURwd2dQ7vpuvvq
         J6Q6SLlBOnrugG0lT8LbAu4h46j8WVnROSZ9mAheO1ipJ5aBWTKpJK7pVhpnpHdAM10k
         Tv2kWAB6sdVwAnnXrfAcqUnqUmi0dqBbsPD9FCPZbk+TVjRtIP215ihHcCbXFE/1IuPe
         nHwFYN/dbFr3dWkvJtE+J2Wezd/n438Er/ursMOyLDBYwNw/ZENhZry2RKa1wrAKPRYv
         yWYiIz0X+PUVBlC1mX+txtkkzz0X8yM4kFwipB/wqPAs2OZl9roIhV4C5sqqAZwuTPPR
         YU2w==
X-Gm-Message-State: AOJu0Yw2Iqo5Ls8EsMZ4qzJ6eN3yuQ5BBKoh9+28bivqq/e7vxI8DZHf
	BKHY9n662rBeaOuisQtpOw/wifWKYzWxuC0xKbie+ZvqN/Kh95QvXHxxNRxvrQ==
X-Gm-Gg: AfdE7clXautXRdn1BXYw95YrJEQQeqxWHMWP1SMd0fX9ZpRBaBV3bnIbqOFmvnn9mQP
	4ZYQGO0YuBQmElBWSoXb/oa4ksT3Tpb/tQ8QK4IMTg+9rMrxknj6tvII66MOpFVaUgx3p4XVzJA
	Vn6F9bTZG5NYGe4+5U9IGCN3s+6Q1GddW83nX2VsM+oFlRp8da0ax1sGUQGPJfFwTJtUXS4kXpp
	uX3DsbwFp2hbvetCKLg2d+gYqTIAJHzA+71us9bbBaWTrWKL7Wo7p4puwBzTgjNru89fatJvW7f
	N9ijWlJGogApIVvT2cdHcLBM5DXNb0Ni1aJ34ijavdteZxXv5eZIN3AeWRWoC1iZUBgI1Uhmgjh
	2rkYIMgrt1v+Wkg2oXT5jJRfGXAjET9bvyytShO2phgqSJEga90CMsHeh/xv/5qkPOI/IwqcLiE
	SAjnOJMEMTZ2wsLuN7Yxdfcc2uJ2XaL6QnUEfXw6ep8tx4jv5pKSOrhzXQb7Q=
X-Received: by 2002:a05:600c:3511:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-493decbf0e3mr19807315e9.5.1783358259170;
        Mon, 06 Jul 2026 10:17:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 39/45] tcl: upgrade 9.0.3 -> 9.0.4
Date: Mon,  6 Jul 2026 19:16:53 +0200
Message-ID: <20260706171701.70536-39-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240325

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/tcltk/{tcl_9.0.3.bb => tcl_9.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/tcltk/{tcl_9.0.3.bb => tcl_9.0.4.bb} (97%)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.3.bb b/meta/recipes-devtools/tcltk/tcl_9.0.4.bb
similarity index 97%
rename from meta/recipes-devtools/tcltk/tcl_9.0.3.bb
rename to meta/recipes-devtools/tcltk/tcl_9.0.4.bb
index ce8598fee6..8cabd77d7f 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.3.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.4.bb
@@ -22,7 +22,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-src.tar.gz \
            file://0003-tcl-install-tcl-to-lib64-instead-of-lib-on-64bit-tar.patch \
            file://0004-tcl-update-the-header-location.patch \
            "
-SRC_URI[sha256sum] = "407a073ee8f718200c3a004bc2186deccc33356ee5112a71d8b01b55230f4ee4"
+SRC_URI[sha256sum] = "5d265f3499b588681825d8093177830707b7035ad866b17189a3a6ab6dade0ff"
 
 UPSTREAM_CHECK_URI = "https://www.tcl.tk/software/tcltk/download.html"
 UPSTREAM_CHECK_REGEX = "tcl(?P<pver>\d+(\.\d+)+)-src"
-- 
2.47.3


