Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5DA5D6D5B3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 05:28:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA95Sxrj015861
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Nov 2013 21:28:59 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 8 Nov 2013 21:28:59 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 9 Nov 2013 13:28:52 +0800
Message-ID: <74d67107ced2e10a00bc2ff9b84d42a7376fabae.1383974819.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383974819.git.Qi.Chen@windriver.com>
References: <cover.1383974819.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] initscripts: add setup-commands.sh
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
X-List-Received-Date: Sat, 09 Nov 2013 05:28:57 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

The purpose of this script is to set up commands that busybox provides
if /usr is missing. In this way, the system can still boot into single
user mode for recovery or repair if the /usr partition is broken.

For normal use case, that is, /usr is on the same partition as /, or
/usr is correctly mounted at boot time, this script has no real effect.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initscripts/initscripts-1.0/setup-commands.sh  |   24 ++++++++++++++++++++
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    3 +++
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/setup-commands.sh

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/setup-commands.sh b/meta/recipes-core/initscripts/initscripts-1.0/setup-commands.sh
new file mode 100644
index 0000000..5133780
--- /dev/null
+++ b/meta/recipes-core/initscripts/initscripts-1.0/setup-commands.sh
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+# set up necessary links to busybox if fundamental command from /usr
+# are not available.
+
+[ -e /etc/default/rcS ] && . /etc/default/rcS
+
+for dir in /usr/bin /usr/sbin; do
+    if [ ! -e $dir ]; then
+	if [ "$VERBOSE" != "no" ]; then
+	    echo "WARN: $dir missing, setting up links to busybox"
+	fi
+	mkdir -p $dir
+	for suffix in ".nosuid" ".suid" ""; do
+	    if [ ! -e /etc/busybox.links${suffix} ]; then
+		continue
+	    fi
+	    usr_commands=`grep "$dir" /etc/busybox.links${suffix}`
+	    for command in $usr_commands; do
+		ln -sf /bin/busybox${suffix} $command
+	    done
+	done
+    fi
+done
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 2d58266..b3c898f 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -33,6 +33,7 @@ SRC_URI = "file://functions \
            file://GPLv2.patch \
            file://dmesg.sh \
            file://logrotate-dmesg.conf \
+           file://setup-commands.sh \
 "
 
 SRC_URI_append_arm = " file://alignment.sh"
@@ -93,6 +94,7 @@ do_install () {
 	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
 	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
+	install -m 0755    ${WORKDIR}/setup-commands.sh	${D}${sysconfdir}/init.d
 
 	if [ "${TARGET_ARCH}" = "arm" ]; then
 		install -m 0755 ${WORKDIR}/alignment.sh	${D}${sysconfdir}/init.d
@@ -123,6 +125,7 @@ do_install () {
 	update-rc.d -r ${D} populate-volatile.sh start 37 S .
 	update-rc.d -r ${D} read-only-rootfs-hook.sh start 29 S .
 	update-rc.d -r ${D} devpts.sh start 38 S .
+	update-rc.d -r ${D} setup-commands.sh start 03 S .
 	if [ "${TARGET_ARCH}" = "arm" ]; then
 	        update-rc.d -r ${D} alignment.sh start 06 S .
 	fi
-- 
1.7.9.5


