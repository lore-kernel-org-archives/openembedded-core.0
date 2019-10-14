Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4B6A67F27C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 21:50:25 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v24so18088695ljj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 14:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=yZBYuNxhD8dJX8r64WF6vJ/EWXJ5tTffy1D/z+kqdFU=;
	b=g2/olwVA1AQiTMuYlBHGDN8L5uLrynd85REx8UdGVPhhD0Y0AP4EtimBHE7hRuRbVY
	YBK3f6tHpOIdCwBwFimVs1TK3Ud1FW0dFK1J+9cGn36UOUxNf89z8/oTR5uiL3nRy4sO
	F7VsdunMGxxiG91bPeHhIblbV0wAU0AjS7IrlLArGIoIL6yz6XDf0tjNRaHqewcQYt1z
	0ft4N8Q/i3fxhmviAIi/bS7Y1GdopqBpJRGGRpHGUW8FIfpxjgGW8KaRSkWxa7rU6Lyn
	M3lSXyTkJBzx6j/PCwyBsykzvvYzHuGrqxykRwW03P/ux2UCsR5QUgOFYMpGxDiWMiye
	CHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yZBYuNxhD8dJX8r64WF6vJ/EWXJ5tTffy1D/z+kqdFU=;
	b=k4QYK7MdwXz+JT1N+3jFPea0mtEkidwCsJvRkic6EwlYL7V/b7OmSxlqMTU1dJFEd3
	R8vw0Nx3h4qZsv2ezwS3hPQeI2i9A7hGsJcAJdhvg55uoqbq2bESROHRcwwJfyBTyN9s
	wI48iXMvZgGF1BOXNYAeIt2P1pFcIhYk1rG4QgMrOUHvl9UwVNiGcAHDmgYPlDkjsNDv
	GKmN/KL2/awcGK2sJvISCyf8dKHCvDUtNQnvUZHXhsRalgiQTGKH27w2yx6Ucu2fwVNu
	adxNH5PZ+jVDWUoSDzBE9aT14l2NQD3l7J61YEMVCJM5k3ULoX5EJBrAczKbLlc7a8nV
	ughQ==
X-Gm-Message-State: APjAAAWRQbjB7NS2bgQ3FOZ2CS3xlqNf05QVXPvjKmxxjMWWTF0hOqgE
	gLCwCoGByC92LhXRBJkeIEG0a70i8QA=
X-Google-Smtp-Source: APXvYqxkm9gZ9aYxgp76cqM9r6qASB19JjFGdZx8akJc+FMcjEFhYROzAqeB/S+orUyAIocoebMXWg==
X-Received: by 2002:a2e:7312:: with SMTP id o18mr20144650ljc.216.1571089825543;
	Mon, 14 Oct 2019 14:50:25 -0700 (PDT)
Received: from localhost.localdomain ([188.162.65.242])
	by smtp.gmail.com with ESMTPSA id c3sm4418076lfi.32.2019.10.14.14.50.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Oct 2019 14:50:24 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2019 00:50:13 +0300
Message-Id: <20191014215014.9656-4-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014215014.9656-1-dbaryshkov@gmail.com>
References: <20191014215014.9656-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 4/5] systemd-boot: replace anonymous function with static configuration
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
X-List-Received-Date: Mon, 14 Oct 2019 21:50:25 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Replace anonymous function setting GRUB_* variables with static
configuration, since systemd-boot.bbclass will use fixed names for
systemd bootloader.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/recipes-core/systemd/systemd-boot_243.bb | 23 +++++++------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_243.bb b/meta/recipes-core/systemd/systemd-boot_243.bb
index 515abc289bef..5d07177a335c 100644
--- a/meta/recipes-core/systemd/systemd-boot_243.bb
+++ b/meta/recipes-core/systemd/systemd-boot_243.bb
@@ -28,20 +28,9 @@ EXTRA_OEMESON += "-Defi=true \
                   -Defi-objcopy='${OBJCOPY}' \
                   "
 
-# install to the image as boot*.efi if its the EFI_PROVIDER,
-# otherwise install as the full name.
-# This allows multiple bootloaders to coexist in a single image.
-python __anonymous () {
-    import re
-    target = d.getVar('TARGET_ARCH')
-    prefix = "" if d.getVar('EFI_PROVIDER') == "systemd-boot" else "systemd-"
-    systemdimage = prefix + d.getVar("EFI_BOOT_IMAGE")
-    d.setVar("SYSTEMD_BOOT_IMAGE", systemdimage)
-    prefix = "systemd-" if prefix == "" else ""
-    d.setVar("SYSTEMD_BOOT_IMAGE_PREFIX", prefix)
-}
+SYSTEMD_BOOT_IMAGE = "systemd-${EFI_BOOT_IMAGE}"
 
-FILES_${PN} = "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}"
+FILES_${PN} = "${EFI_FILES_PATH}"
 
 RDEPENDS_${PN} += "virtual/systemd-bootconf"
 
@@ -56,12 +45,16 @@ do_compile() {
 		SYSTEMD_BOOT_EFI_ARCH="x64"
 	fi
 
-	ninja src/boot/efi/${SYSTEMD_BOOT_IMAGE_PREFIX}${SYSTEMD_BOOT_IMAGE}
+	ninja src/boot/efi/${SYSTEMD_BOOT_IMAGE}
 }
 
 do_install() {
 	install -d ${D}${EFI_FILES_PATH}
-	install ${B}/src/boot/efi/systemd-boot*.efi ${D}${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}
+	if [ "${EFI_PROVIDER}" = "${BPN}" ] ; then
+		install ${B}/src/boot/efi/systemd-boot*.efi ${D}${EFI_FILES_PATH}/${EFI_BOOT_IMAGE}
+	else
+		install ${B}/src/boot/efi/systemd-boot*.efi ${D}${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}
+	fi
 }
 
 do_deploy () {
-- 
2.23.0


