Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5A42060609
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 02:11:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r832C1Wk013780
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Sep 2013 19:12:01 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 2 Sep 2013 19:11:58 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Sep 2013 10:12:25 +0800
Message-ID: <2d057555b72172740aab9dc3718781381ebcef87.1378174301.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378174301.git.Qi.Chen@windriver.com>
References: <cover.1378174301.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] busybox-syslog: add configuration file /etc/syslog.conf
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
X-List-Received-Date: Tue, 03 Sep 2013 02:11:58 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

By default, busybox has CONFIG_FEATURE_SYSLOGD_CFG enabled, but it
doesn't ship a configuration file.

This patch adds a configuration file (/etc/syslog.conf) to the
busybox-syslog package. This configuration file mainly serves as a
placeholder now.

The advantages of this change are:
1. Make the users aware of the fact that the /etc/syslog.conf file
   will actually be parsed by busybox's syslogd utility. And configuring
   that file will change the logging behaviour.
2. In a systemd based system, this file will prevent the same configuration
   file provided by the sysklogd package from messing things up.

[YOCTO #5066]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc       |    6 +++++-
 meta/recipes-core/busybox/busybox_1.21.1.bb |    1 +
 meta/recipes-core/busybox/files/syslog.conf |    1 +
 3 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/files/syslog.conf

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index b4cf20a..b3d0cd2 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -21,7 +21,7 @@ export EXTRA_LDFLAGS = "${LDFLAGS}"
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
-FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
+FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
 FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf"
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
@@ -233,6 +233,7 @@ do_install () {
 	if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
 		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/syslog.${BPN}
 		install -m 644 ${WORKDIR}/syslog-startup.conf ${D}${sysconfdir}/syslog-startup.conf.${BPN}
+		install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/syslog.conf.${BPN}
 	fi
 	if grep "CONFIG_CROND=y" ${B}/.config; then
 		install -m 0755 ${WORKDIR}/busybox-cron ${D}${sysconfdir}/init.d/
@@ -290,6 +291,9 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "50"
 
+ALTERNATIVE_${PN}-syslog += "syslog-conf"
+ALTERNATIVE_LINK_NAME[syslog-conf] = "${sysconfdir}/syslog.conf"
+
 python () {
     if 'sysvinit' in d.getVar("DISTRO_FEATURES", True).split():
         pn = d.getVar('PN', True)
diff --git a/meta/recipes-core/busybox/busybox_1.21.1.bb b/meta/recipes-core/busybox/busybox_1.21.1.bb
index 784c924..f766bee 100644
--- a/meta/recipes-core/busybox/busybox_1.21.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.21.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://mount.busybox \
            file://syslog \
            file://syslog-startup.conf \
+           file://syslog.conf \
            file://busybox-syslog.default \
            file://mdev \
            file://mdev.conf \
diff --git a/meta/recipes-core/busybox/files/syslog.conf b/meta/recipes-core/busybox/files/syslog.conf
new file mode 100644
index 0000000..75bb630
--- /dev/null
+++ b/meta/recipes-core/busybox/files/syslog.conf
@@ -0,0 +1 @@
+#  /etc/syslog.conf	Configuration file for busybox's syslogd utility
-- 
1.7.9.5


