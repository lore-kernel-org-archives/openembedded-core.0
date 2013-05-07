Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UZhKZ-00052d-5W
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 14:49:21 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 May 2013 05:31:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,628,1363158000"; d="scan'208";a="298827049"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 07 May 2013 05:31:15 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 15:31:14 +0300
Message-Id: <1367929875-11118-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] archive-*-source.bbclass: handle dependency in anonymous function
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 12:49:28 -0000

Using "before do_rootfs" would have this task added to do_rootfs
dependencies regardless of the filtering options. Instead, add this
dependency in the anonymous python function.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/archive-configured-source.bbclass |    7 +++++--
 meta/classes/archive-original-source.bbclass   |    7 +++++--
 meta/classes/archive-patched-source.bbclass    |    7 +++++--
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
index a481b14..33c7956 100644
--- a/meta/classes/archive-configured-source.bbclass
+++ b/meta/classes/archive-configured-source.bbclass
@@ -14,7 +14,7 @@ addtask do_archive_configured_sources after do_configure
 addtask do_archive_scripts_logs
 
 # Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz before do_rootfs
+addtask do_dumpdata_create_diff_gz
 
 python () {
     pn = d.getVar('PN', True)
@@ -34,7 +34,10 @@ python () {
         d.appendVarFlag('do_compile', 'depends', ' %s:do_archive_configured_sources' %pn)
         build_deps += ' %s:do_archive_configured_sources' %pn
 
-    d.appendVarFlag('do_build', 'depends', build_deps)
+    if bb.data.inherits_class('image', d):
+        d.appendVarFlag('do_rootfs', 'depends', build_deps)
+    else:
+        d.appendVarFlag('do_build', 'depends', build_deps)
 }
 
 ARCHIVE_SSTATE_OUTDIR = "${DEPLOY_DIR}/sources/"
diff --git a/meta/classes/archive-original-source.bbclass b/meta/classes/archive-original-source.bbclass
index 2796ff9..a3e36d9 100644
--- a/meta/classes/archive-original-source.bbclass
+++ b/meta/classes/archive-original-source.bbclass
@@ -14,7 +14,7 @@ addtask do_archive_original_sources_patches after do_unpack
 addtask do_archive_scripts_logs
 
 # Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz before do_rootfs
+addtask do_dumpdata_create_diff_gz
 
 python () {
     pn = d.getVar('PN', True)
@@ -34,7 +34,10 @@ python () {
         d.appendVarFlag('do_patch', 'depends', ' %s:do_archive_original_sources_patches' %pn)
         build_deps += ' %s:do_archive_original_sources_patches' %pn
 
-    d.appendVarFlag('do_build', 'depends', build_deps)
+    if bb.data.inherits_class('image', d):
+        d.appendVarFlag('do_rootfs', 'depends', build_deps)
+    else:
+        d.appendVarFlag('do_build', 'depends', build_deps)
 }
 
 ARCHIVE_SSTATE_OUTDIR = "${DEPLOY_DIR}/sources/"
diff --git a/meta/classes/archive-patched-source.bbclass b/meta/classes/archive-patched-source.bbclass
index 995a259..0d4305d 100644
--- a/meta/classes/archive-patched-source.bbclass
+++ b/meta/classes/archive-patched-source.bbclass
@@ -14,7 +14,7 @@ addtask do_archive_patched_sources after do_patch
 addtask do_archive_scripts_logs
 
 # Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz before do_rootfs
+addtask do_dumpdata_create_diff_gz
 
 python () {
     pn = d.getVar('PN', True)
@@ -34,7 +34,10 @@ python () {
         d.appendVarFlag('do_configure', 'depends', ' %s:do_archive_patched_sources' %pn)
         build_deps += ' %s:do_archive_patched_sources' %pn
 
-    d.appendVarFlag('do_build', 'depends', build_deps)
+    if bb.data.inherits_class('image', d):
+        d.appendVarFlag('do_rootfs', 'depends', build_deps)
+    else:
+        d.appendVarFlag('do_build', 'depends', build_deps)
 }
 
 ARCHIVE_SSTATE_OUTDIR = "${DEPLOY_DIR}/sources/"
-- 
1.7.9.5



