Return-Path: <dbaryshkov@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3EE847F6F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 15:36:26 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b9so3716292wrs.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 08:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=53n1F2tX3orlxzvFbczhirDyrlZ2uiB/PzizbbuPE8A=;
	b=XuMibJevzGn6RvcTtZSNowsow+xYTbQROiekHVDTzBZPEWsddMDV40zdbRhHhkeiKP
	7v5mH0BqyJfG9AMsmfOrBKWoS/RC8txFez6AVRJCiGqu65XPd7WBJAk3TSZ01k9E28Ia
	kpAJabScTxU/UPQDcN12nLb0AGKeTO1RMyj3IkIjcBF/AKrZLVjogt14BRtiizXAkTUY
	+YIpZIqXtZRp934H4gFn4lurgF/m24zVMc3rSB9wzRVSeVICm++16uBmKBwOdj3d22aT
	IIntM4BUXncveIE5YGdidKwskb8p3Mw3oG293+aW1utCFcDI/VErRJoATtY1D0b/PlWL
	0Nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=53n1F2tX3orlxzvFbczhirDyrlZ2uiB/PzizbbuPE8A=;
	b=I4+LLXQQnTt03iMgTSmKbO8Ezaf9K+r7Q5Tz+syrmkLkJlqjYWMIc6q6o9U1kn+M4d
	KgJYqpZoNvIqE1XCu+mtTu7fBd3lapA0qSoGAqTQmPlOyKqS0/HEVRuujcUZvXp5C7Xq
	DJ0CoOERFLl3ccXPrP3b9UGHxuP3zPWiZXi2BfhZYaaJMSTo6S0YLlhlxu5bdHj5PG5b
	JA0x5aDNkDNyxX5+C50ltdMS5lLBeN/wIL1GKi9nhWbPhO8NuECKMFgTG+9/cBzAsiec
	dxmAfBAHcgCRYTOWwq4JJ9TUEPtDvsI/t1ABToeC/v2vsK3BnhbhQnZTNdGpduPc6GbI
	6QvQ==
X-Gm-Message-State: APjAAAU/k7aDaa7C3e0dLVCu+husVgfQyS6ELw239kuyakTDJePIItYA
	KvZKLyOwpkRAdtKUnJg3a0kqG4OT
X-Google-Smtp-Source: APXvYqwIqUIIcPX/taxqudUbHBi/6brBJlhbG7dBn3C9McgJz5fBGKHfAkbQRFNrpgQ+wkTIhI2KoQ==
X-Received: by 2002:adf:cc0a:: with SMTP id x10mr3428924wrh.195.1568734586444; 
	Tue, 17 Sep 2019 08:36:26 -0700 (PDT)
Received: from lothlann.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by smtp.gmail.com with ESMTPSA id
	o9sm4605245wrh.46.2019.09.17.08.36.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 08:36:25 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 18:36:12 +0300
Message-Id: <20190917153613.4954-8-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190917153613.4954-1-dbaryshkov@gmail.com>
References: <20190917153613.4954-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 8/9] grub-efi.bbclass: use efi_*_populate_common
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
X-List-Received-Date: Tue, 17 Sep 2019 15:36:26 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use common code form uefi.bbclass to populate efi directories.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/classes/grub-efi.bbclass | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 4aa173e23bb1..188515ef9edc 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -1,32 +1,14 @@
 inherit grub-efi-cfg
-require conf/uefi.conf
+inherit uefi
 
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


