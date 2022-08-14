Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D27C25B06
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 22:20:57 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.10088.1660515649439096070
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 15:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WxPuGP+n;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d10so5007656plr.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 15:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=s6CGSGTtJIOVdx+MdV9zQh34hpTdb9xdjxOqaFy3XeM=;
        b=WxPuGP+nJWiPa++6PPWQgCNjSuThSQlAGz/WibnwFjX79TOLlzbSpaeOQBP3hXuuBg
         T7DUbAFFIs28rR9FsO6YZD+p2Vn10vwtKd+xOKdyb6Hb1Kgc+sDpungbvnp1Q0iLV/9J
         FICh18f7JDKAPRmAkNvwrgn8ejIlOLsvgmHBCLEp62dzsBucnNXswRSz7+eDbOLoY4zO
         h0WsuLtPUgPC8ZvYWkarOrnWoo8BxgkdZF+MWyFXa53ZtBjRNuYSYFpJ7Z8dKeFsw/Ps
         7NasX/JR8NLTWie3xO4zA69PDbfKzHc5s2Ndi/Djx3JF4hOXd6NRfvCufupB47iZ7NmU
         lf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=s6CGSGTtJIOVdx+MdV9zQh34hpTdb9xdjxOqaFy3XeM=;
        b=nKWt1zMedGHmyu0xQncojSD5pDAhQpzcaMlDgZDBZEuTrkamJwco4iQJlWHSG+bf1y
         C1e1Dw//qPzVtTcGS3xSdAGScD1Fhth8L7LpFWQZ7o6kQKw+XL+m8SN8b7Dld1ubMm08
         U67qn1SSakrEaikQzeaUO+dMtfO/mUlBPuNtSYQ1f+TRZKcP7dwxYQW2/hsk8RMjpoRW
         4UEIYtdnHR12rGwupxcFB5rD2r5YHlBKM+Mu8OAuZBhukuHqy20EbAGoPzwSW0SlUb5C
         vaUidgYVVyNhKF2mjjcSAcJ9KQIOrF/NOVz5G9kYGWz1eoQfPhMteV/kwTk1US9zXpF6
         yLNQ==
X-Gm-Message-State: ACgBeo1CKm4/V5V4QlchBKU0Bg5b6Fpoms5CcyYfoCsFkQKP7/O3qdr9
	/fi8ijGyWLd1+wUW03jo1SCovswtte3VVA==
X-Google-Smtp-Source: 
 AA6agR4DOOsqfB2ncw2XrIFmNyCRlazu7NvEtb6qCAAbvIzpgDbWYTr83e3GL4FanqXQXNNUEKiLhQ==
X-Received: by 2002:a17:90b:390f:b0:1f4:e394:8c18 with SMTP id
 ob15-20020a17090b390f00b001f4e3948c18mr14797597pjb.141.1660515650277;
        Sun, 14 Aug 2022 15:20:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 k15-20020a170902d58f00b0016d8b0dfd61sm5819502plh.178.2022.08.14.15.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 15:20:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 09/10] tiff: Backport a patch for CVE-2022-34526
Date: Sun, 14 Aug 2022 15:20:36 -0700
Message-Id: <20220814222037.283943-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220814222037.283943-1-raj.khem@gmail.com>
References: <20220814222037.283943-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Aug 2022 22:20:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169336

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libtiff/files/CVE-2022-34526.patch        | 32 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-34526.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-34526.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-34526.patch
new file mode 100644
index 00000000000..54c33457468
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-34526.patch
@@ -0,0 +1,32 @@
+From 275735d0354e39c0ac1dc3c0db2120d6f31d1990 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Mon, 27 Jun 2022 16:09:43 +0200
+Subject: [PATCH] _TIFFCheckFieldIsValidForCodec(): return FALSE when passed a
+ codec-specific tag and the codec is not configured (fixes #433)
+
+This avoids crashes when querying such tags
+
+CVE: CVE-2022-34526
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/275735d0354e39c0ac1dc3c0db2120d6f31d1990]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libtiff/tif_dirinfo.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libtiff/tif_dirinfo.c b/libtiff/tif_dirinfo.c
+index c30f569b..3371cb5c 100644
+--- a/libtiff/tif_dirinfo.c
++++ b/libtiff/tif_dirinfo.c
+@@ -1191,6 +1191,9 @@ _TIFFCheckFieldIsValidForCodec(TIFF *tif, ttag_t tag)
+ 	    default:
+ 		return 1;
+ 	}
++	if( !TIFFIsCODECConfigured(tif->tif_dir.td_compression) ) {
++		return 0;
++	}
+ 	/* Check if codec specific tags are allowed for the current
+ 	 * compression scheme (codec) */
+ 	switch (tif->tif_dir.td_compression) {
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
index 0af956a8f0f..e30df0b3e9e 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-           file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch"
+           file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch \
+           file://CVE-2022-34526.patch \
+           "
 
 SRC_URI[sha256sum] = "917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed"
 
-- 
2.37.2


