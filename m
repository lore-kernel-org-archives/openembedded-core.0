Return-Path: <stefanx.stanacar@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 83B1F6B9D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 18:04:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 Aug 2013 11:04:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,943,1367996400"; d="scan'208";a="385580081"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2013 11:04:25 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id DB7E52C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:04:23 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 21:04:10 +0300
Message-Id: <cover.1377280794.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v2 00/19] Some new runtime tests or fixes
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
X-List-Received-Date: Fri, 23 Aug 2013 18:04:26 -0000

Hello,

This set includes new runtime tests and required changes for them.

Not all of them will get run by default, for example all the project
build tests on target (iptables, cvs and sudoku) need to be enabled manually.
Same applies to tests which require special options (skeleton, logrotate, pam).
A new patch for AutoBuilder is needed to add a new target for these.
The new smart tests are the most important change here, (and those will get run by
default on all targets on AB).


Cheers,
Stefan


Changed in v2:
  - squashed two commits and reorderd the series


The following changes since commit 501e1a321d15abd712e3a6ee6ccdb8e21c3d4ea4:

  bitbake: prserv/serv: Fix pid file removal (2013-08-23 17:43:40 +0100)

are available in the git repository at:

  git://mirror.rb.intel.com/git.yoctoproject.org/poky-contrib stefans/stage-oeqa2

for you to fetch changes up to 79006debe0d4fde2e9b14995c68d9e41b812855b:

  classess/testimage: change default test suites (2013-08-23 20:59:10 +0300)

----------------------------------------------------------------
Alexandru Georgescu (1):
      lib/oeqa/runtime: add basic test for x32 images

Alexandru Palalau (4):
      lib/oeqa/runtime: add new logrotate test
      lib/oeqa/runtime: add new skeletoninit test
      lib/oeqa/runtime: add new PAM support test
      lib/oeqa/runtime: add new scp test

Cornel Stoicescu (2):
      lib/oeqa/runtime: add test for perl
      lib/oeqa/runtime: add a test for ldd

Mihai Lindner (4):
      lib/oeqa/utils: new file: httpserver.py useful for serving files over HTTP to the target
      lib/oeqa/utils: qemurunner: save host IP address
      lib/oeqa/utils: decorators: return the decorated method
      lib/oeqa/runtime: smart: add new smart tests

Mihai Prica (4):
      lib/oeqa/runtime: add adjust date and time test
      lib/oeqa/runtime: add vncserver for target test
      lib/oeqa/utils: targetbuild: Add helper class for building packages on target
      lib/oeqa/runtime: add iptables, cvs and sudoku projects build tests on target

Stefan Stanacar (4):
      lib/oeqa/runtime: rpm: add install and erase tests
      lib/oeqa: make it possible to restart the target
      lib/oeqa: change behaviour for unskippable tests
      classess/testimage: change default test suites

 meta/classes/testimage.bbclass         |   4 +-
 meta/lib/oeqa/oetest.py                |  11 +++-
 meta/lib/oeqa/runtime/buildcvs.py      |  32 +++++++++++
 meta/lib/oeqa/runtime/buildiptables.py |  32 +++++++++++
 meta/lib/oeqa/runtime/buildsudoku.py   |  29 ++++++++++
 meta/lib/oeqa/runtime/date.py          |  27 +++++++++
 meta/lib/oeqa/runtime/files/test.pl    |   2 +
 meta/lib/oeqa/runtime/ldd.py           |  19 ++++++
 meta/lib/oeqa/runtime/logrotate.py     |  27 +++++++++
 meta/lib/oeqa/runtime/pam.py           |  24 ++++++++
 meta/lib/oeqa/runtime/perl.py          |  28 +++++++++
 meta/lib/oeqa/runtime/rpm.py           |  30 +++++++++-
 meta/lib/oeqa/runtime/scp.py           |  22 +++++++
 meta/lib/oeqa/runtime/smart.py         | 102 +++++++++++++++++++++++++++++----
 meta/lib/oeqa/runtime/vnc.py           |  22 +++++++
 meta/lib/oeqa/runtime/x32lib.py        |  17 ++++++
 meta/lib/oeqa/skeletoninit.py          |  28 +++++++++
 meta/lib/oeqa/utils/decorators.py      |   6 +-
 meta/lib/oeqa/utils/httpserver.py      |  32 +++++++++++
 meta/lib/oeqa/utils/qemurunner.py      |  39 ++++++++-----
 meta/lib/oeqa/utils/targetbuild.py     |  63 ++++++++++++++++++++
 21 files changed, 561 insertions(+), 35 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/buildcvs.py
 create mode 100644 meta/lib/oeqa/runtime/buildiptables.py
 create mode 100644 meta/lib/oeqa/runtime/buildsudoku.py
 create mode 100644 meta/lib/oeqa/runtime/date.py
 create mode 100644 meta/lib/oeqa/runtime/files/test.pl
 create mode 100644 meta/lib/oeqa/runtime/ldd.py
 create mode 100644 meta/lib/oeqa/runtime/logrotate.py
 create mode 100644 meta/lib/oeqa/runtime/pam.py
 create mode 100644 meta/lib/oeqa/runtime/perl.py
 create mode 100644 meta/lib/oeqa/runtime/scp.py
 create mode 100644 meta/lib/oeqa/runtime/vnc.py
 create mode 100644 meta/lib/oeqa/runtime/x32lib.py
 create mode 100644 meta/lib/oeqa/skeletoninit.py
 create mode 100644 meta/lib/oeqa/utils/httpserver.py
 create mode 100644 meta/lib/oeqa/utils/targetbuild.py

