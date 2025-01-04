Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12984E7719B
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:46:27 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.18201.1735998378571704354
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:46:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qqLpjzFO;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso13691612a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998378; x=1736603178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qlF+dyKUi+ixdvDgEEqtCbhXk8Gy8KUbLItBF++I9t8=;
        b=qqLpjzFOsH7Hok4WMFAXfuW1CbgymDxn/RRyUkyOmfANf/YR2uhSAPqYgFgx8v1m55
         dSrfsKYJphE/0wv7EvnSWCGOf3cJibXDXkprii4OTIC/7YxM57qD0IFHQTt6SAE/xYmP
         YzGsIiH883rV0s7ugYoiumPTJ+rGElJYjVt8LoDnZI5y9+4LqcB4wGDvDElrZ6LJ+yTR
         vqBMkQKVAYvbpfeDgQE6YWal0wL/RYk7rAgQsHHVWLlcuMU+5ltu1F34z/P9SttSOsGd
         ghVJyGQI3pecKV6TAmhQe7JjRikZlYTwQaS2BtGWX/i0ytU7/FWCryaf9c272XuBJXQp
         6X7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998378; x=1736603178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlF+dyKUi+ixdvDgEEqtCbhXk8Gy8KUbLItBF++I9t8=;
        b=hIZ7n0yzgQpyKyuKnupjPrSrCz7xbXSwRwLfy3aGDuOqeaKpAncZQl2dX9eKAdcXsg
         TNmryqt/rV2AqpaygTH/EQsHPmDDF2Ly4R1fxcEfwSTX0R2ajbPtUdoEZl9MeJ16d34D
         IhBELjiyFl3hqAbcQTxMSGy6B6Yw5MPQk3a9FP1haNp2uRqCxlGnLHcYXUmgUZtoojv8
         SiC16RkuDGn0CGQTQDCyHJxxBAwjpl3yTvsZJPVwL64TXZ0fAQSvcgVKrLS/cFxy/7Lj
         g1tp286Ofu9ocKPEme5wUTPoFWR872Kg+nRIFbwwx2xoyQ9eHGZyoJwHd6T4WIU35p2L
         qtlA==
X-Gm-Message-State: AOJu0YzQGeizOhmhyhGp2jiinJk1unVUfg0g6pcRhO3hskKUuGzv5PXk
	P7+LKMTOK4zJ4G17MOV0nA1ORnJpQB6UFgXrttz7rhG95s7WICEb9iN8aSWiJrVliDNBipT4XAQ
	m
X-Gm-Gg: ASbGnct6tg5VR+lPuRfyrCZ9XuUG5yHz8ei4cqnxEONSY7TC7KuaiWIns3H1hDWLsNv
	jpQdgbp1oFDMsEsG4jZnSz95l3bZVyTh153Ia7vBxVjerDpgs6fGytTg1k533E0Vuf1Ow5PxeCp
	AJHcY2BCwwMTJfvRHqQ3Qdr/mHKRd+/bzQy+lfF9xaZPrOjBVVIfdjjwaRoNiHimuQyDIUFKe2n
	G3yJGDC7bnV03JNTPPLZGbzqqPdYAlsZWHlvs3XsBEnog==
X-Google-Smtp-Source: AGHT+IGkWXTU2tFfEXwmN60xPcXqYiTjmOdSk3T90A/YfdwQcyhkrSZCSnMMNt9Q6EI7lJAbkBGdww==
X-Received: by 2002:a17:90b:54d0:b0:2ee:c918:cd60 with SMTP id 98e67ed59e1d1-2f452e4a7f6mr80614197a91.20.1735998377807;
        Sat, 04 Jan 2025 05:46:17 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f447882b09sm33498230a91.41.2025.01.04.05.46.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:46:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 04/10] gstreamer1.0-libav: explicitly disable documentation
Date: Sat,  4 Jan 2025 05:45:56 -0800
Message-ID: <b5bdcba0a4f2b3cbc3478022e82a6e8916f59587.1735998221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735998221.git.steve@sakoman.com>
References: <cover.1735998221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209399

From: Ross Burton <ross.burton@arm.com>

We can't build documentation when doing a cross build, so disable it
explicitly to be clear.

(From OE-Core rev: 2706062d3a711ff0b2c03bee40b908ad329ebd6d)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
index 7a72f9120e..4036006551 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
@@ -22,6 +22,7 @@ inherit meson pkgconfig upstream-version-is-even
 
 EXTRA_OEMESON += " \
     -Dtests=disabled \
+    -Ddoc=disabled \
 "
 
 FILES:${PN} += "${libdir}/gstreamer-1.0/*.so"
-- 
2.43.0


