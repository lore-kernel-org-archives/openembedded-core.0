Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 81E6A6612C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 14:57:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 18 Nov 2015 06:57:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,313,1444719600"; d="scan'208";a="853917240"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2015 06:57:09 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 17:00:28 +0200
Message-Id: <1447858828-17286-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <25d92033bc37e480de35f031f12e0515fc942068.1447847724.git.jussi.kukkonen@intel.com>
References: <25d92033bc37e480de35f031f12e0515fc942068.1447847724.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2] mesa: Make gl libraries RRECOMMEND mesa-megadriver
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
X-List-Received-Date: Wed, 18 Nov 2015 14:57:11 -0000

This makes e.g. core-image-weston actually work out-of-the-box
on hardware that uses megadriver drivers.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

Ross pointed out that the part about mesa-gl was not actually true,
especially with regards to swrast: e.g. RPi still probably want it.
So I've removed the conditional bit: all mesa gl libraries now
RRECOMMEND megadriver.

This is force pushed to branch 'jku/weston'.

 meta/recipes-graphics/mesa/mesa.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 13a8b9d..424e8b7 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -114,7 +114,9 @@ python __anonymous() {
         d.appendVar("RREPLACES_" + fullp, pkgs)
         d.appendVar("RPROVIDES_" + fullp, pkgs)
         d.appendVar("RCONFLICTS_" + fullp, pkgs)
-        
+
+        d.appendVar("RRECOMMENDS_" + fullp, "mesa-megadriver")
+
         # For -dev, the first element is both the Debian and original name
         fullp += "-dev"
         pkgs = p[1] + "-dev"
-- 
2.1.4


