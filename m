Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.24726.1628523364931716435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 08:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="278466919"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="278466919"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:31 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="483462981"
Received: from abinzahx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.229.181])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:30 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 20/23] util-linux: fix CVE 2021-37600
Date: Mon,  9 Aug 2021 23:35:52 +0800
Message-Id: <15d1509861095580905cd5e9306fbda4729b9008.1628522214.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628522214.git.anuj.mittal@intel.com>
References: <cover.1628522214.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joe Slater <joe.slater@windriver.com>

Backport patch, which should be in next release (2.37.2).

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 .../util-linux/CVE-2021-37600.patch           | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 6b47f417aa..b21d6d46d2 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -36,5 +36,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            file://Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch \
+           file://CVE-2021-37600.patch \
            "
 SRC_URI[sha256sum] = "f7516ba9d8689343594356f0e5e1a5f0da34adfbc89023437735872bb5024c5f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch b/meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch
new file mode 100644
index 0000000000..11934eee8d
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch
@@ -0,0 +1,38 @@
+From 1c9143d0c1f979c3daf10e1c37b5b1e916c22a1c Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 27 Jul 2021 11:58:31 +0200
+Subject: [PATCH] sys-utils/ipcutils: be careful when call calloc() for uint64
+ nmembs
+
+Fix: https://github.com/karelzak/util-linux/issues/1395
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+CVE: CVE-2021-37600
+
+after version 2.37.1
+https://github.com/karelzak/util-linux.git 1c9143d0c1d...
+unmodified
+
+Upstream-Status: Backport
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ sys-utils/ipcutils.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sys-utils/ipcutils.c b/sys-utils/ipcutils.c
+index e784c4d..18868cf 100644
+--- a/sys-utils/ipcutils.c
++++ b/sys-utils/ipcutils.c
+@@ -218,7 +218,7 @@ static void get_sem_elements(struct sem_data *p)
+ {
+ 	size_t i;
+ 
+-	if (!p || !p->sem_nsems || p->sem_perm.id < 0)
++	if (!p || !p->sem_nsems || p->sem_nsems > SIZE_MAX || p->sem_perm.id < 0)
+ 		return;
+ 
+ 	p->elements = xcalloc(p->sem_nsems, sizeof(struct sem_elem));
+-- 
+2.7.4
+
-- 
2.31.1

