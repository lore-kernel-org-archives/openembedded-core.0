Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TkXVs-0005BF-TJ
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 11:01:33 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Dec 2012 01:46:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,300,1355126400"; d="scan'208";a="181811026"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Dec 2012 01:46:49 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 11:46:46 +0200
Message-Id: <1355737607-8007-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355737607-8007-1-git-send-email-laurentiu.palcu@intel.com>
References: <1355737607-8007-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 1/2] avahi: use useradd.bbclass to add avahi-autoipd user
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2012 10:01:33 -0000

This is needed for the postinstalls to be run at do_rootfs time.

[YOCTO #3605]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc |   19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index a0a1681..d529b37 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -14,7 +14,7 @@ SECTION = "network"
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 DEPENDS = "expat libcap libdaemon dbus glib-2.0"
 
@@ -26,11 +26,17 @@ SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
           file://fix_for_automake_1.12.x.patch \
           "
 
-USERADD_PACKAGES = "avahi-daemon"
+USERADD_PACKAGES = "avahi-daemon avahi-autoipd"
 USERADD_PARAM_avahi-daemon = "--system --home /var/run/avahi-daemon \
                               --no-create-home --shell /bin/false \
                               --user-group avahi"
 
+USERADD_PARAM_avahi-autoipd = "--system --home /var/run/avahi-autoipd \
+                              --no-create-home --shell /bin/false \
+                              --user-group \
+                              -c \"Avahi autoip daemon\" \
+                              avahi-autoipd"
+
 inherit autotools pkgconfig update-rc.d gettext useradd
 
 EXTRA_OECONF = "--with-distro=debian \
@@ -137,15 +143,6 @@ if [ -z "$D" ]; then
 fi
 }
 
-pkg_postinst_avahi-autoipd () {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-	grep "^avahi-autoipd:" /etc/group > /dev/null || addgroup avahi-autoipd
-	grep "^avahi-autoipd:" /etc/passwd > /dev/null || adduser --disabled-password --system --home /var/lib/avahi-autoipd --no-create-home avahi-autoipd --ingroup avahi-autoipd -g "Avahi autoip daemon"
-}
-
 pkg_postrm_avahi-daemon () {
 	deluser avahi || true
 	delgroup avahi || true
-- 
1.7.9.5



