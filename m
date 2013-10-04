Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DDA46610DF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 04:29:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r944T1OK016947
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Oct 2013 21:29:02 -0700 (PDT)
Received: from [128.224.23.105] (128.224.23.105) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 3 Oct 2013 21:29:00 -0700
Message-ID: <524E4405.6060408@windriver.com>
Date: Fri, 4 Oct 2013 00:28:53 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <524E24AE.5060009@windriver.com>
In-Reply-To: <524E24AE.5060009@windriver.com>
X-Originating-IP: [128.224.23.105]
Subject: Re: DISTRO_FEATURES and world builds.
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
X-List-Received-Date: Fri, 04 Oct 2013 04:29:01 -0000
X-Groupsio-MsgNum: 45572
Content-Type: multipart/mixed; boundary="------------050206030605020603080106"

--------------050206030605020603080106
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-10-03 10:15 PM, Randy MacLeod wrote:
>
> Some world builds without the DFs: x11 or opengl fail unless
> I run: bitbake -k world. Ideally packages would exclude themselves
> from world builds if a required DF isn't set. Otherwise identifying
> broken packages in bb world builds is not straight-forward. I can
> add the DFs in to my world test builds but then I'm not really
> exercising at least some of the recipes properly.
>
> So....
> What are the rules around DISTRO_FEATURES and bitbake world builds?
> What testing has been done and which if any DFs are mandatory.
>
>
> I copied the default DFs from
> meta/conf/distro/include/default-distrovars.inc:
> DISTRO_FEATURES_DEFAULT ?= \
> "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget \
>   usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
>
> into my conf/local.conf file as:
> DISTRO_FEATURES = \
> "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget \
> usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
>
> and I if I do a bitbake world it fails with:
>
>
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing PROVIDES 'virtual/libgl' (but
> /home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/clutter/clutter-1.0_1.14.4.bb,
> /home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb,
> /home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/glew/glew_1.10.0.bb,
> /home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-qt/qt4/qt4-x11-free_4.8.5.bb,
> /home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/mesa/libglu_9.0.0.bb,
> /home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/cogl/cogl-1.0_1.14.0.bb
> DEPENDS on or otherwise requires it)
> ERROR: mesa PROVIDES virtual/libgl but was skipped: missing required
> distro feature ['opengl'] (not in DISTRO_FEATURES)
> ERROR: mesa-gl PROVIDES virtual/libgl but was skipped: missing required
> distro feature ['opengl'] (not in DISTRO_FEATURES)
> ERROR: mesa PROVIDES virtual/libgl but was skipped: missing required
> distro feature ['opengl'] (not in DISTRO_FEATURES)
> ERROR: Required build target 'clutter-gtk-1.0' has no buildable providers.
> Missing or unbuildable dependency chain was: ['clutter-gtk-1.0',
> 'clutter-1.0', 'virtual/libgl']
>
>
>
> If I drop x11 from the DF list things are even worse.
>
> I tried to sprinkle these recipes with:
>     REQUIRED_DISTRO_FEATURES = "opengl"
> but just as I thought, that didn't work either.
>


I found similar example:
$ cat meta/recipes-core/udev/udev.inc
...
# As systemd also builds udev,
# skip this package if we're doing a systemd build.
python () {
     if oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
         raise bb.parse.SkipPackage("'systemd' in DISTRO_FEATURES")
}

and adding that to all the recipes that depend on opengl/egl
*did* fix the bitbake world problem but now I'm stuck on:

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'clutter-1.0' (but 
/home/rmacleod/src/distro/oe/oe-core.git/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb 
RDEPENDS on or otherwise requires it)
ERROR: clutter-1.0 was skipped: 'opengl' in DISTRO_FEATURES
NOTE: Runtime target 'clutter-1.0' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['clutter-1.0']
ERROR: Required build target 'packagegroup-core-clutter' has no 
buildable providers.
Missing or unbuildable dependency chain was: 
['packagegroup-core-clutter', 'clutter-1.0']

and it's late. I'll attach (yes sorry it's not inline) what
I have so far, it's pure bulldozing work so it's only useful if
someone wants to pick up where I've left off and review what I've
done so far more carefully.


( grep -r -B 1 SkipPackage meta/recipes* for a list)


Here's an example patch of what I'm trying:

diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc 
b/meta/recipes-graphics/clutter/clutter-1.0.inc
index 1356586..0cdaadf 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -2,6 +2,11 @@ DESCRIPTION = "Clutter graphics library"
  HOMEPAGE = "http://www.clutter-project.org/"
  LICENSE = "LGPLv2.1+"

+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'opengl', \
                  True, False, d):
