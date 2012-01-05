Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rigy4-0001EK-AP
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 07:38:29 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jan 2012 22:31:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94663934"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 04 Jan 2012 22:31:01 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2012 22:30:51 -0800
Message-Id: <8c450c324f85d4b061c6a5704f418b8512de078c.1325744640.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 26/28] matchbox-wm: Remove x-session-manager handling
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
X-List-Received-Date: Thu, 05 Jan 2012 06:38:30 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Windows manager should be independent on session manager, especially when we
have multiple session manager like mini-x and matchbox session.

This commit remove session-manager stuff in matchbox-wm, as matchbox-session
already has duplicated code. Also adjust alternative priority for mini-X to
make it higher priority over matchbox-session.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../matchbox-wm/matchbox-wm_1.2.bb                 |    9 ++-------
 .../matchbox-wm/matchbox-wm_git.bb                 |    9 ++-------
 .../mini-x-session/mini-x-session_0.1.bb           |    2 +-
 3 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
index 84b966a..2628326 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
@@ -2,7 +2,7 @@ SECTION = "x11/wm"
 DESCRIPTION = "Matchbox window manager"
 LICENSE = "GPLv2.0+"
 DEPENDS = "libmatchbox virtual/libx11 libxext libxcomposite libxfixes xdamage libxrender startup-notification expat"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://matchbox-project.org/sources/matchbox-window-manager/1.2/matchbox-window-manager-${PV}.tar.bz2 \
            file://configure_fix.patch \
@@ -11,7 +11,7 @@ SRC_URI = "http://matchbox-project.org/sources/matchbox-window-manager/1.2/match
 
 S = "${WORKDIR}/matchbox-window-manager-${PV}"
 
-inherit autotools pkgconfig update-alternatives
+inherit autotools pkgconfig
 
 FILES_${PN} = "${bindir}/* \
 	       ${datadir}/matchbox \
@@ -20,11 +20,6 @@ FILES_${PN} = "${bindir}/* \
 	       ${datadir}/themes/Default/matchbox \
 	       ${datadir}/themes/MBOpus/matchbox"
 
-ALTERNATIVE_NAME = "x-session-manager"
-ALTERNATIVE_LINK = "${bindir}/x-session-manager"
-ALTERNATIVE_PATH = "${bindir}/matchbox-session"
-ALTERNATIVE_PRIORITY = "10"
-
 EXTRA_OECONF = " --enable-startup-notification \
                  --disable-xrm \
                  --enable-expat \
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
index 5550dc2..ef9cf76 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
@@ -12,7 +12,7 @@ DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification ex
 
 SRCREV = "f4394eaed475de6e627d373c5b35ee2cf87072e3"
 PV = "1.2+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager;protocol=git \
            file://configure_fix.patch;maxrev=1818 \
@@ -20,12 +20,7 @@ SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager;protocol=git \
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig update-alternatives
-
-ALTERNATIVE_NAME = "x-session-manager"
-ALTERNATIVE_LINK = "${bindir}/x-session-manager"
-ALTERNATIVE_PATH = "${bindir}/matchbox-session"
-ALTERNATIVE_PRIORITY = "10"
+inherit autotools pkgconfig
 
 FILES_${PN} = "${bindir}/* \
                ${datadir}/matchbox \
diff --git a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
index 3818d16..9818650 100644
--- a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
+++ b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
@@ -16,7 +16,7 @@ inherit update-alternatives
 ALTERNATIVE_NAME = "x-session-manager"
 ALTERNATIVE_LINK = "${bindir}/x-session-manager"
 ALTERNATIVE_PATH = "${bindir}/mini-x-session"
-ALTERNATIVE_PRIORITY = "10"
+ALTERNATIVE_PRIORITY = "50"
 
 do_install() {
 	install -d ${D}/${bindir}
-- 
1.7.6.4



