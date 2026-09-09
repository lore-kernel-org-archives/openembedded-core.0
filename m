Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58CDC88E4C
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 21:53:52 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81.1788990824466403916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 14:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=IecO6ffe;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-202609092153410248cd2b2000020703-drectt@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202609092153410248cd2b2000020703
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Sep 2026 23:53:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=O7IWwCQMRREaU0LeaSkcHNCI0oYzO3tikgjpN9PThog=;
 b=IecO6ffec3PpAeY2hM3lXKITPlv7ZbyU5ON0FJWRvsBuUnWDgDvT02Y31euQCvwFZwxBB8
 iJZdenrjhGCOrSDWV4LnMEtcGZsoJbGC8evzPpur6Q7wkFM9o5lrgrl/6zmk4x6PMOHZ3Fz3
 AUEoyCenWZbCa1Fl3RDWZP80E6YxYfUwEUM7N8T4HgkHuRkxtcctWH9QvAI1+1GomP7eyrml
 L2O99pii/ywVktdvyHTsT4Zbfz+uXVmK6PayUgfa8aFJj7TjKzchTfv9pfwXBUPF5wAuEMPa
 ElJWCVED6MkUAli2f81huUe1Jf0uuKOGE1OZeFE9AAUeWifbBHG5r+MQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 00/15] devtool ide-sdk: support booting from NFS, VSCode clangd
Date: Wed,  9 Sep 2026 23:53:00 +0200
Message-ID: <20260909215337.89106-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 21:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245502

From: Adrian Freihofer <adrian.freihofer@siemens.com>

devtool ide-sdk: support booting the debug rootfs over NFS, plus VSCode
clangd integration (IntelliSense, non-clang toolchain support, and
.clang-format-aware formatting).

This series includes some commits already sent before, now reworked
with independent ordering: first extract_sdk_rootfs() is implemented
standalone, then runqemu-extract-sdk is rewritten in Python, and
finally the new pseudo_rootfs_utils Python module is shared between
runqemu-extract-sdk and devtool ide-sdk. This step-by-step split makes
the Python rewrite optionally pickable on its own, independent of the
NFS features.

Adrian Freihofer (15):
  devtool: deploy: split ssh deployment into a separate function
  devtool: deploy: allow deploying directly into a local rootfs
    directory
  oe-selftest: devtool deploy-target: test deploying into a local rootfs
    path
  devtool: ide-sdk: support NFS rootfs
  oe-selftest: devtool ide-sdk: test NFS debug rootfs
  runqemu-extract-sdk: refactor in Python
  devtool: ide-sdk: reuse pseudo_rootfs_utils for SDK rootfs extraction
  cpp-example: update formatting and code style
  cpp-example: fix clang-tidy warnings
  devtool: ide-sdk: add clangd support for VSCode IntelliSense
  devtool: ide-sdk: support clangd for non-clang toolchain recipes
  devtool: ide-sdk: format C/C++ with clangd when .clang-format is
    present
  devtool: ide-sdk: support LLDB ATTACH mode
  devtool: ide-sdk: pin BBPATH in generated do_install script
  buildstats: close proc/disk log files via weakref.finalize safety net

 .../recipes-test/cpp/cpp-example.inc          |   2 +
 .../recipes-test/cpp/files/.clang-format      |  42 +++
 .../recipes-test/cpp/files/.clang-tidy        |  33 ++
 .../cpp/files/cpp-example-lib.hpp             |   3 +-
 .../recipes-test/cpp/files/cpp-example.cpp    |   5 +-
 .../recipes-test/cpp/files/daemonize.cpp      |   2 +-
 .../recipes-test/cpp/files/daemonize.hpp      |   2 +-
 .../cpp/files/test-cpp-example.cpp            |  13 +-
 meta/lib/oe/buildstats.py                     |  15 +-
 meta/lib/oeqa/selftest/cases/devtool.py       | 320 +++++++++++++++++-
 .../qemu/nativesdk-qemu-helper_1.0.bb         |   3 +
 scripts/lib/devtool/__init__.py               |  22 +-
 scripts/lib/devtool/deploy.py                 | 220 ++++++++++--
 scripts/lib/devtool/ide_plugins/__init__.py   |  79 +++--
 scripts/lib/devtool/ide_plugins/ide_code.py   | 108 ++++--
 scripts/lib/devtool/ide_plugins/ide_none.py   |  17 +-
 scripts/lib/devtool/ide_sdk.py                | 275 ++++++++++++++-
 scripts/lib/pseudo_rootfs_utils.py            | 113 +++++++
 scripts/runqemu-extract-sdk                   | 116 ++-----
 19 files changed, 1156 insertions(+), 234 deletions(-)
 create mode 100644 meta-selftest/recipes-test/cpp/files/.clang-format
 create mode 100644 meta-selftest/recipes-test/cpp/files/.clang-tidy
 create mode 100644 scripts/lib/pseudo_rootfs_utils.py

-- 
2.55.0


