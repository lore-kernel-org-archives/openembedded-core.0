Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DD10D72627
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 03:03:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBH33LFM007960
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 19:03:21 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 16 Dec 2014 19:03:20 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Dec 2014 11:03:19 +0800
Message-ID: <ff292491b90eba673df637a2845a8a37f1aa080a.1418785337.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418785337.git.Qi.Chen@windriver.com>
References: <cover.1418785337.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dhcp: add dhclient.service
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
X-List-Received-Date: Wed, 17 Dec 2014 03:03:28 -0000
Content-Type: text/plain

Add dhclient.service. This service file mainly comes from meta-systemd,
with a few modifications.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc               | 11 ++++++++---
 meta/recipes-connectivity/dhcp/files/dhclient.service | 15 +++++++++++++++
 2 files changed, 23 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhclient.service

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 4949e02..b975d40 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -17,17 +17,20 @@ SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://init-relay file://default-relay \
            file://init-server file://default-server \
            file://dhclient.conf file://dhcpd.conf \
-           file://dhcpd.service file://dhcrelay.service"
+           file://dhcpd.service file://dhcrelay.service file://dhclient.service"
 
 inherit autotools systemd
 
-SYSTEMD_PACKAGES = "${PN}-server ${PN}-relay"
+SYSTEMD_PACKAGES = "${PN}-server ${PN}-relay ${PN}-client"
 SYSTEMD_SERVICE_${PN}-server = "dhcpd.service"
 SYSTEMD_AUTO_ENABLE_${PN}-server = "disable"
 
 SYSTEMD_SERVICE_${PN}-relay = "dhcrelay.service"
 SYSTEMD_AUTO_ENABLE_${PN}-relay = "disable"
 
+SYSTEMD_SERVICE_${PN}-client = "dhclient.service"
+SYSTEMD_AUTO_ENABLE_${PN}-client = "disable"
+
 TARGET_CFLAGS += "-D_GNU_SOURCE"
 EXTRA_OECONF = "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
                 --with-srv6-lease-file=${localstatedir}/lib/dhcp/dhcpd6.leases \
@@ -64,8 +67,10 @@ do_install_append () {
 	install -d ${D}${systemd_unitdir}/system
 	install -m 0644 ${WORKDIR}/dhcpd.service ${D}${systemd_unitdir}/system
 	install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dhclient.service ${D}${systemd_unitdir}/system
 	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/dhcpd.service ${D}${systemd_unitdir}/system/dhcrelay.service
-	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcpd.service
+	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcpd.service ${D}${systemd_unitdir}/system/dhclient.service
+	sed -i -e 's,@BASE_SBINDIR@,${base_sbindir},g' ${D}${systemd_unitdir}/system/dhclient.service
 }
 
 PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
diff --git a/meta/recipes-connectivity/dhcp/files/dhclient.service b/meta/recipes-connectivity/dhcp/files/dhclient.service
new file mode 100644
index 0000000..d3d9785
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/files/dhclient.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=Dynamic Host Configuration Protocol (DHCP)
+Wants=network.target
+Before=network.target
+After=systemd-udevd.service
+
+[Service]
+Type=forking
+PIDFile=/var/run/dhclient.pid
+EnvironmentFile=-@SYSCONFDIR@/default/dhcp-client
+ExecStart=@BASE_SBINDIR@/dhclient -cf @SYSCONFDIR@/dhcp/dhclient.conf -q -lf /var/lib/dhcp/dhclient.leases $INTERFACES
+
+[Install]
+WantedBy=multi-user.target
+
-- 
1.9.1


