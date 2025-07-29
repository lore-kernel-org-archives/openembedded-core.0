Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3F1C83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 10:24:21 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.64])
 by mx.groups.io with SMTP id smtpd.web10.3773.1753784657767558280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 03:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kygr/BzN;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kygr/BzN;
 spf=pass (domain: arm.com, ip: 52.101.83.64, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Wq+v87TAp9AXKDsRfeh4LI3t0LF9TbzXfk7+9xl3eQCmldpHHU14SCkl1Xjv6CaHMEjvHPzGST3PSOfkA2KjtxxPRokOYajiWOL98dRqc+Jdm/RhSXrSqRTl1II+1WXDc/T3eSUXXz8gyiNkrTxSyzGNiFTEbs9BL/nZoiENEiK69jl157jdS+MbgYJZ4BNeVRJFtI6iJSGAmn6pK5YT7Uui8TDAVAbJifbB4lpPsGQGA8nnjxnLdPRs8Z6j4I9Ojb50a+yMmClEufjvZIf96UpNWTPADId0KgyJOp3Js5NnPpOHQWK8Oh1YndnX8rA7TAfjZKNlj1CKfX1LBXqIFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kNbXOUcFwsW4TaqNsdsngqg8QjnTGFLJDGSmWsfZfk=;
 b=ZWmZDHo+4DqgWyu3IsycGcpqvJHbDywi8CA+B0nKtDQWW0bSRcxutlnce6b9I+SQVg/OBlTDYFIWom2QCbd9Gtu1LyiL906NMFEH+GKwKYhMVotwRZ7RRChNQt8Dm43ByFQbiuQvM0Y8OKpvfZJjRnb18RwF37sxITD8YR6AoKaX7C+QQvJN8plEtExJCqgYas/7hvLkOgepdl/ccRWFMaG+67RrnVQy9Fiw1X1UWsHosy8LF2USo7FCNruzmvPEzhQA7h90WHdXKdgcjRFHjoNejwvJ58vP9z7rhbvjPu0dqMjY9/Vxn/lB4cRZGQUPgXJYVCZgwCksmm4OCyJDoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kNbXOUcFwsW4TaqNsdsngqg8QjnTGFLJDGSmWsfZfk=;
 b=kygr/BzN07Hnu2Pd62jFbKBY4KtBB57zR0IKadZtv7DtU735lAluA/18G6UkFVEGA51TL9A3H1rY9bf4s2EkinIa+Pfyc27WQh8iIGOB2KSVF5NpX8rl6Vl/+0G/tdpygI8j7M29fdz02Petv5PiIiBWbqTQk6/bec/23tpePLY=
Received: from PAZP264CA0031.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:122::18)
 by DU0PR08MB9655.eurprd08.prod.outlook.com (2603:10a6:10:447::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 10:24:10 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:102:122:cafe::af) by PAZP264CA0031.outlook.office365.com
 (2603:10a6:102:122::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.26 via Frontend Transport; Tue,
 29 Jul 2025 10:24:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.10
 via Frontend Transport; Tue, 29 Jul 2025 10:24:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+Oje/Co83VWlwYTC72MqpxcTyGZwh63B7JmdbtVI6H87o39DLDXhJuuno7i8OJ44gdO/ug68YOa6Y7iABYuPmFbpMI+bJGfNX8dxDdOWlIIGUFNow0V981qAVgdz9IQ8D231bNyv99R3P3xaxbKg/N6GPBumOQA/4OV/QI58aXQQn1UOFofMYM7oto1dbc/xPYeMGV+oqgjFyc2MH8C1kGGZiBJqH0NSTFi9w0kbV3d+bpo3eDfwsFXR39iAEWyYCF1MRmTghi+w6IOlYE+Uh3JP7tx8vUEtmrYuKBttJZktigJpDuA4vi8zKwWLVg19zPjJjr+I6Oyfoma2Ch6Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kNbXOUcFwsW4TaqNsdsngqg8QjnTGFLJDGSmWsfZfk=;
 b=nXm1uLrSOIpb41ewQsJn7Y8irJRLw4BJrCeG3T4/I+q1ECC7MgLGI+cMzQ73h8Hk0U/IKxF4kM1Mw7DP89nWyH/mlyuatYH2couBLmljQ8m8cgO3lSVoDRE8mAskqh6gR/pxK7oRZR4ZPJyRMNFHZdLDMk5i554YcWq6ca6Uo0nvk515po3fJp1blkV6fXI0ev0g+r8q/JDIlXqCY6GMz6A6Z/YCPNwElmSGw9FcF2n109ZDlyPP0Ww7mg86dWA2+WP0U8EXpymd1QSrxs3/s6OIopgJv85AWTV6x60/tfCAdBgcA8VjadD9TtJjzMrtQJe5Mb07Hp6LioOKdI2w4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kNbXOUcFwsW4TaqNsdsngqg8QjnTGFLJDGSmWsfZfk=;
 b=kygr/BzN07Hnu2Pd62jFbKBY4KtBB57zR0IKadZtv7DtU735lAluA/18G6UkFVEGA51TL9A3H1rY9bf4s2EkinIa+Pfyc27WQh8iIGOB2KSVF5NpX8rl6Vl/+0G/tdpygI8j7M29fdz02Petv5PiIiBWbqTQk6/bec/23tpePLY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7757.eurprd08.prod.outlook.com (2603:10a6:20b:514::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Tue, 29 Jul
 2025 10:23:37 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 10:23:37 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "liuyd.fnst@fujitsu.com" <liuyd.fnst@fujitsu.com>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 07/12] ltp: upgrade 20250130 -> 20250530
Thread-Topic: [OE-core] [PATCH 07/12] ltp: upgrade 20250130 -> 20250530
Thread-Index: AQHb+24z6hpZLI9+Gk6VgSUuwPSIGLQ/c+yAgALyzYCABogOAA==
Date: Tue, 29 Jul 2025 10:23:36 +0000
Message-ID: <63D021C8-74E4-43D6-95AC-60138D222EB0@arm.com>
References: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
 <20250723010614.926-7-liuyd.fnst@fujitsu.com>
 <DBJC0QX4FJ0A.EVEZKMCNWFYQ@bootlin.com>
 <TYCPR01MB115906739A3DE3638C6308F499B59A@TYCPR01MB11590.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TYCPR01MB115906739A3DE3638C6308F499B59A@TYCPR01MB11590.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7757:EE_|AMS0EPF000001B2:EE_|DU0PR08MB9655:EE_
X-MS-Office365-Filtering-Correlation-Id: b1882d94-313e-4c81-1971-08ddce8a0ddc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?Vg9yVGuu4N1WxlMGUFygierQT7lcJVw7si0ztBtVUqTyjE+cxqQ16nGqwuMP?=
 =?us-ascii?Q?ht8fS3zuiyYJycR+DiDtbjSMy4EpLzw1zMxE1mnqg8X+hVhhkYbiO0kghh7P?=
 =?us-ascii?Q?W67DTzdlTJFmXCQBg8kCwA9CNp6a2tIg4fKvCvTLh6YTnA2MScLId1SlinXk?=
 =?us-ascii?Q?NVPJFL/k4U0KmzUWJRxO2rZT2vwfsEHwhBxLGRRjcyAkzzJk7IkJ0jtv4T+T?=
 =?us-ascii?Q?MoC82A1f/nJxcPBgvzFbgQ2/H6bkGiWX+pt6e15rbCFZ9KgJRDEgCmwKh0L/?=
 =?us-ascii?Q?dBvvvvWWvJ2Zr94JrtVN2d/u7K4aMBZCY1zZ0E/+UNOpRskZbeKMTZ5fAVyn?=
 =?us-ascii?Q?nO42ISUO9f+Jhsma8jtVgT2+sLTzj5RzeVCz2iXk277PYOOWH5QdRrPYFxKP?=
 =?us-ascii?Q?UxvIgpZqEFQVoGcXhsdFtSC3wq/S+UkLRM/TaUpfF2kU0usxJ/p+u4rOxJzG?=
 =?us-ascii?Q?Db/hV/kg4k8isMKBzza7frKyQlrJQH9Etl/stXylyK1/jPAv830ffGaiUmoY?=
 =?us-ascii?Q?htB+tGTApjBn6SSTzs57VnYp93KTqy2YSefREf5kWQeXOxHH41WrhMEehYS2?=
 =?us-ascii?Q?4qVwxl60RtedjQqXuZl9ImCfbbO24dvdYj5FMZNB9KyZZOTr+jjNWO2K34s3?=
 =?us-ascii?Q?QiikoGbTWPvrf0luyDgvBkBg/w5HFBt0dP9BAvEubOT+sO3AYZQq1KJWI5t/?=
 =?us-ascii?Q?z9D4fzoZj11dWzY2s5GrxvoKMY3B/xdRaPsnDDDlaLzYNeHWhlETnG0/63s1?=
 =?us-ascii?Q?uRnMNWxaBl5wOP430H6bYJzWSPR5h+qJxFpXRX2ijZutda0pvZR8gII0Yx6w?=
 =?us-ascii?Q?Gse4H7/NMoUaT3L07Gz+kCJy+XMxepC3VsrDu3/XStRvQvJxx8t3g2P6utfj?=
 =?us-ascii?Q?tKaPTubzi1x5mIz/juR96RJ6pb5coee+ZyqrufYCzVqzAvMNnXOuB0Sk77jJ?=
 =?us-ascii?Q?ex9KpxxYWA2RWmyFc9S/ja2Bb8ZN4DHDPcKNgsIEZw3FT5EKwRQzhcuuy13P?=
 =?us-ascii?Q?+uJ48Po37tCleUAoqDx00NCB4vhbMPdLvuH7QOdzJuMOAOzU4UfK+y13x91Q?=
 =?us-ascii?Q?N/SJcpgH3/swHKXEs9bdMTehdm2UkiFFSdvKgSEbxza+iVLqQPDkrrCaxYh2?=
 =?us-ascii?Q?8k7qqS1ZhuW9AWKVQJ430UmHmX3WZNLaJEIwH3QwjbZBXlEIvyxOIR1e9/98?=
 =?us-ascii?Q?Pa0DtLy8/3QYU0aOH/wolW4R8oOfO+vTyjD6Nj9x71oN37cQPpeB/rxkya14?=
 =?us-ascii?Q?RVbkvxTy/DyTSF9eMREt0nGT/FwVd8wI1ldNwDiuq+gJvXFRZrt0d2Q+bR15?=
 =?us-ascii?Q?pTcUKFq1FNE++X5v6varmoPm8m3yz9//r7gXoeXUOj9hwc0/lmIkHu2lzcYK?=
 =?us-ascii?Q?xv16fuo6lmDMxxuq/rTrmMOQiAUWaP+8vxtvGnopEptaXQRC8JfYT5jHRJRx?=
 =?us-ascii?Q?OCsOo/e5TxhZ3mGCw9dnDYqgdipJaIRlkCAv7vZwLb+8OFcrsnzZOg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4C6721C449C47F4FBB69C1EB971E313D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7757
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5820cf2d-ccfd-4806-f94e-08ddce89fac8
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|35042699022|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1gUKaKZrDIvC5sxzdCXfYNkG1MWjR5f7S2D0D+CdfIXJeBh2g+YafKr5UlsO?=
 =?us-ascii?Q?sb1yAxX0/y2koAlYM1CDUVsF1rTx5W8bnJqO3fKtnGm//XAB/bNsg6GpJXdW?=
 =?us-ascii?Q?sc6N5yU8PVXLI9YvgpR99eGlnawvIfYhKzHwUGIv2cdll1D8mfyiZqflJ75t?=
 =?us-ascii?Q?BLZpBlW97C4g4u/12gsXg8Cki0qNq526m//XD+NQgNEeye/5skUrymIDxWZV?=
 =?us-ascii?Q?7LRUWeFxmcXkNE1rhFEWoI0VNydZBY7wcThVX5MQPdaYm96nm8tcopnDArKK?=
 =?us-ascii?Q?Di4MRFwN+8aQT6o8wst5eHdBW5yXkxwBY69BNzff5RfKSUUFG6WusAZ+yAAS?=
 =?us-ascii?Q?fskXME1e5Lk/mgIwEWT2nFUDV9UkYr7DaV63LfAoAa/H8uatYyK+gGbQEHfF?=
 =?us-ascii?Q?4MpSgtwsrUUyeYKL63iJOEo67HEINzgMSI8aJmYQkMjvWdzgJty6FPIv3JyO?=
 =?us-ascii?Q?DiONK6oMOPt8pnbu232m2wXISezXp2ocMfmUcKe2lT5SR7A1CuvRVht0uB06?=
 =?us-ascii?Q?feDe1cFAQuyR0U0dxUcUNACrDcAybyfp42wlMpYgbtHLcR/J2h0gVf2EbPN+?=
 =?us-ascii?Q?D51hgvNuuXAX6OEu7L/M7/Hjc9L4aoWXeGPd3Gk1iYb6W7E43SS3XJqoowZt?=
 =?us-ascii?Q?H7XbwSI+RT7LCvfdIZ8JOTQsf4FQZvmSF0qtAYHSS03MiRJ6n5WAgGL4tCBl?=
 =?us-ascii?Q?jk8o3mkzq1mIt+vkgQSoekc9BlXPcnH4dIETCed5hALDR5sOGAzADmm6uihl?=
 =?us-ascii?Q?HJnyalW4r35FxwS2FLY1ZH3vMSl/OBBCNTkJOdWwy0zwFcCoyIHEU1oYFq+h?=
 =?us-ascii?Q?Cv5cMvXXs6PJTV4bDO22bGfomw7wWNzi1VEJ2I0TJA1A6h5w+n07G61Iwnhn?=
 =?us-ascii?Q?638/ogUeL+nKZ2xINxp62OmM7sdZ230qBi8gLcAF50B02s8Jrjp1x3ElrSwl?=
 =?us-ascii?Q?xcAM2/sdBrC4Yy2wjmbdeiHkdRpiZseGdCM73x4ocN0Y5lkLycEAEWlTzgQE?=
 =?us-ascii?Q?2FKsh+xpxrMC0qvGmKSY8/rtCTYvManujFEn39RSEh2WXxOjkIA8JUIJaGTM?=
 =?us-ascii?Q?MgTjFxt7mOF0J9dk3ZK74e/WTkj+RcUoeQNMbMGXhcNOzReunc0TBkD72Wo0?=
 =?us-ascii?Q?skmWl6ggrc4x09jAIIk0bXcPzUiKYHpFGL63TI2buZxOxlP+yogIfKnI70Yq?=
 =?us-ascii?Q?cP+BQ6zqlr8LLg6rswwty/rFvYfp7WChUjBEdI42c4svkoq6wYV7sfOFbYXv?=
 =?us-ascii?Q?h6K9SL67g/1G1Sz7hn+/X83sczo6+eBdAklNse0GoiF5ifJq4ojYeD9b7T/H?=
 =?us-ascii?Q?S5MvFfdSt2xKCCWD6Oc+OnKEyEkLA9PCs+yTZUxqI25yf2ICSVVLG3itrJc9?=
 =?us-ascii?Q?BJey85p64REAk7ZqEY05RKWojmS6ywEvkIz5oc4X2yu7EJs9Bfjggyif0OI0?=
 =?us-ascii?Q?0zJL7omgn49GSrpkdO3DUNjZ06WcvTvWZSs7NUdiTgOf/lwhu1vZVP22fZ+t?=
 =?us-ascii?Q?eu3oftP7xibKqjoEWvD0hDdTqSw9iZrGEtlk?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(35042699022)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 10:24:08.8880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1882d94-313e-4c81-1971-08ddce8a0ddc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9655
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 10:24:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221057

Hi Yiding,

On 25 Jul 2025, at 07:38, Yiding Liu (Fujitsu) via lists.openembedded.org <=
liuyd.fnst=3Dfujitsu.com@lists.openembedded.org> wrote:
> I have sent a patch to fix this issue
>=20
> [OE-core] [PATCH] oeqa/runtime/ltp: Drop ipc that is moved into syscalls =
in new version

Other changes have landed in master since you sent these patches [1], can y=
ou rebase to current master and resend?

Thanks,
Ross

[1]  Specifically "ltp: Skip semctl08 when __USE_TIME64_REDIRECTS is define=
d"=

