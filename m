Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E91C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 10:01:41 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.17048.1747735291141590457
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 03:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 May
 2025 18:01:28 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 May 2025 18:01:28 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>,
	<vince_chang@aspeedtech.com>
Subject: [PATCH v2 1/2] uboot-sign: Fix unintended "-e" written into ITS
Date: Tue, 20 May 2025 18:01:27 +0800
Message-ID: <20250520100128.4019721-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520100128.4019721-1-jamin_lin@aspeedtech.com>
References: <20250520100128.4019721-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 10:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216897

An unintended "-e" string may be written into the generated ITS file when u=
sers
set the UBOOT_FIT_USER_SETTINGS variable to include custom binaries in the =
U-Boot
image.

This issue is caused by the use of 'echo -e', which behaves inconsistently =
across
different shells. While bash interprets '-e' as enabling escape sequences
(e.g., \n, \t), dash=E2=80=94the default /bin/sh on many systems=E2=80=94do=
es not recognize
'-e' and treats it as a literal string. As a result, "-e" can be mistakenly
injected into the ITS file under certain build environments.

To ensure consistent and shell-agnostic behavior, replace 'echo -e' with
'printf', which is well-defined by POSIX and behaves reliably across all co=
mmon
shells.

This change improves portability and prevents malformed ITS files caused by=
 unintended
string injection.

Fixes: c12e013 ("uboot-sign: support to add users specific image tree sourc=
e")
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index e0771b5429..dcf94b7179 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -425,7 +425,7 @@ EOF
 	fi
=20
 	if [ -n "${UBOOT_FIT_USER_SETTINGS}" ] ; then
-		echo -e "${UBOOT_FIT_USER_SETTINGS}" >> ${UBOOT_ITS}
+		printf "%b" "${UBOOT_FIT_USER_SETTINGS}" >> ${UBOOT_ITS}
 	fi
=20
 	if [ -n "${UBOOT_FIT_CONF_USER_LOADABLES}" ] ; then
--=20
2.43.0


