Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5C7AD7F260
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 10:15:29 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id r22so4911823lfm.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 03:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Lmbiie1+UAp5fYzNBPWdWceTvHs3qMHLNmJmFkC6n3Q=;
	b=plIBZ3/dvOz1xrEe2Higyf/vHPJJXp7vHbG/uuW1FcorkIEbilQY9W7STdSfxOeHBL
	BKWbWtwq7xiqdABDr6/xgSQkY8ZeP2tXFK+qg5TG6ql2o5HItS+6niGUlZC9DVlEU2CN
	FlTV0VI/928KnCDMSuKzzJ5D/p8+8NYoVY17YNnDGdIBMd6g3tSgB0gvSe5V+wVZJWhX
	e65EnslCei83i65zcp7EjWWrufbYQg8vZFEQWjiEZCoBDXjXORtObVimnYYDPaJCrseJ
	Exp1k2CJzKiG31Xj6LokH9s0gIY1Z4bNaNOUeMXE2WxRCYdr+BzFYYuRjdFvkXLS6Dpl
	Dv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Lmbiie1+UAp5fYzNBPWdWceTvHs3qMHLNmJmFkC6n3Q=;
	b=EBs14jbpHt3AIxiS4ovRmXwGXyWWJqOZTWvfzrDS26+87imJBgnFx2bMjrqQc8nEzt
	RPWlSSWoQVKlZTNloEjgN48GswHzQV1+7B7Kp1MioabmIp/A7OeQPUeGVTSw1UVq454W
	9FJEmyBGJiIg2k2wTA35tJAvTlaK9RbrMJ8dBH2V/MWAXIrDnJA4zBiWVcbRKJFZmHvY
	VXzuBNFi0XUQJ/WyegdoYWFrmzxOKbpvpirGH6eKTSKIlbR9fNajROFshfk02pDWTRZH
	fbky7h7qKJElC8phWmUx84IcE6byS4bCubIXuYt4h5xlx39jy0pt3ye1W+UOxjwaYO78
	tObQ==
X-Gm-Message-State: APjAAAVECpGQwg0mNJZsItJoUgW86VoVpVLBHCA38W3m59kjGhkMH+f0
	Z7q+MsJRGPhvq8zYULM1h1cnksGd
X-Google-Smtp-Source: APXvYqzoSUppnyzzovDVq5De8yo9G6WMuEOkKhZy2Y6qPFeejiznRbaHvmolm3DjMBXwzdTpcJPBag==
X-Received: by 2002:ac2:4adb:: with SMTP id m27mr8024063lfp.1.1569752129525;
	Sun, 29 Sep 2019 03:15:29 -0700 (PDT)
Received: from localhost.localdomain ([94.25.228.202])
	by smtp.gmail.com with ESMTPSA id
	d28sm2012918lfq.88.2019.09.29.03.15.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Sep 2019 03:15:28 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 13:15:23 +0300
Message-Id: <20190929101526.2061-2-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190929101526.2061-1-dbaryshkov@gmail.com>
References: <20190929101526.2061-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH 2/5] systemd-boot: replace anonymous function with static configuration
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
X-List-Received-Date: Sun, 29 Sep 2019 10:15:29 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Replace anonymous function setting GRUB_* variables with static
configuration, since systemd-boot.bbclass will use fixed names for
systemd bootloader.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/recipes-core/systemd/systemd-boot_243.bb | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_243.bb b/meta/recipes-core/systemd/systemd-boot_243.bb
index 515abc289bef..832532077d07 100644
--- a/meta/recipes-core/systemd/systemd-boot_243.bb
+++ b/meta/recipes-core/systemd/systemd-boot_243.bb
@@ -28,20 +28,19 @@ EXTRA_OEMESON += "-Defi=true \
                   -Defi-objcopy='${OBJCOPY}' \
                   "
 
+SYSTEMD_BOOT_IMAGE = "systemd-${EFI_BOOT_IMAGE}"
+
 # install to the image as boot*.efi if its the EFI_PROVIDER,
 # otherwise install as the full name.
 # This allows multiple bootloaders to coexist in a single image.
 python __anonymous () {
-    import re
-    target = d.getVar('TARGET_ARCH')
-    prefix = "" if d.getVar('EFI_PROVIDER') == "systemd-boot" else "systemd-"
-    systemdimage = prefix + d.getVar("EFI_BOOT_IMAGE")
-    d.setVar("SYSTEMD_BOOT_IMAGE", systemdimage)
-    prefix = "systemd-" if prefix == "" else ""
-    d.setVar("SYSTEMD_BOOT_IMAGE_PREFIX", prefix)
+    if d.getVar('EFI_PROVIDER') == "grub-efi":
+        d.setVar("SYSTEMD_BOOT_EFI_BOOT_IMAGE", d.getVar("EFI_BOOT_IMAGE"))
+    else:
+        d.setVar("SYSTEMD_BOOT_EFI_BOOT_IMAGE", d.getVar("SYSTEMD_BOOT_IMAGE"))
 }
 
-FILES_${PN} = "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}"
+FILES_${PN} = "${EFI_FILES_PATH}/${SYSTEMD_BOOT_EFI_BOOT_IMAGE}"
 
 RDEPENDS_${PN} += "virtual/systemd-bootconf"
 
@@ -56,12 +55,12 @@ do_compile() {
 		SYSTEMD_BOOT_EFI_ARCH="x64"
 	fi
 
-	ninja src/boot/efi/${SYSTEMD_BOOT_IMAGE_PREFIX}${SYSTEMD_BOOT_IMAGE}
+	ninja src/boot/efi/${SYSTEMD_BOOT_IMAGE}
 }
 
 do_install() {
 	install -d ${D}${EFI_FILES_PATH}
-	install ${B}/src/boot/efi/systemd-boot*.efi ${D}${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}
+	install ${B}/src/boot/efi/systemd-boot*.efi ${D}${EFI_FILES_PATH}/${SYSTEMD_BOOT_EFI_BOOT_IMAGE}
 }
 
 do_deploy () {
-- 
2.23.0


