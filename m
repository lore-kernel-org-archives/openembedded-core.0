Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C807A6AFF8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 10:06:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r64A6PLY019709
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Jul 2013 03:06:25 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 4 Jul 2013 03:06:24 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Jul 2013 18:06:21 +0800
Message-ID: <c9f7ea11b3e0cfdc0a0a4d42bbbe640da6647d9e.1372931983.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1372931983.git.jackie.huang@windriver.com>
References: <cover.1372931983.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] initscripts: add dmesg file to /var/log
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
X-List-Received-Date: Thu, 04 Jul 2013 10:06:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

We should create the /var/log/dmesg.log file as a default.
If we don't then a later kernel error can flush the dmesg
ring buffer, losing valuable debug information.

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../initscripts/initscripts-1.0/dmesg.sh           |   17 +++++++++++++++++
 .../initscripts-1.0/logrotate-dmesg.conf           |    9 +++++++++
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    9 +++++++--
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/dmesg.sh
 create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/logrotate-dmesg.conf

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/dmesg.sh b/meta/recipes-core/initscripts/initscripts-1.0/dmesg.sh
new file mode 100644
index 0000000..a97b068
--- /dev/null
+++ b/meta/recipes-core/initscripts/initscripts-1.0/dmesg.sh
@@ -0,0 +1,17 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:             dmesg
+# Required-Start:
+# Required-Stop:
+# Default-Start:        S
+# Default-Stop:
+### END INIT INFO
+
+if [ -f /var/log/dmesg ]; then
+	if [ -f /usr/sbin/logrotate ]; then
+		logrotate -f /etc/logrotate-dmesg.conf
+	else
+		mv -f /var/log/dmesg /var/log/dmesg.old
+	fi
+fi
+dmesg -s 131072 > /var/log/dmesg
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/logrotate-dmesg.conf b/meta/recipes-core/initscripts/initscripts-1.0/logrotate-dmesg.conf
new file mode 100644
index 0000000..6f46e42
--- /dev/null
+++ b/meta/recipes-core/initscripts/initscripts-1.0/logrotate-dmesg.conf
@@ -0,0 +1,9 @@
+# see "man logrotate" for details
+# rotate dmesg, and keep 5 versions.
+
+/var/log/dmesg {
+	create
+	rotate 5
+	nodateext
+}
+
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 531b2b6..52e1c9c 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r140"
+PR = "r141"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -31,7 +31,10 @@ SRC_URI = "file://functions \
            file://read-only-rootfs-hook.sh \
            file://volatiles \
            file://save-rtc.sh \
-           file://GPLv2.patch"
+           file://GPLv2.patch \
+           file://dmesg.sh \
+           file://logrotate-dmesg.conf \
+"
 
 SRC_URI_append_arm = " file://alignment.sh"
 
@@ -89,6 +92,8 @@ do_install () {
 	install -m 0755    ${WORKDIR}/read-only-rootfs-hook.sh ${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/save-rtc.sh	${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
+	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
+	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
 
 	if [ "${TARGET_ARCH}" = "arm" ]; then
 		install -m 0755 ${WORKDIR}/alignment.sh	${D}${sysconfdir}/init.d
-- 
1.7.4.1


