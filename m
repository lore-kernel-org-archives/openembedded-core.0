Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B384D374AF
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 09:06:17 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.17814.1729242370806034262
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 02:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CmsbSDnt;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43152b79d25so17886205e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 02:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729242369; x=1729847169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zCf4HdU0JtG6rHvfhIoalZpzb1WpwwwocgxM60Uo3Qk=;
        b=CmsbSDnt5RPxwq3SqTTC34lyMGwofycCUq70VOGXdYMFAYYjBMA/xSLpVcVJNsIfOt
         CHZv8i+6Oz2p+7dgDUjjETJEsURhTrSDe6qr3iLpV1q4Udv/XedJvSefmnJGLkCPA5nj
         rTNC/IzNUzpT3L61K0Ir6620nkXqL8cV7igtrAMp8vmFgX47uriGLBpuu8yA/tE2+oj4
         qL3TbqKcNUlkxSv+l9FJoK9V9G5MPhVorhJWzDNTohNJ3c+WuRazG5UEeMbOH+cAbQi3
         CCaZbOwTf0AZz4Q1AZByP22dqNVSZxmfn3Oq7Mc/mx8McR2Vt6ZbBc9IyNTF+XzZSCrZ
         tldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729242369; x=1729847169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCf4HdU0JtG6rHvfhIoalZpzb1WpwwwocgxM60Uo3Qk=;
        b=M3eI3UzafeJaQ1QNqo138SZNaW05Cd4IenmsSsn1+FVekoAaHzydJJPLIEAdELABQb
         jUYtRYC4P8oaEYC6uMKdzR/o+xTmaVFRyL9C9WyHj4cLQyo6c98LCgaLps2lsUAl987c
         rXULauubD+1js6La34x599ECLLjOBNpw9Qr+SWkpnC+hm+sFlar8CbIiNSlc6D1QH7/e
         OzAHDegPY8UEUT3Mja6u1m+SNMEHzTMTDLaf7NGK0qIDsHRSYrvx+9A/4q1ROJd3K+g9
         shPszE9EHbrEO1lu5JlTMVrO9UiRqc/H9QE9EVsPe6eZPjKOVkBMd6nf0FjHZt83G9F1
         ZfLQ==
X-Gm-Message-State: AOJu0YxT8Iu2ZAXV/2/bHvt7Mnyju8NAx8NOOH8SVc92+5idncqQ0guZ
	D/FYIrzoKk6DQg5oq5peTQFMSQAQN+ENl9g915lYXi3IPP1aKlpGxzHo6g==
X-Google-Smtp-Source: AGHT+IH+UmpIeDtYhPQrleiNl0/UiZ3VghsCOaAGvXdHYNBCGnlzORqvFB3QOZJ1z2dSgR6fywKPGQ==
X-Received: by 2002:a5d:5c85:0:b0:37e:c4e3:f130 with SMTP id ffacd0b85a97d-37ec4e3f2d2mr1130257f8f.41.1729242367657;
        Fri, 18 Oct 2024 02:06:07 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0460c6sm1372669f8f.26.2024.10.18.02.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 02:06:07 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] linux-firmware: Upgrade to 20241017 and allow compressing firmware
Date: Fri, 18 Oct 2024 11:06:03 +0200
Message-ID: <20241018090603.158796-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 09:06:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206042

The new 20241017 version contains some breaking changes
regarding firmware file deduplication.

Disable running check_whence.py in copy-firmware.sh to avoid
build issues. Instead, assume that WHENCE as accepted into
release tarballs is correct.

The kernel, dracut and systemd all support compressed firmware
files. Allow compressing them either as xz or zst which allows
significant disk space savings.

