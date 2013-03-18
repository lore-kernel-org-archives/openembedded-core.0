Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UHaYl-0003cT-0w
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 14:57:20 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Mar 2013 06:38:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,865,1355126400"; d="scan'208";a="303818134"
Received: from unknown (HELO localhost.localdomain) ([10.237.72.58])
	by orsmga002.jf.intel.com with ESMTP; 18 Mar 2013 06:38:33 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2013 15:38:27 +0200
Message-Id: <1363613908-20116-2-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <1363613908-20116-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1363613908-20116-1-git-send-email-jukka.rissanen@linux.intel.com>
Subject: [PATCH 1/2] connman-conf: Move the setup script into /usr/lib/connman
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
X-List-Received-Date: Mon, 18 Mar 2013 13:57:28 -0000

The /etc/connman is not suitable for the setup script.
There are other connman related scripts in /usr/lib/connman
so moving the wired setup script there.

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta/recipes-connectivity/connman/connman-conf.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

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
-- 
1.7.11.4



