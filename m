Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 75D0C7EE86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 15:45:03 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id q11so7556911lfc.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 08:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3NG0xu1QUbFr7ZI1J7mMWr0KqwQv1YT+O89cwbQ0F2I=;
	b=P/6bh0UqgvOqPwYzpSBEAeYsXqrj1lsthPKw0Mnj2oTUrrU/1SQe3q2cASfEEJ7Q4H
	8Eex7G4XzG9obxFPrfWowK+80FtmzoIS4nfH3T/u75h/1cE8eF+ZMQQONa1pj7UGROPe
	4tnDNIwajmVTam7OJiXdRNB+N6ylJ/+ddMoSh+X55mcL+7+S4jE+1et5i53SQYZ8uwST
	hyb7MYa1xrZP9JxkWgg19BvaWlOVzl9ARDkFXOwlh1Nr0CISm387yMt99unkblVKJFOB
	fNjmmk5EkrzU/Oxg5AjmpxFL5quWiQiCpE7CBitjGTUtOta0KE6rloRttJtLGZ4L+Wtj
	14+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3NG0xu1QUbFr7ZI1J7mMWr0KqwQv1YT+O89cwbQ0F2I=;
	b=Mrq6bQ0vJMIS2tcywsHPh4Swy3yzkQi1DLEUr9uhVCaxPzMg3HXWcM8je2oCbsH0Or
	JglHjIhhYqeld3px2t2Vb3HDk2f5PpVV1n5t8PTZzioY/vY8Ol7b75XXTFqP+Br79Fdq
	v06ErijfUCMfrT/RTPAQdZSkETNbiIvhYXxA7oJwSibP3PteHz/3MjMn6vJdGFWKW4f1
	HsPI0qYnBmdbWuXh7I8jIlLeywJyBfxdEkYJyNDNqzqD6AB4+RjNKxkMPIk5xUR66t6v
	ys7kiixwpkBKgL04wjsD6bfZ/DEf4TPFwcdf1fTKjnWGedteDvy0cCVqpxKk/EQkZZcp
	uIUA==
X-Gm-Message-State: APjAAAVbLtBjlltXcJtfNf0Lug+pT/K3okeDOhCZ6ncvlO7YOraOemXO
	KcDOuzXjdcW5x44/pAFRXlPsq+ee
X-Google-Smtp-Source: APXvYqwKe/tU8B22PjvT+vblGQB0eu0rJ9bdAMSOy0nIvVv3iyUhDRkNf3dV6e3ZAi3y19r1QZj91w==
X-Received: by 2002:a19:c017:: with SMTP id q23mr7695913lff.174.1568389503595; 
	Fri, 13 Sep 2019 08:45:03 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.196])
	by smtp.gmail.com with ESMTPSA id
	t1sm6297169lji.101.2019.09.13.08.45.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 08:45:02 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 18:44:33 +0300
Message-Id: <20190913154434.29908-8-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913154434.29908-1-dbaryshkov@gmail.com>
References: <20190913154434.29908-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v2 8/9] grub-efi.bbclass: use efi_*_populate_common
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
X-List-Received-Date: Fri, 13 Sep 2019 15:45:03 -0000
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


