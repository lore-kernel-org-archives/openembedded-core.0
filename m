Return-Path: <Liwei.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF36C7CE26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 03:20:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2L3KCnB012704
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 20:20:48 -0700
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 20 Mar 2019 20:20:28 -0700
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Mar 2019 23:19:08 -0400
Message-ID: <1553138356-85237-1-git-send-email-liwei.song@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/8] changes to allow boot/install from/to virtual raid disk
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
X-List-Received-Date: Thu, 21 Mar 2019 03:20:58 -0000
Content-Type: text/plain

These series patches used to add support to install image to Intel
Virtual Raid disk and boot from it.
To boot from raid disk, mdadm is the necessory tools to initial it,
so it must run in initrd to make raid disk available, then rootfs
on it can be mounted to use, rootfs can be stored directly in
raid disk partition or LVM partition.

Liwei Song (8):
  mdadm: add mdmon service to support Intel VROC
  mdadm: add udev rules to create by-partuuid for MD devices
  udev-extraconf: move md* and dm* from mount blacklist
  initramfs-framework: mount efivarfs to make Intel VROC work well
  initramfs-framework: add lvm module
  init-install: add support for install image to Intel VROC raid disk
  init-install: fix a typo which will led delete section failed when use
    sed
  oe-core: add ledmon to support Intel VROC

 .../initrdscripts/files/init-install-efi.sh        | 25 +++++++++++++----
 .../initrdscripts/initramfs-framework/init         |  5 ++++
 .../initrdscripts/initramfs-framework/lvm          | 13 +++++++++
 .../initrdscripts/initramfs-framework_1.0.bb       |  9 ++++++
 .../udev/udev-extraconf/mount.blacklist            |  2 --
 meta/recipes-extended/ledmon/ledmon_git.bb         | 32 ++++++++++++++++++++++
 ...ev.rules-create-by-partuuid-for-md-device.patch | 29 ++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.1.bb           |  4 ++-
 8 files changed, 111 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/lvm
 create mode 100644 meta/recipes-extended/ledmon/ledmon_git.bb
 create mode 100644 meta/recipes-extended/mdadm/files/0001-udev.rules-create-by-partuuid-for-md-device.patch

-- 
2.7.4


