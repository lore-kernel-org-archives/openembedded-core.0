Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q5eoM-0002p8-3d
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 15:54:53 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Apr 2011 06:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,282,1299484800"; d="scan'208";a="622197303"
Received: from unknown (HELO localhost) ([10.255.12.172])
	by orsmga002.jf.intel.com with ESMTP; 01 Apr 2011 06:52:45 -0700
Message-Id: <5cf1c19fa00ca31eb717a31b9554662c5e468e6b.1301665368.git.josh@linux.intel.com>
In-Reply-To: <cover.1301665368.git.josh@linux.intel.com>
References: <cover.1301665368.git.josh@linux.intel.com>
Old-Date: Thu, 31 Mar 2011 13:43:41 +0100
Date: Fri, 01 Apr 2011 14:52:44 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 4/7] xorg-[lib-common|proto-common]: disable use of fop document generation
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
X-List-Received-Date: Fri, 01 Apr 2011 13:54:57 -0000

From: Joshua Lock <josh@linux.intel.com>

On Fedora 15 I see a huge Java backtrace when document generation runs for
some xorg libs. As fop is automatically detected, with the possibility of
detecting fop on the host whilst doing target builds, the safest bet is to
explicitly disable fop for document generation.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    2 +-
 .../xorg-proto/xorg-proto-common.inc               |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 4ed8c86..d843d65 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -13,4 +13,4 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--enable-malloc0returnsnull"
+EXTRA_OECONF = "--enable-malloc0returnsnull --with-fop=no"
diff --git a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
index 92aa1fe..ab1af28 100644
--- a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
+++ b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
@@ -14,6 +14,7 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 DEPENDS = "util-macros"
 
 inherit autotools pkgconfig
+EXTRA_OECONF = "--with-fop=no"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
-- 
1.7.4.1



