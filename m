Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.8918.1616741235208329611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 23:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: 1mLQCkJkJ+ahh//TJktS1WpdwzgR+0/44DDIMJmAmLddmB1SSVVAPRQ5EUgnahzzknLCQS2vOQ
 WN8EUh7O3Low==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="178208804"
X-IronPort-AV: E=Sophos;i="5.81,279,1610438400"; 
   d="scan'208";a="178208804"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2021 23:47:13 -0700
IronPort-SDR: Z/7YZVxnAsZy+U6myRytAQOv//A0CX/tqdjjxgc9ryklEde9yaPRsQSibCfRSpQ5/Fv5uAMvq4
 kyx5M2Qk9lig==
X-IronPort-AV: E=Sophos;i="5.81,279,1610438400"; 
   d="scan'208";a="514955719"
Received: from saininav-desk1.png.intel.com ([172.30.199.23])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2021 23:47:12 -0700
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 1/2] cryptodev-module: Backport a patch to fix build failure with kernel v5.8
Date: Fri, 26 Mar 2021 14:58:38 +0800
Message-Id: <20210326065839.2816-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1

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

(From OE-Core rev: fe668065ad7ec83aadfa36fe6ba1ced3db2e3cad)

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
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

