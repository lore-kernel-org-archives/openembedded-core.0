Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RPoFf-00022z-NL
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 05:34:35 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2011 20:28:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75055112"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.217])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2011 20:28:13 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Nov 2011 20:27:51 -0800
Message-Id: <571b1f97de9d4b314cb84fec96dde1cb365c4219.1321244755.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/21] dhcp: generate initial leases files for server
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
X-List-Received-Date: Mon, 14 Nov 2011 04:34:35 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

If not using the init script it fails as the leases are created by it.
When used with systemd, this fails without the leases thus this allows
it to work out of box.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Added commit meesage from Otavio's email

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc      |    9 ++++++++-
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb |    2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 1cc529d..f9d80e7 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -51,13 +51,15 @@ do_install_append () {
 		mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/
 	fi
 	install -m 0755 ${S}/client/scripts/linux ${D}${base_sbindir}/dhclient-script
+
+	install -d ${D}${localstatedir}/lib/dhcp/
 }
 
 PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
 
 FILES_${PN} = ""
 
-FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server"
+FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server ${localstatedir}/lib/dhcp/"
 RRECOMMENDS_dhcp-server = "dhcp-server-config"
 
 FILES_dhcp-server-config = "${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp/dhcpd.conf"
@@ -68,3 +70,8 @@ FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${
 RDEPENDS_dhcp-client = "bash"
 
 FILES_dhcp-omshell = "${bindir}/omshell"
+
+pkg_postinst_dhcp-server() {
+    touch $D/${localstatedir}/lib/dhcp/dhcpd.leases
+    touch $D/${localstatedir}/lib/dhcp/dhcpd6.leases
+}
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
index 8ed7d76..2471d61 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
@@ -1,6 +1,6 @@
 require dhcp.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI += "file://fixincludes.patch \
             file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
-- 
1.7.6.4



