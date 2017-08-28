Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EC6337826C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 12:46:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Aug 2017 05:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,441,1498546800"; d="scan'208";a="894744115"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2017 05:46:51 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 7487C580366;
	Mon, 28 Aug 2017 05:46:50 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Aug 2017 15:46:37 +0300
Message-Id: <8221cb131616b7178b32d8c3e35897e589505834.1503923683.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1503923683.git.jussi.kukkonen@intel.com>
References: <cover.1503923683.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/3] xserver-xorg: Enable xwayland only with opengl
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
X-List-Received-Date: Mon, 28 Aug 2017 12:46:50 -0000

This is a bit academic as building with wayland without opengl
should be uncommon: still, libepoxy needs opengl so we shouldn't
depend on it without opengl.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 1650c79..863d80c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -123,7 +123,7 @@ EXTRA_OECONF += "--with-fop=no \
 OPENGL_PKGCONFIGS = "dri glx glamor dri3 xshmfence"
 PACKAGECONFIG ??= "dri2 udev ${XORG_CRYPTO} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${OPENGL_PKGCONFIGS}', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'xwayland', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl wayland', 'xwayland', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 "
 
-- 
2.1.4


