Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	by mail.openembedded.org (Postfix) with ESMTP id D864F6C106
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 15:44:37 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id r22so11193620lfm.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 08:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5Jc9HVRDKMlI2zOHsZg/RzLAaaLCjnNqBg3P7lDKS/c=;
	b=KdSZToTFdpp+P0lv7pvl4kkKbsnYhmsVTmN7heureeoUtJr6VhJa6tbFTOQjpJANPF
	PY6KNqSAIYjJBduwu/zgIIgHzr6gMoeaPR0i/uBBfAr0n5xZfl61Y6kEhXYtSbpHbngV
	bv29vib73vdxDyvsrQYXicd7aO6wDOerD86I7UP/puVHvtEPYCJJpJrAt1LjBA8CODwP
	zyjlODoZIglwNulJp0S5kxHupIud3ymCNeSO1zudoBscb3YXFnR90iIgnEgJWvaFyL4H
	7/qMHqfztrkFS/Gbp+k7FhQ64iYh/QaQ13K4ns3cf0VPzzbBJtPBChsobWOyMhaR/+F7
	vgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5Jc9HVRDKMlI2zOHsZg/RzLAaaLCjnNqBg3P7lDKS/c=;
	b=jumaBMsz3bWFppdisPHVa+NFCxQkANbcy+hLUWjcj3hCt2eQq6CsffVzCU5M4UC8yU
	5e6WxfwD3EP6eMVBPK+J9pHq4oWpJt+LSyMsbUJh4RPHC8hge6VprBz8bAjPFq9bIAvb
	hKqUB7QPWKiN/gP369BWmF68b2bdtIRI4j5QgFOJz52oBFqCYk2FP+tlDHpcMzguc+/e
	dXjIXKZdeFIPd3shC3GdV/ThAz7Qalx6PchEH6IW+H9dvywOmhUJHxOv3I/bDfiBt4cp
	U63roFWDLFo5R/r3IJWbDBcb0VK+pxga5J3V8AI7AzWjPvfUeQDdgX3cG95K7e2aPVBS
	KH8A==
X-Gm-Message-State: APjAAAVhO/aknsclwg/k3cId2AajDQ+0D6gUAIEIuvbTUzP9ck/8nHrr
	H9Zrbpx0GWsEIH1TwZsg27fTuwsh
X-Google-Smtp-Source: APXvYqxpWaSt2FjzMKD28vePEkE6JGxkfrtdKXat8Qyr+vJL9eJ8KU8fO0Bc3R6XnXuqd3EhPIkw3A==
X-Received: by 2002:a19:4b4a:: with SMTP id y71mr30658376lfa.118.1568389477869;
	Fri, 13 Sep 2019 08:44:37 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.196])
	by smtp.gmail.com with ESMTPSA id
	t1sm6297169lji.101.2019.09.13.08.44.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 08:44:36 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 18:44:26 +0300
Message-Id: <20190913154434.29908-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v2 1/9] uefi.bbclass: add bbclass holding configuration for UEFI applications
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
X-List-Received-Date: Fri, 13 Sep 2019 15:44:38 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Create new bbclass defining common variables for all UEFI-related
packages (bootloaders, test applications, etc).

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/classes/uefi.bbclass | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/classes/uefi.bbclass

diff --git a/meta/classes/uefi.bbclass b/meta/classes/uefi.bbclass
new file mode 100644
index 000000000000..7991640a2aaa
--- /dev/null
+++ b/meta/classes/uefi.bbclass
@@ -0,0 +1,26 @@
+# Location of EFI files inside EFI System Partition
+EFIDIR ?= "/EFI/BOOT"
+
+# Prefix where ESP is mounted inside rootfs. Set to empty if package is going
+# to be installed to ESP directly
+EFI_PREFIX ?= "/boot"
+
+# Location inside rootfs.
+EFI_FILES_PATH = "${EFI_PREFIX}${EFIDIR}"
+
+# Determine name of bootloader image
+python __anonymous () {
+    import re
+    target = d.getVar('TARGET_ARCH')
+    if target == "x86_64":
+        image = "bootx64.efi"
+    elif re.match('i.86', target):
+        image = "bootia32.efi"
+    elif re.match('aarch64', target):
+        image = "bootaa64.efi"
+    elif re.match('arm', target):
+        image = "bootarm.efi"
+    else:
+        raise bb.parse.SkipRecipe("UEFI unsupported on target %s, skipping" % target)
+    d.setVar("EFI_BOOT_IMAGE", image)
+}
-- 
2.23.0


