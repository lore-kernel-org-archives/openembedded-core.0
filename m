Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB81719A7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:30:54 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 06 Feb 2017 12:30:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="61869035"
Received: from mmurr6x-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.252.199.82])
	by fmsmga005.fm.intel.com with ESMTP; 06 Feb 2017 12:30:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2017 09:30:48 +1300
Message-Id: <9bd014c81cb0abea70e2ca8c19b4938fe6c0f312.1486412900.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1486412900.git.paul.eggleton@linux.intel.com>
References: <cover.1486412900.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] classes/populate_sdk_ext: remove unnecessary dependencies breaking SDK_TARGETS
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
X-List-Received-Date: Mon, 06 Feb 2017 20:30:54 -0000

Up until recently it was possible to set SDK_TARGETS to include a native
recipe you wanted installed into the sysroot when installing the eSDK.
I'm not sure what happened but now when you try to add a native recipe
to SDK_TARGETS you get a missing task error because this recipe has no
do_package_write_* task. Of course such a task dependency is erroneous
and is apparently caused by setting SDK_RDEPENDS. I've checked and it
turns out that we no longer need to set SDK_RDEPENDS anyway (probably
because we explicitly set up task dependencies further down in the
class, which I don't think we were fully doing in early versions of the
eSDK). Thus, drop setting this variable to restore the functionality.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 9517111..4eda06b 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -11,8 +11,6 @@ TOOLCHAIN_HOST_TASK_task-populate-sdk-ext = " \
 
 TOOLCHAIN_TARGET_TASK_task-populate-sdk-ext = ""
 
-SDK_RDEPENDS_append_task-populate-sdk-ext = " ${SDK_TARGETS}"
-
 SDK_RELOCATE_AFTER_INSTALL_task-populate-sdk-ext = "0"
 
 SDK_EXT = ""
-- 
2.9.3


