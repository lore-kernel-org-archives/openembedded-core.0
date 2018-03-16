Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6E457788DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 08:34:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2018 01:34:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,313,1517904000"; d="scan'208";a="42539379"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 16 Mar 2018 01:34:42 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id E55405801CD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 01:34:41 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2018 10:38:10 +0200
Message-Id: <1521189490-28444-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] watchdog: remove interdependencies of watchdog and wd_keepalive
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
X-List-Received-Date: Fri, 16 Mar 2018 08:34:42 -0000

Since watchdog and watchdog-keepalive packages can't be installed
together, move wd_keepalive.service to watchdog-keepalive package.

Remove the inter-dependencies of watchdog and wd_keepalive
services as well.

[YOCTO #12565]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...move-interdependencies-of-watchdog-and-wd.patch | 68 ++++++++++++++++++++++
 meta/recipes-extended/watchdog/watchdog_5.15.bb    |  6 +-
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/watchdog/watchdog/0001-watchdog-remove-interdependencies-of-watchdog-and-wd.patch

diff --git a/meta/recipes-extended/watchdog/watchdog/0001-watchdog-remove-interdependencies-of-watchdog-and-wd.patch b/meta/recipes-extended/watchdog/watchdog/0001-watchdog-remove-interdependencies-of-watchdog-and-wd.patch
new file mode 100644
index 0000000..338e0cd
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog/0001-watchdog-remove-interdependencies-of-watchdog-and-wd.patch
@@ -0,0 +1,68 @@
+From c1fe14fa5bd168292cc4670034bc48b954e9dac7 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Tue, 13 Mar 2018 14:49:55 +0200
+Subject: [PATCH] watchdog: remove interdependencies of watchdog and
+ wd_keepalive services
+
+Since watchdog and watchdog-keepalive packages can't be installed
+together, remove the inter-dependencies of watchdog and wd_keepalive
+services
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ debian/watchdog.service     |  9 +++------
+ debian/wd_keepalive.service | 10 +++++-----
+ 2 files changed, 8 insertions(+), 11 deletions(-)
+
+diff --git a/debian/watchdog.service b/debian/watchdog.service
+index 7a2fc36..f31d1fe 100644
+--- a/debian/watchdog.service
++++ b/debian/watchdog.service
+@@ -1,16 +1,13 @@
+ [Unit]
+ Description=watchdog daemon
+-Conflicts=wd_keepalive.service
+ After=multi-user.target
+-OnFailure=wd_keepalive.service
+ 
+ [Service]
+ Type=forking
+ EnvironmentFile=/etc/default/watchdog
+ ExecStartPre=/bin/sh -c '[ -z "${watchdog_module}" ] || [ "${watchdog_module}" = "none" ] || /sbin/modprobe $watchdog_module'
+-ExecStart=/bin/sh -c '[ $run_watchdog != 1 ] || exec /usr/sbin/watchdog $watchdog_options'
+-ExecStopPost=/bin/sh -c '[ $run_wd_keepalive != 1 ] || false'
++ExecStart=/bin/sh -c '[ x$run_watchdog != x1 ] || exec /usr/sbin/watchdog $watchdog_options'
++PIDFile=/var/run/watchdog.pid
+ 
+ [Install]
+-WantedBy=default.target
+-
++WantedBy=multi-user.target
+diff --git a/debian/wd_keepalive.service b/debian/wd_keepalive.service
+index 45b018e..7f8b1dc 100644
+--- a/debian/wd_keepalive.service
++++ b/debian/wd_keepalive.service
+@@ -1,13 +1,13 @@
+ [Unit]
+ Description=watchdog keepalive daemon
+-Before=watchdog.service shutdown.target
+-Conflicts=watchdog.service shutdown.target
++After=multi-user.target
+ 
+ [Service]
+ Type=forking
+ EnvironmentFile=/etc/default/watchdog
+ ExecStartPre=/bin/sh -c '[ -z "${watchdog_module}" ] || [ "${watchdog_module}" = "none" ] || /sbin/modprobe $watchdog_module'
+-ExecStartPre=-/bin/systemctl reset-failed watchdog.service
+ ExecStart=/usr/sbin/wd_keepalive $watchdog_options
+-ExecStartPost=/bin/sh -c 'ln -s /var/run/wd_keepalive.pid /run/sendsigs.omit.d/wd_keepalive.pid'
+-ExecStopPost=/bin/sh -c 'rm -f /run/sendsigs.omit.d/wd_keepalive.pid'
++PIDFile=/var/run/wd_keepalive.pid
++
++[Install]
++WantedBy=multi-user.target
+-- 
+2.4.0
+
diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
index 3d0b72e..37b37ae 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ecc0551bf54ad97f6b541720f84d6569"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
            file://0001-Include-linux-param.h-for-EXEC_PAGESIZE-definition.patch \
+           file://0001-watchdog-remove-interdependencies-of-watchdog-and-wd.patch \
            file://watchdog-init.patch \
            file://watchdog-conf.patch \
            file://wd_keepalive.init \
@@ -36,7 +37,9 @@ INITSCRIPT_PARAMS_${PN} = "start 15 1 2 3 4 5 . stop 85 0 6 ."
 INITSCRIPT_NAME_${PN}-keepalive = "wd_keepalive"
 INITSCRIPT_PARAMS_${PN}-keepalive = "start 15 1 2 3 4 5 . stop 85 0 6 ."
 
-SYSTEMD_SERVICE_${PN} = "watchdog.service wd_keepalive.service"
+SYSTEMD_PACKAGES = "${PN} ${PN}-keepalive"
+SYSTEMD_SERVICE_${PN} = "watchdog.service"
+SYSTEMD_SERVICE_${PN}-keepalive = "wd_keepalive.service"
 
 do_install_append() {
 	install -d ${D}${systemd_system_unitdir}
@@ -54,6 +57,7 @@ PACKAGES =+ "${PN}-keepalive"
 
 FILES_${PN}-keepalive = " \
     ${sysconfdir}/init.d/wd_keepalive \
+    ${systemd_system_unitdir}/wd_keepalive.service \
     ${sbindir}/wd_keepalive \
 "
 
-- 
2.4.0


