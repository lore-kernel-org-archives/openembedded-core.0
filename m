Return-Path: <mihai.prica@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id AE02A6BB58
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 15:00:15 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Aug 2013 08:00:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,968,1367996400"; d="scan'208";a="287368564"
Received: from unknown (HELO mihai-Vostro-460.rb.intel.com) ([10.237.105.31])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Aug 2013 08:00:15 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 17:59:38 +0300
Message-Id: <30d70fc2b528ad0e0d9b900cd4d76a72ce05ba8c.1377613447.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1377613447.git.mihai.prica@intel.com>
References: <cover.1377613447.git.mihai.prica@intel.com>
In-Reply-To: <cover.1377613447.git.mihai.prica@intel.com>
References: <cover.1377613447.git.mihai.prica@intel.com>
Subject: [PATCH 4/5] vala.bbclass: add class from meta-oe
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
X-List-Received-Date: Tue, 27 Aug 2013 15:00:16 -0000

This can be used by packages written in vala.
It is required by the Midori web-browser.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 meta/classes/vala.bbclass |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/classes/vala.bbclass

diff --git a/meta/classes/vala.bbclass b/meta/classes/vala.bbclass
new file mode 100644
index 0000000..c7db08c
--- /dev/null
+++ b/meta/classes/vala.bbclass
@@ -0,0 +1,18 @@
+# Vala has problems with multiple concurrent invocations
+PARALLEL_MAKE = ""
+
+# Vala needs vala-native
+DEPENDS += "vala-native"
+DEPENDS_virtclass-native += "vala-native"
+
+# Our patched version of Vala looks in STAGING_DATADIR for .vapi files
+export STAGING_DATADIR
+# Upstream Vala >= 0.11 looks in XDG_DATA_DIRS for .vapi files
+export XDG_DATA_DIRS = "${STAGING_DATADIR}"
+
+# Package additional files
+FILES_${PN}-dev += "\
+    ${datadir}/vala/vapi/*.vapi \
+    ${datadir}/vala/vapi/*.deps \
+    ${datadir}/gir-1.0 \
+"
-- 
1.7.9.5


