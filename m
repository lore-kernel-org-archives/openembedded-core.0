Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.3599.1628567133149277960
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 20:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: chee.yang.lee@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="212971272"
X-IronPort-AV: E=Sophos;i="5.84,309,1620716400"; 
   d="scan'208";a="212971272"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 20:45:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,309,1620716400"; 
   d="scan'208";a="515506251"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2021 20:45:31 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][patch] libsolv: fix CVE-2021-3200
Date: Tue, 10 Aug 2021 11:45:30 +0800
Message-Id: <20210810034530.86639-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../libsolv/files/CVE-2021-3200.patch         | 67 +++++++++++++++++++
 .../libsolv/libsolv_0.7.10.bb                 |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/files/CVE-2021-3200.patch

diff --git a/meta/recipes-extended/libsolv/files/CVE-2021-3200.patch b/meta/recipes-extended/libsolv/files/CVE-2021-3200.patch
new file mode 100644
index 00000000000..74164ab495f
--- /dev/null
+++ b/meta/recipes-extended/libsolv/files/CVE-2021-3200.patch
@@ -0,0 +1,67 @@
+From 0077ef29eb46d2e1df2f230fc95a1d9748d49dec Mon Sep 17 00:00:00 2001
+From: Michael Schroeder <mls@suse.de>
+Date: Mon, 14 Dec 2020 11:12:00 +0100
+Subject: [PATCH] testcase_read: error out if repos are added or the system is
+ changed too late
+
+We must not add new solvables after the considered map was created, the solver
+was created, or jobs were added. We may not changed the system after jobs have
+been added.
+
+(Jobs may point inside the whatproviedes array, so we must not invalidate this
+area.)
+
+Upstream-Status: Backport 
+https://github.com/openSUSE/libsolv/commit/0077ef29eb46d2e1df2f230fc95a1d9748d49dec
+CVE: CVE-2021-3200
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ ext/testcase.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/ext/testcase.c b/ext/testcase.c
+index 0be7a213..8fb6d793 100644
+--- a/ext/testcase.c
++++ b/ext/testcase.c
+@@ -1991,6 +1991,7 @@ testcase_read(Pool *pool, FILE *fp, const char *testcase, Queue *job, char **res
+   Id *genid = 0;
+   int ngenid = 0;
+   Queue autoinstq;
++  int oldjobsize = job ? job->count : 0;
+ 
+   if (resultp)
+     *resultp = 0;
+@@ -2065,6 +2066,21 @@ testcase_read(Pool *pool, FILE *fp, const char *testcase, Queue *job, char **res
+ 	  int prio, subprio;
+ 	  const char *rdata;
+ 
++	  if (pool->considered)
++	    {
++	      pool_error(pool, 0, "testcase_read: cannot add repos after packages were disabled");
++	      continue;
++	    }
++	  if (solv)
++	    {
++	      pool_error(pool, 0, "testcase_read: cannot add repos after the solver was created");
++	      continue;
++	    }
++	  if (job && job->count != oldjobsize)
++	    {
++	      pool_error(pool, 0, "testcase_read: cannot add repos after jobs have been created");
++	      continue;
++	    }
+ 	  prepared = 0;
+           if (!poolflagsreset)
+ 	    {
+@@ -2125,6 +2141,11 @@ testcase_read(Pool *pool, FILE *fp, const char *testcase, Queue *job, char **res
+ 	  int i;
+ 
+ 	  /* must set the disttype before the arch */
++	  if (job && job->count != oldjobsize)
++	    {
++	      pool_error(pool, 0, "testcase_read: cannot change the system after jobs have been created");
++	      continue;
++	    }
+ 	  prepared = 0;
+ 	  if (strcmp(pieces[2], "*") != 0)
+ 	    {
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb b/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
index 1cf5e2eb295..eadf04aa5a0 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.10.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "expat zlib"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
+           file://CVE-2021-3200.patch \
 "
 
 SRCREV = "605dd2645ef899e2b7c95709476fb51e28d7e378"
-- 
2.17.1

