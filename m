Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 510AB746A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 20:51:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2018 13:51:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,383,1517904000"; d="scan'208";a="43623932"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga001.jf.intel.com with ESMTP; 30 Mar 2018 13:51:05 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Mar 2018 13:51:08 -0700
Message-Id: <1522443068-43048-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: bruce.ashfield@windriver.com, jurobystricky@hotmail.com
Subject: [PATCH] linux-yocto_4.14.bb: fix for deterministic srcversion
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
X-List-Received-Date: Fri, 30 Mar 2018 20:51:04 -0000

"srcversion" field inserted into module modinfo section contains a
sum of the source files which made it. However, this field can
be incorrect. Building the same module can end up having inconsistent
srcversion field eventhough the sources remain the same.

This basically negates the whole purpose of the field srcversion,
and breaks build reproducibility as well.

The problem is fairly easy reproduceable by comparing "srcversion" of
kernel modules built in a workplace of a short directory name with
"srcversion" of the same modules built in a workplace of a fairly long
directory name.

The reason for incorrect srcversion is that some source files can be
simply silently skipped from the checksum calculation due to limited
buffer space for line parsing.

[YOCTO #12544]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../modpost-srcversion-sometimes-incorrect.patch   | 48 ++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      |  4 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/linux/files/modpost-srcversion-sometimes-incorrect.patch

diff --git a/meta/recipes-kernel/linux/files/modpost-srcversion-sometimes-incorrect.patch b/meta/recipes-kernel/linux/files/modpost-srcversion-sometimes-incorrect.patch
new file mode 100644
index 0000000..1680293
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/modpost-srcversion-sometimes-incorrect.patch
@@ -0,0 +1,48 @@
+"srcversion" field inserted into module modinfo section contains a
+sum of the source files which made it. However, this field can
+be incorrect. Building the same module can end up having inconsistent
+srcversion field eventhough the sources remain the same.
+This can be reproduced by building modules in a deeply nested directory,
+but other factors contribute as well.
+
+The reason for incorrect srcversion is that some source files can be
+simply silently skipped from the checksum calculation due to limited
+buffer space for line parsing.
+
+This patch addresses two issues:
+
+1. Allocates a larger line buffer (32k vs 4k).
+2. Issues a warning if a line length exceeds the line buffer.
+
+Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10318141/]
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
+index 9917f92..955f26e 100644
+--- a/scripts/mod/modpost.c
++++ b/scripts/mod/modpost.c
+@@ -385,9 +385,10 @@ void *grab_file(const char *filename, unsigned long *size)
+   * spaces in the beginning of the line is trimmed away.
+   * Return a pointer to a static buffer.
+   **/
++#define MODPOST_MAX_LINE 32768
+ char *get_next_line(unsigned long *pos, void *file, unsigned long size)
+ {
+-	static char line[4096];
++	static char line[MODPOST_MAX_LINE];
+ 	int skip = 1;
+ 	size_t len = 0;
+ 	signed char *p = (signed char *)file + *pos;
+@@ -402,8 +403,11 @@ char *get_next_line(unsigned long *pos, void *file, unsigned long size)
+ 		if (*p != '\n' && (*pos < size)) {
+ 			len++;
+ 			*s++ = *p++;
+-			if (len > 4095)
++			if (len > (sizeof(line)-1)) {
++				warn(" %s: line exceeds buffer size %zu bytes\n"
++				     , __func__, sizeof(line));
+ 				break; /* Too long, stop */
++			}
+ 		} else {
+ 			/* End of string */
+ 			*s = '\0';
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index ba5e356..6c0a88f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -22,7 +22,9 @@ SRCREV_machine ?= "edc90f45a716ffe8e16cebaaf3b5db070af0280a"
 SRCREV_meta ?= "5f6c3e32365bffb1993c0c62abf2c5bb8916a57f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA} \
+           file://modpost-srcversion-sometimes-incorrect.patch \
+           "
 
 LINUX_VERSION ?= "4.14.24"
 
-- 
2.7.4


