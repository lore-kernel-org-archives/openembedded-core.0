Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE44F3C98F
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:41:13 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21849.1771944070178357003
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:41:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZZH8L4IS;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439857ec679so712171f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771944068; x=1772548868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sDkW5ODhVrqXD7MjNdpJj1fNWsAcqk/rBHNetCQrZbo=;
        b=ZZH8L4ISqddzDkoEOrk9AdMmg9angFKHOkSR9i4Ytc3YVIcP5xf33JvHZaLlmfCd16
         8vefx3+Uug10uZDQxKPafFHsO2wsHk4w3Y8PAhLekMDRu2Ck47p5yt4ZB4Enj6TGZUXt
         zGemuREBraiPkTVc/+eWGDfWaAnmiZa4ezAvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944068; x=1772548868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sDkW5ODhVrqXD7MjNdpJj1fNWsAcqk/rBHNetCQrZbo=;
        b=sS2F4ERKwEclz0bSSBM+tEdI5r0hwjAwgFWQfVthEVQjD2/OiwUG6Ah4U76AhCRGWg
         UixT2K97x65f3CYeV0U1qFjth1yUqO7fxhL1E6oRNi4wC6j74Zcc0sOIovvSxVs8MuSn
         K+gmQTPLGPNk9PEUp4gpoHbim2IrqAVhEHyhPwrVjtx34w1cAqVeR+GU/ZffluuN44Uo
         wEYDLn2jcPZamlcwO/XVeLWFTNzxtrngza6qewhsImX82SU6wpxHlueUxSlzHIy/p3t0
         KFS4fyTpEcL74yfaPeUdaTyx7uj+hpnrvL16ScPgKqyxvNnAZUJINsaNcASt8GMIOjSl
         eEtA==
X-Gm-Message-State: AOJu0YxuScW20q9o2B8dAt73D5TlrLhoPJ4PQ+P4Wtp/0zo2sy5UUYXe
	woGNpGTLAmkMP0cacyIzwKpF3Zcvx3o8Z0VUhHhyCqq4lbobmhqzaS897p+th83W0gB9GjEDtO6
	TAeU8
X-Gm-Gg: ATEYQzzwBqznbw+iWAJ01A0aWBHYOmGCm6nONCPfa+yLp9ZUhRSmX7XM8LGxdEzxUBa
	v6Xg8e4As6XmYpsOQ15tf91NkQgyQBvyVZADBl+Bh/0Gpi3YCPjxn68UpIeH88rcPSuO2QtzrNX
	xaU+XKhngBf5AtwCpiozEAIyjX5YyKB05qqFgKPPV7OYfivIvMxWnmzDWGc7GJFVRlZxgKX22PS
	15hnQVGYWwaa/ZbT4mMmLXq6PLL+cfLppUONm/IzitTd4H1qHD/rwBGg72p5/6FFO1VqcNeTtiP
	tzmZjV/zQoKw+qMB+spO9JohCzg4+R+J3mD4tbYAnnWpQh/z1pKDS4otnRmCcaPh/w70rL0BOHT
	0Y9j49IxBawu+Xx57KZCCbbSjdO29W2vmB6Q+ySYvXs8V1bHtxMTbGTWQ6dcr8rVf2EZCp3T9zp
	bRSn+Z+7Vm3waWFcyTMIQWtln+kTa5CKNMOa1VrOTj3SOK23kQIX0l5jt3wz+oqlmHFzkSUNLhG
	u7e/iKCEITGc87ssnqVmkMfqnrtuva9cQ==
X-Received: by 2002:a5d:428b:0:b0:439:7e17:c5f6 with SMTP id ffacd0b85a97d-4397e17c64emr7839919f8f.33.1771944068306;
        Tue, 24 Feb 2026 06:41:08 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff6dsm28711195f8f.25.2026.02.24.06.41.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:41:08 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 4/9] libpng: upgrade 1.6.54 -> 1.6.55
Date: Tue, 24 Feb 2026 15:40:57 +0100
Message-ID: <a4fd7d835fdddce5732a4b7cf12b9aeef04d2979.1771943829.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943829.git.yoann.congal@smile.fr>
References: <cover.1771943829.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231856

From: Peter Marko <peter.marko@siemens.com>

Release notes [1]:
* Fixed CVE-2026-25646 (high severity):
  Heap buffer overflow in `png_set_quantize`.
  (Reported and fixed by Joshua Inscoe.)
* Resolved an oss-fuzz build issue involving nalloc.
  (Contributed by Philippe Antoine.)

[1] https://github.com/pnggroup/libpng/blob/v1.6.55/ANNOUNCE

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpng/{libpng_1.6.54.bb => libpng_1.6.55.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.54.bb => libpng_1.6.55.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.54.bb b/meta/recipes-multimedia/libpng/libpng_1.6.55.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.54.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.55.bb
index 3f2b80a060f..18ecc9d855a 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.54.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.55.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "01c9d8a303c941ec2c511c14312a3b1d36cedb41e2f5168ccdaa85d53b887805"
+SRC_URI[sha256sum] = "d925722864837ad5ae2a82070d4b2e0603dc72af44bd457c3962298258b8e82d"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 

