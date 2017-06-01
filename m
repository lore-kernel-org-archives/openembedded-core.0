Return-Path: <yau.wai.gan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9C177E83
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 07:34:54 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2017 00:34:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,278,1493708400"; d="scan'208";a="268848229"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by fmsmga004.fm.intel.com with ESMTP; 01 Jun 2017 00:34:53 -0700
From: "Gan, Yau Wai" <yau.wai.gan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 17:24:39 -0700
Message-Id: <1496276679-137217-1-git-send-email-yau.wai.gan@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Gan, yau.wai.gan@intel.com
Subject: [PATCH] insane.bbclass: fix override handling in RDEPENDS QA
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
X-List-Received-Date: Thu, 01 Jun 2017 07:34:55 -0000

The package_qa_check_rdepends() in insane.bbclass has
incorrectly replace its localdata OVERRIDES value with
the package name. Fixing it by appending the package name
to the existing OVERRIDES value. This resolves RDEPENDS QA
error when setting PACKAGECONFIG using a pn- override at
local.conf.

[YOCTO #11374]

Signed-off-by: Gan, Yau Wai <yau.wai.gan@intel.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index dc1c2f8..5a3d017 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -867,7 +867,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
 
     if not "-dbg" in pkg and not "packagegroup-" in pkg and not "-image" in pkg:
         localdata = bb.data.createCopy(d)
-        localdata.setVar('OVERRIDES', pkg)
+        localdata.setVar('OVERRIDES', localdata.getVar('OVERRIDES') + ':' + pkg)
 
         # Now check the RDEPENDS
         rdepends = bb.utils.explode_deps(localdata.getVar('RDEPENDS') or "")
-- 
2.7.4


