Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1523E77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 04:44:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.37747.1736829871168205605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 20:44:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=310963887e=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E4P2Au021582
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 04:44:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443fm8am1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 04:44:30 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50E4iTqG016351;
	Tue, 14 Jan 2025 04:44:29 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443fm8am19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 04:44:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSJweojC0g7wPWHZ8UQCIlS6AwADcuyAE6QokGg50cKE6q7xzyQdDdhh1V6wt5B5jLIjDiNZsugxiGWwLcPPK0oifNqBIastF7hDvMq0RdaW06207ogEetnxanPIT1SiBkxnCju/0+9xfkH/9DhMk5yM3an81ODAbyUB6zL57XPpmtjeWvsxjngdu7P/0S6Qds/QstC0p/iABvmmmtWBDlPb11Bct+yA89b6+XIpP8aIlnPmhNtsLh6I1m/j7fRoCOjk9JncyNWEdQJLZ5P407iTmwqX+VJeo421rxSOd7/x/EyqTEwKUsSW791P/1pDSe9rfEHvXWbTNtpVpWW4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMr0DCPHAoAotBbXT9R2h8vC6TfcKR0XUnN2Fs10MZc=;
 b=sJKyS17GnFzgTTIzOd2bory4c8giqH2pD7hHxJptxfHYMaxscsAJKgWmVALz0aTfp/2UrwMNzYFxAncK+4uZr9iritJ0K1vKQoXirBpw3tDEo2FUPgAojXh2sr2A/91fb0j50F3iRDo68fNhlBe2ZOAkr0iXw6/6OJeC3MjzxeVLfNd34b7NcylSmGxnJG26HaXgredkX3bUYzkCPVky+ZwIyF4OXTsBXV32B8TToq9xDIveaeT+AgX2+sntALWSXnUnPCuB+ABCWfu/4ziWo6yLV6Pj/p7CuZBaCW1JNyQjdOU7t72s5HKLfeycCwotUjqXlmFy/hVe4E3pe9tDrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 04:44:25 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%6]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 04:44:25 +0000
