Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id A5F857FFE3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 22:03:07 +0000 (UTC)
IronPort-SDR: f3RcYzFe1P5ryEfAOZm2RqVemidPJj70CXIqBZlTNHWxYrDtqELG2HRUsEtjS8wvbbe3uXsVRE
	vjjbfhdyGytxWBqz+1Nl3f+x8yoycVDlZNNClus1fbbjJqOGE1Kz+VHq9zS49nAX2ytdU10J3G
	22PBQ9K9AwnazbivoQ7Q2+8L5eGo+SoIk47NzjEMnAwXYe+icNq6tZ/9T6SC+rE1ZWzftokBp6
	49HgQhnY8dnErNjxVHw4R5iyh1QDzdNFjJ/HVRLPmf/ZDiGjKW5hgQL7hereJTuYqeXasOUrMr
	gOI=
X-IronPort-AV: E=Sophos;i="5.69,418,1571695200"; 
   d="scan'208";a="4321558"
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jan 2020 23:03:06 +0100
Message-ID: <20200110220306.13780-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [master][zeus][PATCHv2] cairo: Adapt license for cairo-dbg and cairo-src based on contents
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
X-List-Received-Date: Fri, 10 Jan 2020 22:03:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

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

PATCHv2: Remove the /usr/bin and /usr/lib/cairo directories if they
are empty.

 meta/recipes-graphics/cairo/cairo_1.16.0.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index e3de3f6164..d5820166b1 100644
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
@@ -66,6 +72,8 @@ do_install_append () {
 	rm -rf ${D}${libdir}/cairo/cairo-sphinx*
 	rm -rf ${D}${libdir}/cairo/.debug/cairo-fdr*
 	rm -rf ${D}${libdir}/cairo/.debug/cairo-sphinx*
+	rmdir -p --ignore-fail-on-non-empty ${D}${bindir}
+	rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo
 }
 
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
-- 
2.21.1


