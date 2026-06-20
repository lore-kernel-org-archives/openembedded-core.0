Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B443FCDB479
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:27 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6013.1781960426566123546
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=B08z7Wh1;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so2258040f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960425; x=1782565225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVq5Sa5bTDdmJ5JXq20teJCbAkB9SgiVGP/L0zNR/ys=;
        b=B08z7Wh1pxXHdoyOQIU6ndwInhM0EgYP7osqMaLQGsg0JFoYoYg0pwHVHcc4OuFJH/
         fVw/QAlGXJqLk1M7J5CM6B5flUfGi20f7rz1Yi1DwKsKJBtaCxriLixb0hds611ZXEN/
         rEKGeLcaguFdQ9C7v5jUHKqFHbLr14n0odaa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960425; x=1782565225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TVq5Sa5bTDdmJ5JXq20teJCbAkB9SgiVGP/L0zNR/ys=;
        b=cJcjkA3SEqhCUCYlBfP+oryjFF0c7/R+YzR/UpM1ILCLwjOVoRqPgp6rybsrwW86RJ
         azdv7dQA1sIqKq5CRnb+dPqVmoXLWhVdPNVuN6t+xL75n82wccVnGUeEsrQwwnWeywgd
         Qgy2ek4HJsCkoF1fb0h5Y8oOq/QsmHZDHSU+Bbu3FQl/v9a0sNAKpo4gE9JcRwZM307O
         caJlRTpq9xe+Vb94+VtjBFhzKT2ZT0edtklEcKo7gLz10qILYuh1gTeEqRPVYPfkkwV6
         AURJjJ8GcrYIsA+suO8O49kBccUoZ99vs1dFR/G+M1D4NFM3d6XrlAxLhd3zba6VgnVF
         vvcw==
X-Gm-Message-State: AOJu0YzozOTcGZkIMBB2V2/0juK8ACvzQ3du1LMeNhuMMvk84puKCa1z
	mGvjRioPM2K13n7HxVCmaUj/YqIwent2Yx3UBBTRoYwDVc1MlUqy7VWHw+J7CG38kWPF92mAQFn
	EZ0Sk
X-Gm-Gg: AfdE7cno6EvrWeInZMF6cssSLeFCWVY4CpvVny/Zt2M4Q/UbHn63q+E0fVRSGNlFpf1
	31mmMwMr5eaLbi+XUt+39Isiz23qWKZn8cVdEKWn50aaNVrI7AFXDQ9Me0QQd5LfGDfSCbtf8D9
	Dec3mscNr/1LPV1nJT4ZQAnG+dmLUMJTMWc6vN6neN7F1N44VAvnOQSgtRm5PT+bR8EU0zWYGLg
	ADcYa0c3k8E2gq7oUHRXta2p+yG2GfdPojow0qYEQ5QbYD+WgmuW2afiIQqugcXm4ApF79Nu1Oz
	U8hkJvQT+ypu6rVF6/BT07mFAEiBf288izKEaT8stLrSe/QDq0hsDBnqWtPMQozyRKaLo6C0faR
	c2ro7XrfXoAG6AuW8tP87BWLE4NyIDx70GPe1kaXufKETa886WG909W+5aKFL8k+5vEYZ5qEsn+
	LLbcH9TtzCOveMuOGUdum28ixUX7kEWVIbvZKDhXbfJaodRi//Pav4mOs4mX0rBISv2IW/Egq7Z
	DRWo0IME50fxrI0
X-Received: by 2002:a05:6000:25f8:b0:43f:ea25:20ff with SMTP id ffacd0b85a97d-4656e5c350dmr9883499f8f.29.1781960424525;
        Sat, 20 Jun 2026 06:00:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 23/36] mobile-broadband-provider-info: Fix license to be CC-PDDC
Date: Sat, 20 Jun 2026 14:59:38 +0200
Message-ID: <7334043f7cd23d5022d05dc20240cea2c6533a88.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239233

From: Joshua Watt <JPEWhacker@gmail.com>

Careful reading of the license text reveals that it is actually the
exact wording of the Creative Commons Public Domain Dedication and
Certification license, which has the SPDX identifier CC-PDDC

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6c8b76d240d2457578a58787121bc5873d724ee2)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../mobile-broadband-provider-info_20251101.bb                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
index 441732afe74..a4e93a97f98 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
@@ -2,7 +2,7 @@ SUMMARY = "Mobile Broadband Service Provider Database"
 HOMEPAGE = "http://live.gnome.org/NetworkManager/MobileBroadband/ServiceProviders"
 DESCRIPTION = "Mobile Broadband Service Provider Database stores service provider specific information. When this Database is available the information can be fetched there"
 SECTION = "network"
-LICENSE = "PD"
+LICENSE = "CC-PDDC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 
 PE = "1"

