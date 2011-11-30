Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RVhdF-0005Ej-Hy
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 11:43:17 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAUAaapG028103
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 02:36:37 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 30 Nov 2011 02:36:36 -0800
Message-ID: <e5e2906ff7b536c1b3e09828ff2075812fc1d66e.1322648566.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1322648566.git.xiaofeng.yan@windriver.com>
References: <cover.1322648566.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 30 Nov 2011 17:12:44 +0800
Date: Wed, 30 Nov 2011 18:33:20 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] xserver-kdrive: update to 1.11.1.902
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2011 10:43:18 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

I didn't remove the old one because it is possible for the new version to \
have some bugs during using or testing.

Patches are commented by "#". Some of them are obsolete.
keyboard-resume-workaround.patch is used in drive mode of keyboard
crosscompile.patch is to avoid to seach "/etc/X11/fontpath.d" of host during configuring of cross-compiling
It is no use in the version.

enable-xcalibrate.patch is to avoid error of compiling tslib. No use in the new version.
nodolt.patch is no use too.

other patches are retained.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../xorg-xserver/xserver-kdrive_1.11.1.902.bb      |   37 ++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.1.902.bb

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.1.902.bb b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.1.902.bb
new file mode 100644
index 0000000..3980057
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.11.1.902.bb
@@ -0,0 +1,37 @@
+require xserver-kdrive.inc
+
+DEPENDS += "libxkbfile libxcalibrate font-util pixman"
+
+RDEPENDS_${PN} += "xkeyboard-config"
+
+EXTRA_OECONF += "--disable-glx --enable-unit-tests=no --enable-kdrive-evdev=yes"
+
+PE = "1"
+PR = "r0"
+
+LIC_FILES_CHKSUM  = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
+
+SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
+          file://extra-kmodes.patch \
+		  file://disable-apm.patch \
+		  file://no-serial-probing.patch \
+		  file://keyboard-resume-workaround.patch \
+		  file://hide-cursor-and-ppm-root.patch \
+		  file://fbdev_xrandr_ioctl.patch \
+		  file://fix-newer-xorg-headers.patch"
+							        
+#file://keyboard-resume-workaround.patch
+#file://enable-xcalibrate.patch
+#file://crosscompile.patch
+#file://nodolt.patch
+#file://kdrive-evdev.patch
+#file://kdrive-use-evdev.patch
+#file://enable-builtin-fonts.patch
+#file://optional-xkb.patch
+
+SRC_URI[md5sum] = "87dd7958ace0509f6e4da2908c2ee4fd"
+SRC_URI[sha256sum] = "06cb2dffb8d0182c539b154e412b25b98c75d0052cfb16762e7af0d6bf23ec7b"
+
+
+
+S = "${WORKDIR}/xorg-server-${PV}"
-- 
1.7.0.4



