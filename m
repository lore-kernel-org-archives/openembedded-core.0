Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB6ECA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 23:43:32 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.15])
 by mx.groups.io with SMTP id smtpd.web10.3339.1758239011219410356
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 16:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=S26PI5W8;
 spf=pass (domain: axis.com, ip: 40.107.162.15, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3sRrp13+DaIkPccIO14rhp6m97f+h14NobAky88TmMTtRLE12ClzHYFdzN+RdirsaiLsIMoGjkBoJzettIu8mr9QlbWRFEnDxb2Jlrd5pSX/TFkI4wjObnWRHg4vi1HvdXRYUFKtjouLfYzSP8r/C/AKg9VhSN4ZtzXNvitC+2Whz+dHNdbW2ZqB+RTWr9TwwCRTeBvfG0ESY24ZUZ+0Hw48iv9nHPv/TuS0q2qzblRNhIWzDUCZXAOUBTFrX+X81MJxLl8Pp8ygLocO1b1/ceGDp5rIjYzfp/kpearzJmGRGQBRskcSgOm07rUcbqOM2eKWDm3RoE3y2rnJqW76Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nT9vTD5W/4YcmPMkVqsCK1ElQu0CxEoDpjYHsH8UZE=;
 b=Pu79f654elyBhnoIdHvORG/6NynbaZLWwzSt09u6UcDb5HvJvljc69eBGE+7Hyna/FHUn3yDXIeHO8l7uP4wOZ4cAgj5tRbCphKB2Xovg+eFCt+665uj8oDBA8hUuN+YlSfjPmelOt7hn7j4cI+Czrkq6AEVBWJwkFcaMX4u3ZyFYQBH8uT4G/jiaA+wzqYTFJ1N3/8Hqn6KFy7ee3EHPZ2IBUPrYB2qte/6kyxxgZI/qHOqI2bsaj00nQ/V12wxa2gvjSij3yOuBvzK8HMYOWVJSTh0JRAvOzXo//Zwcc62Bv45IR6h2Pd60Ss0nNV91xWoeSvDHJQfANmZH18zug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nT9vTD5W/4YcmPMkVqsCK1ElQu0CxEoDpjYHsH8UZE=;
 b=S26PI5W8EiPKEnIgerFy31pMdx4w0foc5HQmuufhqYU3xRpimXuJMtWj2KjjyoOCIPjzlv3zepIqb9YHUQL5kt+b2EnYuzVU8iPmjbz5vdUMAyIs1z7bjG4WlnOhsS2+AW2X5g7LZ9GT29x978pOttZ34HoF+KaWqYDDFxHZ3pk=
Received: from AS4P190CA0015.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::19)
 by AM9PR02MB7282.eurprd02.prod.outlook.com (2603:10a6:20b:3ee::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 23:43:28 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:20b:5de:cafe::63) by AS4P190CA0015.outlook.office365.com
 (2603:10a6:20b:5de::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Thu,
 18 Sep 2025 23:43:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 23:43:28 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Fri, 19 Sep
 2025 01:43:27 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 19 Sep 2025 01:43:27 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 10FB5262A
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 01:43:27 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 652431200FB; Fri, 19 Sep 2025 01:43:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] curl: Update to 8.16.0
Date: Fri, 19 Sep 2025 01:43:21 +0200
Message-ID: <20250918234321.3590122-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918234321.3590122-1-pkj@axis.com>
References: <20250918234321.3590122-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004A:EE_|AM9PR02MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: f11c6055-960b-44c3-4eb1-08ddf70d2ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6WjgQ/BNC5hByFQtlMS6Uv3h2kgQRHPsWEwyp2pkxSJ99oeOIRqw+AEh5vIY?=
 =?us-ascii?Q?nRXOUyX0HUyXQGEr1K08zt7sivivUgpBFYq6Gv2jYNNgJQQA5oC9UQdJnmRu?=
 =?us-ascii?Q?JycBK+OEcgVm5GseYMaC3sWDF+f+AX2U16yIvWN9GGC/OOKr0hPijwYCKb4Q?=
 =?us-ascii?Q?4F0QuDKfBuYDJYSKZWnDIuVpgax+FjwDDsPElQfcUQGcg8o5zGwF5KJHIOk3?=
 =?us-ascii?Q?ZFB7ApFEoxqv6J0M9ndWAQ0SpOLTI1st2lgilZomameR5cb+oHnZ/TSzyeFD?=
 =?us-ascii?Q?HN6UHcN7JVe5SRhllhCrR/j4CjsWU403WoEKjL1XndQ0G8DYB1mRFnP20OEs?=
 =?us-ascii?Q?FdCHHJR/TcYwNgZuhFYWV6X9+5h4q3HYIHBeiUV1T418LpJhiGWrxlxjNhQT?=
 =?us-ascii?Q?oeaXJyAWTiK+4UMCwcsLD1A6i2mwiQhD46kc8LnHHRwSe4/5NkZm9luovW9m?=
 =?us-ascii?Q?BRpccxAsm722XYc0IeeV8vtAn5nyaB0PaoR3/EZ1sUYRoANGZwkMALyhMBtg?=
 =?us-ascii?Q?DaLIfqfA5TT4Y0f2XjHeukPBoPdpoN7tr1UifnvNP/FFvZngkc6SN5uKWySd?=
 =?us-ascii?Q?9vun4LFK80Aps1umrDUPXjgG7eEvpF3rcknIJhdD4gIKai2hrqLA43O2Wbqj?=
 =?us-ascii?Q?vm5BBDLdpr+zqT04lO/pBSWZ/i8pO0tcfO9QVGBrrULq9g5VgzKhyNH+tFLq?=
 =?us-ascii?Q?u7uSJdC4vygjVhq2Qbgmd3lv1TJIoCO2Au4VDAxeS6wEMiRgjPPDXTutAzzt?=
 =?us-ascii?Q?p10Y87XfLOpcWd5S2E3X9TENaxlBNGIqUMjh9r1TyjwDUqqBgcbav8lnelMX?=
 =?us-ascii?Q?eNxnFfUnP2YJqtdsp7UycpCJFxb2KSIEAJ8pC3QLHOiYfXMlqI2mbrECTY+1?=
 =?us-ascii?Q?ybtx4W/rxpdCcBduI5tRIog/sj0WxIZT7FmV/m1NT46PV63ffnMARfaFoUqV?=
 =?us-ascii?Q?7Ec8UzDmPOOB2+qEdohvQqKMqlh7JiMj6enx1ka7O/KFmvetZBCor6RDIu5S?=
 =?us-ascii?Q?E9JCE3K/7LBn1XuQ2Sdi5EH7wRZzh+mXUs/HD9YyZ5VZIR5ONI9z1QTIcFyz?=
 =?us-ascii?Q?AhOJR+bwVdldfMYB8MJ+AmAppZblHAkB73QFf3XKumYBJJv0DLUV5sbpZqpD?=
 =?us-ascii?Q?g+360r3w5EnBJN+q/uPxsTxb/k4B+xGfk9g96RbUHCEzYLEOUINMfRq2VXjd?=
 =?us-ascii?Q?tt4nem7OwErt5KLTTpVkhCR3NJdeYBCq3RpZhd6/1JZUNt+IPRMZxJEwFgec?=
 =?us-ascii?Q?a3zVXhZ6B8vzUUfUHzGLXnfEuLggOxfaJdfyx74drmwnxUKLzE60QzYJqA0Q?=
 =?us-ascii?Q?jNfEEAl/u30LX0INA1DEK/CPvXwjhEcGAOKNsIGSQBXBR76eahSOTHB7nadp?=
 =?us-ascii?Q?4klS3VkYq1IY1/qR6IqJiSvwtLoU/Nv39e4M/zxzb0ZaTNtLlz7EOq3EHHIC?=
 =?us-ascii?Q?/nI5UF6jKxgmDlvSCgPf91S3J6P/ybWP?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 23:43:28.0014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f11c6055-960b-44c3-4eb1-08ddf70d2ac1
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7282
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 23:43:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223713

Release notes:
https://curl.se/changes.html#8_16_0

CVE: CVE-2025-9086
CVE: CVE-2025-10148
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-support/curl/{curl_8.15.0.bb =3D> curl_8.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_8.15.0.bb =3D> curl_8.16.0.bb} (98%=
)

diff --git a/meta/recipes-support/curl/curl_8.15.0.bb b/meta/recipes-suppor=
t/curl/curl_8.16.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.15.0.bb
rename to meta/recipes-support/curl/curl_8.16.0.bb
index 809aac8bec..c226670357 100644
--- a/meta/recipes-support/curl/curl_8.15.0.bb
+++ b/meta/recipes-support/curl/curl_8.16.0.bb
@@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk =3D " \
            file://environment.d-curl.sh \
 "
=20
-SRC_URI[sha256sum] =3D "6cd0a8a5b126ddfda61c94dc2c3fc53481ba7a35461cf7c5ab=
66aa9d6775b609"
+SRC_URI[sha256sum] =3D "40c8cddbcb6cc6251c03dea423a472a6cea4037be654ba5cf5=
dec6eb2d22ff1d"
=20
 # Curl has used many names over the years...
 CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:lib=
curl daniel_stenberg:curl"

