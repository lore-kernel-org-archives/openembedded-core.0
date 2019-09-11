Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9E8897F2ED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 09:30:13 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id w18so3960869lfk.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 02:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3NG0xu1QUbFr7ZI1J7mMWr0KqwQv1YT+O89cwbQ0F2I=;
	b=lax7DDE6bOJAuSyCypfC8LkHnY20DVzPNa7Jydas9PGqVOuRpbVqJCwF+HLvn/DwWX
	uQQuKG18nOKkKYCTowHugp86KSll5bS9wqhQV73brC6sXqBMrhBphs1ire0RQ7wjKNmP
	wWK6ulBcXSPGq72401NADD/ubd/UD1BqwYnxdDwxi+WbAOSamH5xYnJWcR32LWjcpPrJ
	ME+ZjF1wlCQI+Xok+9g8sd2YjxKFPnfJnk1AcgZD5cXCW5Cu9nBymTptuWSiE9PX5mT2
	nzX+9ofpVM1UJrQ7lAbiCmpucb90qiQ2BKXNd8QDSWutPvwlQ7Jf4+3Q98GZM+b7jN3v
	BOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3NG0xu1QUbFr7ZI1J7mMWr0KqwQv1YT+O89cwbQ0F2I=;
	b=TIHBlR2NPLwTgMArJcee8d0g5pBuOZT9aipPXTipLt3k/6KZ4M7qnjgH3tXU6VELYx
	j499FswtBJ5XH7frVBufWE/Kd6xuzo8W6Dg+RElQVmnh18ZXTJd30CT6gboyC+YFeErS
	nevbSHA7mS7T7oNxsGvXhuOb8H7/Ou4XCnibSCjJcalno6EGy7v5SLRQ5EhWTEnGAo12
	zxlgPO/xRn1r6bwqCgMaGjPED+bTgCEWiEEUq6U8AUdZfX/N+awiqoP5ENwD+drxkbAT
	hqVyWmX6bFmsKktOJnmcdj/dGiK0CaVie3CnGK0X8Jn/7+/kPZI68cCAfUz7bd/Rgq6g
	NoxA==
X-Gm-Message-State: APjAAAUSTWid9WZdX5PK2VgsMFLU1SzyLgObvm3WVVPpo6NxDYY1yii0
	xSs4EY1bxtPNLuV77A+eU4IIkq+w
X-Google-Smtp-Source: APXvYqxHNloh5TEpztkxZjYaTzc0xntfAKb2N1237/Q72SumomvSW5gN11urxBguBlivG+HGGTjPAw==
X-Received: by 2002:ac2:53a3:: with SMTP id j3mr23730086lfh.155.1568194213893; 
	Wed, 11 Sep 2019 02:30:13 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.24])
	by smtp.gmail.com with ESMTPSA id
	t1sm4509306lji.101.2019.09.11.02.30.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 02:30:12 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2019 12:30:00 +0300
Message-Id: <20190911093001.7849-8-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190911093001.7849-1-dbaryshkov@gmail.com>
References: <20190911093001.7849-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH 8/9] grub-efi.bbclass: use efi_*_populate_common
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
X-List-Received-Date: Wed, 11 Sep 2019 09:30:14 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use common code form uefi.bbclass to populate efi directories.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/classes/grub-efi.bbclass | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index a0a95d0e1e45..188515ef9edc 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -2,31 +2,13 @@ inherit grub-efi-cfg
 inherit uefi
 
 efi_populate() {
-	# DEST must be the root of the image so that EFIDIR is not
-	# nested under a top level directory.
-	DEST=$1
-
-	install -d ${DEST}${EFIDIR}
-
-	install -m 0644 ${DEPLOY_DIR_IMAGE}/grub-efi-${EFI_BOOT_IMAGE} ${DEST}${EFIDIR}/${EFI_BOOT_IMAGE}
-	EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-	printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${DEST}/startup.nsh
+	efi_populate_common "$1" grub-efi
 
 	install -m 0644 ${GRUB_CFG} ${DEST}${EFIDIR}/grub.cfg
 }
 
 efi_iso_populate() {
-	iso_dir=$1
-	efi_populate $iso_dir
-	# Build a EFI directory to create efi.img
-	mkdir -p ${EFIIMGDIR}/${EFIDIR}
-	cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
-	cp $iso_dir/${KERNEL_IMAGETYPE} ${EFIIMGDIR}
-	EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-	printf 'fs0:%s\%s\n' "$EFIPATH" "grub-efi-${EFI_BOOT_IMAGE}" > ${EFIIMGDIR}/startup.nsh
-	if [ -f "$iso_dir/initrd" ] ; then
-		cp $iso_dir/initrd ${EFIIMGDIR}
-	fi
+	efi_iso_populate_common "$1"
 }
 
 efi_hddimg_populate() {
-- 
2.23.0


