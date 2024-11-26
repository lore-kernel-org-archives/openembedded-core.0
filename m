Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC95D59D85
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 00:10:47 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.34495.1732579840419800203
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 16:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i/saoL2g;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: hiagofranco@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-724d57a9f7cso4028614b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 16:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732579840; x=1733184640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7yVhrd5QeFr4f/y9EHGCKMy97ANOQhGO61RtYLi44M0=;
        b=i/saoL2gt8j2OzW+HJKsXGyAgPbSw6H/kpz48Kua7iLfAzVJlqjOKr6RXVAgdOwNa7
         Z+gsD/hhss1Gjt9aAqlp9y2hbF3XSIfTrfWJXvBWIcchpeQ4CwybStAOwv+1rpbMls+n
         bUHR5aP6jB/p9iAhrxnzPtom6BMEyctRzmKpQTMngIUo/vsLg2nifdOFq4jTfB2osJiS
         8ZyIuPj/RJz5hCBwT2bhzTmVZHzBruYSNC9nS3ocX/sn95DFw46Usvqu3FYXH3hldh2Y
         7n6LWDHv2ltaN8a6xD2xvfDsoS8SiiEFuD9jdyHFy5RD773JMzkBlGUu1xXvBD77VTE7
         +V4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732579840; x=1733184640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7yVhrd5QeFr4f/y9EHGCKMy97ANOQhGO61RtYLi44M0=;
        b=A9THzadbz4zKsD4xFf6qLcsQiVTQKgj/EZRnPLlki+s01P0krF1ph+rV1ITB7qnciJ
         MvWO8JaX72FmRIItXiaE9zfe+4jajKsI6gNBTShwLT+CJTAaoqzo4kZZ0aMwPelGu0nI
         4XnHRb0DIbmVlcQELzJY4jqzC7pH1KIersZlJA5mWxpcO3QDX18oIzIzknBsICVFOhiK
         mSQc+WESiIeLyL8krerNdsryQTf+ecTWppo+vPv/Wz/ohc7ajkNWKnRsf8tLPaEWAXUT
         zGViQiW4W7C2oVGaFtpSk7LCcG9p/wsBdjTwh837zsszD8lHZuxFEgDRQytXTre0YW4u
         kLow==
X-Gm-Message-State: AOJu0YywV7CpnlbCKatHDzNOpgmc2+SmVF2SZm1yhVYvM6p0vIbkm3ae
	P6NhRjThxT4rA2HfYSeov/jxpD2GHE95kO+/T2RYQFQqdelguLFibxI8dw==
X-Gm-Gg: ASbGncuWjc9iu+HnkJU0LE+eME8i895LQDtop2AwQ7sIkhjtTljb3ggrzP8jDWnZtgD
	1Hp7m+ElufXwR5wmH2Ue9woVDzAF2iIsb87q1ukebFEkPt3o8962aEnzzUYs7PSPCDv/kBgCTqY
	YRJf43/JgX7QCcofRI+sp/rmuqhpWBm0sSo95uGxcINmMcnrgxg8ZBVi3QHOVbm70gHqDrO5cVt
	Is2qPhmULxPPy5vz4JUscb738Rx+PKF1G50DraW26jkALnEeAcibt++MkMCAKCL
X-Google-Smtp-Source: AGHT+IES9DyM0uEuGepTaxTG3o6pda/UCl6cW+ZSNFj4wuLknL4cUg3Hnz+SegzVE/1LfCv57gr7zg==
X-Received: by 2002:a17:903:18b:b0:212:37e:3fcd with SMTP id d9443c01a7336-2129f290e12mr179376905ad.56.1732579839596;
        Mon, 25 Nov 2024 16:10:39 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a7c1:5c7a:1bbe:c924:2a5:636])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba1b40sm71383655ad.87.2024.11.25.16.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 16:10:39 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH v3 2/3] libdisplay-info: add recipe
Date: Mon, 25 Nov 2024 21:08:35 -0300
Message-Id: <20241126000836.6901-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241126000836.6901-1-hiagofranco@gmail.com>
References: <20241126000836.6901-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 00:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207805

From: Hiago De Franco <hiago.franco@toradex.com>

libdisplay-info is a EDID and DisplayID library. Goals:

- Provide a set of high-level, easy-to-use, opinionated functions as
  well as low-level functions to access detailed information.
- Simplicity and correctness over performance and resource usage.
- Well-tested and fuzzed.

Since commit a16598b038b2 ("backend-drm: make libdisplay-info
mandatory") from Weston, this library is now mandatory in order to
build weston 14.0.1 and newer.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 meta/conf/distro/include/maintainers.inc         |  1 +
 .../libdisplay-info/libdisplay-info_0.2.0.bb     | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 04208ebbf22b..53bb9d024e8a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -325,6 +325,7 @@ RECIPE_MAINTAINER:pn-libcomps = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libconvert-asn1-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libdaemon = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libdazzle = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER:pn-libdisplay-info = "Hiago De Franco <hiago.franco@toradex.com>"
 RECIPE_MAINTAINER:pn-libdnf = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libdrm = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER:pn-libedit = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb b/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
new file mode 100644
index 000000000000..f5156cc9f736
--- /dev/null
+++ b/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "EDID and DisplayID library"
+DESCRIPTION = "The goal of this library is to provide a set of high-level, \
+easy-to-use, and opinionated functions, as well as low-level functions for \
+accessing detailed information, prioritizing simplicity and correctness over \
+performance and resource usage, while being well-tested and fuzzed."
+HOMEPAGE = "https://gitlab.freedesktop.org/emersion/libdisplay-info"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e4426409957080ee0352128354cea2de"
+DEPENDS = "hwdata-native"
+
+SRC_URI = "git://gitlab.freedesktop.org/emersion/libdisplay-info.git;branch=main;protocol=https"
+SRCREV = "66b802d05b374cd8f388dc6ad1e7ae4f08cb3300"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig lib_package
-- 
2.39.5


