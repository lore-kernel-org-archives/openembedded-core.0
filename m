Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4DBFA758A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 02:14:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,625,1427731200"; d="scan'208";a="97238553"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jun 2015 10:18:15 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5I2CUUU024435
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 10:12:30 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 18 Jun 2015 10:14:05 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jun 2015 10:14:00 +0800
Message-ID: <1434593640-1708-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [PATCH] dhcp: modify dhcpd.service to make it start successfully and add systemd service files dhcpd6.service
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Jun 2015 02:14:09 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc             | 12 ++++++++----
 meta/recipes-connectivity/dhcp/files/dhcpd.service  |  8 ++++++--
 meta/recipes-connectivity/dhcp/files/dhcpd6.service | 15 +++++++++++++++
 3 files changed, 29 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhcpd6.service

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 6ced775..3bf1ea9 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -17,12 +17,13 @@ SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://init-relay file://default-relay \
            file://init-server file://default-server \
            file://dhclient.conf file://dhcpd.conf \
-           file://dhcpd.service file://dhcrelay.service"
+           file://dhcpd.service file://dhcrelay.service \
+           file://dhcpd6.service "
 
 inherit autotools systemd
 
 SYSTEMD_PACKAGES = "${PN}-server ${PN}-relay"
-SYSTEMD_SERVICE_${PN}-server = "dhcpd.service"
+SYSTEMD_SERVICE_${PN}-server = "dhcpd.service dhcpd6.service"
 SYSTEMD_AUTO_ENABLE_${PN}-server = "disable"
 
 SYSTEMD_SERVICE_${PN}-relay = "dhcrelay.service"
@@ -59,9 +60,12 @@ do_install_append () {
 	# Install systemd unit files
 	install -d ${D}${systemd_unitdir}/system
 	install -m 0644 ${WORKDIR}/dhcpd.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dhcpd6.service ${D}${systemd_unitdir}/system
 	install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/dhcpd.service ${D}${systemd_unitdir}/system/dhcrelay.service
-	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcpd.service
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/dhcpd*.service ${D}${systemd_unitdir}/system/dhcrelay.service
+	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcpd*.service
+	sed -i -e 's,@base_bindir@,${base_bindir},g' ${D}${systemd_unitdir}/system/dhcpd*.service
+	sed -i -e 's,@localstatedir@,${localstatedir},g' ${D}${systemd_unitdir}/system/dhcpd*.service
 }
 
 PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
diff --git a/meta/recipes-connectivity/dhcp/files/dhcpd.service b/meta/recipes-connectivity/dhcp/files/dhcpd.service
index 8648f1a..ae4f93e 100644
--- a/meta/recipes-connectivity/dhcp/files/dhcpd.service
+++ b/meta/recipes-connectivity/dhcp/files/dhcpd.service
@@ -1,11 +1,15 @@
 [Unit]
-Description=DHCP Server Daemon
+Description=DHCPv4 Server Daemon
+Documentation=man:dhcpd(8) man:dhcpd.conf(5)
 After=network.target
 After=time-sync.target
 
 [Service]
+PIDFile=@localstatedir@/run/dhcpd.pid
 EnvironmentFile=@SYSCONFDIR@/default/dhcp-server
-ExecStart=-@SBINDIR@/dhcpd -q $INTERFACES
+EnvironmentFile=-@SYSCONFDIR@/sysconfig/dhcp-server
+ExecStartPre=@base_bindir@/touch @localstatedir@/lib/dhcp/dhcpd.leases
+ExecStart=@SBINDIR@/dhcpd -f -cf @SYSCONFDIR@/dhcp/dhcpd.conf -pf @localstatedir@/run/dhcpd.pid $DHCPDARGS -q $INTERFACES
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/dhcp/files/dhcpd6.service b/meta/recipes-connectivity/dhcp/files/dhcpd6.service
new file mode 100644
index 0000000..ca96abb
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/files/dhcpd6.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=DHCPv6 Server Daemon
+Documentation=man:dhcpd(8) man:dhcpd.conf(5)
+After=network.target
+After=time-sync.target
+
+[Service]
+PIDFile=@localstatedir@/run/dhcpd6.pid
+EnvironmentFile=@SYSCONFDIR@/default/dhcp-server
+EnvironmentFile=-@SYSCONFDIR@/sysconfig/dhcpd6
+ExecStartPre=@base_bindir@/touch @localstatedir@/lib/dhcp/dhcpd6.leases
+ExecStart=@SBINDIR@/dhcpd -f -6 -cf @SYSCONFDIR@/dhcp/dhcpd.conf -pf @localstatedir@/run/dhcpd6.pid $DHCPDARGS -q $INTERFACES
+
+[Install]
+WantedBy=multi-user.target
-- 
1.8.4.2


