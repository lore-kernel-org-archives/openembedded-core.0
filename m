Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCs-0000ex-TV
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:47 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181445"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:33 +0300
Message-Id: <ccea2d07d0f88da1d5df027147238a97f78a4d3a.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: [CONSOLIDATED REQUEST 46/64] owl-video_git.bb: fix compilation on Fedora 13 machine
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
X-List-Received-Date: Tue, 14 Aug 2012 12:30:18 -0000

From: Matthew McClintock <msm@freescale.com>

This adds libXrandr to the link step and fixes this issue:

| /opt/yocto/upstream/label/master/machine/atom-pc/poky/edison/tmp/sysroots/atom-pc/usr/lib/libgdk-x11-2.0.so: undefined reference to `XRRGetOutputInfo'
| /opt/yocto/upstream/label/master/machine/atom-pc/poky/edison/tmp/sysroots/atom-pc/usr/lib/libgdk-x11-2.0.so: undefined reference to `XRRGetScreenResourcesCurrent'
| /opt/yocto/upstream/label/master/machine/atom-pc/poky/edison/tmp/sysroots/atom-pc/usr/lib/libgdk-x11-2.0.so: undefined reference to `XRRFreeOutputInfo'
| /opt/yocto/upstream/label/master/machine/atom-pc/poky/edison/tmp/sysroots/atom-pc/usr/lib/libgdk-x11-2.0.so: undefined reference to `XRRFreeScreenResources'
| /opt/yocto/upstream/label/master/machine/atom-pc/poky/edison/tmp/sysroots/atom-pc/usr/lib/libgdk-x11-2.0.so: undefined reference to `XRRGetOutputPrimary'
| /opt/yocto/upstream/label/master/machine/atom-pc/poky/edison/tmp/sysroots/atom-pc/usr/lib/libgdk-x11-2.0.so: undefined reference to `XRRFreeCrtcInfo'
| /opt/yocto/upstream/label/master/machine/atom-pc/poky/edison/tmp/sysroots/atom-pc/usr/lib/libgdk-x11-2.0.so: undefined reference to `XRRGetCrtcInfo'
| collect2: ld returned 1 exit status

Signed-off-by: Matthew McClintock <msm@freescale.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../owl-video/0001-add-dependency-for-xrandr.patch |   30 ++++++++++++++++++++
 .../recipes-sato/owl-video-widget/owl-video_git.bb |    5 ++-
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/owl-video-widget/owl-video/0001-add-dependency-for-xrandr.patch

diff --git a/meta/recipes-sato/owl-video-widget/owl-video/0001-add-dependency-for-xrandr.patch b/meta/recipes-sato/owl-video-widget/owl-video/0001-add-dependency-for-xrandr.patch
new file mode 100644
index 0000000..8c14578
--- /dev/null
+++ b/meta/recipes-sato/owl-video-widget/owl-video/0001-add-dependency-for-xrandr.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Pending
+
+This patch should probably go upstream
+
+From 18bdd57b36489439dc5c18b20abd9d59c6778662 Mon Sep 17 00:00:00 2001
+From: Matthew McClintock <msm@freescale.com>
+Date: Wed, 25 Jul 2012 15:05:40 -0500
+Subject: [PATCH] add dependency for xrandr
+
+Signed-off-by: Matthew McClintock <msm@freescale.com>
+---
+ src/Makefile.am |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 60e845b..00e4b11 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -12,7 +12,7 @@ video_SOURCES = video.c	\
+ 	owl-overlay-bin.c	\
+ 	owl-overlay-bin.h
+ 
+-video_LDADD = $(VIDEO_LIBS)
++video_LDADD = $(VIDEO_LIBS) -lXrandr
+ 
+ dist_pkgdata_DATA = gtk-fullscreen.png
+ 
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-sato/owl-video-widget/owl-video_git.bb b/meta/recipes-sato/owl-video-widget/owl-video_git.bb
index bc63273..321b71b 100644
--- a/meta/recipes-sato/owl-video-widget/owl-video_git.bb
+++ b/meta/recipes-sato/owl-video-widget/owl-video_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "libowl-av"
 
 SRCREV = "f133472318970796fae1ea3e98ac062156768baf"
 PV = "0.1+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}/git"
 
@@ -23,7 +23,8 @@ SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://stock_volume-med.png \
            file://stock_volume-max.png \
            file://owl-video-widget.desktop \
-	   file://make-382.patch"
+	   file://make-382.patch \
+	   file://0001-add-dependency-for-xrandr.patch"
 
 inherit autotools pkgconfig
 
-- 
1.7.7.6



