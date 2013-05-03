Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UYC8s-0006Uf-J7
	for openembedded-core@lists.openembedded.org;
	Fri, 03 May 2013 11:19:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2013 02:01:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,602,1363158000"; d="scan'208";a="296998000"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 03 May 2013 02:01:05 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 May 2013 12:01:04 +0300
Message-Id: <1367571664-2079-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] archive-*-source.bbclass: have do_dumpdata_create_diff_gz task run before do_rootfs
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
X-List-Received-Date: Fri, 03 May 2013 09:19:13 -0000

do_rootfs[cleandirs] contains ${S} and, if do_rootfs task starts before
the do_dumpdata_create_diff_gz is finished, an error will occur in the
process because the directory will be removed while still needed by the
create_diff_gz() function.

This patch will force the do_dumpdata_create_diff_gz task to run before
do_rootfs when the final image is created.

[YOCTO #4310]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/archive-configured-source.bbclass |    2 +-
 meta/classes/archive-original-source.bbclass   |    2 +-
 meta/classes/archive-patched-source.bbclass    |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/archive-configured-source.bbclass b/meta/classes/archive-configured-source.bbclass
index d346f69..a481b14 100644
--- a/meta/classes/archive-configured-source.bbclass
+++ b/meta/classes/archive-configured-source.bbclass
@@ -14,7 +14,7 @@ addtask do_archive_configured_sources after do_configure
 addtask do_archive_scripts_logs
 
 # Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz
+addtask do_dumpdata_create_diff_gz before do_rootfs
 
 python () {
     pn = d.getVar('PN', True)
diff --git a/meta/classes/archive-original-source.bbclass b/meta/classes/archive-original-source.bbclass
index 7258293..2796ff9 100644
--- a/meta/classes/archive-original-source.bbclass
+++ b/meta/classes/archive-original-source.bbclass
@@ -14,7 +14,7 @@ addtask do_archive_original_sources_patches after do_unpack
 addtask do_archive_scripts_logs
 
 # Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz
+addtask do_dumpdata_create_diff_gz before do_rootfs
 
 python () {
     pn = d.getVar('PN', True)
diff --git a/meta/classes/archive-patched-source.bbclass b/meta/classes/archive-patched-source.bbclass
index 9e5ec74..995a259 100644
--- a/meta/classes/archive-patched-source.bbclass
+++ b/meta/classes/archive-patched-source.bbclass
@@ -14,7 +14,7 @@ addtask do_archive_patched_sources after do_patch
 addtask do_archive_scripts_logs
 
 # Get dump date and create diff file 
-addtask do_dumpdata_create_diff_gz
+addtask do_dumpdata_create_diff_gz before do_rootfs
 
 python () {
     pn = d.getVar('PN', True)
-- 
1.7.9.5



