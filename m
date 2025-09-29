Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52080CAC5B9
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 16:41:53 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.63])
 by mx.groups.io with SMTP id smtpd.web10.3153.1759164111003501291
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 09:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TK5nELEl;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TK5nELEl;
 spf=pass (domain: arm.com, ip: 40.107.130.63, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bOIgCXBV3083ipAG5bvI8TQYfXqErPetkSBhYDgR3i1mJgWe3+ncEJ/n4Sesh3TCqRwmunGAK0v+mlPXM3EYqSGzAM+N0M+sDZ9VMPNlOE9JphKqMvWLuWkpUOLLEds3SzQoLDdDyHh4nMAw6Vuco1L57fZhk2ad2zq3/f2xSnwGYpb92cADxro46UnKRNJ7Jna5sCXGbLTgZLUgt2zJM2zzE4Qjny+XSdWjXA9c/vcX3warhNx44LJ4pysGMp2J3gzSnzPzwkpHxh5c1tkBZeslfZ3Jm7ZZyVJ8Xx8c/5dJR8w+iT+8K1Pw4Jkc+lgGltQ+6RqMd4W7iH+7XlG1/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p36pnC1m9jtCZ1EoKsFx+LijWlZx8gMvHbtQpfNYKYQ=;
 b=GYAb3133ebqYbUsaJensaWj5BfAhD3McA1EqjIvD4DYgVpWKP4PvgYwTdEQwXTw9dwlH7GaNwtU5nSDMyEm46IMzh0V25Nfz45wmh9J0S5y0vZsxgprXUzp4OORdsRv95N9IQmQXsQavEEsZdRiw22YvyTcU417YnZUnostqbfXZxo4fIX9126lIZYN3rGzc4eIja7ji4DsCHnoMf4w+kxjL+ESavmHXh34+p+XQz3CXoxI+cs33iIWrGEflbk9hJ3BcGp99Hg4FM66pyNfLBCUiri7u7hKk2noMZotL+olZ5iG827CG0gKm/TyZJ8j3o/DLOSWElNk2QGuJpQl3aw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=eng.windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p36pnC1m9jtCZ1EoKsFx+LijWlZx8gMvHbtQpfNYKYQ=;
 b=TK5nELElyZAhp7NLxYIB5gqZjfIAK3Jm3CKlSkcJhpxczhSzyaEe8VaBlNwn2hXmQRzzcFWblTDctpl7jtyYVUUGmmrDfJ8wo2j53qHrgY7M76sCnlG25Ha43zgYo1hRQBCQJ6GgIfEAbNGMQC6gc0XM8iYpCx48LhvclVWlqZ0=
Received: from DUZPR01CA0132.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::22) by AS8PR08MB6582.eurprd08.prod.outlook.com
 (2603:10a6:20b:339::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 29 Sep
 2025 16:41:46 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::ae) by DUZPR01CA0132.outlook.office365.com
 (2603:10a6:10:4bc::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Mon,
 29 Sep 2025 16:42:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Mon, 29 Sep 2025 16:41:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skjd532AHfLfqggKsQcsh42snyGBQxocfzaJ81rMD7VIYX2gs7edBYNgJt15ht2pd9/LQJX0J6TpPAyEmWNp2P+baprq/dirW2xQwEGpwXmQD+mANz1CtgHB578DD5bT5KoqL0Cx+ALkyI7IgoLAURsy9K0JYSrXtJAxEWVTxwnYcyVhN1eU97Ev4Am1q6eUS9gt71zPbXaOkAlKMaJLVBOvkC5it1f19n6bdxsbtPufZf5pRfEyy6R2lo3JG8giYwRXQIEr/xTEgn08bJdHKKUJlz0wMB3GoU9LPSA1b0rDwqOgu5uBbwyYH0cTf7gzEwyHRw7gpePNfUNkeMKjDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p36pnC1m9jtCZ1EoKsFx+LijWlZx8gMvHbtQpfNYKYQ=;
 b=LZGwMPj+V+rDAIkoMFjNRmQgpoApZuiCRM5A5h76Nrt1yuhKCuTRI9MfrJv6EsrtzsvRx+5ndADs79568MT6jkliLHwoq1lQKzkfm+T0j/03SxO3ZC4Hlm6DZVCL5IhDtFHbq1OY0D/bx7xHzRnOAjf4KuMFEEqGrKCQsLtKucLP5plycC9v7ppLwUaaN5u9b6AogfLp4tbkzfdcwBoOJdQTMvqmGNe7QDV5WgDH1ta5f3rTsytNFy0FO1TDy4gGXQOQNSPbx9fAwtu1u4hBhHZ56OS81NYQMDvEpfl08CKbwdnPVAWrKYvLBXeyHBujdMkz1388gDAx7TF/tdDGmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p36pnC1m9jtCZ1EoKsFx+LijWlZx8gMvHbtQpfNYKYQ=;
 b=TK5nELElyZAhp7NLxYIB5gqZjfIAK3Jm3CKlSkcJhpxczhSzyaEe8VaBlNwn2hXmQRzzcFWblTDctpl7jtyYVUUGmmrDfJ8wo2j53qHrgY7M76sCnlG25Ha43zgYo1hRQBCQJ6GgIfEAbNGMQC6gc0XM8iYpCx48LhvclVWlqZ0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9293.eurprd08.prod.outlook.com (2603:10a6:20b:59b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 16:41:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 16:41:10 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] xcb-util-errors: fix racing on out of source
 tree build
Thread-Topic: [OE-core] [PATCH] xcb-util-errors: fix racing on out of source
 tree build
Thread-Index: AQHcLfIUzKD9rraIwUyBc1ye2+rfybSqY8gA
Date: Mon, 29 Sep 2025 16:41:10 +0000
Message-ID: <A5A09505-7119-485C-A0C6-C88DE980263C@arm.com>
References: <20250925075646.1146511-1-hongxu.jia@windriver.com>
In-Reply-To: <20250925075646.1146511-1-hongxu.jia@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9293:EE_|DB5PEPF00014B91:EE_|AS8PR08MB6582:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c1caf9a-a1fd-4862-16df-08ddff771315
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?QIz7eXAEGbvipLXP0rtQRHjTBTYmZoayU2qTER+TP34kCHpMwpA5m6GJ5MGW?=
 =?us-ascii?Q?39AkDLmv9q/lpqLeeb8TUmtQqiQYl+ysKflPks0+jZ5wnxhC3UMPSCOammjY?=
 =?us-ascii?Q?shwIiHNQGHd+NFKWc0Ew1sJVlwsREbGloQrE72iKsMXJatxSP/uLeZMzWCC0?=
 =?us-ascii?Q?LCBce1u8zDyko/IRjWWsQSTYIGlTSfyCVZHC1/9AR0iQbyNpKfUcW420VsBe?=
 =?us-ascii?Q?m/T3agzRs8r0+RGhtLs82pYepaYbxOpAGVB2QCCHgZmLgymtbofPDK3GUWIH?=
 =?us-ascii?Q?oHqz9S+vc/1WmmAmViw/R5AH7r0IzAWeUWcWjI5BkslLBWC+ao3pbHuOH36F?=
 =?us-ascii?Q?AcPg4/ufEzIT4JEqwPypXGGPQKLEvSREFpE5rv1ZioMeT97UGvuW+hGwUlvC?=
 =?us-ascii?Q?UDJ5FqNA3wWTEA551EZ9K2fEW/ED4ttZVtkBzTooI59MIgQ67hYzaRKlPvt+?=
 =?us-ascii?Q?vMFAPsGAqWzgLjkh4lsaEhQaff4YJhFEzZNQtc6C4Y/T3AB6hYZcf1ITHmGF?=
 =?us-ascii?Q?VX5P8Q11XCwaVNYzgup3B4+1uAClC/LYNm+YOgshVLl+tYmMpT0ejZ++hSYp?=
 =?us-ascii?Q?Yvoc4eZm5bV7IhVRJu1wHaKjL4Gus4NO8OSK8kvMCiRi/4OrfRqFgW60wwyl?=
 =?us-ascii?Q?9A0YRznOLyuMt+SPDH4qoJRRw+SSzH5wIlup/fFaUciw5iDXHboTRpXILfdd?=
 =?us-ascii?Q?LNaQ7Y1yRpHjjOhYCgp66XoB+La9z0f0EjE4TGFuE5hEN+0/3oUCBqw/oBKA?=
 =?us-ascii?Q?s/Q7q+GtSu3OcHob3J4r2B8CdjpsLuQz+iSGio6953DokhANA9Z7R9zj4q1P?=
 =?us-ascii?Q?dKm69Ny6uBBXcFQvGCYl89dNximkp/enGMGT31jnyjQZKoBkah1emjYJ90Rl?=
 =?us-ascii?Q?S5fBVxv8gH4AwFiCcbIurYjsuwJeRudQIKitUT+cNvP2SVTPPJYj/k91RUXa?=
 =?us-ascii?Q?L3tEt3RFQeaIP1hjfP3UUB2XPiq5HooNSAE3Lv2FOeRsyjGSS/38oqQmJEOZ?=
 =?us-ascii?Q?4sQxddFJMVrB40FeBFMYN3jQYzqPI8CH158mLErzNsMvzfhhx/il+KwPGHUR?=
 =?us-ascii?Q?OaKe24BjxWtZHa0sCxQHq7Tzud38xG5/C7HM5URnPjWMIp9ns4iTuPVYPO8q?=
 =?us-ascii?Q?9Z/CrrHnRQ5WBt7s0PiTxCuTPxUJYvOv+fgfvcDA0fUuU9gXSnQvG3Mvst4p?=
 =?us-ascii?Q?OWZ+V73fx2kZT4fgvP6Xzu21lsjsRTCaCiyWPhhk2CVeo1QxR7MT44Nqg3FY?=
 =?us-ascii?Q?8+piPC8eSq8Qi/7zqEwIWyFdfSo1FBKOaT12OtZ+8CuP/ulFsr4M+3nC12uE?=
 =?us-ascii?Q?+CPxbKZYuYLGitwM5dKGz7RpDE9pmuGB0HarVtW8pW783Lex1a8o8ppwZQnA?=
 =?us-ascii?Q?7S7Qjx85q9afE4kAmiC/Gd43AWQuhZd0udeejJfrdKnp0UGefD+Z8qt18IM4?=
 =?us-ascii?Q?JRQfRnubs4+Yn0xO2Hyj3/J/poUyPY/sVa/GLq5acwfZNoscEGYREw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <655EB98CCFEBF5478532D40E3A8BF54E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9293
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4c9f285a-3e72-4ec7-6f1f-08ddff76ff2a
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|35042699022|376014|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?R73d7toncFidsDg396GT8FdYeOKCGpQKWsrTIfSldJ1bhzxhZHOBmw9DJvdh?=
 =?us-ascii?Q?kO5+8ow7TCSjWvp5h5wCsdg9WyWSdQlGyLEMjJ9QmVaBdCgNFwAGVJa/ow9A?=
 =?us-ascii?Q?jh7ra+OqQMFSmunPGwTsx9VJcUjMIfQB39FdD0S0KYz4ytbiu9qAnPAuTW14?=
 =?us-ascii?Q?EfPhGPAGau8eWnJKEy7pBHV06YNf1hGJSBEJFsPdmcIpJD+kFLQkVnxZQFrP?=
 =?us-ascii?Q?n6qNg0ChNySIV0i2M3o/6v/CS5co/Ih6kKb1/0iirgv47MVIWYctrBTFthi0?=
 =?us-ascii?Q?htmDNZ0VEGOPTn+Tgev41stiOLJKeLzctTqDVGW17YQD5StnmWSIqTh9Ucsh?=
 =?us-ascii?Q?Y5Bb2AFaLzKNyGOLrwU+n6r1O7SbSNCtmoVe5yvLiVPLnNFCEc5eTh+az+OQ?=
 =?us-ascii?Q?wzJ4CF4WkOp4vYyHTmMkawhRKEP960fJkyVkuch1I/7pgULlwT7SErGHyZU1?=
 =?us-ascii?Q?32a2A2TZO5biLiSkYHM2mjt/s5UcJkRSVvMJudsH62rdSFiJ7/w8opm09lPL?=
 =?us-ascii?Q?TINwGVZ7b55D3EkDxUE6ZQk+Rn5iUDGRtE3CmhoYLfpuyMIjExx7prZc9qdQ?=
 =?us-ascii?Q?uZS3ldmasBlOs1uLRkMJjAOjLfTXzunT5w/9TNkm05jPPEX8LrVmiYnXap5k?=
 =?us-ascii?Q?szDxDnlxaUGcNVY2uWcn0Bqbg9nt3QCADqiRq/LJjoq0qzJNbJc3rQAoaV4H?=
 =?us-ascii?Q?jmILfL1xvfllRWdKPXVHQUV7v9SE+NFprpfBd/cgbT1WEraAGsQPZOLSp0Of?=
 =?us-ascii?Q?C09xbHskIpUDkyt6A0TAFEVUskPUjt/16C1y4b3CKqpcnEQJa0T4pzDZMnga?=
 =?us-ascii?Q?CjvyceKb+jRBIuUR/QrrrD4KtzCexy+X8HIhF+XUnLFK5y5IKlVwdjMglmqs?=
 =?us-ascii?Q?9lzN8aZwJK84y1AoZlfmXuJ9JrfUKhWJ3Rht+t0lAf1NDlB9GypN7LHMJKD5?=
 =?us-ascii?Q?rHVGeOGkrBWqaeRvE70lw+2vcEhJbxCCZ38oaIU/S+AEL8aqTfnj2oWluBXK?=
 =?us-ascii?Q?BVmOqpOPEGKeFGR4uK9ltoyBYeYInVIJikX24UIa7Uo4Sua72XBUIGCBOx/9?=
 =?us-ascii?Q?U9CQiTgidOZn8+4Xrf7krJjOisfzoBeoc6JwcQ4sDYE4XwGyISxG0CVrCkPS?=
 =?us-ascii?Q?Sxpens2w0C0kfzJ/8O+bv5EdRSElGDFrvqUpRlpV55kwbMkkOnRxc45lfKRt?=
 =?us-ascii?Q?W0OIAkdQsj+w5QNGpKHH+d/OzeLT96DlTYzPlakVfSIH1MLngREqt6/H8PP/?=
 =?us-ascii?Q?OYbVnjz7u7cTF8R30cwa3uwBrdBt48OmDDN1cZtMocIKMydVP67U+hWRW6n1?=
 =?us-ascii?Q?7hNoDNu7vr2zMz9PczHdnvMmn2Ug6iE7acqs7p6JjJvd1CUEJJVw3vDjwYMB?=
 =?us-ascii?Q?9XGENkeK8j1wlGMV5bpXGU9uKLjgHES5QyZhH/vm4t6IGym2VuS2wzMQwEvu?=
 =?us-ascii?Q?s81d85bg8rNx4diyKPCf+P0ITNVkNysJTzqYQdlsnbU7NLyi0V/QenvWrGYT?=
 =?us-ascii?Q?966aF3iJPTaiN6GmOKxpb+8fdu65xuCaRUOk?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(35042699022)(376014)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 16:41:44.2294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1caf9a-a1fd-4862-16df-08ddff771315
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6582
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 16:41:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224155

On 25 Sep 2025, at 08:56, hongxu via lists.openembedded.org <hongxu.jia=3De=
ng.windriver.com@lists.openembedded.org> wrote:
> +Upstream-Status: Submitted [xorg-devel@lists.x.org]

Patches should be submitted to GitLab I believe:

https://gitlab.freedesktop.org/xorg/lib/libxcb-errors

> +inherit python3native

There is no need for this, we have a perfectly good python running bitbake.

Ross


