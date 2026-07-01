Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B46C43327
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 15:05:06 +0000 (UTC)
Received: from relay-r17-hz12.hornetsecurity.com (relay-r17-hz12.hornetsecurity.com [94.100.138.217])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47495.1782918295984511777
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 08:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=omScvDX/;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.138.217, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate81-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=40.107.159.87, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=osppr02cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=DFbFVmeOYDVRJXDRbzO/eDzuE53sd/8FK09W0wLADGk=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1782918293;
 b=ZDOZgEBpx74BGkhvDLTOb8WYZyFwcNkerj9GDF1injHyITuMFTAXqEFRozY4AhUCIPkzJFVG
 lIO5rJtPYHab5pukoTEzLeSAGG7jmKbIePoZFaXBjm7XAIrFHBeOuJNdCl5bilIx3g0E6M+rh86
 9EXOF9Ou9SZwN+AKw9t3DeY4jBEWrRsM8dxf1XqzAPmd2aglV05ZdYC17q2LKwkT0IFRDlRCBT6
 HBUbuHuCB4X6gKMgL2aCh63UWcuDA+gueQ8T5e49NZGtHovn/ASZ0/Fg8dnVPfVVgct6E1Y3gbF
 PZ6uBiFntKGniEbzRB3hAehfhU/Kb6iwg+yHY5iBt338Q==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1782918293;
 b=qas9S3AosN3yKGGOJcHyocHsAXjdKeE28ptL1V4kBDkAUtzlsfUrcGhXXYRns7gLNsdjIuYZ
 tmjfk7xmhpvx9dTBV3RE1KGxvlQOxYBaGHo05pGJhi3NClTQflpSaQtpRBik5QI3e5jSqjYCnin
 Y4A2IqDPK0EUOABBMkaMknfsvyAy/mCKbVGBlwTdIof6FX4F2qF6H0rBY0z+8vBejFKOjGrEREm
 awVEuo5XmGV1H1z47UGDcnURiSnM6kr0tvNm2Obvgwbc7jGuETVp1u8UXulAhEkTB0pNbdmoWBc
 wLSU0koWXmAg/E+ipiHCouX/lKlCzHS61SEP5HctwkEDg==
