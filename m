Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1457C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 05:30:33 +0000 (UTC)
Received: from TWMBX03.aspeed.com (TWMBX03.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.69916.1705296632326029676
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jan 2024 21:30:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX03.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 15 Jan
 2024 13:30:29 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Jan 2024 13:30:29 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] uboot-sign: Fix to install nonexistent dtb file
Date: Mon, 15 Jan 2024 13:30:27 +0800
Message-ID: <20240115053027.1660702-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 05:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193630

Add to check dtb file is exist, then install it.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index ad04c82378..26d75995a6 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -315,7 +315,9 @@ EOF
 			${SPL_MKIMAGE_SIGN_ARGS}
 	fi
=20
-	cp ${SPL_DIR}/${SPL_DTB_BINARY} ${SPL_DIR}/${SPL_DTB_SIGNED}
+	if [ -e "${SPL_DIR}/${SPL_DTB_BINARY}" ]; then
+		cp ${SPL_DIR}/${SPL_DTB_BINARY} ${SPL_DIR}/${SPL_DTB_SIGNED}
+	fi
 }
=20
 uboot_assemble_fitimage_helper() {
--=20
2.25.1


