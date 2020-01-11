Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 79EE97FFE0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 03:19:41 +0000 (UTC)
IronPort-SDR: PRHneqJWFyY/zzKjANpRIEHgNcLw4c+eawkL7AyIPlHqZ1sheh3rRHs4WXcPi7Fc+AWCJUE/8n
	7GBPPKoNf9GntNp5oymWPBkz5FnkEMVCwbetWyrTNglCyzCGIp1a65Ua2FTqmFSAO9bquVQMsF
	H+vW9mgN3rop/WvNBz/sFQV4Kz7zdIPHgoFUXCqtzNQzbMEgm+kuM4gYBLCFAarrs4aoAUqigJ
	J1f7ONuLe9MjZDKZkcyqitiL/j4PMvFi04AW9rjf4cFozxlTvlDL7lN7KSvLrKB/bIYr5BSpe6
	jUc=
X-IronPort-AV: E=Sophos;i="5.69,419,1571695200"; 
   d="scan'208";a="4323930"
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 11 Jan 2020 04:19:39 +0100
Message-ID: <20200111031940.24296-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [master][zeus][PATCHv3 1/2] cairo: Add a PACKAGECONFIG "trace" to disable cairo-trace
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
X-List-Received-Date: Sat, 11 Jan 2020 03:19:43 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

cairo-trace is the only part of cairo that is licensed as GPL-3.0, and
is normally packaged separately in cairo-perf-utils.

The "trace" PACKAGECONFIG is enabled by default for backwards
compatibility.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv3: Split in two patches, one that adds the "trace" PACKAGECONFIG,
and one that adapts the licenses for cairo-dbg and cairo-src if "trace"
is disabled.

 meta/recipes-graphics/cairo/cairo_1.16.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index e3de3f6164..b772c2ece2 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -40,7 +40,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)}"
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
+                   trace"
 
 PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
 PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
@@ -49,6 +50,7 @@ PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
 PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
 PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-glesv2,virtual/libgles2"
 PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
+PACKAGECONFIG[trace] = "--enable-trace,--disable-trace"
 
 EXTRA_OECONF += " \
     ${@bb.utils.contains('TARGET_FPU', 'soft', '--disable-some-floating-point', '', d)} \
@@ -66,6 +68,8 @@ do_install_append () {
 	rm -rf ${D}${libdir}/cairo/cairo-sphinx*
 	rm -rf ${D}${libdir}/cairo/.debug/cairo-fdr*
 	rm -rf ${D}${libdir}/cairo/.debug/cairo-sphinx*
+	rmdir -p --ignore-fail-on-non-empty ${D}${bindir}
+	rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo
 }
 
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
-- 
2.21.1


