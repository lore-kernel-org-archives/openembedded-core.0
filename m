Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEAFECDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 15:57:59 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.221869.1697558271275609363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 08:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RrdExXPh;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1c9c5a1b87bso40343635ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 08:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1697558270; x=1698163070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dmX9JVLK6NGLTNOf9SEYJrF9MGueoIyaEXG0eSVmJWI=;
        b=RrdExXPhdZunvXHGi0Fxppcj3prW983BmWzYhLjg3VhWduA0qun5AIejdFLNxKfdnL
         AlSsaRf3y0j+kASEZlj8eRoUFjp1XnLDpNw3Ibxy3XLMuVJy/ItK/gsp/puK5RvPorot
         S6nDaPcLd3oT6NKI02Tzg1eyil/0QPfvoz2cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697558270; x=1698163070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmX9JVLK6NGLTNOf9SEYJrF9MGueoIyaEXG0eSVmJWI=;
        b=qjkAIxKmFBBvgC04zD1oS8vw0EXF2+zCau6q4MS0KSywSRbCo3zwRGfojGJ0tYfy8r
         mmpG0hAuF43Xfs9IdK/lh0ZmXSRQIbh2e/HZdEE/Z/ZDXE61VTBAobwCbuVa790S2ajp
         vMa2lFvwfVHJ0tzkobM55u5c0OH4+Qp9aQwOeJzwSYHOCkP7d5jmi8UW0vunujd3bv/G
         HS0b9tafG4GQHIBt8IEIs+xKlc+hnrpQzQ605dQPPTl0z5NeP5+P5hgLNRggMbfsujP8
         3BwvPf/wwUhqVdaYK4eU8GcNMtHPi5M708GvXhH2JsxED17+6YPoW1nncDMgiixVVtBQ
         dVkw==
X-Gm-Message-State: AOJu0YzgUQOhioxodPclcAjcfl4kd8dK2ESRcdT9tqFy7OHnD+IhDkCF
	CgfWB+mEPFY84zLi/qcEhtRHsqEpKKfcCApqiQQ=
X-Google-Smtp-Source: AGHT+IEF0OWI+53ki85Mj6zbECOnLcvHm8IMDX7pe53XiQisN9O1KhpFGRnvIjJZOuUZ3mgaF78sSA==
X-Received: by 2002:a17:902:f945:b0:1c6:19da:b29f with SMTP id kx5-20020a170902f94500b001c619dab29fmr2339923plb.26.1697558270220;
        Tue, 17 Oct 2023 08:57:50 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([49.34.60.226])
        by smtp.gmail.com with ESMTPSA id e15-20020a17090301cf00b001b0358848b0sm1745151plh.161.2023.10.17.08.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 08:57:49 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] tiff: Security fix for CVE-2023-40745
Date: Tue, 17 Oct 2023 21:27:42 +0530
Message-Id: <20231017155742.112560-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 15:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189343

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/4fc16f649fa2875d5c388cf2edc295510a247ee5]
CVE: CVE-2023-40745
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../libtiff/tiff/CVE-2023-40745.patch         | 34 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-40745.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-40745.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-40745.patch
new file mode 100644
index 0000000000..cb4656fd46
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-40745.patch
@@ -0,0 +1,34 @@
+From 4fc16f649fa2875d5c388cf2edc295510a247ee5 Mon Sep 17 00:00:00 2001
+From: Arie Haenel <arie.haenel@jct.ac.il>
+Date: Wed, 19 Jul 2023 19:34:25 +0000
+Subject: [PATCH] tiffcp: fix memory corruption (overflow) on hostile images
+ (fixes #591)
+
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/4fc16f649fa2875d5c388cf2edc295510a247ee5]
+CVE: CVE-2023-40745
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ tools/tiffcp.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index 57eef90..34b6ef2 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -1577,6 +1577,13 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
+ 		TIFFError(TIFFFileName(in), "Error, cannot handle that much samples per tile row (Tile Width * Samples/Pixel)");
+ 		return 0;
+ 	}
++
++	if ( (imagew - tilew * spp) > INT_MAX ){
++	    TIFFError(TIFFFileName(in),
++	              "Error, image raster scan line size is too large");
++	    return 0;
++	}
++
+ 	iskew = imagew - tilew*spp;
+ 	tilebuf = limitMalloc(tilesize);
+ 	if (tilebuf == 0)
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 61d8142e41..9071b407cf 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -43,6 +43,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-3618-1.patch \
            file://CVE-2023-3618-2.patch \
            file://CVE-2023-26966.patch \
+           file://CVE-2023-40745.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.34.1


