Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RJYC2-0002na-HW
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 00:12:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Oct 2011 15:06:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,415,1315206000"; d="scan'208";a="83263250"
Received: from unknown (HELO swold-mobl.Mikenopa.local) ([10.255.15.81])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2011 15:06:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 00:06:36 +0200
Message-Id: <b15e1f6d38f9e0bce6ea9bea4745bc64a37ba56c.1319753141.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319753141.git.sgw@linux.intel.com>
References: <cover.1319753141.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319753141.git.sgw@linux.intel.com>
References: <cover.1319753141.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/18] avahi: use useradd to create user
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
X-List-Received-Date: Thu, 27 Oct 2011 22:12:59 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc |   22 ++++------------------
 1 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 5ad9db0..4abe0e8 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -23,7 +23,10 @@ SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
           file://99avahi-autoipd \
           file://initscript.patch"
 
-inherit autotools pkgconfig update-rc.d gettext
+USERADD_PACKAGES = "${PN}-daemon"
+USERADD_PARAM_${PN}-daemon = "--disabled-password --system --home /var/run/avahi-daemon --no-create-home -user-group avahi"
+
+inherit autotools pkgconfig update-rc.d gettext useradd
 
 EXTRA_OECONF = "--with-distro=debian \
              --disable-introspection \
@@ -116,23 +119,6 @@ do_install_avahi-autoipd() {
 	install ${WORKDIR}/99avahi-autoipd ${D}${sysconfdir}/udhcpc.d
 }
 
-# At the time the postinst runs, dbus might not be setup so only restart if running
-
-pkg_postinst_avahi-daemon () {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-	grep "^avahi:" /etc/group > /dev/null || addgroup avahi
-	grep "^avahi:" /etc/passwd > /dev/null || adduser --disabled-password --system --home /var/run/avahi-daemon --no-create-home avahi --ingroup avahi -g Avahi
-
-	DBUSPID=`pidof dbus-daemon`
-
-	if [ "x$DBUSPID" != "x" ]; then
-		/etc/init.d/dbus-1 force-reload
-	fi
-}
-
 pkg_postinst_avahi-autoipd () {
 	# can't do this offline
 	if [ "x$D" != "x" ]; then
-- 
1.7.6.4



