Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC259CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 16:27:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1511.1762187221904285627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 08:27:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=0+VlfY0X;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A3C531A1845
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Nov 2025 16:26:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 79A8C60628;
	Mon,  3 Nov 2025 16:26:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2AA3710B5013A;
	Mon,  3 Nov 2025 17:26:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762187219; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=QqpPC1ZpXPINzH+hQDPXziaAYHf8dCAUMUISg3QF+5I=;
	b=0+VlfY0Xpc2ehXdrVYjBEd5gFtT6P8dmvzjAXUttUphmeRE9K3fVcr6t3KUegiXZzSpQfi
	c33bLY4VrLir4x3sHaS1eSXDsawnnvQdEB2mxHO1XRp4orxsKxI1I9Zrej8AhtJxQNGHDl
	kvkrylhax/nEOhbrVALdFW71+2oNKAjf5uZOQNKrKrhq9XYpZKJzWr2qj9iIvzOs0rDgq3
	gfhpeH+wfHWVsgYtUM1qZo25leTlaPKZ8pLI6WHeSBqCOc1kcQ5v40fG6qDRZPBrmWZHXk
	CBQtfJrtdE8oHrgMjZuX9lgvHizRhP8K4S0Uu38PbsQ5iNzqWlLvhpWmDIIbJA==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [scarthgap v3 00/16] backport: SPDX 3.0 support to Scarthgap
Date: Mon,  3 Nov 2025 17:26:26 +0100
Message-ID: <20251103162654.1714239-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 16:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225667

Hello,

This is the v3 series to backport SPDX 3.0 support from upstream
Walnascar to Scarthgap (Yocto Project 5.0 LTS), it essentially
includes selftest fixes.

Changes since v2:
-----------------
Cherry-picked commits:

    c5b5136bf8: Exclude do_create_spdx from automatic sysroot extension.

    03c6ace6c6: Fix SPDX_VERSION handling in selftests.

    7be5a6e699: Add tar test for SPDX 2.2.

Local fix:

    7e14a5b966: Align DEPLOY_DIR_SPDX in create-spdx-2.2.bbclass with
	${SPDX_VERSION} layout, restoring successful SPDX 2.2 selftests.

Greetings,
Kamel

Hongxu Jia (1):
  oeqa/selftest: Add SPDX 3.0 include source case for work-share

Joshua Watt (10):
  classes-global/license: Move functions to library code
  classes-global/staging: Exclude do_create_spdx from automatic sysroot
    extension
  lib/license: Move package license skip to library
  lib: oe: license: Add missing import
  classes-recipe/image: Add image file manifest
  classes-recipe/baremetal-image: Add image file manifest
  selftest: spdx: Add SPDX 3.0 test cases
  lib: oeqa: spdx: Add tests for extra options
  spdx 3.0: Rework how SPDX aliases are linked
  oeqa: spdx: Add tar test for SPDX 2.2

Kamel Bouhara (Schneider Electric) (4):
  backport: SPDX 3.0 fixes and tasks from upstream version Walnascar
  spdx30_tasks: fix FetchData attribute in add_download_files
  classes/create-spdx-2.2: align DEPLOY_DIR_SPDX with SPDX_VERSION
    layout
  spdx30_tasks: adapt CVE handling to new cve-check API

Richard Purdie (1):
  selftest/spdx: Fix for SPDX_VERSION addition

 meta/classes-global/base.bbclass              |   41 +-
 meta/classes-global/license.bbclass           |  165 -
 meta/classes-global/staging.bbclass           |    9 +-
 meta/classes-recipe/baremetal-image.bbclass   |   32 +-
 .../create-spdx-image-3.0.bbclass             |   85 +
 .../create-spdx-sdk-3.0.bbclass               |   74 +
 meta/classes-recipe/image.bbclass             |   58 +
 meta/classes-recipe/license_image.bbclass     |   14 +-
 meta/classes-recipe/nospdx.bbclass            |   13 +
 meta/classes/create-spdx-2.2.bbclass          |    3 +-
 meta/classes/create-spdx-3.0.bbclass          |  200 +
 meta/classes/spdx-common.bbclass              |   99 +
 meta/lib/oe/__init__.py                       |    2 +-
 meta/lib/oe/license.py                        |  203 +
 meta/lib/oe/sbom30.py                         | 1096 ++++
 meta/lib/oe/spdx30.py                         | 5593 +++++++++++++++++
 meta/lib/oe/spdx30_tasks.py                   | 1343 ++++
 meta/lib/oe/spdx_common.py                    |  244 +
 meta/lib/oeqa/selftest/cases/spdx.py          |  256 +-
 19 files changed, 9307 insertions(+), 223 deletions(-)
 create mode 100644 meta/classes-recipe/create-spdx-image-3.0.bbclass
 create mode 100644 meta/classes-recipe/create-spdx-sdk-3.0.bbclass
 create mode 100644 meta/classes-recipe/nospdx.bbclass
 create mode 100644 meta/classes/create-spdx-3.0.bbclass
 create mode 100644 meta/classes/spdx-common.bbclass
 create mode 100644 meta/lib/oe/sbom30.py
 create mode 100644 meta/lib/oe/spdx30.py
 create mode 100644 meta/lib/oe/spdx30_tasks.py
 create mode 100644 meta/lib/oe/spdx_common.py

--
2.43.0


