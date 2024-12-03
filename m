Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC63E6C5E5
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 01:14:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9146.1733188490201859117
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 17:14:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2067075939=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3103BQ016701
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Dec 2024 01:14:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437sp72nrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 01:14:48 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B31Em6O005506;
	Tue, 3 Dec 2024 01:14:48 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437sp72nra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 01:14:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uoi35CIhb7p4m9zsZSiM4+lKwXq+1WjblO8VVPWZPmsYk4uc+oF8BCV9hMzLv7x/FE5lUNcI8CSnvuTspx8tpXoB41sC7ymrOm5rAvzK6s9hUANClj29NNQxObrYFx+3l9y34U85e7snnZVwsZQDQ7PxeFcL+y5qVXTYMzuThlG+VgQ+kqFu955chwPAr9VVfbYuro/XWEWQDVXWuiqT3Pp6heTpRHmXTwrW8mdD9ZKjFtgYeBqlHWcesVLoAoXx3BfTTYzfle1ilQsoGnI/FEPrTitogPsIJa0lhzUMgYH2sLB1056z4jZgDQXZPuEXjTFD2LKG6OpLKaF3AG8eWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Dgj5erTrKN2aq0C6LVZjihpXN1Uy4bK0nJIpw3r5ag=;
 b=trEnXl+hS/nV4rbYsRt/gvKZmDR8PkhHGHEcl9YsbL5jCVAgark4gM9t1ENxuFpWTuyesgBaywwplYaXZFCEXN3prHumug/mZfwkIokSBv0wUpZy7JyNBnqUwLmsy0kYOR+Qr7KMQ83G2O3qjPj2wEBkFtAs5FlHARUqWu+Cc5+4N+uE72ahtf9OchaliNai0rtbTOzkppxFusQ4vctq1bTxQV5Xh9JNpdIGHz0Jd1JROUXQCxXUaVZZow9UpKCWvb76sks6swMC+BqfAr2IlVv755f27CuKoKQbkF4BpxesL8Olw8LIw6+IPQdKJofkkxWcFu8WERQ2vzLJcgKh4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by IA0PR11MB8398.namprd11.prod.outlook.com (2603:10b6:208:487::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 01:14:38 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%3]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 01:14:35 +0000
Content-Type: multipart/alternative;
 boundary="------------wmDqU8VLOubcUlADr8cgYfvz"
