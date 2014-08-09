Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 289C670A02
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 08:53:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Aug 2014 01:53:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,831,1400050800"; d="scan'208";a="574133168"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 09 Aug 2014 01:53:54 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id EC1AC6A4007;
	Sat,  9 Aug 2014 01:53:15 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Aug 2014 13:59:05 +0300
Message-Id: <1407581949-12085-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/4] Enable automated sdk tests
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
X-List-Received-Date: Sat, 09 Aug 2014 08:54:00 -0000

This series of patches contain the changes and additions needed to enable automated sdk tests. They are handeled similar to the automated runtime tests, sharing both code and test files.

The original version of these patches was created by Richard Purdie <richard.purdie@linuxfoundation.org>.

However, I did not manage to sort out all the isses, and here they are:
- no setUpModule is used in the sdk test modules. This mean these tests will run for every sdk test run(not really an issue, as long as the tests are configured well)
- I left out the testsdk_auto task (should wotk similar to testimage_auto) because I did not get it to work properly. Please note that, for some reason, testimage_auto is also faulty. I will open a bug for this.

Here is the TODO list for this:
- add a cache system for package downloading (using /tmp to download packages for testing means we have to re-download them every time)
- investigate: unify the files/ directory for all tests (now we have a specific runtime/files/ directory for example)


Corneliu Stoicescu (4):
  meta/classes/testimage.bbclass: add testsdk task and enable
    functionality for it.
  oeqa/oetest.py: enable sdk testing
  oeqa/utils/targetbuild.py: add support for sdk tests
  oeqa/sdk/: add sdk tests for sudoku, iptables and cvs

 meta/classes/testimage.bbclass     | 97 +++++++++++++++++++++++++++++++++++---
 meta/lib/oeqa/oetest.py            | 29 +++++++-----
 meta/lib/oeqa/sdk/__init__.py      |  3 ++
 meta/lib/oeqa/sdk/buildcvs.py      | 25 ++++++++++
 meta/lib/oeqa/sdk/buildiptables.py | 26 ++++++++++
 meta/lib/oeqa/sdk/buildsudoku.py   | 22 +++++++++
 meta/lib/oeqa/utils/targetbuild.py | 94 ++++++++++++++++++++++++++++++------
 7 files changed, 263 insertions(+), 33 deletions(-)
 create mode 100644 meta/lib/oeqa/sdk/__init__.py
 create mode 100644 meta/lib/oeqa/sdk/buildcvs.py
 create mode 100644 meta/lib/oeqa/sdk/buildiptables.py
 create mode 100644 meta/lib/oeqa/sdk/buildsudoku.py

-- 
1.8.3.2


