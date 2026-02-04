Return-Path: <clement.faure@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E32E9D3E8
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 14:37:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21750.1770215859631528442
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 06:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: clement.faure@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD9C0339;
	Wed,  4 Feb 2026 06:37:32 -0800 (PST)
Received: from MGC575JXM4.emea.arm.com (MGC575JXM4.nice.Arm.com [10.34.111.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 565BA3F632;
	Wed,  4 Feb 2026 06:37:38 -0800 (PST)
From: Clement Faure <clement.faure@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: saul.wold@windriver.com,
	Clement Faure <clement.faure@arm.com>
Subject: [PATCH 0/2] devtool: handle nested git repos with submodules
Date: Wed,  4 Feb 2026 15:37:30 +0100
Message-ID: <20260204143732.94832-1-clement.faure@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 14:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230536

This patch set fixes devtool modify command when a recipe fetches
a git repository with submodules to BB_GIT_DEFAULT_DESTSUFFIX.
Devtool would parse BB_GIT_DEFAULT_DESTSUFFIX recursively and
attempt a duplicate git submodule add command resulting in a
devtool modify command failure.
The patch fixes that and stops descending once .gitmodules is
detected.
A selftest test case has been added to cover this scenario.

Tests ran:
- devtool.*

Clement Faure (2):
  devtool: avoid recursion into nested git repos with submodules
  oeqa/selftest/devtool: add devtool modify testcase for nested gitsm

 .../devtool/devtool-test-git-gitsm_git.bb     | 10 ++++++++
 meta/lib/oeqa/selftest/cases/devtool.py       | 25 +++++++++++++++++++
 scripts/lib/devtool/__init__.py               |  4 +++
 3 files changed, 39 insertions(+)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-git-g=
itsm_git.bb

--=20
2.43.0


