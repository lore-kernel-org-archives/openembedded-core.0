Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5910D7858F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 13:37:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Feb 2018 05:37:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,448,1511856000"; d="scan'208";a="31468029"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2018 05:37:19 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 556C9580319
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 05:37:19 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Feb 2018 15:33:14 +0200
Message-Id: <1517578395-28398-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] libsolv: upgrade to version 0.6.31
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
X-List-Received-Date: Fri, 02 Feb 2018 13:37:19 -0000

Remove upstreamed patch:
        0001-repo_rpmdb.c-increase-MAX_HDR_CNT-and-MAX_HDR_DSIZE.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ....c-increase-MAX_HDR_CNT-and-MAX_HDR_DSIZE.patch | 35 ----------------------
 .../{libsolv_0.6.29.bb => libsolv_0.6.31.bb}       |  3 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta/recipes-extended/libsolv/libsolv/0001-repo_rpmdb.c-increase-MAX_HDR_CNT-and-MAX_HDR_DSIZE.patch
 rename meta/recipes-extended/libsolv/{libsolv_0.6.29.bb => libsolv_0.6.31.bb} (87%)

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-repo_rpmdb.c-increase-MAX_HDR_CNT-and-MAX_HDR_DSIZE.patch b/meta/recipes-extended/libsolv/libsolv/0001-repo_rpmdb.c-increase-MAX_HDR_CNT-and-MAX_HDR_DSIZE.patch
deleted file mode 100644
index 4a4e5cb..0000000
--- a/meta/recipes-extended/libsolv/libsolv/0001-repo_rpmdb.c-increase-MAX_HDR_CNT-and-MAX_HDR_DSIZE.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1c4c935cb73ac1ccb9693df1a51ba218a22e8ca8 Mon Sep 17 00:00:00 2001
-From: Ming Liu <liu.ming50@gmail.com>
-Date: Sat, 30 Sep 2017 11:15:16 +0800
-Subject: [PATCH] repo_rpmdb.c: increase MAX_HDR_CNT and MAX_HDR_DSIZE
-
-Upstream-Status: Submitted [https://github.com/openSUSE/libsolv/pull/230]
-
-We encountered 'corrupt rpm' issues when installing extreme big RPM
-packages like the kernel-devsrc package of Yocto project.
-
-It can be fixed by increasing MAX_HDR_CNT and MAX_HDR_DSIZE per test.
-
-Signed-off-by: Ming Liu <liu.ming50@gmail.com>
----
- ext/repo_rpmdb.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ext/repo_rpmdb.c b/ext/repo_rpmdb.c
-index c7000a9..7000835 100644
---- a/ext/repo_rpmdb.c
-+++ b/ext/repo_rpmdb.c
-@@ -170,8 +170,8 @@
- #define MAX_SIG_CNT		0x100000
- #define MAX_SIG_DSIZE		0x100000
- 
--#define MAX_HDR_CNT		0x100000
--#define MAX_HDR_DSIZE		0x2000000
-+#define MAX_HDR_CNT		0x200000
-+#define MAX_HDR_DSIZE		0x4000000
- 
- typedef struct rpmhead {
-   int cnt;
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.29.bb b/meta/recipes-extended/libsolv/libsolv_0.6.31.bb
similarity index 87%
rename from meta/recipes-extended/libsolv/libsolv_0.6.29.bb
rename to meta/recipes-extended/libsolv/libsolv_0.6.31.bb
index 78972e5..96c366b 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.29.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.31.bb
@@ -8,13 +8,12 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "expat zlib rpm"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
-           file://0001-repo_rpmdb.c-increase-MAX_HDR_CNT-and-MAX_HDR_DSIZE.patch \
           "
 SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation.patch \
                              file://0002-Fixes-to-internal-fopencookie-implementation.patch \
                            "
 
-SRCREV = "765be095eaeaef1b1d2a84f6a0e00d5abf677ae9"
+SRCREV = "bef46d75f6d2537060114eea0f3a892e958ad5e0"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


