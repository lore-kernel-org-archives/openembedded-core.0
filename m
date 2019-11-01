Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by mail.openembedded.org (Postfix) with ESMTP id E21B27FC09
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 14:32:06 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id y6so7396043lfj.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2019 07:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=13K0rru4jMjV06tnNXaTgCGNFrWt40jYa5F5jrP5tFI=;
	b=b3SasE/YvBjRSdnHggzQTUuE6RRfBLZrhzg3ohX8RMwi9oAJQYHHyusjaWcpogKAlX
	zBsijwfbCYZ6UGAARd0JjynFnsz9XEaPUsLH39Fze0bF9yhhzoBfcDo2Y+3Qym7aYhMU
	ZsGJOnmMXHv6TK9tMbKDzuzOHRFYK8gQShHFxzlDq50UA/uIgEB8wEC9evEce1N8jyLn
	j45TTCktQiU9bJZlwNcQhE8JIgaT/oxr9OJDhZdk9bgOVqcAy73F697AMeMOhDDc+04+
	bRvxaoNLtADEF6TE2Pgm1SfZMO4tsrXRChS8Y1nuP/0RTpo+CDHsJc6+XkWNB8KH+El2
	RIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=13K0rru4jMjV06tnNXaTgCGNFrWt40jYa5F5jrP5tFI=;
	b=HnGehKRRLKUzmOI2Mn9Pz9la2gKzlnpUPDp7JTF3Ig1eph7DXz3vzcNH63c2NVezYv
	rNUbK/riPgPwM5wsalqVPi/YJXArYyPFw9UCb0icOoUC/23C5eOYErUge/84pNuxkEDu
	WQ0YoiIT4eSdOuHqsyfcwYtagZSKuv81WsBKD3AHefcT37E1+tp9uefBwXwXPEKmZSwp
	ChxGgs4GxKGfGGBVYwlxBJFul9EMHwFpLuGBUi+kOYI+f+GJRvESRfhaMrKv8YTmwj70
	DoZKGUtqsXT5qauv3IIK4VmbMkEB3+5Nj5WMob2KTD9Js4Yd8JmrKv90PNjpko0K16o/
	ETuw==
X-Gm-Message-State: APjAAAWC7QtW2lmzzMRDABHUV5uN2JmuM5cvPr6RVWfUkrzOcOOYLzeE
	TmOlSo9SySol+NB5HTIKl7CADmu5HxI=
X-Google-Smtp-Source: APXvYqxUrvb948ZDNrPDRmkpks0LsUN1paYddBQ0EpJUi6XI9csbfRW9JiE7cPo9LLvdnrchIYIqIQ==
X-Received: by 2002:a19:22c4:: with SMTP id i187mr7099745lfi.152.1572618726953;
	Fri, 01 Nov 2019 07:32:06 -0700 (PDT)
Received: from localhost.localdomain ([188.162.65.93])
	by smtp.gmail.com with ESMTPSA id o5sm3626226lfn.78.2019.11.01.07.32.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 01 Nov 2019 07:32:05 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Nov 2019 17:31:47 +0300
Message-Id: <20191101143147.26812-2-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191101143147.26812-1-dbaryshkov@gmail.com>
References: <20191101143147.26812-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH 1/2] conf/image-uefi: fix building images for multilib case
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
X-List-Received-Date: Fri, 01 Nov 2019 14:32:07 -0000
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


