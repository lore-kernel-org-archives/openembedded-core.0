Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4539BC4450B
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:27 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.932.1783881805581946632
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=RHcRvTUv;
 spf=pass (domain: underview.tech, ip: 74.125.224.42, mailfrom: vince@underview.tech)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-664a09bc459so4095763d50.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881805; x=1784486605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QGwj5uGFMWOwIeTn5V9lWufCyeZw1NWybw8qTCFB9R8=;
        b=RHcRvTUvK1dEDvAFgQqCTbRyCx+EZ+n0e3MJhDar5dBVeGk/RPV8NuQ+1i4+eHo3S0
         sCbNEhlXrkDTXOC+gW7w7P6PwLMBONYZl+6c1b8U147vnTtHunU0Se1r0r4AAxrEI7D7
         fbcVRAnJx1Uu4m1nZsetKxOZDN02a23mHze9jGXHR77kUVXzHKlqNn4Md+d62JaWWzK2
         mGIaWpkT1GyIRYKbpG62L0I/ELhpBYV54zMECllwoxYgLK5ym2ul4aPc+enqmUcbcAvM
         CBDrAd77rWa1oLhXOveF5Nicv4tD/ut18sVCahZs8ip1fwwoErdmbPi6oRVZD/ONts1F
         Lqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881805; x=1784486605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QGwj5uGFMWOwIeTn5V9lWufCyeZw1NWybw8qTCFB9R8=;
        b=LmqINcWgWfEbeF242g3Q5g6VBU4aoHMEFovxrzAQur7w1EvFtqAcOlnoeyOGQTkpfi
         xCM4os5SrYjA9Gobm2ihYjh7vxzaKd2k3c4Ci3pwMO5NewpuJlb7qjUVJMHB5xJPAMKE
         9MfRtMyp3RpSYFRQOPhGSd3h4CLuvsUtszfZCDseB91Rgf7MR60kL5sGAMM2N9EafVOb
         cGfxJPZDylH+wrNL2H5SXTt3jC6ghueKf2IMtxN6L07Bi6hhANyBEiSowZ7nvgJ2D1uW
         VxrbyDpwBOEET9vXXMQIZoKh5FAII73MMd37UmV7K/mmpdl4rmc9rh9GXChAdjrf7ddr
         Wv/A==
X-Gm-Message-State: AOJu0Yx3dIZ/aRR0KtktInKwnactITGQQTjzQ4hOQ1Gn3BXXEhUMc8Fu
	rLZPj/7H8e01pXV9WrhFmPouJznMtAjjyoz//tECWGfqtYENA62jghqWnvCzcs5pNBZJAjSKWoY
	15eMS2Ts=
X-Gm-Gg: AfdE7cn+3zYQCNkwtdEUwpEYjtUawVJOKkbjRNTR6DQinVSVxDQBEkqWI7d8W9LCc0k
	bOjK2K2sm35GEum9B+Fami2Pq5yeWSaj2cZAHelWPjtFuOU7xpdwmVH3cE4BhUEubL5AcdDdKpl
	N0JfNtxaEKzSGal1QGGfFEWWZeqAgv73BnuP1SbPM9t9JNChHIDHQhJpioguMVTLk2AVt3lsjz3
	7a+PuKz7aAlZaimO3Ds9uKQzfTTmo0VdA916i08owfJVvNUL68HbB18pVvxb63H2Nzt/hpRmW90
	Zi7Kj5T0vZJejPJxLfJp9GC+yF8WWEdgena6IZ9zUxiyjzYfVMjXLZZaBvlmfLBVwx0dJSbcMS/
	QU0jCmmEjKmcr7vqLjVJCYftkydh04unY+9YsP/V0FhKfUHDa/64tUkynC9pp/KQm3+eB+7vcEO
	HX4/086W4PUWhuhQ==
X-Received: by 2002:a53:b08d:0:b0:667:af58:8d68 with SMTP id 956f58d0204a3-667d7c455demr3970294d50.61.1783881804541;
        Sun, 12 Jul 2026 11:43:24 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:24 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 08/27] packagegroup-base: rename kernel prefix
