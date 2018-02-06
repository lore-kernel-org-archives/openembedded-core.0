Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AD9116FF73
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 14:41:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Feb 2018 06:41:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,469,1511856000"; d="scan'208";a="25106796"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 06 Feb 2018 06:41:46 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Feb 2018 16:41:50 +0200
Message-Id: <20180206144152.7765-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH 1/3] package.bbclass: run pre/post installation/removal scriptlets using sh -e
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
X-List-Received-Date: Tue, 06 Feb 2018 14:41:46 -0000

This allows catching errors in the scriptlets which would otherwise
go unnoticed, e.g. this sequence:
====
bogus_command
proper_command
====
would work just fine without any visible warnings or errors.

This was previously done only for rpm packages; this patch replaces
the rpm-specific tweak with one that works for all package types.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/package.bbclass     | 12 ++++++++++++
 meta/classes/package_rpm.bbclass |  8 ++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 6a7f35a3e78..607b548d08d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1339,6 +1339,17 @@ fi
             postinst += postinst_ontarget
             d.setVar('pkg_postinst_%s' % pkg, postinst)
 
+    def add_set_e_to_scriptlets(pkg):
+        for scriptlet_name in ('pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm'):
+            scriptlet = d.getVar('%s_%s' % (scriptlet_name, pkg))
+            if scriptlet:
+                scriptlet_split = scriptlet.split('\n')
+                if scriptlet_split[0].startswith("#!"):
+                    scriptlet = scriptlet_split[0] + "\nset -e\n" + "\n".join(scriptlet_split[1:])
+                else:
+                    scriptlet = "set -e\n" + "\n".join(scriptlet_split[0:])
+            d.setVar('%s_%s' % (scriptlet_name, pkg), scriptlet)
+
     def write_if_exists(f, pkg, var):
         def encode(str):
             import codecs
@@ -1435,6 +1446,7 @@ fi
         write_if_exists(sf, pkg, 'FILES')
         write_if_exists(sf, pkg, 'CONFFILES')
         process_postinst_on_target(pkg, d.getVar("MLPREFIX"))
+        add_set_e_to_scriptlets(pkg)
         write_if_exists(sf, pkg, 'pkg_postinst')
         write_if_exists(sf, pkg, 'pkg_postrm')
         write_if_exists(sf, pkg, 'pkg_preinst')
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index e26b2ad6625..af64ef62c58 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -470,12 +470,12 @@ python write_specfile () {
 
         # Now process scriptlets
         if splitrpreinst:
-            spec_scriptlets_bottom.append('%%pre -n %s -p "/bin/sh -e"' % splitname)
+            spec_scriptlets_bottom.append('%%pre -n %s' % splitname)
             spec_scriptlets_bottom.append('# %s - preinst' % splitname)
             spec_scriptlets_bottom.append(splitrpreinst)
             spec_scriptlets_bottom.append('')
         if splitrpostinst:
-            spec_scriptlets_bottom.append('%%post -n %s -p "/bin/sh -e"' % splitname)
+            spec_scriptlets_bottom.append('%%post -n %s' % splitname)
             spec_scriptlets_bottom.append('# %s - postinst' % splitname)
             spec_scriptlets_bottom.append(splitrpostinst)
             spec_scriptlets_bottom.append('')
@@ -564,12 +564,12 @@ python write_specfile () {
     spec_preamble_top.append('')
 
     if srcrpreinst:
-        spec_scriptlets_top.append('%pre -p "/bin/sh -e"')
+        spec_scriptlets_top.append('%pre')
         spec_scriptlets_top.append('# %s - preinst' % srcname)
         spec_scriptlets_top.append(srcrpreinst)
         spec_scriptlets_top.append('')
     if srcrpostinst:
-        spec_scriptlets_top.append('%post -p "/bin/sh -e"')
+        spec_scriptlets_top.append('%post')
         spec_scriptlets_top.append('# %s - postinst' % srcname)
         spec_scriptlets_top.append(srcrpostinst)
         spec_scriptlets_top.append('')
-- 
2.15.1


