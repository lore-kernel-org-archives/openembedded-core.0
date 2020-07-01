Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.729.1593641491927709413
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 15:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 061MBUW6029009
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Jul 2020 15:11:30 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Wed, 1 Jul 2020
 15:11:30 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] systemd-conf: unpack to $S
Date: Wed, 1 Jul 2020 15:11:29 -0700
Message-ID: <20200701221129.99170-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

systemd-conf copies some files to the target but they
are in WORKDIR and not visible to the archiver.  Unpack
them to S.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../systemd/systemd-conf_245.6.bb             | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-conf_245.6.bb b/meta/recipes-core/systemd/systemd-conf_245.6.bb
index d9ec023bfd..d205a60859 100644
--- a/meta/recipes-core/systemd/systemd-conf_245.6.bb
+++ b/meta/recipes-core/systemd/systemd-conf_245.6.bb
@@ -6,23 +6,23 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SRC_URI = "\
-    file://journald.conf \
-    file://logind.conf \
-    file://system.conf \
-    file://system.conf-qemuall \
-    file://wired.network \
+    file://journald.conf;subdir=${BP} \
+    file://logind.conf;subdir=${BP} \
+    file://system.conf;subdir=${BP} \
+    file://system.conf-qemuall;subdir=${BP} \
+    file://wired.network;subdir=${BP} \
 "
 
 do_install() {
-	install -D -m0644 ${WORKDIR}/journald.conf ${D}${systemd_unitdir}/journald.conf.d/00-${PN}.conf
-	install -D -m0644 ${WORKDIR}/logind.conf ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
-	install -D -m0644 ${WORKDIR}/system.conf ${D}${systemd_unitdir}/system.conf.d/00-${PN}.conf
-	install -D -m0644 ${WORKDIR}/wired.network ${D}${systemd_unitdir}/network/80-wired.network
+	install -D -m0644 ${S}/journald.conf ${D}${systemd_unitdir}/journald.conf.d/00-${PN}.conf
+	install -D -m0644 ${S}/logind.conf ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
+	install -D -m0644 ${S}/system.conf ${D}${systemd_unitdir}/system.conf.d/00-${PN}.conf
+	install -D -m0644 ${S}/wired.network ${D}${systemd_unitdir}/network/80-wired.network
 }
 
 # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa2867be31759c1b52
 do_install_append_qemuall() {
-	install -D -m0644 ${WORKDIR}/system.conf-qemuall ${D}${systemd_unitdir}/system.conf.d/01-${PN}.conf
+	install -D -m0644 ${S}/system.conf-qemuall ${D}${systemd_unitdir}/system.conf.d/01-${PN}.conf
 
 	# Do not install wired.network for qemu bsps
 	rm -rf ${D}${systemd_unitdir}/network
-- 
2.17.1

