Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1Tn363-0000GL-My
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 09:09:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBO7sOMx028558
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Dec 2012 23:54:24 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sun, 23 Dec 2012 23:54:24 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Dec 2012 15:54:52 +0800
Message-ID: <cover.1356335387.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/2] read-only rootfs support
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
X-List-Received-Date: Mon, 24 Dec 2012 08:09:59 -0000
X-List-Received-Date: Mon, 24 Dec 2012 08:09:59 -0000
X-List-Received-Date: Mon, 24 Dec 2012 08:09:59 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add read-only rootfs support to sysvinit startup system.
The main changes are:
1) Let rootfs_xxx.bbclass support 'read-only-rootfs' image feature.
   If IMAGE_FEATURES contains 'read-only-rootfs', then the populate-volatile.sh
   script is run at rootfs time to set up basic directories and files.
2) Improve the populate-volatile.sh init script.
3) Add two config files specific to read-only-rootfs image, which are to be used
   by the populate-volatile.sh script.
4) Automatically adjust the mount options in fstab when 'read-only-rootfs' is in
   IMAGE_FEATURES.

The following changes since commit 90c0eb29f0b41e4ac2d3d17ebad7295c2ebdc02a:

  rootfs_rpm.bbclass: remove debug code (2012-12-19 21:43:55 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/readonly-rootfs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/readonly-rootfs

Chen Qi (2):
  initscripts: support read-only rootfs
  rootfs_xxx.bbclass: support read-only-rootfs image feature

 meta/classes/rootfs_deb.bbclass                    |   14 +
 meta/classes/rootfs_ipk.bbclass                    |   15 ++
 meta/classes/rootfs_rpm.bbclass                    |   20 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    8 +-
 .../initscripts/initscripts-1.0/bootmisc.sh        |    9 +-
 .../initscripts-1.0/populate-volatile.sh           |  285 ++++++++++----------
 .../initscripts/initscripts-1.0/volatiles          |    1 +
 .../initscripts-1.0/volatiles-readonly-minimal     |   23 ++
 .../initscripts-1.0/volatiles-readonly-sato        |   30 +++
 meta/recipes-core/initscripts/initscripts_1.0.bb   |   15 +-
 10 files changed, 265 insertions(+), 155 deletions(-)
 create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-minimal
 create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/volatiles-readonly-sato

-- 
1.7.9.5



