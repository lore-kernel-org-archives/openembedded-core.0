Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1322C982DA
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 14:19:50 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12217.1789741183797513019
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 07:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=pcx9DR8M;
 spf=pass (domain: de.bosch.com, ip: 52.101.72.61, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0es9nqWdnJiVqtkvTkX/18dtsDEGhc9BAN8GOjiKFtF+J0P3iHGFnm94kFYccmf/RoCC/jdMufGZVwUk9Fq36WEfy1JajHhrSZnFqi8Q1KjswMMyq87RdrUZHVyU2UgvRqBajTFRMld/d/+kS2UIJ070FsRib2h0U/IOqTfWwekHRxkEmJ/w4Udd6GDjGAklpfbzBwxE6q4Rn+59EfdMPOX8092vuLTbaT+kATLjYNnHAOJIXCElAhNgAOWQxBGPJ7mNJe3C20Sd9rZMMjWq+JG55taxjyqAZrNV7hRFdmm8Eq6gOrmQG2jbxCRpR4xWFYoEpMcMwDy/aI1SNHvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrfHzB6dXlxamwDAyTNcc7JC6ugtwO9u5KGbuoNK35A=;
 b=SRQrXzdVQQ75y0yak3mLJxAIFBO3UUYGV5GvaD1zBaCr5sFcOSYqje0JcI9lOtqpHXiYovYdLnvTtfSm704QAJanyc+PAVHQWAEpxrMmqRDyywNrHK95juxAwpbCN3hLd+Jcc1wNvB0ERo0fee2SALiIWnPiaOml2+qrInf98b7Su9PAUIsZA9zPpnntxZ614u1AfoRKHA1PjurFA7tkxr+18uWQtGvTl4bNKrPN98SRsNt+8xlHBKyF1D5F5nxmUDiLl6bs9mlN6AjSdvR25tzLNfl+PHRy1Wk4E175Xi+2SAuPsgcRJ4SbkUzdH0xFtmPzNJRXet9Is45sOgs5rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrfHzB6dXlxamwDAyTNcc7JC6ugtwO9u5KGbuoNK35A=;
 b=pcx9DR8ML7UGa24ePiPBIv1fGSLpuj6GH15clZ5s6qjLI3k0dwQeFjuRtgRQAGX6qo1ZjZSTXu2rGcB1hzUeHUg8qsrf8bTekaolPU/iWUp350BaEfCwiJvo3nRJocwSFcHS4qmzMK8ZEWk2Kg3pUsfysbPdmyx2hyGl6HQ94d7y/pSxwVpBL1SIoUJsQr9xWR5n+zJ5aUbBs3GtFAbLKUZawJmQWp+Jb0qVbEaPtrR7R1opbrihibP0FSc3FMwxegyrfgRFqB3sPaU7TyoI1Cunub02p+qlyJus2SBBQhhyTrwDYCOZWIMZPIZApqNDLUzwjtATNTVGXncQq0QfXQ==
Received: from AS4P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::6)
 by AS2PR10MB7456.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:593::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 14:19:38 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:20b:5de:cafe::36) by AS4P190CA0007.outlook.office365.com
 (2603:10a6:20b:5de::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Fri,
 18 Sep 2026 14:19:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 14:19:37 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 16:19:21 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.22.68.107) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 18 Sep 2026 16:19:21 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-core@lists.openembedded.org>
CC: <wangmy@fujitsu.com>, <mathieu.dubois-briand@bootlin.com>, Ricardo Simoes
	<ricardo.simoes@pt.bosch.com>, Mark Jonas <mark.jonas@de.bosch.com>
