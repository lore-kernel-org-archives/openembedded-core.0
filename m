Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3FACEBF61
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 14:13:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10143.1763388773882173511
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 06:12:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=gLURGkl0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3416e973a9=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHDaP4e2877462
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 14:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:message-id:mime-version:subject:to;
	 s=PPS06212021; bh=qKy577KtZVcHAS4KsWhFDmoJxN/Al0HdAPMN1S0hK+k=; b=
	gLURGkl0k6RLxBs50iOiO6dYTbOVZxa/9lXBh/zdEgxuUTHxbEL37ZWG//be69Fs
	ASmKpAUFiLOMgMNFM7DV8EmUkV4kAiyzG2zJfX9jfVsmxp+A6zhuKQLyWykAhnGA
	MRJwCOOwL6KC2tcR3lSa4szYmST54jIowIxkpVFFWeCGOE904y5F5h9STyDp4vV2
	UQCuBt1Ym7AKU+Sy7Yp/UM3nxVo22XhXv7pRCgZJrjXM7j2mZYrJc0DU5aE/XSIE
	rU6zPdXj4FGr1Pe1ZZoBLkTRDHscPikH2uVStnkgENAHtEkxPDDn+oJnxb0GsJCY
	hUsb/IbBwxpNR9PTQEj7hg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012015.outbound.protection.outlook.com [40.107.209.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aegg89x26-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 14:12:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qiUnFbi0olfo3z1ILLa43OktU3MbVST8JDyq+ZNlBHSJLRiU5MoWlTiUQl9rDDi/AaWYztEyIiqRL/wjOdqgM62gN2hjrkrWlhj/RQ6XygMxYw3cxVEvXfBTHD6R6PjDXqfFfEKqFEqt4ZEatBYD2OhC+ddIu16sY9HtDcBF0eHKVeeXZfj1GTYAxIi0+S/8tbDIWE7Esyc/olRouej5jRHF0iZjb+vc/WX5KvcdcCMSDku1Mx9MDUB/pVlskDC7eqP8Lf25+aUWKVIm2V8f8ZIZ7FfaQkeNoZIR8HuMst3zEbt3txRo7rfg/nQX8w3F9HQ5eWicgvxTWcb3Y2Fomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKy577KtZVcHAS4KsWhFDmoJxN/Al0HdAPMN1S0hK+k=;
 b=jL2083lrcCHz/rmHvMqxfU/QQFPWNBNP4n1xAUyBkIvQaNuNNGwEbxNnfJcOoAXu/dNVeJFMB6o4vSrqMbFD16mcG4F1VHTYZoz+ePj8/3/klo382WUS13Yx14FhvxsOfVFb/NkhOaWo4sxWHtmlnzNO4ExHyWGlp9dKwyvLCI9mH0wcLRkFkKLcq0R6UkVv/XO3TlHfgi8ZqIvvZy/Zs1ZG+tZqghvSnfcymUmYsBTX7p6mfPNrTLKs1hWyjbn2t7kV5YPrwp2T1bL8+EazOOLq42iIeRYL0niczR36pyPD9LpDb4urcTOH+2QyncolWQW3FYuDaurHIYF0BL2stA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB7599.namprd11.prod.outlook.com (2603:10b6:a03:4c6::7)
 by IA1PR11MB8832.namprd11.prod.outlook.com (2603:10b6:208:59a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 14:12:41 +0000
Received: from SJ2PR11MB7599.namprd11.prod.outlook.com
 ([fe80::8345:1cb3:a109:be24]) by SJ2PR11MB7599.namprd11.prod.outlook.com
 ([fe80::8345:1cb3:a109:be24%3]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 14:12:41 +0000
Content-Type: multipart/alternative;
 boundary="------------3b0WhQ1pusE0yIfoXIdUzQnF"
Message-ID: <3718eb98-0915-475c-b2bf-8e4743a5c098@windriver.com>
Date: Mon, 17 Nov 2025 19:42:33 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: "MacLeod, Randy" <randy.macleod@windriver.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "Dora, Sunil Kumar" <sunilkumar.dora@windriver.com>,
        peter.tatrai.ext@siemens.com, mathieu.dubois-briand@bootlin.com,
        Khem Raj <raj.khem@gmail.com>, Yash Shinde <Yash.Shinde@windriver.com>
From: Yash Shinde <Yash.Shinde@windriver.com>
Subject: Analysis of Rust v1.91.0/1 build issues
X-ClientProxiedBy: MA5PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::17) To SJ2PR11MB7599.namprd11.prod.outlook.com
 (2603:10b6:a03:4c6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7599:EE_|IA1PR11MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: 24709338-9b7f-45b4-21c2-08de25e35ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V0w1RlJZL2U4eG9RZGpWOXNSdnhrM1AvMHRkd2xKNE04Y0lVQURiNXlOdTBE?=
 =?utf-8?B?ZEpOTmRmbnpuY3YvWjk0TmU3RGZsTWp4MFYxZE0vWWpmbTVQZ21FN2pOckUw?=
 =?utf-8?B?K21vRzdVYngyRWd5OWo0UHFjSGlFQ2ZTWWlzKzQrZW9rNVlkbk9TaTE5NWpK?=
 =?utf-8?B?UG1VT3F4VE14d0FIaWd4Mm9Eb0VmWEhmcW5yMHdyTVhQOE9rdVdoR0VTWlgr?=
 =?utf-8?B?VE0yTVkrT1dlTjlIeGZLZEtsKzhjN0NNQk5TZTBIVStmbEFpZTZSc1N0R04y?=
 =?utf-8?B?bEg5bVdpT1JiWXJZU3N0YXJSYlBYL3dJNUhpczAxcllKTEYwK0FTVW41dmhR?=
 =?utf-8?B?RGwwUjFNRVdPVmtLSW4vNFRaZ1FkSVNUVnR4ZjM0eS8xWDFNS3lQVHFCM2xJ?=
 =?utf-8?B?ZWZzOHRuY2pGWXVVaEJxQjFCbW1wajduVlRTQ3JxbW5xQzB2eUJCa001YzN6?=
 =?utf-8?B?MWZBb2haL2pBakpsdmx5Q3BLQXFEN2Nxd05GYkhuNVh0U1RHaXNZbHVDWm16?=
 =?utf-8?B?TEd6dGlqUjNKclJiYlBZUWFwS2E2L2FCRkdPaUloWTg4anNJaUhsRWhVZlE0?=
 =?utf-8?B?d05RUWdGeEF2N2pYbWpiRUpTSy8xa20vR2s1eGEzNjhPSE8ycWl5VE5CV2Z1?=
 =?utf-8?B?K2dqUWtvbWZ1S1pqQXh6RWxKb0V0UldLeGs3TTdFSjlvT0JBNUs2K1h2VkhJ?=
 =?utf-8?B?TjZoL2ZTUFV5TWhkUTMwVGVOWVllV2FiM2dEZE8yOGdPcDJzWVptMURncVMx?=
 =?utf-8?B?K0Fwbjl1M2JIWnk4Q1JZWGM1RXY2T2VtMS9mRmxhU1FtRm5hbzZUWEZoVmR1?=
 =?utf-8?B?SGFlalBsTE9xaWlZeHJGekNTVmlXRnlPMjhCQVhqRmZQRzAwaE9Bc2tZczN5?=
 =?utf-8?B?Q0hkUHlPU3NBOHhHUHIveXZnU05INkgwUmlwMnZ1S1VxN1g5Ykcxem9vMWpU?=
 =?utf-8?B?ZlJPdENPdDkwNTRzR3NZbFAvZ1Jub2xKcHRqZlhWRFhGdUs2eVNvNVhWQjJ2?=
 =?utf-8?B?cWgvSGt3eUhDT2g0N0FwSDZOcUl1ZEFQbWlISnVMRTZhTlhDYUI1Qmh0NmpC?=
 =?utf-8?B?L0gxRCtYbHR1VHVoeFNGaERmcTNMVDRZYTkrRFQrQ0hXa1hoMGV3dzc3VGRv?=
 =?utf-8?B?dDZ5a1IwY045SlpNdXhhdDFqcld2RVBIWXlSclhBWjEzRlZoR0N5dk8wS05p?=
 =?utf-8?B?QmFsVWV5UUJHRHRDaU1WakVZMkJxeC9HNUdsTXRpWk9UZUJXb0dtenNYTmE4?=
 =?utf-8?B?YStOWmsyVjBiNzVxeTUrK1N4a0k4MmdaYWpOQ1BCSTg4c3p2aGZ0L09oS1pz?=
 =?utf-8?B?dGwyMjNscWI0MGpFMDNudVI0YmJPQlVaNDU3L3daWjVLNGZFZWdPejQ4VTYz?=
 =?utf-8?B?Z2E5T04rTzJkak5EaVNnamI3VXZuK0E3YWxTY05hZElJanJGV2NXc2J2aUds?=
 =?utf-8?B?cXBsOTJ5c1YwQXRYaWRhd0dCTXYzRk13b092aTBjY1BEVXYzSkU1enh2R3JN?=
 =?utf-8?B?Rjg3bFJoak9CMU9RUC84UTlRT1FUYS9wZ0dSZnZZRXZCTmNxRU5DeWYyeVFD?=
 =?utf-8?B?MEp0bi8ra2pzRUVrZjJ2QW8vOXcrbUNDYnJLUmVMUnBhOG5BOVJMU0w2cUpX?=
 =?utf-8?B?aFdlWlBBMWxpaTRhTmUzRnJrU2wrR1hvblB4M1ZYTkdLQ3AzU3RFRHJuc1VC?=
 =?utf-8?B?bjBiQ1E4TkRYZzNOV24wRXVEU0wvVXZGT3hpbm5nNTJXcUd3ZUJ6TllLY3h3?=
 =?utf-8?B?VDBiZ2g2Zm9PMktxczg0NmloOEo5Nlg1Y3NUakZ4WEpkWUorNFd5MmNydTkv?=
 =?utf-8?B?MUl6VCtIa1N2K2tVU21panZ1VkpwbnRtSFhNOXV3WkZhd0t6R3dZeWJ1OXI1?=
 =?utf-8?B?MGg5RkZTWXc5cklZZGpXOFc0NjBteTU3b3dhZ2tOc3hNcVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7599.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NlZyUklnKys2K2RVakxNTWxZZS9veEhKVER3LzVvd05xTGVsM1VxQU1heXhr?=
 =?utf-8?B?VmJqVW1pWnozNmp0ZVZ3N0NkZ0Q0ZUxESmxacDNiMnd1NnZUNVZLQjE3cnVB?=
 =?utf-8?B?cE5NYXErUGhtdTdtLzk2WGZtMU5VKzdCN1NMYy9NQjdRTk5HTnB0RXI3UmJ2?=
 =?utf-8?B?cXBUdTg4a2RPT3phUjR4dCt3TlFGekNTWTVTbzJ1eDhqay80SS80amt2Und5?=
 =?utf-8?B?WGo1L1k0Yis3aFlXUC9Bb0x3VXo1R1FqNStBcEQ3cmNEc0JYemcvSzJac0ZL?=
 =?utf-8?B?VU5HclhuS3RqNkhwcXBhNXJFMTIzSitwbU11YUpTZjQ0QVIwTzhMV0dYbEFS?=
 =?utf-8?B?ZXpHRGQwc3VjZ1BqcSt2Y2MyZ3hDUnVnQkFaeVN4WFBBNzZaSkRWL1o1bGN1?=
 =?utf-8?B?L1ZvdStvK01jNGlzNHFBdXE4OEplaWticHJrSE5BUVZwYy9mcHVIOXFyUTEx?=
 =?utf-8?B?SnB4NUVrKzBST0JZbFdqZjZQUFh4alBqNTdXZ3Q3cmpvNTFCNHcrR2loUG00?=
 =?utf-8?B?RHlpckN1aGtXYmJPWDJ4ZUZsYWxNdDFRMlA1R2JPK3I4cDRXUWFaS0ZaODVW?=
 =?utf-8?B?VVNueTFYazZpa0puQVptZjBFVmNKR3ZWbEdjYUE1R1RubmdQWXpjRzRVa1ZO?=
 =?utf-8?B?YkphdldjMDRaYWxZZzVwcmM0MFBXNGNNc3N1cFp6Z1JRRHlZTDlHSGNzVVNF?=
 =?utf-8?B?ZzI1NXZ6eHp2Mkg4Yy9HVWRtOVdsM2pKb2dJa1dJN2ZBSEtiaGFvUXFySnZJ?=
 =?utf-8?B?RHptL2NHYjdNQ090MzNEM05EL0ltRFZ5eHdBczRnWmVPRjc2OWV0QXI2Vnk5?=
 =?utf-8?B?VXk4RW5qb1ZNUFBKVmRVQmNDRlZSYW03U05URzVXN2EzdlYyNkdiWjF6T0Z3?=
 =?utf-8?B?VjJpOHFuRUVGbmlvMG01TmZmaWNhaUV2NVVweXUwU1NNeFg5Y3JoS1UyZlU2?=
 =?utf-8?B?UWpqbjJpNkl6VWhrdU1iMmpGSmk5QmFoZnJURmdJZFE5eHFmREU5VktLc1FB?=
 =?utf-8?B?Zjd0dS82VWQrNkJzNTdoR0ZubWVHSjRWU1ZJMkxyeGdWeTNJYmIwN3VsNFkr?=
 =?utf-8?B?eXpFVytIbjhHQVNONCs3cS9UNlN4U0VzNVU2MElKOUFnNm1nQWluK0FRNXZo?=
 =?utf-8?B?RWJ6cHdyTTBMY090RkYzN2kzNjRZRkE5ZUNVeENNRU0yRmtxVXdjRnBnQldF?=
 =?utf-8?B?YzVFYzgvVWVkZTR6VEFRNFNKOXNweDR0NC9UTStnTzV1NEZwMTVVV25XRERJ?=
 =?utf-8?B?UU41Z2dJSEcxeG5kd1ZKUDlMVnBiQjNhRmwwNUw5S2JYYUljTmhoWUUvakth?=
 =?utf-8?B?OWhvQW53WDU0dXJMaFFldks0ZnZYdEVYZmM0SzJubEpqRWtjZWx0TkhOVHIw?=
 =?utf-8?B?WlNRWUsxSHJZUVFiV3RwcW5SRTdOais4UDBEUW1sblY0UXYrTnE3N3hOZXBE?=
 =?utf-8?B?dWFDOTRrdzRwaGVObmUrdEF1MDQ3MXlWTWhRVDVVanJsMGRENUZpa0tpSkdU?=
 =?utf-8?B?QktrTUVNVXdBOFczMzE2RnBCK296WVdTYmVTdXBjREZ6Umd6djlGci9vV3VG?=
 =?utf-8?B?WldDRTlqM0lnVkY0bmFpajZFOUxGdHpLcUh6amdhTGcxY3V5YWNmU293YU9M?=
 =?utf-8?B?Yk42VDlDVERpVlFYci9SUTNzTHpsTnJwSWg2cVZueFF2aGN5cHVaTCsvMlJD?=
 =?utf-8?B?U3dTN0duSkNFNmxzU3FiY1pUc3ExUGFjR01UUFNUQlBrT25icHh3cnRlaWpq?=
 =?utf-8?B?eHRXVzcvelB2K2Z4c1dwa2UwM0FmWkh0OHJSTTgwUUV4NC80b2Jnb0piVDVn?=
 =?utf-8?B?S3N3WTJVdGFlZU1obmtxY1k4WnpMblcvSlBWL1RQTmZkd2JDQmY0cCtXVWNH?=
 =?utf-8?B?ZDhvd0o3a20zL0xzZEJKUDMyT2V4b3FZYU5LN1Q5MkU3MUVHQ2hJa0d4N25n?=
 =?utf-8?B?bGNlVGJxNmZBTmRnbXpXeWJzVTUxUXZBbjR2ek52UXh3VTRRaGVwRWUwSVQ4?=
 =?utf-8?B?eEZsdnQ0bTh0bWFJUk1Yd1VuUXRncXl3TGpXK1g5R0h4YitOdkoxemlvakdL?=
 =?utf-8?B?cGc4ZHdKNmlGOWc0YWZoakxiVThqWStDMVhmdTRSNUVxNWpINkNYMzNsaUh0?=
 =?utf-8?B?NUVtRlhhSHF2anV3WmN5VDVncW1EOXBFcjVETEV2UHlLVTErcW5DSVRhSGdp?=
 =?utf-8?B?NGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24709338-9b7f-45b4-21c2-08de25e35ed0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7599.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 14:12:41.5059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPDHBcbOsL76LeJoIQTpckSO7BH4RUcZrH0nc2TmSlbanhBj5L54MP3XsTKQ6PMZwFczxz6Z2nqW+78VCVukbSs32GZQcM/XEgmZYJUvqKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8832
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEyMCBTYWx0ZWRfX4yGBpp3jZpK2
 dFDaZNKYTHJ2rvb6TQpDLk/RZZPOBd+83gZWKO6j/TqzrXqZqVyhzIMeDxZEKzHpPUWrnBpyLhc
 HdOkU3aCm3CpBBPLelC1MKZMLpnrSVnajrSU4i63lLfB93w/W9Tre49z2gnjyLl7RN6MKdftlt1
 wOcnYaBjc6YVEJ3HxTcpQDJKnj7CA2lF9Gnm9E1nJVDz5B+ZJTG/QVLVmV7Px5dzG2JMteQaB3e
 9k/TQE4U+K7JWtmxV5bWRaNxmAkFTkm8JGvoBfgUF4V8NlwubDZOfWy7F4ximR8yBU3ROBqis95
 nw7Hn0Xo6je8A65MgZV60L02yyPJrX4ih9jYQdV5BbO7xe7a3z7fbsAhaSF7Chxxa9LLRHQJH1F
 8SBcrph7a37n1YKEi+hMUEQ0CLI+3w==
X-Authority-Analysis: v=2.4 cv=U+CfzOru c=1 sm=1 tr=0 ts=691b2d64 cx=c_pps
 a=YvmT30J82QCmV9938MlLOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=a7mTl1DTxArDBeK_qbAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=4NxnyCx2vEgcMisdPDUA:9 a=lXeiXNNf3gt5cPy_:21
 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: qDLOeC07Ja-bcANRmZ9LqlYEEsLDtycK
X-Proofpoint-GUID: H1WbqwqGHVK5cPBz80wy06s2GBmEKGDz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 14:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226494

--------------3b0WhQ1pusE0yIfoXIdUzQnF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AHDaP4e2877462

Hi everyone,

We are working on Rust v1.91.0 and v1.91.1 version upgrade and the=20
branch is available here:
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Ddeepesh/y=
s_rust_191


Following observations were made when testing in AB and local setup:

1. Initial testing without new bitbake setup (previous old workflow):
The test suite builds passed successfully on AB (tested on 31-10-2025)=20
when tested without the new bitbake-setup.
https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/2592
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2809
https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/653



2.=C2=A0 Issues post individual clones of bitbake and oe-core:
After the poky repo was dropped, we tested the test suite with new local=20
setup
and the same "target-rust-ccld" linker issue (missing zlib and zstd)
was observed for "all targets" as seen by Peter Tatrai for ppc64.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/2646/s=
teps/13/logs/stdio

https://lists.openembedded.org/g/openembedded-core/message/225636
This issue was resolved after passing zlib and zstd to the testing image=20
as described in Peter's patches:
https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3Db7f2339d3c94d9167a9dbcead963fd3555fad8f9
https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3D36cc3834dc66e78c0a90306c6e4a8c28c6254aac



3.=C2=A0 Local Testing Observations:
While the above failure was resolved however there was another error as=20
follows:

/1 command(s) did not execute successfully:

 =C2=A0 =C2=A0- Command=20
`/home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/recipe-sysro=
ot-native/usr/bin/cargo=20
run --target x86_64-unknown-linux-gnu -Zbinary-dep-depinfo -j 192=20
-Zroot-dir=3D/home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/=
sources/rustc-1.91.1-src=20
--frozen --release --manifest-path=20
/home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/sources/rustc=
-1.91.1-src/src/tools/tier-check/Cargo.toml=20
/home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/sources/rustc=
-1.91.1-src/src/doc/rustc/src/platform-support.md=20
/home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.9=20
1.1/sources/rustc-1.91.1-src/build/x86_64-poky-linux-gnu/stage2/bin/rustc=
=20
[workdir=3D/home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/so=
urces/rustc-1.91.1-src]`=20
failed with exit code 101

 =C2=A0Created at: src/bootstrap/src/core/build_steps/tool.rs:174:21
 =C2=A0Executed at: src/bootstrap/src/core/build_steps/test.rs:3436:55
 =C2=A0Build completed unsuccessfully in 0:32:58/

This issue has not been observed on AB so far.



4.=C2=A0 Subsequent failure in openssl-sys build in AB:
When tested the same in AB, we encountered another failure while=20
building openssl-sys (v0.9.109).
The error log points to an issue during the execution of the openssl-sys=20
custom build command: (line no. 34569):
https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/2639/s=
teps/13/logs/stdio

It appears to be related to a failure in executing the build script for=20
openssl-sys.
The failure may be intermittent.

Error Message:
/error: failed to run custom build command for `openssl-sys=20
v0.9.109`Caused by:=C2=A0 process didn't exit successfully:
`/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-3420499/tmp/wor=
k/x86-64-v3-poky-linux/rust/1.91.1/sources/rustc-1.91.1-src/build/x86_64-=
unknown-linux-gnu/stage2-tools/release/build/openssl-sys-bc375833fe379304=
/build-script-main`=20
(exit status: 101) /



5. Segfault Issues Reported by Mathieu:
Additionally, Mathieu reported segfaults during the do_test_compile and=20
do_install steps of the Rust build, potentially related to corrupted=20
sstate-cache.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16058
We have not been able to reproduce this issue locally at this point.

Currently, with recent changes in bitbake we are experiencing rust=20
v.1.91 build issues.
We are investigating the cause for these issues and the inconsistency in=20
local v/s AB .

Any suggestions, insights, or pointers regarding the above issues would=20
be highly appreciated .
Thanks.



Regards,
Yash
--------------3b0WhQ1pusE0yIfoXIdUzQnF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi everyone,<br>
    <br>
    We are working on Rust v1.91.0 and v1.91.1 version upgrade and the
    branch is available here:<br>
    <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core-contrib/log/?h=deepesh/ys_rust_191">https://git.openembedded.org/openembedded-core-contrib/log/?h=deepesh/ys_rust_191</a><br>
    <br>
    <br>
    Following observations were made when testing in AB and local setup:<br>
    <br>
    1. Initial testing without new bitbake setup (previous old
    workflow):<br>
    The test suite builds passed successfully on AB (tested on
    31-10-2025) when tested without the new bitbake-setup.<br>
    <a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/2592">https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/2592</a><br>
    <a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2809">https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2809</a><br>
    <a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/653">https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/653</a><br>
    <br>
    <br>
    <br>
    2.&nbsp; Issues post individual clones of bitbake and oe-core:<br>
    After the poky repo was dropped, we tested the test suite with new
    local setup&nbsp;<br>
    and the same &quot;target-rust-ccld&quot; linker issue (missing zlib and
    zstd)&nbsp;<br>
    was observed for &quot;all targets&quot; as seen by Peter Tatrai for ppc64.&nbsp;<br>
    <br>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/2646/steps/13/logs/stdio">https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/2646/steps/13/logs/stdio</a><br>
    <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/225636"><br>
      https://lists.openembedded.org/g/openembedded-core/message/225636</a><br>
    This issue was resolved after passing zlib and zstd to the testing
    image as described in Peter's patches:<br>
    <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?h=master-next&amp;id=b7f2339d3c94d9167a9dbcead963fd3555fad8f9">https://git.openembedded.org/openembedded-core/commit/?h=master-next&amp;id=b7f2339d3c94d9167a9dbcead963fd3555fad8f9</a><br>
    <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?h=master-next&amp;id=36cc3834dc66e78c0a90306c6e4a8c28c6254aac">https://git.openembedded.org/openembedded-core/commit/?h=master-next&amp;id=36cc3834dc66e78c0a90306c6e4a8c28c6254aac</a><br>
    <br>
    <br>
    <br>
    3.&nbsp; Local Testing Observations:<br>
    While the above failure was resolved however there was another error
    as follows:<br>
    <br>
    <i>1 command(s) did not execute successfully:<br>
      &nbsp;<br>
      &nbsp; &nbsp;- Command
`/home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/recipe-sysroot-native/usr/bin/cargo
      run --target x86_64-unknown-linux-gnu -Zbinary-dep-depinfo -j 192
-Zroot-dir=/home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/sources/rustc-1.91.1-src
      --frozen --release --manifest-path
/home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/sources/rustc-1.91.1-src/src/tools/tier-check/Cargo.toml
/home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/sources/rustc-1.91.1-src/src/doc/rustc/src/platform-support.md
      /home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.9&nbsp; &nbsp; &nbsp;
1.1/sources/rustc-1.91.1-src/build/x86_64-poky-linux-gnu/stage2/bin/rustc
[workdir=/home/oe/build-st/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/sources/rustc-1.91.1-src]`
      failed with exit code 101<br>
      <br>
      &nbsp;Created at: src/bootstrap/src/core/build_steps/tool.rs:174:21<br>
      &nbsp;Executed at: src/bootstrap/src/core/build_steps/test.rs:3436:55<br>
      &nbsp;Build completed unsuccessfully in 0:32:58</i><br>
    <br>
    This issue has not been observed on AB so far.<br>
    <br>
    <br>
    <br>
    4.&nbsp; Subsequent failure in openssl-sys build in AB:<br>
    When tested the same in AB, we encountered another failure while
    building openssl-sys (v0.9.109).&nbsp;<br>
    The error log points to an issue during the execution of the
    openssl-sys custom build command: (line no. 34569):<br>
    <a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/2639/steps/13/logs/stdio">https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/2639/steps/13/logs/stdio</a><br>
    <br>
    It appears to be related to a failure in executing the build script
    for openssl-sys.&nbsp;<br>
    The failure may be intermittent.<br>
    <br>
    Error Message:<br>
    <i>error: failed to run custom build command for `openssl-sys
      v0.9.109`Caused by:&nbsp; process didn't exit successfully:&nbsp;<br>
`/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-3420499/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/sources/rustc-1.91.1-src/build/x86_64-unknown-linux-gnu/stage2-tools/release/build/openssl-sys-bc375833fe379304/build-script-main`
      (exit status: 101)&nbsp;</i><br>
    <br>
    <br>
    <br>
    5. Segfault Issues Reported by Mathieu:<br>
    Additionally, Mathieu reported segfaults during the do_test_compile
    and do_install steps of the Rust build, potentially related to
    corrupted sstate-cache.<br>
    <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=16058">https://bugzilla.yoctoproject.org/show_bug.cgi?id=16058</a><br>
    We have not been able to reproduce this issue locally at this point.<br>
    <br>
    Currently, with recent changes in bitbake we are experiencing rust
    v.1.91 build issues.<br>
    We are investigating the cause for these issues and the
    inconsistency in local v/s AB .<br>
    <br>
    Any suggestions, insights, or pointers regarding the above issues
    would be highly appreciated .<br>
    Thanks.<br>
    <br>
    <br>
    <br>
    Regards,<br>
    Yash
  </body>
</html>

--------------3b0WhQ1pusE0yIfoXIdUzQnF--

