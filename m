Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1CCCAC5AB
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:08:20 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.308.1758229694130845941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=MC6eCbF9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20250918210810f09ff3b07100020787-0jtrxt@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250918210810f09ff3b07100020787
        for <openembedded-core@lists.openembedded.org>;
        Thu, 18 Sep 2025 23:08:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=6duLSynwgoAhJALG+rWqccUGTpHRgF5I1oKDTvTkGvw=;
 b=MC6eCbF9j/VcrW/sMx+ssn0HuyVByaRaoj6DbnUdi782lOhLdAcofLqwisAKRUn+/6PbSR
 QXAA1pOMWftKQKa83/T7JKGW33BeV8SdMvdA+CTG2G2t/+FB8s3sGdC6ncfWZV/zYpez9fQb
 5uW88D3qUdIZPldrNaJln8+pnZKjPhQVw8N6ExRAf4BL12ypQhV6VrZvQzjzkN1i9W9p+2t8
 GDJO1eTrwhq/5vJPSOeSvZJKysOU7TzyXJtg1cTHFt8ZoqxLl+Zihy8L/HkMbA8ovzL7uJq+
 8DqPa+cLBU608TUks0xTTjZ2tt0K7nZjR6qm7V9sj9s1wK8nGZeuRSmg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 00/19] devtool: ide-sdk: Enhance debugging and testing
Date: Thu, 18 Sep 2025 23:07:02 +0200
Message-ID: <20250918210754.477049-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:08:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223670

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This patch series enhances the devtool ide-sdk functionality with
improvements to debugging capabilities, service integration, and
developer workflow optimization.

Enhancements:
- GDB Pretty-Printing: Added support for C++ STL type pretty-printing
  using GCC Python helper scripts, making complex STL containers
  readable during debugging sessions
- Multiple Debug Modes: Introduced gdbserver attach mode support for
  debugging running services alongside the existing --once mode
  - Service Detection: Automatic detection of binaries that run as
    services.
    For these binaries an additional --attach debug configuration gets
    generated.
- Improved Path Mapping: Enhanced DEBUG_PREFIX_MAP evaluation for
  better source file location during remote debugging
- BitBake-Free Deployment: Eliminated bitbake dependency during daily
  development workflow, making deployment self-contained and faster.
  This patch was rejected one or two years ago. Usually I try to not
  "send the same crap again". However, I think the situation changed a
  bit, since then:
  - All alternative approaches which were discussed turned out as not
    feasible. bitbake -b does not work.
    Bitbake's server mode does no longer observe the recipes via
    inotify. This gives up the idea of using bitbake as a server
    running behind an IDE.
  - The patch proved to work very well and did not break since more
    than a year or two? So it does not seem to be that problematic.
    If that would change, reverting it should be possible at any time.
  - Using the ide-sdk with this patch versus without this patch makes a
    major difference from a usability perspective. It's much quicker
    and it's much more predictable.
- Kernel Module Support: Basic support for kernel module development
  with proper environment setup. There is no automated deployment or
  e.g. support for kgdb. But compiling works as for other plugins.
- VSCode plugin: Write the commands for starting the remote gdbserver
  directly into the launch.json file which makes it much simpler to
  understand and tweak.

Testing improvements:
- Systemd/SysV Support: Extended C++ examples to run as both one-shot
  executables and long-running services with proper user/group
  management for two reasons:
  - Testing remote debugging with attached mode
  - Test the deploy script which runs on pseudo and should preserve the
    user and group flags also during the development.
- Added full remote debugging test coverage for VSCode with launch.json
  and tasks.json with Qemu.
- GDB pretty-printing validation for STL containers
- Proper file ownership verification with pseudo
- Added comprehensive debug logging and better error reporting for
  oe-selftest -r devtool.DevtoolIdeSdkTests

Adrian Freihofer (19):
  fedora_essential.sh: add util-linux-script package
  oe-selftest: cpp-example meson version warning
  oe-selftest: devtool: add missing imports
  meta-skeleton: fix spaces in assignment
  devtool: ide-sdk deploy-target without bitbake
  oe-selftest: devtool: DevtoolIdeSdkTests debug logging
  cpp-example: run as a service
  oe-selftest: devtool: check example services are running
  devtool: ide-sdk: make install_and_deploy script pass target arg
  devtool: ide-sdk: add gdbserver attach mode support
  devtool: ide-sdk: vscode remove scripts
  devtool: ide-sdk: move code to ide_none
  oe-selftest: devtool ide-sdk cover vscode remote debugging
  devtool: ide-sdk: evaluate DEBUG_PREFIX_MAP
  cpp-example: Add std::vector example
  devtool: ide-sdk: Support GDB pretty-printing for C++ STL types
  oe-selftest: devtool: add test for gdb pretty-printing
  module.bbclass: move environment setup to kernel_module.py
  devtool: ide-sdk: support kernel module development

 .../host_packages_scripts/fedora_essential.sh |   2 +-
 .../recipes-test/cpp/cpp-example.inc          |  52 +-
 .../recipes-test/cpp/files/CMakeLists.txt     |  14 +-
 .../recipes-test/cpp/files/config.h.in        |  10 +
 .../cpp/files/cpp-example-lib.cpp             |  29 +
 .../cpp/files/cpp-example-lib.hpp             |   3 +
 .../recipes-test/cpp/files/cpp-example.conf   |   3 +
 .../recipes-test/cpp/files/cpp-example.cpp    |  46 +-
 .../recipes-test/cpp/files/cpp-example.init   |  84 +++
 .../cpp/files/cpp-example.service             |  12 +
 .../recipes-test/cpp/files/meson.build        |  21 +-
 .../cpp/files/test-cpp-example.cpp            |   2 +
 .../recipes-test/cpp/meson-example.bb         |   2 +
 .../linux/linux-yocto-custom.bb               |   2 +-
 meta/classes-recipe/module.bbclass            |  21 +-
 meta/lib/oe/kernel_module.py                  |  22 +
 meta/lib/oeqa/selftest/cases/devtool.py       | 494 +++++++++++++++---
 scripts/lib/devtool/ide_plugins/__init__.py   | 234 ++++-----
 scripts/lib/devtool/ide_plugins/ide_code.py   | 222 ++++++--
 scripts/lib/devtool/ide_plugins/ide_none.py   | 140 ++++-
 scripts/lib/devtool/ide_sdk.py                | 384 +++++++++++++-
 scripts/lib/devtool/standard.py               |   7 +-
 22 files changed, 1483 insertions(+), 323 deletions(-)
 create mode 100644 meta-selftest/recipes-test/cpp/files/config.h.in
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.conf
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.init
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.service
 create mode 100644 meta/lib/oe/kernel_module.py

-- 
2.51.0


