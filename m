Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAC6C369C2
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 01:44:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3054.1745372681184318625
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 18:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6208f37499=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N1UFqY020410
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 01:44:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jh606rx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 01:44:40 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53N1idOK008401;
	Wed, 23 Apr 2025 01:44:39 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jh606rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 01:44:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LO2SyobNp4Ex0tw7zr65HQ2Nof4qK7nF5fZ2twx1rNs9iyWlw66phSMrz/3Q4Ohf1BbqpiZc8wmybf8Y23DmuseLUCryftvSJwx3mIZK/x276zF8gr267YXLsHXrHUsKaw/riysA/ZS8HQJkG981EUHuDfY1wWx3TjtQ6Zsh0syuiMxh0QvZ0AOEogFWetg9fFxxCsef2ORHRZprv2D0hTSTBarRbwvRB0hwWvL1URGATcw2h+HaX2HCOLbOHqLJM+w9sUDdhBdPzzYcGug4Vigh7C+UHuoaNW6B/lRkQvTKwqrsqbmQbV7hAi3aWu92rshj28MWwkzH5JEljxanqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56+tJNm7SZ6ZjcJhrUiZQqdQHAdIoX+4LqvM1qx2S/c=;
 b=CZiXAJCsx6otI5MBBs9INLUesu+D8i+7D1iliPTs0DS0SV83u2zX6ijaRP1sKkZOyo3YriU1U0I/iKpyUkryIODcFgyqvTQiGBf4zEAURfznt+F+jr7alxKMn5yEuLeW9srOHiepVDZytKr0Ngk3MbR6stYhpI3tpz+8vVdTfBQ/ncB3XyCgONMM3xt7nD814QkIj7Z21N5n+CBo6Akl+QoyxilUsGQkHDBeYFOSEoSlygUsxzQU/mzAM70g3Wcsi93P9DkRKLVwgYHM3YxpU8ZKDavi8iw+8gSlikTrL6LTAevUdCIqpsYTwCgecfOv1bTA9LFDq53XwGrNztKZsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB8475.namprd11.prod.outlook.com (2603:10b6:806:3a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Wed, 23 Apr
 2025 01:44:36 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 01:44:35 +0000
Message-ID: <193dd655-c685-4f11-bce5-0d5cf1404014@windriver.com>
Date: Wed, 23 Apr 2025 09:44:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH RFC walnascar 1/3] systemd: enable getty
 generator by default
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Cc: mikko.rapeli@linaro.org, bill.mills@linaro.org
References: <20250422190053.3244331-1-ross.burton@arm.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20250422190053.3244331-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP301CA0014.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::11) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: 3650a632-c38c-493c-6a1c-08dd82086633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eXJNOURCZ0tSQjNoVnVrVG12cWlSekFRVFJxQmxCSWtVYUg2TnVBTVQxTE0w?=
 =?utf-8?B?QU5xTHFvdWNkWGVqemZ0R3dsTnNaamdGMldzUnNrVXcrb1hCVjFqVmFHNzB1?=
 =?utf-8?B?ZHRYaVRuMzJCMHR3OXlvRzVrSXpielRqaVhQT0tndEw5RmtIeFlrUFBlV1pw?=
 =?utf-8?B?MVRzcSs4aTBscldMeXFZcW9uaHpEMG9abG5QOEZnL1JmU28yTC94SmtmeVFC?=
 =?utf-8?B?R2dBUzlCTndWMnZSR0lLR2dCWEtwRW9KRUNFVklrTFJLaUNCaGFYSENrVlFa?=
 =?utf-8?B?am1JVVZEWGsxUURhcjJqUmZTOW9QNUlCeWx0dlprWUM4S1JhNEUvbk5QYmcy?=
 =?utf-8?B?eGlZZlBYZDk2dTFTbjlHK0ExcHJYQVV1RWtoZGo1TVpmTUV3a1JKb0NxZ1FI?=
 =?utf-8?B?elI0Mm9kZE9vQktteG0wbVRHNTlDVmlTUWhwbWxnbnFhZlNQVVdORlRTRmNz?=
 =?utf-8?B?M0NRajJIbm05Mm9zY2tDMGxwbkhRbXd6eENKZHFTZ3ZNdzFzQUc3STk0cnJK?=
 =?utf-8?B?cEladVlvaE1IMUo0K3dGcGhGazNIUFQ3dG8vZS8zWCs0SXk0eS9kWmdZQ1lw?=
 =?utf-8?B?SnV2Unh0bC9RVk1SKzUyQ0c5Y2FIalZNZVBFblFQRXhpZjFIOEgrSjRIbUxW?=
 =?utf-8?B?bm1pUXB1a0xoOFIvcFo2TEdxU3YwRk5tdE11TUozTGlKUng1dkNISEV3NlNV?=
 =?utf-8?B?Unh1bFJ6enM5L3hOZjlCdHRsUXhEd1U0VEJ3NjRmUHF6dXEyblRGZHRwNGZC?=
 =?utf-8?B?aHc1U09VTFFnaUhSZ09sOWtPYXp2ZEp5OXhPNWkyem4rZW5zWERQcDgwKytH?=
 =?utf-8?B?V1NOeXk2aWpuQjZGOVV1SzZoRCtCTTREY3JtUVdTNFYwYjJHUERwdi9uYmVq?=
 =?utf-8?B?akNKamltL1AzUUtqUkJ5UXJPQ2hNQ1IyTGFFbDhnaUgvLzdPS05OOG41SXh4?=
 =?utf-8?B?dUNyakgxdnYrKzRLNWJ3ZSt0YjVDSHJkVDRrdk83ZjkweE1LcS8zMk5TbVpJ?=
 =?utf-8?B?OVkxbHBDeEpoZXdYYlFSZjBmV2lMWjlHdUF5QWcva1M4aXlYMmFkTlNKaER5?=
 =?utf-8?B?Wmxwd3d2dW8xNzVaVjdSUTVoMzU5KzJmZ3RZZlNtTEtrQzZSeVNyUHdxWENH?=
 =?utf-8?B?dE9qQnd2VVpiTnZLT0s2YXlhbWpFd2krSmpURGdxTTh4OEd3L2gya3ZHbTk1?=
 =?utf-8?B?SnZMQWN6dTdqYUk4Q0tiV2RRU1gxR09YdGhZZ2FaRDRwVWVVREc1TDlwa2I3?=
 =?utf-8?B?K0N2QVkxbHludXg0ZVA2RGgyM2I4UjRJSGtUcU54eTl0c2dWNVNtMkhwUzM3?=
 =?utf-8?B?QW1YeVRDVDdGWTRuQXNaSS95QXltZ1YwZUZncThZeXdrN255eEcrVjdReFls?=
 =?utf-8?B?N3hJZWI0aFdVTlVRemtXYy9JMzRCZFh3dDIxbWFnUlV3bXYzeWhEdHhrN2s5?=
 =?utf-8?B?NzNMeXNPak1MNVIvQ1VFdXFLZG1GVi93WHhTMEtlVXE5SlJGZ1ZqT2N3TWhn?=
 =?utf-8?B?RVVIYmVqUGErYXhLbmxlWDVhdE1sQ2dkOEVPM2JtYllpdTVFU2VkVkVpWjRG?=
 =?utf-8?B?UmJBMkphdnlLcUNSRVRieGZUS2tzMU92Rm9YaTcwbXg5OFpFSU51UDRTdUtq?=
 =?utf-8?B?UVZNZEcyYlNDeGUrVGRBN3pWZXU1K2hUWUJIZG5hc0V3dDVXVnUxYkJLejFO?=
 =?utf-8?B?V1dZYjhvZDBMWVdsSXVjS0pqL3hmS1hYS2x5bU1DaTJaNG00bXMxMVdnU2tr?=
 =?utf-8?B?TEFydURwZTJZeGRrT1dSVkk3NG1pUWMrUXdvYTY1V1lDc3puNkFZalNVKytW?=
 =?utf-8?B?Y3FDV2JUNXFzb1pZTzRudG9ib0xRYUNxNjhrMU5zNnUyU1R1Tll2M3hXSGwy?=
 =?utf-8?Q?Xsm1NczE4/ZXX?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bG5rY2VzanBENHJ2OFc3cUhHVkNjSW9VK1ZaWnNwbTVvdyttUWhpaVJJZzFX?=
 =?utf-8?B?NjJmMFJibmpWMXBGK1cwZFY3b2dGdG5KZ1c2a2c1TGFZS3Via0VHZ0w2cXVT?=
 =?utf-8?B?bzlJNUVoY1orODF1cTcrYkJvdDgyd0xGb095ZXJUL2JBcjNsdExRYnd6c2pV?=
 =?utf-8?B?L3MzblpMRDdYQkJzdmlma2pLWjNCbG9vZlA1R0FQTm1MR2Z5NmxIdStBRUtq?=
 =?utf-8?B?YlJUUEJidHFndCtpWEZaWEJOT1czbzI0Wjl6eGJjMVRPM2Y0SzFyNm02UFNq?=
 =?utf-8?B?RmUyZkFqeElqY0hOeGF6dzVXZkdmQXd1L3ZrSkFUUkMrOVJkcnczUnlpcnVy?=
 =?utf-8?B?RElESjRsSS90cUs0UnBUWVpUcHlxWThlbStvdnhhRVBHczRrcndDWHVJQzdh?=
 =?utf-8?B?ZGZpRWdKTGdMQ0RNMTJ5TjhqRTdaYkV2UjZVd3k3MzNvUHcwY3MzQXRBZU0y?=
 =?utf-8?B?bjdCem0wZjRZTEU1N1hZeE5UZzJ0SHFSQXVNcVNFWDFSanFsMTkzUW1tVk9K?=
 =?utf-8?B?a1BYeEZ6ei93T0oxM3hHb1N6UmZIOWJJcjlvMWVCTXo5VVF4SXY2aVNoNUFv?=
 =?utf-8?B?b3UvUjRzY2dvSHZNakZGT2FwcnBHNU1ZeEJuS3BFZEMyV0d4b3pwUnFPeVYw?=
 =?utf-8?B?clVZVU1BWWNodHJxWC9yeitZYzA2bDhSS1VOY1VieDR0ay9mUUQzakZRRXpK?=
 =?utf-8?B?S2tDb0sydk1BRE9neGY0cXExZ1FSZ1Q2cXQ2ZWgvczFzTklvcWRBN09SSlpH?=
 =?utf-8?B?ZnBmQ2hOVjFJRWpzWTNnQkVRSUVZSWhJUzdCODVndVRGTzNFMFFpTW9LaGdM?=
 =?utf-8?B?VFVXTmhWcW9WVXAyMUJYL0RlV0tKWE9odEVsNHJ0REFTbm5BeXlRYTNjdHp1?=
 =?utf-8?B?a256STJJYzl2cXFGUEhkMURhRmdYc211ZUtadmVZb2JFa1BDMGdhUzY4cTBF?=
 =?utf-8?B?WE5RL0lRR3V0d0NnNGlncjJjQllXekxsekw0NWl0TFoxVHBxZ29YVGtpanFR?=
 =?utf-8?B?dnBUaWp1YWZvK2dSWEpteWR3dzZrM0RtV0tPU2dzNWN4Ty80M2JaYjIyMStI?=
 =?utf-8?B?a2psd3JydnM3QXNHenkwd2VvY2NXTTNlY044QTIxck52b09nelhNd1pXUnJk?=
 =?utf-8?B?bmMrZWl5WmVCRzJ4YzhVdzNKaXZrRkkxN2Q4TGx2UkpBZGZ0Y3RCbnBrbDdp?=
 =?utf-8?B?cDlaTll2U0s1RWZ0ZEpWR3g3WTZ0dWg5YW9lZjdWZEtIdUc1ZXdPWk9xaHE3?=
 =?utf-8?B?Q3BhMDdEeWc3YWlpZ21GVTFLYmtXUWRLSTVhT25GRTZYWkwzUStMSUdtQlFO?=
 =?utf-8?B?ZFMwVGNzejZRa0VBY0VBcUhKM3AwUHB4NXoybmRRcXNQKzhVTlBxNEFiMllz?=
 =?utf-8?B?SGxOOHZaRFhHT2JYRHJZWU9qMk1LTDlFbzFyRVMvTXFkS1RkcHovL01aOFB4?=
 =?utf-8?B?dUpoZkx5N201WlptSUhrUFh6V0ZVbXAzTk44UXNnaDYzQnBqV09BZXN6UnNt?=
 =?utf-8?B?WmZnYjNkcXdsVHZvTy9EOWo3U0NUQUVzU1RiTjJyYkFSb1Z4aXJTVzZRbWNt?=
 =?utf-8?B?TWF4Nkh3cmJGY1hFbDRmVnc4THFZR2ZNRm9rbHJ5YmhxRGlyNmd6NjhxMmxv?=
 =?utf-8?B?bzE3RW8vZS9MNHZNb3hsZUM5amMwem5ic1pwMC9yZVREeDhOTndHZzRmZVU2?=
 =?utf-8?B?bEZNTjB1dUdIamNjMktNZjh4aUVNdVZOM0wwR3l2S1Q1K2F0SlFPZ3ZTL3Zj?=
 =?utf-8?B?Z2EveVRRV2V5WENyd2s4UVpacEduSHlCOHVIeXlJWDhCWmJlcWdYenQ3NklL?=
 =?utf-8?B?Y2YxQUNKSktUTGZ5RUM4OTZIL3ZPR1NLUENPN09WYVJGaHJJWnU4ZXJtMFor?=
 =?utf-8?B?bWNMZjd5RHNqRkF4R01oeVhWSWwwNGZiT2trT0dWOE44ZEw5K0FWMW91U3Rk?=
 =?utf-8?B?cXBDbVBPcUE5c1h3YVJIQlpDYUM3RStyL0xpVTFxaTNiakVORTcxL2lOMS9I?=
 =?utf-8?B?YjE4RTZDL2xrSE1GbkdtcUUySlhLSUpydWl3bGVrNGs5SExWNk0wYUlUWWd2?=
 =?utf-8?B?TE9WcVppakJvdklOM2tCNjZjeXZuRm41ajY3cjA4ZEg1WENva3h2SmluSFNv?=
 =?utf-8?Q?Qk9r4+6u1hqyn3695Hy2DTCvB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3650a632-c38c-493c-6a1c-08dd82086633
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 01:44:35.3369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOYdeFCzpAmd/zBDuTDvyXecf93YVl/cgj5XPEUBCH6vrzK6XaV9QS3/8yLtxtOBL5y6QoZJZp14YRjAND45Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8475
X-Proofpoint-GUID: _gr-KmqW57ITc4D1skLhjlYHFpCgfDVt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAwOCBTYWx0ZWRfX3SWCAWid2/A3 RI1toD8fdw0pQy9uPNHBtYhySaykyrSJv8Sd8L8UhmOTjtFRCy1+CUUyzb0M1H2FsgFydAQPnVq JTtXKGztSoiHK7yHOxB5vT1pShgAszDsPxKHDW+Mms4EbcPrCchsz2GMhbEkNcli0hoGv+DJEZh
 DNAXdLWou/Mum/2PV/g2ki6osOPPssI78BVVvyPkhhquHCSMB9KKZRRD9mHcM0CHky/BsBljx+8 /5OyhS6aHFOb2f9ye8DZQPWy1BwRumCece2tn5I+Gi7j+Kkv/UidWWX99DDT7W5en0V4HC2+43j VLB7HfsjdNetfNQlELQqCHy3PIxYDWhd+uiIns/Jh17PR7JwJzX4lvD/uc1hDWKRcLNpMm+JakB
 W5jmn/94SMQRnP5H5Iw3p5dXqAQgilP14rurrcB608XsZ+wHF+LTqNOnVVy93j4KyMpuL2AM
