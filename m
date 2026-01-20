Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A667CD2ED19
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:26 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6480.1768916299385035380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=E9OLVIz6;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso19181345e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916297; x=1769521097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XStaf7ehbBJIePHC346sE0YpAQ0kf8A6IPlxMKxuwyc=;
        b=E9OLVIz6JFsImuJpdpt4QVQpvCLnUEYr8FOPez6EnCBee+DhsW6Le0OUsNShZ35m2G
         wriCj1xp0N90gpq0Ge4EwKS3A8dBLew8CzQ4EsszCE6dOqaXWgngJsz5W9jM7MZI35ef
         Q/kccCarPDf6QJMRePVBimUK0SoawGxHDa4Kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916297; x=1769521097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XStaf7ehbBJIePHC346sE0YpAQ0kf8A6IPlxMKxuwyc=;
        b=DfyJYsJeKy+pf08t6PBmMh2liiRjr2pVV2g2m8vppVmrdqxG9JPxsZvaX+Ld5N5+NF
         8Cj6kTTy4R8QYjqVT5XVSsb0d5dift2GJQ0CVUEgMk6+sGubSEBBTKs4FwvMBGzf9TA0
         /hOACqACCvzFuomILyLB9DpkXMgJdcsV9O+6uYTprVQNDLIC9n+58W1gwLQgkeoTM9lF
         AbU3i6Y9QriDVY783SdYze77QCGDQXDkNBxpVUu32iobNzCGbvGYLa6Lv9g3dW5zDFZ3
         JfKNU/GVkSVtyvHZHmwEMPEAdVh5CspzAe1IlCfKDMr1vQRvWfvvi/uSPfBjBCdiK9Gl
         E6AQ==
X-Gm-Message-State: AOJu0Yx59JpNlW93L04YgP09rRKwvyNKkd+MNi+nY48Rc2SDxcel2Tkl
	D4tOE3GQUk6rE4DJbHv70CxQi/LZANd7yunemjktRlTuu32C/5b/8miIFoSH7gz+Ao8gPQma4Ao
	LB9ud
X-Gm-Gg: AY/fxX5C0WHK9WXcPxHvPw2udVa+6TF+VtWSCUZORcEf4NEVV8Mqwm1LXRK2SecOxc/
	P7YHZ6G06OCLikektGxRrxjIuH4fcMc46ZeSSEkpy3rqw1ZJRZD15o2ED6RXZh2jS0TPaW5IMLZ
	5P2KQJEQqLV+C017ZMeo8hK135x9LxFlDHAQ1tSnljW/3uydFf5LTZzkMXVhZUM9n04+di902VX
	XvIQ4ksWgw2UtQfxmJlCGS88vOVKKU2R87LMRnjwBStxAmH5CjezOwsPo9q60iXvLYqc51RBksF
	cYshgx/E5uZq+dcaxxIx0SR88b0qGc9tLj/wbImd0LV/uRaa1picIQYD0Rqkjalw/TRZgrpcLVo
	v+vqPNuVEYA/bzOloS8Z7sTurPqoIbkBEfMrvDpTcqMC8g1D5tYIytu45/+BRofTxfwAN9XgaWs
	T9FAdNOI7NM5H47D1Yt/AyonU8ykfr+dXSGyW9csOfoQwQNy04ZOpptPOda0vtPb2mTlVlZK2Tm
	gx6jTJmjKjLytEpgSJG2Q==
X-Received: by 2002:a05:600c:8109:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-4801eb04f54mr180878705e9.17.1768916297561;
        Tue, 20 Jan 2026 05:38:17 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:17 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/26] pseudo: 1.9.0 -> 1.9.2
Date: Tue, 20 Jan 2026 14:37:43 +0100
Message-ID: <829a0d214c3f47d37f6d8b00404243a021dfe411.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229727

From: Robert Yang <liezhi.yang@windriver.com>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 48a42747fd280ce68283e1491971d22273e3bdf2)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index a4ce08378b..a4053ac2b3 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,9 +12,9 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "3fac97341f0f8270ca28a91098d0a58ca306a6bd"
+SRCREV = "b4645cb30573c5b3d5e94b9d50e1e2f8beefe9be"
 S = "${WORKDIR}/git"
-PV = "1.9.0+git${SRCPV}"
+PV = "1.9.2"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

