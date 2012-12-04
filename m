Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tfzoe-000655-Ty
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 22:14:09 +0100
Received: from mail-lb0-f197.google.com ([209.85.217.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 04 Dec 2012 12:59:43 -0800
Received: by mail-lb0-f197.google.com with SMTP id go10so3569814lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2012 12:59:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=DQCyNNoeH0JFl/ppwgMjIgxwnRkYVr2RFlkBgiNWzRQ=;
	b=YmTqCvXMoFIc5NCfeV3loEUxAimJSnJkTQE1SZdET8mEZR+3mgTDC+QN20GofWInfi
	TugdglBsOHxBkBdSiIjDJxtgRTddy15zxhPt5kVQcjwQRcPtkzaYFU2DOW37bkALE3sD
	Xn0Z8kgQ100+B3hrYSWG6Gg9APrl4JtWq1mSmVrKY7k98/ssjvh9neV1R5tMC7QUyBat
	gxkZVsfZClED7lPpbcQV6Ep6ZugaF4FZJa+IgWcZdRLn1mUYTMfGE1RcWqqvDkuj/P3D
	bObKuV0fsAALnByTRxANxrEV+oJYe6HGiZpdL8ucnQEusZ+GV6jH7pfoFq89SOODfs91
	dWIA==
Received: by 10.180.102.40 with SMTP id fl8mr6711917wib.22.1354654778894;
	Tue, 04 Dec 2012 12:59:38 -0800 (PST)
Received: by 10.180.102.40 with SMTP id fl8mr6711907wib.22.1354654778708;
	Tue, 04 Dec 2012 12:59:38 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fv2sm16544949wib.4.2012.12.04.12.59.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 12:59:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 20:58:03 +0000
Message-Id: <1354654683-16793-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQllb/qbl6+YaHOA+f05gepAgWW+aLGkNClOj+ed1TbD/bDtRk+u7eF/GheVkqmSnP/2DmD8CW5ztQmcA/CKm+GGLhvhXh7mJE6kvh9WnR4hhTvBZrpMkKDK8FXyG/AmRlaT469Rdu2FUprnStD5DAnWMXugBLlkocoTEmaGNa5msWqIbwgTlQZuISA2+bpCXgkb5fI6
Subject: [PATCH] gst-meta-base: pull in X11 plugins when using X11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 21:14:09 -0000

The splitting out of X11 plugins wasn't complete, which lead to no X11 plugins
being installed.

If the X11 distro feature is present, make gst-meta-base depend on
gst-meta-x11-base.  Also make -x11-base RDEPEND on xvimagesink for video
playback performance.

[ YOCTO #3458 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
index 2fb39d5..21243c6 100644
--- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 
-PR = "r11"
+PR = "r12"
 
 PACKAGES = "\
     gst-meta-base \
@@ -17,6 +17,7 @@ PACKAGES = "\
 ALLOW_EMPTY = "1"
 
 RDEPENDS_gst-meta-base = "\
+    ${@base_contains('DISTRO_FEATURES', 'x11', 'gst-meta-x11-base', '', d)} \
     gstreamer \
     gst-plugins-base-playbin \
     gst-plugins-base-decodebin \
@@ -32,7 +33,9 @@ RDEPENDS_gst-meta-base = "\
     gst-plugins-good-autodetect \
     gst-plugins-good-souphttpsrc"
 
-RDEPENDS_gst-meta-x11-base = "${@base_contains('DISTRO_FEATURES', 'x11', 'gst-plugins-base-ximagesink', '', d)}"
+RDEPENDS_gst-meta-x11-base = "\
+    gst-plugins-base-ximagesink \
+    gst-plugins-base-xvimagesink"
 
 RDEPENDS_gst-meta-audio = "\
     gst-meta-base \
-- 
1.7.10



