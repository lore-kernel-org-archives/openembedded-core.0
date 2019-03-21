Return-Path: <Liwei.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D73A87CE33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 03:21:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2L3L9Nj013063
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 20:21:19 -0700
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 20 Mar 2019 20:20:55 -0700
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Mar 2019 23:19:12 -0400
Message-ID: <1553138356-85237-5-git-send-email-liwei.song@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553138356-85237-1-git-send-email-liwei.song@windriver.com>
References: <1553138356-85237-1-git-send-email-liwei.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] initramfs-framework: mount efivarfs to make Intel VROC work well
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
X-List-Received-Date: Thu, 21 Mar 2019 03:21:28 -0000
Content-Type: text/plain

efivafs contain some meta data about Intel VROC, which will be
used by mdadm to create raid device.

These are preparation work to support boot from Intel VROC RAID
disk.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/init | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index 3c7e09422de2..c71ce0ce8cce 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -72,6 +72,7 @@ ROOTFS_DIR="/rootfs" # where to do the switch root
 MODULE_PRE_HOOKS=""  # functions to call before running each module
 MODULE_POST_HOOKS="" # functions to call after running each module
 MODULES_DIR=/init.d  # place to look for modules
+EFI_DIR=/sys/firmware/efi  # place to store device firmware information
 
 # make mount stop complaining about missing /etc/fstab
 touch /etc/fstab
@@ -81,6 +82,10 @@ mkdir -p /proc /sys /run/lock /var/lock
 mount -t proc proc /proc
 mount -t sysfs sysfs /sys
 
+if [ -d $EFI_DIR ];then
+	mount -t efivarfs none /sys/firmware/efi/efivars
+fi
+
 # populate bootparam environment
 for p in `cat /proc/cmdline`; do
 	opt=`echo $p | cut -d'=' -f1`
-- 
2.7.4


