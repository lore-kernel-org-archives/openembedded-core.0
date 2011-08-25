Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QwR1X-0005vT-PY
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 05:54:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Aug 2011 20:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="41681659"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2011 20:49:47 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Aug 2011 11:51:44 +0800
Message-Id: <87d07645927c7b7bdbbba3260e3a821c1036a9ad.1314244112.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1314244112.git.dongxiao.xu@intel.com>
References: <cover.1314244112.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1314244112.git.dongxiao.xu@intel.com>
References: <cover.1314244112.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] package.bbclass: Fix recrdeptask of image type recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Aug 2011 03:54:36 -0000

For image type of recipes, we need to define do_package_write as its
do_build recrdeptask, which ensures that all packaging types listed in
PACKAGE_CLASSES will be built out.

[YOCTO 1370]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/package.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 96675de..15c4142 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -184,7 +184,7 @@ python () {
         # shlibs requires any DEPENDS to have already packaged for the *.list files
         deps.append("do_package")
         bb.data.setVarFlag('do_package', 'deptask', " ".join(deps), d)
-    else:
+    elif not bb.data.inherits_class('image', d):
         d.setVar("PACKAGERDEPTASK", "")
 }
 
-- 
1.7.1



