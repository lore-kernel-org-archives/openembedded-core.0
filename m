Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B3DC25B08
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 04:40:29 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.28050.1661229623522919393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 21:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=TeRQGAdM;
 spf=pass (domain: mvista.com, ip: 209.85.216.49,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f49.google.com with SMTP id
 x63-20020a17090a6c4500b001fabbf8debfso13440456pjj.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 21:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=tvuES8sTSil8aa8lXMDhCvVtGerd8hdvyoFD21ZujJQ=;
        b=TeRQGAdMD4pWq/qvB6ta6SZElX+EmY56dC0o8s6fMt3iU6hKnx3pG56eVERq+wIz7o
         LQef60+ZqQDs7HCcqiOms1LrBLS9mg2CpMBsl5fZJCqA7V9EeJVqZZ7OIQ2yzimM3lYq
         9DnwhUDu13OemCkseoN0vtb+WRkyVfDyKA53w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=tvuES8sTSil8aa8lXMDhCvVtGerd8hdvyoFD21ZujJQ=;
        b=oh4ITV4bfoMOWO0e9U+fS/J2YtcF26qTVCXOQ1EnYg4NzEi7FLyXdpTh/4o1dNe7Y/
         L+4fkw8kUI3Dr315QRQ+uvZToQJI9MQzW/d27eno8dCIHM2HIKzza6YfZeDdEKutwgb3
         r+CzTQZzMO4MnPMzNNI8WbcxheQSBYo1UCI2Xl5keQeY+ACvchClGlKZqDQxo/zPITMw
         uwTdPbpjPNsD/MN67VnjKhcoSDAb5/oi0CH68hexlRpixjzzVewUpFESVCwgTB7e60eE
         tv1RY7Xbk9v1UA3M1cBNb32Qr19rnCa4PB9EgDbVKM6sBD+QwQuWE9VU0IY5L8gcOqtF
         jdkw==
X-Gm-Message-State: ACgBeo0h/U3wvEJUPRFny2TlalI8mPihE4QaPqQunK/uwZX9WUaEqhrI
	PBS4wRH3OCvy0EneE3dLf3T7ZqydlLo0XQ==
X-Google-Smtp-Source: 
 AA6agR4KR2HurIcLO8nlxslH5TOJzPewl45umN7eOdM8LFGuAvF4WHnwbR/UJqcWI3hFxN7i9ge3Vw==
X-Received: by 2002:a17:902:e5c3:b0:16e:d968:634e with SMTP id
 u3-20020a170902e5c300b0016ed968634emr23131481plf.80.1661229622508;
        Mon, 22 Aug 2022 21:40:22 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.187])
        by smtp.gmail.com with ESMTPSA id
 q21-20020aa79615000000b0052d3ea78858sm9607118pfg.127.2022.08.22.21.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 21:40:22 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Tue, 23 Aug 2022 10:10:17 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] libtiff: CVE-2022-34526 A stack overflow was
 discovered
Date: Tue, 23 Aug 2022 10:10:15 +0530
Message-Id: <20220823044015.38308-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 04:40:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169693

Source: https://gitlab.com/libtiff/libtiff
MR: 120545
Type: Security Fix
Disposition: Backport from https://gitlab.com/libtiff/libtiff/-/commit/275735d0354e39c0ac1dc3c0db2120d6f31d1990
ChangeID: 4c781586f7aba27420a7adc0adc597cc68495387
Description:
          CVE-2022-34526 libtiff: A stack overflow was discovered in the _TIFFVGetField function of Tiffsplit.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libtiff/files/CVE-2022-34526.patch        | 29 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-34526.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-34526.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-34526.patch
new file mode 100644
index 0000000000..cf440ce55f
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-34526.patch
@@ -0,0 +1,29 @@
+From 06386cc9dff5dc162006abe11fd4d1a6fad616cc Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 18 Aug 2022 09:40:50 +0530
+Subject: [PATCH] CVE-2022-34526
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/275735d0354e39c0ac1dc3c0db2120d6f31d1990]
+CVE: CVE-2022-34526
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libtiff/tif_dirinfo.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libtiff/tif_dirinfo.c b/libtiff/tif_dirinfo.c
+index 52d53d4..4a1ca00 100644
+--- a/libtiff/tif_dirinfo.c
++++ b/libtiff/tif_dirinfo.c
+@@ -983,6 +983,9 @@ _TIFFCheckFieldIsValidForCodec(TIFF *tif, ttag_t tag)
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
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index 4383f7af8e..c061d2aaac 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-0891.patch \
            file://CVE-2022-0924.patch \
            file://CVE-2022-2056-CVE-2022-2057-CVE-2022-2058.patch \
+           file://CVE-2022-34526.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.25.1


