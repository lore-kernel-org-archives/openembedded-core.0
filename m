Return-Path: <niko.mauno@iki.fi>
Received: from sirokuusama2.dnainternet.net (sirokuusama2.dnainternet.net
	[83.102.40.153])
	by mail.openembedded.org (Postfix) with ESMTP id D8DE97F885
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 20:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sirokuusama2.dnainternet.net (Postfix) with ESMTP id 35829120FB;
	Thu,  5 Dec 2019 22:08:29 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 0.653
X-Spam-Level: 
X-Spam-Status: No, score=0.653 tagged_above=-9999 required=6
	tests=[SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.652] autolearn=disabled
Received: from sirokuusama2.dnainternet.net ([83.102.40.153])
	by localhost (sirokuusama2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10041)
	with ESMTP id olr_E21Bizpf; Thu,  5 Dec 2019 22:08:28 +0200 (EET)
Received: from luumupuu2.dnainternet.net (luumupuu2.dnainternet.net
	[83.102.40.55])
	by sirokuusama2.dnainternet.net (Postfix) with ESMTP id 8543D120F6;
	Thu,  5 Dec 2019 22:08:28 +0200 (EET)
Received: from localhost.localdomain (62-78-161-185.bb.dnainternet.fi
	[62.78.161.185])
	by luumupuu2.dnainternet.net (Postfix) with ESMTP id 672288F;
	Thu,  5 Dec 2019 22:08:22 +0200 (EET)
From: Niko Mauno <niko.mauno@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 22:05:18 +0200
Message-Id: <20191205200518.82007-3-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191205200518.82007-1-niko.mauno@iki.fi>
References: <20191205200518.82007-1-niko.mauno@iki.fi>
MIME-Version: 1.0
Subject: [zeus][PATCH 3/3] iptables: Add systemd helper unit for IPv6 too
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
X-List-Received-Date: Thu, 05 Dec 2019 20:08:29 -0000
Content-Transfer-Encoding: 8bit

Commit bc66b2f45ade2c63cfd14d5388f6ca0905a23bb0 added systemd helper
unit for automatic IPv4 rule loading. Complement the effort by adding
systemd helper unit also for automatic IPv6 rule loading.

(From OE-Core rev: 3b8df6b6aba3632de7c3c01c8468fbcedb032493)

Signed-off-by: Niko Mauno <niko.mauno@iki.fi>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../iptables/iptables/ip6tables.rules         |  0
 .../iptables/iptables/ip6tables.service       | 13 ++++++++++++
 .../iptables/iptables/iptables.service        |  6 +++---
 .../iptables/iptables_1.8.3.bb                | 21 ++++++++++++++++++-
 4 files changed, 36 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-extended/iptables/iptables/ip6tables.rules
 create mode 100644 meta/recipes-extended/iptables/iptables/ip6tables.service

diff --git a/meta/recipes-extended/iptables/iptables/ip6tables.rules b/meta/recipes-extended/iptables/iptables/ip6tables.rules
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/meta/recipes-extended/iptables/iptables/ip6tables.service b/meta/recipes-extended/iptables/iptables/ip6tables.service
new file mode 100644
index 0000000000..6c059fca49
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/ip6tables.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=IPv6 Packet Filtering Framework
+Before=network-pre.target
+Wants=network-pre.target
+
+[Service]
+Type=oneshot
+ExecStart=@SBINDIR@/ip6tables-restore -w -- @RULESDIR@/ip6tables.rules
+ExecReload=@SBINDIR@/ip6tables-restore -w -- @RULESDIR@/ip6tables.rules
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/iptables/iptables/iptables.service b/meta/recipes-extended/iptables/iptables/iptables.service
index 5a8aa3f298..0eb3c343de 100644
--- a/meta/recipes-extended/iptables/iptables/iptables.service
+++ b/meta/recipes-extended/iptables/iptables/iptables.service
@@ -1,12 +1,12 @@
 [Unit]
-Description=Packet Filtering Framework
+Description=IPv4 Packet Filtering Framework
 Before=network-pre.target
 Wants=network-pre.target
 
 [Service]
 Type=oneshot
-ExecStart=@SBINDIR@/iptables-restore @RULESDIR@/iptables.rules
-ExecReload=@SBINDIR@/iptables-restore @RULESDIR@/iptables.rules
+ExecStart=@SBINDIR@/iptables-restore -w -- @RULESDIR@/iptables.rules
+ExecReload=@SBINDIR@/iptables-restore -w -- @RULESDIR@/iptables.rules
 RemainAfterExit=yes
 
 [Install]
diff --git a/meta/recipes-extended/iptables/iptables_1.8.3.bb b/meta/recipes-extended/iptables/iptables_1.8.3.bb
index 73680207b4..96d195d9d0 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.3.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.3.bb
@@ -13,11 +13,16 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
            file://iptables.service \
            file://iptables.rules \
+           file://ip6tables.service \
+           file://ip6tables.rules \
 "
 SRC_URI[md5sum] = "29de711d15c040c402cf3038c69ff513"
 SRC_URI[sha256sum] = "a23cac034181206b4545f4e7e730e76e08b5f3dd78771ba9645a6756de9cdd80"
 
-SYSTEMD_SERVICE_${PN} = "iptables.service"
+SYSTEMD_SERVICE_${PN} = "\
+    iptables.service \
+    ${@bb.utils.contains('PACKAGECONFIG', 'ipv6', 'ip6tables.service', '', d)} \
+"
 
 inherit autotools pkgconfig systemd
 
@@ -51,6 +56,16 @@ do_install_append() {
         -e 's,@SBINDIR@,${sbindir},g' \
         -e 's,@RULESDIR@,${IPTABLES_RULES_DIR},g' \
         ${D}${systemd_system_unitdir}/iptables.service
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'ipv6', 'true', 'false', d)} ; then
+        install -m 0644 ${WORKDIR}/ip6tables.rules ${D}${IPTABLES_RULES_DIR}
+        install -m 0644 ${WORKDIR}/ip6tables.service ${D}${systemd_system_unitdir}
+
+        sed -i \
+            -e 's,@SBINDIR@,${sbindir},g' \
+            -e 's,@RULESDIR@,${IPTABLES_RULES_DIR},g' \
+            ${D}${systemd_system_unitdir}/ip6tables.service
+    fi
 }
 
 PACKAGES += "${PN}-modules"
@@ -75,6 +90,10 @@ RRECOMMENDS_${PN} = " \
     kernel-module-nf-conntrack-ipv4 \
     kernel-module-nf-nat \
     kernel-module-ipt-masquerade \
+    ${@bb.utils.contains('PACKAGECONFIG', 'ipv6', '\
+        kernel-module-ip6table-filter \
+        kernel-module-ip6-tables \
+    ', '', d)} \
 "
 
 FILES_${PN} += "${datadir}/xtables"
-- 
2.20.1


