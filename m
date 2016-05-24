Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A6FC46FF23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 20:48:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 24 May 2016 13:49:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,360,1459839600"; d="scan'208";a="708326891"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 24 May 2016 13:48:59 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 12:44:09 +0000
Message-Id: <cover.1464092933.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 00/10] Allow to install packages in the DUT during runtime testing
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
X-List-Received-Date: Tue, 24 May 2016 20:48:59 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This series enable the functionality to install packages in the DUT
during runtime testing. Such packages must had been build previously
by bitbake and the packages are specified using a JSON file. This
functionality works with testimage and with testexport.

A documentation draft has been submitted in bug 9672 to be added to
the Reference Manual.

This address several bugs:
  - 7850 (not solved completely)
  - 8478
  - 8694
  - 8536

The following changes since commit c7e614c438706fb3ed7520b4990ebb3973366942:

  useradd: Fix infinite build loop (2016-05-23 10:33:45 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug7850v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug7850v2

Mariano Lopez (10):
  testexport.bbclass: Stop exporting test context
  oetest.py: Move getTests() outside loadTests() method
  oeqa/utils/package_manager.py: Add get_package_manager()
  oetest.py: Add json file support to specify packages needed in runtime
    tests
  oetest.py: Add extract_packages() to RuntimeTestContext class
  oetest.py: Add support to copy unextracted packages for runtime
    testing
  lib/oe/package_manager.py: Add pkgpath to dict returned by
    package_info
  oetest.py: Add install/uninstall functionality for DUTs
  cpio: Add native variant
  testimage.bbclass: Make dependency of cpio when using RPMs

 meta/classes/testexport.bbclass        |  33 +++--
 meta/classes/testimage.bbclass         |  47 ++++++-
 meta/lib/oe/package_manager.py         |  41 +++---
 meta/lib/oeqa/oetest.py                | 239 ++++++++++++++++++++++++++++++---
 meta/lib/oeqa/utils/package_manager.py |  29 ++++
 meta/recipes-extended/cpio/cpio_v2.inc |   2 +
 6 files changed, 347 insertions(+), 44 deletions(-)
 create mode 100644 meta/lib/oeqa/utils/package_manager.py

-- 
2.6.6


