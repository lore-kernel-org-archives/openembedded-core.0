Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5E5657E436
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 09:18:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4N9H7Ci006437
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 May 2019 02:17:33 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 23 May 2019 02:17:29 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 23 May 2019 16:25:58 +0800
Message-ID: <20190523082558.3805-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190523082558.3805-1-kai.kang@windriver.com>
References: <20190523082558.3805-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 2/2] systemd-conf: configure wired network with dhcp
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
X-List-Received-Date: Thu, 23 May 2019 09:18:03 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add a configure file for systemd.networkd to configure wired network
interfaces with dhcp. It works with common network interfaces such eth0
and eno1. And do not install it for qemu bsps.

Refer to
https://github.com/YoeDistro/meta-yoe/tree/master/recipes-core/systemd

[YOCTO #13057]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/systemd/systemd-conf/wired.network | 9 +++++++++
 meta/recipes-core/systemd/systemd-conf_242.bb        | 6 ++++++
 2 files changed, 15 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd-conf/wired.network

diff --git a/meta/recipes-core/systemd/systemd-conf/wired.network b/meta/recipes-core/systemd/systemd-conf/wired.network
new file mode 100644
index 0000000000..253aee9382
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-conf/wired.network
@@ -0,0 +1,9 @@
+[Match]
+Name=en* eth*
+
+[Network]
+DHCP=yes
+
+[DHCP]
+RouteMetric=10
+ClientIdentifier=mac
diff --git a/meta/recipes-core/systemd/systemd-conf_242.bb b/meta/recipes-core/systemd/systemd-conf_242.bb
index 96beea53a7..d9ec023bfd 100644
--- a/meta/recipes-core/systemd/systemd-conf_242.bb
+++ b/meta/recipes-core/systemd/systemd-conf_242.bb
@@ -10,17 +10,22 @@ SRC_URI = "\
     file://logind.conf \
     file://system.conf \
     file://system.conf-qemuall \
+    file://wired.network \
 "
 
 do_install() {
 	install -D -m0644 ${WORKDIR}/journald.conf ${D}${systemd_unitdir}/journald.conf.d/00-${PN}.conf
 	install -D -m0644 ${WORKDIR}/logind.conf ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
 	install -D -m0644 ${WORKDIR}/system.conf ${D}${systemd_unitdir}/system.conf.d/00-${PN}.conf
+	install -D -m0644 ${WORKDIR}/wired.network ${D}${systemd_unitdir}/network/80-wired.network
 }
 
 # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa2867be31759c1b52
 do_install_append_qemuall() {
 	install -D -m0644 ${WORKDIR}/system.conf-qemuall ${D}${systemd_unitdir}/system.conf.d/01-${PN}.conf
+
+	# Do not install wired.network for qemu bsps
+	rm -rf ${D}${systemd_unitdir}/network
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -29,4 +34,5 @@ FILES_${PN} = "\
     ${systemd_unitdir}/journald.conf.d/ \
     ${systemd_unitdir}/logind.conf.d/ \
     ${systemd_unitdir}/system.conf.d/ \
+    ${systemd_unitdir}/network/ \
 "
-- 
2.18.0


