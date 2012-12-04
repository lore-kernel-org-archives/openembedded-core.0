Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tg29U-0001gG-9m
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 00:43:55 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Dec 2012 15:29:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,217,1355126400"; d="scan'208";a="229008961"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.13.117])
	by orsmga001.jf.intel.com with ESMTP; 04 Dec 2012 15:29:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 15:29:10 -0800
Message-Id: <1354663759-20022-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1354663759-20022-1-git-send-email-sgw@linux.intel.com>
References: <1354663759-20022-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 1/4] gst-meta-base: pull in X11 plugins when using X11
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
X-List-Received-Date: Tue, 04 Dec 2012 23:43:59 -0000
X-List-Received-Date: Tue, 04 Dec 2012 23:43:59 -0000
X-List-Received-Date: Tue, 04 Dec 2012 23:43:59 -0000

From: Ross Burton <ross.burton@intel.com>

The splitting out of X11 plugins wasn't complete, which lead to no X11 plugins
being installed.

If the X11 distro feature is present, make gst-meta-base depend on
gst-meta-x11-base.  Also make -x11-base RDEPEND on xvimagesink for video
playback performance.

[ YOCTO #3458 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb | 7 +++++--
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
1.8.0



