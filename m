Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 45D296BE2D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 05:06:40 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id e11so743809pga.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 22:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=hj2hy+dfBfQb8lA/4W4cyIk6xQeg9RyH5JbqizSUHUM=;
	b=fRzqLQ5kHBJL5RhhCeWAccvZoOF7fVME3T+Onboe4FoATn0af9l/by/XNe2wRM/l2h
	9nF8d11m1OOWRE/Ovd6/TKx2h2uOLl4bsic9taI6+lkz2y/vS7PVr+3FxCmZM/zcRmXW
	rWIT8HngnLIYdimZ85bL1U5PaYMhEznS224HESoXQyq9ovduqE2t4hOsZ17bMHsBk21/
	MntaHOrlo6/XJFstmg/a7hE6hqMcEZFfSb66WUmkxUoUbk93+GADjUK5IYpzXizFn3Yn
	CkRmW2+9PzqjjRf5eCZ+LE4rwppalNvlJuVwOtBYPnwMU5m8P+derVquGNnpzP3mjCs3
	WynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=hj2hy+dfBfQb8lA/4W4cyIk6xQeg9RyH5JbqizSUHUM=;
	b=cbeuKX712RfKqgCWcz7N/v30oPd8BBwpXo8vmD77u8z9e4KPSK75i3zQ+VqhKuvR5H
	rMnYz6HzmPeVx4rKYZ2qVij3z1MECkTU5hnTfaX6IvD9ta4D8syQZ/C+RhJdEqz0YM18
	XWjjHnXWtQaIjw7oO4RqE0NZ3Vz7Bd9jZK6nLlxquaJqd7/OVpbcNZOeeFxSytomRsXU
	ErTxIjEMu5eIak3m+5pMwYnObkMVaOcUheZMghND56jrhkmw00iY0JHO5TbeeWhSu0l/
	Mwc///umbUIxbBkw6zoI8bthA0aUFLOkQ9Vt5sJr8r/qwXMhpD0k06c1mgfVW/o49aCb
	eeZA==
X-Gm-Message-State: APjAAAWclAvhhLMRVtjSXID8fVYfzcDnisSzhRZcJsUoAGuMJEBxxHfR
	G9/9sfQ8vf8L1aUFetFMuVP76w==
X-Google-Smtp-Source: APXvYqwt9NCyB2QnsjKAj0gvk1QRkfuCOpWdeUsS7NZuOwHs9PpctIQDDHTH0udY6mI3OOVk09QLEw==
X-Received: by 2002:a17:90a:9bc3:: with SMTP id
	b3mr2356699pjw.103.1566968801093; 
	Tue, 27 Aug 2019 22:06:41 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	r3sm1304624pfr.101.2019.08.27.22.06.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 22:06:40 -0700 (PDT)
Date: Wed, 28 Aug 2019 05:06:29 +0000
Message-Id: <20190828050629.6392-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 0/11] Add gnu testsuite execution for OEQA
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
X-List-Received-Date: Wed, 28 Aug 2019 05:06:40 -0000
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

The following implementation adds a do_check task to binutils-cross,
gcc-cross and gcc-runtime in order to execute the test suite on the
build host. For glibc, a second recipe is created which includes the
base glibc recipe. The reason for this is due to the libgcc -> glibc
-> libgcc-initial dependency chain and the requirements of the test
suite to have libgcc for compilation and execution testing.

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

           | binutils   | gas        | gold      | ld        | libiberty
arm        |    0/  201 |    0/  862 |   0/   26 |   1/ 1587 |   0/   28
arm64      |    0/  200 |    0/  442 |   0/    9 |   0/ 1591 |   0/   28
mips       |    0/  224 |    0/ 7214 |   1/    5 |  21/ 1786 |   0/   28
ppc        |    0/  197 |    1/  264 |   0/    5 |   0/ 1492 |   0/   28
x86-64     |    0/  243 |    0/ 1185 |   0/   11 |   0/ 2085 |   0/   28

           | gcc        | g++        | libatomic | libgomp   | libitm    | libstdc++-v3