Message-ID: <b0722ab2-7d99-4b0c-aa1f-45413dd75ee6@windriver.com>
Date: Mon, 2 Dec 2024 20:14:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] gcc-sanitizers: Add riscv64 as compatible host
To: Khem Raj <raj.khem@gmail.com>
Cc: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20241202043514.3046780-1-Deepthi.Hemraj@windriver.com>
 <5a5f693b-6def-4763-89d0-91168d1085a4@windriver.com>
 <CAMKF1sqcPw0_=9XRfmyAGuc-3ny_p9uswUxM_0uOotGdoundJg@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAMKF1sqcPw0_=9XRfmyAGuc-3ny_p9uswUxM_0uOotGdoundJg@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:a03:338::9) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|IA0PR11MB8398:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e5cf3bc-6292-4a81-c27a-08dd1337d9d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VEtPRzRYU3JSQ25SYnNjVlFlZXF6L2Rjc0VxeVhuVGtNc3VGaGlzSi9VM3Vx?=
 =?utf-8?B?WlM3bmFOd3VQcUdhVjlvZ2ZzOHQ5NGZ2MHpyTDNRTlRUbmRGS0lRZVIvaU9M?=
 =?utf-8?B?dUx2QWduSTNiWmpNbkEyWFN2T0hoMjNKM0JwdmN6MVhNVGNwakZ2VHNNaE0y?=
 =?utf-8?B?cGNYdDRXeTJ0VUpydEU5MVVFaThKWU84SUhGT2huR3RKa25hdVA3dzNsWXVP?=
 =?utf-8?B?RVlSRGl0NHNod081eU5IbmZobkhQcS9BYzZnSlBOblR6b2N2NVM0TFlpTCtQ?=
 =?utf-8?B?RExkRXFEeGQrWlZtWUNpTG1iTW1IT0tUL0tORXlZS2VueElnSTc2ZEFQTXFU?=
 =?utf-8?B?NUZ5ZGVxWm5ubWNVWFdPNHUvZVhZamZVWUdma2xoSFBIR2QrdFF6SE1nengz?=
 =?utf-8?B?UkV6Y0F5dy96d2JVTG1DNWVKODJmOUw1NlFwYlE1SVZhTzAxNHU4MytWRno5?=
 =?utf-8?B?WHUxdEJCcjB4bjZlc1A4YjBlQjc3Q2FNT0ZFcllVdC9EekozTjJhYW13aWhN?=
 =?utf-8?B?dkxrV0FudE16NjVyak9EWUw2L1J0cEdtQjFYMHZWdHFJMmR6U2ZvaGluRmVN?=
 =?utf-8?B?NFJzN3A2V0tqN08vY3N5ZGlzNmQ0S2RkNFA5TmJwQlhuRHA0TTZ0LzViL2xL?=
 =?utf-8?B?bFJ1bmk1dVVuYzgzS1JGUWRmL3FPVG5PK0pBTllxVEx4amswdjNtZ0FXeklX?=
 =?utf-8?B?M2liL3BaSHk0WE14V1JpWW15UXYwSzRXd0tUcS9UTEs4NEZvMFRkcUo2c1Z0?=
 =?utf-8?B?aDVOOFY4NmMwTEdxb3lSUVZmNzdwTVFTS0RiOEdlUExQTlJyN1Y4TE90UGd0?=
 =?utf-8?B?eHJyZWUzTFhzaGJBSU8vUTY1dEU5aVdZTDBWUEZZdGQyLzQwdGMrOERKZWth?=
 =?utf-8?B?M21wWTN2S2Jrd1BaZVFaSGN1UWhGaE1TZXBMRVpNL0lSb0FtTHl5ZktoaUF4?=
 =?utf-8?B?cDlTdTZYUnQxZVVRSU01TFloYlJQTFY2RDRFSkRGb2poMmdZcDA2dzRweWhq?=
 =?utf-8?B?SjdUOHF0R3d2QmtxU1JVMHVHZHNBS1NrSCtLZ1pvaWY1TW45RjEycVJCcHpJ?=
 =?utf-8?B?Lzc0RlFvMDZZQ0tNQytva0VGRWQ0MWJONE54R0UxbEdJaGM5RSt6SXVFV1Bv?=
 =?utf-8?B?eEppcVh5TFdtYXhWV3FZa244SWlBTzBZbG8zMm5KbzhkRDNSWEExTXFjQW90?=
 =?utf-8?B?R1d3ajExK0FhRklnYjA1bURLbW1nZXNuQU5BbnQxTnA2dGZVaWZvVXNtdWgv?=
 =?utf-8?B?bWZzeXZQOXQ3MWxhVXV4Vk42RFNZL2lyS0htdFc3WTJqRjlucEtFQUdTV1pM?=
 =?utf-8?B?Q2tYZ0U0YURjeWN6Lyt4VjdWTWVwRkpkMmhzS3Qrb3NFbEFvNlIxQUJXOHhs?=
 =?utf-8?B?d0RSQURmRDlJRWZnbHRBYlJFemowOTFDS01iOCt3L3ZXNEI2QXNGeUdrS0hS?=
 =?utf-8?B?N3VZOXhCSzVMNExJLzVmZ0JIcnJYR01BMWI1c05RTTVIcnpnYTdwNy9MT2ht?=
 =?utf-8?B?SW9aSlZUWHo2V0pGaHJnTUJwcUtFd1NrYkxUT3dheWZOUDd5Vy9kRlhWek1y?=
 =?utf-8?B?TTZoOVNMUnF4RWdCSGZHNm5xWEFrQjVmcmVDclFHU2p0VnZHek5LcTZ5eUVK?=
 =?utf-8?B?Z2JUdjZlRWZPYXhMNk0yUHZkdE1aZzVKMDlpWGVCRTVoRkRjYzVEbWp6c0pT?=
 =?utf-8?B?RzFBSk9xRnVCVFZ3TEJJWUx6L1JQdVQ1ejhCbW9qUjgrT0xwVktaRVRabVBr?=
 =?utf-8?Q?iMC3/nny8FDVhvt46wAEhas1EtW9oR1poSR5/ay?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YTM1OVFMRUhJTmdZdS9wb0huVmtPTnl1Z3UvMDdvMFlwS08wV0E2RndVLzZx?=
 =?utf-8?B?V1dlVFlsTk82bXpaWjNaRFB0dXFNcEo1U2dkTVY1djIxaUNkOFZibXdZTWNn?=
 =?utf-8?B?a0JtUk5iMmQ5QWRtNUdWMzJKUVRvVUN6VkFvcEFBcWlxdVV4RVBvamdPY2RH?=
 =?utf-8?B?VURZQzdTVE1RNVZzYUNyUXFhdnoxNHZ1L1dPWjIwME1HRWFWYUJLdThHa255?=
 =?utf-8?B?cnRiaHJSSWpSeEFMVURlMXRGUm1VTSt2TkMwVWtDTEh1bzB6U3lmTzBwTnZT?=
 =?utf-8?B?OHJabXRRNFM5QU1FUzhkcXZ1SDVTeXdKZVVBV1ZDb21jZytRNHdMckREbGtT?=
 =?utf-8?B?VHUya2t1dmtkZG5NQzZBTmpRNGFpQkZuZkp5N3U5TndJVnNOdnhJL2J6Ukkr?=
 =?utf-8?B?eHh2eGRQVmk0TFNyVURySmJpbng4RGhRUlJaOVh2UmFDZ0I2ZmZrZU1WVFJE?=
 =?utf-8?B?VHlUK0VnMGNDc3ZabkZhOWZHU2pnbGNObkM5cGxtcS9kbVJFUkhMRVVLYXFL?=
 =?utf-8?B?SGpza1hmbXJmZjZ4S3VFSHlEL1MvZ0NwUUNmK1BKcWp6M0V4TWhKdGhuc1l5?=
 =?utf-8?B?eEJCYXR1YWl2TS9FM0c3TTg1cTlYRFVHT3F2WXBsYkdqVDl2WlVWMDc5RXBY?=
 =?utf-8?B?SWhJclVYT0RDRXp3amUrL3ViMlRNbDQ5Vno4RTljcEFCSFJDOTNaL3J5RGpo?=
 =?utf-8?B?ZEU0R0RuNVl5cVVDWG00QmF2a2MwckVLQVNQZGRTMVhRVmUvbkQzVUZCdzV2?=
 =?utf-8?B?MWZSaHRpZVRkNEZhWlNMZXhCRnpDb3FSTXlDWUtDd0Rocmo2S3ZNeWJCVjI3?=
 =?utf-8?B?Nzc0MmRlcTVWb1BqMDE5VnhlWk1wQ2JKTHMra2ZnNzZSaG9pcHVaU2FhTFlU?=
 =?utf-8?B?Y25xOC94MG9UQXdZWFRBbkdJZzR5OFJBZTdhaStKUUo0czZBR2taM0IybWc2?=
 =?utf-8?B?cUlVTEdDaitNRm1UdG50T0NlbGdOa01LOGlzZlZoYkFwTEVEVnpmbEsxb3ZC?=
 =?utf-8?B?M3BiNUJVWno5dmt5N0VuellhZnFTNVRzOWZvQzNFNHhNT2h2YzM5NHYra0xz?=
 =?utf-8?B?a2JrMGdLNUpLbENJZWFWaWVKS1BpQ2dBbEtMRDVISzc0dVJIdTZIV2VTT3NL?=
 =?utf-8?B?NzMvRE9oeVUrR3p3djE0UHpMVkZRejVWZEtIeTRjSndheVozMndvdHRyZ0Qr?=
 =?utf-8?B?R2VZWGdSR0pFMkZhbVlDUnNKaHcvVlRoRlE0dEZrd01FQ2dJZWw0NStlY055?=
 =?utf-8?B?N3RTQ1N4TVlBdzF2dGNFbjJaLzRhcHNzcCtiVWdndjRzN0FSQTU0RFYyck92?=
 =?utf-8?B?TU5OY1U4NzdRMFRKMkp5eWVMT3kvMGxWd3JlQWxDbnlseVpZM2VMRU5qUGZM?=
 =?utf-8?B?cVBBUFhCb1VTL04rci9Tb0dUSk5oc2tLRDJWak9yendXVGpyS05TT2g3Nzky?=
 =?utf-8?B?Nm9ka3RzOE1hcUtUVTNPb3FtRjI4aUp4dEZmVE1NVW5XRCtOQkp6TnZRT2I5?=
 =?utf-8?B?MzZKTlowZHdBZVBOTWVsQkNuNlNuMmNFZWpRc0hyb2dZT2JLMUpqcnlUWlNK?=
 =?utf-8?B?UkhhNll3MHFIT0NwcHY3clVXbnFpSUZIc2ZsMTFZVjNreFJ4T05aZWxGaUpi?=
 =?utf-8?B?M1k2b2V2QWdqTllNQ3Aza0pJUjdrSTQrUDFHZ3ZXdXh5V1JBY2FGVHNIaXpz?=
 =?utf-8?B?SmY3cmdRMm5Ec0w0VTVWWnRFcWIyM04zTXM3VkxBcDRLMytqQVB3cGMxS1F1?=
 =?utf-8?B?SnlsaWtlb1BhdTYvSWhmK3U1RHJaaXNqNnFYTHlaaXBleW5IRVVrV1ptV1Ri?=
 =?utf-8?B?eGdoSGoyZzBUWmw0cDh2ckE0S3JHb1B6UnQwdXZ0OW1xWkFvVWJjcUxhaUNu?=
 =?utf-8?B?WUVZWnBUM2RMRDZSSytPQ3RjcS9tcG9uaUcrUzBBdkpscldPTE1BT0R0ZEJE?=
 =?utf-8?B?NWNnYUdLOVJDSzcvNHd6eTdNNzkxZXdVNjdKSm5qUnBMZi9WRXNodU1vYmJB?=
 =?utf-8?B?ZzkrSDVtbTBrcFVRU2dpcitseDBlQ2ttNzMwQXpSYmllTnFSVHF5T3AzeXRG?=
 =?utf-8?B?NnlSV2ZsNVVWVW9nalM5UUhQOGYzRXFiTjBhdVdOOGdoU1JuWG5LVjZGNHkv?=
 =?utf-8?B?emhYdzJzR29Hb1NaTnozdFVIZGdnNXJWWFdVNFVkZUhuNUY1c2cwSE0rWjVE?=
 =?utf-8?B?NXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e5cf3bc-6292-4a81-c27a-08dd1337d9d0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 01:14:35.6761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5l5rRBBUHvKjikxzl2ei4dHYHh3os15oSgfM5fQ8F/IoLg07xJ0Y+rLrIu3kIA+5bMeO6NZ45pHKLdGy7QyDuTdJ9H1K7LJiz5fP+CCPbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8398
