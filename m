Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web12.13167.1623163469421428810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 07:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=V4MPodBp;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.181, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f181.google.com with SMTP id c13so16188537oib.13
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 07:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5RsZuNm8CpOttkwPMXukF2QvRCkE3WKWMzWGRjJforI=;
        b=V4MPodBphSp0Ljqme2HExNkEUZbQDghDS+fg7iqBRD/DGSzmDnyRL4Mw5LBt1zh99P
         uSyLOP1/J77Ftqn2Mjd5MnQlP3jXjI0z073R3OQBagdud0UO22KUG8SWOgZW7KElV95u
         DARYLLe4FC17MSw/luSp/yOUjLAuN00viXPWCjxkz7hBVDK0PsJ3aCFd0lFevx+eMaPT
         2DNt4btUjiagAVuzY9fYP4QL+/McWwHwcUBM/jAmvNvyqCItzw2rwreHYH+0pYcyP6ut
         1R0G7hNUaQj3tn3s1K+0ly3MYPaYIWma/JXKMlYnK/8xgS/4u3O3jJEOU+74OV3QkqPL
         B+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5RsZuNm8CpOttkwPMXukF2QvRCkE3WKWMzWGRjJforI=;
        b=JuVNLsO9pDzSA5EwXI9cV+Rm6jRJLQYxvv9W3AECJQ16MMLmfyneDdxoDIHgU8n2Nw
         zwUXG12qQNeNFglzOwYQJI6BFF2/SHIJr0eZiH55CVSQ1fymL2mPl20a4xf0lmb19hU3
         +JNeEGuLLriIL3UP2sfVjQ479LNGvpjx0+sjBidihk2MzVjOnvwisJKmquemamIcCMFN
         z6OhIeLnEd1oYms3K6o6p6UWfapnFL4EgBbgC0ogcnkkK7ePp8WovS+k0VKKDbkQmqH1
         GdLvm/y6T9TSNitsjpTFywmVq6ah3pRVWgz/mBZ/hiQgbdns0pBoJi4V/ZbhMumz828N
         qhgg==
X-Gm-Message-State: AOAM5318SyKPJ/35xeKBoA+Wh81EkrDsUuD2nU52IByDTJHl83AEZnCq
	D3uNRguqXt45QjhVuOT26FE7Vy5eDs3i3tKMEwM=
X-Google-Smtp-Source: ABdhPJxVvGdnSQtvCQZEyk4dU7iFK0oO5NbT1qlXd7efXMDYBTiE9D0dPyQ/d73U5k08vK+JPdqrpw==
X-Received: by 2002:aca:d444:: with SMTP id l65mr3013135oig.50.1623163468229;
        Tue, 08 Jun 2021 07:44:28 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id l10sm631979otj.17.2021.06.08.07.44.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 07:44:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/6] kernel-fitimage: Don't use unit addresses on FIT
Date: Tue,  8 Jun 2021 04:42:34 -1000
Message-Id: <14eec2f7c3bbb36de8198989bf772135aa117963.1623163071.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623163071.git.steve@sakoman.com>
References: <cover.1623163071.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

Das U-Boot 2021.4-rc1 has the following commit:

    commit 3f04db891a353f4b127ed57279279f851c6b4917
    Author: Simon Glass <sjg@chromium.org>
    Date:   Mon Feb 15 17:08:12 2021 -0700

        image: Check for unit addresses in FITs

        Using unit addresses in a FIT is a security risk. Add a check for
        this and disallow it.

        CVE-2021-27138

