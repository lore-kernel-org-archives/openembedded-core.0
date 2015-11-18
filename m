Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D612760767
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 12:03:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Nov 2015 04:03:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,312,1444719600"; d="scan'208";a="853800092"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2015 04:03:43 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 14:07:04 +0200
Message-Id: <25d92033bc37e480de35f031f12e0515fc942068.1447847724.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1447847724.git.jussi.kukkonen@intel.com>
References: <cover.1447847724.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/2] mesa: Make gl libraries RRECOMMEND mesa-megadriver
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
X-List-Received-Date: Wed, 18 Nov 2015 12:03:45 -0000

This makes e.g. core-image-weston actually work out-of-the-box
on hardware that uses megadriver drivers.

With typical mesa-gl use this would be unexpected: skip the
recommendation there.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb | 3 +++
 meta/recipes-graphics/mesa/mesa.inc          | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb b/meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb
index fc2bca9..d55f56e 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb
@@ -11,3 +11,6 @@ S = "${WORKDIR}/mesa-${PV}"
 PACKAGECONFIG ??= "dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 
 EXCLUDE_FROM_WORLD = "1"
+
+# GL libraries should not RRECOMMEND megadriver
+SKIP_RRECOMMENDS_MEGADRIVER = "1"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 13a8b9d..3400b1c 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -114,7 +114,10 @@ python __anonymous() {
         d.appendVar("RREPLACES_" + fullp, pkgs)
         d.appendVar("RPROVIDES_" + fullp, pkgs)
         d.appendVar("RCONFLICTS_" + fullp, pkgs)
-        
+
+        if d.getVar("SKIP_RRECOMMENDS_MEGADRIVER", False) != "1":
+            d.appendVar("RRECOMMENDS_" + fullp, "mesa-megadriver")
+
         # For -dev, the first element is both the Debian and original name
         fullp += "-dev"
         pkgs = p[1] + "-dev"
-- 
2.1.4


