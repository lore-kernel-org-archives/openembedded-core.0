Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62685CCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 07:10:14 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.12238.1760944204959252921
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 00:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=av3qT4kM;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1C2044E411D9
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 07:10:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE5DB606D5;
	Mon, 20 Oct 2025 07:10:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 494F2102F238E;
	Mon, 20 Oct 2025 09:09:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760944198; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=3VGDabpTiDjsOkbD7bK3sEOIAoue2N/dvCGAGTel+ao=;
	b=av3qT4kM+YfdLAfXfzN0hc+cuhDM9q2LPrzLuwnxWZ1ho9Os/1Ms/hWSRvzR64V9NKyquu
	cq0DvEPCj7g1jhqlvM9/IIL+gM+LJa7qiztTh/Tjmccd4LTda/tvTP4ygMIX4PM7BO7Nn2
	u5I3XT4EddphDP3sPrudnSkS3aoFGOlIV9EaqgcrUUm5NapKyHthglR9LWUmYPLXUBvZZ6
	F2nKoWV2QJ2DNbaMoFiiqul4r2YcVhfMNGDdIWzurAmDxMqUSgO09efcKA/PWyOL/kHwwy
	iBvywJ/rOtA8PVE6wzYlwNj3mShY2zKYphCRHz+LnVV/bTzzX/h9ijxulL34bg==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [scarthgap v2 00/11] backport: SPDX 3.0 support to Scarthgap
Date: Mon, 20 Oct 2025 09:09:40 +0200
Message-ID: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 07:10:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225098

Hello,

This v2 series backports SPDX 3.0 support from the upstream Walnascar
branch to Scarthgap (Yocto Project 5.0 LTS), including the corresponding
test suite and fixes for integration issues found during testing.

The motivation remains the same as in v1, to bring complete SPDX 3.0
support to the latest LTS release, ensuring that long-term supported
builds benefit SBOM generation capabilities. Scarthgap is under
maintenance until 2028, and SPDX 3.0 is now an essential part of
compliance workflows.

Kamel

Hongxu Jia (1):
  oeqa/selftest: Add SPDX 3.0 include source case for work-share

Joshua Watt (7):
  classes-global/license: Move functions to library code
  lib/license: Move package license skip to library
  lib: oe: license: Add missing import
  classes-recipe/image: Add image file manifest
  selftest: spdx: Add SPDX 3.0 test cases
  lib: oeqa: spdx: Add tests for extra options
  spdx 3.0: Rework how SPDX aliases are linked

Kamel Bouhara (Schneider Electric) (3):
  backport: SPDX 3.0 fixes and tasks from upstream version Walnascar
  spdx30_tasks: fix FetchData attribute in add_download_files
  spdx30_tasks: adapt CVE handling to new cve-check API

 meta/classes-global/base.bbclass              |   41 +-
 meta/classes-global/license.bbclass           |  165 -
 .../create-spdx-image-3.0.bbclass             |   85 +
 .../create-spdx-sdk-3.0.bbclass               |   74 +
 meta/classes-recipe/image.bbclass             |   58 +
 meta/classes-recipe/license_image.bbclass     |   14 +-
 meta/classes-recipe/nospdx.bbclass            |   13 +
 meta/classes/create-spdx-3.0.bbclass          |  200 +
 meta/classes/spdx-common.bbclass              |   99 +
 meta/lib/oe/__init__.py                       |    2 +-
 meta/lib/oe/license.py                        |  203 +
 meta/lib/oe/sbom30.py                         | 1096 ++++
 meta/lib/oe/spdx30.py                         | 5593 +++++++++++++++++
 meta/lib/oe/spdx30_tasks.py                   | 1343 ++++
 meta/lib/oe/spdx_common.py                    |  244 +
 meta/lib/oeqa/selftest/cases/spdx.py          |  248 +-
 16 files changed, 9262 insertions(+), 216 deletions(-)
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


