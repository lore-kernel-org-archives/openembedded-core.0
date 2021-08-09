Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.24726.1628523364931716435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 08:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="278466771"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="278466771"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:04 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="483462862"
Received: from abinzahx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.229.181])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:03 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/23] stress-ng: Drop defining daddr_t
Date: Mon,  9 Aug 2021 23:35:33 +0800
Message-Id: <7c5d4136388ba59aafa38be4a454355040d3e6a5.1628522214.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628522214.git.anuj.mittal@intel.com>
References: <cover.1628522214.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

This is fixed differently upstream [1]

[1] https://github.com/ColinIanKing/stress-ng/commit/7e150ab18b0e8954ca426eb5366000a8f0d01110
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 96b1d483ccf2166bf577e73075d5fe57c45bbfdf)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../stress-ng/stress-ng/no_daddr_t.patch      | 32 -------------------
 .../stress-ng/stress-ng_0.12.05.bb            |  2 --
 2 files changed, 34 deletions(-)
 delete mode 100644 meta/recipes-extended/stress-ng/stress-ng/no_daddr_t.patch

diff --git a/meta/recipes-extended/stress-ng/stress-ng/no_daddr_t.patch b/meta/recipes-extended/stress-ng/stress-ng/no_daddr_t.patch
deleted file mode 100644
index dba4494b91..0000000000
--- a/meta/recipes-extended/stress-ng/stress-ng/no_daddr_t.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 55e11765af2bdc8adfac87dab1fb2682f7e6c236 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 Jun 2020 22:10:28 -0700
-Subject: [PATCH] Define daddr_t if __DADDR_T_TYPE is not defined
-
-glibc defined daddr_t but musl does not, ideally it should not be used
-and simple int type is enough. However, its better to leave glibc behavior
-as it is and only define it to int if daddr_t is not provided by libc
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- stress-ng.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/stress-ng.h b/stress-ng.h
-index 1a66293..802dc25 100644
---- a/stress-ng.h
-+++ b/stress-ng.h
-@@ -3763,6 +3763,10 @@ struct shim_statx {
- 	uint64_t __spare2[14];
- };
- 
-+#ifndef __DADDR_T_TYPE
-+typedef int daddr_t;
-+#endif
-+
- /* old ustat struct */
- struct shim_ustat {
- #if defined(HAVE_DADDR_T)
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb
index eb6bdb4a81..3770ba9ae1 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.05.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
-           file://no_daddr_t.patch \
            "
 SRC_URI[sha256sum] = "af7779aee38e6d94726ed7d5cf36384a64d50c86e42fff89c141d8609913f425"
 
@@ -24,4 +23,3 @@ do_install() {
     oe_runmake DESTDIR=${D} install
     ln -s stress-ng ${D}${bindir}/stress
 }
-
-- 
2.31.1

