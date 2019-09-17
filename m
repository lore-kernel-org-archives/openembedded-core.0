Return-Path: <dbaryshkov@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C67B67F6AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 15:36:20 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id i18so3624762wru.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 08:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ooOdCF/58EjC2FqYB9ixhmVkXb/VrJgyXJCZsaSUfDo=;
	b=CvBaEB3hlbKCBq/uYil+NAIF/NpgX9hq5Zr9RX13JzZ2p1XjTbl0kNebXMFKHAdTcG
	xKA4Cf1lot+iM2RTPbT5tyoBTxInrIje1jNEN8K8CLc1ZPHGItqC6JhVq3vg6sN0qDY5
	8mRxpXH0O0nJnuy7JSWZmNfp0XbR6o3Fi5CAlUbyPaHVP9ncgK4e+MNUg11Uv9TliBFa
	BCmMmsdJwrC8lIO+uUoVkhYwu6i73Kcl3kmJkeM/gvG4abwvSmqZsWMJ06liOYPYx6iG
	qSTVCNluXq2lOasnE/KLCOddwBR/TQEBCi1+5/bVIkDMW8Hgn99N+TntMTlQknw5wJZI
	Vk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ooOdCF/58EjC2FqYB9ixhmVkXb/VrJgyXJCZsaSUfDo=;
	b=l+Sw2z0tnTRTlzlIkSDraTlETAeXGFBHX9Y6ahT3vOrZkjHldt6TUEoQ1PHVW4FU88
	j4lZovRIGElB/cvoFn+OS/uuroOKW7eYqkY8EMk3z1G9pcUu/+lOUv2xrjveAteyUG6Y
	4A5QazMvNZ2Vr6GTlPaB/EWeHmRMbpK0JVXEJWLip+Mvwy54kCEZ5B7ssqk/xLyyQBKm
	F7heTWry7zJLWLg4RsvFZTNyCHoRlBhtMIUUuXdfF10WLVJoJohkgNQsSPbplmvXEMQZ
	3uUMIfytGy9uKhGDeJuLyN8DERBM7sV4xSESghrmh0QsyMp2+qxD+pgESQOM9p096n5L
	jZXg==
X-Gm-Message-State: APjAAAXe5VVRhsn9JsBo1xX25YXD7c6figFJVv6vJLx6Wek0MQPdfChy
	9cuj569vNQVNCG0VOdm0qvKLf1MY
X-Google-Smtp-Source: APXvYqztWZCAX8p+E9sKB6u9ucAGY/tPAa7DSVCXisKM8DYmQ5sGBaZWUCGvjr2vNlUju484WHUhCw==
X-Received: by 2002:adf:e7c4:: with SMTP id e4mr3370257wrn.62.1568734580915;
	Tue, 17 Sep 2019 08:36:20 -0700 (PDT)
Received: from lothlann.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by smtp.gmail.com with ESMTPSA id
	o9sm4605245wrh.46.2019.09.17.08.36.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 08:36:20 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 18:36:08 +0300
Message-Id: <20190917153613.4954-4-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190917153613.4954-1-dbaryshkov@gmail.com>
References: <20190917153613.4954-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 4/9] grub-efi.bbclass: switch to uefi.conf
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
X-List-Received-Date: Tue, 17 Sep 2019 15:36:21 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use variables from uefi.conf instead of hardcoding them in the class.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/classes/grub-efi-cfg.bbclass |  1 -
 meta/classes/grub-efi.bbclass     | 20 ++++----------------
 2 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/meta/classes/grub-efi-cfg.bbclass b/meta/classes/grub-efi-cfg.bbclass
index f661a69f833a..8b5ff20c72c0 100644
--- a/meta/classes/grub-efi-cfg.bbclass
+++ b/meta/classes/grub-efi-cfg.bbclass
@@ -23,7 +23,6 @@ GRUB_TIMEOUT ?= "10"
 #FIXME: build this from the machine config
 GRUB_OPTS ?= "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"
 
-EFIDIR = "/EFI/BOOT"
 GRUB_ROOT ?= "${ROOT}"
 APPEND ?= ""
 
diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index ec692f1646f3..4aa173e23bb1 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -1,4 +1,5 @@
 inherit grub-efi-cfg
+require conf/uefi.conf
 
 efi_populate() {
 	# DEST must be the root of the image so that EFIDIR is not
@@ -7,22 +8,9 @@ efi_populate() {
 
 	install -d ${DEST}${EFIDIR}
 
-	GRUB_IMAGE="grub-efi-bootia32.efi"
-	DEST_IMAGE="bootia32.efi"
-	if [ -n "${MLPREFIX}" ]; then
-		if [ "${TARGET_ARCH_MULTILIB_ORIGINAL}" = "x86_64" ]; then
-			GRUB_IMAGE="grub-efi-bootx64.efi"
-			DEST_IMAGE="bootx64.efi"
-		fi
-	else
-		if [ "${TARGET_ARCH}" = "x86_64" ]; then
-			GRUB_IMAGE="grub-efi-bootx64.efi"
-			DEST_IMAGE="bootx64.efi"
-		fi
-	fi
-	install -m 0644 ${DEPLOY_DIR_IMAGE}/${GRUB_IMAGE} ${DEST}${EFIDIR}/${DEST_IMAGE}
+	install -m 0644 ${DEPLOY_DIR_IMAGE}/grub-efi-${EFI_BOOT_IMAGE} ${DEST}${EFIDIR}/${EFI_BOOT_IMAGE}
 	EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-	printf 'fs0:%s\%s\n' "$EFIPATH" "$DEST_IMAGE" >${DEST}/startup.nsh
+	printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${DEST}/startup.nsh
 
 	install -m 0644 ${GRUB_CFG} ${DEST}${EFIDIR}/grub.cfg
 }
@@ -35,7 +23,7 @@ efi_iso_populate() {
 	cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
 	cp $iso_dir/${KERNEL_IMAGETYPE} ${EFIIMGDIR}
 	EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-	printf 'fs0:%s\%s\n' "$EFIPATH" "$GRUB_IMAGE" > ${EFIIMGDIR}/startup.nsh
+	printf 'fs0:%s\%s\n' "$EFIPATH" "grub-efi-${EFI_BOOT_IMAGE}" > ${EFIIMGDIR}/startup.nsh
 	if [ -f "$iso_dir/initrd" ] ; then
 		cp $iso_dir/initrd ${EFIIMGDIR}
 	fi
-- 
2.23.0


