Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qx2Kc-0006Xu-Kv
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 21:44:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2011 12:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,286,1312182000"; d="scan'208";a="45450503"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.251])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2011 12:39:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 12:39:34 -0700
Message-Id: <b68cd33673fdc17711d7b9fde9cc23b0d8498c17.1314387279.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/21] package.bbclass: Fix recrdeptask of image type recipes
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
X-List-Received-Date: Fri, 26 Aug 2011 19:44:46 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

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
1.7.6