Subject: [PATCH] xorgproto: Set ALLOW_EMPTY for the main package
Date: Fri, 18 Sep 2026 16:18:49 +0200
Message-ID: <20260918141849.1875-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.68.107]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B88:EE_|AS2PR10MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 924f401a-93eb-4424-bc70-08df158fdf13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|56012099006|10067099003|6133799003|11063799006|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	psxHgg3JvSVjJDwaVTCLMZ2Y2Tgp2vHDNfTmxmRrtGZqOtKtiX1+qeBNNINOTDnMQC3GGmWcRmep61Ur58MBN8ahYNpcWAPQFJpXGpFhVC/8RYaJDKpxPv+N+PxHXVmtB21mQ/efxKgpHrbd+Z68mPSKFWrg7HZnIoJMbhIdMsorWaYDhmxP39NrihtPCU5Ei/Pimrkgdrb1Q93Gzkxo1LWD1k+fo8DGRhlW1MdgcJCcyDfWAX6ApH0fYtPE8OeFou5syu/etOvryTZ0NOlX+qnJuMo5h46Ew64dsw46NqCWOp5Id5+tJ72hD/DwkQxO1eY0YaM+L4S5KBTlX8pjbtvyEqS1C6VEvkcDhvoULLkMEpuMahPi8enhHVvTGrumlhcmToGU+L8pZ2RDcbsHh9quOns2swfkPxYNnzSGsc6mMlpEZUAOVt+n9eupAvpZzWMz5XQd/B2OUD3jXmEphTg27vbF25zEyV7Ny2rqFnZLwVJUuepuYxwHZR5OUPOc67cUb3sj0UJYavFUVdC4v2JTX/gS2F4VZEYlloLyMrfFxuOhPdpydOWzFRd/DncQghvRYMRUzFD6cCOg+1xXLTQ6E/ooJdN2WnApo6F626shX+Pks7VMIi8+czWJE5wfiM1cmshzul1Rj60jN9Pfwg==
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(56012099006)(10067099003)(6133799003)(11063799006)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TTOi5DWbpQ3FXZ8prr6tDKLjLmoAcSkHgtcQEuREYw7c1AiQu3BQTLwaljBi6gkX2WwNbcqlAZR6DQGoE0q7gP69G0Dyb81FajYDKFuyvDQx9ML5Sk+LlLXJmdnjeTJEm/T6i9zoJSvJImUirvibEEaD209wn7Qwt4FOYugyuIJVkRGyR9g06fsNF8s3o0b7A/N/jZZKKEPpvkh+UQT9qWaHanj+vOrXb+Vv+WqHeNIeKlpolWRA7nbbI/oETmlTaEPWRSSp0FM1b9ZyJ7aBfCEWv5gxpLfE4Y7wMaTz3ckDIUGdiA4bLGFCy+YHp5IeHjgyK7SbvqQRYnOlisjZisiiy+KdXAZUCWMASsQHo0/LSxfHPMJSRGJODvLt72N4lfPC8o99gboLhpuP9dj1xukYypsn6lOxxwLgj2JuJWhM+5zJK8/MdcV60KLtyejP
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:19:37.6044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 924f401a-93eb-4424-bc70-08df158fdf13
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7456
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 14:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246217

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

When creating an SDK, the populate_sdk task relies on
COMPLEMENTARY_GLOB[dev-pkgs] to decide which packages to install [1].

However, xorgproto is a header-only library, so bitbake does not emit a
main package. The only reference to the -dev package is an RRECOMMENDS
from the -dbg package, and such weak links are not honored when
installing complementary packages [2].

Fix this by setting ALLOW_EMPTY for the xorgproto package. The main
package is now emitted, which makes ${PN}-dev reachable through the
complementary packages and lets recipes that depend on xorgproto be
built with the SDK.

[1] https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe=
/populate_sdk_base.bbclass#n38
[2] https://docs.yoctoproject.org/ref-manual/variables.html#term-COMPLEMENT=
ARY_GLOB

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb b/meta/re=
cipes-graphics/xorg-proto/xorgproto_2025.1.bb
index e187c56fbc..df09135e27 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
@@ -23,3 +23,6 @@ DEV_PKG_DEPENDENCY =3D ""
 RRECOMMENDS:${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+# This is a header only library - thus everything lands in the -dev packag=
e
+ALLOW_EMPTY:${PN} =3D "1"
--=20
2.34.1


