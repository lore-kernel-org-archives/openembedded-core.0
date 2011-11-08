Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RNZNI-0003DL-Gm
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 01:17:12 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="72146548"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.75])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 16:10:48 -0800
Message-Id: <6b60758f75e8d7959dac8de9685ac55afeabe614.1320709417.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
Subject: [PATCH 11/12] pulseaudio: make X11 dependencies optional and add gtk+
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
X-List-Received-Date: Tue, 08 Nov 2011 00:17:13 -0000

Use the x11 distro feature to determine whether --with-x should be
passed. Further, if we're using X11 add gtk+ to DEPENDS (it's required
to build).

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index bb32467..c581eae 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
                     file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/modules/bluetooth/proximity-helper.c;beginline=1;endline=25;md5=e4cc710e40a4d900c2c294167bc58270 \
                     file://src/pulsecore/vector.h;beginline=1;endline=21;md5=1b561f0a2ca47b1fa49862a6ccaacff1"
-DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool virtual/libx11"
+DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 gtk+', '', d)}"
 # optional
 DEPENDS += "udev alsa-lib glib-2.0 dbus consolekit \
            ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)}"
@@ -22,7 +22,7 @@ EXTRA_OECONF = "\
 		--disable-lynx \
 		${@base_contains('DISTRO_FEATURES', 'bluetooth', '--enable-bluez', '--disable-bluez', d)} \
 		--disable-polkit \
-		--with-x \
+		${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)} \
 		--without-jack \
 		--with-glib \
 		--with-alsa \
-- 
1.7.7



