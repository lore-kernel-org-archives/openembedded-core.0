Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BE3EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:27:19 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.9135.1689690439259724352
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Xx5CjDfX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-666e6541c98so5801028b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690438; x=1692282438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Uj+ogtp5VQwciraph6wuLYaxBa+mFhUOhtXk/2kwWU=;
        b=Xx5CjDfXTsoUeYQZ4tROJ1sVhgmv/qK5qtq7UeRF1Rl75hF6q3L1ewNT+Bqwh2C+na
         V8j251J2lTk+3tUEV/ITCXHXmz0Up6G7GzLSImj3IbpOCTP3L60d+C8aCWU/Jr9izHwQ
         Z6yvsePQE2WbJJ5eJ/y+WYWbBgD7QVsXC44xogDZ4FL9A9w6galb8ftHplbf57NPSS0n
         uM4j6cPRNEfXAYgpIYij4NyOLc/ccHHVbi5h3p7C1XxVtfaWD19ILsP2mBUxkJBgeYyo
         8Ew1FewDKXWS+VgdnLgETxBkhfpAdr7Vziod7yYTe1fX6ugEjjFj8sMP99zwJsXJzF4L
         hJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690438; x=1692282438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Uj+ogtp5VQwciraph6wuLYaxBa+mFhUOhtXk/2kwWU=;
        b=l4G7RGpCNkbMl2syB7dp+qD6XzrKbONWDUQ95+kxZbM2b6p/uFG49NlD0CCNE04Ucu
         K34PL2E0iVlPzYC2YYywxOttqU1d2Gujjj8cpzcJELbNC1LTYXm6qo2B6GgpO8rVV1p0
         UCH2qmgGnCaDMXo3ZCRA72v6Mk2+OWKVua6vo1f8oeql3bTuPiUFDUdzSIuyz6N8fIq7
         LvkD1oSRr/M9IOdmR/8eZIBfG2ZsaJnYLpvZGdxiEh/oNs9W8n26TvMultxIyzYv354T
         kDVcSvEcAFXbmneii90qQz2AYUadSpHnhBYUCBzFmPRA3NbpMN4sUUZDW8nMaTZWcs11
         g6kQ==
X-Gm-Message-State: ABy/qLavlmo/nxZlErKrO2rzZGJbQCAy7DpMNhwpZR2Tof40rHQRT5l+
	ZLO/0enN+T7E71JmSx3oKTAf35Z4yS3dEjfu4Hk=
X-Google-Smtp-Source: APBJJlEkL9UAkyWu32GV8iNOeIhZ8rGOf7YuG2tCZ4ZMjBozaBNhucmKPX8SRDZlBMW666JuVpPtTQ==
X-Received: by 2002:a05:6a00:218f:b0:686:25a7:3cf3 with SMTP id h15-20020a056a00218f00b0068625a73cf3mr2199560pfi.29.1689690438332;
        Tue, 18 Jul 2023 07:27:18 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.27.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:27:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/27] sysfsutils: fetch a supported fork from github
Date: Tue, 18 Jul 2023 04:25:59 -1000
Message-Id: <9f35ca9d9ed4be4d27318230f4ae42c4885d1f0c.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184529

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


