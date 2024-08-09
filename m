Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57929C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 14:59:16 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.132])
 by mx.groups.io with SMTP id smtpd.web10.85948.1723215546621394883
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Aug 2024 07:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Pdq4sTQy;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.132, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AS7lW1KFEjT5pBC6O7tYk7cnGuykLyiZtC2gRCCGsFQ9QCjjQIKGgzPgEQ+Okc64vfZAsjWdHUw3PNQFv/LBO1My/GBmg1sR5bgSmmlU++EQnuxGzv9TK1KL1GCtCJaHFKnmsDm1x7gyxKBwpELojxkLG07919FwDB8opITQoPGizqy1u5gWcL2Fx0nDztwdwXbD1uNB+n6vFYgaGSIPUrnT4qeh01SfpA0dGcUt1qYkepGYKEzZSXiCWIynnMndf2ODS5ufLutsb820Y5SwjpyamqmDSpmBukgGA7Vh11K5qFFTIChsr6bec8cDgycrEzDbkAxHH1cp12g+MMnjWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UG4U/WdMpa3LfyC9xh8a0bMhg4y5jq7dgRmgY4PxaUE=;
 b=sr0iUMJYgCVq+v4LUTIYQcmnUscpZUp8OdilPhExp+2WcSGeZFQhNt7ctoumie+7E7SeHipL6PwYdq0F5m4q9g/HJsWRqYOfCS6AIQZqz17yshTP0xpjNqjk/edSEnlq4Wj8w7gWoxraFVJ4pE50P8yP5e7UD5T98Y0q6VWZJfx13izl8vEUl9F+94it59OVg4OcVMz63Gx+BWB/vMy7cbLtb9YI53hXWjUMdclN/AGihkUgfgGPO3wjTZrlZ+9FJ4LMVgvs9i0G6rPGOnhOqx8K5KrxGAfTnzJXKAqtM4m8Q2i7SwvIw9z2AgFdvN2XaVbchcMk9ohulNUXXcV5dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UG4U/WdMpa3LfyC9xh8a0bMhg4y5jq7dgRmgY4PxaUE=;
 b=Pdq4sTQyorOQ+w5vBi76s0tkH/vStDpqsqIdeALUrTxOGC+AEGe/UTShD8eXt1nv/vL6Lxpwq1JR90otMA6Q0LE1gcg0w6g84oxgQh7xtZ49shYakTERTS0H2Y99kCcxMDh1kDIFMjBMy3zBlQJdoGr7soDhN0i91Yu2plzDcM6O0cWOTkkF4erTUdnnmPuMpmVbX4l+NOWXhtto2touKdbKIKOtPGbdZAMHWNxhEdtKTewVbaKmyZgdOYQStY3sotuGJZ8fvwCyIrCxsthfIRfznR4VuRQf26cgi9UKwkx3tVpNUPUjYFRH+8juEalQsxGVBm4JNiAA5H/37tO5AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB8826.eurprd06.prod.outlook.com (2603:10a6:150:11d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Fri, 9 Aug
 2024 14:59:00 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 14:59:00 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 2/2] systemd: Mitigate /var/tmp type mismatch issue
