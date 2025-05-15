Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC616C3ABC9
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 13:36:34 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.79])
 by mx.groups.io with SMTP id smtpd.web11.12497.1747316186158106639
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 06:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Zi0dbold;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Zi0dbold;
 spf=pass (domain: arm.com, ip: 40.107.103.79, mailfrom: luca.fancellu@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GAkbCiCI+DU8M2gjNTd6uG7AUV+bTZQKHXkYh4igPc+zv+wyBsHw9ziiQKs32jEfrkJYSRpBKoLK9XmFrYdFlfEPbc/WXWRDUom2D9CHoAxfHmWQE/ITIT8pE5GuGrBj4Sb0pVDszXB+5F0k6nAnoVy96cGwPKWRfJZ23UfhToOZWGqiWBk0R9znh3cs0EiFn8cAZ+Q4gsV+N8HQsqUp/EI8VH4A7i3OIO3jEqK9IP29IE/c7zIJyAmRMfaLVPMOZYOwXiyNrw+EWTKHI6NldP28KqAlZ5GS/zuTqx2QpMbd36VoqdRBvGru76+EgD41Ugyix7Z0X3O70k7nM5gNLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ApaGO+MUahG7iS2w5VMCPrY+4sBbqAFveP3mPbUBus=;
 b=hLM9G2v6Y+fbzBEGCzxFVFc4qj5tRicGDW3WsCzTlDmcCXNhvRls0JzZTL34aQIXUaTolrZXnxru/Jnt9m7Jf8nLNXTuKxOhjC/ecYidNDntcw6r7yrEtoNPANHOHGtrc6KIl4+o/Lgdm+Wy7yzSfhbg84aj0vspDTeds4Fu8ID8d/BZ5QP/8wjqDG3TY3irtY5kbT07/ayM8ToWqI93z6W8KGBDGBrAtfwsFUmyDDhGOfmFpDy1PD/vc17b9Eusf6oGrO2wR4kLJbRsfcGieP3vNW1ixWpWwAjXWLU2/oXmDwUEcqhFpayWFQByeXvBWToFWiUv4g7x/bG6wdCqug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ApaGO+MUahG7iS2w5VMCPrY+4sBbqAFveP3mPbUBus=;
 b=Zi0dboldnAOoTFzZkDzCdvGf2zxGDBXb36/RA7+twCrGHCPT1V9zslWzB8KWlmCfbzqDXaOF57G31qcfStrOUpc1jPlZybF1JYWj/3SKgKcFeaE1rEfQZigP5psCX03096V7gyd81GY9XgQvTYvW4JuXqnkjG3//lj0nLI4BhpA=
Received: from AS4PR10CA0017.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::7)
 by PR3PR08MB5772.eurprd08.prod.outlook.com (2603:10a6:102:8f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 13:36:22 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::d4) by AS4PR10CA0017.outlook.office365.com
 (2603:10a6:20b:5d8::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Thu,
 15 May 2025 13:36:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Thu, 15 May 2025 13:36:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mjlq8OgRaibJNxFhmjy8J/K0CyNZW8Lq+91sBtc2sn/KvRRg6fSG1FghSHt+fsLdyTWNB1Q05QH0rIuPen+NVFBim5BkdicLg76rTwUr1y4FWwPkxTkNaIlU6ifCLwBScUqCBQP5RtEIpm6PzLG4jFbNjpeTwG6Bn2fqwaHw4wf2OQ9JQOfvlJp8ia1I7bEZY4TPFEZy96XcXvh5iRoDGKq0xfMWm8+DUIgkpSWSb0K1a0FuifOtROaylEREyi5ktyuqxSsk9PV37F+OlOuP2MuPDmD9tF4f3/SMUAM3qdbE7eewzq981j1FJMVp5uaRF/6HB4rZyGz3E2jCQiY5sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ApaGO+MUahG7iS2w5VMCPrY+4sBbqAFveP3mPbUBus=;
 b=wrhaMxoLnbZqf/3OdxVjUr9b4ktBEethSG0MKjegcvlWkwMdjHsSGiOKkx7zwpvyFSk4g3DsWBI4G5mBw0nAZT9OswYOeOzdDdWFJK4UgTkYO99zXgwacXKdIquu7jgjvehepqEm0+ZdgbwHHvKqJaNQnUo03Rm0pDtJB9NJT/F5r0WqoJuJKL901DEa1anMy2ftAxGvtIyzZcwBo+TMLVa2/5YFo1BLND94zCjzgB5HmPwhkIHxTvnmMDI1dzJm8E/m9CHkk1ukhjae4ibWU+Y1QvNXqCOCMGC23H4uWMFYj5Czk0ZiY/yNNoI9Uub/AHaeiBNsmRpMQYSIRKX4VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ApaGO+MUahG7iS2w5VMCPrY+4sBbqAFveP3mPbUBus=;
 b=Zi0dboldnAOoTFzZkDzCdvGf2zxGDBXb36/RA7+twCrGHCPT1V9zslWzB8KWlmCfbzqDXaOF57G31qcfStrOUpc1jPlZybF1JYWj/3SKgKcFeaE1rEfQZigP5psCX03096V7gyd81GY9XgQvTYvW4JuXqnkjG3//lj0nLI4BhpA=
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DU0PR08MB7740.eurprd08.prod.outlook.com (2603:10a6:10:3bc::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Thu, 15 May 2025 13:35:45 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 13:35:45 +0000
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] clang: Include the libclang python bindings in
 the build
Thread-Topic: [OE-core] [PATCH] clang: Include the libclang python bindings in
 the build
Thread-Index: AQHbxZq5ZISzQqXBeki2/byi0MF8RbPTsSuA
Date: Thu, 15 May 2025 13:35:45 +0000
Message-ID: <6C8DA825-0E82-4776-9E56-55B17CF1052A@arm.com>
References: <20250515130753.326236-1-luca.fancellu@arm.com>
 <CANNYZj9qTsHiDK-hHgNUN72+i--RamkCNt760Fa3ZjWkEzqSAA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9qTsHiDK-hHgNUN72+i--RamkCNt760Fa3ZjWkEzqSAA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	DB7PR08MB2987:EE_|DU0PR08MB7740:EE_|AMS0EPF00000192:EE_|PR3PR08MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f7cc911-6102-477b-e1ef-08dd93b57b60
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?bDKNquqWJjhLDz74pWcv9B2+8NbcqpoYR0KYM1LPMpWLr3OoQlTnRajbvFH4?=
 =?us-ascii?Q?U0D0ascXiohFdrTLcgtNLSjXXfnKn3xrZjdvSyTbiEsNqinmKMMSUKZ5m+Ht?=
 =?us-ascii?Q?oL5762/ukuQKyY455rvThmvDJwSonxJ6HRedX81Qs1VZbdly/4zM5KgWwVHY?=
 =?us-ascii?Q?8ePUKKb/I2retwvM5fgLp9y2ppgeE87jQPb/6GfDCkU8Q+IfqypO0jL7gFtr?=
 =?us-ascii?Q?Yq4CqxihivZKzlTCGLcwjDTaRPXjp4CJ6349YjqT5ZLD49o5J0pyQpLCF4mh?=
 =?us-ascii?Q?6D17m7AVhNHvhy4YB3/wW95yKiG/uBQOd4JymUlMtvAp8vc5ZJU3so8XJu0r?=
 =?us-ascii?Q?IF9M4PphYDf2FdH18abPkwocYJZrySX0gJSGSYFaLLPhde/VxnYukTsNzjCR?=
 =?us-ascii?Q?6Ocmczhj2sgp2FgJMBLKMNryEtRJCsQOzufn2abxgKbkVhC+316DGh7oVXBz?=
 =?us-ascii?Q?fZojpnsQacXPSdiEvAsAFH550cBOAdpTP/11Bh9e75JEIM1nprZFJ4/0Pa2v?=
 =?us-ascii?Q?2J1iEh836eyQ5KvTiQyweIl4Io1dMEOjeGerXbSlexrtZajDN/I+5c/7eaUN?=
 =?us-ascii?Q?BSEJUc9n6YZRM8IBrdxZgdZXxZ30Og8kK2bb5oKatcCrD4b2CgRRWkGHOBAQ?=
 =?us-ascii?Q?szG1ctpEucXPnbt0bJzKrIr2KB8pDWdzIctxbdg0/mVQswG3VDDkw64LYLyO?=
 =?us-ascii?Q?p3vLXZhP09SPvqJTemvvr3sFXV5J9WGTtKPs5LJc+/yV9hbNS0HsJsdTYQTr?=
 =?us-ascii?Q?oOrfEpMyO8+OXmqXMsW3B5Ch+0OKh44WfOZ8OjyWGIltA+/lOsRglMv/zgzY?=
 =?us-ascii?Q?fA4+2QEgAs+VNUhSP7lvEiEVi2GEpARH4ZMLalbF60XF7EzUnOymXwV6H1bS?=
 =?us-ascii?Q?epi9HKm4wTMTsPG/TOGm2bLuDKuC1TK0GsdiSWZbhIie7gGW+XlHUs5Qpn3D?=
 =?us-ascii?Q?mITthNh4+aDFk+Jf/HhH7Ebsib+/OI3zi+QEV0b8jWEhS7jtFk26uyJNviRq?=
 =?us-ascii?Q?u9JVtPHDN/qTFLiba4cRWbORkn2vKB1XXU9Ixag5U73y10Xj2g8DlNnkOH/h?=
 =?us-ascii?Q?win28sSfTD1MUtjn3GrWib61aaS8LfyL43RjHC1AB7aicUW3hzOGIR/OwYHC?=
 =?us-ascii?Q?sOpmXurm4KmlwEGPo5TaAMKNQGlbm2uyC/lvgP26F12tXrgzZ9Is+jtpE3n6?=
 =?us-ascii?Q?x6+hhZV4Qk8pcOfUtrDlS75EXxuTmFvSy/GmT9a2DbzoSrapOJXOnAvs2Mcg?=
 =?us-ascii?Q?FKUVF5lbKOihjmAliDCeXBfbfnIt7cf/K0n/L/BG0k8NR2kMgKAz0qUo5GnV?=
 =?us-ascii?Q?hhPT6y3H3mIRl/78Z20zOgt0B1uoII9ztfmvAVvd7VfbliqbRNcTP3fx4qFs?=
 =?us-ascii?Q?KQv20TX21JCZosQLZzIS9joTjF0w3fvK1gOzTa+z89mPBHcPT/FwYbemieN4?=
 =?us-ascii?Q?kWRVol8Au6/U/TVbuy3CrNl45gFAlgsK3zW+YCuPtTrG+pkEf5UHgOLL9lqU?=
 =?us-ascii?Q?BQY0T0j42nDFiKk=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F3308122D981DC4D92AD4D5ED4315EAA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7740
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f87d09ae-9835-416c-cf8f-08dd93b5653f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|14060799003|376014|35042699022|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FhvFRe/WRiTfRm1Vd0rJKJg1hP01tSidZbkeCAG9h3bfDigJT4xqqyTGtvA9?=
 =?us-ascii?Q?6Nfj7roJflsSaPR17Pizi1OE2XQRryn8fb3oqHpuhmydGCgp/15xU2Rxu6vx?=
 =?us-ascii?Q?UY2EUfo1fDmPUkaJWxFN4W0tp2zVmAyQ14haUeYthH6+DxAiXubIXSHpBKy0?=
 =?us-ascii?Q?BroAcQ+v/CjWKRVZB9XeYnGvxHwye5j9UvZcj+pzC9wDMSOAIZzdIwLJDyZw?=
 =?us-ascii?Q?V8kNtcPOOaA2wm7QNiLVODWVHR6qRCj7Bm+xLHfMpklaFi70WXyDesfT5EyN?=
 =?us-ascii?Q?rFjGuhTpGI5y5HDaEd+6NsZk3QVJGT63WEEfRHXA8GzYIIYDrHWcdHtnJzp4?=
 =?us-ascii?Q?BcGikRggC+2FTshGX6yrVBN2zmw+jW8bqRd+l1GQMfcKGLZFZpEhYNgb4zFF?=
 =?us-ascii?Q?M4c2Nksqn1VuMjqEd5WJkiDg9G/Tti+YMeTYlmIsgnYCMkDaDc8S6FvLZKlm?=
 =?us-ascii?Q?9ILkydHaLCyZdqVMvNpp0dsJhw6s/I8WGQDDOAj2LsOTKc6ofW1TJcY8qw/M?=
 =?us-ascii?Q?9u9sp3MxBgkK4rq4NleIyI4K40yDT2TTSOf1u3oq39NbOoHMcUaM8IjCzb8t?=
 =?us-ascii?Q?wreV1Fln6gAh+n2yI3Ug3v2BVlyStqT23JGtvDvfPBpHZcb9tdOrJAjgbQen?=
 =?us-ascii?Q?doW7QZ7sRnqBUewBv3YXs+VR8uoi+PwFjJ13ScRshvO988IgKbFFI9kre3u2?=
 =?us-ascii?Q?/KIg9MLrSbZKIoGxBTBAJ6KssuyCK4Hnc/OOUDQsAAeGCPzaWYYXIxcHuKmW?=
 =?us-ascii?Q?yt9J3BGBPCeuhvI02uJeihlxNoggB+/CEqwWHav3gkI5mtZvBl5FenkDHU3U?=
 =?us-ascii?Q?p6iBDe/ieq6JOHNYIO6BvB82mzZk4m714XsV/VUe7y89x9lwcZi+lGcg7Kii?=
 =?us-ascii?Q?ZCz3tbcbMGBtIjVhRbowxafhzU7+lKnjoMYkhdXotQe7a2+141lWMTP8HRHL?=
 =?us-ascii?Q?ifoslfrpFwgb4VWuBp1qRFmxiEB311VDf43GYsjLTArPZWS8RHiDGq5KdYsr?=
 =?us-ascii?Q?ZfM6u+KQ1MTms+YNos7aeAqqWkgCtjeTbOANandGEfhundHr1zzMAtBGTrL7?=
 =?us-ascii?Q?CHwvtwqUDcjjJXwvuDlYM0u1Oz5kTd2lEO9UPidnP0bs66piwUdOoysQjvt7?=
 =?us-ascii?Q?do/CS7Q8OAilsvtuAVhIVLEH5WeVF7kX/dVVzouRK7p7PNpjMwcZH4QKi7to?=
 =?us-ascii?Q?xhyfzCBth281Oc0dbtkG4UamDZ3+wvGV0bRFdXGsUyivGqumSPWjLSTR/1Ye?=
 =?us-ascii?Q?xmUu8a/iWVNobwuweD+oOiysVai+/xs1chg7wNxpoqnxnYyNFocg04TPKA/F?=
 =?us-ascii?Q?jCAoSrFx3opLyak5tXB43kN3/mosP0UYNgcKQfvJfpgpXKYvkYAlfw37xtWH?=
 =?us-ascii?Q?nW480Mt6B1XWH4MM4Kkq5JUgrazZdp33A7YVKJBev6gKClAr2RRVYzGwTznB?=
 =?us-ascii?Q?taz0tkArAJSIdH3TGquHPagPQIzNPW+/by8jf0WKw9n3P8iO4EbJFP8egUsE?=
 =?us-ascii?Q?Xq+ygqG4VxtS7u/3wxK/f/sUFt7MZzA0dBPz?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(14060799003)(376014)(35042699022)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 13:36:22.4371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7cc911-6102-477b-e1ef-08dd93b57b60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5772
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 13:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216677

Hi Alex,

> On 15 May 2025, at 14:10, Alexander Kanavin <alex.kanavin@gmail.com> wrot=
e:
>=20
> On Thu, 15 May 2025 at 15:08, luca fancellu via lists.openembedded.org
> <luca.fancellu=3Darm.com@lists.openembedded.org> wrote:
>> Modify the clang recipe to provide also the python module
>> 'clang' when building libclang.
>=20
> Why? Can that be a PACKAGECONFIG?

I used the same approach as lldb, why do you think we should use a differen=
t approach?

Cheers,
Luca



