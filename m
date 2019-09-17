Return-Path: <dbaryshkov@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9A6597F6AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 15:36:27 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 7so4058270wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 08:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YlupAn2uaI2MKaPpDkQD04gRGi7C1OhaRxIYC3b3KYA=;
	b=lxC5PlVZLTHRojozdDcfvhdalkKC4vHOI1TZIW8A7gbv1AmVNkY1vYC2+Wtlvwnbsm
	eUeP6YLzqpuRrl4pdanQO/H/xTCCMnLLt6+xgh/mWSA+VBb8wTaQh9pYEq/ye2/vzUnu
	gUZKo4oHNAcmVNQKt86D3XuRpuG+IQpX7Ay9fZiwgab7Zwv5+7izI1bdO26hupFmnsuW
	RzADN3tBBqskFTLt69jQfEEVYsKnVAVp9JciUPy1IW86b+sNOj8XXe3taL3JuOObPcZC
	0PfozFw14qoSF7RFpsERxJlBRe/BjvphDQUdBCv5brDFAEAB0/v1I6tWZWjsxFz2sMrR
	WtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YlupAn2uaI2MKaPpDkQD04gRGi7C1OhaRxIYC3b3KYA=;
	b=TW5j+7ibjlODxfgmeauisqn49mRj/D4Dk9+5hhhZ6l2NydBC7/v9PX7HV24rNM3sDn
	LgLhFmExWQAENYvChLTcaq8Nxy2+OVuQbN3KBZyerjgFahWREfwPpVWC2IjByXh7UL8G
	wdVLHuvWLaWT+CbT+TGgaKJ0H0VsVW59cvsweerk1hpAY2PY3YXqGXfp7KWvw2j/dQGE
	//gJCgaQH2AqvqNm9aLP/0AeMSyJnJrXpDVPQDKPgVeBJjhalOTIGN1gzXNsixNoosXR
	4OqYCeFHUef2155yswCPRpHCCYH0px1R6cUaq9OjNKwgei5pRxdP0ZX3yiHEquRg/in4
	YOHg==
X-Gm-Message-State: APjAAAXdP8eAS54nxLcFbcDDDjjGLuuvXTtJjp68pOENCOxy/JPCLc3J
	kML+Z/QMjUM+eE5PKTh+2BDyWFA6
X-Google-Smtp-Source: APXvYqzHKsX83SfQBx94Jhe9wVEv0L9ap0XmOrIuPHJ907KeyRrwGsFegqLKfNa80eEfiw23sEsCDA==
X-Received: by 2002:a1c:ed16:: with SMTP id l22mr4083417wmh.172.1568734587765; 
	Tue, 17 Sep 2019 08:36:27 -0700 (PDT)
Received: from lothlann.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by smtp.gmail.com with ESMTPSA id
	o9sm4605245wrh.46.2019.09.17.08.36.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 08:36:26 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 18:36:13 +0300
Message-Id: <20190917153613.4954-9-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190917153613.4954-1-dbaryshkov@gmail.com>
References: <20190917153613.4954-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 9/9] systemd-boot.bbclass: use efi_*_populate_common
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
X-List-Received-Date: Tue, 17 Sep 2019 15:36:28 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use common code form uefi.bbclass to populate efi directories.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/classes/systemd-boot.bbclass | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index 47f2adcd7744..6594a2331f7d 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -11,21 +11,17 @@
 
 do_bootimg[depends] += "${MLPREFIX}systemd-boot:do_deploy"
 
-require conf/uefi.conf
+inherit uefi
 # Need UUID utility code.
 inherit fs-uuid
 
 efi_populate() {
-        DEST=$1
+        efi_populate_common "$1" systemd
 
-        install -d ${DEST}${EFIDIR}
         # systemd-boot requires these paths for configuration files
         # they are not customizable so no point in new vars
         install -d ${DEST}/loader
         install -d ${DEST}/loader/entries
-        install -m 0644 ${DEPLOY_DIR_IMAGE}/systemd-${EFI_BOOT_IMAGE} ${DEST}${EFIDIR}/${EFI_BOOT_IMAGE}
-        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-        printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${DEST}/startup.nsh
         install -m 0644 ${SYSTEMD_BOOT_CFG} ${DEST}/loader/loader.conf
         for i in ${SYSTEMD_BOOT_ENTRIES}; do
             install -m 0644 ${i} ${DEST}/loader/entries
@@ -33,17 +29,9 @@ efi_populate() {
 }
 
 efi_iso_populate() {
-        iso_dir=$1
-        efi_populate $iso_dir
-        mkdir -p ${EFIIMGDIR}/${EFIDIR}
-        cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
+        efi_iso_populate_common "$1"
+
         cp -r $iso_dir/loader ${EFIIMGDIR}
-        cp $iso_dir/${KERNEL_IMAGETYPE} ${EFIIMGDIR}
-        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-        echo "fs0:${EFIPATH}\\${EFI_BOOT_IMAGE}" > ${EFIIMGDIR}/startup.nsh
-        if [ -f "$iso_dir/initrd" ] ; then
-            cp $iso_dir/initrd ${EFIIMGDIR}
-        fi
 }
 
 efi_hddimg_populate() {
-- 
2.23.0


