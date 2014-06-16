Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6D64B6FD30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 10:45:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5GAjHNV013080
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 03:45:18 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 16 Jun 2014 03:45:17 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jun 2014 18:46:22 +0800
Message-ID: <cover.1402915083.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/9] initramfs and UUID support in minimal installer
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
X-List-Received-Date: Mon, 16 Jun 2014 10:45:25 -0000
Content-Type: text/plain

The purpose of this patchset is to add initramfs and UUID support for our minimal installer.

Previously, the installed image may not be able to boot up because we use the hardcoded disk
names.

To reproduce, use the following commands.
1. Enable live image types and build out the minimal installer.
2. runqemu qemux86 iso qemuparams="-hdb target-disk"
3. qemu-system-i386 -hda target-disk

We can see that the installed target cannot boot up correctly.

This patchset fixes this problem so that when executing the above commands, the target can
still correctly boot up as long as we configure in local.conf or some other distro config files
to select image-initramfs-minimal as the INITRAMFS_IMAGE.

//Chen Qi

The following changes since commit 12bab2d828836c8926f753caff80b61dbe6390a5:

  alsa-tools: Add missing pkgconfg dependency (2014-06-14 08:45:47 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/initramfs-uuid
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/busybox-syslog

Chen Qi (9):
  initramfs-image-minimal.bb: add recipe
  initramfs-framework: fix an error in udev module
  initramfs-framework: modify the fatal behaviour in init
  initramfs-framework: fix an error in finish module
  kernel.bbclass: also install the bundled kernel to STAGING_KERNEL_DIR
  bootimg.bbclass: take initramfs into consideration
  initramfs-live-install: rdepend on util-linux-blkid
  busybox: enable uuid support by default
  init-install.sh: add support for installing initramfs onto the target

 meta/classes/bootimg.bbclass                       |    7 ++-
 meta/classes/kernel.bbclass                        |    1 +
 meta/recipes-core/busybox/busybox/defconfig        |   38 +++++++--------
 .../recipes-core/images/initramfs-image-minimal.bb |   19 ++++++++
 .../initrdscripts/files/init-install.sh            |   49 ++++++++++++++++----
 .../initrdscripts/initramfs-framework/finish       |    4 +-
 .../initrdscripts/initramfs-framework/init         |    5 +-
 .../initrdscripts/initramfs-framework/udev         |    1 +
 .../initrdscripts/initramfs-live-install_1.0.bb    |    2 +-
 9 files changed, 89 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-core/images/initramfs-image-minimal.bb

-- 
1.7.9.5