+        raise bb.parse.SkipPackage("'opengl' in DISTRO_FEATURES")
+}
+
  inherit clutter
...


Should I flip the True, False around and drop the "not" ?

This whole approach feels wrong and hopefully we can solve it
in a less brute-force manner. Doing this for x11 will be madness.

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

--------------050206030605020603080106
Content-Type: text/x-patch; name="does-not-contain-opengl-distro-flag.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="does-not-contain-opengl-distro-flag.patch"

diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index 1356586..70ac44a 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -2,6 +2,11 @@ DESCRIPTION = "Clutter graphics library"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2.1+"
 
+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
+        raise bb.parse.SkipPackage("'opengl' in DISTRO_FEATURES")
+}
+
 inherit clutter
 
 SRC_URI += "file://enable_tests.patch \
diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.0_1.6.0.bb b/meta/recipes-graphics/clutter/clutter-gst-1.0_1.6.0.bb
index dc5cc13..ed12c8b 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-1.0_1.6.0.bb
+++ b/meta/recipes-graphics/clutter/clutter-gst-1.0_1.6.0.bb
@@ -7,3 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI[archive.md5sum] = "d60ab0118730cecd5dd9988ad7da034b"
 SRC_URI[archive.sha256sum] = "abc879cdd562f1640a825131405f4327a427bfe65b805ebc25d0c78909c8c622"
+
+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
+        raise bb.parse.SkipPackage("'opengl' in DISTRO_FEATURES")
+}
+
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
index 3717f48..b80c189 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
@@ -10,3 +10,7 @@ AUTOTOOLS_AUXDIR = "${S}/build"
 
 EXTRA_OECONF += "--disable-introspection"
 
+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
+        raise bb.parse.SkipPackage("'opengl' in DISTRO_FEATURES")
+}
diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 59ff66e..e0aff42 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -82,3 +82,8 @@ FILES_libcogl-pango-dev = "${includedir}/cogl/cogl-pango \
 RPROVIDES_libcogl = "cogl-1.0"
 RCONFLICTS_libcogl = "cogl-1.0"
 RREPLACES_libcogl = "cogl-1.0"
+
+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
+        raise bb.parse.SkipPackage("'opengl' in DISTRO_FEATURES")
+}
diff --git a/meta/recipes-graphics/eglinfo/eglinfo.inc b/meta/recipes-graphics/eglinfo/eglinfo.inc
index 785e7f1..41e3568 100644
--- a/meta/recipes-graphics/eglinfo/eglinfo.inc
+++ b/meta/recipes-graphics/eglinfo/eglinfo.inc
@@ -25,3 +25,8 @@ EXTRA_OECONF = "--platform=${EGLINFO_PLATFORM} \
 do_install_append() {
 	mv ${D}/${bindir}/eglinfo ${D}/${bindir}/${EGLINFO_BINARY_NAME}
 }
+
+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
+        raise bb.parse.SkipPackage("'opengl' in DISTRO_FEATURES")
+}
diff --git a/meta/recipes-graphics/glew/glew_1.10.0.bb b/meta/recipes-graphics/glew/glew_1.10.0.bb
index e5a63b4..f054b38 100644
--- a/meta/recipes-graphics/glew/glew_1.10.0.bb
+++ b/meta/recipes-graphics/glew/glew_1.10.0.bb
@@ -5,6 +5,11 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
 
+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
+        raise bb.parse.SkipPackage("'opengl' in DISTRO_FEATURES")
+}
+
 DEPENDS = "virtual/libx11 virtual/libgl libglu libxext libxi libxmu"
 
 
diff --git a/meta/recipes-graphics/mesa/libglu_9.0.0.bb b/meta/recipes-graphics/mesa/libglu_9.0.0.bb
index 06d30f9..53ee8a1 100644
--- a/meta/recipes-graphics/mesa/libglu_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/libglu_9.0.0.bb
@@ -8,6 +8,11 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://include/GL/glu.h;endline=29;md5=6b79c570f644363b356456e7d44471d9 \
                     file://src/libtess/tess.c;endline=29;md5=6b79c570f644363b356456e7d44471d9"
 
