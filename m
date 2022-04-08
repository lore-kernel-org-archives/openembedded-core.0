Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D907C4321E
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.1124.1649445926045446408
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=7uUi/TCt;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id j6so5628557qkp.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LXSpDibdIVgsTdbhrP36rFr1suuz40FZpCB3k8RCqkw=;
        b=7uUi/TCtKpy+YpKJG/fmzbA6sGjatb6N0o376f3d1m9L/oswF2VfONKJTcXBRNKVtk
         tAdDoRd1sNr+XUKHOFzxvlkvFEEfz/Y4M5BnrzhDnFmBCU+TWM2g1ZfJgOD8Scdj9OEn
         1bFcXap1uLUAfc1VIP1VCEOGD8pRXYH87QDILNse7vOhC7UjzQUn+ei1ENNv8+4aPibv
         W9D+l/T4CtGd5/HkmXriUtUisNJaL8j0+B7HTRThiRL7+r8+FsnveaQihQjleIV18HL4
         tVLtv7yff/k5MNW9cmV7ECgkD69SXvQ/ZzdFyDth7cw/2CklnMXbq970lXzuOWvqGXHh
         41Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LXSpDibdIVgsTdbhrP36rFr1suuz40FZpCB3k8RCqkw=;
        b=FPGnGhqXSt9vsmAVRGmL1pu6uN1tyK7eXLkr4IJ/j/jLy9ad2r3uqxt/S2A5EMx0Ps
         GgoxQ8xF2QvviqQIzZfFTRvwRAaIRyd0wJP7HUTZDwPtLejYKMhyPGswsZU8PyteFzzV
         OF6bP6hjZwh36qmRlIz4y9+HDG9IYm3tPESHVzwtPFLyMh1+xbStsVqz/ryA08QGEBX/
         phOCDjsa/YcNMF+gAD73V1APK3C1dSNywAvonGNz3AonPay3E7pFr3+x4NKFI+zCBsUG
         ZJ0TPEsgFoJCywEOxp9QcIXz38Aus6VnFABK61e051Fr2LMEqp1yr6NhRD8Kh4o8bSZu
         EJug==
X-Gm-Message-State: AOAM5337K1hGkPMdIVIiYcAJn7GUEEnmaV46FQpP1/OHQAuKkjUpigg4
	WGMWBVZZ2SBV3iNvkw2rkT3wMfCjHbaopQ==
X-Google-Smtp-Source: 
 ABdhPJx1ajhCRCTnQxT9Mez9YotbMshT0yal5K6pBGbpc4zT0riaE6/M3zHtn8eUXK8bFqWsVcsr1Q==
X-Received: by 2002:a05:620a:2944:b0:67e:c9bf:3f9b with SMTP id
 n4-20020a05620a294400b0067ec9bf3f9bmr13914454qkp.144.1649445925050;
        Fri, 08 Apr 2022 12:25:25 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 b206-20020a3767d7000000b0069be71815b8sm1064362qkc.42.2022.04.08.12.25.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 12:25:24 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/6] qemuarmv5: use arm-versatile-926ejs KMACHINE and add
 more virtio devices
Date: Fri,  8 Apr 2022 15:25:19 -0400
Message-Id: <20220408192521.1608764-5-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408192521.1608764-1-jdmason@kudzu.us>
References: <20220408192521.1608764-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164166

Use the Arm Versatile 926 kernel configs and round out all of the virtio
interfaces to match other QEMU machines.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/qemuarmv5.conf | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index 2dad504c9932..0c39993e8483 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -13,9 +13,17 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;ttyAMA1"
 QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine versatilepb"
 QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
+# For graphics to work we need to define the VGA device as well as the necessary USB devices
 QB_GRAPHICS = "-device virtio-gpu-pci"
 QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
-PREFERRED_VERSION_linux-yocto ??= "5.15%"
+# Virtio Networking support
+QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
+QB_NETWORK_DEVICE = "-device virtio-net-pci,netdev=net0,mac=@MAC@"
+# Virtio serial console
+QB_SERIAL_OPT = "-device virtio-serial-pci -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
+QB_TCPSERIAL_OPT = "-device virtio-serial-pci -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
-KMACHINE:qemuarmv5 = "qemuarm"
+PREFERRED_VERSION_linux-yocto ??= "5.15%"
+KMACHINE:qemuarmv5 = "arm-versatile-926ejs"
-- 
2.30.2


