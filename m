Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RFXEn-0003VQ-9J
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Oct 2011 22:23:13 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Oct 2011 13:17:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,354,1315206000"; d="scan'208";a="74375153"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2011 13:17:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Oct 2011 13:17:08 -0700
Message-Id: <bd5259c1b77e280bf7c076b50eedd0c3dc3424dc.1318796061.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318796061.git.sgw@linux.intel.com>
References: <cover.1318796061.git.sgw@linux.intel.com>
Subject: [v2 -CONSOLIDATED PULL 06/14] pulseaudio: make bluetooth support conditional upon DISTRO_FEATURES
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
X-List-Received-Date: Sun, 16 Oct 2011 20:23:13 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

If "bluetooth" is in DISTRO_FEATURES then enable bluetooth and depend on
bluez4, otherwise disable it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    5 +++--
 .../pulseaudio/pulseaudio_0.9.22.bb                |    2 +-
 .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 2a8e74d..bb32467 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
                     file://src/pulsecore/vector.h;beginline=1;endline=21;md5=1b561f0a2ca47b1fa49862a6ccaacff1"
 DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool virtual/libx11"
 # optional
-DEPENDS += "bluez4 udev alsa-lib glib-2.0 dbus consolekit"
+DEPENDS += "udev alsa-lib glib-2.0 dbus consolekit \
+           ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)}"
 
 SRC_URI = "http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.gz \
            file://gcc4-compile-fix.patch \
@@ -19,7 +20,7 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "\
 		--disable-lynx \
-		--enable-bluez \
+		${@base_contains('DISTRO_FEATURES', 'bluetooth', '--enable-bluez', '--disable-bluez', d)} \
 		--disable-polkit \
 		--with-x \
 		--without-jack \
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
index da2e988..3067365 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r6"
+PR = "r7"
 
 DEPENDS += "gdbm speex"
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
index 1edd913..33f5e15 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r4"
+PR = "r5"
 
 DEPENDS += "gdbm speex"
 
-- 
1.7.6.2



