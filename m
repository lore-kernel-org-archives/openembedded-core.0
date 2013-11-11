Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8B6146D37F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 09:26:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rAB9Q4n2018537
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 01:26:04 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 11 Nov 2013 01:26:04 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Nov 2013 17:26:08 +0800
Message-ID: <cover.1384161495.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] sysvinit: fix problem in switching runlevels
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
X-List-Received-Date: Mon, 11 Nov 2013 09:26:02 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This patch has been tested with the following steps.

1. Build an image with nfs-utils and rpcbind.
2. Add to /etc/fstab an nfs mount point with the following commands.
mount -o loop tmp/deploy/images/qemux86/core-image-minimal-qemux86.ext3 root-disk-dir/
mkdir -p root-disk-dir/home/root/test
if ! grep -q 'nfs' root-disk-dir/etc/fstab; then
    echo "192.168.7.1:/home/chenqi/test /home/root/test nfs defaults 0 0" >> root-disk-dir/etc/fstab
fi
umount root-disk-dir
3. runqemu qemux86 qemuparams="-serial stdio" bootparams="console=ttyS0"
4. init 1 (Network interface down and no nfs mount point)
5. init 3 (Network interface up and nfs mount point available)
6. init 5 (Network interface up and nfs mount point available)


The following changes since commit 4fdc3d77d4a875b7236536bf78849a4d1f6a7449:

  kbd: Fix stdarg related errors on uclibc (2013-11-08 17:31:36 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/sysvinit-runlevels
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/sysvinit-runlevels

Chen Qi (1):
  sysvinit: fix problem in switching runlevels

 .../init-ifupdown/init-ifupdown_1.0.bb             |    2 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    4 ++--
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb     |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.9.5


