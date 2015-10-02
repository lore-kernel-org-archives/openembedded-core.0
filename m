Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2B25176FD0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 12:39:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Oct 2015 05:39:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,623,1437462000"; d="scan'208";a="817918144"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 02 Oct 2015 05:39:31 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Oct 2015 15:41:58 +0300
Message-Id: <1443789718-6846-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libepoxy: RDEPEND on libgl
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
X-List-Received-Date: Fri, 02 Oct 2015 12:39:34 -0000

Automatic dependency tracking does not notice this (understandable
with the dlopen trickery epoxy does).

[YOCTO #8371]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---


I'm not super familiar with the opengl handling so please let me know if there's some
better way to do this: The problem being fixed is e.g. gtk3-demo failing to start
because it fails to dlopen libGL.so.1.


 meta/recipes-graphics/libepoxy/libepoxy_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_git.bb b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
index ad17293..fe05d4e 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_git.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
@@ -20,6 +20,7 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig
 
 DEPENDS = "util-macros virtual/egl"
+RDEPENDS_${PN} = "libgl"
 
 PACKAGECONFIG[x11] = "--enable-glx, --disable-glx, virtual/libx11"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-- 
2.1.4


