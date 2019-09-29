Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id B8B876C129
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 20:14:02 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id y3so7276076ljj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 13:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Lmbiie1+UAp5fYzNBPWdWceTvHs3qMHLNmJmFkC6n3Q=;
	b=gz3wvrHh3pxDLumQ2EH2HD+EnnMY4yGJrjuqUAVv0PDzy6YnpWnQpF9lSuVhDXH0HY
	Ukg2TNCTGOAh+HwA4Dkm982HWADj7IeY49C38mhRrGVv75x8c7iuSw9yYh2fzhEPsgCP
	BKGXkUpbjRYFH50CUAaPuWVD5FhX3bPfMxay231b2NtmTHeDZq1/+M5Krpsddunw8Q2+
	OXkPow/AOxJSKfVwc7NE5W/U353RZpg3nuP6YPimWlr7ZLOgZM8uPebYxrIa7eFZmerg
	9lJK4C/D9HJAtb1zSsb4MOOlozCkmgSh9knaVh1PlqeCwAgZRwNpLSuRzRkFUp1SG6+S
	t5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Lmbiie1+UAp5fYzNBPWdWceTvHs3qMHLNmJmFkC6n3Q=;
	b=qo3n7L/B3yE2hzLqmmFEiz5y1FG13GcrtEG71oTZvRC5YXZtMndt3pzYDrWUbvapT4
	td/DrXTLC760mMIlyIYvy5SngAT+RCuShsQW7oFernUeVWm4iNIRpUCjrXPVj7CfiWQG
	tfXBqj0T5mKIWUTpY7t1gsdt+syhO6j/zpuQyRueatjylV50iMo8e3otexI8gy5Tl8Yx
	D2fkSw3EP1MagCF/6QQ8P5xrJPYJivhsd4CUNs3bsn78EhdEtb5rMMvK86n9OSzxraOy
	4SCCiw7alYmnBUuciuUtCcm+UAqnIedme2i9D5Lz2vrwzdJIVctx0awbjNrUUYOZ3sWW
	mUbw==
X-Gm-Message-State: APjAAAXve2rWTJfEnPLiKlh7MdEg9UKRgL+MU/EGpm4QOelxucpOFOuf
	f0C2D8p54sAwfBdVOla5+MgbcSZs
X-Google-Smtp-Source: APXvYqxwysYfJuE1wFEiHzDTWGq1kZNx5l3rUyalESbBwrVUWae0wfgvswKosfkfYaS7FUzZm+eOgQ==
X-Received: by 2002:a2e:9d4a:: with SMTP id y10mr9522908ljj.181.1569788043041; 
	Sun, 29 Sep 2019 13:14:03 -0700 (PDT)
Received: from localhost.localdomain ([94.25.228.87])
	by smtp.gmail.com with ESMTPSA id
	w77sm2414685lff.49.2019.09.29.13.14.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Sep 2019 13:14:02 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 23:13:56 +0300
Message-Id: <20190929201359.9837-2-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190929201359.9837-1-dbaryshkov@gmail.com>
References: <20190929201359.9837-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v2 2/5] systemd-boot: replace anonymous function with static configuration
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
X-List-Received-Date: Sun, 29 Sep 2019 20:14:04 -0000
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


