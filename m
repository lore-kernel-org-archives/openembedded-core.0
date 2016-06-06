Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 59DBA770AB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 15:21:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 06 Jun 2016 08:21:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,427,1459839600"; d="scan'208";a="714707570"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Jun 2016 08:21:05 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2016 07:15:38 +0000
Message-Id: <cover.1465196934.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCHv2 0/7] Enable installation of packages in DUT
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
X-List-Received-Date: Mon, 06 Jun 2016 15:21:06 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>


This series enable the functionality to install packages in the DUT
during runtime testing. Such packages must had been build previously
by bitbake and the packages are specified using a JSON file. This
functionality works with testimage and with testexport.

This address the concer of adding a task to extract the packages,
instead the extraction was added to the testimage and testexport
tasks. 

This also includes the use of an SDK package for systems with
missing dependencies in the testing system.

This address several bugs:
  - 7850
  - 8694
  - 8481

Changes in v2:

  - Fix testexport for python3
  - Fix import form other layers with python3
  - Made changes to use with python3

This also address more bugs:
  - 9702
  - 9705

The following changes since commit 6c5d7f1fb276cbe0a461ece6c8f0ca17a478fa8c:

  lib/oe/package_manager: adapt for Python 3 (2016-06-05 23:39:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug7850v3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug7850v3

Mariano Lopez (7):
  oe/lib/pacakge_manager.py: Update missing pipeline decoding
  lib/oeqa/otest.py: Fix import tests from other layers with python3
  oetest.py: Add install/uninstall functionality for DUTs
  testimage.bbclass: Make dependency of cpio when using RPMs
  testexport-tarball.bb: Add recipe
  testexport.bbclass: Add support for testexport-tarball
  testexport.bbclass: Create tarballs for easy release

 meta/classes/testexport.bbclass              | 86 +++++++++++++++++++++++++---
 meta/classes/testimage.bbclass               | 20 +++++++
 meta/lib/oe/package_manager.py               |  4 +-
 meta/lib/oeqa/__init__.py                    |  0
 meta/lib/oeqa/oetest.py                      | 79 ++++++++++++++++++++++++-
 meta/lib/oeqa/runexported.py                 | 35 ++++++++++-
 meta/lib/oeqa/runtime/__init__.py            |  3 -
 meta/recipes-core/meta/testexport-tarball.bb | 56 ++++++++++++++++++
 8 files changed, 265 insertions(+), 18 deletions(-)
 delete mode 100644 meta/lib/oeqa/__init__.py
 delete mode 100644 meta/lib/oeqa/runtime/__init__.py
 create mode 100644 meta/recipes-core/meta/testexport-tarball.bb

-- 
2.6.6


