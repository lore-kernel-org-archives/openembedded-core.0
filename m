Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F006CCFA1E
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 11:51:56 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.73])
 by mx.groups.io with SMTP id smtpd.web11.40804.1727351507681128532
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 04:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cFMDCVY7;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cFMDCVY7;
 spf=pass (domain: arm.com, ip: 40.107.247.73, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lwlV1OiitAK1eKS+yM4LvAemLQkm9Y7ZBElYR+ozpt71LEzYDmvjNdFhaogzv8Bccc5EmVJ5TL64Br0G39XlnESM7qA3n71n78xvQ/1TaFCBlWqKkt9BnvHdZouiubS8Ppj51yvBSlWBd8qLVErnQwEMJAkwNdsP8ECToybmJm4I/XRh2VgIElLdIFOQhiUfpC0jMk3rgX6X2T3Pb/heevfVJ/045kYFoj001svnKXd8EqjjET0+u0STUQ79O8HGkLbl2HYRQ2S5eoY8LsXDvMeXZ3T9pQz3+2skwBAkTh32h4GU4uZoy1lxIPcfRnOfqmh77YiO932xE+q4sBinIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egPYBTefBlDCaYALiyPvzyDNj559lr0HCvbjbOhUUxs=;
 b=K69Iy1pnAqG2VPe8KWuXvEvy97fC5iRKK5sbM7mLuB3j4xpUfI5jU8USGaUrRb0iOy7LYIExuKD1a1y7XF92fOeGvAQ4iD15Ol+gIP7/WbxLqC1v/bOfhXqMHQ/dtYWOvhmtDr82RRDS26wPl2btuOHZsi3XUtVo27lyK37cVr1Q0EJU0/pr/8Vyt9vPbEVUB8H9RnyhJrd9a6AiU+OAmVuEDcDsnCaUUyTnLqZzuy5xjAE8npKWnmXZhYXk5OCA0r1AZlruNl/hN+HIiQz72uv+rYqgUt5s4o0nxdyQr8LCzRHvkVGQvmDsiAyPf55SUAYhMvv+9RTstfsk2BOh7g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egPYBTefBlDCaYALiyPvzyDNj559lr0HCvbjbOhUUxs=;
 b=cFMDCVY7lgWnCF9FNrzO8rUFK5BxXX0WleI2cdhSmEynYpWKW4r05SNUvbHsq5uVa+l2IQp/Sx/vm87zUgGp3m/CDnvzPcxKdz5oBVZXeI3LQGEkPavt8QbETib/pVWIWfcQnraqPncTMGBhGM7h3XLTbpYEQrpLpr79sW7mTgM=
Received: from DUZPR01CA0076.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::7) by DB9PR08MB8739.eurprd08.prod.outlook.com
 (2603:10a6:10:3d1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Thu, 26 Sep
 2024 11:51:34 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::c0) by DUZPR01CA0076.outlook.office365.com
 (2603:10a6:10:46a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21 via Frontend
 Transport; Thu, 26 Sep 2024 11:51:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8005.15
 via Frontend Transport; Thu, 26 Sep 2024 11:51:33 +0000
Received: ("Tessian outbound 690adfc84afa:v465"); Thu, 26 Sep 2024 11:51:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d2ecab05b4e8086
X-TessianGatewayMetadata: gKQGdGTndXdCkUIl8p6IRj4VXFLs7N6SbfeFN3D6gMS7jznSvANpIs1WBr6wVAF6TSSyFr+xtnJnMtXEi6DY7Mpw6hfwbF7Q4pfKFqAk/g+NZSG/aq2J3LYGkEExjHSbU0MnVycDHVwqGFB/t3Snsl71JBwrm4BTmqmfF3IXkBk=
X-CR-MTA-TID: 64aa7808
Received: from L7d2813951c52.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5948B898-D32B-4B6A-ADFB-F2D8CA1AAC4A.1;
	Thu, 26 Sep 2024 11:51:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L7d2813951c52.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 26 Sep 2024 11:51:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpDmcIXCSgE90sPZFtFOpHmD5QQfFliRRahgI4FW8+Hjks/ZKJgQeUCbHchKhnc6ChmiJ6A+yBY6T1Hv2+2jrvObDrsHolgJ7gWQNfIsMTkWSu1qEB1b84z1A+nKumj+zWJhT7lzchE6dXpZG06MtedmKxHAP2qSucw7s8RFiLTpxEzSxg8mq9wZJVnKEW27exocKz8cCh0hsSCmZZY/us5yTU6qHZO9kKzvCgv3LCK9iBiNyR07lEdnIA1b7Ru8Wiksc/4FLkLKg3+9cJxCWuH0YK/LmCpYVXMdkiNbZSib27QKuFCqaHL2lm+lVLPNTvSnpnUa5WY4YZekK5E/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egPYBTefBlDCaYALiyPvzyDNj559lr0HCvbjbOhUUxs=;
 b=bz0VSvQt8RPgSejQYfVpO1UWsnhoExC/n1Tp1kr+HU/1U90Kl4OiyrOYbYTgdOrpIo6CR0GktGB3Xb7Yk2EOzUdOFZPzVi0PCnuYYkcE+r5+lQ33dwrH5/UyKZ0KY4KsUJQB9KMjwhKpSnyD75K+G1bYkUXowJbJloGERt/v2uWFoK5oRPiJ8oGTOvEbK96o4Jw6gqL0Hb+s2ZwJvL4I05rS4ZSo/nzP7F936Vabxs508TLTevSp6bzMgxXmChihkVr7Lzqolni2041QwNupcMIMVDfYoHQr7omBDcmDN5+tBHOhIQjTSIfMnPxaYD1Gs4s91BWsOpbi6ICT+H0hZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egPYBTefBlDCaYALiyPvzyDNj559lr0HCvbjbOhUUxs=;
 b=cFMDCVY7lgWnCF9FNrzO8rUFK5BxXX0WleI2cdhSmEynYpWKW4r05SNUvbHsq5uVa+l2IQp/Sx/vm87zUgGp3m/CDnvzPcxKdz5oBVZXeI3LQGEkPavt8QbETib/pVWIWfcQnraqPncTMGBhGM7h3XLTbpYEQrpLpr79sW7mTgM=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by FRZPR08MB10951.eurprd08.prod.outlook.com (2603:10a6:d10:136::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Thu, 26 Sep
 2024 11:51:20 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%2]) with mapi id 15.20.8005.010; Thu, 26 Sep 2024
 11:51:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 4/4 v2] python3-dtc: upgrade 1.7.0 -> 1.7.1
