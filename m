Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185CDCD98EF
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5747.1781637397963405086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hasHH8bF;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so32712825e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637396; x=1782242196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ky5v187auQwLKWLrzMRevYuKwfmhLhq19tX6ImzD3mA=;
        b=hasHH8bFBWG5ub2KBbuaOXibaTdF6OU+0NQNS+HVYJbJD8rOR7x6LYFbZvBAmBVHG+
         gg6BipNFBM5qnxVEqmk1sYdy0bo5y910tQngdpMwJ/7kTbHYDfkYAAgM/HJ6M5bvg22t
         pUzFRzpDB/6f0Mhb1b2iNuXZuWXRuAYCn0sXevlE31bcNgI6b5LYq+WP9PCSjpR7Iba9
         NcRTAAOpVVp+U/gCfqnea/51XSL88jrs/Yu4WOkj9Nn6bU/4yof2sThal+1HcJW6ugsq
         BAsqrvmHiZtcTWyYMfuyHaVJpy6msRpDlHv4H41t2pPWmdkLyeDmbUzTkzwivhsoDbXB
         jBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637396; x=1782242196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ky5v187auQwLKWLrzMRevYuKwfmhLhq19tX6ImzD3mA=;
        b=YE1quQRKEMcoq3h3r5d1OVW5R+4UxdXJZBQy3yhG9SGakwsdP8/gneI2pIbWvlQb+g
         I2TjY6NhjVyxXOXkUkLMDkBeqXAKCXmqvwE27KDlqtZF9jgvDvtms3myLjvFuWQRYCYy
         2jWk7CvAEDysPEMGPCdzoRu5syAZhyo8lzBKP+pMRrk8v7oeeoHRA8yQLthDeDxJ8wM7
         WquYKfeQsoLE9zGZ7+8OTTJLGML9+S4zaS6zSikqqWUd7n041evGE4PA+KknHXvli719
         qramv0HHH6V6A9z0Ia477pR962JYHLbaPTi9ymSa+HftSfQ62Egdme4gJbyAmrWOHRcd
         47fw==
X-Gm-Message-State: AOJu0YynHh4d0okLejiOEpqqIB1kSum4vxpg4w3+NfMSy6ZtQH5MLFCZ
	a4dhRVzNHFZlpOnbufGHfoysb+Whvzh7s77gYh/S4Og13kuwfXOEuKVmFxJUSw4/
X-Gm-Gg: Acq92OHT3I4oGRFvihP0TdRtZDoJ9TUbeNp5GCyXwarr/ALkhGUNyMUR0x6vvMt1hVe
	GCGQ0W5uzdJAVJ58CEfA/JZ0DRqe/4qXDNRLbIPrz+5z1Dvs3BAHksnaGsJT/BtxvFTs99IjXvV
	WQMwkl7phUEMHVV2rBKBwUCoDLxSrCLmVjnDP+C3THYmhJo9mVSHasnDXQYcYuczRn2i94l1Fyd
	DAgyPaqAo4FRFtQeDIVDrpkrK79d2xUSx6+tTR4U9b4mkPSFteSv7aJOYThlOTMm5jV1H73s4xu
	oslWY4gO+NUItjkRIRjnD1dQpWxA/P6US7N6PbJyT/rkcVxFPkpD1HnlWo2z+r2huonaozC24tc
	u24ym/PH/bKpsb996nP/g5pOpYcvsu9oQ/heETWoNQByxosoOvaNSpzwbD8S1d6iRUAXBs+/S4p
	oZS8GZylVkqcqUQOdpI1wk7bz52B4XPtwifodUNS0G4oWBoY3cD2HUKlhbZ3I=
X-Received: by 2002:a05:600c:c3cc:20b0:490:e190:3b50 with SMTP id 5b1f17b1804b1-492341085femr13195e9.9.1781637396200;
        Tue, 16 Jun 2026 12:16:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/30] vulkan-validation-layers: upgrade 1.4.341.0 -> 1.4.350.0
Date: Tue, 16 Jun 2026 21:16:00 +0200
Message-ID: <20260616191628.2014553-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238929

From: Alexander Kanavin <alex@linutronix.de>

Use UPDATE_DEPS=OFF as otherwise dependencies will be pulled from the network in do_configure.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...rs_1.4.341.0.bb => vulkan-validation-layers_1.4.350.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.4.341.0.bb => vulkan-validation-layers_1.4.350.0.bb} (93%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.341.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.341.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb
index 0b9bead366..367438e1e1 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.341.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.350.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 & MIT & BSL-1.0 "
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b1a17d548e004bfbbfaa0c40988b6b31"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "14de3c0d7b396853d81e6975aad3713984a697a6"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.350;protocol=https;tag=vulkan-sdk-${PV}"
+SRCREV = "b9d4f9ead8d97c1bb0d174ea07d8aed8273818a5"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
@@ -24,6 +24,7 @@ EXTRA_OECMAKE = "\
     -DGLSLANG_INSTALL_DIR=${STAGING_LIBDIR} \
     -DVULKAN_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
     -DSPIRV_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
+    -DUPDATE_DEPS=OFF \
     "
 
 CXXFLAGS:append = " ${@oe.utils.vartrue('DEBUG_BUILD', '-DXXH_NO_INLINE_HINTS=1', '', d)}"
-- 
2.47.3


