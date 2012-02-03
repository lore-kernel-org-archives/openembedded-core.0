Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RtLTG-0003Kc-Dt
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 16:54:42 +0100
Received: by wibhq7 with SMTP id hq7so2942845wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 07:46:45 -0800 (PST)
Received: by 10.180.100.228 with SMTP id fb4mr12478993wib.1.1328284005094;
	Fri, 03 Feb 2012 07:46:45 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id ex2sm18586198wib.1.2012.02.03.07.46.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 07:46:44 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2012 17:46:37 +0200
Message-Id: <1328283997-1968-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
Cc: contato@ossystems.com.br
Subject: [PATCH] dhcp: move dhcp leases files handling to postinst/postrm
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
X-List-Received-Date: Fri, 03 Feb 2012 15:54:42 -0000

Both server and client needs access to leases files so its creation
and removal are now handled by postinst/postrm scripts.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-connectivity/dhcp/dhcp.inc         |   19 ++++++++++++++++++-
 meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb |    2 +-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 051190f..53479a8 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -66,12 +66,29 @@ FILES_dhcp-server-config = "${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp
 
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
+pkg_postinst_dhcp-client() {
+    mkdir -p $D/${localstatedir}/lib/dhcp
+}
+
+pkg_postrm_dhcp-server() {
+    rm -f $D/${localstatedir}/lib/dhcp/dhcpd.leases
+    rm -f $D/${localstatedir}/lib/dhcp/dhcpd6.leases
+    rmdir $D/${localstatedir}/lib/dhcp
+}
+
+pkg_postrm_dhcp-client() {
+    rm -f $D/${localstatedir}/lib/dhcp/dhclient.leases
+    rm -f $D/${localstatedir}/lib/dhcp/dhclient6.leases
+    rmdir $D/${localstatedir}/lib/dhcp
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



