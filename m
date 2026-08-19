Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E55C5DF91
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:58:03 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10413.1787155074245744888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wXVuS83p;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f71156e1aso546669f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155072; x=1787759872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RD+mraslbg4Ke6XBizr0gN8MmPUjpQIFoDbagKW9BQM=;
        b=wXVuS83pPJuWcj7bvX0QkVGe2JBILNcebh09heFG/XWkOq7FbExOytkvdr76crufLz
         rn1W03eog+VtLftsZyZhhMDasKsnsNiZCZIw2GTJMPbPJKtGtLk0XZZsvGMo9pzbAKYk
         gYpR7mnsnLmAKbncUepeJCYl91cZkS/0GGD3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155072; x=1787759872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RD+mraslbg4Ke6XBizr0gN8MmPUjpQIFoDbagKW9BQM=;
        b=r4qyqGFBxsI1jN252jWmY7WwvmkJuCSX03X6nFgV6owSyHhJp4wbuY21ZdqVC52IwT
         dpKriB6e1SYRapZZ3xrnRpyluj3xC1AJVeCqIVS0QOuopogUZe/3KKyf0tarlVUFr0Yv
         QGjfBmOhjLa+wl0SismRMaLOzuJpCTX/0+lvZDh9eGBkDngJt3sDU5rmw1BcjwZ4CCAU
         WYQSv56YEkDTIyDSy/8CJE2tsS9a0THz3UwBhlBQRhVXT54wELvzpXY9D2K/mWEvu9g4
         7cKXJOG+64Txyau4+JHqLCVEgA7C+TTdaEklwJtWWAn5vXxICleiIl4rByDVCRWgd1VQ
         Dz6g==
X-Gm-Message-State: AFuF++nbuxbz9GxwA5FUDZ9k2kIBRDFdUgCvj2SCXYziZN1H6ceYbnG3
	CYBH+obD+ns5FFqUDDN99iVVk4B6GdpLlQuTJCcQmi7s2zohrLGa59miKcck/MZnz7mjAyKt7GC
	i2FBFLVQ=
X-Gm-Gg: AR+sD12n2M0UE2BmNSveios5wcrpVrqLxxK2KpXKWtRfIlfSc5AxhHo9pknD4YryOLh
	Zz7xZIkNviO9+CcBJXyFMGJV09Y5TwQR8NV1buHrnhZgse+2Sh4VMUczpk07nP9da0HkkeUOAuu
	aOze76PqdNP8TVue5pjRXoGacrRdCc9A1DtF77SOGZOAGpWc74ynkwc6ZELGbNKDax7ujPQAMFG
	YMr5RwZ46RhdUs6fXix1TiQQvXaJ6LXVCJFDFcmzuWgRBO2yKt2PVT2VsyZFUJ7KSrWVhD3946X
	lqgrSHJUB8NHSb1XHlpvrOAy0cdHNIYj+Fgw2LNOCK03dWddO0lvAVIFyj4G6snskuWQzSGZTAa
	l1n4eTk+wKYxcONN59Oc9VKkXm+u7Hgwl7k36osNDD+1HI79FCnRS7D+cWHNaP5U3/9TuCvDpr2
	zpM1ZOmPH1nClIHyJBVp4dfdK7aQiHHD4oUmbyLo2mgPTVGTwD/RMV0Q5dPy+xdwtUr6eU0VKLY
	hlm6PkGrqdfIj1zndwSpyiUzy7D621VblycSt7EiFSUVZDm3XGnLCDRr3FRKc/EIh90OgwWNKK5
	uABrX/Qz1s5HPa1xQG0SUOekwQfsFBlgApgMviYyA4b0aMfEBwM=
X-Received: by 2002:a05:6000:3c1:b0:47f:83ee:e56f with SMTP id ffacd0b85a97d-482b1fe2924mr11604755f8f.18.1787155072431;
        Wed, 19 Aug 2026 08:57:52 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:52 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/37] u-boot: Set CVE_PRODUCT
Date: Wed, 19 Aug 2026 17:56:55 +0200
Message-ID: <aab60913362c1c76676565da628dfc8fb53267a5.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243760

From: Maik Otto <m.otto@phytec.de>

The CPE vendor is "denx" and the CPE product is "u-boot".
Set CVE_PRODUCT for properly matching in the NVD database.

(From OE-Core rev: f4c9c7930bda530f60248a5db8e45c89f2c66f50)

Signed-off-by: Maik Otto <m.otto@phytec.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d2e5d427de13b33694a1d802f5ac833b2c04ced6)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 7935f2b4aa4..00dda93b4ac 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -19,6 +19,8 @@ PACKAGECONFIG ??= "openssl"
 # a host build dependency.
 PACKAGECONFIG[openssl] = ",,openssl-native"
 
+CVE_PRODUCT = "denx:u-boot"
+
 # Allow setting an additional version string that will be picked up by the
 # u-boot build system and appended to the u-boot version.  If the .scmversion
 # file already exists it will not be overwritten.

