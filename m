Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64962C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 23:28:28 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web08.1207.1655854103533426943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gvUzzp3M;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id g186so14507805pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NQBHSQNuEXtkeJomQZTJwvyTa5n+mtqQd83cH4EUZrU=;
        b=gvUzzp3MxTGSMHVReBg3tBpsLpZdYbObGcVG7thVLEqgg669qA76GYLy+i+gRjMihb
         Q+sugoYcvNcSPaM1CwPf+oYXd2NUCDb7AKoew0Doo8Z2AoPozca/lNyHC4w5ER+CyPDV
         f463uhUa0kj3h9nP80+cxMw8Qlxx3xT3ciXR1Zwame3G4ARphCRka5jDu8fYNrpUKSKa
         3lzTbdMJh7RBHKDsN9SLfq5x9JOB2Pts2p6blYsNUmDwjQTPGgYDRr7X21yTdHE6ILjH
         ub6P7kBB7RSadtYLQdTCErKp9pL5wkq086y0bf6I5P25sSzxp896BSOPr41gz00GArCH
         2BEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NQBHSQNuEXtkeJomQZTJwvyTa5n+mtqQd83cH4EUZrU=;
        b=babLXbkuD8eefVPRvIm9MQ6hITeM1MGH4HI/X43Fg92MNTUy4eur6GaKp8Eqja7a+7
         WDXokfPOKlORlMpyaCaNXxGzTT1UM1h+racd9xMFp3Pz9zzzkBhPM3NRgjA1uwSOwunt
         EBsSdDhWSZBs51kJRaXjYonxAu/SfhuMZM4g5TjGQOalqqM/SxAEsNjEaVaPoL5CJymo
         +IHW/UpynC2hUP1s+UYzXIx8oDI/YIqTjpZxlVlM5FF5rqps6FNNg+7UMceJOJmfuuKW
         Hg7hCAnBVrw306kLoOSGw9/I9R5PHQsNf94XLls62Nm5JLwyjEhkLv8x9PNpMV3/tI2P
         F1Bw==
X-Gm-Message-State: AJIora9WFcPufWqizBYnQIoGyti1A/ZZ1SMWXsHJkdq7HUjURq05I8zh
	FtFn7RBC24rWMt2Nd6O18P+2EHqojb42BRdf
X-Google-Smtp-Source: 
 AGRyM1ugS5D97Koeq3g4mA/LHUq07nUfxi91tWz6JBTFp1iFnFWnxQ49arjo2BEgFjCa0s+SjxPnIw==
X-Received: by 2002:a63:145e:0:b0:405:70e2:1d04 with SMTP id
 30-20020a63145e000000b0040570e21d04mr336954pgu.487.1655854102426;
        Tue, 21 Jun 2022 16:28:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z9-20020a1709027e8900b0015e8d4eb209sm11323565pla.83.2022.06.21.16.28.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:28:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/13] linux-firmware: add support for building
 snapshots
Date: Tue, 21 Jun 2022 13:27:49 -1000
Message-Id: 
 <96cd37cff9caaf3e92cbf63660e9b6bc73fa9744.1655848177.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655848177.git.steve@sakoman.com>
References: <cover.1655848177.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 23:28:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167193

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

In some cases it is useful to be able to test the snapshot of
linux-firmware (e.g. to test if the updated firmware works on the
particular hardware). Allow building the linux-firmware snapshots.

To switch to the most recent branch, add the following lines to the
local.conf file:

PREFERRED_VERSION_linux-firmware = "1:20220509+git%"
SRCREV:class-devupstream = "${AUTOREV}"
WHENCE_CHKSUM:class-devupstream:pn-linux-firmware = "4288aad55d189fa225d492526b8406d5"

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b023570ae1d239de14b50a0e827582d0e84ddf81)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20220509.bb             | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
index 6e328e5726..10a7036a19 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
@@ -69,6 +69,7 @@ LICENSE = "\
     & WHENCE \
 "
 
+WHENCE_CHKSUM = "d3eb82686904888f8bbbe8d865371404"
 LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
@@ -132,7 +133,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=d3eb82686904888f8bbbe8d865371404 \
+                    file://WHENCE;md5=${WHENCE_CHKSUM} \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -208,6 +209,11 @@ SRC_URI = "\
   file://0001-Makefile-replace-mkdir-by-install.patch \
 "
 
+BBCLASSEXTEND = "devupstream:target"
+SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=https;branch=main"
+# Pin this to the 20220509 release, override this in local.conf
+SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
+
 SRC_URI[sha256sum] = "376e0b3d7b4f8aaa2abf7f5ab74803dcf14b06b94e3d841b1467cd9a2848255e"
 
 inherit allarch
-- 
2.25.1


