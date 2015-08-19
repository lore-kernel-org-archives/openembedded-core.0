Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7F76373E20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 13:34:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 19 Aug 2015 06:34:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,710,1432623600"; d="scan'208";a="787060591"
Received: from mclawlor-mobl5.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.12.193])
	by orsmga002.jf.intel.com with ESMTP; 19 Aug 2015 06:34:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Aug 2015 14:34:45 +0100
Message-Id: <d1dcc85512f0c7b9b93f2780048bb9fad8c9da2d.1439991144.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1439991144.git.paul.eggleton@linux.intel.com>
References: <cover.1439991144.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1439991144.git.paul.eggleton@linux.intel.com>
References: <cover.1439991144.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 1/1] classes/whitelist: add class to allow whitelisting recipes from a layer
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
X-List-Received-Date: Wed, 19 Aug 2015 13:34:52 -0000

Allow restricting recipes brought from a layer to a specified list. This
is similar in operation to blacklist.bbclass, but instead specifies a
per-layer whitelist of recipes (matched by BPN) that are able to be
built from the layer - anything else is skipped. This is potentially
useful where you want to bring in a select set of recipes from a larger
layer e.g. meta-oe.

Implements [YOCTO #8150].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/whitelist.bbclass | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta/classes/whitelist.bbclass

diff --git a/meta/classes/whitelist.bbclass b/meta/classes/whitelist.bbclass
new file mode 100644
index 0000000..2554185
--- /dev/null
+++ b/meta/classes/whitelist.bbclass
@@ -0,0 +1,28 @@
+# Class that allows you to restrict the recipes brought from a layer to
+# a specified list. This is similar in operation to blacklist.bbclass
+# but note the difference in how PNWHITELIST is set - we don't use varflags
+# here, we use an override for the layer name. This layer name is actually
+# the name that gets added to BBFILE_COLLECTIONS in the layer's layer.conf,
+# which may differ from how the layer is otherwise known.
+#
+# INHERIT += "whitelist"
+# PNWHITELIST_layername = "recipe1 recipe2"
+#
+# If you would prefer to set a reason message other than the default, you
+# can do so:
+#
+# PNWHITELIST_REASON_layername = "not supported by ${DISTRO}"
+
+python() {
+    layer = bb.utils.get_file_layer(d.getVar('FILE', True), d)
+    if layer:
+        localdata = bb.data.createCopy(d)
+        localdata.setVar('OVERRIDES', layer)
+        whitelist = localdata.getVar('PNWHITELIST', True)
+        if whitelist:
+            if not d.getVar('BPN', True) in whitelist.split():
+                reason = localdata.getVar('PNWHITELIST_REASON', True)
+                if not reason:
+                    reason = 'not in PNWHITELIST set for layer %s' % layer
+                raise bb.parse.SkipRecipe(reason)
+}
-- 
2.1.0


