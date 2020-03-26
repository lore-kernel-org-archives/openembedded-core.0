Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web12.29515.1585188998475993324
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 19:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 02Q2FxDw007740;
	Wed, 25 Mar 2020 21:16:00 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: otavio.salvador@ossystems.com.br, denis@denix.org, andrey.z@gmail.com,
        ross.burton@intel.com, openembedded-core@lists.openembedded.org
Subject: [v2 PATCH] mesa-gl: Allow mesa-gl to build without X11 enabled.
Date: Wed, 25 Mar 2020 21:15:58 -0500
Message-Id: <20200326021558.114955-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1

Trying to build mesa-gl without X11 enabled, results in numerous errors
about being incorrectly configured, such as:

  ERROR: Problem encountered: building dri drivers require at least one windowing system or classic osmesa

A rendering engine must be available, so per the error we enable osmesa
if X11 is not available.  Once 'osmesa' is enabled we also need to make
sure that swrast for DRI is also available.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb b/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
index d4b1c1c454..c7897cdaf3 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
@@ -6,5 +6,10 @@ PROVIDES = "virtual/libgl virtual/mesa"
 
 S = "${WORKDIR}/mesa-${PV}"
 
-PACKAGECONFIG ??= "opengl dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-PACKAGECONFIG_class-target = "opengl dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+# At least one DRI rendering engine is required to build mesa.
+# When no X11 is available, use osmesa for the rendering engine.
+PACKAGECONFIG ??= "opengl dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
+PACKAGECONFIG_class-target = "opengl dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
+
+# When NOT using X11, we need to make sure we have swrast available.
+DRIDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', ',swrast', d)}"
-- 
2.17.1

