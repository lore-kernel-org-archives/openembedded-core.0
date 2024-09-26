Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0286DCDE00B
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 14:07:27 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.60])
 by mx.groups.io with SMTP id smtpd.web10.44077.1727359641990639705
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 07:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TTXLDazS;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TTXLDazS;
 spf=pass (domain: arm.com, ip: 40.107.241.60, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fbNNANevlGmoC2zWVCpfCUikAiolHg09eA5yoqpzPwznQC6tyuFL3dC2tsyF041Cx41OzUXQLXJIvZW695cMaZyr092FTupA7fxp2Tf5x53R181Qe1aGiWoEGLxuihIfkZLWJGm2z1a7J/lwkD6UkvBS3Ngc30Nv+MktD3Uq0K0h8p63X8Vj4KACTpLo1TghUrE/ssu0UTk90MyX/IZy60E9gDI63MnXlxA88IjT/Hzo8Dcpu85sZfqeSAMjTljtier0LdyljstdTFMQJbDdU9E906lVlZs3rFkIv4Mj3HWng6vBbxaNYbl5qP/WMO6iySPJAm2TdvSCcZkzTe6c0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWpLFYtY+wpLGs5tjWkNJMX3N0lqYvbVa/YoD5UJTiM=;
 b=czXRMGUFuDOtsZJGBClcb26NTWOHIftiuBS7QtBMuWYnGS4hsrm1rvZ6l4zjHzbcpTqZo6/IXCdWElviFfBXkTWRAa6r6d5ktOJzOevGAImQVehlxF5B6dRq4fn2G1z8aJIrY3ZSMrbfurVKuNWqNZkzgyODSQ2eYj3EpK0hzJdjV7Wb03V3zw+563xpDm4hKPfb+lLlSw+fVE0mUwFGFLom+IP3KBQNxRjnP7T/gH6vOLhWU8zXNf+bP/yXCkSqXb0zLEp2eFajAiy/3f/ryi3NO15JAshjizmOria1tHBCC/h+yCiI/pMJHgXkfGMKPaTOVnAtCro7+Hy13Rhngw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWpLFYtY+wpLGs5tjWkNJMX3N0lqYvbVa/YoD5UJTiM=;
 b=TTXLDazSz6XIdMKFr/CDdp6AWvpFUDUIxlN7eJWDTXhktVknzSYK8Pb/WEolf3AUjUILrLiFP/dfx/2hElPU12f8TlqBJY/oCMMGEs4rgHXoXyWm9CJQqtR2NsuGnpBwKmBwsCpdThfPRRE55vmXauxmquW2hLWmDXRru3OfmNw=
Received: from DB9PR06CA0014.eurprd06.prod.outlook.com (2603:10a6:10:1db::19)
 by AS8PR08MB7717.eurprd08.prod.outlook.com (2603:10a6:20b:525::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.12; Thu, 26 Sep
 2024 14:07:12 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::d4) by DB9PR06CA0014.outlook.office365.com
 (2603:10a6:10:1db::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27 via Frontend
 Transport; Thu, 26 Sep 2024 14:07:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8005.15
 via Frontend Transport; Thu, 26 Sep 2024 14:07:11 +0000
Received: ("Tessian outbound 45432d802583:v465"); Thu, 26 Sep 2024 14:07:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a9036aad75fbcdcc
X-TessianGatewayMetadata: c08ZcM+ZvSVH0nOLlXtdeS1M8nrUvjF/4YfOI7NEdKQewgvObh47vWEHnASQx7xuQCV14YyALY+zDMRNBOaDztZc0NuI6hUglxfjinixFw6XDsUJ7g7KmDEw4LbcHeJEuiHkdzLuhW7OrUBbQnSfgVyVeW2PKMpWTdYeQw/x9Mw=
X-CR-MTA-TID: 64aa7808
Received: from L4eb3517fa0bf.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D7C46D4D-FD25-4FEF-BE5E-BFAA433FC888.1;
	Thu, 26 Sep 2024 14:07:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L4eb3517fa0bf.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 26 Sep 2024 14:07:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtZVFXoDE8zqAe1GljbfV20NCYSEq5aI/q1hTeJhpFbj641U9p+r6F7GcaEjQngtWWiskF3nWO6ZciW3VACys8NNvIQ+4waKzQ92I1ghZ3pKbYjVXoWz3jyK6/413l1NFV8hHmvDufgPvtNAszBdW/1WEWlitfarGWM2VtfMkdcvqeP01bUaTZTWTIPl4sy9G1uIKojz9dYiLMZJ3Quj40rhX9WmvcUw526R51m5gJF8a/ibzevNmYy+dAjs0+iIc6B4zqKwb0gVCrOLzy8ZBXM/ZZc/6dKlRtmnjAONeYplTagfXD9pHTp0aS99IcMxH/Y1AJMb2zfecQF3Xs4xHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWpLFYtY+wpLGs5tjWkNJMX3N0lqYvbVa/YoD5UJTiM=;
 b=j6FeNzv89FdNzMUP+yOFqm9chNoa8G4coYL2tmEO2FKVpY0yVJypbMGC9FuiUG+5gUEDUTwdQci1SdDFssmxiN46AEe3XgBOwU8MK4/My+lloJH9gz+5YsCijRHs6V94baUMu+1WbWOIqtBNlHkBlMNwvwEXj5tUWoQyrDaBekyj4tXQIFCpczxgN9iAbMsTTvbSWN9yskXmcxYgAhGf2PSjn29gLdB6oq+spjE84ezsXIF2DJulHKhA3401ubLlQVY7T2Y/FoHALfddSftCaUsHQ7hIDC32OaTN1eyNCNkZH4BjMvlCN5qoq55RX3Npx8fStRGAstohCYJluA6Waw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWpLFYtY+wpLGs5tjWkNJMX3N0lqYvbVa/YoD5UJTiM=;
 b=TTXLDazSz6XIdMKFr/CDdp6AWvpFUDUIxlN7eJWDTXhktVknzSYK8Pb/WEolf3AUjUILrLiFP/dfx/2hElPU12f8TlqBJY/oCMMGEs4rgHXoXyWm9CJQqtR2NsuGnpBwKmBwsCpdThfPRRE55vmXauxmquW2hLWmDXRru3OfmNw=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by DU0PR08MB9511.eurprd08.prod.outlook.com (2603:10a6:10:44d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Thu, 26 Sep
 2024 14:06:56 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%2]) with mapi id 15.20.8005.010; Thu, 26 Sep 2024
 14:06:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 14/47] libarchive: upgrade 3.7.4 -> 3.7.5