Date: Sun, 12 Jul 2026 14:42:48 -0400
Message-ID: <20260712184307.3259642-8-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240798

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../packagegroups/packagegroup-base.bb        | 156 +++++++++---------
 1 file changed, 78 insertions(+), 78 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index c57f4ae92a..e9726e1bbf 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -73,13 +73,13 @@ RDEPENDS:packagegroup-base = "\
     "
 
 RRECOMMENDS:packagegroup-base = "\
-    kernel-module-nls-utf8 \
-    kernel-module-input \
-    kernel-module-uinput \
-    kernel-module-rtc-dev \
-    kernel-module-rtc-proc \
-    kernel-module-rtc-sysfs \
-    kernel-module-unix"
+    ${KERNEL_PACKAGE_NAME}-module-nls-utf8 \
+    ${KERNEL_PACKAGE_NAME}-module-input \
+    ${KERNEL_PACKAGE_NAME}-module-uinput \
+    ${KERNEL_PACKAGE_NAME}-module-rtc-dev \
+    ${KERNEL_PACKAGE_NAME}-module-rtc-proc \
+    ${KERNEL_PACKAGE_NAME}-module-rtc-sysfs \
+    ${KERNEL_PACKAGE_NAME}-module-unix"
 
 RDEPENDS:packagegroup-base-extended = "\
     packagegroup-base \
@@ -152,10 +152,10 @@ RRECOMMENDS:packagegroup-base-ext2 = "\
 
 SUMMARY:packagegroup-base-vfat = "FAT filesystem support"
 RRECOMMENDS:packagegroup-base-vfat = "\
-    kernel-module-msdos \
-    kernel-module-vfat \
-    kernel-module-nls-iso8859-1 \
-    kernel-module-nls-cp437 \
+    ${KERNEL_PACKAGE_NAME}-module-msdos \
+    ${KERNEL_PACKAGE_NAME}-module-vfat \
+    ${KERNEL_PACKAGE_NAME}-module-nls-iso8859-1 \
+    ${KERNEL_PACKAGE_NAME}-module-nls-cp437 \
     dosfstools"
 
 SUMMARY:packagegroup-base-alsa = "ALSA sound support"
