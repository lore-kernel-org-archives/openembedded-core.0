Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RJw9i-0000F1-RJ
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Oct 2011 01:48:11 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Oct 2011 16:42:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="68744796"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.141])
	by orsmga002.jf.intel.com with ESMTP; 28 Oct 2011 16:42:06 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 16:42:02 -0700
Message-Id: <9528287cdf949c0bf392f15c498b324ae59f3ee6.1319844419.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1319844419.git.josh@linux.intel.com>
References: <cover.1319844419.git.josh@linux.intel.com>
In-Reply-To: <cover.1319844419.git.josh@linux.intel.com>
References: <cover.1319844419.git.josh@linux.intel.com>
Subject: [PATCH 3/4] libcanberra: add new package for unpackaged files
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
X-List-Received-Date: Fri, 28 Oct 2011 23:48:11 -0000

Create an extra package, libcanberra-gnome, for gdm and
gnome-settings-daemon files installed by libcanberra.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../pulseaudio/libcanberra_0.28.bb                 |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb b/meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb
index 1922f72..432a831 100644
--- a/meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb
+++ b/meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/canberra.h;beginline=7;endline=24;md5=c616c687cf8da540a14f917e0d23ab03"
 
 DEPENDS = "gtk+ pulseaudio alsa-lib libtool"
-PR = "r0"
+PR = "r1"
 
 inherit gconf autotools
 
@@ -20,6 +20,13 @@ do_configure_prepend () {
 	rm -f ${S}/libltdl/configure*
 }
 
+PACKAGES += "${PN}-gnome"
+
 FILES_${PN} += "${libdir}/gtk-2.0/modules/ ${datadir}/gnome"
-FILES_${PN}-dbg += "${libdir}/gtk-2.0/modules/.debug"
+FILES_${PN}-gnome += "${datadir}/gdm/autostart/LoginWindow/libcanberra-ready-sound.desktop \
+	              ${libdir}/gnome-settings-daemon-3.0/gtk-modules/canberra-gtk-module.desktop"
+FILES_${PN}-dev += "${libdir}/libcanberra-0.28/libcanberra-*.so \
+		    ${libdir}/libcanberra-0.28/libcanberra-*.la \
+		    ${datadir}/vala/vapi"
+FILES_${PN}-dbg += "${libdir}/gtk-2.0/modules/.debug ${libdir}/libcanberra-0.28/.debug"
 
-- 
1.7.7



