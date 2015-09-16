Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 107DE76FD5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 02:04:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G24ERg007088
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 19:04:15 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 15 Sep 2015 19:04:14 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Sep 2015 19:04:08 -0700
Message-ID: <cover.1442311946.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/6] Fixes for mutilib SDK
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
X-List-Received-Date: Wed, 16 Sep 2015 02:04:18 -0000
Content-Type: text/plain

* This fixed:
  MACHINE = "qemux86-64"
  require conf/multilib.conf
  MULTILIBS = "multilib:lib32"
  DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

  $ bitbake core-image-minimal -cpopulate_sdk
  Install poky-glibc-x86_64-core-image-minimal-core2-64-toolchain-1.8+snapshot.sh,
  then source environment-setup-core2-64-pokymllib32-linux or
  environment-setup-core2-64-poky-linux, both of them will compile hello.c
  well. (The 32bit was broken in the past)

  $ bitbake lib32-core-image-minimal -cpopulate_sdk
  Install poky-glibc-x86_64-lib32-core-image-minimal-core2-64-toolchain-1.8+snapshot.sh,
  then source environment-setup-core2-64-poky-linux or
  environment-setup-core2-64-pokymllib32-linux, both of them will compile
  hello.c well (neither of them worked in the past)

  This also fixed the problem that not all dependencies mutilib packages
  are installed, please see:
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=4408

Tested:
$ bitbake core-image-minimal core-image-sato -cpopulate_sdk && bitbake core-image-sato-sdk world core-image-minimal core-image-sato

// Robert

The following changes since commit f0189829498e30231d826c9f55aad73e622d076e:

  qemu: Update to upstream patches (2015-09-14 11:22:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/sdk
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/sdk

Robert Yang (6):
  toolchain-shar-extract.sh: remove checkbashism
  oe-pkgdata-util: avoid returning skipped packages
  package_manager.py: make rpm install mutilib pkgs corectly
  multilib.bbclass: install all bits toochains when populate mlprefix
    SDK
  populate_sdk_base.bbclass: fix SDKTARGETSYSROOT when populate
    mlprefix SDK
  meta-environment.bb: fix environment-setup* when populate mlprefix
    SDK

 meta/classes/multilib.bbclass              |   15 +++++
 meta/classes/populate_sdk_base.bbclass     |    6 +-
 meta/files/toolchain-shar-extract.sh       |    4 +-
 meta/lib/oe/package_manager.py             |   83 +++++++++++++++++++++++++++-
 meta/recipes-core/meta/meta-environment.bb |    4 ++
 scripts/oe-pkgdata-util                    |    5 +-
 6 files changed, 111 insertions(+), 6 deletions(-)

-- 
1.7.9.5


