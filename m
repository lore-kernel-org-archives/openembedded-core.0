Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7ED2B7017C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 22:23:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 29 Feb 2016 14:22:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,521,1449561600"; d="scan'208";a="897852962"
Received: from bitbang.jf.intel.com ([10.7.199.90])
	by orsmga001.jf.intel.com with ESMTP; 29 Feb 2016 14:22:41 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 14:22:36 -0800
Message-Id: <1456784556-10514-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] populate_sdk_ext: Only write LCONF_VERSION to bblayers if it is set
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
X-List-Received-Date: Mon, 29 Feb 2016 22:23:04 -0000

It is possible that LCONF_VERSION won't be set, such as if meta-poky is
used. Without this change, bblayers.conf would have LCONF_VERSION =
"None" if LCONF_VERSION wasn't set, which would cause a sanity check
failure.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 9e2fc61..674e1af 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -143,7 +143,12 @@ python copy_buildsystem () {
         f.write('# this configuration provides, it is strongly suggested that you set\n')
         f.write('# up a proper instance of the full build system and use that instead.\n\n')
 
-        f.write('LCONF_VERSION = "%s"\n\n' % d.getVar('LCONF_VERSION', False))
+        # LCONF_VERSION may not be set, for example when using meta-poky
+        # so don't error if it isn't found
+        lconf_version = d.getVar('LCONF_VERSION', False)
+        if lconf_version is not None:
+            f.write('LCONF_VERSION = "%s"\n\n' % lconf_version)
+
         f.write('BBPATH = "$' + '{TOPDIR}"\n')
         f.write('SDKBASEMETAPATH = "$' + '{TOPDIR}"\n')
         f.write('BBLAYERS := " \\\n')
-- 
2.5.0


