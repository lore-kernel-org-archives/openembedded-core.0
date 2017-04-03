Return-Path: <romain.perier@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD3F65CC7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 07:13:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: rperier) with ESMTPSA id D7C63260FD4
From: Romain Perier <romain.perier@collabora.com>
To: Qi.Chen@windriver.com
Date: Mon,  3 Apr 2017 09:13:46 +0200
Message-Id: <20170403071346.9980-1-romain.perier@collabora.com>
X-Mailer: git-send-email 2.9.3
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH v2] busybox: make SYSLOGD optionnal
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
X-List-Received-Date: Mon, 03 Apr 2017 07:13:53 -0000

Some distros might choose another syslogd provider like rsyslogd.
update-alternative will update the link from syslogd to the right
provider. However the syslogd feature is still present and enabled
in busybox.

This commit adds a new configuration fragment to make syslogd
optionnal in busybox.

Signed-off-by: Romain Perier <romain.perier@collabora.com>
---

Changes in v2:
- Rebased onto master branch (thanks to patchwork)

 meta/recipes-core/busybox/busybox.inc        |  6 +++---
 meta/recipes-core/busybox/busybox/defconfig  | 20 +++++++++-----------
 meta/recipes-core/busybox/busybox/syslog.cfg | 11 +++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb  |  1 +
 meta/recipes-core/busybox/busybox_git.bb     |  1 +
 5 files changed, 25 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/syslog.cfg

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 6246c95..4c5c98a 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -40,7 +40,7 @@ INITSCRIPT_NAME_${PN}-syslog = "syslog"
 INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
 
 SYSTEMD_PACKAGES = "${PN}-syslog"
-SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
+SYSTEMD_SERVICE_${PN}-syslog = "${@bb.utils.contains('SRC_URI', 'file://syslog.cfg', 'busybox-syslog.service', '', d)}"
 
 CONFFILES_${PN}-syslog = "${sysconfdir}/syslog-startup.conf.${BPN}"
 CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
@@ -330,8 +330,8 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "50"
 
-ALTERNATIVE_${PN}-syslog += "syslog-conf"
-ALTERNATIVE_LINK_NAME[syslog-conf] = "${sysconfdir}/syslog.conf"
+ALTERNATIVE_${PN}-syslog += "${@bb.utils.contains('SRC_URI', 'file://syslog.cfg', 'syslog-conf', '', d)}"
+ALTERNATIVE_LINK_NAME[syslog-conf] = "${@bb.utils.contains('SRC_URI', 'file://syslog.cfg', "${sysconfdir}/syslog.conf", '', d)}"
 
 python () {
     if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index f649738..75bf146 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -1053,17 +1053,15 @@ CONFIG_FEATURE_SH_HISTFILESIZE=y
 #
 # System Logging Utilities
 #
-CONFIG_SYSLOGD=y
-CONFIG_FEATURE_ROTATE_LOGFILE=y
-CONFIG_FEATURE_REMOTE_LOG=y
-CONFIG_FEATURE_SYSLOGD_DUP=y
-CONFIG_FEATURE_SYSLOGD_CFG=y
-CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=256
-CONFIG_FEATURE_IPC_SYSLOG=y
-CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=64
-CONFIG_LOGREAD=y
-CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=y
-CONFIG_FEATURE_KMSG_SYSLOG=y
+# CONFIG_SYSLOGD is not set
+# CONFIG_FEATURE_ROTATE_LOGFILE is not set
+# CONFIG_FEATURE_REMOTE_LOG is not set
+# CONFIG_FEATURE_SYSLOGD_DUP is not set
+# CONFIG_FEATURE_SYSLOGD_CFG is not set
+# CONFIG_FEATURE_IPC_SYSLOG is not set
+# CONFIG_LOGREAD is not set
+# CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING is not set
+# CONFIG_FEATURE_KMSG_SYSLOG is not set
 CONFIG_KLOGD=y
 
 #
diff --git a/meta/recipes-core/busybox/busybox/syslog.cfg b/meta/recipes-core/busybox/busybox/syslog.cfg
new file mode 100644
index 0000000..e2425ed
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/syslog.cfg
@@ -0,0 +1,11 @@
+CONFIG_SYSLOGD=y
+CONFIG_FEATURE_ROTATE_LOGFILE=y
+CONFIG_FEATURE_REMOTE_LOG=y
+CONFIG_FEATURE_SYSLOGD_DUP=y
+CONFIG_FEATURE_SYSLOGD_CFG=y
+CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=256
+CONFIG_FEATURE_IPC_SYSLOG=y
+CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=64
+CONFIG_LOGREAD=y
+CONFIG_FEATURE_LOGREAD_REDUCED_LOCKING=y
+CONFIG_FEATURE_KMSG_SYSLOG=y
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 41fc641..2e3a041 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -40,6 +40,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://resize.cfg \
            ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
            ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 'busybox-mdev')]} \
+           file://syslog.cfg \
            file://inittab \
            file://rcS \
            file://rcK \
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index c2ee3e6..50c4c9d 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -42,6 +42,7 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://resize.cfg \
            ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
            ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 'busybox-mdev')]} \
+           file://syslog.cfg \
            file://inittab \
            file://rcS \
            file://rcK \
-- 
2.9.3


