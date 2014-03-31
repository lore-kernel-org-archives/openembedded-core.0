Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57D8C6F902
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 17:56:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2VHuiSM017334
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Mar 2014 10:56:44 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 31 Mar 2014 10:56:44 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 31 Mar 2014 13:56:33 -0400
Message-ID: <9f8d4e24f7c9b261597aaaa1a2085858a5178324.1396288310.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1396288310.git.bruce.ashfield@windriver.com>
References: <cover.1396288310.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] linux-libc-headers: remove 3.10 recipe
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
X-List-Received-Date: Mon, 31 Mar 2014 17:56:44 -0000
Content-Type: text/plain

3.14 is now the reference for libc-headers. After building and booting 3.x based
BSPs against the 3.14 headers, we can safely remove the old version and patches
that are now part of the mainline kernel.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...1-ptrace.h-remove-ptrace_peeksiginfo_args.patch | 50 ------------------
 ...lude-asm-byteorder.h-in-linux-raid-md_p.h.patch | 34 -------------
 ...efile.headersinst-install-headers-from-sc.patch | 59 ----------------------
 .../linux-libc-headers/linux-libc-headers_3.10.bb  | 11 ----
 4 files changed, 154 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/UAPI-include-asm-byteorder.h-in-linux-raid-md_p.h.patch
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-install-headers-from-sc.patch
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch
deleted file mode 100644
index da2e117a486d..000000000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 7dddfb8fec5317ea16154d30e8e18b6559979b60 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Sun, 25 Aug 2013 22:51:07 -0400
-Subject: [PATCH] ptrace.h: remove ptrace_peeksiginfo_args
-
-The addition of ptrace_peeksiginfo_args to the uapi in kernel commit
-84c751bd [ptrace: add ability to retrieve signals without removing from a queue (v4)]
-means that existing applications using glibc versions that define ptrace_peeksiginfo_args
-in sys/ptrace.h will get duplicate structure definitions like:
-
-    | In file included from /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:66:0:
-    | /poky-master/build/tmp/sysroots/qemux86/usr/include/linux/ptrace.h:58:8: error: redefinition of 'struct ptrace_peeksiginfo_args'
-    |  struct ptrace_peeksiginfo_args {
-    |         ^
-    | In file included from /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/defs.h:159:0,
-    |                  from /poky-master/build/tmp/work/i586-poky-linux/strace/4.8-r0/strace-4.8/process.c:37:
-    | /poky-master/build/tmp/sysroots/qemux86/usr/include/sys/ptrace.h:191:8: note: originally defined here
-    |  struct ptrace_peeksiginfo_args
-    |         ^
-    | make[2]: *** [process.o] Error 1
-
-Reverting to the previous status of not exporting this structure temporarily
-fixes applications, until they can be adjusted to not mix sys/ptrace.h and
-linux/ptrace.h includes.
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
----
- include/uapi/linux/ptrace.h |    6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/include/uapi/linux/ptrace.h b/include/uapi/linux/ptrace.h
-index 52ebcc8..524599d 100644
---- a/include/uapi/linux/ptrace.h
-+++ b/include/uapi/linux/ptrace.h
-@@ -55,12 +55,6 @@
- 
- #define PTRACE_PEEKSIGINFO	0x4209
- 
--struct ptrace_peeksiginfo_args {
--	__u64 off;	/* from which siginfo to start */
--	__u32 flags;
--	__s32 nr;	/* how may siginfos to take */
--};
--
- /* Read signals from a shared (process wide) queue */
- #define PTRACE_PEEKSIGINFO_SHARED	(1 << 0)
- 
--- 
-1.7.10.4
-
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/UAPI-include-asm-byteorder.h-in-linux-raid-md_p.h.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/UAPI-include-asm-byteorder.h-in-linux-raid-md_p.h.patch
deleted file mode 100644
index 1bf0e7ec85f0..000000000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/UAPI-include-asm-byteorder.h-in-linux-raid-md_p.h.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c0f8bd146a8b3e630798561c605f5669823107af Mon Sep 17 00:00:00 2001
-From: Aurelien Jarno <aurelien@aurel32.net>
-Date: Thu, 14 Nov 2013 15:16:19 +1100
-Subject: [PATCH] UAPI: include <asm/byteorder.h> in linux/raid/md_p.h
-
-linux/raid/md_p.h is using conditionals depending on endianess and fails
-with an error if neither of __BIG_ENDIAN, __LITTLE_ENDIAN or
-__BYTE_ORDER are defined, but it doesn't include any header which can
-define these constants. This make this header unusable alone.
-
-This patch adds a #include <asm/byteorder.h> at the beginning of this
-header to make it usable alone. This is needed to compile klibc on MIPS.
-
-Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
-Signed-off-by: NeilBrown <neilb@suse.de>
----
- include/uapi/linux/raid/md_p.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/uapi/linux/raid/md_p.h b/include/uapi/linux/raid/md_p.h
-index fe1a540..f7cf7f3 100644
---- a/include/uapi/linux/raid/md_p.h
-+++ b/include/uapi/linux/raid/md_p.h
-@@ -16,6 +16,7 @@
- #define _MD_P_H
- 
- #include <linux/types.h>
-+#include <asm/byteorder.h>
- 
- /*
-  * RAID superblock.
--- 
-1.8.1.2
-
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-install-headers-from-sc.patch b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-install-headers-from-sc.patch
deleted file mode 100644
index 7eb7defcde13..000000000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/scripts-Makefile.headersinst-install-headers-from-sc.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From b200d4bcffc86bb08fd3898bc7cde00f0686f62d Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Fri, 13 Sep 2013 22:01:02 -0400
-Subject: [PATCH] scripts/Makefile.headersinst: install headers from scratch file
-
-If headers_install is executed from a deep/long directory structure, the
-shell's maximum argument length can be execeeded, which breaks the operation
-with:
-
-| make[2]: execvp: /bin/sh: Argument list too long
-| make[2]: ***
-
-By dumping the input files to a scratch file and using xargs to read the
-input list from the scratch file, we can avoid blowing out the maximum
-argument size and install headers in a long path name environment.
-
-Robert:
-Use "$(foreach ,,$(shell echo))" rather than "echo" to make it work when
-len(TMPDIR) <= 410.
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
-RP: Refreshed for 3.10 as the problem still exists there on the autobuilders
- scripts/Makefile.headersinst |    9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
---- a/scripts/Makefile.headersinst
-+++ b/scripts/Makefile.headersinst
-@@ -72,7 +72,7 @@ printdir = $(patsubst $(INSTALL_HDR_PATH)/%/,%,$(dir $@))
- quiet_cmd_install = INSTALL $(printdir) ($(words $(all-files))\
-                             file$(if $(word 2, $(all-files)),s))
-       cmd_install = \
--        $(CONFIG_SHELL) $< $(installdir) $(input-files); \
-+        xargs $(CONFIG_SHELL) $< $(installdir) < $(INSTALL_HDR_PATH)/.input-files; \
-         for F in $(wrapper-files); do                                   \
-                 echo "\#include <asm-generic/$$F>" > $(installdir)/$$F;    \
-         done;                                                           \
-@@ -98,10 +98,17 @@ __headersinst: $(subdirs) $(install-file)
- 	@:
- 
- targets += $(install-file)
-+# Use the $(foreach ,,$(shell echo)) to avoid the "Argument list too
-+# long" error, and use the "$(shell echo)" rather than "echo" to keep
-+# the order.
- $(install-file): scripts/headers_install.sh $(input-files) FORCE
- 	$(if $(unwanted),$(call cmd,remove),)
- 	$(if $(wildcard $(dir $@)),,$(shell mkdir -p $(dir $@)))
-+	$(shell echo -n > $(INSTALL_HDR_PATH)/.input-files)
-+	$(foreach f,$(input-files),$(shell echo -n "$(f) " >> \
-+			$(INSTALL_HDR_PATH)/.input-files))
- 	$(call if_changed,install)
-+	@rm $(INSTALL_HDR_PATH)/.input-files
- 
- else
- __headerscheck: $(subdirs) $(check-file)
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
deleted file mode 100644
index a78d4ba59a62..000000000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require linux-libc-headers.inc
-
-SRC_URI += "file://0001-ptrace.h-remove-ptrace_peeksiginfo_args.patch"
-SRC_URI += "file://scripts-Makefile.headersinst-install-headers-from-sc.patch"
-
-# fixes klibc build for MIPS, drop when libc-headers > 3.13
-SRC_URI += "file://UAPI-include-asm-byteorder.h-in-linux-raid-md_p.h.patch"
-
-SRC_URI[md5sum] = "72d0a9b3e60cd86fabcd3f24b1708944"
-SRC_URI[sha256sum] = "46c9e55e1fddf40813b8d697d5645037a8e2af5c1a8dff52b3fe82b5021582b8"
-
-- 
1.8.1.2


