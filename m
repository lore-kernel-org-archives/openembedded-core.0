Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B36E9412D
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 08:47:39 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60917.1767084455798878854
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 00:47:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=Inu2vN/q;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20251230084732280f1ad78d0002075b-245s_a@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20251230084732280f1ad78d0002075b
        for <openembedded-core@lists.openembedded.org>;
        Tue, 30 Dec 2025 09:47:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=uihaT5OUliwpoVMv2UrzWw+Mlb2AjUe12n1nGLlYM24=;
 b=Inu2vN/qyRyELt5kCZCnJdGNWsDqkWOCduYUX9PSe07DZUlpvntsMZqbsDHdrTXWYgH0Kp
 wdef+wwmr/Ocx5SYG2VZJ5AVtMQWLhh+Wxiy1Q6jdONVoTmWYiTJE7FLcfcTnuwki1fl6t7R
 DLiZSBRNuXQXf+v4N1w5Q+3OyUOWyhXZ7a/dVDaHKoD978Rk0P0U2EVvDRi/9MIu3hGiqHds
 3dqjjfVg7qZbJ4WKgOMPGEn5hSLZFz+D98WfvfJ8JHyPL1iFtQghJeF578KindruHIuS7J7U
 Js9Xuy9BgtHYBOtzsSwoYJO732VAFSJ8JlYp1kmOg23Ttf7ouwXn8IpQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 00/14] IDE SDK Improvements
Date: Tue, 30 Dec 2025 09:46:40 +0100
Message-ID: <20251230084720.2371227-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 08:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228628

From: Adrian Freihofer <adrian.freihofer@siemens.com>

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
 meta/lib/oeqa/selftest/cases/devtool.py       | 538 +++++++++++++++---
 scripts/lib/devtool/ide_plugins/__init__.py   | 231 ++++----
 scripts/lib/devtool/ide_plugins/ide_code.py   | 159 ++++--
 scripts/lib/devtool/ide_plugins/ide_none.py   | 140 ++++-
 scripts/lib/devtool/ide_sdk.py                | 285 +++++++++-
 scripts/lib/devtool/standard.py               |   7 +-
 18 files changed, 1368 insertions(+), 267 deletions(-)
 create mode 100644 meta-selftest/recipes-test/cpp/files/config.h.in
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.conf
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.init
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.service

-- 
2.52.0


