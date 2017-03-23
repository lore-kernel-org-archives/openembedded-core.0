Return-Path: <romain.perier@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id E76C771D31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 14:52:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: rperier) with ESMTPSA id 82EE82660AD
From: Romain Perier <romain.perier@collabora.com>
To: liezhi.yang@windriver.com
Date: Thu, 23 Mar 2017 15:52:20 +0100
Message-Id: <20170323145220.1287-1-romain.perier@collabora.com>
X-Mailer: git-send-email 2.9.3
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH RESEND] logrotate: Add systemd support
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
X-List-Received-Date: Thu, 23 Mar 2017 14:52:29 -0000

Currently, this recipe only supports daily scheduling via a cron job.
This commit adds support for systemd, including systemd service and
systemd timer. When the corresponding distro feature is enabled the
systemd timer will be used instead of the cron job.

Signed-off-by: Romain Perier <romain.perier@collabora.com>
---

Note: I was not registered on the yocto and oe ML, I subscribed. So
I resend for this reason (my bad).

 .../logrotate/logrotate/logrotate.service          |  9 +++++++++
 .../logrotate/logrotate/logrotate.timer            |  7 +++++++
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb | 22 ++++++++++++++++++++--
 3 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/logrotate/logrotate/logrotate.service
 create mode 100644 meta/recipes-extended/logrotate/logrotate/logrotate.timer

diff --git a/meta/recipes-extended/logrotate/logrotate/logrotate.service b/meta/recipes-extended/logrotate/logrotate/logrotate.service
new file mode 100644
index 0000000..3edb8ef
--- /dev/null
+++ b/meta/recipes-extended/logrotate/logrotate/logrotate.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Rotate log files
+
+[Service]
+Type=oneshot
+ExecStart=/usr/sbin/logrotate /etc/logrotate.conf
+Nice=19
+IOSchedulingClass=best-effort
+IOSchedulingPriority=7
diff --git a/meta/recipes-extended/logrotate/logrotate/logrotate.timer b/meta/recipes-extended/logrotate/logrotate/logrotate.timer
new file mode 100644
index 0000000..a92ba1e
--- /dev/null
+++ b/meta/recipes-extended/logrotate/logrotate/logrotate.timer
@@ -0,0 +1,7 @@
+[Unit]
+Description=Daily rotation of log files
+
+[Timer]
+OnCalendar=daily
+AccuracySec=12h
+Persistent=true
diff --git a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
index 5f1a601..734d661 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
@@ -14,6 +14,8 @@ SRC_URI = "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.g
            file://act-as-mv-when-rotate.patch \
            file://update-the-manual.patch \
            file://disable-check-different-filesystems.patch \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'file://logrotate.service', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'file://logrotate.timer', '', d)} \
             "
 
 SRC_URI[md5sum] = "4492b145b6d542e4a2f41e77fa199ab0"
@@ -47,6 +49,14 @@ EXTRA_OEMAKE = "\
 # INSTALL=install and BASEDIR=/usr.
 OS_NAME = "Linux"
 
+inherit systemd
+
+SYSTEMD_AUTO_ENABLE = "disable"
+SYSTEMD_SERVICE_${PN} = "\
+    ${PN}.service \
+    ${PN}.timer \
+"
+
 do_compile_prepend() {
     # Make sure the recompile is OK
     rm -f ${B}/.depend
@@ -55,9 +65,17 @@ do_compile_prepend() {
 do_install(){
     oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
     mkdir -p ${D}${sysconfdir}/logrotate.d
-    mkdir -p ${D}${sysconfdir}/cron.daily
     mkdir -p ${D}${localstatedir}/lib
     install -p -m 644 examples/logrotate-default ${D}${sysconfdir}/logrotate.conf
-    install -p -m 755 examples/logrotate.cron ${D}${sysconfdir}/cron.daily/logrotate
     touch ${D}${localstatedir}/lib/logrotate.status
+
+    # Install systemd unit files
+    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}" = "systemd" ]; then
+        install -d ${D}/${systemd_system_unitdir}
+        install -m 0644 ${WORKDIR}/logrotate.service ${D}/${systemd_system_unitdir}/logrotate.service
+        install -m 0644 ${WORKDIR}/logrotate.timer ${D}/${systemd_system_unitdir}/logrotate.timer
+    else
+        mkdir -p ${D}${sysconfdir}/cron.daily
+        install -p -m 0755 examples/logrotate.cron ${D}${sysconfdir}/cron.daily/logrotate
+    fi
 }
-- 
1.8.3.1


