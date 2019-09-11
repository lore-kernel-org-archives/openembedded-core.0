Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id ACD387F2A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 09:30:08 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id t8so15843723lfc.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 02:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5XOFInWkQ0MuVSiIabZpKlmvYPSMxijXL/KICdN9RGY=;
	b=HcjvVm8QgyeZ5/HRANXKyNCUzeVoP7I6qARjo1I4zNM97khesPFvFZaHcMiiH1JIuE
	vjG6pDwK417KRLK//0D/2++b1QpEL4GNKd40B47XrtrSdO33oDy/LWZTJKbhQgzmDNLR
	D2Wgvt3e3iE6n9IZhV2OVQIdX/Y4DX63Hg4axudiAdXCrlKKdBssHJsIhbEusTcblCF2
	IjfdaVjZPhlK+X5ZETH3XZ5JRN1Z3NMNxCEg4MB/rljIjRqlcy/QYsLxL928q1DpnlqP
	m6Ed7V8rVtEsMqQz76bIAHi3hhyykIo1BjxRQo+yukaeqpmaIeP7U4zW7wdG5ArRCtn9
	QYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5XOFInWkQ0MuVSiIabZpKlmvYPSMxijXL/KICdN9RGY=;
	b=E67yJCVijK5HW9hSs23SxatrRDMq9PNXCoR9Tt6+2wRLIPZNALtPkYOSYMXJ7FgMzv
	rd08VthI5oNgrGnmIluRoLbOf93xDGZGHzmYReVXftAZGpzdQYNQerg/rldW1vjPoT4m
	lfq9SQSzT6QJG75uCP/TJRFkjgLXF03yAOVjP/maGOMZk+hQiQY26bywRgjGXBnULnpp
	8kTMNeHRHaYo+/bDPzgDaPvMPXxST4EjTONp99/VGIcqPqRXTX/uAJEOsUwsquNQcH5+
	FaQXsKkz+VPGc4vn81oFbG0SMMni7RFmCHh1YeewEc7IhCP5+6F3q5pmPc9KXXXU/Tme
	9ylA==
X-Gm-Message-State: APjAAAUJgT/vwuRbgfGyMr++KIuDG+5Ib7ykW+nlqa5huVGpGeFCCTPn
	in9YNcnQk/aQd1G9963B2RBoZSVi
X-Google-Smtp-Source: APXvYqwQxcMd9acPIhsJf4A1B41O3oaSx1w1Em9Q9KOzWNgTBReKc0pJKPAU4mH59WggcCYtR9CQ6w==
X-Received: by 2002:ac2:5445:: with SMTP id d5mr22719082lfn.43.1568194208752; 
	Wed, 11 Sep 2019 02:30:08 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.24])
	by smtp.gmail.com with ESMTPSA id
	t1sm4509306lji.101.2019.09.11.02.30.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 02:30:08 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2019 12:29:56 +0300
Message-Id: <20190911093001.7849-4-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190911093001.7849-1-dbaryshkov@gmail.com>
References: <20190911093001.7849-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH 4/9] grub-efi.bbclass: switch to uefi.bbclass
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
X-List-Received-Date: Wed, 11 Sep 2019 09:30:08 -0000
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


