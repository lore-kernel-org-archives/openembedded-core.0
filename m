Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A0FD743D7
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 20:31:17 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web10.25333.1732134672324872112
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 12:31:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NAa2uHc4;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: hiagofranco@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-856e7bc5651so989570241.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 12:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732134671; x=1732739471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbJ6YvcQTq+U/Y/197hgNmybRuAZOqK/wPm01RS0Vko=;
        b=NAa2uHc4bDhejiIASldn99dv5j1fH7nYmy/iG8juyqYsjthOJRXFNoHa8QCPYEQ1HW
         Bkcejpx3Y4zBnyOoZJ1orn9SsAknAO8Limlbr2IUG8AXk0WqEXzafLMqWG4UWjvi4Uig
         hndQmr/Ev9YtIk6KkDAw4dd0t0miDAU6pv0FaMtQL95jOolVkS6oBE4rdqZwDSLBWhtA
         JkFcNDJT56S1GqEgIwBPKgm6CI1aZO7n6aTASoR5z6KjzC819njk03rNFatBmBMNvTed
         L9RDsXZ9OidOZmA4XiHwy0+f1Gy2p2RXnTCQk04vB0DljH2eTgQnXBZI0CA5P9altaAk
         CF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732134671; x=1732739471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbJ6YvcQTq+U/Y/197hgNmybRuAZOqK/wPm01RS0Vko=;
        b=wZAqCaulL8KrYC9G77woayGKGDQfPWniCBjfiJOEm2O6GgkeQtk/tmzFkCSMWcOilx
         CzMu03SK9bA12rFr8Yhc2zTj/NgnD746EIGA0ntIkXolBpAvNF39c7VIgI7+yB433rCn
         sWWSZhDAG7fWChrVIa1XYryMLxhkMa6Q5VzfQNHqStuS5dPYELwYCJw2A/K4FMhbZ2D0
         9dVz5lCezj5L1L4KPspPn3SeHT8IQngf80pNRJKaoZrwtw4yhHeJWeEWiGg7eO9DRwvV
         KNJOqIYwqU7RgnuKeTFBWABsT4lnVcvM7oIALv5GrpCl15ipOEG8htWtcp0xZHLWfHZS
         nrpA==
X-Gm-Message-State: AOJu0YyZx9aa3yyvB6JNB7uuHZ60iLmIHtvNzW/2HR+kkdscAixZ0JL6
	875DF9x+cM8DVv8PcVbNJuMvscTLwve8fMKQgfnKm7HRr8u3XX1Ztutqrg==
X-Google-Smtp-Source: AGHT+IGJh9zGL+jr/68BMKNSUMYYf+HzcB1D350udsgwG4h034nCsRBvYzZdhj3gvqqD+Av42CmPCA==
X-Received: by 2002:a05:6102:1627:b0:4ad:5ca0:e28e with SMTP id ada2fe7eead31-4adbfcc9764mr1522682137.4.1732134671044;
        Wed, 20 Nov 2024 12:31:11 -0800 (PST)
Received: from hiagof-nb.. ([146.70.98.136])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-856dfe039f8sm1746145241.33.2024.11.20.12.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 12:31:10 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH 1/2] libdisplay-info: add recipe
Date: Wed, 20 Nov 2024 17:30:04 -0300
Message-Id: <20241120203005.1802141-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241120203005.1802141-1-hiagofranco@gmail.com>
References: <20241120203005.1802141-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 20:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207482

From: Hiago De Franco <hiago.franco@toradex.com>

libdisplay-info is a EDID and DisplayID library. Goals:

- Provide a set of high-level, easy-to-use, opinionated functions as
  well as low-level functions to access detailed information.
- Simplicity and correctness over performance and resource usage.
- Well-tested and fuzzed.

Since commit a16598b038b2 ("backend-drm: make libdisplay-info
mandatory") from Weston, this library is now mandatory in order to
build weston 14.0.1 and newer.

This recipe depends on hwdata-native, which support has been submitted to
meta-openembedded layer at [1].

Therefore, add this recipe.

[1] https://lore.kernel.org/all/20241120160005.8473-1-hiagofranco@gmail.com/

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 meta/conf/distro/include/maintainers.inc             |  1 +
 .../libdisplay-info/libdisplay-info_0.2.0.bb         | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d61b88f7de6c..81989506e19c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -324,6 +324,7 @@ RECIPE_MAINTAINER:pn-libcomps = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libconvert-asn1-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libdaemon = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libdazzle = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER:pn-libdisplay-info = "Hiago De Franco <hiago.franco@toradex.com>"
 RECIPE_MAINTAINER:pn-libdnf = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libdrm = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER:pn-libedit = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb b/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
new file mode 100644
index 000000000000..b98d2e4452a8
--- /dev/null
+++ b/meta/recipes-support/libdisplay-info/libdisplay-info_0.2.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "EDID and DisplayID library."
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
+inherit meson pkgconfig
-- 
2.39.5


