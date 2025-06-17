Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C3BC71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 08:10:59 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.13301.1750147855276325504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 01:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 17 Jun
 2025 16:10:52 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 17 Jun 2025 16:10:52 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v2 0/3] Support signing U-Boot FIT image without SPL
Date: Tue, 17 Jun 2025 16:10:49 +0800
Message-ID: <20250617081052.3087995-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 08:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218858

v1:
- uboot-sign: Make SPL DTB public key injection optional

v2:
- Fix review issue
- Add test for signing U-Boot FIT image without SPL
- Refactor condition checks to use && and || instead of -a and -o
- Support signing U-Boot FIT image without SPL
  - The `SPL_DTB_BINARY` variable can be explicitly set to an empty string
    to indicate that no SPL is present.
  - The signing logic checks `SPL_DTB_BINARY` and skips injecting the
    key or verifying the SPL DTB if it is empty.
  - The FIT image generation and deployment are always performed if
    `UBOOT_FITIMAGE_ENABLE` is enabled, regardless of the SPL settings.

Jamin Lin (3):
  uboot-sign: Support signing U-Boot FIT image without SPL
  uboot-sign.bbclass: Refactor condition checks to use && and || instead
    of -a and -o
  oe-selftest: fitimage: Add test for signing U-Boot FIT image without
    SPL

 meta/classes-recipe/uboot-sign.bbclass   | 74 ++++++++++++++----------
 meta/lib/oeqa/selftest/cases/fitimage.py | 37 ++++++++++++
 2 files changed, 79 insertions(+), 32 deletions(-)

--=20
2.43.0


