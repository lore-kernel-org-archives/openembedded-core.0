Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.25574.1590376002525159906
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2020 20:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 04P36fMx001060
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 24 May 2020 20:06:41 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Sun, 24 May 2020
 20:06:28 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] initramfs-framework/udev: umount /run/media/XXX
Date: Mon, 25 May 2020 11:06:22 +0800
Message-ID: <20200525030622.28426-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

In initramfs-framework, before swith_root rootfs, if udev have time to
run (before being killed), it will invoke hook mount.sh (which is provided
by udev-extraconf) to mount /run/media/XXX.

Release the mounted disk after udev being killed.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/udev | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
index 4898b89246..8b62080c68 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
@@ -8,6 +8,11 @@ udev_shutdown_hook_handler() {
 	if [ "$status" = "pre" ] && [ "$module" = "finish" ]; then
 		udevadm settle
 		killall `basename $_UDEV_DAEMON` 2>/dev/null
+
+		# Umount other media which is mounted by udev
+		for dir in `awk '/\/dev.* \/run\/media/{print $2}' /proc/mounts`; do
+			umount $dir
+		done
 	fi
 }
 
-- 
2.18.2

