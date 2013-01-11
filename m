Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TtWC1-000512-Dw
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 05:26:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0B4AtVX025380
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 20:10:55 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 10 Jan 2013 20:10:53 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Jan 2013 12:11:18 +0800
Message-ID: <7ffead0b32913021f84520c042dc40e1a5738b27.1357875161.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1357875161.git.Qi.Chen@windriver.com>
References: <cover.1357875161.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] initscripts: remove finish.sh
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
X-List-Received-Date: Fri, 11 Jan 2013 04:26:17 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Remove finish.sh from initscripts as it is no longer used.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initscripts/initscripts-1.0/finish.sh          |   14 --------------
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    7 ++-----
 2 files changed, 2 insertions(+), 19 deletions(-)
 delete mode 100755 meta/recipes-core/initscripts/initscripts-1.0/finish.sh

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/finish.sh b/meta/recipes-core/initscripts/initscripts-1.0/finish.sh
deleted file mode 100755
index 183a384..0000000
--- a/meta/recipes-core/initscripts/initscripts-1.0/finish.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/bin/sh
-### BEGIN INIT INFO
-# Provides:          finish.sh
-# Required-Start:    $remote_fs rmnologin
-# Required-Stop:
-# Default-Start:     2 3 4 5
-# Default-Stop:
-# Short-Description: Finish system start
-# Description:       
-### END INIT INFO
-
-if ! test -e /etc/.configured; then
-	> /etc/.configured
-fi
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 39be9a8..6e15f88 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r138"
+PR = "r139"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -15,7 +15,6 @@ SRC_URI = "file://functions \
            file://hostname.sh \
            file://mountall.sh \
            file://banner.sh \
-           file://finish.sh \
            file://bootmisc.sh \
            file://mountnfs.sh \
            file://reboot \
@@ -31,7 +30,7 @@ SRC_URI = "file://functions \
            file://populate-volatile.sh \
            file://volatiles \
            file://save-rtc.sh \
-	   file://GPLv2.patch"
+           file://GPLv2.patch"
 
 SRC_URI_append_arm = " file://alignment.sh"
 
@@ -69,7 +68,6 @@ do_install () {
 	install -m 0644    ${WORKDIR}/functions		${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/bootmisc.sh	${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/checkroot.sh	${D}${sysconfdir}/init.d
-#	install -m 0755    ${WORKDIR}/finish.sh		${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/halt		${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/hostname.sh	${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/mountall.sh	${D}${sysconfdir}/init.d
@@ -123,7 +121,6 @@ do_install () {
 	ln -sf		../init.d/mountnfs.sh	${D}${sysconfdir}/rcS.d/S45mountnfs.sh
 	ln -sf		../init.d/bootmisc.sh	${D}${sysconfdir}/rcS.d/S55bootmisc.sh
 #	ln -sf		../init.d/urandom	${D}${sysconfdir}/rcS.d/S55urandom
-#	ln -sf		../init.d/finish.sh	${D}${sysconfdir}/rcS.d/S99finish.sh
 	ln -sf		../init.d/sysfs.sh	${D}${sysconfdir}/rcS.d/S02sysfs.sh
 	# udev will run at S03 if installed
 	ln -sf		../init.d/populate-volatile.sh	${D}${sysconfdir}/rcS.d/S37populate-volatile.sh
-- 
1.7.9.5



