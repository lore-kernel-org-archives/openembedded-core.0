Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DFAC55AB9
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 19:53:55 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29325.1785700422013621286
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 12:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=c+Cds8o+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202608021953384de007672b00020703-dn77q_@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202608021953384de007672b00020703
        for <openembedded-core@lists.openembedded.org>;
        Sun, 02 Aug 2026 21:53:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=4sB2QybxOzeE8ugBy2GgOvSbh2D/rZt+EnfowWWaZ9I=;
 b=c+Cds8o+c/YHEXPgrfiI4PEe8BxD2MXuj3UJ4MEwCnS2M1c8AP9sIIwAdctgWRs+EEC6Wy
 FGj8zkIb/y2jtRze6JNOv/njPPd0rwLJxpfXiabeY030oUZggvrfVsrG481bh3GlXxfN0qDB
 mtijKIjXP80tCoSiWh/nuw1cURl67dJ3BI/0qSHj5OqT/ZEbjbI4rFyM4GWu38lMN2Utp213
 IBpo1t21GBm9fOIJwZvwb/JXE1jsAfyovu67VnbUldRHgog+DooZPcDUddk+n/t8XBRnqq38
 sdJUVgiEC6dMXbBrv8k1IFaa0BcrfQZj036l+hulnVFyPdjvo6j6/qTw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 00/14] devtool ide-sdk: clang and lldb support
Date: Sun,  2 Aug 2026 21:52:47 +0200
Message-ID: <20260802195324.64533-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 19:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242571

From: Adrian Freihofer <adrian.freihofer@siemens.com>

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
  qemuboot: make do_write_qemuboot_conf a standalone sstate task
  oe-selftest: devtool: use stat for reading user/group names in ide-sdk
    tests
  devtool: ide-sdk: fix duplicate -p flag in _target_ssh_args
  devtool: ide-sdk: fix $@ overwritten by set in install_and_deploy
    script
  devtool: ide-sdk: fix meson compile_commands.json
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
 meta/classes-recipe/qemuboot.bbclass          |  19 +-
 meta/lib/oeqa/selftest/cases/devtool.py       | 937 ++++++++++++++++--
 scripts/lib/devtool/ide_plugins/__init__.py   | 262 +++--
 scripts/lib/devtool/ide_plugins/ide_code.py   | 401 ++++++--
 scripts/lib/devtool/ide_plugins/ide_none.py   | 188 +++-
 scripts/lib/devtool/ide_sdk.py                | 206 +++-
 20 files changed, 1871 insertions(+), 383 deletions(-)
 create mode 100644 meta-selftest/recipes-test/cpp/cmake-example-clang.bb
 create mode 100644 meta-selftest/recipes-test/cpp/cmake-example.inc
 delete mode 100644 meta-selftest/recipes-test/cpp/cmake-example/run-ptest
 rename meta-selftest/recipes-test/cpp/{meson-example => files}/run-ptest (51%)
 create mode 100644 meta-selftest/recipes-test/cpp/meson-example-clang.bb
 create mode 100644 meta-selftest/recipes-test/cpp/meson-example.inc

-- 
2.55.0


