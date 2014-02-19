Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B7E0A6F1C9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 10:51:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 19 Feb 2014 02:47:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,504,1389772800"; d="scan'208";a="477586665"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2014 02:51:20 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 12:51:16 +0200
Message-Id: <a07a699adf67131b74c95049143cb2d6314015a2.1392806896.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1392806896.git.laurentiu.palcu@intel.com>
References: <cover.1392806896.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1392806896.git.laurentiu.palcu@intel.com>
References: <cover.1392806896.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/3] buildhistory.bbclass: fix creation of installed packages list
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
X-List-Received-Date: Wed, 19 Feb 2014 10:51:21 -0000

Call the new python routines to create the packages list.

[YOCTO #5831]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/buildhistory.bbclass |   21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 0033b5a..ef4135b 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -311,13 +311,23 @@ def write_pkghistory(pkginfo, d):
             if os.path.exists(filevarpath):
                 os.unlink(filevarpath)
 
+python buildhistory_list_installed() {
+    from oe.rootfs import list_installed_packages
+
+    pkgs_list_file = os.path.join(d.getVar('WORKDIR', True),
+                                  "bh_installed_pkgs.txt")
+
+    with open(pkgs_list_file, 'w') as pkgs_list:
+        pkgs_list.write(list_installed_packages(d, 'file'))
+}
+
 
 buildhistory_get_installed() {
 	mkdir -p $1
 
 	# Get list of installed packages
 	pkgcache="$1/installed-packages.tmp"
-	list_installed_packages file | sort > $pkgcache
+	cat ${WORKDIR}/bh_installed_pkgs.txt | sort > $pkgcache && rm ${WORKDIR}/bh_installed_pkgs.txt
 
 	cat $pkgcache | awk '{ print $1 }' > $1/installed-package-names.txt
 	if [ -s $pkgcache ] ; then
@@ -452,13 +462,16 @@ END
 }
 
 # By prepending we get in before the removal of packaging files
-ROOTFS_POSTPROCESS_COMMAND =+ "buildhistory_get_image_installed ; "
+ROOTFS_POSTPROCESS_COMMAND =+ " buildhistory_list_installed ;\
+                                buildhistory_get_image_installed ; "
 
 IMAGE_POSTPROCESS_COMMAND += " buildhistory_get_imageinfo ; "
 
 # We want these to be the last run so that we get called after complementary package installation
-POPULATE_SDK_POST_TARGET_COMMAND_append = "buildhistory_get_sdk_installed_target ; "
-POPULATE_SDK_POST_HOST_COMMAND_append = "buildhistory_get_sdk_installed_host ; "
+POPULATE_SDK_POST_TARGET_COMMAND_append = " buildhistory_list_installed ;\
+                                            buildhistory_get_sdk_installed_target ; "
+POPULATE_SDK_POST_HOST_COMMAND_append = " buildhistory_list_installed ;\
+                                          buildhistory_get_sdk_installed_host ; "
 
 SDK_POSTPROCESS_COMMAND += "buildhistory_get_sdkinfo ; "
 
-- 
1.7.9.5