Ship non-compressed firmware as default.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...20240909.bb => linux-firmware_20241017.bb} | 361 +++++++++---------
 1 file changed, 187 insertions(+), 174 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240909.bb => linux-firmware_20241017.bb} (89%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
similarity index 89%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
index 4bcda67c8f..0877148954 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
@@ -158,7 +158,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "6ae5ffd807c84809977286ad0b37acdb"
+WHENCE_CHKSUM  = "f82849fb6325a8a14e21a4feacc5ebb0"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -247,23 +247,35 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "943fbd19883cf8eadf89e0b22422549db056557b1ecd30a56400615971369671"
+SRC_URI[sha256sum] = "a26c38ef5a83272f2b98ce8bf8ca1865a852a3deea49ce5a8dd804b914351273"
 
 inherit allarch
 
 CLEANBROKEN = "1"
 
-# Use PACKAGECONFIG_CONFARGS to set the Makefile target
 PACKAGECONFIG ??= ""
-# Enabling dedup will turn duplicate firmware files into links
-PACKAGECONFIG[deduplicate] = "install,install-nodedup,rdfind-native"
+PACKAGECONFIG[deduplicate] = ",,rdfind-native"
+
+# Possible values are "xz" and "zst".
+FIRMWARE_COMPRESSION ?= ""
+
+def fw_compr_suffix(d):
+    compr = d.getVar('FIRMWARE_COMPRESSION')
+    if compr == '':
+        return ''
+    return '-' + compr
 
 do_compile() {
 	:
 }
 
 do_install() {
-        oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' ${PACKAGECONFIG_CONFARGS}
+        sed -i 's:^./check_whence.py:#./check_whence.py:' ${S}/copy-firmware.sh
+
+        oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' install${@fw_compr_suffix(d)}
+        if [ "${@bb.utils.contains('PACKAGECONFIG', 'deduplicate', '1', '0', d)}" = "1" ]; then
+                oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' dedup
+        fi
         cp LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
         cp wfx/LICEN[CS]E.* ${D}${nonarch_base_libdir}/firmware/wfx/
 }
@@ -437,7 +449,7 @@ RDEPENDS:${PN}-amphion-vpu += "${PN}-amphion-vpu-license"
 LICENSE:${PN}-cw1200 = "Firmware-cw1200"
 LICENSE:${PN}-cw1200-license = "Firmware-cw1200"
 
-FILES:${PN}-cw1200 = "${nonarch_base_libdir}/firmware/wsm_22.bin"
+FILES:${PN}-cw1200 = "${nonarch_base_libdir}/firmware/wsm_22.bin*"
 FILES:${PN}-cw1200-license = "${nonarch_base_libdir}/firmware/LICENCE.cw1200"
 
 RDEPENDS:${PN}-cw1200 += "${PN}-cw1200-license"
@@ -452,24 +464,24 @@ LICENSE:${PN}-atheros-license = "Firmware-atheros_firmware"
 
 FILES:${PN}-atheros-license = "${nonarch_base_libdir}/firmware/LICENCE.atheros_firmware"
 FILES:${PN}-ar5523 = " \
-  ${nonarch_base_libdir}/firmware/ar5523.bin \
+  ${nonarch_base_libdir}/firmware/ar5523.bin* \
 "
 FILES:${PN}-ar9170 = " \
-  ${nonarch_base_libdir}/firmware/ar9170*.fw \
+  ${nonarch_base_libdir}/firmware/ar9170*.fw* \
 "
 FILES:${PN}-ath3k = " \
-  ${nonarch_base_libdir}/firmware/ath3k*fw \
+  ${nonarch_base_libdir}/firmware/ath3k*fw* \
 "
 FILES:${PN}-ath6k = " \
   ${nonarch_base_libdir}/firmware/ath6k \
 "
 FILES:${PN}-ath9k = " \
-  ${nonarch_base_libdir}/firmware/ar9271.fw \
-  ${nonarch_base_libdir}/firmware/ar7010*.fw \
-  ${nonarch_base_libdir}/firmware/htc_9271.fw \
-  ${nonarch_base_libdir}/firmware/htc_7010.fw \
-  ${nonarch_base_libdir}/firmware/ath9k_htc/htc_7010-1.4.0.fw \
-  ${nonarch_base_libdir}/firmware/ath9k_htc/htc_9271-1.4.0.fw \
+  ${nonarch_base_libdir}/firmware/ar9271.fw* \
+  ${nonarch_base_libdir}/firmware/ar7010*.fw* \
+  ${nonarch_base_libdir}/firmware/htc_9271.fw* \
+  ${nonarch_base_libdir}/firmware/htc_7010.fw* \
+  ${nonarch_base_libdir}/firmware/ath9k_htc/htc_7010-1.4.0.fw* \
+  ${nonarch_base_libdir}/firmware/ath9k_htc/htc_9271-1.4.0.fw* \
 "
 
 RDEPENDS:${PN}-ar5523 += "${PN}-atheros-license"
@@ -480,7 +492,7 @@ RDEPENDS:${PN}-ath9k += "${PN}-atheros-license"
 # For carl9170
 
 FILES:${PN}-carl9170 = " \
-  ${nonarch_base_libdir}/firmware/carl9170*.fw \
+  ${nonarch_base_libdir}/firmware/carl9170*.fw* \
 "
 LICENSE:${PN}-carl9170 = "GPL-2.0-or-later"
 
@@ -531,7 +543,7 @@ LICENSE:${PN}-ralink-license = "Firmware-ralink-firmware"
 
 FILES:${PN}-ralink-license = "${nonarch_base_libdir}/firmware/LICENCE.ralink-firmware.txt"
 FILES:${PN}-ralink = " \
-  ${nonarch_base_libdir}/firmware/rt*.bin \
+  ${nonarch_base_libdir}/firmware/rt*.bin* \
 "
 
 RDEPENDS:${PN}-ralink += "${PN}-ralink-license"
@@ -543,8 +555,8 @@ FILES:${PN}-mt76x-license = "${nonarch_base_libdir}/firmware/LICENCE.ralink_a_me
 LICENSE:${PN}-mt7601u = "Firmware-ralink_a_mediatek_company_firmware"
 
 FILES:${PN}-mt7601u = " \
-  ${nonarch_base_libdir}/firmware/mediatek/mt7601u.bin \
-  ${nonarch_base_libdir}/firmware/mt7601u.bin \
+  ${nonarch_base_libdir}/firmware/mediatek/mt7601u.bin* \
+  ${nonarch_base_libdir}/firmware/mt7601u.bin* \
 "
 RDEPENDS:${PN}-mt7601u += "${PN}-mt76x-license"
 
@@ -552,8 +564,8 @@ RDEPENDS:${PN}-mt7601u += "${PN}-mt76x-license"
 LICENSE:${PN}-mt7650 = "Firmware-ralink_a_mediatek_company_firmware"
 
 FILES:${PN}-mt7650 = " \
-  ${nonarch_base_libdir}/firmware/mediatek/mt7650.bin \
-  ${nonarch_base_libdir}/firmware/mt7650.bin \
+  ${nonarch_base_libdir}/firmware/mediatek/mt7650.bin* \
+  ${nonarch_base_libdir}/firmware/mt7650.bin* \
 "
 RDEPENDS:${PN}-mt7650 += "${PN}-mt76x-license"
 
@@ -561,10 +573,10 @@ RDEPENDS:${PN}-mt7650 += "${PN}-mt76x-license"
 LICENSE:${PN}-mt76x2 = "Firmware-ralink_a_mediatek_company_firmware"
 
 FILES:${PN}-mt76x2 = " \
-  ${nonarch_base_libdir}/firmware/mediatek/mt7662.bin \
-  ${nonarch_base_libdir}/firmware/mt7662.bin \
-  ${nonarch_base_libdir}/firmware/mediatek/mt7662_rom_patch.bin \
-  ${nonarch_base_libdir}/firmware/mt7662_rom_patch.bin \
+  ${nonarch_base_libdir}/firmware/mediatek/mt7662.bin* \
+  ${nonarch_base_libdir}/firmware/mt7662.bin* \
+  ${nonarch_base_libdir}/firmware/mediatek/mt7662_rom_patch.bin* \
+  ${nonarch_base_libdir}/firmware/mt7662_rom_patch.bin* \
 "
 RDEPENDS:${PN}-mt76x2 += "${PN}-mt76x-license"
 
@@ -574,8 +586,8 @@ LICENSE:${PN}-mediatek-license = "Firmware-mediatek"
 
 FILES:${PN}-mediatek = " \
   ${nonarch_base_libdir}/firmware/mediatek/* \
-  ${nonarch_base_libdir}/firmware/vpu_d.bin \
-  ${nonarch_base_libdir}/firmware/vpu_p.bin \
+  ${nonarch_base_libdir}/firmware/vpu_d.bin* \
+  ${nonarch_base_libdir}/firmware/vpu_p.bin* \
 "
 FILES:${PN}-mediatek-license = " \
   ${nonarch_base_libdir}/firmware/LICENCE.mediatek \
@@ -628,12 +640,12 @@ RDEPENDS:${PN}-amdgpu += "${PN}-amdgpu-license"
 LICENSE:${PN}-lt9611uxc = "Firmware-Lontium"
 
 FILES:${PN}-lontium-license = "${nonarch_base_libdir}/firmware/LICENSE.Lontium"
-FILES:${PN}-lt9611uxc = "${nonarch_base_libdir}/firmware/lt9611uxc_fw.bin"
+FILES:${PN}-lt9611uxc = "${nonarch_base_libdir}/firmware/lt9611uxc_fw.bin*"
 
 # For Arm Mali
 LICENSE:${PN}-mali-csffw-arch108 = "Firmware-mali_csffw"
 FILES:${PN}-mali-csffw-license = "${nonarch_base_libdir}/firmware/LICENCE.mali_csffw"
-FILES:${PN}-mali-csffw-arch108 = "${nonarch_base_libdir}/firmware/arm/mali/arch10.8/mali_csffw.bin"
+FILES:${PN}-mali-csffw-arch108 = "${nonarch_base_libdir}/firmware/arm/mali/arch10.8/mali_csffw.bin*"
 
 RDEPENDS:${PN}-mali-csffw-arch108 += "${PN}-mali-csffw-license"
 
@@ -653,12 +665,12 @@ LICENSE:${PN}-marvell-license = "Firmware-Marvell"
 
 FILES:${PN}-marvell-license = "${nonarch_base_libdir}/firmware/LICENCE.Marvell"
 FILES:${PN}-pcie8897 = " \
-  ${nonarch_base_libdir}/firmware/mrvl/pcie8897_uapsta.bin \
+  ${nonarch_base_libdir}/firmware/mrvl/pcie8897_uapsta.bin* \
 "
 FILES:${PN}-pcie8997 = " \
-  ${nonarch_base_libdir}/firmware/mrvl/pcie8997_wlan_v4.bin \
-  ${nonarch_base_libdir}/firmware/mrvl/pcieuart8997_combo_v4.bin \
-  ${nonarch_base_libdir}/firmware/mrvl/pcieusb8997_combo_v4.bin \
+  ${nonarch_base_libdir}/firmware/mrvl/pcie8997_wlan_v4.bin* \
+  ${nonarch_base_libdir}/firmware/mrvl/pcieuart8997_combo_v4.bin* \
+  ${nonarch_base_libdir}/firmware/mrvl/pcieusb8997_combo_v4.bin* \
 "
 FILES:${PN}-sd8686 = " \
   ${nonarch_base_libdir}/firmware/libertas/sd8686_v9* \
@@ -669,31 +681,32 @@ FILES:${PN}-sd8688 = " \
   ${nonarch_base_libdir}/firmware/mrvl/sd8688* \
 "
 FILES:${PN}-sd8787 = " \
-  ${nonarch_base_libdir}/firmware/mrvl/sd8787_uapsta.bin \
+  ${nonarch_base_libdir}/firmware/mrvl/sd8787_uapsta.bin* \
 "
 FILES:${PN}-sd8797 = " \
-  ${nonarch_base_libdir}/firmware/mrvl/sd8797_uapsta.bin \
+  ${nonarch_base_libdir}/firmware/mrvl/sd8797_uapsta.bin* \
 "
 FILES:${PN}-sd8801 = " \
-  ${nonarch_base_libdir}/firmware/mrvl/sd8801_uapsta.bin \
+  ${nonarch_base_libdir}/firmware/mrvl/sd8801_uapsta.bin* \
 "
 FILES:${PN}-sd8887 = " \
-  ${nonarch_base_libdir}/firmware/mrvl/sd8887_uapsta.bin \
+  ${nonarch_base_libdir}/firmware/mrvl/sd8887_uapsta.bin* \
 "
 FILES:${PN}-sd8897 = " \
-  ${nonarch_base_libdir}/firmware/mrvl/sd8897_uapsta.bin \
+  ${nonarch_base_libdir}/firmware/mrvl/sd8897_uapsta.bin* \
 "
 do_install:append() {
     # The kernel 5.6.x driver still uses the old name, provide a symlink for
     # older kernels
-    ln -fs sdsd8997_combo_v4.bin ${D}${nonarch_base_libdir}/firmware/mrvl/sd8997_uapsta.bin
+    COMPR=$(echo ${@fw_compr_suffix(d)} | tr -d '-')
+    ln -fs sdsd8997_combo_v4.bin.$COMPR ${D}${nonarch_base_libdir}/firmware/mrvl/sd8997_uapsta.bin.$COMPR
 }
 FILES:${PN}-sd8997 = " \
-  ${nonarch_base_libdir}/firmware/mrvl/sd8997_uapsta.bin \
-  ${nonarch_base_libdir}/firmware/mrvl/sdsd8997_combo_v4.bin \
+  ${nonarch_base_libdir}/firmware/mrvl/sd8997_uapsta.bin* \
+  ${nonarch_base_libdir}/firmware/mrvl/sdsd8997_combo_v4.bin* \
 "
 FILES:${PN}-usb8997 = " \
-  ${nonarch_base_libdir}/firmware/mrvl/usbusb8997_combo_v4.bin \
+  ${nonarch_base_libdir}/firmware/mrvl/usbusb8997_combo_v4.bin* \
 "
 
 RDEPENDS:${PN}-sd8686 += "${PN}-marvell-license"
@@ -713,13 +726,13 @@ FILES:${PN}-netronome-license = " \
   ${nonarch_base_libdir}/firmware/LICENCE.Netronome \
 "
 FILES:${PN}-netronome = " \
-  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0081*.nffw \
-  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0096*.nffw \
-  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0097*.nffw \
-  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0099*.nffw \
-  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0058-0011_2x40.nffw \
-  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0058-0012_2x40.nffw \
-  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0078-0011_1x100.nffw \
+  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0081*.nffw* \
+  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0096*.nffw* \
+  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0097*.nffw* \
+  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0099*.nffw* \
+  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0058-0011_2x40.nffw* \
+  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0058-0012_2x40.nffw* \
+  ${nonarch_base_libdir}/firmware/netronome/nic_AMDA0078-0011_1x100.nffw* \
   ${nonarch_base_libdir}/firmware/netronome/bpf \
   ${nonarch_base_libdir}/firmware/netronome/flower \
   ${nonarch_base_libdir}/firmware/netronome/nic \
@@ -742,16 +755,16 @@ LICENSE:${PN}-nxp-license = "Firmware-nxp"
 
 FILES:${PN}-nxp8987-sdio = "${nonarch_base_libdir}/firmware/nxp/*8987*"
 FILES:${PN}-nxp8997-common = " \
-    ${nonarch_base_libdir}/firmware/nxp/uartuart8997_bt_v4.bin \
-    ${nonarch_base_libdir}/firmware/nxp/helper_uart_3000000.bin \
+    ${nonarch_base_libdir}/firmware/nxp/uartuart8997_bt_v4.bin* \
+    ${nonarch_base_libdir}/firmware/nxp/helper_uart_3000000.bin* \
 "
 ALLOW_EMPTY:${PN}-nxp8997-pcie = "1"
 ALLOW_EMPTY:${PN}-nxp8997-sdio = "1"
-FILES:${PN}-nxp9098-common = "${nonarch_base_libdir}/firmware/nxp/uartuart9098_bt_v1.bin"
+FILES:${PN}-nxp9098-common = "${nonarch_base_libdir}/firmware/nxp/uartuart9098_bt_v1.bin*"
 ALLOW_EMPTY:${PN}-nxp9098-pcie = "1"
 ALLOW_EMPTY:${PN}-nxp9098-sdio = "1"
 FILES:${PN}-nxpiw416-sdio = "${nonarch_base_libdir}/firmware/nxp/*iw416*"
-FILES:${PN}-nxpiw612-sdio = "${nonarch_base_libdir}/firmware/nxp/uartspi_n61x_v1.bin.se"
+FILES:${PN}-nxpiw612-sdio = "${nonarch_base_libdir}/firmware/nxp/uartspi_n61x_v1.bin.se*"
 FILES:${PN}-nxp-license = "${nonarch_base_libdir}/firmware/LICENSE.nxp"
 
 RDEPENDS:${PN}-nxp8987-sdio += "${PN}-nxp-license"
@@ -801,9 +814,9 @@ LICENSE:${PN}-olpc = "Firmware-OLPC"
 LICENSE:${PN}-olpc-license = "Firmware-OLPC"
 
 FILES:${PN}-olpc = " \
-  ${nonarch_base_libdir}/firmware/libertas/lbtf_sdio.bin	\
-  ${nonarch_base_libdir}/firmware/lbtf_usb.bin			\
-  ${nonarch_base_libdir}/firmware/libertas/usb8388_olpc.bin	\
+  ${nonarch_base_libdir}/firmware/libertas/lbtf_sdio.bin*	\
+  ${nonarch_base_libdir}/firmware/lbtf_usb.bin*			\
+  ${nonarch_base_libdir}/firmware/libertas/usb8388_olpc.bin*	\
 "
 FILES:${PN}-olpc-license = "${nonarch_base_libdir}/firmware/LICENCE.OLPC"
 
@@ -813,7 +826,7 @@ RDEPENDS:${PN}-olpc += "${PN}-olpc-license"
 LICENSE:${PN}-phanfw = "Firmware-phanfw"
 LICENSE:${PN}-phanfw-license = "Firmware-phanfw"
 
-FILES:${PN}-phanfw = "${nonarch_base_libdir}/firmware/phanfw.bin"
+FILES:${PN}-phanfw = "${nonarch_base_libdir}/firmware/phanfw.bin*"
 FILES:${PN}-phanfw-license = "${nonarch_base_libdir}/firmware/LICENCE.phanfw"
 
 RDEPENDS:${PN}-phanfw += "${PN}-phanfw-license"
@@ -840,8 +853,8 @@ RDEPENDS:${PN}-qla2xxx += "${PN}-qla2xxx-license"
 LICENSE:${PN}-rs9113 = "WHENCE"
 LICENSE:${PN}-rs9116 = "WHENCE"
 
-FILES:${PN}-rs9113 = " ${nonarch_base_libdir}/firmware/rsi/rs9113*.rps "
-FILES:${PN}-rs9116 = " ${nonarch_base_libdir}/firmware/rsi/rs9116*.rps "
+FILES:${PN}-rs9113 = " ${nonarch_base_libdir}/firmware/rsi/rs9113*.rps* "
+FILES:${PN}-rs9116 = " ${nonarch_base_libdir}/firmware/rsi/rs9116*.rps* "
 
 RDEPENDS:${PN}-rs9113 += "${PN}-whence-license"
 RDEPENDS:${PN}-rs9116 += "${PN}-whence-license"
@@ -863,37 +876,37 @@ FILES:${PN}-rtl-license = " \
   ${nonarch_base_libdir}/firmware/LICENCE.rtlwifi_firmware.txt \
 "
 FILES:${PN}-rtl8188 = " \
-  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8188*.bin \
+  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8188*.bin* \
 "
 FILES:${PN}-rtl8192cu = " \
-  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8192cufw*.bin \
+  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8192cufw*.bin* \
 "
 FILES:${PN}-rtl8192ce = " \
-  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8192cfw*.bin \
+  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8192cfw*.bin* \
 "
 FILES:${PN}-rtl8192su = " \
-  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8712u.bin \
+  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8712u.bin* \
 "
 FILES:${PN}-rtl8723 = " \
-  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8723*.bin \
+  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8723*.bin* \
 "
 FILES:${PN}-rtl8821 = " \
-  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin \
-  ${nonarch_base_libdir}/firmware/rtw88/rtw8821*.bin \
+  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin* \
+  ${nonarch_base_libdir}/firmware/rtw88/rtw8821*.bin* \
 "
 FILES:${PN}-rtl8761 = " \
-  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8761*.bin \
+  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8761*.bin* \
 "
 FILES:${PN}-rtl8168 = " \
-  ${nonarch_base_libdir}/firmware/rtl_nic/rtl8168*.fw \
+  ${nonarch_base_libdir}/firmware/rtl_nic/rtl8168*.fw* \
 "
 FILES:${PN}-rtl8822 = " \
-  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8822*.bin \
-  ${nonarch_base_libdir}/firmware/rtw88/rtw8822*.bin \
-  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8822*.bin \
+  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8822*.bin* \
+  ${nonarch_base_libdir}/firmware/rtw88/rtw8822*.bin* \
+  ${nonarch_base_libdir}/firmware/rtlwifi/rtl8822*.bin* \
 "
 FILES:${PN}-rtl-nic = " \
-  ${nonarch_base_libdir}/firmware/rtl_nic/*.fw \
+  ${nonarch_base_libdir}/firmware/rtl_nic/*.fw* \
 "
 
 RDEPENDS:${PN}-rtl8188 += "${PN}-rtl-license"
@@ -912,8 +925,8 @@ LICENSE:${PN}-wfx = "Firmware-wfx"
 LICENSE:${PN}-wfx-license = "Firmware-wfx"
 
 FILES:${PN}-wfx = " \
-  ${nonarch_base_libdir}/firmware/wfx/*.pds         \
-  ${nonarch_base_libdir}/firmware/wfx/*.sec         \
+  ${nonarch_base_libdir}/firmware/wfx/*.pds*        \
+  ${nonarch_base_libdir}/firmware/wfx/*.sec*        \
 "
 FILES:${PN}-wfx-license = "${nonarch_base_libdir}/firmware/wfx/LICENCE.wf200"
 
@@ -924,8 +937,8 @@ LICENSE:${PN}-wl1251 = "Firmware-wl1251"
 LICENSE:${PN}-wl1251-license = "Firmware-wl1251"
 
 FILES:${PN}-wl1251 = " \
-  ${nonarch_base_libdir}/firmware/ti-connectivity/wl1251-fw.bin         \
-  ${nonarch_base_libdir}/firmware/ti-connectivity/wl1251-nvs.bin        \
+  ${nonarch_base_libdir}/firmware/ti-connectivity/wl1251-fw.bin*         \
+  ${nonarch_base_libdir}/firmware/ti-connectivity/wl1251-nvs.bin*        \
 "
 FILES:${PN}-wl1251-license = "${nonarch_base_libdir}/firmware/LICENCE.wl1251"
 
@@ -948,8 +961,8 @@ FILES:${PN}-ti-connectivity-license = "${nonarch_base_libdir}/firmware/LICENCE.t
 # symlink, both need to go to wlcommon.
 FILES:${PN}-wlcommon = " \
   ${nonarch_base_libdir}/firmware/ti-connectivity/TI* \
-  ${nonarch_base_libdir}/firmware/ti-connectivity/wl127x-nvs.bin \
-  ${nonarch_base_libdir}/firmware/ti-connectivity/wl1271-nvs.bin \
+  ${nonarch_base_libdir}/firmware/ti-connectivity/wl127x-nvs.bin* \
+  ${nonarch_base_libdir}/firmware/ti-connectivity/wl1271-nvs.bin* \
 "
 FILES:${PN}-wl12xx = " \
   ${nonarch_base_libdir}/firmware/ti-connectivity/wl12* \
@@ -982,7 +995,7 @@ LICENSE:${PN}-vt6656-license = "Firmware-via_vt6656"
 
 FILES:${PN}-vt6656-license = "${nonarch_base_libdir}/firmware/LICENCE.via_vt6656"
 FILES:${PN}-vt6656 = " \
-  ${nonarch_base_libdir}/firmware/vntwusb.fw \
+  ${nonarch_base_libdir}/firmware/vntwusb.fw* \
 "
 
 RDEPENDS:${PN}-vt6656 = "${PN}-vt6656-license"
@@ -991,7 +1004,7 @@ RDEPENDS:${PN}-vt6656 = "${PN}-vt6656-license"
 LICENSE:${PN}-xc4000 = "Firmware-xc4000"
 LICENSE:${PN}-xc4000-license = "Firmware-xc4000"
 
-FILES:${PN}-xc4000 = "${nonarch_base_libdir}/firmware/dvb-fe-xc4000-1.4.1.fw"
+FILES:${PN}-xc4000 = "${nonarch_base_libdir}/firmware/dvb-fe-xc4000-1.4.1.fw*"
 FILES:${PN}-xc4000-license = "${nonarch_base_libdir}/firmware/LICENCE.xc4000"
 
 RDEPENDS:${PN}-xc4000 += "${PN}-xc4000-license"
@@ -1000,7 +1013,7 @@ RDEPENDS:${PN}-xc4000 += "${PN}-xc4000-license"
 LICENSE:${PN}-xc5000 = "Firmware-xc5000"
 LICENSE:${PN}-xc5000-license = "Firmware-xc5000"
 
-FILES:${PN}-xc5000 = "${nonarch_base_libdir}/firmware/dvb-fe-xc5000-1.6.114.fw"
+FILES:${PN}-xc5000 = "${nonarch_base_libdir}/firmware/dvb-fe-xc5000-1.6.114.fw*"
 FILES:${PN}-xc5000-license = "${nonarch_base_libdir}/firmware/LICENCE.xc5000"
 
 RDEPENDS:${PN}-xc5000 += "${PN}-xc5000-license"
@@ -1010,7 +1023,7 @@ LICENSE:${PN}-xc5000c = "Firmware-xc5000c"
 LICENSE:${PN}-xc5000c-license = "Firmware-xc5000c"
 
 FILES:${PN}-xc5000c = " \
-  ${nonarch_base_libdir}/firmware/dvb-fe-xc5000c-4.1.30.7.fw \
+  ${nonarch_base_libdir}/firmware/dvb-fe-xc5000c-4.1.30.7.fw* \
 "
 FILES:${PN}-xc5000c-license = "${nonarch_base_libdir}/firmware/LICENCE.xc5000c"
 
@@ -1025,44 +1038,44 @@ FILES:${PN}-broadcom-license = "${nonarch_base_libdir}/firmware/LICENCE.broadcom
 
 # for i in `grep brcm WHENCE  | grep ^File | sed 's/File: brcm.//g'`; do pkg=`echo $i | sed 's/-[sp40].*//g; s/\.bin//g; s/brcmfmac/bcm/g; s/_hdr/-hdr/g; s/BCM/bcm-0bb4-0306/g'`; echo "$i - $pkg"; echo -e "FILES:\${PN}-$pkg = \"\${nonarch_base_libdir}/firmware/brcm/$i\""; done | grep ^FILES
 
-FILES:${PN}-bcm43xx = "${nonarch_base_libdir}/firmware/brcm/bcm43xx-0.fw"
-FILES:${PN}-bcm43xx-hdr = "${nonarch_base_libdir}/firmware/brcm/bcm43xx_hdr-0.fw"
-FILES:${PN}-bcm4329-fullmac = "${nonarch_base_libdir}/firmware/brcm/bcm4329-fullmac-4.bin"
-FILES:${PN}-bcm43236b = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43236b.bin"
-FILES:${PN}-bcm4329 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4329-sdio.bin"
+FILES:${PN}-bcm43xx = "${nonarch_base_libdir}/firmware/brcm/bcm43xx-0.fw*"
+FILES:${PN}-bcm43xx-hdr = "${nonarch_base_libdir}/firmware/brcm/bcm43xx_hdr-0.fw*"
+FILES:${PN}-bcm4329-fullmac = "${nonarch_base_libdir}/firmware/brcm/bcm4329-fullmac-4.bin*"
+FILES:${PN}-bcm43236b = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43236b.bin*"
+FILES:${PN}-bcm4329 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4329-sdio.bin*"
 FILES:${PN}-bcm4330 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4330-sdio.*"
-FILES:${PN}-bcm4334 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4334-sdio.bin"
-FILES:${PN}-bcm4335 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4335-sdio.bin"
-FILES:${PN}-bcm4339 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio.bin \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac4339-sdio.bin \
-"
-FILES:${PN}-bcm43241b0 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43241b0-sdio.bin"
-FILES:${PN}-bcm43241b4 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43241b4-sdio.bin"
-FILES:${PN}-bcm43241b5 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43241b5-sdio.bin"
-FILES:${PN}-bcm43242a = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43242a.bin"
-FILES:${PN}-bcm43143 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43143.bin \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43143-sdio.bin \
+FILES:${PN}-bcm4334 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4334-sdio.bin*"
+FILES:${PN}-bcm4335 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4335-sdio.bin*"
+FILES:${PN}-bcm4339 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio.bin* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4339-sdio.bin* \
+"
+FILES:${PN}-bcm43241b0 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43241b0-sdio.bin*"
+FILES:${PN}-bcm43241b4 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43241b4-sdio.bin*"
+FILES:${PN}-bcm43241b5 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43241b5-sdio.bin*"
+FILES:${PN}-bcm43242a = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43242a.bin*"
+FILES:${PN}-bcm43143 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43143.bin* \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43143-sdio.bin* \
 "
 FILES:${PN}-bcm43430a0 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43430a0-sdio.*"
 FILES:${PN}-bcm43455 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.* \
   ${nonarch_base_libdir}/firmware/cypress/cyfmac43455-sdio.* \
 "
-FILES:${PN}-bcm4350c2 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350c2-pcie.bin"
-FILES:${PN}-bcm4350 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350-pcie.bin"
+FILES:${PN}-bcm4350c2 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350c2-pcie.bin*"
+FILES:${PN}-bcm4350 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350-pcie.bin*"
 FILES:${PN}-bcm4356 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-sdio.* \
   ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-sdio.* \
 "
-FILES:${PN}-bcm43569 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43569.bin"
-FILES:${PN}-bcm43570 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43570-pcie.bin \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac43570-pcie.bin \
+FILES:${PN}-bcm43569 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43569.bin*"
+FILES:${PN}-bcm43570 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43570-pcie.bin* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac43570-pcie.bin* \
 "
-FILES:${PN}-bcm4358 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4358-pcie.bin"
-FILES:${PN}-bcm43602 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43602-pcie.bin \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43602-pcie.ap.bin \
+FILES:${PN}-bcm4358 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4358-pcie.bin*"
+FILES:${PN}-bcm43602 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43602-pcie.bin* \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43602-pcie.ap.bin* \
 "
-FILES:${PN}-bcm4366b = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4366b-pcie.bin"
-FILES:${PN}-bcm4366c = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4366c-pcie.bin"
-FILES:${PN}-bcm4371 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4371-pcie.bin"
+FILES:${PN}-bcm4366b = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4366b-pcie.bin*"
+FILES:${PN}-bcm4366c = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4366c-pcie.bin*"
+FILES:${PN}-bcm4371 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4371-pcie.bin*"
 
 # for i in `grep brcm WHENCE  | grep ^File | sed 's/File: brcm.//g'`; do pkg=`echo $i | sed 's/-[sp40].*//g; s/\.bin//g; s/brcmfmac/bcm/g; s/_hdr/-hdr/g; s/BCM/bcm-0bb4-0306/g'`; echo -e "LICENSE:\${PN}-$pkg = \"Firmware-broadcom_bcm43xx\"\nRDEPENDS_\${PN}-$pkg += \"\${PN}-broadcom-license\""; done
 # Currently 1st one and last 6 have cypress LICENSE
@@ -1125,7 +1138,7 @@ RDEPENDS:${PN}-bcm4371 += "${PN}-broadcom-license"
 LICENSE:${PN}-cypress-license = "Firmware-cypress"
 FILES:${PN}-cypress-license = "${nonarch_base_libdir}/firmware/LICENCE.cypress"
 
-FILES:${PN}-bcm-0bb4-0306 = "${nonarch_base_libdir}/firmware/brcm/BCM-0bb4-0306.hcd"
+FILES:${PN}-bcm-0bb4-0306 = "${nonarch_base_libdir}/firmware/brcm/BCM-0bb4-0306.hcd*"
 FILES:${PN}-bcm43340 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43340-sdio.* \
   ${nonarch_base_libdir}/firmware/cypress/cyfmac43340-sdio.*"
 FILES:${PN}-bcm43362 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43362-sdio.* \
@@ -1138,11 +1151,11 @@ FILES:${PN}-bcm4354 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4354-sdio.bi
 FILES:${PN}-bcm4356-pcie = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pcie.* \
   ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-pcie.* \
 "
-FILES:${PN}-bcm4373 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.bin \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373.bin \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac4373-sdio.bin \
-  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.clm_blob \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac4373-sdio.clm_blob \
+FILES:${PN}-bcm4373 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.bin* \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373.bin* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4373-sdio.bin* \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.clm_blob* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4373-sdio.clm_blob* \
 "
 
 LICENSE:${PN}-bcm-0bb4-0306 = "Firmware-cypress"
@@ -1169,8 +1182,8 @@ LICENSE:${PN}-bnx2 = "WHENCE"
 LICENSE:${PN}-whence-license = "WHENCE"
 
 FILES:${PN}-bnx2 = " \
-    ${nonarch_base_libdir}/firmware/bnx2/bnx2-mips*.fw \
-    ${nonarch_base_libdir}/firmware/bnx2/bnx2-rv2p*.fw \
+    ${nonarch_base_libdir}/firmware/bnx2/bnx2-mips*.fw* \
+    ${nonarch_base_libdir}/firmware/bnx2/bnx2-rv2p*.fw* \
 "
 FILES:${PN}-whence-license = "${nonarch_base_libdir}/firmware/WHENCE"
 
@@ -1179,7 +1192,7 @@ RPROVIDES:${PN}-bnx2 = "${PN}-bnx2-mips"
 
 LICENSE:${PN}-bnx2x = "WHENCE"
 
-FILES:${PN}-bnx2x = "${nonarch_base_libdir}/firmware/bnx2x/bnx2x*.fw"
+FILES:${PN}-bnx2x = "${nonarch_base_libdir}/firmware/bnx2x/bnx2x*.fw*"
 
 RDEPENDS:${PN}-bnx2x += "${PN}-whence-license"
 
@@ -1196,7 +1209,7 @@ RDEPENDS:${PN}-cirrus += "${PN}-cirrus-license"
 LICENSE:${PN}-cnm = "Firmware-cnm"
 LICENSE:${PN}-cnm-license = "Firmware-cnm"
 
-FILES:${PN}-cnm = "${nonarch_base_libdir}/firmware/cnm/wave521c_k3_codec_fw.bin"
+FILES:${PN}-cnm = "${nonarch_base_libdir}/firmware/cnm/wave521c_k3_codec_fw.bin*"
 FILES:${PN}-cnm-license = "${nonarch_base_libdir}/firmware/LICENCE.cnm"
 
 RDEPENDS:${PN}-cnm += "${PN}-cnm-license"
@@ -1206,13 +1219,13 @@ LICENSE:${PN}-imx-sdma-imx6q       = "Firmware-imx-sdma_firmware"
 LICENSE:${PN}-imx-sdma-imx7d       = "Firmware-imx-sdma_firmware"
 LICENSE:${PN}-imx-sdma-license       = "Firmware-imx-sdma_firmware"
 
-FILES:${PN}-imx-sdma-imx6q = "${nonarch_base_libdir}/firmware/imx/sdma/sdma-imx6q.bin"
+FILES:${PN}-imx-sdma-imx6q = "${nonarch_base_libdir}/firmware/imx/sdma/sdma-imx6q.bin*"
 
 RPROVIDES:${PN}-imx-sdma-imx6q = "firmware-imx-sdma-imx6q"
 RREPLACES:${PN}-imx-sdma-imx6q = "firmware-imx-sdma-imx6q"
 RCONFLICTS:${PN}-imx-sdma-imx6q = "firmware-imx-sdma-imx6q"
 
-FILES:${PN}-imx-sdma-imx7d = "${nonarch_base_libdir}/firmware/imx/sdma/sdma-imx7d.bin"
+FILES:${PN}-imx-sdma-imx7d = "${nonarch_base_libdir}/firmware/imx/sdma/sdma-imx7d.bin*"
 
 FILES:${PN}-imx-sdma-license = "${nonarch_base_libdir}/firmware/LICENSE.sdma_firmware"
 
@@ -1249,32 +1262,32 @@ LICENSE:${PN}-iwlwifi-license   = "Firmware-iwlwifi_firmware"
 
 
 FILES:${PN}-iwlwifi-license = "${nonarch_base_libdir}/firmware/LICENCE.iwlwifi_firmware"
-FILES:${PN}-iwlwifi-135-6 = "${nonarch_base_libdir}/firmware/iwlwifi-135-6.ucode"
-FILES:${PN}-iwlwifi-3160-7 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-7.ucode"
-FILES:${PN}-iwlwifi-3160-8 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-8.ucode"
-FILES:${PN}-iwlwifi-3160-9 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-9.ucode"
-FILES:${PN}-iwlwifi-3160-10 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-10.ucode"
-FILES:${PN}-iwlwifi-3160-12 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-12.ucode"
-FILES:${PN}-iwlwifi-3160-13 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-13.ucode"
-FILES:${PN}-iwlwifi-3160-16 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-16.ucode"
-FILES:${PN}-iwlwifi-3160-17 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-17.ucode"
-FILES:${PN}-iwlwifi-6000-4 = "${nonarch_base_libdir}/firmware/iwlwifi-6000-4.ucode"
-FILES:${PN}-iwlwifi-6000g2a-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2a-5.ucode"
-FILES:${PN}-iwlwifi-6000g2a-6 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2a-6.ucode"
-FILES:${PN}-iwlwifi-6000g2b-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2b-5.ucode"
-FILES:${PN}-iwlwifi-6000g2b-6 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2b-6.ucode"
-FILES:${PN}-iwlwifi-6050-4 = "${nonarch_base_libdir}/firmware/iwlwifi-6050-4.ucode"
-FILES:${PN}-iwlwifi-6050-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6050-5.ucode"
-FILES:${PN}-iwlwifi-7260   = "${nonarch_base_libdir}/firmware/iwlwifi-7260-*.ucode"
-FILES:${PN}-iwlwifi-7265   = "${nonarch_base_libdir}/firmware/iwlwifi-7265-*.ucode"
-FILES:${PN}-iwlwifi-7265d   = "${nonarch_base_libdir}/firmware/iwlwifi-7265D-*.ucode"
-FILES:${PN}-iwlwifi-8000c   = "${nonarch_base_libdir}/firmware/iwlwifi-8000C-*.ucode"
-FILES:${PN}-iwlwifi-8265   = "${nonarch_base_libdir}/firmware/iwlwifi-8265-*.ucode"
-FILES:${PN}-iwlwifi-9000   = "${nonarch_base_libdir}/firmware/iwlwifi-9000-*.ucode"
-FILES:${PN}-iwlwifi-9260   = "${nonarch_base_libdir}/firmware/iwlwifi-9260-*.ucode"
+FILES:${PN}-iwlwifi-135-6 = "${nonarch_base_libdir}/firmware/iwlwifi-135-6.ucode*"
+FILES:${PN}-iwlwifi-3160-7 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-7.ucode*"
+FILES:${PN}-iwlwifi-3160-8 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-8.ucode*"
+FILES:${PN}-iwlwifi-3160-9 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-9.ucode*"
+FILES:${PN}-iwlwifi-3160-10 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-10.ucode*"
+FILES:${PN}-iwlwifi-3160-12 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-12.ucode*"
+FILES:${PN}-iwlwifi-3160-13 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-13.ucode*"
+FILES:${PN}-iwlwifi-3160-16 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-16.ucode*"
+FILES:${PN}-iwlwifi-3160-17 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-17.ucode*"
+FILES:${PN}-iwlwifi-6000-4 = "${nonarch_base_libdir}/firmware/iwlwifi-6000-4.ucode*"
+FILES:${PN}-iwlwifi-6000g2a-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2a-5.ucode*"
+FILES:${PN}-iwlwifi-6000g2a-6 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2a-6.ucode*"
+FILES:${PN}-iwlwifi-6000g2b-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2b-5.ucode*"
+FILES:${PN}-iwlwifi-6000g2b-6 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2b-6.ucode*"
+FILES:${PN}-iwlwifi-6050-4 = "${nonarch_base_libdir}/firmware/iwlwifi-6050-4.ucode*"
+FILES:${PN}-iwlwifi-6050-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6050-5.ucode*"
+FILES:${PN}-iwlwifi-7260   = "${nonarch_base_libdir}/firmware/iwlwifi-7260-*.ucode*"
+FILES:${PN}-iwlwifi-7265   = "${nonarch_base_libdir}/firmware/iwlwifi-7265-*.ucode*"
+FILES:${PN}-iwlwifi-7265d   = "${nonarch_base_libdir}/firmware/iwlwifi-7265D-*.ucode*"
+FILES:${PN}-iwlwifi-8000c   = "${nonarch_base_libdir}/firmware/iwlwifi-8000C-*.ucode*"
+FILES:${PN}-iwlwifi-8265   = "${nonarch_base_libdir}/firmware/iwlwifi-8265-*.ucode*"
+FILES:${PN}-iwlwifi-9000   = "${nonarch_base_libdir}/firmware/iwlwifi-9000-*.ucode*"
+FILES:${PN}-iwlwifi-9260   = "${nonarch_base_libdir}/firmware/iwlwifi-9260-*.ucode*"
 FILES:${PN}-iwlwifi-misc   = " \
-    ${nonarch_base_libdir}/firmware/iwlwifi-*.ucode \
-    ${nonarch_base_libdir}/firmware/iwlwifi-*.pnvm \
+    ${nonarch_base_libdir}/firmware/iwlwifi-*.ucode* \
+    ${nonarch_base_libdir}/firmware/iwlwifi-*.pnvm* \
 "
 
 RDEPENDS:${PN}-iwlwifi-135-6     = "${PN}-iwlwifi-license"
@@ -1331,13 +1344,13 @@ LICENSE:${PN}-ibt-20 = "Firmware-ibt_firmware"
 LICENSE:${PN}-ibt-misc    = "Firmware-ibt_firmware"
 
 FILES:${PN}-ibt-license = "${nonarch_base_libdir}/firmware/LICENCE.ibt_firmware"
-FILES:${PN}-ibt-hw-37-7 = "${nonarch_base_libdir}/firmware/intel/ibt-hw-37.7*.bseq"
-FILES:${PN}-ibt-hw-37-8 = "${nonarch_base_libdir}/firmware/intel/ibt-hw-37.8*.bseq"
-FILES:${PN}-ibt-11-5    = "${nonarch_base_libdir}/firmware/intel/ibt-11-5.sfi ${nonarch_base_libdir}/firmware/intel/ibt-11-5.ddc"
-FILES:${PN}-ibt-12-16   = "${nonarch_base_libdir}/firmware/intel/ibt-12-16.sfi ${nonarch_base_libdir}/firmware/intel/ibt-12-16.ddc"
-FILES:${PN}-ibt-17 = "${nonarch_base_libdir}/firmware/intel/ibt-17-*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-17-*.ddc"
-FILES:${PN}-ibt-18      = "${nonarch_base_libdir}/firmware/intel/ibt-18-*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-18-*.ddc"
-FILES:${PN}-ibt-20 = "${nonarch_base_libdir}/firmware/intel/ibt-20-*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-20-*.ddc"
+FILES:${PN}-ibt-hw-37-7 = "${nonarch_base_libdir}/firmware/intel/ibt-hw-37.7*.bseq*"
+FILES:${PN}-ibt-hw-37-8 = "${nonarch_base_libdir}/firmware/intel/ibt-hw-37.8*.bseq*"
+FILES:${PN}-ibt-11-5    = "${nonarch_base_libdir}/firmware/intel/ibt-11-5.sfi* ${nonarch_base_libdir}/firmware/intel/ibt-11-5.ddc*"
+FILES:${PN}-ibt-12-16   = "${nonarch_base_libdir}/firmware/intel/ibt-12-16.sfi* ${nonarch_base_libdir}/firmware/intel/ibt-12-16.ddc*"
+FILES:${PN}-ibt-17 = "${nonarch_base_libdir}/firmware/intel/ibt-17-*.sfi* ${nonarch_base_libdir}/firmware/intel/ibt-17-*.ddc*"
+FILES:${PN}-ibt-18      = "${nonarch_base_libdir}/firmware/intel/ibt-18-*.sfi* ${nonarch_base_libdir}/firmware/intel/ibt-18-*.ddc*"
+FILES:${PN}-ibt-20 = "${nonarch_base_libdir}/firmware/intel/ibt-20-*.sfi* ${nonarch_base_libdir}/firmware/intel/ibt-20-*.ddc*"
 FILES:${PN}-ibt-misc    = "${nonarch_base_libdir}/firmware/intel/ibt-*"
 
 RDEPENDS:${PN}-ibt-hw-37-7 = "${PN}-ibt-license"
@@ -1390,7 +1403,7 @@ RDEPENDS:${PN}-adsp-sst           = "${PN}-adsp-sst-license"
 LICENSE:${PN}-qat         = "Firmware-qat"
 LICENSE:${PN}-qat-license = "Firmware-qat"
 FILES:${PN}-qat-license   = "${nonarch_base_libdir}/firmware/LICENCE.qat_firmware"
-FILES:${PN}-qat           = "${nonarch_base_libdir}/firmware/qat*.bin"
+FILES:${PN}-qat           = "${nonarch_base_libdir}/firmware/qat*.bin*"
 RDEPENDS:${PN}-qat        = "${PN}-qat-license"
 
 LICENSE:${PN}-qed         = "WHENCE"
@@ -1460,47 +1473,47 @@ FILES:${PN}-qcom-vpu = " \
     ${nonarch_base_libdir}/firmware/qcom/vpu-1.0/* \
     ${nonarch_base_libdir}/firmware/qcom/vpu-2.0/* \
 "
-FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw ${nonarch_base_libdir}/firmware/qcom/yamato_*.fw"
-FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
-FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw"
+FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw* ${nonarch_base_libdir}/firmware/qcom/yamato_*.fw*"
+FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw* ${nonarch_base_libdir}/firmware/a300_*.fw*"
+FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw*"
 FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
 FILES:${PN}-qcom-adreno-a702 = "${nonarch_base_libdir}/firmware/qcom/a702*.*"
 FILES:${PN}-qcom-adreno-g750 = "${nonarch_base_libdir}/firmware/qcom/gen70500_*.*"
-FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn"
-FILES:${PN}-qcom-apq8016-wifi = "${nonarch_base_libdir}/firmware/qcom/apq8016/wcnss.mbn ${nonarch_base_libdir}/firmware/qcom/apq8016/WCNSS*"
-FILES:${PN}-qcom-apq8096-adreno = "${nonarch_base_libdir}/firmware/qcom/apq8096/a530_zap.mbn ${nonarch_base_libdir}/firmware/qcom/a530_zap.mdt"
+FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn*"
+FILES:${PN}-qcom-apq8016-wifi = "${nonarch_base_libdir}/firmware/qcom/apq8016/wcnss.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/WCNSS*"
+FILES:${PN}-qcom-apq8096-adreno = "${nonarch_base_libdir}/firmware/qcom/apq8096/a530_zap.mbn* ${nonarch_base_libdir}/firmware/qcom/a530_zap.mdt*"
 FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
-FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
-FILES:${PN}-qcom-qcm2290-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm2290/a702_zap.mbn"
+FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn*"
+FILES:${PN}-qcom-qcm2290-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm2290/a702_zap.mbn*"
 FILES:${PN}-qcom-qcm2290-audio = "${nonarch_base_libdir}/firmware/qcom/qcm2290/adsp*.*"
 FILES:${PN}-qcom-qcm2290-modem = "${nonarch_base_libdir}/firmware/qcom/qcm2290/modem*.*"
-FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wlanmdsp.mbn ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qcm2290/*"
-FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn"
+FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qcm2290/*"
+FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
 FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210/cdsp*.*"
 FILES:${PN}-qcom-qrb4210-modem = "${nonarch_base_libdir}/firmware/qcom/qrb4210/modem*.*"
-FILES:${PN}-qcom-qrb4210-wifi = "${nonarch_base_libdir}/firmware/qcom/qrb4210/wlanmdsp.mbn ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qrb4210/*"
+FILES:${PN}-qcom-qrb4210-wifi = "${nonarch_base_libdir}/firmware/qcom/qrb4210/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qrb4210/*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compat = "${nonarch_base_libdir}/firmware/qcom/LENOVO/21BX"
-FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin ${nonarch_base_libdir}/firmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin"
-FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin* ${nonarch_base_libdir}/firmware/qcom/sc8280xp/SC8280XP-LENOVO-X13S-tplg.bin*"
+FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*cdsp*.*"
 FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*slpi*.*"
 FILES:${PN}-qcom-sdm845-adreno = "${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
 FILES:${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
 FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
-FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/notice.txt_wlanmdsp \
-                                 ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/wlanmdsp.mbn ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp"
+FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/qcom/sdm845/notice.txt_wlanmdsp* \
+                                 ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp"
 FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${nonarch_base_libdir}/firmware/qcom/sdm845/Thundercomm/db845c/slpi*.*"
 FILES:${PN}-qcom-sm8250-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
 FILES:${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/cdsp*.*"
 FILES:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${nonarch_base_libdir}/firmware/qcom/sm8250/Thundercomm/RB5/slpi*.*"
-FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8550/*tplg.bin"
-FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin"
-FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn"
+FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8550/*tplg.bin*"
+FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin*"
+FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
 
 RDEPENDS:${PN}-qcom-venus-1.8 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
@@ -1568,7 +1581,7 @@ RDEPENDS:${PN}-prestera = "${PN}-marvell-license"
 # For Rockchip
 LICENSE:${PN}-rockchip-dptx = "Firmware-rockchip"
 FILES:${PN}-rockchip-license = "${nonarch_base_libdir}/firmware/LICENCE.rockchip"
-FILES:${PN}-rockchip-dptx = "${nonarch_base_libdir}/firmware/rockchip/dptx.bin"
+FILES:${PN}-rockchip-dptx = "${nonarch_base_libdir}/firmware/rockchip/dptx.bin*"
 RDEPENDS:${PN}-rockchip-dptx = "${PN}-rockchip-license"
 
 # For Amlogic VDEC
-- 
2.47.0