X-Authority-Analysis: v=2.4 cv=Qvqk3Uyd c=1 sm=1 tr=0 ts=674e5b88 cx=c_pps a=IwUfk5KXFkOzJxXNjnChew==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=qAT2XCMdtz9329XPnmIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=N9RuYoZRw3fryWX9YOsA:9 a=eM2Qv9pcWAeFRwx0:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: BXAoCBAGr16JUqKgs2Tr0aUNk7TsGOwc
X-Proofpoint-GUID: c62v95fNGxDn5lYamhL5NsAiO34dUYEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412030008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 01:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208168

--------------wmDqU8VLOubcUlADr8cgYfvz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4B3103BQ016701

On 2024-12-02 6:50 p.m., Khem Raj wrote:
> On Mon, Dec 2, 2024 at 3:14=E2=80=AFPM Randy MacLeod via
> lists.openembedded.org
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>> On 2024-12-01 11:35 p.m.,Deepthi.Hemraj@windriver.com wrote:
>>
>> From: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>>
>> RISC-V offers several virtual memory address schemes (Sv39, Sv48, and =
Sv57),
>> but ASan currently supports only Sv39 on RISC-V64.
>> For RISC-V64 Sv39, ASan uses custom allocator configurations
>> tuned to manage large allocations efficiently.
>> These tunings are incompatible with larger address spaces like
>> Sv48/Sv57 due to differences in region sizes and alignment.
>>
>> For riscv64, Asan's tuning for Sv39 can be enabled in qemu
>> by using the appropriate flag in the command line as shown below:
>> runqemu nographic qemuparams=3D"-cpu rv64,sv39=3Dtrue"
>>
>> Additionally, the COMPATIBLE_HOST list in gcc-sanitizers has been
>> updated to include riscv64. All necessary tests were successfully
>> conducted on both hardware(Microchip PolarFire SoC)
>> and the qemurisv64 environment, with ASan effectively
>> detecting memory errors in both scenarios.
>>
>>
>> Hi Deepthi,
>>
>>
>> Nice! Thanks for confirming that the qemu command line option allows g=
cc-sanitizers to
>>
>> work without any code changes.
>>
>>
>> One concern is testing: testers would have know that this flag was nee=
ded for gcc-sanitizers.
>>
>> You could add a comment or documentation note as a hint but that doesn=
't automate and is error prone for people.
>>
>> I did note that "spacemonkeydelivers" (!) maintains that :
>>
>> "Indeed ASAN was ported to RISC-V when Sv39 was the default addressing=
 mode, and changes to run it in Sv48/Sv57 must be made.
