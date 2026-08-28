Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA16C61DDB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:44 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3071.1787945921811629876
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RYlm3/lF;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so13354735e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945920; x=1788550720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iVIQeZ7t2HtWjwEg+GVW861+Es43k2G1X6r2pue+95o=;
        b=RYlm3/lFJ5B9iriink2V+kHmhXSqRyWocIujxnbXFH0fsc6k0Kuce1AMFrn8+NRVc5
         7zLeU1d86YJJ/HHBmuNk63JNlgoWeDLWDQkAbIUDfTmSHJd5ErDzC6+2W9GWGxtIVXIw
         7IVNnP6VEu0O3EQESsrdU5o3UE0IWQQfqejI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945920; x=1788550720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iVIQeZ7t2HtWjwEg+GVW861+Es43k2G1X6r2pue+95o=;
        b=h6Yu4lMQVcEKF8sf6cAE6lv6tLDvhgocKbGVX2nZfdmo/6hBVkU2Dgvm1VVTftGYYl
         Ta7zL2bSgtV2PHotsBVmqZntRYPiF4mLelNagqksKC4YG2AKPNjbYPxdQuEg4rslWYyI
         AmoeI4Oj2n/NClQq8tLsKaHiFbYqtNfDGa0rOM8nbN+SAzAG5/xI+8/u2GQzjFw0L+EU
         5ln9umOLcPMXzIRY6Toz9KMPtPfIYzmhSSEruZclMNqggtmgc2xE/8rpsE+hSGeji33u
         btRCNFxJmf8ot4elkEI6D64EcUvoASA0kvcAtf746tfcqiS9fP7z3dGqOXvtRCrAf7N6
         RRzw==
X-Gm-Message-State: AFuF++mIMq7cws60aPHA6BapwAzjl8HPmKCI9gUlkYqyfTwhNnKCkQP4
	IsrgsyXYG16RcZSxermhebMIbCHu9OyEMFXLGLkQkzI0SIV4L6pAPSmdFVdN8YuT4Voc80TvyJt
	/xWU6Btc=
X-Gm-Gg: AR+sD13i5kC3HZdALoEPgHHOqHbHSXEW1UqFj5S+0kjAICva3OwQoI8u+SgxexwllBD
	x/NWKynnkWUo4tqCota4dacaOEn4nIv1fEATm9tWdpvUj08uIcB/Ea2rvmToz88l8BTzT+DH2Lt
	mwMUbUU8Qn72pwwkmLCHtALLl2uaAKybQ64lmNhc5Eph8IDr0wCGMty/l/WFRoKjdc+6lU8ofOv
	qEEo4e8MR28/cI61eri8/T34Hh6scfb+IdckRwmucC0JhRKjqPIJqQDPxxMqKvLGtEWmCheAM7A
	dIuxeEJ3OIzOo54oHQL+KpSqdiqmiEK5W1S5y3fL76t1NKUstfyg6DVI8E9JD9fSUry8fV5+iYS
	KymgNxyj7HbxkzYNMMlcgdkMTkLDDzDSBSOyk0o0txehZpogqguwCkW3KnTe8z7/Vlo1eYn3ZIZ
	2W/2gaiC7Zwq8628wwAyxrq/n4ABczPxQH3+z5tH+7R684VplAErHfEaN/lhQ1zRAwRXeWxr1Wp
	/oYokfXu57tSIWxtU1ydkxDDB8RLpd/+3Gcly/dH8RQEKNEEJAy/0Xi8sPlwJ2hvVhpEKQ57+k=
X-Received: by 2002:a05:600c:1d1d:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49b91c2dfecmr134367335e9.8.1787945920018;
        Fri, 28 Aug 2026 12:38:40 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 56/56] pseudo: 1.9.10 -> 1.9.11
Date: Fri, 28 Aug 2026 21:36:06 +0200
Message-ID: <00c66f1d38a234f7738c2eb8fafa41b4f057a865.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244617

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Adds suport for a working close_range() intercept.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9a68d3f4bd0e80ea7e1ea745b6a10acd341dc7d8)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index d0559f6c9f3..d8466b018e1 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "2a5521e9573049864e07907415f1fee28232d90c"
-PV = "1.9.10"
+SRCREV = "ba8887e5f1e922f866681ec7dec1a00b602a9328"
+PV = "1.9.11"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