Message-ID: <e465d90d-701e-4051-b530-3d8af2f268aa@windriver.com>
Date: Tue, 14 Jan 2025 12:44:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] fmt: 11.0.2 -> 11.1.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1736150475.git.liezhi.yang@windriver.com>
 <b6a3ea4a7a3c811d7f3f9fa74e11d5001321ecb1.1736150475.git.liezhi.yang@windriver.com>
 <CAMKF1soHePWfU3Vf5614+rW2iCLKmfmXwqFhh+genW++s_JcYg@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CAMKF1soHePWfU3Vf5614+rW2iCLKmfmXwqFhh+genW++s_JcYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR02CA0102.apcprd02.prod.outlook.com
 (2603:1096:4:92::18) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|CH3PR11MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e98fb80-2e7b-48cc-24f9-08dd34561f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aElPYWdkeEt4YlBsZHJBY1lYM1lEaDU3M0VnbmF0dllaOG5QY09HYytMQklq?=
 =?utf-8?B?eFowdElKMVJ1MHYrSkVYb25RZ3B3ejkyeWs1SnFpRVZJSWYzUCtRZU11S3Nt?=
 =?utf-8?B?aVdhODhZN2ZZSG1XbStCVE1mK1phbWJ3bTFPbXNCTXNiUC9jSmtHWitnVUl3?=
 =?utf-8?B?Y3NuU2tKWmNDK2JpSjU4NUg4TjlSZ25zZ3YyR2Z0dEVxaURxZzI4WlFVcnFR?=
 =?utf-8?B?RXdlcWFaMEJwVGxsOTJFV0pMTlQzVFNtMURoRk1wSEhQUUo2aVlld0RNVExI?=
 =?utf-8?B?TXNtRkVYQkY3NUh5RytzYlNIZEg5U0hudVBUdC9ybE5DeVBJWWdzMHd3YWpP?=
 =?utf-8?B?NGxmZmtmTnhNL2NqeUlGV1pNZ0J0dERsdjkydm0rUWJiWjUxdDhsQ0srTmlu?=
 =?utf-8?B?QXJkZDdrcm94dTJWc0NBK3NLakpOOGNwM211TENmeWpOeHVHakJoQ3l0Wm0v?=
 =?utf-8?B?dkJ2dXJqTUYzamsvTnczdHFFVSt6NCtyTC85dkgzNnVORkNzNG1lVWJwOUFD?=
 =?utf-8?B?MnpQeG5hZzlMU01tQlFaTlNvcUQrcUlJZVkzWE9PMnpHNjFFalBoUkZ0dVNw?=
 =?utf-8?B?dmR3UTk3aDZZOEk1ekNXQWRsZGZHQVVlM2ZDR3dEZDFtejBnNFZQTENlM1VB?=
 =?utf-8?B?WDVBa2lOWW5HV2tqSEl4K0V0TlNXdVgvY29Vb0ErTm4yTDBEc1VITmswQS9V?=
 =?utf-8?B?OXRVaG85V0NKOHh3Q1dPVVdETG1IZ3Vac29iZkRDSW5RU0xFa0U5dW94MVhP?=
 =?utf-8?B?VnVpckhGVUhRWEZ1SmhoS2hJQzRPMVFmUXNlczFzalpNZitBY1BZcGp5c0Q2?=
 =?utf-8?B?ekRkSjhNTE5HazZsWU8vTFgrTmFiOGpmcnJSS1VNZVF1WW1pWGtLV3Q2WTJs?=
 =?utf-8?B?WVdNTFVwL0NFQzBEbytURE1SMW9NSzZ4ZTRuOEhBeVZPb2V5SGNuSWM4REdx?=
 =?utf-8?B?MDQ1ejlUcGx6UjRvYVhVcHgvanlYNzRLblBBdDVQSW01bDU4UFRtSXdLRURp?=
 =?utf-8?B?MlJnQmlkSm8wVFNGbzRCMVlGZVB4VllUMy9aRkphYXZYYlRTNFh3V3pud3dX?=
 =?utf-8?B?YlB6eW9KWWVvb3N2Q0JJbk5kbWgvbFFqOFlGdS93S1JFUUVPOXlQRWhJYUZI?=
 =?utf-8?B?UzBhcDY1NGFPRGVxYjZkejV2NUYvREVyVWtDT3Y0Ly84Mis2U3pvak92WDFJ?=
 =?utf-8?B?Mk5FR0lUYUQ5M2U4REozeFlHWHptbEFldjVqOGpSTUxSNnhKTTZTempQU2dl?=
 =?utf-8?B?VTFuM2NlZnRQWUNsZWtvZ09iY2FrT3Q5VW15Y1o2OGN0QnkzaEpnQ1lnaHZt?=
 =?utf-8?B?ZlZQVWlZcUpUSHIrSmMwVUVFbE50NGd3V0VzcnFTNFVoWFVHRmVDeENseTUv?=
 =?utf-8?B?RzZFR1JYdGJueWQxaUFnUEFCUGxnU1R0S3NqN0pyNTd1dUVtNytNVFZLaGE1?=
 =?utf-8?B?eEk5cmxreXNlZFN4WUFmNE5idHhaNS9nSHphTUZaMStCVVBWQ1MxSEF4NWgw?=
 =?utf-8?B?aW1WVmxWdHZHemJveTVVUkpkMXYrNzRPcU9VMUFCb1VuMGFyUngwOHAvUjZ6?=
 =?utf-8?B?dG1sQVowVVBITmg2TVAzVkFxM1l0RUJzNW5JRWtlcENldnBnSm4wQ204Tm5x?=
 =?utf-8?B?Uk5jalZXRjJVb2NudTFiaUh2Ri9WVFVlaVZURG9qTCtCNUJVQm9mRkk0Qmdn?=
 =?utf-8?B?ZHVubFlJTldpS1dIdkh4NzhjeUZKSmE5cGpTaVZ5QkU2YzRHaERhVlBJM3Jv?=
 =?utf-8?B?eXlUbnpHV05yeG94UTBvNjI1NUNIMGtWZ0hGelRVcFA1QTA2ZGJWYk43Qktu?=
 =?utf-8?B?WGN6SDBMQWZTdnM3YUJWUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SmZiWStXOWgvMiswTml4TlJDNXZOMmdXOG1QZjFkRHJXSGZHanIrN01qcUxX?=
 =?utf-8?B?ZlIvY2ZoSlM0TWVhcUFWWXAyOEgwQ1N2alJpTGM2UVVnc2RGbDR3YmFwSjk4?=
 =?utf-8?B?UENxV2hOUUFwMHZvM2orc1lKR3BxYll3ZW1LYjV1SjZRWi92eGxaeCs4bDNT?=
 =?utf-8?B?QjQ1TnpmUjhhbDB4TGRRTENEU1lSOGNpQXBqMUltMTcxeWZPV282Y1E0a1Ba?=
 =?utf-8?B?SzAraVo5TU1HKzhZaUk4c2U5cSt2ajYxUWQ0dDJzRW9JNG1qdmJrZ1JDZnpU?=
 =?utf-8?B?ajVaMTVTdUovYWZGRUxscmJudW9wNWp3NjRBdlB1Y3JDUXZVTGdCZzUrNXpv?=
 =?utf-8?B?TDdvdkZ3Z3p5ek9MbVJtZitYZnN6N29FYW0vQlJ6QzhOcW1rZWZoVFlGckRm?=
 =?utf-8?B?ODdDajRPVkJzUnVIZmFRVDlZd2hSaHZva0p4QUJEQ3g1Rm1WS1ZSbCtoTkVZ?=
 =?utf-8?B?SWxYSndISDM2RE9lMm1DbzVPbjg5YXVrZjJjYit4MXgvM2ZTMUd6cHM4Q25p?=
 =?utf-8?B?KzZueVlmbGp4enUyODRvZUQxblBZYUs0ZXVWU3JadjFFL0JFb3VYSU1tSTd0?=
 =?utf-8?B?dlpPZUc3eThSaG9IdUlXVGc2akhEME8yaytHTFArdmNLeklGZUFUQUJpSW9w?=
 =?utf-8?B?OUxoWk41a0c3RWhpcE5zZStmT1VaL281Z1hiY3puZG02T0lXV0ZPaUxzYklB?=
 =?utf-8?B?NnBOL3B1M0g1Z1NKWVVneElFYzNST2dXbTd0RE45SjArUVNFc3dzc3dmeUg4?=
 =?utf-8?B?VmIyRTZSR1NaNkJ2a1l2RW1BODBtSFhHQm5RZmZLYjgwMnFqeVFNdmpLVi9u?=
 =?utf-8?B?ZDlLYTliQXZsRnNKc0E2aVk2YUNJWW1PbStTa01nYm8wRVBUZmdMSnJKNkM0?=
 =?utf-8?B?cldZSC8vclZGY2pNT3QxSkZYSVhtSVkvUUdvNVptQXM0R09BaGt5MHgxQThJ?=
 =?utf-8?B?YjFrNzVwWGk1cFJ6d04xT0ZFRkF1eXhjOHVXZmpBRUpsNWdxQ1BBVStEVnhF?=
 =?utf-8?B?b0I1RVNSa0lobEw4R0E0NjBRVk81eXRpMm9CYStkZUNLQy80QXRlMlpmMzl2?=
 =?utf-8?B?V05Qa2Z4a0E0WjBCaVE0TmFmUFhWV3RBWDUvTEpYWStSZmZBbEVqTVZDanUv?=
 =?utf-8?B?ZU56dElMbUFiYkFPSDRIN2NSUzZBRFllVFJLdW03K2FiUWRGMDZPRG1iNGor?=
 =?utf-8?B?UlZHUlNWMmg2Skg0UEpVUHpnbHlCQSsyWHlMbjIvSnlsZkpnWXUxbTdVQkFO?=
 =?utf-8?B?OWVFQ3RzR3BTNnBESXNsa1V2NlRtNlNQK0d2OGpIKzFWRGw1b3RFNlhobnUw?=
 =?utf-8?B?YjB6QVhSRjFULzBDR1ZqV1g3bnZiM0pIeGJ1enV2QmhpZnQvZWpBZHNXOG1L?=
 =?utf-8?B?MEl2a2FqeU5oa3pyM3lPQVJRc09vbE1XWlFQU3V3ZDcya2VKcThiWUZIelJX?=
 =?utf-8?B?K3d0b3NlZ1c2R3JuQUJYMmFPb0ZMN012Z0hNSjJGWExNTjlNUUZFSTJTK1hF?=
 =?utf-8?B?Nk1relRrNmN2T3ZrdGExeVJ3MXcvN0h0NGE1alo3bjVqY2MzNzRwRGtvSE9y?=
 =?utf-8?B?a2dFNndvTnNDVW1TUVFYUXprT2pobXpLUHo1S0libzZ1Q0xhUnh5MW8valJm?=
 =?utf-8?B?bldKVURGdUozOVJIbVF4UFZlQTYvTHlZRGJBSjhPdWhCdmE3QTIycmpYK2xH?=
 =?utf-8?B?aDBXQytXUVBWbTBKZ0FvVC9wNnpIdmJKTVRTYWNzdlNhVkdrbXpWR0pQSERh?=
 =?utf-8?B?emZjU01XeGEzQnNlVHgrSHAyWW93QTB5V1c1OWRtVFdSc29ZNDhUUXVsN0R6?=
 =?utf-8?B?MjNXek12U2FyYWpaUmhxTUZpWlNLcytEeUt1ZnFXUHJmS0RVTnBUWTdMbzhr?=
 =?utf-8?B?ZHJlS1Q0UmFWNjdEVFYxemlwZGtOR3VkUndGNDAxZmRadTRENHdmL21INkhH?=
 =?utf-8?B?SlVVdjNzSms4QUJZTGtVdG5yTkJwc1lWZ3dMbXFmejdJN1F4KytJd3RKZWZ3?=
 =?utf-8?B?NWdtUjgwcHpLcTlqaks1cmJwbFBDZSt4Z2lXamZEM0thT1hySm9yd1NOMUF4?=
 =?utf-8?B?WGhReDBqWVdjU3ZuUndHTXdPc2NJeGozc08yM0FSTnF3dnRibGpQbkpSeEx2?=
 =?utf-8?B?TFhJYSticGhldHhaOW0valMwdDNObkVjVTJ3emh3b3RSNWdGaUUrL09GenIx?=
 =?utf-8?B?ZUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e98fb80-2e7b-48cc-24f9-08dd34561f42
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 04:44:25.3696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /nmNRYG7rIotnbGzp914mQzMBFu886OTnqsfb7azTqOyvxCVtBDSvYQO3ig2ZSlfXGWNmj1WOmgMLA9b6wcSFkOL9pGSSxXgsb21fUCGShM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8660
X-Authority-Analysis: v=2.4 cv=Mtmo63ae c=1 sm=1 tr=0 ts=6785ebae cx=c_pps a=fpyyTn7Kx2iM0+fj1eipXw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=XkUYdDwvAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=VabnemYjAAAA:8 a=pGLkceISAAAA:8 a=CvMAuFGiryk_crYXevUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=22Hr7QaVm-UqefIw97Vx:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: uETUCLzvvQahN2fFdDCUXp1BhiAO2Nhu
X-Proofpoint-GUID: _PKTlHXnNMOwWhgtQRVFx-01vKg_bHr5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_10,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 clxscore=1015 mlxlogscore=920 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501140037
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50E4P2Au021582
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 04:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209774

