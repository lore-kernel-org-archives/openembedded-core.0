Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8oJ8-00041w-BA
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 09:11:54 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2011 00:06:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="21360972"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.219])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 00:06:13 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 00:05:56 -0700
Message-Id: <3b893b36444344298e89e7e2a42cf06eeda1df7e.1317193251.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/29] multilib.bbclass: map RDEPENDS and LINGUAS_INSTALL for image recipes
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
X-List-Received-Date: Wed, 28 Sep 2011 07:11:55 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

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
1.7.6



