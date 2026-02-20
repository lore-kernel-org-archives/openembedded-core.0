Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38394C56204
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 14:43:23 +0000 (UTC)
Received: from mx-relay03-hz12-if1.hornetsecurity.com (mx-relay03-hz12-if1.hornetsecurity.com [94.100.139.203])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40350.1771598594494255733
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 06:43:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=ZotwzalY;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.203, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate03-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.70.90, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=as8pr04cu009.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=1cjsBRus8b4sQMp/yUAgPDEGCw2HhePwKgAgohcw0JY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1771598591;
 b=tQ9oTIh8LrHA53tbfTp+emKfyLM/KcvrL7fTjMP42h5Gmlrh98u0w9lU/+iLHo9gEsc5kGKt
 uMq5R6DvRXGkKcy/Ur06FcVISBVlojZl8/e1mfSK4t7Lzq17t1kJB3Y+044Oxk28jjgMUPbDR8A
 ZaJLoKat/BD8DxgHl+Pf+qBGEjCllYlvdpkFPWCU0XY4LgHY0gt4FMTq8hK74RjR4u1BFiuQPlo
 JcTvBjnNFdNFxw7S8RNPTLVtlLJz5/DUbKiBsTaGP68od+W77Xjfxr1i4B8+6pCf6qnfIqUBP5x
 l008IlVZSlCkhZ3tWtoNItb+WefdUbGx8xlNNqePhJHtA==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1771598591;
 b=DPebLHF3VEtAzRD7bhl20DOqu+qm7EZsEzBpM6BJA1y3aUokXFMwB8bSjfJtnH0BO04jrnOf
 pqxvwXgHh/HdOV3+CY3dMzvdTRgjnaavhQI8liRP4x5Q5FKy99gm7Z+EtyRfkn71tSzpztNr9l1
 jhZ78Cpj1EmuOSj+WhLmuV1jzSWw7idlW/lGE2nyzn1fhNcxFFssUWda3zlGvJ6bB56eLmCmEo+
 tKgabkCpZbmn/5KCWGtNbvxJhd3DC9KL2Mc/8FNumzMnt6ynMnP2gXsoPyKyAS3bfveQLcmB9Zz
 O0OhBfsWG/0KHaMGMw0Ur5GzCCbp/scdclduLSZsGFu2Q==
Received: from mail-westeuropeazon11021090.outbound.protection.outlook.com ([52.101.70.90]) by mx-relay03-hz12.hornetsecurity.com;
 Fri, 20 Feb 2026 15:43:11 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VrsIWFTHXfb2pKnKSg5ZgL/s3EJQF2YkcjNiP7drhsXEBg9CQuocQoQIgNiMs9IqzKMdm4I9L+rELRqxXG82qYmYL8MP/C81St+AwamFlTHHb+I8RfqIr3Cp9GidC37o1MhIfD1Ln1TD3w95q7ExRp1mJ9YoVpstUgWbS76pHFWcaIlV+U+uH93h+eSo4eJEDO2OMdNMXozJjNMLXdSC0p5mn23dWX3/xTEIH9WeRcxowmiKn9cIp52HxcA3bzhYyPWw2DskPRbl9wVPPTkeeLZLPM/kOsoxOc43klDWxeW8ZBUpJXymujSHzyLQPNMOJLQERK3n0KSnO3SdBpDwdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cjsBRus8b4sQMp/yUAgPDEGCw2HhePwKgAgohcw0JY=;
 b=eaDJBBsrw6H9/ZEFi0LBN8U0Q8jiSHyXymcgaQg12JXxgiOX8SPvRmwHq43i/UL7qhPux9JIJ5qokXgjn5MGZYSpcTg+HpF6fConY9DiQUH8VLIHgDKW1p4jw3y3T2FlqsDW/IVNVKE6HAm8cXgcdQrygAT6l4KpfMYEQlO4KLoGXWuC925e9CloHxOIfuPJJDOh8HnuxbSRrmMPmRYi3t/6CSplSRjXMaMg88Wwyn35BQgmzduJSrWhhu1dZwfx4ZXb0ZXymcbGJblGT4cwOG5c7NI5Uyh/2y1iZKyUJ0D9DuLFwRfbbr1NR0fszBxyGu4CkxH6/uNPf0g28WjdOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cjsBRus8b4sQMp/yUAgPDEGCw2HhePwKgAgohcw0JY=;
 b=ZotwzalYoT9jiZ7/kJpp230Dgt/K0zdSHE1BCczeYMKiH/RDtvRKGpqUoKNPRcG0W41x6diEUhwFzCbn9HSp7TAO9Vsh0nlRfhlkYdFBR1biF+r+u1purJRfQ5mxQlPf8ISMHMAxos6Alcn04WDN7qgm+fvuwEm6DF9p9g2l/r5PGCSl1UffRyOkv7mmDsQhD7SCQSyFQxpR90hM25YhssilupjqINdwbm4cDx3kmFKqILb/CWcE5YUHkLGbWWGDAipoY6L1rKC50daLFlI5K1kxWbScRXxu2cGji3tb1B06OnQVl6OrjHdYnVfGusF91T9ZDmLrfMVedQx6QTJaCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 PA2P192MB2369.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:423::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.16; Fri, 20 Feb 2026 14:43:03 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 14:43:03 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH] harfbuzz: Fix CVE-2026-22693
