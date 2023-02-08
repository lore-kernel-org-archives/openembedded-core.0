Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46808C6FA99
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:15 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.3155.1675840928155593088
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fQ4R2jCC;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso737258wms.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rEFzNIBtFhmPxqmuS2B/0mf/GCffcQNhZ79D6elbzc=;
        b=fQ4R2jCCwf6m9Smk/04W0aONTe3KvqpGmIBGRBs8qio78iR4EZXlEFRXGs3yLugTXX
         ikxwf7D+qrrf2wpd5KFkM+twlIhbuxvJcoubsZS+jEqfj68uaEraUllZtRQa7lap4gd3
         h45TCdtGbi7ZdFuTKiNldnA9GejVYYv4i9k8pDnn7fQgRm4hwif0nm+CrHIhOndOEEKM
         pldgXE15YQ/c/B7A/tYFQXzBesiI982p7bzZCSL2uedUfaR84Jz1dAtSHv5kJmSMtNGm
         PpUvWgroD2UET54ciSLOUBqPx9biWdGZZ3KLYXroBJFHu1Nj3kDxC1Al8ttZfIuzQjBH
         APYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rEFzNIBtFhmPxqmuS2B/0mf/GCffcQNhZ79D6elbzc=;
        b=8JlUphsVFmmLQFWedrHdG3INpxXTAZDICTwIrFAJ8RGJbS2KEc1BvwO/Z9wh8Bij2+
         u5IMy5K6eNLyV8ujSR9Vgfvgf32+jDwDSJ9Nv4EG9RJDppcWQeWcLsIkIBPuueQp/e5e
         j55ChBIEsWasF0CSLIdL3hdoyAS3f3hVFIL4MNSBsdS0NDjR9QTc4iW3MsW/coMdRHb1
         wXhteUrPyhcwS0W3Kw9fC43OC3H+uWSlr2RJNAGyY4rWQKOPmOJrqX1KBfCqCsZyT9B6
         kLdlxF3oRz+n0OP3+PvsyesnsMDWGXqDoVttCdkHlpL7Uq84XCI6IzuYf5OgdS8Zem+M
         shGg==
X-Gm-Message-State: AO0yUKUaWY+JOARCswskgCOaEKwi8Yh424xCryKdAVOe0X/VHDCM0n32
	32MeywKk24WBUllJjH71iMZh1nHO1gE=
X-Google-Smtp-Source: AK7set9VpVsQu4HRVqq1A91IUJiBbXpLnh2xr7mRtXRnaWLL8jNmKZEYOTyu5q5TtgLnbLAsydj86Q==
X-Received: by 2002:a05:600c:3416:b0:3df:85d2:c768 with SMTP id y22-20020a05600c341600b003df85d2c768mr5477597wmp.26.1675840933720;
        Tue, 07 Feb 2023 23:22:13 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 45/52] linux-firmware: upgrade 20221214 -> 20230117
Date: Wed,  8 Feb 2023 08:21:36 +0100
Message-Id: <20230208072143.2930292-45-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176885

License-Update: additional firmwares, copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...inux-firmware_20221214.bb => linux-firmware_20230117.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221214.bb => linux-firmware_20230117.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
index c2354e627f..1dce06c8f5 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
@@ -70,7 +70,7 @@ LICENSE = "\
 LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
-                    file://LICENSE.amdgpu;md5=44c1166d052226cb2d6c8d7400090203 \
+                    file://LICENSE.amdgpu;md5=a2589a05ea5b6bd2b7f4f623c7e7a649 \
                     file://LICENSE.amd-ucode;md5=6ca90c57f7b248de1e25c7f68ffc4698 \
                     file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "bf7c716d16e48fe118c6209f99b13253"
+WHENCE_CHKSUM  = "05f1d941972cedadbf667c05f6010378"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -209,7 +209,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "e793783e92acbde549965521462d1d1327827360664cf242dbda08f075654331"
+SRC_URI[sha256sum] = "df11e25ba2fb4d5343473757e17a3b4cef599250a26b1f7e0f038850f0cb3d64"
 
 inherit allarch
 
-- 
2.30.2


