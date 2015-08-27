Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4E9A9736B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 12:37:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 27 Aug 2015 05:37:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="791975279"
Received: from djcarton-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.50])
	by orsmga002.jf.intel.com with ESMTP; 27 Aug 2015 05:37:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 13:36:53 +0100
Message-Id: <762e79dfb769e885758bdcc627fadbe4dc6454fd.1440678731.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440678731.git.paul.eggleton@linux.intel.com>
References: <cover.1440678731.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1440678731.git.paul.eggleton@linux.intel.com>
References: <cover.1440678731.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 1/1] classes/whitelist: add class to allow whitelisting recipes from a layer
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
X-List-Received-Date: Thu, 27 Aug 2015 12:37:43 -0000

Allow restricting recipes brought from a layer to a specified list. This
is similar in operation to blacklist.bbclass, but instead specifies a
per-layer whitelist of recipes (matched by PN or BPN) that are able to
be built from the layer - anything else is skipped. This is potentially
useful where you want to bring in a select set of recipes from a larger
layer e.g. meta-oe.

Implements [YOCTO #8150].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/whitelist.bbclass | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta/classes/whitelist.bbclass

diff --git a/meta/classes/whitelist.bbclass b/meta/classes/whitelist.bbclass
new file mode 100644
index 0000000..ab6ac73
--- /dev/null
+++ b/meta/classes/whitelist.bbclass
@@ -0,0 +1,34 @@
+# Class that allows you to restrict the recipes brought from a layer to
+# a specified list. This is similar in operation to blacklist.bbclass
+# but note the difference in how PNWHITELIST is set - we don't use varflags
+# here, the recipe name goes in the value and we use an override for the
+# layer name (although this is not strictly required - you can have one
+# PNWHITELIST value shared by all of the layers specified in
+# PNWHITELIST_LAYERS). The layer name used here is actually the name that
+# gets added to BBFILE_COLLECTIONS in the layer's layer.conf, which may
+# differ from how the layer is otherwise known - e.g. meta-oe uses
+# "openembedded-layer".
+#
+# INHERIT += "whitelist"
+# PNWHITELIST_LAYERS = "layername"
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
+        layers = (d.getVar('PNWHITELIST_LAYERS', True) or '').split()
+        if layer in layers:
+            localdata = bb.data.createCopy(d)
+            localdata.setVar('OVERRIDES', layer)
+            whitelist = (localdata.getVar('PNWHITELIST', True) or '').split()
+            if not (d.getVar('PN', True) in whitelist or d.getVar('BPN', True) in whitelist):
+                reason = localdata.getVar('PNWHITELIST_REASON', True)
+                if not reason:
+                    reason = 'not in PNWHITELIST for layer %s' % layer
+                raise bb.parse.SkipRecipe(reason)
+}
-- 
2.1.0