Thread-Topic: [OE-core] [PATCH 14/47] libarchive: upgrade 3.7.4 -> 3.7.5
Thread-Index: AQHbDxdqsBd2EwhBFE+Qouc2jC+OarJp8ymAgAApRIA=
Date: Thu, 26 Sep 2024 14:06:53 +0000
Message-ID: <663DBD07-7091-496F-AECA-E650EE90B006@arm.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
 <1727246960-20665-14-git-send-email-wangmy@fujitsu.com>
 <8C41CD57-850C-4D45-AC8B-2C2DDD0687B2@arm.com>
In-Reply-To: <8C41CD57-850C-4D45-AC8B-2C2DDD0687B2@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|DU0PR08MB9511:EE_|DB1PEPF000509E4:EE_|AS8PR08MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: d0bdafe6-29d6-4767-5f93-08dcde3483f3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VGMyVEFpN3hHNW9UQnM0a0dLTnZoM2tRWnNxajFleEhTV3hFWWtndjFsZHhQ?=
 =?utf-8?B?YWtFdWFqbHBMZmdnaW5Gc0pBY00zQkpIVUVmTWxWRmEvTnlmck1rQUpYWWVD?=
 =?utf-8?B?blE1WSsxSi9qUko2Wm5yaHdmVm9raEo1SzRGejYrTXJpc2h4eGNrYU52YVUy?=
 =?utf-8?B?bHIwcTd2ZWF4RXVrYXNWUlhwLzBiZDdUUGUwbm5MYzhYaUdxQ3MxaFZpZjdM?=
 =?utf-8?B?TTlCYlBXZXFYQzFnb1k1N3g2U1EwR3k0dzFDWmNLSXc2RzRnZHpaM2hCNng3?=
 =?utf-8?B?R2FpeW9IenhDTHZFemg2WGEzOFFYRWZjVGhxNWtJbTdmc3VQd1dYQ0R3SWp4?=
 =?utf-8?B?L3J1c1FqT2NyclFCUlp1MW50M251TnVEOSt0bi9aMTJhVzVqdTUxZzUyQjJv?=
 =?utf-8?B?bzYzaXlpSGhtR3JEQXpwUGhMREthTE9WZ3FiNlBDalQ4T1AxbGxuYlNEM1ZE?=
 =?utf-8?B?Y0NjWjFXVmR6QjNTTU9wKzVyVzd0R014OXIyWTIrYUpIdkZmcVM4RHdBckZq?=
 =?utf-8?B?c1lpVFFUQW5KTDJzQ2MwNjBxYlJRaUV6b2lqT0RaYU1sRnBydlgxRkFwMXlH?=
 =?utf-8?B?Vk1XMGRRZ2ZGa2pHRWU0aE5yNUIwL0IvRFFkUnhlMHlEdDMxOWdrMXVWNkEy?=
 =?utf-8?B?MHhjQ2c0OWNReFRKNGh4VDNRREw5QkNMbDFyMjJKZUorWElXcFY5QkpTRXIy?=
 =?utf-8?B?dXdkVVdQWVh0TzFodFEvelpEbFdpWjdWakwzYllJUE14V0traXZkWHJQa29V?=
 =?utf-8?B?QWtZZnBPRmJNWG5PQ0EyWk1FZ2JudjRkdmVSWjl1OVhGajhSVXpYYWRGd09k?=
 =?utf-8?B?d2o3LzBIbWdleU5TWml5STcvZFZEYno4d3RVT3E5eGhBanc4blZ2T3JvMWtT?=
 =?utf-8?B?bzhVVEMrTlFzbDNLRTVjdDhhVWxaZ2tRSEFGek9MTElTZW5CWnUvK2huejQy?=
 =?utf-8?B?cGlCK0F2Y0cxLzVuU1ZaY1dwVW16YXpRRWVEejNNZGNCei9ndkFxdXAxNkM0?=
 =?utf-8?B?K1Ric3VPL280ejkydFoxckdIVDAvbFR4Um8wNTVGLzdlK05tV0FLTHdWT3Va?=
 =?utf-8?B?TUpFelk5d2c3Q29UUWRxcUYxMnBHRGIxSjhHMmExdDFpZGdYNGRvdVdDTEVX?=
 =?utf-8?B?NDFHc0JlblJBaDhxOCtSWXhhT2VMeEdBYWdBK1RoaEUvaE95VjlnMXVTcVFa?=
 =?utf-8?B?d002RTZDQndldEwxU1hnM3FteW5VOFgxYUxDdVptMzVYVDdady9ieG5vbEY2?=
 =?utf-8?B?UHlWUmVFRnc4WDA3Mjl4VS9KNTc3YS9pdnBEb1VzUkZFQUwzZ05weDNTdjBw?=
 =?utf-8?B?aldOUitWTzJLR1l0U2l1Z3A2a0tvejRaaGNOdC8xN2hkRUU5cUYzZmpJcklB?=
 =?utf-8?B?eHJFTGxQZGYwTnA5elpndmdqa3JJQ1laVFR1Z3VOSjFrNExYdEZOdXNuZ3Rv?=
 =?utf-8?B?eWVqK0s5cTBUVWx0a0xiL3B1RllpRnZBVThFQWpseVFNNHUrWVVBTEZaSWpp?=
 =?utf-8?B?Y09kOG9IcDdVSldlSkcrU2ROaDl4ckJFSEdXdTdYUlg0dGV6ajNqKys0Z01x?=
 =?utf-8?B?dnUwLzNJSG1yR29NajdWYlJBamdmR1cyWE1zQnJDUEpDRnlSbDdJcUk1RE1a?=
 =?utf-8?B?eDl1eWJiNllSQ0hBVE9aRlVFNDlNMllpSHdGem9CWWQ3MldFYXZnQ1M4M21j?=
 =?utf-8?B?ck9jRVV4QjZUZ0dyeVVqTGp3aGY1bGhGUVpXMiszTE9TYy9WVVpXajlla1Vt?=
 =?utf-8?B?MWE3SzVXR3U1YWhrREVIY2VGZXJwRGU0NTNVRlF5RlNPanZNdTVXRlAyWU1v?=
 =?utf-8?B?NXE4TTlFOHhERngvVFlOQT09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC59F4265B88C34A9EA0050B6C85F0AB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9511
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:20b:4e1::9];domain=AS4PR08MB7429.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	39347bfc-6f1c-400a-2365-08dcde34799a
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WTFaYThIVk9jR2ZMZGgzMmZoM2dJYm9pRkRnR2xtMEQ2Yk4wbmRMUUZGbXp1?=
 =?utf-8?B?ZW5FZjVSWFk0NzhjNzBGYnhna1E5VThGaW1Ha3JSQkd6UTZwMG4rR29TUExB?=
 =?utf-8?B?dm1Ld1M3NWE1dnhjaXhmOU1Na1pHZTB1MmVncnJlQ0tDWEgwNlBqck9jQXRP?=
 =?utf-8?B?Y1hPMUhHa2Mxei9vbjV0Z3ltOEpHakVDOFo1NWVEUDlUbnI3MDV4MDNjNHdt?=
 =?utf-8?B?cWdyM0lweFcxZXA5eFVaQkJNUm9CME5NSVM0NTgzSkwvRFFZSXQrUFhGUW5W?=
 =?utf-8?B?S3p1MXdQY1V2L2VNaUtzejBqM2tSVy9kNGlrd0Yza2tHWGsyQzFibllNeHNo?=
 =?utf-8?B?bnRqOGtrbTlwQzcwQlFvdytyRXpEc0FpRGhkTWEzN3dPNmRuZ3FqWG5PTHBw?=
 =?utf-8?B?bzlJRXdlaU5Hd2xNTUhHZTZmY3VJUmtibmZ0c0lwNHI0VEZnT2gxV2RIS3ZF?=
 =?utf-8?B?RVcwS3VsemMwZk5CTTZvZ1V1NXFVVFF0eDMyMmFCOHgwRVFFeW1HN0Z4aUZy?=
 =?utf-8?B?K3J6ZUJ5YUxEZnFpUG9kN0tRdjRRWUZYa2VrTThoanBqWU52ZVdIUnI4R3cw?=
 =?utf-8?B?aFlpSUIvRUxHcTZnUlNkajNSZVpwbzBPZUlQYWlDT0hoZEszUUprTUllMWoz?=
 =?utf-8?B?ODY2R0U0aXlrTGRMZGdrcGhCRXJaWEQzdEtrSGtOTkxyU0Npd3BMSC95aWlY?=
 =?utf-8?B?b3dhUEYwTzhiQXpMWDQ3akVGUkxRc1NselBlcnJja3Fwemk0MTl0NlBxVFcw?=
 =?utf-8?B?OWdxbENaZ2NRRyticWN3eVV0SitKVFc2Q3NScUdiaSsyalRGV1lSbU8vL3RG?=
 =?utf-8?B?THZ1dTlyNEVDZVNYNjNnQVZYaG81aFB1dlhhNk1BRlE2M3VYVlhsTUdXaEpY?=
 =?utf-8?B?SDB1Y2lTbDQ5NVBndGh4ck1vbjI1RkhGWVZPWGExUSs1b3ZSeWVncDBPdWNl?=
 =?utf-8?B?dCtYTGYwQllnS1RQKzBzRURBY28yenhZcC9GQjJmZlRXdnY0bzBFd0d5MXhF?=
 =?utf-8?B?STFuM1g1U0hrOTBCWHdER0NqbUsrdXBqY0hSMDlqRU03VUhlWko4VmNhYXhu?=
 =?utf-8?B?eXd2RlRES1psM0VxOUdyRFE4Yk1XNTA2cUt4YStRM3Vyc0VUS05JSkt4SSs2?=
 =?utf-8?B?SXBqVnpWSkVtdWtwb1hJR2RwOHdCTEVTV0ZxK1JxckFqdjBadFFPc2lEdkM2?=
 =?utf-8?B?MGplaEpFQWIvOWRYNXZqVmhXV3FtZyt5d0x5blQ3OXVJL1VrdnpHUGNlZlRq?=
 =?utf-8?B?UEorOFhtS1NieVNSRFRQaEJ0OTVJZ1dJMjM1SG0xamZ0SGo1dmozMWdmckRp?=
 =?utf-8?B?V3dic2g2bkFOaFlCTzhNcFBJK3FWZjIwQ2pRZlVSVmlGZmVKV1JBMEQwYVdX?=
 =?utf-8?B?bEliZVNHREhNeTdOZVFibzJhRFVzWHJCRHE0QnE1TWZHWHBYSlEvUStYZ2tJ?=
 =?utf-8?B?QkZOWDNKb3IzTkFIZnJCSUJuaVJxUXFCTFhJcHFvQ290eWtlN1ZML1BBaGND?=
 =?utf-8?B?VDRlVzdKVnlmRjFqYy94cE1zaUU0ZjhXU1dlOVNUZkV0NkJROUJLWnE5L3lS?=
 =?utf-8?B?MHF6VDI3VEZFdHlncE5tbW42RWdUQTJidHNSOVl0R2Q4NkovS2c2SE53eG8v?=
 =?utf-8?B?V01KdXROdUNqYjZQSG5VTlZ5OEh3VkN5ZEdEeCtoTXcyRytkbm9pK3V4Vnls?=
 =?utf-8?B?dkdWcS9uWmRpWVI2SGxKVlZpbzdib2Z2TmdrK003bGZXLzU3TzVFcWcwRURE?=
 =?utf-8?B?WDNNaGtEblZyeUV0aWYxc0lPa3RNRGQ2ZVR3NUJhdWt0SlBnMFlFQjEwMWV4?=
 =?utf-8?B?VG9jaXFDaFVxL0dVQXdUTVZYYlFUZ2c3OE5KREMzaXduc3NFM21NSENVeUUv?=
 =?utf-8?Q?Cjx6L2DQgz3gz?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 14:07:11.1635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0bdafe6-29d6-4767-5f93-08dcde3483f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7717
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 14:07:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204987

DQoNCj4gT24gMjYgU2VwIDIwMjQsIGF0IDEyOjM5LCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gVGhpcyBjYXVzZXMgcHl0aG9uLWxpYmFyY2hpdmUtYyB0byBmYWlsIHB0ZXN0
czoNCj4gDQo+IHsncHl0aG9uMy1saWJhcmNoaXZlLWMnOiBbJ3Rlc3RzL3Rlc3RfZW50cnkucHk6
dGVzdF9jaGVja19hcmNoaXZlZW50cnlfdXNpbmdfcHl0aG9uX3Rlc3R0YXLigJldDQo+IH0NCg0K
SXQgYWxyZWFkeSBicmVha3Mgb3BrZywgYnV0IDMuNy42IGhhcyBmaXhlZCB0aGF0IHJlZ3Jlc3Np
b24gYXQgbGVhc3QuICBJ4oCZdmUgcG9zdGVkIHRoZSB1cGdyYWRlIHRvIHRoYXQgc28gaXTigJlz
IG9uIHRoZSBsaXN0IGFuZCBub2JvZHkgZWxzZSB0cmllcyBpdC4NCg0KUm9zcw==

