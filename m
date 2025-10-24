Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B69CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 14:47:41 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.64])
 by mx.groups.io with SMTP id smtpd.web10.13087.1761317255240529841
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Oct 2025 07:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VpO5McLV;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VpO5McLV;
 spf=pass (domain: arm.com, ip: 40.107.130.64, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VjeaaLr7si28lYbM7vbOD9s2bDACJbaOah/uFDawm8Du7JrtucXV9BQ8DEYQG2Qs/uW3Gl2AEtHmaWTIfmByrHxryALUKMs8cqy9GP2kqgmTtsdL4zPl4GmhGogbWYfoFYKpEc8u21pckrBhY6wIYtXpDaAM0AJoI7ulmSf7OpX0pLkGwBV+2NKOSQMrh1NL8T/xeT6qKRxhP2oRA5jfYjYlehP2lSGnS1xtnRrPSx7ilihabVFiChK53FcD+sJmsbAJpnj0R1Pqg3aDfRMnQBGBV5qf/5Sd4xByQDX8CF6Hdpay1y/VvFFY8E70uaa7nxnPxAaVxqKL7I/nx4naVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPQXfXLHUfNKuqpf10e5qwpG6WsCUQm6LXhQWFx7E98=;
 b=AWBcgzEuZNWzFWHNtTt8WdSe7gBmT/yZqgk4mNMxVe6+C8v/q7KR3lZ/c6eMQt7jxAnU34M0SO/5bZJcd78Tbp5j1OVDVt/CyAI/8CpS/56nWrfFQb6teV7/GrPbFi776/Y5Em/o1I6RzVJeF3jKeSZj3ETocN5JeqRBneJ/iSQWNxzcyuWmvwhgyDqk9RwelOxnZ0XYTjAZAdOcUuAKNx4ZosCX9yojA8XASwNGFsNyZZSZ+u05VYNPWU3UdzhbQMm4MKgtpTcyZuN2gR8zvvkG0DjBHZuUn3Sd/BuSnJxMYThkuIiYR3ygYUc56KxO2K7/gOFTSKP9UK8unTO7gA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lilafast.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPQXfXLHUfNKuqpf10e5qwpG6WsCUQm6LXhQWFx7E98=;
 b=VpO5McLV77roqjj7Ao23GQE9YotMLkofbVIQmSuubgE5sXgE9HF1lh0dfxXvcpWo9BL1iVAhRmgWd8k/k30/BqMohn999WgNJiDXL7yutrtbI2YspLoBfBGfAcK+EWMccCBRAgzpCic+eekBvGbiUJHqsm/MeDPynUWCbjnS+iE=
Received: from DUZP191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::19)
 by PAWPR08MB8958.eurprd08.prod.outlook.com (2603:10a6:102:33e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 14:47:29 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::d) by DUZP191CA0030.outlook.office365.com
 (2603:10a6:10:4f8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 14:47:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Fri, 24 Oct 2025 14:47:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8jFDFXc/5z/nsv6Ymta8tprKrNThNPTc2mcc5w+IDgAHkEwkAWCTPV4iS1dnGgLh4D1HV/NIUluGXwBnyN+ApLb3N3MWx+9Rx4cRyp6awUlbXa9t4yA4klMZrI1OF3tRC+k51GdVbQZ52dVoTbGAfJAq1nhOYARebcQN9K+84BoJdegU7AZJs9M16Dx/sygeEAGQ0NShnDB6mhrfN0v8DDhd3dnOBjoSZqLz4Pd9qbFWo382JcAdjzkoj0AkEqigSPkZak3dfDv1O4Be4o+EvI1v7E+sb1h9tzF10hpDkaw/YFlnDMlnpGO5ea+3BQiR8+qw+UP2wfO/rV8+Jybhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPQXfXLHUfNKuqpf10e5qwpG6WsCUQm6LXhQWFx7E98=;
 b=WyuJFFg/K3WHICD6TUx8uX3xYiYqy3Zkj8nZ97LyZVRn/d86UbcU+9nnJZBiNXvf6HDYSYs1LQPPpPmPI3aGkQRyfc2JgXFgUcOctcR0HIa2at9tSFve4g7NhGX4YygfgnmwUwfJPvQca1kqFFmFBPer8GdOdqMJTemv6NIrPevykCPvd/qwnRrroDCAVyhQ6KhU6fo9uVJCxdH3BI7rsLEUgfvEpBnCF+NUEsd7kOXUKF+Olg6voIdBfeY2MV1Cgv/9l9+tWr+bhrCyZ2Bzc4ZqLxbbWqnQ1ALh1ObB858npNZMUIPMg12M8ZL7Y9jyZrBdTrT3HwMtnwheHcNXeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPQXfXLHUfNKuqpf10e5qwpG6WsCUQm6LXhQWFx7E98=;
 b=VpO5McLV77roqjj7Ao23GQE9YotMLkofbVIQmSuubgE5sXgE9HF1lh0dfxXvcpWo9BL1iVAhRmgWd8k/k30/BqMohn999WgNJiDXL7yutrtbI2YspLoBfBGfAcK+EWMccCBRAgzpCic+eekBvGbiUJHqsm/MeDPynUWCbjnS+iE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB10150.eurprd08.prod.outlook.com (2603:10a6:20b:62a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 14:46:57 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 14:46:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "sgreber@lilafast.org" <sgreber@lilafast.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] wic: add option to specify the diskid
Thread-Topic: [OE-core] [PATCH] wic: add option to specify the diskid
Thread-Index: AQHcQm/IJYO6FXAxSk63X73+TPxF+7TRZSoA
Date: Fri, 24 Oct 2025 14:46:56 +0000
Message-ID: <D03E8D4F-A30D-4EC3-A8BC-585B0CE0EFFC@arm.com>
References: <20251021094738.4037-1-sgreber@lilafast.org>
In-Reply-To: <20251021094738.4037-1-sgreber@lilafast.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB10150:EE_|DU6PEPF0000B61B:EE_|PAWPR08MB8958:EE_
X-MS-Office365-Filtering-Correlation-Id: 506d6b2f-3291-4dcb-81f7-08de130c4191
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?sc/Is2Bh8L+a749Z9JrRTtWm5e7uAxdU18A+R+mHboFyv2bEpInlsfma5PsP?=
 =?us-ascii?Q?C9haiPpCHi8g5emlfkVtagH+pTfz+arwY5CBc/TLruYIc1zhwH1mQS4PRp99?=
 =?us-ascii?Q?QWipCd42ZRReJ4PUuavAxaXAqOuNj9XWD1BVhL9RUEMcOZ0O5R5jm1pVEF7R?=
 =?us-ascii?Q?yxai/c8OZdCzaW2faLl7AC2My+9cU1RFylP2/v9uDPg/JYkpHoaHrf21oEI7?=
 =?us-ascii?Q?m2NJDJASFxkFEGHNlGVoxFB5R7hi7MFO1ywsUAtCJGjzGb0MfTvKKica1Hty?=
 =?us-ascii?Q?jo9ZHjr5SJdSSOtMGmPteUcXmPpFlgC6ge5CcNhBt/OUcHULjjz94B1alyZv?=
 =?us-ascii?Q?snqYrwW1MDXnnFC/zf54Z5AJEBXJEmhsLbRCW3r332a9Oq0sv+swdgjO6DtO?=
 =?us-ascii?Q?oBxLe/6axkqgayWOGZq/aIAhOeOJ3FsOmOJO/vn5Up4yExk77aeZ7p/2Goex?=
 =?us-ascii?Q?33uDf6ff9EpsCPbAb3IiGOOGxmfgTKVDC/iG0any6lUWawFxUUqsQtOvNx36?=
 =?us-ascii?Q?gzGrn+XQrnpcCo/h+e1IttbRlp2hLOr/aKPeeA2aNpT803h7qb78ZDNJGC4J?=
 =?us-ascii?Q?+/zrb5BQ+58CdwkuP5Q8OeQXN8PzAH/hQxRH4QS4yQiEpZIRZi/5x6Tnaiav?=
 =?us-ascii?Q?OEAKTAj0XX7hB45ZRWH5WaiXPOhscpySbdGjkHdS9V5sRZvNlmS36B5le6Di?=
 =?us-ascii?Q?ofxx5bM7SPL7Ly9mSwd6Dx+KodkFSjBgfqJyznkmMBRzqq7haqxEQ2avluAM?=
 =?us-ascii?Q?FhmfE4K1OmdHuq+CS1ia4L0+ER234dXzWrQ8SL87cAnAfsne3ziZ/lZH2UPB?=
 =?us-ascii?Q?DZz838w0VVk5QItlpnNi4cOIAkGirrrW0XRxycri//n5Q0HUgyFh+WENVX+9?=
 =?us-ascii?Q?6QKQV8iUm0wuMzg/qnkPuttnyPEyUbam6nV7qwonYzAPtZRvCNbbwWVGu4WS?=
 =?us-ascii?Q?IPwqp50cTNiuqS697oOYRIOfYZ+r9MiAmMTpFgjEGxoJSR1VAeKpn4xRJhe0?=
 =?us-ascii?Q?cqgbiMcK2jCVFpgLq+TJOCyuDLlHkO8RSp+2Dw1dFzbgl4PEntBbsw0MsJ6a?=
 =?us-ascii?Q?l0pFtvngvkTTpCMoftoPTDPmKJdGWoptpDbIf1yAeFaB+/msUQTl+rrdgIJR?=
 =?us-ascii?Q?axoY2FheY2oZiS/+7RBP8WWaJuPCJgBYI6A3/YP88rsEjiYor5SA+YdYgUdZ?=
 =?us-ascii?Q?N/+qRYbTMUp90RMnLCmnCHIspkV4VAdO//9D+k7Thn2zoCI3BGfXQHpt3zCx?=
 =?us-ascii?Q?dAn/t1JXjSXqKlkofFLTUpcb3Faix8VYQx9QkpN9S3Qkt1dW5bu3lZWBrvmH?=
 =?us-ascii?Q?C/O9zz2O77nrkFT6VtHCKZXlqMVUoHd6t0QyWRgcRedSqs5sgWN/j0nhiEGg?=
 =?us-ascii?Q?3aCvOB6BwowelAlFXpMflEVynPH3Hj5qHa0mTj0RJqiyGo/qWSziNCCWqjHn?=
 =?us-ascii?Q?ZoCoD+rohvQacQfG984Ud5DiUYHcoivVBQbGFkeakEQ7xiRI/wuXhakzz1jz?=
 =?us-ascii?Q?jt7KUeLAdeYoi8zzKDlPLT7QqTetB4zMMcmi?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3F78EC7F5E2FCD4B85D64E0772E02C60@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10150
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1b8b40bc-36d4-4ac0-8f98-08de130c2e29
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cD9YSTwW4o5RRRYIpRYRyG22AGHaW9eTd9/WSwGSgSc9SVGlmZyEu1kgE/eK?=
 =?us-ascii?Q?VWLxxebKq+fCkuMKdyXwbSTuheAlpUW+VsVa5nCN4fx3lnXtTn8YgGZDNPbv?=
 =?us-ascii?Q?9m0aaAL4Noy9sqK46Eu+hAyLjTz88bU/Ls9hlURXZmpijWVRcC2JGSh9GmCj?=
 =?us-ascii?Q?qmmWpmInCqUknSeBZX1omkQV6QH36Od1wDb9TfySWKQ4Np4VUq98VPNx305+?=
 =?us-ascii?Q?VSY/bk3ByXwd9LJytMNewJQV01dX0xVMqO7RbX8jBv6F05eVumkcNHquus56?=
 =?us-ascii?Q?dyei75rU8ExmvKols4HnaG0L4dI+7/1dwZClVJ/0Xbz3xOHZ5M2E9jDg5IG8?=
 =?us-ascii?Q?5K+d1Bkav26ay8+wNJda2zrgTDMjOWxhuNc1pbOy324mWXq1X4/9qtvOxxJ4?=
 =?us-ascii?Q?Kh6znDGRuFZuhsA8oc69E2AnEbq5AG+Js0vhdGlCY3TCHq1PJQLJ9K7IVbNw?=
 =?us-ascii?Q?MfKNuqIwZns+cMKsfnIvm080yvOXNrXiBkG5ysZbmNa+banqgACBYoc2pOTV?=
 =?us-ascii?Q?l6PMtxzW6MS84Oj8aQVpIdJ4nTEW53ssYaeGH0b8Y0DL/jv+xIgJMKjuXTQ+?=
 =?us-ascii?Q?rcMMxst8MkDawiQNTiTGqAhjrwHrmGlr5LnmBXnnbYQN33DPZkL0IzZkh5Ub?=
 =?us-ascii?Q?1135bwM/coCFREdgqV2mAzVT94CyflMcsr/0DBhWyN/C1jQzHHPWdCGx5RJT?=
 =?us-ascii?Q?iNXfyfcxYlQlNQnKWS2X6EPT6eS8kZpbCrmOHwPq7ahync54yCqZpV3Zm6gt?=
 =?us-ascii?Q?vFT20/XUyz9MgwbKv7v8Ya9fIKtx/uYSrwApgW9LM4a4GuMRQCRBJT+0qpZH?=
 =?us-ascii?Q?KHfAMYzv5ENR7KxIwwLn/tyHO48swUvHzIFjtFqp+t8Z1ZAAVw7rwYSqlQ2k?=
 =?us-ascii?Q?CPCMHS2jJ8brLbofsB1VMQVquCS3CEvB29HHigh9BvfNtWjilXzcwbdD+P+7?=
 =?us-ascii?Q?jrLvzwBqgtz6YolZ2kR3jCPQHtI/G3VhEYVXOWIBuAYYWKqhqd9YnelSG/il?=
 =?us-ascii?Q?IHPCWc2NKadoC/5mXp+f3oKpOuuWo9ibv1hexXJdzWMUi6O22JYjPo0NvVqi?=
 =?us-ascii?Q?4FyrBPV8F7CR8IEB/JVRtHxjFcYkwGTlj9uXyylCG55bnsCQAgmuqEaL2cDd?=
 =?us-ascii?Q?0Hsct2o65ZrDWNS7nSAoY1a0MEaWAz97eW3DPc1XArxhYq4GFHvBQNyJOrW1?=
 =?us-ascii?Q?seG2SKhGsZGQaLhHRCD2T6We0gpKpf8nVJHLJT8CVqKKQOs3jn53JZ8FuYdX?=
 =?us-ascii?Q?lxih/bfq0JHiJKQRolqyhY2R51sayPkP0+yjKD2lq7GgJLI+f+kbEzj2hRJE?=
 =?us-ascii?Q?FfoHsFJkjXuXfUHxtjrxhrJh3KJqCRA5WhB30RDS9U0w4D2Ffw5JjoYrgBaX?=
 =?us-ascii?Q?pONwdy18VqgbsEm4/lG5YSngrTudXU8Zx1bKROcGKNLWnD1BzGI4N3gaa43b?=
 =?us-ascii?Q?J5/5cJNWgqJ31ybLf9jo0Wz+TJUaszlNwraaAIcq07VLqBSQUZ7Ttr0vJA6H?=
 =?us-ascii?Q?sRzj9TFnCqffWdt9Yt9bqK2Qgr93vH+z4BRXwjqWnH/dZfUFyAoASZFnkFJ0?=
 =?us-ascii?Q?ep2RVNFnvFphCDQaECU=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 14:47:29.3316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 506d6b2f-3291-4dcb-81f7-08de130c4191
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8958
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 14:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225299

On 21 Oct 2025, at 10:47, Steffen Greber via lists.openembedded.org <sgrebe=
r=3Dlilafast.org@lists.openembedded.org> wrote:
>=20
> This adds a feature to specify the disk ID when creating a disk with
> the wic tool. This is useful when using the DOS partition scheme and
> booting with root=3DPARTUUID=3D<partuuid>. In DOS partitions, the partiti=
on
> ID is <diskid>-<partition-number>, so it makes sense to let the user
> define the disk ID.
>=20
> You can specify it in the kickstart file using the --diskid argument
> to the bootloader command. The value can be given in decimal or
> hexadecimal format (e.g. 3735928559 or 0xdeadbeef). If omitted, the
> previous behaviour does not change.

Would you be able to write a small test case for this, in meta/lib/oeqa/sel=
ftests/cases/wic.py?

Thanks,
Ross=

