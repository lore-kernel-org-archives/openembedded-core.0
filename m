Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4B2C98315
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 14:17:56 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9008.1790259469769274379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 07:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TW0u1/Ri;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so12137325e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 07:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790259468; x=1790864268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SjnKs8hCnlvTOoCoXE2E6H9AbuovA61yIRpj5fu4kdM=;
        b=TW0u1/RiIDqc7kjte7BTVLo0Cfa/Xy5AaqjeumRPFBCfKPtW+5pInpaGLSW8Q+JaE1
         EbFb8Udc2utW/FOdVlcmlgSYTEcRVBb7ndk4HeXHASvirUcYk6Y6Nh8uijMbl4Z/B0yo
         hN2iG0wEg3oM9OnEKC1PDZwGcK0z74QecRqB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790259468; x=1790864268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SjnKs8hCnlvTOoCoXE2E6H9AbuovA61yIRpj5fu4kdM=;
        b=fJXmE0ikBWc0Sa1dO/Ta1uSeHAPE+n2cNQI/DP8E9BDj70vOtyR0B8bzyNudkAyeuF
         XEOu/njZyR4ddj/kiEvVkU8fcwiWHbveUeRtniaT59ghNpNOJCw/rAiEHoOs9erlwfB8
         eAaTAxF26AbeBlMricjlMbZhgiDihbg2jCq21kL9Ca7GKdBrRbNp6WtyZltCcCOLJG5g
         OXdZuxy6y69REIxX9VQrZFLEinN9qSGN5eyFD6xXd4d1hUbKoZShsFrPqa0tK9RWY61g
         qXl51rpQwJSnXx2/uevg7bGDMgxbmEdJ9pL/XrHguGce02rJIu0Juwfgd454hObEi1dM
         Nhlg==
X-Gm-Message-State: AFuF++lHQ3pEF9KBOpqlncAzdKbQjvI9LJfrwz1wz74TndQVtcRdY6l7
	ByUF/70B8fSv89UWssQs1sRN/tZGU1dydoWvI362LyjkcABsCCKVqerfh+ffPSjtlOEQ6x4wAbE
	H0wnAq9I=
X-Gm-Gg: AYBFou2dk51UZAoHR/m6RKxD3Xomq2J0GYm1tcVrhwAS9VMS7xVUjFkCI1m3ugzyL82
	yg0nlWm1kzuS1nHDifqUbuYHQUxyqegHUnByd+DwTHG4+xjipoCXgwzTX7diN9RNmsOIQKrc7BN
	nRMw8lPOBvDburJ+Kq+F6d2sULRc7c6SVd//Uul6V+pHqIbBwdUAtxCSofvJ+KG8Kh/ajsVL9Te
	wEhpy6GF0d3NwltnTj0V7A7IqUFtWemKNiLVnBLsJ8wFVXROCmw7W6TWB11ZQSyfdrGypk99nWu
	csbz6LAj6XyPvblYz4+iBb3RFJ91roZAlZxppootTV10GpMFAfhcSMD0NoTJfCVRb8l0LmZHGnu
	hdfgjTCkuUwtHCvnHb+JEj769S8Ih3W76zJoQReFMsOy7v10auIsWRJts7Mk18RI7QrwlP+GwmB
	TNvU+GDf9TAIfFAgOHHXLxBHukKYvshjXs6GvR0nm/qHlhZ4g+zijxYBYPorVBQ5TzY1VjhD/1w
	N+WKD88XTuv1eN7OzOXo9bykQ==
X-Received: by 2002:a05:600d:848c:10b0:49f:e941:d6e with SMTP id 5b1f17b1804b1-49fe9410dbdmr23341145e9.21.1790259467712;
        Thu, 24 Sep 2026 07:17:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d896:f63e:1133:71e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm14831083f8f.30.2026.09.24.07.17.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:17:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc: Fix configargs.h build arch contamination
Date: Thu, 24 Sep 2026 15:17:45 +0100
Message-ID: <20260924141745.1027540-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 14:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246588

The --build= option to configure is leaking into target binaries, which means
different host architectures generate different output. Fix this by removing that
part of the string alongside the other patch changes we already make.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-common.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index a7f01cd045e..41a8177e0c3 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -125,8 +125,10 @@ remove_sysroot_paths_from_configargs () {
 	# plugins. Additionally the path is embeddeded into the output binary, this
 	# prevents building a reproducible binary.
 	oe_runmake configure-gcc
-	sed -i "s@${STAGING_DIR_TARGET}@$replacement@g" ${B}/gcc/configargs.h
-	sed -i "s@${STAGING_DIR_HOST}@/$replacement@g" ${B}/gcc/configargs.h
+	sed -i -e "s@${STAGING_DIR_TARGET}@$replacement@g" \
+	       -e "s@${STAGING_DIR_HOST}@/$replacement@g" \
+	       -e "s@--build=${BUILD_ARCH}@@g" \
+	           ${B}/gcc/configargs.h
 }
 
 remove_sysroot_paths_from_checksum_options () {

