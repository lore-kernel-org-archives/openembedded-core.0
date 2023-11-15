Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A65FC47071
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 03:17:56 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.4870.1700018267209983687
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 19:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=R8r5ElIF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1cc316ccc38so50018255ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 19:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700018266; x=1700623066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4e44cLhcXml4x69mZ5XNAr/6o64pHStDuF8PMv1pW4Q=;
        b=R8r5ElIFE+yc4ehuIczI75Zws3FDDlmUwobLCbvVatH+n4Nc8WkilYSA/BwhsZIl4O
         mrT67KQNFkDAphNqcSGJjUtgF1+IV3az9lTJvt5Ybm8yJX/B6oZgBlPhak/zgi8Ncjtk
         QjWS/3kGX2DLd8hJTC7sv7aO9/ouyuzHxtqFGx21mXK4Y8evKMpbun7nr2Hufkj1zNmU
         xUnQVPXE4d3AXMjOLfDREM1ioxHdT8/WfPPvrlExr0nsaf6sC3X40Zpg9/SHWT9sooEx
         RUMF5ZwSiRP77MdVjpB0opB0jt6V1lW0MZRj09RSfP3dzv8t6xrO30WJxog6xsrQQaRT
         AMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700018266; x=1700623066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4e44cLhcXml4x69mZ5XNAr/6o64pHStDuF8PMv1pW4Q=;
        b=opn+sRQEPtjwljsghZoBYZbyUYckjEOSCgYg+xTQDrzOzx0WZcBM4hXGua9WECyi37
         EbAePyzvNTUbjh1mEY8LrlB9VZxRJ/EbhpBYhG1MCcfPGhm9zKEGi1X+QzZTn5lv4M7R
         TpH9gEq9WVfGN4U16nIwY9zJNmAgIBnLJQhsaQ0coFg8QFz0nOGGJWt3z8rgwF+nAh0X
         APm9qPThtBheG9TpuANYgf/4Pz28OWILPzjNgcc4FGJQt7aMq8doHiBoYFKYPjF1DxV0
         J4UG5aQxTDOl6WmcTl/iUlPj/il+jcQ8I06Jf6YRd5x+MBNxaPhsMz2kYiXUgqJi4Gfy
         8sRA==
X-Gm-Message-State: AOJu0YyOsmj9oNjG7Nxk00UXPiaIXU2sWmDJms0xkZJm7FY5GoLVeud0
	BrbwEbAPKYcHLU4Eh42o51YFMNhU/8PmM/8FVt24Wg==
X-Google-Smtp-Source: AGHT+IGoiCzlb6I62NktLFvTFSt5fOvGB1mJjp0uPgfoiQBe8635bsptvLZEIpN3U4+WH+nsR4tReg==
X-Received: by 2002:a17:902:da86:b0:1cc:70e4:28e9 with SMTP id j6-20020a170902da8600b001cc70e428e9mr4918175plx.49.1700018266204;
        Tue, 14 Nov 2023 19:17:46 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b001c6187f2875sm6369300plh.225.2023.11.14.19.17.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 19:17:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/17] tiff: Security fix for CVE-2023-40745
Date: Tue, 14 Nov 2023 17:17:20 -1000
Message-Id: <d282b85cf69ecfbce12224428c713cd0dc639ced.1700018112.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700018112.git.steve@sakoman.com>
References: <cover.1700018112.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 03:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190533

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/4fc16f649fa2875d5c388cf2edc295510a247ee5

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/files/CVE-2023-40745.patch        | 34 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch
new file mode 100644
index 0000000000..6eb286039f
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch
@@ -0,0 +1,34 @@
+From 4fc16f649fa2875d5c388cf2edc295510a247ee5 Mon Sep 17 00:00:00 2001
+From: Arie Haenel <arie.haenel@jct.ac.il>
+Date: Wed, 19 Jul 2023 19:34:25 +0000
+Subject: [PATCH] tiffcp: fix memory corruption (overflow) on hostile images
+ (fixes #591)
+
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/4fc16f649fa2875d5c388cf2edc295510a247ee5]
+CVE: CVE-2023-40745
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tools/tiffcp.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index 83b3910..007bd05 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -1437,6 +1437,13 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
+ 		TIFFError(TIFFFileName(in), "Error, cannot handle that much samples per tile row (Tile Width * Samples/Pixel)");
+ 		return 0;
+ 	}
++
++	if ( (imagew - tilew * spp) > INT_MAX ){
++        TIFFError(TIFFFileName(in),
++                  "Error, image raster scan line size is too large");
++        return 0;
++	}
++
+ 	iskew = imagew - tilew*spp;
+ 	tilebuf = _TIFFmalloc(tilesize);
+ 	if (tilebuf == 0)
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index d27381b4cd..31e7db19aa 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -45,6 +45,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-3316.patch \
            file://CVE-2023-3576.patch \
            file://CVE-2023-3618.patch \
+           file://CVE-2023-40745.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.34.1


