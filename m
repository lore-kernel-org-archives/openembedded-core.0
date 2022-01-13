Return-Path: <kamil.dziezyk@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CEFC433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 11:17:19 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.72])
 by mx.groups.io with SMTP id smtpd.web09.7591.1642072636701134192
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 03:17:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=uvpZHU5b;
 spf=pass (domain: arm.com, ip: 40.107.8.72, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+dBCLA3L2qZ84qh9QCU29T9T2sQNBVUR6DtLg2wbjE=;
 b=uvpZHU5b6ggn0xviJ68W3ftx1W2jS6lqajVtOU89OQ3Wg4Xx5IZAKK6w+GaW7KFOI6+ibGVfIeCMOC1YASHs2Sz0qovxLiPPZ4ShaQuOrvgh3/P0oxBmPkVxTv9mh0GuDqVOM15TBO4IZXhnb+JLQW5Dqe2vCDbDeKuApGgbBLo=
Received: from AM6P192CA0034.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::47)
 by DB8PR08MB5353.eurprd08.prod.outlook.com (2603:10a6:10:112::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 13 Jan
 2022 11:17:12 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::15) by AM6P192CA0034.outlook.office365.com
 (2603:10a6:209:83::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Thu, 13 Jan 2022 11:17:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 11:17:12 +0000
Received: ("Tessian outbound 157533e214a9:v110");
 Thu, 13 Jan 2022 11:17:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6dc941a7eef02972
X-CR-MTA-TID: 64aa7808
Received: from 0ac2ca381dbe.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 79A064AD-D85A-46C3-A6A3-8A2DA2F11477.1;
	Thu, 13 Jan 2022 11:17:05 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 0ac2ca381dbe.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 13 Jan 2022 11:17:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dM6ebyq81CDCGj5KQFbp0OlkVe3TtAiYO4GUn+mgJ295HTtOG8HkdXHFq4VkgSRLfSoouSrq8CHCA+bkzlAth7Tc1eZCH9LrGxo50IHuycoE0+0Q9yv9SB94khynz28FzFcavbDXSn2HsOg606Buk+DJN+OFZKvF3Nrz/2sMVw+wLWZu+tZrks0Jz4h6vaZVjxEbLID232r1mik74d8i97jZUUjBAa1Ja/yjNAE2T7boYzIgw1XW+2EuOYA/3kIlQMLdx8NnT7ndrDUQ3SFrj9Q2ZMUaK9AOz9T3OpB+/U26cLRwz47u+0DXu1CbZPiSdmNaw/cizTo9J01T/fdbIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+dBCLA3L2qZ84qh9QCU29T9T2sQNBVUR6DtLg2wbjE=;
 b=Ja0offk1MJWU7RT8H+MxXtYATU7Xhz/kPeoFs5P9ZRQ50/mLzztwsbMRugLoAf5tFKuBZam2uJllo3m1LngmWVuRP/EuJON80gTpJpS42iNeJijjAloqaA5HuXQZJSSD7H2yaQdB1c1R1avz0/sV7/ZRfv6wS1tLPZHqtKH6c1ZFzl5d94T/751B5GvpDDLc+tZyTT5VNeTRCekUf+2FvOLkkCpM9XqrXJ4ZcPi3uBVrXEtWnhjplqS74CIYiaVLXjEfIRa9RRv2mqbL5Lr2SQipx/Mwhc4c/HLOPu7v32d2vhhln/nR11KyFGCrIpfhjDHCiF8lvaXKovo4VmIaCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+dBCLA3L2qZ84qh9QCU29T9T2sQNBVUR6DtLg2wbjE=;
 b=uvpZHU5b6ggn0xviJ68W3ftx1W2jS6lqajVtOU89OQ3Wg4Xx5IZAKK6w+GaW7KFOI6+ibGVfIeCMOC1YASHs2Sz0qovxLiPPZ4ShaQuOrvgh3/P0oxBmPkVxTv9mh0GuDqVOM15TBO4IZXhnb+JLQW5Dqe2vCDbDeKuApGgbBLo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by AM6PR08MB4070.eurprd08.prod.outlook.com (2603:10a6:20b:a3::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 11:17:04 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::408:fd93:d0d3:5315]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::408:fd93:d0d3:5315%3]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 11:17:03 +0000
From: Kamil Dziezyk <kamil.dziezyk@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] grub-efi: Add xen_boot support when 'xen' is in
 DISTRO_FEATURES for aarch64
