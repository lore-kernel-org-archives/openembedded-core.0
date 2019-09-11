Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by mail.openembedded.org (Postfix) with ESMTP id C69447F2A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 09:30:09 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id y5so8482145lji.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 02:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RUFPcJmp8ccwRu6qRBrmSOLkxhXWWdzMIogjj+xR6Qw=;
	b=lys5L+m0AnK4k/0gfqcqR9PbiFG0RmJWTboJkZZjbdd2u59WOmwXas5oXvVtc6W9jk
	Dxb8if2T4/GGjVuDQKKOy8mPmpzQFeqgoWi22DATkxUi9/MsXURPtX4o7ux36IojUis3
	LNyDjX6fsXuUfHnYoEG8QJ7DSlkD7B470+TSgjZ7HfhYIvmsneA+tlqJGS053J3HHvrp
	H9SxnGpy0vHPjdgdkaJnhvj94vvuXzo+z6P5i4nbm5JLcqMvTVR0ZbliQuqsUVqDNiS7
	NPWURfzxisTDoejZ+ZQeZcvIMmVFOHdwtDKBGyyG0WgwhulBTSkkHCWuoUuFgLpuMk4O
	Jmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RUFPcJmp8ccwRu6qRBrmSOLkxhXWWdzMIogjj+xR6Qw=;
	b=s0SBa/55XTvn7HlzoNJB4NuuH9Y5erM7YjwreSwQMI/vE/kDVr9cQy3pMxT6AM7D2Y
	bDfybUytmaVISBUainDft94yKlvOeyMac6Y8ViVPmZGqMOFNq1MKgNsochUfiSUFIeg0
	wHjNqdn2I8oqh6b0rEkJVgwmEn6oql1+TtHsvqQLqy8ZxZIJxNkAHXYJU2JwxkfzPT9M
	SezU+eqiFTylPvKEPfFkbE8GniuVebMCZUI9nzpG44t9RytsLCr4XY8/VCzgVc2i15WF
	p50MrgoxYodg54B8ejE9XRlTrgsgh5OBh6ESeWhJqtcVwispCtQAwIYLG6EUtArx+He0
	vxQA==
X-Gm-Message-State: APjAAAUcdczaVypi/CDXmnUhsYBU0ORlw6xw5lpeWs7Ah2M9vNADOFPj
	3BV0Yf4oDMwItSxDl9jtzyR/esz8
X-Google-Smtp-Source: APXvYqyl5Zdg6aLXJ9mLbXI7NW6R71sXGVKgvXNZtfDz3XkL/yWK1EFsV3Q4yyXX4MjEtqgNx9NJbg==
X-Received: by 2002:a2e:3a0e:: with SMTP id h14mr1877439lja.161.1568194209912; 
	Wed, 11 Sep 2019 02:30:09 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.24])
	by smtp.gmail.com with ESMTPSA id
	t1sm4509306lji.101.2019.09.11.02.30.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 02:30:09 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2019 12:29:57 +0300
Message-Id: <20190911093001.7849-5-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190911093001.7849-1-dbaryshkov@gmail.com>
References: <20190911093001.7849-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH 5/9] systemd-boot: switch to uefi.bbclass
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
X-List-Received-Date: Wed, 11 Sep 2019 09:30:10 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use variables from uefi.bbclass instead of hardcoding them in the recipe.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/recipes-core/systemd/systemd-boot_242.bb | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_242.bb b/meta/recipes-core/systemd/systemd-boot_242.bb
index 56a25c35babc..3cb05db345ff 100644
--- a/meta/recipes-core/systemd/systemd-boot_242.bb
+++ b/meta/recipes-core/systemd/systemd-boot_242.bb
@@ -1,6 +1,8 @@
 require systemd.inc
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
 
+inherit uefi
+
 DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
 
 # NOTE: These three patches are in theory not needed, but we haven't
@@ -33,16 +35,13 @@ python __anonymous () {
     import re
     target = d.getVar('TARGET_ARCH')
     prefix = "" if d.getVar('EFI_PROVIDER') == "systemd-boot" else "systemd-"
-    if target == "x86_64":
-        systemdimage = prefix + "bootx64.efi"
-    else:
-        systemdimage = prefix + "bootia32.efi"
+    systemdimage = prefix + d.getVar("EFI_BOOT_IMAGE")
     d.setVar("SYSTEMD_BOOT_IMAGE", systemdimage)
     prefix = "systemd-" if prefix == "" else ""
     d.setVar("SYSTEMD_BOOT_IMAGE_PREFIX", prefix)
 }
 
-FILES_${PN} = "/boot/EFI/BOOT/${SYSTEMD_BOOT_IMAGE}"
+FILES_${PN} = "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}"
 
 RDEPENDS_${PN} += "virtual/systemd-bootconf"
 
@@ -61,10 +60,8 @@ do_compile() {
 }
 
 do_install() {
-	install -d ${D}/boot
-	install -d ${D}/boot/EFI
-	install -d ${D}/boot/EFI/BOOT
-	install ${B}/src/boot/efi/systemd-boot*.efi ${D}/boot/EFI/BOOT/${SYSTEMD_BOOT_IMAGE}
+	install -d ${D}${EFI_FILES_PATH}
+	install ${B}/src/boot/efi/systemd-boot*.efi ${D}${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}
 }
 
 do_deploy () {
-- 
2.23.0


