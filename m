Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA07D1F9B7
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:51:40 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.4807.1729018298211715221
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Jrl3GeWE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso4001100a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018297; x=1729623097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1LwgDwIudy7PCh5ck7CKjMe2Y2zMKxnZaOYOxE12CM=;
        b=Jrl3GeWEtabQ6v5QA9+NB/lQ+EHA/lojB3hFZDpqYbzliB4WN//6zE6g/r7mIa01cl
         JiIVg5Bhzmpgvfp65xukMhYUgSkd9/CXDhfDW1nJWNcXkUAZdFZtmjugnaIJP73/xZ/7
         KqMKxRwgThTjEEPuIJJCYpVaiTr4a5O/peS4uUHhVrOfrxkbc63HZ3con5RCbxMm8rGT
         491BtTpSTh2MmYzUS5nlsIEuVwaI+igm3u4XcqOgF9FXcBzIglEG1BD0FJP+uEkDPgNr
         o8/CRWXpo+BvtYoThPd06PLOOXyA7sgAmSFQtSU6BRQOR5sAZUZnOoa86jl2Bk2sHd+9
         /8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018297; x=1729623097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1LwgDwIudy7PCh5ck7CKjMe2Y2zMKxnZaOYOxE12CM=;
        b=rP8eUcIM60vjCjmGRJfREKq7fCQ52MXULM/PGvclwcucWHGTQvknKwaAWNELYuT0hx
         oRNx9hUsjF2a2GYUOfkN+txUkuF61XkUWg/c6uEDXtiGwmqCvaUNs3AZecaIA0NIT6cy
         W/UaueRZa69aK2Glo9YGuJYvJ/DXHiVPOl0TxAkALu1oFuGwoHXAJc/TeiOk3uS+pSRM
         XoZjHoB1N2TFb+fU7zYdqZXQi7gmkKzm77/Ri5Ovrb4qSj5iL2GfKTJWLntJPLUWs18W
         5H3YDfvb7M2wZmSW8ouRmPAhjxS0kW1AeZqSj27EiGV5INM2GaNe9UYKvKenAxuwct2N
         m8Ow==
X-Gm-Message-State: AOJu0YzoKBRWJrEAbrhtjs0YBiBmEjUIuK/bW37bnvhA6KzblNlukKuf
	1JkuKOWBGTm+KwvNQXoufjQflTPdC5vhwpHwED0MeXF//lZ6kIoQRx5cgXZ10RQW9/NWpp8VQwu
	R
X-Google-Smtp-Source: AGHT+IEPYRxZR10itZ2KS07Tc8hi0oaMWR2I6qq4X/LyOpSv1tiqWbdBgVpv9jshNCiA6LUBUOcLow==
X-Received: by 2002:a05:6a20:bf10:b0:1d8:fc13:2399 with SMTP id adf61e73a8af0-1d8fc132868mr2427059637.16.1729018267569;
        Tue, 15 Oct 2024 11:51:07 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773717b9sm1616187b3a.9.2024.10.15.11.51.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/18] linux-firmware: upgrade 20240312 -> 20240909
Date: Tue, 15 Oct 2024 11:50:40 -0700
Message-Id: <14b1560b2fb303eb63fc1c6853ca4e3e8ef9355b.1729018153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729018153.git.steve@sakoman.com>
References: <cover.1729018153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205941

From: Macpaul Lin <macpaul.lin@mediatek.com>

License-Update: additional files

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ux-firmware_20240312.bb => linux-firmware_20240909.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240312.bb => linux-firmware_20240909.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
index 5819d9287c..30c47d7720 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240312.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
@@ -82,7 +82,7 @@ LICENSE = "\
 LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
-                    file://LICENSE.amdgpu;md5=a2589a05ea5b6bd2b7f4f623c7e7a649 \
+                    file://LICENSE.amdgpu;md5=1433dfea38c97a2e563a248a863dcb94 \
                     file://LICENSE.amd-ucode;md5=6ca90c57f7b248de1e25c7f68ffc4698 \
                     file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
                     file://LICENSE.amphion_vpu;md5=2bcdc00527b2d0542bd92b52aaec2b60 \
@@ -142,7 +142,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
                     file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9 \
                     file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5 \
-                    file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec \
+                    file://LICENCE.ti-connectivity;md5=3b1e9cf54aba8146dad4b735777d406f \
                     file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c \
                     file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118 \
                     file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
@@ -154,7 +154,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "514da1cd8b363373030f0c16749feb8d"
+WHENCE_CHKSUM  = "6ae5ffd807c84809977286ad0b37acdb"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -241,7 +241,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "b2327a54ad1897c828008caf63af5ee15469ba723a5016be58f2b44f07bd4b94"
+SRC_URI[sha256sum] = "943fbd19883cf8eadf89e0b22422549db056557b1ecd30a56400615971369671"
 
 inherit allarch
 
-- 
2.34.1


