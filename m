Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864D8C4167E
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:32 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.4223.1667832922280615366
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N9QyaD9W;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id bk15so16551937wrb.13
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rw2cJZJCDocUxOOob8hsj24hy8Sq6TGX0jhJrP2Z4Ic=;
        b=N9QyaD9WMQonfPqCYupUHm/t7vvwM9Ep+JqBIxULyCGvyI+orfB0QYAKuuOFL7RsMT
         UlxNKkfKtRC0Ejb6tON28Jvqce/ov5dsT85PcTo3Ry17kZMllQ9gvwNXkk6rsTy+8Iz7
         WFo4YDr14SjpirL8zyNkghzLrEN4TlYfI1PpYvCqZw33QZHdxhr7ci9dBR3PF9hs4zVT
         BQk/LNxQsEMAXtkU9aMVpJ2MsJUIkzLXRpxm7IyEWdlta/QeYuXMonBmNO0aBdp0TKc6
         siEWd2JyICpJvm1MnTUuYG3RQiYOPuauacacEWxLEmS6lbmjNbsypVfI1TTYYPMq/+7S
         QUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rw2cJZJCDocUxOOob8hsj24hy8Sq6TGX0jhJrP2Z4Ic=;
        b=BkBDqYU8llaaPHMTCa/EK3DMT/RxbkkdiQpj72yu0IsdqO9ROvWrcntA/AxUbJtqMQ
         JtX1a5zOIHZcLFXOP8FsFLYQzOS3saPogcPXhHTbiqCmtKQu5May4ighPb2uvcqYbtxS
         3pm7bq+dY4dm3n0BhJxi1G625flKRMxP7KioIdQZCLWZq1HdlV+Kcs3/2ANkONmdaryC
         KvA1SDIUfPq4FK68/POePegBir2sU2ncP6sTTCI7H8kyFMiTfaCGJ+rfvIgVXaYmrTqo
         Y9hi9MBW+Vxj5wZmP7V1V0/aith2tSlMZopmKmsCA/4VWEfPZK9nesq+lZV6pNabc7gW
         YfIw==
X-Gm-Message-State: ACrzQf39FWdlP2XRbZ8hH5vUogkodrXncTg3kabFRi6ZiUzOTL2nZVn/
	e2BKNMoWJs1GCcLaDeJ2LNhwdEFDHos=
X-Google-Smtp-Source: AMsMyM5hHWfsBXoPVGUYjwNaVLp103f5ePjdXJuB/mz5sv3MTyBrwKIKhmwS1FKzzeliGyBfrD1g0Q==
X-Received: by 2002:a5d:6c6f:0:b0:236:d270:7bd2 with SMTP id r15-20020a5d6c6f000000b00236d2707bd2mr25588875wrz.366.1667832926411;
        Mon, 07 Nov 2022 06:55:26 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/48] linux-firmware: upgrade 20220913 -> 20221012
Date: Mon,  7 Nov 2022 15:54:34 +0100
Message-Id: <20221107145508.1051404-14-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172864

License-Update: copyright years, additional firmwares

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...inux-firmware_20220913.bb => linux-firmware_20221012.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220913.bb => linux-firmware_20221012.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
index 8f921e2d0e..6ba59a34c2 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
@@ -71,7 +71,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
                     file://LICENSE.amdgpu;md5=44c1166d052226cb2d6c8d7400090203 \
-                    file://LICENSE.amd-ucode;md5=3c5399dc9148d7f0e1f41e34b69cf14f \
+                    file://LICENSE.amd-ucode;md5=6ca90c57f7b248de1e25c7f68ffc4698 \
                     file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
                     file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3 \
@@ -132,7 +132,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "98ecc3d3223df7ebdc23b0ec56aafb20"
+WHENCE_CHKSUM  = "d6d9d74a344a78028e6b0f1df80db14b"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -209,7 +209,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "26fd00f2d8e96c4af6f44269a6b893eb857253044f75ad28ef6706a2250cd8e9"
+SRC_URI[sha256sum] = "e9d174af729511c8cccb60ec4e0b223b3c44b67d813b42d1ab9813acfa667fa5"
 
 inherit allarch
 
-- 
2.30.2


