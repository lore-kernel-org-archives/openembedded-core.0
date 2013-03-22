Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UIxM9-0004tu-Ro
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 09:29:47 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Mar 2013 01:11:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,891,1355126400"; d="scan'208";a="217668583"
Received: from sorvi.fi.intel.com ([10.237.72.58])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Mar 2013 01:11:44 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 10:11:41 +0200
Message-Id: <1363939902-23537-2-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <1363939902-23537-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1363939902-23537-1-git-send-email-jukka.rissanen@linux.intel.com>
Subject: [PATCH v2 1/2] connman-conf: Move the setup script into /usr/lib/connman
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
X-List-Received-Date: Fri, 22 Mar 2013 08:29:48 -0000

The /etc/connman is not suitable for the setup script.
There are other connman related scripts in /usr/lib/connman
so moving the wired setup script there.
---
 meta/recipes-connectivity/connman/connman-conf.bb | 8 +++++---
 meta/recipes-connectivity/connman/connman/connman | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index 7b99953..6ecfbfb 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -6,16 +6,18 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=80
 SRC_URI_append_qemuall = "file://wired.config \
                           file://wired-setup \
                          "
-PR = "r1"
+PR = "r2"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+FILES_${PN} = "${localstatedir}/* ${libdir}/*"
+
 do_install() {
     #Configure Wired network interface in case of qemu* machines
     if test -e ${WORKDIR}/wired.config && test -e ${WORKDIR}/wired-setup; then
         install -d ${D}${localstatedir}/lib/connman
         install -m 0644 ${WORKDIR}/wired.config ${D}${localstatedir}/lib/connman
-        install -d ${D}${sysconfdir}/connman
-        install -m 0755 ${WORKDIR}/wired-setup ${D}${sysconfdir}/connman
+        install -d ${D}${libdir}/connman
+        install -m 0755 ${WORKDIR}/wired-setup ${D}${libdir}/connman
     fi
 }
diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recipes-connectivity/connman/connman/connman
index ffd7fac..a111f60 100644
--- a/meta/recipes-connectivity/connman/connman/connman
+++ b/meta/recipes-connectivity/connman/connman/connman
@@ -32,8 +32,8 @@ do_start() {
 		ethn=`ifconfig | grep eth | sed -e "s/\(eth[0-9]\)\(.*\)/\1/"`
 		EXTRA_PARAM="-I $ethn"
 	fi
-	if [ -f /etc/connman/wired-setup ] ; then
-		. /etc/connman/wired-setup
+	if [ -f /usr/lib/connman/wired-setup ] ; then
+		. /usr/lib/connman/wired-setup
 	fi
 	$DAEMON $EXTRA_PARAM
 }
-- 
1.7.11.4



