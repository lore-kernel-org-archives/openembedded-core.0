Received: from nat-lmt.mentorg.com ([139.181.28.34]
	helo=gemini.alm.mentorg.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <muhammad_shakeel@mentor.com>) id 1TxcwN-0002On-4T
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 13:27:07 +0100
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com
	(pkl-comp-bm2.pkl.mentorg.com [137.202.157.186])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r0MCBPHn020869; 
	Tue, 22 Jan 2013 06:11:27 -0600
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jan 2013 17:11:22 +0500
Message-Id: <1358856682-17083-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/2 v3] archive-*-source.bbclass: Handle all package classes
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
X-List-Received-Date: Tue, 22 Jan 2013 12:27:08 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

* Add archiver tasks correctly for any 'IMAGE_PKGTYPE'.

[YOCTO #3449]

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/archive-configured-source.bbclass |    8 ++++++--
 meta/classes/archive-original-source.bbclass   |    8 ++++++--
 meta/classes/archive-patched-source.bbclass    |    8 ++++++--
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
index ae70be3..8323fda 100644
--- a/meta/classes/archive-configured-source.bbclass
+++ b/meta/classes/archive-configured-source.bbclass
@@ -11,12 +11,15 @@ inherit archiver
 addtask do_archive_configured_sources after do_configure
 
 # Get archiving package with temp(logs) and scripts(.bb and inc files)
-addtask do_archive_scripts_logs after do_package_write_rpm
+addtask do_archive_scripts_logs
 
 # Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
+addtask do_dumpdata_create_diff_gz before do_build
 
 python () {
+    packaging = d.getVar('IMAGE_PKGTYPE', True)
+    d.appendVarFlag('do_dumpdata_create_diff_gz', 'recrdeptask', ' do_package_write_' + packaging)
+
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
         """
         If package type is not 'srpm' then add tasks to move archive packages of
@@ -24,6 +27,7 @@ python () {
         """
         d.appendVarFlag('do_compile', 'deps', ['do_archive_configured_sources'])
         d.appendVarFlag('do_build', 'recrdeptask', ' do_archive_configured_sources')
+        d.appendVarFlag('do_archive_scripts_logs', 'recrdeptask', ' do_package_write_' + packaging)
         d.appendVarFlag('do_build', 'deps', ['do_archive_scripts_logs'])
 
     else:
diff --git a/meta/classes/archive-original-source.bbclass b/meta/classes/archive-original-source.bbclass
index f668f3e..f61f82b 100644
--- a/meta/classes/archive-original-source.bbclass
+++ b/meta/classes/archive-original-source.bbclass
@@ -11,12 +11,15 @@ inherit archiver
 addtask do_archive_original_sources_patches after do_unpack
 
 # Get archiving package with temp(logs) and scripts(.bb and inc files)
-addtask do_archive_scripts_logs after do_package_write_rpm
+addtask do_archive_scripts_logs
 
 # Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
+addtask do_dumpdata_create_diff_gz before do_build
 
 python () {
+    packaging = d.getVar('IMAGE_PKGTYPE', True)
+    d.appendVarFlag('do_dumpdata_create_diff_gz', 'recrdeptask', ' do_package_write_' + packaging)
+
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
         """
         If package type is not 'srpm' then add tasks to move archive packages of
@@ -24,6 +27,7 @@ python () {
         """
         d.appendVarFlag('do_patch', 'deps', ['do_archive_original_sources_patches'])
         d.appendVarFlag('do_build', 'recrdeptask', ' do_archive_original_sources_patches')
+        d.appendVarFlag('do_archive_scripts_logs', 'recrdeptask', ' do_package_write_' + packaging)
         d.appendVarFlag('do_build', 'deps', ['do_archive_scripts_logs'])
 
     else:
diff --git a/meta/classes/archive-patched-source.bbclass b/meta/classes/archive-patched-source.bbclass
index daadaae..7644a6e 100644
--- a/meta/classes/archive-patched-source.bbclass
+++ b/meta/classes/archive-patched-source.bbclass
@@ -11,12 +11,15 @@ inherit archiver
 addtask do_archive_patched_sources after do_patch
 
 # Get archiving package with logs(temp) and scripts(.bb and .inc files)
-addtask do_archive_scripts_logs after do_package_write_rpm
+addtask do_archive_scripts_logs
 
 # Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
+addtask do_dumpdata_create_diff_gz before do_build
 
 python () {
+    packaging = d.getVar('IMAGE_PKGTYPE', True)
+    d.appendVarFlag('do_dumpdata_create_diff_gz', 'recrdeptask', ' do_package_write_' + packaging)
+
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
         """
         If package type is not 'srpm' then add tasks to move archive packages of
@@ -24,6 +27,7 @@ python () {
         """
         d.appendVarFlag('do_configure', 'deps', ['do_archive_patched_sources'])
         d.appendVarFlag('do_build', 'recrdeptask', ' do_archive_patched_sources')
+        d.appendVarFlag('do_archive_scripts_logs', 'recrdeptask', ' do_package_write_' + packaging)
         d.appendVarFlag('do_build', 'deps', ['do_archive_scripts_logs'])
 
     else:
-- 
1.7.9.5



