Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 130A27F876
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 22:29:26 +0000 (UTC)
IronPort-SDR: HfQVl1RlMrvRTe0lzAp4HRgPGga9xm80TzUj5Wj73js381iZQEQFL2x135qYaDVDkZbxTRRZ7n
	CdyY/2jh1uiaUfAYap/f2QNWB6CwUx76OWYjpD/YypguAR2iZYJ+OWzo00dWiN85svaVaORIc6
	nSSaQSUdWflgcnUn8YMB175Ih9S6Alkqotq5fFY1BnYyaQrMJCgsix2XBICfYxeEcfzDEix9S5
	qP0dVOEir3P+DWDcePow7EwzbiQqq512pWH4T2GPi1q+BvJovDgwNzmSeXryFvnYNUtY11ULfj
	jJ8=
X-IronPort-AV: E=Sophos;i="5.69,282,1571695200"; 
   d="scan'208";a="3192580"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 23:26:17 +0100
Message-Id: <20191205222617.31872-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [master][zeus][PATCH] cairo: Adapt license for cairo-dbg and cairo-src based on contents
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
X-List-Received-Date: Thu, 05 Dec 2019 22:29:27 -0000
Content-Transfer-Encoding: 8bit

Introduce a PACKAGECONFIG "trace" to disable cairo-trace (the only
part of the code licensed as GPL-3.0, and which is normally packaged
separately in cairo-perf-utils). By disabling this, we can adapt the
licenses for cairo-dbg and cairo-src so that they do not include
"GPLv3+" when trace is disabled and thus they can be used also when,
e.g., GPL-3.0 is blacklisted in INCOMPATIBLE_LICENSE.

The "trace" PACKAGECONFIG is enabled by default for backwards
compatibility.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-graphics/cairo/cairo_1.16.0.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index e3de3f6164..36a7b3c180 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -17,6 +17,10 @@ LICENSE_${PN}-doc = "MPL-1.1 | LGPLv2.1"
 LICENSE_${PN}-gobject = "MPL-1.1 | LGPLv2.1"
 LICENSE_${PN}-script-interpreter = "MPL-1.1 | LGPLv2.1"
 LICENSE_${PN}-perf-utils = "GPLv3+"
+# Adapt the licenses for cairo-dbg and cairo-src depending on whether
+# cairo-trace is being built.
+LICENSE_${PN}-dbg = "(MPL-1.1 | LGPLv2.1)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPLv3+', '', d)}"
+LICENSE_${PN}-src = "(MPL-1.1 | LGPLv2.1)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPLv3+', '', d)}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
@@ -40,7 +44,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)}"
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
+                   trace"
 
 PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
 PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
@@ -49,6 +54,7 @@ PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
 PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
 PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-glesv2,virtual/libgles2"
 PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
+PACKAGECONFIG[trace] = "--enable-trace,--disable-trace"
 
 EXTRA_OECONF += " \
     ${@bb.utils.contains('TARGET_FPU', 'soft', '--disable-some-floating-point', '', d)} \
-- 
2.21.0


