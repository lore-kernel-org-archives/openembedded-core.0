Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q4DSw-0004ZB-Ve
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Mar 2011 16:30:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Mar 2011 07:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,255,1299484800"; d="scan'208";a="902633818"
Received: from unknown (HELO localhost) ([10.255.16.125])
	by fmsmga001.fm.intel.com with ESMTP; 28 Mar 2011 07:28:43 -0700
Message-Id: <7049c8b55628f8d6269cefe4a06f994cc60d49c2.1301322225.git.josh@linux.intel.com>
In-Reply-To: <cover.1301322225.git.josh@linux.intel.com>
References: <cover.1301322225.git.josh@linux.intel.com>
Old-Date: Mon, 28 Mar 2011 13:19:50 +0100
Date: Mon, 28 Mar 2011 15:28:37 +0100
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 2/4] clutter-gst: add 1.3.6 for use with clutter 1.6
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
X-List-Received-Date: Mon, 28 Mar 2011 14:30:47 -0000

From: Joshua Lock <josh@linux.intel.com>

The inc file should be usable across clutter versions, plus this is already
set in the clutter-box2d-1.4_git.bb recipe

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../clutter/clutter-gst-1.6_1.3.6.bb               |   16 ++++++++++++++++
 meta/recipes-graphics/clutter/clutter-gst.inc      |    3 ++-
 2 files changed, 18 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb

diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb b/meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb
new file mode 100644
index 0000000..d787b80
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb
@@ -0,0 +1,16 @@
+require clutter-gst.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
+                    file://clutter-gst/clutter-gst.h;beginline=1;endline=24;md5=95baacba194e814c110ea3bdf25ddbf4"
+
+DEPENDS += "clutter-1.6"
+
+SRC_URI = "http://source.clutter-project.org/sources/clutter-gst/1.3/clutter-gst-${PV}.tar.bz2 \
+           file://enable_tests.patch"
+
+S = "${WORKDIR}/clutter-gst-${PV}"
+
+do_configure_prepend () {
+       # Disable DOLT
+       sed -i -e 's/^DOLT//' ${S}/configure.ac
+}
diff --git a/meta/recipes-graphics/clutter/clutter-gst.inc b/meta/recipes-graphics/clutter/clutter-gst.inc
index 614c62d..b1c8617 100644
--- a/meta/recipes-graphics/clutter/clutter-gst.inc
+++ b/meta/recipes-graphics/clutter/clutter-gst.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Clutter GStreamer"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2+"
 
-DEPENDS = "clutter-1.4 gstreamer gst-plugins-base"
+DEPENDS = "gstreamer gst-plugins-base"
 
 FILESPATH = "${FILE_DIRNAME}/clutter-gst"
 
@@ -11,3 +11,4 @@ FILES_${PN}-examples = "${bindir}/video-player ${bindir}/video-sink"
 
 inherit autotools pkgconfig gtk-doc
 
+FILESPATH = "${FILE_DIRNAME}/clutter-gst"
-- 
1.7.4



