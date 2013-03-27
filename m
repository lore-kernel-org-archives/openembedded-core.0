Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UKfta-0000m4-L2
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 03:15:23 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Mar 2013 18:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,915,1355126400"; d="scan'208";a="276413887"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.88])
	by azsmga001.ch.intel.com with ESMTP; 26 Mar 2013 18:58:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2013 01:58:16 +0000
Message-Id: <1364349496-22138-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] classes/buildhistory: ensure SDK package lists include complementary pkgs
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
X-List-Received-Date: Wed, 27 Mar 2013 02:15:24 -0000

We need to get in after complementary package installation, so use
_append instead of +=.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3892326..4b6be22 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -439,8 +439,9 @@ ROOTFS_POSTPROCESS_COMMAND =+ "buildhistory_get_image_installed ; "
 
 IMAGE_POSTPROCESS_COMMAND += " buildhistory_get_imageinfo ; "
 
-POPULATE_SDK_POST_TARGET_COMMAND += "buildhistory_get_sdk_installed target ; "
-POPULATE_SDK_POST_HOST_COMMAND += "buildhistory_get_sdk_installed host ; "
+# We want these to be the last run so that we get called after complementary package installation
+POPULATE_SDK_POST_TARGET_COMMAND_append = "buildhistory_get_sdk_installed target ; "
+POPULATE_SDK_POST_HOST_COMMAND_append = "buildhistory_get_sdk_installed host ; "
 
 SDK_POSTPROCESS_COMMAND += "buildhistory_get_sdkinfo ; "
 
-- 
1.7.10.4



