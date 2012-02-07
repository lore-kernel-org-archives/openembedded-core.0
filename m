Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RurnV-0000G4-EK
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 21:37:53 +0100
Received: by eaal10 with SMTP id l10so2037256eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 12:29:50 -0800 (PST)
Received: by 10.14.47.68 with SMTP id s44mr7399922eeb.11.1328646590597;
	Tue, 07 Feb 2012 12:29:50 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id a58sm77211855eeb.8.2012.02.07.12.29.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 12:29:49 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 22:29:45 +0200
Message-Id: <1328646585-25759-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 2/2] dhcp: move dhcp leases files handling to postinst/postrm
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
X-List-Received-Date: Tue, 07 Feb 2012 20:37:53 -0000

Both server and client needs access to leases files so its creation
and removal are now handled by postinst/postrm scripts.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-connectivity/dhcp/dhcp.inc         |   26 ++++++++++++++++++++++-
 meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb |    2 +-
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 051190f..7db7c80 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -66,12 +66,36 @@ FILES_dhcp-server-config = "${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp
 
 FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
 
-FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf ${localstatedir}/lib/dhcp/"
+FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
 RDEPENDS_dhcp-client = "bash"
 
 FILES_dhcp-omshell = "${bindir}/omshell"
 
 pkg_postinst_dhcp-server() {
+    mkdir -p $D/${localstatedir}/lib/dhcp
     touch $D/${localstatedir}/lib/dhcp/dhcpd.leases
     touch $D/${localstatedir}/lib/dhcp/dhcpd6.leases
 }
+
+
+pkg_postinst_dhcp-client() {
+    mkdir -p $D/${localstatedir}/lib/dhcp
+}
+
+pkg_postrm_dhcp-server() {
+    rm -f $D/${localstatedir}/lib/dhcp/dhcpd.leases
+    rm -f $D/${localstatedir}/lib/dhcp/dhcpd6.leases
+
+    if ! rmdir $D/${localstatedir}/lib/dhcp 2>/dev/null; then
+        echo "Not removing ${localstatedir}/lib/dhcp as it is non-empty."
+    fi
+}
+
+pkg_postrm_dhcp-client() {
+    rm -f $D/${localstatedir}/lib/dhcp/dhclient.leases
+    rm -f $D/${localstatedir}/lib/dhcp/dhclient6.leases
+
+    if ! rmdir $D/${localstatedir}/lib/dhcp 2>/dev/null; then
+        echo "Not removing ${localstatedir}/lib/dhcp as it is non-empty."
+    fi
+}
\ No newline at end of file
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
index 24b50ba..67af3e2 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
@@ -1,6 +1,6 @@
 require dhcp.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://fixincludes.patch \
             file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
-- 
1.7.5.4



