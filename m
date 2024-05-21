Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90267C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 11:38:44 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.54])
 by mx.groups.io with SMTP id smtpd.web11.17537.1716291513698363451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 04:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=atHJ2SXt;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=atHJ2SXt;
 spf=pass (domain: arm.com, ip: 40.107.14.54, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lgVsoEUvkLCv7B9hqSsOd95xWPKWrQaIyKUe9SFP/N67c+A+cTmx70G1WbZcoZb7ThDdiLDdrcxB86ROEqz2BU2OCdYl2MmRselYUzU7UZobwF/0mgAnzmj0Nu5K4ARqdp1+t3NP37HJg5iteJx7zEKiF8OVk5TmPEfUrm9l6tRS71xkLAGb7f6Ka7veYJYiRQrp1qQKcDL3fVb+27atCg63WmU70nh4HM2rGX2/LsxQiZtuNs1a2FKalpuOKcpL93zuDt+cN0VxY2son/dGkFpXQ03+GFPYVSths1cHBUwJ1DQ6L1KO5Iob9tTHoFBlsSQ/Um5wGT+XHgZjh6V8Tw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvhI1R04yeRLSUZPZ4PGlMGcAccs2A2SDDy/ieFcrlc=;
 b=ZiKmozCOKh9icy5SYAmpKtfu1lpLA30TLvlNEYwlwRUYgJ29ypkzmQHblyudy7xsIFLOibPYviUDAlb1AIc9PUm/6aIokgazee7+XmPCmkzfhOBgRvkWWL5qrq598n6P8SnyXFfb0P/A4KJlBKx/qc0yJdOGEsW/XQ3q+gjHBpgbotbbVQ5QLPgxQZyuq+rUjg3/369QwX84UQbCb9CXCP0820u6Yx4tSc4h5zKE8T4vX5ds91DieNVexrquKYcdzXTOwk89nGXyFF9p4ikDOL/bHyxUuMMxgGj2PAjhCUPAGyqScIReDx775u9hX/lBbAIar8Z+vLRK5yXuD7SgYg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvhI1R04yeRLSUZPZ4PGlMGcAccs2A2SDDy/ieFcrlc=;
 b=atHJ2SXtsK37SSnQbIEPNsYgkfjJocqLJ9Z5wSbcD11quwp00T/rLcMJy+dDQQJqT0FSbcupwhuI1t1tlJBzyzltbtsNuo/nE08Lrlxs02mN5snQfWIZUaSeQOWbHJ7HmRZC2CCPQaUBWuHESa8nK+n9GsPF2CguCeL0V23EIJI=
Received: from AS9PR05CA0134.eurprd05.prod.outlook.com (2603:10a6:20b:497::11)
 by AS8PR08MB7992.eurprd08.prod.outlook.com (2603:10a6:20b:571::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 11:38:29 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:20b:497:cafe::d8) by AS9PR05CA0134.outlook.office365.com
 (2603:10a6:20b:497::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Tue, 21 May 2024 11:38:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7611.14
 via Frontend Transport; Tue, 21 May 2024 11:38:28 +0000
Received: ("Tessian outbound e46bb127ed3d:v315"); Tue, 21 May 2024 11:38:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 838f61801e8db7b9
X-CR-MTA-TID: 64aa7808
Received: from 0a8e5b35c672.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 722BBDB5-CDFC-4A27-B907-20BC09EE7FA0.1;
	Tue, 21 May 2024 11:38:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a8e5b35c672.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 21 May 2024 11:38:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0er3l+G7mHH4Hk8A/QjFGRbDyppnoSXqai42p38MOgnTBGAUZsKgqFAIrBJoRH4fHZCHRusirv+jXOUhJuZRE8IUMg6aWzkARL6ip+UkfoO711/gEaumVpQ3c83VODT11ogyAhSzzH4ezIMYtTFRBg9HZEqXmjWJ59YDkbt0Oi7kngMqsmb9VNFBiKO/jqInnjor4t74McwxtWd+lzM7uS5EivUeGlTGUhngcIDNONNstPdZ7UB5rb802qT4PImaZRtbR/V7/NWfTmzODFSQpFiQHdElRK0AEq6zz4Yt3ff9zFqdSbPIrR2cQ3R8rV4oDsc5681/c8pe0xZlK+mSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvhI1R04yeRLSUZPZ4PGlMGcAccs2A2SDDy/ieFcrlc=;
 b=LnzgIr9nVr01s2hHLygS0n+n15TvTZGpFHzBdstIcOiKb3SuDSjLAKERlWF+OEOBlr9eRlGVRsYV6/XeZcpCVqgEjfxB8BtOYLW6inB83NNShNKq2xJjZfbuYMLCpHTwrXzkW33WNvpNhw1LWmNtJDf7KdYfWVQjaiBZosAz/ieIC+nWVovsmNDvEavIeq9Zv74nBxFL5XjIquJG2lUhpHPA7qvgUF5WfZ9NNanGgIRIIYvHPn/iq+fg72BvgjUbE9QfnEtF/M5v7OBVManD4SPLeULW7taW2mdA76w1Q8PjucrA8xW8tna5B3CA49M3Gr57M+DhrkM4MdTfYxZPpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvhI1R04yeRLSUZPZ4PGlMGcAccs2A2SDDy/ieFcrlc=;
 b=atHJ2SXtsK37SSnQbIEPNsYgkfjJocqLJ9Z5wSbcD11quwp00T/rLcMJy+dDQQJqT0FSbcupwhuI1t1tlJBzyzltbtsNuo/nE08Lrlxs02mN5snQfWIZUaSeQOWbHJ7HmRZC2CCPQaUBWuHESa8nK+n9GsPF2CguCeL0V23EIJI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB8620.eurprd08.prod.outlook.com (2603:10a6:150:84::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 11:38:20 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 11:38:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alejandro@enedino.org" <alejandro@enedino.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/4] tclibc-picolibc: Adds a new TCLIBC variant
 to build with picolibc as C library
Thread-Topic: [OE-core] [PATCH 4/4] tclibc-picolibc: Adds a new TCLIBC variant
 to build with picolibc as C library
Thread-Index: AQHaqbA9p+a+bUCI/0it+cZT1Q6XLrGhk1SA
Date: Tue, 21 May 2024 11:38:20 +0000
Message-ID: <C23A42BD-03CC-45C7-9221-196D21A31787@arm.com>
References: <20240519055050.2331637-1-alejandro@enedino.org>
 <20240519055050.2331637-4-alejandro@enedino.org>
In-Reply-To: <20240519055050.2331637-4-alejandro@enedino.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB8620:EE_|AMS0EPF000001A2:EE_|AS8PR08MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 997a8887-14a7-405b-c22e-08dc798a88b6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?Jz4FwNVZyxh4TXiQvaJPTejoQ8NI/hgMCNB1P7DcpS9ovB6UtQTYCMH1H/S2?=
 =?us-ascii?Q?psglcSMUKLCeTCTk0zAfB+RSOHCsSJoslBSxM91cyl7HBKDPwbM9rUnvSxaE?=
 =?us-ascii?Q?S8pmWccv6GdsYSjkHpIIs25CvcG0Cob6Nvd9R5H4xqQCvoDpclKI44d3xJea?=
 =?us-ascii?Q?Vpf3DY7S8/POGykj6voSwWz4INv9EqtvfCKIMStVrrQgHqApmgApPW8bxzkW?=
 =?us-ascii?Q?354E9f9BA7GlQ4omw6BMDO6wJspKtjj0fYpOkeZrvXHcIj6QSDCYzrQZjMaY?=
 =?us-ascii?Q?q9FZJgygZOcvR5ORhLVJ1sKhT9hH26HiZa8J1MIekv4zKbbrGOSQ2fWl3gDL?=
 =?us-ascii?Q?a3Dk+hfFcFygYU0clNz7x4WeSFkmYCHmFaThFhitApGIIHRpf8/k+7ihU/+H?=
 =?us-ascii?Q?g+rq3USpHW8Nd5yQKTMVBvIdJYbc5Cdaf2zYU5vYll9i3dil6hdKmlNVJIPK?=
 =?us-ascii?Q?L4lCz7+SGx3v04cltctYWnIlszSplAHK7KaHzSu78hKOu5X+FITV0JuX/L9Q?=
 =?us-ascii?Q?LrJy31sp5noTnEcd//Kfrxr0DyncPIHPn3F5sSeHIMgmv4jzMHlG0dUw6iBX?=
 =?us-ascii?Q?D4JwMcPEccwYvC1a/wSmgvHjVtWC1F4ysdxDlyCUyOi5vwn7MR92OKqZrJWU?=
 =?us-ascii?Q?nlVu1Iyyoh0nGUBt4vwgRGwveKzhGdqYcOyt/BiTY9oNkynn5yEKL3//nm0E?=
 =?us-ascii?Q?uE+aDu6Q3Rv/2W2ZvdFJMptv5FjHECyb1/jKOSnOBEnf6YL5q97iEWElZ3kX?=
 =?us-ascii?Q?Rc94ZR56lgmX2x4WQdVFP9W6NvnPBXhacDW17MGOuSO8oMK0r5cLJUQiV4mZ?=
 =?us-ascii?Q?eVK99QpABqRvmnMXO7N3PGs667085QIWVz5bKCusQLtld0ChipTBAjIVHZTz?=
 =?us-ascii?Q?V3+kfs+uk10LPriqbg/1xPHDA+nlDWT4CCN0Mqc5axjHhcBI0BNbgQMCwARM?=
 =?us-ascii?Q?QCl1Wm/hCfK91hsc1N95BXDMX1KY2dAfnCR+vXtOj2wmSCwrTZGKGqgcgdif?=
 =?us-ascii?Q?ht/dyuznlJPgO5Q0UWUhZ8fnd9KM9kdC8Q7muK+Cr7D4kU52NFzh5Jxbk2+Y?=
 =?us-ascii?Q?+jCdPM7b95sjKrgAviOj+rSjnQy+uwCM+RDrF1udrvnxNSYZJgMOh54o3+V1?=
 =?us-ascii?Q?C3yjU4/JsOOvEDXeX7/U82iyy7zjbW8bYMJBENI4I5MwM1eILoJhKMGZxzfm?=
 =?us-ascii?Q?Of4YFm5oBZNxogk28gv0IYf5SNfvKVqW9EsszbvGHHZ62hX0+ZAPODFNKHdn?=
 =?us-ascii?Q?UtIxdjdrVfinonIGsgzNi8ZrixmsAQp54m8YsbkcjQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <478CDAF8E3234C4395277D7605BEE1DE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8620
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5e082975-b16b-431a-f163-08dc798a83ba
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|82310400017|36860700004|1800799015|35042699013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ukdSe/3qtffes6pL1hbe5Wuj7k5aky4OZh1mfuEVS/njF7I26OwWwNCpZ7Wl?=
 =?us-ascii?Q?UxV0JOGE02xAfEILYoHH3IiQIuHdOERcYQAurGdEjefHi4zOgsGsXfIJ8zDd?=
 =?us-ascii?Q?cyZApuWj35O6F/NCYVVhgfkxMeRra7m5Q66BoalCoAKCvsp/A6okenxBMmkA?=
 =?us-ascii?Q?CyvjXUDwOq0CV+4l/6giZVfboKYsld5jcEl1yUwx/oo3a03qp1qSF8msHvW2?=
 =?us-ascii?Q?S6hF91JL6yXx7VdURqTxs26+1dhsVnAdfhu+bYZQdtxdjxdzrimq1JH83hy/?=
 =?us-ascii?Q?ScNwLBG7wlq7gw7xMBJxBWkGkFV8zT2NaLPFNO9Dc8zZFzdf3lx4rcfJW48m?=
 =?us-ascii?Q?o2MI+PPsBzFOpZEhfoeWJbrcWg38gAFOhxD7mjSDPBvml60TrWU5AAlBsimE?=
 =?us-ascii?Q?1QOhcNiXtYJpQ6KOuc1HqIE40xZBSjQI8OG5OoytifmJAOoYzH7yhQTm7BwJ?=
 =?us-ascii?Q?QFqkEcqygNQ6Vowmq/LoV6G+bVGQfJEGNaTlEoja4Vfa3fr0yiu1W2NwEsQW?=
 =?us-ascii?Q?LQCIG4fpNVlpOy3KOSgPC9BSSPjGgZZrSH0HQx+JaEmS5SPPsRCg2Idlj0BL?=
 =?us-ascii?Q?61Y3PC9q9niT3rAQJsVV/2JcVzJR8UDRIcIvo+zPV+wDTSz9GJJY9R4d3Kc0?=
 =?us-ascii?Q?ybm6IDLi44dmuochf2thkwIAGUvasI4QMd8p1Gi1wSRGfuO2kzDal/8fCZ2w?=
 =?us-ascii?Q?NsVZVdh5PwTV1HoGNpgd9NvBt7ulaD1+rvpZlFOW3L8syvmy0+7ZsAor08EH?=
 =?us-ascii?Q?teDgq9VRdcGTceCwQ55+pqCfafAZ5Zwvcr7NUNWPVwoK9ZyS8HYR80FH/RHF?=
 =?us-ascii?Q?hFaVOcyW/ebWYzHJ95jhBTadZHEyJT9JgJhLtRJtKCkMtN0TGM/mz8FGwUyf?=
 =?us-ascii?Q?mTKyZpCrUb2Tc17bI9lTNCDs4mYwnIRdlG7tqUg19Ii9wLKtI3+2RZvtHmS9?=
 =?us-ascii?Q?ArYlVr45dHvPnjC11K4cLA8Scfh0/jXFOAGj1l3B5KaCGQO1HtmWPIwBNL0L?=
 =?us-ascii?Q?57sytJh7Ict91t372Om0bVQXoIBF6xS1mD6Uf1H3E21S/0j2uMvmMnUMv3C6?=
 =?us-ascii?Q?c2E8jsMDGSNuz/omvSwl4ukzGUZ1nKPQegbFhaXovDHnVDIGbHVQl6DHvQ++?=
 =?us-ascii?Q?ogGLe4YCp+1Ncpm4264nEcNzusVOYi4Xgp1Uy0Mr5s4NOlWf4Tyu5Hqc2IqP?=
 =?us-ascii?Q?AODq1nL9LIB7su7g1RYSOkKLhUU+6MQ0pxrdOUU4/FszcioiHThAa7YnU/w3?=
 =?us-ascii?Q?G2qZVE627VIYRkwMm39PzGFmiGtZmIAB6ToAmtDLvRulZU2bP74fMhiZ4nkA?=
 =?us-ascii?Q?++jn8ZJyFvHKVXw+EhZ0dop9?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(82310400017)(36860700004)(1800799015)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 11:38:28.5269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 997a8887-14a7-405b-c22e-08dc798a88b6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7992
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 11:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199630



> On 19 May 2024, at 06:50, Alejandro Hernandez Samaniego via lists.openemb=
edded.org <alejandro=3Denedino.org@lists.openembedded.org> wrote:
> +# Use the same method that picolibc uses to bypass early compiler tests =
on meson,
> +# otherwise meson will try to compile AND run test applications, avoids:
> +# ../git/meson.build:35:0: ERROR: Executables created by c compiler are =
not runnable...
> +EXEWRAPPER_EXE ?=3D "exe_wrapper =3D ['sh', '-c', 'test -z \"$PICOLIBC_T=
EST\" || ${WORKDIR}/meson-qemuwrapper \"$@\"', '${WORKDIR}/meson-qemuwrappe=
r']"

From picolibc (https://github.com/picolibc/picolibc/blob/main/meson.build#L=
1562), talking about this workaround:

# This was fixed in meson version 0.54.2, so this can be removed from
# here and the sample cross scripts once picolibc requires a version
# of meson newer than that.

We have meson 1.3.1, so this (and the corresponding meson.bbclass change) i=
s redundant, right?

Ross=