@@ -165,8 +165,8 @@ RDEPENDS:packagegroup-base-alsa = "\
     ${VIRTUAL-RUNTIME_alsa-state}"
 
 RRECOMMENDS:packagegroup-base-alsa = "\
-    kernel-module-snd-mixer-oss \
-    kernel-module-snd-pcm-oss"
+    ${KERNEL_PACKAGE_NAME}-module-snd-mixer-oss \
+    ${KERNEL_PACKAGE_NAME}-module-snd-pcm-oss"
 
 SUMMARY:packagegroup-base-pcmcia = "PC card slot support"
 RDEPENDS:packagegroup-base-pcmcia = "\
@@ -174,15 +174,15 @@ RDEPENDS:packagegroup-base-pcmcia = "\
     "
 
 RRECOMMENDS:packagegroup-base-pcmcia = "\
-    kernel-module-pcmcia \
-    kernel-module-airo-cs \
-    kernel-module-pcnet-cs \
-    kernel-module-serial-cs \
-    kernel-module-ide-cs \
-    kernel-module-ide-disk \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'kernel-module-hostap-cs', '',d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'kernel-module-orinoco-cs', '',d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'kernel-module-spectrum-cs', '',d)}"
+    ${KERNEL_PACKAGE_NAME}-module-pcmcia \
+    ${KERNEL_PACKAGE_NAME}-module-airo-cs \
+    ${KERNEL_PACKAGE_NAME}-module-pcnet-cs \
+    ${KERNEL_PACKAGE_NAME}-module-serial-cs \
+    ${KERNEL_PACKAGE_NAME}-module-ide-cs \
+    ${KERNEL_PACKAGE_NAME}-module-ide-disk \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', '${KERNEL_PACKAGE_NAME}-module-hostap-cs', '',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', '${KERNEL_PACKAGE_NAME}-module-orinoco-cs', '',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', '${KERNEL_PACKAGE_NAME}-module-spectrum-cs', '',d)}"
 
 SUMMARY:packagegroup-base-bluetooth = "Bluetooth support"
 RDEPENDS:packagegroup-base-bluetooth = "\
@@ -190,46 +190,46 @@ RDEPENDS:packagegroup-base-bluetooth = "\
     "
 
 RRECOMMENDS:packagegroup-base-bluetooth = "\
-    kernel-module-bluetooth \
-    kernel-module-l2cap \
-    kernel-module-rfcomm \
-    kernel-module-hci-vhci \
-    kernel-module-bnep \
-    kernel-module-hidp \
-    kernel-module-hci-uart \
-    kernel-module-sco \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'usbhost', 'kernel-module-hci-usb', '',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'pcmcia', 'kernel-module-bluetooth3c-cs', '',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'pcmcia', 'kernel-module-bluecard-cs', '',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'pcmcia', 'kernel-module-bluetoothuart-cs', '',d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'pcmcia', 'kernel-module-dtl1-cs', '',d)} \
+    ${KERNEL_PACKAGE_NAME}-module-bluetooth \
+    ${KERNEL_PACKAGE_NAME}-module-l2cap \
+    ${KERNEL_PACKAGE_NAME}-module-rfcomm \
+    ${KERNEL_PACKAGE_NAME}-module-hci-vhci \
+    ${KERNEL_PACKAGE_NAME}-module-bnep \
+    ${KERNEL_PACKAGE_NAME}-module-hidp \
+    ${KERNEL_PACKAGE_NAME}-module-hci-uart \
+    ${KERNEL_PACKAGE_NAME}-module-sco \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'usbhost', '${KERNEL_PACKAGE_NAME}-module-hci-usb', '',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'pcmcia', '${KERNEL_PACKAGE_NAME}-module-bluetooth3c-cs', '',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'pcmcia', '${KERNEL_PACKAGE_NAME}-module-bluecard-cs', '',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'pcmcia', '${KERNEL_PACKAGE_NAME}-module-bluetoothuart-cs', '',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'pcmcia', '${KERNEL_PACKAGE_NAME}-module-dtl1-cs', '',d)} \
     "
 
 SUMMARY:packagegroup-base-usbgadget = "USB gadget support"
 RRECOMMENDS:packagegroup-base-usbgadget = "\
-    kernel-module-pxa27x_udc \
-    kernel-module-gadgetfs \
-    kernel-module-g-file-storage \
-    kernel-module-g-serial \
-    kernel-module-g-ether"
+    ${KERNEL_PACKAGE_NAME}-module-pxa27x_udc \
+    ${KERNEL_PACKAGE_NAME}-module-gadgetfs \
+    ${KERNEL_PACKAGE_NAME}-module-g-file-storage \
+    ${KERNEL_PACKAGE_NAME}-module-g-serial \
+    ${KERNEL_PACKAGE_NAME}-module-g-ether"
 
 SUMMARY:packagegroup-base-usbhost = "USB host support"
 RDEPENDS:packagegroup-base-usbhost = "\
     usbutils "
 
 RRECOMMENDS:packagegroup-base-usbhost = "\
-    kernel-module-uhci-hcd \
-    kernel-module-ohci-hcd \
-    kernel-module-ehci-hcd \
-    kernel-module-usbcore \
-    kernel-module-usbhid \
-    kernel-module-usbnet \
-    kernel-module-sd-mod \
-    kernel-module-scsi-mod \
-    kernel-module-usbmouse \
-    kernel-module-mousedev \
-    kernel-module-usbserial \
-    kernel-module-usb-storage "
+    ${KERNEL_PACKAGE_NAME}-module-uhci-hcd \
+    ${KERNEL_PACKAGE_NAME}-module-ohci-hcd \
+    ${KERNEL_PACKAGE_NAME}-module-ehci-hcd \
+    ${KERNEL_PACKAGE_NAME}-module-usbcore \
+    ${KERNEL_PACKAGE_NAME}-module-usbhid \
+    ${KERNEL_PACKAGE_NAME}-module-usbnet \
+    ${KERNEL_PACKAGE_NAME}-module-sd-mod \
+    ${KERNEL_PACKAGE_NAME}-module-scsi-mod \
+    ${KERNEL_PACKAGE_NAME}-module-usbmouse \
+    ${KERNEL_PACKAGE_NAME}-module-mousedev \
+    ${KERNEL_PACKAGE_NAME}-module-usbserial \
+    ${KERNEL_PACKAGE_NAME}-module-usb-storage "
 
 SUMMARY:packagegroup-base-ppp = "PPP dial-up protocol support"
 RDEPENDS:packagegroup-base-ppp = "\
@@ -237,18 +237,18 @@ RDEPENDS:packagegroup-base-ppp = "\
     ppp-dialin"
 
 RRECOMMENDS:packagegroup-base-ppp = "\
-    kernel-module-ppp-async \
-    kernel-module-ppp-deflate \
-    kernel-module-ppp-generic \
-    kernel-module-ppp-mppe \
-    kernel-module-slhc"
+    ${KERNEL_PACKAGE_NAME}-module-ppp-async \
+    ${KERNEL_PACKAGE_NAME}-module-ppp-deflate \
+    ${KERNEL_PACKAGE_NAME}-module-ppp-generic \
+    ${KERNEL_PACKAGE_NAME}-module-ppp-mppe \
+    ${KERNEL_PACKAGE_NAME}-module-slhc"
 
 SUMMARY:packagegroup-base-ipsec = "IPSEC support"
 RDEPENDS:packagegroup-base-ipsec = "\
     "
 
 RRECOMMENDS:packagegroup-base-ipsec = "\
-    kernel-module-ipsec"
+    ${KERNEL_PACKAGE_NAME}-module-ipsec"
 
 #
 # packagegroup-base-wifi contain everything needed to get WiFi working
