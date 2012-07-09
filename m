Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1SoHbL-0006KS-Ll
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:18:23 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Jul 2012 10:07:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120403856"
Received: from unknown (HELO localhost) ([10.255.13.39])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Jul 2012 10:07:12 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, sgw@linux.intel.com
Date: Mon,  9 Jul 2012 12:07:09 -0500
Message-Id: <60e821b5a17b9199ba65f4bd6480c858cc351109.1341852059.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1341852059.git.tom.zanussi@intel.com>
References: <cover.1341852059.git.tom.zanussi@intel.com>
Subject: [PATCH 1/3] perf: add perf.inc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2012 17:18:23 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Add a perf.inc to contain utility functions and definitions and to
avoid cluttering up the main recipe.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/perf/perf.inc    |   22 ++++++++++++++++++++++
 meta/recipes-kernel/perf/perf_3.4.bb |    2 ++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/perf/perf.inc

diff --git a/meta/recipes-kernel/perf/perf.inc b/meta/recipes-kernel/perf/perf.inc
new file mode 100644
index 0000000..d112751
--- /dev/null
+++ b/meta/recipes-kernel/perf/perf.inc
@@ -0,0 +1,22 @@
+PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
+
+def perf_feature_enabled(feature, trueval, falseval, d):
+    """
+    Check which perf features are enabled.
+
+    The PERF_FEATURES_ENABLE variable lists the perf features to
+    enable.  Override it if you want something different from what's
+    listed above, which is the default.  If empty, the build won't
+    enable any features (which may be exactly what you want, just a
+    barebones perf without any extra baggage, what you get if you
+    specify an empty feature list).
+
+    Available perf features:
+      perf-scripting: enable support for Perl and Python bindings
+      perf-tui: enable support for the perf TUI (via libnewt)
+
+    """
+    enabled_features = d.getVar("PERF_FEATURES_ENABLE", True) or ""
+    if feature in enabled_features:
+		return trueval
+    return falseval
diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index 381332e..d494243 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 PR = "r1"
 
+require perf.inc
+
 BUILDPERF_libc-uclibc = "no"
 
 DEPENDS = "virtual/kernel \
-- 
1.7.0.4



