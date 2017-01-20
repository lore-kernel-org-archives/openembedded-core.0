Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F062E772E7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 21:50:28 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 20 Jan 2017 13:50:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,260,1477983600"; d="scan'208";a="215837920"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.102.206])
	by fmsmga004.fm.intel.com with ESMTP; 20 Jan 2017 13:50:28 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri, 20 Jan 2017 13:50:27 -0800
Message-Id: <1484949027-12097-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484949027-12097-1-git-send-email-sgw@linux.intel.com>
References: <1484949027-12097-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2 v2] xserver-xorg: Enable glamor by default
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
X-List-Received-Date: Fri, 20 Jan 2017 21:50:29 -0000

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