Adjust the kernel-fitimage.bbclass accordingly to not use unit
addresses. This changte is required before we can bump U-Boot to 2021.4.

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Backport for Dunfell]
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-fitimage.bbclass | 32 ++++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index b4d8ff8309..5f5e9dd444 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -124,7 +124,7 @@ fitimage_emit_section_kernel() {
 	fi
 
 	cat << EOF >> ${1}
-                kernel@${2} {
+                kernel-${2} {
                         description = "Linux kernel";
                         data = /incbin/("${3}");
                         type = "kernel";
@@ -133,7 +133,7 @@ fitimage_emit_section_kernel() {
                         compression = "${4}";
                         load = <${UBOOT_LOADADDRESS}>;
                         entry = <${ENTRYPOINT}>;
-                        hash@1 {
+                        hash-1 {
                                 algo = "${kernel_csum}";
                         };
                 };
@@ -160,14 +160,14 @@ fitimage_emit_section_dtb() {
 		dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
 	fi
 	cat << EOF >> ${1}
-                fdt@${2} {
+                fdt-${2} {
                         description = "Flattened Device Tree blob";
                         data = /incbin/("${3}");
                         type = "flat_dt";
                         arch = "${UBOOT_ARCH}";
                         compression = "none";
                         ${dtb_loadline}
-                        hash@1 {
+                        hash-1 {
                                 algo = "${dtb_csum}";
                         };
                 };
@@ -185,7 +185,7 @@ fitimage_emit_section_setup() {
 	setup_csum="${FIT_HASH_ALG}"
 
 	cat << EOF >> ${1}
-                setup@${2} {
+                setup-${2} {
                         description = "Linux setup.bin";
                         data = /incbin/("${3}");
                         type = "x86_setup";
@@ -194,7 +194,7 @@ fitimage_emit_section_setup() {
                         compression = "none";
                         load = <0x00090000>;
                         entry = <0x00090000>;
-                        hash@1 {
+                        hash-1 {
                                 algo = "${setup_csum}";
                         };
                 };
@@ -221,7 +221,7 @@ fitimage_emit_section_ramdisk() {
 	fi
 
 	cat << EOF >> ${1}
-                ramdisk@${2} {
+                ramdisk-${2} {
                         description = "${INITRAMFS_IMAGE}";
                         data = /incbin/("${3}");
                         type = "ramdisk";
@@ -230,7 +230,7 @@ fitimage_emit_section_ramdisk() {
                         compression = "none";
                         ${ramdisk_loadline}
                         ${ramdisk_entryline}
-                        hash@1 {
+                        hash-1 {
                                 algo = "${ramdisk_csum}";
                         };
                 };
@@ -266,39 +266,39 @@ fitimage_emit_section_config() {
 	if [ -n "${2}" ]; then
 		conf_desc="Linux kernel"
 		sep=", "
-		kernel_line="kernel = \"kernel@${2}\";"
+		kernel_line="kernel = \"kernel-${2}\";"
 	fi
 
 	if [ -n "${3}" ]; then
 		conf_desc="${conf_desc}${sep}FDT blob"
 		sep=", "
-		fdt_line="fdt = \"fdt@${3}\";"
+		fdt_line="fdt = \"fdt-${3}\";"
 	fi
 
 	if [ -n "${4}" ]; then
 		conf_desc="${conf_desc}${sep}ramdisk"
 		sep=", "
-		ramdisk_line="ramdisk = \"ramdisk@${4}\";"
+		ramdisk_line="ramdisk = \"ramdisk-${4}\";"
 	fi
 
 	if [ -n "${5}" ]; then
 		conf_desc="${conf_desc}${sep}setup"
-		setup_line="setup = \"setup@${5}\";"
+		setup_line="setup = \"setup-${5}\";"
 	fi
 
 	if [ "${6}" = "1" ]; then
-		default_line="default = \"conf@${3}\";"
+		default_line="default = \"conf-${3}\";"
 	fi
 
 	cat << EOF >> ${1}
                 ${default_line}
-                conf@${3} {
+                conf-${3} {
 			description = "${6} ${conf_desc}";
 			${kernel_line}
 			${fdt_line}
 			${ramdisk_line}
 			${setup_line}
-                        hash@1 {
+                        hash-1 {
                                 algo = "${conf_csum}";
                         };
 EOF
@@ -330,7 +330,7 @@ EOF
 		sign_line="${sign_line};"
 
 		cat << EOF >> ${1}
-                        signature@1 {
+                        signature-1 {
                                 algo = "${conf_csum},${conf_sign_algo}";
                                 key-name-hint = "${conf_sign_keyname}";
 				${sign_line}
-- 
2.25.1

