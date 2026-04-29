Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28489FF887E
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 14:32:04 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12787.1777473115445435355
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 07:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.53 with ESMTP; 29 Apr 2026 23:31:53 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto) (10.177.121.44)
	by 156.147.1.127 with ESMTP; 29 Apr 2026 23:31:53 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH 0/3] Fix multilib package variable propagation
Date: Wed, 29 Apr 2026 23:31:01 +0900
Message-ID: <20260429143104.684760-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 14:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236105

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

This set of patches addresses the issue where package variables in
PACKAGEVARS (e.g. LICENSE) are not extended for a multilib variant
build, by invoking rename_package_variables() in ClassExtender.
It also adds a selftest that verifies the consistency of pkgdata
variables between the base and 'lib32' multilib variant.

With this change, I found another issue in libpam:

| ERROR: lib32-libpam-1.7.2-r0 do_package: QA Issue: lib32-libpam: Files/directories were installed but not shipped in any package:
|   /usr/lib/security/pam_env.so
| Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
| lib32-libpam: 1 installed and not shipped files. [installed-vs-shipped]

It is because FILES variable for pam-plugin-env is not defined for a
multilib build. Another patch in this series addressed it by adding
MLPREFIX.

Jaeyoon Jung (3):
  libpam: Add missing MLPREFIX to FILES:pam-plugin-env
  oeqa/selftest/pkgdata: add multilib LICENSE consistency test
  package.bbclass: extend package variables for multilib variants

 meta/classes-global/package.bbclass       | 11 +++++++++++
 meta/lib/oeqa/selftest/cases/pkgdata.py   | 15 +++++++++++++++
 meta/recipes-extended/pam/libpam_1.7.2.bb |  2 +-
 3 files changed, 27 insertions(+), 1 deletion(-)


