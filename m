Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4161DC02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 11:44:20 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.62])
 by mx.groups.io with SMTP id smtpd.web10.41761.1737546258979538265
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 03:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=C8JyXdL2;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=C8JyXdL2;
 spf=pass (domain: arm.com, ip: 40.107.249.62, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wExaBHmrG8o8iNj5430LtA9SGN8qtSkOfrjfAj6KbfZc2S3eg96BkBV+mcIYswJPq8U+vQ9DAD2NUnAGuP8GJH0T/b4pCaUDCaNOyRXfyEm/HDhLfnuCoU/AMGjojJS76XF/CW3VdlTyicvrhF1He9D7FSlvBPzNLp7pmkFecggUenYO7Bl9DdI0gK8E14lehijbDSUFpy1VEzmrp1K/7vMh7lkAfxuVufgfqC+dc0RRx+zw+oBj1eIF92pGV6EdtDB2DUgYumyNunxO9D1F9HRxab3xe+F9nwblN5Jc6izUK7lxK0lfYYGQYbQj7df/+Xb6ksXFxEjpTQ39aN2Nrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uAoYR5YnBlwwjejRv/lPZ42PGIKvTJqwiiOqV+EU48=;
 b=w6zmvkwBlCMFxIkjrubtec3tQJ17WIaBncn4wnLwn7QiUDcNLIZLUllOd9W16jqRuHj53AkjHBt5z+58k+F//KFOkVYmV8/hq3M/gey+/LR+0EQXTjzwuE8I4jvSR4qSvYS23GxNxpZphFJg79H8VFwKiYnLxDsw7j+stOKfpdim3Sun4yOUYW5WgtSR74MQfyumFstLFginv2tm57SJsj4w0+3zVYWHsV+Hr4j0Jx0TwhxocJTqloPYITWfntYZvnnT/jva+AMzGx/0o7+T9L2+b7ZJ3LHupDfBzDauZtC8yIZM8bQDqGAAwC1hkMQZrQWKMUV56PoAOplu9NoVYw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uAoYR5YnBlwwjejRv/lPZ42PGIKvTJqwiiOqV+EU48=;
 b=C8JyXdL2naXyPJzPfeeaEcK39UPt+CnOVRafRQYy8m9Uf8nDBPXqWGHlhxjWS71anaeEWBFxhg7FOOktkUM4GaJVy7iS+8POKaA8GFiFwrSQlF+Cwud6RhjScE5IYRJcv5VOWC62vWsP04BU88bJeJDonkofpJCJV8PmbeiB69Q=
Received: from AS8PR04CA0022.eurprd04.prod.outlook.com (2603:10a6:20b:310::27)
 by AS1PR08MB7635.eurprd08.prod.outlook.com (2603:10a6:20b:477::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 11:44:10 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:20b:310:cafe::5f) by AS8PR04CA0022.outlook.office365.com
 (2603:10a6:20b:310::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Wed,
 22 Jan 2025 11:44:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.8
 via Frontend Transport; Wed, 22 Jan 2025 11:44:09 +0000
Received: ("Tessian outbound ad07758b3bb4:v543"); Wed, 22 Jan 2025 11:44:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ed7186d3d78d81ba
X-TessianGatewayMetadata: +htajW/3VPm63JWPa4KK3ff61zu28hNROQfksMhro+sLaSjSvrQaGf0H5s6vx+tV7gP97EeqL422V4tjn7ShNkV4olV8QbBB++puM7llntxgM83diSq0buSUwFyFgzhv3fyhaFB+ElEjqJLibjaonMjiHMBd4knOUwr3bNCGmLo=
X-CR-MTA-TID: 64aa7808
Received: from L392c6609564a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 956BBE60-6827-43E3-B710-E75D5FC05DB4.1;
	Wed, 22 Jan 2025 11:44:02 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L392c6609564a.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 22 Jan 2025 11:44:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcZBcugeyyOA+Xei4QjlfcENyeyTGfhK/GbSFuIlujXEFZySvWf0dBSGgjBWRT93UMyI41jjdbjCsJnX5p0fiREys/WLoRBfi/AOtBm03eK01b8PaDEHfR8hfkxqRHoh8hMElUurKqEENavUC+ZWYYPj9IAAKqUVWTOMht6zZGXLXEIu5p9gpd8nbR0h4555HzRhvYphX41dVPINpDssnm6gKm1hBlvlMg7nJCX5VFDHbkuaRqjPZ7O/volG4lLHNddgi1t4wM0FOy/vpBqqRqPZGbRlrSEZISchZU9sXGD5Ia4QzQQmhoazNnaenYnPEhgcZmAA1vHNyb5n5iD9hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uAoYR5YnBlwwjejRv/lPZ42PGIKvTJqwiiOqV+EU48=;
 b=y11U3TCIgQH2hVI/Qp91awz44jjdDVDvaitL0vwgZVqre0FDZhdeY17lBP7xP0RkXeRZy4a4C/dRjs3puolaFldUTlhX5YGMvKHXly+62N/bzw7cjmEltY+mJliZv3vVsztAkpYJxT3t3VSVYhQuxco2HJIPsWCOO5Jq+anxVW1lfXZ0RMXSIeRNRBP10ZzFMsDmyvJVRNV8rR/VeGMcANygb0K2Tp5iE7d6KhjScq8wWR+2Npsa2+PHt+hg7gv6OK9yhi3yw6P8dGqEjnVmlRmgeLUPYqPBvF0TFdRq9UaZWYf8uv68g/33p2c6dStX6nxYw6hp/mGbnxiC/FYJ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uAoYR5YnBlwwjejRv/lPZ42PGIKvTJqwiiOqV+EU48=;
 b=C8JyXdL2naXyPJzPfeeaEcK39UPt+CnOVRafRQYy8m9Uf8nDBPXqWGHlhxjWS71anaeEWBFxhg7FOOktkUM4GaJVy7iS+8POKaA8GFiFwrSQlF+Cwud6RhjScE5IYRJcv5VOWC62vWsP04BU88bJeJDonkofpJCJV8PmbeiB69Q=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB6219.eurprd08.prod.outlook.com (2603:10a6:10:20d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 11:44:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 11:44:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] gcc: make include poisoning fatal again in
 gcc/g++
Thread-Topic: [OE-core] [PATCH 2/2] gcc: make include poisoning fatal again in
 gcc/g++
Thread-Index: AQHbbDGUAwUrE4MNUk++4kDp5kXFgbMinxeAgAAOU4A=
Date: Wed, 22 Jan 2025 11:44:00 +0000
Message-ID: <588716E0-0D1B-4EC7-A569-67ADAA618C97@arm.com>
References: <20250121182309.904188-1-ross.burton@arm.com>
 <20250121182309.904188-2-ross.burton@arm.com>
 <42001d9fd5d7ef3f115e47315cf0c711bf35c6d3.camel@linuxfoundation.org>
In-Reply-To: 
 <42001d9fd5d7ef3f115e47315cf0c711bf35c6d3.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB6219:EE_|AM4PEPF00027A68:EE_|AS1PR08MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aec4b26-aacb-473f-cff7-08dd3ada15d7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?hCGup8ggehq9WR3yOc7RZ/rFo7QzX2IRvJ8S3y8NW5rfDrD1h42RK/QB7WLp?=
 =?us-ascii?Q?+U/h64cArbCQLy+GNwxG3G+UHOaiy7dOunXwAsfPbHlvZ38Vjlt94Ad0AMDo?=
 =?us-ascii?Q?wnetce+idATThMY/fMDCbVHe4aYGXfsdfDYMIHnEv/IuwG9xmr8TPgMLVf55?=
 =?us-ascii?Q?RAb7YSqA+5bqJV2XWKQdMTyDejYKOhYbq6ZnKjls6I6i1+9dlTU5ICa/XeC1?=
 =?us-ascii?Q?UAN3oYf0zw5sXUn+7f4K68i4t3wpywTeguLvEhcUYtas/El3dP/nf99m4B7G?=
 =?us-ascii?Q?/T7m7GXBd1TChAdAJCHqr8p8r54Jp7O6BBTzpzb16NvSYkaKT3JTolHaR4GN?=
 =?us-ascii?Q?T5E7G8957Cu14LV7u4+kaYqCZNsmFhu9Dr4VNd+cTNIiptdD1mWQ1jBivhxd?=
 =?us-ascii?Q?BAjoyFMKXUBj4Fj3e/V7irUyWHOOan/85/jfsYJoVL/sykP+KtyVU2Eh6jAN?=
 =?us-ascii?Q?dV/BOrXoK1X5urezgjjkX1EmeBRmRaLi2N3aNJDY/auuhUGcHZo9a4M5QC69?=
 =?us-ascii?Q?Z/OMBJCvj416jcrL4NK1RscUMiXBG5Fp4GDQDSZHc1aAoaj+r48b6dvN6zjJ?=
 =?us-ascii?Q?dxtTOxGzbDsv8/P//2ro7czxZcgw2nUgJDsLp9e9dJCipewcPn72YjxF7xVb?=
 =?us-ascii?Q?zcTmlK3UunRuiiMJHeqgyzVOJnyMToSgZTVqnjy0xFowHcm3YxWGL8jqvDwv?=
 =?us-ascii?Q?YTFejh2tG5GnH9adOVFPjIMmJp7iBAlVM+v0kuarDJZAysXZsCKl8+dKrPVo?=
 =?us-ascii?Q?E/GhpNGJO6kfiEQ6PztXTPT83HDojvv8+tFHHQ3r+BlTrQagi4hH8V2lMxlc?=
 =?us-ascii?Q?+trDctaVpo6Hkxsq85UnFm+WIE+npByonDwQznhxq4uBhy0QjC2Y0T0GUaqF?=
 =?us-ascii?Q?X228outuemiO+XQ5lgDktj8hgZl6mGq7P+bbkViNoostL15sme2l/H2vSGQ+?=
 =?us-ascii?Q?rIXr9xwKqSoO1LcqWx8+DumE20wX8MAod22Bb7JrUAG6eACBxdW2HjMXas6T?=
 =?us-ascii?Q?fgohc7xBvCYdX0WdVtpdxAWMuREFd/QBNAxS0MyRKO9YdiHMFK9+hucN1289?=
 =?us-ascii?Q?aRtgnEaaLSQKwFDiNcMdcYBf70ZiDSxFIgZWrT58HHS+sx9HAqRi1TMWzhvI?=
 =?us-ascii?Q?QPWmZ7JCvwCOeFtf/1dk0Sa+YI24L+y8PT0aBbP7tDgP+ZtbwK1ae1yXv9XH?=
 =?us-ascii?Q?DwqOqhys9uYWvo2pWLl9gM45FK2drSHZcRh3M6fG4DSwnSsCe/5Mk2RVSwCS?=
 =?us-ascii?Q?1jXHCJiKuYSFAM3ybiy+gBpB8ehMGo6xb6w0zcfX9788tP9WSjLzR18YdlFO?=
 =?us-ascii?Q?82I+L72SLpERtBChawzEYt502dEtizcyEb5rVdBNx3VXsRhrAJ6OIPqn0dbe?=
 =?us-ascii?Q?wWS8GbjoEAp4mjIUqY3jI4kjw8Ok1CcdGg3Zgik6Upd4xTrOQqUs20YBDH5A?=
 =?us-ascii?Q?OTTLAWEC4VIIka3oy3xGuYsRUPdjQszz?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <009F012370D924419FDB5E3AD470A925@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6219
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1270fd85-bc17-41f7-ee1b-08dd3ada1027
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|35042699022|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3jLpkQu5GEuHvoKA8uro6LkjfYnGxYSdNRjHUmOYHhhjHxTVQB2yrtaxgDij?=
 =?us-ascii?Q?QHuCajgXiCZS+tR8du+5P+SCjdf0A00+zKpxbgITgDaqHj/okq9VPqeuYWaA?=
 =?us-ascii?Q?ac2cdLufh8mHaD3bW2n8se4GRL+PpuS2bnxBGSNBe8WBjjZ7sm+Aawpb30F9?=
 =?us-ascii?Q?v0sX8U0WpPDEOl6Dw/JUWsQb0BDzMwgxk9SJK6eqY4gehzRaRGlS2FG+QVT7?=
 =?us-ascii?Q?ZUOfLbPqyi7FkNDMOSeVtrYTZ3WCE932peRUgR5tDCLP7xEZ2cOugAD1XujY?=
 =?us-ascii?Q?dfnTI1XX30DYwAHZ2D8hs6u7N4aSvZKeR1UmcoI2wOBl/AOr1ySbJEMYCvOL?=
 =?us-ascii?Q?5OZEbS6xm3gY/WyzdiiQnlVmiGJwFCCuNahsQ418XML2YrHqIn2QPEr37Mcf?=
 =?us-ascii?Q?VFyCtpgOAO0h9kPLet6H/vqZz2nUjl6X4ieR/eF6/wv+1qJCF/fVZ/4cmVJs?=
 =?us-ascii?Q?4tNZ9A0itwgHYCoKznaU1kfvh/JWIYQbekxD+K6yI4CSgxP025X4KCY4oMvd?=
 =?us-ascii?Q?LnOvp8B7A5EU8QufPsBw1jargPWazcNcr3r0LgYha2GCS+yrzErrKKYZHCcI?=
 =?us-ascii?Q?UjEZwPg09xkScXwxeNrjtobYhNrmSz7Ef0yzTPLedh1XPsyBPFUMDRy7Hh8z?=
 =?us-ascii?Q?gjO+JjjcZFHLmtArDs8gCicZt4MqqkBPmqbwWGxfk3i8CeQ9ASdQrWyjYywv?=
 =?us-ascii?Q?VL9cD0MvnaXNeSS2bbEP64QlkfvJXX+V4OFImjlSvileKTsgmu8yIyD+etV4?=
 =?us-ascii?Q?rzDdcyoi9m6wTeqf04Bu/mMXbZzPL0r9K2lqW0QqNFlLmQ0KLVzvQ7zALclL?=
 =?us-ascii?Q?0TvIV3SB43lt22IXFv296ekrC3UNC1xgX9qaokf/xkykS5lWADRifI8K3W73?=
 =?us-ascii?Q?mBAssGFz0Je6Jv1zBiazQ/nxZuwicVg7+9/c8prjeraQOh7iOROqfhke6PPR?=
 =?us-ascii?Q?6iGbEoMtQuoo+89dANSosVIIFrgHF3YYOjvZuw0sbP/MIU2HA3r/cuzjwnfR?=
 =?us-ascii?Q?e5/48ypIgbh0BiHK+41GQXKa9U01T6M48X1WwWpcSLoRdPnEdHLOeGEVeIrM?=
 =?us-ascii?Q?5L8L4tzskf34D6Ym/BNLyKzkABrlKXVbFOoR0lw8Wk2yNe0cVyWKVCiDhCfE?=
 =?us-ascii?Q?fkAiyx/PrXkVfyd3b0gXjAHWrEylGvHeI3ZOcwrkgEFBSNHUS0tNkLgF/Qar?=
 =?us-ascii?Q?GdPrwCrbbpeuRpGJRiB/PIng1I1DjIlEI1qr0fermShFoJtSQ3Y7tbGojXbZ?=
 =?us-ascii?Q?hnLTPtpsM+UHxkHKQMPpQP2oV4EtPAFfXfWjC/0574bCkE8ECUVPXifj6zK0?=
 =?us-ascii?Q?O3mvWYURsJ7TN6cjYiEx7yy6+f/TdlIpf2j1xf0KHIU0NZDTWcP8XoRU/R2D?=
 =?us-ascii?Q?MY+ZHiu/W+hldhgtpF5+ZmXsnjhpWL7yy4bOba2i13Dxu0IFqeO+Rr028/Jb?=
 =?us-ascii?Q?QfNnp5r+nlzQYc6g0xCvB71T7MiBhXlKf2oa3SU3iXxRfCIEGMjye0XlzrXN?=
 =?us-ascii?Q?Bo0tYvYsOSRu/rE=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(35042699022)(1800799024)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 11:44:09.9756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aec4b26-aacb-473f-cff7-08dd3ada15d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7635
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 11:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210147

On 22 Jan 2025, at 10:52, Richard Purdie <richard.purdie@linuxfoundation.or=
g> wrote:
> I think this needs to be:
>=20
> +#ifdef POISON_BY_DEFAULT
> +#define POISON_IS_ERROR " -Werror=3Dpoison-system-directories"
> +#else
> +#define POISON_IS_ERROR
> +#endif
>=20
> otherwwise POISON_IS_ERROR is undefined and leads to failures building
> target gcc and gcc-cross-canadian. Fixup in -next I can squash in if
> you agree.

Please do. Apologies, my C is rustier than I thought. :(

Ross=

