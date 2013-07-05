Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 348EE6AE2A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 09:27:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Jul 2013 02:24:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1000,1363158000"; d="scan'208";a="365191499"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 05 Jul 2013 02:27:11 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id C339A6A4091
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 02:27:10 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 12:27:41 +0300
Message-Id: <cover.1373013888.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [RFC PATCH v2 0/8] Proposed implementation of a new runtime tests framework
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
X-List-Received-Date: Fri, 05 Jul 2013 09:27:11 -0000


Hello,

This is the proposed implementation of a new runtime tests framework based on python unittest..
It's mean to ease qemu image testing and encourage developers to add more tests similar to the example tests provided (all tests are basically commands ran over ssh)

You can try it out like this:
 - first build a qemu core-image-sato (a minimal wouldn't be interesting at all)
 - add INHERIT += "testimage" in local.conf
 - then bitbake core-image-sato -c testimage. That will run a standard suite of tests.

You can set TEST_SUITES = "ping ssh <test name>" in local.conf to force run only certain tests (order matters here, it's the order in which tests run). You can also append "auto" and it will also run whatever tests are suitable for the image (if that was a sato-sdk image and you set TEST_SUITE = "ping ssh rpm auto" you force run ping, ssh and rpm but you also get smart, connman and gcc tests).

Check the task log (log.do_testimage) in WORKDIR to see the results. Also a ssh log (what command is running, output and return codes) and qemu boot log are kept in WORKDIR/testimage/

There are some areas for improvement:
 - a better way of getting the list of installed packages in a image (currently it uses the installed_packages.txt file in WORKDIR)
 - qemu is started with the -snapshot option, we should create a copy of the original rootfs instead (so that we can keep copy of the tested image)
 - when using TEST_SUITES = "auto" there is NO dependency at all between tests (rpm would run before ssh test)
 - right know the class assumes qemu machines, plan is to abstract it to allow provision of real hardware too.
 - other I don't remember right now :)

Changed in v2:
 - renamed oeTelnetlib to oeQemuConsole
 - added some tests for xorg and systemd
 - increased timeouts for starting qemu a little bit
 - move the unittest runner from the task to oetest module
 - print and check DISPLAY value
 - some comments and strings changes

I've run this on my AB instance with this applied http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=stefans/yab-master2&id=9cef75a5cc360629dd4ad32e121d9a9936cf2b5f

Comments and feedback are most welcome!

Regards,
Stefan

The following changes since commit 8a186a6b3853fc1a7dcf342d421c8926c38949c9:

  bitbake: hob: save button from settings called a nonexisting method (2013-07-03 08:13:35 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stefans/oeqa7

for you to fetch changes up to cee1fb0376c3440106552800af179cfb9df97b96:

  lib/oeqa/runtime: add gcc test (2013-07-05 11:36:08 +0300)

----------------------------------------------------------------
Radu Moisan (2):
      lib/oeqa/utils/qemurunner.py: class to handle qemu instance
      lib/oeqa/utils/decorators.py: decorators for test methods

Stefan Stanacar (6):
      classes/testimage.bbclass: new class for image tests
      lib/oeqa/oetest.py: base module for all runtime unittests
      lib/oeqa/utils/sshcontrol.py: helper module for running remote commands
      lib/oeqa/utils/oeqemuconsole.py: handle qemu serial console connection
      lib/oeqa/runtime: image sanity tests
      lib/oeqa/runtime: add gcc test

 meta/classes/testimage.bbclass           |  92 +++++++++++++++++
 meta/lib/oeqa/__init__.py                |   0
 meta/lib/oeqa/oetest.py                  | 101 +++++++++++++++++++
 meta/lib/oeqa/runtime/__init__.py        |   0
 meta/lib/oeqa/runtime/connman.py         |  34 +++++++
 meta/lib/oeqa/runtime/dmesg.py           |  13 +++
 meta/lib/oeqa/runtime/files/test.c       |  26 +++++
 meta/lib/oeqa/runtime/files/testmakefile |   5 +
 meta/lib/oeqa/runtime/gcc.py             |  36 +++++++
 meta/lib/oeqa/runtime/multilib.py        |  14 +++
 meta/lib/oeqa/runtime/ping.py            |  11 +++
 meta/lib/oeqa/runtime/rpm.py             |  25 +++++
 meta/lib/oeqa/runtime/smart.py           |  27 +++++
 meta/lib/oeqa/runtime/ssh.py             |  16 +++
 meta/lib/oeqa/runtime/systemd.py         |  24 +++++
 meta/lib/oeqa/runtime/xorg.py            |  21 ++++
 meta/lib/oeqa/utils/__init__.py          |   0
 meta/lib/oeqa/utils/decorators.py        |  40 ++++++++
 meta/lib/oeqa/utils/oeqemuconsole.py     |  45 +++++++++
 meta/lib/oeqa/utils/qemurunner.py        | 164 +++++++++++++++++++++++++++++++
 meta/lib/oeqa/utils/sshcontrol.py        | 100 +++++++++++++++++++
 scripts/runqemu                          |   2 +-
 22 files changed, 795 insertions(+), 1 deletion(-)
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
 create mode 100644 meta/lib/oeqa/runtime/systemd.py
 create mode 100644 meta/lib/oeqa/runtime/xorg.py
 create mode 100644 meta/lib/oeqa/utils/__init__.py
 create mode 100644 meta/lib/oeqa/utils/decorators.py
 create mode 100644 meta/lib/oeqa/utils/oeqemuconsole.py
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
  lib/oeqa/utils/oeqemuconsole.py: handle qemu serial console connection
  lib/oeqa/runtime: image sanity tests
  lib/oeqa/runtime: add gcc test

 meta/classes/testimage.bbclass           |  92 +++++++++++++++++
 meta/lib/oeqa/__init__.py                |   0
 meta/lib/oeqa/oetest.py                  | 101 +++++++++++++++++++
 meta/lib/oeqa/runtime/__init__.py        |   0
 meta/lib/oeqa/runtime/connman.py         |  34 +++++++
 meta/lib/oeqa/runtime/dmesg.py           |  13 +++
 meta/lib/oeqa/runtime/files/test.c       |  26 +++++
 meta/lib/oeqa/runtime/files/testmakefile |   5 +
 meta/lib/oeqa/runtime/gcc.py             |  36 +++++++
 meta/lib/oeqa/runtime/multilib.py        |  14 +++
 meta/lib/oeqa/runtime/ping.py            |  11 +++
 meta/lib/oeqa/runtime/rpm.py             |  25 +++++
 meta/lib/oeqa/runtime/smart.py           |  27 +++++
 meta/lib/oeqa/runtime/ssh.py             |  16 +++
 meta/lib/oeqa/runtime/systemd.py         |  24 +++++
 meta/lib/oeqa/runtime/xorg.py            |  21 ++++
 meta/lib/oeqa/utils/__init__.py          |   0
 meta/lib/oeqa/utils/decorators.py        |  40 ++++++++
 meta/lib/oeqa/utils/oeqemuconsole.py     |  45 +++++++++
 meta/lib/oeqa/utils/qemurunner.py        | 164 +++++++++++++++++++++++++++++++
 meta/lib/oeqa/utils/sshcontrol.py        | 100 +++++++++++++++++++
 scripts/runqemu                          |   2 +-
 22 files changed, 795 insertions(+), 1 deletion(-)
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
 create mode 100644 meta/lib/oeqa/runtime/systemd.py
 create mode 100644 meta/lib/oeqa/runtime/xorg.py
 create mode 100644 meta/lib/oeqa/utils/__init__.py
 create mode 100644 meta/lib/oeqa/utils/decorators.py
 create mode 100644 meta/lib/oeqa/utils/oeqemuconsole.py
 create mode 100644 meta/lib/oeqa/utils/qemurunner.py
 create mode 100644 meta/lib/oeqa/utils/sshcontrol.py

-- 
1.8.1.4


