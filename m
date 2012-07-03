Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SlxPn-0006tU-79
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:20:53 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2012 00:09:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="166158038"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2012 00:09:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 00:09:29 -0700
Message-Id: <cover.1341299168.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL 00/17] SDK Fixes and other Patches
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
X-List-Received-Date: Tue, 03 Jul 2012 07:20:54 -0000

Richard,

This has been built against the AB and ready for pull

There is one multilib related issue I am still tracking down 
related to task-core-boot, but I can seem to determin which
commit here casues it yet. 

Please pull this set and we will work that out.

Sau!

The following changes since commit 64422f7c5da160050a5454817c8fa9d070104b34:

  package.bbclass: Add missing PKGR, PKGV, PKGE and ALTERNATIVE variables from PACKAGEVARS (2012-07-02 16:44:57 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Darren Hart (2):
  linux-yocto-custom: Remove linux-tools
  core-image*sdk: Add kernel-dev to sdk images

Dennis Lan (1):
  openjade-native: fix undefined Getopts error, use std namespace

Khem Raj (1):
  kconfig-frontends: New recipe

Mark Hatle (9):
  Fix manual log file paths
  populate_sdk.bbclass: Split into two parts
  populate_sdk: Allow for attempt only packages in the SDK
  populate_sdk_base.bbclass: Change to using task specific depends
  populate_sdk: enable basic multilib support
  libc-common: Allow -dbg package to append, and not just set package
    variables
  package.bbclass: Allow a package to skip per file dependency
    generation
  image.bbclass: Add support to build the SDK in parallel with the
    image
  base.bbclass: Add cross-canadian-${TRANSLATED_TARGET_ARCH} to the
    license exclusion list

Paul Gortmaker (2):
  u-boot: Don't make the -Os removal part of global settings.
  u-boot: do not clobber PARALLEL_MAKE setting

Richard Purdie (1):
  autotools.bbclass: When configure fails, dump the config.log files
    the logs

Robert Yang (1):
  icu 3.6: do_install failed: Segmentation fault

 .../recipes-kernel/linux/linux-yocto-custom.bb     |    2 -
 meta/classes/autotools.bbclass                     |    9 ++-
 meta/classes/base.bbclass                          |    2 +-
 meta/classes/image.bbclass                         |    7 +-
 meta/classes/libc-common.bbclass                   |    6 +-
 meta/classes/package.bbclass                       |    3 +
 meta/classes/package_deb.bbclass                   |    4 +-
 meta/classes/package_ipk.bbclass                   |    2 +-
 meta/classes/package_rpm.bbclass                   |   10 +-
 meta/classes/populate_sdk.bbclass                  |   91 +-------------
 meta/classes/populate_sdk_base.bbclass             |  128 ++++++++++++++++++++
 meta/classes/populate_sdk_deb.bbclass              |    6 +-
 meta/classes/populate_sdk_ipk.bbclass              |    5 +-
 meta/classes/populate_sdk_rpm.bbclass              |    4 +-
 meta/classes/rootfs_deb.bbclass                    |    2 +
 meta/classes/rootfs_ipk.bbclass                    |    2 +
 meta/classes/toolchain-scripts.bbclass             |   16 ++-
 meta/recipes-bsp/u-boot/u-boot.inc                 |    5 +-
 .../kconfig-frontends/kconfig-frontends_3.4.bb     |   34 +++++
 .../openjade/openjade-1.3.2/msggen.pl.patch        |   44 +++++++
 .../openjade/openjade-native_1.3.2.bb              |    1 +
 meta/recipes-extended/images/core-image-lsb-sdk.bb |    1 +
 meta/recipes-rt/images/core-image-rt-sdk.bb        |    2 +-
 meta/recipes-sato/images/core-image-sato-sdk.bb    |    3 +
 .../icu/files/larger-cmd-size.patch                |   27 ++++
 meta/recipes-support/icu/icu-3.6.inc               |    1 +
 meta/recipes-support/icu/icu_3.6.bb                |    2 +-
 27 files changed, 299 insertions(+), 120 deletions(-)
 create mode 100644 meta/classes/populate_sdk_base.bbclass
 create mode 100644 meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
 create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
 create mode 100644 meta/recipes-support/icu/files/larger-cmd-size.patch

-- 
1.7.7.6



