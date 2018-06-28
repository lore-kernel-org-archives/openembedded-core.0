Return-Path: <Arsalan_Awan@mentor.com>
X-Greylist: delayed 1854 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 28 Jun 2018 14:47:27 UTC
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id ADF9A605BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 14:47:27 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1fYXis-0002Ol-65 from Arsalan_Awan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2018 07:16:34 -0700
Received: from PKL-AAWAN1-UBUNTU.pkl.mentorg.com (137.202.0.87) by
	SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Thu, 28 Jun 2018 15:16:29 +0100
From: Arsalan Awan <Arsalan_Awan@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jun 2018 19:16:03 +0500
Message-ID: <cover.1530195143.git.Arsalan_Awan@mentor.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [137.202.0.87]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
	SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
Subject: [PATCH 0/1] fixing initrd mounts w/ spaces fail to move to real rootfs
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
X-List-Received-Date: Thu, 28 Jun 2018 14:47:27 -0000
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


The following changes since commit 40a904bf8bc1279c3da0893c003f740f1d2066c2:

  bitbake.conf: Allow BBINCLUDED to be unset (2018-06-28 12:26:33 +0100)

are available in the git repository at:

  git://github.com/ArsalanHAwan/openembedded-core initrdscripts-init-live
  https://github.com/ArsalanHAwan/openembedded-core/tree/initrdscripts-init-live

Arsalan H. Awan (1):
  initrdscripts/init-live.sh: fix mounts w/ spaces fail to move to real
    rootfs

 meta/recipes-core/initrdscripts/files/init-live.sh | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.7.4


