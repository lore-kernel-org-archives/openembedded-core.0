Return-Path: <d.schultz@phytec.de>
Received: from root.phytec.de (mail.rapiddevelopmentkit.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 1B72571DBE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 10:15:24 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id CACBCA00D91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 11:15:35 +0100 (CET)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017012611152437-130782 ;
	Thu, 26 Jan 2017 11:15:24 +0100 
From: Daniel Schultz <d.schultz@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 11:15:24 +0100
Message-Id: <1485425724-4927-1-git-send-email-d.schultz@phytec.de>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 26.01.2017 11:15:24,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 26.01.2017 11:15:24,
	Serialize complete at 26.01.2017 11:15:24
X-TNEFEvaluated: 1
Subject: [PATCH v2] cryptodev: Fix changed mm interface in Kernel 4.9
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
X-List-Received-Date: Thu, 26 Jan 2017 10:15:25 -0000

The memory management interface has changed in Kernel 4.9.

This patch adds a patch which fixes the paramter of the function call.

Backport from https://github.com/cryptodev-linux/cryptodev-linux
Based on commit f126e4837e6334d0464540995df7426fedf6b175

Upstream-Status: Backport

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 meta/recipes-kernel/cryptodev/cryptodev.inc        |  3 +-
 ...st-to-another-change-in-the-user-page-API.patch | 38 ++++++++++++++++++++++
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Adjust-to-another-change-in-the-user-page-API.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index 160ab30..6241238 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://download.gna.org/cryptodev-linux/cryptodev-linux-${PV}.tar.gz \
            file://06d6b560c6e45dc317dae47c74706fa43f4a31d8.patch \
-           file://cb186f682679383e8b5806240927903730ce85d9.patch"
+           file://cb186f682679383e8b5806240927903730ce85d9.patch \
+           file://0001-Adjust-to-another-change-in-the-user-page-API.patch"
 
 SRC_URI[md5sum] = "02644cc4cd02301e0b503a332eb2f0b5"
 SRC_URI[sha256sum] = "67fabde9fb67b286a96c4f45b594b0eccd0f761b495705c18f2ae9461b831376"
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Adjust-to-another-change-in-the-user-page-API.patch b/meta/recipes-kernel/cryptodev/files/0001-Adjust-to-another-change-in-the-user-page-API.patch
new file mode 100644
index 0000000..c001b6f
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0001-Adjust-to-another-change-in-the-user-page-API.patch
@@ -0,0 +1,38 @@
+From f126e4837e6334d0464540995df7426fedf6b175 Mon Sep 17 00:00:00 2001
+From: Michael Weiser <michael.weiser@gmx.de>
+Date: Fri, 11 Nov 2016 18:09:32 +0100
+Subject: [PATCH] Adjust to another change in the user page API
+
+4.9.0 will replace the write and force flags of get_user_pages_remote()
+with a gup_flags parameter[1]. Distinguish the two APIs based on kernel
+version we're compiling for.
+
+[1] https://github.com/torvalds/linux/commit/9beae1ea89305a9667ceaab6d0bf46a045ad71e7
+
+Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
+---
+ zc.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/zc.c b/zc.c
+index a97b49f..e766ee3 100644
+--- a/zc.c
++++ b/zc.c
+@@ -65,7 +65,13 @@ int __get_userbuf(uint8_t __user *addr, uint32_t len, int write,
+ 	ret = get_user_pages(
+ #endif
+ 			task, mm,
+-			(unsigned long)addr, pgcount, write, 0, pg, NULL);
++			(unsigned long)addr, pgcount,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 9, 0))
++			write ? FOLL_WRITE : 0,
++#else
++			write, 0,
++#endif
++			pg, NULL);
+ 	up_read(&mm->mmap_sem);
+ 	if (ret != pgcount)
+ 		return -EINVAL;
+-- 
+1.9.1
+
-- 
1.9.1


