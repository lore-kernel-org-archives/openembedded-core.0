Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A6A7471990
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 23:55:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 13 Dec 2016 15:55:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,343,1477983600"; d="scan'208";a="1081474496"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 13 Dec 2016 15:55:17 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 3B9D06A4006;
	Tue, 13 Dec 2016 15:54:29 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2016 01:55:04 +0200
Message-Id: <1481673304-2956-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1976647.jAKzAtoRFl@peggleto-mobl.ger.corp.intel.com>
References: <1976647.jAKzAtoRFl@peggleto-mobl.ger.corp.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH v3] uninative: rebuild uninative for gcc 4.8 and 4.9
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
X-List-Received-Date: Tue, 13 Dec 2016 23:55:40 -0000

Some c++ libraries fail to build if uninative is built
with gcc 5.x and host gcc version is either 4.8 or 4.9.

The issue should be solved by making separate uninative sstate
directory structure sstate-cache/universal-<gcc version> for host gcc
versions 4.8 and 4.9. This causes rebuilds of uninative if host gcc
is either 4.8 or 4.9 and it doesn't match gcc version used to build
uninative.

[YOCTO #10441]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass |  5 +++--
 meta/classes/uninative.bbclass        |  2 +-
 meta/lib/oe/utils.py                  | 14 ++++++++++++++
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 3c3a73c..1affa9d 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -374,8 +374,9 @@ python copy_buildsystem () {
 
     sstate_out = baseoutpath + '/sstate-cache'
     bb.utils.remove(sstate_out, True)
-    # uninative.bbclass sets NATIVELSBSTRING to 'universal'
-    fixedlsbstring = 'universal'
+
+    # uninative.bbclass sets NATIVELSBSTRING to 'universal%s' % oe.utils.host_gcc_version(d)
+    fixedlsbstring = "universal%s" % oe.utils.host_gcc_version(d)
 
     sdk_include_toolchain = (d.getVar('SDK_INCLUDE_TOOLCHAIN', True) == '1')
     sdk_ext_type = d.getVar('SDK_EXT_TYPE', True)
diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 9242320..11cbf9b 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -88,7 +88,7 @@ def enable_uninative(d):
     loader = d.getVar("UNINATIVE_LOADER", True)
     if os.path.exists(loader):
         bb.debug(2, "Enabling uninative")
-        d.setVar("NATIVELSBSTRING", "universal")
+        d.setVar("NATIVELSBSTRING", "universal%s" % oe.utils.host_gcc_version(d))
         d.appendVar("SSTATEPOSTUNPACKFUNCS", " uninative_changeinterp")
         d.prependVar("PATH", "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:")
 
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index d6545b1..2b095f1 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -230,6 +230,20 @@ def format_pkg_list(pkg_dict, ret_format=None):
 
     return '\n'.join(output)
 
+def host_gcc_version(d):
+    compiler = d.getVar("BUILD_CC", True)
+    retval, output = getstatusoutput("%s --version" % compiler)
+    if retval:
+        bb.fatal("Error running %s --version: %s" % (compiler, output))
+
+    import re
+    match = re.match(".* (\d\.\d)\.\d.*", output.split('\n')[0])
+    if not match:
+        bb.fatal("Can't get compiler version from %s --version output" % compiler)
+
+    version = match.group(1)
+    return "-%s" % version if version in ("4.8", "4.9") else ""
+
 #
 # Python 2.7 doesn't have threaded pools (just multiprocessing)
 # so implement a version here
-- 
2.1.4


