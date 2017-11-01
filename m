Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B1ED78220
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 06:04:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA1648xl026447
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 23:04:08 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 31 Oct 2017 23:04:08 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Oct 2017 23:04:04 -0700
Message-ID: <ba38a925299ad32664c35b90486f5c9e97ed64c5.1509516068.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1509516068.git.wenzong.fan@windriver.com>
References: <cover.1509516068.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] initscripts: disable mountall.sh for busybox init
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
X-List-Received-Date: Wed, 01 Nov 2017 06:04:07 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Disable 'mountall.sh' to avoid system halt while the init manager is
set as 'busybox'.

In busybox init, the 'SIGUSR1' was handled as 'halt', calling to the
'mountall.sh' would trigger the signal with:
  + kill -USR1 1

This works fine for sysvinit but will fail with the busybox init.

As a replacement, busybox provides 'inittab' to mount all of those:
  ::sysinit:/bin/mount -t proc proc /proc
  ::sysinit:/bin/mount -t sysfs sysfs /sys
  ::sysinit:/bin/mount -t devtmpfs devtmpfs /dev
  ::sysinit:/bin/mount -o remount,rw /
  ::sysinit:/bin/mkdir -p /dev/pts
  ::sysinit:/bin/mount -t devpts devpts /dev/pts
  ::sysinit:/bin/mount -a

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index fea4f22e95..9a79858a87 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -8,13 +8,13 @@ PR = "r155"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
+MOUNTALL_SH = "${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager','busybox','','file://mountall.sh',d)}"
 SRC_URI = "file://functions \
            file://halt \
            file://umountfs \
            file://devpts.sh \
            file://devpts \
            file://hostname.sh \
-           file://mountall.sh \
            file://banner.sh \
            file://bootmisc.sh \
            file://mountnfs.sh \
@@ -35,6 +35,7 @@ SRC_URI = "file://functions \
            file://dmesg.sh \
            file://logrotate-dmesg.conf \
            ${@bb.utils.contains('DISTRO_FEATURES','selinux','file://sushell','',d)} \
+           ${MOUNTALL_SH} \
 "
 
 S = "${WORKDIR}"
@@ -88,7 +89,9 @@ do_install () {
 	install -m 0755    ${WORKDIR}/checkroot.sh	${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/halt		${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/hostname.sh	${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/mountall.sh	${D}${sysconfdir}/init.d
+	if [ -n "${MOUNTALL_SH}" ]; then
+		install -m 0755    ${WORKDIR}/mountall.sh	${D}${sysconfdir}/init.d
+	fi
 	install -m 0755    ${WORKDIR}/mountnfs.sh	${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/reboot		${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/rmnologin.sh	${D}${sysconfdir}/init.d
@@ -136,7 +139,9 @@ do_install () {
 	update-rc.d -r ${D} save-rtc.sh start 25 0 6 .
 	update-rc.d -r ${D} banner.sh start 02 S .
 	update-rc.d -r ${D} checkroot.sh start 06 S .
-	update-rc.d -r ${D} mountall.sh start 03 S .
+	if [ -n "${MOUNTALL_SH}" ]; then
+		update-rc.d -r ${D} mountall.sh start 03 S .
+	fi
 	update-rc.d -r ${D} hostname.sh start 39 S .
 	update-rc.d -r ${D} mountnfs.sh start 15 2 3 4 5 .
 	update-rc.d -r ${D} bootmisc.sh start 36 S .
-- 
2.11.0


