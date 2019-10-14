Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by mail.openembedded.org (Postfix) with ESMTP id 691E46D545
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 21:50:21 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id w6so12858665lfl.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 14:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=13K0rru4jMjV06tnNXaTgCGNFrWt40jYa5F5jrP5tFI=;
	b=h7BOvSoOqjwInr6Xm3eSrA3dXVcM900+AVe6aVYWShwYKcJJo/+J/6yUhTPmttfoEK
	LpYRlo715Jn6B6cZKD7IoeE/S0LsTlbqhnhTPJyNeIcPGUNy4ivvYKLWfAy4he9GbIDz
	aUNj8oi2wXqc2rPtjG3OtG/xyGE9saAmSQTB6j9TM21DGdtrrTCoCIvlpPwZqJO1YogJ
	61lpgy+Y7LWJes8xRteVFqdJRWaDljB5+1D72BpqkU4t7vQZoJqyv0jRwRNeuL5hYwle
	fGoacSACCdNSVlIv8w3xKYPDAOZ7kmIT2LP2hAjVMnBHzRgferuGhJG/B3gD4PY6dUE8
	Igxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=13K0rru4jMjV06tnNXaTgCGNFrWt40jYa5F5jrP5tFI=;
	b=idggb+7n4Xa4/KlGkZ5GxpJVN075m+WsWg9dNf64xxAw6G4Zq0hPvfCUcqDkJtqUsd
	hyrigFOc5N7jjv9K+R+DHZlJrUhf89qR0gT0zYWHfmlqGz/NHEhZf+CLVsnHk8uThcaT
	FXLuFYQtucXSxvYagP/z1m5haFCivv8tJ6PIUsk/KtZcWQb6Zqnnm4rWwfXhfMQ5VtQG
	e4S44R72OV1LlcGHQTOf4uymQnAZxVqi+mLMR3yICc8NN1z6siwT6tjG3EK0JdUJQCS2
	4lbsOpUXOJL9HibuHfEqm65kovrHUuAaYtG53QoN45UoVkn7nH6od6A8Oh6q4L7Qoa4U
	9nBA==
X-Gm-Message-State: APjAAAUFxKde6maOdxqYiehB9AE6tcvkdhSd6uljaTb/v82IAHg25y4i
	U56ec4fsUN1CBn/roAr+dkDc/920alQ=
X-Google-Smtp-Source: APXvYqylzfaWIMK+69p1/xtHCopTMe/Z7iEshK8NUvK7EqH95/4OP8Uxvd588pc0wEfJ2PjdfwfPPA==
X-Received: by 2002:ac2:495c:: with SMTP id o28mr10142017lfi.114.1571089821398;
	Mon, 14 Oct 2019 14:50:21 -0700 (PDT)
Received: from localhost.localdomain ([188.162.65.242])
	by smtp.gmail.com with ESMTPSA id c3sm4418076lfi.32.2019.10.14.14.50.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Oct 2019 14:50:20 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2019 00:50:10 +0300
Message-Id: <20191014215014.9656-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 1/5] conf/image-uefi: fix building images for multilib case
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
X-List-Received-Date: Mon, 14 Oct 2019 21:50:21 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Building live images for lib32-core-minimal-image will fail because
image target override won't match grub's override. Fix this by
introducing anonymous python function. A proper fix should be to
introduce multilib overrides, but it will be more intrusive.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/conf/image-uefi.conf | 11 +++++------
 meta/conf/image-uefi.inc  | 23 +++++++++++++++++++++++
 2 files changed, 28 insertions(+), 6 deletions(-)
 create mode 100644 meta/conf/image-uefi.inc

diff --git a/meta/conf/image-uefi.conf b/meta/conf/image-uefi.conf
index aaeff12ccb80..57fd18f02742 100644
--- a/meta/conf/image-uefi.conf
+++ b/meta/conf/image-uefi.conf
@@ -8,9 +8,8 @@ EFI_PREFIX ?= "/boot"
 # Location inside rootfs.
 EFI_FILES_PATH = "${EFI_PREFIX}${EFIDIR}"
 
-# Determine name of bootloader image
-EFI_BOOT_IMAGE ?= "bootINVALID.efi"
-EFI_BOOT_IMAGE_x86-64 = "bootx64.efi"
-EFI_BOOT_IMAGE_x86 = "bootia32.efi"
-EFI_BOOT_IMAGE_aarch64 = "bootaa64.efi"
-EFI_BOOT_IMAGE_arm = "bootarm.efi"
+# Parsing python anonymous functions in .conf files does not work, so move it
+# to .inc file
+require conf/image-uefi.inc
+
+EFI_BOOT_IMAGE ?= "boot${EFI_ARCH}.efi"
diff --git a/meta/conf/image-uefi.inc b/meta/conf/image-uefi.inc
new file mode 100644
index 000000000000..94c5813494cb
--- /dev/null
+++ b/meta/conf/image-uefi.inc
@@ -0,0 +1,23 @@
+# Determine name of bootloader image
+python () {
+    import re
+    if d.getVar("MLPREFIX") != "":
+        target = d.getVar("TARGET_ARCH_MULTILIB_ORIGINAL")
+    else:
+        target = d.getVar("TARGET_ARCH")
+
+    if target == "x86_64":
+        arch = "x64"
+    elif re.match('i.86', target):
+        arch = "ia32"
+    elif re.match('aarch64', target):
+        arch = "aa64"
+    elif re.match('arm', target):
+        arch = "arm"
+    else:
+        raise bb.parse.SkipRecipe("image-uefi is incompatible with target %s" % target)
+
+    d.setVar("EFI_ARCH", arch)
+}
+
+
-- 
2.23.0