Date: Fri,  9 Aug 2024 14:57:31 +0000
Message-ID: <20240809145731.53074-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240809145731.53074-1-niko.mauno@vaisala.com>
References: <20240809145731.53074-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003831.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:18) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: 83fec43e-f69f-4972-347b-08dcb883cd5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?B13T3aKtvrd2p2AfKo/kbAsjF48L7ehuvJcBeunzG6lIBpQ3cii9oJN04NdD?=
 =?us-ascii?Q?D+SoZkzKLED+1wJErhuaWu5hQ/4tYLmRYy+yHnBEmbH8Nb0njfArjuerJp30?=
 =?us-ascii?Q?Tvn65O8xa0VCdTSqu4x0w59KlHpEp36VfB9ZAiO6Flu70CevVlbJswrSpZwL?=
 =?us-ascii?Q?xkJK0SiDKGfdx6Hq7Uw0cJnbRrc+oKQVgsIaBvEC2JvE+nZXvkMwn4m+bsP8?=
 =?us-ascii?Q?dxj1u2Y2I8QXJ20yGR4OcklBo4ns3KAfJroR5caDjRBliIajZwLII099QFJ7?=
 =?us-ascii?Q?Gqiz0i5iUP0qUHmae0dY5l7VRCL91BkLFkytuKaNS9PoDVqfoX9DzdWfPiJ9?=
 =?us-ascii?Q?xrG/y+qt/Zfae41Gox8IX9K3s0O9ftoVb5AoABBzH4rsPvzUoC/mI5QTadkl?=
 =?us-ascii?Q?4pdtblytSfBQdHDxDqroqQ0YXTFG2taqx/bP2Dnz0D41TBRJfun9GrP/owVS?=
 =?us-ascii?Q?Tb3aDhP6h2phOqUJNG5fip18ZlUbZ0Iw4oIEnpuSPzdywoaB3xz97Bicykgj?=
 =?us-ascii?Q?udYg9lWqJuqFRX/d6KrhtWiOm6gGSKg3qkQQGtr5YJP94EvuYHYfFTMQGdM2?=
 =?us-ascii?Q?+SgoTGk1ozaEvmV4tc3IdpyJ4v62HdySKRUXONH3U3b3qgg0Ki79QYRXbYyP?=
 =?us-ascii?Q?Fe8YPwNH2eSZ1BVJX+mR0OxjLoQZtJq6Es2/h3JFrLgX1MXis1m/pn2p/NTA?=
 =?us-ascii?Q?ZDnWMvBzTNoLD6qQsy5xNo+aksJf72B7WrXpnFN5UkdFcYMWwAnibmwIKJa3?=
 =?us-ascii?Q?rUkrxjO+NhX8DHGTs7GJLRKLWdyXbe0TB5wJ6KtouYBuzW1M9aO7I8e/63sj?=
 =?us-ascii?Q?PDmBHgvUxh3AHu7zyeAiJCriw9SyxbjF+E1d5fdRmbqQi0Ck36wKy8aFDCO5?=
 =?us-ascii?Q?h25OzaK1LfojXTz1rUmiAenWRiSms6mhC1KuvBnmaLgLchI5aQbUrls4UXV0?=
 =?us-ascii?Q?AdvMGoQIMxYRlr8dpYaZrdLxQ4sbuAFqYQRs2kPItQRpLc38s8Ajp9ykuzqe?=
 =?us-ascii?Q?7VZPK6U0NtVaELLkKhNuYh9WOVo3RPn5zr4kyvEfON2Mgu+PAlyLXQCfsnKu?=
 =?us-ascii?Q?5OJdgWQ4cNFrTpfi3Gd/yflnxfLaq1/RSZzLmMqgVkiQ8v71BhFvQ1HsMkS4?=
 =?us-ascii?Q?88JBnsgROtTq38xY8lGXX9XQ6RytjDdHWziTxvrRvPmRG7h/Q1rByMU5+mL7?=
 =?us-ascii?Q?kkFGDo5Df2h+y0gjRDvoWgIhpzBfjH4nILUL1lDOFwyYo4xyQnl0CdK3obxT?=
 =?us-ascii?Q?2sFQH9NmBK7y39yk1PmHQjMdiiupjk2KUMTuoCq8O8Te0FC1mWyedx/pMT87?=
 =?us-ascii?Q?u+1fwKrx9YMAuBcpBGtVamGlQO62Yx+9l+CG5rMnMPbRfM0/+gra5W1ehsGS?=
 =?us-ascii?Q?V6hZ6rWo3YBqU2r3UIvgR/e7i3ACnYNUQ4wqG7vs5c0d5d2RJQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7GOYOHIKtz1CaAeBE1oEGAvtYpSHlkXChHrSTSBUfs7+XV6kWPQDMSdoUcqP?=
 =?us-ascii?Q?LbhWTVC9BJsC0ZxM7ksRwrEJbD8757XbgDTA2wPjiFh/Un9t3l8oshH6sQsi?=
 =?us-ascii?Q?Ynu7T9iOkM1KEqsjYgZc29nxYWvuYCCG+VRCohePKD//VIz72Z+w8r2YUY1K?=
 =?us-ascii?Q?PpuJeX81LlPkHrALQBR4YSOKAYgVVfxpLXi4QrTnMpFAzXwyynV3jX5pJ2Wk?=
 =?us-ascii?Q?9fnr4B2f3vh6EzIsu56NdJyDW1Zn5f/J1A59U4QD/sVMUy6zHsFwSmvBLYUz?=
 =?us-ascii?Q?M1RQlm+7hhYu7fttbjVCDsXWOcjd5yOb9NU67gRGCNhTOMcnA1ud2xcerxFm?=
 =?us-ascii?Q?mFv2VGEdPERngrU2yp2VcaOV6h7imq2IFfQgytLqN1x2dICBDXKe32fhg1z2?=
 =?us-ascii?Q?E1J7gi0k3bXG0JRTpzU3V2fK6Tpat6VdXqLLC341nkALECOPmfQzjRINTKim?=
 =?us-ascii?Q?MNafpBRxUQU1wz1XzyZOQyX0ELlITCAdAHQ6aEb1egkquZv57tn4Cf0wA6fo?=
 =?us-ascii?Q?B/mSYfDbx8zoOOdrh/veOqZUp8PzqBSEubESJX5v++GC0XYlIPOh8mT5xxlw?=
 =?us-ascii?Q?d38yKJHN2WhYSYNaBlOoE9GpQ725G+X0upabymg9Slf6AA6Xpx98wOoHzvwp?=
 =?us-ascii?Q?e8QsnVb3jj9S4aczFjE6RnkR23fBp63jARAEtAiFt2g4vLqHJlIEcCLuFFxz?=
 =?us-ascii?Q?RQAdCJKtjVDcu4XaqH9WOMghK/Nyi3Nyuc/KuakAya8E9GN19t7wG9oqa1Yg?=
 =?us-ascii?Q?CA4ha2aZZGhhYpNaZrNwNt+ULFkxcBKyNcqbT2S3giADfh/PnHM8TF9Vv1Ho?=
 =?us-ascii?Q?l4eNYeG+MKkiBmfLBPhd2lRvMBSjXUppUphLqnukvrcQ6YzWXJpV3/WTwCwu?=
 =?us-ascii?Q?uDMjHZ6PcJffACtmBg+C4logh8Q4ZSVZpvZ8CRNXSM7N+/6POGXv1tZ6Lbk0?=
 =?us-ascii?Q?aVwvLH/EhiSDOapYVvEqpat3MJRL6KW+tzbMTM3fmRkVbgWiyQzqPaMDH3HW?=
 =?us-ascii?Q?0oXxhKGTBiE9/k9NsWWlckVBHvKlf/pa4iyuhUZMasB+1x3ZPU3DT7rCYZ6x?=
 =?us-ascii?Q?fgY0q9Q3sY9smz0wG7A3XLihoY5uJDkii/sL57GJ1C8KeE9BvYJX3Zn4+0ge?=
 =?us-ascii?Q?bVJ8C6WjUeh91QzQPulsT+l2oW7/eUW5AKYYFkpGmwm6rW9JK940PxkeQkR0?=
 =?us-ascii?Q?nSTLxp7/Y4ONWTXgTDUQtwln5FE471kOb1HO2zzUrlZhMYFgx930VhakZYzx?=
 =?us-ascii?Q?CsWxuV6upN+rsr4JwODGGuthJaUazYJ3amf8dTItvSum/zn/794tL+ThvZlp?=
 =?us-ascii?Q?SOOTEWNaknCKyOXKQiButXorLTjexFHZcCfWOMNe8w3OL8Xo/8wazG4/NF3j?=
 =?us-ascii?Q?eBpOAvNld83eavjhD324KJCT8gsfEn3G/ugxpHF14DQkQEkEpoYacbL4W627?=
 =?us-ascii?Q?qUxUeUZJqxJUU0cpRYFujtebc/QSrPH3UafqkekZZ5nRXfQWSZuXm/4tsAEB?=
 =?us-ascii?Q?klGhPUvIBBkrItjqiCePsQig84Zso2E12mfh7Jah2q61zXXEd8PTxmJni39t?=
 =?us-ascii?Q?FQoq6c7PEtz2e2W1owXVjA1+DPMPLkSa2I6eKz4pakO+Fb+KU6MVcG5WpWA1?=
 =?us-ascii?Q?RQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83fec43e-f69f-4972-347b-08dcb883cd5a
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 14:59:00.6715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y8Wj+Uynzs4VpcjltzgvKAhhYUhbSFSzJOQEyhsfu8kqVWK41ALQ3zS33pwIVXWG09Bjfjf3DJ29/6AZS6022Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB8826
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 14:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203177

The base-files recipe provides /var/tmp -> /var/volatile/tmp symlink
which is in conflict with systemd upstream tmpfiles.d/tmp.conf which
defines it as a directory (or subvolume on btrfs).

This generates following error in journal:

  Jul 03 15:37:21 qemux86-64 systemd-tmpfiles[158]: "/var/tmp" already exis=
ts and is not a directory.

Mitigate the issue by defining /var/tmp as symlink corresponding to
the one created by base-files.

(From OE-Core rev: 1f1f6f45e3cfe24dfee8a09d01a5d32f3080e381)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd/00-create-volatile.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/me=
ta/recipes-core/systemd/systemd/00-create-volatile.conf
index c4277221a2..043b2ef1d8 100644
--- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
@@ -6,3 +6,4 @@
 d		/run/lock		1777	-	-	-
 d		/var/volatile/log		-	-	-	-
 d		/var/volatile/tmp		1777	-	-
+L		/var/tmp		-	-	-	-	/var/volatile/tmp
--=20
2.39.2


