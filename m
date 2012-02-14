Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RxISx-0004HK-CT
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 14:30:43 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Feb 2012 05:22:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117403934"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.250])
	by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2012 05:22:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 13:22:26 +0000
Message-Id: <991955dd4644110f21d16014737ddd06c7dd377f.1329225663.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1329225663.git.paul.eggleton@linux.intel.com>
References: <cover.1329225663.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1329225663.git.paul.eggleton@linux.intel.com>
References: <cover.1329225663.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] classes/sdl: remove Opie-specific desktop file/packaging
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
X-List-Received-Date: Tue, 14 Feb 2012 13:30:43 -0000

This code will not work without palmtopdir being defined, and is better
kept in meta-opie in any case (where we already have the OE-Classic
version of this class).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sdl.bbclass |   38 --------------------------------------
 1 files changed, 0 insertions(+), 38 deletions(-)

diff --git a/meta/classes/sdl.bbclass b/meta/classes/sdl.bbclass
index a412ccb..cc31288 100644
--- a/meta/classes/sdl.bbclass
+++ b/meta/classes/sdl.bbclass
@@ -3,42 +3,4 @@
 #
 
 DEPENDS += "virtual/libsdl libsdl-mixer libsdl-image"
-
-APPDESKTOP ?= "${PN}.desktop"
-APPNAME ?= "${PN}"
-APPIMAGE ?= "${PN}.png"
-
-sdl_do_sdl_install() {
-	install -d ${D}${palmtopdir}/bin
-	install -d ${D}${palmtopdir}/pics
-	install -d ${D}${palmtopdir}/apps/Games
-	ln -sf ${bindir}/${APPNAME} ${D}${palmtopdir}/bin/${APPNAME}
-	install -m 0644 ${APPIMAGE} ${D}${palmtopdir}/pics/${PN}.png
-
-	if [ -e "${APPDESKTOP}" ]
-	then
-		echo ${APPDESKTOP} present, installing to palmtopdir...
-		install -m 0644 ${APPDESKTOP} ${D}${palmtopdir}/apps/Games/${PN}.desktop
-	else
-		echo ${APPDESKTOP} not present, creating one on-the-fly...
-		cat >${D}${palmtopdir}/apps/Games/${PN}.desktop <<EOF
-[Desktop Entry]
-Note=Auto Generated... this may be not what you want
-Comment=${DESCRIPTION}
-Exec=${APPNAME}
-Icon=${PN}.png
-Type=Application
-Name=${PN}
-EOF
-	fi
-}
-
-EXPORT_FUNCTIONS do_sdl_install
-addtask sdl_install after do_compile before do_populate_sysroot
-
 SECTION = "x11/games"
-SECTION_${PN}-opie = "opie/games"
-
-PACKAGES += "${PN}-opie"
-RDEPENDS_${PN}-opie += "${PN}"
-FILES_${PN}-opie = "${palmtopdir}"
-- 
1.7.5.4



