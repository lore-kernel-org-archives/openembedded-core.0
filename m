Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C496A7319E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 02:41:52 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 21 Dec 2015 18:41:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="712450071"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by orsmga003.jf.intel.com with ESMTP; 21 Dec 2015 18:41:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 15:41:27 +1300
Message-Id: <bf656aa4c94050e325b5070d7bf9a9ccf7858243.1450751834.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450751834.git.paul.eggleton@linux.intel.com>
References: <cover.1450751834.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450751834.git.paul.eggleton@linux.intel.com>
References: <cover.1450751834.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] buildhistory: fix not recording SDK information
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
X-List-Received-Date: Tue, 22 Dec 2015 02:41:53 -0000

After OE-Core revision baa4e43a29e45df17eaa3456acc179b08d571db6 we lost
recording SDK the contents in buildhistory. This was due to the
SDK_POSTPROCESS_COMMAND variable being set with = in
populate_sdk_base.bbclass which overwrote any value set with += in
buildhistory.bbclass; to fix it, use _append in buildhistory.bbclass
instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 6023e5d..c0dba59 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -532,7 +532,7 @@ POPULATE_SDK_POST_TARGET_COMMAND_append = " buildhistory_list_installed_sdk_targ
 POPULATE_SDK_POST_HOST_COMMAND_append = " buildhistory_list_installed_sdk_host ;\
                                           buildhistory_get_sdk_installed_host ; "
 
-SDK_POSTPROCESS_COMMAND += "buildhistory_get_sdkinfo ; "
+SDK_POSTPROCESS_COMMAND_append = " buildhistory_get_sdkinfo ; "
 
 def buildhistory_get_build_id(d):
     if d.getVar('BB_WORKERCONTEXT', True) != '1':
-- 
2.5.0


