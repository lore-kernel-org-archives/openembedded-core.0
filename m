Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 270646EE4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 13:49:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Feb 2014 05:45:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,838,1384329600"; d="scan'208";a="454878847"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 13 Feb 2014 05:49:18 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2014 15:49:14 +0200
Message-Id: <a831fc1980c868656ae8c081eda17ab5464e5387.1392299302.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1392299302.git.laurentiu.palcu@intel.com>
References: <cover.1392299302.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1392299302.git.laurentiu.palcu@intel.com>
References: <cover.1392299302.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] buildhistory.bbclass: create wrapper functions around buildhistory_get_sdk_installed
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
X-List-Received-Date: Thu, 13 Feb 2014 13:49:18 -0000

bb.build.exec_func() does not allow passing arguments to the executed
scripts. Use wrappers instead.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/buildhistory.bbclass |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index c048ca2..0033b5a 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -388,6 +388,14 @@ buildhistory_get_sdk_installed() {
 	buildhistory_get_installed ${BUILDHISTORY_DIR_SDK}/$1 sdk
 }
 
+buildhistory_get_sdk_installed_host() {
+	buildhistory_get_sdk_installed host
+}
+
+buildhistory_get_sdk_installed_target() {
+	buildhistory_get_sdk_installed target
+}
+
 buildhistory_list_files() {
 	# List the files in the specified directory, but exclude date/time etc.
 	# This awk script is somewhat messy, but handles where the size is not printed for device files under pseudo
@@ -449,8 +457,8 @@ ROOTFS_POSTPROCESS_COMMAND =+ "buildhistory_get_image_installed ; "
 IMAGE_POSTPROCESS_COMMAND += " buildhistory_get_imageinfo ; "
 
 # We want these to be the last run so that we get called after complementary package installation
-POPULATE_SDK_POST_TARGET_COMMAND_append = "buildhistory_get_sdk_installed target ; "
-POPULATE_SDK_POST_HOST_COMMAND_append = "buildhistory_get_sdk_installed host ; "
+POPULATE_SDK_POST_TARGET_COMMAND_append = "buildhistory_get_sdk_installed_target ; "
+POPULATE_SDK_POST_HOST_COMMAND_append = "buildhistory_get_sdk_installed_host ; "
 
 SDK_POSTPROCESS_COMMAND += "buildhistory_get_sdkinfo ; "
 
-- 
1.7.9.5


