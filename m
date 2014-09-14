Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 178176FC57
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 06:48:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8E6mRX1001174
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Sep 2014 23:48:27 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sat, 13 Sep 2014 23:48:26 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 14 Sep 2014 14:48:52 +0800
Message-ID: <9238ddcf23be0bed3d8e4c69d19308fda5c91e61.1410677291.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410677291.git.Qi.Chen@windriver.com>
References: <cover.1410677291.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] portmap: add systemd service file
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
X-List-Received-Date: Sun, 14 Sep 2014 06:48:28 -0000
Content-Type: text/plain

Add systemd service file for systemd support.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/portmap/portmap.inc             |  5 ++++-
 meta/recipes-connectivity/portmap/portmap/portmap.service | 10 ++++++++++
 meta/recipes-connectivity/portmap/portmap_6.0.bb          |  7 ++++++-
 3 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/portmap/portmap/portmap.service

diff --git a/meta/recipes-connectivity/portmap/portmap.inc b/meta/recipes-connectivity/portmap/portmap.inc
index 9b42859..f5f7fde 100644
--- a/meta/recipes-connectivity/portmap/portmap.inc
+++ b/meta/recipes-connectivity/portmap/portmap.inc
@@ -10,12 +10,15 @@ SRC_URI = "${DEBIAN_MIRROR}/main/p/portmap/portmap_5.orig.tar.gz \
 	${DEBIAN_MIRROR}/main/p/portmap/portmap_${PV}.diff.gz \
 	file://portmap.init \
 	file://make.patch;apply=yes"
+
 S = "${WORKDIR}/portmap_5beta"
 
 INITSCRIPT_NAME = "portmap"
 INITSCRIPT_PARAMS = "start 10 2 3 4 5 . stop 32 0 1 6 ."
 
-inherit update-rc.d
+inherit update-rc.d systemd
+
+SYSTEMD_SERVICE_${PN} = "portmap.service"
 
 sbindir = "/sbin"
 
diff --git a/meta/recipes-connectivity/portmap/portmap/portmap.service b/meta/recipes-connectivity/portmap/portmap/portmap.service
new file mode 100644
index 0000000..7ef9d7b
--- /dev/null
+++ b/meta/recipes-connectivity/portmap/portmap/portmap.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=The RPC portmapper
+After=network.target
+
+[Service]
+Type=forking
+ExecStart=@BASE_SBINDIR@/portmap
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/portmap/portmap_6.0.bb b/meta/recipes-connectivity/portmap/portmap_6.0.bb
index b0a9454..8b65a03 100644
--- a/meta/recipes-connectivity/portmap/portmap_6.0.bb
+++ b/meta/recipes-connectivity/portmap/portmap_6.0.bb
@@ -5,7 +5,8 @@ PR = "r9"
 SRC_URI = "http://www.sourcefiles.org/Networking/Tools/Miscellanenous/portmap-6.0.tgz \
            file://destdir-no-strip.patch \
            file://tcpd-config.patch \
-           file://portmap.init"
+           file://portmap.init \
+           file://portmap.service"
 
 SRC_URI[md5sum] = "ac108ab68bf0f34477f8317791aaf1ff"
 SRC_URI[sha256sum] = "02c820d39f3e6e729d1bea3287a2d8a6c684f1006fb9612f97dcad4a281d41de"
@@ -23,4 +24,8 @@ fakeroot do_install() {
     install -d ${D}${mandir}/man8/ ${D}${base_sbindir} ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/portmap.init ${D}${sysconfdir}/init.d/portmap
     oe_runmake install DESTDIR=${D}
+
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/portmap.service ${D}${systemd_unitdir}/system
+    sed -i -e 's,@BASE_SBINDIR@,${base_sbindir},g' ${D}${systemd_unitdir}/system/portmap.service
 }
-- 
1.9.1


