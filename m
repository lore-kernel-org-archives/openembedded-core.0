Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id B979C7ECBE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 15:44:47 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id y23so27552260lje.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 08:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5XOFInWkQ0MuVSiIabZpKlmvYPSMxijXL/KICdN9RGY=;
	b=WpJk/qBXP0x/2OM+lpGcU/NJQYx0xM7TDJgp5afSyajKWEDusVaggEyZneR24X8Nwh
	nQ86H9G2Nn3tMOrqaXwe3TQNvFQ0f1C/oPlz8xMLc37/XYzSCmPul7D0cu+FJr8Gu/rm
	230sGih3fXfkTlcn3059gAjaav/rnTJNI8QG9Sl1AgUrVR5Vgk2VlLwBYs/VyZ+cqf2c
	lVdA203lOZq3Nc+7CkSyIJ4wBMrVzn/cxlgDgI/VxgcqMaFFE94rVPJBU+sYbBY0eVw6
	WRBIwcjseV/W/Mu4+Tq8r9O2suElHUa1WMB8Ta4UwYgXRvK0MGHeAN1e2+qY97KQ++Pz
	syaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5XOFInWkQ0MuVSiIabZpKlmvYPSMxijXL/KICdN9RGY=;
	b=rdP5+I/r2xvnfsFttwchHQk2kI/7oVoT2e2NXXDZLSRyjspAr8r3X62zAbBJG+Ia2c
	36MYx3EzHCfKGLmEDKiAjtbyaNqacESQndeWut39MB6jRJQEnK876bRGgI9xRZnjp98F
	kbtSLwydreLjyUzvR4c2bsknyRedlZh1HwKnOcPCDQ7WSO5OCezl+B6O/f3Cr/cPmXDr
	f79dy4bh4vn9ofwTVFhKgSazTY2YyBpbSyq6Ealq4JQBb0mk4++v6mEzp4A7QvxFhyzN
	aBaatp8EDd/cYkR/E0fY42IXVnNWeshZYlGW1Us45mAu8qOfFqsQlbdYKh/uJnCkR29t
	H2Hg==
X-Gm-Message-State: APjAAAUEyNVY1U1F2cDtBgDwbxMw8BdfExK21BUh+tvrWopB/SP3hRsA
	8/E2n5I1vT+araIkBifLCBdAnyNq
X-Google-Smtp-Source: APXvYqz4FD3j48PgzSfs6SXSntC5Wn2riBc8mGkGunmMFO/rMI1sGj0RC+y8XkFiH/8mnIuNLiuOtw==
X-Received: by 2002:a05:651c:282:: with SMTP id
	b2mr29697317ljo.50.1568389487825; 
	Fri, 13 Sep 2019 08:44:47 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.196])
	by smtp.gmail.com with ESMTPSA id
	t1sm6297169lji.101.2019.09.13.08.44.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 08:44:47 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 18:44:29 +0300
Message-Id: <20190913154434.29908-4-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913154434.29908-1-dbaryshkov@gmail.com>
References: <20190913154434.29908-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v2 4/9] grub-efi.bbclass: switch to uefi.bbclass
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
X-List-Received-Date: Fri, 13 Sep 2019 15:44:48 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use variables from uefi.bbclass instead of hardcoding them in the class.

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
index ec692f1646f3..a0a95d0e1e45 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -1,4 +1,5 @@
 inherit grub-efi-cfg
+inherit uefi
 
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


