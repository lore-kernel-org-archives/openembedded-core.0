Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 201F3C5B543
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 20:28:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2827.1748550492759593657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 13:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6AAD1758
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:27:55 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E78F43F673
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:28:11 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] [RFC] Go module update class
Date: Thu, 29 May 2025 21:27:53 +0100
Message-ID: <20250529202802.1198179-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 20:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217438

Hi,

Here's a not-even-nearly-finished draft of a Go module update class that
somewhat works for one recipe.  I can only take credit for moving lines
of code around: the bulk of the original code was written by Christian
Lindeberg who integrated it into recipetool.

There's a number of outstanding issues, but I thought I'd post it now
so that people can see what I have so far, and ideally improve it because
they understand Go more than I do!

Cheers,
Ross

Christian Lindeberg (1):
  recipetool: create_go: Use gomod fetcher instead of go mod vendor

Peter Kjellerstedt (2):
  recipetool: create: Support creating extra files named after the
    recipe
  recipetool: licenses.csv: Add mapping for BSD licenses

Ross Burton (6):
  scripts/recipetool/licenses.csv: add more licenses
  recipetool/create: show more of the license path when it can't be
    identified
  scripts/scriptutils: silence warning about S not existing in emptysrc
  lib/oeqa/subprocesstweak: clean up __str__()
  lib/oe/license_finder: extract license-finding code from recipetool
  Prototype go-mod-update-modules class

 .../go-mod-update-modules.bbclass             | 130 ++++
 .../files/license-hashes.csv                  |  11 +
 meta/lib/oe/license_finder.py                 | 226 ++++++
 meta/lib/oeqa/utils/subprocesstweak.py        |  13 +-
 scripts/lib/recipetool/create.py              | 229 +-----
 scripts/lib/recipetool/create_go.py           | 731 +++---------------
 scripts/lib/scriptutils.py                    |   5 +-
 7 files changed, 483 insertions(+), 862 deletions(-)
 create mode 100644 meta/classes-recipe/go-mod-update-modules.bbclass
 rename scripts/lib/recipetool/licenses.csv =3D> meta/files/license-hashe=
s.csv (77%)
 create mode 100644 meta/lib/oe/license_finder.py

--=20
2.43.0


