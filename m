Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1U2Igg-0005wy-IZ
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 10:50:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r149YIMn010154
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Feb 2013 01:34:18 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 4 Feb 2013 01:34:17 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Feb 2013 17:34:11 +0800
Message-ID: <cover.1359968242.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/5 V2]support incremental deb image generation
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
X-List-Received-Date: Mon, 04 Feb 2013 09:50:08 -0000
X-List-Received-Date: Mon, 04 Feb 2013 09:50:08 -0000
Content-Type: text/plain

Change from V1: fix do_rootfs error while using dash as default shell

The following is the test case about how to test incremental deb image
generation:

1, Modify a package 
1) Add the follow config option to a conf file:
    INC_DEB_IMAGE_GEN = "1"
    PACKAGE_CLASSES = "package_deb"

2) Run `bitbake core-image-sato' and test the image could work correctly.

3) Modify a package, such as busybox_1.20.2.bb.

4) Run `bitbake core-image-sato'

5) vim log.do_rootfs to see if the following log exists:
    `NOTE: Updating ***'

6) runqemu qemux86

2, Remove a package
1) Add the following line to conf/local.conf:
    INC_DEB_IMAGE_GEN = "1"
    PACKAGE_CLASSES = "package_deb"

2) Run "bitbake core-image-sato" to build an image

3) Comment out IMAGE_FEATURES in /meta/recipes-sato/images/core-image-sato.bb

4) Run "bitbake core-image-sato" to build an image

5) vim log.do_rootfs to see if the following log exists:
    `NOTE: Removing ***'

3, Add a package 
1) Add the following line to conf/local.conf:
    INC_DEB_IMAGE_GEN = "1"
    PACKAGE_CLASSES = "package_deb"
2) Do the above removing case.

3) Uncomment IMAGE_FEATURES in /meta/recipes-sato/images/core-image-sato.bb

4) Run `bitbake core-image-sato' to build an image

5) runqemu qemux86

The following changes since commit 75f470cd18d693a9a96d9849291c2c8de4dcbeb8:

  qt4: Add space for _appends (2013-02-01 22:49:47 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/incremental-deb-image
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/incremental-deb-image

Hongxu Jia (5):
  apt-native:fix support configuring etc dir in apt.conf
  image.bbclass:support incremental deb image generation
  populate_sdk:support incremental deb image generation
  rootfs_deb.bbclass:support incremental deb image generation
  package_deb.bbclass:support incremental deb image generation

 meta/classes/image.bbclass                     |   37 ++-
 meta/classes/package_deb.bbclass               |  390 ++++++++++++++++++++++--
 meta/classes/populate_sdk_base.bbclass         |   13 +-
 meta/classes/populate_sdk_deb.bbclass          |    2 +-
 meta/classes/rootfs_deb.bbclass                |   58 +++-
 meta/recipes-devtools/apt/apt-native_0.7.14.bb |    2 +-
 meta/recipes-devtools/apt/files/apt.conf       |    2 +-
 7 files changed, 452 insertions(+), 52 deletions(-)

-- 
1.7.10.4



