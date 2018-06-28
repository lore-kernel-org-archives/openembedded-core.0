Return-Path: <Arsalan_Awan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B374E6E671
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 16:26:52 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1fYXjB-0002UR-2L from Arsalan_Awan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2018 07:16:53 -0700
Received: from PKL-AAWAN1-UBUNTU.pkl.mentorg.com (137.202.0.87) by
	SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Thu, 28 Jun 2018 15:16:48 +0100
From: Arsalan Awan <Arsalan_Awan@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jun 2018 19:16:36 +0500
Message-ID: <54623c3251a086bd9474d51d60dd46183840506d.1530195143.git.Arsalan_Awan@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1530195143.git.Arsalan_Awan@mentor.com>
References: <cover.1530195143.git.Arsalan_Awan@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [137.202.0.87]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
	SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
Subject: [PATCH 1/1] initrdscripts/init-live.sh: fix mounts w/ spaces fail to move to real rootfs
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
X-List-Received-Date: Thu, 28 Jun 2018 16:26:52 -0000
Content-Type: text/plain

From: "Arsalan H. Awan" <Arsalan_Awan@mentor.com>

When there are spaces in the mount points of devices e.g.:

 a partition mounted at "/run/media/My Root Partition-sda1",

the initrd fails to move such mount points over to the
corresponding directories at /media under the real root filesystem,
and the mount points would appear at the same location as they were
mounted on when detected by initrd, for example:
 here: "/run/media/My Root Partition-sda1"
 instead of here: "/media/My Root Partition-sda1"

This causes issues such as:

  * The disks/partitions cannot be formated with any filesystem
    using e.g. mkfs.ext4 or mke2fs in general. When tried to do so
    by making sure the device is not mounted, it failed with
    errors such as:

    > /dev/sda1 is apparently in use by the system; will not make a
      filesystem here!
    > /dev/sda1: Device or resource busy while setting up superblock

  * The read/write operations become extremely slow. e.g. Under testing,
    it took approx. 2 hours just to copy 700 MB of data to the partition,
    and it took more than 40 minutes to delete that data from it.
    Same operations took under 5 minutes on a partition that had no
    spaces in its mount point (or that was successfully moved to real
    root by initrd and appeared under /media instead of /run/media).

This commit fixes such issues by quoting the arguments of failing mount
move commands and by parsing OCT or HEX encoded special characters
such as spaces to ASCII charecters in the mount points as kernel
populates the procfs like so.

Signed-off-by: Arsalan H. Awan <Arsalan_Awan@mentor.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 46cab6c..65183d7 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -95,8 +95,11 @@ boot_live_root() {
     # Move the mount points of some filesystems over to
     # the corresponding directories under the real root filesystem.
     for dir in `awk '/\/dev.* \/run\/media/{print $2}' /proc/mounts`; do
-        mkdir -p  ${ROOT_MOUNT}/media/${dir##*/}
-        mount -n --move $dir ${ROOT_MOUNT}/media/${dir##*/}
+        # Parse any OCT or HEX encoded chars such as spaces
+        # in the mount points to actual ASCII chars
+        dir=`printf $dir`
+        mkdir -p "${ROOT_MOUNT}/media/${dir##*/}"
+        mount -n --move "$dir" "${ROOT_MOUNT}/media/${dir##*/}"
     done
     mount -n --move /proc ${ROOT_MOUNT}/proc
     mount -n --move /sys ${ROOT_MOUNT}/sys
-- 
2.7.4


