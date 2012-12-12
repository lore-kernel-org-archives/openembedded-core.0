Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TirKQ-0003Mh-ON
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 19:46:46 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Dec 2012 10:32:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,267,1355126400"; d="scan'208";a="263101023"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.189])
	by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2012 10:32:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 18:31:24 +0000
Message-Id: <cover.1355337025.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v3 00/13] Smart package management integration
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
X-List-Received-Date: Wed, 12 Dec 2012 18:46:46 -0000

This series integrates Smart into the root filesystem construction when
rpm packaging is used, and replaces zypper on the target if runtime
package management is enabled.

Improvements over previous versions of this series:
* Fix the sanity tests
* Fix runtime relocation issues
* Fix building multilib images


The following changes since commit b8b1b39961332c99d62ee466f7859bd62a0f806f:

  bitbake.conf/utils: Drop some OVERRIDES from FILESPATH (2012-12-11 15:58:27 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/smart2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/smart2

Mark Hatle (10):
  rootfs_rpm.bbclass: Revert to default shell logging behavior
  package_rpm: Update the way the multilib package names are translated
  package_rpm.bbclass: Fix the way the RPM platform file is generated
  package_rpm.bbclass: Add additional logging
  package_rpm.bbclass: Add support for incremental installs
  package_rpm.bbclass: Add additional install error detection
  rpm/smart: Fix runtime-relocation issues w/ RPM and Smart
  package_rpm.bbclass: Add a simply way to enable RPM debugging
  coreutils_6.9: Update the older coreutils to no longer provide 'su'
  package_rpm: Workaround for 'all' arch multilib package naming

Paul Eggleton (3):
  classes/*_rpm: integrate Smart into RPM filesystem construction
  classes/rootfs_rpm: install smart instead of zypper in rpm-based
    images
  Update sanity tests to use smart instead of zypper

 meta/classes/imagetest-qemu.bbclass                |    6 +-
 meta/classes/package_rpm.bbclass                   |  739 +++++++++-----------
 meta/classes/populate_sdk_rpm.bbclass              |   79 +--
 meta/classes/rootfs_rpm.bbclass                    |   89 ++-
 meta/recipes-core/coreutils/coreutils_6.9.bb       |    6 +-
 .../python/python-smartpm_1.4.1.bb                 |   17 +-
 .../rpm/rpm/rpm-debug-platform.patch               |   65 ++
 meta/recipes-devtools/rpm/rpm/rpm-platform.patch   |    2 +-
 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch  |   87 ++-
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |   41 +-
 .../sanity/{zypper_help => smart_help}             |   24 +-
 .../sanity/{zypper_search => smart_query}          |   24 +-
 .../scenario/qemuarm/core-image-lsb                |    4 +-
 .../scenario/qemuarm/core-image-sato               |    4 +-
 .../scenario/qemuarm/core-image-sato-sdk           |    4 +-
 .../scenario/qemumips/core-image-lsb               |    4 +-
 .../scenario/qemumips/core-image-sato              |    4 +-
 .../scenario/qemumips/core-image-sato-sdk          |    4 +-
 .../scenario/qemuppc/core-image-lsb                |    4 +-
 .../scenario/qemuppc/core-image-sato               |    4 +-
 .../scenario/qemuppc/core-image-sato-sdk           |    4 +-
 .../scenario/qemux86-64/core-image-lsb             |    4 +-
 .../scenario/qemux86-64/core-image-sato            |    4 +-
 .../scenario/qemux86-64/core-image-sato-sdk        |    4 +-
 .../scenario/qemux86/core-image-lsb                |    4 +-
 .../scenario/qemux86/core-image-sato               |    4 +-
 .../scenario/qemux86/core-image-sato-sdk           |    4 +-
 .../tools/{zypper_test.sh => smart_test.sh}        |   22 +-
 28 files changed, 635 insertions(+), 626 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-debug-platform.patch
 rename scripts/qemuimage-tests/sanity/{zypper_help => smart_help} (52%)
 rename scripts/qemuimage-tests/sanity/{zypper_search => smart_query} (50%)
 rename scripts/qemuimage-tests/tools/{zypper_test.sh => smart_test.sh} (46%)

-- 
1.7.10.4



