Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R8sWX-0003Kd-Pt
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 13:42:01 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Sep 2011 04:36:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,455,1312182000"; d="scan'208";a="68238894"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga001.fm.intel.com with ESMTP; 28 Sep 2011 04:36:16 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 19:44:26 +0800
Message-Id: <6cfa3a8327ff795017e4d4c8340c70bc195e6cb2.1317209357.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1317209357.git.dongxiao.xu@intel.com>
References: <cover.1317209357.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1317209357.git.dongxiao.xu@intel.com>
References: <cover.1317209357.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/6] multilib.bbclass: map RDEPENDS and LINGUAS_INSTALL for image recipes
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
X-List-Received-Date: Wed, 28 Sep 2011 11:42:02 -0000

RDEPENDS of image type recipe needs to be mapped to make sure that the
packages included in the image should be multilib version.

Also add LINGUAS_INSTALL into MULTILIB_PACKAGE_INSTALL list.

[YOCTO #1496]
[YOCTO #1527]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/multilib.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 98f6911..0ea1038 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -54,9 +54,12 @@ python __anonymous () {
 
     if bb.data.inherits_class('image', d):
         map_dependencies("PACKAGE_INSTALL", d)
-        pinstall = d.getVar("PACKAGE_INSTALL", True) + " " + d.getVar("MULTILIB_PACKAGE_INSTALL", False)
+        map_dependencies("LINGUAS_INSTALL", d)
+        map_dependencies("RDEPENDS", d)
+        pinstall = d.getVar("LINGUAS_INSTALL", True) + " " + d.getVar("PACKAGE_INSTALL", True) + " " + d.getVar("MULTILIB_PACKAGE_INSTALL", False)
         d.setVar("MULTILIB_PACKAGE_INSTALL", pinstall)
         d.setVar("PACKAGE_INSTALL", "")
+        d.setVar("LINGUAS_INSTALL", "")
         # FIXME, we need to map this to something, not delete it!
         d.setVar("PACKAGE_INSTALL_ATTEMPTONLY", "")
         return
-- 
1.7.1



