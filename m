Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id E63857F833
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 13:17:34 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id h2so7229409ljk.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 06:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xZEGTP/NsS8jKaKUQ6/2Z6o8gwIyQSvAYKKRbuQ5Dug=;
	b=BO7X3L2LvLC4hfTu5QAIy1zx4G/K0aP/P1XnAiX9ImpmtIhdKYUw3glaSodRuNCO0H
	b2XNTzpA+N9y1+hoLXQZ7r2tmXdnPTr8GK3LDl9w/A8SyoXBo8h7y/vr2bhFCmukloZL
	xUrwcVSRc2kBFDiNmN61e9whAyYU/R5njzWpvE7NkOBCB2Gn75rLTSpUO4v/+rf5sukk
	dEYddALWp/SdFCo59F1VIYJ6anDH0Pxw5E3ckjwSt2n01jMboZ7m08jx73X8Q/98/gmf
	CeT1Gi0G93s4as6r+rektLVmVOO6iiJb2/7VY/nkJzLHKbW22r/cqz4RSpwZec4aCGp1
	QZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xZEGTP/NsS8jKaKUQ6/2Z6o8gwIyQSvAYKKRbuQ5Dug=;
	b=ASUkXrEUGBeI30jgsXJovieuqvxW+6mSC8GNjWX587N7lIt5Om9P4ll/hFUrNQ/5Um
	BbDyyfWSRsQyCU68shQWsVOYd4aim4OvkK50gjYIu924TAWohpJahgNEZK3nDL6lcl2N
	Q/Ibr9NjFm09TpTZnG2E+Vm4uJPoq4zYbbfGAmd9fyu5DvMsa7+Gp5KqUQTKLUgM+4W9
	6mFAsfoB2LSQNnavAzRiacnSS0L/MHsKBizo5NUHNQSGjDYNJEZXwDFbiySytN4wVVPx
	3M/lcV4xRbJUUBJlztfahHtkjQLGI/qs736w7SrjG0yq0hSn6ujSRJPPOrH5I581KhUv
	6m1w==
X-Gm-Message-State: APjAAAVR3lSCzWRO/8rrFREjpEsqUt3vTH/tnumxuuP/RmT18LRDCjTa
	mrJ76GpzbfX+KRK7tX/SV7Ys0Qkz
X-Google-Smtp-Source: APXvYqzxZkoDJqKvRmbpPYYfrBnHyQPWoqJjo7Ly/nacFM2f+IkBXdWrfQRuuO4ivxQElMLnUDcGZA==
X-Received: by 2002:a2e:7a04:: with SMTP id v4mr2215379ljc.237.1568812655120; 
	Wed, 18 Sep 2019 06:17:35 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.37])
	by smtp.gmail.com with ESMTPSA id u10sm999466lfk.34.2019.09.18.06.17.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 06:17:34 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 16:12:46 +0300
Message-Id: <20190918131247.26488-6-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918131247.26488-1-dbaryshkov@gmail.com>
References: <20190918131247.26488-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 6/7] systemd-boot.bbclass: switch to image-uefi.conf
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
X-List-Received-Date: Wed, 18 Sep 2019 13:17:35 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use variables from image-uefi.conf instead of hardcoding them in the class.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/classes/systemd-boot.bbclass | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index 3cd6811a6ce1..bb3221dacca8 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -11,28 +11,21 @@
 
 do_bootimg[depends] += "${MLPREFIX}systemd-boot:do_deploy"
 
-EFIDIR = "/EFI/BOOT"
+require conf/image-uefi.conf
 # Need UUID utility code.
 inherit fs-uuid
 
 efi_populate() {
         DEST=$1
 
-        EFI_IMAGE="systemd-bootia32.efi"
-        DEST_EFI_IMAGE="bootia32.efi"
-        if [ "${TARGET_ARCH}" = "x86_64" ]; then
-            EFI_IMAGE="systemd-bootx64.efi"
-            DEST_EFI_IMAGE="bootx64.efi"
-        fi
-
         install -d ${DEST}${EFIDIR}
         # systemd-boot requires these paths for configuration files
         # they are not customizable so no point in new vars
         install -d ${DEST}/loader
         install -d ${DEST}/loader/entries
-        install -m 0644 ${DEPLOY_DIR_IMAGE}/${EFI_IMAGE} ${DEST}${EFIDIR}/${DEST_EFI_IMAGE}
+        install -m 0644 ${DEPLOY_DIR_IMAGE}/systemd-${EFI_BOOT_IMAGE} ${DEST}${EFIDIR}/${EFI_BOOT_IMAGE}
         EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-        printf 'fs0:%s\%s\n' "$EFIPATH" "$DEST_EFI_IMAGE" >${DEST}/startup.nsh
+        printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${DEST}/startup.nsh
         install -m 0644 ${SYSTEMD_BOOT_CFG} ${DEST}/loader/loader.conf
         for i in ${SYSTEMD_BOOT_ENTRIES}; do
             install -m 0644 ${i} ${DEST}/loader/entries
@@ -47,7 +40,7 @@ efi_iso_populate() {
         cp -r $iso_dir/loader ${EFIIMGDIR}
         cp $iso_dir/${KERNEL_IMAGETYPE} ${EFIIMGDIR}
         EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-        echo "fs0:${EFIPATH}\\${DEST_EFI_IMAGE}" > ${EFIIMGDIR}/startup.nsh
+        echo "fs0:${EFIPATH}\\${EFI_BOOT_IMAGE}" > ${EFIIMGDIR}/startup.nsh
         if [ -f "$iso_dir/initrd" ] ; then
             cp $iso_dir/initrd ${EFIIMGDIR}
         fi
-- 
2.23.0