Date: Fri, 20 Feb 2026 15:42:47 +0100
Message-ID: <20260220144247.891914-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0202.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::9) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|PA2P192MB2369:EE_
X-MS-Office365-Filtering-Correlation-Id: db6480c6-1877-4a37-375e-08de708e5a62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|10070799003|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?P3TgNWhWDGw0bl4jSNlxWbOPGbEOWmuc8CxiYv9Fj4dR34f7r6xqCfCJc7yo?=
 =?us-ascii?Q?0PVFyEZ1zYRAT0qmciwaE9naOGWRZGqguBt2KBRFl4ckuuNp2hZNZmzs8087?=
 =?us-ascii?Q?puND6OGEBaSfEDpRIMXr2t7pOFMnY02qAtA1Lqh3MfEhlbjp2ttvaGBwQjw+?=
 =?us-ascii?Q?w/d+a6YGtdKeCnM10CIMP6MTMpZ+CjYccuTruwhTvfM/O9OMzsWIHOSTB9aM?=
 =?us-ascii?Q?DRxSIu2l3ArFcVf+PwhbqZ+u2mgsjXKMLNl0si9AZYVQLYqcTd6zRv/Xn9FP?=
 =?us-ascii?Q?9k4Za8b+aFWCwII7TvOX/RtfveDOS7NMO9BK6FncNLEPXYkje3DQG0jjNPH/?=
 =?us-ascii?Q?gv0hC01/ey8PRXbuReKXij746akti347P11gMizQ8iervJuqcRllmzQ0GJ1q?=
 =?us-ascii?Q?+EjkC/3GNT1C8D6+F/tW5llCH5z9fdbdOfHcsPSp6tJkUVogFa7k/Ge420Oa?=
 =?us-ascii?Q?G1KboHQmOB7n4sYysiYdlC312027Q1Xo7bsCSb1LE2K8e0Ey2K6P6V2gxAHQ?=
 =?us-ascii?Q?R/XUU7k6Bz1OS2JiwZE8xkmiQHSnPsPm3iUfpQfe+SLuWdH9kU22eWdVhtwP?=
 =?us-ascii?Q?9EkO2So5v5LmWn7bgKXh5mFmxj6WrDWKYb/srPvD68QIR7z1OWZdOTRBIsGe?=
 =?us-ascii?Q?kdkUIPq7MnMmfWWoSYmiS2UD0AM8swL9AEH4aMch2WYFtSCdW+/ofp3Ug4Fj?=
 =?us-ascii?Q?+lLk4oxBwqKxN5FUOwS90KMpyWwRKX0OwgjiCZhz7CkkV7pai02/1Y84GkWJ?=
 =?us-ascii?Q?q8WjSZ2x5upn/Y4LIe0d8u3fStpoaSZiv9W+o4xV9TxRiYlcM3kTO3me6vdc?=
 =?us-ascii?Q?OiWoKVAZrXPXtZAutILRjh22V1NyKvti8MO7aGppgNl1byhMQbIg40T81aTj?=
 =?us-ascii?Q?U9dxVI39BeFpWSSACF5iLVEVJ1f3ARyoCnzAH4OpqdBK8r4h35qPVYfFuyLN?=
 =?us-ascii?Q?g+l9zwNnN/GCVsabYg8yUaUDwsXrXC78MZRxucta0Nf7JqqFUS0NkIRLmvgV?=
 =?us-ascii?Q?aLYyFVFFkMExOLDwCXsjvDS6GXvYvxB+4RLdwSgYs6dKjdp59YgWY+neMZsA?=
 =?us-ascii?Q?wpmTQxkzA4j2XGUXkT7BVQ6s2XPlbK5fbDHx3JP4eLe4vVzNeAA9Vksp6gRi?=
 =?us-ascii?Q?ZZqD7XYj3xsUAlTVshALx9Dsc92AJXztB63oD61SoRzbIfPzO8N98oiHRhuI?=
 =?us-ascii?Q?HCqb7XJOv/5dwq7pExNoy5oqTxDZTawpH6JBeJuXChuyY45yBDFRHscgcL98?=
 =?us-ascii?Q?l292nfWdE950tAYxvJ9xd/6tBlXxhW/XV+m//bXFZq85Q4t4oVf19Mpn51A7?=
 =?us-ascii?Q?xQu9ueo3J0dAGbvpN5rrDHyoauVCdZLAUL2FcHbJZBWWEK/0J97mFthclENH?=
 =?us-ascii?Q?17N8/m2g2kNssjBpJkPyYZ+SpZ4HajzPWg78hYTJmUCRjcIyofDF01sm0BU6?=
 =?us-ascii?Q?6ymrknxmOCFlVUYucKvqOtu735pnltJmON3RM78BM5aWwgyLkLevk54SZ339?=
 =?us-ascii?Q?KJkG5298OADPEO5T6+TDAXwsxdmFyb2txHfAd9OePAK0YrFtWLsAbpSzUSPC?=
 =?us-ascii?Q?Hgev1GTu1ZlPos/dtcg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(10070799003)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Jrx53FouHt0iCtIBS6FkA2Ej+haFSzn60jLARxR9QyEbkpC81Wlb0OtDvdP+?=
 =?us-ascii?Q?AIBnRw5FWwAmHmQiek+RPCTQTUfFCnAgOIvPw/K9QcX87g3GvIPBOgUWYSE0?=
 =?us-ascii?Q?ZIIzoh6p/o81xgQHqFAkrN3DWj0Rx1QQ+K823k2zdWDo3k2i+rlhy1dXnEty?=
 =?us-ascii?Q?nN9I9TJs9e2fqSCN65nYygO+D8G/oQVJuVYbkkcnmAIX1kNWhqmljhx92PWU?=
 =?us-ascii?Q?celKXxcwdbZg5/z3rqcpV0me+Zz9+d0p69mZsB3kmYYloHATKGbK6eaf8+1l?=
 =?us-ascii?Q?bnvMRgH18KUX/ORFPo87/gRs8qzdGPB5UXcxtk3bSrOardQg3nuyeLXhJSM6?=
 =?us-ascii?Q?YgkkrYZGpOl400zD/OW94zb4H6kv/BTGXN+sIYVYdjqtfMbvEPuxmx3noJ/6?=
 =?us-ascii?Q?SJO9vVJuLiVqVTWZuQLUjY4znpsBmtnLOPtYWXYAduHk0EyKLLfQEAg/7Qgf?=
 =?us-ascii?Q?Rb/aKk3eft2V2JN5igRECOApq3BMUEokF9DtutrRFDcN1t36LZyEJpDY/th8?=
 =?us-ascii?Q?B2WNIYxGj9tpuW/lOk5c7GaD4ofvIs3zCAc+Rz0eGoMPeC8xNr2Yt/m5g3ZT?=
 =?us-ascii?Q?qduReT4kCE0N2EVnC77w82ZjcUt86mXCFrjtfuqJpxC/2aEQ6o2sagFjdWMD?=
 =?us-ascii?Q?O8ugufmkwE85NA/0dyfyKTOuYRd0ZfYMon54tkepOHUpHetAH7+QuS9k4ie2?=
 =?us-ascii?Q?b/As2viBzQGzfeNo4phm0DJI6CpzOrG6XmVAcgCndb0bqtZzW/Jen2nmOPzh?=
 =?us-ascii?Q?QfXSOJWozBLkhTMAOqCRBX8iJ69Ld4Yf2I3jCfENVPrym8nhc8LuVBMwTQDt?=
 =?us-ascii?Q?OISRUZEmOJJJxLgRREqf00ag2kdSit4Lxsled+EjoOz/twlYgbySM8ZBWnaa?=
 =?us-ascii?Q?hxpHUvN+mKX/eQALn9PlOutUWEoVcdcr2kXiY8U1I/Qxea1nkYYI6Q3xUVqQ?=
 =?us-ascii?Q?RNC4aWvxP1ZtP6UzTqwT2vUXE9n75VzyjV1xG28TELTRRBA3eaPzL3z2PEn5?=
 =?us-ascii?Q?QNlQoddDTLYu0OngUI6Po5fbXT2XRapWSQr19YPA1I9rJeJfasaxRqL5gImb?=
 =?us-ascii?Q?AE3l7doT8p8eFVNNqjJVn/DkUCg2uAdKTaJoNfSMFKu074Yo3Vmw+5Jg0j8b?=
 =?us-ascii?Q?gyCmCg+OsfaTsTptpUeEAptS2OyQQRJQGnFJ+EGYJzoKw0kywtlxd23yFCGD?=
 =?us-ascii?Q?2mPH4E7XdyEIIuQ5++j/rmMxLlwaLryqBRMcFlzj1fhKKv4EvcgROkjnbvcm?=
 =?us-ascii?Q?7opOx2OR6YsDhjmz80UTL+peJBgvMZVHUXgqm5/0KRSm60/FLVCwFC+nZKeL?=
 =?us-ascii?Q?qC0We8URZigkn+5Kz/PcAwrMkQik6g0uVUZW3riPjnFfBujXoNhKdC2J64hD?=
 =?us-ascii?Q?i1FoePsNm6xdvGMr0Ei5+bTP1pdl53fOJasucRLtOry6voijO73+Kov5YMPc?=
 =?us-ascii?Q?0ZM2VlB8ZvcSU40Afi2FvO53uJoGXbV2CBUeIZEret/UCIYcwCZwzM5ukya2?=
 =?us-ascii?Q?EMh7YFGigZygpq+vtUsWS8kntywq1pklZdLGj5ZjSB2EdK570MzcCSASZxhM?=
 =?us-ascii?Q?jJWhUmZl/F+z4BryKoEbyraD6jqsFhL9y8ahDinnr5piz1VpkHg7GB6YMxsj?=
 =?us-ascii?Q?ZSDKi2XDqT2I04YZZezM/fpEUQTELX/fDJ8kw30KwDVCkRDB7VDeKqsD2p1y?=
 =?us-ascii?Q?u2uXF3Ei+bCDVfwpRqwDoB/8FfSRbvC9iv/0/XOLh1jladtr40bMqSsN8XiL?=
 =?us-ascii?Q?OoxPOcolZTEYMf7P4UH5WkBxkBgRJbtnJofkNciqh8uboMRFEDC/IPUXMKT9?=
