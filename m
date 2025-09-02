Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F647CA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 01:58:44 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.67786.1756778322480658214
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 18:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=MedDlQ0X;
 spf=pass (domain: underview.tech, ip: 209.85.219.51, mailfrom: vince@underview.tech)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-70de9ffcfffso47136016d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 18:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1756778321; x=1757383121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjfMfBdxyLebbwDgPMPC5T4UWLf7dF4GlEqze820sYU=;
        b=MedDlQ0XWUBnoTDyrkmCdHrqvxYpIZD25PwQkGRT60rI3zcud2YpR5+bfmqMOntf0N
         qva4oYB7uwESkwQ5+fk9yQRvqF+GvwLP/CX50Qfk2HX1QjqUg6UG+Dgy2UojSH0MT903
         N3lBcIH22KMW4Vx0kudpiuoy5ZLkT61cjc0cUmG/n/ys2bxHxxeGeqQ9S1AyJpGJeMRs
         uWFMLVaj+L14pQdaie71qOMNOfZIxeTtEVJlQh1425YAAHEIqIUkWIyBKtfTlS7mcNZt
         7upac4MRSNr7Ne8BPPwOwVIyllUFsyo8VcmGnBuLol/VBRtCXRUOA/5JbIZRh6l2xEyO
         IK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756778321; x=1757383121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjfMfBdxyLebbwDgPMPC5T4UWLf7dF4GlEqze820sYU=;
        b=rGMQPEsO5tJp4zs1j/RUNHGNe2doPdbotf2U2V+9wfoH/DHnElTuyS82Dt07zj62w2
         BToDCcGl/zEgSN+lY+XLH0TZLB7Pc/65hdN+JGJmcl/oHGMYOJFIrGmyUlGccCwALbdp
         R2Psjnhzp5xbKMQ1M2MwYYIU59fXEtSldkkq4vUd/xC+tO98NV/CkgOOQNfef5w+G40k
         IXoBSRrGgYURy58QbWInSsHGd7eDEf3QtTbe+mCBgZQCW1ezFbYspmh88otVyH8rwt7M
         VXpx5tUBHeiIbAVDOK4WP7B1rny7AiadAfnp7kGyejE/KkuqlkEdXPi9zu/2m3abDGUR
         g9dg==
X-Gm-Message-State: AOJu0YxRLbOOsP6irFiPQ4h/ScxeXpX54iBOHeQJ+/40UK3BuSvbZiU/
	WmJkF67ADz7i1Y5aVw7xQzCeU3tG7HmVHCILVrG17vNCy6s67xdA2rS4XRAAsFfQ4Zp4NN3BCP5
	/F9XbmaE=
X-Gm-Gg: ASbGncvRR9sBocruB7HaHu2tVp+xQLxjHF6+tlFaHf1QIFaIlmKwIied2q+HKRujRlF
	jKgjFs3Yw1rJaruhju54nsr02zVKVnqijrvisL1LI0J6mncrXqXjAvqyVS/+1lGbx0C8iQ4Lywz
	jX4WT6kDFiY3eizWjUivdZK0nU4rUsuY175TOli9Cyi+3/ueklTqEvlUP2+FqMbtkM+Q0caf1wT
	UDtH7sTUNurikMjanH3SdjnHJRvPkUfOkVu6x5ADYbznjtpAlV238S3p1d1JPcM0HLibEEPYHyP
	7YdjhH5f3OnNWIuxKXVdTxt5eSb5RctEYYhfwBoFK5WX/pcQYQ7dpje0jnVVGKhmd+Z2Zy6iO0u
	qtTIIOC/5FQ2HMynuoMe2Tg==
X-Google-Smtp-Source: AGHT+IGk8hBU8gTHaJ9eNP93bt+kp9t2Ui4ojCqN46rCD/nOOvw3XNbdTOU+5esxIEGBqWATFYQgZA==
X-Received: by 2002:ad4:5ce2:0:b0:71a:5b14:3cbe with SMTP id 6a1803df08f44-71a5b143fe4mr51142836d6.27.1756778321147;
        Mon, 01 Sep 2025 18:58:41 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::7efe])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720a30b79aesm4284666d6.0.2025.09.01.18.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 18:58:40 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 5/7] grub-efi: support custom embedded grub configs
Date: Mon,  1 Sep 2025 21:58:23 -0400
Message-ID: <20250902015825.2785789-5-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250902015825.2785789-1-vince@underview.tech>
References: <20250902015825.2785789-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 01:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222687

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
2.43.0


