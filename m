Return-Path: <d.schultz@phytec.de>
X-Greylist: delayed 326 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 05 Jan 2018 14:43:23 UTC
Received: from root.phytec.de (mail.visioncatalog.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 1443C787C0
	for <Openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 14:43:23 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 35210A0024F
	for <Openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 15:37:59 +0100 (CET)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2018010515375740-21509 ;
	Fri, 5 Jan 2018 15:37:57 +0100 
From: Daniel Schultz <d.schultz@phytec.de>
To: Openembedded-core@lists.openembedded.org
Date: Fri, 5 Jan 2018 15:37:52 +0100
Message-Id: <1515163072-18559-1-git-send-email-d.schultz@phytec.de>
X-Mailer: git-send-email 2.7.4
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 05.01.2018 15:37:57,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 05.01.2018 15:37:57,
	Serialize complete at 05.01.2018 15:37:57
X-TNEFEvaluated: 1
Subject: [RFC] cryptodev: Fix build errors with v4.11
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
X-List-Received-Date: Fri, 05 Jan 2018 14:43:24 -0000

Commit message from the included patch:
"Linux kernel has added -Werror=designated-init around 4.11 (c834f0e8a8b)
triggering build errors with gcc 5 and 6 (but not with gcc 4)"

Backport from https://github.com/cryptodev-linux/cryptodev-linux
Based on commit f0d69774afb27ffc62bf353465fba145e70cb85a

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 .../cryptodev/cryptodev-module_1.9.bb              |  1 +
 .../0001-ioctl.c-Fix-build-with-linux-4.13.patch   | 49 ++++++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
index 552eb6a..ed6d0ec 100644
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
index 0000000..a41efac
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
2.7.4


