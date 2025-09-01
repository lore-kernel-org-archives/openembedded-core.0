Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBB1CA0FF0
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 17:09:31 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.51])
 by mx.groups.io with SMTP id smtpd.web11.57373.1756746562935486187
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 10:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TvuxXYnx;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TvuxXYnx;
 spf=pass (domain: arm.com, ip: 52.101.66.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fPGwqKJipcjyAlo3KMD9DJ3gdAt1/YvSUMqJzFZx94qmvWyHWrtIg+KGuK0zifVeZgVtGRnvElitj69nxj+9Nqv/na6ZLmencsgOpGKq7iL5OPGJ51ldA/qub7mhSguAKOf5UHVLwJZq6ecLYcuUrjXVYf8Ovv67bG36QnzeLSmVkrmQSpHYC56fOPkwnpjjem4ATUCLRUXC1v28dj3afs63G2hklI4aLpEX/vdFIKvrj9SgLPt8U1V4JR4K39qqe4qK5o02idDL7i/1Mji0RrH+ZX95oMn5ujsNk2KBI+8bIKfqRhc6GDmYtSytdtK3RSl4qCKe/YEWQvfR9lefug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LINKOhFxmB/kztEAwPcHlRLwtp7TkGc+CRGdenS+kk8=;
 b=h/VvzU6rD4mWFhO6A+sLsojQrdBPYVElknHrwci+y6HyN9AyCs42OyX8gbWGNuHBkp29wbZpAovCOSgDBmQB2ZtXlol83KfDK43sPhiHiTEbnnQR2sbvwNsz9YJ+J9Mt9MG/aACYI/3KGQ5L2YFlBtfcry3Tf6wrraHjb2tgCQDQs47wyu+LifZGnr5PUGSERMPRsafdJ7QO28p7ptPbpKELBJc4sD5XhX6HJzYf5u/K5TjHflHG2kKvQItYwZnhV/TjMrY9lr76ACwP/lVntCM9v3sWNwxTPNI+gociVXwxURov2oROXgovCJyDrNCO6hX8skITrrGvIhExn+x9RQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LINKOhFxmB/kztEAwPcHlRLwtp7TkGc+CRGdenS+kk8=;
 b=TvuxXYnxI88Aqs/5Ik5UvHEfq+oekE82en6k8eRkT5wPhq33p800SgXFFXgtMpcWSsUMmnc/fHpFwe4/zBtbNFArlZA4KApPAuG84XGYaDNIN4KhsC2qSCPubIPJf3sLjuUZ1/YGaR2sX2UHjxP94C4833Vw0MOpVqcGbcMnywk=
Received: from AS4P191CA0029.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::12)
 by DB3PR08MB9111.eurprd08.prod.outlook.com (2603:10a6:10:43e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 17:09:17 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::e) by AS4P191CA0029.outlook.office365.com
 (2603:10a6:20b:5d9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 17:09:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.11
 via Frontend Transport; Mon, 1 Sep 2025 17:09:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/PoWSWSXds6hnGTODp2wM8xOVm89YFV4jAgrNrUbToswJ+Qxpuh1tAKMlhPQWPQkJHrKDtYWPuYmblkNvhg/6CQt57LkLvvRr1QVmI9ixrxcMZGQc1y3fWZ7gKaVfz/kX469SR3xmffLSzlaermUI0qCfQztrfz6vnf07S9dMoQ1msQW6S1vEbcITICNMFiHexRIZrbNcshmWnfuH7hJv2pYZGG3vKNjWl5RnwMD/3dTKCGAzHr0ShzgRc466rABQiMlnF5zI00F18i+WZJvkclv2fq28LV6gNkn8K+1tMQ0I4byVm1b5jB+azTgAhCfjE+N0kLgj5svMzJ6yS5ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LINKOhFxmB/kztEAwPcHlRLwtp7TkGc+CRGdenS+kk8=;
 b=lQPtIGQ73jfep1hXwFwZKYpMEDV17qZNzsoKHGh9gr2zCY6vxjwCAyXmngG92I4UatM8uiWmiRvQm6lTXhfM5vRp6em6LmhDT373Rl/3hfXX1UXguhd/bEoLq2vmPA4rqxkvsKWJIbXWWxfDeN/fD3oNen3gg09B0FcN+LDVDo4aMn+v/Sg/2NYf4XiHQCRwaAKebV0T7/VUyR+9Pt6VvQTGoaN5zvOsIbVpi2T4pozNkTdOkq9/8JSK6pkcWx8Ae23FPb9Ilq2bMNIcGQLIFtbaZ1XNqgZ0h3dXC7FZQA1aijbFIlj7T9s6QRL1Cbel9wA860L6NU9hK3Txixqtjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LINKOhFxmB/kztEAwPcHlRLwtp7TkGc+CRGdenS+kk8=;
 b=TvuxXYnxI88Aqs/5Ik5UvHEfq+oekE82en6k8eRkT5wPhq33p800SgXFFXgtMpcWSsUMmnc/fHpFwe4/zBtbNFArlZA4KApPAuG84XGYaDNIN4KhsC2qSCPubIPJf3sLjuUZ1/YGaR2sX2UHjxP94C4833Vw0MOpVqcGbcMnywk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS1PR08MB7563.eurprd08.prod.outlook.com (2603:10a6:20b:472::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 17:08:43 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 17:08:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] clang: Upgrade to 21.1.0
Thread-Topic: [OE-core] [PATCH 2/2] clang: Upgrade to 21.1.0
Thread-Index: AQHcFwwpTOeJJxZ2s0uObgEhz0DB6LR+l/4A
Date: Mon, 1 Sep 2025 17:08:42 +0000
Message-ID: <31D0CA94-1A52-47C6-8361-F14F9357357B@arm.com>
References: <20250827043603.2833795-1-raj.khem@gmail.com>
 <20250827043603.2833795-2-raj.khem@gmail.com>
In-Reply-To: <20250827043603.2833795-2-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS1PR08MB7563:EE_|AMS0EPF000001A4:EE_|DB3PR08MB9111:EE_
X-MS-Office365-Filtering-Correlation-Id: 6164b8cf-6605-445e-c1ea-08dde97a48b1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?zaHXhHSmW3vQ8NSEfsEfmoeUDr1DPMPeetNOTc1I9u3VSdrarsSxVCno41HI?=
 =?us-ascii?Q?M9tk7sEgCp97zs9UO+jF+Yhm+T5+eBDQq4t/UDEWw/oeqxDXVYic9e60Zhw3?=
 =?us-ascii?Q?x8udvOgYVeaUsBJR84mQCbXcddUtFpyVFvPUumXXjW5D3lGmEeUrbJ8+b3mA?=
 =?us-ascii?Q?GR8TsOL0pUkXXSZkKqVmOkX+JzWV4pNSavx1EmjXHr02T6djKjDpj5s+LvqH?=
 =?us-ascii?Q?njWjexWsFtFoMCD470CFzjwPsOntetYPLTt34iihD5GJNeJ1dFqgVr/q1StX?=
 =?us-ascii?Q?RjFWW8Lwqefx50uBh2r3plxrplEegbWAUDONbP+pvKMmkCIgiVr+FooFLp6h?=
 =?us-ascii?Q?x6MDMOnOynhNssw0RyfDudujAMNnAOVKAGEH+xChml+KIFnw1+XdWi/puNc8?=
 =?us-ascii?Q?8L/6cSJC7Te/wgrOGq/ZXgpYGwxijSCDRzJAsUqv5ebIp4gbKDmWiwxdzs62?=
 =?us-ascii?Q?HKj4DUVsW9jKUHRxCrXY3jKqYqKgkIHlwOrjn3bH+0YcxD8QyhTEZTstVpdc?=
 =?us-ascii?Q?na9R/me+DCdZAqiAW6FfGit0YP4Ezv0sv0ms7brHMbBw7kEj905tgWhJyVMx?=
 =?us-ascii?Q?KkH32iysIRRX0HnJztLBxnHT1kNVK1txFKdDIUXgfw2y7PWW4nHaZQTwQy4y?=
 =?us-ascii?Q?ro0EhMvASw+17/FKqjGPHqLASnGGcDFo9PWDvQnHeWLX6qAWHmw3lWZQYieg?=
 =?us-ascii?Q?6Si3xiws5Hsrbxvhjoy09VVpwx/2k9sFci0CnFtlt+NDJ0jfKc07CmxyjhhW?=
 =?us-ascii?Q?vico7Kx5v6y+3DT2dyNct985SUy4s6n0fWWZGM4K0Klw37q9dpmC16L7s3yy?=
 =?us-ascii?Q?PzkO/r/k0PVbnVKy2zqt9X1SWScu8ahHDGuM6E2mef9ceZQqoehGcbaOnxpP?=
 =?us-ascii?Q?6ITCs0OPvx5mH/MhqnDNhQj8fm5wlJlJHngP6dV1Xu+lKbO9Y7I7LnjkiqZ0?=
 =?us-ascii?Q?qUi8XvDsOpt9GnCLbGb+jmGt/AnlRkP7e5PLKh1LdnzzqvPv0vMHYA8QSW0T?=
 =?us-ascii?Q?k31ofDI+MZCIAmjoowZoCM9hoc4ZUdQdPYKrLirun9Ss73E3pCqQSOs2NRGe?=
 =?us-ascii?Q?ozo/J1ZENB0jkgim1xRyx072CU4ErzQHyg+mRbKIazsw2o2xlOwvbhMnZwqk?=
 =?us-ascii?Q?kf8FOAFWIeYodz9mNubQibFFQdVc5CqrFKXqfDOinwBxgD09yhAp3JkJz3/R?=
 =?us-ascii?Q?Rzv2Gvm1AxeeFK378ZZW1IBRBjro32lrKwqB6mobIHCquwO8HKWiw6hHw0Ag?=
 =?us-ascii?Q?kSwJ6OJNKg3BRvGSktjuv84lcJWyijTb79KNnBx7NF9Bcq/UjBDBFsdIin84?=
 =?us-ascii?Q?iIibNaG1Xwhi3fXd+yXUFUls39p0FdZtiMv0oLZBa9KmEXiczPurg4zlg8nw?=
 =?us-ascii?Q?W8vYP+V0fLwd3xXGUBZ6H6k0RqmDFZuwSUpVaa3I6wCLtHxY0FpbMphCTi8t?=
 =?us-ascii?Q?QBo31VYFpNHScz1Qy55a/Yeym7MVKqWkRwMBYfls0Mo+8kvGLXKVJQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A8F5552898205A4D94FA902CCD3F2F46@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7563
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4ce32891-5bc6-4ab8-1c37-08dde97a344e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|36860700013|14060799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3F0ZsJnu2zoxD5P6py1u5/i73I2JQF7uvDal/KnWgK6uYPyAffPLmELhQECq?=
 =?us-ascii?Q?qrZgJX/kywGzD1BcmiwlJEhRkFvwPWN6IZ8rLC7kAtWwopUmW2tyjQQng9r+?=
 =?us-ascii?Q?K2vy37glUlwqH/BwzjFiyYyZAsWxoWArMLjL/gvgUg1wXKcwdUcgmAJPflB8?=
 =?us-ascii?Q?mU5j9+VuJ/07qXeFO/XbDRzjwzGRuJ8X7GJ7rDfITtNZ5EsVefZP7trQ87sf?=
 =?us-ascii?Q?aiilJ1/Wj353q2PZo4cD95TC+cjkAyf2o0AeYaTojJn3f1bDPfLzadb4GjUn?=
 =?us-ascii?Q?2VNVZGoiTDriGnSkMa/35qBDs6/GcAwfQfog03jSqVK3Ys8lit8ceugAe73K?=
 =?us-ascii?Q?AW74ctQoS3JhwWKE1GaDalMS2C9XT5ORv+MNI8GQrUvLH0EsP0UlawNXscwI?=
 =?us-ascii?Q?VPlmpFBQFGt0sv1T58z+yFTMHObc60G4Muhrz8dFMPQwVD2vTVfY5B41OO0y?=
 =?us-ascii?Q?2bMTVmZ3ZR7VAxDduxWx9LHXxyYK3Qbc5+q4HS+16mgcADbL1k3FmTvAS05z?=
 =?us-ascii?Q?kwlNM6kc6P5f9oy4itgWoLTf1pFt5N1M0KUGIfcVNr7XH7Nz5IoBd7TZjW+b?=
 =?us-ascii?Q?oYiArW4rewBRSnJpsqHW6PPbWxVgsrFmWsQShU6gfKC+D8pCg4J/1SKlAJXr?=
 =?us-ascii?Q?70FmNc3izpUzQZ8zYwQJ+XbV3BoUQCH2+XgORevrqX2KMY3ysnv2BYoyzC6k?=
 =?us-ascii?Q?VHGTn0mRrFACvptgV0Px46c6CicczPXC3g6UCV3eBFXOEWHMmd5cdiH5SOFt?=
 =?us-ascii?Q?Myk2fwaWONb8aBkmPbq/KPsF8R+anY/l/Mpv/pZHPag+xiDYawVbHUAC9Bs8?=
 =?us-ascii?Q?LMkCGqhRmxFAqtUzmqbhoNPodCtWN5cJOrp4xKxsZDjg3cqq8RAbeM5e2SUk?=
 =?us-ascii?Q?U37KYZPe2HAavqcG12L28IqeNEbXzKmhS72ffh4iVCRbSsh0YpOY5IfZxJVA?=
 =?us-ascii?Q?qPvT4vO8WIOPX+da/wbszEoDICsKhoY4//+w84nyeYivSs6J4mZItT6Bjv+M?=
 =?us-ascii?Q?51HXMesM0scvF+ZZCusqERTrj3qXOsPtOUfD52Hr10yDJ1ZEhbBLX0xP3MFH?=
 =?us-ascii?Q?X+WcazEpITFjkgqljhx01fbjBsANRoTFP2bmFUcToBy0TLk3Qp11dq9kSPAi?=
 =?us-ascii?Q?12qnFPUASSb96wCZjtPAN5cOXMsFRXlMTSbwjh/kI0MvUmwtDqHAL5Gx3+qg?=
 =?us-ascii?Q?h4FxkF1TS9gWOpL4+1TSMfXaosMkWNQ6QzOh7X3ix1hDcOG65njM8lNlmlNQ?=
 =?us-ascii?Q?gfxkRsoct1fhZB66JmXwvPGZBXhMvs8n4NlaaoHXXiFD3sKnK/EYejtXwkgt?=
 =?us-ascii?Q?tKmTH3m1TLnP4oNvIW7Z6o+Krxvcq/80zd4+sdLgF3DhZQ8VeyEdAPsY6Zja?=
 =?us-ascii?Q?3W4h1gnxKk+VLbSxa8YghbPPHbMH6d/Pt17hSD+BSZSiZX/raDASWYpeLrvM?=
 =?us-ascii?Q?rYDfTID2JfeigoY0PkVjVpZd28WQiJI2UGpTvdYhg16JBXwyjD420fJ9D720?=
 =?us-ascii?Q?kWgD0MgrUi8k/DnYDf1CTuGurhRwH7moGZXM?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(36860700013)(14060799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 17:09:17.0982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6164b8cf-6605-445e-c1ea-08dde97a48b1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 17:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222672

On 27 Aug 2025, at 05:36, Khem Raj via lists.openembedded.org <raj.khem=3Dg=
mail.com@lists.openembedded.org> wrote:
> +++ b/meta/recipes-devtools/clang/clang/0036-clang-Use-sysroot-relative-p=
aths-for-getArchSpecific.patch
> @@ -0,0 +1,41 @@
> +From 6febb74f2d2a320daccc759157e77edcb45ac8ae Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 7 Jul 2025 19:22:07 -0700
> +Subject: [PATCH] clang: Use sysroot relative paths for getArchSpecificLi=
bPaths
> + and getRuntimePath
> +
> +Upstream-Status: Inappropriate [OE-Specific]

Can you explain why?

> +++ b/meta/recipes-devtools/clang/clang/0038-Revert-libc-Remap-headers-in=
-the-debug-info-when-bui.patch
> @@ -0,0 +1,30 @@
> +From 4782e94c9b3e150f60bca1b279c300cc4f34fa24 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 27 Jul 2025 19:12:13 -0700
> +Subject: [PATCH] Revert "[libc++] Remap headers in the debug info when
> + building the library (#143004)"
> +
> +This reverts commit 4d50b405f1585ce172f87cb5f8daf3c1b4145215.
> +
> +Upstream-Status: Inappropriate [ OE-Specific ]

Again, why? Are we reverting this forever?

Ross=

