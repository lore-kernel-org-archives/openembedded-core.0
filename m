Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3239FC5AE5D
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 09:36:50 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6561.1786268196862831030
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 02:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=fQR77ELO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-20260809093633baa4cc5fcb00020747-tpoc_g@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260809093633baa4cc5fcb00020747
        for <openembedded-core@lists.openembedded.org>;
        Sun, 09 Aug 2026 11:36:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=rYixf6joq6L4rYnhUy7QOCg/66GRhzer8dbHT4ZdYgs=;
 b=fQR77ELOIY/in5HBbhPPFq1AFtz4KsC9ll8d+wXVaYBdH4UZJOMl6GZkvpNtjVjdODumqE
 DpTlME9bqbJ0oo82wvIYfJf2OWB278fSA51IArqPXyoCWyoxnXlKypM9wTTSJ3KCQQUfqHRo
 DZRIAkvTb+xBo/z9YseBrcTR4r1qGtOBt4gqiw1uIdWB1qjLM7BJANWCZalbcUwVWRtcAPop
 O7DJ8PjSzQ7qqCuPFAKYtQ7MiUZjko7btvwZaphNZ+FEijquJKb/Myu+0/eV/OM9U2UptZdQ
 UI24mKzwZnpChe7XlDhkniG/uMrEaBC4jQaHdMYHetzu6zGa5MOcK9uw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 0/8] oe-selftest: devtool ide-sdk: fix lldb connect race in _lldb_server_debugging_once
Date: Sun,  9 Aug 2026 11:35:51 +0200
Message-ID: <20260809093629.3457107-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 09:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243067

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The autobuilder intermittently failed the clang devtool ide-sdk selftest when
LLDB attempted to connect before lldb-server had started listening. The first
two commits prevent that race: generated LLDB MULTI tasks wait for the target
TCP listener before returning, and the selftest runs that startup task
synchronously before starting LLDB.

The remaining commits make the debugger lifecycle and its coverage more
robust. Centralize TCP polling, timeout cleanup, server naming,
readiness-marker generation, and shutdown handling in DebuggerCrossConfig.
GDB ONCE and ATTACH tasks emit a dedicated readiness marker and retain their
SSH connection for the debug session. Remove the unused LLDB one-shot start
path and reject unsupported LLDB modes explicitly.

Strengthen the devtool ide-sdk selftests to exercise these generated task
contracts rather than rely on timing or process-list probes. Use QEMU target
commands, wait for GDB's readiness marker, and normalize task-shell dollar
escaping before invoking SSH directly. Keep the C++ debugger test code
observable so breakpoint checks remain meaningful across toolchains and
rebuilds.

Changes from v1 to v2:
- Rather than making the connection-failure path more robust, v2 prevents the
  failure by waiting for lldb-server to become ready before connecting.
- Extend the same lifecycle synchronization and coverage to related debugger
  startup and shutdown paths.

Adrian Freihofer (8):
  devtool: ide-sdk: wait for lldb-server readiness
  oe-selftest: devtool ide-sdk: wait for lldb-server readiness
  devtool: ide-sdk: synchronize debugger server readiness
  oe-selftest: devtool ide-sdk: wait for gdbserver readiness
  devtool: ide-sdk: wait for debugger server shutdown
  oe-selftest: devtool ide-sdk: verify debugger shutdown
  oe-selftest: devtool: use QEMU target commands
  cpp-example: prevent compiler from eliminating debugger test code

 .../cpp/files/cpp-example-lib.hpp             |   6 +-
 .../recipes-test/cpp/files/cpp-example.cpp    |  10 +-
 meta/lib/oeqa/selftest/cases/devtool.py       | 222 +++++++++---------
 scripts/lib/devtool/ide_plugins/__init__.py   |  74 ++++--
 scripts/lib/devtool/ide_plugins/ide_code.py   |   7 +-
 scripts/lib/devtool/ide_plugins/ide_none.py   |  17 +-
 6 files changed, 193 insertions(+), 143 deletions(-)

-- 
2.55.0


