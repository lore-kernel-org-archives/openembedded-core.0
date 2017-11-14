Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DB147784B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:57:54 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:57:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402201"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:57:55 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:37 +0200
Message-Id: <20171114145754.9643-10-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/27] dtc: update to 1.4.5
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
X-List-Received-Date: Tue, 14 Nov 2017 14:57:55 -0000

Also fix upstream check and disable newly added python2-only bindings
(as there is no clear need for them and python 2 is deprecated).

Add a backported patch to address format errors when compiling.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/dtc/dtc.inc                    |  6 ++-
 ...cks-Use-proper-format-modifier-for-size_t.patch | 43 ++++++++++++++++++++++
 .../dtc/{dtc_1.4.4.bb => dtc_1.4.5.bb}             |  2 +-
 3 files changed, 48 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-checks-Use-proper-format-modifier-for-size_t.patch
 rename meta/recipes-kernel/dtc/{dtc_1.4.4.bb => dtc_1.4.5.bb} (81%)

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index d75994661a6..d259c57e8d9 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -7,9 +7,11 @@ DEPENDS = "flex-native bison-native"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
            file://make_install.patch \
-	  "
+           file://0001-checks-Use-proper-format-modifier-for-size_t.patch \
+           "
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-EXTRA_OEMAKE='PREFIX="${prefix}" LIBDIR="${libdir}" DESTDIR="${D}"'
+EXTRA_OEMAKE='NO_PYTHON=1 PREFIX="${prefix}" LIBDIR="${libdir}" DESTDIR="${D}"'
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/dtc/dtc/0001-checks-Use-proper-format-modifier-for-size_t.patch b/meta/recipes-kernel/dtc/dtc/0001-checks-Use-proper-format-modifier-for-size_t.patch
new file mode 100644
index 00000000000..cab384dd99a
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/0001-checks-Use-proper-format-modifier-for-size_t.patch
@@ -0,0 +1,43 @@
+From c7a4c3817796107bb824a1f173faf90fae45396b Mon Sep 17 00:00:00 2001
+From: Thierry Reding <treding@nvidia.com>
+Date: Wed, 27 Sep 2017 15:04:09 +0200
+Subject: [PATCH] checks: Use proper format modifier for size_t
+
+The size of size_t can vary between architectures, so using %ld isn't
+going to work on 32-bit builds. Use the %zu modifier to make sure it is
+always correct.
+
+Upstream-Status: Backport
+Signed-off-by: Thierry Reding <treding@nvidia.com>
+Acked-by: Rob Herring <robh@kernel.org>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ checks.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/checks.c b/checks.c
+index 902f2e3..08a3a29 100644
+--- a/checks.c
++++ b/checks.c
+@@ -972,7 +972,7 @@ static void check_property_phandle_args(struct check *c,
+ 	int cell, cellsize = 0;
+ 
+ 	if (prop->val.len % sizeof(cell_t)) {
+-		FAIL(c, dti, "property '%s' size (%d) is invalid, expected multiple of %ld in node %s",
++		FAIL(c, dti, "property '%s' size (%d) is invalid, expected multiple of %zu in node %s",
+ 		     prop->name, prop->val.len, sizeof(cell_t), node->fullpath);
+ 		return;
+ 	}
+@@ -1163,7 +1163,7 @@ static void check_interrupts_property(struct check *c,
+ 		return;
+ 
+ 	if (irq_prop->val.len % sizeof(cell_t))
+-		FAIL(c, dti, "property '%s' size (%d) is invalid, expected multiple of %ld in node %s",
++		FAIL(c, dti, "property '%s' size (%d) is invalid, expected multiple of %zu in node %s",
+ 		     irq_prop->name, irq_prop->val.len, sizeof(cell_t),
+ 		     node->fullpath);
+ 
+-- 
+2.15.0
+
diff --git a/meta/recipes-kernel/dtc/dtc_1.4.4.bb b/meta/recipes-kernel/dtc/dtc_1.4.5.bb
similarity index 81%
rename from meta/recipes-kernel/dtc/dtc_1.4.4.bb
rename to meta/recipes-kernel/dtc/dtc_1.4.5.bb
index eadb7bab6f7..0e46cfbeb4f 100644
--- a/meta/recipes-kernel/dtc/dtc_1.4.4.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.4.5.bb
@@ -3,7 +3,7 @@ require dtc.inc
 LIC_FILES_CHKSUM = "file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://libfdt/libfdt.h;beginline=3;endline=52;md5=fb360963151f8ec2d6c06b055bcbb68c"
 
-SRCREV = "558cd81bdd432769b59bff01240c44f82cfb1a9d"
+SRCREV = "22a65c5331c22979d416738eb756b9541672e00d"
 
 S = "${WORKDIR}/git"
 
-- 
2.15.0


