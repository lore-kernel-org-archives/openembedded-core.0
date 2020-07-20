Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.33598.1595231003730614334
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 00:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: zhe.he@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06K7gpEG012705
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2020 00:43:12 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Mon, 20 Jul 2020 00:42:45 -0700
From: "He Zhe" <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] cryptodev-module: Backport a patch to fix build failure with kernel v5.8
Date: Mon, 20 Jul 2020 15:39:17 +0800
Message-ID: <20200720073917.1516295-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Fix the following build failure with linux-yocto-dev

zc.c:61:17: error: 'struct mm_struct' has no member named 'mmap_sem';
did you mean 'mmap_base'?
   61 |  down_read(&mm->mmap_sem);
      |                 ^~~~~~~~
      |                 mmap_base
zc.c:77:15: error: 'struct mm_struct' has no member named 'mmap_sem';
did you mean 'mmap_base'?
   77 |  up_read(&mm->mmap_sem);
      |               ^~~~~~~~
      |               mmap_base

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 .../cryptodev/cryptodev-module_1.10.bb        |  1 +
 .../0001-Fix-build-for-Linux-5.8-rc1.patch    | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.8-rc1.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
index 552eb6abaa..6474599c45 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
@@ -9,6 +9,7 @@ DEPENDS += "cryptodev-linux"
 
 SRC_URI += " \
 file://0001-Disable-installing-header-file-provided-by-another-p.patch \
+file://0001-Fix-build-for-Linux-5.8-rc1.patch \
 "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.8-rc1.patch b/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.8-rc1.patch
new file mode 100644
index 0000000000..02c721a4f3
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.8-rc1.patch
@@ -0,0 +1,49 @@
+From 9e765068582aae3696520346a7500322ca6cc2de Mon Sep 17 00:00:00 2001
+From: Joan Bruguera <joanbrugueram@gmail.com>
+Date: Sat, 13 Jun 2020 19:46:44 +0200
+Subject: [PATCH] Fix build for Linux 5.8-rc1
+
+See also: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9740ca4e95b43b91a4a848694a20d01ba6818f7b
+          https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=da1c55f1b272f4bd54671d459b39ea7b54944ef9
+          https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d8ed45c5dcd455fc5848d47f86883a1b872ac0d0
+
+Signed-off-by: Joan Bruguera <joanbrugueram@gmail.com>
+
+Upstream-Status: Backport [9e765068582aae3696520346a7500322ca6cc2de]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ zc.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/zc.c b/zc.c
+index ae464ff..2c286bb 100644
+--- a/zc.c
++++ b/zc.c
+@@ -58,7 +58,11 @@ int __get_userbuf(uint8_t __user *addr, uint32_t len, int write,
+ 		return 0;
+ 	}
+ 
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0))
+ 	down_read(&mm->mmap_sem);
++#else
++	mmap_read_lock(mm);
++#endif
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 6, 0))
+ 	ret = get_user_pages(task, mm,
+ 			(unsigned long)addr, pgcount, write, 0, pg, NULL);
+@@ -74,7 +78,11 @@ int __get_userbuf(uint8_t __user *addr, uint32_t len, int write,
+ 			(unsigned long)addr, pgcount, write ? FOLL_WRITE : 0,
+ 			pg, NULL, NULL);
+ #endif
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0))
+ 	up_read(&mm->mmap_sem);
++#else
++	mmap_read_unlock(mm);
++#endif
+ 	if (ret != pgcount)
+ 		return -EINVAL;
+ 
+-- 
+2.17.1
+
-- 
2.17.1

