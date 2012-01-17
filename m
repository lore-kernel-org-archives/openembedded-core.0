Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4ax-0006h2-3a
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:43 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:33:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632956"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:14 -0800
Message-Id: <840eb8c54b5025fea00cfedf849c3386be10e1ee.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 29/62] xorg-*: disable xmlto where it was failing
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:45 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* meta-oe now provides xmlto-native
  http://git.openembedded.org/meta-openembedded/commit/?id=ab8f876ca8fa223c183e3db2029cce88f3435a27
  but not the stylesheets for buildhosts without them it's unusable and fails, because xorg macros
  autodetecting xmlto available, see:
  http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-December/037066.html
  after adding xmlto-native and stylesheets-native to DEPENDS we can enable it again

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    2 +-
 .../xorg-proto/xorg-proto-common.inc               |    2 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index d843d65..d106054 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -13,4 +13,4 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--enable-malloc0returnsnull --with-fop=no"
+EXTRA_OECONF = "--enable-malloc0returnsnull --with-fop=no --without-xmlto"
diff --git a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
index 765e30a..856f4d8 100644
--- a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
+++ b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
@@ -14,7 +14,7 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 DEPENDS = "util-macros"
 
 inherit autotools pkgconfig
-EXTRA_OECONF = "--with-fop=no"
+EXTRA_OECONF = "--with-fop=no --without-xmlto"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index b387790..ca7d33a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -9,4 +9,5 @@ EXTRA_OECONF += "\
                  --enable-glx-tls \
                  --with-pic \
                  --with-int10=x86emu \
+                 --without-xmlto \
 "
-- 
1.7.6.5



