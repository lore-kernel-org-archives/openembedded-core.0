Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web11.19288.1585160101802382399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 11:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 02PIEmDE004029;
	Wed, 25 Mar 2020 13:14:49 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: ross.burton@intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa-gl: The purpose of mesa-gl is to provide for X11 usage
Date: Wed, 25 Mar 2020 13:14:47 -0500
Message-Id: <20200325181447.14750-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1

Trying to build mesa-gl without X11 enabled, results in numerous errors
about being incorrectly configured, such as:

  ERROR: Problem encountered: building dri drivers require at least one windowing system or classic osmesa

After consulting with the author of this recipe, it was clear that it
was only intended for the X11 use-case, so requring X11 should avoid the
error message above.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb b/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
index d4b1c1c454..5674c6b1fe 100644
--- a/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
@@ -6,5 +6,7 @@ PROVIDES = "virtual/libgl virtual/mesa"
 
 S = "${WORKDIR}/mesa-${PV}"
 
-PACKAGECONFIG ??= "opengl dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-PACKAGECONFIG_class-target = "opengl dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+REQUIRED_DISTRO_FEATURE = "x11"
+
+PACKAGECONFIG ??= "opengl dri x11"
+PACKAGECONFIG_class-target = "opengl dri x11"
-- 
2.17.1

