Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R5iAs-0000jg-N9
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 20:02:34 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 19 Sep 2011 10:55:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,406,1312182000"; d="scan'208";a="18514387"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.150])
	by AZSMGA002.ch.intel.com with ESMTP; 19 Sep 2011 10:55:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2011 10:55:30 -0700
Message-Id: <c61c00e6f90ad71f8a111d502e228af7be0a7838.1316454869.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316454869.git.sgw@linux.intel.com>
References: <cover.1316454869.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316454869.git.sgw@linux.intel.com>
References: <cover.1316454869.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] avahi: Check for GPLv3 license and disable x11
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
X-List-Received-Date: Mon, 19 Sep 2011 18:02:35 -0000

[YOCTO #1492]

Since the non-GPLv3 build does not want gnome, which this will pull in
by the default DISTRO_FEATURE x11 being set and enabling gtk for avahi,
we filter x11 out of DISTRO_FEATURES here when INCOMPATIBLE_LICENSE is
set to GPLv3.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc       |    8 ++++++++
 meta/recipes-connectivity/avahi/avahi_0.6.30.bb |    2 +-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 24ea458..c5c0c7c 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -14,6 +14,8 @@ SECTION = "network"
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
+INC_PR = "r5"
+
 X11DEPENDS = "gtk+ libglade"
 DEPENDS = "expat libcap libdaemon dbus glib-2.0 ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
 
@@ -39,6 +41,12 @@ EXTRA_OECONF = "--with-distro=debian \
              --with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
 "
 
+python() {
+    if (d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1:
+        d.setVar("DISTRO_FEATURES", oe_filter_out('x11', d.getVar("DISTRO_FEATURES", True), d))
+
+}
+
 PACKAGES =+ "avahi-systemd avahi-daemon libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-gobject avahi-autoipd avahi-ui-utils avahi-utils libavahi-ui libavahi-ui-dev"
 
 FILES_avahi-systemd = "${base_libdir}/systemd"
diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
index 05716d0..5094961 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.6.30.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://avahi-daemon/main.c;endline=21;md5=9ee77368c5407af77caaef1b07285969 \
                     file://avahi-client/client.h;endline=23;md5=f4ac741a25c4f434039ba3e18c8674cf"
 
-PR = "r4"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "e4db89a2a403ff4c47d66ac66fad1f43"
 SRC_URI[sha256sum] = "f9e4316c2339d0020726edd846d01bee0c39980906db0c247479e5807457ff1f"
-- 
1.7.6



