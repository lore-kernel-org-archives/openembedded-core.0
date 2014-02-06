Return-Path: <dave.lerner@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B1F536C83B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 16:12:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s16GCaHV022929
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Feb 2014 08:12:36 -0800 (PST)
Received: from ord-dlerner-l8.dgvlm.wrs.com (128.224.65.202) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 6 Feb 2014 08:12:37 -0800
From: Dave Lerner <dave.lerner@windriver.com>
To: <cristiana.voicu@intel.com>
Date: Thu, 6 Feb 2014 10:12:10 -0600
Message-ID: <1391703131-8504-1-git-send-email-dave.lerner@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: valgrind: add ptest integration
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
X-List-Received-Date: Thu, 06 Feb 2014 16:12:37 -0000
Content-Type: text/plain


Hello Christiana,

The attached patch adds PTEST integration to valgrind.  The patch
was built and tested as shown in the "CONFIGURATION", "BUILD TESTS", and
"RUNTIME TESTS" sections below. A summary of changes is shown in
"COMMIT STAT".

Thanks,
Dave Lerner 

COMMIT STAT
===========
Commit ID: 9a34408d2a4fedd392a57fc103cc9956b6572537 Mon Sep 17 00:00:00 2001
Author: Dave Lerner <dave.lerner@windriver.com>
Date: Mon, 27 Jan 2014 11:46:19 -0600


valgrind: Integration of regression tests to ptest

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
---
 .../valgrind/valgrind/add-ptest.patch              |  205 ++++++++++++++++++++
 .../valgrind/valgrind/force-nostabs.patch          |   42 ++++
 .../valgrind/remove-arm-variant-specific.patch     |   67 +++++++
 .../valgrind/remove-ppc-tests-failing-build.patch  |   75 +++++++
 meta/recipes-devtools/valgrind/valgrind/run-ptest  |   11 ++
 meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |   58 +++++-
 6 files changed, 456 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/add-ptest.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/force-nostabs.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch
 create mode 100755 meta/recipes-devtools/valgrind/valgrind/run-ptest



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


