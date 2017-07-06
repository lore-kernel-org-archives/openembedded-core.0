Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 172FA7782F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 07:54:46 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 00:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,316,1496127600"; d="scan'208";a="122956758"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 06 Jul 2017 00:54:47 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id D0B4F580585;
	Thu,  6 Jul 2017 00:54:46 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 10:54:37 +0300
Message-Id: <3b4979a63b0180acb311669c93f6f32a6bcd119a.1499327365.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499327365.git.jussi.kukkonen@intel.com>
References: <cover.1499327365.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 5/6] mesa, gstreamer: Add "vulkan" DISTRO_FEATURE
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
X-List-Received-Date: Thu, 06 Jul 2017 07:54:46 -0000

It doesn't do much but does make enabling vulkan a little less fiddly.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/mesa/mesa.inc                            | 3 ++-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 41747cf..27bc4fb 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -25,7 +25,8 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 EXTRA_OECONF = "--enable-shared-glapi --with-llvm-prefix=${STAGING_BINDIR_NATIVE}"
 
 PACKAGECONFIG ??= "gbm egl gles dri \
-		${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
+		${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11 vulkan', d)} \
+		${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 		"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 4f6bc85..e964fef 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -20,7 +20,7 @@ PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     ${PACKAGECONFIG_GL} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland egl', '', d)} \
     bz2 curl dash dtls hls neon rsvg sbc smoothstreaming sndfile uvch264 webp \
 "
-- 
2.1.4


