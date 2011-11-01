Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RLLxc-0001z4-Jq
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 22:33:32 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2011 14:27:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,440,1315206000"; d="scan'208";a="80205060"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.200])
	by fmsmga001.fm.intel.com with ESMTP; 01 Nov 2011 14:27:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2011 14:27:16 -0700
Message-Id: <4d1952ddf8b4cac0b09ea3160827183be68e912a.1320182590.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320182590.git.sgw@linux.intel.com>
References: <cover.1320182590.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320182590.git.sgw@linux.intel.com>
References: <cover.1320182590.git.sgw@linux.intel.com>
Subject: [PATCH 1/4] avahi: use useradd to create user
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
X-List-Received-Date: Tue, 01 Nov 2011 21:33:32 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 5ad9db0..09228a9 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
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
@@ -116,15 +121,11 @@ do_install_avahi-autoipd() {
 	install ${WORKDIR}/99avahi-autoipd ${D}${sysconfdir}/udhcpc.d
 }
 
-# At the time the postinst runs, dbus might not be setup so only restart if running
-
 pkg_postinst_avahi-daemon () {
 	# can't do this offline
 	if [ "x$D" != "x" ]; then
-		exit 1
+		exit 0
 	fi
-	grep "^avahi:" /etc/group > /dev/null || addgroup avahi
-	grep "^avahi:" /etc/passwd > /dev/null || adduser --disabled-password --system --home /var/run/avahi-daemon --no-create-home avahi --ingroup avahi -g Avahi
 
 	DBUSPID=`pidof dbus-daemon`
 
-- 
1.7.6.4



