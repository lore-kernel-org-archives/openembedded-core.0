Return-Path: <dave.lerner@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA846ED66
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 15:28:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1FFSJ3g014246
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 15 Feb 2014 07:28:20 -0800 (PST)
Received: from ord-dlerner-l8.dgvlm.wrs.com (128.224.65.202) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sat, 15 Feb 2014 07:28:19 -0800
From: Dave Lerner <dave.lerner@windriver.com>
To: <sgw@linux.intel.com>
Date: Sat, 15 Feb 2014 09:27:30 -0600
Message-ID: <1392478051-10530-1-git-send-email-dave.lerner@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/1] valgrind: integration of regression tests to ptest
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
X-List-Received-Date: Sat, 15 Feb 2014 15:28:23 -0000
Content-Type: text/plain

Hello Saul,

V2 patch includes following changes:
1) no PR bump in recipe
2) lower-cased commit header

Regards,
Dave Lerner

--------------
The attached patch adds PTEST integration to valgrind.  The patch
was built and tested as shown in the "CONFIGURATION", "BUILD TESTS", and
"RUNTIME TESTS" sections below. A summary of changes is shown in
"COMMIT STAT".

Thanks,
Dave Lerner 

COMMIT STAT
===========
commit 2e539fd064c4ef91a1b9593edfadffffe0f628d1
Author: Dave Lerner <dave.lerner@windriver.com>
Date:   Mon Jan 27 11:46:19 2014 -0600

    valgrind: integration of regression tests to ptest
    
    Modifies valgrind's regression test framework to be compatible
    with the yocto PTEST framework as follows:
     * existing recipe valgrind*bb adds new methods: do_compile_ptest and
       do_install_ptest.
     * new file run-ptest adds the wrapper interface to the valgrind
       regression test script vg_regtest.
     * existing valgrind regression test script 'vg_regtest' changes
       to report the status of the valgrind component tests in the
       format that PTEST expects, instead of the valgrind formats, but only
       when vg_regtest is invoked with an optional --yocto-ptest argument
     * four new patches disable building tests that don't compile with
       the yocto compiler and default options. See the patches for details.
    
    Signed-off-by: Dave Lerner <dave.lerner@windriver.com>

 .../valgrind/valgrind/add-ptest.patch              |  205 ++++++++++++++++++++
 .../valgrind/valgrind/force-nostabs.patch          |   42 ++++
 .../valgrind/remove-arm-variant-specific.patch     |   67 +++++++
 .../valgrind/remove-ppc-tests-failing-build.patch  |   75 +++++++
 meta/recipes-devtools/valgrind/valgrind/run-ptest  |   11 ++
 meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |   56 +++++-
 6 files changed, 455 insertions(+), 1 deletion(-)


CONFIGURATION
=============
Appended to each conf/local.conf ...
MACHINE = 'some-machine-name'
SSTATE_DIR = "/ord-dlerner-l81/dlerner/poky_16/sstate-cache"
DISTRO_FEATURES_append = " ptest"
EXTRA_IMAGE_FEATURES  = "debug-tweaks dbg-pkgs ptest-pkgs"
IMAGE_INSTALL_append  = " valgrind ptest-runner"


BUILD TESTS
===========
Configuration fails with reports that valgrind is not supported for:
    qemuarm, qemumips*, routerstationpro
    ERROR: Nothing RPROVIDES 'valgrind' (but ...core-image-basic.bb
        RDEPENDS on or otherwise requires it)
    ERROR: valgrind was skipped: incompatible with host
        mips-poky-linux (not in COMPATIBLE_HOST)
    NOTE: Runtime target 'valgrind' is unbuildable, removing...

Configuration and 'bitbake core-image-basic' passes for:
    beagleboard, mpc8316-rdb, qemuppc, qemux86, qemux86-64

RUNTIME TESTS
=============
The tests are divided into per tool tests and then a common set of
tests across all tools in the directory 'none'.  

The output per PTEST documentation looks like the following snippet:
    PASS: cachegrind/tests/chdir
    PASS: cachegrind/tests/clreq
    PASS: cachegrind/tests/dlclose
    PASS: cachegrind/tests/notpower2
    FAIL: cachegrind/tests/wrap5
    PASS: callgrind/tests/clreq


Below is the output summarized for two bsps. Note that this is not
the output produced by this commit.

qemux86-64
----------
    cachegrind:
      PASS count=4  FAIL count=1  SKIP count=0
    callgrind:
      PASS count=13  FAIL count=0  SKIP count=0
    drd:
      PASS count=106  FAIL count=10  SKIP count=7
    helgrind:
      PASS count=20  FAIL count=31  SKIP count=1
    memcheck:
      PASS count=116  FAIL count=78  SKIP count=4
    massif:
      PASS count=9  FAIL count=26  SKIP count=0
    none:
      PASS count=101  FAIL count=4  SKIP count=16

qemux86
------
    cachegrind:
      PASS count=5  FAIL count=1  SKIP count=0
    callgrind:
      PASS count=13  FAIL count=0  SKIP count=0
    drd:
      PASS count=106  FAIL count=11  SKIP count=6
    helgrind:
      PASS count=20  FAIL count=31  SKIP count=1
    memcheck:
      PASS count=126  FAIL count=78  SKIP count=2
    massif:
      PASS count=9  FAIL count=26  SKIP count=0
    none:
      PASS count=70  FAIL count=3  SKIP count=1


qemuppc
-------
All of the tests fail for the valgrind tools cachegrind, drd, helgrind,
massif, memcheck, that are not skipped due to preconditions failing.
The failures of any test match the failure message for each valgrind
tool run agains the program /bin/ls.


