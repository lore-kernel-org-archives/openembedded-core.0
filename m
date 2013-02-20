Received: from nat-lmt.mentorg.com ([139.181.28.34]
	helo=gemini.alm.mentorg.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <muhammad_shakeel@mentor.com>) id 1U8AKZ-0004I9-9y
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 15:07:32 +0100
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r1KDp70Y016906; 
	Wed, 20 Feb 2013 07:51:08 -0600
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2013 18:50:57 +0500
Message-Id: <1361368257-32345-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/2 v4] archive-*-source.bbclass: Handle all package classes
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
X-List-Received-Date: Wed, 20 Feb 2013 14:07:32 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

* Add archiver tasks correctly for any 'IMAGE_PKGTYPE'.

[YOCTO #3449]

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/archive-configured-source.bbclass |   10 +++++++---
 meta/classes/archive-original-source.bbclass   |   10 +++++++---
 meta/classes/archive-patched-source.bbclass    |   10 +++++++---
 3 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
index e492ce3..4fc5129 100644
--- a/meta/classes/archive-configured-source.bbclass
+++ b/meta/classes/archive-configured-source.bbclass
@@ -11,22 +11,26 @@ inherit archiver
 addtask do_archive_configured_sources after do_configure
 
 # Get archiving package with temp(logs) and scripts(.bb and inc files)
-addtask do_archive_scripts_logs after do_package_write_rpm
+addtask do_archive_scripts_logs
 
 # Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
+addtask do_dumpdata_create_diff_gz before do_build
 
 python () {
+    pn = d.getVar('PN', True)
+    packaging = d.getVar('IMAGE_PKGTYPE', True)
+    d.appendVarFlag('do_dumpdata_create_diff_gz', 'depends', ' %s:do_package_write_' %pn + packaging)
+
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
         """
         If package type is not 'srpm' then add tasks to move archive packages of
         configured sources and scripts/logs in ${DEPLOY_DIR}/sources.
         """
-        pn = d.getVar('PN', True)
         d.appendVarFlag('do_compile', 'depends', ' %s:do_archive_configured_sources' %pn)
         build_deps = ' %s:do_archive_configured_sources' %pn
         build_deps += ' %s:do_archive_scripts_logs' %pn
         d.appendVarFlag('do_build', 'depends', build_deps)
+        d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
 
     else:
         d.prependVarFlag('do_configure', 'postfuncs', "do_archive_configured_sources")
diff --git a/meta/classes/archive-original-source.bbclass b/meta/classes/archive-original-source.bbclass
index f123caf..3aea4f4 100644
--- a/meta/classes/archive-original-source.bbclass
+++ b/meta/classes/archive-original-source.bbclass
@@ -11,22 +11,26 @@ inherit archiver
 addtask do_archive_original_sources_patches after do_unpack
 
 # Get archiving package with temp(logs) and scripts(.bb and inc files)
-addtask do_archive_scripts_logs after do_package_write_rpm
+addtask do_archive_scripts_logs
 
 # Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
+addtask do_dumpdata_create_diff_gz before do_build
 
 python () {
+    pn = d.getVar('PN', True)
+    packaging = d.getVar('IMAGE_PKGTYPE', True)
+    d.appendVarFlag('do_dumpdata_create_diff_gz', 'depends', ' %s:do_package_write_' %pn + packaging)
+
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
         """
         If package type is not 'srpm' then add tasks to move archive packages of
         original sources and scripts/logs in ${DEPLOY_DIR}/sources.
         """
-        pn = d.getVar('PN', True)
         d.appendVarFlag('do_patch', 'depends', ' %s:do_archive_original_sources_patches' %pn)
         build_deps = ' %s:do_archive_original_sources_patches' %pn
         build_deps += ' %s:do_archive_scripts_logs' %pn
         d.appendVarFlag('do_build', 'depends', build_deps)
+        d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
 
     else:
         d.prependVarFlag('do_unpack', 'postfuncs', "do_archive_original_sources_patches")
diff --git a/meta/classes/archive-patched-source.bbclass b/meta/classes/archive-patched-source.bbclass
index f9f558e..d7ed6c8 100644
--- a/meta/classes/archive-patched-source.bbclass
+++ b/meta/classes/archive-patched-source.bbclass
@@ -11,22 +11,26 @@ inherit archiver
 addtask do_archive_patched_sources after do_patch
 
 # Get archiving package with logs(temp) and scripts(.bb and .inc files)
-addtask do_archive_scripts_logs after do_package_write_rpm
+addtask do_archive_scripts_logs
 
 # Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
+addtask do_dumpdata_create_diff_gz before do_build
 
 python () {
+    pn = d.getVar('PN', True)
+    packaging = d.getVar('IMAGE_PKGTYPE', True)
+    d.appendVarFlag('do_dumpdata_create_diff_gz', 'depends', ' %s:do_package_write_' %pn + packaging)
+
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
         """
         If package type is not 'srpm' then add tasks to move archive packages of
         patched sources and scripts/logs in ${DEPLOY_DIR}/sources.
         """
-        pn = d.getVar('PN', True)
         d.appendVarFlag('do_configure', 'depends', ' %s:do_archive_patched_sources' %pn)
         build_deps = ' %s:do_archive_patched_sources' %pn
         build_deps += ' %s:do_archive_scripts_logs' %pn
         d.appendVarFlag('do_build', 'depends', build_deps)
+        d.appendVarFlag('do_archive_scripts_logs', 'depends', ' %s:do_package_write_' %pn + packaging)
 
     else:
         d.prependVarFlag('do_patch', 'postfuncs', "do_archive_patched_sources")
-- 
1.7.9.5



