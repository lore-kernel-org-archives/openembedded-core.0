Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7FA7573689
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 14:27:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 16 Mar 2015 07:21:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,409,1422950400"; d="scan'208";a="692802102"
Received: from sgconnee-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.217])
	by fmsmga002.fm.intel.com with ESMTP; 16 Mar 2015 07:27:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 14:27:07 +0000
Message-Id: <9136b2c6c109f4e5f9daaaa08f12d65c6ff31344.1426515937.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1426515937.git.paul.eggleton@linux.intel.com>
References: <cover.1426515937.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1426515937.git.paul.eggleton@linux.intel.com>
References: <cover.1426515937.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] opkg: drop already applied patch
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
X-List-Received-Date: Mon, 16 Mar 2015 14:27:13 -0000

This patch was part of the 0.2.4 release.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...g_remove.c-avoid-remove-pkg-repeatly-with.patch | 39 ----------------------
 meta/recipes-devtools/opkg/opkg_0.2.4.bb           |  1 -
 2 files changed, 40 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch

diff --git a/meta/recipes-devtools/opkg/opkg/libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch b/meta/recipes-devtools/opkg/opkg/libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch
deleted file mode 100644
index 5e5eafc..0000000
--- a/meta/recipes-devtools/opkg/opkg/libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 41425d67d3589b1912416a17f740d6407c7834f2 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 8 Oct 2014 19:53:13 +0800
-Subject: [PATCH] libopkg/opkg_remove.c: avoid remove pkg repeatly with option
- --force-removal-of-dependent-packages
-
-While remove pkg with '--force-removal-of-dependent-packages',
-pkg may be added to pkgs remove list multiple times, add status
-check to make sure pkg only be removed once.
-
-Upstream-Status: Backport
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- libopkg/opkg_remove.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/libopkg/opkg_remove.c b/libopkg/opkg_remove.c
-index 34f9154..a225e41 100644
---- a/libopkg/opkg_remove.c
-+++ b/libopkg/opkg_remove.c
-@@ -250,6 +250,14 @@ opkg_remove_pkg(pkg_t *pkg, int from_upgrade)
-      if ((parent_pkg = pkg->parent) == NULL)
- 	  return 0;
- 
-+     /* While remove pkg with '--force-removal-of-dependent-packages',
-+        pkg may be added to remove list multiple times, add status
-+        check to make sure pkg only be removed once. */
-+     if (conf->force_removal_of_dependent_packages &&
-+             pkg->state_flag & SF_FILELIST_CHANGED &&
-+             pkg->state_status == SS_NOT_INSTALLED)
-+         return 0;
-+
-      /* only attempt to remove dependent installed packages if
-       * force_depends is not specified or the package is being
-       * replaced.
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/opkg/opkg_0.2.4.bb b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
index 447f3f6..23a32e6 100644
--- a/meta/recipes-devtools/opkg/opkg_0.2.4.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
@@ -12,7 +12,6 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://no-install-recommends.patch \
            file://add-exclude.patch \
-           file://libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch \
            file://remove-ACLOCAL_AMFLAGS-I-shave-I-m4.patch \
            file://opkg-configure.service \
            file://opkg.conf \
-- 
1.9.3


