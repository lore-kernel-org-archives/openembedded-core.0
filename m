Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1CEB87782F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 12:28:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jul 2017 05:28:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,311,1496127600"; d="scan'208";a="107280939"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 05 Jul 2017 05:28:45 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 299F05801CF;
	Wed,  5 Jul 2017 05:28:44 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jul 2017 15:28:37 +0300
Message-Id: <d31dad17f0fee8b1f178a495de0f06cbc55f9d7f.1499256752.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499256752.git.jussi.kukkonen@intel.com>
References: <cover.1499256752.git.jussi.kukkonen@intel.com>
Subject: [PATCH 5/6] mesa, gstreamer: Add "vulkan" DISTRO_FEATURE
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
X-List-Received-Date: Wed, 05 Jul 2017 12:28:45 -0000

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


