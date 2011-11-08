Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNrME-0002iO-AT
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 20:29:18 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Nov 2011 11:23:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,477,1315206000"; d="scan'208";a="34587133"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Nov 2011 11:23:01 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 11:22:44 -0800
Message-Id: <625ca73a16f6ef1da7a5c42450af715e41172e52.1320780004.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/17] dhcp: drop unused dhcp3.inc file
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
X-List-Received-Date: Tue, 08 Nov 2011 19:29:18 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-connectivity/dhcp/dhcp3.inc |   49 ------------------------------
 1 files changed, 0 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp3.inc

diff --git a/meta/recipes-connectivity/dhcp/dhcp3.inc b/meta/recipes-connectivity/dhcp/dhcp3.inc
deleted file mode 100644
index 6c7483e..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp3.inc
+++ /dev/null
@@ -1,49 +0,0 @@
-SECTION = "console/network"
-DESCRIPTION = "Internet Software Consortium DHCP package"
-HOMEPAGE = "http://www.isc.org/"
-
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=bb6fd41f5895b67088ebea61ad365e74"
-
-SRC_URI = "ftp://ftp.isc.org/isc/dhcp/dhcp-${PV}.tar.gz \
-	   file://init-relay file://default-relay \
-	   file://init-server file://default-server \
-	   file://dhclient.conf file://dhcpd.conf"
-
-inherit autotools
-
-TARGET_CFLAGS += "-D_GNU_SOURCE"
-
-do_compile() {
-	make RANLIB=${RANLIB} PREDEFINES='-D_PATH_DHCPD_DB=\"/var/lib/dhcp/dhcpd.leases\" \
-        -D_PATH_DHCLIENT_DB=\"/var/lib/dhcp/dhclient.leases\" \
-        -D_PATH_DHCLIENT_SCRIPT=\"/sbin/dhclient-script\" \
-        -D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
-        -D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"'
-}
-
-do_install() {
-	make -e DESTDIR=${D} USRMANDIR=${mandir}/man1 ADMMANDIR=${mandir}/man8 FFMANDIR=${mandir}/man5 LIBMANDIR=${mandir}/man3 LIBDIR=${libdir} INCDIR=${includedir} install
-	install -d ${D}${sysconfdir}/init.d
-	install -d ${D}${sysconfdir}/default
-	install -d ${D}${sysconfdir}/dhcp
-	install -m 0755 ${WORKDIR}/init-relay ${D}${sysconfdir}/init.d/dhcp-relay
-	install -m 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
-	install -m 0755 ${WORKDIR}/init-server ${D}${sysconfdir}/init.d/dhcp-server
-	install -m 0644 ${WORKDIR}/default-server ${D}${sysconfdir}/default/dhcp-server
-	install -m 0644 ${WORKDIR}/dhclient.conf ${D}${sysconfdir}/dhcp/dhclient.conf
-	install -m 0644 ${WORKDIR}/dhcpd.conf ${D}${sysconfdir}/dhcp/dhcpd.conf
-	install -d ${D}${base_sbindir}/
-	mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/
-	install -m 0755 ${S}/client/scripts/linux ${D}${base_sbindir}/dhclient-script
-}
-
-PACKAGES += "dhcp-server dhcp-client dhcp-relay dhcp-omshell"
-FILES_${PN} = ""
-FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server ${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp/dhcpd.conf"
-FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
-
-FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
-RDEPENDS_dhcp-client = "bash"
-
-FILES_dhcp-omshell = "${bindir}/omshell"
-- 
1.7.6.4



