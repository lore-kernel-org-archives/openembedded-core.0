Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id EB47C7687B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 19:00:35 +0000 (UTC)
Received: by iofb144 with SMTP id b144so209786401iof.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 12:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to:cc
	:content-type;
	bh=IlDlr/Y/wAlFS7ibMSWu+3yIoff1Zwh+G1mcPQVmUpw=;
	b=QDGoRbbzI1PVfyg071YtdisiyJzR5m954t3ton1hAVfpaAfFZFk+X4WL7FL0oBkr8X
	F8fbT6rLAvNRN7BJNPzaBRZGKIzAfjfK3c3BpbnqPXaPx+su+oM1eVvuN32qFG52Yb9a
	svD8P4LDtWaSS3eIDjvCCGwLJRhgF3/K+A2PTPrl4BUprgKmqCXX/dn2d70i1Kt0Bn3M
	hPkPgXsowRw5FaAzDvh4GTCP9+jhA3+9LgQ2CXmaEgGo5IyAd+LQkUElAZg5k+a0JAad
	WYIFGuCCg/jiFM+lXbYj48b2Aj+oASycK5rhUzJkSfnN/LXMLI8swEosD+Jk+ZuPvafh
	v7Hw==
X-Gm-Message-State: ALoCoQnZ8HyWXLglg7HGZvONE7h/VWkABnxKHdO3SXD3XljYjfa/F/rfaH/XykGUh/qi09x4s1Bg
X-Received: by 10.107.19.161 with SMTP id 33mr41738032iot.62.1442343633560;
	Tue, 15 Sep 2015 12:00:33 -0700 (PDT)
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com.
	[209.85.213.169])
	by smtp.gmail.com with ESMTPSA id k2sm210901igx.0.2015.09.15.12.00.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Sep 2015 12:00:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igcrk20 with SMTP id rk20so20327416igc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 12:00:31 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.80.12 with SMTP id n12mr70157igx.5.1442343631391; Tue, 15
	Sep 2015 12:00:31 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 15 Sep 2015 12:00:31 -0700 (PDT)
Date: Tue, 15 Sep 2015 16:00:31 -0300
Message-ID: <CAP9ODKp9wA6oCdU6_e2T05ryMtdygBtA25EcyZhCGsPUtWOX+A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: perf triggering a QA error
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
X-List-Received-Date: Tue, 15 Sep 2015 19:00:37 -0000
Content-Type: text/plain; charset=UTF-8

Hello folks,

It seems the commit:

commit 43f965061f8af4c4537e9d9c0257253e613a616d
Author: Roy Li <rongqing.li@windriver.com>
Date:   Wed Aug 26 13:58:17 2015 +0800

    perf: fix the install-python_ext

    1. $(grep xxx xxx) never returns 0, it maybe return empty or string, and
    can not compare with 0, this fixes that python module never are installed.

    2. python library is installed into /usr/lib/ by default, but we expect
    it is installed into ${libdir}, so add --install-lib parameter for python
    setup.py to set the library dir;
    this fixes not shipped warning, since python modules are installed into
    /usr/lib/, but FILE_${PN}-python expects it is under ${libdir}, which is
    /usr/lib64/ for 64bit machine

    3. the makefile target install-python_ext is moved from Makefile to
    Makefile.perf from linux v3.13, so match install-python_ext in Makefile.*
    and --root='/\$(DESTDIR_SQ)' before linux v3.13 will install the target
    python library to native sysroot, so replace it with --prefix as after linux
    3.13;
    this fixes not shipped warning, and install target files to native dir, like
    below:
    ERROR: QA Issue: perf: Files/directories were installed but not
shipped in any package:
      /home
      /home/pokybuild
      /home/pokybuild/yocto-autobuilder
      /home/pokybuild/yocto-autobuilder/yocto-worker
      /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb
      /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build
      /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build
      /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp
      /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots
      /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux
      /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr
      /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib
      /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7
      /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages
      /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/perf.so
      /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-fsl-ppc-lsb/build/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/perf-0.1-py2.7.egg-info

    Signed-off-by: Roy Li <rongqing.li@windriver.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>


did not address the issue.

I am capable of reproduce the issue in kernel 3.14. See the log below:

NOTE: make -j 2 -C $S/tools/perf O=$B
CROSS_COMPILE=arm-oel-linux-gnueabi- ARCH=arm
CC=arm-oel-linux-gnueabi-gcc  -march=armv7-a -marm  -mthumb-interwork
-mfloat-abi=hard -mfpu=neon -mtune=cortex-a9
--sysroot=$TMPDIR/sysroots/imx6sxsabresd AR=arm-oel-linux-gnueabi-ar
EXTRA_CFLAGS=-ldw perfexecdir=/usr/lib/perf NO_GTK2=1 NO_DWARF=1
NO_LIBUNWIND=1 NO_LIBDW_DWARF_UNWIND=1 NO_LIBNUMA=1 prefix=/usr
bindir=/usr/bin sharedir=/usr/share sysconfdir=/etc
perfexecdir=/usr/lib/perf/perf-core ETC_PERFCONFIG=../etc
sharedir=share mandir=share/man infodir=share/info
DESTDIR=$WORKDIR/image install-python_ext
make: Entering directory '$S/tools/perf'
  BUILD:   Doing 'make -j8' parallel build
Auto-detecting system features:
...                     backtrace: [ on  ]
...                         dwarf: [ on  ]
...                fortify-source: [ on  ]
...                         glibc: [ on  ]
...                          gtk2: [ OFF ]
...                  gtk2-infobar: [ OFF ]
...                      libaudit: [ OFF ]
...                        libbfd: [ on  ]
...                        libelf: [ on  ]
...             libelf-getphdrnum: [ on  ]
...                   libelf-mmap: [ on  ]
...                       libnuma: [ OFF ]
...                       libperl: [ on  ]
...                     libpython: [ on  ]
...             libpython-version: [ on  ]
...                      libslang: [ on  ]
...                     libunwind: [ OFF ]
...                       on-exit: [ on  ]
...            stackprotector-all: [ on  ]
...                       timerfd: [ on  ]
config/Makefile:350: No libaudit.h found, disables 'trace' tool,
please install audit-libs-devel or libaudit-dev
'$TMPDIR/sysroots/x86_64-linux/usr/bin/python-native/python'
util/setup.py --quiet install --root='/$WORKDIR/image'
make: Leaving directory '$S/tools/perf'
DEBUG: Shell function do_install finished

and the error:

ERROR: QA Issue: perf: Files/directories were installed but not
shipped in any package:
  /home
  /home/otavio
  /home/otavio/src
  /home/otavio/src/yocto
  /home/otavio/src/yocto/build
  /home/otavio/src/yocto/build/tmp
  /home/otavio/src/yocto/build/tmp/sysroots
  /home/otavio/src/yocto/build/tmp/sysroots/x86_64-linux
  /home/otavio/src/yocto/build/tmp/sysroots/x86_64-linux/usr
  /home/otavio/src/yocto/build/tmp/sysroots/x86_64-linux/usr/lib
  /home/otavio/src/yocto/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7
  /home/otavio/src/yocto/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages
  /home/otavio/src/yocto/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/perf-0.1-py2.7.egg-info
  /home/otavio/src/yocto/build/tmp/sysroots/x86_64-linux/usr/lib/python2.7/site-packages/perf.so
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install. [installed-vs-shipped]

Any thoughts?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