arm        |  31/121900 |   1/127963 |   0/   49 |   0/ 2519 |   0/   46 |     19/12814
arm64      |  32/129632 |   0/128539 |   0/   54 |   0/ 2519 |   0/   46 |      1/12813
mips       | 138/132198 |  20/127706 |   0/   49 |   2/ 2519 |           |     24/12810
ppc        | 356/119730 |  19/128635 |   0/   49 |   2/ 2519 |   0/   46 |     33/13020
x86-64     |  44/135082 |   0/131493 |   0/   54 |   0/ 2526 |   0/   46 |      6/13037
x86-64-kvm |  29/135322 |   0/131493 |   0/   54 |   1/ 2526 |  18/   46 |     49/13034

           | glibc
arm        |   65/ 5240
arm64      |   76/ 5994
mips       |   79/ 5199
ppc        | 1223/ 5254
x86-64     | 1457/ 6101
x86-64-kvm |   47/ 6092

This series also introduces some OEQA test cases which cover running the
test suites. The test cases are split into binutils, gcc and glibc.
Individual test cases provide execution of the sub-suites of tests
within each target. For example binutils has binutils, gas, gold, ld and
libiberty suites which can each be executed independently.

The test cases populate the individual test suite test cases into the
testresults so that resulttool can analyse them. Filtering of the failed
test cases where expected failures occur is not included in this series.

The OEQA test cases implement execution on qemu linux user by default.
Subclasses implement qemu system emulation setup and configuration for
running the tests.
---

Nathan Rossi (11):
  binutils: Add do_check task for executing binutils test suite
  gcc-cross: Add do_check task for executing gcc test suite
  gcc-runtime: Add do_check task for executing gcc-runtime test suites
  gcc-common.inc: Process staging fixme with correct target/native
    sysroot
  glibc-testsuite: Create a recipe to implement glibc test suite
  binutils: Fix mips patch which changes default emulation
  oeqa/selftest/binutils: Create selftest case for binutils test suite
  oeqa/selftest/gcc: Create selftest case for gcc test suite
  oeqa/utils/nfs: Add unfs_server function to setup a userspace NFS
    server
  oeqa/selftest/glibc: Create selftest case for glibc test suite
  scripts/lib/resulttool/report.py: Add more result types

 meta/lib/oeqa/selftest/cases/binutils.py      |  95 ++++++++++++++++
 meta/lib/oeqa/selftest/cases/gcc.py           | 107 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/glibc.py         |  91 +++++++++++++++
 meta/lib/oeqa/utils/network.py                |   4 +-
 meta/lib/oeqa/utils/nfs.py                    |  39 +++++++
 .../glibc/glibc-testsuite_2.30.bb             |  51 +++++++++
 .../glibc/glibc/check-test-wrapper            |  71 ++++++++++++
 .../binutils/binutils-cross.inc               |  28 +++++
 ...e-default-emulation-for-mips64-linux.patch |   9 +-
 meta/recipes-devtools/gcc/gcc-common.inc      |   2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc       |  41 +++++++
 meta/recipes-devtools/gcc/gcc-runtime.inc     |  37 ++++++
 meta/recipes-devtools/gcc/gcc-testsuite.inc   | 106 +++++++++++++++++
 scripts/lib/resulttool/report.py              |   6 +-
 14 files changed, 675 insertions(+), 12 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/binutils.py
 create mode 100644 meta/lib/oeqa/selftest/cases/gcc.py
 create mode 100644 meta/lib/oeqa/selftest/cases/glibc.py
 create mode 100644 meta/lib/oeqa/utils/nfs.py
 create mode 100644 meta/recipes-core/glibc/glibc-testsuite_2.30.bb
 create mode 100644 meta/recipes-core/glibc/glibc/check-test-wrapper
 create mode 100644 meta/recipes-devtools/gcc/gcc-testsuite.inc
---
2.23.0.rc1

