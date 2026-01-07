Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C2ACF6C00
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 08:09:32 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1457.1767773369090444990
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 00:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OVvyvD1x;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso16501695e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 00:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767773367; x=1768378167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ytxzHSDI8jkX246u7UlJqUnkSB/5fPdBx1R77jF2jk=;
        b=OVvyvD1x6PsvNgYZond69q/dAXxwZLH9Yp+bKARgwKqLo2LFZNhd/9JBcS2sAMJCqe
         idPkgNXbDv9+CZtrrJ/TM1f/E80Dgk2x2JMqSThSIlAKu4aKr+h1HakGhcYya94UEwRt
         A8u0FM3hG1fXCHJKA2pOTPw1n0JMapWUav0d0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767773367; x=1768378167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ytxzHSDI8jkX246u7UlJqUnkSB/5fPdBx1R77jF2jk=;
        b=vEq98VNS8173cfMpkiwDX3rfcrIuv/b/2ohSQozVpW1tV0MvDCAPq684DPUAQQVrM+
         VK4yOwGzPhIoT5rw6iu9BkGfpO+oxbFIshsf+vg3xHDVzNL1ZA3dzLwzhG5ip2HI/5zN
         +D/PXx04YyF2CUsDVeLLtO+cupUen8nMAfFCTwSj/gz4jbmDoWjaRmItG/wrH30w/+/3
         QpgXuhDtwYoRNHYOxDVb/deIfcH9xoWAnLSvRv+oWsIXu/LPgGPud7YDWJeWa9cQ+ckQ
         IiQUAwHP9p4G2i7zMBFQs76nYYTE82HxoKdETgJ54rA1lUeetBla46BydfFQX94nNmsM
         4azg==
X-Gm-Message-State: AOJu0Ywrac1W3d8rXAvtRq6wC5TQtVBdUyAZpv1jk7x9KkBWLXpPAFZ5
	cNyXnv/ATht+8TTrJgehyeOtjvaZr0pNHY1AhiFVyMhl8GMacKcuegQnhEG8XNhIMMlVJeYwaxh
	lce/8
X-Gm-Gg: AY/fxX4L60lChFsDIt2AwJDcfNh5GLUcOVtXLCPQFSufYSCh+JPtzl7/3pnSv+qodto
	LSmTAvccGo789WlVDQw7cFYm92PWcMSpEKhUSJoMlhMfjiQ45VnxOPQOkphi4U+YivyzYkx7LT2
	VJ7PLwTUuS2BonhU66KQ189pX/2t5aZG1FT0k8H/LDqzoS22+JKisZnq2aPcfXatYGjZMsvrYR3
	Ho1JTe/jBLlkFLghOnQoYh3U36HuPu/F2YQwQHioi5JpTkFol6NK9z6owMFI+ubh5wb7IxExbfl
	0MJFZZCf49p2ZZqgsB1Qljc8t4xD1MUtrK7uj4rQ+ozk//bQbzn2jeCYITp3q/UFa6yNo0AmLGB
	9bdiJOMC4IhxQbW0oEXlGa35HgAY7a7jlInS5QbCkhl+7xefbU9s4+vh8FkRR6UZboWR1jT16N3
	vijjKOUsljx03JvXHoqAFQZQcYH2nIdsIqdVRDpL9681daQFj3o2UGNsaxO423k0H1dFUqvmHMx
	dEh64ACCDwzj72IpZFOBtX6iA==
X-Google-Smtp-Source: AGHT+IGG040XtEPHczSt8jhbvH0dUT97s2ZD1ghoZFiJ8cK6tno8odi6okcIlPYQ9tRBiK8G/6vT0Q==
X-Received: by 2002:a05:600c:1392:b0:46e:37fe:f0e6 with SMTP id 5b1f17b1804b1-47d84b3b724mr16292005e9.30.1767773367050;
        Wed, 07 Jan 2026 00:09:27 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8715b5f7sm6093485e9.4.2026.01.07.00.09.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:09:26 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 08/11] libpng: upgrade 1.6.51 -> 1.6.52
Date: Wed,  7 Jan 2026 09:08:57 +0100
Message-ID: <1adeb41577b5b7c0004a92b494947a6a2cbd20c8.1767772758.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1767772757.git.yoann.congal@smile.fr>
References: <cover.1767772757.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 08:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228955

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-66293

>From Release Notes [1]:
  Fixed CVE-2025-66293 (high severity):
    Out-of-bounds read in `png_image_read_composite`.
    (Reported by flyfish101 <flyfish101@users.noreply.github.com>.)
  Fixed the Paeth filter handling in the RISC-V RVV implementation.
    (Reported by Filip Wasil; fixed by Liang Junzhao.)
  Improved the performance of the RISC-V RVV implementation.
    (Contributed by Liang Junzhao.)
  Added allocation failure fuzzing to oss-fuzz.
    (Contributed by Philippe Antoine.)

[1] https://github.com/pnggroup/libpng/blob/v1.6.52/CHANGES#L6307-L6316

(From OE-Core rev: 424c8aba2a52f464b2a652f56770437bdd08bf9e)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libpng/{libpng_1.6.51.bb => libpng_1.6.52.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.51.bb => libpng_1.6.52.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.51.bb b/meta/recipes-multimedia/libpng/libpng_1.6.52.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.51.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.52.bb
index e499f61ff4..fba6e77b1c 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.51.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.52.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "a050a892d3b4a7bb010c3a95c7301e49656d72a64f1fc709a90b8aded192bed2"
+SRC_URI[sha256sum] = "36bd726228ec93a3b6c22fdb49e94a67b16f2fe9b39b78b7cb65772966661ccc"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 

