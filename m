Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 535C07E512
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 05:04:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6154ti7005231
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 22:04:55 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 30 Jun 2019 22:04:54 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Jul 2019 13:04:53 +0800
Message-ID: <1561957493-6119-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] mdam: fix mdmonitor start up failure
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
X-List-Received-Date: Mon, 01 Jul 2019 05:04:54 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

1. recently, mdadm has changed to use service file under srcdir,
   so remove the one not be used.
2. add -y option to fix below problem
   mdadm: No mail address or alert command - not monitoring

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ption-y-for-use-syslog-to-recive-event-re.patch | 28 ++++++++++++++++++++++
 .../recipes-extended/mdadm/files/mdmonitor.service | 20 ----------------
 meta/recipes-extended/mdadm/mdadm_4.1.bb           |  3 +--
 3 files changed, 29 insertions(+), 22 deletions(-)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/mdmonitor.service

diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch b/meta/recipes-extended/mdadm/files/0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch
new file mode 100644
index 0000000..e00287c
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch
@@ -0,0 +1,28 @@
+From 5fdc0173cb4fcf8656f0889ad364d2549795607f Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 1 Jul 2019 11:34:49 +0800
+Subject: [PATCH] mdadm: add option -y for use syslog to recive event report
+
+fix service startup failed when there is
+No mail address or alert command
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ systemd/mdmonitor.service | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/systemd/mdmonitor.service b/systemd/mdmonitor.service
+index 46f7b88..3fc4687 100644
+--- a/systemd/mdmonitor.service
++++ b/systemd/mdmonitor.service
+@@ -13,4 +13,4 @@ DefaultDependencies=no
+ Environment=  MDADM_MONITOR_ARGS=--scan
+ EnvironmentFile=-/run/sysconfig/mdadm
+ ExecStartPre=-/usr/lib/mdadm/mdadm_env.sh
+-ExecStart=BINDIR/mdadm --monitor $MDADM_MONITOR_ARGS
++ExecStart=BINDIR/mdadm --monitor -y $MDADM_MONITOR_ARGS
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/mdadm/files/mdmonitor.service b/meta/recipes-extended/mdadm/files/mdmonitor.service
deleted file mode 100644
index a81578e..0000000
--- a/meta/recipes-extended/mdadm/files/mdmonitor.service
+++ /dev/null
@@ -1,20 +0,0 @@
-#  This file is part of mdadm.
-#
-#  mdadm is free software; you can redistribute it and/or modify it
-#  under the terms of the GNU General Public License as published by
-#  the Free Software Foundation; either version 2 of the License, or
-#  (at your option) any later version.
-
-[Unit]
-Description=Software RAID monitoring and management
-ConditionPathExists=/etc/mdadm.conf
-
-[Service]
-Type=forking
-PIDFile=/var/run/mdadm/mdadm.pid
-EnvironmentFile=-/etc/sysconfig/mdmonitor
-ExecStartPre=mkdir -p /var/run/mdadm
-ExecStart=/sbin/mdadm --monitor -y --scan -f --pid-file=/var/run/mdadm/mdadm.pid
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 494b81b..766004f 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-fix-gcc-8-format-truncation-warning.patch \
            file://debian-no-Werror.patch \
 	   file://mdadm.init \
-	   file://mdmonitor.service \
+	   file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
            "
 SRC_URI[md5sum] = "51bf3651bd73a06c413a2f964f299598"
 SRC_URI[sha256sum] = "ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1934f4a"
@@ -65,7 +65,6 @@ do_install_append() {
         oe_runmake install-systemd DESTDIR=${D}
 }
 
-
 do_compile_ptest() {
 	oe_runmake test
 }
-- 
2.7.4