Date: Thu, 13 Jan 2022 12:16:37 +0100
Message-Id: <20220113111637.18801-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0326.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::26) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 4f1eb1df-3782-4a6f-bd7f-08d9d6863f0a
X-MS-TrafficTypeDiagnostic: 
	AM6PR08MB4070:EE_|VE1EUR03FT021:EE_|DB8PR08MB5353:EE_
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB53538FDFC07842FB26AC5D5BFD539@DB8PR08MB5353.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:92;OLM:92;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 UjEya5QA8nKFlLpaWDSQGLrOz0Y/guF5I+YNZCE5Yyln4eGR+IdZ+xjnYJMo90QqMOE9yGROSTvJ4vnQSFnuR47el+KmA5J7rWt5tOrbobV0JWHwcUyQ3x/cfzz4WxeXESCeUNCacw8l6y78yKygr8gi9x5l6GuCwfC5SSf0MyxntAu0ZrgIlRn2ixchzwz8aOmvfEqcd5a2TZ75sC3pfa33jUH9+Wu+772FMaKBwGRQAmAbVKySXQAwXnrflrXg2wYb1cu4rqwdctDtS+2oxZ0E/Pz8UArdFYOzo5XILm6TjrVbw2nBQxwEGYluVgCHkdXlEeLKaWAC61d6Y35gCQewqOlrVKdcRqR2S6RtkRgFPkRywZ9E9uvuX+cepqHiVMLNSPdeUm+psEucfURzvYuMiZa7VeJBFNUQSg3a963uyB+ZMOsAj827+XM2zATG3bRUWWUxe65emc87zPcRhCucAHuL/8FCil+sVDS2OfwtR3YQUhoH07pK0ruAjzQ/QIo++K2+QdUhvtByLMGBAGRUzoxg3lsx1E2FAqWJVvpSxSp5wkOsKrDF0fwQDIQ9Y1wmjO+rzQYgjp9r8jkmKLcY4i/tJPyF34sEiwHIESta5AD5EeY9n6/+NWBt7MxRSaCdT0lLUeIlYVaNODflQZX0VopRohSMnUmiTafYq0ECpxyCkGoVUl+YHFXOmrbstfwGVHFbnkl/2i1GTK6w3g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(4744005)(4326008)(2906002)(186003)(38350700002)(508600001)(38100700002)(316002)(1076003)(6916009)(52116002)(66946007)(8936002)(26005)(8676002)(6666004)(6506007)(36756003)(5660300002)(66556008)(66476007)(44832011)(6512007)(6486002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4070
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f0b77f34-16ee-4529-71cf-08d9d68639ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E6ZYGDjhVmfVGbPTkMhqlq4QU2AOmMkJhS2nMHooqxbYZzuP7v+9a1DOZFIfCDXfvWLgPhWhbBhgaa+D+B2BVx+rVsRuOloEiR41ih5bZA63+FLJWzeXyatd0ekLhNprO/YEShA+HwoG3tElt1X+p3wSkmG8s8fIIoRXwk6nwH7ugFOUA3MDGYJYkPmLexmuLQkc39KgrHt6bpt+KY6OwOqM0p9ndEL73sv7ZwheySxc+ti+++FO0gh/VH7ZHkcpMeC9OzyuHUzygA/RyW13KBryaTinGBLZSmRN6UIzzsAvK03Qa6o8NFoT0MKlC8KM9htytCx0vt+RgDLDELS/PkWj9l5qkPSPyBBPdCUfdOnSmzzkCmt2Y5bzGFsFd9PzJPbSToDnac0XRUTSturdOaZP4Co8joMgvKu5HQn4Bc+ai7D+zJ1ZBMvRU1hu9BlTL1ZuWoB13pQMIFcYKqwtahmM6uZTEESdPbHgMOP4bmAR2U7KvFc+03gdlAughEsAP12BSSTu/jYpo5T7AB1P8ppXA1dgarktCzPnM/HEVSM80hFjGuReVoWUk2MO5eYuXl85M+EJvRoc3hPoyIYXl+Wz3ktza2O6GgXc9XehbgbYUgHmEvOCR+kIDsWB4N/IcJRvwxiUIdWn0uRF6NddxZmgSg5E2auP1WBAEbt7+m6qx21saL5xZLKU7e6VchB2UGGoZrXdD5Lq4UOv4/KoFfyS4+x/Y3pzY93yTpClfWMDrI8BHOl7c0sThV57u4p/sW39zAjlyDWLeCqN0rUJnQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(40470700002)(36840700001)(6512007)(70206006)(36756003)(6916009)(82310400004)(6486002)(2906002)(70586007)(316002)(86362001)(508600001)(40460700001)(36860700001)(8936002)(336012)(186003)(44832011)(8676002)(81166007)(6666004)(26005)(6506007)(4744005)(4326008)(47076005)(1076003)(2616005)(5660300002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 11:17:12.0172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4f1eb1df-3782-4a6f-bd7f-08d9d6863f0a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5353
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 11:17:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160508

'xen-boot' module is available only for aarch64.

Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
---
 meta/recipes-bsp/grub/grub-efi_2.06.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.06.bb b/meta/recipes-bsp/grub/grub-efi_2.06.bb
index a8cc209a02..df5f23e22e 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.06.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.06.bb
@@ -73,6 +73,9 @@ do_install() {
 GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal \
                  efi_gop iso9660 configfile search loadenv test"
 
+# 'xen_boot' is a module valid only for aarch64
+GRUB_BUILDIN:append:aarch64 = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' xen_boot', '', d)}"
+
 do_deploy() {
 	install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${DEPLOYDIR}
 }
-- 
2.17.1


