Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 1286F6B3A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 17:10:05 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2013 10:10:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,744,1367996400"; d="scan'208";a="336772911"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.176])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2013 10:09:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2013 18:09:04 +0100
Message-Id: <3e5105055d34dba87452f15213018d07e44e03f7.1374772012.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1374772012.git.paul.eggleton@linux.intel.com>
References: <cover.1374772012.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1374772012.git.paul.eggleton@linux.intel.com>
References: <cover.1374772012.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] classes/image: ensure BAD_RECOMMENDATIONS supports pre-renamed package names
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
X-List-Received-Date: Thu, 25 Jul 2013 17:10:05 -0000

Use runtime remapping on BAD_RECOMMENDATIONS just as we do with
variables such as IMAGE_INSTALL, so that we're specifying the name prior
to any renaming e.g. that done by debian.bbclass. Note that this is a
change in behaviour for renamed packages, however this is the correct
thing to be doing; a search of existing layers suggests this shouldn't
cause widespread incompatibilities.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 380ed8e..cf02f88 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -132,6 +132,7 @@ python () {
         pn = d.getVar('PN', True)
         runtime_mapping_rename("PACKAGE_INSTALL", pn, d)
         runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", pn, d)
+        runtime_mapping_rename("BAD_RECOMMENDATIONS", pn, d)
 
     # Ensure we have the vendor list for complementary package handling
     ml_vendor_list = ""
-- 
1.8.1.2


