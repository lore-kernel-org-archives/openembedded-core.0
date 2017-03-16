Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DF3377768D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 14:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489674636; x=1521210636;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=SHTp6xalvcQusZgFilo9+dWGJ1iK1uTLW13amlOv+Aw=;
	b=pA9Yua6cHWOze4d/xJiQRA5HycnLq+QzSG+YLEyv2FFZFQQyq1asdVzQ
	gBQqt9F1WgzOPV1C5DgMPm9yYuyEfg==;
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2017 07:30:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,172,1486454400"; d="scan'208";a="835498835"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Mar 2017 07:30:32 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 38A1F2C8001;
	Thu, 16 Mar 2017 07:30:27 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 16:30:24 +0200
Message-Id: <1489674624-17346-2-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1489674624-17346-1-git-send-email-jussi.kukkonen@intel.com>
References: <1489674624-17346-1-git-send-email-jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] kexec-tools: Add patches to enable format-security
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
X-List-Received-Date: Thu, 16 Mar 2017 14:30:35 -0000

Also remove the override from security_flags.inc

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/conf/distro/include/security_flags.inc        |  1 -
 ...01-x86-x86_64-Fix-format-warning-with-die.patch | 78 ++++++++++++++++++++++
 .../0002-ppc-Fix-format-warning-with-die.patch     | 43 ++++++++++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb    |  2 +
 4 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-x86-x86_64-Fix-format-warning-with-die.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0002-ppc-Fix-format-warning-with-die.patch

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index da1c3a0..5a1ea0d 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -93,7 +93,6 @@ SECURITY_CFLAGS_pn-zlib = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_STRINGFORMAT_pn-busybox = ""
 SECURITY_STRINGFORMAT_pn-expect = ""
 SECURITY_STRINGFORMAT_pn-gcc = ""
