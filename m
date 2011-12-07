Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RYNND-0002I3-3v
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 20:41:48 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Dec 2011 11:34:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99763164"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.12.36])
	by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2011 11:34:59 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2011 11:34:43 -0800
Message-Id: <6c65669e1c223d59020c581750599c11ee222063.1323286080.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <025adb591e6811bcd1bc5480d6c297015d373a02.1323286080.git.elizabeth.flanagan@intel.com>
References: <025adb591e6811bcd1bc5480d6c297015d373a02.1323286080.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1323286080.git.elizabeth.flanagan@intel.com>
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 4/8] Add copyleft compliance class
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
X-List-Received-Date: Wed, 07 Dec 2011 19:41:48 -0000

From: Christopher Larson <kergoth@gmail.com>

Deploys sources for recipes for compliance with copyleft-style licenses
Defaults to using symlinks, as it's a quick operation, and one can easily
follow the links when making use of the files (e.g. tar with the -h arg).

By default, includes all GPL and LGPL, and excludes CLOSED and Proprietary.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/classes/copyleft_compliance.bbclass |   94 ++++++++++++++++++++++++++++++
 1 files changed, 94 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/copyleft_compliance.bbclass

diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyleft_compliance.bbclass
new file mode 100644
index 0000000..5d9ab11
--- /dev/null
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -0,0 +1,94 @@
+# Deploy sources for recipes for compliance with copyleft-style licenses
+# Defaults to using symlinks, as it's a quick operation, and one can easily
+# follow the links when making use of the files (e.g. tar with the -h arg).
+#
+# By default, includes all GPL and LGPL, and excludes CLOSED and Proprietary.
+#
+# vi:sts=4:sw=4:et
+
+COPYLEFT_SOURCES_DIR ?= '${DEPLOY_DIR}/copyleft_sources'
+
+COPYLEFT_LICENSE_INCLUDE ?= 'GPL* LGPL*'
+COPYLEFT_LICENSE_INCLUDE[type] = 'list'
+COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which include licenses'
+
+COPYLEFT_LICENSE_EXCLUDE ?= 'CLOSED Proprietary'
+COPYLEFT_LICENSE_EXCLUDE[type] = 'list'
+COPYLEFT_LICENSE_INCLUDE[doc] = 'Space separated list of globs which exclude licenses'
+
+
+def copyleft_should_include(d):
+    """Determine if this recipe's sources should be deployed for compliance"""
+    import ast
+    import oe.license
+    from fnmatch import fnmatchcase as fnmatch
+
+    if oe.utils.inherits(d, 'native', 'nativesdk', 'cross', 'crossdk'):
+        # not a target recipe
+        return
+
+    include = oe.data.typed_value('COPYLEFT_LICENSE_INCLUDE', d)
+    exclude = oe.data.typed_value('COPYLEFT_LICENSE_EXCLUDE', d)
+
+    def include_license(license):
+        if any(fnmatch(license, pattern) for pattern in exclude):
+            return False
+        if any(fnmatch(license, pattern) for pattern in include):
+            return True
+        return False
+
+    def choose_licenses(a, b):
+        """Select the left option in an OR if all its licenses are to be included"""
+        if all(include_license(lic) for lic in a):
+            return a
+        else:
+            return b
+
+    try:
+        licenses = oe.license.flattened_licenses(d.getVar('LICENSE', True), choose_licenses)
+    except oe.license.InvalidLicense as exc:
+        bb.fatal('%s: %s' % (d.getVar('PF', True), exc))
+
+    return all(include_license(lic) for lic in licenses)
+
+python do_prepare_copyleft_sources () {
+    """Populate a tree of the recipe sources and emit patch series files"""
+    import os.path
+    import shutil
+
+    if not copyleft_should_include(d):
+        return
+
+    sources_dir = d.getVar('COPYLEFT_SOURCES_DIR', 1)
+    src_uri = d.getVar('SRC_URI', 1).split()
+    fetch = bb.fetch2.Fetch(src_uri, d)
+    ud = fetch.ud
+
+    locals = (fetch.localpath(url) for url in fetch.urls)
+    localpaths = [local for local in locals if not local.endswith('.bb')]
+    if not localpaths:
+        return
+
+    pf = d.getVar('PF', True)
+    dest = os.path.join(sources_dir, pf)
+    shutil.rmtree(dest, ignore_errors=True)
+    bb.mkdirhier(dest)
+
+    for path in localpaths:
+        os.symlink(path, os.path.join(dest, os.path.basename(path)))
+
+    patches = src_patches(d)
+    for patch in patches:
+        _, _, local, _, _, parm = bb.decodeurl(patch)
+        patchdir = parm.get('patchdir')
+        if patchdir:
+            series = os.path.join(dest, 'series.subdir.%s' % patchdir.replace('/', '_'))
+        else:
+            series = os.path.join(dest, 'series')
+
+        with open(series, 'a') as s:
+            s.write('%s -p%s\n' % (os.path.basename(local), parm['striplevel']))
+}
+
+addtask prepare_copyleft_sources after do_fetch before do_build
+do_build[recrdeptask] += 'do_prepare_copyleft_sources'
-- 
1.7.1



