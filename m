Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17152C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 17:43:24 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.84])
 by mx.groups.io with SMTP id smtpd.web10.3590.1711042994315257296
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 10:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=iVAk+i3g;
 spf=pass (domain: nxp.com, ip: 40.107.6.84, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6vpgMtYw5KFFyHojoe6durbIcPH1n4xG1AnbYJbyqL6KQ1DwDR3mAhncUlSEt6mU7wi+aC/GCF8n4P06+2s/rMlWHEjZSDCCvq+HGwRGivjnFwQR9sZBxhDsyd346pI2lMqmiPUFl6hatuemlRpx9gMXA6bo3VdG6baBimrQGTZCYIIFQHOZSbeyrPvSSnp2os8u6Spi1Cpoh10nKX0ftk8Dw4FDPNyYjnoMa3bnyJPGo80pPMi1h0FcZUyan7cIosynZahV+RAk8K36S8UrcwNskvQ0CeR2rcwxgb9ujbeluZG6+umD4+/uujOXj9TOrpF8Y6Dros7dY3iVRIVmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLGE4vR9LDHVvO58xn2iHNLT8vC6TCUPh2ZHMYPZoII=;
 b=K20hHR5aeDLooEgstafw5Jds5Y/m6ENFSwL+CxM+VBrLMpFW/dia6Xademh4pvdszXhO4vYffm0F9VJYoUjS2yYTeJY8sbtOtZT6vx8Au7QLWM4EYYi+8a30SieBwYucxyJH0Wb/EXVgkggzZXTMbQpL4OAur7F5IgNzDIPqsVoAzvwzm7JwXCkYcWlGUFZB37ZAgIRfoeXxYclvW6dz3Uex+AQd/QUXhSZ6hSJmh9BMPPlVWXt+UkfEgQEEbIi39mdfNxi+IYYZj5LAqZchKroMSsBlvZaXwUGWuwuHWf8AbrO5nbWKXkGlIegYg0zChXv5MRVImXlkJEHygjbUpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLGE4vR9LDHVvO58xn2iHNLT8vC6TCUPh2ZHMYPZoII=;
 b=iVAk+i3gP3LTMhiFs17keMdkmlrQMytpwTHboJ320SIpWEL2fgBFYF0yGIOlpaaESvBNAUemkcC7yqTbP7YTzPBc41AxSL4XGO7MlsRhP4OS1YX83+Ze1YN1ktzvvUSe4j+5qAXYGeuiH6iM0RDhhbYkSBk7zohemhA5733Vrp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS5PR04MB10058.eurprd04.prod.outlook.com (2603:10a6:20b:683::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.31; Thu, 21 Mar
 2024 17:43:11 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::98a:d1cf:4bb2:7f52]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::98a:d1cf:4bb2:7f52%4]) with mapi id 15.20.7386.025; Thu, 21 Mar 2024
 17:43:11 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [[PATCH v2]] toolchain-shar-relocate.sh: Add check for missing command 'file'
