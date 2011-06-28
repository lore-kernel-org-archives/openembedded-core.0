Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QbUKH-0002OE-8I
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 11:11:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5S97cga019721
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 02:07:38 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 28 Jun 2011 02:07:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jun 2011 17:05:18 +0800
Message-ID: <cover.1309243115.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/4 V4] Share gcc work directories
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
X-List-Received-Date: Tue, 28 Jun 2011 09:11:22 -0000
Content-Type: text/plain

Changes of V4:

* Change the definition of GLIBC_DYNAMIC_LINKER as Richard suggested.

  e.g., the entries in the files that look like:
  #define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"

  become

  #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR"/ld-linux-x86-64.so.2"

  and we define SYSTEMLIBS_DIR in defaults.h.

  NOTE, the round brackets:
  #define GLIBC_DYNAMIC_LINKER64 (SYSTEMLIBS_DIR "/ld-linux-x86-64.so.2")

  doesn't work in in the following define:

  #define LINUX_DYNAMIC_LINKER \
          CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER)

  so use:
  #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR"/ld-linux-x86-64.so.2"

* Compare to V3, reduce two patches which are for gcc-crosssdk.inc and
  gcc-cross-canadian which are not needed any more.

* Fix the conflicts(gcc-4.6.0 -> gcc-4.6, and the ${BRANCH})

* Both tested 4.5.1 and 4.6:
  $ bitbake meta-toolchain core-image-sato
  $ runqemu qemurm

  Also unpack the sdk to /opt and test to make sure the toolchain works well.


The following changes since commit a1f79a7896b6411669b3ccada6204d2695e80fc5:

  runqueue.py: Add umask task control (2011-06-24 12:23:12 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/share_gcc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/share_gcc

Robert Yang (4):
  bitbake: share source directory
  Share gcc work directories
  gcc-4.5.1: share work directories
  gcc-4.6: share work directories

 bitbake/lib/bb/build.py                            |    4 +-
 bitbake/lib/bb/cache.py                            |    3 +
 bitbake/lib/bb/runqueue.py                         |   10 +++
 meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    1 +
 .../gcc-4.5.1/use-defaults.h-and-t-oe-in-B.patch   |   57 ++++++++++++++
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    5 +-
 .../gcc/gcc-4.6/use-defaults.h-and-t-oe-in-B.patch |   80 ++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-common.inc           |   32 +++++++-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   48 +++++++-----
 meta/recipes-devtools/gcc/gcc-configure-cross.inc  |    4 +-
 meta/recipes-devtools/gcc/gcc-crosssdk.inc         |    6 --
 11 files changed, 218 insertions(+), 32 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/use-defaults.h-and-t-oe-in-B.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/use-defaults.h-and-t-oe-in-B.patch



