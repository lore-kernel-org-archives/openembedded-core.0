Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Uc07C-0005fV-Tm
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 23:17:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 May 2013 13:57:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,665,1363158000"; d="scan'208";a="336999087"
Received: from envy2.dp.intel.com (HELO envy2.home) ([172.24.30.177])
	by fmsmga002.fm.intel.com with ESMTP; 13 May 2013 13:57:47 -0700
Message-ID: <519153C8.6060708@linux.intel.com>
Date: Mon, 13 May 2013 13:57:44 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.5.1
Subject: init-ifupdown: do_package_ipk failing
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
X-List-Received-Date: Mon, 13 May 2013 21:17:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

After removing a bbappend for init-ifupdown I am seeing failures in
do_package_ipk:

Build Configuration:
BB_VERSION        = "1.19.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-11.10"
TARGET_SYS        = "i586-poky-linux"
MACHINE           = "minnow"
DISTRO            = "poky"
DISTRO_VERSION    = "1.3+snapshot-20130513"
TUNE_FEATURES     = "m32 core2"
TARGET_FPU        = ""
meta-yocto        = "master:94d31b0b36be389710bfb1c5d7aeacda92efad5b"
meta-minnow       = "master:d474c4304dc1c9e9703fce0cd6a4329289681f92"
meta-intel        = "master:624aada76d2de84bd0263065b112ed4e94798b6b"
meta              = "master:94d31b0b36be389710bfb1c5d7aeacda92efad5b"

...

ERROR: Error executing a python function in
/build/yocto/master/minnow_201302231109
41/poky/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb:

OSError: [Errno 2] No such file or directory:
'/build/yocto/master/minnow_201302231
10941/build/tmp/work/core2-poky-linux/init-ifupdown/1.0-r2/packages-split/init-ifup
down-dbg'

ERROR: Error executing a python function in
/build/yocto/master/minnow_201302231109
41/poky/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb:

OSError: [Errno 2] No such file or directory:
'/build/yocto/master/minnow_201302231
10941/build/tmp/work/core2-poky-linux/init-ifupdown/1.0-r2/packages-split/init-ifup
down-dbg'

ERROR: The stack trace of python calls that resulted in this
exception/failure was:
ERROR:   File "do_package_ipk", line 194, in <module>
ERROR:
ERROR:   File "do_package_ipk", line 45, in do_package_ipk
ERROR:
ERROR: The code that was being executed was:
ERROR:      0190:        bb.utils.unlockfile(lf)
ERROR:      0191:
ERROR:      0192:
ERROR:      0193:
ERROR:  *** 0194:do_package_ipk(d)
ERROR:      0195:

ERROR: [From file: 'do_package_ipk', lineno: 194, function: <module>]

ERROR:      0041:        basedir = os.path.join(os.path.dirname(root))

ERROR:      0042:        arch = localdata.getVar('PACKAGE_ARCH', True)

ERROR:      0043:        pkgoutdir = "%s/%s" % (outdir, arch)

ERROR:      0044:        bb.mkdirhier(pkgoutdir)
ERROR:  *** 0045:        os.chdir(root)
ERROR:      0046:        from glob import glob
ERROR:      0047:        g = glob('*')
ERROR:      0048:        try:
ERROR:      0049:            del g[g.index('CONTROL')]
ERROR: [From file: 'do_package_ipk', lineno: 45, function: do_package_ipk]
ERROR: Function failed: do_package_ipk
ERROR: Logfile of failure stored in:
/build/yocto/master/minnow_20130223110941/build/tmp/work/core2-poky-linux/init-ifupdown/1.0-r0/temp/log.do_package_write_ipk.16210
ERROR: Task 1399
(/build/yocto/master/minnow_20130223110941/poky/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb,
do_package_write_ipk) failed with exit code '1'

I have done cleansstate and cleanall, but the error is repeatable.

Is anyone else experiencing this with init-ifupdown and ipk packaging?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


