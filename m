Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A1DC32789
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:35:58 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.4494.1661294153007845736
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=b0tbKDe9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id 67so6591298pfv.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=Caf5yU5QUTkvjpBsWVVNWWPraQAvqqTfRGmYfu6f61Y=;
        b=b0tbKDe9J9AOEIwd5npmSvQaMavNhfadZoEW3B00CHmqSrK92Uj80XgOA9iXd72V5u
         hUM2SAYMftxG9WyGIIc2FR6ByUOR3vUV3ZaqVcekf/cImP0S9I/JYNn4X3p3icRbmIj6
         M2ZK83KyfqGQvA125i7giyVAcmVkaX77/BApvBY3hPnT796GinToOho9bfRG9QgK1GJr
         wxVLifFhTYLFUvIQCgMmnh0oA6ggSLahknUTeqjGFBN1mUmfzJ4Fl/7VQVoHBQy9MvWF
         cPprinUYwjtxKsGs3Nb7bauDpOjCs8Mqp7R71EuHAjBdCy559QaPQ68TkXFVVmKqByCy
         JAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=Caf5yU5QUTkvjpBsWVVNWWPraQAvqqTfRGmYfu6f61Y=;
        b=ZImqi+MbrASQ9Xh/ED3VjzeUn9mn8TNg0bzabSXJ3NDafkAMrHCkrdD52v2dcZMEmQ
         hSw09kKF5MGXAjAIJSPMdf1mEwDxAlSYgsRnV13WakyRCo431rI0of83meXWsnUK+TNx
         9NDgcBmV2wEP2n8NTEGyB7MEi+H3pArZqAndQ/8vQAmM20G/WyRuMXRV5X/zIVtPyV1M
         v94v1/wfCqwA5AoqHHIk6LwATHQplYfY0Ldt4UGRqpv4aJGA4+2vUZs6swYGQX7Ff0H8
         sNXcV4+o3CfDWgx/GkLqcPb4o4XXBeXpo2pY2EeZsGIrk2Qk7tVBzDjFz25KzecwUCcA
         taYQ==
X-Gm-Message-State: ACgBeo3qsJVcvai6pvz1erKGVDzXG5HNg7f9V/nWY1GudV2OHRxfh+bc
	We7sApfrLdT4oyxSQMcoQgiI4UlVbJC1miAL
X-Google-Smtp-Source: 
 AA6agR4QeRgyo8m5JMBMCfExvNZjDzawkpkJf2ocp9Zo0z8ioTw7CYc4UlE6dtCtNCdFdAC8fgCsSg==
X-Received: by 2002:a05:6a00:ac6:b0:530:3197:48b6 with SMTP id
 c6-20020a056a000ac600b00530319748b6mr27190719pfl.80.1661294151911;
        Tue, 23 Aug 2022 15:35:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.35.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:35:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/28] libtiff: CVE-2022-34526 A stack overflow
 was discovered
Date: Tue, 23 Aug 2022 12:35:13 -1000
Message-Id: 
 <4ad7470bc772e33e579947c894ed74a513fbcb39.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:35:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169733

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://gitlab.com/libtiff/libtiff
MR: 120544
Type: Security Fix
Disposition: Backport from https://gitlab.com/libtiff/libtiff/-/commit/275735d0354e39c0ac1dc3c0db2120d6f31d1990
ChangeID: 2f9df449974f5436c1690f3ace5d74b1ab4670c9
Description:
          CVE-2022-34526 libtiff: A stack overflow was discovered in the _TIFFVGetField function of Tiffsplit.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2022-34526.patch         | 29 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-34526.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-34526.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-34526.patch
new file mode 100644
index 0000000000..48ca56982f
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-34526.patch
@@ -0,0 +1,29 @@
+From 3fc1fdda0068981340cc7ae136173731275e2c5e Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 18 Aug 2022 10:46:30 +0530
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
+index 8565dfb..0f722a5 100644
+--- a/libtiff/tif_dirinfo.c
++++ b/libtiff/tif_dirinfo.c
+@@ -1157,6 +1157,9 @@ _TIFFCheckFieldIsValidForCodec(TIFF *tif, ttag_t tag)
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
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 149516508f..b5ccd859f3 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch \
            file://CVE-2022-1354.patch \
            file://CVE-2022-1355.patch \
+           file://CVE-2022-34526.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.25.1


