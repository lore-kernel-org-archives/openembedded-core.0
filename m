Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RNZNE-0003DL-AP
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 01:17:08 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="72146539"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.75])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 16:10:40 -0800
Message-Id: <484f22280e380ecdf10dc1bd6b89f69c37be1f68.1320709417.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
Subject: [PATCH 03/12] clutter-gst-1.8: add 1.4.2 for use with clutter 1.8
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
X-List-Received-Date: Tue, 08 Nov 2011 00:17:09 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../clutter/clutter-gst-1.8_1.4.2.bb               |   22 ++++++++++++++++++++
 .../clutter/clutter-gst/enable_tests-1.8.bb        |   15 +++++++++++++
 2 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.2.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.bb

diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.2.bb b/meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.2.bb
new file mode 100644
index 0000000..54b1fc1
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.2.bb
@@ -0,0 +1,22 @@
+require recipes-graphics/clutter/clutter-gst.inc
+
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://clutter-gst/clutter-gst.h;beginline=1;endline=24;md5=95baacba194e814c110ea3bdf25ddbf4"
+
+DEPENDS += "clutter-1.8 gstreamer"
+RDEPENDS_${PN} += "gst-meta-base"
+
+SRC_URI = "http://source.clutter-project.org/sources/clutter-gst/1.4/clutter-gst-${PV}.tar.bz2 \
+           file://enable_tests-1.8.patch"
+
+S = "${WORKDIR}/clutter-gst-${PV}"
+
+SRC_URI[md5sum] = "fd6b2a54f43d04382748e9e4d8a335c5"
+SRC_URI[sha256sum] = "b0e7ff76ee14307b6d26856972ec9e718f62aec2bc8807fb3f2960e508e578b5"
+
+do_configure_prepend () {
+       # Disable DOLT
+       sed -i -e 's/^DOLT//' ${S}/configure.ac
+}
diff --git a/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.bb b/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.bb
new file mode 100644
index 0000000..35e60ca
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.bb
@@ -0,0 +1,15 @@
+Install example binary needed for poky-image-clutter
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+Index: clutter-gst-1.3.8/examples/Makefile.am
+===================================================================
+--- clutter-gst-1.3.8.orig/examples/Makefile.am
++++ clutter-gst-1.3.8/examples/Makefile.am
+@@ -1,6 +1,6 @@
+ NULL = #
+ 
+-noinst_PROGRAMS = video-player video-sink video-sink-navigation
++bin_PROGRAMS = video-player video-sink video-sink-navigation
+ 
+ INCLUDES = -I$(top_srcdir) \
+ 	   $(MAINTAINER_CFLAGS) \
-- 
1.7.7



