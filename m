Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D012C47DD3
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 06:19:45 +0000 (UTC)
Received: from TWMBX02.aspeed.com (TWMBX02.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.16006.1705645183191773477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 22:19:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.25) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 19 Jan
 2024 14:19:42 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Jan 2024 14:19:42 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 2/4] uboot-sign: Fix to install nonexistent dtb file
Date: Fri, 19 Jan 2024 14:19:35 +0800
Message-ID: <20240119061937.1368163-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240119061937.1368163-1-jamin_lin@aspeedtech.com>
References: <20240119061937.1368163-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=twmbx02.aspeed.com;
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 06:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194011

Add to check dtb file exist, then install it.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index abde0bc61c..4b462698f9 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -318,7 +318,9 @@ EOF
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


