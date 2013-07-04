Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 83FDE61663
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 06:51:17 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Jul 2013 23:51:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,992,1363158000"; d="scan'208";a="263963820"
Received: from unknown (HELO [10.255.13.183]) ([10.255.13.183])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Jul 2013 23:51:17 -0700
Message-ID: <51D51B64.6030809@linux.intel.com>
Date: Wed, 03 Jul 2013 23:51:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Stefan Stanacar <stefanx.stanacar@intel.com>
References: <cover.1372413711.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1372413711.git.stefanx.stanacar@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/8] Proposed implementation of a new runtime tests framework
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
X-List-Received-Date: Thu, 04 Jul 2013 06:51:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2013 03:04 AM, Stefan Stanacar wrote:
>
> Hello,
>
> This is the proposed implementation of a new runtime tests framework based on python unittest.
> It's mean to ease qemu image testing and encourage developers to add more tests similar to the example tests provided (all tests are basically commands ran over ssh)
>
> You can try it out like this:
>   - first build a qemu core-image-sato (a minimal wouldn't be interesting at all)
>   - add INHERIT += "testimage" in local.conf
>   - then bitbake core-image-sato -c testimage. That will run a standard suite of tests.
>
> You can set TEST_SUITES = "ping ssh <test name>" in local.conf to force run only certain tests (order matters here, it's the order in which tests run). You can also append "auto" and it will also run whatever tests are suitable for the image (if that was a sato-sdk image and you set TEST_SUITE = "ping ssh rpm auto" you force run ping, ssh and rpm but you also get smart, connman and gcc tests).
>
> Check the task log (log.do_testimage) in WORKDIR to see the results. Also a ssh log (what command is running, output and return codes) and qemu boot log are kept in WORKDIR/testimage/
>
> There are some areas for improvement/limitations right now:
>   - a better way of getting the list of installed packages in a image
>   - qemu is started with the -snapshot option, we should create a copy of the original rootfs instead.
>   - when using TEST_SUITES = "auto" there is no dependency at all between tests (rpm would run before ssh test), so better use TEST_SUITES = "ping ssh auto"
>   - better logging and error reporting for qemu problems (runqemu erros, qemu doesn't start, etc)
>   - more helper methods for tests
>   - others I can't think of right now :)
>
> I hope this is going in the right direction and we could improve from here.
> Comments and feedback are most welcome!
>

Tired this out today and got the following:
> ERROR: Function failed: Failed to start qemu. You should check the task log and the qemu boot log (qemu log is /srv/ssd/sgw/builds/world/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/testimage/qemu_boot_log.20130704065001)
> ERROR: Logfile of failure stored in: /srv/ssd/sgw/builds/world/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/temp/log.do_testimage.18354
> Log data follows:
> | DEBUG: Executing python function do_testimage
> | NOTE: Test modules  ['oeqa.runtime.ping', 'oeqa.runtime.ssh', 'oeqa.runtime.connman', 'oeqa.runtime.rpm', 'oeqa.runtime.smart', 'oeqa.runtime.xorg', 'oeqa.runtime.dmesg']
> | NOTE: DISPLAY value: None
> | NOTE: rootfs file: /srv/ssd/sgw/builds/world/tmp/deploy/images/core-image-sato-qemux86-64.ext3
> | NOTE: Qemu logfile: /srv/ssd/sgw/builds/world/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/testimage/qemu_boot_log.20130704065001
> | NOTE: runqemu started, pid is 18389
> | NOTE: waiting at most 30 seconds for qemu pid
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | No children found matching 18389
> | NOTE: Qemu pid didn't appeared in 30 seconds
> | NOTE: Output from runqemu: Please use simplified serial or kvm options instead
> |
> | Continuing with the following parameters:
> | KERNEL: [/srv/ssd/sgw/builds/world/tmp/deploy/images/bzImage-qemux86-64.bin]
> | ROOTFS: [/srv/ssd/sgw/builds/world/tmp/deploy/images/core-image-sato-qemux86-64.ext3]
> | FSTYPE: [ext3]
> | stty: standard input: Inappropriate ioctl for device
> | Acquiring lockfile for tap0...
> | Using preconfigured tap device 'tap0'
> | Running qemu-system-x86_64...
> | /srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/qemu-system-x86_64 -kernel /srv/ssd/sgw/builds/world/tmp/deploy/images/bzImage-qemux86-64.bin -net nic,vlan=0 -net tap,vlan=0,ifname=tap0,script=no,downscript=no -hda /srv/ssd/sgw/builds/world/tmp/deploy/images/core-image-sato-qemux86-64.ext3 -show-cursor -usb -usbdevice wacom-tablet -vga vmware -no-reboot -snapshot -serial unix:/tmp/qemuconnection.18354,server,nowait -m 128 --append "vga=0 uvesafb.mode_option=640x480-32 root=/dev/hda rw mem=128M ip=192.168.7.2::192.168.7.1:255.255.255.0 oprofile.timer=1 console=ttyS0"
> | Could not initialize SDL(No available video device) - exiting
> | Releasing lockfile of preconfigured tap device 'tap0'
> | stty: standard input: Inappropriate ioctl for device
> | stty: standard input: Inappropriate ioctl for device
> |
> | DEBUG: Python function do_testimage finished
> | ERROR: Function failed: Failed to start qemu. You should check the task log and the qemu boot log (qemu log is /srv/ssd/sgw/builds/world/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/testimage/qemu_boot_log.20130704065001)
> ERROR: Task 0 (/srv/ssd/sgw/poky/meta/recipes-sato/images/core-image-sato.bb, do_testimage) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 164 tasks of which 163 didn't need to be rerun and 1 failed.
>


Sau!


> Regards,
> Stefan
>
>
>
> The following changes since commit 042203531b10b37ac9a8201b376f5dec403e51d8:
>
>    sanity.bbclass: Fix COREBASE sanity tests (2013-06-27 12:48:56 +0100)
>
> are available in the git repository at:
>
>    git://mirror.rb.intel.com/git.yoctoproject.org/poky-contrib stefans/oeqa5
>
> for you to fetch changes up to e6e567982f4b28822afdc8ea55401513df7c9466:
>
>    lib/oeqa/runtime: add gcc test (2013-06-28 13:00:45 +0300)
>
> ----------------------------------------------------------------
> Radu Moisan (2):
>        lib/oeqa/utils/qemurunner.py: class to handle qemu instance
>        lib/oeqa/utils/decorators.py: decorators for test methods
>
> Stefan Stanacar (6):
>        classes/testimage.bbclass: new class for image tests
>        lib/oeqa/oetest.py: base module for all runtime unittests
>        lib/oeqa/utils/sshcontrol.py: helper module for running remote commands
>        lib/oeqa/utils/oetelnetlib.py: override Telnet class to use Unix domain sockets
>        lib/oeqa/runtime: image sanity tests
>        lib/oeqa/runtime: add gcc test
>
>   meta/classes/testimage.bbclass           |  95 ++++++++++++++++++
>   meta/lib/oeqa/__init__.py                |   0
>   meta/lib/oeqa/oetest.py                  |  94 ++++++++++++++++++
>   meta/lib/oeqa/runtime/__init__.py        |   0
>   meta/lib/oeqa/runtime/connman.py         |  34 +++++++
>   meta/lib/oeqa/runtime/dmesg.py           |  10 ++
>   meta/lib/oeqa/runtime/files/test.c       |  26 +++++
>   meta/lib/oeqa/runtime/files/testmakefile |   5 +
>   meta/lib/oeqa/runtime/gcc.py             |  36 +++++++
>   meta/lib/oeqa/runtime/multilib.py        |  14 +++
>   meta/lib/oeqa/runtime/ping.py            |  11 +++
>   meta/lib/oeqa/runtime/rpm.py             |  25 +++++
>   meta/lib/oeqa/runtime/smart.py           |  23 +++++
>   meta/lib/oeqa/runtime/ssh.py             |  16 ++++
>   meta/lib/oeqa/utils/__init__.py          |   0
>   meta/lib/oeqa/utils/decorators.py        |  40 ++++++++
>   meta/lib/oeqa/utils/oetelnetlib.py       |  49 ++++++++++
>   meta/lib/oeqa/utils/qemurunner.py        | 160 +++++++++++++++++++++++++++++++
>   meta/lib/oeqa/utils/sshcontrol.py        | 100 +++++++++++++++++++
>   scripts/runqemu                          |   2 +-
>   20 files changed, 739 insertions(+), 1 deletion(-)
>   create mode 100644 meta/classes/testimage.bbclass
>   create mode 100644 meta/lib/oeqa/__init__.py
>   create mode 100644 meta/lib/oeqa/oetest.py
>   create mode 100644 meta/lib/oeqa/runtime/__init__.py
>   create mode 100644 meta/lib/oeqa/runtime/connman.py
>   create mode 100644 meta/lib/oeqa/runtime/dmesg.py
>   create mode 100644 meta/lib/oeqa/runtime/files/test.c
>   create mode 100644 meta/lib/oeqa/runtime/files/testmakefile
>   create mode 100644 meta/lib/oeqa/runtime/gcc.py
>   create mode 100644 meta/lib/oeqa/runtime/multilib.py
>   create mode 100644 meta/lib/oeqa/runtime/ping.py
>   create mode 100644 meta/lib/oeqa/runtime/rpm.py
>   create mode 100644 meta/lib/oeqa/runtime/smart.py
>   create mode 100644 meta/lib/oeqa/runtime/ssh.py
>   create mode 100644 meta/lib/oeqa/utils/__init__.py
>   create mode 100644 meta/lib/oeqa/utils/decorators.py
>   create mode 100644 meta/lib/oeqa/utils/oetelnetlib.py
>   create mode 100644 meta/lib/oeqa/utils/qemurunner.py
>   create mode 100644 meta/lib/oeqa/utils/sshcontrol.py
>
> Radu Moisan (2):
>    lib/oeqa/utils/qemurunner.py: class to handle qemu instance
>    lib/oeqa/utils/decorators.py: decorators for test methods
>
> Stefan Stanacar (6):
>    classes/testimage.bbclass: new class for image tests
>    lib/oeqa/oetest.py: base module for all runtime unittests
>    lib/oeqa/utils/sshcontrol.py: helper module for running remote
>      commands
>    lib/oeqa/utils/oetelnetlib.py: override Telnet class to use Unix
>      domain sockets
>    lib/oeqa/runtime: image sanity tests
>    lib/oeqa/runtime: add gcc test
>
>   meta/classes/testimage.bbclass           |  95 ++++++++++++++++++
>   meta/lib/oeqa/__init__.py                |   0
>   meta/lib/oeqa/oetest.py                  |  94 ++++++++++++++++++
>   meta/lib/oeqa/runtime/__init__.py        |   0
>   meta/lib/oeqa/runtime/connman.py         |  34 +++++++
>   meta/lib/oeqa/runtime/dmesg.py           |  10 ++
>   meta/lib/oeqa/runtime/files/test.c       |  26 +++++
>   meta/lib/oeqa/runtime/files/testmakefile |   5 +
>   meta/lib/oeqa/runtime/gcc.py             |  36 +++++++
>   meta/lib/oeqa/runtime/multilib.py        |  14 +++
>   meta/lib/oeqa/runtime/ping.py            |  11 +++
>   meta/lib/oeqa/runtime/rpm.py             |  25 +++++
>   meta/lib/oeqa/runtime/smart.py           |  23 +++++
>   meta/lib/oeqa/runtime/ssh.py             |  16 ++++
>   meta/lib/oeqa/utils/__init__.py          |   0
>   meta/lib/oeqa/utils/decorators.py        |  40 ++++++++
>   meta/lib/oeqa/utils/oetelnetlib.py       |  49 ++++++++++
>   meta/lib/oeqa/utils/qemurunner.py        | 160 +++++++++++++++++++++++++++++++
>   meta/lib/oeqa/utils/sshcontrol.py        | 100 +++++++++++++++++++
>   scripts/runqemu                          |   2 +-
>   20 files changed, 739 insertions(+), 1 deletion(-)
>   create mode 100644 meta/classes/testimage.bbclass
>   create mode 100644 meta/lib/oeqa/__init__.py
>   create mode 100644 meta/lib/oeqa/oetest.py
>   create mode 100644 meta/lib/oeqa/runtime/__init__.py
>   create mode 100644 meta/lib/oeqa/runtime/connman.py
>   create mode 100644 meta/lib/oeqa/runtime/dmesg.py
>   create mode 100644 meta/lib/oeqa/runtime/files/test.c
>   create mode 100644 meta/lib/oeqa/runtime/files/testmakefile
>   create mode 100644 meta/lib/oeqa/runtime/gcc.py
>   create mode 100644 meta/lib/oeqa/runtime/multilib.py
>   create mode 100644 meta/lib/oeqa/runtime/ping.py
>   create mode 100644 meta/lib/oeqa/runtime/rpm.py
>   create mode 100644 meta/lib/oeqa/runtime/smart.py
>   create mode 100644 meta/lib/oeqa/runtime/ssh.py
>   create mode 100644 meta/lib/oeqa/utils/__init__.py
>   create mode 100644 meta/lib/oeqa/utils/decorators.py
>   create mode 100644 meta/lib/oeqa/utils/oetelnetlib.py
>   create mode 100644 meta/lib/oeqa/utils/qemurunner.py
>   create mode 100644 meta/lib/oeqa/utils/sshcontrol.py
>