-SECURITY_STRINGFORMAT_pn-kexec-tools = ""
 SECURITY_STRINGFORMAT_pn-oh-puzzles = ""
 
 TARGET_CFLAGS_append_class-target = " ${SECURITY_CFLAGS}"
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-x86-x86_64-Fix-format-warning-with-die.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-x86-x86_64-Fix-format-warning-with-die.patch
new file mode 100644
index 0000000..e601f52
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-x86-x86_64-Fix-format-warning-with-die.patch
@@ -0,0 +1,78 @@
+Upstream-Status: Backport
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+
+From 1550f81bf1886aa0520da0b6181cd61c1a75d4ad Mon Sep 17 00:00:00 2001
+From: Pratyush Anand <panand@redhat.com>
+Date: Tue, 14 Mar 2017 17:59:22 +0530
+Subject: [PATCH 1/2] x86/x86_64: Fix format warning with die()
+
+Fedora koji uses gcc version 7.0.1-0.12.fc27, and it generates a build
+warning
+
+   kexec/arch/i386/kexec-elf-x86.c:299:3: error: format not a string
+   literal and no format arguments [-Werror=format-security]
+       die(error_msg);
+       ^~~
+    cc1: some warnings being treated as errors
+
+error_msg can have a format specifier as well in string. In such cases,
+if there is no other arguments for the format variable then code will
+try to access a non existing argument. Therefore, use 1st argument as
+format specifier for string print and pass error_msg as the string to be
+printed.
+
+While doing that,also use const qualifier before "char *error_msg".
+
+Signed-off-by: Pratyush Anand <panand@redhat.com>
+Signed-off-by: Simon Horman <horms@verge.net.au>
+---
+ kexec/arch/i386/kexec-elf-x86.c      | 4 ++--
+ kexec/arch/x86_64/kexec-elf-x86_64.c | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/kexec/arch/i386/kexec-elf-x86.c b/kexec/arch/i386/kexec-elf-x86.c
+index de00dcb..fedf031 100644
+--- a/kexec/arch/i386/kexec-elf-x86.c
++++ b/kexec/arch/i386/kexec-elf-x86.c
+@@ -91,7 +91,7 @@ int elf_x86_load(int argc, char **argv, const char *buf, off_t len,
+ 	char *command_line = NULL, *modified_cmdline = NULL;
+ 	const char *append = NULL;
+ 	char *tmp_cmdline = NULL;
+-	char *error_msg = NULL;
++	const char *error_msg = NULL;
+ 	int result;
+ 	int command_line_len;
+ 	const char *ramdisk;
+@@ -296,6 +296,6 @@ out:
+ 	free(command_line);
+ 	free(modified_cmdline);
+ 	if (error_msg)
+-		die(error_msg);
++		die("%s", error_msg);
+ 	return result;
+ }
+diff --git a/kexec/arch/x86_64/kexec-elf-x86_64.c b/kexec/arch/x86_64/kexec-elf-x86_64.c
+index ae65692..ad22311 100644
+--- a/kexec/arch/x86_64/kexec-elf-x86_64.c
++++ b/kexec/arch/x86_64/kexec-elf-x86_64.c
+@@ -99,7 +99,7 @@ int elf_x86_64_load(int argc, char **argv, const char *buf, off_t len,
+ #define ARG_STYLE_NONE  2
+ 	int opt;
+ 	int result = 0;
+-	char *error_msg = NULL;
++	const char *error_msg = NULL;
+ 
+ 	/* See options.h and add any new options there too! */
+ 	static const struct option options[] = {
+@@ -276,6 +276,6 @@ out:
+ 	free(command_line);
+ 	free(modified_cmdline);
+ 	if (error_msg)
+-		die(error_msg);
++		die("%s", error_msg);
+ 	return result;
+ }
+-- 
+2.11.0
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0002-ppc-Fix-format-warning-with-die.patch b/meta/recipes-kernel/kexec/kexec-tools/0002-ppc-Fix-format-warning-with-die.patch
new file mode 100644
index 0000000..6a1c06d
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0002-ppc-Fix-format-warning-with-die.patch
@@ -0,0 +1,43 @@
+From 1c956fc8c6b6324d8d38bba5f9e60a018051c6f5 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Thu, 16 Mar 2017 15:39:06 +0200
+Subject: [PATCH 2/2] ppc: Fix format warning with die()
+
+Enable compiling kexec-tools for ppc with -Werror=format-security.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Submitted [Mailing list]
+---
+ kexec/arch/ppc/kexec-elf-ppc.c    | 2 +-
+ kexec/arch/ppc/kexec-uImage-ppc.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/kexec/arch/ppc/kexec-elf-ppc.c b/kexec/arch/ppc/kexec-elf-ppc.c
+index 291f06d..ad43ad1 100644
+--- a/kexec/arch/ppc/kexec-elf-ppc.c
++++ b/kexec/arch/ppc/kexec-elf-ppc.c
+@@ -453,7 +453,7 @@ out:
+ 	if (!tmp_cmdline)
+ 		free(command_line);
+ 	if (error_msg)
+-		die(error_msg);
++		die("%s", error_msg);
+ 
+ 	return result;
+ }
+diff --git a/kexec/arch/ppc/kexec-uImage-ppc.c b/kexec/arch/ppc/kexec-uImage-ppc.c
+index 5eec6e4..e8f7adc 100644
+--- a/kexec/arch/ppc/kexec-uImage-ppc.c
++++ b/kexec/arch/ppc/kexec-uImage-ppc.c
+@@ -306,7 +306,7 @@ out:
+ 	if (!tmp_cmdline)
+ 		free(command_line);
+ 	if (error_msg)
+-		die(error_msg);
++		die("%s", error_msg);
+ 	return ret;
+ }
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
index af32320..1062457 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
@@ -16,6 +16,8 @@ SRC_URI += "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.g
             file://0008-arm64-kdump-add-DT-properties-to-crash-dump-kernel-s.patch \
             file://0009-arm64-kdump-Add-support-for-binary-image-files.patch \
             file://0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
+            file://0001-x86-x86_64-Fix-format-warning-with-die.patch \
+            file://0002-ppc-Fix-format-warning-with-die.patch \
          "
 
 SRC_URI[md5sum] = "b2b2c5e6b29d467d6e99d587fb6b7cf5"
-- 
2.1.4


