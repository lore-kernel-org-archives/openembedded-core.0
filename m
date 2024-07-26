Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CC1C3DA7F
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 12:09:58 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.68])
 by mx.groups.io with SMTP id smtpd.web11.59971.1721995790485898880
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 05:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=d79BzeQI;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=d79BzeQI;
 spf=pass (domain: arm.com, ip: 40.107.247.68, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aiI7IX9NWDra4ioTA8BTesAdsXjNI8LsRtup0OCI6McEqzMM66cq3bbevTXmSBI0toeIhrtCUBbzMFif66ksPM0HuyOhsPE6MHaM4/7XCqZa06dU0OR69nitSok0AsT4J5iwEQI0279rWoygYEAgc558J+9LbUvLE+Rrr3s4zZljSbCzPV3+jZMxiMk+h+LeBfWSrd5+XfDuiriTbz2t3ZUK/tB6wifQrp/qGgT+DPT/YVjw6cOQTa7QP8/n0a1Rvl+w8UZOoCM90kagKyLZs3jZqqwDLlbLVt0mfx3WOeLzoCLeZBKeDFWLEjF+w85nrU9dkM1Ky2YjHWRnC2at1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xm/sdX6LZAxsH3vLleXadcfNyF+Q3Dy/mZHcXWDYsKg=;
 b=abP5jVF6a+vLT1e+7/NnuQz0d1stOl7spdif+AWFOvMKpx97kzANGaChL2Snh93hV+CyM98uFIbJYPz91ucSjm+J3JfDN68iQRlPodLRSivjPhFOWuSpkKnNiwDn5RkR1JOHVNyzODNRw5/V0rJlYcXgDvYaDjCes+WxxM0rwa5X7CmQsKz4t1gurpxUZNq7iDED4VJyF+fB+ERY7udQroCKeJkWHWWYM1js4KQ2k+4jYackYnO4SxG6oMVa3XST9oOTy+sbUvsKxVG7y0Rg8Kis8Cre8nu7LoaayE8fJiCDmgoYSBtDRuq+jcrIUq5cHAVLoAByB/IcNSIpj5A3xg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xm/sdX6LZAxsH3vLleXadcfNyF+Q3Dy/mZHcXWDYsKg=;
 b=d79BzeQI5blHq7DnXPD0InLHwEbpgDR7gQuZwIB+VqFipTnOj57KovOHVJ9oHFjkaUsBiSQvt5z7gMnMgUfKEOUdQWxxENEjuCtCZ5rPTSYzYVvbhnN8XxS3sqxOTep0x9xbSpUQwF0oKOOZxMeSNPlhYzlSgY2yyBhP1BESLMQ=
Received: from DU2PR04CA0301.eurprd04.prod.outlook.com (2603:10a6:10:2b5::6)
 by PAWPR08MB9590.eurprd08.prod.outlook.com (2603:10a6:102:2e8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.34; Fri, 26 Jul
 2024 12:09:46 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::6f) by DU2PR04CA0301.outlook.office365.com
 (2603:10a6:10:2b5::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Fri, 26 Jul 2024 12:09:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11
 via Frontend Transport; Fri, 26 Jul 2024 12:09:45 +0000
Received: ("Tessian outbound ca5638866b89:v365"); Fri, 26 Jul 2024 12:09:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d01364cd91e90bdc
X-CR-MTA-TID: 64aa7808
Received: from L22319bbdb98a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 024A6B21-1F93-4468-B6CC-222FDFA6E7ED.1;
	Fri, 26 Jul 2024 12:09:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L22319bbdb98a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 26 Jul 2024 12:09:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXRqL25agKMfI2v4ZDPQ7cXngfW9JpR6lDC3OW402i1M/AaPaMvb/wZtwbul1it97Df9qIzOywySpMM6/sDGdMArw558zKVBTWqriojWObCZ8QA+XkYZZr7T97G6u+D7lJNzaTTQS5yBRr+BRxMs/FzCYPCRXtG/vGSU9Xv9XEP6KxYIsP1ShOAsr6J5rMGc/FtkTXylh0jRQWv4e57HA+ryqR1NSUx875WpHTy+KtCPWHktPJZ8KnR9tgjWXGkJD0X/Y0vVb5FTLry9zzOfwlqRwBX5BNd4zCRKogAff4cIzIDeIOuGPre2WPH+8wUf62P0rJDoXz5OD4yHwydafA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xm/sdX6LZAxsH3vLleXadcfNyF+Q3Dy/mZHcXWDYsKg=;
 b=r1Rhf70Sz1ns7TiKbaBsclJK+OPSM6BplYAkG29ju/w+FwmE5qQzKBUrp8OCw8codZoENGLmHf0KjtNe6uBPAWk52ryrwM7CFmufT2OQgF1Gf6rYwHGbfIutzWpQEB3mUyzmjnIvrxAkFqA8eLvaoe+Zsm/ribcEbkmEp/d2pSLRZGHAlDjuFJ4jvyrzuJRCrbtoI24VrDGWUEjj2XNOwx8Y7lnJF7tW6w+DnzJp1fGzpv3D7fLJeDW5YoGDZwhqHapmUK6bWZFx2a8s3xY+itdHj90rbQoe94cXaAuEXIAJt9+8x29B/398XZxn2urY7OciqZQsPqlrRB+BVhrA2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xm/sdX6LZAxsH3vLleXadcfNyF+Q3Dy/mZHcXWDYsKg=;
 b=d79BzeQI5blHq7DnXPD0InLHwEbpgDR7gQuZwIB+VqFipTnOj57KovOHVJ9oHFjkaUsBiSQvt5z7gMnMgUfKEOUdQWxxENEjuCtCZ5rPTSYzYVvbhnN8XxS3sqxOTep0x9xbSpUQwF0oKOOZxMeSNPlhYzlSgY2yyBhP1BESLMQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6226.eurprd08.prod.outlook.com (2603:10a6:20b:2d8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 12:09:36 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 12:09:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Marta Rybczynska
	<marta.rybczynska@syslinbit.com>, Samantha Jalabert
	<samantha.jalabert@syslinbit.com>
Subject: Re: [OE-core][PATCH v3 3/5] vex.bbclass: add a new class
Thread-Topic: [OE-core][PATCH v3 3/5] vex.bbclass: add a new class
Thread-Index: AQHa3d3XM35Et5GT30ehRdR2ZcIhfLII7ZSA
Date: Fri, 26 Jul 2024 12:09:35 +0000
Message-ID: <3F580A6C-E380-4B95-9224-1F1336444B31@arm.com>
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
 <20240724152530.25856-3-marta.rybczynska@syslinbit.com>
In-Reply-To: <20240724152530.25856-3-marta.rybczynska@syslinbit.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6226:EE_|DB1PEPF000509EC:EE_|PAWPR08MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cc6bae6-20d1-4ed2-c518-08dcad6bd69b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?76RJuSk9at1hQYt8ZHznDeVdgbZVcyknkvQiO246o2dznI9r6XNnAXN+b9zs?=
 =?us-ascii?Q?aZ5dOQb6R4HggXMCDLRrF38sSJIFlVYr4hmyps8sm3AhKtRwrHMYxiNUusT0?=
 =?us-ascii?Q?cSGukhHrtRm9sQARwScbmCSeQWBLh/GCkVMt96iaBmZiNHbX4CmUHnpeYFh4?=
 =?us-ascii?Q?V0xcTxuC7oVV5/k3nQ5T9skVYYjq2+rItd5VxcVfmbMj4JidYREiyzUZjg9j?=
 =?us-ascii?Q?mxZ3CM20a5xpmMjbiv4pZuNxNnvoGS/dXIotoAHAxzr5GrGTeDfEQPm0zSDE?=
 =?us-ascii?Q?X0skn6GNYIIiE9judb1UWzZFx2pjWH7F7Z9xxNa/2Qdzk3pFT0XXV2zwU+Io?=
 =?us-ascii?Q?wClw8JoGhE/W7Hx1EKoO7L+aAJf0q6GrWzXV2cJQIe9azOH7ba0VDyeqQ6Dg?=
 =?us-ascii?Q?3LSMmMZCaMRnktRprIOIlMscgbCOgLeEneb64VZYMp84OxQrfQQPpYuX28OT?=
 =?us-ascii?Q?x/JC48jZAdW5i2r9LIXpcwyWO0NOrZsTRiI2YESML6AMkExSEckWfwIZ4MYp?=
 =?us-ascii?Q?irhSJNEigQP5lfHbemUEreCIAcgwmi62Az2wB+i9sy2hIB2sKrpgaGC10UCg?=
 =?us-ascii?Q?c/r6pFIzOgdU9M/jcqoXCGexUkBTG7CwOGvh7cnVLE5chKTqLDocNO74mGq0?=
 =?us-ascii?Q?97fVLttJYlcTmdkRXzQ6wPm8Wjy/XPdIAHEowJOEPDimKelE00fbeeD5uAcc?=
 =?us-ascii?Q?EoG+TDFFmlUmIynkCIUbUp0dR8iklWxb/Bq0kb9jtNQOHwnc2/RbS+1X/zyA?=
 =?us-ascii?Q?ERlsorIgCWfz/ICCr0a/aGg11XATvXcxhGa9yjB/cHnyPGk/aLvJMVVrKWfy?=
 =?us-ascii?Q?/598MHL4obblRDlgkCpuSZBTmP3yZJ0zyfgX8rjrFz2gxDDbjGTMyQeQtFkb?=
 =?us-ascii?Q?ktCngie/W8wF4wD6j55lnfTq95c/+esDWS4RabKQMvJrAKfpvP3Up9x7bm5v?=
 =?us-ascii?Q?dxax0dAxdIlLUAs4XW+7RBGOvpuzDP0DNP57F02rdNjh+vypJyvk6JC1bkdD?=
 =?us-ascii?Q?phrOCy6eg3HyyBy3KwVw3qezZW+3woFJtQmVCdbYBT2tNkyXKJTBJgFCgwqD?=
 =?us-ascii?Q?ikRGdjFQjm+i3BeabneR5yD97bg7hSI9qI4aiRA/0KiKTN7UhQKhTKgPspaN?=
 =?us-ascii?Q?0A5cwloosXuXrAqzU0kQPtnJnBwW9Nt++bEqmc+d8pAnlLR1y461CD6f+Hht?=
 =?us-ascii?Q?zUQK6kkQl5wCB9Nm0RYi4EhtvauoMCodZ+/uUGt08i5475mvGPcKwY1+W6z5?=
 =?us-ascii?Q?vb5CuPfLgzMNG5SO6uc2hW6F/XsplD78ej7MVLaaZAlAtIylcslU3+qYbNzY?=
 =?us-ascii?Q?0x9VSF7ic4ZjIDPPiABd4LtYsy1nut1LQGuzVlyXlHMHU1VuOaf52yxdyiyF?=
 =?us-ascii?Q?vwQbvPag4OQSfpLkl16HJ73OZk62eqsPWEdruEZbJuhsvXeP2g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1575D018DBD0AD438AC16842A57D479A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6226
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d54d24ba-bcf9-42d3-82db-08dcad6bd101
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|376014|36860700013|34020700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6pOsgFPVfrwRsa7HRT52yP3ZPtirXeC5CBOxDHQQzKdQqtprR4DzRqkPyd2u?=
 =?us-ascii?Q?KD8Y2FmU3VzfM7ffcoL7lCsTtKbeO9P+qoOU1Y2OZAwNSuBKHhM3LncYWLs3?=
 =?us-ascii?Q?Z+bT1ov92i+ZZb0ynItRUpTYsV+6cHbSuzbLnK3sp3JPORPfERQLp/eljsvv?=
 =?us-ascii?Q?FWwehVY/Mi80J2/z/Te4gxPxrv1qrS2+6q2wFJzAHrlBSPQgfOfYX8q0TY1z?=
 =?us-ascii?Q?pO4RcybFn/RnJE3b3XW92RySN48qPQW6GneVSAD1Jf9ctbln7D0ZG8vsMMe1?=
 =?us-ascii?Q?x/4+uFC0Q4rQKwrSLC7rw78VoblQa8nMxnSML3nFwdISJ9SqVhrxEKylD7E6?=
 =?us-ascii?Q?EvBuVRcKflEpa5gVShCrKTGQGPssqQl/MeiZGVKSMFQmm21NuxTjaL4q46Eb?=
 =?us-ascii?Q?0hamBWyeRI8HdDYk+c/oz+Kp2wLQ13gmOQ/swo0W97G2B6aGetNQWtSya/B5?=
 =?us-ascii?Q?7Ud+eTp3HSnSytv42N42SMs+3Kqc38cpn6vuphl5xw8nWUoKS2k5lkuUI0wH?=
 =?us-ascii?Q?LEDD6E9W0OE/zX+IRuiLXDfXDzsqdNtD/uqx0bV2aDatVTX1wXQJ4JNZAhTV?=
 =?us-ascii?Q?yNbEMrYlz1DnORlNqz/E6wRwGxctVG9N95iwwkU37fcBF2Kok1A0hpQGl3/2?=
 =?us-ascii?Q?ZiPne3i3wP+FPsqswkafaFkO9QLdPVLHlisnPusaBC/c4WOLHpNUNtGQKZj0?=
 =?us-ascii?Q?2dD9UVHrSHPDAH7ILhaPD/xu8K/JB1uU3eVBEk3WREPe3g+iHLRb7DPR4oE4?=
 =?us-ascii?Q?Q6+qt7z4kvluCldSIdNrKAT79kKuclgf+v+BQQqbbB6xys3gyi+vnkiUw4FQ?=
 =?us-ascii?Q?9kOwDiFoudXYtnrivQu2nadg+5u+m2n9H4w/PhjV+0YlgGqNRNW0Hlkj4L5i?=
 =?us-ascii?Q?brv17VO057DAlSwA8BNBUH+UACzH0QqyVVCs9gNjMQaJ12yi+DrG1jNHu7rN?=
 =?us-ascii?Q?Tr29IS1jyN6t0rsTnTk2czz9YJg21RDlyJkxRMHFpvCDKUddK2IXxBqzRGcf?=
 =?us-ascii?Q?Yn1/lb8xEShkT6udklOHrsyjiSP95nXmGEGrSPf2RhpJ59RC/bNHBemwE1//?=
 =?us-ascii?Q?7A8viWItVqcedCoFuG+udHmbhVVCDzA1TITISUBhlTOB8jgC3SyvPSjs7HVP?=
 =?us-ascii?Q?gmCgYKYb5jM17lCEmnrTpFnLU+a55QNkgaHlHdYd0TYtMgXze0pRhgk1RJ81?=
 =?us-ascii?Q?Il3TI0yRc6ozDQI/SpBo3Tz5gLr98+yblfZckQbctlReAguSqF0e+3XppyNl?=
 =?us-ascii?Q?ydfbHEHqovHmxq4kwJBl8c0IsfLJruAi7ASXk/m0nnHq+XeNd112Oekd2hoT?=
 =?us-ascii?Q?si9iu6aWY2v0ULzpJtIj0S3MI/ckv4qMScRsi1ulVkUmuuJo5/AAcMbQQf/u?=
 =?us-ascii?Q?JehhLvNAcaX25ue/kreUUflJVDwyh5VS30Q8WWfPnkpcMcGNczVwb87J+H81?=
 =?us-ascii?Q?RvlUkqQP6FI9qE+BdMCVDmncHgTNqEFJ?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(376014)(36860700013)(34020700016)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 12:09:45.3250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc6bae6-20d1-4ed2-c518-08dcad6bd69b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9590
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 12:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202530

On 24 Jul 2024, at 16:25, Marta Rybczynska via lists.openembedded.org <rybc=
zynska=3Dgmail.com@lists.openembedded.org> wrote:
> +# CVE_CHECK_IGNORE is deprecated and CVE_STATUS has to be used instead.
> +# Keep CVE_CHECK_IGNORE until other layers migrate to new variables
> +CVE_CHECK_IGNORE ?=3D ""

In the new classes, I think we should just drop the deprecated variables en=
tirely.

Ross=

