Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719C4C43217
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:35 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.8678.1637163334414036184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZGhyg+RH;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so5176302wme.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XPdhsONGKTNhblRUnKirKnCvh5IE/ZKMsByRoz8VOPo=;
        b=ZGhyg+RHV9hHNiTFfLsQxHPidbmMAkN7Ks/MkfFafB7g0NXanLhGdOsOG+px/7iPGp
         2CFzhxJMdTdbS7duF0KiURXy2WRK/7LU3y/sNp7J4deFtRIEAeKR0fl+WTk58nLUiEgk
         t4WmTdBMKVGba2bwpVI3BkgtRi5bZDiNJcWXffJZz57WIT3eBAprXZbu9A8dLuUsKZNg
         WfKbEOTdsbP1yr1kza6WxvXcYcSvlSN4CMCXkSJogE5AfPlA2OeZn3so3T/5bE+Hutxv
         PyF9W5ybD9lQzehE5To7ZDMs66y75yUoiw+5BtUs9L9Ws2FMqeA6ym0thE16JdpDRmLw
         uhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XPdhsONGKTNhblRUnKirKnCvh5IE/ZKMsByRoz8VOPo=;
        b=yXJQdz2FC3qbZrikmi8ZXtjxptSjPhqHOWtNmrxM/LrVTH3an1zfyukio7DfblMGmn
         lPgy7atYbpzvhj3DCHFFX7YIylYONkJvhE5Mt9NhQRVJp2QEVjgVPTljXg5f31NRvM9C
         4CO6Jli0IXfMwktUA4a6KseYywY+mRCMXM8VnYaMpbxa5XBUMl3rLNMOjqkKfJJjF+/w
         vmUJLCXjI/+ERxp/Rtian50q2gPr88CAPrdvJBA35yue/PXquDMVSRg9ehWgb8ZNiGBm
         CmWxHTuw2tFh/rY2VkctKS5gV+yPE5Q5Kq4VSzBl6K+BQyl67+PlaM+Ap3VHSAzmjuj2
         /ksQ==
X-Gm-Message-State: AOAM5317a9vFaop9ick/DV6X/RfkbxiIuvlSB20r5KfAamDQEhta4wuC
	EJvuGhngoYzzVGHRnZ/wLAOa39NMkV0=
X-Google-Smtp-Source: 
 ABdhPJw8kL40Jd/83crcJS/SZRF/aE1CjXPMFzS+gmApF7IPX37cslyv1Af5+hpeYdYUxuMF3ka2VA==
X-Received: by 2002:a05:600c:2297:: with SMTP id
 23mr610297wmf.73.1637163332997;
        Wed, 17 Nov 2021 07:35:32 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/36] ccache: upgrade 4.4.2 -> 4.5
Date: Wed, 17 Nov 2021 16:34:59 +0100
Message-Id: <20211117153525.257146-10-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158405

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: third party version references updated

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../ccache/{ccache_4.4.2.bb => ccache_4.5.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.4.2.bb => ccache_4.5.bb} (82%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.4.2.bb b/meta/recipes-devtools/ccache/ccache_4.5.bb
similarity index 82%
rename from meta/recipes-devtools/ccache/ccache_4.4.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.5.bb
index dd0ad642b2..a98bb43ead 100644
--- a/meta/recipes-devtools/ccache/ccache_4.4.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.5.bb
@@ -7,12 +7,12 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=985be6d06a50f60a9893a19a6d2550b8"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=8fe0fdfdc7a892516526b86c28d06a16"
 
 DEPENDS = "zstd"
 
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "357a2ac55497b39ad6885c14b00cda6cf21d1851c6290f4288e62972665de417"
+SRC_URI[sha256sum] = "8f1c6495a06ae0a9ff311c9d43096233702a2045c476ca1ae393b434abf1f528"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
-- 
2.20.1


