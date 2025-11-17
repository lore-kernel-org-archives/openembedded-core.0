Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6DDCEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 17:33:15 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15444.1763400781796831592
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 09:33:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FykBnnxx;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FykBnnxx;
 spf=temperror, err=temporary DNS error (domain: arm.com, ip: 52.101.69.38, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tAJlOKagdl4dp+SMlKcHO808KK+17RuQjGrkNukVkboHwGpo9WlNpv9NJeWSs0UsOe9niliL2fW11CJdS0XCdIF9FSPPs70Y3vrSgROuC7Iw0wgnCQEMOguGYPyhYaFxIkDjmrHKa+VUNFZwgQW5zj9nIWG2oul3Bdo/hhoRxBY13zRHmvzZiFCFKGBQNx6YJD7V4szQF4BjjM4KY22QvsXhx0EMrhlZytoZ2wmhGxWRBAxZ7br7IVP5Zrh3O684uK/+Yu2AXYZjA2scBrHZdnHFDbhW+he2/+y27QsqFxHL2CGX9N3Hx08+uytIAlEQpE6Sd5Gsqna6+7ppb0i4fg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMDUUHsrefGtbffVRU/rHzaaK/BoIWDuPl65MIZcnsg=;
 b=afL5OJn4skHCMK51811zQD8e35ftSSIQp7Ctpziqk1W7gXC47oxPILRXb6tbqbYAW3sJSFEnFaFGCNNQtj+vi6ECWZRfhCUqDxz3PTR7HW5XFMxTio+7IWKVWknE3DnPOpFlhepkxU5sTgH8nlUQRBIVZgGVv2tSNiSnk2OD5xKxswhNdZr2nr0tF8Sr9zKsuns8sobp6E9K1SDMnM/iWIlvTkrrqNmx9UlaAILJ+0NAI2+tl3Fou9a3WVgxw73jVhd3IHuuO6vVvLmSK09lbJZJBrIGDm8DPDb+WVPYRhlhuLINtP5bKDkvoc9SLIJTNLRMHM8SipVEzgUoLV+5ow==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMDUUHsrefGtbffVRU/rHzaaK/BoIWDuPl65MIZcnsg=;
 b=FykBnnxxozha0W0bxUFXIxK/edd5jFVR1d8/ESK8En/YMc3Ln1GWwASveT4ZiIEkzxXIyEeJ8zPYVvPjRUdkna/B+Rae1iHHnHm/QZ0o6IJf2pmePXCLjd64fVvteTxMRe4vZF//xkMcpCUQlHi1EW4cPhSmrAPADpKcfbzxKoY=
Received: from AS4P190CA0045.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::16)
 by AS2PR08MB8361.eurprd08.prod.outlook.com (2603:10a6:20b:544::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 17:32:52 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::4a) by AS4P190CA0045.outlook.office365.com
 (2603:10a6:20b:5d1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 17:32:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Mon, 17 Nov 2025 17:32:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZTANu9CORCYnQXslVbPdc7wZOJwJ7qWWUIZYXTo7JDUfiHU3rCtZKHhaver594xfYmlsOl6wMQM2CrIR07FcyHfi11M0lBkgF1e1TjR9J7VYaY5pkHBA47K8RmSaljLKgRrlAjVO7TuHLdIrck+uEqArFfWKm4BSf2ofKB//ywUfp3PCumwkW2/jGWM7UtIvbGKpShEkDagBcAKVqRNALhAr1idL0ZOcCruzAy6gLmoSHHzEyJwynWa7XYRSlgcfqs+mKCXcUS+KZcEZkgBPS2lM3CfM09YeIyHLZym+C0AAmbjkZeATvh9v8Ow4hCzNSTMm92lKQg8nOGRJ3yjFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMDUUHsrefGtbffVRU/rHzaaK/BoIWDuPl65MIZcnsg=;
 b=nVgmEFoy6gxDqaWh2CHSKvmVuFV/mNMSkwi3cB3fZM09C+rQfjspkYT4VXbBBx8LOqu7KykQv8rr6WH+vIUn24VMywrp7i/O6YuGsSmmA/Wx0DUnhuQMdranPPu9u4wLYDVd11VWJ0fziV0REPHdxaehvgEDkWnaVczw+3bJlUpmwkYWXL0Gl5xdggKUotp8GAJ4or+X0lY92oL9Bn78NjOrFLUsmCtm9rZyVoySuFS0VGpfXkFO2sLbc+10f8K9nmGamqFMY9D6qmfz7OrALVWnbr4INfOhMQiodi3oNsFpQRSEhDblKZVkEPRgXZgUOvP1c23xy5uvJSSHuYDfkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMDUUHsrefGtbffVRU/rHzaaK/BoIWDuPl65MIZcnsg=;
 b=FykBnnxxozha0W0bxUFXIxK/edd5jFVR1d8/ESK8En/YMc3Ln1GWwASveT4ZiIEkzxXIyEeJ8zPYVvPjRUdkna/B+Rae1iHHnHm/QZ0o6IJf2pmePXCLjd64fVvteTxMRe4vZF//xkMcpCUQlHi1EW4cPhSmrAPADpKcfbzxKoY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB10834.eurprd08.prod.outlook.com (2603:10a6:150:150::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 17:32:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 17:32:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [AUH] nasm: upgrading to 3.01 FAILED
Thread-Topic: [OE-core] [AUH] nasm: upgrading to 3.01 FAILED
Thread-Index: AQHcVk9At52JEuRoUUCqEdTrowBE1bT3I5EA
Date: Mon, 17 Nov 2025 17:32:16 +0000
Message-ID: <B65A887C-3297-4262-94DE-232FA1C396F4@arm.com>
References: 
 <0101019a88621386-99534d34-9ca8-423f-9c7a-5e49665a5307-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101019a88621386-99534d34-9ca8-423f-9c7a-5e49665a5307-000000@us-west-2.amazonses.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB10834:EE_|AM3PEPF0000A78E:EE_|AS2PR08MB8361:EE_
X-MS-Office365-Filtering-Correlation-Id: c254986b-4542-494e-4a00-08de25ff55b4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?6H5a3sy5Qmdom8DM1ndb02mYN45D/geqzrHcdpPF8Sm6RF+zwgYquC5UizE5?=
 =?us-ascii?Q?7n4WoS+BGjleSwwPLAH15BhIPAqIBuXhScOXT9KEIOrgH6Js0ZbYYL3Ka5Ga?=
 =?us-ascii?Q?NZ+Et0PpP66EqzQcF+lo+dSJLxHra9lzoVUvlM5ihjjlnpZXonxx4DQciT2k?=
 =?us-ascii?Q?TWnpjOl0VfmR/P+mytQsjVPI1NTEuXN4LOuKQMD5CiX5mW47RdRJ5LEPku9c?=
 =?us-ascii?Q?rDfewCPFo+bR9mKh7HJhj04yhtmchC0PmMI4hwFuqwcyZYZdWNq8P3LYR+4n?=
 =?us-ascii?Q?Os4obyaP1D4yxUrCHnUVBcof2aMzLTmltTvg6re6V9DIJZ+9qHz4NAA+6Oga?=
 =?us-ascii?Q?3hV7UizX3lL27iyUleh8UOkYD5GjrmjqS/l9HvrG4NXjC3ZZI9m6T6wYhntg?=
 =?us-ascii?Q?dH22OP4n7hXw28MSqdnyJLls4JMEqNbWEsmma4k22Gqm6oZy2RgfoaVtdx6/?=
 =?us-ascii?Q?NRQUHImG/KMR2qk1nLmMwzF6CtwB3cuM7pgDnIod+Kcl0J3En9pOrOUtP1Gm?=
 =?us-ascii?Q?fZ3cjfWjU8YUM3QZpB/BV/eEs+jdRE0H0n4os15mQbRSF1YOtVi9I5eVfC81?=
 =?us-ascii?Q?H9libMpwl5vNqnG3VeJlFzpiwqiPlgkYBAQ1aTWOsaTFSyGXsXQ9FCjOlGxY?=
 =?us-ascii?Q?S2a/hTF9O3Gqq0oDakt+X4LtFYp9qtfUFsYYQMlFYaCZCATrYJW0n0cA7IQm?=
 =?us-ascii?Q?NcBgXAxGbP+X78u3CvByZjJ0JE1FpFUsl2SkbCSbsic/PlY85UXEO/o+KQAI?=
 =?us-ascii?Q?HWCkftVi3sjf5Zja6TBVTwWJVHnDQ6gWRC6fiKzXp8eZYEn+Oz4euGUFFO95?=
 =?us-ascii?Q?3kXkUiTSIfl8w8pSH9RZYkHRo5fG9NoaZRDoHW1JG6LSfNQKZQJakPicUSnY?=
 =?us-ascii?Q?ShJ2CC1hczEJ5O6Hh/kljN6/kUJEBd3nruNFO6gm7qtIWAO0p/Gef4fC2pxj?=
 =?us-ascii?Q?DcHEiML+1ur+7GH5K+BRA7fPK1RP+DMFZNgsbqnCgeKvps+WciNoNd7yR6r2?=
 =?us-ascii?Q?+7W9c3orfTO+TxaonHEedgmzavzKWbgCnaemXaEQh5Ci25AQCVK1asEibZHH?=
 =?us-ascii?Q?v1QwaM8FOskuQxLjwqCXnFBhJ6kjz/5fqGc0OELf1SlRVDs5ql9JeGV8TjLI?=
 =?us-ascii?Q?CW0gy3su0pOwBxG3X//KA18HZMpKg/ncUfHuQQSlbWB8aznrFOMXL3CW34w3?=
 =?us-ascii?Q?AGvCqUVrtrg+z6aPctmvPnOmdHALRxi2cz1246WxtNf102edQ3j2Bpf0X8yA?=
 =?us-ascii?Q?jb5qvFcVQQWKoEyJTxTxYabAlVTeaIeLU6OvGnSIjGWI2Etupe1BO6VxYiGu?=
 =?us-ascii?Q?W1bQFj8ZLI6xmnUmWM4m/dtDJWd3Z+y8bQWKs4SY7t+m/kCtGdt7xORNHsK0?=
 =?us-ascii?Q?rOD6GSQk3o4wVA4S7Eyofq8KP8XE+o8jWo7W4wyC7rIw6zrWtfuYKa8/ySIm?=
 =?us-ascii?Q?N0CyvVpQHNGpDZ7XX6sgLpyN+OdZ7gRQvl1o14TPz0XF2OT+LOH/82436E16?=
 =?us-ascii?Q?8u2lj8e1ZJfEtsdJXdrM6IlKftux5xpCkkcN?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <855F258455237A43BF6B12A3EE957E61@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10834
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	18e6af3b-de47-474a-465e-08de25ff410e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|36860700013|14060799003|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GG0yi0sQFugsJk+6v1vP3rRi8+BXJpSB+aljVxCZ//4jwezqbC25dcsRhhdG?=
 =?us-ascii?Q?wStXrnyuoAoRPIA/3HNDkPxvd9H9+6QM/VAVat25K1+ce90JaOXEDfKUSyen?=
 =?us-ascii?Q?6FPJaTtCYcOibaGzQ41MzHqquem1ikgy3eGY6SBqQFG40j9jEg4pZeZ+HzYy?=
 =?us-ascii?Q?9vFYe/rV6QhiJI2PVKB8wmVKyuhPstvIhqvEhXkybUYiQcUiktbkf2LyZv76?=
 =?us-ascii?Q?Zw1zS+BdY9fXje4Dd4gr8fDx6VJL/2UJ8vQ+HCqwmw0for32G94LxaLzYiiB?=
 =?us-ascii?Q?4L6lRJCSjLva0l7yeJI6d8ifbHVkj8KrtPW9hzQhGab2H1v7f0bdoJJ22Uty?=
 =?us-ascii?Q?W4mLENf+ao3p8BJmab5uEocR5ZHY7W/076eRMxkH9MgkLNbf0FUk7iKOHMEO?=
 =?us-ascii?Q?qEECsXinSlxr+EwtUyks1u7Fw0AidlaCW1mrwPUmr/IvY2MKcck9qzwfXsQT?=
 =?us-ascii?Q?o24DpdkJYpME3yqxOVfYM89qv/IiseQ6CORmc3j0S/K0DOBDkkoqcxns1z/f?=
 =?us-ascii?Q?kasB2zt+FjNMrVXphgryhXxC4llSGmv3t83ss/MQqsirprbeXZlj2tNq8BSL?=
 =?us-ascii?Q?tb3x63mEuJrBrWVK/M1aMRh6fo0ZurXA2PYsRgoDfUrAxVBaamgJ1AKqX1VR?=
 =?us-ascii?Q?NBdF6dE3UmYWtK61TP8dkETgljIdXHYF11EPdktWrwnujMrcFp7GmRdo9n4P?=
 =?us-ascii?Q?jJHEoeIMBcjSepa63Gn+9wjoYdu2f3Dy3F7pbuGBHdmuwT+XQYOR3kW570Ag?=
 =?us-ascii?Q?eCav+yI/xPLdYg+jdC+y8l+oqsYCNUEDwAPnUYuc4OZ1jaajPmk8D04rlwBF?=
 =?us-ascii?Q?RVw6Q1zYpuhWWzR6iWf/lqyBG8A4L9s0F/3evml8PGQZLyfVA2pXEUCIKChp?=
 =?us-ascii?Q?9DWJU8ItAXKHEtZ9pMBma77kn3s/XO+93ct/mvfaWakcp51br7TP+ohfrfjy?=
 =?us-ascii?Q?o6VRB0j1uA1SZYHo0pXaHeXnguVuYdSU3C6jY4p6bPZZxZ6hTzA+eRMsWhLq?=
 =?us-ascii?Q?COWYDtbWXByglWNbPlF2mFywXV4NaP+pCJWAuAxpdPz3PQ0nMvirtzm8Jvfi?=
 =?us-ascii?Q?hTNc2b5o0yC92VfkZoRYsMf6iytxhvLoVjpyN15oP1mzrT7a31/EGhcTpbVA?=
 =?us-ascii?Q?6GTgkOlOd3NWf3ljb7wDT8O1ggMvo+uYvnS3UVQQGAt2DzAehtGr+rWLkock?=
 =?us-ascii?Q?OwFhrs88R7hFuiRT7IRCtJ0mpVHTsLL1hqMI3rk0bn8FxJDteF4eIPwLiOBu?=
 =?us-ascii?Q?DDnTApKCayKXAIlhqk+gXSoxWMGzBAf/rpzVxLzlgpFPk9bR85j/Xv86n8Rn?=
 =?us-ascii?Q?tWfID5SrLqEKGnkMBsssH/EfbE4QqFRJQoSnwuaslv61VcwiDGH3guDrWCgJ?=
 =?us-ascii?Q?KWOU4xN0KKen1XRWabV7lBbEWf5xaEvqi6oFxxcgX1/DchJUJdZRnMfRe+bd?=
 =?us-ascii?Q?7cnUz8Z/gTfgLibILQHjyJwCgRw7szanm6G98Edb8EIB0XG++by9tzCB59CV?=
 =?us-ascii?Q?pDdlP5AA9RyUnWAfi7mDYlMe4WYz7BueLfB7V7hEj+EsW5JlXRTwvK5OJJHs?=
 =?us-ascii?Q?ETO2fgP1XZeEFV4ULLk=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(36860700013)(14060799003)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 17:32:51.7581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c254986b-4542-494e-4a00-08de25ff55b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8361
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 17:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226506

On 15 Nov 2025, at 16:38, Auto Upgrade Helper via lists.openembedded.org <a=
uh=3Dyoctoproject.org@lists.openembedded.org> wrote:
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *nasm* to *3.01* has =
Failed (devtool error).

I had a quick look at this, and the patches that we carry are still needed =
for reproducible builds.

Upstream is moving to GitHub so I filed a new ticket (https://github.com/ne=
twide-assembler/nasm/issues/173) but someone rebasing our patches to 3.01 w=
ould be much appreciated.

Ross=

