Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D01B2771A6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316010"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:18 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:22:48 -0700
Message-Id: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 00/20] oeqa: Split configuration from the code
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
X-List-Received-Date: Mon, 08 Aug 2016 16:23:20 -0000

Improve oeqa-selftest capabilities and UX by placing
test configuration features and variables into a separate
configuration file.
Configuration file reading is done through a new library in
oeqa.utils and specific configuration files for each test are
stored in a separate directory.

[Yocto 9389]

The following changes since commit dfc016fbf13e62f7767edaf7abadf1d1b72680b2:

  maintainers.inc: remove augeas (2016-08-04 20:56:11 +0100)

are available in the git repository at:

  ssh://git.yoctoproject.org/poky-contrib lamego/9389
  http://git.yoctoproject.org/cgit.cgi//log/?h=lamego/9389

Jose Lamego (20):
  oeqa.selftest.archiver: Split configuration from code
  oeqa.selftest._sstatetests_noauto: Split configuration from code
  oeqa.selftest.bblayers: Split configuration from code
  oeqa.selftest.bbtests: Split configuration from code
  oeqa.selftest.buildhistory: Split configuration from code
  oeqa.selftest.buildoptions: Split configuration from code
  oeqa.selftest.devtool: Split configuration from code
  oeqa.selftest.imagefeatures: Split configuration from code
  oeqa.selftest.layerappend: Split configuration from code
  oeqa.selftest.lic-checksum: Split configuration from code
  oeqa.selftest.manifest: Split configuration from code
  oeqa.selftest.oescripts: Split configuration from code
  oeqa.selftest.pkgdata: Split configuration from code
  oeqa.selftest.prservice: Split configuration from code
  oeqa.selftest.recipetool: Split configuration from code
  oeqa.selftest.runtime-test: Split configuration from code
  oeqa.selftest.signing: Split configuration from code
  oeqa.selftest.sstatetests: Split configuration from code
  oeqa.selftest.wic: Split configuration from code
  oeqa.utils.readconfig: Read self-test configuration file

 meta/lib/oeqa/selftest/_sstatetests_noauto.py      |   9 +-
 meta/lib/oeqa/selftest/archiver.py                 |  24 +-
 meta/lib/oeqa/selftest/bblayers.py                 | 125 ++++--
 meta/lib/oeqa/selftest/bbtests.py                  | 175 ++++++---
 meta/lib/oeqa/selftest/buildhistory.py             |  10 +-
 meta/lib/oeqa/selftest/buildoptions.py             | 231 ++++++++----
 .../oeqa/selftest/conf/_sstatetests_noauto.conf    |   3 +
 meta/lib/oeqa/selftest/conf/archiver.conf          |   8 +
 meta/lib/oeqa/selftest/conf/bblayers.conf          |  21 ++
 meta/lib/oeqa/selftest/conf/bbtests.conf           |  28 ++
 meta/lib/oeqa/selftest/conf/buildhistory.conf      |   3 +
 meta/lib/oeqa/selftest/conf/buildoptions.conf      |  42 +++
 meta/lib/oeqa/selftest/conf/devtool.conf           | 100 +++++
 meta/lib/oeqa/selftest/conf/imagefeatures.conf     |  19 +
 meta/lib/oeqa/selftest/conf/layerappend.conf       |  40 ++
 meta/lib/oeqa/selftest/conf/lic-checksum.conf      |   4 +
 meta/lib/oeqa/selftest/conf/manifest.conf          |   8 +
 meta/lib/oeqa/selftest/conf/oescripts.conf         |   6 +
 meta/lib/oeqa/selftest/conf/pkgdata.conf           |  39 ++
 meta/lib/oeqa/selftest/conf/prservice.conf         |  21 ++
 meta/lib/oeqa/selftest/conf/recipetool.conf        |  84 +++++
 meta/lib/oeqa/selftest/conf/runtime-test.conf      |  13 +
 meta/lib/oeqa/selftest/conf/signing.conf           |  15 +
 meta/lib/oeqa/selftest/conf/sstatetests.conf       |  25 ++
 meta/lib/oeqa/selftest/conf/wic.conf               |  10 +
 meta/lib/oeqa/selftest/devtool.py                  | 417 ++++++++++++++-------
 meta/lib/oeqa/selftest/imagefeatures.py            |  55 ++-
 meta/lib/oeqa/selftest/layerappend.py              |  88 ++---
 meta/lib/oeqa/selftest/lic-checksum.py             |  22 +-
 meta/lib/oeqa/selftest/manifest.py                 |  22 +-
 meta/lib/oeqa/selftest/oescripts.py                |  31 +-
 meta/lib/oeqa/selftest/pkgdata.py                  | 373 ++++++++++++------
 meta/lib/oeqa/selftest/prservice.py                |  71 +++-
 meta/lib/oeqa/selftest/recipetool.py               | 326 ++++++++++++----
 meta/lib/oeqa/selftest/runtime-test.py             |  80 ++--
 meta/lib/oeqa/selftest/signing.py                  | 119 +++---
 meta/lib/oeqa/selftest/sstatetests.py              | 162 +++++---
 meta/lib/oeqa/selftest/wic.py                      | 150 +++++---
 meta/lib/oeqa/utils/readconfig.py                  |  18 +
 39 files changed, 2213 insertions(+), 784 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/_sstatetests_noauto.conf
 create mode 100644 meta/lib/oeqa/selftest/conf/archiver.conf
 create mode 100644 meta/lib/oeqa/selftest/conf/bblayers.conf
 create mode 100644 meta/lib/oeqa/selftest/conf/bbtests.conf
 create mode 100644 meta/lib/oeqa/selftest/conf/buildhistory.conf
 create mode 100644 meta/lib/oeqa/selftest/conf/buildoptions.conf
 create mode 100644 meta/lib/oeqa/selftest/conf/devtool.conf
 create mode 100644 meta/lib/oeqa/selftest/conf/imagefeatures.conf
 create mode 100644 meta/lib/oeqa/selftest/conf/layerappend.conf
 create mode 100644 meta/lib/oeqa/selftest/conf/lic-checksum.conf
 create mode 100644 meta/lib/oeqa/selftest/conf/manifest.conf
 create mode 100644 meta/lib/oeqa/selftest/conf/oescripts.conf
 create mode 100644 meta/lib/oeqa/selftest/conf/pkgdata.conf
 create mode 100644 meta/lib/oeqa/selftest/conf/prservice.conf
 create mode 100644 meta/lib/oeqa/selftest/conf/recipetool.conf
 create mode 100644 meta/lib/oeqa/selftest/conf/runtime-test.conf
 create mode 100644 meta/lib/oeqa/selftest/conf/signing.conf
 create mode 100644 meta/lib/oeqa/selftest/conf/sstatetests.conf
 create mode 100644 meta/lib/oeqa/selftest/conf/wic.conf
 create mode 100644 meta/lib/oeqa/utils/readconfig.py

-- 
1.8.3.1


