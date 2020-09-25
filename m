Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.2138.1601017557806305749
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 00:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08P75bmm012680
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Fri, 25 Sep 2020 00:05:37 -0700 (PDT)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 25 Sep 2020
 00:05:36 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [oe-core][PATCH 1/4] initramfs-framework/udev: umount /run/media/XXX
Date: Fri, 25 Sep 2020 00:05:32 -0700
Message-ID: <20200925070535.59518-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200925070535.59518-1-hongxu.jia@windriver.com>
References: <20200925070535.59518-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In initramfs-framework, udev (initramfs-module-udev) calls hook mount.sh to
mount /run/media/XXX which is used by setup-live (initramfs-module-setup-live).
The setup-live calls install-XXX.sh and use /run/media/XXX to do installation

The side effect is while setup-live is not used, after it switches to rootfs,
and the mounted disk could not be released

Release the mounted disk before switch root and after kill udev

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
2.21.0

