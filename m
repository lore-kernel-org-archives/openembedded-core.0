Return-Path: <openembedded-devel@urbanec.net>
Received: from mail14.tpgi.com.au (mail14.tpgi.com.au [203.12.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9E960670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 17:57:32 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Fri, 27 Feb 2015 04:57:32 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail14.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id t1QHvTIa012359
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 04:57:32 +1100
Received: from beep.urbanec.net ([192.168.42.2]) by gw.urbanec.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_CBC_SHA256:128) (Exim 4.84)
	(envelope-from <openembedded-devel@urbanec.net>)
	id 1YR2gj-0005KU-K7; Fri, 27 Feb 2015 04:57:29 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Feb 2015 04:57:22 +1100
Message-Id: <1424973442-24727-1-git-send-email-openembedded-devel@urbanec.net>
X-Mailer: git-send-email 2.3.0
Cc: Peter Urbanec <openembedded-devel@urbanec.net>
Subject: [PATCH] gstreamer1.0*git: Update to build current AUTOREV from master branch.
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
X-List-Received-Date: Thu, 26 Feb 2015 17:57:33 -0000

Now builds current git source from master branch. This is probably what
most people would expect, instead of SRCREV snapshots from circa 2013.

The recipes have been modified to prevent infinite recursion when the
python implementation of SRC_URI in gstreamer1.0-plugins.inc references
package version information which depends on SRC_URI when AUTOREV is used.

Any revision from master branch can be built by specifying the desired
SRCREV in the appropriate .conf file or using .bbappend. Patches can also
be applied on top in a similar manner.

Signed-off-by: Peter Urbanec <openembedded-devel@urbanec.net>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb    |  9 +++++++--
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb                  |  9 ++++++++-
 .../gstreamer/gstreamer1.0-plugins-base_git.bb                 | 10 ++++++++--
 .../recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc |  2 +-
 .../gstreamer/gstreamer1.0-plugins-good_git.bb                 | 10 ++++++++--
 .../gstreamer/gstreamer1.0-plugins-ugly_git.bb                 |  9 ++++++++-
 meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb          | 10 ++++++++--
 7 files changed, 48 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
index bf1b87e..97d7a9e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
@@ -5,16 +5,21 @@ include gstreamer1.0-libav.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
-                    file://gst-libs/ext/libav/LICENSE;md5=23a54f59b82572c203a559346e89ed57 \
+                    file://gst-libs/ext/libav/LICENSE;md5=c6d98fb56909e4c624e16fbb717a456d \
                     file://gst-libs/ext/libav/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
+inherit gitpkgv
+
 SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-libav;branch=master"
 S = "${WORKDIR}/git"
 
-SRCREV = "127202d6f65584891dabf92be031f0d170b0e7f1"
+SRCREV ?= "${AUTOREV}"
+
+PV = "git"
+PKGV = "git+${GITPKGV}"
 
 LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index 309505f..03e5ade 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -9,7 +9,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
 
 S = "${WORKDIR}/git"
 
-SRCREV = "6e5db57d2446a753aaa76bee268e1f95600b14ce"
+inherit gitpkgv
+
+SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-plugins-bad;branch=master"
+
+SRCREV ?= "${AUTOREV}"
+
+PV = "git"
+PKGV = "git+${GITPKGV}"
 
 PACKAGECONFIG[sbc] = "--enable-sbc,--disable-sbc,sbc"
 PACKAGECONFIG[hls] = "--enable-hls,--disable-hls,gnutls"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
index fbe3a42..c113c2d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
@@ -3,13 +3,19 @@ DEFAULT_PREFERENCE = "-1"
 include gstreamer1.0-plugins-base.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
-                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
                    "
 
 S = "${WORKDIR}/git"
 
-SRCREV = "8d4cb64a4b9d84b10076bf350f80a0d6ea68ec2d"
+inherit gitpkgv
+
+SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-plugins-base;branch=master"
+
+SRCREV ?= "${AUTOREV}"
+
+PV = "git"
+PKGV = "git+${GITPKGV}"
 
 do_configure_prepend() {
 	cd ${S}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 37217f0..acf260c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -11,7 +11,7 @@ inherit gettext
 PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
-    orc cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib \
+    orc flac gdk-pixbuf gudev jpeg libpng soup speex taglib \
     "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
index 2c0e0ef..8e6f4de 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
@@ -3,12 +3,18 @@ DEFAULT_PREFERENCE = "-1"
 include gstreamer1.0-plugins-good.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "fd0123800c8c1cf1468c0fa5d592ad0d0d8b4140"
+inherit gitpkgv
+
+SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-plugins-good;branch=master"
+
+SRCREV ?= "${AUTOREV}"
+
+PV = "git"
+PKGV = "git+${GITPKGV}"
 
 do_configure_prepend() {
 	cd ${S}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
index dcf5ffc..36501a0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
@@ -7,7 +7,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 S = "${WORKDIR}/git"
 
-SRCREV = "06b8ac10cee85c5c304ca320997aa8f44295a66f"
+inherit gitpkgv
+
+SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-plugins-ugly;branch=master"
+
+SRCREV ?= "${AUTOREV}"
+
+PV = "git"
+PKGV = "git+${GITPKGV}"
 
 do_configure_prepend() {
 	cd ${S}
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
index cb00d31..6b200eb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
@@ -5,10 +5,16 @@ include gstreamer1.0.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
 
-SRC_URI = "git://anongit.freedesktop.org/gstreamer/gstreamer;branch=master"
+inherit gitpkgv
+
+SRC_URI = "git://anongit.freedesktop.org/gstreamer/gstreamer;branch=master \
+"
 S = "${WORKDIR}/git"
 
-SRCREV = "3b8181a8c550e74acaba4e8c55bdc649fa551dc9"
+SRCREV ?= "${AUTOREV}"
+
+PV = "git"
+PKGV = "git+${GITPKGV}"
 
 do_configure_prepend() {
 	cd ${S}
-- 
2.3.0


