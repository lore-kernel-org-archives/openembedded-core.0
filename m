Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDE1C55ABF
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:00:53 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14709.1785844847442989957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=BsnV+djn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-202608041200374bca9e10eb00020711-dq6lyw@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202608041200374bca9e10eb00020711
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 14:00:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=EP4DZwLUzxzuZvNcHi21y3lZFfNWksQG+K0xFAIJWi0=;
 b=BsnV+djnZnF3nc0Yus8DBFvVaNwuAbLgWk+YCeDr2xrgomRYERuZEjaJ1uU2NOsog0v56q
 YEFpjwipLqL3yubk+wDy+wqoSKAiKuVdlHvuQvooBwmC9G2X62wg9dzPTgvh/3Lr8FuRR9zT
 T4H/gw+MzJCofaQmiNig9ic3mBofTYw76liNTWxujQPnG4FZLtZO8OGYcJ2xeSQaz/Up4IUA
 d78W+m7L/aqptqmOGPuSzlyhGFh1H12aUwRZ28hox2WY18rZVAogSUf7xxOga49YiQot2SM+
 rnxPTVe86IH/RieLP7NHoWmhwG719WWp72qJzpqFU6TRb12d84Gs/RLA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 00/14] devtool ide-sdk: clang and lldb support
Date: Tue,  4 Aug 2026 13:59:24 +0200
Message-ID: <20260804120034.378787-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242727

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Changes between v1 and v2:
- Drop commit: qemuboot: make do_write_qemuboot_conf a standalone
  sstate task. There is now a better fix on master-next:
  qemboot: Correct task dependency tree
  (commit message has a typo qemboot --> qemuboot)
- Add one more commit: devtool: deploy-target: fix run strip under pseudo
  This should fix the issues found on the autobuilder with v1:
  - https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4515
  - https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4269
  - https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4451
  On my local setup, the tests passed, but looking into pseudo's log file
  showed some file issues too which are now solved.

This series adds clang toolchain support to devtool ide-sdk. LLDB is
part of the same LLVM project as clang and is the more natural debugger
pairing for it (much like GDB pairs with gcc), so ide-sdk now picks LLDB
as the debugger whenever the recipe is built with clang, while
continuing to use GDB for gcc-built recipes as before. The series also
significantly extends oe-selftest coverage for both debugging paths
(ide=code and ide=none).

Highlights:
 - Introduce a debugger back-end abstraction in ide-sdk so GDB and LLDB
   can share the common ide=code/ide=none plumbing, and select LLDB
   automatically when the recipe's toolchain is clang.
 - Add LLDB support for the clang toolchain, for both ide=code
   (lldb-server platform mode + CodeLLDB launch/task config) and ide=none
   (generated shell scripts).
 - Fix a handful of pre-existing ide-sdk issues found along the way:
   waiting for the gdbserver port before returning, a duplicate -p flag in
   _target_ssh_args, $@ getting overwritten by `set` in the
   install_and_deploy script, and meson compile_commands.json generation.
 - Fix a bug in devtool deploy-target --strip
 - Refactor the meta-selftest cpp debugging examples into shared .inc
   files with clang variants, and add real, end-to-end debug session
   coverage (breakpoints in the executable, a library and a header-only
   inline function) for GDB (meson) and LLDB (clang, both ide=code and
   ide=none), including a recompile/redeploy cycle.

For now the debugger is selected purely based on the recipe's
TOOLCHAIN (gcc -> GDB, clang -> LLDB). Other combinations, e.g. gcc for
compiling with clang-tidy for static analysis, or support for the VSCode
clangd plugin are not covered yet but could be supported in the future
by making the debugger selection more independent from the compiler
choice.

Adrian Freihofer (14):
  oe-selftest: devtool: use stat for reading user/group names in ide-sdk
    tests
  devtool: ide-sdk: fix duplicate -p flag in _target_ssh_args
  devtool: ide-sdk: fix $@ overwritten by set in install_and_deploy
    script
  devtool: ide-sdk: fix meson compile_commands.json
  devtool: deploy-target: fix run strip under pseudo
  oe-selftest: devtool ide-sdk: cover breakpoints in exe, header and
    library
  oe-selftest: devtool ide-sdk: add real debug coverage for meson+code
  devtool: ide-sdk debugger back-end abstraction
  devtool: ide-sdk: wait for gdbserver port before returning
  devtool: ide-sdk add LLDB support for clang toolchain
  devtool: ide-sdk: add LLDB support for ide=none (clang toolchain)
  meta-selftest: refactor cpp examples into .inc files and add clang
    variants
  oe-selftest: devtool ide-sdk: add clang/LLDB test
  oe-selftest: devtool ide-sdk: add test for ide=none LLDB/clang support

 .../recipes-test/cpp/cmake-example-clang.bb   |  13 +
 .../recipes-test/cpp/cmake-example.bb         |  20 +-
 .../recipes-test/cpp/cmake-example.inc        |  29 +
 .../recipes-test/cpp/cmake-example/run-ptest  |  10 -
 .../recipes-test/cpp/cpp-example.inc          |  20 +-
 .../recipes-test/cpp/files/CMakeLists.txt     |  35 +-
 .../cpp/files/cpp-example-lib.hpp             |  10 +
 .../recipes-test/cpp/files/cpp-example.cpp    |   4 +
 .../recipes-test/cpp/files/meson.build        |  17 +-
 .../recipes-test/cpp/files/meson.options      |   6 +
 .../cpp/{meson-example => files}/run-ptest    |   4 +-
 .../recipes-test/cpp/meson-example-clang.bb   |  13 +
 .../recipes-test/cpp/meson-example.bb         |  24 +-
 .../recipes-test/cpp/meson-example.inc        |  36 +
 meta/lib/oeqa/selftest/cases/devtool.py       | 937 ++++++++++++++++--
 scripts/lib/devtool/deploy.py                 |  21 +-
 scripts/lib/devtool/ide_plugins/__init__.py   | 262 +++--
 scripts/lib/devtool/ide_plugins/ide_code.py   | 401 ++++++--
 scripts/lib/devtool/ide_plugins/ide_none.py   | 188 +++-
 scripts/lib/devtool/ide_sdk.py                | 206 +++-
 20 files changed, 1871 insertions(+), 385 deletions(-)
 create mode 100644 meta-selftest/recipes-test/cpp/cmake-example-clang.bb
 create mode 100644 meta-selftest/recipes-test/cpp/cmake-example.inc
 delete mode 100644 meta-selftest/recipes-test/cpp/cmake-example/run-ptest
 rename meta-selftest/recipes-test/cpp/{meson-example => files}/run-ptest (51%)
 create mode 100644 meta-selftest/recipes-test/cpp/meson-example-clang.bb
 create mode 100644 meta-selftest/recipes-test/cpp/meson-example.inc

-- 
2.55.0


