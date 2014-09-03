Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E91E713DF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 07:09:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8379R6Y005219
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Sep 2014 00:09:27 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 3 Sep 2014 00:09:26 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Sep 2014 15:09:07 +0800
Message-ID: <85d96d3058de64759667dd5aac72cfa1d84d9a84.1409728004.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409728004.git.Qi.Chen@windriver.com>
References: <cover.1409728004.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/25] dhcp: add systemd service files
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
X-List-Received-Date: Wed, 03 Sep 2014 07:09:26 -0000
Content-Type: text/plain

Add dhcpd.service and dhcrelay.service to support systemd systems.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc            | 23 ++++++++++++++++++----
 meta/recipes-connectivity/dhcp/files/dhcpd.service | 11 +++++++++++
 .../dhcp/files/dhcrelay.service                    |  9 +++++++++
 3 files changed, 39 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhcpd.service
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhcrelay.service

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 512127c..a175254 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -14,11 +14,19 @@ DEPENDS = "openssl bind"
 
 SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://site.h \
-	   file://init-relay file://default-relay \
-	   file://init-server file://default-server \
-	   file://dhclient.conf file://dhcpd.conf"
+           file://init-relay file://default-relay \
+           file://init-server file://default-server \
+           file://dhclient.conf file://dhcpd.conf \
+           file://dhcpd.service file://dhcrelay.service"
 
-inherit autotools
+inherit autotools systemd
+
+SYSTEMD_PACKAGES = "dhcp-server dhcp-relay"
+SYSTEMD_SERVICE_dhcp-server = "dhcpd.service"
+SYSTEMD_AUTO_ENABLE_dhcp-server = "disable"
+
+SYSTEMD_SERVICE_dhcp-relay = "dhcrelay.service"
+SYSTEMD_AUTO_ENABLE_dhcp-relay = "disable"
 
 TARGET_CFLAGS += "-D_GNU_SOURCE"
 EXTRA_OECONF = "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
@@ -51,6 +59,13 @@ do_install_append () {
 		mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/
 	fi
 	install -m 0755 ${S}/client/scripts/linux ${D}${base_sbindir}/dhclient-script
+
+	# Install systemd unit files
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dhcpd.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/dhcpd.service ${D}${systemd_unitdir}/system/dhcrelay.service
+	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcpd.service
 }
 
 PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
diff --git a/meta/recipes-connectivity/dhcp/files/dhcpd.service b/meta/recipes-connectivity/dhcp/files/dhcpd.service
new file mode 100644
index 0000000..8648f1a
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/files/dhcpd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=DHCP Server Daemon
+After=network.target
+After=time-sync.target
+
+[Service]
+EnvironmentFile=@SYSCONFDIR@/default/dhcp-server
+ExecStart=-@SBINDIR@/dhcpd -q $INTERFACES
+
+[Install]
+WantedBy=multi-user.target
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


