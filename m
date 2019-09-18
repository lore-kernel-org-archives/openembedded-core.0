Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 544E77E588
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 13:17:32 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id y23so7208831ljn.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 06:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8XsSnjxMeOwHbDEjQmgpoIGY06nBFFkXGS7xOnqzKes=;
	b=Zon6hDJI8Hd8zDmk5x5tdloB6vcgcS3qWECM/7ExX0deS+rNNzO+aEUkCPXMVPCKoM
	Z1mSb+RWMQTxiv1tYEZKfCBM/aFCTLjUlJHa0Bxb16zIYrmXaGO1kantK1HtCv4Wsld+
	Tv3LXWyJufgUJcfml0Lnob3X15Viy048EsMLFVYPoaFn41CPF4oEihqDtwTUAAgRDy45
	ocVUF6GUwi9cAldDjBr0Ycus4EdJArRS/A+GRR5pwBOtszd75I+5iQnx4hxGjCcYyRnh
	U+6yBJnzdd2e8ijfWFQ4r1E4UqN+HTry0b05jBxJ2hsDrfdChkxtie/18jFoUwbYxCBO
	73IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8XsSnjxMeOwHbDEjQmgpoIGY06nBFFkXGS7xOnqzKes=;
	b=oPTEZPP433I7qy9uPexr7OL3UtjHlrRHX7FcHLb/1xeVucqLb+vpa3KCv2ft235oM1
	eT0h0f3hbx8z08crlAPsJO0IQRZl19j0HrkGRoIVv9iVtP7yM4hkZ/4XJIUdao0Jcnpn
	m8kusFgGrI5iCarjQeX3W9AbIz5E070NCQ78NY8bUmIV8m6W1fuPI8p8MuAwBe6MPoMX
	lx2RFeeeGY7FC9bjOUGl2PbVlzPqvlKSb/iuqNNOT/MEQf2yzE5IAXrS/PCF6MQ0/CLZ
	mLzYvwRAsVgkBzqEQjkIry+KRQGnT03qTWY/6nb7XiQMyCQ0nCQyVU1waZCJhyKiO0o2
	uB4w==
X-Gm-Message-State: APjAAAX/vFJi2gfS9s40l+RqySxw85hPX5ETzQcAqXABqFJa2tXAWAoT
	2Sf3feM9JoDITbV6KW5IcfspwKw5
X-Google-Smtp-Source: APXvYqzxoKqz1Q1P3Yg5lV7zsbNSG5M3UwjP7it0XUQXuz3UfTGcFbBwFzRwUM3RjwRVJQ5zPg17UA==
X-Received: by 2002:a2e:7318:: with SMTP id o24mr2243244ljc.111.1568812652416; 
	Wed, 18 Sep 2019 06:17:32 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.37])
	by smtp.gmail.com with ESMTPSA id u10sm999466lfk.34.2019.09.18.06.17.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 06:17:31 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 16:12:44 +0300
Message-Id: <20190918131247.26488-4-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918131247.26488-1-dbaryshkov@gmail.com>
References: <20190918131247.26488-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 4/7] grub-efi.bbclass: switch to image-uefi.conf
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
X-List-Received-Date: Wed, 18 Sep 2019 13:17:32 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use variables from image-uefi.conf instead of hardcoding them in the
class.

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
index ec692f1646f3..724bbe86842c 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -1,4 +1,5 @@
 inherit grub-efi-cfg
+require conf/image-uefi.conf
 
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