>> The issue is related to the way how the address space is split between=
 stack, heap and shadow versions of them."
>> https://github.com/google/sanitizers/issues/1707#issuecomment-18524045=
60
> its ok to use Sv39, other modes are not as common yet.

Khem,

Are you saying that we should config qemu-native (target?) for riscv64=20
to default to SV39 ?

../Randy

>
>> so I don't think we've gotten to the best possible general purpose fix=
 but rather a (helpful) work-around.
>>
>> I don't think we should merge this since there's more work to do for a=
 proper fix.
>>
>> ../Randy
>>
>>
>>
>>
>> Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-sanitizers.inc | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recip=
es-devtools/gcc/gcc-sanitizers.inc
>> index 524ebd4ba4..8c98e9cf8a 100644
>> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
>> @@ -73,13 +73,14 @@ RRECOMMENDS:${PN}:append:x86 =3D " liblsan"
>>   RRECOMMENDS:${PN}:append:x86-64 =3D " liblsan libtsan"
>>   RRECOMMENDS:${PN}:append:powerpc64 =3D " liblsan libtsan"
>>   RRECOMMENDS:${PN}:append:aarch64 =3D " liblsan libtsan"
>> +RRECOMMENDS:${PN}:append:riscv64 =3D " liblsan libtsan"
>>
>>   do_package_write_ipk[depends] +=3D "virtual/${MLPREFIX}${TARGET_PREF=
IX}compilerlibs:do_packagedata"
>>   do_package_write_deb[depends] +=3D "virtual/${MLPREFIX}${TARGET_PREF=
IX}compilerlibs:do_packagedata"
>>   do_package_write_rpm[depends] +=3D "virtual/${MLPREFIX}${TARGET_PREF=
IX}compilerlibs:do_packagedata"
>>
>>   # Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are s=
upported
>> -COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loon=
garch64).*-linux'
>> +COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loon=
garch64|riscv64).*-linux'
>>   # musl is currently broken entirely
>>   COMPATIBLE_HOST:libc-musl =3D 'null'
>>
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#208161):https://lists.openembedded.org/g/openembed=
ded-core/message/208161
>> Mute This Topic:https://lists.openembedded.org/mt/109874858/1997914
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
# Randy MacLeod
# Wind River Linux

