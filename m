Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id B423B6C1C3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 14:24:17 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id q64so12455006ljb.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=13K0rru4jMjV06tnNXaTgCGNFrWt40jYa5F5jrP5tFI=;
	b=DBlNsi6+WIwJ3ado42acCdusDGoq7ZWURATM5pPGi1KYhWAi23pMVmvkYOs/fX1r8C
	Opu6UbRzOvDqXkBOkxuY+LlG2r1r0hT1BqDeZNUzzSjdPCmBBtNtLFWDiCAEgQlBDqpT
	FAu6DkuIT6pxDuhmEOUcPTHWzmj6KN/FqvYws0DKMbmQTIeVBjQAc8s7f9xjkAZ1LujR
	s8V3s57O7AlpgJ1ypE/yscM8z0GByDpTVWJ9yOam92yhzoajTalHEoslzwkKQE4Rr7j6
	NIX39k0S4gaLhfUb3Z4ytCWJ062tIuQfBiVCfUS7yfV0LCWbf65aK2d7Ow+vLt7QGM7s
	ECnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=13K0rru4jMjV06tnNXaTgCGNFrWt40jYa5F5jrP5tFI=;
	b=PjU+Z2ZVws5aZSuRV5NxRN6hFsJhCuqQ1477aZKRWvwVhP5Fly9Tw4ZRxm+ThoTOPP
	rOmqTXHo0O820QIIkBJ7q63UTgxHHs8smhlTlDo3qnwY8otVwiDeHrYSDfiGiXejz55Y
	lJUkNGIPh+gud9y0GEazb38zNSOQSJLWxvz1usd8K8UPaNSVZrLQHIYMuw/9BKR9Rvqs
	hAR/cZNUjzPh692gsRRUlrrgh5RznSD4YqHrRIs2kYMAoay0BwDTNYUQT5Gg4dHUq/V0
	CV71v/URkgHnqMz3uiuJoagu82AkiI/3bI+HT+JqxcaUE+e23jmuouTtDrRiM3Bfr3X3
	Bu9Q==
X-Gm-Message-State: APjAAAVDOpnYhgSbpuwT5fXQ4EZ4yHJvqNbAI5vnUPfDnXC2iQN63u+a
	wRSCV8xU1po/XAhD8EAka5FUyGgdtis=
X-Google-Smtp-Source: APXvYqxai7hXpLOJpQqlFvBkAGLk8iPu74z8U12uvlT5hdhn/CrcQ3wcfoK0m5tsDCm7av1tWw73iQ==
X-Received: by 2002:a2e:82cd:: with SMTP id n13mr12096115ljh.2.1570890257593; 
	Sat, 12 Oct 2019 07:24:17 -0700 (PDT)
Received: from localhost.localdomain ([94.25.228.225])
	by smtp.gmail.com with ESMTPSA id
	c197sm2797357lfg.46.2019.10.12.07.24.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Oct 2019 07:24:16 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Oct 2019 17:24:14 +0300
Message-Id: <20191012142414.26283-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH] conf/image-uefi: fix building images for multilib case
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
X-List-Received-Date: Sat, 12 Oct 2019 14:24:18 -0000
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


