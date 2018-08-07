Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 171F5748F0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 03:21:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Aug 2018 20:21:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,453,1526367600"; d="scan'208";a="63105618"
Received: from anmitta2-mobl1.png.intel.com ([10.221.16.136])
	by orsmga008.jf.intel.com with ESMTP; 06 Aug 2018 20:21:11 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Aug 2018 11:21:09 +0800
Message-Id: <20180807032109.10104-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [rocko][PATCH] cryptodev: Fix build errors with v4.13+
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
X-List-Received-Date: Tue, 07 Aug 2018 03:21:12 -0000

From: Daniel Schultz <d.schultz@phytec.de>

Without this compiles of 4.13 and later kernels fail.

Backport from https://github.com/cryptodev-linux/cryptodev-linux
Based on commit f0d69774afb27ffc62bf353465fba145e70cb85a

(From OE-Core rev: 317fd9814653ee22496dda63a02e628e8a16899b)

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../cryptodev/cryptodev-module_1.9.bb         |  1 +
 ...01-ioctl.c-Fix-build-with-linux-4.13.patch | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
index 552eb6abaa..ed6d0ecae9 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
@@ -9,6 +9,7 @@ DEPENDS += "cryptodev-linux"
 
 SRC_URI += " \
 file://0001-Disable-installing-header-file-provided-by-another-p.patch \
+file://0001-ioctl.c-Fix-build-with-linux-4.13.patch \
 "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
diff --git a/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch b/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch
new file mode 100644
index 0000000000..a41efacdd9
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch
@@ -0,0 +1,49 @@
+From f0d69774afb27ffc62bf353465fba145e70cb85a Mon Sep 17 00:00:00 2001
+From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+Date: Mon, 4 Sep 2017 11:05:08 +0200
+Subject: [PATCH] ioctl.c: Fix build with linux 4.13
+
+git/ioctl.c:1127:3: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
+   {0, },
+    ^
+note: (near initialization for 'verbosity_ctl_dir[1]')
+git/ioctl.c:1136:3: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
+   {0, },
+    ^
+
+Linux kernel has added -Werror=designated-init around 4.11 (c834f0e8a8b)
+triggering build errors with gcc 5 and 6 (but not with gcc 4)
+
+Upstream-Status: Backport
+
+Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+Signed-off-by: Cristian Stoica <cristian.stoica@nxp.com>
+---
+ ioctl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ioctl.c b/ioctl.c
+index 0385203..8d4a162 100644
+--- a/ioctl.c
++++ b/ioctl.c
+@@ -1124,7 +1124,7 @@ static struct ctl_table verbosity_ctl_dir[] = {
+ 		.mode           = 0644,
+ 		.proc_handler   = proc_dointvec,
+ 	},
+-	{0, },
++	{},
+ };
+ 
+ static struct ctl_table verbosity_ctl_root[] = {
+@@ -1133,7 +1133,7 @@ static struct ctl_table verbosity_ctl_root[] = {
+ 		.mode           = 0555,
+ 		.child          = verbosity_ctl_dir,
+ 	},
+-	{0, },
++	{},
+ };
+ static struct ctl_table_header *verbosity_sysctl_header;
+ static int __init init_cryptodev(void)
+-- 
+2.7.4
+
-- 
2.17.1


