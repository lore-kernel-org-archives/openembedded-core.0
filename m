Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A383CCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 12:17:12 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.19])
 by mx.groups.io with SMTP id smtpd.web10.18691.1761221828607115864
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 05:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LrJKoZUp;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LrJKoZUp;
 spf=pass (domain: arm.com, ip: 52.101.69.19, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vM1BX9sPncjpxkylyqVixjCDgZM0gkkWsA356XeMlqPRag5viqhtfeUfZLYYE/m+lXzERCcWs66gIFrnczBHKpqJF3jLdnepYSw/hwCFVJrSQ5RjeUg8xSAD/wAzwrVGEkV/bVZcjzc6SKa8pHAKoompnocaZnp5pssyvlbpr9mTEhGZXJXfO9aUP4LDfUzd3MK6n+iZ/J4JbmgmiAolw+1SOXpvsAflyRBzKC331DpfkiYFesuoQkddD+VN/Oral067T5TQ0iuD4YSrx91aCwYiKu88P3ahqZs/lv2xIXMrsdg7DC6xQeByRHB9PCLhT84gnF+gzLndYPBFhNqn/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+qHIaCJ0ou/uG2rbeXFPcxL8Mf6x8/tvWcvZ+PzgIE=;
 b=XrqvPaS+weBGa46hZj+jgRq6Y/pJm5ZIxcUkElAMW1gvC/oVVUPkuNDcR0jvnnAeMGCswKDgVh8zAnBMDGgT5+W81UhTH68ifsbhE2wj7m0bKFKs6UBkkjfH9z9wm0OPpUHPmb99ifGKlebd5iy+hR/B9UekHuRO/4stAi054jEOrASmPNTwrJJHkQipLF2af6zRk0zeerUa7ZgqcUoq6QIOiR7kYWjUis34Vttm2VivvTGFFPbvX0frOt7yuWq1bSE4kZLK1wcETrmdaFm6n5B3DaS5NogrPcVgBQ1xZC/y2LJT8EKFBtPhl/EWqZz/rEl/VGs9KgL6j5rsfIdtdg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+qHIaCJ0ou/uG2rbeXFPcxL8Mf6x8/tvWcvZ+PzgIE=;
 b=LrJKoZUpiNLusNCc80v7m72/yd+pg87qXYR0TYhyLRpvqHJVqIHyub/6PhQ/fEAzvmP9G+DbbQPsHEfdxo9g+mVceG41bAKp1nEkUo5iqLNRwjCMNFGfN3ivk28uigiHvcDlR0xDR0pDEv+qkHY39+jMtGwhvjfc00Fz7ZZzxFQ=
Received: from DUZPR01CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::15) by DU0PR08MB7811.eurprd08.prod.outlook.com
 (2603:10a6:10:3b5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 12:17:03 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::a0) by DUZPR01CA0051.outlook.office365.com
 (2603:10a6:10:469::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 12:17:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Thu, 23 Oct 2025 12:17:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f74pD6Ee/CNfRtZZt3hsaLywvVJTjJ0ua1ffQrPyL8g4/Ba/Zt8QQcWmnF1zjcHeZDLhiXbhMxTPAzG+Kn1QtaV1cXgKYv4H/VgXbhEu8TYXa5cSHaThUBSso9YmX+p8yZVOodcH94ancVtvtDUefBLozCtu+cXljfShMbJXNzJbRMyfpWJNIJk2Zuy7+NnG4YzN3k8x2PLvb8ZfdbACgDYsHW7SLEeEJMBqPAX4IMmtSFbulmK88g51xb1fYQbWVy3GwOC5hYHv2lUI5PR/vOwSldlw8lLU8Jj0wexHboXEXGkIYgIHVLTmSZCuSA/Q+G0IqznqM62ewSIUfDOyXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+qHIaCJ0ou/uG2rbeXFPcxL8Mf6x8/tvWcvZ+PzgIE=;
 b=vfjDy2uRBMxhNx6Oyj3r5qyytkAdKo4bMnBuP/0esRIWhGRd91TJ1o+GOjHvlC2LVo3LDKkq+yv3M2FxF3E7QRkFh8mHGtLmEK1EJ8erudrWmj25n1IyMupffEpnmmTWwqabyDrI41peJaJkcsmlC8CourO/xg6LYbiQARDh91LYhAGWZpq2Z3Et7sHFivunrrFIicM6Gf/Vs5daslBfyBGJfhA14ZhYq8OdRJX28GgYYh3dQY0HAXCiTrknTpuKQAV0Wc6v07MnOtEnG2t254jXV2OnStAi0a7WH7hM08PvKY1mWMSwQ7xZ+e5DaYouBIBzewBAgK1BvCmhzij6LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+qHIaCJ0ou/uG2rbeXFPcxL8Mf6x8/tvWcvZ+PzgIE=;
 b=LrJKoZUpiNLusNCc80v7m72/yd+pg87qXYR0TYhyLRpvqHJVqIHyub/6PhQ/fEAzvmP9G+DbbQPsHEfdxo9g+mVceG41bAKp1nEkUo5iqLNRwjCMNFGfN3ivk28uigiHvcDlR0xDR0pDEv+qkHY39+jMtGwhvjfc00Fz7ZZzxFQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8878.eurprd08.prod.outlook.com (2603:10a6:20b:5f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 12:16:28 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 12:16:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/5] pkgconfig: Always use gcc for native
 compiler
Thread-Topic: [OE-core] [PATCH 4/5] pkgconfig: Always use gcc for native
 compiler
Thread-Index: AQHcQxH7Nm/qSKj1EEGTTgST7deaNrTPp4cA
Date: Thu, 23 Oct 2025 12:16:28 +0000
Message-ID: <7220B7D5-A1C4-4677-A22B-68BBA3621700@arm.com>
References: <20251022050810.1572184-1-raj.khem@gmail.com>
 <20251022050810.1572184-4-raj.khem@gmail.com>
In-Reply-To: <20251022050810.1572184-4-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8878:EE_|DB5PEPF00014B8F:EE_|DU0PR08MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: ae2f2cbe-588c-49bd-e33d-08de122e12b9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?9ObwV2aolBvS7mdZFm0/UtD+AY0jfhAP3a33493nk+lWRl5wz1kFjkzH5Abf?=
 =?us-ascii?Q?WcGak7fzLBpXSXPvMUMfSNrbETKhhZ19AT3erNe80EC6ch4HUuI4MyQ7v5xu?=
 =?us-ascii?Q?NMgvZcJmUpLfP5eKrS+CuyLVMMeFqN+yhLfirJ333s0lWXhQCH5Dbhz5ZEqr?=
 =?us-ascii?Q?tg3iW/fZOMvjpzeQ7JWidGI9EjsvHiVxMm0/k22mBvCpOLqccFB9Oz5fFrjU?=
 =?us-ascii?Q?IFAmSFviLEWU4SJO6V7soDyprYd19/7rxkzbYGZFwiuo3zIPgRQPV4yftTZm?=
 =?us-ascii?Q?hg0J246OokvjnrQkaPqbZdm8JR6fXN3FFjjft1+uoe4T61HTz+IgKwHkQLEh?=
 =?us-ascii?Q?n7s6KW0KSBO2UfSJAJSSQy0HU92Mq0ymCyOIlKQ1L97kiM9QYPtC2sMnNxYa?=
 =?us-ascii?Q?GmbohUNNyUSTt+e4rVU/rh9AV7pHP0inWsNwuJto/pUQq216vZc3zGyWvd1b?=
 =?us-ascii?Q?pZ5GHaTXS24WthHdqa0SXTYvevwQQqEpVH/AwSn2oYTivKo1fFoukPbFBXJL?=
 =?us-ascii?Q?+TICEDVK+uerrIZxSJ7CoQ7vAyGZWvjVVgfX75jUW/qine+a882K+q5Aq+wt?=
 =?us-ascii?Q?fdXVpwwfBTnwLxHEssOwVOlxzfGCHhIdrtQS0m+kQ1CFXVkdDkCxgppJTvZz?=
 =?us-ascii?Q?Lp/WCV/MeeWWBOnNAqqLrICOqBv6HynmtmpTz3hDl0yZxhtB6uHbs8aAp8+R?=
 =?us-ascii?Q?DBDyhQvHMY+XwQM/w7LuoKLkMn1xDPqdXYE9Wn0clDUl3JOjHql+ICvb3PPs?=
 =?us-ascii?Q?EUEY4FPgTa4XTiHZG8s6wnrhrlYfRe0Ei1bXNPoIO62RyRqYSkzYsk3io9uO?=
 =?us-ascii?Q?ykiC4qI/pX4LHdDaNcTyf8CBLnPlJwFJaWvBklM4DhDiHZBkdXs67R/o1W81?=
 =?us-ascii?Q?0Bxg/Db3dCp+yiv1QUCQA2sSBFaRNA82+m24YwbK7KmKL1UecbJtNm+WIb2W?=
 =?us-ascii?Q?FZNt1/jMfhUsPi1ghgK/orYLcJUvIMWaV5Ueso2zbgcH5IWgkr4cAtgOuHpo?=
 =?us-ascii?Q?SbxQzSCKsA7iF9JKglplK1ZQ9iSfJvMlFm5wOLW2KJZdLgwuYof+a2pJh5RD?=
 =?us-ascii?Q?FraXnM1FZ9muls4jPKq3mfgj9udea/1kgB7ATWeYlJ+oTRJxamEsyEY6WayH?=
 =?us-ascii?Q?o7RqaUtmnLTMR0eQj+Qz0NyIlKilAtpjf57CjQ+NNqyWWklRFcI1wfzV9zXD?=
 =?us-ascii?Q?GjqGRE6IPsZPh97/QHHDnjSGarxzIdWCFn51lXs/MJ91+1a1iUpqDnJHgiTh?=
 =?us-ascii?Q?ZLemXBH1gNfxm69SsgfVwUDXb2PTAVLTiP4T0ez8JDDpM+x2PRPjG8bcEvaH?=
 =?us-ascii?Q?/LUaJf99hK86/9K735HkGI5glpOHLEuO5LTNDbYfNskHa28BR9RE9JwBSrhU?=
 =?us-ascii?Q?6hClSdH/XROt99i0SAFrVEPwTCtWQbS2HflVwJL2gK6CT33p7kWJUOuNhpVk?=
 =?us-ascii?Q?HsX7kwAEtDt3kCm9T5sBf0cHKYz7wUYAzIbW8yvuEeQQAKXr0Xhva71uKhSq?=
 =?us-ascii?Q?vP2fnSw5BqjoHPUuANmvM05FIo5faW2YcsO+?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4660363D83AA1F46B05F43544F5C5CA9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8878
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	51386cff-9c0a-4e0a-f6ee-08de122dfe81
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|1800799024|82310400026|35042699022|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IjD/Sjf1DdkzmqkR8b1/OzuwQkRK9EG+O+9XUyCJDCIh6dzkJuSPPpMUpHMj?=
 =?us-ascii?Q?pB4XyABZ/jVtMv06LHdMLnt13FUpdd6eiWvLGjoHVFsYdei9qHE1TpwhW02b?=
 =?us-ascii?Q?O1NDxH647vujY+TvF47ZSD1sTv1pGyc7yMprrQJC8C2R4UpKHoRh5YcjyADa?=
 =?us-ascii?Q?/uWEFl74HAcUNoGrClZwEaPuwjKYJpMZYjQZO+j3Nv5I85hZhbJolBoast6f?=
 =?us-ascii?Q?WeGnpd6lBoagwTKKx/e4N2+X4WMXdY7JJDy9DpTU7kBdliiBpbzYLKm2CkiD?=
 =?us-ascii?Q?7jWm4izEHRXNn5Br7auDLqAXjxrPqRnyzmHHGifUmc2tsyZ7EaWFVsDzQXhf?=
 =?us-ascii?Q?BQ+qimO6vDpAPwFjQcj9nMb/xkqDcy/Q+mQCNrltA4JTljANLmj8UNkIykcD?=
 =?us-ascii?Q?VQEvcnBugJN8WvdatgUZMIpYeEhRo66L9fUt18/AQkOsqnxoWq9vHfehotZ0?=
 =?us-ascii?Q?uLdSTYjo3an9sEjnbmclpokzCZ8k/8g1aQFTydtRqeTnNXLUTaaMVNuIJw7H?=
 =?us-ascii?Q?XOo3+Uk107SVVlV4VA3fcllpaW5VC2kF6OoPS4d5C7ILKad1HPwwAAL/lPRn?=
 =?us-ascii?Q?YObYYkbdWpTbmBsNzEaoglaXboX+Ld1aIF/J4VjexBsRbHfT+AyNtSdXqLTx?=
 =?us-ascii?Q?YADT6QJBSJBZ03vvLtkS8RX+s++xF8o0fkiebha3IcBDQd1u0i0mAHjcjkzb?=
 =?us-ascii?Q?jVECHRk0S7WUcajICNC0DquPH7GxeAsNrGbWO754zPZD7eRyDguPQ5pI37Lz?=
 =?us-ascii?Q?uNI1M00737NlpFx+ROfd9Vj/tskKkBNqoLBOZvw/6wMv5dOJIZV8Jpkd27aF?=
 =?us-ascii?Q?JusuwEC0dYEtN1sTxJCjQwoburVX/reRaCmigJKLyEZF03k5wR6EaWbYSRN6?=
 =?us-ascii?Q?c8ho1tK8nwqOUosVG9awIGQ89N+gfnUxi9wHvifNs4GvRuvVulOznwzAQ1v5?=
 =?us-ascii?Q?9p22grant6EeQR4TcJRJBiUY9Z2zrqTG0DoJAbv1igMDNnY5Y6/Y54iliSqv?=
 =?us-ascii?Q?isKJraYKOQKRJ3K8Vro/k0avnpCtiorfUiCn9yFk+J2b+HGIoJNiumt1gqtU?=
 =?us-ascii?Q?qmT4g3Ec8HkleQiqr9B9aWWcU1GBu+INR7+3onckPza4FWOE8bHMQpzsLNd4?=
 =?us-ascii?Q?1SHiRcextr5EEk/8MqzMFNMmty7DMNosYGFFoa1/eXUAorCwzYIH3ObGoBKj?=
 =?us-ascii?Q?JgqDlAy4ERmg6uV7+Pr29bmLi/V2fp1qj9QGi5rGjj0O1e1ZAushNCQzM2Hz?=
 =?us-ascii?Q?BctYjTyXFYwnLIUVhSb/oV7+DMqsxHt2BLn0g/I9eCOiupe1fTLijZFqMJv8?=
 =?us-ascii?Q?aDKouIYVLZCX9vsecpui997BgmKqIpVUYLlj5TGM+53nGpo2oe6Fsfoc3Pdn?=
 =?us-ascii?Q?uBa++lDQdJRVvOwhU96j4Xpd3iZw3+vzzIh7EsE2NL568xYkL+46E0JxVgPF?=
 =?us-ascii?Q?ay5KbK+IU9wn2vuIgWtUFkD6fbGWHvpMkhSN5B9gqzJ07go6sdiqrRecUqnn?=
 =?us-ascii?Q?UL0MxCwIEJYjaiTWChhkCMEuU6QBJUI4JJlAR4qMs8LnUHr0AYlbjBwMYIkF?=
 =?us-ascii?Q?ZkXCqswHnjff1UT83WE=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(82310400026)(35042699022)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 12:17:02.4660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2f2cbe-588c-49bd-e33d-08de122e12b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7811
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 12:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225250

On 22 Oct 2025, at 06:08, Khem Raj via lists.openembedded.org <raj.khem=3Dg=
mail.com@lists.openembedded.org> wrote:
>=20
> It has build errors with clang especially on native builds.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-devtools/pkgconfig/pkgconfig_git.bb | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/reci=
pes-devtools/pkgconfig/pkgconfig_git.bb
> index f537c635ef2..103b3e042a0 100644
> --- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
> +++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
> @@ -20,6 +20,8 @@ SRC_URI =3D "git://gitlab.freedesktop.org/pkg-config/pk=
g-config.git;branch=3Dmaster;
>=20
> inherit autotools
>=20
> +TOOLCHAIN_NATIVE =3D "gcc"

How does target pkgconfig build with clang, but not pkgconfig-native?

Ross


