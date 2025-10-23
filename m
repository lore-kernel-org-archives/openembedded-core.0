Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71408CCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 12:18:32 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.16])
 by mx.groups.io with SMTP id smtpd.web11.18857.1761221902924791271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 05:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=geF4/Sm/;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=geF4/Sm/;
 spf=pass (domain: arm.com, ip: 52.101.69.16, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vcH7PRfo+LesHsWFTxgAon67jkpYGd4YHeXgz1MTie4mygZj6pf/YgdChSjPSvfdSpXtoi7ywdiNd4DQfXjgHfKWb3tFY1aCMDGAtBW8rEquEuA6qweWdx6pzbuNCpR8ox4gCzDyDfWAeFO0u+4pCf+O+2UU5MbxcSb3Arnqodn0v5TIBDMheonrK2cLxVZlv7koV85+wIlfnqPoG+tQ9e/jB/a+Lpf+rJL9V193scb3kg1W5Tw/BktfPeUQKoWWK2uY460QdOi+No2naylqG2piqNelEpb+8tZnWpH75vU1is/VUDr6PF+aCZXLPpTSAV+IOhbT/b1BkSqfSLXyqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQ56e6lzWA/KdfYCtR9FT4hRT/rayoExkRuwedVijyI=;
 b=s1C3B1mBqg/4kbrrEc3z7gZ8yTq8amhO6guQ18/3LgsoHKyjAkhImJ5AXn0NR+unYTMFcyPqKPNJTXg/de0DPrvD9ywx1ANNbHc9bdDANs7Dn8lLAjH9JDQ8gizIbkz7kGPXaqhmEGXOYintkqp2U9JWJxq/k84hRwnl/t2h2j7cxJad7Rp+e4SGlvroZOUfL/miUe9GQXbwX4+UqtLJMkbHiz4Z+SacQEuQNIEq9gENYmlKHM/VVSA1vr0EBuK/amf0/H14BaoydxWEIZC++B5CVvb1USGW5hqtdt5giUhlVhVoMLtKLOaYHTEqel0xwLjMnEfVlvAmCAzXyktFFA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQ56e6lzWA/KdfYCtR9FT4hRT/rayoExkRuwedVijyI=;
 b=geF4/Sm/8vO4v4ivve2UxazJk5g26roLYv0dpDwCDLLH54beMLm1VwlqmghyATjvxYa18jQRBW5XJp/8R1n5E3pWndI42bpDl8kWzqQwKem65dOhlo0gcv1qd+hkkn44DO+ax+sdWwtPf06O3qHmKNrsnR434u1EX4k8jc+T7r0=
Received: from AS9PR04CA0101.eurprd04.prod.outlook.com (2603:10a6:20b:50e::18)
 by AS4PR08MB7904.eurprd08.prod.outlook.com (2603:10a6:20b:51f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 12:18:18 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e:cafe::b3) by AS9PR04CA0101.outlook.office365.com
 (2603:10a6:20b:50e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 12:18:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Thu, 23 Oct 2025 12:18:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffycSuNjCW/zmEtyU3aHAwD+KsvQimzCCzNxaz9JUkyBSv9NaqLsb6DcDNF3/rmDIVCcl9tAFmwuWzTWOFxLwW7AbZ2IedJiZ8CXHQhjGhWnWkT+xatluGJN4NAvO8CPqexn1nU4EoXds9ojGVqm4iccpq/z7zsQfN6gVZg7RVDZDCCWBwcYEexcUWxWrxaYlKs2T/t1VOmOyBrcu1kE+5E2xYE64DCrpDXYBKP3W4RiLfmIi46Ts+5GvqyIKB8BfBC5kgrThDG61Gqfdi/4Cv83BlKoZnE0qqVycr+88r6zF8ujCML5ONPq6VM9fchXJc0T7mrSfXMLlSk315HmQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQ56e6lzWA/KdfYCtR9FT4hRT/rayoExkRuwedVijyI=;
 b=HiT9opCHUj9GWoAhoiU4rb7P1kaO+/lc+PBDjkKkpP2lqF1nHCGn1s9tMJSo/DRKt4nOc2I05qviuPR3HgU4D45BE94Xvq+OFSNm8Vyg+/+vCuIOPwdWLuG1fgEY3A3ANef80LD7kj7sAT8nSEdB8La4D0ZP3RwkrJiGxsLDrv9y2CsWWJxIfQrghYoBSz0jdKoTRRszVW0cLQ91pGEvoRlZ0u+7V3KDFQEuBdhoyoV5V9rsC+0X/pcOFbkICvq5PR2Fxzd1AZAi1K2yvPN6rvKoFGCZbjd8azzZziKkAJ4Wj9N2RsUSHaz3zxxic81FnZ2Q3myrNuC+p+mFS/oS0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQ56e6lzWA/KdfYCtR9FT4hRT/rayoExkRuwedVijyI=;
 b=geF4/Sm/8vO4v4ivve2UxazJk5g26roLYv0dpDwCDLLH54beMLm1VwlqmghyATjvxYa18jQRBW5XJp/8R1n5E3pWndI42bpDl8kWzqQwKem65dOhlo0gcv1qd+hkkn44DO+ax+sdWwtPf06O3qHmKNrsnR434u1EX4k8jc+T7r0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8878.eurprd08.prod.outlook.com (2603:10a6:20b:5f0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 12:17:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 12:17:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "deepesh.varatharajan@windriver.com" <deepesh.varatharajan@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Sundeep.Kokkonda@windriver.com"
	<Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [PATCH] llvm/clang: Upgrade to 21.1.4 release
Thread-Topic: [OE-core] [PATCH] llvm/clang: Upgrade to 21.1.4 release
Thread-Index: AQHcQwzJUNzYHzCzjUWIfF6Oz7hojbTNlqqAgAIRPoA=
Date: Thu, 23 Oct 2025 12:17:42 +0000
Message-ID: <E2D3DAD0-C0B8-4AEF-A812-0180CEE1A50D@arm.com>
References: <20251022043126.989530-1-Deepesh.Varatharajan@windriver.com>
 <CAMKF1so5GsGtuE2UfvxPmiUBtVv7w_y4XHuc1t+q1_C6SH=Amw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1so5GsGtuE2UfvxPmiUBtVv7w_y4XHuc1t+q1_C6SH=Amw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8878:EE_|AM4PEPF00027A6B:EE_|AS4PR08MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: ed38bfed-789e-423e-ca8f-08de122e3ece
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?TVpyWlI0SGEwSE5ubkpGcDIxZTlnbDZGRWFSY1cwYWZoU0NVYzBJcCtFbXVG?=
 =?utf-8?B?YzNmZzF0ZXk5SkxzQVRpVEsvQ1pYbXRaZ0cvTUxxdUFrRGFMYllKV1JPL1ZC?=
 =?utf-8?B?NVM1dnVyL2d4U0NyTDdCa2IyVmNrd1FxWktpbGkyZE1zRzJCalVBNTNMMnlv?=
 =?utf-8?B?ZmtsOEFMZDYrb2Y4M0RScWxoek5qamM5Yit5Ynh4MkloQlp4cFR5aWxqM04y?=
 =?utf-8?B?SDVKQmVWUWZUZkxDWHlvdmZRZmNEcFdSamE0aCs5SkUxVUpmTTU3UXp5ZnB5?=
 =?utf-8?B?S3FTQ21mbVIraTVNcDdrUmo4eVZlZ3Y2T2tSTld0eWdFcnlMUmtSb0hQNVZl?=
 =?utf-8?B?Qk5zNFVpc0FCUlR5STlqZENrVTE4ZHFSQ05LY28veUd4VkEyRSsvTUZJTVBu?=
 =?utf-8?B?KzFhSnpXL1ozaC9DY2hkaTZ4ZnNrSFUwT21mWEJjTUxlZGdZTmdmZDB5R3Vs?=
 =?utf-8?B?QmlJbjkvQTFXc2x4OFNsYTBlSHkvUzRuYk41N1E2WGJuYXR6WVFqYTRhSjIx?=
 =?utf-8?B?SGRLL0wxU3Rxa2xTNkFmM0dEaHMzQW1KdXZFRld3RzdtZSsvWFdlUU9HMmxE?=
 =?utf-8?B?SWRDTU5yTktKOHJHdDBqa2hheFR3MGVnL05EcmJpOXJ5QW4rU2VIUzVRcVZ2?=
 =?utf-8?B?OFZBQ3Q5QTNSd3ZYVDN2Wkc1OThwZGJXTWo4bEFzVm42Q08xMzRXdHY3RFpP?=
 =?utf-8?B?U3FoTFFRZzhDZE5BRVNmbXRHQWhER2dJY1c1ZFRRd25FOGFxOFdRcysySWRB?=
 =?utf-8?B?R0toUXZVek13am04cFRaSW1GaG1NU3hSRGJlUTdDVGVUMFJpa0U1NWYxRVFl?=
 =?utf-8?B?QjJSajJMSWJsbk1xSXlHc1IvYUJ1Q290alJYWjJsK0Q4REoyZUJid1kyMWNi?=
 =?utf-8?B?ZXJHcEE3QzNvUVlnRWRlRFhac0d2YTVvbTRtSnJPVHpxbWlMVUpJMHJRSHBE?=
 =?utf-8?B?d2I3TjBrV3hmU0Zsb21hWjFGZmRNWHEvM09HUWtta3pvUFh3OXY1ZlNzS3RI?=
 =?utf-8?B?VTVzSVFDQlNpK2ZpWXY3QnhYdjMzODQ4ZGpwV1luVURKR1FMc1ZSem94MytD?=
 =?utf-8?B?VjRCSCsvM2xjUU5UUnhvVjhubkdWUUppNXNlZFRMcUU5RGRGWkk4ZWRPMTdj?=
 =?utf-8?B?Y3RsTHd6YlFaajBxTlRaeGkxN0tJcWE5ZzFqem1kdVd3NU5yMzErUmVsNWlR?=
 =?utf-8?B?TzNGMHVRa3JpOGVLaUZVZnhNMWRIMG00ZTg5dDBSbkRRVnBhTHBFQkd5M0xv?=
 =?utf-8?B?VGJNbGVYSkdaS2syN1pUUjM2eFhrcFFGSTU2azFON3Bwc0pCQXlrYzQzT0I0?=
 =?utf-8?B?Q3E4YkFObVhESzkzaXlKdUdxdUZ5RE9WeHcrK3JNcTFrb2V5czc0aFYxTGVy?=
 =?utf-8?B?bDJkeFg1V0pJWGxKem40UUtpYzlpVnQrOGsxTVNBVWRpcHRVbkhUcGlsK1BO?=
 =?utf-8?B?Nlh5MFhIaXEySll5YW5EK0NpdTJrbTd6VTJ4TmUvOXcwYjFuTXM3aXUrSTV6?=
 =?utf-8?B?K21zeEpBR0lBVXdFMmZlNUliV0JQUHdtR3orOWxFa3kxbm0wQ1RLeDJjYzZv?=
 =?utf-8?B?OEZJV3d1ZWQ3NW5kU3pmS0tWd3VSNnhvdHZlNVNEY1N4MVgvQTkyNGdid0lo?=
 =?utf-8?B?MFkrZ2FLUGRxM08weW8xM01URU5tVHdGZVN1Nis1QTZmT1UrTlZ0V1FNUEtp?=
 =?utf-8?B?d2EzekIxV2EzNUZzM0s2NHEwd3QvYlc4VmR0a25LVEhHaUl1UmxTa21iVGxq?=
 =?utf-8?B?cFIzbjV3RVhBYkRmY3VMaktrTFowejNhcUtGWFVhaVZnaytONE94S2xjM2Zo?=
 =?utf-8?B?OU5OK0s4UytzcGFBK000UmJUMmJCblBkQ2YxZFN1VmU4YzhBZFNYL1E5UnpJ?=
 =?utf-8?B?WlRucVI3L2IvbXFVL2NBNG96OHFjRUtFN0VYTXFEa29XTDVPRjA5Y2o2NlN3?=
 =?utf-8?B?SmZzOFBJVlJHRTBLbGh5eWtJWGdBSkF1a3BjeVY3dEtDSHo2TjBZcldNV3Qx?=
 =?utf-8?B?K2tyN0tCMjZ6NTB5dmsxMGtibGMxdXNaWHhJZDN2UktIajFaMmVQRml3Z0JK?=
 =?utf-8?Q?+3huAp?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <221B676F03DFE945A6AD782227B6AE12@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8878
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0d9a41fa-8e64-4aa6-f568-08de122e2a6b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cTRKU1FqUzlIeVZLOWNVTk9yWDBmLzVrb010RUNMUG9EcGpSSnIvNUI2VEdZ?=
 =?utf-8?B?RndhRWVabTZlRkJKRWhac3g2cTErT2F2SkxjdXBObGUrS29KMDhucFFCek9z?=
 =?utf-8?B?dWdPOUt2RzNCd1lrSlg2RmVXdEdkZ1l5Yk1DVHpqTlp4UzdNOG1wQ1NWTjFv?=
 =?utf-8?B?QVY4ZDE4aUUxSDNsMjFBcjhpKzU2T2ZCQ1BUMDYyTDFTVW9vVmhrMTN2YjZC?=
 =?utf-8?B?VHl5N3VWdTB4ZVhVdzlGalRSUUhEalBMMStQeGJleWNtQmpYTVFJcFBUdS9Y?=
 =?utf-8?B?WXU0T2hGNG5nVGg0ZXQxR0VXcTZOUmo4RDdxdE1YTGlDZWwvamJoNFFRMTZU?=
 =?utf-8?B?M1FWLzZBQnRnekJYbVVFTWZnVkFLU3oyZVZlSTZIUWczUERjVVRRbHcwYnVq?=
 =?utf-8?B?enNnd3lJRENTTUZaV1ZLQ3BNTVloRkM2QUZvMVZ5S3A5NTZwSXNRYlJQaE1V?=
 =?utf-8?B?OGRNWXZFSmN3SFYrOWQwZHNFYW9RS282OHdaZ0c2TzRWa0N1bnc5TG52Q0xl?=
 =?utf-8?B?YVhtUGRjMmhsWmNta0JDMFE0a0szUWlKMDRWTklBWnhYK1NYVkNQM3VCNlo5?=
 =?utf-8?B?T05KV01mTXBSeFJlQW5yRkI3WUlYeTQ1RTRDUCtsL0g4RlRtQXgrUUlMeXVX?=
 =?utf-8?B?T05XbmM5K0o0cldBNGlRa2hid3FjMkViMmszRW9vYmpQS05aNWJkdnhpV2dR?=
 =?utf-8?B?NGxwM2dvRGJiRXpuTXo0ZXVuTUh4dEpFUnJqbHFnYUhFOXN2cGkvZkJqSElO?=
 =?utf-8?B?VVppeFhjbW1VeVJMYXdNcXo2amg3WVBTeTdDV2xkbENrWTRZd1NVZ1dIOEFs?=
 =?utf-8?B?RlJ1cFlmcjFLSTJMYVdCdjcxSUpTVEd3Zkd6TU1BZjgrRDk1MGhuWTc5elEv?=
 =?utf-8?B?MkNmY2hobWkyTFBIKyt2b2NySEVUWUQvMXVrV1A1Y0RGc0w5RHFoWFRBellt?=
 =?utf-8?B?WWZpWFV6alByOUdKVTNKNkJOM2VTM3RHT3hhRkxsZldkT3ltU1ZlZ29BUnlU?=
 =?utf-8?B?Z1Bjc3JrclRrS3Zyb1FTRDl2RHZIemxKS0gxR1R0VGMzSDF5R1JjSmJMT1Fv?=
 =?utf-8?B?V2V0RCtmWE1pZW45WEtabmQwbHAvbFlYa0Z6MFBLbk1SMDQ0K1ptWlRiWlU5?=
 =?utf-8?B?VXMybHVIbFVKRS94ZGJvckd5eXN0UDBwU2tTRDhOeTlHVjdScHltRGt5UDlv?=
 =?utf-8?B?RTZINFlqWTlHYzMrcmdKOXI0anhSMTNDck9LVGZqZUFlNjJmVWFKR1ZJc2Fl?=
 =?utf-8?B?QkR2MXE4QlhUQUlJeTI3ZFBqNmF2MDluUWNvM3BDVTZEeVhjVVhpUUtQb3VO?=
 =?utf-8?B?dG9yQkM4YUcvQUlWYTR6bmM5d011VCt4azIxQy84V3N2cWloZWZsVm93aDll?=
 =?utf-8?B?NEVsL1diU25VV21zUnN3Yi9ocDJhYTZkdG5vRHAxcjVMaVN3MVhRVDZmZ1Ro?=
 =?utf-8?B?M0dOdU9rQmpWUzB6WXU4bjE1eXJacE5mOEFyamxUWUtLZncya29tdlRLcS85?=
 =?utf-8?B?K1Q4QzBTWE5RTmJVdkhwSUJUNTZFVCtaSzA4djlrRjZLVlBmdG9rcGloSzR3?=
 =?utf-8?B?VFdieUkzT1lSemxNaE9iSFltZW9pemVYZmNVdlVKQ0tqQ3FRd1dhalU1L1Rw?=
 =?utf-8?B?cGJEUlJCcVpxa2l1QlNJcWszTlpickkrTlFRdVVtRzdiVmhhWUxNZVRndngv?=
 =?utf-8?B?Vmp0d3BsaTJweSthRmtDanVxZ1F0L25xWFBJTUlxMzBoQ3Qyeit5bHJIQnhx?=
 =?utf-8?B?WWJGcmdRVGJrdW1LbEczOUdqcFBqK1d6K2JXQ1oxOUcrVnloTmFSMzBXSlBE?=
 =?utf-8?B?N09YYkwxaDRrOXR6TkQzOCsycjF6cjBCR2ZYTUQrZHo5bW1xVjJPVXR6VVBN?=
 =?utf-8?B?NXRDc2RjWk1YRlRIVm9JUnVFck9IZTNVZmJjZ2pHM1FJT09YdUpxZmd1VXls?=
 =?utf-8?B?NGI1b1pRWHNNMWhzKzJrNHZpbHVJYWNzN1BVL3BEeVozc283Rnh6Vjdqa1RS?=
 =?utf-8?B?SU01OU1Da2VaSG5IQ0paTGlxOWs3K2VKamFqRmNSUEJvSGVHMGFId25MQml2?=
 =?utf-8?B?djU1RTFuR04zZm91eHB3N3pCV2xPNm1keWg0RkxtWVZlNXp5c1dXbWQ1SHNv?=
 =?utf-8?Q?WViM=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 12:18:16.3789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed38bfed-789e-423e-ca8f-08de122e3ece
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7904
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 12:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225252

T24gMjIgT2N0IDIwMjUsIGF0IDA1OjQzLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gTEdUTSwgdGhhbmtzIGZvciB0aGUgcGF0Y2gNCg0KQ29uc2lkZXJpbmcgd2XigJlyZSBm
cm96ZW4gZm9yIDUuMywgaXMgdGhlcmUgYW55dGhpbmcgc2VyaW91cyBlbm91Z2ggaW4gdGhpcyBw
b2ludCByZWxlYXNlIHdvcnRoIHVwZ3JhZGluZyBmb3IsIG9yIHNob3VsZCB0aGlzIHdhaXQgZm9y
IG1hc3RlciB0byBmb3JrIGZyb20gd2hpbmxhdHRlcj8NCg0KUm9zcw==

