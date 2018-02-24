Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7895F7884D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Feb 2018 11:53:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Feb 2018 03:53:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,388,1515484800"; d="scan'208";a="20758977"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.132.212])
	by orsmga006.jf.intel.com with ESMTP; 24 Feb 2018 03:53:22 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Feb 2018 19:53:03 +0800
Message-Id: <1519473183-8649-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519278352-5224-3-git-send-email-anuj.mittal@intel.com>
References: <1519278352-5224-3-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH v2 3/3] gstreamer-rtsp-server: remove unnecessary dependencies
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
X-List-Received-Date: Sat, 24 Feb 2018 11:53:22 -0000

libcheck dep was removed from gst-rtsp-server some time back [1].

Disable building of examples and tests and remove dep on libcgroup which
was needed, if present, to build only one specific example.

[1] https://cgit.freedesktop.org/gstreamer/gst-rtsp-server/commit?id=43ec4e7c786227b85aec06599c3955626e241a01

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
index 70e90b8..3776f92 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
 SECTION = "multimedia"
 LICENSE = "LGPLv2"
 
-DEPENDS = "gstreamer1.0 libcgroup gstreamer1.0-plugins-base libcheck"
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
 
 PNREAL = "gst-rtsp-server"
 
@@ -16,6 +16,8 @@ S = "${WORKDIR}/${PNREAL}-${PV}"
 
 inherit autotools pkgconfig upstream-version-is-even gobject-introspection gtk-doc
 
+EXTRA_OECONF = "--disable-examples --disable-tests"
+
 # Starting with 1.8.0 gst-rtsp-server includes dependency-less plugins as well
 LIBV = "1.0"
 require gst-plugins-package.inc
-- 
2.7.4


