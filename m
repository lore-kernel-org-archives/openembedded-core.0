Return-Path: <noor_ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 6842D65E1A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 16:04:18 +0000 (UTC)
Received: from em-wv03.wv.mentorg.com ([147.34.98.30]
	helo=em-wv-03.wv.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1XYzuW-0003L8-80 from noor_ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Sep 2014 09:04:20 -0700
Received: from gemini.alm.mentorg.com ([134.86.102.153]) by
	em-wv-03.wv.mentorg.com (8.8.8/CF5.40R)
Received: from pkl-ahsann-ubuntu.pkl.mentorg.com
	(pkl-ahsann-ubuntu.pkl.mentorg.com [137.202.157.70])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id s8UG4DGd007857; 
	Tue, 30 Sep 2014 11:04:15 -0500
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Sep 2014 21:03:43 +0500
Message-Id: <1412093023-3589-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] latencytop: Creates x11 PACKAGECONFIG.
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
X-List-Received-Date: Tue, 30 Sep 2014 16:04:20 -0000

From: Noor <noor_ahsan@mentor.com>

* Creates x11 packageconfig and update DEPENDS and EXTRA_OEMAKE_X
  for better handling.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta/recipes-kernel/latencytop/latencytop_0.5.bb |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
index 516e2c5..e910a96 100644
--- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
+++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.latencytop.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://latencytop.c;endline=23;md5=ee9ea9b1415356e5734adad4a87dc7fa"
 
-DEPENDS = "virtual/libintl ncurses glib-2.0  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
+DEPENDS = "virtual/libintl ncurses glib-2.0"
 
 PR = "r3"
 
@@ -15,7 +15,11 @@ SRC_URI = "http://www.latencytop.org/download/latencytop-${PV}.tar.gz \
 SRC_URI[md5sum] = "73bb3371c6ee0b0e68e25289027e865c"
 SRC_URI[sha256sum] = "9e7f72fbea7bd918e71212a1eabaad8488d2c602205d2e3c95d62cd57e9203ef"
 
-EXTRA_OEMAKE_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'HAS_GTK_GUI=1', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+
+PACKAGECONFIG[x11] = ",,gtk+"
+
+EXTRA_OEMAKE_X = "${@bb.utils.contains('PACKAGECONFIG', 'x11', 'HAS_GTK_GUI=1', '', d)}"
 
 CFLAGS += "${LDFLAGS}"
 
-- 
1.7.9.5


