Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.6223.1590587066457775422
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 06:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04RDhmde020611
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 27 May 2020 06:43:58 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Wed, 27 May 2020
 06:43:25 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH] initramfs-framework/udev: remove mount.sh to avoid /run/media/XXX
Date: Wed, 27 May 2020 21:43:24 +0800
Message-ID: <20200527134324.23121-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

The udev invokes script hook mount.sh to mount /run/media/XXX. In
initramfs-framework, if udev was not killed in time, the partition
will be mounted to /run/media/XXX before switch_root.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/udev | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
index 8b62080c68..3c4dd0ec9b 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
@@ -49,6 +49,9 @@ udev_run() {
 	# Workaround if console=null, systemd-udevd needs valid stdin, stdout and stderr to work
 	sh -c "exec 4< /dev/console" || { exec 0> /dev/null; exec 1> /dev/null; exec 2> /dev/null; }
 
+	# Avoid /run/media/XXX was mounted by udev
+	rm -f /etc/udev/scripts/mount.sh
+
 	$_UDEV_DAEMON --daemon
 	udevadm trigger --action=add
 	udevadm settle
-- 
2.18.2

