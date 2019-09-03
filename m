Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id BDC7F606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 16:57:03 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id w11so8174060plp.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 09:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=WzKIjKcG7adfnqEuZk55KLEqPTXF1xvlgVMjORhejJo=;
	b=aEDFFG1MRr8c+JMyOiRH74XwlSz3qH248eQ8Z4QCxUYUi8trnI0gd/6ISsy6/vaybw
	c+ole/60SaKbd1m/ggd2rWKH4kkVZ9xorglqRpmtO2xQ0aH87BIc+1UAzOvWL0hEWpHh
	VSJExYxubcgTqiSZbHwlCFEYZCrdZJcTtAsOfGct+KDHhqaJZSojhuOMwt9FqXxC/FyO
	lKgsDMm28YKSG/5i1qwPNdrSFQrS4vuyleT5A7ULtiPt0ubDCeI/TXW0NLtL0VM5kcmc
	fZTST/KuruIlQRnX0sxIeL3RXBfvKLK2uclFk3b470Uu2tPAR4p7RH0INIm3otABVkPj
	yxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=WzKIjKcG7adfnqEuZk55KLEqPTXF1xvlgVMjORhejJo=;
	b=GxKiVGlLPoZZWLfEYkxM4XmxGRVbrWoKK7vzcUkR9AAvuXvwuPRAOLYbrDHmqUgrQ/
	2Yc72mU9rOf5ZtFB/QmdDj2jL5mcDV0Hcc8bokQoR+E1bBnlL4q2knFmZ0zWtqHhiDqn
	vQjviqDl2CPs5FT+Kgrtf67CIwPpiH4UP9DZfll6zr6LEQbDwiUlzckd6D0b050/EqzM
	cM351fEYfMRDI6MFOFvQpiy79hNa6QXx3cC+b2i8/NqUHhjNZGMpAEpfsOLkBpSkK3Kr
	Fi4NwHpJsnWEXjXS/HO/GXT6qnaWTDip4XG4b1GGlcMRzGQRjL7AU83f8zlOFIbdZH6v
	bGiw==
X-Gm-Message-State: APjAAAXsqChCIYz9IW3bTNmTKtXMRYvKHRBZCKSZBEa0wpiHs3/6Mk5s
	VMxe44obuubkJXtnCk8ucAo64FLdIekLFA==
X-Google-Smtp-Source: APXvYqx/vTV7Oq7CEeG6THEurYgOo2/sBKL96mN5sgY7dpFgFuL4S5UEx99Utp7oE8xqBzIIo+UCsw==
X-Received: by 2002:a17:902:9b83:: with SMTP id
	y3mr3414598plp.143.1567529824497; 
	Tue, 03 Sep 2019 09:57:04 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	t5sm83587pjw.15.2019.09.03.09.57.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 09:57:03 -0700 (PDT)
Date: Tue, 03 Sep 2019 16:56:41 +0000
Message-Id: <20190903165641.16597-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2 00/12] Add gnu testsuite execution for OEQA
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
X-List-Received-Date: Tue, 03 Sep 2019 16:57:04 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This series adds support to execute the gnu test suites for binutils,
gcc and glibc. With the intention for enabling automated test running of
these test suites within the OEQA framework such that they can be
executed by the Yocto Autobuilder.

The test suites covered need significant resources or build artifacts
such that running them on the target is undesirable which rules out the
use of ptest. Because of this the test suites can be run on the build
host and call out to the target for execution (via ssh or using qemu
usermode).

The following implementation adds a do_check task to gcc-runtime, and
creates recipes for binutils and glibc in order to execute the test
suite on the build host. For binutils the reason for a separate recipe
is due to test suite dependence on target libraries (libgcc, glibc) and
the issues associated with a -cross recipe depending on target
libraries. For glibc the reason for a recipe is due to the dependency
chain (libgcc -> glibc -> libgcc-initial) and the test suite dependence
on libgcc.

Target execution is another important issue specifically since target
execution is slow to extremely slow depending on the physical or
emulated target performance. In order to provide faster execution
performance qemu linux-user is implemented alongside qemu system
emulation (via ssh+nfs). In initial testing qemu linux user vs qemu
system emulation provided performance gains of between 10x to 60x whilst
initially having small pass/fail differences. Further work as covered in
this series reduces the pass/fail differences for gcc/gcc-runtime close
to 0, which can be further reduced by marking known failures with test
result filtering.

However glibc is more strict with its expectations of CPU implementation
as well as syscall behaviour. Additionally glibc expects to be able to
execute OS tools such as 'sh' and 'echo' of which is not easy to provide
in the recipe-sysroot (bindir is not populated into the sysroot). As
such correct test results for glibc rely on execution with qemu system
emulation or on a physical target. This series however still includes
qemu user execution for glibc which can be useful (especially on slow
targets) assuming the known failing tests are excluded.

