Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1DEDD6A45E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 10:40:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4FAe3xO011098
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 03:40:04 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 15 May 2014 03:40:03 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 May 2014 18:40:23 +0800
Message-ID: <820c9177f2b22a34602e0b849c79f68a923db3d5.1400150280.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1400150280.git.Qi.Chen@windriver.com>
References: <cover.1400150280.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] udev-extraconf: fix the misuse of /run/media
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
X-List-Received-Date: Thu, 15 May 2014 10:40:05 -0000
Content-Type: text/plain

The error was introduced by the following commit.

  acfe3014d41de5e87cdbc58d0396349c6b9c3ffd
  udev-extraconf: update mount.sh to use /run/media instead of /media

It accidently replaced 'device/media' by 'device/run/media' which causes
error for live images to be unable to boot up correctly, complaining
"Cannot find rootfs.img in /media/*".

This patch fixes the above problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 3e4f21f..7df1b6e 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -60,7 +60,7 @@ rm_dir() {
 
 # No ID_FS_TYPE for cdrom device, yet it should be mounted
 name="`basename "$DEVNAME"`"
-[ -e /sys/block/$name/device/run/media ] && media_type=`cat /sys/block/$name/device/run/media`
+[ -e /sys/block/$name/device/media ] && media_type=`cat /sys/block/$name/device/media`
 
 if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" -o "$media_type" = "cdrom" ]; then
 	if [ -x "$PMOUNT" ]; then
-- 
1.7.9.5


