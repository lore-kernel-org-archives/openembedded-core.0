Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 09F7B6B1A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 07:39:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6Q7dWks002838
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 00:39:32 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 26 Jul 2013 00:39:32 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jul 2013 15:39:27 +0800
Message-ID: <cover.1374642547.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 0/9] Make read-only rootfs work well with live images
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
X-List-Received-Date: Fri, 26 Jul 2013 07:39:32 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, if no unification filesystem mechanism is compiled into kernel
and we are booting a live image, it's very likely the image cannot run correctly.

Now if we have 'read-only-rootfs' in IMAGE_FEATURES, the live image could start
correctly even if there's no unionfs like feature compiled in kernel.

//Chen Qi

The following changes since commit dc198141f6d158250bc13ad1130eb57975043270:

  initrdscripts: mount / as read-only when live-booting (2013-07-23 10:23:37 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/read-only-rootfs-in-live-images
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/read-only-rootfs-in-live-images

Chen Qi (9):
  init-live.sh: make $ROOT_MOUNT/media writable when necessary
  use a uniform way to determine whether rootfs is read-only
  udev: remove implicit dependency on initscripts
  populate-volatile.sh: use $ROOT_DIR/var/volatile/tmp as TMPDIR
  runqemu-internal: fix to start X correctly in live images
  initscripts: use a uniform way to handle directories in read-only
    rootfs
  irda-utils: make /etc/sysconfig writable in read-only rootfs
  lighttpd: make /www diretory writable in read-only rootfs
  Generate ssh keys at rootfs creation time in case of a read-only
    rootfs

 meta/classes/image.bbclass                         |   19 +++++++---
 .../irda-utils/irda-utils_0.9.18.bb                |    4 +++
 meta/recipes-connectivity/openssh/openssh_6.2p2.bb |   10 ++++--
 meta/recipes-core/dropbear/dropbear.inc            |    6 +++-
 meta/recipes-core/dropbear/dropbear/init           |   19 ++--------
 meta/recipes-core/initrdscripts/files/init-live.sh |    2 ++
 .../initscripts/initscripts-1.0/functions          |   14 ++++++++
 .../initscripts-1.0/populate-volatile.sh           |    6 +++-
 .../initscripts-1.0/read-only-rootfs-hook.sh       |   21 ++++++++---
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    5 +++
 meta/recipes-core/sysvinit/sysvinit/rcS-default    |    4 ---
 meta/recipes-core/udev/udev/init                   |   21 ++++++++---
 meta/recipes-core/udev/udev/udev-cache             |    5 +++
 meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb  |    3 ++
 .../0001-add-is_rootfs_readonly-to-functions.patch |   37 ++++++++++++++++++++
 meta/recipes-extended/lsb/lsbinitscripts_9.48.bb   |    1 +
 scripts/runqemu-internal                           |    2 +-
 17 files changed, 140 insertions(+), 39 deletions(-)
 create mode 100644 meta/recipes-extended/lsb/lsbinitscripts/0001-add-is_rootfs_readonly-to-functions.patch

-- 
1.7.9.5