Received: from mail-norwayeastazon11023087.outbound.protection.outlook.com ([40.107.159.87]) by mx-gate81-hz12.hornetsecurity.com;
 Wed, 01 Jul 2026 17:04:53 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SkFQYuiZlEcBUQMZpUR7ntXQJWSdjFJOLKw5Ab2omxoJhLrwmTv3tkPaa/AHEU/y1G2azfeevC+Pbf1GkHGU4NbUJ3XAFrOVDNUv9xhRjJS6j5SlfwJ0FZq3T0sDsyIxVgkKu7CIJJSq79Fn0PLki1F9Ke2nNyFe3na1KAAHXeLM9JCRHH934ZzTDkcNHh4UHzeSewo1GhHYtMHDyC3sY3Hky/nIW06faHvWWEBSiJQm5OvianhWlWL2CLgmdoXvJi42d/rYF0wu6wfCnOHcz3dTsSLd+PQ6uv1kBQbSIrIB7aU6ZXzZLfd+/V+VWrmg28/vIe99wK0c2VsfbDAjKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFbFVmeOYDVRJXDRbzO/eDzuE53sd/8FK09W0wLADGk=;
 b=QQroeBiyQEbjRaRYC0awNTJ2M7oj/Omlyb3nWNcsKo5Cl5QwZu+6OyG/aGpyHT2EwXl7ywKhXcgdTVSn4eVXzjLI+Rd8mEGvV9pMaHSn4Qd0XorWmLyFrxHrWjbRc6k8fzh2ctQ8U2tb7T5T67rYi14zxitRNqdOi39iDuaW5xYm0Vq6hzGNr9X3Sg+VO6GjkHIq+BMGsG4X/3cvBFBXOu+m0kaurQ7wqiGKjn9BJQPcFKfQ1OkDQKpQ8vJ1TeF9aIjHwRbNBo0fFWodHMM7ox5nYyVBkaEgOvmcO6yIPErWh608ine8ORoU9QZwKL6JCzPGpeFYHaeQciHB4IzT5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFbFVmeOYDVRJXDRbzO/eDzuE53sd/8FK09W0wLADGk=;
 b=omScvDX/8gsXG8NlD1beoPEXplo9FdxNxfXmN2cTxvWCYSczEeBZFtAvmOKqJxQQ2A80LZ0gzouBPbzTf82Lv8YoQlqAlDFTm3D2DP2ik9ty9tGhySlKpiPIyB+TM0DuGInEG47wYLXr2S/foPYj7Dpbgw9iucKucPjtyW6NRsRFcSuroldKGD9pz4hHOCV+zl7h4tOdnlPuyVmEwR9cceRpsMZrp42K/+fZs/ULTRnLupB4u968wR0t5DpJP1Ffk/57XmQmiV/Bynv4MRqIqr1u0wuSp7SHcVJ+JMnFfftbpMqL3ORL8LtlB4uzSH9gKuhVmFjNuSg+UJEnHCK/tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:1ad::24)
 by GVXP192MB3339.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:2bf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 1 Jul
 2026 15:04:44 +0000
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6]) by PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 15:04:44 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [scarthgap][PATCH v2 2/3] dhcpcd: patch CVE-2026-56114
Date: Wed,  1 Jul 2026 17:04:32 +0200
Message-ID: <20260701150433.3889478-3-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701150433.3889478-1-tgaige.opensource@witekio.com>
References: <239971>
 <20260701150433.3889478-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::18) To PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:1ad::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP192MB1405:EE_|GVXP192MB3339:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b0c982b-6966-4b04-17bb-08ded78215a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|10070799003|18002099003|22082099003|13003099007|56012099006|3023799007|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	yu2dLx1KM2Mw1X2u3AWJ5DYoGciJryYsRLgJsVsjDcB12Ag6FBbDslmVIXMqovcYeq8bYLQvrmtLX7t8QNyFrSnQ0NK9hnGwBVgoEPQyLGoLIuUZUeHJvHvGMX0cQpXDBq5BnpuVhFDp+IBWyHf+ELKqESVTwftGeVUi+qadzwep2RKerVf+KRreROH8uXM0dLYJzVoP1P4DJvhR6cZ+WprpEeTkWg1WFbvi5Z0VwhgYLEl0X+3VW2wLqPLFa3AQ2NvKidQbVXAs86wCReDTYPXCArwN16Ap6PyfqxMdvkDGruMRVpBI9v/sbH/1gocNBNRzyWIVlctdfqTWxAxFby4YF8fYS6wLH9Hoc+tgN6U+Y8lcCQryLvNNcbpni4BDNkELXiYZeClx9GjS5n3+NL9IO+CE47iRULaYxrvYvDrKOydT1DsyMQHLqIjhvgljhTGWfQ5/PRs6crsKldjF7aNQoUIK0V4UlCYAVDwEBnefHRS3EzjMXurItFQ4J/OYQwUrHemDmTDp8U7vNWp93VvEHHfnAjKyrd/EbJdLhyVIl2VY5+UydV7tu2Xb54MYXoZEhiLz+ngJthIHhO5oSGAfs4elMNyQsJf072qsrjw9Trfc7M0YXFr+d781xIMqeW7JVg8MDsCG5MCblvoVOboGpuGXqV9kaDVJyD6pfCA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP192MB1405.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(10070799003)(18002099003)(22082099003)(13003099007)(56012099006)(3023799007)(6133799003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?boHo97o6ryS78l9iTn/uyISo+sMrNjALMp1Gns0Wmu2lEDQvJzuEQH2T4PBe?=
 =?us-ascii?Q?j8J8FLZPcGjugZXbdhmVCXnV+igV2jdD3yhabFjmprdOWeqBFtR8OnQ9WOr0?=
 =?us-ascii?Q?uedHp7C3SDkzB/V4rv69GFo0v8hctpLQ8nAH1AJ/pSvmr5yy3QV0GB0CAfVO?=
 =?us-ascii?Q?I1vwwhZw+EAVbaC7HJZNd8yE0dHw9z1rQqPlSv6Ncdkn/1PPmhboMwR8mn9z?=
 =?us-ascii?Q?OROP832d4lQalDqoBZu8NxqNKk5HXDjP7jaU/w0c8Ft+LnHb3YzuUCL7hger?=
 =?us-ascii?Q?9AsK8R2U5gftdskODZr1kfWQXSXjzF0EB/RqQt00oLqOduiqY5lgCXnG+F1B?=
 =?us-ascii?Q?0X8P7DLI6Zn2bjI21TNDeaYeqnQfIqTaEb6unhwLGr2gFAs1WtS+ZClZ/YRw?=
 =?us-ascii?Q?ZViX69ncu4MRdKvXqcPzTA7QopQ2KXJGZMC9yEQqTbTqsnkXxmMa5tp+rjgO?=
 =?us-ascii?Q?a+tUruqtYyUEZ7Ti3II5yoMXdNKDMMvbUOioIJUhvYmTxTL8bUL2mPV4Mvan?=
 =?us-ascii?Q?X5ri2dvel47fXQM2ldQq7rq1EIx/KLzdfM3jInU0yaH7b98sOTY1KcvGHeLb?=
 =?us-ascii?Q?wAKkdyUMgS602lGLSWsHAlXv4qEHvfzLKgr3bKTqput0Lc1FVeRMVMi/7ev5?=
 =?us-ascii?Q?LBqUFfg0/huVob6y6fTGclR9yuS4w7WSpbH4IVPz8UPQqyKVW84+pFhYBMHJ?=
 =?us-ascii?Q?PrJUB6LT/ZWSONJhmoW25iJL7CL0bxITqpN+WOk+sA4WeMqyvpQcdAb86iox?=
 =?us-ascii?Q?F9PZ1NcIOqIWJ+IMygp22t0Q43jb0vTjosNU9dz9WR4Av5pm0fFy6FvB2IZE?=
 =?us-ascii?Q?AJLlSot81FsyzmuLYSvxpI5D6J8EgkZDmsIa5HVT1T3TmjYEEml6GjhVIi5S?=
 =?us-ascii?Q?MaWgoQQWE7qaU3bMZo/QtbVDNMHNhZJh6qquXazJ5X+32cNih9GTFEdef/SH?=
 =?us-ascii?Q?aLzDGw+qqiLzV5zG8+0KQirwNZ6J5maN0tRse9DjuwSM31/8TpHjzJo5sEER?=
 =?us-ascii?Q?BVAciCoxieicwL70/GC2gRaLoGCCD1TgDj+tsgrIRAh8zwXPHQM9o+l0c5v2?=
 =?us-ascii?Q?S6c32kiHBPveINevh+QcYaS5mZAotSBWVx+Pw1x+XTP0GFkJDWl2016YUQR1?=
 =?us-ascii?Q?npIL8P+xqpC6judux+ZJZ4lVFAJuCghAqMpnhsnL1XIaEVh40iLcixnpdX9/?=
 =?us-ascii?Q?TMIyFWWKz60aH7N2b7Iz7AsIBv4ZyOW6STvYc/dlrPuhIpOmRtrGh/VP6irj?=
 =?us-ascii?Q?I7YHtWNyLaK/uG4XDXr1gm6btyVXgXgKMVKfmGwMRISwvs+LgfuSJajpFp+i?=
 =?us-ascii?Q?LbbjwJpsT/8l4xomGUYEsl+yE7NqtvICteainsIo+vcCtW/+HlPAxHNmlw5C?=
 =?us-ascii?Q?0Fvz63y7nVA5gvBUgiDQgKNcKYPgA/w35TJpMkqLXsfDERbRHeXUD4W0R0Ka?=
 =?us-ascii?Q?VTAEoS3me1Tqy6n3y2vzzvtUGjUuI8jOgKxC7WG0vdf8LEth51KUiQ/fLK7B?=
 =?us-ascii?Q?UNuERuEE5f9MPZlw/LqivFPTZ16d+tieSABfvhPu7ADfMLL/bqqGuWwi8hDr?=
 =?us-ascii?Q?eNwi07+go13ixbAxNcGg+kU1RA0XTf6DGJrHXGL9iWrGFvehY8GKlfCa3+Qm?=
 =?us-ascii?Q?EPnux9j7pGXaX2mixhVRru/YiF87UdE/eH+FifpuNPRmhfN4xhSjTrykB3sI?=
 =?us-ascii?Q?5/i3ji5sPWfB7EzP/Cnl8edFAP9oLURDezBbrYuk0uGX41SeOIB3oachKaZw?=
 =?us-ascii?Q?SUYEo/Ox4RZfp7aih43n3Fy5n12zdJzbaFCrQjP0H8mHDuIdMeSA8qXzgCHL?=
X-MS-Exchange-AntiSpam-MessageData-1: oJnz73/n9T98ag==
X-Exchange-RoutingPolicyChecked: 
	MuqB40jsu8gBb8ItpFvTa/YIxkCWhaD14Em2l4E0mMqQn5G/ypXla1sBnm75nO547Z00ZZ8hiPHgGCHILOhM9P2IV2zqL8WDs/dwBO/VvYck1wm4Yc1ZQyr5pwjOGIOhUUjdmG0Q9kOE2uNc6rIZtviRKj8pRtvL3r6fjA8s790w6lA8esyOtQOO9u0iKiUagISFM1Bbqf9Mdl/EB56aJBhRzreYo1qgLFvDGsacx+Yk3wz0WkUgYGYL1sNC4aOK8RqYB96DOv25TXlZIXxYyc3eV65yKnVFZ5TrcaufdgGno+hNU/71LOkDnQIe5XnGEJTtWoGrbMb9KzKRANQGWA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ALBVnCNHNqvDCTShkaMiMHBUNhzzAIv2CcBz2t4s5pseRvu7rNbuab5t7MnRUNCT0nLfVXTA8SNSjRHHk0V7WICorWQseZ9L+fu44xqVFbtvg89u5gQVsOD0rnhm0XmnPBWm2HS2h6VOLUGsOASoMuOjRA741TWb4lYrps74fEUZKPH0LT6/i856KBegFHbBXvn2vU+YxgBV+2dbIeWZKeO9eO3qbhMQTCDJQ3ATTOB55v2BPy0+F8yQOu7cy8U9oowSPb7dtDmHc+y28Hg0LrD6GK0mW4SonJHOt4l07+UYUAED/s6OXLH7jc9xVweH9412W1ZRtF4DLfxrKWrFvzQwVQ28kQUTSMdkw2ngAZtsJ9YAAvuCJIAHE9Vpz+P07RBG6qhg51eQMdq3LjxKPk0AdNXfAbNB1+3DAcxvFu5f3nnrGaJfxdVQHAB09fwr9tfiyXUmzS6U7FQZhBsMyCWdiuEBBlTUHy4ptMyv2xBstUvjl9UGaH2icuCupn6fENu0mgcfXOoz44aJRbmlIC/EPHUUDopoRGyEdDx3fHLCxwFvEWVj3f4Ec16d3yKDPWQKENn1SC6BJOltB6bjf9tWdCwUvp23WPwqQZ6x7r8sYwEY5xQRfAJ5hrzlZ9Q5
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0c982b-6966-4b04-17bb-08ded78215a5
X-MS-Exchange-CrossTenant-AuthSource: PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 15:04:44.3056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUlv4pzJF7Gdav5SZ1o1lnjWNu7ftx0+JAXZ+8V1CnvGM8S1FaS+fbWZvq/fUbAm2eSOKbeiOcY9BiFP7Nc9Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP192MB3339
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate81-hz12.hornetsecurity.com with 4gr3GB4rjJz1PGxB
X-cloud-security-connect: mail-norwayeastazon11023087.outbound.protection.outlook.com[40.107.159.87], TLS=1, IP=40.107.159.87
X-cloud-security-Digest: e7c32c49b3a95bec52351131d62a4d5b
X-cloud-security: scantime:1.055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 15:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239986

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/2f00c7bfc408b6582d331932dfa47829c4819029

[2] https://security-tracker.debian.org/tracker/CVE-2026-56114

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../dhcpcd/dhcpcd_10.0.6.bb                   |  1 +
 .../dhcpcd/files/CVE-2026-56114.patch         | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
index 65dcbe52ec..bc87b91503 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.6.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            file://CVE-2026-56113.patch \
+           file://CVE-2026-56114.patch \
            "
 
 SRCREV = "1c8ae59836fa87b4c63c598087f0460ec20ed862"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
new file mode 100644
index 0000000000..748dc1ee8c
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
@@ -0,0 +1,34 @@
+From fd86ded940524f60174582faa96f583c168589ef Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Tue, 23 Jun 2026 02:06:55 +0100
+Subject: [PATCH] DHCPv6: Prefix exclude option can be 17 octets (#671)
+
+Well that's a simple off by one error
+
+Reported-by: CuB3y0nd <root@cubeyond.net>
+
+(cherry picked from commit 2f00c7bfc408b6582d331932dfa47829c4819029)
+
+CVE: CVE-2026-56114
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/2f00c7bfc408b6582d331932dfa47829c4819029]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/dhcp6.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dhcp6.c b/src/dhcp6.c
+index 5154bf41..1eac9f23 100644
+--- a/src/dhcp6.c
++++ b/src/dhcp6.c
+@@ -1006,7 +1006,7 @@ dhcp6_makemessage(struct interface *ifp)
+ 
+ 				/* RFC6603 Section 4.2 */
+ 				if (ap->prefix_exclude_len) {
+-					uint8_t exb[16], *ep, u8;
++					uint8_t exb[17], *ep, u8;
+ 					const uint8_t *pp;
+ 
+ 					n = (size_t)((ap->prefix_exclude_len -
+-- 
+2.43.0
+
-- 
2.43.0


