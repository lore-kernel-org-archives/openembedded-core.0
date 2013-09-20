Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 42CC26C7E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 09:27:56 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Sep 2013 02:27:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,943,1371106800"; d="scan'208";a="363220951"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.234])
	by azsmga001.ch.intel.com with ESMTP; 20 Sep 2013 02:27:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2013 10:27:48 +0100
Message-Id: <cover.1379669217.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/5] Removal of imagetest-qemu in favour of testimage
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
X-List-Received-Date: Fri, 20 Sep 2013 09:27:57 -0000

This series adds some functionality to testimage that was previously in 
imagetest-qemu, and finally removes imagetest-qemu since testimage 
replaces it.


The following changes since commit 9934141d5df9d334f7f7f76e1990234af8a25a63:

  qemu: Fix broken patch (2013-09-18 21:56:25 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/testimage2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/testimage2

Paul Eggleton (5):
  classes/testimage: remove odd characters in comments
  classes/testimage-auto: add class to allow automatically running image
    tests
  classes/sanity: test for DISPLAY being set with testimage class
  conf/local.conf.sample: update for new testimage class
  classes/imagetest-qemu: remove old image testing class

 meta/classes/image.bbclass                         |   3 +
 meta/classes/imagetest-qemu.bbclass                | 238 -------
 meta/classes/populate_sdk_base.bbclass             |   3 -
 meta/classes/sanity.bbclass                        |   6 +-
 meta/classes/testimage-auto.bbclass                |  24 +
 meta/classes/testimage.bbclass                     |   6 +-
 meta/conf/layer.conf                               |   3 -
 meta/conf/local.conf.sample                        |  20 +-
 scripts/qemuimage-testlib                          | 760 ---------------------
 scripts/qemuimage-testlib-pythonhelper             |  66 --
 scripts/qemuimage-tests/sanity/boot                |  29 -
 scripts/qemuimage-tests/sanity/compiler            |  52 --
 scripts/qemuimage-tests/sanity/connman             |  53 --
 scripts/qemuimage-tests/sanity/dmesg               |  52 --
 scripts/qemuimage-tests/sanity/rpm_query           |  52 --
 scripts/qemuimage-tests/sanity/scp                 |  71 --
 scripts/qemuimage-tests/sanity/shutdown            |  76 ---
 scripts/qemuimage-tests/sanity/smart_help          |  52 --
 scripts/qemuimage-tests/sanity/smart_query         |  52 --
 scripts/qemuimage-tests/sanity/ssh                 |  39 --
 .../scenario/qemuarm/core-image-lsb                |   7 -
 .../scenario/qemuarm/core-image-minimal            |   1 -
 .../scenario/qemuarm/core-image-sato               |  11 -
 .../scenario/qemuarm/core-image-sato-sdk           |  12 -
 .../scenario/qemuarm/meta-toolchain-gmae           |   3 -
 .../scenario/qemumips/core-image-lsb               |   7 -
 .../scenario/qemumips/core-image-minimal           |   1 -
 .../scenario/qemumips/core-image-sato              |  11 -
 .../scenario/qemumips/core-image-sato-sdk          |  12 -
 .../scenario/qemumips/meta-toolchain-gmae          |   3 -
 .../scenario/qemuppc/core-image-lsb                |   7 -
 .../scenario/qemuppc/core-image-minimal            |   1 -
 .../scenario/qemuppc/core-image-sato               |  11 -
 .../scenario/qemuppc/core-image-sato-sdk           |  12 -
 .../scenario/qemuppc/meta-toolchain-gmae           |   3 -
 .../scenario/qemux86-64/core-image-lsb             |   7 -
 .../scenario/qemux86-64/core-image-minimal         |   1 -
 .../scenario/qemux86-64/core-image-sato            |  11 -
 .../scenario/qemux86-64/core-image-sato-sdk        |  12 -
 .../scenario/qemux86-64/meta-toolchain-gmae        |   3 -
 .../scenario/qemux86/core-image-lsb                |   7 -
 .../scenario/qemux86/core-image-minimal            |   1 -
 .../scenario/qemux86/core-image-sato               |  11 -
 .../scenario/qemux86/core-image-sato-sdk           |  12 -
 .../scenario/qemux86/meta-toolchain-gmae           |   3 -
 scripts/qemuimage-tests/systemusage/bash           |  53 --
 scripts/qemuimage-tests/systemusage/df             |  54 --
 scripts/qemuimage-tests/systemusage/syslog         |  54 --
 scripts/qemuimage-tests/toolchain/cvs              |  31 -
 scripts/qemuimage-tests/toolchain/iptables         |  31 -
 scripts/qemuimage-tests/toolchain/sudoku-savant    |  31 -
 scripts/qemuimage-tests/tools/bash.sh              |  17 -
 scripts/qemuimage-tests/tools/compiler_test.sh     | 137 ----
 scripts/qemuimage-tests/tools/connman_test.sh      |  75 --
 scripts/qemuimage-tests/tools/df.sh                |  25 -
 scripts/qemuimage-tests/tools/dmesg.sh             |  28 -
 scripts/qemuimage-tests/tools/rpm_test.sh          |  45 --
 scripts/qemuimage-tests/tools/smart_test.sh        |  45 --
 scripts/qemuimage-tests/tools/syslog.sh            |  17 -
 59 files changed, 36 insertions(+), 2434 deletions(-)
 delete mode 100644 meta/classes/imagetest-qemu.bbclass
 create mode 100644 meta/classes/testimage-auto.bbclass
 delete mode 100755 scripts/qemuimage-testlib
 delete mode 100755 scripts/qemuimage-testlib-pythonhelper
 delete mode 100755 scripts/qemuimage-tests/sanity/boot
 delete mode 100755 scripts/qemuimage-tests/sanity/compiler
 delete mode 100755 scripts/qemuimage-tests/sanity/connman
 delete mode 100755 scripts/qemuimage-tests/sanity/dmesg
 delete mode 100755 scripts/qemuimage-tests/sanity/rpm_query
 delete mode 100755 scripts/qemuimage-tests/sanity/scp
 delete mode 100755 scripts/qemuimage-tests/sanity/shutdown
 delete mode 100755 scripts/qemuimage-tests/sanity/smart_help
 delete mode 100755 scripts/qemuimage-tests/sanity/smart_query
 delete mode 100755 scripts/qemuimage-tests/sanity/ssh
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuarm/core-image-lsb
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuarm/core-image-minimal
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuarm/core-image-sato
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuarm/core-image-sato-sdk
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuarm/meta-toolchain-gmae
 delete mode 100644 scripts/qemuimage-tests/scenario/qemumips/core-image-lsb
 delete mode 100644 scripts/qemuimage-tests/scenario/qemumips/core-image-minimal
 delete mode 100644 scripts/qemuimage-tests/scenario/qemumips/core-image-sato
 delete mode 100644 scripts/qemuimage-tests/scenario/qemumips/core-image-sato-sdk
 delete mode 100644 scripts/qemuimage-tests/scenario/qemumips/meta-toolchain-gmae
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuppc/core-image-lsb
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuppc/core-image-minimal
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuppc/core-image-sato
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuppc/core-image-sato-sdk
 delete mode 100644 scripts/qemuimage-tests/scenario/qemuppc/meta-toolchain-gmae
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86-64/core-image-lsb
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86-64/core-image-minimal
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86-64/core-image-sato
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86-64/core-image-sato-sdk
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86-64/meta-toolchain-gmae
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86/core-image-lsb
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86/core-image-minimal
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86/core-image-sato
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86/core-image-sato-sdk
 delete mode 100644 scripts/qemuimage-tests/scenario/qemux86/meta-toolchain-gmae
 delete mode 100755 scripts/qemuimage-tests/systemusage/bash
 delete mode 100755 scripts/qemuimage-tests/systemusage/df
 delete mode 100755 scripts/qemuimage-tests/systemusage/syslog
 delete mode 100755 scripts/qemuimage-tests/toolchain/cvs
 delete mode 100755 scripts/qemuimage-tests/toolchain/iptables
 delete mode 100755 scripts/qemuimage-tests/toolchain/sudoku-savant
 delete mode 100644 scripts/qemuimage-tests/tools/bash.sh
 delete mode 100644 scripts/qemuimage-tests/tools/compiler_test.sh
 delete mode 100644 scripts/qemuimage-tests/tools/connman_test.sh
 delete mode 100644 scripts/qemuimage-tests/tools/df.sh
 delete mode 100644 scripts/qemuimage-tests/tools/dmesg.sh
 delete mode 100644 scripts/qemuimage-tests/tools/rpm_test.sh
 delete mode 100644 scripts/qemuimage-tests/tools/smart_test.sh
 delete mode 100644 scripts/qemuimage-tests/tools/syslog.sh

-- 
1.8.1.2


