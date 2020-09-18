Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.9052.1600421145304878436
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2020 02:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08I9PDI2005642
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2020 02:25:34 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 18 Sep 2020
 02:25:10 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] kea: create /var/lib/kea and /var/run/kea folder
Date: Fri, 18 Sep 2020 02:25:10 -0700
Message-ID: <20200918092510.94018-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Create /var/lib/kea and /var/run/kea folder if they don't
exist to fix below error:
 # keactrl start
 INFO/keactrl: Starting /usr/sbin/kea-dhcp4 -c /etc/kea/kea-dhcp4.conf
 INFO/keactrl: Starting /usr/sbin/kea-dhcp6 -c /etc/kea/kea-dhcp6.conf
 INFO/keactrl: Starting /usr/sbin/kea-ctrl-agent -c /etc/kea/kea-ctrl-agent.conf
 Unable to use interprocess sync lockfile (No such file or directory): /var/run/kea/logger_lockfile
 Service failed: Launch failed: Unable to open PID file '/var/run/kea/kea-ctrl-agent.kea-ctrl-agent.pid' for write
 [snip]
 ERROR [kea-dhcp4.dhcp4/615.140641792751488] DHCP4_CONFIG_LOAD_FAIL configuration error using file: /etc/kea/kea-dhcp4.conf, reason: Unable to open database: unable to open '/var/lib/kea/kea-leases4.csv'
 [snip]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...e-var-lib-kea-and-var-run-kea-folder.patch | 39 +++++++++++++++++++
 meta/recipes-connectivity/kea/kea_1.7.10.bb   |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch

diff --git a/meta/recipes-connectivity/kea/files/0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch b/meta/recipes-connectivity/kea/files/0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch
new file mode 100644
index 0000000000..ab3fd83946
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch
@@ -0,0 +1,39 @@
+From 639dc25cdabc9d1846000a542c8cc19158b69994 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 18 Sep 2020 08:18:08 +0000
+Subject: [PATCH] keactrl.in: create /var/lib/kea and /var/run/kea folder
+
+Create /var/lib/kea and /var/run/kea folder to fix below error:
+ # keactrl start
+ INFO/keactrl: Starting /usr/sbin/kea-dhcp4 -c /etc/kea/kea-dhcp4.conf
+ INFO/keactrl: Starting /usr/sbin/kea-dhcp6 -c /etc/kea/kea-dhcp6.conf
+ INFO/keactrl: Starting /usr/sbin/kea-ctrl-agent -c /etc/kea/kea-ctrl-agent.conf
+ Unable to use interprocess sync lockfile (No such file or directory): /var/run/kea/logger_lockfile
+ Service failed: Launch failed: Unable to open PID file '/var/run/kea/kea-ctrl-agent.kea-ctrl-agent.pid' for write
+ [snip]
+ ERROR [kea-dhcp4.dhcp4/615.140641792751488] DHCP4_CONFIG_LOAD_FAIL configuration error using file: /etc/kea/kea-dhcp4.conf, reason: Unable to open database: unable to open '/var/lib/kea/kea-leases4.csv'
+ [snip]
+
+Upstream-Status: Inappropriate [config specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/bin/keactrl/keactrl.in | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
+index 12b2b3f..47cf6f9 100644
+--- a/src/bin/keactrl/keactrl.in
++++ b/src/bin/keactrl/keactrl.in
+@@ -482,6 +482,8 @@ case ${command} in
+         # The variables (dhcp4_srv, dhcp6_serv, dhcp_ddns_srv etc) are set in the
+         # keactrl.conf file that shellcheck is unable to read.
+         # shellcheck disable=SC2154
++        [ -d @LOCALSTATEDIR@/run/kea ] || mkdir -p @LOCALSTATEDIR@/run/kea
++        [ -d @LOCALSTATEDIR@/lib/kea ] || mkdir -p @LOCALSTATEDIR@/lib/kea
+         run_conditional "dhcp4" "start_server ${dhcp4_srv} -c ${kea_dhcp4_config_file} ${args}" 1
+         run_conditional "dhcp6" "start_server ${dhcp6_srv} -c ${kea_dhcp6_config_file} ${args}" 1
+         # shellcheck disable=SC2154
+-- 
+2.26.2
+
diff --git a/meta/recipes-connectivity/kea/kea_1.7.10.bb b/meta/recipes-connectivity/kea/kea_1.7.10.bb
index e2560b2399..d3c8834b46 100644
--- a/meta/recipes-connectivity/kea/kea_1.7.10.bb
+++ b/meta/recipes-connectivity/kea/kea_1.7.10.bb
@@ -9,6 +9,7 @@ DEPENDS = "boost log4cplus openssl"
 
 SRC_URI = "\
     http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
+    file://0001-keactrl.in-create-var-lib-kea-and-var-run-kea-folder.patch \
     file://kea-dhcp4.service \
     file://kea-dhcp6.service \
     file://kea-dhcp-ddns.service \
@@ -46,7 +47,7 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/kea-dhcp*service ${D}${systemd_system_unitdir}
     sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
            -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-           ${D}${systemd_system_unitdir}/kea-dhcp*service
+           ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbindir}/keactrl
 }
 
 do_install_append() {
-- 
2.17.1

