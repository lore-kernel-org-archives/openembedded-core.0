Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BC91F71975
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 21:41:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uB9LfTxk001190
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Dec 2016 13:41:29 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 9 Dec 2016 13:41:29 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Dec 2016 16:41:27 -0500
Message-ID: <1481319687-19818-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] sysklogd: do more to properly work with systemd
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
X-List-Received-Date: Fri, 09 Dec 2016 21:41:29 -0000
Content-Type: text/plain

It was noticed that syslogd and klogd were no longer running on system
startup, meaning no /var/log/messages etc.. It appears as though
sysklogd has never been updated to follow the expected logging
requirement for systemd as described here:
https://www.freedesktop.org/wiki/Software/systemd/syslog/

As such no service was started and no logging present. Using the above
guidelines we create two new service files syslogd.service and
klogd.service. We make use of tmpfiles.d in order to ensure the
xconsole device node exists and do other minor recipe cleanup to
ensure peaceful coexistence with sysvinit and systemd implementations.

The systemd documentation also asks that for a logger which is not
rsyslog that we also enable 'ForwardToSyslog=' in journald.conf, but
this is already the case so no action is required.

With this change in place syslogd and klogd are started at system
startup and the expected logs are available.

Unfortunately I was not able to find any work done on this upstream or
in other distros so this is my best effort at making this work.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta/recipes-extended/sysklogd/files/klogd.service    | 13 +++++++++++++
 meta/recipes-extended/sysklogd/files/syslogd.service  | 14 ++++++++++++++
 .../sysklogd/files/tmpfiles.sysklogd.conf             |  1 +
 meta/recipes-extended/sysklogd/sysklogd.inc           | 19 +++++++++++++++++--
 4 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/sysklogd/files/klogd.service
 create mode 100644 meta/recipes-extended/sysklogd/files/syslogd.service
 create mode 100644 meta/recipes-extended/sysklogd/files/tmpfiles.sysklogd.conf

diff --git a/meta/recipes-extended/sysklogd/files/klogd.service b/meta/recipes-extended/sysklogd/files/klogd.service
new file mode 100644
index 0000000..0c888c4
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/klogd.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Kernel Logging Service
+After=syslogd.service
+
+[Service]
+Type=forking
+ExecStart=/sbin/klogd
+PIDFile=/var/run/klogd.pid
+StandardOutput=null
+Restart=on-failure
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/sysklogd/files/syslogd.service b/meta/recipes-extended/sysklogd/files/syslogd.service
new file mode 100644
index 0000000..eeaff3d
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/syslogd.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=System Logging Service
+Requires=syslog.socket
+
+[Service]
+Type=forking
+ExecStart=/sbin/syslogd
+PIDFile=/var/run/syslogd.pid
+StandardOutput=null
+Restart=on-failure
+
+[Install]
+WantedBy=multi-user.target
+Alias=syslog.service
diff --git a/meta/recipes-extended/sysklogd/files/tmpfiles.sysklogd.conf b/meta/recipes-extended/sysklogd/files/tmpfiles.sysklogd.conf
new file mode 100644
index 0000000..f4aecd3
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/tmpfiles.sysklogd.conf
@@ -0,0 +1 @@
+p /dev/xconsole 0640 root adm
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 5c15ffe..092b922 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -11,17 +11,24 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://klogd.c;beginline=2;endline=19;md5=7e87ed0ae6142de079bce738c10c899d \
                    "
 
-inherit update-rc.d update-alternatives
+inherit update-rc.d update-alternatives systemd
 
 SRC_URI = "http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar.gz \
            file://no-strip-install.patch \
            file://0001-Fix-build-with-musl.patch \
            file://sysklogd \
            file://syslog.conf \
+           file://syslogd.service \
+           file://klogd.service \
+           file://tmpfiles.sysklogd.conf \
            "
 
 SRC_URI_append_e500v2 = " file://no-vectorization.patch"
 
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "syslogd.service klogd.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
 INITSCRIPT_NAME = "syslog"
 CONFFILES_${PN} = "${sysconfdir}/syslog.conf.${BPN}"
 
@@ -39,13 +46,21 @@ do_install () {
 	install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/syslog.conf
 	install -d ${D}${sysconfdir}/init.d
 	install -m 755 ${WORKDIR}/sysklogd ${D}${sysconfdir}/init.d/syslog
+	install -d ${D}${systemd_unitdir}/system
+	install -m 644 ${WORKDIR}/syslogd.service ${D}${systemd_unitdir}/system
+	install -m 644 ${WORKDIR}/klogd.service ${D}${systemd_unitdir}/system
+	install -d ${D}${exec_prefix}/lib/tmpfiles.d
+	install -m 644 ${WORKDIR}/tmpfiles.sysklogd.conf ${D}${exec_prefix}/lib/tmpfiles.d/sysklogd.conf
 }
 
+FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/sysklogd.conf', '', d)}"
+
 # sysklogd package has no internal systemd support, so we weigh busybox's
 # sysklogd utility over it in case of systemd
 ALTERNATIVE_PRIORITY = "${@bb.utils.contains('DISTRO_FEATURES','systemd','10','100',d)}"
 
-ALTERNATIVE_${PN} = "syslogd klogd syslog-init syslog-conf"
+ALTERNATIVE_${PN} = "syslogd klogd syslog-conf \
+    ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','syslog-init','',d)}"
 
 ALTERNATIVE_LINK_NAME[syslogd] = "${base_sbindir}/syslogd"
 ALTERNATIVE_LINK_NAME[klogd] = "${base_sbindir}/klogd"
-- 
2.7.4