--------------wmDqU8VLOubcUlADr8cgYfvz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4B3103BQ016701

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-12-02 6:50 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqcPw0_=3D9XRfmyAGuc-3ny_=
p9uswUxM_0uOotGdoundJg@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Mon, Dec 2, 2024 at 3:14=E2=
=80=AFPM Randy MacLeod via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:randy.macleod=3Dwindriv=
er.com@lists.openembedded.org">&lt;randy.macleod=3Dwindriver.com@lists.op=
enembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">On 2024-12-01 11:35 p.m., =
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Deepthi.Hemraj@windr=
iver.com">Deepthi.Hemraj@windriver.com</a> wrote:

From: Deepthi Hemraj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:De=
epthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>

RISC-V offers several virtual memory address schemes (Sv39, Sv48, and Sv5=
7),
but ASan currently supports only Sv39 on RISC-V64.
For RISC-V64 Sv39, ASan uses custom allocator configurations
tuned to manage large allocations efficiently.
These tunings are incompatible with larger address spaces like
Sv48/Sv57 due to differences in region sizes and alignment.

For riscv64, Asan's tuning for Sv39 can be enabled in qemu
by using the appropriate flag in the command line as shown below:
runqemu nographic qemuparams=3D&quot;-cpu rv64,sv39=3Dtrue&quot;

