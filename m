Return-Path: <d.schultz@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282C8CA0EE4
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 21:27:15 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.100])
 by mx.groups.io with SMTP id smtpd.web10.33554.1755206832022920442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Aug 2025 14:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=sOQLTFf6;
 spf=pass (domain: phytec.de, ip: 40.107.20.100, mailfrom: d.schultz@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwVCw7Jjb+L6eM5FjNPaM4LEzNWJ1JkhQt/m3FHwOZTaxC58KkgJzURPsOWGo98KQg14LfObTkvAsV4paCEBwDMQxGLZr046i403c0JxZoWyxRxPjKyb17Q0Vx/LOrpIgJ46yKJY3x6elggao4xDS/tFJ5BltHPdYVQv1X4HcSgmGOu+N1PCtDGrv2VwzhMMLYuUM0vQCbQIRVkXSrwaonkPsE1KT16l/bbsaCnECS51F/1/M6SzmBd682F/u1gMWgC9+P+6n5zyEcTbY9kMvzx6XaHqB8QwmU6IbVvfcmD4maeX9DKNmOinePJnJfPaNUGziwnK7roh9Pq2i6qvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jS1eC9Kzs1PODJET2iOPhE5PIXOaYsdKNWM5p0BAIK0=;
 b=Vccr0zXQzFbPYsCasMbExIDyubqnkNeYYAPekNAO5fkkHm7e7U7bSZQp9dHirxMZm43HXNzmcPfkXfbAv3McZKoPQsiPWmcDlOItilKzxtIKp1566xJXUlG40L7hmxmvqTHBv9J5eyMfz+zwHRIJIfwTvAfuT7/oz+hw3S9tOfq/6aWFO/n/hUTXBPJz2HIPmD0KBBMQqfsnEY/bCOiSyPsu/kAZy2Bcr+pxVC4apo40wjGoVVShqtenctivRxafl6N/TwD2++gSMjuJLXVH74MTG8hJogFq/P5HnCqBCPPzLiXNVtiA/Ol7PQ3n3eyDSuu9st3qfr7FcRMZC3kN9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=temperror action=none header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jS1eC9Kzs1PODJET2iOPhE5PIXOaYsdKNWM5p0BAIK0=;
 b=sOQLTFf6Hufe9fizZYPXYuUOe5zAQ8DX5IfGPkgsahdUNPW7WB1bEEgFk9Qq/kYBWdSHByu1hW6FqRTi60JsnWxrxVoChLBJ+6s4mkX3QhpDk3F8CW4NMgD7rYQJ9WOAeK+oR5UX9llkHvnyQl9BvraKrsIdzSFy8Ij6mrvsMRAeyAEt0J3mclHjCDOC3fthDTjjza1/rosThGUUX46/YiPuwjoh0Ym7hoA3QimAiODMwWZWC3mw5cnB4htn40xRcwBSsIFOG76N0QWshliiwb6f7zGjEvgwEDqap2OWiXKOZTE9IW9EgHvMCTC3agiww0QlFqQe4boUl+pHHYGyGA==
Received: from AM0PR07CA0006.eurprd07.prod.outlook.com (2603:10a6:208:ac::19)
 by AS8P195MB1128.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:3c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Thu, 14 Aug
 2025 21:27:07 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:208:ac:cafe::a6) by AM0PR07CA0006.outlook.office365.com
 (2603:10a6:208:ac::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.6 via Frontend Transport; Thu,
 14 Aug 2025 21:27:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Thu, 14 Aug 2025 21:27:05 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 14 Aug
 2025 23:27:04 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 14 Aug
 2025 23:27:03 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <openembedded-core@lists.openembedded.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH] meta-networking: mbedtls: Remove branch and tag from SRC_URI
