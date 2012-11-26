Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TcvVs-0005tk-0V
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 11:02:04 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Nov 2012 22:15:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,318,1352102400"; d="scan'208";a="252417586"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.12.35])
	by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2012 22:15:11 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Nov 2012 22:15:11 -0800
Message-Id: <1353910511-12931-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gst-meta-base: Make ximagesing optional on x11 DISTRO_FEATURE
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
X-List-Received-Date: Mon, 26 Nov 2012 10:02:04 -0000

If x11 is disabled from DISTRO_FEATURE we don't build the ximagesink
package, but it still becomes a dependency in the final image which
causes a failure

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gstreamer/gst-meta-base_0.10.bb                |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
index 2fb39d5..0889437 100644
--- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
@@ -16,7 +16,10 @@ PACKAGES = "\
 
 ALLOW_EMPTY = "1"
 
+X11_RDEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', 'gst-plugin-base-ximagesink', '', d)}"
+
 RDEPENDS_gst-meta-base = "\
+    ${X11_RDEPENDS} \
     gstreamer \
     gst-plugins-base-playbin \
     gst-plugins-base-decodebin \
-- 
1.7.9.5



