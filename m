Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7A2CDB483
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 15:48:57 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.285070.1697644130879941195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 08:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Q5l8jksW;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-27d113508bfso5695975a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 08:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697644130; x=1698248930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxKwC4Ku27niSg9IFK7y1cAxfozYfpzj675QBWW+OdU=;
        b=Q5l8jksWLUQ8668LCGPUS8FmDmZXzk0iehOmCuS9xgZfpjoz/GQ6Ag3O8/vsfs7sKX
         DDTaT7G6vyXjbCtsAE1hBsgS/6+t3NiOGje+9bWNdF7cRbzMiO17LgVNuV8E9NbPqDH9
         DwpbNZgxxxiXezipmXknMaaez+ncJtQe3e75O6/v2cXNiulm7ix5/m81Q1Et9DgbVWPe
         tly7jPWMJ7hddiRgCzVVudrqrkvLbBHtKeu1iVYUQNAKcICXaouqJLz/Rv56GTqmAHHY
         BzXROCr3fVR/Z0eLHfzmxs+EW3SZM6rTxHIzqV+XNFQchnTtXmncYz4pWLKr0RgTmgPG
         ZwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697644130; x=1698248930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxKwC4Ku27niSg9IFK7y1cAxfozYfpzj675QBWW+OdU=;
        b=NGXeIA1apRwXD84/pEDrXQ+QVeExGu/hOx4wfe8BfS3o83tZ5obz+rGUxVSb8Qtdvh
         ELPF/jmGlI+ZFrvVeINtM/Kbi7doTCmc0exTdkfGVWIdA2hy2E+mudyXZCIcS45VHZmd
         vaLzRLdshOfE6r9UeMDGzn+PRulggwMnANqhVpD5+cOidLvFZ4pewoqAUcl8ZrI2MXis
         j/5olxO6uiUYIQEs4TweXQ5tGoe8SNuh564tatPeTW4QVbZWEr8r8s7I/2mq6RhdY08k
         oKRRAHCOWUqASRGsYv27kEsirlnwr5MqlcHScPxfYOaa6qDG4r8a16FAvyEXte7mJx6f
         BMIw==
X-Gm-Message-State: AOJu0YxdseDOcZe2c1xSgHCP/rExxjLU9elKz8ZZ4c8cd6pkrfkUb73Z
	ystm5WwqLAEBPVvvdl9xNNEMTm/LjGjGAQju/5g=
X-Google-Smtp-Source: AGHT+IGFkeeZfMb6PgnJz/ye8r9nvn0sAlRbLZ2K4zmv9L5NM+n70EQhjVkm2zTYglahSL58zXQjtQ==
X-Received: by 2002:a17:90a:d98d:b0:261:685:95b6 with SMTP id d13-20020a17090ad98d00b00261068595b6mr5437037pjv.13.1697644129990;
        Wed, 18 Oct 2023 08:48:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o14-20020a17090ab88e00b002636dfcc6f5sm43268pjr.3.2023.10.18.08.48.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 08:48:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/10] tiff: Security fix for CVE-2023-40745
Date: Wed, 18 Oct 2023 05:48:27 -1000
Message-Id: <f1aa2dd493c01e18ee0f534ff00523a1274f9066.1697642997.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697642997.git.steve@sakoman.com>
References: <cover.1697642997.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 15:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189407

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/4fc16f649fa2875d5c388cf2edc295510a247ee5]
CVE: CVE-2023-40745
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 8ef98fe5d0..8dcd73273e 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -45,6 +45,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-26966.patch \
            file://CVE-2022-40090.patch \
            file://CVE-2023-1916.patch \
+           file://CVE-2023-40745.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.34.1


