Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A89BF6AEC5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 10:07:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Jun 2013 03:04:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="360993579"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2013 03:04:16 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 409836A4091
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 03:04:09 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 13:04:35 +0300
Message-Id: <cover.1372413711.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [RFC PATCH 0/8] Proposed implementation of a new runtime tests framework
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
X-List-Received-Date: Fri, 28 Jun 2013 10:07:02 -0000


Hello,

This is the proposed implementation of a new runtime tests framework based on python unittest. 
It's mean to ease qemu image testing and encourage developers to add more tests similar to the example tests provided (all tests are basically commands ran over ssh)

You can try it out like this:
 - first build a qemu core-image-sato (a minimal wouldn't be interesting at all)
 - add INHERIT += "testimage" in local.conf
 - then bitbake core-image-sato -c testimage. That will run a standard suite of tests.

You can set TEST_SUITES = "ping ssh <test name>" in local.conf to force run only certain tests (order matters here, it's the order in which tests run). You can also append "auto" and it will also run whatever tests are suitable for the image (if that was a sato-sdk image and you set TEST_SUITE = "ping ssh rpm auto" you force run ping, ssh and rpm but you also get smart, connman and gcc tests).

Check the task log (log.do_testimage) in WORKDIR to see the results. Also a ssh log (what command is running, output and return codes) and qemu boot log are kept in WORKDIR/testimage/

There are some areas for improvement/limitations right now:
 - a better way of getting the list of installed packages in a image
 - qemu is started with the -snapshot option, we should create a copy of the original rootfs instead.
 - when using TEST_SUITES = "auto" there is no dependency at all between tests (rpm would run before ssh test), so better use TEST_SUITES = "ping ssh auto"
 - better logging and error reporting for qemu problems (runqemu erros, qemu doesn't start, etc)
 - more helper methods for tests
 - others I can't think of right now :)

I hope this is going in the right direction and we could improve from here.
Comments and feedback are most welcome!

Regards,
Stefan



The following changes since commit 042203531b10b37ac9a8201b376f5dec403e51d8:

  sanity.bbclass: Fix COREBASE sanity tests (2013-06-27 12:48:56 +0100)

are available in the git repository at:

  git://mirror.rb.intel.com/git.yoctoproject.org/poky-contrib stefans/oeqa5

for you to fetch changes up to e6e567982f4b28822afdc8ea55401513df7c9466:

  lib/oeqa/runtime: add gcc test (2013-06-28 13:00:45 +0300)

----------------------------------------------------------------
Radu Moisan (2):
      lib/oeqa/utils/qemurunner.py: class to handle qemu instance
      lib/oeqa/utils/decorators.py: decorators for test methods

Stefan Stanacar (6):
      classes/testimage.bbclass: new class for image tests
      lib/oeqa/oetest.py: base module for all runtime unittests
      lib/oeqa/utils/sshcontrol.py: helper module for running remote commands
      lib/oeqa/utils/oetelnetlib.py: override Telnet class to use Unix domain sockets
      lib/oeqa/runtime: image sanity tests
      lib/oeqa/runtime: add gcc test

 meta/classes/testimage.bbclass           |  95 ++++++++++++++++++
 meta/lib/oeqa/__init__.py                |   0
 meta/lib/oeqa/oetest.py                  |  94 ++++++++++++++++++
 meta/lib/oeqa/runtime/__init__.py        |   0
 meta/lib/oeqa/runtime/connman.py         |  34 +++++++
 meta/lib/oeqa/runtime/dmesg.py           |  10 ++
 meta/lib/oeqa/runtime/files/test.c       |  26 +++++
 meta/lib/oeqa/runtime/files/testmakefile |   5 +
 meta/lib/oeqa/runtime/gcc.py             |  36 +++++++
 meta/lib/oeqa/runtime/multilib.py        |  14 +++
 meta/lib/oeqa/runtime/ping.py            |  11 +++
 meta/lib/oeqa/runtime/rpm.py             |  25 +++++
 meta/lib/oeqa/runtime/smart.py           |  23 +++++
 meta/lib/oeqa/runtime/ssh.py             |  16 ++++
 meta/lib/oeqa/utils/__init__.py          |   0
 meta/lib/oeqa/utils/decorators.py        |  40 ++++++++
 meta/lib/oeqa/utils/oetelnetlib.py       |  49 ++++++++++
 meta/lib/oeqa/utils/qemurunner.py        | 160 +++++++++++++++++++++++++++++++
 meta/lib/oeqa/utils/sshcontrol.py        | 100 +++++++++++++++++++
 scripts/runqemu                          |   2 +-
 20 files changed, 739 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/testimage.bbclass
 create mode 100644 meta/lib/oeqa/__init__.py
 create mode 100644 meta/lib/oeqa/oetest.py
 create mode 100644 meta/lib/oeqa/runtime/__init__.py
 create mode 100644 meta/lib/oeqa/runtime/connman.py
 create mode 100644 meta/lib/oeqa/runtime/dmesg.py
 create mode 100644 meta/lib/oeqa/runtime/files/test.c
 create mode 100644 meta/lib/oeqa/runtime/files/testmakefile
 create mode 100644 meta/lib/oeqa/runtime/gcc.py
 create mode 100644 meta/lib/oeqa/runtime/multilib.py
 create mode 100644 meta/lib/oeqa/runtime/ping.py
 create mode 100644 meta/lib/oeqa/runtime/rpm.py
 create mode 100644 meta/lib/oeqa/runtime/smart.py
 create mode 100644 meta/lib/oeqa/runtime/ssh.py
 create mode 100644 meta/lib/oeqa/utils/__init__.py
 create mode 100644 meta/lib/oeqa/utils/decorators.py
 create mode 100644 meta/lib/oeqa/utils/oetelnetlib.py
 create mode 100644 meta/lib/oeqa/utils/qemurunner.py
 create mode 100644 meta/lib/oeqa/utils/sshcontrol.py

Radu Moisan (2):
  lib/oeqa/utils/qemurunner.py: class to handle qemu instance
  lib/oeqa/utils/decorators.py: decorators for test methods

Stefan Stanacar (6):
  classes/testimage.bbclass: new class for image tests
  lib/oeqa/oetest.py: base module for all runtime unittests
  lib/oeqa/utils/sshcontrol.py: helper module for running remote
    commands
  lib/oeqa/utils/oetelnetlib.py: override Telnet class to use Unix
    domain sockets
  lib/oeqa/runtime: image sanity tests
  lib/oeqa/runtime: add gcc test

 meta/classes/testimage.bbclass           |  95 ++++++++++++++++++
 meta/lib/oeqa/__init__.py                |   0
 meta/lib/oeqa/oetest.py                  |  94 ++++++++++++++++++
 meta/lib/oeqa/runtime/__init__.py        |   0
 meta/lib/oeqa/runtime/connman.py         |  34 +++++++
 meta/lib/oeqa/runtime/dmesg.py           |  10 ++
 meta/lib/oeqa/runtime/files/test.c       |  26 +++++
 meta/lib/oeqa/runtime/files/testmakefile |   5 +
 meta/lib/oeqa/runtime/gcc.py             |  36 +++++++
 meta/lib/oeqa/runtime/multilib.py        |  14 +++
 meta/lib/oeqa/runtime/ping.py            |  11 +++
 meta/lib/oeqa/runtime/rpm.py             |  25 +++++
 meta/lib/oeqa/runtime/smart.py           |  23 +++++
 meta/lib/oeqa/runtime/ssh.py             |  16 ++++
 meta/lib/oeqa/utils/__init__.py          |   0
 meta/lib/oeqa/utils/decorators.py        |  40 ++++++++
 meta/lib/oeqa/utils/oetelnetlib.py       |  49 ++++++++++
 meta/lib/oeqa/utils/qemurunner.py        | 160 +++++++++++++++++++++++++++++++
 meta/lib/oeqa/utils/sshcontrol.py        | 100 +++++++++++++++++++
 scripts/runqemu                          |   2 +-
 20 files changed, 739 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/testimage.bbclass
 create mode 100644 meta/lib/oeqa/__init__.py
 create mode 100644 meta/lib/oeqa/oetest.py
 create mode 100644 meta/lib/oeqa/runtime/__init__.py
 create mode 100644 meta/lib/oeqa/runtime/connman.py
 create mode 100644 meta/lib/oeqa/runtime/dmesg.py
 create mode 100644 meta/lib/oeqa/runtime/files/test.c
 create mode 100644 meta/lib/oeqa/runtime/files/testmakefile
 create mode 100644 meta/lib/oeqa/runtime/gcc.py
 create mode 100644 meta/lib/oeqa/runtime/multilib.py
 create mode 100644 meta/lib/oeqa/runtime/ping.py
 create mode 100644 meta/lib/oeqa/runtime/rpm.py
 create mode 100644 meta/lib/oeqa/runtime/smart.py
 create mode 100644 meta/lib/oeqa/runtime/ssh.py
 create mode 100644 meta/lib/oeqa/utils/__init__.py
 create mode 100644 meta/lib/oeqa/utils/decorators.py
 create mode 100644 meta/lib/oeqa/utils/oetelnetlib.py
 create mode 100644 meta/lib/oeqa/utils/qemurunner.py
 create mode 100644 meta/lib/oeqa/utils/sshcontrol.py

-- 
1.8.1.4


