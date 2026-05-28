Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED75CD4F54
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 12:01:16 +0000 (UTC)
Received: from mx-relay21-hz1-if1.hornetsecurity.com (mx-relay21-hz1-if1.hornetsecurity.com [94.100.128.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9195.1779969668769329867
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 05:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=PrxuFKvP;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.31, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate21-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=52.101.72.137, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=am0pr02cu008.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=WPadKQZzF/mT0PFLtgHyGm4I+9/VTthXydrLX6VGVnc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779969666;
 b=pdBbKlisBWr+tQ43lUXXKil04VU5Ne99wjC+oHeI0cXGYPE0nxgagFdHDkIVHN2rUvAW8vgp
 AUtPKs7v9JAALaCWzIjhE4uiiaPDBDTaLXSLs45bpQiLYK2QQbciMO0VlbfPQBPhB00BvIhL+Ih
 X+sgLJ3jhL/AAVBsnNzTLwhIFgTsz3JQUI1Ao8tg3v5IIiZ2ouZGJl8GyK8NE0Le03tUrEdwBix
 0TNYdz89QHLO5ra3iAglOP3xizoLYm/6mNqkspWxWVU8T4kl0LcfPbnLohRw0rk2J5kLNH9ql0L
 5C2WOdRQz7Ns3OdQGRb+MC29xyB8y25wdjwoMjgbN4WJQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779969666;
 b=VYxVOWXLB3k33I7pTfIjcJQ2tqWxwvMGLsDuZL8UmSVW5C/RfzYGcuizxE3d1tN2UZSMjoAh
 gtcyovEjYzeP2uK6W7QtBd2y0GhItikS+etd5obhK2HYlXqW0ahMqYW7n2BmXfdMa03IDApiD3n
 8DYvjNYNhLD8nfGaurhT+AsvDvhibJpV8bBH7jDgatxDbpe7TlV7bido7qmDjMp0cx9znyMElNS
 IiCZNfchzITZgx2TpKnLrBgeqrR4btaE8JD2mc8xehHjd+kdewyhrLAaw12U/ZC7gwrzLffsW0U
 XXOZBMk3b83g1OeKrUFUjNeXEVxMhbX9ZaSaArqE1buIQ==
Received: from mail-westeuropeazon11023137.outbound.protection.outlook.com ([52.101.72.137]) by mx-gate21-hz1;
 Thu, 28 May 2026 14:01:06 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlHlqElU+U8Pwr2HEbts71zjmug49giw1zPLGBpe7mWaEIm/v9MBtOWHV31poKkY3x/bdZyGs8uSKRuVZj5UnxJBivvvj7bzjOt90qwlUr6We/WmWMZ0DLrj87uaRnnyBDm4kQVWfv5Iwben6NJvdfOUhbMu3bz3p6zyKvxqEr1xvggwCdLWN+scgv2VgppmNkC+hEdObyPLfPyMyr7bpidwanszyb+soqIPmYs2rZkWpnH30zmybFSksSJ8dNWjZncu5/2oivesj9cfvPXFW5hKXbsZD9pjHBT2N1WKN3OpY0r6RGOKxmmUEVwMnNcV1CiWjHsRmKedunPKguwZgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPadKQZzF/mT0PFLtgHyGm4I+9/VTthXydrLX6VGVnc=;
 b=dKJWY40ahrWu8wLDJd/+SfhT/0omP7zSFCPa3QRITlHwrY+ITG9rQtWHRwoWf7JlzQ7I+0f6G6wiNImihntqGTatnqoMCcl+gPcpXmOVfU7KE0Y0KiAANfQIBNRy8a6pZ1ybXzTIDDBa492twS2Yp8Tk1qnwoNEbWcoyOhOS+ltd21j4M4C7/K2J3w9SFRpDsAY1BqPK6z8aPH/uS/c8NkkYkRnUvEkLpREI2Fd2iHPHUVxW497mSpnJQRzeQrihoQmeursQtEQ85ArC6r6MDRXE/pO6k+3q9xU5xoQzKHHAokEZLYVOGnHLKTKZMfu5pLbXvTerTATKsvpSLgZlpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPadKQZzF/mT0PFLtgHyGm4I+9/VTthXydrLX6VGVnc=;
 b=PrxuFKvP+R+81501sTnzucxFOfNJZUbWfxNhPmua0DlYUv1uQXJZaOTBGQkXYcqe+GL2/AhLY4BoGcTJxqK7Cd6JocKiqBt3yqtK9B3aWxmsBMqiI6rlLAfJNl4Fxo36Wi4HjoR9/AfgUzN1BrB8Dr75JmxDH2gzG/8AMFESmrH9DX6ls6JdpcRnWlbEKZD233G9inF++E2QoeNnJeCMuiUnmY+DJGUoD53ul6WPSwamFw1SGSLThW77OsMQtAk9VHDvH+9hq6oquVRQKYgKou5bRyJ9klaAG2sJ5GoWYIRwQalVoCIz+nZ5UT/QjX7DzGFd80Sy9n+h+WizRGM9aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AS8P192MB1399.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3c2::17)
 by GVXP192MB1664.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:6e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 12:00:54 +0000
Received: from AS8P192MB1399.EURP192.PROD.OUTLOOK.COM
 ([fe80::92cb:30a7:4e3e:18fe]) by AS8P192MB1399.EURP192.PROD.OUTLOOK.COM
 ([fe80::92cb:30a7:4e3e:18fe%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 12:00:54 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [scarthgap][PATCH] perl: patch CVE-2026-8376
Date: Thu, 28 May 2026 14:00:45 +0200
Message-ID: <20260528120045.1801198-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0085.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:349::11) To AS8P192MB1399.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3c2::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P192MB1399:EE_|GVXP192MB1664:EE_
X-MS-Office365-Filtering-Correlation-Id: 95684f8f-c54b-42c6-87b8-08debcb0c52b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|12006099003|18002099003|38350700014|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	69p4U6FblOi9woZ0e26N56knixvTHWmHuBeXY8Ng4aZKJHNpb0TjSdw2HPRKRMKoNwV/vk5jasBt/fhYmMf5ueMrgiAWaQaAAGj1PuIUAe6es4U3col3fuT7MjvJVJa5pHlRRJU6YN4XYEdZBsPYTtpSGigpAmjIc+F1OvPvCrkdUY2gTqCT/3M8yYtIw7ocRwQDxNCZCbXvdOM/c06YrOpgdJLndN6E5IzjRrnth/KMimBycNXo49TxGUaooqS09vWos9sn+dzr9etpB6WWuNp4ZciP8mBVoJf9R0csIOo/s5IZjQk+Zkz7a9vp2GMOvahP1+fTXXAoVO5eVDbR2Va8mEfB0UBnc4yyhZGDezegOz79K9ExZ/WZ45xaMBrjIIICpokaWd7F2fs0ey3OCAZrObQbIarsDlBjzsJFZPC0jFmVYFZPYYjjhGwd1fyVp6xKMaTAP6nD9NuwIz8FmoiALuzBa6IcX/hvRtKzuCXIxJP+U82AyFayOFSsr62WrFTNaqKnFo/VY2nonvcKLnD15+liLjo/7mOgSmUqUCeMrg9uK1A2Mvp7TnvXjgPDcOkHENJd/2zXU67h1Q40aEYQUdcRTRMipEwpncQ36dgAlS5XjWxKcAhKKoyi/xPGRjKluTb0bO8CzdzEE299aKjk7x8nipXMrJrBLPto/LXrLvg95HgI4Su0sdqRTNfsGXYyCtePvV19t3n2x4APKuorA3muphaA/NjVN5tuGFyDSJS3aaX+/jW1wm28Ka1z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P192MB1399.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(12006099003)(18002099003)(38350700014)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TLHnopM4j4SBXVrBo01ZsMFwQI3gd3K7yPfGk+qgE8t4Owpz4FE8yHlUWkae?=
 =?us-ascii?Q?tn1aaogqGhygbVJdEgrNwSoo7IkCkCvBqIxZkGjq8+oHPStTEI/XvKcY/XGO?=
 =?us-ascii?Q?HpMCwpf0yyWpb3+akonADgpA3l8Vt1PhHBkHVRVZqHJDAOGRaeIk23QCib7t?=
 =?us-ascii?Q?hfvyYaVv+6Pq5NWrCZlC96xxUYw4d0URT3tE77eugMlHBHtR9syfg5mjyOxV?=
 =?us-ascii?Q?DJNwZgvMuSwqgpU0Hoxy9X4qvprXutimVT7M8RIyIGXydV0/J2H+gxD40i7x?=
 =?us-ascii?Q?HtEj/4daij90xKpIAVIRls7rw06jXMtphk9yAIOvMIef+lPoTdZuO60g2RT/?=
 =?us-ascii?Q?cU80M0U9DpFyM5WsBBgFKUASGxy3mHLu4Sa4jBkQXmd0L1oup0od6IrmKyCP?=
 =?us-ascii?Q?RHjquMve056qN949HucsnfMP13NbH3gPMs77ENtFZy2cvGydIIa5TUIJXhjD?=
 =?us-ascii?Q?rsyOducfN6phuLiNZlD0nE6JBLEsGIuYggfcpJqVYtxcWIYXx7Fxlg7NaWZZ?=
 =?us-ascii?Q?k504YJW+TNVqC1EQ9ua+xBadyvpkl3NDvyEpa1ylT7ihg8/RzyWiOm7/Wvk0?=
 =?us-ascii?Q?b/Tl72v/IZYfPgkA/wXigXbBwP3N7Yyn7P9CZ0ly24qD6Vgz9y4KZr1JCySj?=
 =?us-ascii?Q?F8jTym9l649UuNX8ys281gBvT4gNDAqzlPyxmgSq0GlWeFmI0IH4sm9pVvBI?=
 =?us-ascii?Q?QG0s0NLQ9yUgtM1uKaTDvmqWPf0ngzbt+4ZTLmJhMakADf8BQrjQRJg0gxaa?=
 =?us-ascii?Q?W6O8decaqXjJy5dILEFMoGjnkN4m91u4OUt405OF7iGi08cbqptCyhK4XNTY?=
 =?us-ascii?Q?S8x1j8eKyg29besq6i5G0SGWXAoczz5BxDPAFRBkNrtw/5lr4Id02zCXGGDX?=
 =?us-ascii?Q?ZJK3+Bi+OYKhKPB/rszSJyfcR6kOeVrachhOQDsswXw8tBkxBGW40kOIZ7TH?=
 =?us-ascii?Q?Jyl9eWzzuPMTkFS3Z4BRfjt/GQ5ka0ZlrGMU7DbHvTscGhymLUNzSViLb9QG?=
 =?us-ascii?Q?EX8G4GqaTPDvewSRgIS5Sf1YoBcNw4cJRFhMkSdMwgu0Itgw9zLeZUleS9Xb?=
 =?us-ascii?Q?2lUcMbCi7CE0Te9y5Oxl0WAQbnDEeJznxwWMbw8ZetPoaxLJLhLsI2rKHpkn?=
 =?us-ascii?Q?XfZuRE52Mt8oPmgDtDBkpPlKJYAGgUOkE7nQobeH1e1tr0QXsYIjBpHv4/Ra?=
 =?us-ascii?Q?1JaK1W9LDGTXzZBCEpbleeh9dSECyX05S1URcfMKoWlz9IjA1nlDPlX9lvbs?=
 =?us-ascii?Q?x4MvbGvFILaHHLFcnUGE7SDC3VHLz/7kstXqhL1h6ulKMkkNdevYl0X8fQhL?=
 =?us-ascii?Q?28Gfh+b9kafV/YdrXGEC3ip2cyOhrWm+ZVNy3WZehSY3zSOboYYv8PWTphpg?=
 =?us-ascii?Q?SQOjsUcICDCjykHfudGRpFUHU380DUC8DSIGC6rZaG88rrCMCom+I7XSm47C?=
 =?us-ascii?Q?8O0FtVhd78K9QtBJqZ2PHsGoXMxQdMGxdYj7DMS4/DCP9pEf0secTYw/YLo3?=
 =?us-ascii?Q?qCRXGtFj0wDFNw7LW/aRY2+9hhyfJ6dzX+ojqKIr0bVwL6v5XTqBa17PeQtn?=
 =?us-ascii?Q?qeDwcyg3drpUiLJe3Ud/V2RJWDGE04BrGc9UJ4qbkBHdGP6hJTqNor7rBnRk?=
 =?us-ascii?Q?8KeNntEmqyaxdTIk2sRxiC2upFEBVi7Os2IjMQiBneOeV71k1uYr+79FuGC0?=
 =?us-ascii?Q?YvYZNEKzz5Ys3vXtYgc6S8Bggzq2NVJRZ0+FwfDRVwa45J6Ae3CR2UxG+C7F?=
 =?us-ascii?Q?cuhwkmyvDA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	OiWShWcA6guY3oo0N/1JU9tSxzstmpuopvnUdWemdUx8LpnZKrHTaA4DaTBj6BpJ5ZpKF67nd795Oh7xU3OSE8oLvBZB3umDlJEiUuEthWDcOUzdDnD+8IIL6NzcI/Uq2+KzhKcywkD/qKvINvQNOp4G1Qexr2Jx5R8u039opfVGdh/8c5oaBX1C7ORRqUfTvvBG+HQSNzRcqiywho21w0sL+UqKZYPAAx2CZ8ZKgHd6bpQJUhbDDM4WzTtkCS0ASAqU4fnYCgHsKEo+vA170Et0S1sE2FPId9SwmFRVx8AJHNPPKogDRxG4fxVr5TLCLznTJIPxlVvFnOtAr4mu/A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Nzn2PODkNA2S6uXD2upKCPUningPPHJJ2hN8lDwhWLuh9xvaN4z2TvEeNQrhAGurpE+BRO5yUxfsfkuISGfuR8sQwVxa7LsdcPsAxarUGYZntSh5s8M0Q06ypYHiWMxR2fntbJtAIoVi77UdUVd67r/6kG5180mNlNt/MiqgBbppDAqkixwHkt/ghTPS5/hcultWCxxv2tUlxouH0KIhkcGXdfvhbSRjVYiTovue70knFil9pG5eYsFHuLg7N/0dl9NhYj1V2tI1KAWBBfRii+5zzFhMTTbMucfi+UNuIBvWHKa4uj7knwExZEegHYTcneowvtf1dTQ4kBe/YLdzKu9kz+xtd7GWiuVSNmneu5hS2hstg+JGfPU6G8CAIPQ7/dBYJ+3iv68AhrfyZMGk7Dx3Ns8sTp5T5PpJfCeuIqhkEbbVA8l+gtfgbdKWsvwDrgLZNjHzTvWZ4nlsxnBs8Zy0X83RBtogM3HTVjIGXL9LAM9Fz11u4rJZA04mkgBKSkzpiih+Nhw2sWhiSTYbpsjYTqUKKYu+wRQo+R4Mg1qmGNJvj4dj79mX5NzLRAt7POGynMOK10khy6+d5CHVoe4SwK3rxt8QmUZ2mXHmf6MQkFahAZTEUcXjQNKS1fzM
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95684f8f-c54b-42c6-87b8-08debcb0c52b
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB1399.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 12:00:54.3970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IaVQWkQZVbvGXffopGCztz59gpwyhaEuZ919IhzjrWVBtjwOCBVgJtFrbTYFUE79VjVr0DTiEOZzW+shHD4BMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP192MB1664
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate21-hz1 with 4gR4nk1KlKz41rR5
X-cloud-security-connect: mail-westeuropeazon11023137.outbound.protection.outlook.com[52.101.72.137], TLS=1, IP=52.101.72.137
X-cloud-security-Digest: 8d507f42ed515f408ad2f2702a60b866
X-cloud-security: scantime:6.340
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 12:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237700

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patches from [1]

[1] https://github.com/Perl/perl5/pull/24433

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../perl/files/CVE-2026-8376-01.patch         | 62 +++++++++++++++++++
 .../perl/files/CVE-2026-8376-02.patch         | 49 +++++++++++++++
 meta/recipes-devtools/perl/perl_5.38.4.bb     |  2 +
 3 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch b/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
new file mode 100644
index 0000000000..56ab85d2be
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
@@ -0,0 +1,62 @@
+From b0810dddd6b789ead00c346ead873370710f103e Mon Sep 17 00:00:00 2001
+From: Tony Cook <tony@develop-help.com>
+Date: Tue, 12 May 2026 14:47:31 +1000
+Subject: [PATCH 1/2] perl/perl-security#147: test cases
+
+The suggested case from the ticket and an alternative.
+
+(cherry picked from commit e842efdafe7c51a687a4907e4887988fe6a025ef)
+
+CVE: CVE-2026-8376
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/e842efdafe7c51a687a4907e4887988fe6a025ef]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ t/re/pat_psycho.t | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
+index 336039521d..73a7992372 100644
+--- a/t/re/pat_psycho.t
++++ b/t/re/pat_psycho.t
+@@ -10,7 +10,7 @@
+ use strict;
+ use warnings;
+ use 5.010;
+-
++use Config;
+ 
+ sub run_tests;
+ 
+@@ -31,7 +31,7 @@ BEGIN {
+ 
+ skip_all('$PERL_SKIP_PSYCHO_TEST set') if $ENV{PERL_SKIP_PSYCHO_TEST};
+ 
+-plan tests => 15;  # Update this when adding/deleting tests.
++plan tests => 17;  # Update this when adding/deleting tests.
+ 
+ run_tests() unless caller;
+ 
+@@ -211,6 +211,20 @@ EOF
+ 
+ 
+     }
++
++  SKIP:
++    { # sec #147
++        $Config{ptrsize} == 4
++          or skip "these only fail on x32 and use too much memory on x64", 2;
++        local $::TODO = "This crashes";
++        # original case
++        fresh_perl_like('/\x{10000}{1073741824}/',
++                        qr/Regexp out of space/, {}, "ssize_t overflow");
++
++        # synthesized but similar case
++        fresh_perl_like('/(?:\x{10001}\x{10000}){536870912}/',
++                        qr/Regexp out of space/, {}, "ssize_t overflow again");
++    }
+ } # End of sub run_tests
+ 
+ 1;
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch b/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
new file mode 100644
index 0000000000..08ab11d87b
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
@@ -0,0 +1,49 @@
+From 3cc827ca6bdb7b7cfbebe30286db57b7edae0e65 Mon Sep 17 00:00:00 2001
+From: Tony Cook <tony@develop-help.com>
+Date: Tue, 12 May 2026 14:51:00 +1000
+Subject: [PATCH 2/2] perl/perl-security#147: test against the actual character
+ lengths
+
+(cherry picked from commit 5e7f119eb2bb1181be908701f22bf7068e722f1c)
+
+CVE: CVE-2026-8376
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/5e7f119eb2bb1181be908701f22bf7068e722f1c]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ regcomp_study.c   | 7 +++++++
+ t/re/pat_psycho.t | 1 -
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/regcomp_study.c b/regcomp_study.c
+index db7ab3a409..9248e1de2b 100644
+--- a/regcomp_study.c
++++ b/regcomp_study.c
+@@ -2862,6 +2862,13 @@ Perl_study_chunk(pTHX_
+                                                (U8 *) SvEND(data->last_found))
+                                 - (U8*)s;
+                         l -= old;
++
++                        if (l > 0 &&
++                            (mincount >= SSize_t_MAX / (SSize_t)l
++                             || old > SSize_t_MAX - mincount * (SSize_t)l)) {
++                            FAIL("Regexp out of space");
++                        }
++
+                         /* Get the added string: */
+                         last_str = newSVpvn_utf8(s  + old, l, UTF);
+                         last_chrs = UTF ? utf8_length((U8*)(s + old),
+diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
+index 73a7992372..9fd764fd5e 100644
+--- a/t/re/pat_psycho.t
++++ b/t/re/pat_psycho.t
+@@ -216,7 +216,6 @@ EOF
+     { # sec #147
+         $Config{ptrsize} == 4
+           or skip "these only fail on x32 and use too much memory on x64", 2;
+-        local $::TODO = "This crashes";
+         # original case
+         fresh_perl_like('/\x{10000}{1073741824}/',
+                         qr/Regexp out of space/, {}, "ssize_t overflow");
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/perl/perl_5.38.4.bb b/meta/recipes-devtools/perl/perl_5.38.4.bb
index e59022e2bd..eb08715444 100644
--- a/meta/recipes-devtools/perl/perl_5.38.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
@@ -18,6 +18,8 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
            file://0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t.patch \
+           file://CVE-2026-8376-01.patch \
+           file://CVE-2026-8376-02.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.43.0