Date: Thu, 21 Mar 2024 12:42:51 -0500
Message-ID: <20240321174251.495391-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0122.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::7) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS5PR04MB10058:EE_
X-MS-Office365-Filtering-Correlation-Id: 25e018c5-f6b7-4668-eef7-08dc49ce6052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U0bVAIHMzMAO9Gj5HUW44xq5iZqh4JHcr22KpK4cgfisCpZf80dbbT7d2ojsK7mAgQAdie/jBQvW2KqL06kf7qdWljlQcIuW4nj/4G3PVjN+BGlU67JQqwqpe8L7AcRWCkiKQ/n62cyRWpVgBui9rzqSG3O5FCxbrcFmskFIOQWA/3XU9OALPIivHRCoEUL4kaNdfL42zjqs0OpYETNyNv+xF8MHpJ+PjvJGpS01SFYKRtnhkBmx2/2vpzIuuHhF6VGY7xKXTVJjk3QPs0yvlLneSbCnFPx+zYOioAYw2SJTWCEamSvUV038cV9uW/HEPfGhG6LeyCWXzibk++a9wE3iwzH9XcCLyc9OdiNE01KAdvLrBOVK4E6yFRnhP2g1RG6HraRurDvLDyeTmTK35huYF/Ac9fn39FzeK4ve2/KphdoITRga+HT+3/h0yu2q3DMI6Ep9fsiuEqav8qwtvx93DBCDnx34cVRwPS0z/RkSeF7SNOnWkWlzvted4ECKU9RaW3J8vKPHb434rZyDHLGSF2hMMWQNnsCN90bSht9AwtBmwMkHA3IG8TmMSa0HgdsmleEmRvYt94WSfAJ5sRvZPMdMEuSjF8Jhv+qJiIcwokrCG44zk+L/wJroNmNRaxOmjLjzGcD/gzHSOwWosHdtLaCxSzR7WI0koAQ54llmfK3F6fQS7lUA0L6aufhFXl1ktaUQwllwVW6CxGZiJSptrHU6GLLlCMQ9YF3oKtU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(366007)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?52/gJ6bYQmdhrpkr0mSuBlfcGExAH2xflwqFrsIzxOSSHi3q8mIAkeF4pniV?=
 =?us-ascii?Q?2uE0gbPQE/aAxcslYs6Jp0ma0UdAs9OaKCdu4thWcNjl2aJjrd6snHBcdQ8N?=
 =?us-ascii?Q?OLjDsU+WTDupEMbXNo66aUcUy9ArP+roVMmu+x6mgx3Y6OzR2hDFe73TIXQv?=
 =?us-ascii?Q?qesFle1jpTpv+rR4TwT/2K9Qy4uo7abUJo0Xb6cuUOv3pY7zK5xkRYp1ylEj?=
 =?us-ascii?Q?Vwfl/PjXsH4C9zLxzPxdCBuFUygeRUyEL7/yF9oiW5Hqqbrkt9GRXR81CIwY?=
 =?us-ascii?Q?GgXNnsYs4xbljfEmHDqUdfiopHCnopIL2klbpLhD1QqAMd/dhjtPiBIl/fM7?=
 =?us-ascii?Q?haDSKBTw7xQP5hxQTIQNfxfWNfACFTbndU8i/jyeyrVkp0nnUCLQjWs7vyH1?=
 =?us-ascii?Q?EgnNNdkpyabgDg6jb8h2nulxpm/qCi5SdbHFsVJyAOajVbNHJ6ifOThl6jZb?=
 =?us-ascii?Q?DnUWzYe726qcasfabZCP7FzGJR8+FspJE6edEvvYhuskJWI9ZY8zmYlgvZtp?=
 =?us-ascii?Q?vSGCBcP6wnyebO52I1vYOy9l0SPysmJmNjv3N3Z7RtRJjNP3M6WzYoj93PE8?=
 =?us-ascii?Q?gfnUtLQ3CyJYmeLJU/DEI/3XMD3knbXjSvyIoR9DIqIvU6iWETV6p+3zZtio?=
 =?us-ascii?Q?vKdYBzgd4EIe9CplImKhfzo44cBmQG2DROPCKjZeeVweJ9Qx5Y4pi1reESJ4?=
 =?us-ascii?Q?xL5UUEJz074fdM4wWPGVT7onBPRIqE6LdEBDXxVJspbsAAhb6S2UrEkH07aW?=
 =?us-ascii?Q?6aRtWM0g7PaXsuwan4rZ0gqIGbwbayUdW+sm7aC0hmpitZq6nQeRJg+HrbAj?=
 =?us-ascii?Q?4JRxTuR68LaGH4gFc5G2x6aDQpurbbEjGqx+grt3dcyd5iAIPWTbKPyxL/xT?=
 =?us-ascii?Q?AOHxPb6IpmjalQi1wHp65x7x53x5nFSjfnI8TRm8glN44KVWa0+qTkBU8PqO?=
 =?us-ascii?Q?qiOb/VlHIN7UpUSU76TEfqonr5/DEfHBtBLOtZ4vLf3rkU0zReLRvAeaBWgh?=
 =?us-ascii?Q?xNoQU4Oo6HgoA+bL/Qq0JMNOMtfTD16CjWJLEuAi8kihxX5Xinj0or6MTEWC?=
 =?us-ascii?Q?mQOrNrii2mGUaWRscDGdisXfDKKiXPQrgOtya3tlJLgYAiYZUg/LFYt53LG2?=
 =?us-ascii?Q?vmc70/NWD+NhvzpOmpFAs/Z/mdAgt53dnXQppq8BRuVPAOUTLsBNSibJMXpA?=
 =?us-ascii?Q?IvtJwVmGvcUVkDV+8RPOU+sxU7DtBQKj5opDraGMRpWkgbPjCV4R4bPCA9IT?=
 =?us-ascii?Q?0SkbwWuQcqh2nZoryZ8rA+LjFJrLRb8mehP9IaVBFktDrzixj9dNhzCWRpvM?=
 =?us-ascii?Q?2nwjhHL0e9bxYhcNGkECqkkY6cZLJitdXGBV9c8xCeGWpybts9izncK3OrQ3?=
 =?us-ascii?Q?WV4YXayPr2TdXjMBqmKYTaeJ5MaigPyc/bAD4MvJ4OwynYvvdlqdJDr143OM?=
 =?us-ascii?Q?h2eCyW+QHT4pWahqpdydYZoW8MMIMwW/nFdBAAK1FZahblK4vJHRvWtXvfYy?=
 =?us-ascii?Q?4sUAbYRY+/mxVJZ69C+oYTgTi2TQldGZ2cXBhHKvBahIgqnYQMKALI0d8HXt?=
 =?us-ascii?Q?oNa+MRef9IcCCzvRQNAy6EaVz5GfIk3jZL3ojCkg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e018c5-f6b7-4668-eef7-08dc49ce6052
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 17:43:11.0867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5FYQdyg5/a36BPJp4jhMXC1sxFEtrVOTMLhq5p+0RR/cVxwNSqVpvsbgl11mxLFX/ul0uCYPufjhNMxuXFyMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 17:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197424

On a machine without the file command, the SDK install fails with a
cryptic error message.

```
xargs: file: No such file or directory
sed: no input files
Failed to replace perl. Relocate script failed. Abort!
```

Add a test for 'file' to print a clear error message.

```
The command 'file' is required by the relocation script, please install it =
first. Abort!
```

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/files/toolchain-shar-relocate.sh | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-s=
har-relocate.sh
index e8ab357717..b017714df0 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -1,7 +1,9 @@
-if ! xargs --version > /dev/null 2>&1; then
-	echo "xargs is required by the relocation script, please install it first=
. Abort!"
-	exit 1
-fi
+for cmd in xargs file; do
+	if ! command -v $cmd > /dev/null 2>&1; then
+		echo "The command '$cmd' is required by the relocation script, please in=
stall it first. Abort!"
+		exit 1
+	fi
+done
=20
 # fix dynamic loader paths in all ELF SDK binaries
 # allow symlinks to be accessed via the find command too
--=20
2.25.1


