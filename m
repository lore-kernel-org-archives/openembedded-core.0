Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.3755.1604555570970083275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 21:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: rebecca.swee.fun.chang@intel.com)
IronPort-SDR: C43DFCLDdPYfy11W56FjSKJ/b2wn3tVGidb1biqTL1h0ZylyQOYfuOTx6zkdRtrVjIMZrCppYg
 4y6lYNOODP6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="254039306"
X-IronPort-AV: E=Sophos;i="5.77,452,1596524400"; 
   d="scan'208";a="254039306"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2020 21:52:49 -0800
IronPort-SDR: XP7wnPP3MWowHekjXbWWwrdrn0i3N/y05BQEIeWu3x8bBC8kmj1/FIhkLPqjecOGTAd7qlKZvZ
 5ajmWmL6k9aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,452,1596524400"; 
   d="scan'208";a="358316321"
Received: from unknown (HELO pg-gsrd-build.png.intel.com) ([10.226.216.131])
  by fmsmga002.fm.intel.com with ESMTP; 04 Nov 2020 21:52:49 -0800
From: "Rebecca Chang Swee Fun" <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 4/4] numactl: upgrade 2.0.13 -> 2.0.14
Date: Thu,  5 Nov 2020 13:39:54 +0000
Message-Id: <20201105133954.144390-4-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201105133954.144390-1-rebecca.swee.fun.chang@intel.com>
References: <20201105133954.144390-1-rebecca.swee.fun.chang@intel.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a59c246be05ca284fa27df87b5db09a70f527cc2)
Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 ...1-numademo-fix-error-on-32bit-system.patch | 100 ------------------
 meta/recipes-support/numactl/numactl_git.bb   |  15 ++-
 2 files changed, 7 insertions(+), 108 deletions(-)
 delete mode 100644 meta/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch

diff --git a/meta/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch b/meta/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch
deleted file mode 100644
index 506101711a..0000000000
--- a/meta/recipes-support/numactl/numactl/0001-numademo-fix-error-on-32bit-system.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 68485f8516884377e54c623b0deff73f97321d96 Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
-Date: Thu, 19 Sep 2019 04:32:31 -0400
-Subject: [PATCH] numademo: fix error on 32bit system
-
-Error Info on 32bit:
-root@intel-x86:~# numademo -t -e 1M
-Configured Nodes does not match available memory nodes
-
-That's because sizeof(long)=4Word, but sizeof(long long)=8Word
-on 32bit. So (long long) assigning to (long) maybe cause overflow.
-
-long numa_node_size(int node, long *freep)
-{
-    ...
-    long sz = numa_node_size64_int(node, &f2);
-    ~^^~
-    return sz;
-    ...
-}
-long long numa_node_size64(int node, long long *freep)
-~^^   ^^~
-{
-    ...
-}
-
-Unify the return type of above functions.
-
-Upstream-Status: Accepted [next version is after 2.0.13 or 2.0.14]
-[https://github.com/numactl/numactl/commit/a7c4bc790a191d3e42b63850b409c1a72b75a4e1]
-                 Submitted [https://github.com/numactl/numactl/pull/79]
-[The first patch was merged but has a error, then the second fix it.]
-
-Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
----
- libnuma.c         | 4 ++--
- numa.h            | 2 +-
- numademo.c        | 2 +-
- test/move_pages.c | 2 +-
- 4 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/libnuma.c b/libnuma.c
-index cac8851..8b5c6aa 100644
---- a/libnuma.c
-+++ b/libnuma.c
-@@ -791,10 +791,10 @@ long long numa_node_size64(int node, long long *freep)
- 
- make_internal_alias(numa_node_size64);
- 
--long numa_node_size(int node, long *freep)
-+long long numa_node_size(int node, long long *freep)
- {
- 	long long f2;
--	long sz = numa_node_size64_int(node, &f2);
-+	long long sz = numa_node_size64_int(node, &f2);
- 	if (freep)
- 		*freep = f2;
- 	return sz;
-diff --git a/numa.h b/numa.h
-index 3a8c543..268fb1d 100644
---- a/numa.h
-+++ b/numa.h
-@@ -143,7 +143,7 @@ int numa_preferred(void);
- 
- /* Return node size and free memory */
- long long numa_node_size64(int node, long long *freep);
--long numa_node_size(int node, long *freep);
-+long long numa_node_size(int node, long long *freep);
- 
- int numa_pagesize(void);
- 
-diff --git a/numademo.c b/numademo.c
-index a720db0..8c56da8 100644
---- a/numademo.c
-+++ b/numademo.c
-@@ -301,7 +301,7 @@ int max_node, numnodes;
- int get_node_list(void)
- {
-         int a, got_nodes = 0;
--        long free_node_sizes;
-+        long long free_node_sizes;
- 
-         numnodes = numa_num_configured_nodes();
-         node_to_use = (int *)malloc(numnodes * sizeof(int));
-diff --git a/test/move_pages.c b/test/move_pages.c
-index d1d8436..f8ff25d 100644
---- a/test/move_pages.c
-+++ b/test/move_pages.c
-@@ -26,7 +26,7 @@ int *node_to_use;
- int get_node_list()
- {
-         int a, got_nodes = 0, max_node, numnodes;
--        long free_node_sizes;
-+        long long free_node_sizes;
- 
-         numnodes = numa_num_configured_nodes();
-         node_to_use = (int *)malloc(numnodes * sizeof(int));
--- 
-2.23.0
-
diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index e45afe9ee8..5640173aa9 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -10,16 +10,15 @@ inherit autotools-brokensep ptest
 
 LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=f8ff2391624f28e481299f3f677b21bb"
 
-SRCREV = "5d9f16722e3df49dc618a9f361bd482559695db7"
-PV = "2.0.13+git${SRCPV}"
+SRCREV = "dd6de072c92c892a86e18c0fd0dfa1ba57a9a05d"
+PV = "2.0.14"
 
 SRC_URI = "git://github.com/numactl/numactl \
-    file://Fix-the-test-output-format.patch \
-    file://Makefile \
-    file://run-ptest \
-    file://0001-define-run-test-target.patch \
-    file://0001-numademo-fix-error-on-32bit-system.patch \
-"
+           file://Fix-the-test-output-format.patch \
+           file://Makefile \
+           file://run-ptest \
+           file://0001-define-run-test-target.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

