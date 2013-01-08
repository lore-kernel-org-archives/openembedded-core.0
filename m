Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <muhammad_shakeel@mentor.com>) id 1TsbmJ-0003oh-3N
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 17:12:05 +0100
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com
	(pkl-comp-bm2.pkl.mentorg.com [137.202.157.186])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id r08FuaaF020264;
	Tue, 8 Jan 2013 09:56:37 -0600
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 20:56:40 +0500
Message-Id: <1357660600-19872-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] archive-*-source.bbclass: Handle all package classes
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
X-List-Received-Date: Tue, 08 Jan 2013 16:12:10 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

* Add archiver tasks correctly for any 'IMAGE_PKGTYPE'.

[YOCTO #3449]

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/archive-configured-source.bbclass |   15 +++++++++++++--
 meta/classes/archive-original-source.bbclass   |   15 +++++++++++++--
 meta/classes/archive-patched-source.bbclass    |   15 +++++++++++++--
 3 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
index 64799e3..50838e6 100644
--- a/meta/classes/archive-configured-source.bbclass
+++ b/meta/classes/archive-configured-source.bbclass
@@ -11,12 +11,19 @@ inherit archiver
 addtask do_archive_configured_sources after do_configure
 
 # Get archiving package with temp(logs) and scripts(.bb and inc files)
-addtask do_archive_scripts_logs after do_package_write_rpm
+addtask do_archive_scripts_logs
 
 # Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
+addtask do_dumpdata_create_diff_gz before do_build
 
 python () {
+    packaging = d.getVar('IMAGE_PKGTYPE', True)
+    write_package_task = 'do_package_write_' + packaging
+
+    deps = d.getVarFlag('do_dumpdata_create_diff_gz', 'deps') or []
+    deps.append(write_package_task)
+    d.setVarFlag('do_dumpdata_create_diff_gz', 'deps', deps)
+
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
         """
         If package type is not 'srpm' then add tasks to move archive packages of
@@ -30,6 +37,10 @@ python () {
         recrdeptask += ' do_archive_configured_sources '
         d.setVarFlag('do_build', 'recrdeptask', recrdeptask)
 
+        deps = d.getVarFlag('do_archive_scripts_logs', 'deps') or []
+        deps.append(write_package_task)
+        d.setVarFlag('do_archive_scripts_logs', 'deps', deps)
+
         deps = d.getVarFlag('do_build', 'deps') or []
         deps.append('do_archive_scripts_logs')
         d.setVarFlag('do_build', 'deps', deps)
diff --git a/meta/classes/archive-original-source.bbclass b/meta/classes/archive-original-source.bbclass
index 44dffb4..77f9650 100644
--- a/meta/classes/archive-original-source.bbclass
+++ b/meta/classes/archive-original-source.bbclass
@@ -11,12 +11,19 @@ inherit archiver
 addtask do_archive_original_sources_patches after do_unpack
 
 # Get archiving package with temp(logs) and scripts(.bb and inc files)
-addtask do_archive_scripts_logs after do_package_write_rpm
+addtask do_archive_scripts_logs
 
 # Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
+addtask do_dumpdata_create_diff_gz before do_build
 
 python () {
+    packaging = d.getVar('IMAGE_PKGTYPE', True)
+    write_package_task = 'do_package_write_' + packaging
+
+    deps = d.getVarFlag('do_dumpdata_create_diff_gz', 'deps') or []
+    deps.append(write_package_task)
+    d.setVarFlag('do_dumpdata_create_diff_gz', 'deps', deps)
+
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
         """
         If package type is not 'srpm' then add tasks to move archive packages of
@@ -30,6 +37,10 @@ python () {
         recrdeptask += ' do_archive_original_sources_patches '
         d.setVarFlag('do_build', 'recrdeptask', recrdeptask)
 
+        deps = d.getVarFlag('do_archive_scripts_logs', 'deps') or []
+        deps.append(write_package_task)
+        d.setVarFlag('do_archive_scripts_logs', 'deps', deps)
+
         deps = d.getVarFlag('do_build', 'deps') or []
         deps.append('do_archive_scripts_logs')
         d.setVarFlag('do_build', 'deps', deps)
diff --git a/meta/classes/archive-patched-source.bbclass b/meta/classes/archive-patched-source.bbclass
index 35bae54..11dd547 100644
--- a/meta/classes/archive-patched-source.bbclass
+++ b/meta/classes/archive-patched-source.bbclass
@@ -11,12 +11,19 @@ inherit archiver
 addtask do_archive_patched_sources after do_patch
 
 # Get archiving package with logs(temp) and scripts(.bb and .inc files)
-addtask do_archive_scripts_logs after do_package_write_rpm
+addtask do_archive_scripts_logs
 
 # Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
+addtask do_dumpdata_create_diff_gz before do_build
 
 python () {
+    packaging = d.getVar('IMAGE_PKGTYPE', True)
+    write_package_task = 'do_package_write_' + packaging
+
+    deps = d.getVarFlag('do_dumpdata_create_diff_gz', 'deps') or []
+    deps.append(write_package_task)
+    d.setVarFlag('do_dumpdata_create_diff_gz', 'deps', deps)
+
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
         """
         If package type is not 'srpm' then add tasks to move archive packages of
@@ -30,6 +37,10 @@ python () {
         recrdeptask += ' do_archive_patched_sources '
         d.setVarFlag('do_build', 'recrdeptask', recrdeptask)
 
+        deps = d.getVarFlag('do_archive_scripts_logs', 'deps') or []
+        deps.append(write_package_task)
+        d.setVarFlag('do_archive_scripts_logs', 'deps', deps)
+
         deps = d.getVarFlag('do_build', 'deps') or []
         deps.append('do_archive_scripts_logs')
         d.setVarFlag('do_build', 'deps', deps)
-- 
1.7.9.5



