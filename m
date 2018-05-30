Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 10D6474DF9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 19:44:36 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id z142-v6so6110112lff.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 12:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jzamVEl1oJcAbLkwRy9r3i8yqXi07s4b8nZD7pxzQi0=;
	b=pzyFlnUNQk+CmdBSK5UlN/PN0UJlMCDDHX88P2SbitZrakg5eb6ogrHD06IySnEVbg
	0S3Vk56o4u5AYAz5JqNeEDmnSPzyHe4wZcYm9T+HE6IxIOQPhSuv++zEYb7ApVEtnvKh
	9By4vKtdfIwI0VYQjGnqQEAOADnBctaXM6jJ0QXDC8RF2bRhZBoPlCB2RbUXS3Il2wAH
	JYnwH/sPsw2z0iGqrr5XS6toyVSN9bqGQrcsqg5+OTmKsB66IllUPvwVM8zmzmnD+IQm
	ANlAzATaiW2N6pnVqMFBYx3a3pqBwkpsqiG065OT9/TLaSCGKDQCyR/WFIcQnxrskZF5
	oHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jzamVEl1oJcAbLkwRy9r3i8yqXi07s4b8nZD7pxzQi0=;
	b=dz4PuGW+75WkaU5hUAbNV2YoQyGwk4PeShypKAmxu9DXKAoDEIFN2WnLrcfuFz1VZf
	5KekCqJszuGhTnBIZ7xCa+luniR6QPnIY/2SLS31Bz0LfhW8W9KEgD+HqpPY3wfAO5kG
	gc05+5BB9xy+JhSzGZP63MmmtIts+8z/6UV0L4JmRkEq4M7EfLVaT02cAbYSuEoh4QIp
	mN79LFxc0D5oApngtpNPMBl7nJ1oLYOdRrDLETZoU+sHxvQHdrW3dGbURUhHUHjpkcvy
	ZKGaoZUDez2E2uOoQrtEllgJSLP+Pb2RZSJmAOb5Ncg58DGuGOW9IX/bpnwl4ftB47AZ
	wF5g==
X-Gm-Message-State: ALKqPwfO3buqhFq7+koN3fz4cS+XJL5Ht0ysQTFWFoqHQB+IN8KwHOON
	RubCbUlYo+kHWNX9aplU5TtIWA==
X-Google-Smtp-Source: ADUXVKIp5cyHpp9dNazsR9O2v/kLVqLCziI846RbQmOEaq1u45mrlsPAxQokQ5G/3PsqImJ9NtSFEA==
X-Received: by 2002:a19:4e86:: with SMTP id
	u6-v6mr2558120lfk.105.1527709477306; 
	Wed, 30 May 2018 12:44:37 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan (d83-183-77-184.cust.tele2.se.
	[83.183.77.184]) by smtp.gmail.com with ESMTPSA id
	u5-v6sm7131733ljk.64.2018.05.30.12.44.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 May 2018 12:44:36 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2018 21:44:33 +0200
Message-Id: <1527709473-16227-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] kernel-uimage.bbclass: introduce UBOOT_MKIMAGE_COMMANDS
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
X-List-Received-Date: Wed, 30 May 2018 19:44:37 -0000

From: Ming Liu <liu.ming50@gmail.com>

It allows the end users to be able to override it to set their own
customized mkimage commands instead of a fixed uboot-mkimage command
with fixed parameters.

Also splits out normalize_entrypoint to be used by other tasks.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-uimage.bbclass | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index a3a3d33..4826427 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -20,16 +20,31 @@ python __anonymous () {
             bb.build.addtask('do_uboot_mkimage', 'do_install', 'do_kernel_link_images', d)
 }
 
-do_uboot_mkimage[dirs] += "${B}"
-do_uboot_mkimage() {
-	uboot_prep_kimage
+normalize_entrypoint() {
+	local entrypoint=${UBOOT_ENTRYPOINT}
+	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
+		entrypoint=`${HOST_PREFIX}nm ${B}/vmlinux | \
+			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
+	fi
+	echo $entrypoint
+}
 
+uboot_make_kimage() {
 	ENTRYPOINT=${UBOOT_ENTRYPOINT}
 	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
 		ENTRYPOINT=`${HOST_PREFIX}nm ${B}/vmlinux | \
 			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
 	fi
 
-	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
+	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} \
+		-e `normalize_entrypoint` -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
+}
+
+UBOOT_MKIMAGE_COMMANDS ?= "uboot_make_kimage"
+
+do_uboot_mkimage[dirs] += "${B}"
+do_uboot_mkimage() {
+	uboot_prep_kimage
+	${UBOOT_MKIMAGE_COMMANDS}
 	rm -f linux.bin
 }
-- 
2.7.4