Alexandru Georgescu (1):
  lib/oeqa/runtime: add basic test for x32 images

Alexandru Palalau (4):
  lib/oeqa/runtime: add new logrotate test
  lib/oeqa/runtime: add new skeletoninit test
  lib/oeqa/runtime: add new PAM support test
  lib/oeqa/runtime: add new scp test

Cornel Stoicescu (2):
  lib/oeqa/runtime: add test for perl
  lib/oeqa/runtime: add a test for ldd

Mihai Lindner (4):
  lib/oeqa/utils: new file: httpserver.py useful for serving files over
    HTTP to the target
  lib/oeqa/utils: qemurunner: save host IP address
  lib/oeqa/utils: decorators: return the decorated method
  lib/oeqa/runtime: smart: add new smart tests

Mihai Prica (4):
  lib/oeqa/runtime: add adjust date and time test
  lib/oeqa/runtime: add vncserver for target test
  lib/oeqa/utils: targetbuild: Add helper class for building packages on
    target
  lib/oeqa/runtime: add iptables, cvs and sudoku projects build tests on
    target

Stefan Stanacar (4):
  lib/oeqa/runtime: rpm: add install and erase tests
  lib/oeqa: make it possible to restart the target
  lib/oeqa: change behaviour for unskippable tests
  classess/testimage: change default test suites

 meta/classes/testimage.bbclass         |   4 +-
 meta/lib/oeqa/oetest.py                |  11 +++-
 meta/lib/oeqa/runtime/buildcvs.py      |  32 +++++++++++
 meta/lib/oeqa/runtime/buildiptables.py |  32 +++++++++++
 meta/lib/oeqa/runtime/buildsudoku.py   |  29 ++++++++++
 meta/lib/oeqa/runtime/date.py          |  27 +++++++++
 meta/lib/oeqa/runtime/files/test.pl    |   2 +
 meta/lib/oeqa/runtime/ldd.py           |  19 ++++++
 meta/lib/oeqa/runtime/logrotate.py     |  27 +++++++++
 meta/lib/oeqa/runtime/pam.py           |  24 ++++++++
 meta/lib/oeqa/runtime/perl.py          |  28 +++++++++
 meta/lib/oeqa/runtime/rpm.py           |  30 +++++++++-
 meta/lib/oeqa/runtime/scp.py           |  22 +++++++
 meta/lib/oeqa/runtime/smart.py         | 102 +++++++++++++++++++++++++++++----
 meta/lib/oeqa/runtime/vnc.py           |  22 +++++++
 meta/lib/oeqa/runtime/x32lib.py        |  17 ++++++
 meta/lib/oeqa/skeletoninit.py          |  28 +++++++++
 meta/lib/oeqa/utils/decorators.py      |   6 +-
 meta/lib/oeqa/utils/httpserver.py      |  32 +++++++++++
 meta/lib/oeqa/utils/qemurunner.py      |  39 ++++++++-----
 meta/lib/oeqa/utils/targetbuild.py     |  63 ++++++++++++++++++++
 21 files changed, 561 insertions(+), 35 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/buildcvs.py
 create mode 100644 meta/lib/oeqa/runtime/buildiptables.py
 create mode 100644 meta/lib/oeqa/runtime/buildsudoku.py
 create mode 100644 meta/lib/oeqa/runtime/date.py
 create mode 100644 meta/lib/oeqa/runtime/files/test.pl
 create mode 100644 meta/lib/oeqa/runtime/ldd.py
 create mode 100644 meta/lib/oeqa/runtime/logrotate.py
 create mode 100644 meta/lib/oeqa/runtime/pam.py
 create mode 100644 meta/lib/oeqa/runtime/perl.py
 create mode 100644 meta/lib/oeqa/runtime/scp.py
 create mode 100644 meta/lib/oeqa/runtime/vnc.py
 create mode 100644 meta/lib/oeqa/runtime/x32lib.py
 create mode 100644 meta/lib/oeqa/skeletoninit.py
 create mode 100644 meta/lib/oeqa/utils/httpserver.py
 create mode 100644 meta/lib/oeqa/utils/targetbuild.py

-- 
1.8.3.1


