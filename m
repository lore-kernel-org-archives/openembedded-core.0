Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B881C6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 12:47:30 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y144so4880036wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 05:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SxVwC3M012kA4xZ8yYtvXm6pmrQpxvAtKU4P454hCpY=;
	b=MUJl3zH9HsP9bytMfIlGGUGXH8Zhmx81QutGx5MN1ALIt9DtK/LjpEivbe880jZo7Q
	osJZrwxFXgJBOVPOI59+F0reR6iEwTvR1K+YqG/WC8hE2iNohc+/HOJxmYECD5/abW3F
	g6bnp72+LTTuzUrRfe1uDD5Vu9X80vnwvMl9g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SxVwC3M012kA4xZ8yYtvXm6pmrQpxvAtKU4P454hCpY=;
	b=h6a28eiouFeX9nhCvT7ZMLYbPga4Z3SGXZbvoB0kh5uWe2SfH9UtvuYrjWnxUfdLHD
	ur9xLnjvEgFxOzpTBpDwpgA9pseqO7r2UH0ONzJrx+FQdtcR/XeB2Y/H26SdNktAxTxy
	51zWgzesTSeJ3PtOyHCbYF6Ju8wDDj+pi/P3/yaX27oBHC+MIfpjUqeKTDhLO7kHRwLv
	xYBWW55rzvHJSgm3IILNTxqXccjrI8Uja/LhThe/zqqiyIxBiJE7gtqjgT4haSVtGo8a
	Blm72mTZ524kkLRIlHT8KcUGGXiWQ4LdzXVg8XtE/R0bskoUB8e0nqdKjY1Z3TDg8Ssc
	jLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=SxVwC3M012kA4xZ8yYtvXm6pmrQpxvAtKU4P454hCpY=;
	b=epQzyZ3ENr1UEgvVT+eNCv3cS/B4XWu/m1kAMnOdZbKfsuL8DCX7tJRSphya2WswM4
	HuoGZPGo6wWWeo/axJp/dpnLTzcZqveEHK9v1Owpo6NbbO2OWbPbevTYdzZMflIHROh+
	WXLwYStziwXmrTIKrxxjA1vWU26KzeV57cpB8748ndJnX2/4ZzX1WrTbIkOHQKDCDR97
	aaWMooiozpf7bwEYsyWDT1QTnr23vPE+CFVJqc8dazHYuRetK7bp8mlIjRpn8meWYoDF
	0n1BHmctHyT0sAKeebAiG3zrTuGHSO9tlAW7EjiKDkQa+dIPQHpuoatWJEfEICxJzufW
	uXbQ==
X-Gm-Message-State: AOPr4FWXyyHXBVFOIJCoJbARd/pi1LQrekw4U7NecFmtJ7XbK0Vg63ekOQliVRATlP3soQ==
X-Received: by 10.28.154.4 with SMTP id c4mr3668652wme.88.1461070051435;
	Tue, 19 Apr 2016 05:47:31 -0700 (PDT)
Received: from pollux.vannes.iot (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164]) by smtp.gmail.com with ESMTPSA id
	g141sm4228868wme.0.2016.04.19.05.47.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Apr 2016 05:47:30 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Apr 2016 14:46:40 +0200
Message-Id: <1461070003-12494-2-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1461070003-12494-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1461070003-12494-1-git-send-email-yannick.gicquel@iot.bzh>
Subject: [RFC PATCH 1/4] u-boot: basic support of device tree blob reassembly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Apr 2016 12:47:33 -0000

This introduces a new task 'assemble_dtb' to handle the concatenation of U-Boot
without DTB and the compiled U-Boot DTB while using CONFIG_OF_SEPARATE.
Basically, this task merges the u-boot-nodtb.bin and the device tree blob using
the 'cat' command and overrides the u-boot.bin file which is generated
at the compilation step.

This task is intended to be used in the verified-boot image generation process
after the kernel-fitimage class had appended a public key to the device tree
blob. It is placed after the do_deploy and before the do_install tasks and it
replaces the u-boot binaries in both deploy directory and build directory
in order to minimize the changes in later tasks.

Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
---
 meta/recipes-bsp/u-boot/u-boot-sign.inc | 21 +++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot.inc      | 22 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-sign.inc

diff --git a/meta/recipes-bsp/u-boot/u-boot-sign.inc b/meta/recipes-bsp/u-boot/u-boot-sign.inc
new file mode 100644
index 0000000..c88a2a1
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-sign.inc
@@ -0,0 +1,21 @@
+# This file is part of U-Boot verified boot support and is intended to be
+# included from u-boot recipe and from kernel-fitimage.bbclass
+#
+# The signature procedure requires the user to generate an RSA key and
+# certificate in a directory and to define the following variable:
+#
+# UBOOT_SIGN_KEYDIR = "/keys/directory"
+# UBOOT_SIGN_KEYNAME = "dev" # keys name in keydir (eg. "dev.crt", "dev.key")
+# UBOOT_SIGN_ENABLE = "1"
+#
+# The signature support is limited to the use of CONFIG_OF_SEPARATE in U-Boot.
+#
+# For more details, please refer to U-boot documentation.
+
+UBOOT_SIGN_ENABLE ?= "0"
+UBOOT_DTB_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.dtb"
+UBOOT_DTB_BINARY ?= "u-boot.dtb"
+UBOOT_DTB_SYMLINK ?= "u-boot-${MACHINE}.dtb"
+UBOOT_NODTB_IMAGE ?= "u-boot-nodtb-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_NODTB_BINARY ?= "u-boot-nodtb.${UBOOT_SUFFIX}"
+UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 3ba866d..29b0b95 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -65,6 +65,28 @@ UBOOT_ENV_BINARY ?= "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
 UBOOT_ENV_IMAGE ?= "${UBOOT_ENV}-${MACHINE}-${PV}-${PR}.${UBOOT_ENV_SUFFIX}"
 UBOOT_ENV_SYMLINK ?= "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
 
+# The use of verified boot requires to share environment variables with kernel
+# fitImage class as the mkimage call requires dtb filepath to append signature
+# public key.
+require u-boot-sign.inc
+
+do_assemble_dtb() {
+	# Concatenate U-Boot w/o DTB & DTB with public key
+	# (cf. kernel-fitimage.bbclass for more details)
+	cd ${DEPLOYDIR}
+	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ]; then
+		if [ -e "${UBOOT_NODTB_IMAGE}" -a -e "${UBOOT_DTB_IMAGE}" ]; then
+			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} > ${UBOOT_IMAGE}
+			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} > ${S}/${UBOOT_BINARY}
+		else
+			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
+		fi
+	fi
+}
+
+addtask assemble_dtb after do_deploy before do_install
+do_assemble_dtb[depends] += "${@' ${PREFERRED_PROVIDER_virtual/kernel}:do_assemble_fitimage' if '${UBOOT_SIGN_ENABLE}' == '1' else ''}"
+
 do_compile () {
 	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
 		sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' config.mk
-- 
1.9.1


