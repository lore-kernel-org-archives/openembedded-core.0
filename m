Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 180FE712AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:54:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s82AsIZQ010811
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Sep 2014 03:54:18 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Sep 2014 03:54:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Sep 2014 18:53:57 +0800
Message-ID: <ba8983b88d79eae51d4b34074e3cfe2e972d3e79.1409655125.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409655125.git.Qi.Chen@windriver.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/26] dhcp: add dhcrelay.service
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
X-List-Received-Date: Tue, 02 Sep 2014 10:54:18 -0000
Content-Type: text/plain

Add dhcrelay.service to support systemd systems.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc               | 9 +++++++--
 meta/recipes-connectivity/dhcp/files/dhcrelay.service | 9 +++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhcrelay.service

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index b281f94..f2b25a5 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -17,14 +17,17 @@ SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://init-relay file://default-relay \
            file://init-server file://default-server \
            file://dhclient.conf file://dhcpd.conf \
-           file://dhcpd.service"
+           file://dhcpd.service file://dhcrelay.service"
 
 inherit autotools systemd
 
-SYSTEMD_PACKAGES = "dhcp-server"
+SYSTEMD_PACKAGES = "dhcp-server dhcp-relay"
 SYSTEMD_SERVICE_dhcp-server = "dhcpd.service"
 SYSTEMD_AUTO_ENABLE_dhcp-server = "disable"
 
+SYSTEMD_SERVICE_dhcp-relay = "dhcrelay.service"
+SYSTEMD_AUTO_ENABLE_dhcp-relay = "disable"
+
 TARGET_CFLAGS += "-D_GNU_SOURCE"
 EXTRA_OECONF = "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
                 --with-srv6-lease-file=${localstatedir}/lib/dhcp/dhcpd6.leases \
@@ -60,7 +63,9 @@ do_install_append () {
 	# Install systemd unit files
 	install -d ${D}${systemd_unitdir}/system
 	install -m 0644 ${WORKDIR}/dhcpd.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system
 	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/dhcpd.service
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
 }
 
 PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
diff --git a/meta/recipes-connectivity/dhcp/files/dhcrelay.service b/meta/recipes-connectivity/dhcp/files/dhcrelay.service
new file mode 100644
index 0000000..a2d8189
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/files/dhcrelay.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=DHCP Relay Agent Daemon
+After=network.target
+
+[Service]
+ExecStart=@SBINDIR@/dhcrelay -d --no-pid
+
+[Install]
+WantedBy=multi-user.target
-- 
1.9.1