X-MS-Exchange-AntiSpam-MessageData-1: Efzsx7R/VCUQgQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	9FoD5W9xEesB2tfYJL6y2xljDQEi64JTQskIJ9Y+i3zjI2v1ws3yzBrDZB26XU4Ez7Oiv93pvANpE3CWzuj2Guy4jKaQEBCoUjYdEcefGUe3L51oXXs4PhVPNG1wcTtz/hoXzy93AaE0mJOuOjExOlKHAL34vslzc8P1lk/NPv/dBxkVCz4ozZ7YSJ6U5B15xaLs18H8a9Sy6Y0GXEMt4CQ7Q+t5lm28ye/FoEt6tSDWjMRccZ9VRpr/DpTMose6BhMLXj0qbc2e8D1PVW7VhrhSaQrJTi2DS2u53fTSv0yCZGSKGqPIGGEUMNZt1n6VaNuOapmy6kUhI4HVj+vGFeaQdcgRZIQwvEK/6lb2aFObsZDvhVaes5bAkJB8A99Rdj8Z7pG1inQhNVf50XlzwuAx+CDuTqR+j2X33Ne5tHvQtNqvQg2l4Jw7eYRjOAr9gk5Gcrts424Bn9Ggvnos3vUlzTNbWcOuVnNk9AvIoohc6jbUrtenaXM5pwcJr/6lM9/E4JAnngWQUQVSZiRsUmL02hfN7JiF7uwtpVeMksDpmwFug+/Y5DjioukeSZsermNpnaxSR0HOUOYPtub0cgVmSvzXV6vQNKfmLML8whjvBUN+JdbLrsbeO58RUDpP
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db6480c6-1877-4a37-375e-08de708e5a62
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 14:43:03.8085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KvXMvfieArjq6VmeO8hlS/KrMDezKAWNbJI0+lRJescGGQvHBDLh9235g0BZST0ivPFb9IuCTws7XXRfY6v6Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P192MB2369
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay03-hz12.hornetsecurity.com with 4fHXzZ3W0Pz20lNG
X-cloud-security-connect: mail-westeuropeazon11021090.outbound.protection.outlook.com[52.101.70.90], TLS=1, IP=52.101.70.90
X-cloud-security-Digest: fd20c12a50f15a2c87b78ea101b19228
X-cloud-security: scantime:1.598
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 14:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231518

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport from https://github.com/harfbuzz/harfbuzz/commit/1265ff8d990284f04d8768f35b0e20ae5f60daae

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../harfbuzz/files/CVE-2026-22693.patch       | 33 +++++++++++++++++++
 .../harfbuzz/harfbuzz_8.3.0.bb                |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch

