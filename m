Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4401C3DA40
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:29 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.61508.1688484628341870265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=QQROtSFt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b8a462e0b0so5563955ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484627; x=1691076627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Uj+ogtp5VQwciraph6wuLYaxBa+mFhUOhtXk/2kwWU=;
        b=QQROtSFtMSpP10Ijz4EMjNJT7a1ZFhqfCMZEP9QtOtf7R+cV78tdu81ZcbW5E3S2Wt
         IL2xb+cwRRx8ekT0iel8eSvcvhMwdajfxC4jtFKJwTYZkv8Kj22nQYS9P8A5v1X0Po4K
         QSNAYogJ5J2zN+JWRj5PmwLf0iKeM4cAHRcV0fJbKmgTGH/Rn2Fxp8QAfUndxDnIuHAq
         UQr3Y4wcQRl4pk/lzjWxMlYGWpRT//h9f1f/0VIGf7w8iYxG9AtzTe8I1z0m+g+UL07k
         8+FIvaVTszRT9chA0lYaUVIXbi+AZ4o9pJZLGkNjlJt97IZKLiMhdxG56db+X0YO+OR6
         m+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484627; x=1691076627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Uj+ogtp5VQwciraph6wuLYaxBa+mFhUOhtXk/2kwWU=;
        b=LKcvaDrPYUYCmMGF/ZyAJqIKuDb2I/CmDyRigaQJPtttdq4GqdJIeLOpXGlumjRthz
         17e063zniAf75OjD2wz0ERCHCUo9ubs/xlHfsCCpNVMKLT7t99uhH67KgilpuK/R8d0v
         YHhPZphL4OdnDL/oOxP6iamR5v4Bp0vIiWX5KJw9Zm+GDknnA/XAFYrXwqQY9006kT0a
         reab/8FYuM9Q3etr9O9ikEYYaWXSFtoKNbPbH4N1/FEpwTlABSZdESoAPlcWfxSJx7tE
         UyGa8UmdtLpvyEbMTbt5oxa0MsuHcVD9A1DFIArY6ptQzraQz+XPwBYbQMMGbbkVSeRZ
         DO7w==
X-Gm-Message-State: ABy/qLYO4HU6nH/DvAPsL7IU7An6CQYHK6tGkh1dSNTyyysiqzFxN30J
	ZP10d2K4jmCrgHFv1K2I5INQsVT5Y0BpXd383NtLOw==
X-Google-Smtp-Source: APBJJlHm99jX2UpwgBQcuwRbsd5z6dDia6yMuBuAtkG3GexzXgOsQB1kJwBjD1wh49mtByrFVgzH9Q==
X-Received: by 2002:a17:902:e80d:b0:1b8:9ba6:b221 with SMTP id u13-20020a170902e80d00b001b89ba6b221mr4289250plg.21.1688484627524;
        Tue, 04 Jul 2023 08:30:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.30.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:30:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 24/30] sysfsutils: fetch a supported fork from github
Date: Tue,  4 Jul 2023 05:29:26 -1000
Message-Id: <0bf67fadffa24c00452acb25c58c1eb5648fe4c4.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183859

From: Alexander Kanavin <alex.kanavin@gmail.com>

Debian does the same:
https://packages.debian.org/source/sid/sysfsutils

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 504b2f590cb94b217c5f48090cfb71a749bd5ac8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
index c90a02f131..fd72cf4165 100644
--- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
+++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
@@ -10,18 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3d06403ea54c7574a9e581c6478cc393 \
                     file://lib/LGPL;md5=b75d069791103ffe1c0d6435deeff72e"
 PR = "r5"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/linux-diag/sysfsutils-${PV}.tar.gz \
+SRC_URI = "git://github.com/linux-ras/sysfsutils.git;protocol=https;branch=master \
            file://sysfsutils-2.0.0-class-dup.patch \
            file://obsolete_automake_macros.patch \
            file://separatebuild.patch"
 
-SRC_URI[md5sum] = "14e7dcd0436d2f49aa403f67e1ef7ddc"
-SRC_URI[sha256sum] = "e865de2c1f559fff0d3fc936e660c0efaf7afe662064f2fb97ccad1ec28d208a"
+SRCREV = "0d5456e1c9d969cdad6accef2ae2d4881d5db085"
 
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/linux-diag/files/sysfsutils/"
-UPSTREAM_CHECK_REGEX = "/sysfsutils/(?P<pver>(\d+[\.\-_]*)+)/"
-
-S = "${WORKDIR}/sysfsutils-${PV}"
+S = "${WORKDIR}/git"
 
 inherit autotools
 
-- 
2.34.1


