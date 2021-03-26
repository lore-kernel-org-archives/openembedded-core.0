Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.8918.1616741235208329611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 23:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: r51HlKhTJB12vUjqVp1Erxd3yXXQzPYGlz0Vkxd+KxgvpGe3z/m5ZEq7DWIbnfyo+Y2w26YOJl
 4xTRvdQvYraQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="178208808"
X-IronPort-AV: E=Sophos;i="5.81,279,1610438400"; 
   d="scan'208";a="178208808"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2021 23:47:14 -0700
IronPort-SDR: ZadsNP74a0WgNVRfLzqnQEQEhOgd2lJiOqx1ZO8EPe0eGUdsSHAJYCT8JHKYVWENN+wcJDQyxi
 sQFgmVERmPKQ==
X-IronPort-AV: E=Sophos;i="5.81,279,1610438400"; 
   d="scan'208";a="514955725"
Received: from saininav-desk1.png.intel.com ([172.30.199.23])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2021 23:47:13 -0700
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 2/2] cryptodev-module: fix build failure with kernel v5.10
Date: Fri, 26 Mar 2021 14:58:39 +0800
Message-Id: <20210326065839.2816-2-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326065839.2816-1-naveen.kumar.saini@intel.com>
References: <20210326065839.2816-1-naveen.kumar.saini@intel.com>

zc.c:77:8: error: too many arguments to function 'get_user_pages_remote'
|    77 |  ret = get_user_pages_remote(task, mm,
|       |        ^~~~~~~~~~~~~~~~~~~~~

Backported patch to fix it.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../cryptodev/cryptodev-module_1.10.bb        |  1 +
 .../0001-Fix-build-for-Linux-5.9-rc1.patch    | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.9-rc1.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
index 6474599c45..e4f7d1e372 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
@@ -10,6 +10,7 @@ DEPENDS += "cryptodev-linux"
 SRC_URI += " \
 file://0001-Disable-installing-header-file-provided-by-another-p.patch \
 file://0001-Fix-build-for-Linux-5.8-rc1.patch \
+file://0001-Fix-build-for-Linux-5.9-rc1.patch \
 "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.9-rc1.patch b/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.9-rc1.patch
new file mode 100644
index 0000000000..cf1c04df9e
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.9-rc1.patch
@@ -0,0 +1,42 @@
+From 2f5e08aebf9229599aae7f25db752f74221cd71d Mon Sep 17 00:00:00 2001
+From: Joan Bruguera <joanbrugueram@gmail.com>
+Date: Fri, 14 Aug 2020 00:13:38 +0200
+Subject: [PATCH] Fix build for Linux 5.9-rc1
+
+See also: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=64019a2e467a288a16b65ab55ddcbf58c1b00187
+          https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bce617edecada007aee8610fbe2c14d10b8de2f6
+          https://lore.kernel.org/lkml/CAHk-=wj_V2Tps2QrMn20_W0OJF9xqNh52XSGA42s-ZJ8Y+GyKw@mail.gmail.com/
+
+Signed-off-by: Joan Bruguera <joanbrugueram@gmail.com>
+
+Upstream-Status: Backport [https://github.com/cryptodev-linux/cryptodev-linux/commit/2f5e08aebf9229599aae7f25db752f74221cd71d]
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+
+---
+ zc.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/zc.c b/zc.c
+index a560db5..fdf7da1 100644
+--- a/zc.c
++++ b/zc.c
+@@ -76,10 +76,14 @@ int __get_userbuf(uint8_t __user *addr, uint32_t len, int write,
+ 	ret = get_user_pages_remote(task, mm,
+ 			(unsigned long)addr, pgcount, write ? FOLL_WRITE : 0,
+ 			pg, NULL);
+-#else
++#elif (LINUX_VERSION_CODE < KERNEL_VERSION(5, 9, 0))
+ 	ret = get_user_pages_remote(task, mm,
+ 			(unsigned long)addr, pgcount, write ? FOLL_WRITE : 0,
+ 			pg, NULL, NULL);
++#else
++	ret = get_user_pages_remote(mm,
++			(unsigned long)addr, pgcount, write ? FOLL_WRITE : 0,
++			pg, NULL, NULL);
+ #endif
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0))
+ 	up_read(&mm->mmap_sem);
+-- 
+2.17.1
+
-- 
2.17.1