This series also introduces some OEQA test cases which cover running the
test suites. The test cases are split into binutils, gcc and glibc.
Individual test cases provide execution of the sub-suites of tests
within each target. For example binutils has binutils, gas and ld and
suites which can each be executed independently.

The test cases populate the individual test suite test cases into
testresults similar to ptestresults so that resulttool can analyse them.
Filtering of the failed test cases where expected failures occur is not
included in this series.

The OEQA test cases implement execution on qemu linux user by default.
Subclasses implement qemu system emulation setup and configuration for
running the tests.

Changes in v2:
- Dropped merged patches from series:
  - scripts/lib/resulttool/report.py: Add more result types
  - oeqa/utils/nfs: Add unfs_server function to setup a userspace NFS server
  - binutils: Fix mips patch which changes default emulation
- Added dejagnu recipe to oe-core, imported from meta-oe
- Changes from binutils-cross to binutils-cross-testsuite recipe
- Dropped gold and libiberty test suite execution
- Changes from gcc-cross to only gcc-runtime for gcc/g++ tests
- BUILD_TEST_* to TOOLCHAIN_TEST_*
- New changes to oeqa/core for tagging tests, and patches to fix up
  broken tests in the oeqa/core testsuite
- New changes to oeqa/selftest for '--run-only-tags' and
  '--run-exclude-tags'
- Changes to new selftest tests to populate results like ptestresults
- Mark new selftest tests with 'machine' tag
---

Nathan Rossi (12):
  dejagnu: Add dejagnu for binutils/gcc test suites
  binutils-cross-testsuite: Create recipe for test suite execution
  gcc-runtime: Add do_check task for executing gcc test suites
  gcc-common.inc: Process staging fixme with correct target/native
    sysroot
  glibc-testsuite: Create a recipe to implement glibc test suite
  oeqa/core/tests: Skip test_fail_duplicated_module
  oeqa/core/tests: Fix test_data module tests
  oeqa/core: Rework OETestTag and remove unused OETestFilter
  oeqa/selftest: Add test run filtering based on test tags
  oeqa/selftest/binutils: Create selftest case for binutils test suite
  oeqa/selftest/gcc: Create selftest case for gcc test suite
  oeqa/selftest/glibc: Create selftest case for glibc test suite

 meta/lib/oeqa/core/context.py                 |   4 +-
 meta/lib/oeqa/core/decorator/__init__.py      |  20 ++--
 meta/lib/oeqa/core/decorator/oetag.py         |  27 -----
 meta/lib/oeqa/core/loader.py                  |  61 +++-------
 meta/lib/oeqa/core/tests/cases/data.py        |   2 +-
 meta/lib/oeqa/core/tests/cases/oetag.py       |  21 +++-
 meta/lib/oeqa/core/tests/common.py            |   4 +-
 meta/lib/oeqa/core/tests/test_data.py         |  10 +-
 meta/lib/oeqa/core/tests/test_decorators.py   |  77 +++++++-----
 meta/lib/oeqa/core/tests/test_loader.py       |  26 +---
 meta/lib/oeqa/selftest/cases/binutils.py      |  64 ++++++++++
 meta/lib/oeqa/selftest/cases/gcc.py           | 111 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/glibc.py         |  97 +++++++++++++++
 meta/lib/oeqa/selftest/context.py             |  11 ++
 .../glibc/glibc-testsuite_2.30.bb             |  51 ++++++++
 .../glibc/glibc/check-test-wrapper            |  71 +++++++++++
 .../binutils/binutils-cross-testsuite_2.32.bb |  83 +++++++++++++
 .../recipes-devtools/dejagnu/dejagnu_1.6.2.bb |  15 +++
 meta/recipes-devtools/gcc/gcc-common.inc      |   2 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc     |  42 +++++++
 meta/recipes-devtools/gcc/gcc-testsuite.inc   | 106 +++++++++++++++++
 21 files changed, 762 insertions(+), 143 deletions(-)
 delete mode 100644 meta/lib/oeqa/core/decorator/oetag.py
 create mode 100644 meta/lib/oeqa/selftest/cases/binutils.py
 create mode 100644 meta/lib/oeqa/selftest/cases/gcc.py
 create mode 100644 meta/lib/oeqa/selftest/cases/glibc.py
 create mode 100644 meta/recipes-core/glibc/glibc-testsuite_2.30.bb
 create mode 100644 meta/recipes-core/glibc/glibc/check-test-wrapper
 create mode 100644 meta/recipes-devtools/binutils/binutils-cross-testsuite_2.32.bb
 create mode 100644 meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-testsuite.inc
---
2.23.0.rc1

