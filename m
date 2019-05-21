Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7CE477D589
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 09:24:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4L9N7Gi031608
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 May 2019 02:23:17 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 21 May 2019 02:22:56 -0700
From: <kai.kang@windriver.com>
To: <alex.kiernan@gmail.com>, <raj.khem@gmail.com>
Date: Tue, 21 May 2019 05:22:49 -0400
Message-ID: <20190521092249.175461-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190521092249.175461-1-kai.kang@windriver.com>
References: <20190521092249.175461-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/1] systemd-conf: configure wired network with dhcp
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
X-List-Received-Date: Tue, 21 May 2019 09:24:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add a configure file for systemd.networkd to configure wired network
interfaces with dhcp. It works with common network interfaces such eth0
and eno1.

Refer to
https://github.com/YoeDistro/meta-yoe/tree/master/recipes-core/systemd

[YOCTO #13057]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/systemd/systemd-conf/dhcp.network | 9 +++++++++
 meta/recipes-core/systemd/systemd-conf_242.bb       | 5 +++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd-conf/dhcp.network

diff --git a/meta/recipes-core/systemd/systemd-conf/dhcp.network b/meta/recipes-core/systemd/systemd-conf/dhcp.network
new file mode 100644
index 0000000000..253aee9382
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-conf/dhcp.network
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
index 96beea53a7..105ee3ceed 100644
--- a/meta/recipes-core/systemd/systemd-conf_242.bb
+++ b/meta/recipes-core/systemd/systemd-conf_242.bb
@@ -10,12 +10,16 @@ SRC_URI = "\
     file://logind.conf \
     file://system.conf \
     file://system.conf-qemuall \
+    file://dhcp.network \
 "
 
 do_install() {
 	install -D -m0644 ${WORKDIR}/journald.conf ${D}${systemd_unitdir}/journald.conf.d/00-${PN}.conf
 	install -D -m0644 ${WORKDIR}/logind.conf ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
 	install -D -m0644 ${WORKDIR}/system.conf ${D}${systemd_unitdir}/system.conf.d/00-${PN}.conf
+	if ${@bb.utils.contains('OVERRIDES', 'qemuall', 'false', 'true', d)}; then
+		install -D -m0644 ${WORKDIR}/dhcp.network ${D}${systemd_unitdir}/network/80-dhcp.network
+	fi
 }
 
 # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa2867be31759c1b52
@@ -29,4 +33,5 @@ FILES_${PN} = "\
     ${systemd_unitdir}/journald.conf.d/ \
     ${systemd_unitdir}/logind.conf.d/ \
     ${systemd_unitdir}/system.conf.d/ \
+    ${systemd_unitdir}/network/ \
 "
-- 
2.20.0


