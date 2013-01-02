Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <muhammad_shakeel@mentor.com>) id 1TqN7Z-0004An-0t
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Jan 2013 13:08:33 +0100
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com
	(pkl-comp-bm2.pkl.mentorg.com [137.202.157.186])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id r02BrRaF028552;
	Wed, 2 Jan 2013 05:53:28 -0600
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2013 16:53:27 +0500
Message-Id: <1357127607-20161-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] [RFC] archive-*-source.bbclass: Handle package class 'package_ipk'
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
X-List-Received-Date: Wed, 02 Jan 2013 12:08:33 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

* Add archiver tasks correctly if 'PACKAGE_CLASSES' is set to 'package_ipk'

[YOCTO #3449]

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/archive-configured-source.bbclass |    2 ++
 meta/classes/archive-original-source.bbclass   |    2 ++
 meta/classes/archive-patched-source.bbclass    |    2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
index 83ee42e..83a77f3 100644
--- a/meta/classes/archive-configured-source.bbclass
+++ b/meta/classes/archive-configured-source.bbclass
@@ -12,9 +12,11 @@ addtask do_archive_configured_sources after do_configure
 
 # Get archiving package with temp(logs) and scripts(.bb and inc files)
 addtask do_archive_scripts_logs after do_package_write_rpm
+addtask do_archive_scripts_logs after do_package_write_ipk
 
 # Get dump date and create diff file 
 addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
+addtask do_dumpdata_create_diff_gz after do_package_write_ipk before do_build
 
 python () {
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
diff --git a/meta/classes/archive-original-source.bbclass b/meta/classes/archive-original-source.bbclass
index 53a3539..10003be 100644
--- a/meta/classes/archive-original-source.bbclass
+++ b/meta/classes/archive-original-source.bbclass
@@ -12,9 +12,11 @@ addtask do_archive_original_sources_patches after do_unpack
 
 # Get archiving package with temp(logs) and scripts(.bb and inc files)
 addtask do_archive_scripts_logs after do_package_write_rpm
+addtask do_archive_scripts_logs after do_package_write_ipk
 
 # Get dump date and create diff file 
 addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
+addtask do_dumpdata_create_diff_gz after do_package_write_ipk before do_build
 
 python () {
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
diff --git a/meta/classes/archive-patched-source.bbclass b/meta/classes/archive-patched-source.bbclass
index a23f4bf..7c94d25 100644
--- a/meta/classes/archive-patched-source.bbclass
+++ b/meta/classes/archive-patched-source.bbclass
@@ -12,9 +12,11 @@ addtask do_archive_patched_sources after do_patch
 
 # Get archiving package with logs(temp) and scripts(.bb and .inc files)
 addtask do_archive_scripts_logs after do_package_write_rpm
+addtask do_archive_scripts_logs after do_package_write_ipk
 
 # Get dump date and create diff file 
 addtask do_dumpdata_create_diff_gz after do_package_write_rpm before do_build
+addtask do_dumpdata_create_diff_gz after do_package_write_ipk before do_build
 
 python () {
     if d.getVar('SOURCE_ARCHIVE_PACKAGE_TYPE', True) != 'srpm':
-- 
1.7.9.5



