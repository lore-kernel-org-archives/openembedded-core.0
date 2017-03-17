Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 08EB572FE3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 13:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489756478; x=1521292478;
	h=from:to:cc:subject:date:message-id;
	bh=zXBJZ/FC2Cpx7pMnys/7rERpZbBWG4cndSbZHcg7NIM=;
	b=aAm9QTJR67L6+htzS69olk3z8bq3eW1DyolFxAsJPnoVty5ZGwcbyBpm
	gUagxrUzHFXQoH7aeAekyAeP7PijBw==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Mar 2017 06:14:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,176,1486454400"; d="scan'208";a="237485576"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 17 Mar 2017 06:14:36 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id B11AA2C8001;
	Fri, 17 Mar 2017 06:14:31 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Mar 2017 15:14:33 +0200
Message-Id: <1489756473-3469-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] neard: Fix parallel build issue
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
X-List-Received-Date: Fri, 17 Mar 2017 13:14:37 -0000

This only started showing up now for some reason but it does seem like
a legitimate bug in Makefile.am.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...0001-Add-header-dependency-to-nciattach.o.patch | 35 ++++++++++++++++++++++
 meta/recipes-connectivity/neard/neard_0.16.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch

diff --git a/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch b/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch
new file mode 100644
index 0000000..d8e8a5e
--- /dev/null
+++ b/meta/recipes-connectivity/neard/neard/0001-Add-header-dependency-to-nciattach.o.patch
@@ -0,0 +1,35 @@
+From affaa2021a54c30353e4e1fee09c13a4de2196be Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Fri, 17 Mar 2017 14:24:29 +0200
+Subject: [PATCH] Add header dependency to nciattach.o
+
+This can happen when compiling nciattach.o:
+
+| In file included from ../neard-0.16/tools/nciattach.c:47:0:
+| ../neard-0.16/src/near.h:30:27: fatal error: near/nfc_copy.h: No such
+file or directory
+|  #include <near/nfc_copy.h>
+
+Add the missing dependency to local headers.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Submitted [mailinglist]
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index fa552ee..acef6ba 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -253,6 +253,7 @@ se/builtin.h: src/genbuiltin $(builtin_se_sources)
+ 
+ $(src_neard_OBJECTS) \
+ $(tools_nfctool_nfctool_OBJECTS) \
++$(tools_nciattach_OBJECTS) \
+ $(plugin_objects) \
+ $(se_seeld_OBJECTS) \
+ $(unit_test_ndef_parse_OBJECTS) \
+-- 
+2.11.0
+
diff --git a/meta/recipes-connectivity/neard/neard_0.16.bb b/meta/recipes-connectivity/neard/neard_0.16.bb
index d6157a8..cc6af4e 100644
--- a/meta/recipes-connectivity/neard/neard_0.16.bb
+++ b/meta/recipes-connectivity/neard/neard_0.16.bb
@@ -9,6 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BP}.tar.xz \
            file://neard.in \
            file://Makefile.am-fix-parallel-issue.patch \
            file://Makefile.am-do-not-ship-version.h.patch \
+           file://0001-Add-header-dependency-to-nciattach.o.patch \
           "
 SRC_URI[md5sum] = "5c691fb7872856dc0d909c298bc8cb41"
 SRC_URI[sha256sum] = "eae3b11c541a988ec11ca94b7deab01080cd5b58cfef3ced6ceac9b6e6e65b36"
-- 
2.1.4


