Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E396CA0FF0
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:26 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.64601.1756215680025865907
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FXQv+1+S;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-771fa8e4190so406459b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215679; x=1756820479; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ATgPFaf4P46nDPKIc5Lvb7ombJPTNfOqIlkhoOYk7yg=;
        b=FXQv+1+S4OQzeeGQDz9aqA0RJJUceaSRMwIBhGmUMpy3Bsmdmpr53oqvzGGKb7ie7H
         /TT2xOsSz+blsahm838uIqbht/RPRB4pcpfxEk8T5N+RajdEan3Xe6ytgvGwWon+KJAg
         yDTOiq2sXpR8yAPIVT+zSF8KKiorLv3cm/tXK1qEd2asxnksYOWyPFC5LAQcH3HIkfGV
         hM12qq8WuUl1XWfVj4cpZJxZzj7/rXpIaVRrk5Z2raIY4SMBqdNHwFwxFpnAge6SRAIm
         5rFxAGnygJLILLHrM9Q9UqLoigd23WN/vNvoyGJXgcMDFkSaKh3xW5M3itOIRMPLnlks
         l8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215679; x=1756820479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ATgPFaf4P46nDPKIc5Lvb7ombJPTNfOqIlkhoOYk7yg=;
        b=pNUqrL70ozhpHy+AhmSaT+Syzlumejivga+nQSX6P4BtesCrw/PiYnQif2UVzDX9+C
         gyguegcmDCBlrebK0kk0kW6PjeSmQgJwr6YUXarxBUPv9dlMgH6BhrEo4O30Ko7ZQOzI
         3iII5PcSsiY3SkKLMmGp5SAVaYJAI7WpVNFryJp3hirGcQE1bQFSmvBODXCLIVoEY4Xz
         rAPTRhSfIUL6cu8fE9zBIzqLtvoL8370sRu2JD8hJLQoy3Ve7MJVFBce7qRgUEVmE023
         isktAh+diD/5i0nC+RzsrfzdiGhFuLiHp8BhluUURHofn6r17d2Z1T85gaHvTDaev7g6
         fbvQ==
X-Gm-Message-State: AOJu0Yy6yTBUXuOVLThhWPKY5YA8URrK7fg//co1Xg/GNByZirEQVqHG
	ZR9uwO6v+5QeugF0wcizv/Sl914NSvXW+6Q67vTDq8FOIAH7MAKWJAzpHTndWK4hLHij7kEIdFw
	75frB
X-Gm-Gg: ASbGncsOwuT4Xo+OSKjmGKeQl+razgCPPPpX0GQXI62Cu44fxTJBCnYX8d2hOCkZLVX
	9z85QLd6fWZkFI6on+nxMZclzBx55MSTGXBJAM9CWDLBYuxwaLewwtkRm+vPaKfi4SgFUZBA4Gn
	xA29yDndu4oUJxQ/R0Ii/RIcujPtPrY1KWP5ymh+29e0PH5hd5e06sKyNWw5MnSsahGlmQ79//H
	4Gnhk38tYWVO6eInMu66i2Qz8eQg5QKs2vaX/qcpRfa4gRJS0vSL+a9vI2YJ6XO2D/ZViwJyc2O
	zmmpcMTYEPxeGlbQrqWzBMARYEdJCfyh+ZCTHFYNYg6jFNTkh7wy4XaQ/k9M6741aTYl6fZOegE
	N11Xr7xMpPgGzPg==
X-Google-Smtp-Source: AGHT+IFXm7jKZyfkqcHu4al/dIemamnJ5tBSZzbjfuXQ0EF43xEWdcvf7/IEAsOw1M7eNhP4YTKmxw==
X-Received: by 2002:a05:6a20:7d9e:b0:240:1d4f:720b with SMTP id adf61e73a8af0-24340bfe129mr22470470637.23.1756215679195;
        Tue, 26 Aug 2025 06:41:19 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274191c389sm1007414a91.4.2025.08.26.06.41.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:41:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 08/19] gst-devtools: upgrade 1.24.12 -> 1.24.13
Date: Tue, 26 Aug 2025 06:40:42 -0700
Message-ID: <294522f993b5246ff4a4bf35d1f8fa66c29d1a63.1756215509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215509.git.steve@sakoman.com>
References: <cover.1756215509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222448

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{gst-devtools_1.24.12.bb => gst-devtools_1.24.13.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.12.bb => gst-devtools_1.24.13.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.13.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.24.13.bb
index 157cdc6bbb..09d112cf1d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.13.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "4ef3dd12e5827068d6db7ad01876d1216a80717116c24a0d5b3b57fd7e3c3478"
+SRC_URI[sha256sum] = "2485b30dfb94b65e2e4befb0b9367fbecbfcf2102b24fa9138df4403497e7b73"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.43.0


