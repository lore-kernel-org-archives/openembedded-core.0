Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3EDB96DDD6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 18:51:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Dec 2013 10:51:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,812,1378882800"; d="scan'208";a="445490232"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.184])
	by orsmga002.jf.intel.com with ESMTP; 02 Dec 2013 10:51:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2013 18:50:50 +0000
Message-Id: <84361d69cafec4de6c60606cd7a3bd1bb7d70dfb.1386009885.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386009885.git.paul.eggleton@linux.intel.com>
References: <cover.1386009885.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1386009885.git.paul.eggleton@linux.intel.com>
References: <cover.1386009885.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/8] classes/buildhistory: reduce parsing time
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
X-List-Received-Date: Mon, 02 Dec 2013 18:51:03 -0000

Disable several python functions if not parsing within the worker
context. This avoids executing expensive operations while parsing
recipes (which is unnecessary).

(Thanks to Richard Purdie for pointing out the issue and suggesting the
workaround.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index b11e9ba..e46b124 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -448,6 +448,8 @@ POPULATE_SDK_POST_HOST_COMMAND_append = "buildhistory_get_sdk_installed host ; "
 SDK_POSTPROCESS_COMMAND += "buildhistory_get_sdkinfo ; "
 
 def buildhistory_get_layers(d):
+    if d.getVar('BB_WORKERCONTEXT', True) != '1':
+        return ""
     layertext = "Configured metadata layers:\n%s\n" % '\n'.join(get_layers_branch_rev(d))
     return layertext
 
@@ -478,11 +480,15 @@ def outputvars(vars, listvars, d):
     return ret.rstrip('\n')
 
 def buildhistory_get_imagevars(d):
+    if d.getVar('BB_WORKERCONTEXT', True) != '1':
+        return ""
     imagevars = "DISTRO DISTRO_VERSION USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES IMAGE_LINGUAS IMAGE_INSTALL BAD_RECOMMENDATIONS NO_RECOMMENDATIONS PACKAGE_EXCLUDE ROOTFS_POSTPROCESS_COMMAND IMAGE_POSTPROCESS_COMMAND"
     listvars = "USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES IMAGE_LINGUAS IMAGE_INSTALL BAD_RECOMMENDATIONS PACKAGE_EXCLUDE"
     return outputvars(imagevars, listvars, d)
 
 def buildhistory_get_sdkvars(d):
+    if d.getVar('BB_WORKERCONTEXT', True) != '1':
+        return ""
     sdkvars = "DISTRO DISTRO_VERSION SDK_NAME SDK_VERSION SDKMACHINE SDKIMAGE_FEATURES BAD_RECOMMENDATIONS NO_RECOMMENDATIONS PACKAGE_EXCLUDE"
     listvars = "SDKIMAGE_FEATURES BAD_RECOMMENDATIONS PACKAGE_EXCLUDE"
     return outputvars(sdkvars, listvars, d)
-- 
1.8.1.2


