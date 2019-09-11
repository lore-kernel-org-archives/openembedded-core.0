Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 187FB7F2E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 09:30:10 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id y23so19281130lje.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 02:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9sfdrnlba9m7eOJSRjfZgbbUbppspGVZn1XdiWTIiMw=;
	b=kJCxfyUiDQK9mu6WpEsTboFdBp4JRIUNGQmIRjl+sjDjQpOI49wP6lIrnpgS11M/V9
	s0HOMPdEioYV/HMpVxHw56clAnghjLu9/MApFygLkKn2WI6fiOas/X/BGk1fFqjA0yBg
	apl+WIzBaHDMztJbgT+VszqcQ9M0Rr5gPH/zIn7OXdW9Z3IoNEAP+Js5N/fIf5I1Cs3X
	JVrfZA9JFWukl8mRd4tqwYqLCFOkbJHD6BL78H8mLhGFq2MQDMMRNjkg8IhZUS81F71l
	VWzzUtS8d62+14vv6morCuq9oU7djLGGQyy5c+zn7vmIp0Sa72L75EbpzRU0Yrxow7Je
	k1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9sfdrnlba9m7eOJSRjfZgbbUbppspGVZn1XdiWTIiMw=;
	b=inhHMRcj9plDa9XB09ErTzakyoYuvZvUjl9IN9sdr+gT1v4FHbmjBiRcGqFpNBYogv
	GaL0F/S1drobaJiCd4mIRRjNgIxtj48ykm7yOni5oWJUkwsR2MYdYdwcAD2BKp+6rAaD
	vgus1dX7bdppqUp90uZ2XwB+DE1cZeiD7q+hEmLzLwOjym46JdhCiW/ZLeYHn3IbL/lh
	42nxK0SzIBpWOOTSw9/6FBKlyOwM7D//t1Q0oPfzJGSm4TZftGNLKNyZ/jYkToXmYURM
	5OeeOVlmOMnSdDY7A0IsXBJYhjRV+8wcoAk6bqkvgJ+VO9NeS9oXNQi/qrTs50JOq7G6
	IY5w==
X-Gm-Message-State: APjAAAUYew+p8KNd/Op2CASA7gLCP/z97vzgnJ5L0X4z6hyUFzdqLCua
	7vq7Re0DbfQGgQx4XKGM3J2wgxxi
X-Google-Smtp-Source: APXvYqz3vxEIsbwaE4UQaDjHttAy80EU3IxwmxEIX96iuD2+Q5PozUjnDAKAk5kEuZd0UVZjsnTWjA==
X-Received: by 2002:a2e:87d6:: with SMTP id v22mr21152780ljj.195.1568194211156;
	Wed, 11 Sep 2019 02:30:11 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.24])
	by smtp.gmail.com with ESMTPSA id
	t1sm4509306lji.101.2019.09.11.02.30.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 02:30:10 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2019 12:29:58 +0300
Message-Id: <20190911093001.7849-6-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190911093001.7849-1-dbaryshkov@gmail.com>
References: <20190911093001.7849-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH 6/9] systemd-boot.bbclass: switch to uefi.bbclass
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
X-List-Received-Date: Wed, 11 Sep 2019 09:30:11 -0000
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


