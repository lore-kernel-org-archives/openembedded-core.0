Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5A42A7F2E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 09:30:12 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id y23so19281210lje.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 02:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SmgrnkOXuw+GEX+3PHMfykypa5l0CR3sInzKDqanF/E=;
	b=iOGxcADr0qy2VGe2or+MYFAnclVnGdYcpQOxK0eNURGv0ZqaVnm3l/nCW3V/BlWmmm
	wxOWpdvnJUFNzmt1Cgon2qv8S5bE5onFZNrj4h1k+l1lQUAimWlxbGHRn22dyM49BdAz
	+mQKDn5bjcOqdMHV0hJ08inSfzZvZiMzysT/aUXa/oTA/gTxSiPuCLaV5joKgimZhlFr
	9Wz6C0mfJX8KKlLvjx1y/csNZzcFQuOZ32tABVr0Yjw1VFeZ3PdpHeQHynt2GFcbwA2T
	Q40XmBOLZpbQ8x8+yx4JNoXEzKd3g3cxPleBmE2GSlLAsD85f9QbvSCyY0AyOHL0fxm+
	IfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SmgrnkOXuw+GEX+3PHMfykypa5l0CR3sInzKDqanF/E=;
	b=O0lyIhiLa4LX8TJdxvQRa2PYVHFeC0/HeYq3Gju8RUnD8GF379HONcEtXTMoWoRPLQ
	1PsQHXYmcxmShMeFYRLhXFGMX9tItYrCAJ1Lg1aqwmcFTB9mczBf5c0iIy50W9zJW1Wu
	2Bb62ybvFvXRr5Y5RHASmsgERIPgeWo59lYD1vMvc82xITtU03S63WxNyZcVpuFDpbhC
	8oKTDoePTOv+VctSqGlUMAV7gYEGDpkByGZAdRi5xrmeEqGPuCgc8TVgjfhxGW/A8NyQ
	/gVumht/6i///O2QrdDpAc29ei+ggjjFHlmwQIqtYpGX0H1y6tBrPSHkD8Aj5A0k6utT
	7QRw==
X-Gm-Message-State: APjAAAV1fKy8esMI2A2/nEs2mGivC4u8d+OXXndOtIVrr7wvDQOeae2u
	XnqEa9wJO9aueAukQAxYlHDRgpPP
X-Google-Smtp-Source: APXvYqx/3NsbMXMhFukogqcu2vOcFZl/KxW6hJAdazbRxlHhxSeXdoyP+tIBrRGBHo0FWftLBnxYlg==
X-Received: by 2002:a05:651c:c5:: with SMTP id 5mr13229601ljr.99.1568194212570;
	Wed, 11 Sep 2019 02:30:12 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.24])
	by smtp.gmail.com with ESMTPSA id
	t1sm4509306lji.101.2019.09.11.02.30.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 02:30:11 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2019 12:29:59 +0300
Message-Id: <20190911093001.7849-7-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190911093001.7849-1-dbaryshkov@gmail.com>
References: <20190911093001.7849-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH 7/9] uefi.bbclass: provide efi population functions for live images
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
X-List-Received-Date: Wed, 11 Sep 2019 09:30:13 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Define common functions for populating EFI directories in live image.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/classes/uefi.bbclass | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/classes/uefi.bbclass b/meta/classes/uefi.bbclass
index d3fc4b686676..062f0c3859b2 100644
--- a/meta/classes/uefi.bbclass
+++ b/meta/classes/uefi.bbclass
@@ -24,3 +24,31 @@ python __anonymous () {
         image = "bootUNKNOWN.efi"
     d.setVar("EFI_BOOT_IMAGE", image)
 }
+
+efi_populate_common() {
+        # DEST must be the root of the image so that EFIDIR is not
+        # nested under a top level directory.
+        DEST=$1
+
+        install -d ${DEST}${EFIDIR}
+
+        install -m 0644 ${DEPLOY_DIR_IMAGE}/$2-${EFI_BOOT_IMAGE} ${DEST}${EFIDIR}/${EFI_BOOT_IMAGE}
+        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
+        printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${DEST}/startup.nsh
+}
+
+efi_iso_populate_common() {
+        iso_dir=$1
+        efi_populate $iso_dir
+        # Build a EFI directory to create efi.img
+        mkdir -p ${EFIIMGDIR}/${EFIDIR}
+        cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
+        cp $iso_dir/${KERNEL_IMAGETYPE} ${EFIIMGDIR}
+
+        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
+        printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${EFIIMGDIR}/startup.nsh
+
+        if [ -f "$iso_dir/initrd" ] ; then
+                cp $iso_dir/initrd ${EFIIMGDIR}
+        fi
+}
-- 
2.23.0


