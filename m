Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 27C5971353
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:54:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s82AsHQP003980
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Sep 2014 03:54:17 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Sep 2014 03:54:17 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Sep 2014 18:53:56 +0800
Message-ID: <664768e4223b4401525d0796662f1666e2d21824.1409655125.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409655125.git.Qi.Chen@windriver.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/26] dhcp: add dhcpd.service
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

Add dhcpd.service to support systemd systems.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc            | 18 ++++++++++++++----
 meta/recipes-connectivity/dhcp/files/dhcpd.service | 11 +++++++++++
 2 files changed, 25 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhcpd.service

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 512127c..b281f94 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -14,11 +14,16 @@ DEPENDS = "openssl bind"
 
 SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://site.h \
-	   file://init-relay file://default-relay \
-	   file://init-server file://default-server \
-	   file://dhclient.conf file://dhcpd.conf"
+           file://init-relay file://default-relay \
+           file://init-server file://default-server \
+           file://dhclient.conf file://dhcpd.conf \
+           file://dhcpd.service"
 
-inherit autotools
+inherit autotools systemd
+
+SYSTEMD_PACKAGES = "dhcp-server"
+SYSTEMD_SERVICE_dhcp-server = "dhcpd.service"
+SYSTEMD_AUTO_ENABLE_dhcp-server = "disable"
 
 TARGET_CFLAGS += "-D_GNU_SOURCE"
 EXTRA_OECONF = "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
@@ -51,6 +56,11 @@ do_install_append () {
 		mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/
 	fi
 	install -m 0755 ${S}/client/scripts/linux ${D}${base_sbindir}/dhclient-script
+
+	# Install systemd unit files
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dhcpd.service ${D}${systemd_unitdir}/system
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/dhcpd.service
 }
 
 PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
diff --git a/meta/recipes-connectivity/dhcp/files/dhcpd.service b/meta/recipes-connectivity/dhcp/files/dhcpd.service
new file mode 100644
index 0000000..5c9ef6f
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/files/dhcpd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=DHCP Server Daemon
+After=network.target
+After=time-sync.target
+
+[Service]
+EnvironmentFile=/etc/default/dhcp-server
+ExecStart=-@SBINDIR@/dhcpd -q $INTERFACES
+
+[Install]
+WantedBy=multi-user.target
-- 
1.9.1