Thread-Topic: [OE-core][PATCH 4/4 v2] python3-dtc: upgrade 1.7.0 -> 1.7.1
Thread-Index: AQHbDpKQ3jUQCG5xUk6fDIH3alnDo7Jp92oAgAAAMgA=
Date: Thu, 26 Sep 2024 11:51:20 +0000
Message-ID: <457AF752-98B2-4032-8720-DD0EA976DFF8@arm.com>
References: <20240924150001.2586819-1-tgamblin@baylibre.com>
 <20240924150001.2586819-4-tgamblin@baylibre.com>
 <5E176A0E-4995-428E-AF5A-F625EF7A2000@arm.com>
In-Reply-To: <5E176A0E-4995-428E-AF5A-F625EF7A2000@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|FRZPR08MB10951:EE_|DB5PEPF00014B91:EE_|DB9PR08MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: 313dea4a-2f45-45f0-e84f-08dcde2191b7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?3ALvoiSMP0W4CJalITB92UCcH8Zgc91aENPH44Imrx/Z54RYcD93Fk0EpP4t?=
 =?us-ascii?Q?X2jIW7kY7T2YGITDDuionnIcsLN2iR/lAUcURXyTNXC8xQ4i2e1w9VA6cLva?=
 =?us-ascii?Q?bdDT/+mcuCTfZ+HNqMflf4FYQSeYaenuBQ3PwCQ5f0B9lAPIqgaNAXQFeBHc?=
 =?us-ascii?Q?qh1KLkmamH9gwsb595z6cyxA36sIPjk15mtBWYgkj0oX9EdTSlksY/TwI1p8?=
 =?us-ascii?Q?7/MAFNcMpyWRjATdLFKWQbhE/xLgmmi8/OEIprZ9+DiI4pT6qaLzwyefNGnd?=
 =?us-ascii?Q?wQf/LQ0vw82kHODd8CgPryAZ4DuaN3bOo0cZZYYKbudqkoFxCIB2oX7C8VG3?=
 =?us-ascii?Q?27fJ/zfO7wYPlJvbH/oMUN3TjjKafJBCrpwvPqtGXTDRDbFJxqI2xBIsfnis?=
 =?us-ascii?Q?JCFFdUSJHRmRz6nDiX+wDm++WUyjkrsjWZ9xbM2r1rCl6tk+DoYONM1V703O?=
 =?us-ascii?Q?ewq4GsD9QkLXTFMTFiy7LF4FFyDfRD9KgHEAKLs92MyMvWKwcRN3Vic1/OEh?=
 =?us-ascii?Q?zXZNIvdywzciSKViBHcQoZ2T1QzoBq0eotyBXv/cYGWWZgTUn92yceRSL5YN?=
 =?us-ascii?Q?vIeOUMJ3CtLrYu2C+hWBPOAzB7CxtpMkT6JBuxsG7fWG2bJ+xVpEuU60jVnY?=
 =?us-ascii?Q?zUYOI1tyEpRVZiTBpvl9Mr7G5xbEoTNo6GYkUioZeKrG175m87w+I00+rzAQ?=
 =?us-ascii?Q?O2sDi/h4oNNwqI2ywNEFID3rvh6oUSz/Smfv+JEbMImiydQPV5XiVlCkSUQ/?=
 =?us-ascii?Q?kjjgcwPxskXAkhTzZRhubUnMQXb5XQ+Hb7F4GkODNhJodNfBfPdhFuZ1apT7?=
 =?us-ascii?Q?BWu0t7WAoPowsNtfcG6esmpvacbVpjVl7+cX9RvKiJRk37UuS1ejNBJIu9Q8?=
 =?us-ascii?Q?m+AR3zz2jnHdgJqIon61Jzp7YrTK2ZG5F0N3aZkEPiwakL+9upgi/A18odWc?=
 =?us-ascii?Q?kx6U4UMKBdL/HHKDztoAcgZqLRXDqNXlAZ38cxzZ9IKV4BfwWEnWUh6/Mowg?=
 =?us-ascii?Q?NMI4pnQ2v59lFuQLcKcjshv3hWwgBy90gzncmoQ0+wUQUfg1Kj9MpBugpUY9?=
 =?us-ascii?Q?ScQD4dqWGJC2AGZbEN00NsM61ZZqJFE3JTIX4CwdO8aA1/RxXsW1iIXSGAvq?=
 =?us-ascii?Q?FJwdr+4m1gsYu2T3wE+16Sop0ecMEBdl1OIQXNzd8VAGkhA8yXET+ZbEhqIs?=
 =?us-ascii?Q?As2CJzEUiiJ3tBMtlev9o0cb5XEBDV3WvKviMaHcdqYQ+E63ief2hjlK92an?=
 =?us-ascii?Q?rF95vanBSAG6rZ/qW/PkpzvG7Wa2dHnshY2GkThR+wiBDOWcsk6A2HQyH8Oe?=
 =?us-ascii?Q?DU/QQERNApCr9dnDCv42xCRect5j5SEBc5p8o6MHlVyVqp9bBmnossHMR7WS?=
 =?us-ascii?Q?16aIdj8=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B2AE69B124FA4C49B50E6C7139571FA6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10951
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:20b:4e1::9];domain=AS4PR08MB7429.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	95fd30c8-a1d3-48ea-74ff-08dcde2189d4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|35042699022|1800799024|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CDMf3TX4RunSnUjDhHHX2ShCYqO0afS6NHt2+F3YLnTv57xUv6GEUXrgoSDg?=
 =?us-ascii?Q?Vj5tn+Fh542R4BtXg5+Dpr0MTM1Yf1/Osy522cWVh2bf/gyH3u/7v0ob5Mkr?=
 =?us-ascii?Q?txo3U8w4o/xcdmnO9EkpRXF99VkpTio8TyHUi36kZ0qXLYkXd1YZtDmqOdrs?=
 =?us-ascii?Q?zpV8CO2gXlKDyHGTV4TFTA5edVfY3PuxsxqHSTLTdUnR20BTiuvQ06mqBNfc?=
 =?us-ascii?Q?A5c1iPNZlsex7kmSKWBJgEqPLYQ5rArkZsJkxOgU7jMbMFmATKW4XVWCJlHN?=
 =?us-ascii?Q?m6/07EUBjQ0pMkUYKgXEVX0ERaeu8i3YqiiRs35raWlSid4Xo7o6aDIhsJDv?=
 =?us-ascii?Q?dsHMKXcel9lkyS2zx5Aizfpyv9oHIq3WSaialUw1mK0MILGm1oDwp+iiBpMY?=
 =?us-ascii?Q?qHlJJ9NMqMyVt4Q4rbUapyEYbER9/n2sgABfVfiaxnccL4e1p965JUPRxHGh?=
 =?us-ascii?Q?9tTGO/7QW5ccSgEPiowzxHVX79vVFC72oO/QZvkZYoxUKAEvCGVMAMiWrJui?=
 =?us-ascii?Q?Dtn5fMCrwffzii44yF3E5cdaNLEvVF1x9vHjibZfwHHd1PG7KlL5rOASV+X5?=
 =?us-ascii?Q?HC9dZF7LM1w4xmWI37iFoeK7RcvzzNt4ywmhC1aXsQQe5V/26yVBrZ9lI/bD?=
 =?us-ascii?Q?1FuBXIu5Ok7MP7PnVVgJ1ilhOmdfd9VJ19JpbmM+LYTk35wHIdohk4s63P4s?=
 =?us-ascii?Q?Pw3EpnCx8gkr8K2Ro/I9iBXmugRsY+NzUZiZjwDITlzO5r+Kjf7HkY3uqaJl?=
 =?us-ascii?Q?SW4goOSqaGm+WtqJjyCnIHwnofmk5Vh8R50+dd9vJ4AjP1MYCk/+RGmpgGXO?=
 =?us-ascii?Q?LXQXMBke36kLrKZduIVnjzxZPd2Fu7oAjN40qIPqNJMDVL7Osy7F7ZO6696O?=
 =?us-ascii?Q?Iu9lqw12D8VGCY8btsQ76lHjM8XQbyLnwDGLGH27YOnH9sO7OSQHJldWHlIz?=
 =?us-ascii?Q?/WmI03IsHw9rz9rIEl3r0jWLnLpZr1GF1v5aVPiRAbL91HX/6jNuynRTaet+?=
 =?us-ascii?Q?2Z2K6VA4oz88vU1bh2W3Gspiuy+69gHQBH7qFZWBVCihSpQjo9F+bwAP7hYp?=
 =?us-ascii?Q?oBX1LallIE5icDKoY4Mt9UZu9Biu6ZBCoNR341r9sWHHX4FvW6XulPiI5y56?=
 =?us-ascii?Q?hxBfF5xOhEuVly1GaHkLzi1o6cWM7saPiKvwqdePFngJWh2wcj4g5X9IbQ4D?=
 =?us-ascii?Q?MwB5ZIXGJOXCKIvyY6pt6BxqVcsAXLURDdLh6h1R08sFuYE26AzIuWPiXHNh?=
 =?us-ascii?Q?5VppbAzugfP2J35tDp2DoQl1vqEU3SeTf366UPDPMAFn6qwp9VkPxukLvjZx?=
 =?us-ascii?Q?kFmqHhM1Puu6sClN9bojGsJhwHDZmkhgqxf0iMmvEuC0Dw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(35042699022)(1800799024)(376014)(4022899009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 11:51:33.9334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 313dea4a-2f45-45f0-e84f-08dcde2191b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8739
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 11:51:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204980

I suspect the problem is the rebase of the symbol visibility patch went wro=
ng?

Ross

> On 26 Sep 2024, at 12:50, Ross Burton <ross.burton@arm.com> wrote:
>=20
> This breaks meta-virt, which uses python3-dtc in its build:
>=20
> Traceback (most recent call last):
> File "[...]/work/qemuarm64-poky-linux/xen-image-minimal/1.0/recipe-sysroo=
t-native/usr/bin/lopper", line 8, in <module>
> sys.exit(main())
> ^^^^^^
> File "[...]/work/qemuarm64-poky-linux/xen-image-minimal/1.0/recipe-sysroo=
t-native/usr/lib/python3.12/site-packages/lopper/__main__.py", line 220, in=
 main
> import lopper.fdt
> File "[...]/work/qemuarm64-poky-linux/xen-image-minimal/1.0/recipe-sysroo=
t-native/usr/lib/python3.12/site-packages/lopper/fdt.py", line 46, in <modu=
le>
> import libfdt
> File "[...]/work/qemuarm64-poky-linux/xen-image-minimal/1.0/recipe-sysroo=
t-native/usr/lib/python3.12/site-packages/libfdt.py", line 12, in <module>
> import _libfdt
> ImportError: [...]/work/qemuarm64-poky-linux/xen-image-minimal/1.0/recipe=
-sysroot-native/usr/lib/python3.12/site-packages/_libfdt.cpython-312-x86_64=
-linux-gnu.so: undefined symbol: fdt_get_symbol
>=20
> Ross
>=20
>> On 24 Sep 2024, at 16:00, Trevor Gamblin via lists.openembedded.org <tga=
mblin=3Dbaylibre.com@lists.openembedded.org> wrote:
>>=20
>> Patch '0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch'
>> had to be adjusted to apply on the latest version.
>>=20
>> Changelog:
>>=20
>> 99031e3 (tag: v1.7.1, origin/master, origin/main, origin/HEAD, master) B=
ump version to v1.7.1
>> 3d5e376 setup: Move setting of srcdir down to the bottom
>> e277553 setup: Collect top-level code together
>> 7e5a889 setup: Move version and full_description into a function
>> 78b6a85 Tidy up some pylint warnings
>> 3501d37 Require Python 3
>> bcd02b5 fdtoverlay: remove wrong singular article in a comment
>> 84b056a checks: relax graph checks for overlays
>> 1df7b04 pylibfdt/Makefile.pylibfdt: use project's flags to compile the e=
xtension
>> 61e88fd libfdt: overlay: Fix phandle overwrite check for new subtrees
>> 49d3089 meson: fix installation with meson-python
>> d54aaf9 pylibfdt: clean up python build directory
>> ab86f1e pylibfdt: add VERSION.txt to Python sdist
>> 7b8a30e pylibfdt: fix Python version
>> ff4f17e pylibfdt/Makefile.pylibfdt: fix Python library being rebuild dur=
ing install
>> 9e313b1 pylibfdt/meson.build: fix Python library being rebuilt during in=
stall
>> d598fc3 tests/run_tests.sh: fix Meson library path being dropped
>> b98239d tests/meson.build: fix python and yaml tests not running
>> c17d76a checks: Check the overall length of "interrupt-map"
>> ae26223 libfdt: overlay: Refactor overlay_fixup_phandle
>> 4dd831a libfdt: tests: Update test case for overlay_bad_fixup
>> e6d2942 tests: Remove two_roots and named_root from LIBTREE_TESTS_L and =
add all dtb filenames generated by dumptrees to TESTS_TREES_L in Makefile.t=
ests
>> 855c934 tests: fix tests broken under Meson
>> 4fd3f4f github: enforce testing pylibfdt and yaml support
>> 9ca7d62 meson: split run-tests by type
>> bb51223 meson: fix dependencies of tests
>> e819006 meson: fix pylibfdt missing dependency on libfdt
>> 8221238 pylibfdt: fix get_mem_rsv for newer Python versions
>> 1fad065 libfdt: overlay: ensure that existing phandles are not overwritt=
en
>> b0aacd0 github: add windows/msys CI build
>> ae97d97 github: Don't accidentally suppress test errors
>> 057a7db github: Display meson test logs on failure
>> 92b5d4e pylibfdt: Remove some apparently deprecated options from setup.p=
y
>> 417e329 github: Update to newer checkout action
>> 5e6cefa fix MinGW format attribute
>> 24f6001 libfdt: Simplify adjustment of values for local fixups
>> da39ee0 libfdt: rework shared/static libraries
>> a669223 Makefile: do not hardcode the `install` program path
>> 3fbfdd0 libfdt: fix duplicate meson target
>> dcef5f8 tests: use correct pkg-config when cross compiling
>> 0b8026f meson: allow building from shallow clones
>> 95c74d7 treesource: Restore string list output when no type markers
>> 2283dd7 libfdt: fdt_path_offset_namelen: Reject empty path
>> 79b9e32 libfdt: fdt_get_alias_namelen: Validate aliases
>> 52157f1 pylibfdt: Support boolean properties
>> d774337 dtc: fix missing string in usage_opts_help
>> ad8bf9f libfdt: Fix fdt_appendprop_addrrange documentation
>> 6c5e189 github: add workflow for Meson builds
>> a3dc9f0 libfdt: rename libfdt-X.Y.Z.so to libfdt.so.X.Y.Z
>> 3501994 workflows: build: remove setuptools_scm hack
>> cd3e230 pylibfdt: use fallback version in tarballs
>> 0f58645 move release version into VERSION.txt
>> 3816595 libfdt: add missing version symbols
>> 5e98b59 editorconfig: use tab indentation for version.lds
>> d030a89 tests: generate dtbs in Meson build directory
>> 8d8372b tests: fix use of deprecated meson methods
>> 761114e pylibtfdt: fix use of deprecated meson method
>> bf6377a meson: set minimum Meson version to 0.56.0
>> 4c68e4b libfdt: fix library version to match project version
>> bdc5c87 meson: allow disabling tests
>> f088e38 Makefile: allow to install libfdt without building executables
>> 6df5328 Fix use of <ctype.h> functions
>> ccf1f62 libfdt: Fix a typo in libfdt.h
>> 71a8b8e libfdt: meson: Fix linking on macOS linker
>> 589d8c7 dtc: Add an option to generate __local_fixups__ and __fixups__
>> e836466 CI: Add build matrix with multiple Linux distributions
>> 3b02a94 dtc: Correct invalid dts output with mixed phandles and integers
>> d488895 tests: Add additional tests for device graph checks
>> ea3b9a1 checks: Fix crash in graph_child_address if 'reg' cell size !=3D=
 1
>> b2b9671 livetree: fix off-by-one in propval_cell_n() bounds check
>> ab481e4 Add definition for a GitHub Actions CI job
>> c88038c Drop obsolete/broken CI definitions
>> 0ac8b30 yaml: Depend on libyaml >=3D 0.2.3
>> f1657b2 tests: Add test cases for bad endpoint node and remote-endpoint =
prop checks
>> 44bb89c checks: Fix segmentation fault in check_graph_node
>> 60bcf1c improve documentation for fdt_path_offset()
>> a6f997b add fdt_get_symbol() and fdt_get_symbol_namelen() functions
>> 18f5ec1 use fdt_path_getprop_namelen() in fdt_get_alias_namelen()
>> df09327 add fdt_path_getprop_namelen() helper
>> 129bb4b doc: dt-object-internal: Fix a typo
>> 390f481 fdtoverlay: Drop a a repeated article
>> 9f8b382 manual: Fix and improve documentation about -@
>> 2cdf93a fdtoverlay: Fix usage string to not mention "<type>"
>> 72fc810 build-sys: add -Wwrite-strings
>> 083ab26 tests: fix leaks spotted by ASAN
>> 6f8b28f livetree: fix leak spotted by ASAN
>> fd68bb8 Make name_node() xstrdup its name argument
>> 4718189 Delay xstrdup() of node and property names coming from a flat tr=
ee
>> 0b842c3 Make build_property() xstrdup its name argument
>> 9cceabe checks: correct I2C 10-bit address check
>> 0d56145 yamltree.c: fix -Werror=3Ddiscarded-qualifiers & -Werror=3Dcast-=
qual
>> 61fa22b checks: make check.data const
>> 7a1d72a checks.c: fix check_msg() leak
>> ee57999 checks.c: fix heap-buffer-overflow
>> 44c9b73 tests: fix -Wwrite-strings
>> 5b60f51 srcpos.c: fix -Wwrite-strings
>> 32174a6 meson: Fix cell overflow tests when running from meson
>> 64a907f meson.build: bump version to 1.7.0
>> e3cde06 Add -Wsuggest-attribute=3Dformat warning, correct warnings thus =
generated
>> 4182182 Use #ifdef NO_VALGRIND
>> 71c19f2 Do not redefine _GNU_SOURCE if already set
>>=20
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>> v2 adds my signoff to the carried patch, which was adjusted to apply on
>> v1.7.1.
>>=20
>> ...erlay-make-overlay_get_target-public.patch | 25 +++++++++++--------
>> ...hon3-dtc_1.7.0.bb =3D> python3-dtc_1.7.1.bb} |  2 +-
>> 2 files changed, 15 insertions(+), 12 deletions(-)
>> rename meta/recipes-devtools/python/{python3-dtc_1.7.0.bb =3D> python3-d=
tc_1.7.1.bb} (94%)
>>=20
>> diff --git a/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt=
-overlay-make-overlay_get_target-public.patch b/meta/recipes-devtools/pytho=
n/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.pat=
ch
>> index a2df482e3aa..70dd93f7471 100644
>> --- a/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overla=
y-make-overlay_get_target-public.patch
>> +++ b/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overla=
y-make-overlay_get_target-public.patch
>> @@ -1,4 +1,4 @@
>> -From 4d4703e0199fb3556c37694e4d951785abca22fd Mon Sep 17 00:00:00 2001
>> +From 20b224b8ab1837778dfd0e7171643a5d26675f95 Mon Sep 17 00:00:00 2001
>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> Date: Wed, 19 Jan 2022 12:46:42 -0500
>> Subject: [PATCH] Revert "libfdt: overlay: make overlay_get_target() publ=
ic"
>> @@ -7,6 +7,9 @@ This reverts commit 45f3d1a095dd3440578d5c6313eba555a791=
f3fb.
>>=20
>> Upstream-Status: Inappropriate [embedded specific]
>>=20
>> +Adjust to apply on v1.7.1.
>> +
>> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>> libfdt/fdt_overlay.c | 29 ++++++++++++++++++++++-------
>> libfdt/libfdt.h      | 18 ------------------
>> @@ -14,7 +17,7 @@ Upstream-Status: Inappropriate [embedded specific]
>> 3 files changed, 22 insertions(+), 26 deletions(-)
>>=20
>> diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
>> -index 5c0c398..d217e79 100644
>> +index 28b667f..e6e9382 100644
>> --- a/libfdt/fdt_overlay.c
>> +++ b/libfdt/fdt_overlay.c
>> @@ -40,22 +40,37 @@ static uint32_t overlay_get_target_phandle(const voi=
d *fdto, int fragment)
>> @@ -59,7 +62,7 @@ index 5c0c398..d217e79 100644
>>  if (path)
>>  ret =3D fdt_path_offset(fdt, path);
>>  else
>> -@@ -621,7 +636,7 @@ static int overlay_merge(void *fdt, void *fdto)
>> +@@ -848,7 +863,7 @@ static int overlay_merge(void *fdt, void *fdto)
>>  if (overlay < 0)
>>  return overlay;
>>=20
>> @@ -68,7 +71,7 @@ index 5c0c398..d217e79 100644
>>  if (target < 0)
>>  return target;
>>=20
>> -@@ -764,7 +779,7 @@ static int overlay_symbol_update(void *fdt, void *f=
dto)
>> +@@ -991,7 +1006,7 @@ static int overlay_symbol_update(void *fdt, void *=
fdto)
>>  return -FDT_ERR_BADOVERLAY;
>>=20
>>  /* get the target of the fragment */
>> @@ -77,7 +80,7 @@ index 5c0c398..d217e79 100644
>>  if (ret < 0)
>>  return ret;
>>  target =3D ret;
>> -@@ -786,7 +801,7 @@ static int overlay_symbol_update(void *fdt, void *f=
dto)
>> +@@ -1013,7 +1028,7 @@ static int overlay_symbol_update(void *fdt, void =
*fdto)
>>=20
>>  if (!target_path) {
>>  /* again in case setprop_placeholder changed it */
>> @@ -87,10 +90,10 @@ index 5c0c398..d217e79 100644
>>  return ret;
>>  target =3D ret;
>> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
>> -index a7f432c..7f117e8 100644
>> +index 0677fea..c72337b 100644
>> --- a/libfdt/libfdt.h
>> +++ b/libfdt/libfdt.h
>> -@@ -2116,24 +2116,6 @@ int fdt_del_node(void *fdt, int nodeoffset);
>> +@@ -2184,24 +2184,6 @@ int fdt_del_node(void *fdt, int nodeoffset);
>>  */
>> int fdt_overlay_apply(void *fdt, void *fdto);
>>=20
>> @@ -116,7 +119,7 @@ index a7f432c..7f117e8 100644
>> /* Debugging / informational functions                                */
>> /**********************************************************************/
>> diff --git a/libfdt/version.lds b/libfdt/version.lds
>> -index cbce5d4..7ab85f1 100644
>> +index 989cd89..ae5f8c6 100644
>> --- a/libfdt/version.lds
>> +++ b/libfdt/version.lds
>> @@ -77,7 +77,6 @@ LIBFDT_1.2 {
>> @@ -124,9 +127,9 @@ index cbce5d4..7ab85f1 100644
>>  fdt_setprop_inplace_namelen_partial;
>>  fdt_create_with_flags;
>> - fdt_overlay_target_offset;
>> + fdt_get_symbol;
>> + fdt_get_symbol_namelen;
>>  local:
>> - *;
>> - };
>> --=20
>> -2.19.1
>> +2.39.5
>>=20
>> diff --git a/meta/recipes-devtools/python/python3-dtc_1.7.0.bb b/meta/re=
cipes-devtools/python/python3-dtc_1.7.1.bb
>> similarity index 94%
>> rename from meta/recipes-devtools/python/python3-dtc_1.7.0.bb
>> rename to meta/recipes-devtools/python/python3-dtc_1.7.1.bb
>> index 85e48d46942..269095bd8c9 100644
>> --- a/meta/recipes-devtools/python/python3-dtc_1.7.0.bb
>> +++ b/meta/recipes-devtools/python/python3-dtc_1.7.1.bb
>> @@ -14,7 +14,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)=
"
>>=20
>> LIC_FILES_CHKSUM =3D "file://pylibfdt/libfdt.i;beginline=3D1;endline=3D6=
;md5=3Dafda088c974174a29108c8d80b5dce90"
>>=20
>> -SRCREV =3D "039a99414e778332d8f9c04cbd3072e1dcc62798"
>> +SRCREV =3D "99031e3a4a6e479466ae795790b44727434ca27d"
>>=20
>> S =3D "${WORKDIR}/git"
>>=20
>> --=20
>> 2.39.5
>>=20
>>=20
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#204876): https://lists.openembedded.org/g/openembedd=
ed-core/message/204876
>> Mute This Topic: https://lists.openembedded.org/mt/108629987/6875888
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [r=
oss.burton@arm.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20
>=20