Additionally, the COMPATIBLE_HOST list in gcc-sanitizers has been
updated to include riscv64. All necessary tests were successfully
conducted on both hardware(Microchip PolarFire SoC)
and the qemurisv64 environment, with ASan effectively
detecting memory errors in both scenarios.


Hi Deepthi,


Nice! Thanks for confirming that the qemu command line option allows gcc-=
sanitizers to

work without any code changes.


One concern is testing: testers would have know that this flag was needed=
 for gcc-sanitizers.

You could add a comment or documentation note as a hint but that doesn't =
automate and is error prone for people.

I did note that &quot;spacemonkeydelivers&quot; (!) maintains that :

&quot;Indeed ASAN was ported to RISC-V when Sv39 was the default addressi=
ng mode, and changes to run it in Sv48/Sv57 must be made.
The issue is related to the way how the address space is split between st=
ack, heap and shadow versions of them.&quot;
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/google/sani=
tizers/issues/1707#issuecomment-1852404560">https://github.com/google/san=
itizers/issues/1707#issuecomment-1852404560</a>
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">its ok to use Sv39, other mo=
des are not as common yet.</pre>
    </blockquote>
    <p>Khem,<br>
    </p>
    <p>Are you saying that we should config qemu-native (target?) for
      riscv64 to default to SV39 ?</p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqcPw0_=3D9XRfmyAGuc-3ny_=
p9uswUxM_0uOotGdoundJg@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">so I don't think we've got=
ten to the best possible general purpose fix but rather a (helpful) work-=
around.

I don't think we should merge this since there's more work to do for a pr=
oper fix.

../Randy




Signed-off-by: Deepthi Hemraj <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;=
</a>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-=
devtools/gcc/gcc-sanitizers.inc
index 524ebd4ba4..8c98e9cf8a 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -73,13 +73,14 @@ RRECOMMENDS:${PN}:append:x86 =3D &quot; liblsan&quot;
 RRECOMMENDS:${PN}:append:x86-64 =3D &quot; liblsan libtsan&quot;
 RRECOMMENDS:${PN}:append:powerpc64 =3D &quot; liblsan libtsan&quot;
 RRECOMMENDS:${PN}:append:aarch64 =3D &quot; liblsan libtsan&quot;
+RRECOMMENDS:${PN}:append:riscv64 =3D &quot; liblsan libtsan&quot;

 do_package_write_ipk[depends] +=3D &quot;virtual/${MLPREFIX}${TARGET_PRE=
FIX}compilerlibs:do_packagedata&quot;
 do_package_write_deb[depends] +=3D &quot;virtual/${MLPREFIX}${TARGET_PRE=
FIX}compilerlibs:do_packagedata&quot;
 do_package_write_rpm[depends] +=3D &quot;virtual/${MLPREFIX}${TARGET_PRE=
FIX}compilerlibs:do_packagedata&quot;

 # Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are suppo=
rted
-COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongar=
ch64).*-linux'
+COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongar=
ch64|riscv64).*-linux'
 # musl is currently broken entirely
 COMPATIBLE_HOST:libc-musl =3D 'null'



--
# Randy MacLeod
# Wind River Linux


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#208161): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/208161">https:/=
/lists.openembedded.org/g/openembedded-core/message/208161</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/109874858/1997914">https://lists.openembedded.org/mt=
/109874858/1997914</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------wmDqU8VLOubcUlADr8cgYfvz--

