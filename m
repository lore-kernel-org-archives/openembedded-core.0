Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BE12778709
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 05:46:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2018 21:46:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,377,1515484800"; d="scan'208";a="206033846"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.193])
	by fmsmga005.fm.intel.com with ESMTP; 21 Feb 2018 21:46:01 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Feb 2018 13:45:52 +0800
Message-Id: <1519278352-5224-3-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519278352-5224-1-git-send-email-anuj.mittal@intel.com>
References: <1519278352-5224-1-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH 3/3] gstreamer-rtsp-server: remove unnecessary dependencies
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
X-List-Received-Date: Thu, 22 Feb 2018 05:46:00 -0000

libcheck dep was removed from gst-rtsp-server some time back [1].

Disable building of examples and remove dep on libcgroup which
was needed, if present, to build only one specific example.

Make building of tests optional.

[1] https://cgit.freedesktop.org/gstreamer/gst-rtsp-server/commit?id=43ec4e7c786227b85aec06599c3955626e241a01

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
index 70e90b8..938e919 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
 SECTION = "multimedia"
 LICENSE = "LGPLv2"
 
-DEPENDS = "gstreamer1.0 libcgroup gstreamer1.0-plugins-base libcheck"
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
 
 PNREAL = "gst-rtsp-server"
 
@@ -16,6 +16,11 @@ S = "${WORKDIR}/${PNREAL}-${PV}"
 
 inherit autotools pkgconfig upstream-version-is-even gobject-introspection gtk-doc
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[tests] = "--enable-tests,--disable-tests"
+
+EXTRA_OECONF = "--disable-examples"
+
 # Starting with 1.8.0 gst-rtsp-server includes dependency-less plugins as well
 LIBV = "1.0"
 require gst-plugins-package.inc
@@ -26,4 +31,3 @@ delete_pkg_m4_file() {
 }
 
 do_configure[prefuncs] += " delete_pkg_m4_file"
-
-- 
2.7.4


