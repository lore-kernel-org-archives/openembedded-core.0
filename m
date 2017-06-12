Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1BAAB782CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 14:59:22 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id d5so4440439pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 07:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OWvhpOB5HIPl+OzYF+lskcP3LmD82Y2qhpxIw2RiyHs=;
	b=UEKckg2+VPFaNUA6XTk/3hVRT24c2iaZoQzxHTrQsv5CV8KIxag8D1aLw7S9+lM2S5
	hrjLZOa7GepFkLNtO7mwjY9VZmdVggGED0cWTUGezmETT2LCXqyybRL+rLDEicqPbHSL
	bB6OZqbbwk8WQUcQ3PrlYXO0rO50q9tukGxRU0ui3E+dT2drpOcrV/THzSTPJ7AOrCov
	Lazfq4JgwcYkXo1a9V/WsbWq9n029+ny25oI0d2Fg5k4FIZ+tohtkEU1JfDzDCmjlWP8
	xDtJKjurE2l8O411mL9LfUPhmiXIaQNlsAXXc+QLUpHc9Y5rCW/pqigQkIYDSIznIhJL
	YMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OWvhpOB5HIPl+OzYF+lskcP3LmD82Y2qhpxIw2RiyHs=;
	b=e12Bp0ecbnlfREiOLwOs29OilISwQvEiRPZNPlHO5MALuriolA1y713GBuuWl7xFYU
	Nha0npzGFqGU+FS1zdkj4Kuw8d5vxP12CuY+gnR6gJf9f1qTsq/ujhkgZ45ej9IJ1K8I
	FUWf8LBhmd9HJO9bVCof0EIIYuobJXf/eP5tFDFYCLPGIbMygjBbbYrDpVz2Z1b2XHuJ
	1ILIAHn8TIs+PLGZdh2FWEI/Db584hospdYUOl7eoVMEj6XTteVNuC9ucxK8ZJNUg5ZN
	VzKsmhQCh0OgOIp9Cj3MvlAxxOWcx9ahLKsDZ05hiWKaQ60FTaiEGb8MrGzpjbHQmzJj
	zi2g==
X-Gm-Message-State: AODbwcC9X4ntrKB+HkSzWDGqPhC+M9Pa6hvwEg3j5g46iZxh7c7MAd7B
	5cFixce1T4wF4TLg
X-Received: by 10.84.231.141 with SMTP id g13mr57001641plk.157.1497279563364; 
	Mon, 12 Jun 2017 07:59:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id
	i17sm20554732pgn.60.2017.06.12.07.59.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Jun 2017 07:59:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 07:59:06 -0700
Message-Id: <59ea0b6f571b51c8ee406236948eae3efeb2daad.1497279306.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1497279306.git.raj.khem@gmail.com>
References: <cover.1497279306.git.raj.khem@gmail.com>
Subject: [PATCH 6/7] kexec-tools: Pass -no-pie to linker
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
X-List-Received-Date: Mon, 12 Jun 2017 14:59:22 -0000

- This matches the linker flags to compiler flags in purgatory
- Compile arm64 without PIC

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../kexec-tools/0001-Disable-PIE-during-link.patch | 31 ++++++++++++++++++++++
 .../kexec/kexec-tools/0001-arm64-Disable-PIC.patch | 31 ++++++++++++++++++++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb    |  2 ++
 3 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-Disable-PIE-during-link.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Disable-PIC.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-Disable-PIE-during-link.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-Disable-PIE-during-link.patch
new file mode 100644
index 0000000000..3f2f85e337
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-Disable-PIE-during-link.patch
@@ -0,0 +1,31 @@
+From ea7be6d71b85880e8e8a2c8a4f49a696c5f31ae4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 10 Jun 2017 11:18:49 -0700
+Subject: [PATCH] Disable PIE during link
+
+We have explcitly disabled PIE during compile so we
+just need to match it with linker flags
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ purgatory/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/purgatory/Makefile b/purgatory/Makefile
+index 564bdb7..a08e41f 100644
+--- a/purgatory/Makefile
++++ b/purgatory/Makefile
+@@ -59,7 +59,7 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
+ 			-Iinclude \
+ 			-I$(shell $(CC) -print-file-name=include)
+ $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
+-			-Wl,--no-undefined -nostartfiles -nostdlib \
++			-Wl,--no-undefined -no-pie -nostartfiles -nostdlib \
+ 			-nodefaultlibs -e purgatory_start -Wl,-r \
+ 			-Wl,-Map=$(PURGATORY_MAP)
+ 
+-- 
+2.13.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Disable-PIC.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Disable-PIC.patch
new file mode 100644
index 0000000000..84e94d7d93
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Disable-PIC.patch
@@ -0,0 +1,31 @@
+From 3bb73e5e5649b455e15d5ca3a7ad1a90c4960972 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 10 Jun 2017 11:54:36 -0700
+Subject: [PATCH] arm64: Disable PIC
+
+Fix
+| cc1: sorry, unimplemented: code model 'large' with -fPIC
+| make: *** [Makefile:118: purgatory/arch/arm64/entry.o] Error 1
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ purgatory/arch/arm64/Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/purgatory/arch/arm64/Makefile b/purgatory/arch/arm64/Makefile
+index 636abea..80068ca 100644
+--- a/purgatory/arch/arm64/Makefile
++++ b/purgatory/arch/arm64/Makefile
+@@ -1,6 +1,7 @@
+ 
+ arm64_PURGATORY_EXTRA_CFLAGS = \
+ 	-mcmodel=large \
++	-fno-PIC \
+ 	-fno-stack-protector \
+ 	-fno-asynchronous-unwind-tables \
+ 	-Wundef \
+-- 
+2.13.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
index 90d5985801..4caca933c7 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
@@ -19,6 +19,8 @@ SRC_URI += "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.g
             file://0001-x86-x86_64-Fix-format-warning-with-die.patch \
             file://0002-ppc-Fix-format-warning-with-die.patch \
             file://kexec-x32.patch \
+            file://0001-Disable-PIE-during-link.patch \
+            file://0001-arm64-Disable-PIC.patch \
          "
 
 SRC_URI[md5sum] = "b2b2c5e6b29d467d6e99d587fb6b7cf5"
-- 
2.13.1


