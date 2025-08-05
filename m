Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C932C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 19:17:07 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.8])
 by mx.groups.io with SMTP id smtpd.web10.7719.1754421423730230507
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 12:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VWTDl+9y;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VWTDl+9y;
 spf=pass (domain: arm.com, ip: 52.101.65.8, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IVgguHRwi0J9Mb2CsnJLuaOluPPNpD9GgWOz0xZS1fzqFAxrifpR56E3yr3mHPuixMB2FGO56yUnCdzdYLJfByt0zNUTkMTtf/b+9kp3JRPbdv5DNLSmkoXrT+U9vdvzRs8G2/I1G1tUufLXXuC8x1l81MF86mx4Rfuex6yKaOmZcxKop6ZWJiQyySCmOZfFMqV7OkEmhl5j/kTKrWH5Y4Aphu9Hm6Orb8SNbHblYdMFWOjpJCWq4fvRqyaKU7YMcyNKGqopFBcR0Qo4AmBl+2tNqDabQsybvsZ1ZsJxH4CXomxBg86pkzrd0ikYqJGQLEiP5X1W8nJ+LRboGXySHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTLUnmUuP5nMC+D6rglwSgSKQONMg84baoQJyPJS5IY=;
 b=XRzLIYMCIpC0Rkv9oXFgQa5Xe3mAWgS68lGVu4mOMiTZMTj8N2LABgm8nWEr+Bfr1y4kD3S6j40MtPjIM6dpbH3HSy0k4KAgGTZkPRCjF8hHeOPbbldJkGrcyIbwxVGZnMSChtN04NpzZHfA/I0Gi6uDxjyJ2maNLPgx1jgGbu0OGaXYSZJ0N8M1XMcjwB0qQTyJbXi3C7SP99UYEw5GjEL/FC8DxZSPgzy+WrNRYkKOsJk+Bb0iZeJldCZNt006qq5yV9ZkXefjWxkmqzeCF4z0C/xQ3ALMV43ylUjIRK4SWfaEh0QfNpfcDfSyC30O3W3qfqtnskQvAJoLoJITBw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTLUnmUuP5nMC+D6rglwSgSKQONMg84baoQJyPJS5IY=;
 b=VWTDl+9yYBgc2kiL9yeRHJEoLSLc99pbn77448Nly/14R+busZh8mYIJdkwAiMwnj4CTWRadOjwq/00w1JQ7asGpHimNbf4hh9/WPuXVVui9CVR5QL1pPzuFIGUT01CndauP7tp0Bl7DQbjRcmSse7xtYhL+gkAgxYJ6HOoKwjI=
Received: from PR1P264CA0156.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:346::12)
 by PAWPR08MB9782.eurprd08.prod.outlook.com (2603:10a6:102:2e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 19:16:59 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:102:346:cafe::7e) by PR1P264CA0156.outlook.office365.com
 (2603:10a6:102:346::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Tue,
 5 Aug 2025 19:16:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Tue, 5 Aug 2025 19:16:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E09PKA15NrMvJqI4xZh5WocS8aSFXq49oaHg7ucjJnPTjPX4Ddqb6rsePA7PClYs0WV2ihttjAq9ulN7Xt3q49EVYwwWtA5tgl4iVUcD69HpRFvjoWjrmeVarYtnqw2sHbUT6l0bxT1Gsh2UUmALqlqOscJQmTPVmxXlrZfUJp4qTpZ5d1dBALV+/bmBg0qmj2m2m3jPCC/vyoJJmvquuYGET0I2cusl3buU+Eo8o/MFzielmVxK5Z/wD/EQ429CjHkhQj5fXX5PQmvtEVeumALnk8KyanjWbzZEgcDjBVAZpwQrGCLvhPWZw5FN2bSehQeCkfTOeCGQGCwdsHDd1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTLUnmUuP5nMC+D6rglwSgSKQONMg84baoQJyPJS5IY=;
 b=RQEuetXcvp8VALCR+V8k/8bl8x/z2Q5WOAn0IKaBHnDZGgm7w4INQGFB2dMdvbATa+KJe7ERIqhV0RJUqltMEVmZsOWY1e2d4fF8jNEHdFUuEZPVCxdUiVAHyb9xuIGi5oF4I1jAtCFuiON2ZUb+PNasXEpU0qQaF8yq32WSg7uToyhzpUbz0uB27JOxxwUNqHaB89oPdpl39QiW4cckRa/jnZQLOEDRyq1WUJ4IOOyFZ0xge7gNFp5Kv0/ig8hS9CYtQFfSoJWncgPwFsj55aUDRPbDBfaMfF4DloyNjASEZCKs8OhM5DGtss9NjbYy3MRlt1atDtybOQv9wHEmGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTLUnmUuP5nMC+D6rglwSgSKQONMg84baoQJyPJS5IY=;
 b=VWTDl+9yYBgc2kiL9yeRHJEoLSLc99pbn77448Nly/14R+busZh8mYIJdkwAiMwnj4CTWRadOjwq/00w1JQ7asGpHimNbf4hh9/WPuXVVui9CVR5QL1pPzuFIGUT01CndauP7tp0Bl7DQbjRcmSse7xtYhL+gkAgxYJ6HOoKwjI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5681.eurprd08.prod.outlook.com (2603:10a6:20b:1dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 19:16:25 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 19:16:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH] clang: split llvm out into a separate
 recipe again
Thread-Topic: [OE-core] [RFC PATCH] clang: split llvm out into a separate
 recipe again
Thread-Index: AQHcBjzAPcj+W839ZE+qyNiAAE56rLRUbgwAgAAATYA=
Date: Tue, 5 Aug 2025 19:16:25 +0000
Message-ID: <618AA413-A007-49BA-96EC-4D2041A53847@arm.com>
References: <20250805191115.608912-1-ross.burton@arm.com>
 <CAMKF1sok7LjqPQGu8ekCmaH+Yr7AbK2i2s2yn23n=urBUDDaBg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sok7LjqPQGu8ekCmaH+Yr7AbK2i2s2yn23n=urBUDDaBg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5681:EE_|AMS0EPF00000193:EE_|PAWPR08MB9782:EE_
X-MS-Office365-Filtering-Correlation-Id: bd5cecfe-862a-416b-b904-08ddd454a5a0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?8paQtjOwKWS1DRwZbuyEceW9yb+63GmFz2r2sfrlHdIabpRt4+Ms8ZuMv1Bo?=
 =?us-ascii?Q?+YFMqeBywLYYKcHjemwA6lonJJHG8Mw0EtiHmIuUAg0kjp9tZ4v+9jE1jcue?=
 =?us-ascii?Q?rX6N/6NH9S7qaKpdfaIbSPrMHQjcOIEIBL2aM6B47wHW5A7F6B0NqVmVtc4Q?=
 =?us-ascii?Q?JTrWQ/k2u1A2S+PYj/lIpR2xJxwfmmDW2SQYypXVrb7eBm6tZ8KhrOE2FUZL?=
 =?us-ascii?Q?JTa5vHYnFbBbjjez4r08ZHGgydCWdgvpx+o53/SDo6ER41tsjQJ9oD7I3g9k?=
 =?us-ascii?Q?/vTK16WdXwzwwuIARqA/d3d0tjO+OcEzwQ0Hk7YmCbE8eoCVzxYj4M5ILEVE?=
 =?us-ascii?Q?MlFCmLDeqqbs2DY2I/KKt/1Jq+lY3w1FdmC+fKLXXiwweQ2ZNuHozM2ccsp/?=
 =?us-ascii?Q?mm44Hh2Y+e2Hzv/fyeYfONERXP3Qjrql9Gkrm/OQO2DmVYm0kWB/jKnMgldi?=
 =?us-ascii?Q?LHpqQfL6huT+hPNNJy+P2bB+4bWCFQvCg2d93eFw/sgzXplwhPT+4hEyRBht?=
 =?us-ascii?Q?vhwAZijkFQbL6ONaXd+j+SQwANb8w1+cTaQfuqLpYFVKfSwWg3agK0chvW3M?=
 =?us-ascii?Q?U1mwI974fW5/0m91Xm3lIcSSZfhUUeuOIqYZqf1iU1i56CJVxPJrFNETG30v?=
 =?us-ascii?Q?VNShusEBWpZu6SHplaM7UgNTp8oLaBXBdsqv3v9bl13gSpNS1HuYL1GiVHx+?=
 =?us-ascii?Q?vFjHaEVwac4/eogkTJz/Dhi/QLLNJmLm7CTiZ+8wZrq0oayW9ULyiGu/TjXq?=
 =?us-ascii?Q?8k/2D5mA2g8iakkJwRov+CNexoBq8t4eCADOgMI051fgAVCFN1Yrs+gnFRni?=
 =?us-ascii?Q?0JtyIKtaH+iPBT1qin0LH7IJmYZxWwDd9kLjU+LB5UHK8jrzXxRSVOjOsJy6?=
 =?us-ascii?Q?K9BS1Vh4Sv9MBMtNUlqlHM5h+djbtEu/HGnsGY80f+vInwv+Dk6NCQtUMmEH?=
 =?us-ascii?Q?+wdogtTodRY6muVTpjrDTGKwmrr09PkanLoWcwH9+eAILqcBcfjka3AFwljn?=
 =?us-ascii?Q?iZZIL8ljFjTMdX/xH+nyj9IcCb7UWfYhL7aGuCSbz1clT9aZG3St/JgTAoDw?=
 =?us-ascii?Q?49rvv+l62fUTk1KU2OUXh7C3GzSUrGw3m3sy0LbAMrc1gMiEEDqThQaIDH9y?=
 =?us-ascii?Q?JLdYUMqJL/eATZAHWddAhnq4JY119mtTkBKbJkqm/Pvm05aazN8pO4rcSR2V?=
 =?us-ascii?Q?JKiKBuJpSMrRRarrvqFTr+XkGQrDa9ckTs5AD/w91plvaBPG0B8iqHc8AHJl?=
 =?us-ascii?Q?ujT7IlhE0b6sWc3CSZej5+GiwebhobYYW+f+E/hsJMjO/F3/BbZgZ05iIZpE?=
 =?us-ascii?Q?EWxioGJClsyUzJFDE5uxXe5RRKXWN5afvqqOFEx3j4hyjGp2puPhXuric5/u?=
 =?us-ascii?Q?gXo0KAjsJteZOTxvSr7LIuLgiunDgc6lNscLDgmn1Jjijw1CHnjdsxCzQgXf?=
 =?us-ascii?Q?7IksL04pTkRQ/SvpagufCBgDRwAwSjJxELs9i8+oztYWDIqsHD2y+g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F0276332B5E9D2488E34B4E24298C4E1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5681
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c186c20b-29c7-4bd3-5f9f-08ddd4549260
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|35042699022|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QjVN4SNRCu0Vw2kHwtyyrJhW4dXGNLvM0Dzonucy2RFdav//OanMN2pO4zsy?=
 =?us-ascii?Q?kDSRa3baqVnmLB5698zC2eHttIohoNo8jtE6L9TL0xcJEoFzr5Vg223G+Lsw?=
 =?us-ascii?Q?iEVwQVw+23lFn9dJpjqZXNUrKUkzdoioOyxdKAmVWj5Xfm331dirGwI6SuNl?=
 =?us-ascii?Q?+SkqvdUXtFgCSgr9tGw1Grmlz+OlXwRQhn0r9Oh4JcNcoahh/MguAr9xpogX?=
 =?us-ascii?Q?LdzLReAp3TxxY90QKJ7e0gE+Nf6hZi4igho1YirgAWTR8TXDfWRDRWSzlm7D?=
 =?us-ascii?Q?1RUVX7XKEeyjP9ftBOBHOk/Q78AlGkiWrCfRooPDhQNMMGLcrybMRsFqAK/z?=
 =?us-ascii?Q?s2+4sghTZrU1CD6xtZEMt41RPNk95g1a321iSz51YUfKlBmZxUoCEtZNmkaM?=
 =?us-ascii?Q?AVoKVmT5H2v5ynTiE6iQzYoAepP2oHC8GJ73lKSinf52ZAIh97girEkhOejT?=
 =?us-ascii?Q?ur574ykLCoKAmtGq3sKpifBKLf2LTdGO+/y+lZB3V2595e2Whk4eOMr+nC2g?=
 =?us-ascii?Q?cd5eRec2udEFHiZWzGbLuLi3NWqJbY2hiihjWr6POnnvSG2sCOFoFf4Iv4v0?=
 =?us-ascii?Q?Fq+pfuGK6Jylw44hJZaiU6j+zGtUqCNX8rE7GVuXA8dhXy2oy3tBFWtcCwzR?=
 =?us-ascii?Q?zlFqGPDjQXjs14qSlsASS4fy21f32PNfqQHUrEfCrONBf4hcsbbzUpDG13fz?=
 =?us-ascii?Q?cXtDQ9hXpSQqI3N41aBzrv/vlji7xGlNzPs7eCnF4bZrz+lBlTKBUqJVkI1m?=
 =?us-ascii?Q?ht6nFaiWEuo819E1aycsdAUzkNKwVyyUxSfjHC4yiNfgoH7UTTIBuTdVhxX1?=
 =?us-ascii?Q?A+4upfsg2tCTlgbke5ela7PMkttGplz7pC57gIPuA1HcbpGa7/M65HUH+6cB?=
 =?us-ascii?Q?dKZRSl/EvGzx/EdILZKNRGnmyBercDqN8ctIheF943p7I0TQyJgXPHBAvZdZ?=
 =?us-ascii?Q?J506w0lj5s2EpcLNLbTWdhsNOJy6ka5WMqGNSweU8LtECjix33ZEpmJMfE5d?=
 =?us-ascii?Q?LvQ8nV+9ZxFaIb9fTW0WcDo5Bu7IcSnugHCA0WH/WhHGYFPbeqrST4PcZqQ7?=
 =?us-ascii?Q?tISDCJnW/ybZD+TFbgPZGRbIasKmK7x3lgtYCny+vD6XoivOy2K9bXF2KjHO?=
 =?us-ascii?Q?iumlWXdvAlKzNMmVag3FYmPPpZyKu8AtbtnrBkt5BwoyFauL/3K6qLhs9ru2?=
 =?us-ascii?Q?8fil/12y/X5ui0+sMMlozE66z/9YHRfnJmE+5L12WBLnBj5eK0DvoJ/dtJwU?=
 =?us-ascii?Q?O6bxNi8ECo4+WHGrFSRAXQauqBkqUlkztQxgHMp5M7l4euM5y2BqfRMkN+dY?=
 =?us-ascii?Q?ZPKXL7doGZza8WiKRxMyToFJYyc68yS9XM957UVklmfLFNP64VCsRlBk4EfV?=
 =?us-ascii?Q?Bovze0oeYrYkVGKPIdKHDiJVUhwZaynl24EvLC+4+TsNQlazn0VO5LiD/jHS?=
 =?us-ascii?Q?e8tMw7ITQ4bPVoYSzb08Si/N1xglfts46LzJ5g5YWpyEYlXMHfpA6LtSSIoK?=
 =?us-ascii?Q?kj5/fzim1vru2Fn1aYQrK7mMxVmBkv/mSaOt?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(35042699022)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 19:16:57.7174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5cecfe-862a-416b-b904-08ddd454a5a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9782
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 19:17:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221488

On 5 Aug 2025, at 20:15, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> We do assume clang-tidy and clangd as part of clang package which come fr=
om
> clang-tools-extra, I think it should be kept building either part of
> clang recipe or a
> separate recipe I am fine either way.

Do we actually though?  Is anyone _actually_ using these?

Ross

