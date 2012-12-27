Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1To3tb-0002hr-FW
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 04:12:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBR2vexo000753
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2012 18:57:40 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 26 Dec 2012 18:57:40 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Dec 2012 10:57:37 +0800
Message-ID: <cover.1356576405.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH V3 0/4] read-only rootfs support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Dec 2012 03:12:55 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The series of patches add support to read-only rootfs.

The main idea is to use symbolic links to create the illuion that some
directories are writable in case of a read-only rootfs.

This set of patches have been tested on minimal images with and without
'read-only-rootfs' image feature enabled. Everything is OK.

For sato images, everything is the same as before if 'read-only-rootfs' is not enabled.
With 'read-only-rootfs' enabled, sato image could work if graphic interface is diabled.
When all postinstall problems are resolved, sato image should work well (maybe with some
small changes in volatiles-readonly-sato conf file).


The following changes since commit 90c0eb29f0b41e4ac2d3d17ebad7295c2ebdc02a:

  rootfs_rpm.bbclass: remove debug code (2012-12-19 21:43:55 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/readonly-rootfs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/readonly-rootfs

Chen Qi (4):
  sysvinit: add ROOTFS_READ_ONLY variable to rcS-default
  image.bbclass: add two hook funtions to support read-only rootfs
  core-image.bbclass: support read-only-rootfs image feature
  initscripts: support read-only rootfs

 meta/classes/core-image.bbclass                    |    7 +-
 meta/classes/image.bbclass                         |   29 ++
 .../initscripts/initscripts-1.0/bootmisc.sh        |    9 +-
 .../initscripts-1.0/populate-volatile.sh           |  281 ++++++++++----------
 .../initscripts/initscripts-1.0/volatiles          |    1 +
 .../initscripts-1.0/volatiles-readonly-minimal     |    8 +
 .../initscripts-1.0/volatiles-readonly-sato        |   14 +
 meta/recipes-core/initscripts/initscripts_1.0.bb   |   11 +-
 meta/recipes-core/sysvinit/sysvinit/rcS-default    |    4 +
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |    2 +-
 10 files changed, 210 insertions(+), 156 deletions(-)
 create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-minimal
 create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-sato

-- 
1.7.9.5



