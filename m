Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn6Qs-0003sK-VQ
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 12:43:37 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Dec 2012 03:28:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="184316282"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Dec 2012 03:28:07 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 13:28:39 +0200
Message-Id: <7207a2a11ecce936a789cbdd7c89478fd5697ef5.1356347599.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356347599.git.constantinx.musca@intel.com>
References: <cover.1356347599.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356347599.git.constantinx.musca@intel.com>
References: <cover.1356347599.git.constantinx.musca@intel.com>
Subject: [PATCH 2/3] xserver-xorg: enable multilib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Dec 2012 11:43:40 -0000

[YOCTO #3438]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 7331cf6..5d5443c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -13,7 +13,7 @@ PROVIDES = "virtual/xserver-xf86"
 PROVIDES += "virtual/xserver"
 
 PE = "2"
-INC_PR = "r7"
+INC_PR = "r8"
 
 XORG_PN = "xorg-server"
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
@@ -151,7 +151,8 @@ python populate_packages_prepend() {
         p = subprocess.Popen(args="pkg-config --variable=%s xorg-server" % abis[name],
                              shell=True, env=newenv, stdout=subprocess.PIPE)
         output = p.communicate()[0]
-        return "xorg-abi-%s-%s" % (name, output.split(".")[0])
+        mlprefix = d.getVar('MLPREFIX', True) or ''
+        return "%sxorg-abi-%s-%s" % (mlprefix, name, output.split(".")[0])
 
     pn = d.getVar("PN", True)
     d.appendVar("RPROVIDES_" + pn, " " + get_abi("input"))
-- 
1.7.11.7



