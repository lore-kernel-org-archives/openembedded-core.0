Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <muhammad_shakeel@mentor.com>) id 1TsblX-0003kQ-HZ
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 17:11:04 +0100
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com
	(pkl-comp-bm2.pkl.mentorg.com [137.202.157.186])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id r08FtlaF020223;
	Tue, 8 Jan 2013 09:55:48 -0600
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 20:55:47 +0500
Message-Id: <1357660547-19803-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] archive-*-source.bbclass: Use tasks instead of pre/post functions
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
X-List-Received-Date: Tue, 08 Jan 2013 16:11:04 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

* Modified following archiver related classes to add separate tasks
  for different archiver functions instead of adding these as pre/post
  functions of existing tasks.
    -archive-original-source.bbclass
    -archive-patched-source.bbclass
    -archive-configured-source.bbclass

[YOCTO #3449]

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/archive-configured-source.bbclass |    6 +++---
 meta/classes/archive-original-source.bbclass   |    6 +++---
 meta/classes/archive-patched-source.bbclass    |    6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
index 1eaaf4c..d804e3d 100644
--- a/meta/classes/archive-configured-source.bbclass
+++ b/meta/classes/archive-configured-source.bbclass
@@ -8,10 +8,10 @@
 inherit archiver
 
 # Get archiving package with configured sources including patches
-do_configure[postfuncs] += "do_archive_configured_sources "
+addtask do_archive_configured_sources after do_configure before do_compile
 
 # Get archiving package with temp(logs) and scripts(.bb and inc files)
-do_package_write_rpm[prefuncs] += "do_archive_scripts_logs "
+addtask do_archive_scripts_logs after do_package before do_package_write_rpm
 
 # Get dump date and create diff file 
-do_package_write_rpm[postfuncs] += "do_dumpdata_create_diff_gz "
+addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
diff --git a/meta/classes/archive-original-source.bbclass b/meta/classes/archive-original-source.bbclass
index 1b3f8d0..604d19c 100644
--- a/meta/classes/archive-original-source.bbclass
+++ b/meta/classes/archive-original-source.bbclass
@@ -8,10 +8,10 @@
 inherit archiver
 
 # Get original sources archiving package with patches
-do_unpack[postfuncs] += "do_archive_original_sources_patches "
+addtask do_archive_original_sources_patches after do_unpack before do_patch
 
 # Get archiving package with temp(logs) and scripts(.bb and inc files)
-do_package_write_rpm[prefuncs] += "do_archive_scripts_logs "
+addtask do_archive_scripts_logs after do_package before do_package_write_rpm
 
 # Get dump date and create diff file 
-do_package_write_rpm[postfuncs] += "do_dumpdata_create_diff_gz "
+addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
diff --git a/meta/classes/archive-patched-source.bbclass b/meta/classes/archive-patched-source.bbclass
index 40b2dcb..4b0a199 100644
--- a/meta/classes/archive-patched-source.bbclass
+++ b/meta/classes/archive-patched-source.bbclass
@@ -8,10 +8,10 @@
 inherit archiver
 
 # Get archiving package with patched sources including patches
-do_patch[postfuncs] += "do_archive_patched_sources "
+addtask do_archive_patched_sources after do_patch before do_configure
 
 # Get archiving package with logs(temp) and scripts(.bb and .inc files)
-do_package_write_rpm[prefuncs] += "do_archive_scripts_logs "
+addtask do_archive_scripts_logs after do_package before do_package_write_rpm
 
 # Get dump date and create diff file 
-do_package_write_rpm[postfuncs] += "do_dumpdata_create_diff_gz "
+addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
-- 
1.7.9.5



