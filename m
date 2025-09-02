Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6908CA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 17:19:19 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.61])
 by mx.groups.io with SMTP id smtpd.web11.83407.1756833556753678314
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 10:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=JvEa8fjQ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=JvEa8fjQ;
 spf=pass (domain: arm.com, ip: 52.101.84.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IHrClbH0RCFhU4zCIbrcgMdWpAGioMw9YKEJHdSfKVSRfZYH9upSk37wSAV3BorkRt+uf1+DjV27zraYGYVqNnIV1PUQji+kFtiHDaft+hta1uUCqNRBTPrPkX2XqMJPmt++82EKO1/8GjdAMUPRyXmkA6xbijwULTJYrHXzzgLmr2GzYtYG/6eJPBymoM1mHgLwtGWO8vy7m3D31q4kmGWsCIURYYQx5bKuVG/hw9o2H8doaimx0uYUdjue3PvtNQTd5K3825nVWytkZeq7AGrte0RvcfN7m8tU8D+olzsXO8vp56VMQic/X+zycIz+0+janNVyqmcYFCt/WkWb1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7/hZqvS+h9rcY9oFF7GNbeBM6MXW36Jj+MkeBfszTU=;
 b=y/dQVU3ePTHbeBTzVB16mrtYowwFgbdIGWOzct9qFjzQK+eDDvkhegN8j2v7TzqwHAFTjfSfzj/YJMrojt23FmmPEe9EYj49II00MZ+hbT1d9Zt6GobGcubxFLIekckYnxZ2aABv9poJfsBj+esL6a7jksw3uIlyRLjum3i7PJhvgrhpYHY+MWet53CIcrQSunrSfEygcDi5oYFSsq1+8GDAhiZLWOYeo/gCd2p7zLIsj74b9fIQ3Av1i9dYCG+dat6OmAtU9tcy4/I+kospMWlLcoPq8TwJ0m4s/JVzw+XFl0h28UDVPO1wUfDvZjEZsMT5D3OFxqLL0mEwNg3ZeQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7/hZqvS+h9rcY9oFF7GNbeBM6MXW36Jj+MkeBfszTU=;
 b=JvEa8fjQ9+H1guO6mDZ58ilSovxZ7+aQaqGxz9Cbe20sgC1f0lnisHj1uUAYkiCQ+bcjBHwGygN/NETOTEJKjU6laltJl21AteWthqb2+ttp7U0RtfC1KVrajWSellyMoGUksIehA7vG+gV7EYikvmxkOGkJKPHChbpYHmdYcsI=
Received: from PA7P264CA0120.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:34c::18)
 by DB4PR08MB9336.eurprd08.prod.outlook.com (2603:10a6:10:3f3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 17:19:07 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:102:34c:cafe::35) by PA7P264CA0120.outlook.office365.com
 (2603:10a6:102:34c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Tue,
 2 Sep 2025 17:19:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Tue, 2 Sep 2025 17:19:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=huEPhkmEKkwBkKqx5/ABYfWYuz5fPocuoVSaR4qpSvlkqQXV8mSGyyulyiG0VSh2ncFWfEEE7GSmJ7MmTA70CENzEblQDBi5SIiFO7TU0FButNxIB+lNQiPPRJTQ6GmdbV9Ag8JWaQE/YedS0V+6opmT8MBnOoXCKc7HW/X5HXIsbX849ToRiHnz31gkobfByPWQB8BpfTaDEeGgZIVlLPdHnteIBm3oF7a8IiHd1OAHFv93kUfBE7FWTS2z/gIT6d/AkNomV4k3YWgNojfpcOqzK50SHikXclktyM442q5iBseeTx/U5du2N7n0FcMNsBHFDjGePm5KzjtDALOiCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7/hZqvS+h9rcY9oFF7GNbeBM6MXW36Jj+MkeBfszTU=;
 b=u1KYs9S8+JvC9ce92V/PZuyK7LqyzEe1CDQb98peWEfU7UeSP9IYCioNrM3IqMwLdEw4vqLMflvoHpPS+mqH8BS+cjK874N0IsYhemE5B16KKVqQH0sFgaF4qe/wN4N2jVqZUBPJ/uVRovO84YIawLoK/FtPeP0aCzesoXlczxhZszpElts4jsbqQ0Cy19zfm7Co0PS8JSSRVR9H/aIQ6bCW3hLTdNsOdaPJXZ9Z4r7DAv9NPaPDJsf/eZLJzT6jfJYSFmYdxGkaFCk6ZB3EHZ+TsaZ04ABEl3LZBSF0jPiv54LNR6VuMxVBv9wDQTwNXq2sa4qTVKMtWa01Y3fsaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7/hZqvS+h9rcY9oFF7GNbeBM6MXW36Jj+MkeBfszTU=;
 b=JvEa8fjQ9+H1guO6mDZ58ilSovxZ7+aQaqGxz9Cbe20sgC1f0lnisHj1uUAYkiCQ+bcjBHwGygN/NETOTEJKjU6laltJl21AteWthqb2+ttp7U0RtfC1KVrajWSellyMoGUksIehA7vG+gV7EYikvmxkOGkJKPHChbpYHmdYcsI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7616.eurprd08.prod.outlook.com (2603:10a6:10:320::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Tue, 2 Sep
 2025 17:18:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 17:18:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Koen Kooi <koen.kooi@oss.qualcomm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Antonin Godard
	<antonin.godard@bootlin.com>
Subject: Re: [PATCH] systemd: stop enabling non-standard MAC policy when using
 the 'pni-names' DISTRO_FEATURE
Thread-Topic: [PATCH] systemd: stop enabling non-standard MAC policy when
 using the 'pni-names' DISTRO_FEATURE
Thread-Index: AQHcG+lTCiL79TKLdkC1JimrZTHYLLSAI1mA
Date: Tue, 2 Sep 2025 17:18:34 +0000
Message-ID: <013FB5B9-2D1C-47AB-A1BD-C9E67A674024@arm.com>
References: <20250902090925.2904294-1-koen.kooi@oss.qualcomm.com>
In-Reply-To: <20250902090925.2904294-1-koen.kooi@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7616:EE_|AMS0EPF000001AC:EE_|DB4PR08MB9336:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7c1ed9-92c8-4ac0-df2d-08ddea44d2c8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?SckJ9o8upAFFnmuFR2YPHKYV5DoGVrJvjwHoF7tEPINY25bHX/7V2RIA145y?=
 =?us-ascii?Q?oJICBKmJeWgN1t+lG6xJTGmOmwTGsoGSaqgknUXcfYhrq7T8AUIZmEDdaNjy?=
 =?us-ascii?Q?qo1KZFZBtanJvvcyaoQtHWoD5IsNLIDRPKVZAdDVqRPknfy7nsFo0ILCldhE?=
 =?us-ascii?Q?Jy+IXbXinmmpfQpU+JXffs4CCTALYOIsYxh+LPVQh0hFLzDimM1dfjPwk0J9?=
 =?us-ascii?Q?18X5Ajxst90iU1h1UGlLzZqOnCw2Z5N7FBNs64KPnhn2Un+Z2rW2Vm/i0vjV?=
 =?us-ascii?Q?g71D652LU6uXIC5IWYtkArWrwaI0Ig9IOveadBV6rfyhiuHqE7ZTiXFD9g9v?=
 =?us-ascii?Q?Y25PeLC3PuVD4qM789uayIKDtu1+kHd7eMZ50dPMUniZlyFUpmYxYwKkNlG/?=
 =?us-ascii?Q?Zva3a8QRuHy7sXOBITKZoJr4DPcSO6/VoQftG1bh1Ae44Zm+krQpWoMb1jDi?=
 =?us-ascii?Q?UsOiPkq8YC8n962nzYODbmNTU7SBZUCDLYfnz99X7u5Ng1O0EDM419SouP+c?=
 =?us-ascii?Q?KgoYNtv9xct31baLiTteUnpeNWthh29sEu8Q9hsp9cXdQIn8kU/UFlrzAcAC?=
 =?us-ascii?Q?gQfufHfB7K5gdg8LBhCpdkrNe+LOkoHJZU40NMJhvg/FAm0K18OdLmyvSgbk?=
 =?us-ascii?Q?gdKTETl3HnycrMvdBGMyQme5E+LtC8AFv7wgVyU196GnRZPcu5/tvWTYD6H9?=
 =?us-ascii?Q?NCeDg0py0SXW2V+1KCHF0fo9dqFaeowlqElG12240JNbThIja2ojqnJgz3AM?=
 =?us-ascii?Q?XuIMn91hy236AqW1A5ZaDo3UC2b3NrbIAD0VBNCr9pbxfMGJYGVaS92eui3d?=
 =?us-ascii?Q?4y2StOCHBxVQaQIcLfGY+iR2NGfN6TCQOaZWSMiV/UgYNV0R+7NFh0AAgHzW?=
 =?us-ascii?Q?DguMd/uogWbgB7zfi3sr9WOpr5mS44nCyr9OQWCX9p/1G3H1+xlhru5P5brL?=
 =?us-ascii?Q?Xf2iHU1KlU6Tx6Phon8yOD9gO2f8YsGIY5OL49GkxGQkQQlWbzE9/1hgd/ZN?=
 =?us-ascii?Q?DYuR4GYAUPe9g4mo6jlxrgq/xUWzX3jGKy03E+5ptnLTkl+priASU5vTc4xt?=
 =?us-ascii?Q?O3wsgjPFr4MsfVgLsrenXCVHGRySufBa83pgrNgdD80xIPDKtE/zijw9BNuE?=
 =?us-ascii?Q?S6/+1quNA7FAurjDOTEAYYfL/tpYKtBhqvmXjKlbHqK6fsIAezNitHRUreeT?=
 =?us-ascii?Q?nxNhIYM1I0+nOISNeMM6I57ziwZYod8hoCMP0dD6QnVOU50HE809GtBSdb9M?=
 =?us-ascii?Q?QQVsJYriCD4zN+uFZxbOW/XHmb0g+K/fVEicdIeitDzNQEvgdaHx7a/Eg+Mp?=
 =?us-ascii?Q?VajtJ8fm/z/rJcwca0ipctiqskW1M6A6smwKbnTSvelvFx9ji5azfqS1sZA8?=
 =?us-ascii?Q?X9TR9VnDWdTiB7+CRSUCamK4FaMmroXJ+/4matpwlhmrkavIwIcx6cQJ/SEq?=
 =?us-ascii?Q?h456LNHL5WGSppMdF+zDM5z6qMq5LTj+fbyDW5k2zwgc5ELCGLMQ9Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E9DD4E36B109414F8905CA8C3841A014@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7616
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	461be94f-5d4f-4c86-1650-08ddea44bf64
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|376014|82310400026|36860700013|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fvFiIcjZr0nhsZrc/yuD9wxuolEiDz4AQ6KyufPByshD5WD3AGVWSyQLzzlH?=
 =?us-ascii?Q?42g/F60vulvsUzwpc0cVaZJwBTlTquopJnxl9OmgUkBwEcHmFm9xJElD9z4t?=
 =?us-ascii?Q?+YolqbkE/Y1/jMCyX7kKS2zjwUEAsozpYWp0hqjNhV0I3rzuxpzu+GE6GwdH?=
 =?us-ascii?Q?VeANewBuyiA25zcLEHftgGcQ2XwS1z3ez8O209kJBHZRE1PerpXVJJ/GVbIo?=
 =?us-ascii?Q?HsIPGvaMIo7pbG5iVyHuucXUS1sjjDQvG+ITiMf6C4TlhJVkEwZ7g673JK56?=
 =?us-ascii?Q?LRNBAz2bMqkPS0xfAhLa935gvlilA+ds+VXpyYKP0nYgi0gpNjbJZK3EjUqm?=
 =?us-ascii?Q?j/KHubnO2RH8XZYoBt6eN5xl3218WaPh2NIERwxv8qbwPq5j3GU6S0Q2OGY8?=
 =?us-ascii?Q?jAK3oql2MHg3wY3Z25b+CuReMq7eOIDQMdXSsLhX7Yoyh+vNvmFjfrDpTOV+?=
 =?us-ascii?Q?ivxuFqGV//eMxDIIWPbaE9dNF9d/agihfwYqLzsQKTY0kFlnwio1sq724of9?=
 =?us-ascii?Q?rfQbK25MEp9OjG+GATL93J4mzOqFRqrnk2v6iJAvPprNdCCbBCxe/yqXv/FK?=
 =?us-ascii?Q?+Hxg6QYDX6ffLNvcL/1qEH7Kl0oteGsTTVyNPqerGYpvUT85nZhTy86YueUD?=
 =?us-ascii?Q?rIk8F+sLWkNebjWrVPsoleM8JlO5bK9t2nuykk/JAOQhPDbZJTtxroOqq4Wk?=
 =?us-ascii?Q?PvtMp+tbVQN81HRz1jQXKfKDhHCU4/A4xqfTUQb/uqcbCremqxBtKY1e0V0k?=
 =?us-ascii?Q?SF0ymVeqNVLLN8Ct/jGoMeocyBq9Q/jg2LSMLRO/3JXfPYRSSbqivmK/QhYv?=
 =?us-ascii?Q?gZhLISf8k6Q/gslAl3LtEOttKn8ybf3X918UQrb9at6Epsx2LT79NwiqjoKX?=
 =?us-ascii?Q?ZPHo9tFUAl8JgOTD4F1jOTaS1nTodBvOMSh5IPB+qNr29Y7h/NXHOdkLceUY?=
 =?us-ascii?Q?yn6wr5Tv9m31S77WxNNghGhSWHUCsS2b41maACmRY/FH6N9fuKp3xnQVMrru?=
 =?us-ascii?Q?3z5Qp8cJ9f+FauYgyJ6gItU/WwHNhxidu9zI+V1zdMzRJa9yC+5U9RC4v/h7?=
 =?us-ascii?Q?HkYv0Wwc5TsP5h/f0DZf7+uROsFSIWQQ79ADui6nCR3vNyobKY7w4zLE0jUJ?=
 =?us-ascii?Q?94Wlt/d6LkuGivO+IlHvwsBFZy/zD1donU2X8WHqjOC8b1sQton8FBPyZ+CH?=
 =?us-ascii?Q?y5W/YpLQFl26t9+7KBVMG/3xILQn5Y6sfHPT7Fbq3f4EeJ0Siqv6pV2F5ncG?=
 =?us-ascii?Q?DytNSkFEqIvEgCKZFAWCHJJM9fZm6jrBYfX83bun/oPfEQ0NtPEjW6F/F2J/?=
 =?us-ascii?Q?A1JfnC9/utek/pJOq4yJEnVrN5hLcOBsAdcLPRNKSN9GolkHVF0cJkzHNSbk?=
 =?us-ascii?Q?Az2Dss5OVEx+fAjDTb8ihHa9FDv+6Ny7NhNFjIRt2DjmdxFj84idDlcl4jsc?=
 =?us-ascii?Q?McNY9b10OqLSQKhjRGkAc1tjW7e9Zudb96aIltS1Kaem+zUqK3erXqDeyTXM?=
 =?us-ascii?Q?sUzylKpFIfPx5OY+OBohw0d3k+HJ22TpVJdD?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(82310400026)(36860700013)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 17:19:07.0631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7c1ed9-92c8-4ac0-df2d-08ddea44d2c8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9336
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 17:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222745

+1 from me, thanks Koen.

This will need documenting in the migration guide, copying Antonin.

Ross

> On 2 Sep 2025, at 10:09, Koen Kooi <koen.kooi@oss.qualcomm.com> wrote:
>=20
> This recipe enabled an additional, non-standard policy for predictable
> network names: the MAC policy. This is a deviation from upstream
> policies and in cases where no MAC address is available, it makes it
> actively worse by changing the name(s) every boot.
>=20
> Change the logic to disable predictable naming when the DISTRO_FEATURE
> isn't enabled and only use upstream logic with it *is* enabled.
>=20
> For DISTROs that wish to use non-standard policies, a DISTRO layer is the=
 correct place.
> E.g. in DISTRO_LAYER/recipes-core/systemd/systemd_%.bbappend:
>=20
> do_install:append:DISTRO() {
>       if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'fals=
e', d)}; then
>               if ! grep -q '^NamePolicy=3D.*mac' ${D}${nonarch_libdir}/sy=
stemd/network/99-default.link; then
>                       sed -i '/^NamePolicy=3D/s/$/ mac/' ${D}${nonarch_li=
bdir}/systemd/network/99-default.link
>               fi
>               if ! grep -q 'AlternativeNamesPolicy=3D.*mac' ${D}${nonarch=
_libdir}/systemd/network/99-default.link; then
>                       sed -i '/AlternativeNamesPolicy=3D/s/$/ mac/' ${D}$=
{nonarch_libdir}/systemd/network/99-default.link
>               fi
> }
>=20
> Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
> ---
> meta/recipes-core/systemd/systemd_257.8.bb | 11 ++---------
> 1 file changed, 2 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_257.8.bb b/meta/recipes-co=
re/systemd/systemd_257.8.bb
> index 174372be03..6399c57640 100644
> --- a/meta/recipes-core/systemd/systemd_257.8.bb
> +++ b/meta/recipes-core/systemd/systemd_257.8.bb
> @@ -400,15 +400,8 @@ do_install() {
> ${D}/${sysconfdir}/systemd/system.conf
> fi
>=20
> - if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', =
d)}; then
> - if ! grep -q '^NamePolicy=3D.*mac' ${D}${nonarch_libdir}/systemd/networ=
k/99-default.link; then
> - sed -i '/^NamePolicy=3D/s/$/ mac/' ${D}${nonarch_libdir}/systemd/networ=
k/99-default.link
> - fi
> - if ! grep -q 'AlternativeNamesPolicy=3D.*mac' ${D}${nonarch_libdir}/sys=
temd/network/99-default.link; then
> - sed -i '/AlternativeNamesPolicy=3D/s/$/ mac/' ${D}${nonarch_libdir}/sys=
temd/network/99-default.link
> - fi
> - else
> - # Actively disable Predictable Network Interface Names
> + # Actively disable Predictable Network Interface Names
> + if ${@ 'true' if not bb.utils.contains('PACKAGECONFIG', 'pni-names', 't=
rue', 'false', d) else 'false'}; then
> sed -i 's/^NamePolicy=3D.*/NamePolicy=3D/;s/^AlternativeNamesPolicy=3D.*/=
AlternativeNamesPolicy=3D/' ${D}${nonarch_libdir}/systemd/network/99-defaul=
t.link
> fi
> }
> --=20
> 2.34.1
>=20


