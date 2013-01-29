Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U04kj-0002RF-Ca
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 07:33:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0T6HOu0020780
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 22:17:24 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 28 Jan 2013 22:17:23 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Jan 2013 14:17:45 +0800
Message-ID: <eca94e550e201c8dba211c4a9a547761c9e7737f.1359433618.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1359433618.git.Qi.Chen@windriver.com>
References: <cover.1359433618.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH V2 6/6] initscripts: add read-only-rootfs-hook.sh script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 06:33:34 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add read-only-rootfs-hook.sh script to support a read-only rootfs.
This script makes a union mount of /var/lib and /var/volatile/lib,
making /var/lib directory writable.

[YOCTO #3406]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initscripts-1.0/read-only-rootfs-hook.sh       |   19 +++++++++++++++++++
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    3 +++
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
new file mode 100644
index 0000000..3a295ee
--- /dev/null
+++ b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+. /etc/default/rcS
+
+[ "$ROOTFS_READ_ONLY" = "no" ] && exit 0
+
+# Make sure unionfs is in /proc/filesystems
+if ! grep -q unionfs /proc/filesystems; then
+    echo "ERROR: unionfs not supported by kernel!"
+    exit 1
+fi
+
+mkdir -p /var/volatile/lib
+mount -t unionfs -o dirs=/var/volatile/lib:/var/lib=ro none /var/lib
+
+if [ $? != 0 ]; then
+    echo "ERROR: Union mount failed!"
+    exit 1
+fi
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 69b9bfb..68f8034 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -28,6 +28,7 @@ SRC_URI = "file://functions \
            file://sysfs.sh \
            file://device_table.txt \
            file://populate-volatile.sh \
+           file://read-only-rootfs-hook.sh \
            file://volatiles \
            file://save-rtc.sh \
            file://GPLv2.patch"
@@ -85,6 +86,7 @@ do_install () {
 	install -m 0755    ${WORKDIR}/devpts		${D}${sysconfdir}/default
 	install -m 0755    ${WORKDIR}/sysfs.sh		${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/populate-volatile.sh ${D}${sysconfdir}/init.d
+	install -m 0755    ${WORKDIR}/read-only-rootfs-hook.sh ${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/save-rtc.sh	${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
 
@@ -116,6 +118,7 @@ do_install () {
 	update-rc.d -r ${D} bootmisc.sh start 55 S .
 	update-rc.d -r ${D} sysfs.sh start 02 S .
 	update-rc.d -r ${D} populate-volatile.sh start 37 S .
+	update-rc.d -r ${D} read-only-rootfs-hook.sh start 41 S .
 	update-rc.d -r ${D} devpts.sh start 38 S .
 	if [ "${TARGET_ARCH}" = "arm" ]; then
 	        update-rc.d -r ${D} alignment.sh start 06 S .
-- 
1.7.9.5



