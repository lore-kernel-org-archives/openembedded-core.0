Return-Path: <sgw@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 46F207199A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 23:33:47 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 12 Jan 2017 15:33:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,220,1477983600"; d="scan'208";a="48297771"
Received: from swold-mobl2.amr.corp.intel.com ([10.255.64.27])
	by orsmga004.jf.intel.com with ESMTP; 12 Jan 2017 15:33:47 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu, 12 Jan 2017 15:33:41 -0800
Message-Id: <1484264021-28569-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] xserver-xorg: Enable glamor by default
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
X-List-Received-Date: Thu, 12 Jan 2017 23:33:52 -0000

To enable glamor, we need to also enable both dri3 and xshmfence as dependencies.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 6a13380..0d3022f 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -121,8 +121,9 @@ EXTRA_OECONF += "--with-fop=no \
 "
 EXTRA_OECONF[vardepsexclude] = "MACHINE"
 
+OPENGL_PKGCONFIGS = "dri glx glamor dri3 xshmfence"
 PACKAGECONFIG ??= "dri2 udev ${XORG_CRYPTO} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri glx', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${OPENGL_PKGCONFIGS}', '', d)} \
                    ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "xwayland", "", d)} \
                    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd", "", d)} \
 "
-- 
2.7.4


