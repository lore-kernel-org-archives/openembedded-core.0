Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1Trn0h-0005xk-4L
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Jan 2013 10:59:19 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r069iATO013445
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 6 Jan 2013 01:44:10 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sun, 6 Jan 2013 01:44:09 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 6 Jan 2013 17:44:22 +0800
Message-ID: <cover.1357465230.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH V6 0/6] read-only rootfs support
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
X-List-Received-Date: Sun, 06 Jan 2013 09:59:20 -0000
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

Changes for Version 4:
1) Improve the commit messages to be clearer.
2) Use 'sed -i' to replace 'sed' and 'mv' operations to cut down the exec overhead.

Changes for Version 5:
Fix the problem of failing to build the live images

Changes for Version 6:
1) Let the image recipes provide the corresponding conf files for read-only rootfs.
   The config files are closely related to the image types, so it's more reasonable
   to let these image recipes provide the config files.
2) Support customized conf files for customized images.


The following changes since commit 4a36a32567ecfbc7ce7b967803e6e23314953ef5:

  libpng: fix packaging (2012-12-26 11:34:09 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/readonly-rootfs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/readonly-rootfs

Chen Qi (6):
  sysvinit: add ROOTFS_READ_ONLY variable to rcS-default
  image.bbclass: add two funtions to support readonly rootfs
  core-image.bbclass: support read-only rootfs
  initscripts: support read-only rootfs
  core-image-minimal: support read-only rootfs
  core-image-sato: support read-only rootfs

 meta/classes/core-image.bbclass                    |    5 +-
 meta/classes/image.bbclass                         |   29 +-
 meta/recipes-core/images/core-image-minimal.bb     |   10 +
 .../images/files/volatiles-readonly-minimal        |    8 +
 .../initscripts/initscripts-1.0/bootmisc.sh        |    9 +-
 .../initscripts-1.0/populate-volatile.sh           |  281 ++++++++++----------
 .../initscripts/initscripts-1.0/volatiles          |    1 +
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    5 +-
 meta/recipes-core/sysvinit/sysvinit/rcS-default    |    4 +
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |    2 +-
 meta/recipes-sato/images/core-image-sato.bb        |    8 +
 .../images/files/volatiles-readonly-sato           |   14 +
 12 files changed, 215 insertions(+), 161 deletions(-)
 create mode 100644 meta/recipes-core/images/files/volatiles-readonly-minimal
 create mode 100644 meta/recipes-sato/images/files/volatiles-readonly-sato

-- 
1.7.9.5