Date: Thu, 14 Aug 2025 14:26:50 -0700
Message-ID: <20250814212650.3003016-1-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000190:EE_|AS8P195MB1128:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c346f6-1367-4497-22b2-08dddb795104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OjCBhc2/oQuJQkCqRlUerVBaWxA+xnpzbBqVFCPkyrfxIedWvrnfOwOLTfZz?=
 =?us-ascii?Q?spNzGScCRFf91kFRftOhQm67l18amvnIA9BA1oEOEPSnQFj15u3nUtcZFynZ?=
 =?us-ascii?Q?AYtl8/DjV3gja/8+Bvpy6vsN09Dkiv1d58m3E2eHruIFxW9LekJUVj3DkHPF?=
 =?us-ascii?Q?RRmQYLy+lE3mAkWzbHFQopnT6zn4rebf6tBNKuXg2evKzugYBtWZdk7N2mgG?=
 =?us-ascii?Q?lplQHjagKWySGrHaBw4tYAnooviOZC5K60TrwSpQpzZrvdCveMBUPrFfIXg9?=
 =?us-ascii?Q?PzKbFP5MkNArnDX8D3L+w0xsUcOSN/nfXmJ4vkJFbpZdONJQ2dyVjK7jMIk0?=
 =?us-ascii?Q?yNvqRNkJTR/GF+3+1hyLIvkTbpsA6cJUtY1F2ZI0RVqfJPj5W/OUxpIXVJOP?=
 =?us-ascii?Q?rXupHVg2fZtp7e+GnF2DFQvMvnOvzLLxae11e7dhWPw7jUKRcL+21ntC8+cn?=
 =?us-ascii?Q?0U+q6QKAGtqr8JZVbz7Qs3fzf7trYxeV2TtOPyBZGTDJhxpWT8vIPQ3D9zFU?=
 =?us-ascii?Q?7kGoC57Y4DJ9P1MEZAQ86FzU2sXf4JztNfqMd4O/dV0rLJGOuZCIDA37WssC?=
 =?us-ascii?Q?kWbZeotXBQTawwg15L1KyULPsW1DfWaL2yAsnv6JEa9lddG8GAbKB43GXgoE?=
 =?us-ascii?Q?5mG1ngTIuF9YF9z5uL8O1JRbeQI0/wXiK0s6EGCjUhMFiT62Wa/v10xvGJ6j?=
 =?us-ascii?Q?dDDujPtBw3C0l7NmUeJLnFODiSGocSV8NpUSQw2i5/7CEspaMmc5NVLVt8Cl?=
 =?us-ascii?Q?58moIsbsYX5siMNZhf/kykYQ1xjjKmgU26/WRDyaTyYyDYkTTE1y8j35KYjG?=
 =?us-ascii?Q?6Q7wFi1hSBr7ouE6iE9d6yhgYbUBzXS1YEiUjO2sAtwhPtkD6deaQved4eYw?=
 =?us-ascii?Q?qwM4ZoOxbOuAYEoiRqjGJQnZHT6X/C620/vOhAToN6jJOaaI+SOS/tRYv/NI?=
 =?us-ascii?Q?elk87GUM1Ip98BFRHcP0mqmfQyZKXDjLcT4AdKcOny8SbzOLNwNzJVMoBYoR?=
 =?us-ascii?Q?gig4XQIktJW2j5+M+zKxVQxRVUB2MShEH92BWYEUhz5VnQMnZB7oYXb2D4/w?=
 =?us-ascii?Q?pLyc747JbA3VuoLWFk+DNyP/5WYasoN9iwCR1aiU8rSV5lc2UfyfwDZ/bOwM?=
 =?us-ascii?Q?qmGoQK/JrAVczqQwunaOK9+ZbBmtrZJVQf3jhalBdphkzQZLKy1E39TWZU0A?=
 =?us-ascii?Q?dsu5AMuzXootN07E6EGgb3vV5iJe5NKJYm5N2mG5Sze/XmJ6vA9bAfPREGkZ?=
 =?us-ascii?Q?shf0AQ+ximDSg4USGLgqjqOFbQ0xlaRN0Wg5K/iPgMNTsk7bQ8KaElgk7Ao4?=
 =?us-ascii?Q?vrpCQgjjyo509f4s4S6BHr0+W+FxdBkPZJ+IwLJdugtDiwjZ/xYFrIrde91T?=
 =?us-ascii?Q?Bv4heebBN/Vo3juLIq5DtCLWQlaDGRhgT3sQtL9Od9JbB27Obe8XH3cSssM6?=
 =?us-ascii?Q?jkQSWH21amHCJvefbDTllmXc3cuWs5jBLn8hVylEgFheVtAURCTEvWWBYo17?=
 =?us-ascii?Q?21TWb0wsbHkxjLIX0hU8q7WUgW6A/kZUbBct?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 21:27:05.2743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c346f6-1367-4497-22b2-08dddb795104
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB1128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 21:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221871

This recipe uses SRCREV as well as defines a tag in the SRC_URI.
Only use SRCREV since defining both will generate an error.

Fix following error:
  [...] FetchError: Fetcher failure: Conflicting revisions
  (c765c831e5c2a0971410692f92f7a81d6ec65ec2 from SRCREV and v3.6.4
  from the url) found, please specify one valid value

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb =
b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
index 88b50a406b..3788b05838 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D379d5819937a6c=
2f1ef1630d341e026d"
 SECTION =3D "libs"
=20
 S =3D "${WORKDIR}/git"
-SRC_URI =3D "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;bran=
ch=3Dmbedtls-3.6;tag=3Dv${PV} \
+SRC_URI =3D "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps \
            file://run-ptest \
            "
=20
--=20
2.25.1


