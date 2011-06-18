Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QXuvH-0002ce-UI
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Jun 2011 14:46:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5IChGv1015682
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2011 05:43:16 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sat, 18 Jun 2011 05:43:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 18 Jun 2011 20:41:30 +0800
Message-ID: <cover.1308391365.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/6 V3] Share gcc work directories
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Jun 2011 12:46:48 -0000
Content-Type: text/plain

Changes of V3:

1) Use --with-headers to replace the:

   sed -i 's:^\([ ]*\)glibc_header_dir=\"${with_build_sysroot}/usr/include\": ...

2) Fix the build of gcc-cross-canadian

3) Fix gcc-crosssdk which make the source incompatible during its
   building.

4) Test "bitbake meta-toolchain", and also do run test for the
   pokysdk(unpack the toolchain to /opt, setup the env by sourcing
   environment-setup-armv5te-poky-linux-gnueabi, and build some pkgs
   out of poky, then use command file to check the binary file type.

5) Make sure that no gcc build would make the source incompatible,
   except gcc-cross_csl-arm-2008q1.bb, but I think this is fine, its
   BINV = "4.2.3", not 4.5.1 or 4.6.0.

Thanks for Richard's great help.

// Robert


The following changes since commit 2163461ec94528ecf046a04edc5db3d2dd3a6b8b:

  systemtap: remove non-core COMPATIBLE_MACHINES (2011-06-16 22:14:06 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/share_gcc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/share_gcc

Robert Yang (6):
  bitbake: share source directory
  Share gcc work directories
  gcc-4.5.1: share work directories
  gcc-4.6.0: share work directories
  gcc-crosssdk: share work directories
  gcc-cross-canadian: share work directories

 bitbake/lib/bb/build.py                            |    4 +-
 bitbake/lib/bb/cache.py                            |    3 +
 bitbake/lib/bb/runqueue.py                         |   10 +++
 meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    1 +
 .../gcc-4.5.1/use-defaults.h-and-t-oe-in-B.patch   |   57 ++++++++++++++
 meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    1 +
 .../gcc-4.6.0/use-defaults.h-and-t-oe-in-B.patch   |   80 ++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-common.inc           |   32 +++++++-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   33 ++++-----
 meta/recipes-devtools/gcc/gcc-configure-cross.inc  |    4 +-
 meta/recipes-devtools/gcc/gcc-configure-sdk.inc    |    8 ++
 meta/recipes-devtools/gcc/gcc-crosssdk.inc         |   13 +++-
 12 files changed, 220 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/use-defaults.h-and-t-oe-in-B.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/use-defaults.h-and-t-oe-in-B.patch



