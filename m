Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id DF1F77ED4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 15:44:56 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id q22so22971543ljj.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 08:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9sfdrnlba9m7eOJSRjfZgbbUbppspGVZn1XdiWTIiMw=;
	b=VjyTmcLhLwL5TTamp/keS2V+OyuhNBrJqU+KYxu+TZCv24KFWheaFZ1q2pNVBl0qsT
	R1ZoI2jj70lr0/qDG5sBvAGL2EA0O7VAEhf9N62o4MG08/iVouq3hPv71+UpzsVSPSmD
	4yf4IItdWrhCYAxwcx94bBhczsTkfYxXY9MX6BE9k3xfo6/6MrBWr12Y+NVV+RyXv3DR
	8J2VZRxx9bwyZNi9xVSDk2biOxH/ZWKrBW7ghM1WpSVmMVCuR1w0nrTyNUs08OYfVJmI
	NciOMOgzoGfq4hUR4+0/rU8NNowCgIwch4pNrgNmWlf3H/O1C4pX2BUc4QBw0OZAC6Qy
	q1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9sfdrnlba9m7eOJSRjfZgbbUbppspGVZn1XdiWTIiMw=;
	b=WL81MuMcfleIctujgqa2xNmUv5fQiPp1Hrl7LJAP00W4ANFwcDoptDd2drQ711gxko
	i9ClsJsIcNwFE+yVOvGQVGghosmLDy239PMPHyjfBqsj0KKzp48kZEFbW+vTvDwIMzmM
	+Q0nLP3xxoMvgfOnpnacNTaSPNj9mYkpx49NEQLKreZe+HkDsWg0ZJF072QFaRc0Wik3
	mVZZGm3++FXfPb1u1cND8pHizJEEtPBhmnrkwnRMcGbK0d0rFEB5qPOu+M3lAc3Qo5yj
	eXdqqPqvhM8d+nx4SJwU9N/eRqAHBmZN866KycYoT7AigpwkdfBGlno68vj/hYDt/FHn
	ytYA==
X-Gm-Message-State: APjAAAUzkG2xvisxjnCMe4NgzqNVivkkwfsWHz77SMHgxeisMAeufaVo
	5TlcMECjSFwNGNQyzLdovpcbJQmm
X-Google-Smtp-Source: APXvYqy5w0vpwJ0YWf6C3g7gbgrnaEUfBM3Eioj3I0o7aJZLunyIhMerec6RNIfoU7QyY/Ri8LQFDw==
X-Received: by 2002:a2e:b4ef:: with SMTP id s15mr5311916ljm.211.1568389497032; 
	Fri, 13 Sep 2019 08:44:57 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.196])
	by smtp.gmail.com with ESMTPSA id
	t1sm6297169lji.101.2019.09.13.08.44.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 08:44:56 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 18:44:31 +0300
Message-Id: <20190913154434.29908-6-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913154434.29908-1-dbaryshkov@gmail.com>
References: <20190913154434.29908-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v2 6/9] systemd-boot.bbclass: switch to uefi.bbclass
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
X-List-Received-Date: Fri, 13 Sep 2019 15:44:57 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use variables from uefi.bbclass instead of hardcoding them in the class.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/classes/systemd-boot.bbclass | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index 3cd6811a6ce1..ad565414a142 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -11,28 +11,21 @@
 
 do_bootimg[depends] += "${MLPREFIX}systemd-boot:do_deploy"
 
-EFIDIR = "/EFI/BOOT"
+inherit uefi
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


