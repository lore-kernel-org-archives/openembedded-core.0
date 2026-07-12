Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0639DC43458
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:37 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9501.1783835495470831156
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=PhmfX1k2;
 spf=pass (domain: underview.tech, ip: 74.125.224.44, mailfrom: vince@underview.tech)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-667971437d6so3414028d50.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835494; x=1784440294; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QGwj5uGFMWOwIeTn5V9lWufCyeZw1NWybw8qTCFB9R8=;
        b=PhmfX1k2odip3rucsjueU35HzfXeAKmvwa5zIyFE+N1PdIa6ENdC5EtDNjHWrtJGNu
         cYTNPGeQ5TWXxn3MpoZ9X2hRjY/Lr9WiD8yWVWtzyPrhlHBaH60X7yVyC80QDrLwFVcr
         ZhDT5Tj9Pos5m/y0LP8gt/Y4YPmvoSqOPyo8/0xWPRAAtXAyJSSWUwNjOEUpVJr2HJBm
         rKANZVZBYZhxgaYUaXz47ytCh+To90ghpBnOXiNxml6z2MQ8TlmIN9tHFc+qWa3Dop+E
         uHmA4kNWtkK0YCgsW8eNpzMGnGd2IupscChw2/YqWfpDaOOBpMQ3eXZjIJilzbkAheS1
         Zv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835494; x=1784440294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QGwj5uGFMWOwIeTn5V9lWufCyeZw1NWybw8qTCFB9R8=;
        b=YxHDb/5pVSyVTLQpaQjcuObk6lIJIc59usamlhdjkUUtxDbHlmOfIqV+a/MebLHZG5
         FYJAY+2Y880atMFbtFfH8AjfajDTwS5q4iy+x4SzRE8oCSsqjrOp4FczMPm70JRXi3r1
         QbHSAG7FP8suowfeZWSD6B40DC5M4X+DrVg1kCgItwXg7aCP5s4I4TxZV+t7y9BdQCQj
         kZvulroK/9in17X3xUtIYg3bHZR5ObUADOHwSGd9RijN1h5eXNHTESx4gvXeYFMkExSO
         xN9g6Vy31gnhwlYUxB49Gu6CI4icRuKdgJ6EIXk+xyvLftnWeKOyJ+Mh4XfpwxXLsIUc
         Cw9A==
X-Gm-Message-State: AOJu0YxAUzdcc/vnWdKiPQnR3WUA3jc4LwJ3h9gb9vorbxgsw+sRQbEQ
	EZJLHsBRoFlVF/0SF3SWVAK5zHeosT66ef3Dan49aC+AOutiIkiilFFqoj1ZIFIwxRVR+hYL0iu
	0abLJ3vo=
X-Gm-Gg: AfdE7cmENpoPUt1RwRnwPCBjQOv9XewHYIY+7H0O7x84mUNYFifYW5oC9gUTBHLdYpq
	OKDy3PdF4dY+K3Fma3ZYEjjuM29rlHBFcCnxNSIwVfyywZbmC0XDnzH9I1xQ+/G67qvGIt/qfgi
	I4zoQ/ohfOctVBufiXPc3a/HMjwJmdw/JxrMHcghi+AZ+8tXix1Ut20bZf4vtCwnRRvOHBs2NW3
	rqZpBqIJ/P4RoOakSsxFCa19/x9A6v/Ux4HoPU0ElSYG3gkV6Hzcxa34GLyHXVm5RxeBG2c8q1s
	1lqpoJ92FLM7bTHBV24Udc/cLMoDLTgFRvLEmHQ6IXOYxgxBxa/h6nd3awxJ4UHewdIDgKCH3V+
	0MxjRLeUD08PIMZ1y5neBpD6Ej18qcDLR9t6/GZmzt3Kf9NV2TYHCbQ6BneTpWNQU60H+otadRm
	nD1Ewx2SinBMcSgOVyy6X7XphW
X-Received: by 2002:a05:690e:4090:b0:667:e158:51c9 with SMTP id 956f58d0204a3-667e158575bmr2072715d50.45.1783835494390;
        Sat, 11 Jul 2026 22:51:34 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:34 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 08/26] packagegroup-base: rename kernel prefix
Date: Sun, 12 Jul 2026 01:49:36 -0400
Message-ID: <20260712054954.4063745-8-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240733

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


