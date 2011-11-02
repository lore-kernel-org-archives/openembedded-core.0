Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RLOfn-0003OV-D6
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 01:27:19 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Nov 2011 17:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,440,1315206000"; d="scan'208";a="69498957"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.200])
	by azsmga001.ch.intel.com with ESMTP; 01 Nov 2011 17:21:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2011 17:21:06 -0700
Message-Id: <9ef4f9a56a7d68c636768d2a1dbfeb9d6542b5f4.1320191934.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320191934.git.sgw@linux.intel.com>
References: <cover.1320191934.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320191934.git.sgw@linux.intel.com>
References: <cover.1320191934.git.sgw@linux.intel.com>
Subject: [Pull v3 1/4] avahi: use useradd to create avahi user for avahi-daemon
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
X-List-Received-Date: Wed, 02 Nov 2011 00:27:19 -0000

DBus was failing to start correct since the avahi user was
not setup.

Keep the dbus reload since this could still be installed
as a package an would require a dbus restart.

Fixes: [YOCTO #1699]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 5ad9db0..79cfd73 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -14,7 +14,7 @@ SECTION = "network"
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
-INC_PR = "r8"
+INC_PR = "r9"
 
 DEPENDS = "expat libcap libdaemon dbus glib-2.0"
 
@@ -23,7 +23,12 @@ SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
           file://99avahi-autoipd \
           file://initscript.patch"
 
-inherit autotools pkgconfig update-rc.d gettext
+USERADD_PACKAGES = "${PN}-daemon"
+USERADD_PARAM_${PN}-daemon = "--system --home /var/run/avahi-daemon \
+                              --no-create-home --shell /bin/false \
+                              --user-group avahi"
+
+inherit autotools pkgconfig update-rc.d gettext useradd
 
 EXTRA_OECONF = "--with-distro=debian \
              --disable-introspection \
@@ -116,15 +121,12 @@ do_install_avahi-autoipd() {
 	install ${WORKDIR}/99avahi-autoipd ${D}${sysconfdir}/udhcpc.d
 }
 
-# At the time the postinst runs, dbus might not be setup so only restart if running
+# At the time the postinst runs, dbus might not be setup so only restart if running 
 
 pkg_postinst_avahi-daemon () {
-	# can't do this offline
 	if [ "x$D" != "x" ]; then
-		exit 1
+		exit 0
 	fi
-	grep "^avahi:" /etc/group > /dev/null || addgroup avahi
-	grep "^avahi:" /etc/passwd > /dev/null || adduser --disabled-password --system --home /var/run/avahi-daemon --no-create-home avahi --ingroup avahi -g Avahi
 
 	DBUSPID=`pidof dbus-daemon`
 
-- 
1.7.6.4