X-Authority-Analysis: v=2.4 cv=Lu+Symdc c=1 sm=1 tr=0 ts=68084608 cx=c_pps a=5b96o3JgDboJA9an2DnXiA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=Q4-j1AaZAAAA:8 a=7CQSdrXTAAAA:8 a=t7CeM3EgAAAA:8 a=CuuyPUojYu3_sqU9y58A:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: c446f9OvCPVxRGONWRjCz0yJpz954apV
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_01,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=946 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504230008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 01:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215256

With this patchset, the effect of serial-getty-generator PACKAGECONFIG 
is to control whether to remove systemd-getty-generator or not. But is 
there any case we want to remove this generator? If not, I think we 
should just remove this PACKAGECONFIG.

Regards,
Qi

On 4/23/25 03:00, Ross Burton via lists.openembedded.org wrote:
> Until recently, even when the getty generator was disabled in the
> systemd recipe it was actually still active.  This was because the old
> behaviour was to delete the serial-getty template unit if the generator
> was disabled, but the systemd-serialgetty package shipped then shipped
> the same files so the generator continued to run.  This was a bug in the
> original commit[1] so this behaviour has been present since 2016.
>
> My recent fixes[2] changed this: if the getty generator was disabled
> then the generator itself is deleted. This makes the actual behaviour
> match the intention, but the consequence was to demonstrate that some
> modern platforms were relying on this unexpected behaviour: specifically
> the genericarm64 BSP which intends to support a number of virtual and
> physical boards with a number of serial console ports that are not
> really suitable to be hardcoded into SERIAL_CONSOLES:
>
> - ttyS0
> - ttyAMA0 (AMBA PL011 uart)
> - ttyS2 (BeagleBone Play, S0 and S1 are internal)
> - hvc0 (KVM)
> - ttyPS1 (AMD KV260)
> - And most likely more
>
> Restore the existing behaviour by explicitly enabling the serial getty
> generator: this means that systemd will automatically bring up a getty
> on the first serial console it finds.
>
> In the future we should extend some level of dynamic console-finding to
> sysvinit-based systems by searching for a console device in inittab, but
> for now this reverts the unintentional regression.
>
> [1] oe-core 2a8d0df47c9 ("systemd: make systemd-serialgetty optional")
> [2] oe-core 2beb3170af6 ("systemd: if getty generator is disabled remove
>      the generator, not the units")
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-core/systemd/systemd_257.4.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_257.4.bb b/meta/recipes-core/systemd/systemd_257.4.bb
> index 64fb8fe69ac..f90308f0db0 100644
> --- a/meta/recipes-core/systemd/systemd_257.4.bb
> +++ b/meta/recipes-core/systemd/systemd_257.4.bb
> @@ -92,6 +92,7 @@ PACKAGECONFIG ??= " \
>       quotacheck \
>       randomseed \
>       resolved \
> +    serial-getty-generator \
>       set-time-epoch \
>       sysusers \
>       timedated \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215242): https://lists.openembedded.org/g/openembedded-core/message/215242
> Mute This Topic: https://lists.openembedded.org/mt/112401496/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


