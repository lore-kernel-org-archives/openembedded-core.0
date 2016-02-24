Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A75FF771F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 14:52:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 24 Feb 2016 06:52:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,494,1449561600"; d="scan'208";a="893686019"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.7.109])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2016 06:52:39 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 14:52:09 +0000
Message-Id: <6372957b8304964030e874ad8e5b05b1727d7be8.1456325292.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
Subject: [PATCH 05/10] swupdbundle: new class to generate virtual images for swupd-image
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
X-List-Received-Date: Wed, 24 Feb 2016 14:52:40 -0000

Our initial strategy to generate bundles for consumption by swupd
is to generate images which contain the base image (os-core) plus
the additional contents of the bundle, then prune out the core
contents. By generating images in this manner we hope to accomodate
packages which modify the rootfs outside of installing files, i.e.
with postinsts.

To that end this class, to be used via BBCLASSEXTEND, will generate
virtual image recipes that add extra packages to the extended
image.

Only extensions matching entries in a SWUPD_BUNDLES variable are
valid and the bundle contents should be listed in a varFlag
matching the bundle's name on the BUNDLE_CONTENTS variable.

An example of usage in an image recipe follows:

SWUPD_BUNDLES = "foo bar"
BUNDLE_CONTENTS[foo] = "foo foo-bar foobaz"
BUNDLE_CONTENTS[bar] = "bar baz quux"

BBCLASSEXTEND = "swupdbundle:foo"

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/classes/swupdbundle.bbclass | 59 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 meta/classes/swupdbundle.bbclass

diff --git a/meta/classes/swupdbundle.bbclass b/meta/classes/swupdbundle.bbclass
new file mode 100644
index 0000000..897666d
--- /dev/null
+++ b/meta/classes/swupdbundle.bbclass
@@ -0,0 +1,59 @@
+# Our initial strategy to generate bundles for consumption by swupd is to
+# generate images which contain the base image (os-core) plus the additional
+# contents of the bundle, then prune out the core contents. By generating
+# images in this manner we hope to accomodate packages which modify the rootfs
+# outside of installing files, i.e.with postinsts.
+#
+# To that end this class, to be used via BBCLASSEXTEND, will generate virtual
+# image recipes that add extra packages to the extended image.
+#
+# Only extensions matching entries in a SWUPD_BUNDLES variable are valid and
+# the bundle contents should be listed in a varFlag matching the bundle's name
+# on the BUNDLE_CONTENTS variable. i.e in foo-image.bb:
+#
+# SWUPD_BUNDLES = "foo bar"
+# BUNDLE_CONTENTS[foo] = "foo foo-bar foobaz"
+# BUNDLE_CONTENTS[bar] = "bar baz quux"
+# BBCLASSEXTEND = "swupdbundle:foo"
+
+python swupdbundle_virtclass_handler () {
+    pn = e.data.getVar("PN", True)
+    cls = e.data.getVar("BBEXTENDCURR", True)
+    bundle = e.data.getVar("BBEXTENDVARIANT", True)
+
+    if cls != 'swupdbundle':
+        return
+
+    if not bundle:
+        bb.fatal('swupdbundle must be used with a parameter i.e. BBCLASSEXTEND="swupdbundle:foo"')
+
+    # Rename the virtual recipe to create the desired image bundle variant.
+    e.data.setVar("PN_BASE", pn)
+    pn = pn + '-' + bundle
+    e.data.setVar("PN", pn)
+    e.data.setVar("BUNDLE_NAME", bundle)
+
+    bundles = (e.data.getVar('SWUPD_BUNDLES', True) or "").split()
+    if not bundles:
+        bb.fatal('SWUPD_BUNDLES is not defined, this variable should list bundles for the image.')
+
+    curr_install = (e.data.getVar('IMAGE_INSTALL', True) or "").split()
+
+    def get_bundle_contents(bndl):
+        contents = e.data.getVarFlag('BUNDLE_CONTENTS', bndl, True)
+        if contents:
+            return contents.split()
+        else:
+            bb.fatal('BUNDLE_CONTENTS[%s] is not set, this should list the packages to be included in the bundle.' % bndl)
+
+    if bundle == 'mega':
+        for bndl in bundles:
+            curr_install += get_bundle_contents(bndl)
+    else:
+        curr_install += get_bundle_contents(bundle)
+
+    e.data.setVar('IMAGE_INSTALL', ' '.join(curr_install))
+}
+
+addhandler swupdbundle_virtclass_handler
+swupdbundle_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
-- 
2.5.0