Hi Khem,

On 1/10/25 02:35, Khem Raj wrote:
> I know this patch is applied but I still want to bring it to attention
> Many packages in other layers depend on fmt.  fmt's APIs are not or
> not used in a very backward compatible way
> some packages provide an option to use vendored version of fmt so in
> case of system fmt being not compatible is not
> a huge issue other than duplication, but some packages e.g. gerbera
> rely on system provided fmt and it still has not moved to
> 11.1
>=20
> I have tried to fix some of this fall out in meta-openembedded layers
> but this kind of stuff comes unplanned, so please build/test
> fmt upgrades with more than oe-core,  oe-core has 1 recipe ( ccache )
> which depends on fmt but meta-openembedded has more complex use cases
> of fmt.

Sorry about that, I will test with meta-openembedded next time when upgra=
de fmt.

// Robert

>=20
> On Mon, Jan 6, 2025 at 12:02=E2=80=AFAM Robert Yang via lists.openembed=
ded.org
> <liezhi.yang=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> Remove backported patch 0001-Get-rid-of-std-copy.patch.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../fmt/fmt/0001-Get-rid-of-std-copy.patch    | 52 -----------------=
--
>>   .../fmt/{fmt_11.0.2.bb =3D> fmt_11.1.1.bb}      |  6 +--
>>   2 files changed, 2 insertions(+), 56 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/fmt/fmt/0001-Get-rid-of-std=
-copy.patch
>>   rename meta/recipes-devtools/fmt/{fmt_11.0.2.bb =3D> fmt_11.1.1.bb} =
(80%)
>>
>> diff --git a/meta/recipes-devtools/fmt/fmt/0001-Get-rid-of-std-copy.pa=
tch b/meta/recipes-devtools/fmt/fmt/0001-Get-rid-of-std-copy.patch
>> deleted file mode 100644
>> index 1b495ea075..0000000000
>> --- a/meta/recipes-devtools/fmt/fmt/0001-Get-rid-of-std-copy.patch
>> +++ /dev/null
>> @@ -1,52 +0,0 @@
>> -From 6e462b89aa22fd5f737ed162d0150e145ccb1914 Mon Sep 17 00:00:00 200=
1
>> -From: Victor Zverovich <viz@meta.com>
>> -Date: Mon, 29 Jul 2024 15:58:05 -0700
>> -Subject: [PATCH] Get rid of std::copy
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -Upstream-Status: Backport [https://github.com/fmtlib/fmt/commit/6e462=
b89aa22fd5f737ed162d0150e145ccb1914]
>> ----
>> - include/fmt/color.h | 11 +++++------
>> - 1 file changed, 5 insertions(+), 6 deletions(-)
>> -
>> -diff --git a/include/fmt/color.h b/include/fmt/color.h
>> -index f0e9dd94..231d93c8 100644
>> ---- a/include/fmt/color.h
>> -+++ b/include/fmt/color.h
>> -@@ -560,31 +560,30 @@ struct formatter<detail::styled_arg<T>, Char> :=
 formatter<T, Char> {
>> -   auto format(const detail::styled_arg<T>& arg, FormatContext& ctx) =
const
>> -       -> decltype(ctx.out()) {
>> -     const auto& ts =3D arg.style;
>> --    const auto& value =3D arg.value;
>> -     auto out =3D ctx.out();
>> -
>> -     bool has_style =3D false;
>> -     if (ts.has_emphasis()) {
>> -       has_style =3D true;
>> -       auto emphasis =3D detail::make_emphasis<Char>(ts.get_emphasis(=
));
>> --      out =3D std::copy(emphasis.begin(), emphasis.end(), out);
>> -+      out =3D detail::copy<Char>(emphasis.begin(), emphasis.end(), o=
ut);
>> -     }
>> -     if (ts.has_foreground()) {
>> -       has_style =3D true;
>> -       auto foreground =3D
>> -           detail::make_foreground_color<Char>(ts.get_foreground());
>> --      out =3D std::copy(foreground.begin(), foreground.end(), out);
>> -+      out =3D detail::copy<Char>(foreground.begin(), foreground.end(=
), out);
>> -     }
>> -     if (ts.has_background()) {
>> -       has_style =3D true;
>> -       auto background =3D
>> -           detail::make_background_color<Char>(ts.get_background());
>> --      out =3D std::copy(background.begin(), background.end(), out);
>> -+      out =3D detail::copy<Char>(background.begin(), background.end(=
), out);
>> -     }
>> --    out =3D formatter<T, Char>::format(value, ctx);
>> -+    out =3D formatter<T, Char>::format(arg.value, ctx);
>> -     if (has_style) {
>> -       auto reset_color =3D string_view("\x1b[0m");
>> --      out =3D std::copy(reset_color.begin(), reset_color.end(), out)=
;
>> -+      out =3D detail::copy<Char>(reset_color.begin(), reset_color.en=
d(), out);
>> -     }
>> -     return out;
>> -   }
>> diff --git a/meta/recipes-devtools/fmt/fmt_11.0.2.bb b/meta/recipes-de=
vtools/fmt/fmt_11.1.1.bb
>> similarity index 80%
>> rename from meta/recipes-devtools/fmt/fmt_11.0.2.bb
>> rename to meta/recipes-devtools/fmt/fmt_11.1.1.bb
>> index 5c60921efa..a99a377ad4 100644
>> --- a/meta/recipes-devtools/fmt/fmt_11.0.2.bb
>> +++ b/meta/recipes-devtools/fmt/fmt_11.1.1.bb
>> @@ -4,10 +4,8 @@ HOMEPAGE =3D "https://fmt.dev"
>>   LICENSE =3D "MIT"
>>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db9257785fc4f3803a4b71b76c=
1412729"
>>
>> -SRC_URI =3D "git://github.com/fmtlib/fmt;branch=3Dmaster;protocol=3Dh=
ttps \
>> -           file://0001-Get-rid-of-std-copy.patch \
>> -           "
>> -SRCREV =3D "0c9fce2ffefecfdce794e1859584e25877b7b592"
>> +SRC_URI =3D "git://github.com/fmtlib/fmt;branch=3Dmaster;protocol=3Dh=
ttps"
>> +SRCREV =3D "e3ddede6c4ee818825c4e5a6dfa1d384860c27d9"
>>
>>   S =3D "${WORKDIR}/git"
>>
>> --
>> 2.44.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#209422): https://lists.openembedded.org/g/openembe=
dded-core/message/209422
>> Mute This Topic: https://lists.openembedded.org/mt/110453434/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