@@ -264,42 +264,42 @@ RDEPENDS:packagegroup-base-wifi = "\
 "
 
 RRECOMMENDS:packagegroup-base-wifi = "\
-    ${@bb.utils.contains('MACHINE_FEATURES', 'usbhost', 'kernel-module-zd1211rw', '',d)} \
-    kernel-module-ieee80211-crypt \
-    kernel-module-ieee80211-crypt-ccmp \
-    kernel-module-ieee80211-crypt-tkip \
-    kernel-module-ieee80211-crypt-wep \
-    kernel-module-ecb \
-    kernel-module-arc4 \
-    kernel-module-crypto_algapi \
-    kernel-module-cryptomgr \
-    kernel-module-michael-mic \
-    kernel-module-aes-generic \
-    kernel-module-aes"
+    ${@bb.utils.contains('MACHINE_FEATURES', 'usbhost', '${KERNEL_PACKAGE_NAME}-module-zd1211rw', '',d)} \
+    ${KERNEL_PACKAGE_NAME}-module-ieee80211-crypt \
+    ${KERNEL_PACKAGE_NAME}-module-ieee80211-crypt-ccmp \
+    ${KERNEL_PACKAGE_NAME}-module-ieee80211-crypt-tkip \
+    ${KERNEL_PACKAGE_NAME}-module-ieee80211-crypt-wep \
+    ${KERNEL_PACKAGE_NAME}-module-ecb \
+    ${KERNEL_PACKAGE_NAME}-module-arc4 \
+    ${KERNEL_PACKAGE_NAME}-module-crypto_algapi \
+    ${KERNEL_PACKAGE_NAME}-module-cryptomgr \
+    ${KERNEL_PACKAGE_NAME}-module-michael-mic \
+    ${KERNEL_PACKAGE_NAME}-module-aes-generic \
+    ${KERNEL_PACKAGE_NAME}-module-aes"
 
 SUMMARY:packagegroup-base-nfc = "Near Field Communication support"
 RDEPENDS:packagegroup-base-nfc = "\
     neard"
 
 RRECOMMENDS:packagegroup-base-nfc = "\
-    kernel-module-nfc"
+    ${KERNEL_PACKAGE_NAME}-module-nfc"
 
 SUMMARY:packagegroup-base-3g = "Cellular data support"
 RDEPENDS:packagegroup-base-3g = "\
     ofono"
 
 RRECOMMENDS:packagegroup-base-3g = "\
-    kernel-module-cdc-acm \
-    kernel-module-cdc-wdm"
+    ${KERNEL_PACKAGE_NAME}-module-cdc-acm \
+    ${KERNEL_PACKAGE_NAME}-module-cdc-wdm"
 
 SUMMARY:packagegroup-base-smbfs = "SMB network filesystem support"
 RRECOMMENDS:packagegroup-base-smbfs = "\
-    kernel-module-cifs \
-    kernel-module-smbfs"
+    ${KERNEL_PACKAGE_NAME}-module-cifs \
+    ${KERNEL_PACKAGE_NAME}-module-smbfs"
 
 SUMMARY:packagegroup-base-cramfs = "cramfs filesystem support"
 RRECOMMENDS:packagegroup-base-cramfs = "\
-    kernel-module-cramfs"
+    ${KERNEL_PACKAGE_NAME}-module-cramfs"
 
 #
 # packagegroup-base-nfs provides ONLY client support - server is in nfs-utils package
@@ -309,7 +309,7 @@ RDEPENDS:packagegroup-base-nfs = "\
     rpcbind"
 
 RRECOMMENDS:packagegroup-base-nfs = "\
-    kernel-module-nfs "
+    ${KERNEL_PACKAGE_NAME}-module-nfs "
 
 SUMMARY:packagegroup-base-zeroconf = "Zeroconf support"
 RDEPENDS:packagegroup-base-zeroconf = "\
@@ -323,7 +323,7 @@ RDEPENDS:packagegroup-base-ipv6 = "\
     "
 
 RRECOMMENDS:packagegroup-base-ipv6 = "\
-    kernel-module-ipv6 "
+    ${KERNEL_PACKAGE_NAME}-module-ipv6 "
 
 SUMMARY:packagegroup-base-serial = "Serial port support"
 RDEPENDS:packagegroup-base-serial = "\
-- 
2.43.0


