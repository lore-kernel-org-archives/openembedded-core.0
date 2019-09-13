Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	by mail.openembedded.org (Postfix) with ESMTP id E53F27ECB5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 15:44:49 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id q22so22971193ljj.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 08:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RUFPcJmp8ccwRu6qRBrmSOLkxhXWWdzMIogjj+xR6Qw=;
	b=reHxGHKQyqzJFMDIdXpc0ZFOYmWQB9VxWMAMoLJ0FgmqXWwLj4nf0wqpk8GS2BRH63
	bx51Prt+98hVpB7QofT+jHNhcsBuhim3Ork5k92guIINJGrUkvyJgUbbtGS7JPlqoMBn
	nvbUCP50AJJeN59e6PxY3Z+uZx2h0rQo/whuoXMwwmBqPVjQidxkgyKHZcWSLd5ej4Hg
	wzPzlH/6lYS3p3ACjPTk/nWUtZnuUpTm13WZd58l+wJQ81if+qTieDDAZBeI/XZJx7hY
	Rh3kh97M4PXCDhva6ZITkC/FO/iUt1tXM0sP/iPjb2ay5V+SMzVuAPn4tLDayCln7uBI
	VpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RUFPcJmp8ccwRu6qRBrmSOLkxhXWWdzMIogjj+xR6Qw=;
	b=Z2SNk8QZY0OarPyEBRRogUMsQJ+ZFPwAjp4rzVuStgyWGLi4GzwMpR/NzL7SDy0n1k
	q03BR7wsTbnnElUxj5pdS9xe3PBybyguTdwA2eMbyYaay2TSYRpOckFxkQZqDVT2PAek
	hY0F8fm1atmdd7cBsKbc24vG9+rL2LEWsy3kB/2c6dPRKIIPglsWYLeq9pbu0AvGAEpK
	o3YwhXzvlV1ghCptfPYIqytjfbRnxrarUGYmrxlMiczDOHLMSfbz/FZh2CTkAs9LuW90
	ZTPl1AYEe2RQ90aqj9C7ypSHSWiqW6bWKxqB/NfExV2YDRp6bABwj+IEDEjnJPDRZi8R
	GSXA==
X-Gm-Message-State: APjAAAUSf0wGWarKk0bY5hvP14SCWva74s9HLF6Voew7j6u0gnera4Zy
	0QhMPEwqMzZi/XRRqyX9iuzEklNo
X-Google-Smtp-Source: APXvYqzBxdqxpgfl4WLGW419uxiyysBe9kSymmra6Ozv0eAAS7BbN8OgOe34wUZLd0O1FeSoU3moKA==
X-Received: by 2002:a2e:8114:: with SMTP id d20mr4538833ljg.200.1568389489983; 
	Fri, 13 Sep 2019 08:44:49 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.196])
	by smtp.gmail.com with ESMTPSA id
	t1sm6297169lji.101.2019.09.13.08.44.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 08:44:49 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 18:44:30 +0300
Message-Id: <20190913154434.29908-5-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913154434.29908-1-dbaryshkov@gmail.com>
References: <20190913154434.29908-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v2 5/9] systemd-boot: switch to uefi.bbclass
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
X-List-Received-Date: Fri, 13 Sep 2019 15:44:50 -0000
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


