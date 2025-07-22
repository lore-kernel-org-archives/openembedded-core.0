Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFB5C83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 15:27:14 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.16250.1753198026186688944
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 08:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KJQNu75X;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aef575ad59eso354671766b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 08:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753198024; x=1753802824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ifiTfQ8Sn7Vw9EFEVPDf7O7ueEHvdmR+754KwSsSdQ=;
        b=KJQNu75XIIAORZEaXjfEzMHfFWTWwmDAMnf0OKkRgoCwWWzeBtYP4Vn198FhcEfSPr
         dej1F18pal8Mw+oh7Cb2XnSqXLnMUcUtvNNP8xmCUwos66L1D/42kVquu0ulDX+CvKDa
         PnPR4Do1Fl13F8I1flO2DcGix883IOBS4dla5UA9bo25JJCbGB4gRPY4HvAaM0nvPK+7
         2xgXZcFSVyV9zuiQldhkzHU1y1LFQa3Eti4MoHcuiQzLCGByzmfJQYzKk8WikNxjRUmA
         dz93txEeA0E1AV2fVXLVkREvwXWMp2mqjEKt7Kopi2K+wmkp679NYZAnBY9TND/DLZ+9
         uxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753198024; x=1753802824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ifiTfQ8Sn7Vw9EFEVPDf7O7ueEHvdmR+754KwSsSdQ=;
        b=UIpCmgyTu/SfHbxznal3QpLdeVYgK3e9GaX9ZtimrNlxlGlsR1hiKN8kyCw3/xN1JG
         /tg3vFA0UZYG5PGoEVNAPQxvAsFmn4s1xKQOMwEVxgGaKKD2CrOrawKfgIGfFf13azNs
         4IwwSZFAqMNF8fmAA5WPiZ9D5ZvjCgVw58bmubDhKaeK6sM53FGAKJC+ckY5fkrO8CZ0
         MebcokqquAoVtDfOGl1THEec6cv8YE1/Y/KzUVyiPuyRuZn1JuB5K3e48Jl8dXEn4V9d
         8f++2zr0r5Dh/rEncIGzIW6hUq3ZpGJGr9ou9EghQlYQwEZ8tT8+wEA/i9B0T+kPo7dT
         RtXw==
X-Gm-Message-State: AOJu0YwE79ZHCtnsp4adPGDc3z+DVSMd9AFn5xMDhIZflAMNOltXPvpY
	5CoTA+Ciz5GOF1QA/gvm3F0cdb2yQWwQTxj9vwNiV6uc3FVqRInWC0JC717Ypw==
X-Gm-Gg: ASbGnctE7hM2oAww2LtCcKYU+hSeEpLUAXMqvI9DBeJP+ImO2CNTaId8959STP+NrjT
	/VIB0p0q14SNb1X03hEWX1zKlRyJxr/Ipk09qPQgFa+V9SUBKo6k1ttkkFcVR8267dwxODbzpJt
	k3qr5mod0gv5pFBUqHhakGCfj8DsDVV95tDUOvY6MJ2fVcO4yFo+NWhfmbG5fhJimDzgTzfh/ZJ
	WUpzVRmKgSkrLHoVg4kTgpqxS7WQjiPDd6fgYS0dqYlNLgmNQhNWL/nPC+RHOVr97eZf96qrnbo
	Me724ZTovKfMRver6uUewFIcaEHCtY22O5+G/5eib/WfsNFaoVCV1Nuo0LFACcmfBiKCTBLUTXO
	mtauW+OnElUze6tjqrjk=
X-Google-Smtp-Source: AGHT+IEDxCrKPppxWHewLDe5gTWvfL17awwVoo5pMcJpF1jIww+doiT/OA2dXhUmsRG9ln4xihNYIA==
X-Received: by 2002:a17:907:80b:b0:aec:55c0:6d5e with SMTP id a640c23a62f3a-aec55c0765dmr1812694366b.30.1753198024324;
        Tue, 22 Jul 2025 08:27:04 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6cad0feasm877743766b.138.2025.07.22.08.27.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 08:27:03 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] libwebp: upgrade 1.5.0 -> 1.6.0
Date: Tue, 22 Jul 2025 17:27:00 +0200
Message-ID: <20250722152701.1718859-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722152701.1718859-1-skandigraun@gmail.com>
References: <20250722152701.1718859-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 15:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220752

Changelog:
  This is a binary compatible release.
  API changes:
    - libwebp: WebPValidateDecoderConfig
  * additional x86 (AVX2, SSE2), general optimizations and compression
    improvements for lossless
  * `-mt` returns same results as single-threaded lossless (regressed in
    1.5.0)
  * miscellaneous warning, bug & build fixes
  Tool updates:
    * cwebp can restrict the use of `-resize` with `-resize_mode`

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../webp/{libwebp_1.5.0.bb => libwebp_1.6.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.5.0.bb => libwebp_1.6.0.bb} (96%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.5.0.bb b/meta/recipes-multimedia/webp/libwebp_1.6.0.bb
similarity index 96%
rename from meta/recipes-multimedia/webp/libwebp_1.5.0.bb
rename to meta/recipes-multimedia/webp/libwebp_1.6.0.bb
index 39fe947eea..0ba90c406a 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.5.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.6.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "https://storage.googleapis.com/downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[sha256sum] = "7d6fab70cf844bf6769077bd5d7a74893f8ffd4dfb42861745750c63c2a5c92c"
+SRC_URI[sha256sum] = "e4ab7009bf0629fd11982d4c2aa83964cf244cffba7347ecd39019a9e38c4564"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 

