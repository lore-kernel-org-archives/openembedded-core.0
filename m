Return-Path: <florian.amstutz@scs.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C59C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 14:20:50 +0000 (UTC)
Received: from mail.scs.ch (mail.scs.ch [212.203.110.131])
 by mx.groups.io with SMTP id smtpd.web11.11917.1721139642217112983
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 07:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@scs.ch header.s=sophosdkim2 header.b=J69yN5j2;
 spf=pass (domain: scs.ch, ip: 212.203.110.131, mailfrom: florian.amstutz@scs.ch)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=scs.ch;
	s=sophosdkim2; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p4EptdDpf1R2RZDqSqZKJVp04NC6lOEm5Y7eNEGVXtg=; b=J69yN5j24lai4pbndD1Q3b9Zf0
	SlNFbX643wLi2zvJZUF09QpEBq2uDx9pd8Z/CI0tTWwlDaZBGJJf/tV7y5vEB9se1xO362x9TdHyX
	TlvdCg3y4zsZ7bfv3Sy4bmwspZv65Rflnrd3BPIKe02Ij+VI6eiaNSekOajy9gZcCQx1GXLsFzlta
	Ui+Us8ZQng0Wug0FOulP8IPF3sCD5O1w2OK/UM17DGjEt95LSPXGcMFI/m9EX1D7ixcYN56FswD26
	ECtzjblQQkbxrhd5zEPIwU5k8+C2gc3RzWKcQL+heKmj0FSlhwqEQyZjaDmUEx5of34g7yGdAxzVH
	Ws2yIt7g==;
Received: from vm-tango.scs-ad.scs.ch ([172.18.0.110]:37867)
	by mail.scs.ch with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <florian.amstutz@scs.ch>)
	id 1sTj2k-000000003RP-0T0j
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Jul 2024 16:20:38 +0200
Received: from vm-tango.scs-ad.scs.ch (172.18.0.110) by vm-tango.scs-ad.scs.ch
 (172.18.0.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 16 Jul
 2024 16:20:37 +0200
Received: from quecto.scs-ad.scs.ch (192.168.34.41) by smtprelay.scs-ad.scs.ch
 (172.18.0.110) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Tue, 16 Jul 2024 16:20:37 +0200
From: Florian Amstutz <florian.amstutz@scs.ch>
To: <openembedded-core@lists.openembedded.org>
CC: Florian Amstutz <florian.amstutz@scs.ch>
Subject: [kirkstone][PATCH v2] uboot-sign: Fix index error in concat_dtb_helper() with multiple configs
Date: Tue, 16 Jul 2024 14:19:56 +0000
Message-ID: <20240716141956.1105085-1-florian.amstutz@scs.ch>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 14:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202118

Commit 60774248a5570899a66f9f88e597cc4f723d6278 solves issues when i or j
have been set in other shell functions.

Since j is not unset after the inner loop, the image will only be copied
for the first configuration.

Unsetting i and j after the loops also prevents index issues in other functions.

Signed-off-by: Florian Amstutz <florian.amstutz@scs.ch>
---
 meta/classes/uboot-sign.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 6bb4ddc600..f3bbd8980e 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -137,8 +137,7 @@ concat_dtb_helper() {
 
 			if [ -n "${UBOOT_CONFIG}" ]
 			then
-				i=0
-				j=0
+				unset i j
 				for config in ${UBOOT_MACHINE}; do
 					i=$(expr $i + 1);
 					for type in ${UBOOT_CONFIG}; do
@@ -146,9 +145,12 @@ concat_dtb_helper() {
 						if [ $j -eq $i ]
 						then
 							cp ${UBOOT_IMAGE} ${B}/${CONFIG_B_PATH}/u-boot-$type.${UBOOT_SUFFIX}
+							break
 						fi
 					done
+					unset j
 				done
+				unset i
 			fi
 		else
 			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
-- 
2.34.1


