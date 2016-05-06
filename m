Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6C65F76FFA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 14:34:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 06 May 2016 07:34:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,587,1455004800"; d="scan'208";a="947646244"
Received: from jlock-mobl2.ger.corp.intel.com ([10.252.20.187])
	by orsmga001.jf.intel.com with ESMTP; 06 May 2016 07:34:18 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 May 2016 15:34:11 +0100
Message-Id: <cover.1462544086.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [Fido][PATCH 00/21] Consolidated pull request
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
X-List-Received-Date: Fri, 06 May 2016 14:34:20 -0000

The following changes consist of:
* security fixes
* tzdata & tzcode backports
* fido specific fixes submitted by the community
* backports to support building on the updated Yocto Project autobuilder
  cluster, with various newer distro versions than when fido was last released

A slightly divergent poky repository, with the correct change backported from
meta-yocto to update that local.conf.sample, has been pushed to:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=joshuagl/fido-next

The following changes since commit 1ebf604cae8d9bd3d2c10d06cd126e79e13732ee:

  build-appliance-image: Update to fido head revision (2016-03-13 10:52:37 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/fido-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/fido-next

Armin Kuster (6):
  tzdata: update to 2016b
  tzcode: update to 2016b
  tzdata: update to 2016c
  tzcode: update to 2016c
  tzcode: update to 2016d
  tzdata: update to 2016d

Brad Mouring (2):
  busybox: Backport patch to fix zcip false-conflict
  busybox_git: Fix SRCREV

Joshua Lock (1):
  gtk+_2.24.25: backport a fix for building with newer host perl

Mariano Lopez (1):
  dhcp: CVE-2015-8605

Richard Purdie (3):
  testimage: Handle ipk/deb packaging format tests correctly
  scripts/oe-pkgdata-util: Fix variable name in error handling
  populate_sdk_base: Ensure PKGDATA_DIR exists

Robert Yang (2):
  libsdl: depends on libglu when x11
  libsdl: depends on libglu when both x11 and opengl

Ross Burton (5):
  Revert "libsdl: depends on libglu when x11"
  libsdl: expand PACKAGECONFIG and enable native builds
  base: check for existing prefix when expanding names in PACKAGECONFIG
  xorg-lib: allow native building without x11 DISTRO_FEATURES
  conf/local.conf.sample: comment out ASSUME_PROVIDED=libsdl-native

Sona Sarmadi (1):
  bind: CVE-2016-1285 CVE-2016-1286

 meta/classes/base.bbclass                          |   5 +-
 meta/classes/populate_sdk_base.bbclass             |   2 +-
 meta/classes/testimage.bbclass                     |   6 +-
 meta/conf/local.conf.sample                        |   7 +-
 .../bind/bind/CVE-2016-1285.patch                  | 141 +++++++++
 .../bind/bind/CVE-2016-1286_1.patch                |  78 +++++
 .../bind/bind/CVE-2016-1286_2.patch                | 318 +++++++++++++++++++++
 .../bind/bind/fix-typo-in-CVE-2016-1285.patch      |  31 ++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |   4 +
 .../dhcp/dhcp/CVE-2015-8605.patch                  | 101 +++++++
 .../dhcp/dhcp/CVE-2015-8605_1.patch                | 131 +++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.1.bb       |   2 +
 ...wrong-comparison-of-source-IP-with-our-IP.patch |  34 +++
 meta/recipes-core/busybox/busybox_1.23.1.bb        |   1 +
 meta/recipes-core/busybox/busybox_git.bb           |   2 +-
 ...code-native_2016a.bb => tzcode-native_2016d.bb} |  12 +-
 .../tzdata/{tzdata_2016a.bb => tzdata_2016d.bb}    |   6 +-
 .../gtk+/gtk+/Avoid-perl-warnings.patch            |  75 +++++
 meta/recipes-gnome/gtk+/gtk+_2.24.25.bb            |   1 +
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |  34 +--
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |   1 +
 scripts/oe-pkgdata-util                            |   2 +-
 22 files changed, 960 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/fix-typo-in-CVE-2016-1285.patch
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605_1.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-zcip-fix-wrong-comparison-of-source-IP-with-our-IP.patch
 rename meta/recipes-extended/tzcode/{tzcode-native_2016a.bb => tzcode-native_2016d.bb} (48%)
 rename meta/recipes-extended/tzdata/{tzdata_2016a.bb => tzdata_2016d.bb} (97%)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+/Avoid-perl-warnings.patch

--
2.5.5

