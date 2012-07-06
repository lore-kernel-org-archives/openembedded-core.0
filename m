Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1SnFKt-00028t-O6
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 22:41:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Jul 2012 13:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="168088981"
Received: from unknown (HELO localhost) ([10.255.13.37])
	by orsmga002.jf.intel.com with ESMTP; 06 Jul 2012 13:30:00 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri,  6 Jul 2012 15:29:57 -0500
Message-Id: <a2ba99c6c2be42f7d30f5827361b0a6892659997.1341606068.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1341606068.git.tom.zanussi@intel.com>
References: <cover.1341606068.git.tom.zanussi@intel.com>
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
X-List-Received-Date: Fri, 06 Jul 2012 20:41:08 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Add a perf.inc to contain utility functions and definitions and to
avoid cluttering up the main recipe.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/perf/perf.inc    |   30 ++++++++++++++++++++++++++++++
 meta/recipes-kernel/perf/perf_3.4.bb |    2 ++
 2 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/perf/perf.inc

diff --git a/meta/recipes-kernel/perf/perf.inc b/meta/recipes-kernel/perf/perf.inc
new file mode 100644
index 0000000..9b46311
--- /dev/null
+++ b/meta/recipes-kernel/perf/perf.inc
@@ -0,0 +1,30 @@
+def perf_arch_supports_feature(feature, trueval, falseval, d):
+    """
+    Check which perf features a particular architecture supports.
+
+    The perf_features_by_arch table below lists the perf features
+    supported by each arch.  If you want a particular arch to support
+    a given set of perf features, add an entry for the arch to this
+    table.  Otherwise the arch won't support any features (which may
+    be exactly what you want, just a barebones perf without any extra
+    baggage, which is what you get if you don't add any features
+    here.)
+
+    Available perf features:
+      perf-scripting: enable support for Perl and Python bindings
+      perf-tui: enable support for the perf TUI (via libnewt)
+
+    """
+    perf_features_by_arch = {
+	"core2":      "perf-scripting perf-tui",
+	"core2-64":   "perf-scripting perf-tui",
+	"x86":	      "perf-scripting perf-tui",
+	"x86-64":     "perf-scripting perf-tui",
+	"i586":	      "perf-scripting perf-tui",
+	}
+
+    tune = d.getVar("DEFAULTTUNE", True) or ""
+    if perf_features_by_arch.has_key(tune):
+	if feature in perf_features_by_arch[tune]:
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



