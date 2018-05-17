Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA326FEFE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 11:46:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2018 04:46:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,410,1520924400"; d="scan'208";a="229395359"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 17 May 2018 04:46:05 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2018 14:38:28 +0300
Message-Id: <20180517113837.24240-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH 01/10] dtc: upgrade to 1.4.6
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
X-List-Received-Date: Thu, 17 May 2018 11:46:05 -0000

Drop upstreamed patch.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/dtc/dtc.inc               |  1 -
 ...se-proper-format-modifier-for-size_t.patch | 43 -------------------
 .../dtc/{dtc_1.4.5.bb => dtc_1.4.6.bb}        |  2 +-
 3 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta/recipes-kernel/dtc/dtc/0001-checks-Use-proper-format-modifier-for-size_t.patch
 rename meta/recipes-kernel/dtc/{dtc_1.4.5.bb => dtc_1.4.6.bb} (81%)

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index 9a90d440416..7a923bf5206 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -7,7 +7,6 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
            file://make_install.patch \
-           file://0001-checks-Use-proper-format-modifier-for-size_t.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-kernel/dtc/dtc/0001-checks-Use-proper-format-modifier-for-size_t.patch b/meta/recipes-kernel/dtc/dtc/0001-checks-Use-proper-format-modifier-for-size_t.patch
deleted file mode 100644
index cab384dd99a..00000000000
--- a/meta/recipes-kernel/dtc/dtc/0001-checks-Use-proper-format-modifier-for-size_t.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From c7a4c3817796107bb824a1f173faf90fae45396b Mon Sep 17 00:00:00 2001
-From: Thierry Reding <treding@nvidia.com>
-Date: Wed, 27 Sep 2017 15:04:09 +0200
-Subject: [PATCH] checks: Use proper format modifier for size_t
-
-The size of size_t can vary between architectures, so using %ld isn't
-going to work on 32-bit builds. Use the %zu modifier to make sure it is
-always correct.
-
-Upstream-Status: Backport
-Signed-off-by: Thierry Reding <treding@nvidia.com>
-Acked-by: Rob Herring <robh@kernel.org>
-Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- checks.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/checks.c b/checks.c
-index 902f2e3..08a3a29 100644
---- a/checks.c
-+++ b/checks.c
-@@ -972,7 +972,7 @@ static void check_property_phandle_args(struct check *c,
- 	int cell, cellsize = 0;
- 
- 	if (prop->val.len % sizeof(cell_t)) {
--		FAIL(c, dti, "property '%s' size (%d) is invalid, expected multiple of %ld in node %s",
-+		FAIL(c, dti, "property '%s' size (%d) is invalid, expected multiple of %zu in node %s",
- 		     prop->name, prop->val.len, sizeof(cell_t), node->fullpath);
- 		return;
- 	}
-@@ -1163,7 +1163,7 @@ static void check_interrupts_property(struct check *c,
- 		return;
- 
- 	if (irq_prop->val.len % sizeof(cell_t))
--		FAIL(c, dti, "property '%s' size (%d) is invalid, expected multiple of %ld in node %s",
-+		FAIL(c, dti, "property '%s' size (%d) is invalid, expected multiple of %zu in node %s",
- 		     irq_prop->name, irq_prop->val.len, sizeof(cell_t),
- 		     node->fullpath);
- 
--- 
-2.15.0
-
diff --git a/meta/recipes-kernel/dtc/dtc_1.4.5.bb b/meta/recipes-kernel/dtc/dtc_1.4.6.bb
similarity index 81%
rename from meta/recipes-kernel/dtc/dtc_1.4.5.bb
rename to meta/recipes-kernel/dtc/dtc_1.4.6.bb
index 0e46cfbeb4f..78c57363926 100644
--- a/meta/recipes-kernel/dtc/dtc_1.4.5.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.4.6.bb
@@ -3,7 +3,7 @@ require dtc.inc
 LIC_FILES_CHKSUM = "file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://libfdt/libfdt.h;beginline=3;endline=52;md5=fb360963151f8ec2d6c06b055bcbb68c"
 
-SRCREV = "22a65c5331c22979d416738eb756b9541672e00d"
+SRCREV = "e54388015af1fb4bf04d0bca99caba1074d9cc42"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.0


