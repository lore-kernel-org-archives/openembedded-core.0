Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A01FC76188
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:48:36 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.8693.1678229304978679545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qnaMo4SL;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id nn12so45428pjb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByHTubwfhbo0y0c5XuUE8N7mBf7YnxIz6lVbMWpQysc=;
        b=qnaMo4SLG7+A9aW7wfsXRNAMyO1xyvxXiwl3EwqyOPlW1I1apUtv0R1JGtdvcrl72Y
         kXGsbwWSn2UC1WUPGTwpRaL0hoQoNAvI8BH9LppGmT45FAis1ZR4yVCaoY9vvBidk39F
         QuSRTzzVCPWTgQdyCLUYl1ZAZHk6uqS3vtxOHiQeNj5rtiUjfm5cOEFw9DVyOCe7qemK
         8DePVqUvihihna9J5zBGzJQBXA8ezLIEAm+JacD3vWOC45l8wQ5tLMabzUzv9lIgfSxS
         ALuI7t/NhEP9/80Ntkq2MzS8W45K2tJdnbDt65G6iaRa3c7H/L8ycCKlPSjjZPh+AJgo
         KcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByHTubwfhbo0y0c5XuUE8N7mBf7YnxIz6lVbMWpQysc=;
        b=Z8JZ7GOFZSwJEE3V8de/aDYtZlN3aof+FFc3slHIklEkfqXsYNAjcq/jm0BPUmZJ/i
         HFS4eAlVGQHNJMU/KsPM+6mzLecPuasGgrKz9ZVJrC/nluMviahOzQ9w4exRmKZx/TWU
         JVtL6TjyHD/9G2Ow99I4n8P/nVaWUvZiDA6ey1HOmJfKTw+DfWt9qNXD+yuShoDV0n1Y
         FnXd3WZZqg7GN4QHB2K0ZVQohPGjOU25bMpJCHrt1igMDB5Bf2v+0RmdPuyHRMd3Vgsb
         xrprOE/oSSZg80fOV7WKaWQPGuUGuOvMVfPVw/cx9uUK86pGbsrCcySiQar7Vf73uMW5
         pyMQ==
X-Gm-Message-State: AO0yUKWPKKfMnlXxk3X0UmYeYbZV4QIRNTkxjGUjgesSpM4p0prBMUPg
	oHe09JzTsuBsDSOntVjZ1z8XB90Ax2KeU9vaMiY=
X-Google-Smtp-Source: AK7set8JydZh+r12TmMbpcTYtN4HiR+gSyJ4yjFZsfJQE/EyXvbL//qO53WhQMRaBGa4rM6ic7R1wQ==
X-Received: by 2002:a05:6a20:9150:b0:be:d389:7abf with SMTP id x16-20020a056a20915000b000bed3897abfmr18197139pzc.3.1678229312374;
        Tue, 07 Mar 2023 14:48:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/23] linux-firmware: upgrade 20221214 -> 20230117
Date: Tue,  7 Mar 2023 12:47:42 -1000
Message-Id: <4cfe4c03904cb313d5cfbb6739cd9964a61c5fa0.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:48:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178130

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional firmwares, copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fdb8c12fc71b4a985372f5d02ce59a1402c14c4a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...inux-firmware_20221214.bb => linux-firmware_20230117.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221214.bb => linux-firmware_20230117.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20221214.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
index e3105053c7..ad2f4ac334 100644
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
2.34.1


