Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6JMW-0008DS-11
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 11:45:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Sep 2011 02:39:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="51195291"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.170])
	by orsmga002.jf.intel.com with ESMTP; 21 Sep 2011 02:39:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 02:39:32 -0700
Message-Id: <45f93e17ea7bba4df2579daccbf1b2f46672dd35.1316597628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316597628.git.sgw@linux.intel.com>
References: <cover.1316597628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316597628.git.sgw@linux.intel.com>
References: <cover.1316597628.git.sgw@linux.intel.com>
Subject: [RC Fixes 16/19] Fix alsa-utils package dependencies
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
X-List-Received-Date: Wed, 21 Sep 2011 09:45:05 -0000

From: Daniel Lazzari <dlazzari@leapfrog.com>

Make alsa-utils main package depend on all of the more specific alsa-utils packages (such as alsa-utils-alsamixer).

Signed-off-by: Daniel Lazzari Jr <dlazzari@leapfrog.com>

PR Bump

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
index 52a7871..1b3ffe1 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
                     file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
 DEPENDS = "alsa-lib ncurses"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://ncursesfix.patch \
@@ -28,7 +28,7 @@ inherit autotools gettext
 # This are all packages that we need to make. Also, the now empty alsa-utils
 # ipk depends on them.
 
-PACKAGES += "\
+ALSA_UTILS_PKGS = "\
              alsa-utils-alsamixer \
              alsa-utils-midi \
              alsa-utils-aplay \
@@ -44,6 +44,9 @@ PACKAGES += "\
              alsa-utils-alsaucm \
             "
 
+PACKAGES += "${ALSA_UTILS_PKGS}"
+RDEPENDS_${PN} += "${ALSA_UTILS_PKGS}"
+
 # We omit alsaconf, because
 # a) this is a bash script
 # b) it creates config files not suitable for OE-based distros
-- 
1.7.6