diff --git a/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch b/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch
new file mode 100644
index 0000000000..c57859a7b3
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch
@@ -0,0 +1,33 @@
+From 95d38abd1293cae1f2aa700a3949288fd2c9a4c4 Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Fri, 9 Jan 2026 04:54:42 -0700
+Subject: [PATCH] [cmap] malloc fail test (#5710)
+
+Fixes https://github.com/harfbuzz/harfbuzz/security/advisories/GHSA-xvjr-f2r9-c7ww
+
+Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/1265ff8d990284f04d8768f35b0e20ae5f60daae]
+CVE: CVE-2026-22693
+
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ src/hb-ot-cmap-table.hh | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/hb-ot-cmap-table.hh b/src/hb-ot-cmap-table.hh
+index e2e258185..2f7d72700 100644
+--- a/src/hb-ot-cmap-table.hh
++++ b/src/hb-ot-cmap-table.hh
+@@ -1534,6 +1534,10 @@ struct SubtableUnicodesCache {
+   {
+     SubtableUnicodesCache* cache =
+         (SubtableUnicodesCache*) hb_malloc (sizeof(SubtableUnicodesCache));
++
++    if (unlikely (!cache))
++      return nullptr;
++
+     new (cache) SubtableUnicodesCache (source_table);
+     return cache;
+   }
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb
index d733342682..440ca1043d 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     file://src/hb-ucd.cc;beginline=1;endline=15;md5=29d4dcb6410429195df67efe3382d8bc \
                     "
 
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz \
+           file://CVE-2026-22693.patch \
+           "
 SRC_URI[sha256sum] = "109501eaeb8bde3eadb25fab4164e993fbace29c3d775bcaa1c1e58e2f15f847"
 
 DEPENDS += "glib-2.0-native"
-- 
2.43.0


