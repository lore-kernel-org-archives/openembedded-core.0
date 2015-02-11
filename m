Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 15ABB609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 16:22:40 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 11 Feb 2015 08:22:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,559,1418112000"; d="scan'208";a="526056924"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga003.jf.intel.com with ESMTP; 11 Feb 2015 08:14:31 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Feb 2015 18:22:29 +0200
Message-Id: <1423671749-19564-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] gst-plugins-*, gstreamer1.0-plugins-*: fix main package binary components
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
X-List-Received-Date: Wed, 11 Feb 2015 16:22:53 -0000

Users often install the main package thinking it will bring in
all of the individual plugin packages, not realising that the
-meta package exists. Since the main package isn't currently
used for anything else, it would make more sense to just make
installing the main package install all of the plugins.
To do this in a manner that doesn't break any upgrade paths,
just add a dependency from the main package on the -meta
package for all of the gstreamer plugin recipes.

Fixes [YOCTO #5589].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index 7bb5678..586bd05 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -51,6 +51,7 @@ PACKAGES += "${PN}-apps ${PN}-meta ${PN}-glib"
 FILES_${PN}-apps = "${bindir}"
 
 RDEPENDS_${PN}-apps += "perl"
+RRECOMMENDS_${PN} += "${PN}-meta"
 
 FILES_${PN} = "${datadir}/gstreamer-${LIBV}"
 FILES_${PN}-dbg += "${libdir}/gstreamer-${LIBV}/.debug"
-- 
2.1.0


