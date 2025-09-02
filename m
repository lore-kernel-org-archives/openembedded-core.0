Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF93CA1002
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 02:15:54 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.68038.1756779345499096784
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 19:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=CPrYF2MW;
 spf=pass (domain: underview.tech, ip: 209.85.219.53, mailfrom: vince@underview.tech)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-70ddadde2e9so39463636d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 19:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1756779344; x=1757384144; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7A1yGClRNMhO1/MjwevIYMVgUacLM684WUtGKTh7iQ=;
        b=CPrYF2MWr0PsYXGt/4EdNT7rdSghRi/XnmbGxQlJp5akVdWPEX78fE2JQufjd9ZhFM
         TnDzjk0eKAK+rAO7TZvZJCCU8EvwtPsurjalXKLv5Q+Vla+YmHu5ySjbsXfkw0YXdnii
         hxq8dYY8Qm0qbGxsSGG80dtJGsu/AREmLCLsBrwkdktiFZFC1j9sgcq1wxYwFRe+O8Q4
         y5Kaf9zpoqA+4Jb514uUX99HTdni8M4ubhqAcx5VgzeLibi7PCDSBxW3XJ8y9+2Y0OWO
         VEjv/zqNyt+qN64jrdiV9limJkhLUgK/1FXB5DHla9YAdwp7Bq225FPW+z10K7yLsuav
         QKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756779344; x=1757384144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7A1yGClRNMhO1/MjwevIYMVgUacLM684WUtGKTh7iQ=;
        b=n7UZDJbo5Bw7exz/Eue864O4oP3KWTbJ/gl5NwmkgiO6Gl+1NU9S/0Ja6nJYyekKIB
         EgGHjMN6qQWjGeUa7jmFBcmZaCrId48K6y4EjhqDoOwtpKhFh1PtlBcjvtmKs4C1P/dD
         E2cMWJUt5uZjEpfkme7TewlOsn8FewHJL5pWLDX2RZCpCczjE/HqK1ljSNeo335RFO+a
         jujF5MVMy75ZgBPQ7Y45KekGbo67cL1tzbjnLJVOVg80W4yksgLUC42GZaeIkgBNcEqV
         fObsQ3jaOZHxlnHDcKdXkEFy5b22w5vL0pDksLm3hhKqVRpgURul0FKPXqCuYrub/ptp
         C/pQ==
X-Gm-Message-State: AOJu0YwRovRzSdF5Ft1pBN+nm6wnUY0Q23aSLr/tZ2J35deOk94eCkbQ
	0KSt36oHUf2kTtwEaCBM1iQNnSzFZhBLgYh+agkRdi2KyJ8M584CE8SUdJs2Apyko06MSTJsVQ8
	FqSVuzCM=
X-Gm-Gg: ASbGncu3XA96MrTDk0AEqGlOCoRUdi+W9F8l0okU6QP4xvn/RtjCG/cs06JFVqnNv/e
	r7Bu0Y+lV0g8dzo/+rmLdA/VvCpxr9g0W5s+RNe+7eL6oFvSzqsukyq77ZSmgOKQnpO0vJH2Hal
	oe5rC4e1y5QPlvsX69G0hcDNtI8mCaqylo+eqs5S/W1cff8j3D/FuDw3nvKE4BKr5FO7AaencjQ
	96bJQhFfL/UYT9yu0ZwHNtmISnTR0CWEQLSR8m168qDg8afHl/VhfltVXI1gKx1FDKW5qPW6vwD
	/ahIAEj3GE6Y/oI9DAAv7bPmvA0xoB91eTOCI8p3QgeGRBWAJYeL+AskLdpfJAQQhpBl9fEvBCc
	e/zb34QAWPF/x56TDTR8+ewpj7byeraw8ra4qu2yHTo8vCjYhPkeLBIh1
X-Google-Smtp-Source: AGHT+IGFRR7DoQdGSN91PE5jtDX174u6J3ou6oFPX+CncdwlTeQ27ZRMXbDz6CAb5zJ7yLUChHpvVw==
X-Received: by 2002:ad4:5ae3:0:b0:720:4a66:d3df with SMTP id 6a1803df08f44-7204a66e19amr16644256d6.16.1756779344043;
        Mon, 01 Sep 2025 19:15:44 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.. ([2601:406:4d01:1820:90ff:fb15:d573:4b27])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b55cf6c9sm4194436d6.49.2025.09.01.19.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:15:43 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [OE-core][PATCH v2 5/7] grub-efi: support custom embedded grub configs
Date: Mon,  1 Sep 2025 22:15:21 -0400
Message-Id: <20250902021523.25780-5-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902021523.25780-1-vince@underview.tech>
References: <20250902021523.25780-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 02:15:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222696

Commit:

Adds support for including custom
embedded grub configs. The default one
provided in OE-core is limited to everything
being in the /EFI/BOOT directory.

Adds an embedded grub config that sets
root and prefix based upon the /boot/grub
directory.

Adds probe to the list of default builtin
grub modules. Probe is required by the
bootimg_pcbios wic plugin generated
grub config.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-bsp/grub/files/cfg-boot-grub | 3 +++
 meta/recipes-bsp/grub/grub-efi_2.12.bb    | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/cfg-boot-grub

diff --git a/meta/recipes-bsp/grub/files/cfg-boot-grub b/meta/recipes-bsp/grub/files/cfg-boot-grub
new file mode 100644
index 0000000000..ab370479af
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/cfg-boot-grub
@@ -0,0 +1,3 @@
+search.file /boot/grub/grub.cfg root
+set prefix=($root)
+configfile ($root)/boot/grub/grub.cfg
diff --git a/meta/recipes-bsp/grub/grub-efi_2.12.bb b/meta/recipes-bsp/grub/grub-efi_2.12.bb
index 6354b43989..91748c8d04 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.12.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.12.bb
@@ -9,6 +9,7 @@ RDEPENDS:${PN} = "grub-common virtual-grub-bootconf"
 
 SRC_URI += " \
            file://cfg \
+           file://cfg-boot-grub \
           "
 
 S = "${UNPACKDIR}/grub-${PV}"
@@ -48,6 +49,7 @@ EXTRA_OECONF += "--enable-efiemu=no"
 
 # Define GRUB_MKIMAGE_OPTS variable for additional grub-mkimage options (e.g., disabling shim lock)
 GRUB_MKIMAGE_OPTS ?= ""
+EMBEDDED_GRUB_CONFIG ?= "${UNPACKDIR}/cfg"
 
 do_mkimage() {
 	cd ${B}
@@ -63,7 +65,7 @@ do_mkimage() {
 
 	# Search for the grub.cfg on the local boot media by using the
 	# built in cfg file provided via this recipe
-	grub-mkimage -v -c ${UNPACKDIR}/cfg -p ${EFIDIR} -d ./grub-core/ \
+	grub-mkimage -v -c ${EMBEDDED_GRUB_CONFIG} -p ${EFIDIR} -d ./grub-core/ \
 	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} \
 	               ${GRUB_MKIMAGE_OPTS} ${GRUB_MKIMAGE_MODULES}
 }
@@ -87,7 +89,7 @@ do_install() {
 
 # To include all available modules, add 'all' to GRUB_BUILDIN
 GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal \
-                 efi_gop iso9660 configfile search loadenv test"
+                 efi_gop iso9660 configfile search probe loadenv test"
 
 # 'xen_boot' is a module valid only for aarch64
 GRUB_BUILDIN:append:aarch64 = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' xen_boot', '', d)}"
-- 
2.34.1


