Return-Path: <Muhammad_Hamza@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF416C433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 13:54:27 +0000 (UTC)
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 by mx.groups.io with SMTP id smtpd.web09.30626.1655733259117955631
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 06:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mentor.com, ip: 68.232.141.98, mailfrom: muhammad_hamza@mentor.com)
X-IronPort-AV: E=Sophos;i="5.92,306,1650960000";
   d="scan'208";a="77539688"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 20 Jun 2022 05:54:18 -0800
IronPort-SDR: 
 oS3/EOdgL7Nbgzj556tLLOySg5BYrwjPHEis3dUfjw7eaAIcE1w/tv/p3SErv7cmt0kbNuB3qo
 jbehe4lzokeeOXCMQypMnTcQdkUP0no1nNzpopiXk3FXJPCwOSggRC8inYm+lBdaXKmwSvGSpJ
 FfhZJW2BvttUkp/AYe+In1UQXi9IP/DQSPWztfhwVyewpFI5c6Qn8Zv6Gp9hJf2fgwWHgJJ3Ip
 NPpMPFV5iYDwDoD3b4f+zKB1AHya44pNcDc4IbRY/Jf6VsjXm4SR3qk0+hdWXnjOREh5zS9CMC
 Zdg=
From: Muhammad Hamza <muhammad_hamza@mentor.com>
To: <openembedded-core@lists.openembedded.org>
CC: Muhammad Hamza <muhammad_hamza@mentor.com>, Awais Belal
	<awais_belal@mentor.com>
Subject: [PATCH] udev-extraconf: force systemd-udevd to use shared MountFlags
Date: Mon, 20 Jun 2022 18:52:58 +0500
Message-ID: <20220620135256.307498-1-muhammad_hamza@mentor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 13:54:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167109

Automounting does not work cleanly in case systemd as well as
udev rules are being used simultaneously and in most cases
race conditions and unknown behavior can come up.
In case we're running on top of systemd we need to make sure
that systemd-udevd knows that udev is in play as well and
mounting should be done using shared flags. Also as we're
using mount from sources other than systemd-mount in current
scripts this is the most manageable fix to automounting
problems.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
---
 .../udev/udev-extraconf/systemd-udevd.service            | 3 +++
 meta/recipes-core/udev/udev-extraconf_1.1.bb             | 9 ++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/udev/udev-extraconf/systemd-udevd.service

diff --git a/meta/recipes-core/udev/udev-extraconf/systemd-udevd.service b/meta/recipes-core/udev/udev-extraconf/systemd-udevd.service
new file mode 100644
index 0000000000..a9b86eb6e4
--- /dev/null
+++ b/meta/recipes-core/udev/udev-extraconf/systemd-udevd.service
@@ -0,0 +1,3 @@
+.include @systemd_unitdir@/system/systemd-udevd.service
+[Service]
+MountFlags=shared
diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index 8213c1a930..ef6019259e 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -11,6 +11,7 @@ SRC_URI = " \
        file://autonet.rules \
        file://network.sh \
        file://localextra.rules \
+       ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'file://systemd-udevd.service', '', d)} \
 "
 
 S = "${WORKDIR}"
@@ -35,9 +36,15 @@ do_install() {
     sed -i 's|@MOUNT_BASE@|${MOUNT_BASE}|g' ${D}${sysconfdir}/udev/scripts/mount.sh
 
     install -m 0755 ${WORKDIR}/network.sh ${D}${sysconfdir}/udev/scripts
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/systemd/system
+        install ${WORKDIR}/systemd-udevd.service ${D}${sysconfdir}/systemd/system/systemd-udevd.service
+        sed -i 's|@systemd_unitdir@|${systemd_unitdir}|g' ${D}${sysconfdir}/systemd/system/systemd-udevd.service
+    fi
 }
 
-FILES:${PN} = "${sysconfdir}/udev"
+FILES:${PN} = "${sysconfdir}/udev ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${sysconfdir}/systemd/system/systemd-udevd.service', '', d)}"
 RDEPENDS:${PN} = "udev util-linux-blkid"
 CONFFILES:${PN} = "${sysconfdir}/udev/mount.ignorelist"
 
-- 
2.25.1


