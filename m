Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5DFDA6B1ED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 02:09:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6V29YHp025541
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 19:09:34 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 30 Jul 2013 19:09:32 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Jul 2013 10:09:34 +0800
Message-ID: <cover.1375236274.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V3 0/9] Make read-only rootfs work with live images
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
X-List-Received-Date: Wed, 31 Jul 2013 02:09:33 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Change from V2:
1. modify the irda init script so that it doesn't necessarily need to write to /etc/sysconfig/irda
2. drop the lighttpd patch
3. modify the logic for openssh in case of a read-only rootfs

Change from V1:
1. Disable the generating of ssh keys at rootfs time
2. Add a mechanism to read-only-rootfs-hook.sh to check whether a directory is on a read-only partition.
3. Fix a new bug#4937 (https://bugzilla.yoctoproject.org/show_bug.cgi?id=4937)

The following changes since commit 5ddaba024adffdff5a50369e39b5e4e42fe48cc3:

  Temporary workaround with qemu images (2013-07-31 10:01:22 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/read-only-rootfs-in-live-images
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/read-only-rootfs-in-live-images

Chen Qi (9):
  init-live.sh: make $ROOT_MOUNT/media writable when necessary
  use a uniform way to determine whether rootfs is read-only
  udev: remove implicit dependency on initscripts
  populate-volatile.sh: use $ROOT_DIR/var/volatile/tmp as TMPDIR
  populate-volatile.sh: don't spawn background process at rootfs time
  runqemu-internal: fix to start X correctly in live images
  initscripts: use a uniform way to handle directories in read-only
    rootfs
  irda-utils: fix for read-only rootfs
  openssh: fix for read-only rootfs

 meta/classes/image.bbclass                         |   16 +++++--
 .../irda-utils/irda-utils-0.9.18/init              |   13 +-----
 .../openssh/openssh-6.2p2/init                     |   22 ++++++---
 meta/recipes-connectivity/openssh/openssh_6.2p2.bb |    9 +++-
 meta/recipes-core/initrdscripts/files/init-live.sh |    2 +
 .../initscripts/initscripts-1.0/functions          |   14 ++++++
 .../initscripts-1.0/populate-volatile.sh           |   12 +++--
 .../initscripts-1.0/read-only-rootfs-hook.sh       |   47 +++++++++++++++++---
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    5 +++
 meta/recipes-core/sysvinit/sysvinit/rcS-default    |    4 --
 meta/recipes-core/udev/udev/init                   |   21 +++++++--
 meta/recipes-core/udev/udev/udev-cache             |    5 +++
 .../0001-add-is_rootfs_readonly-to-functions.patch |   37 +++++++++++++++
 meta/recipes-extended/lsb/lsbinitscripts_9.48.bb   |    1 +
 scripts/runqemu-internal                           |    2 +-
 15 files changed, 169 insertions(+), 41 deletions(-)
 create mode 100644 meta/recipes-extended/lsb/lsbinitscripts/0001-add-is_rootfs_readonly-to-functions.patch

-- 
1.7.9.5