+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
+        raise bb.parse.SkipPackage("'opengl' in DISTRO_FEATURES")
+}
+
 # Epoch as this used to be part of mesa
 PE = "2"
 PR = "0"
diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
index 3ac81ef..97f9c4a 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
@@ -5,6 +5,12 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 
+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
+        raise bb.parse.SkipPackage("'opengl' in DISTRO_FEATURES")
+}
+
+
 LICENSE = "MIT & PD"
 LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=914225785450eff644a86c871d3ae00e \
                     file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
diff --git a/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb b/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
index 5657469..671439c 100644
--- a/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
+++ b/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
@@ -12,3 +12,9 @@ S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24 \
                     file://mx/mx-widget.c;beginline=8;endline=20;md5=13bba3c973a72414a701e1e87b5ee879"
+
+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
+        raise bb.parse.SkipPackage("'opengl' in DISTRO_FEATURES")
+}
+
diff --git a/meta/recipes-graphics/wayland/weston_1.1.0.bb b/meta/recipes-graphics/wayland/weston_1.1.0.bb
index 8280bf2..6018999 100644
--- a/meta/recipes-graphics/wayland/weston_1.1.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.1.0.bb
@@ -81,3 +81,8 @@ RRECOMMENDS_${PN} = "liberation-fonts"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "--system weston-launch"
+
+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
+        raise bb.parse.SkipPackage("'opengl' in DISTRO_FEATURES")
+}
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
index 4474e1e..092a66d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
@@ -21,3 +21,8 @@ EXTRA_OECONF += "ac_cv_header_GL_gl_h=no"
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-apps = "1"
 ALLOW_EMPTY_${PN}-glib = "1"
+
+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
+        raise bb.parse.SkipPackage("'opengl' in DISTRO_FEATURES")
+}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.9.bb
index 9ce7991..f59b12e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.0.9.bb
@@ -10,3 +10,8 @@ SRC_URI[sha256sum] = "69d236b1d8188270a3f51f6710146d0ca63c2f1a9f6cfbab3399ef01b9
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
+        raise bb.parse.SkipPackage("'opengl' in DISTRO_FEATURES")
+}
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index e1a5904..45803ef 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -24,3 +24,7 @@ do_configure() {
 	oe_runconf
 }
 
+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
+        raise bb.parse.SkipPackage("'opengl' in DISTRO_FEATURES")
+}
diff --git a/meta/recipes-qt/qt-apps/fotowall_0.9.bb b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
index 2e1fbaa..ef097a8 100644
--- a/meta/recipes-qt/qt-apps/fotowall_0.9.bb
+++ b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
@@ -28,3 +28,4 @@ do_install() {
 
 # Ensure we have some plugins for some useful image formats
 RRECOMMENDS_${PN} += "qt4-plugin-imageformat-gif qt4-plugin-imageformat-jpeg qt4-plugin-imageformat-tiff"
+
diff --git a/meta/recipes-qt/qt-apps/quicky_0.4.bb b/meta/recipes-qt/qt-apps/quicky_0.4.bb
index acacd8e..14866b7 100644
--- a/meta/recipes-qt/qt-apps/quicky_0.4.bb
+++ b/meta/recipes-qt/qt-apps/quicky_0.4.bb
@@ -17,3 +17,4 @@ do_install() {
 	install -d ${D}${bindir}
 	install -m 0755 ${S}/${BPN} ${D}${bindir}
 }
+
diff --git a/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb b/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
index cd7d5b5..8368f79 100644
--- a/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
+++ b/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
@@ -8,3 +8,9 @@ qtm_extra_config := ""
 
 inherit qt4x11
 require qt-mobility_${PV}.inc
+
+python () {
+    if not oe.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
+        raise bb.parse.SkipPackage("'opengl' in DISTRO_FEATURES")
+}
+
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 369b3d5..5cc55b3 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -3,7 +3,9 @@ require qt4.inc
 DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is the X11 version."
 HOMEPAGE = "http://qt-project.org/"
 SECTION = "x11/libs"
-DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
+DEPENDS += "virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
+DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
+
 PROVIDES += "qt4-x11"
 QT4DEPENDS = ""
 

--------------050206030605020603080106--
