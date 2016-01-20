Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD159731C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 02:02:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0K22H4O003019
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 18:02:17 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 19 Jan 2016 18:02:16 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jan 2016 10:01:36 +0800
Message-ID: <1453255296-6863-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH] watchdog: enable systemd support
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
X-List-Received-Date: Wed, 20 Jan 2016 02:02:16 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. inherit systemd, and add two unit files which are from Fedora 23
2. auto load soft dog kernel module

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../watchdog/watchdog/watchdog-ping.service            | 12 ++++++++++++
 .../watchdog/watchdog/watchdog.service                 | 12 ++++++++++++
 meta/recipes-extended/watchdog/watchdog_5.14.bb        | 18 ++++++++++++++++--
 3 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/watchdog/watchdog/watchdog-ping.service
 create mode 100644 meta/recipes-extended/watchdog/watchdog/watchdog.service

diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog-ping.service b/meta/recipes-extended/watchdog/watchdog/watchdog-ping.service
new file mode 100644
index 0000000..da403c9
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog/watchdog-ping.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=watchdog daemon for use with ping test / network dependency
+After=network.target
+Conflicts=watchdog.service
+
+[Service]
+Type=forking
+ExecStart=/usr/sbin/watchdog
+ControlGroup=cpu:/
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog.service b/meta/recipes-extended/watchdog/watchdog/watchdog.service
new file mode 100644
index 0000000..3c36a08
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog/watchdog.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=watchdog daemon
+# man systemd.special
+# auto added After=basic.target
+
+[Service]
+Type=forking
+ExecStart=/usr/sbin/watchdog
+ControlGroup=cpu:/
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/watchdog/watchdog_5.14.bb b/meta/recipes-extended/watchdog/watchdog_5.14.bb
index 9cb89d5..55cbbb4 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.14.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.14.bb
@@ -12,7 +12,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
            file://fixsepbuild.patch \
 	   file://fix-ping-failure.patch \
 	   file://watchdog-init.patch \
-	   file://watchdog-conf.patch"
+	   file://watchdog-conf.patch \
+	   file://watchdog-ping.service \
+	   file://watchdog.service \
+"
 
 SRC_URI[md5sum] = "5b2dba0c593942f4acc100bca0d560c4"
 SRC_URI[sha256sum] = "620b2f49e9879f2e85c73d4c1f422f9101e6b38e824fea2414befd8bb6866ad1"
@@ -21,13 +24,24 @@ UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/watchdog/files/watchdog/"
 UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit autotools
-inherit update-rc.d
+inherit update-rc.d systemd
 
 INITSCRIPT_NAME = "watchdog.sh"
 INITSCRIPT_PARAMS = "start 15 1 2 3 4 5 . stop 85 0 6 ."
 
 RRECOMMENDS_${PN} = "kernel-module-softdog"
 
+SYSTEMD_SERVICE_${PN} = "watchdog.service"
+
 do_install_append() {
 	install -D ${S}/redhat/watchdog.init ${D}/${sysconfdir}/init.d/watchdog.sh
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/watchdog*.service ${D}${systemd_unitdir}/system
+
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -d ${D}${sysconfdir}/modules-load.d
+		echo "softdog" > ${D}${sysconfdir}/modules-load.d/softdog.conf
+	fi
 }
+
+FILES_${PN} += "${systemd_unitdir}/system/*"
-- 
2.5.0


