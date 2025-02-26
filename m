Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637E8C021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 18:25:13 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.30])
 by mx.groups.io with SMTP id smtpd.web11.13066.1740594309958601478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 10:25:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ijCv6Cbh;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ijCv6Cbh;
 spf=pass (domain: arm.com, ip: 52.101.66.30, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sjX+D0AY5wM5fdFBkXoyWt32DIdaU/0BrLhwKsiCSycge7AK3tr5d3AtF9kNKGFFa1IhK4W9cePN5E0tuHlAH6Ze1g0PU05SD2zfQGW6XPqk/7z0bCAPryQgDnCVbw/5fdx/dgLjff7q29wMAoB9l2qqwPKb5R0ZN8O0tsJLhsPtBIpxBhXsSA8hXcyohe5PghgfysTSbVqvykMA1yEIAEVp1WodM7FT5K6P4fp1fFT+R18VcgKoh/gj6/ru4hecummA3x+5JHUClJY8/5iHQZDW67lcaar7YChKvRVOI6HQ3SJ/3Fv+Z7izcvbwPRKhCYgak/Iz18++vl3U9YUavw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpl/sV615UQSv3V/scQ2ewtG1kXbCLCt/ffvLMzVvaQ=;
 b=FdUQy9S32wjYIqxdcUuHLA4M1OhQY9uPxzqNlRiTCYVi4kPzPt8W30HJGVoDy2TcoTBbpLbr65a3aWnwk/4SfKKhAUd5Wlqj/xr4zIpAUcQme9a5J+jOGdwogVwmLdCm/nT7vJ9f0/SbZsm0UqNzuAvB0DE6dHNBQOCbreQ6A+fdlUE8WnO5ZXkbS4rFC4wYwIG7fBxJnL3enZbqR69EtmV4MH/kHtIDTBpRuoNKWn7FVArrBITm6rtMhpkFhqReSjllafLyzU4ejWCBYNlgpvqaClGzcMX/RrqdoRA/a2O/n8rYkoXx9EB2B6dve+araE7pyV18/OjTngkl6xDiVA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpl/sV615UQSv3V/scQ2ewtG1kXbCLCt/ffvLMzVvaQ=;
 b=ijCv6CbhjsczH4f6WZ89iZvTwZ4/AHb05/fxf1LqeGnSfOMCMsNhmURKD051tyYu4lEGpFyqn9nF6taUuCaIhByB/W3bnJWimfAc2mg67SegHn0x57hwnfM4bERw5ku/5y+KRJeWXVlQklLCjApGQ2Vxc4ixCOOR1IVa0tMbugE=
Received: from DU7P195CA0019.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::32)
 by AS8PR08MB9217.eurprd08.prod.outlook.com (2603:10a6:20b:5a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Wed, 26 Feb
 2025 18:25:05 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::f5) by DU7P195CA0019.outlook.office365.com
 (2603:10a6:10:54d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.19 via Frontend Transport; Wed,
 26 Feb 2025 18:25:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16
 via Frontend Transport; Wed, 26 Feb 2025 18:25:04 +0000
Received: ("Tessian outbound 93a06e49d4fd:v585"); Wed, 26 Feb 2025 18:25:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9dd42e99de1b6e90
X-TessianGatewayMetadata: 6vQWzGAeuaTNVv4W/2riwEJzjv47SGZEOloeJRkUBWZCJdQK1073B4uJVpYlr1qMhsI8uqbP03raPF/z/A2GQp+L1vi5LygK+EwxZQq9L3Qe7uS4Vu4flM0Rnk1ADZys7agUwuvAKE+2obfeljubAMmsAYzeKDxhC5E0Pc/p3F8=
X-CR-MTA-TID: 64aa7808
Received: from Le270cec2b38e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3EB1A8B1-DD3E-4CE8-B576-F0C686712B96.1;
	Wed, 26 Feb 2025 18:24:57 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Le270cec2b38e.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 26 Feb 2025 18:24:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGAhRjWlGK7DxkBJMvodRMoRBIjSeWOHEeN4Xf0fIvaxG/JUYRSoUHw/cD5vhKDqxWJR2xsLrQmToIZheBvq8k8q3p40EfgJxOWdA6aFHOYNM8mVH1Z5PYJEFldpEPBM3knSDzgtV0gehCkOHVd3wIBSwhIQSpit+BWvep+8vvP4Gec3tuKvZvjwByb7qiKSCFYwTYk6C3ptp6Pr+D2oqmIn6UeoziLkaAjZJd8hPuI+GnEgjABMSXUP96acCC3igSYcCqQuv+TRdMhNksaUaibD0iLbBfJINLfRE4udA57EGQS297swS+5Fy+Sq1S98Rp4QbsRvXTQanwytluu6+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpl/sV615UQSv3V/scQ2ewtG1kXbCLCt/ffvLMzVvaQ=;
 b=YrLwXl/phScSHVKU2l7WTN7l8wL93thrx9OibQ2e0Dh0i6dV8qLwHubDJcxwquJOwfIYKd9A94ot8uGuZaie05YoIgNun4uSleJpBbvJGT2JT18NdYM795X/dNbGO3dn0JFcp4qI06/viIY5Ph8WdQmE7IcQOKDkIe7W0qDSZE2KiuaChVfG96Hogd5AxjfpBI7pmEFamhe58LuiLtAkwc54J5S8WAesT5D20NLX6j+juadgr/lL/4f39/FSrgUzGSuntQQ+wBfXyHhH79gmwmo7SNPjIsZsGhQWqSkRaVWnbyJjF9cHH+KdSTIN/ROUnMhwRDq2uQQbwKc5aJBQdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpl/sV615UQSv3V/scQ2ewtG1kXbCLCt/ffvLMzVvaQ=;
 b=ijCv6CbhjsczH4f6WZ89iZvTwZ4/AHb05/fxf1LqeGnSfOMCMsNhmURKD051tyYu4lEGpFyqn9nF6taUuCaIhByB/W3bnJWimfAc2mg67SegHn0x57hwnfM4bERw5ku/5y+KRJeWXVlQklLCjApGQ2Vxc4ixCOOR1IVa0tMbugE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA6PR08MB10661.eurprd08.prod.outlook.com (2603:10a6:102:3ce::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 18:24:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 18:24:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "festevam@gmail.com" <festevam@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>
Subject: Re: [OE-core] [PATCH v3 2/2] mtd-utils: Upgrade to 2.3.0
Thread-Topic: [OE-core] [PATCH v3 2/2] mtd-utils: Upgrade to 2.3.0
Thread-Index: AQHbgv9WX5PNc2F3lk+VFuXcuSlJrbNZ8WyA
Date: Wed, 26 Feb 2025 18:24:55 +0000
Message-ID: <706DB201-D621-4A78-B3E5-B0F775ED5EC5@arm.com>
References: <20250219185119.2168718-1-festevam@gmail.com>
 <20250219185119.2168718-2-festevam@gmail.com>
In-Reply-To: <20250219185119.2168718-2-festevam@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA6PR08MB10661:EE_|DB3PEPF00008860:EE_|AS8PR08MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b2e2f97-e830-4e85-2b1d-08dd5692e413
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?L2M3RXJkUnl4SWJNdnFidE5Pb3ZlTGhtU0F6ZS8rUHA5TnlscjB4V0t6L1l3?=
 =?utf-8?B?TjBrMHRsRmU5UVFERC92MzR3ampEZ3lQUjRscnJOWTlSSG9FNGlYOVMzeDJU?=
 =?utf-8?B?MHBLNXFJTTd3VFB0bzhXS0lSK0xvMERQcG9GV3ErZzJxczNoaGxkM0lDMEEr?=
 =?utf-8?B?aEdiSHI1aE4relJxeUhTR2lCTi8zZzhHdUN0WVdrV1ZFeFhkTS9EdWJwVi9v?=
 =?utf-8?B?LytPbHV2eG5FWmZmL3BUdjV4aXByYW0ySmp2empLa1VVN1dHbnFPckdlSVZt?=
 =?utf-8?B?cXNFV2ZwQ0JaYlhsSlQraVc5bU9nMU5UMm4rdGdrVWgwcVFJbFFxR0dUMXBv?=
 =?utf-8?B?a1o4a3FKalZuRlVsbEZrUUczQ1h6c0h1M1ZJNmtVdzJNakxhV1p3WlNlRVQx?=
 =?utf-8?B?Qmt1bGpESDVmNmpVKzljaEpMOWVOd1BpL0RzSkErb0U0YkJWYm5CN05tTkJU?=
 =?utf-8?B?VzQrMDZNdTV0RnVPMTR5dlNtSS83eTl4V25peUhXODBLZVoySFZSL0gwVW5K?=
 =?utf-8?B?MVZ4QW1YS2JiUFZsTUZNbHY0Qm9vTW5MRGE4ci9HSXZjSE0rNnFpZVVpU2Uz?=
 =?utf-8?B?dUJhTUF4OS80M1JyaWdCd1M3bm9zbmErUllPb0Z3V0pZcnd3VlptOVhYaFZM?=
 =?utf-8?B?eW1WUHFnTCtQdEpSNHJnWi9iWHdkZ1VoRmcyTEVhRE5FS1V0bnQ2ODBmdTAv?=
 =?utf-8?B?a3MyT1daR2JRM2pDZTc4Nnp5M09uamhqZDNwdmlsUldQTjFnSjJYM0dGTDVV?=
 =?utf-8?B?TEJlaXVrUlpNM0docTB3MUtpMzQzSnNLTUthSkt0QXhvNVdvTGpVL2ZTdldC?=
 =?utf-8?B?a1FyejRtb0s3SVc1RmZGT0pNNFQrcFE4K2RzU0Z4UmRadzhScG1RallIL2lI?=
 =?utf-8?B?dlNFVTBUY3l2UkIzeWlodHpCendGbERuajY2OE1jb2pqQmJta1JUd0xneGRM?=
 =?utf-8?B?cmtjM2tBZ2tWdURJb1lzK1d4cnIrckwvNVJrUGwrS1RCb2R5MmRMOTdnV3Az?=
 =?utf-8?B?RTVmdHZOSk1hWXN6di9IdWlrTzJLdXpTWDRyTVBrZDQrWmZRT0pxamFWMDR1?=
 =?utf-8?B?a29LTFFzZkFROWdwSDR0enhMYU54SGNlaUNHZzJwMHN0L0tzaTRubHd0ZVN5?=
 =?utf-8?B?bUl5MVZnUXRhaElXSEkvNmRDK1pWRUoyZFNLZ1V1aXA4enk2OXJRLzBaVDBp?=
 =?utf-8?B?T3ZiR3l5RVdwZWZqVHRYSjFaSWtZeVpZWEtGckw2dkZZREJCdU93MWhXaU5p?=
 =?utf-8?B?c2J1YnlaUHhQTklmNXBrKzRCLzRVaFR4WmQ4ZmZubXZLVzRzZktrZzVTTHJv?=
 =?utf-8?B?THdGUC8vVllPbUtmMUNDTHVZMWNlUUY0TWVXVytxamF5dGs1L2FGbHk1Z1V1?=
 =?utf-8?B?ZGNNNXhub0VEV2VYR21acE9UaklHMFpqSHBLTDhrQ3hZUmlLQ05UUTQ1RDlP?=
 =?utf-8?B?UUcxS2JDb2NXcHdtcVRoOHlMZWdzOXd2ZWxaUFEyV3hnb0l6eVR1Vm5ZVVhV?=
 =?utf-8?B?WFVMYTRldFhvQ0Nxb29MMlRPZEt5VWo3UURSYk94cDNHMG05ZEVzVjdlTTI0?=
 =?utf-8?B?dXJ4YlJ1aUtheTZUMlRCSEZPRWtFNjV4LzhuN2x3aEV6N3p5THpnQllqTi8r?=
 =?utf-8?B?eXB6OHBHenBqVlRCdVVCQVBQSHlMR2hsN0IvOVVyaUVGOTg5TWJJRDBXR2Jx?=
 =?utf-8?B?YUdUMEM1NUdOS3pFM09oNGZVZUVEZ1hxQXpZRXVJNUlGbTQ1SUlrUWd2WDF2?=
 =?utf-8?B?cVZ5YmxNZG9xS1ZKM3Zwd3N2cWQ0NTYwdmY4SFRRYzNNSFRNRCt1ZzYzNFVX?=
 =?utf-8?B?cVhtUGhTMGtDam1ORnRZRTNHTTR6MFZ3aDVsMndPeXlORzYxUDU0Y2tJRHl4?=
 =?utf-8?B?TlU2THFvZU9ZMjVENTNjYllhSEVLTW8rM00wdWxsM2x6UU1Qa0ZYbGRmeUh1?=
 =?utf-8?Q?oqjm5uapohY=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9214CF3348F19547AEC73B3F45232C25@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10661
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ac310712-55d7-4999-84e3-08dd5692dec2
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|36860700013|376014|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WDJYRlRUM0dRTkNNWkdHQWhlQSs2Nlo2aHlWdFdTVzFJN0k4SlNRbTBtYlow?=
 =?utf-8?B?SUZsUGtjTTZkNklkekF5UTdXSFVHRjRhMVVqM2VOWFBSR1JSSTB4VjgrMUdJ?=
 =?utf-8?B?VElkWlNRTWI4K0h3cGUyakhHaXRoc0pybTZ5ejNtMlFwdEdqdEZFTkRZNUxm?=
 =?utf-8?B?bXZvNTk0cVovZnJGR05MaXBpbExRRHRQTzNjSVY1bURRYVlXSUVhaUJ6dXB3?=
 =?utf-8?B?cDZEWThrcVR6TisxT0FXV3kzL0xFanNTMlV4RWpuYWpKRmV1Z1l6U0w3VHVi?=
 =?utf-8?B?TGhyUXFoclNLckxnSjNQMzdUY1JocmcwbzViVUJpREsvZGhrL1NwTENOeDgw?=
 =?utf-8?B?OHdTRkFETHJUWVE5M0xsdGVQN1ZTSWdtQ05rQ0JETUxGZjJ1Z3FERForYnRj?=
 =?utf-8?B?UWtCNDM3Wk9qRHRNeklMRVU0K0IyOFZSK01ZNS9seXp6anNjdDJ1Q21MaVF2?=
 =?utf-8?B?VkpEdTQ2cyszM2twTG00cWpOOHR5ajJDWVE1VEYvY0IzRENRck55NDNxbHht?=
 =?utf-8?B?OWljQXEvWUJZenVxMEJsR3BpYUJXeDN3S2NOMVpSQkFmcGpBdHZRQUs5WjMw?=
 =?utf-8?B?K0xTUVlPM0NObUZmYTZ6QjRPbGxNRnBub0ZKUVM1NkE3eWJXVldmdUVQNHlo?=
 =?utf-8?B?Tjk5MEk5c3Q0NWpvRUdlN09HWTZtRDhOS0gwbWZRQjFjb2lGZUFZYkowZTNt?=
 =?utf-8?B?d2daSmFDaEJ3VnhNNkp6YXI1a2lyZU5pNThUSkFNTHpaUS9VU095NHkrcmFl?=
 =?utf-8?B?Nzhrd2UrTHFBOEQwL1hiSU8wQU1jYzV2VjF6STZ4QTF3N1RwR0hmVFIveldP?=
 =?utf-8?B?eENURGhrUVd6K2tuRkw3d0JEWS96SlJPYnVrSGkrRDVsVFlDd0ZVeTZhdmNx?=
 =?utf-8?B?WHJzUUpoaloremFoZmcxR2xZK0xiMzFaTUJOWGVkMUxJZUU3K2t5WVRXdHR2?=
 =?utf-8?B?bW9pQmxNbWJmMml5SCtSeUo0WDV5eTI0TzBqdzhhOWpiYloxSFdtUUxJYTU5?=
 =?utf-8?B?M2VyN0xhaktlMUZLMnQzcU5QS3E4STBtRGtJdnNRNmJackFITUU3SGlGay9O?=
 =?utf-8?B?R0lDbi9yK1ZIZTBPYWw5RWNBanlsaXhXbkdNOVI4R2c1eno1WWVPOEpPU1pR?=
 =?utf-8?B?alcrZmhCL0RUcVNxSGdHdUtwWVUwS2RRVW5WY21NVG5sN1Y1aHBvcXhsQ3Vs?=
 =?utf-8?B?NG1RbXQwNnlGWnpaUWNyczJhM05TRDRIWHVMSzVIaDFsVUU5eFRWcHB3SUlC?=
 =?utf-8?B?a2wybWNuZzVUU0pNRSs5Y3cvWE44VHBoTHJHSk1BaVFqVkNQZy9BQ0NyR21G?=
 =?utf-8?B?bFhzNU5UUXE0OVFFUmlnQmJuVGpiZm9JcTZSOExyN1RSWFdUMmNpVlpqeUVF?=
 =?utf-8?B?WitwcTBrZnl6K0RXV3Z6YTJFdUNiK0lQS0RtOEpsaUxJaUd0K0FGc1drMENu?=
 =?utf-8?B?YytQV09LSEwvRU1hTk1tSWpBMnBFUVR1VHluQTVhY1BrY1dGanFyVjhKc3FV?=
 =?utf-8?B?UWgyZThCVDZ2aEZzazF4TVB0bjR2bW9YcTArY2RGWDBYU1o0ZkdPQWlrQU9X?=
 =?utf-8?B?bXA0NGdRckNFQXlsNFdwekM0RFVKNHFNK1krcWJGcnZWZ2VkbUZMZVBzMXBn?=
 =?utf-8?B?SWE4KzlMa0xFYWNmTUFPWEorMXNMYm84SXRzKzVqc1N4ZnVmSGNvaDlldStz?=
 =?utf-8?B?eEF6YTROL0Q5amxqdVhWY1p2UTlqYWRBb0hRWjBSWksvODVHdmFPdEZQOUt5?=
 =?utf-8?B?UGNQeSthU2xmQkJtSEI5bmdlUjBjcXRDSks0NGhkWEtqSTJpOUZlTVZYWTJM?=
 =?utf-8?B?cUtHZEVLcWVwSXQxb01wM0ViOEt1NzJKOUpxUnZKK1dDK2x4UG1UQ2pHSXpt?=
 =?utf-8?B?alNxb2llQ1ZVeUxxQkxYVTBiYzRzeGZRNlJtb3NFRzBpTlFHeW1HM0xyR2pS?=
 =?utf-8?B?bk5RdzhsRmExRlF4TGZZeUJMd05wWXBVYnY5bE42RUdYSGtPalhBM3dvdXlJ?=
 =?utf-8?B?TDRRZm83VWFBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(376014)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 18:25:04.7997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2e2f97-e830-4e85-2b1d-08dd5692e413
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9217
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 18:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211971

DQoNCj4gT24gMTkgRmViIDIwMjUsIGF0IDE4OjUxLCBGYWJpbyBFc3RldmFtIHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIDxmZXN0ZXZhbT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+ICtTdWJqZWN0OiBbUEFUQ0ggdjQgbXRkLXV0aWxzIDMvNF0gY29uZmlndXJl
LmFjOiBBZGQgYSBjaGVjayBmb3IgZXhlY2luZm8gYW5kIGJhY2t0cmFjZQ0KPiArDQo+ICttdXNs
IHJlbGllcyBvbiBhbiBleHRlcm5hbCBleGVjaW5mbyBsaWJyYXJ5IHRvIHByb3ZpZGUgYmFja3Ry
YWNlDQo+ICtmdW5jdGlvbmFsaXR5LiBJZiBtdXNsIGNhbm5vdCBsaW5rIHRvIGxpYmV4ZWNpbmZv
LCB0aGUgZm9sbG93aW5nIGxpbmsNCj4gK2Vycm9yIGhhcHBlbnM6DQo+ICsNCj4gK3wgL3dvcmsv
ZmVzdGV2YW0vb2UvcG9reS9idWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4LW11c2wv
bXRkLXV0aWxzLzIuMy4wL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL3g4Nl82NC1wb2t5
LWxpbnV4LW11c2wvLi4vLi4vbGliZXhlYy94ODZfNjQtcG9reS1saW51eC1tdXNsL2djYy94ODZf
NjQtcG9reS1saW51eC1tdXNsLzE0LjIuMC9sZDogdWJpZnMtdXRpbHMvbGlidWJpZnMvbWtmc191
Ymlmcy1pby5vOiBpbiBmdW5jdGlvbiBgZHVtcF9zdGFjayc6DQo+ICt8IC91c3Ivc3JjL2RlYnVn
L210ZC11dGlscy8yLjMuMC91Ymlmcy11dGlscy9jb21tb24vZGVmcy5oOjcxOigudGV4dCsweDI1
KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYmFja3RyYWNlJw0KPiArLi4uLg0KPiArfCBjb2xs
ZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMNCj4gK3wgbWFrZTogKioqIFtN
YWtlZmlsZToyOTU5OiBta2ZzLnViaWZzXSBFcnJvciAxDQo+ICsNCj4gK0ZpeCB0aGUgcHJvYmxl
bSBieSBjaGVja2luZyBmb3IgYmFja3RyYWNlIHN1cHBvcnQgaW4gbGliYyBmaXJzdCBhbmQgaWYg
bm90DQo+ICtmb3VuZCwgdGhlbiBjaGVjayBmb3IgYmFja3RyYWNlIHN1cHBvcnQgaW4gdGhlIGV4
dGVybmFsIGxpYmV4ZWNpbmZvLg0KDQptdGQtdXRpbHMgYWxyZWFkeSBoYXMgYSBzdHViIGltcGxl
bWVudGF0aW9uIG9mIGJhY2t0cmFjZSgpIGZvciB3aGVuIGEgbGliYyB3aXRoIGV4ZWNpbmZvLmgg
aXMgYmVpbmcgdXNlZCwgdGhlIHVuaWZzLXV0aWxzIGp1c3QgbmVlZCB0byBhY3R1YWxseSB1c2Ug
aXQuIEFsdGVybmF0aXZlbHksIGlmIHRoZSBhbnN3ZXIgaXMgdG8gcmVseSBvbiBhbiBleHRlcm5h
bCBsaWJleGVjaW5mbywgdGhlbiB0aGUgc3R1YnMgc2hvdWxkIGJlIHJlbW92ZWQuDQoNCknigJl2
ZSBqdXN0IHNlbnQgYSBwYXRjaCB1cHN0cmVhbSB0aGF0IHVzZXMgdGhlIHN0dWIsIGxldOKAmXMg
ZGlzY3VzcyB0aGVyZSB3aGF0IGRpcmVjdGlvbiBpcyBiZXN0IHNvIHdlIGRvbuKAmXQgZW5kIHVw
IGNhcnJ5aW5nIHN1cnBsdXMgcGF0Y2hlcy4NCg0KUm9zcw==

