Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AC2D6E2C3
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 06:17:31 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.7415.1732083448026494996
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 22:17:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 20 Nov
 2024 14:17:25 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 20 Nov 2024 14:17:25 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v1] meta:kernel-uboot: Support lzma compressed algorithm
Date: Wed, 20 Nov 2024 14:17:24 +0800
Message-ID: <20241120061724.851003-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 06:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207415

Linux kernel supports to compress its output binary with lzma algorithm and
U-Boot support to decompress lzma compressed image.

Both xz and lzma algorithms are identical and users can use xz utility with
format parameter to compress Image which supports lzma algorithm.

Add the following command to support lzma. This command is refer to Linux
kernel, https://github.com/torvalds/linux/blob/master/arch/powerpc/boot/wra=
pper

"xz --format=3Dlzma -f -6 linux.bin"

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta/classes-recipe/kernel-uboot.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/kernel-uboot.bbclass b/meta/classes-recipe=
/kernel-uboot.bbclass
index 30a85ccc28..6d4aff6b11 100644
--- a/meta/classes-recipe/kernel-uboot.bbclass
+++ b/meta/classes-recipe/kernel-uboot.bbclass
@@ -41,6 +41,8 @@ uboot_prep_kimage() {
 			gzip -9 linux.bin
 		elif [ "${linux_comp}" =3D "lzo" ] ; then
 			lzop -9 linux.bin
+		elif [ "${linux_comp}" =3D "lzma" ] ; then
+			xz --format=3Dlzma -f -6 linux.bin
 		fi
 		mv -f "linux.bin${linux_suffix}" linux.bin
 	fi
--=20
2.25.1


