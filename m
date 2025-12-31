Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76C8EE644F
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 11:47:51 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83907.1767181666334279622
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Dec 2025 03:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=aMq/Xnoz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-2025123111474333f7779cad000207de-2a_s8m@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025123111474333f7779cad000207de
        for <openembedded-core@lists.openembedded.org>;
        Wed, 31 Dec 2025 12:47:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=D0PSRxzYne/i7tbwF/2uB1O6qIxARacabQHJNYrJxZY=;
 b=aMq/XnozW9hlSCF9OhoRfoMhBvOUgpKp86MjlOp9U9asOBcom2wu0Oscl79TNo7cRxwqc1
 SeEmVrEn97LJhQ5U47lni7Zz2y9sxb/55leWcgi2mA79sL69+glr5Gaec0vq7DpJZp2rWacc
 tjCtHCHI7chnTF/Wl5GSA6y6JdGVC+AVbkQrRc/ud4RpX3YVdqf4ybRjtB1wepZkNqRgXIYj
 SOCKOMP/clsacv2BXYRi0M8wfv8K/2KuzG7d6rzYfJJnciHV8vcp8siRoqb9TCpSeiLHTnky
 gDobkjZKdBQgGBXsDyuJQ/TbXIUit2+944mirzZznywG3F9aeqwNAO8g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 00/14] IDE SDK Improvements
Date: Wed, 31 Dec 2025 12:46:30 +0100
Message-ID: <20251231114718.4031606-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Dec 2025 11:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228738

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Changes in comparison to v1:
- Try to fix https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3070
  The tests does remote debugging in Qemu. It sets a breakpoint on a line
  which is optimized out by the compiler. That's now fixed by setting the
  breakpoint on the next line, which is always there.
  So far this is understood and fixed. But what is not yet fully understood
  is: Why does it pass on x86 hosts but not on arm hosts?

- Improve remote debugging
  - Added GDB pretty-printing for C++ STL types (e.g., std::vector) to
    improve visibility during debugging.
  - Evaluated DEBUG_PREFIX_MAP for accurate source mapping in debug
    sessions.
  - Introduced gdbserver attach mode for more flexible remote debugging.
  - Moved the code that starts GDB sessions on the remote target from
    wrapper scripts into VSCode JSON files. This simplifies
    customization and improves transparency.

- Improve test coverage for ide-sdk features
  - Test the complete VSCode remote debugging workflow by reading VSCode
    JSON files.
  - Added example code using std::vector and tests for pretty-printing.
  - Extended the CMake and Meson examples with a service and added test
    coverage for the new GDB attach mode.
  - Added debug logging in DevtoolIdeSdkTests to aid troubleshooting.

- Fixes
  - Located and integrated bitbake-setup init-build-env for consistent
    environments.

- Misc
  - Added a compile step in ide-sdk tests to ensure builds are up to
    date. This is required when bitbake supports running do_install
    without dependent tasks.

Adrian Freihofer (14):
  devtool: ide-sdk find bitbake-setup init-build-env
  oe-selftest: devtool: DevtoolIdeSdkTests debug logging
  cpp-example: run as a service
  oe-selftest: devtool: check example services are running
  devtool: ide-sdk: add gdbserver attach mode support
  devtool: ide-sdk: move code to ide_none
  devtool: ide-sdk: make install_and_deploy script pass target arg
  devtool: ide-sdk: vscode replace scripts
  oe-selftest: devtool ide-sdk cover vscode remote debugging
  devtool: ide-sdk: evaluate DEBUG_PREFIX_MAP
  cpp-example: Add std::vector example
  devtool: ide-sdk: Support GDB pretty-printing for C++ STL types
  oe-selftest: devtool: add test for gdb pretty-printing
  oe-selftest: devtool: add compile step in ide-sdk tests

 .../recipes-test/cpp/cpp-example.inc          |  52 +-
 .../recipes-test/cpp/files/CMakeLists.txt     |  14 +-
 .../recipes-test/cpp/files/config.h.in        |  10 +
 .../cpp/files/cpp-example-lib.cpp             |  29 +
 .../cpp/files/cpp-example-lib.hpp             |   3 +
 .../recipes-test/cpp/files/cpp-example.conf   |   3 +
 .../recipes-test/cpp/files/cpp-example.cpp    |  46 +-
 .../recipes-test/cpp/files/cpp-example.init   |  84 +++
 .../cpp/files/cpp-example.service             |  12 +
 .../recipes-test/cpp/files/meson.build        |  18 +-
 .../cpp/files/test-cpp-example.cpp            |   2 +
 .../recipes-test/cpp/meson-example.bb         |   2 +
 meta/lib/oeqa/selftest/cases/devtool.py       | 539 +++++++++++++++---
 scripts/lib/devtool/ide_plugins/__init__.py   | 231 ++++----
 scripts/lib/devtool/ide_plugins/ide_code.py   | 159 ++++--
 scripts/lib/devtool/ide_plugins/ide_none.py   | 140 ++++-
 scripts/lib/devtool/ide_sdk.py                | 285 ++++++++-
 scripts/lib/devtool/standard.py               |   7 +-
 18 files changed, 1369 insertions(+), 267 deletions(-)
 create mode 100644 meta-selftest/recipes-test/cpp/files/config.h.in
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.conf
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.init
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.service

-- 
2.52.0


