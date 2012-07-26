Received: from co1ehsobe002.messaging.microsoft.com ([216.32.180.185]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SuUzD-00040p-9p
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 22:48:43 +0200
Received: from mail9-co1-R.bigfish.com (10.243.78.242) by
	CO1EHSOBE010.bigfish.com (10.243.66.73) with Microsoft SMTP Server id
	14.1.225.23; Thu, 26 Jul 2012 20:37:10 +0000
Received: from mail9-co1 (localhost [127.0.0.1])	by mail9-co1-R.bigfish.com
	(Postfix) with ESMTP id 961FF640455	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 20:37:10 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail9-co1 (localhost.localdomain [127.0.0.1]) by mail9-co1
	(MessageSwitch) id 1343335028653027_28165;
	Thu, 26 Jul 2012 20:37:08 +0000 (UTC)
Received: from CO1EHSMHS023.bigfish.com (unknown [10.243.78.247])	by
	mail9-co1.bigfish.com (Postfix) with ESMTP id 93A31700049	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 20:37:08 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS023.bigfish.com
	(10.243.66.33) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 26 Jul 2012 20:37:06 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Thu, 26 Jul 2012 15:37:05 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6QKb4qU031979 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 13:37:04 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 15:37:03 -0500
Message-ID: <1343335023-28938-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] owl-video_git.bb: fix compilation on Fedora 13 machine
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
X-List-Received-Date: Thu, 26 Jul 2012 20:48:43 -0000
Content-Type: text/plain

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
---
 .../owl-video/0001-add-dependency-for-xrandr.patch |   30 ++++++++++++++++++++
 .../recipes-sato/owl-video-widget/owl-video_git.bb |    5 ++--
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
1.7.10




