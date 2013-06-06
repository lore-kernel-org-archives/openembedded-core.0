Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CBAC36A60F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 06:31:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r566VMQC009867
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Jun 2013 23:31:22 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.146) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 5 Jun 2013 23:31:21 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Jun 2013 14:31:17 +0800
Message-ID: <da30ef6b6b7439554a46d3500e751444f04e8a78.1370499356.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370499356.git.hongxu.jia@windriver.com>
References: <cover.1370499356.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] init-live.sh: fix media automount failed after booting from usb-drive
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
X-List-Received-Date: Thu, 06 Jun 2013 06:31:21 -0000
Content-Type: text/plain

1, This issue happens to BSP only.
After a BSP board is booted with Yocto linux from USB drive, "cat /proc/mounts" shows:
...
/dev/sda3 /media/sda3 ext3 rw,relatime,errors=continue,user_xattr,acl,barrier=1,data=ordered 0 0
/dev/sda1 /media/sda1 ext3 rw,relatime,errors=continue,barrier=1,data=ordered 0 0
/dev/sda2 /media/sda2 ext3 rw,relatime,errors=continue,user_xattr,acl,barrier=1,data=ordered 0 0
...

but actually the directory /media/sda1 doesn't exist at all, "df" shows:
...
df: /media/sda3: No such file or directory
df: /media/sda1: No such file or directory
df: /media/sda2: No such file or directory
...

2, This is because the mount data comes from proc setup during early boot
before the change root, which then uses a different root filesystem, the
media is not in the new root filesystem.

3, During early boot before switch_root, use `mount --move' to move all
medias to the new root filesystem could also fix this issue.

[YOCTO #2064]
[YOCTO #3705]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 4bd1b52..804e16e 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -79,11 +79,13 @@ boot_live_root() {
 
     # Move the mount points of some filesystems over to
     # the corresponding directories under the real root filesystem.
+    for dir in `awk '/\/dev.* \/media/{print $2}' /proc/mounts`; do
+        mkdir -p  ${ROOT_MOUNT}/$dir
+        mount -n --move $dir ${ROOT_MOUNT}/$dir
+    done
     mount -n --move /proc ${ROOT_MOUNT}/proc
     mount -n --move /sys ${ROOT_MOUNT}/sys
     mount -n --move /dev ${ROOT_MOUNT}/dev
-    # Move /media/$i over to the real root filesystem
-    mount -n --move /media/$i ${ROOT_MOUNT}/media/realroot
 
     cd $ROOT_MOUNT
     exec switch_root -c /dev/console $ROOT_MOUNT /sbin/init
-- 
1.7.10.4


