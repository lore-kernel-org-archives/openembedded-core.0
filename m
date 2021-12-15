Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B00C4321E
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:39 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.2648.1639608049326759587
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ImnoBceE;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id i22so10939365wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rD0F8jSQqxQk/+GXjFf1pHUbVXT8l1TXQQBCvetnQE4=;
        b=ImnoBceERsVEHbmSCzzIvCLGNFJpf3kqGElhGSDlaX5OWM7qEr7Y7LiDnZZdZhvi1B
         IPDDZ16yU7hnrMWwk/x0SFwXouuRfWcbfQU9xE+8gfUm1WF9tXilTNfp8nBseqHKVM86
         vSYugcdcBjmx94iOaINlZeb2F9Rzj4vSs2KXUlhoqYPqRJ77nPmK33g4Gs99+4otdKb3
         W/yfV3G65jjjPtX8KDSFdQWNU2CA5SXVXEVVMpgjp0phpBDvKuE3WXgnhvfXmbrILKMt
         xj7RsSR2+wMNjoAeeGJK9fCVTMrK+nvs3x92RhMPtEZaIdHDyhtz1/QYJIVRKqunMEUF
         l3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rD0F8jSQqxQk/+GXjFf1pHUbVXT8l1TXQQBCvetnQE4=;
        b=MFuXt/68X/o1uaKdGXDweKNWCgvp9wQLJpPKm9MKeMw4wUKvFzqfZPVcHmcIX8suBQ
         tz4RPgsAzPoXrQHsQzEmfGDANlJlj8L+sINpLvBw4V+Kk4iCVtlbGIrJQ3T4HPFl+h9q
         asSTtXuupRjp6UzNr7oFRIKbT2tlIsl+E7plXgaPv8tODKkFs1nkXiXruIm7l5m3Lbsw
         1IICp+k9G1WTg7cBWWaZgYuM8Vxzl2slH+WQzyDRBu+MYdCW8AD4LEcseW+ncJjGGhD6
         qB1t+pFAJGks6efvpR5IccL2gPpf2BBX6+1X4shAM6uSRcFKF7lVEV7EZ2AxxchhMcjw
         QZPw==
X-Gm-Message-State: AOAM532SHSmjM1JkG+dQjwTEBjTw0vstqlTNTI9Drqt9bgvKawetBBdC
	zRcvUk9j1oyeigZpJrPFSVWuTDaQllkzVg==
X-Google-Smtp-Source: 
 ABdhPJzx3OPXQPZwgq8Ag/m89AcGZo2A+gPAlnka3DOjaT19Quelw/Doj8wsK9EmDHofMq6dxalbcA==
X-Received: by 2002:a5d:61ca:: with SMTP id q10mr6355994wrv.102.1639608047952;
        Wed, 15 Dec 2021 14:40:47 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/26] alsa: upgrade 1.2.5 -> 1.2.6
Date: Wed, 15 Dec 2021 23:40:22 +0100
Message-Id: <20211215224034.1814148-14-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159756

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../alsa/{alsa-lib_1.2.5.1.bb => alsa-lib_1.2.6.1.bb}           | 2 +-
 .../alsa/{alsa-plugins_1.2.5.bb => alsa-plugins_1.2.6.bb}       | 2 +-
 .../alsa/{alsa-ucm-conf_1.2.5.1.bb => alsa-ucm-conf_1.2.6.2.bb} | 2 +-
 ...lsa-utils-scripts_1.2.5.1.bb => alsa-utils-scripts_1.2.6.bb} | 0
 meta/recipes-multimedia/alsa/alsa-utils.inc                     | 2 +-
 .../alsa/{alsa-utils_1.2.5.1.bb => alsa-utils_1.2.6.bb}         | 0
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.5.1.bb => alsa-lib_1.2.6.1.bb} (94%)
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.2.5.bb => alsa-plugins_1.2.6.bb} (98%)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.5.1.bb => alsa-ucm-conf_1.2.6.2.bb} (89%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.2.5.1.bb => alsa-utils-scripts_1.2.6.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.5.1.bb => alsa-utils_1.2.6.bb} (100%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
similarity index 94%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
index cf7c3fcd43..7c03287b84 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "628421d950cecaf234de3f899d520c0a6923313c964ad751ffac081df331438e"
+SRC_URI[sha256sum] = "ad582993d52cdb5fb159a0beab60a6ac57eab0cc1bdf85dc4db6d6197f02333f"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb
similarity index 98%
rename from meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb
rename to meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb
index 0eac982e1a..7b1ca2ee15 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.5.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/plugins/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "42eef98433d2c8d11f1deeeb459643619215a75aa5a5bbdd06a794e4c413df20"
+SRC_URI[sha256sum] = "068818a4b55d8c029daa00015d853d45113f56b224b7c64e1e117988c825b2a0"
 
 DEPENDS += "alsa-lib"
 
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.1.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.6.2.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.1.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.6.2.bb
index 9d874eca13..10860e61a0 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.5.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.6.2.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "5841a444166dcbf479db751303dbc3556f685085ac7e00f0c9e7755676195d97"
+SRC_URI[sha256sum] = "8be24fb9fe789ee2778ae6f32e18e8043fe7f8bc735871e9d17c68a04566a822"
 # Something went wrong at upstream tarballing
 
 inherit allarch
diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.6.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.6.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils.inc b/meta/recipes-multimedia/alsa/alsa-utils.inc
index 95b93d4432..631cbe1029 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils.inc
+++ b/meta/recipes-multimedia/alsa/alsa-utils.inc
@@ -24,7 +24,7 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "9c169ae37a49295f9b97b92ace772803daf6b6510a19574e0b78f87e562118d0"
+SRC_URI[sha256sum] = "6a1efd8a1f1d9d38e489633eaec1fffa5c315663b316cab804be486887e6145d"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.6.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.6.bb
-- 
2.20.1


