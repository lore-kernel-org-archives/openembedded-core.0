Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0532E7F168
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 15:45:05 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id r22so11194812lfm.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4SkxER/J7UGejTzVJV339JhcfBwyk1JdmeHmuvQ0DVA=;
	b=J3zAyYCdsiCvNUb1SOJp9wso5AV+UoDcTJ6nYwUelYiKy0ng8HwsIdwGOI23nGHe2t
	5f2kClDc1XKs2DjgLIHFrCv5zMGYb1glrjDmnzkHNspvihv1MkPh1InV1vuvk5xYtZsw
	gDx6w+pkK35v29gLzwFkoREXtxXCtNUYQ6DHBJ0Xtu4x+kD+ygIhkiLX52yj3UsV3xK4
	f6cgvwwi2tTFVKFiIvgN+O0KrRqMIXxNMvI5iJtAznQDIKeG4CjPZVSQsJENtaCvd1m6
	WKQAH7104s0+fKUPdWh9pxj+8FP2N4eQga9m6lSft5160AtQYRylWrBPq/iU83Rdnm01
	61dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4SkxER/J7UGejTzVJV339JhcfBwyk1JdmeHmuvQ0DVA=;
	b=hd/mQW6kerFNWduMbPdpv8DFAM0+HOnhWfabIn+4EcQvUUcOtBZ5L8AXbFF+Y0lfKY
	K9OeF32hp4h1HM18UDtsd6Mq8/hSapHnkyvOu9ID9HJHryVC7t9pXUPtzM55gVd9608T
	7iLqKrPQhi4sGTYeN9SHQQ0pcR7zFqwevn99ErXbtzwmriBCwOj7g/jAhOqc6VgQH9GQ
	LPE7RUlaKbp9huxNVdU/vy77iUzJa2CWz7y3HZfLoeTs3AEJsy4pI9SX7ZNbsu+wEgqQ
	mtV1qgoyVI3fN+NJ0F0Fcta/0VuGXXDZJUKo48PSciUQjdYTziioXtoTu8Zfug9XLxUP
	6s9A==
X-Gm-Message-State: APjAAAWvWCCc5bO0pk++6PTvq3Nwunc2XEmfSgCCzyUcdZj1H4CGqpx/
	hbQbKDi63nUX1u5hxlocWonvK27L
X-Google-Smtp-Source: APXvYqyM5kbHzajJ3uDfvh5UKHC66tGc5vi+rAEfBisdupNAr38t/Ksxb6doUvBqNoia6cdQUboe0w==
X-Received: by 2002:a19:495b:: with SMTP id l27mr15359619lfj.45.1568389505973; 
	Fri, 13 Sep 2019 08:45:05 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.196])
	by smtp.gmail.com with ESMTPSA id
	t1sm6297169lji.101.2019.09.13.08.45.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 08:45:05 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 18:44:34 +0300
Message-Id: <20190913154434.29908-9-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913154434.29908-1-dbaryshkov@gmail.com>
References: <20190913154434.29908-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v2 9/9] systemd-boot.bbclass: use efi_*_populate_common
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
X-List-Received-Date: Fri, 13 Sep 2019 15:45:06 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use common code form uefi.bbclass to populate efi directories.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/classes/systemd-boot.bbclass | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index ad565414a142..6594a2331f7d 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -16,16 +16,12 @@ inherit uefi
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


