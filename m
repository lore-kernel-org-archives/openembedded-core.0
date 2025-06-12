Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D97C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 10:48:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9875.1749725294156953431
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 03:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82583d514f=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C6JAbg010016
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 03:48:13 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq45cae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 03:48:12 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55CAmCB3023745;
	Thu, 12 Jun 2025 03:48:12 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq45cad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 03:48:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qt6WYb8Q7kXNHCxCdIALU1BuCkJEOcvv1VHr+FlzxMkJhnWp98mTGChwqD+uSq4KJyGfAAQe5sI88TJ2MiayOEgOLjvmg6aU+FNDvtu6PlGMXa9XNhd7PkmP94LKeuXCClK9pyesr6ls2D/xb9RVcxcfzxo+65PRS3OixQU+nnk876W37fihCRByqHIqslBh4rPTJuMywofuloIDMzj11I8N5zeAXZ0ucQm8QxbGm3DbfWJxSXOGBKlRZKB6wI0902+uddSMRDZea2pVSfYRFWZ0i2BR21Fvj5IpVt1kEFfIR49BMYr7eK0QeDDlA9eueaXi03FWbDqkdrGmeEl2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CR4XaNOFHyhNK9rhEmzt85N3FcjLzc/MS3g6HjUK2O8=;
 b=bcGkb9n+gGZ/Re42NdxDqCDjs6QZhYGQKNp9Zjtqg4Xj8tUzl9/+DF9ETYPSn53jmY4wGyYsOVnxmtyL9wKA0gOiui416vwtQXckKHfAbPaJP9oKL6AM4txHSE46+4QyAQxEhFYvdOGO4gZyj105baqlTdA39jCnYxnYkAtKsPj8F5MJLTp32tO/Offpxo4NUvVOXiIXyfCUrUKL2fxml9VIwUxtvzrxwR+h0usM78wDc06UMNBT1A6MlzrH2Tt5joyD9ubnDhkrokgg7eZZ0xepQ2lgJ92CBbkKaOlzvp8k2lb2Yr8SyLBKJ2+CDIMsZ59+8KznKFCzpC40aTYIYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA1PR11MB7132.namprd11.prod.outlook.com (2603:10b6:806:29e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 10:48:08 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 10:48:07 +0000
Message-ID: <29aa897c-1522-463d-9763-1d85ce5c93dd@windriver.com>
Date: Thu, 12 Jun 2025 16:18:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [walnascar][PATCH] gcc: Upgrade to GCC 14.3
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20250610090018.746363-1-Deepesh.Varatharajan@windriver.com>
 <CAOSpxdbJvox3JUy+dyNN8kY+CBa9VkFHJEMYubo292__HnbJ6w@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CAOSpxdbJvox3JUy+dyNN8kY+CBa9VkFHJEMYubo292__HnbJ6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PN4PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:273::6) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA1PR11MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: e273dec1-109e-4f64-09fb-08dda99e9d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QkxoNmdWZFBTTFBxellZc0ZSVGtqcEpKbWVCYWNkOGdScTZUL3Fiano3bGc1?=
 =?utf-8?B?M1c5Z0x1UUt3NEltbURKYWErL0U4T05GVk5nSW1vYkhabVZqVVJiSjFSVzMw?=
 =?utf-8?B?T01reW56K0tpeTdEOUJvTnp2cStUWld6MU5TQWVkN1p0Q3JWeUx4WTY1UjA3?=
 =?utf-8?B?VzZqNTQxMnMrZjZIbUU2OW1JVERsTUQrcEpQMXRwM29YUDk3R0VmZXN6Smt0?=
 =?utf-8?B?djNrdC9raTNGS25QZVV3TUZpR2dDWnFZWTB1cW1pSzBIT1JldnB3OVAzZzln?=
 =?utf-8?B?bEd3WTZpQndjRDhneUJXaElXTWlwRldXZXk0TWNRS0dYMXhtVXVhMFdqakFa?=
 =?utf-8?B?N0Q1dE5nWkh1b2hEZDFmNFBVaHJDNlBncVY5UTg3aDRRMkxvN3dIQURPQ1pm?=
 =?utf-8?B?WFhLdno1YW9ieTNvbDhVZ0s0MUNLUnRLanNBbzFmdEc4dlNVSGtBMDFhMVNL?=
 =?utf-8?B?ZTJUSlFlUjQrVkFEVGcvRHpkbTQxMUl6TlFHYlNqTGFoRE11a2M1MDBMZ2J2?=
 =?utf-8?B?VnpKUlVHRlhUcXk2OURRY20rUXhJaVZ0QmZNRGJRNkZ1bHZGcTVkZXJHdDM1?=
 =?utf-8?B?NElWcDRWV1VJZDIrd0ExeGtqYXV2cGMvZWZLaHgzUkp4OE9qampHVE0rbks0?=
 =?utf-8?B?TmowOUVWamxweUx3SFZ0TjhWS29PZ0xxajVpR1JOSzMxemlXWm9aQXdueEhv?=
 =?utf-8?B?N1VnbVNoMDR0cXc1Y09qMzVVZDFPaUdzOW9wQ1hXaHF6MTg4UGlnVDVKWmc3?=
 =?utf-8?B?aGNLNis5TmV5K3p5MUxUVDJQcXQ5OG12YzBtZjlwSHdtUTVmc3IyVTFxcXFP?=
 =?utf-8?B?UnJZaXVZQm91L2FObzNDbnFZR1VkdnhqTkRmWFhJaFhWQmJ5OFdpcnpQYXNU?=
 =?utf-8?B?bHU0SHNrTkxUTHJNYXNORE9lVm05b2poamgrTWRwbnliem1HUU9NdWVFWW9F?=
 =?utf-8?B?SHlKbGt6c3VMb1p3U29nU25yRDVKeC9PMkNERWxPcWZoQU9GRzVQbkdIR0F2?=
 =?utf-8?B?ZGNsV0dqTTBlcU5XeDMzU1dCVnFRN1ZLQ2x5T1JreWRYc0xtcEhydVNoN2lu?=
 =?utf-8?B?RENkNUZhclVFd29kc2hNcDdDNXZyYUNJUXQxNWxZY0dvMVFDRllDZnQrYkJO?=
 =?utf-8?B?d1BIcU9DWUMyZkJNQ1hWaEhLbUJZd0NNTFZ3U3VBd1I1c0taMHRGNzJaeWcx?=
 =?utf-8?B?cXA1aVlxcW5XK1hLMWR2MW5aSlhaZnE1YkwwaTZNTlJCNnlkaisrRTFlWXpT?=
 =?utf-8?B?ZVFVckE2Nno2RUFwb0JwYUNLSVpWdlptRHE5clI3anBpbFVhallMUndKcmkv?=
 =?utf-8?B?T1E4VG14S2dDTDJQc0Vnbk1iR1N0Y2c5WGYxNVN0OUs5UnJabDlBTmlzZzRB?=
 =?utf-8?B?YVBnZWEzb09xemV5cWI0Zlc3UDBZUmt0VCtFMTlHY1lXZ3hvR0JpcFN4OFRr?=
 =?utf-8?B?OXhaSmVnMWd0RS9ZK1cvT2V2VmtLOWgrYUZvUFB6YWVITFZ6aVRnWmVWajhW?=
 =?utf-8?B?dm5ramFETEZzWFJHalhFRFk5ZDRYQ09RQVZ4cXBsZVcyTE9EdTFWZklncXhN?=
 =?utf-8?B?WnEvQ25jTWdTZ1NuQUVuZmZ5TmtCZEk1L01lVFRRYmFLOU45dDREM25OZXI2?=
 =?utf-8?B?SS9RMmI0QWMvWXpjTHlBTU95VEt3R0hzbHBZekR3S3ZWL0QzMWdPNlJrWnpo?=
 =?utf-8?B?NGZRVUtENHdjeW5MUXY0M21FaVhnVEV4Z0tFS3FDZWdac1ZlTEVGWnNqV0kz?=
 =?utf-8?B?c0owOE85YU9VR1QrSlR4bjZFQXdtM0tET2xBTzYwN2wrV2wxZW1rMzR1WklF?=
 =?utf-8?Q?36N+kiOwvp0J+uR0uNP9FNsJSooAG5FPilYCc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bkwxQmNBU0ZpeGFlckEwbkMxdzJ2ZDRSRGp3THY4RitPaTZxQS9PKzlTdlpl?=
 =?utf-8?B?N2JzcjR5bVBnbkhXTkFHT1RjVUlNSzBNVXQvYmZML00zOWJVYStudUk3N3g0?=
 =?utf-8?B?ZCs3ZGRUTTZvV2l3YXlINDcrTVEzR1ZzRU56RHhCUmdXRGJGSlFHY3JVN3dR?=
 =?utf-8?B?RzhSRlJDcThtMmlYTGZ3cVZWVjZYNllLOWxiMHkwUUNjT2xIUS9OcGdiWkxz?=
 =?utf-8?B?U0RsSWRtWVhsU3JHYW1nNHVUa1ZuTGwycGpsdGRLUU1iUE4xdXBMT3VPNFBF?=
 =?utf-8?B?N05WZTNLVHlVai9iZjAzekVTZjE0WmF0NTBJMDlKL3RCdS9HRWZndTNKU3ZJ?=
 =?utf-8?B?Ui9EVmVxRjRySGJ4VE1rc09aanRWa2tEMi96dHV2TnVnZ0RZN3JvQVY2ZXFJ?=
 =?utf-8?B?RjV0N3ExZ3lONmM3Mmg5cmt2MWR5YkdsTDdYc2I0NDJielp1MXVxalpNVmc2?=
 =?utf-8?B?b3dZWVAyYnBwUnVPNlZDdDdTc2xnWWRuQ2lFYUs1ZkdSOWJHaEtVSjNJZXl4?=
 =?utf-8?B?ZUFqaHRpOUc0aWxQWjdJRGd0ZStOdHBicG4ySXdpRCttZU52N1Uxc0dZanBu?=
 =?utf-8?B?TDNDMUxRS0thUm5HMys2NDF5ai9HS1JaaE5rcXZlT1hnbWVXcFNxSCtsYXht?=
 =?utf-8?B?cUl5RGJXWURYdjBZakV6SjY0Mmp1eENPSjMzOXlPbmZPTXhkakFSb0tGS2pQ?=
 =?utf-8?B?Nks3d0JXbC8rc3ZENTQ4Q1VjaHVxWktPbFBhYy9PVnRrdmhJZzRWWi9qdCtU?=
 =?utf-8?B?Yms5d0dGYzhFa1V5UDFhVHlkb3ovYUxLcXQyMUpOR3ZUcTFOakpacjdHTERD?=
 =?utf-8?B?Q3hiY1d3SmJnOGFPUEkyV3Z2TDk1Wkl5dC9CRXlzVXZhajdmb3BNbDUrOGdj?=
 =?utf-8?B?SEZzQTVlaFZtcFFOM1Bja2N1N2JTNzFoMUNvVnUxY0NQYk8wUWlURTBtMW0v?=
 =?utf-8?B?T29MNnRCWVVHTmQ2djNxcnpNa0JvRDhpcGhLYVA5V1JDRkpTUjd4cnZCT01r?=
 =?utf-8?B?TzUvMC9NVlJ4dVJDTTlQWExkUWZjTWlsd29BOVNUVFhNZWhHZ2NOaTBmN05H?=
 =?utf-8?B?OEpTS214QWp3MzBDNGFFVGtkU051Y0YrR3ZSNnN1V2JFNkU0eGttWnRuNHl6?=
 =?utf-8?B?NHAveUxJbkNiaWMwcy9Sc3BPdUMvREFWRVRDUWhFR0V3UEY5Y1BJTWY4WWE3?=
 =?utf-8?B?TGlFT2ozckQ2TkxZVnVrR1hLZUdhWFgxclZ1QnE1SHBZaXA2NlV2ZzE3ZUF4?=
 =?utf-8?B?dGZ5d21VeWFHSXc4K3ZubEU5ckxqSzlhTmhXZGpiMGZxaEIraWpkaWM4Sld0?=
 =?utf-8?B?MFdiV2pOTDRNZmljNStBVWNYNXMxWUo4WTh6L1pWaVFXa0M5Z25nZWR3aHY0?=
 =?utf-8?B?WUVSZm04T3lqK0lJTzJKdFZGMDMvZVpLWUl5RDFrNDNNbm9kdkNRSUJWRzJN?=
 =?utf-8?B?a2FLRVhBUXA0UWZFR0pFQi9rTlVFaEpVbEFPdW5FNGVRb1FtZlFNWkx2bG5h?=
 =?utf-8?B?VFhJMXA3ZXoyUlBNTzQxMXRSNjE4dStpTUdpbGFIVDk1ZXd5eE50Z3B2WWcr?=
 =?utf-8?B?UXBmb1Z1M3R0RElzcDc0RmVLYTJ5alhVVXg2aXZmdEFMb1JNNmtlS2J1bmVD?=
 =?utf-8?B?bjJjeGNtdHFFUHdyd24xNDBKWGxvM0syQjh6QjhRaHd0NmhhbFNFUGc4OHZG?=
 =?utf-8?B?Wjc4MWhrZEY1M0daTm1VbHJQRnlHOGozOU42K3l1U1IyLy85b1ppSnhXc3p2?=
 =?utf-8?B?aDFqZlR5Q25QdzUzbTcrYm1XSVI5Yzhack4rVzdSMSthVVk2OWFUV0VnYnhY?=
 =?utf-8?B?enVFU1lXTWtJT3M0NTN6ZmRwbmNhV2xMd3RvbVNZcHM5TmxaVFpRNEVGaFNo?=
 =?utf-8?B?cGJ3UEhDQUZsdUlUM3laODRkU2ZGeENkU0xHdHZQQncwbnRSYVlITENpekZl?=
 =?utf-8?B?NjJVbGRwR2lLeE8wTGhRNkhmWjI2dm1DYkIyK2V5TlFqQjA1TjB5dmxRN3A5?=
 =?utf-8?B?aFFkTmFwcVV5Q3pRUk5wR0YwdDNCamJrb2t4QXVudmNKN2Q2UTd4a1BnSUtx?=
 =?utf-8?B?MEZVYjFiS3dwTTZyRmhjSXRkaTNjNG9UZDVPTG4zS1FVelU4aFhabFdSWmJo?=
 =?utf-8?B?empYZ01DTCtDbmJyWW9mdFFtQ2FhSlk5Y3AwMWw4Rm5va0h4bFI5akZtTUpu?=
 =?utf-8?Q?4uQL9Y4k6XQ7t8jP7356tB0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e273dec1-109e-4f64-09fb-08dda99e9d90
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 10:48:07.6421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qYX/hBEOmpAmObgYDZRow9/PjbkiHURWIGGUaEVZZPTXjyR3lOy+GJVS9nRmq+RbmBaqMd8Dm6C3oQfhknMIiCLM3bQ3q9aT944Pw74vpGFyWAzWBL1t1IT7H8t4f8+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7132
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=684ab06c cx=c_pps a=RuymQIG3+YzwfY4kumoM/w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=mDV3o1hIAAAA:8 a=NEAV23lmAAAA:8 a=m9shYIPOAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=20KFwNOVAAAA:8 a=QyXUC8HyAAAA:8 a=_enOPnqeAAAA:8 a=I2DHzFDlipuIWUAT0ScA:9 a=cJfBtsZ_2-cJbQsf:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FnvyL7ShRj4A:10 a=OK5ky32wnfMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-GUID: cEq4Kp5yDrt8JkmXX4i_wSmpcrbRwQ7p
X-Proofpoint-ORIG-GUID: fpg--rl_B-xP6ptv-yp8mBSsIdvR-Vym
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA4MiBTYWx0ZWRfXw1emO+ym8iEc ELFl36SXTCQB9kLGYml8s90GDJ7QZjI8MPe8FOk2Iz4Xf/xdtuXqDP7gmqqmFNF3KJj1q4dRjjD apASre/kN/fCX9/Yjaco0JirR3RnHW3AdJ1zLpqIOijrokrWtrplQ/P8qSDZTJ0f6m2F/nY+v9M
 voRctSqc1P5EUzeqKiN6SzBswpQHMHR+G8NCBj3ofqw6c06MN/VtmZPTnzhf/YuG0D+89ZiHT2e OSdHPAoMko2WDBWgdYZcS/LNMNtzuCE7h3liPVCeh1LDIzkSGnUkSKJl7P1RLS43otw6hxc2I3h ImPE7ev7WNkyoQsjIrM3kvwNorOwpBRUBSOX85qRdJcJrxkHqFrrA/uhuQVzpfJkUFQ1AHat4JG
 dEp6OypL0Nhof4yGAZHiqBH/kr3eqa+5Gzfr9sXp40WXrd5kJhY/vfk7LUeuQN5Ztp6vP85o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506120082
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55C6JAbg010016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 10:48:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218506


On 12-06-2025 01:54, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Hi Deepesh,
>
> Could you submit a V2 that deals with this error:
>
> The following recipes do not have a maintainer assigned to them.
> Please add an entry to meta/conf/distro/include/maintainers.inc file.
> gcc-source-14.3.0
> (/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-devt=
ools/gcc/gcc-source_14.3.bb)
>
> Thanks!
>
> Steve

Hi Steve,

V2 incoming.

Regards,
Deepesh

>
> On Tue, Jun 10, 2025 at 2:00=E2=80=AFAM Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> GCC 14.3 is a bug-fix release from the GCC 14 branch
>> containing important fixes for regressions and serious bugs in
>> GCC 14.2 with more than 211 bugs fixed since the previous release.
>>
>> https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&resolut=
ion=3DFIXED&target_milestone=3D14.3
>>
>> Dropped the below patches:
>> 0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
>> https://github.com/gcc-mirror/gcc/commit/a9f88741a99ba09b29cc0021499c6=
3ca445393f0
>>
>> 0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch
>> https://github.com/gcc-mirror/gcc/commit/aa4cd614456de65ee3417acb83c6c=
ff0640144e9
>>
>> 0028-fix-incorrect-preprocessor-line-numbers.patch
>> https://github.com/gcc-mirror/gcc/commit/8cbe033a8a88fe6437cc5d343ae0d=
df8dd3455c8
>>
>> 0001-arm-Fix-LDRD-register-overlap-PR117675.patch
>> https://github.com/gcc-mirror/gcc/commit/9366c328518766d89615538872605=
5624716c0af
>>
>> gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch
>> https://github.com/gcc-mirror/gcc/commit/ab884fffe3fc82a710bea66ad6517=
20d71c938b8
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
>> ---
>>   .../gcc/{gcc-14.2.inc =3D> gcc-14.3.inc}        |  11 +-
>>   ...ian_14.2.bb =3D> gcc-cross-canadian_14.3.bb} |   0
>>   .../{gcc-cross_14.2.bb =3D> gcc-cross_14.3.bb}  |   0
>>   ...-crosssdk_14.2.bb =3D> gcc-crosssdk_14.3.bb} |   0
>>   ...cc-runtime_14.2.bb =3D> gcc-runtime_14.3.bb} |   0
>>   ...itizers_14.2.bb =3D> gcc-sanitizers_14.3.bb} |   0
>>   ...{gcc-source_14.2.bb =3D> gcc-source_14.3.bb} |   0
>>   ...m-Fix-LDRD-register-overlap-PR117675.patch | 148 -----
>>   ...ix-c-tweak-for-Wrange-loop-construct.patch | 114 ----
>>   ...ch-to-fix-data-relocation-to-ENDBR-s.patch | 447 --------------
>>   ...-incorrect-preprocessor-line-numbers.patch | 475 ---------------
>>   ...4fffe3fc82a710bea66ad651720d71c938b8.patch | 549 ----------------=
--
>>   .../gcc/{gcc_14.2.bb =3D> gcc_14.3.bb}          |   0
>>   ...initial_14.2.bb =3D> libgcc-initial_14.3.bb} |   0
>>   .../gcc/{libgcc_14.2.bb =3D> libgcc_14.3.bb}    |   0
>>   ...ibgfortran_14.2.bb =3D> libgfortran_14.3.bb} |   0
>>   16 files changed, 3 insertions(+), 1741 deletions(-)
>>   rename meta/recipes-devtools/gcc/{gcc-14.2.inc =3D> gcc-14.3.inc} (9=
0%)
>>   rename meta/recipes-devtools/gcc/{gcc-cross-canadian_14.2.bb =3D> gc=
c-cross-canadian_14.3.bb} (100%)
>>   rename meta/recipes-devtools/gcc/{gcc-cross_14.2.bb =3D> gcc-cross_1=
4.3.bb} (100%)
>>   rename meta/recipes-devtools/gcc/{gcc-crosssdk_14.2.bb =3D> gcc-cros=
ssdk_14.3.bb} (100%)
>>   rename meta/recipes-devtools/gcc/{gcc-runtime_14.2.bb =3D> gcc-runti=
me_14.3.bb} (100%)
>>   rename meta/recipes-devtools/gcc/{gcc-sanitizers_14.2.bb =3D> gcc-sa=
nitizers_14.3.bb} (100%)
>>   rename meta/recipes-devtools/gcc/{gcc-source_14.2.bb =3D> gcc-source=
_14.3.bb} (100%)
>>   delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-arm-Fix-LDRD-r=
egister-overlap-PR117675.patch
>>   delete mode 100644 meta/recipes-devtools/gcc/gcc/0026-gcc-Fix-c-twea=
k-for-Wrange-loop-construct.patch
>>   delete mode 100644 meta/recipes-devtools/gcc/gcc/0027-gcc-backport-p=
atch-to-fix-data-relocation-to-ENDBR-s.patch
>>   delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-fix-incorrect-=
preprocessor-line-numbers.patch
>>   delete mode 100644 meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3f=
c82a710bea66ad651720d71c938b8.patch
>>   rename meta/recipes-devtools/gcc/{gcc_14.2.bb =3D> gcc_14.3.bb} (100=
%)
>>   rename meta/recipes-devtools/gcc/{libgcc-initial_14.2.bb =3D> libgcc=
-initial_14.3.bb} (100%)
>>   rename meta/recipes-devtools/gcc/{libgcc_14.2.bb =3D> libgcc_14.3.bb=
} (100%)
>>   rename meta/recipes-devtools/gcc/{libgfortran_14.2.bb =3D> libgfortr=
an_14.3.bb} (100%)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-dev=
tools/gcc/gcc-14.3.inc
>> similarity index 90%
>> rename from meta/recipes-devtools/gcc/gcc-14.2.inc
>> rename to meta/recipes-devtools/gcc/gcc-14.3.inc
>> index fa9003f604..ca2f2e2a13 100644
>> --- a/meta/recipes-devtools/gcc/gcc-14.2.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-14.3.inc
>> @@ -2,11 +2,11 @@ require gcc-common.inc
>>
>>   # Third digit in PV should be incremented after a minor release
>>
>> -PV =3D "14.2.0"
>> +PV =3D "14.3.0"
>>
>>   # BINV should be incremented to a revision after a minor gcc release
>>
>> -BINV =3D "14.2.0"
>> +BINV =3D "14.3.0"
>>
>>   FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backpo=
rt:"
>>
>> @@ -40,7 +40,7 @@ LIC_FILES_CHKSUM =3D "\
>>   RELEASE ?=3D "${PV}"
>>   BASEURI ?=3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
>>   SOURCEDIR ?=3D "gcc-${PV}"
>> -SRC_URI[sha256sum] =3D "a7b39bc69cbf9e25826c5a60ab26477001f7c08d85cec=
04bc0e29cabed6f3cc9"
>> +SRC_URI[sha256sum] =3D "e0dc77297625631ac8e50fa92fffefe899a4eb702592d=
a5c32ef04e2293aca3a"
>>
>>   SRC_URI =3D "${BASEURI} \
>>              file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
>> @@ -68,11 +68,6 @@ SRC_URI =3D "${BASEURI} \
>>              file://0023-Fix-install-path-of-linux64.h.patch \
>>              file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.p=
atch \
>>              file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
>> -          file://0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch=
 \
>> -           file://0027-gcc-backport-patch-to-fix-data-relocation-to-E=
NDBR-s.patch \
>> -           file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.pa=
tch \
>> -           file://0001-arm-Fix-LDRD-register-overlap-PR117675.patch \
>> -           file://0028-fix-incorrect-preprocessor-line-numbers.patch =
\
>>   "
>>
>>   S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_14.2.bb b/me=
ta/recipes-devtools/gcc/gcc-cross-canadian_14.3.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc-cross-canadian_14.2.bb
>> rename to meta/recipes-devtools/gcc/gcc-cross-canadian_14.3.bb
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross_14.2.bb b/meta/recipe=
s-devtools/gcc/gcc-cross_14.3.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc-cross_14.2.bb
>> rename to meta/recipes-devtools/gcc/gcc-cross_14.3.bb
>> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_14.2.bb b/meta/rec=
ipes-devtools/gcc/gcc-crosssdk_14.3.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc-crosssdk_14.2.bb
>> rename to meta/recipes-devtools/gcc/gcc-crosssdk_14.3.bb
>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb b/meta/reci=
pes-devtools/gcc/gcc-runtime_14.3.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc-runtime_14.2.bb
>> rename to meta/recipes-devtools/gcc/gcc-runtime_14.3.bb
>> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_14.2.bb b/meta/r=
ecipes-devtools/gcc/gcc-sanitizers_14.3.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc-sanitizers_14.2.bb
>> rename to meta/recipes-devtools/gcc/gcc-sanitizers_14.3.bb
>> diff --git a/meta/recipes-devtools/gcc/gcc-source_14.2.bb b/meta/recip=
es-devtools/gcc/gcc-source_14.3.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc-source_14.2.bb
>> rename to meta/recipes-devtools/gcc/gcc-source_14.3.bb
>> diff --git a/meta/recipes-devtools/gcc/gcc/0001-arm-Fix-LDRD-register-=
overlap-PR117675.patch b/meta/recipes-devtools/gcc/gcc/0001-arm-Fix-LDRD-=
register-overlap-PR117675.patch
>> deleted file mode 100644
>> index e3d887a135..0000000000
>> --- a/meta/recipes-devtools/gcc/gcc/0001-arm-Fix-LDRD-register-overlap=
-PR117675.patch
>> +++ /dev/null
>> @@ -1,148 +0,0 @@
>> -From 9366c328518766d896155388726055624716c0af Mon Sep 17 00:00:00 200=
1
>> -From: Wilco Dijkstra <wilco.dijkstra@arm.com>
>> -Date: Tue, 10 Dec 2024 14:22:48 +0000
>> -Subject: [PATCH] arm: Fix LDRD register overlap [PR117675]
>> -
>> -The register indexed variants of LDRD have complex register overlap c=
onstraints
>> -which makes them hard to use without using output_move_double (which =
can't be
>> -used for atomics as it doesn't guarantee to emit atomic LDRD/STRD whe=
n required).
>> -Add a new predicate and constraint for plain LDRD/STRD with base or b=
ase+imm.
>> -This blocks register indexing and fixes PR117675.
>> -
>> -gcc:
>> -       PR target/117675
>> -       * config/arm/arm.cc (arm_ldrd_legitimate_address): New functio=
n.
>> -       * config/arm/arm-protos.h (arm_ldrd_legitimate_address): New p=
rototype.
>> -       * config/arm/constraints.md: Add new Uo constraint.
>> -       * config/arm/predicates.md (arm_ldrd_memory_operand): Add new =
predicate.
>> -       * config/arm/sync.md (arm_atomic_loaddi2_ldrd): Use
>> -       arm_ldrd_memory_operand and Uo.
>> -
>> -gcc/testsuite:
>> -       PR target/117675
>> -       * gcc.target/arm/pr117675.c: Add new test.
>> -
>> -(cherry picked from commit 21fbfae2e55e1a153820acc6fbd922e66f67e65b)
>> -
>> -Upstream-Status: Backport [https://gcc.gnu.org/bugzilla/show_bug.cgi?=
id=3D117675]
>> ----
>> - gcc/config/arm/arm-protos.h             |  1 +
>> - gcc/config/arm/arm.cc                   | 24 +++++++++++++++++++++++=
+
>> - gcc/config/arm/constraints.md           |  8 +++++++-
>> - gcc/config/arm/predicates.md            |  4 ++++
>> - gcc/config/arm/sync.md                  |  2 +-
>> - gcc/testsuite/gcc.target/arm/pr117675.c | 17 +++++++++++++++++
>> - 6 files changed, 54 insertions(+), 2 deletions(-)
>> - create mode 100644 gcc/testsuite/gcc.target/arm/pr117675.c
>> -
>> ---- a/gcc/config/arm/arm-protos.h
>> -+++ b/gcc/config/arm/arm-protos.h
>> -@@ -202,6 +202,7 @@ extern rtx arm_load_tp (rtx);
>> - extern bool arm_coproc_builtin_available (enum unspecv);
>> - extern bool arm_coproc_ldc_stc_legitimate_address (rtx);
>> - extern rtx arm_stack_protect_tls_canary_mem (bool);
>> -+extern bool arm_ldrd_legitimate_address (rtx);
>> -
>> -
>> - #if defined TREE_CODE
>> ---- a/gcc/config/arm/arm.cc
>> -+++ b/gcc/config/arm/arm.cc
>> -@@ -34523,6 +34523,30 @@ arm_coproc_ldc_stc_legitimate_address (r
>> -   return false;
>> - }
>> -
>> -+/* Return true if OP is a valid memory operand for LDRD/STRD without=
 any
>> -+   register overlap restrictions.  Allow [base] and [base, imm] for =
now.  */
>> -+bool
>> -+arm_ldrd_legitimate_address (rtx op)
>> -+{
>> -+  if (!MEM_P (op))
>> -+    return false;
>> -+
>> -+  op =3D XEXP (op, 0);
>> -+  if (REG_P (op))
>> -+    return true;
>> -+
>> -+  if (GET_CODE (op) !=3D PLUS)
>> -+    return false;
>> -+  if (!REG_P (XEXP (op, 0)) || !CONST_INT_P (XEXP (op, 1)))
>> -+    return false;
>> -+
>> -+  HOST_WIDE_INT val =3D INTVAL (XEXP (op, 1));
>> -+
>> -+  if (TARGET_ARM)
>> -+    return IN_RANGE (val, -255, 255);
>> -+  return IN_RANGE (val, -1020, 1020) && (val & 3) =3D=3D 0;
>> -+}
>> -+
>> - /* Return the diagnostic message string if conversion from FROMTYPE =
to
>> -    TOTYPE is not allowed, NULL otherwise.  */
>> -
>> ---- a/gcc/config/arm/constraints.md
>> -+++ b/gcc/config/arm/constraints.md
>> -@@ -39,7 +39,7 @@
>> - ;; in all states: Pg
>> -
>> - ;; The following memory constraints have been used:
>> --;; in ARM/Thumb-2 state: Uh, Ut, Uv, Uy, Un, Um, Us, Up, Uf, Ux, Ul
>> -+;; in ARM/Thumb-2 state: Uh, Ut, Uv, Uy, Un, Um, Us, Uo, Up, Uf, Ux,=
 Ul, Uz
>> - ;; in ARM state: Uq
>> - ;; in Thumb state: Uu, Uw
>> - ;; in all states: Q
>> -@@ -585,6 +585,12 @@
>> -  (and (match_code "mem")
>> -       (match_test "arm_coproc_ldc_stc_legitimate_address (op)")))
>> -
>> -+(define_memory_constraint "Uo"
>> -+ "@internal
>> -+  A memory operand for Arm/Thumb-2 LDRD/STRD"
>> -+ (and (match_code "mem")
>> -+      (match_test "arm_ldrd_legitimate_address (op)")))
>> -+
>> - ;; We used to have constraint letters for S and R in ARM state, but
>> - ;; all uses of these now appear to have been removed.
>> -
>> ---- a/gcc/config/arm/predicates.md
>> -+++ b/gcc/config/arm/predicates.md
>> -@@ -849,6 +849,10 @@
>> -   (and (match_operand 0 "memory_operand")
>> -        (match_code "reg" "0")))
>> -
>> -+;; True if the operand is memory reference suitable for a ldrd/strd.
>> -+(define_predicate "arm_ldrd_memory_operand"
>> -+  (match_test "arm_ldrd_legitimate_address (op)"))
>> -+
>> - ;; Predicates for parallel expanders based on mode.
>> - (define_special_predicate "vect_par_constant_high"
>> -   (match_code "parallel")
>> ---- a/gcc/config/arm/sync.md
>> -+++ b/gcc/config/arm/sync.md
>> -@@ -161,7 +161,7 @@
>> - (define_insn "arm_atomic_loaddi2_ldrd"
>> -   [(set (match_operand:DI 0 "register_operand" "=3Dr")
>> -       (unspec_volatile:DI
>> --        [(match_operand:DI 1 "memory_operand" "m")]
>> -+        [(match_operand:DI 1 "arm_ldrd_memory_operand" "Uo")]
>> -           VUNSPEC_LDRD_ATOMIC))]
>> -   "ARM_DOUBLEWORD_ALIGN && TARGET_HAVE_LPAE"
>> -   "ldrd\t%0, %H0, %1"
>> ---- /dev/null
>> -+++ b/gcc/testsuite/gcc.target/arm/pr117675.c
>> -@@ -0,0 +1,17 @@
>> -+/* { dg-do compile } */
>> -+/* { dg-options "-O2 -marm" } */
>> -+/* { dg-require-effective-target arm_arch_v7ve_neon_ok } */
>> -+/* { dg-add-options arm_arch_v7ve_neon } */
>> -+/* { dg-final { check-function-bodies "**" "" "" } } */
>> -+
>> -+/*
>> -+** f1:
>> -+**    add     r0, r0, r1
>> -+**    ldrd    r0, r1, \[r0\]
>> -+**    bx      lr
>> -+*/
>> -+long long f1 (char *p, int i)
>> -+{
>> -+  return __atomic_load_n ((long long *)(p + i), __ATOMIC_RELAXED);
>> -+}
>> -+
>> diff --git a/meta/recipes-devtools/gcc/gcc/0026-gcc-Fix-c-tweak-for-Wr=
ange-loop-construct.patch b/meta/recipes-devtools/gcc/gcc/0026-gcc-Fix-c-=
tweak-for-Wrange-loop-construct.patch
>> deleted file mode 100644
>> index c9bc863eea..0000000000
>> --- a/meta/recipes-devtools/gcc/gcc/0026-gcc-Fix-c-tweak-for-Wrange-lo=
op-construct.patch
>> +++ /dev/null
>> @@ -1,114 +0,0 @@
>> -From 05106fea707f010779369c5d6e89787953d2976f Mon Sep 17 00:00:00 200=
1
>> -From: Sunil Dora <sunilkumar.dora@windriver.com>
>> -Date: Wed, 11 Dec 2024 10:04:56 -0800
>> -Subject: [PATCH] gcc: Fix c++: tweak for Wrange-loop-construct
>> -
>> -This commit updates the warning to use a check for "trivially constru=
ctible" instead of
>> -"trivially copyable." The original check was incorrect, as "trivially=
 copyable" only applies
>> -to types that can be copied trivially, whereas "trivially constructib=
le" is the correct check
>> -for types that can be trivially default-constructed.
>> -
>> -This change ensures the warning is more accurate and aligns with the =
proper type traits.
>> -
>> -LLVM accepted a similar fix:
>> -https://github.com/llvm/llvm-project/issues/47355
>> -
>> -PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D116731]
>> -
>> -Upstream-Status: Backport [https://gcc.gnu.org/g:6ac4e2f4b2ca9980670e=
7d3815a9140730df1005]
>> -
>> -Signed-off-by: Marek Polacek <polacek@redhat.com>
>> -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
>> ----
>> - gcc/cp/parser.cc                              |  8 ++-
>> - .../g++.dg/warn/Wrange-loop-construct3.C      | 57 +++++++++++++++++=
++
>> - 2 files changed, 62 insertions(+), 3 deletions(-)
>> - create mode 100644 gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.=
C
>> -
>> -diff --git a/gcc/cp/parser.cc b/gcc/cp/parser.cc
>> -index 7e81c1010..8206489a2 100644
>> ---- a/gcc/cp/parser.cc
>> -+++ b/gcc/cp/parser.cc
>> -@@ -14301,11 +14301,13 @@ warn_for_range_copy (tree decl, tree expr)
>> -   else if (!CP_TYPE_CONST_P (type))
>> -     return;
>> -
>> --  /* Since small trivially copyable types are cheap to copy, we supp=
ress the
>> --     warning for them.  64B is a common size of a cache line.  */
>> -+  /* Since small trivially constructible types are cheap to construc=
t, we
>> -+     suppress the warning for them.  64B is a common size of a cache=
 line.  */
>> -+  tree vec =3D make_tree_vec (1);
>> -+  TREE_VEC_ELT (vec, 0) =3D TREE_TYPE (expr);
>> -   if (TREE_CODE (TYPE_SIZE_UNIT (type)) !=3D INTEGER_CST
>> -       || (tree_to_uhwi (TYPE_SIZE_UNIT (type)) <=3D 64
>> --        && trivially_copyable_p (type)))
>> -+        && is_trivially_xible (INIT_EXPR, type, vec)))
>> -     return;
>> -
>> -   /* If we can initialize a reference directly, suggest that to avoi=
d the
>> -diff --git a/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C b/gcc=
/testsuite/g++.dg/warn/Wrange-loop-construct3.C
>> -new file mode 100644
>> -index 000000000..3d9d0c908
>> ---- /dev/null
>> -+++ b/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
>> -@@ -0,0 +1,57 @@
>> -+// PR c++/116731
>> -+// { dg-do compile { target c++11 } }
>> -+// { dg-options "-Wrange-loop-construct" }
>> -+
>> -+void
>> -+f0 ()
>> -+{
>> -+  struct S {
>> -+    char a[64];
>> -+    S& operator=3D(const S&) { return *this; };
>> -+  };
>> -+
>> -+  S arr[8];
>> -+  for (const auto r : arr)
>> -+    (void) r;
>> -+}
>> -+
>> -+void
>> -+f1 ()
>> -+{
>> -+  struct S {
>> -+    char a[65];
>> -+    S& operator=3D(const S&) { return *this; };
>> -+  };
>> -+
>> -+  S arr[8];
>> -+  for (const auto r : arr) // { dg-warning "creates a copy" }
>> -+    (void) r;
>> -+}
>> -+
>> -+void
>> -+f2 ()
>> -+{
>> -+  struct S {
>> -+    char a[64];
>> -+    S& operator=3D(const S&) { return *this; };
>> -+    ~S() { }
>> -+  };
>> -+
>> -+  S arr[8];
>> -+  for (const auto r : arr) // { dg-warning "creates a copy" }
>> -+    (void) r;
>> -+}
>> -+
>> -+void
>> -+f3 ()
>> -+{
>> -+  struct S {
>> -+    char a[65];
>> -+    S& operator=3D(const S&) { return *this; };
>> -+    ~S() { }
>> -+  };
>> -+
>> -+  S arr[8];
>> -+  for (const auto r : arr) // { dg-warning "creates a copy" }
>> -+    (void) r;
>> -+}
>> ---
>> -2.43.0
>> -
>> diff --git a/meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch-to-=
fix-data-relocation-to-ENDBR-s.patch b/meta/recipes-devtools/gcc/gcc/0027=
-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch
>> deleted file mode 100644
>> index 5bede60816..0000000000
>> --- a/meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch-to-fix-dat=
a-relocation-to-ENDBR-s.patch
>> +++ /dev/null
>> @@ -1,447 +0,0 @@
>> -From 4e7735a8d87559bbddfe3a985786996e22241f8d Mon Sep 17 00:00:00 200=
1
>> -From: liuhongt <hongtao.liu@intel.com>
>> -Date: Mon, 12 Aug 2024 14:35:31 +0800
>> -Subject: [PATCH] Move ix86_align_loops into a separate pass and inser=
t the
>> - pass after pass_endbr_and_patchable_area.
>> -
>> -gcc/ChangeLog:
>> -
>> -       PR target/116174
>> -       * config/i386/i386.cc (ix86_align_loops): Move this to ..
>> -       * config/i386/i386-features.cc (ix86_align_loops): .. here.
>> -       (class pass_align_tight_loops): New class.
>> -       (make_pass_align_tight_loops): New function.
>> -       * config/i386/i386-passes.def: Insert pass_align_tight_loops
>> -       after pass_insert_endbr_and_patchable_area.
>> -       * config/i386/i386-protos.h (make_pass_align_tight_loops): New
>> -       declare.
>> -
>> -gcc/testsuite/ChangeLog:
>> -
>> -       * gcc.target/i386/pr116174.c: New test.
>> -
>> -(cherry picked from commit c3c83d22d212a35cb1bfb8727477819463f0dcd8)
>> -
>> -Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dp=
atch;h=3D4e7735a8d87559bbddfe3a985786996e22241f8d]
>> -
>> -Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
>> ----
>> - gcc/config/i386/i386-features.cc         | 191 +++++++++++++++++++++=
++
>> - gcc/config/i386/i386-passes.def          |   3 +
>> - gcc/config/i386/i386-protos.h            |   1 +
>> - gcc/config/i386/i386.cc                  | 146 -----------------
>> - gcc/testsuite/gcc.target/i386/pr116174.c |  12 ++
>> - 5 files changed, 207 insertions(+), 146 deletions(-)
>> - create mode 100644 gcc/testsuite/gcc.target/i386/pr116174.c
>> -
>> -diff --git a/gcc/config/i386/i386-features.cc b/gcc/config/i386/i386-=
features.cc
>> -index e3e004d55267..7de19d423637 100644
>> ---- a/gcc/config/i386/i386-features.cc
>> -+++ b/gcc/config/i386/i386-features.cc
>> -@@ -3253,6 +3253,197 @@ make_pass_remove_partial_avx_dependency (gcc:=
:context *ctxt)
>> -   return new pass_remove_partial_avx_dependency (ctxt);
>> - }
>> -
>> -+/* When a hot loop can be fit into one cacheline,
>> -+   force align the loop without considering the max skip.  */
>> -+static void
>> -+ix86_align_loops ()
>> -+{
>> -+  basic_block bb;
>> -+
>> -+  /* Don't do this when we don't know cache line size.  */
>> -+  if (ix86_cost->prefetch_block =3D=3D 0)
>> -+    return;
>> -+
>> -+  loop_optimizer_init (AVOID_CFG_MODIFICATIONS);
>> -+  profile_count count_threshold =3D cfun->cfg->count_max / param_ali=
gn_threshold;
>> -+  FOR_EACH_BB_FN (bb, cfun)
>> -+    {
>> -+      rtx_insn *label =3D BB_HEAD (bb);
>> -+      bool has_fallthru =3D 0;
>> -+      edge e;
>> -+      edge_iterator ei;
>> -+
>> -+      if (!LABEL_P (label))
>> -+      continue;
>> -+
>> -+      profile_count fallthru_count =3D profile_count::zero ();
>> -+      profile_count branch_count =3D profile_count::zero ();
>> -+
>> -+      FOR_EACH_EDGE (e, ei, bb->preds)
>> -+      {
>> -+        if (e->flags & EDGE_FALLTHRU)
>> -+          has_fallthru =3D 1, fallthru_count +=3D e->count ();
>> -+        else
>> -+          branch_count +=3D e->count ();
>> -+      }
>> -+
>> -+      if (!fallthru_count.initialized_p () || !branch_count.initiali=
zed_p ())
>> -+      continue;
>> -+
>> -+      if (bb->loop_father
>> -+        && bb->loop_father->latch !=3D EXIT_BLOCK_PTR_FOR_FN (cfun)
>> -+        && (has_fallthru
>> -+            ? (!(single_succ_p (bb)
>> -+                 && single_succ (bb) =3D=3D EXIT_BLOCK_PTR_FOR_FN (c=
fun))
>> -+               && optimize_bb_for_speed_p (bb)
>> -+               && branch_count + fallthru_count > count_threshold
>> -+               && (branch_count > fallthru_count * param_align_loop_=
iterations))
>> -+            /* In case there'no fallthru for the loop.
>> -+               Nops inserted won't be executed.  */
>> -+            : (branch_count > count_threshold
>> -+               || (bb->count > bb->prev_bb->count * 10
>> -+                   && (bb->prev_bb->count
>> -+                       <=3D ENTRY_BLOCK_PTR_FOR_FN (cfun)->count / 2=
)))))
>> -+      {
>> -+        rtx_insn* insn, *end_insn;
>> -+        HOST_WIDE_INT size =3D 0;
>> -+        bool padding_p =3D true;
>> -+        basic_block tbb =3D bb;
>> -+        unsigned cond_branch_num =3D 0;
>> -+        bool detect_tight_loop_p =3D false;
>> -+
>> -+        for (unsigned int i =3D 0; i !=3D bb->loop_father->num_nodes=
;
>> -+             i++, tbb =3D tbb->next_bb)
>> -+          {
>> -+            /* Only handle continuous cfg layout. */
>> -+            if (bb->loop_father !=3D tbb->loop_father)
>> -+              {
>> -+                padding_p =3D false;
>> -+                break;
>> -+              }
>> -+
>> -+            FOR_BB_INSNS (tbb, insn)
>> -+              {
>> -+                if (!NONDEBUG_INSN_P (insn))
>> -+                  continue;
>> -+                size +=3D ix86_min_insn_size (insn);
>> -+
>> -+                /* We don't know size of inline asm.
>> -+                   Don't align loop for call.  */
>> -+                if (asm_noperands (PATTERN (insn)) >=3D 0
>> -+                    || CALL_P (insn))
>> -+                  {
>> -+                    size =3D -1;
>> -+                    break;
>> -+                  }
>> -+              }
>> -+
>> -+            if (size =3D=3D -1 || size > ix86_cost->prefetch_block)
>> -+              {
>> -+                padding_p =3D false;
>> -+                break;
>> -+              }
>> -+
>> -+            FOR_EACH_EDGE (e, ei, tbb->succs)
>> -+              {
>> -+                /* It could be part of the loop.  */
>> -+                if (e->dest =3D=3D bb)
>> -+                  {
>> -+                    detect_tight_loop_p =3D true;
>> -+                    break;
>> -+                  }
>> -+              }
>> -+
>> -+            if (detect_tight_loop_p)
>> -+              break;
>> -+
>> -+            end_insn =3D BB_END (tbb);
>> -+            if (JUMP_P (end_insn))
>> -+              {
>> -+                /* For decoded icache:
>> -+                   1. Up to two branches are allowed per Way.
>> -+                   2. A non-conditional branch is the last micro-op =
in a Way.
>> -+                */
>> -+                if (onlyjump_p (end_insn)
>> -+                    && (any_uncondjump_p (end_insn)
>> -+                        || single_succ_p (tbb)))
>> -+                  {
>> -+                    padding_p =3D false;
>> -+                    break;
>> -+                  }
>> -+                else if (++cond_branch_num >=3D 2)
>> -+                  {
>> -+                    padding_p =3D false;
>> -+                    break;
>> -+                  }
>> -+              }
>> -+
>> -+          }
>> -+
>> -+        if (padding_p && detect_tight_loop_p)
>> -+          {
>> -+            emit_insn_before (gen_max_skip_align (GEN_INT (ceil_log2=
 (size)),
>> -+                                                  GEN_INT (0)), labe=
l);
>> -+            /* End of function.  */
>> -+            if (!tbb || tbb =3D=3D EXIT_BLOCK_PTR_FOR_FN (cfun))
>> -+              break;
>> -+            /* Skip bb which already fits into one cacheline.  */
>> -+            bb =3D tbb;
>> -+          }
>> -+      }
>> -+    }
>> -+
>> -+  loop_optimizer_finalize ();
>> -+  free_dominance_info (CDI_DOMINATORS);
>> -+}
>> -+
>> -+namespace {
>> -+
>> -+const pass_data pass_data_align_tight_loops =3D
>> -+{
>> -+  RTL_PASS, /* type */
>> -+  "align_tight_loops", /* name */
>> -+  OPTGROUP_NONE, /* optinfo_flags */
>> -+  TV_MACH_DEP, /* tv_id */
>> -+  0, /* properties_required */
>> -+  0, /* properties_provided */
>> -+  0, /* properties_destroyed */
>> -+  0, /* todo_flags_start */
>> -+  0, /* todo_flags_finish */
>> -+};
>> -+
>> -+class pass_align_tight_loops : public rtl_opt_pass
>> -+{
>> -+public:
>> -+  pass_align_tight_loops (gcc::context *ctxt)
>> -+    : rtl_opt_pass (pass_data_align_tight_loops, ctxt)
>> -+  {}
>> -+
>> -+  /* opt_pass methods: */
>> -+  bool gate (function *) final override
>> -+    {
>> -+      return optimize && optimize_function_for_speed_p (cfun);
>> -+    }
>> -+
>> -+  unsigned int execute (function *) final override
>> -+    {
>> -+      timevar_push (TV_MACH_DEP);
>> -+#ifdef ASM_OUTPUT_MAX_SKIP_ALIGN
>> -+      ix86_align_loops ();
>> -+#endif
>> -+      timevar_pop (TV_MACH_DEP);
>> -+      return 0;
>> -+    }
>> -+}; // class pass_align_tight_loops
>> -+
>> -+} // anon namespace
>> -+
>> -+rtl_opt_pass *
>> -+make_pass_align_tight_loops (gcc::context *ctxt)
>> -+{
>> -+  return new pass_align_tight_loops (ctxt);
>> -+}
>> -+
>> - /* This compares the priority of target features in function DECL1
>> -    and DECL2.  It returns positive value if DECL1 is higher priority=
,
>> -    negative value if DECL2 is higher priority and 0 if they are the
>> -diff --git a/gcc/config/i386/i386-passes.def b/gcc/config/i386/i386-p=
asses.def
>> -index 7d96766f7b96..e500f15c9971 100644
>> ---- a/gcc/config/i386/i386-passes.def
>> -+++ b/gcc/config/i386/i386-passes.def
>> -@@ -31,5 +31,8 @@ along with GCC; see the file COPYING3.  If not see
>> -   INSERT_PASS_BEFORE (pass_cse2, 1, pass_stv, true /* timode_p */);
>> -
>> -   INSERT_PASS_BEFORE (pass_shorten_branches, 1, pass_insert_endbr_an=
d_patchable_area);
>> -+  /* pass_align_tight_loops must be after pass_insert_endbr_and_patc=
hable_area.
>> -+     PR116174.  */
>> -+  INSERT_PASS_BEFORE (pass_shorten_branches, 1, pass_align_tight_loo=
ps);
>> -
>> -   INSERT_PASS_AFTER (pass_combine, 1, pass_remove_partial_avx_depend=
ency);
>> -diff --git a/gcc/config/i386/i386-protos.h b/gcc/config/i386/i386-pro=
tos.h
>> -index 46214a63974d..36c7b1aed42b 100644
>> ---- a/gcc/config/i386/i386-protos.h
>> -+++ b/gcc/config/i386/i386-protos.h
>> -@@ -419,6 +419,7 @@ extern rtl_opt_pass *make_pass_insert_endbr_and_p=
atchable_area
>> -   (gcc::context *);
>> - extern rtl_opt_pass *make_pass_remove_partial_avx_dependency
>> -   (gcc::context *);
>> -+extern rtl_opt_pass *make_pass_align_tight_loops (gcc::context *);
>> -
>> - extern bool ix86_has_no_direct_extern_access;
>> -
>> -diff --git a/gcc/config/i386/i386.cc b/gcc/config/i386/i386.cc
>> -index 6f89891d3cb5..288c69467d62 100644
>> ---- a/gcc/config/i386/i386.cc
>> -+++ b/gcc/config/i386/i386.cc
>> -@@ -23444,150 +23444,6 @@ ix86_split_stlf_stall_load ()
>> -     }
>> - }
>> -
>> --/* When a hot loop can be fit into one cacheline,
>> --   force align the loop without considering the max skip.  */
>> --static void
>> --ix86_align_loops ()
>> --{
>> --  basic_block bb;
>> --
>> --  /* Don't do this when we don't know cache line size.  */
>> --  if (ix86_cost->prefetch_block =3D=3D 0)
>> --    return;
>> --
>> --  loop_optimizer_init (AVOID_CFG_MODIFICATIONS);
>> --  profile_count count_threshold =3D cfun->cfg->count_max / param_ali=
gn_threshold;
>> --  FOR_EACH_BB_FN (bb, cfun)
>> --    {
>> --      rtx_insn *label =3D BB_HEAD (bb);
>> --      bool has_fallthru =3D 0;
>> --      edge e;
>> --      edge_iterator ei;
>> --
>> --      if (!LABEL_P (label))
>> --      continue;
>> --
>> --      profile_count fallthru_count =3D profile_count::zero ();
>> --      profile_count branch_count =3D profile_count::zero ();
>> --
>> --      FOR_EACH_EDGE (e, ei, bb->preds)
>> --      {
>> --        if (e->flags & EDGE_FALLTHRU)
>> --          has_fallthru =3D 1, fallthru_count +=3D e->count ();
>> --        else
>> --          branch_count +=3D e->count ();
>> --      }
>> --
>> --      if (!fallthru_count.initialized_p () || !branch_count.initiali=
zed_p ())
>> --      continue;
>> --
>> --      if (bb->loop_father
>> --        && bb->loop_father->latch !=3D EXIT_BLOCK_PTR_FOR_FN (cfun)
>> --        && (has_fallthru
>> --            ? (!(single_succ_p (bb)
>> --                 && single_succ (bb) =3D=3D EXIT_BLOCK_PTR_FOR_FN (c=
fun))
>> --               && optimize_bb_for_speed_p (bb)
>> --               && branch_count + fallthru_count > count_threshold
>> --               && (branch_count > fallthru_count * param_align_loop_=
iterations))
>> --            /* In case there'no fallthru for the loop.
>> --               Nops inserted won't be executed.  */
>> --            : (branch_count > count_threshold
>> --               || (bb->count > bb->prev_bb->count * 10
>> --                   && (bb->prev_bb->count
>> --                       <=3D ENTRY_BLOCK_PTR_FOR_FN (cfun)->count / 2=
)))))
>> --      {
>> --        rtx_insn* insn, *end_insn;
>> --        HOST_WIDE_INT size =3D 0;
>> --        bool padding_p =3D true;
>> --        basic_block tbb =3D bb;
>> --        unsigned cond_branch_num =3D 0;
>> --        bool detect_tight_loop_p =3D false;
>> --
>> --        for (unsigned int i =3D 0; i !=3D bb->loop_father->num_nodes=
;
>> --             i++, tbb =3D tbb->next_bb)
>> --          {
>> --            /* Only handle continuous cfg layout. */
>> --            if (bb->loop_father !=3D tbb->loop_father)
>> --              {
>> --                padding_p =3D false;
>> --                break;
>> --              }
>> --
>> --            FOR_BB_INSNS (tbb, insn)
>> --              {
>> --                if (!NONDEBUG_INSN_P (insn))
>> --                  continue;
>> --                size +=3D ix86_min_insn_size (insn);
>> --
>> --                /* We don't know size of inline asm.
>> --                   Don't align loop for call.  */
>> --                if (asm_noperands (PATTERN (insn)) >=3D 0
>> --                    || CALL_P (insn))
>> --                  {
>> --                    size =3D -1;
>> --                    break;
>> --                  }
>> --              }
>> --
>> --            if (size =3D=3D -1 || size > ix86_cost->prefetch_block)
>> --              {
>> --                padding_p =3D false;
>> --                break;
>> --              }
>> --
>> --            FOR_EACH_EDGE (e, ei, tbb->succs)
>> --              {
>> --                /* It could be part of the loop.  */
>> --                if (e->dest =3D=3D bb)
>> --                  {
>> --                    detect_tight_loop_p =3D true;
>> --                    break;
>> --                  }
>> --              }
>> --
>> --            if (detect_tight_loop_p)
>> --              break;
>> --
>> --            end_insn =3D BB_END (tbb);
>> --            if (JUMP_P (end_insn))
>> --              {
>> --                /* For decoded icache:
>> --                   1. Up to two branches are allowed per Way.
>> --                   2. A non-conditional branch is the last micro-op =
in a Way.
>> --                */
>> --                if (onlyjump_p (end_insn)
>> --                    && (any_uncondjump_p (end_insn)
>> --                        || single_succ_p (tbb)))
>> --                  {
>> --                    padding_p =3D false;
>> --                    break;
>> --                  }
>> --                else if (++cond_branch_num >=3D 2)
>> --                  {
>> --                    padding_p =3D false;
>> --                    break;
>> --                  }
>> --              }
>> --
>> --          }
>> --
>> --        if (padding_p && detect_tight_loop_p)
>> --          {
>> --            emit_insn_before (gen_max_skip_align (GEN_INT (ceil_log2=
 (size)),
>> --                                                  GEN_INT (0)), labe=
l);
>> --            /* End of function.  */
>> --            if (!tbb || tbb =3D=3D EXIT_BLOCK_PTR_FOR_FN (cfun))
>> --              break;
>> --            /* Skip bb which already fits into one cacheline.  */
>> --            bb =3D tbb;
>> --          }
>> --      }
>> --    }
>> --
>> --  loop_optimizer_finalize ();
>> --  free_dominance_info (CDI_DOMINATORS);
>> --}
>> --
>> - /* Implement machine specific optimizations.  We implement padding o=
f returns
>> -    for K8 CPUs and pass to avoid 4 jumps in the single 16 byte windo=
w.  */
>> - static void
>> -@@ -23611,8 +23467,6 @@ ix86_reorg (void)
>> - #ifdef ASM_OUTPUT_MAX_SKIP_ALIGN
>> -       if (TARGET_FOUR_JUMP_LIMIT)
>> -       ix86_avoid_jump_mispredicts ();
>> --
>> --      ix86_align_loops ();
>> - #endif
>> -     }
>> - }
>> -diff --git a/gcc/testsuite/gcc.target/i386/pr116174.c b/gcc/testsuite=
/gcc.target/i386/pr116174.c
>> -new file mode 100644
>> -index 000000000000..8877d0b51af1
>> ---- /dev/null
>> -+++ b/gcc/testsuite/gcc.target/i386/pr116174.c
>> -@@ -0,0 +1,12 @@
>> -+/* { dg-do compile { target *-*-linux* } } */
>> -+/* { dg-options "-O2 -fcf-protection=3Dbranch" } */
>> -+
>> -+char *
>> -+foo (char *dest, const char *src)
>> -+{
>> -+  while ((*dest++ =3D *src++) !=3D '\0')
>> -+    /* nothing */;
>> -+  return --dest;
>> -+}
>> -+
>> -+/* { dg-final { scan-assembler "\t\.cfi_startproc\n\tendbr(32|64)\n"=
 } } */
>> ---
>> -2.43.5
>> diff --git a/meta/recipes-devtools/gcc/gcc/0028-fix-incorrect-preproce=
ssor-line-numbers.patch b/meta/recipes-devtools/gcc/gcc/0028-fix-incorrec=
t-preprocessor-line-numbers.patch
>> deleted file mode 100644
>> index 5185236a3d..0000000000
>> --- a/meta/recipes-devtools/gcc/gcc/0028-fix-incorrect-preprocessor-li=
ne-numbers.patch
>> +++ /dev/null
>> @@ -1,475 +0,0 @@
>> -From 8cbe033a8a88fe6437cc5d343ae0ddf8dd3455c8 Mon Sep 17 00:00:00 200=
1
>> -From: Jakub Jelinek <jakub@redhat.com>
>> -Date: Thu, 8 May 2025 11:14:24 +0200
>> -Subject: libcpp: Further fixes for incorrect line numbers in large fi=
les
>> - [PR120061]
>> -MIME-Version: 1.0
>> -Content-Type: text/plain; charset=3DUTF-8
>> -Content-Transfer-Encoding: 8bit
>> -
>> -The backport of the PR108900 fix to 14 branch broke building chromium
>> -because static_assert (__LINE__ =3D=3D expected_line_number, ""); now=
 triggers
>> -as the __LINE__ values are off by one.
>> -This isn't the case on the trunk and 15 branch because we've switched
>> -to 64-bit location_t and so one actually needs far longer header file=
s
>> -to trigger it.
>> -https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D120061#c11
>> -https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D120061#c12
>> -contain (large) testcases in patch form which show on the 14 branch
>> -that the first one used to fail before the PR108900 backport and now
>> -works correctly, while the second one attempts to match the chromium
>> -behavior and it used to pass before the PR108900 backport and now it
>> -FAILs.
>> -The two testcases show rare problematic cases, because
>> -do_include_common -> parse_include -> check_eol -> check_eol_1 ->
>> -cpp_get_token_1 -> _cpp_lex_token -> _cpp_lex_direct -> linemap_line_=
start
>> -triggers there
>> -      /* Allocate the new line_map.  However, if the current map only=
 has a
>> -         single line we can sometimes just increase its column_bits i=
nstead. */
>> -      if (line_delta < 0
>> -          || last_line !=3D ORDINARY_MAP_STARTING_LINE_NUMBER (map)
>> -          || SOURCE_COLUMN (map, highest) >=3D (1U << (column_bits - =
range_bits))
>> -          || ( /* We can't reuse the map if the line offset is suffic=
iently
>> -                  large to cause overflow when computing location_t v=
alues.  */
>> -              (to_line - ORDINARY_MAP_STARTING_LINE_NUMBER (map))
>> -              >=3D (((uint64_t) 1)
>> -                  << (CHAR_BIT * sizeof (linenum_type) - column_bits)=
))
>> -          || range_bits < map->m_range_bits)
>> -        map =3D linemap_check_ordinary
>> -                (const_cast <line_map *>
>> -                  (linemap_add (set, LC_RENAME,
>> -                                ORDINARY_MAP_IN_SYSTEM_HEADER_P (map)=
,
>> -                                ORDINARY_MAP_FILE_NAME (map),
>> -                                to_line)));
>> -and so creates a new ordinary map on the line right after the
>> -(problematic) #include line.
>> -Now, in the spot that r14-11679-g8a884140c2bcb7 patched,
>> -pfile->line_table->highest_location in all 3 tests (also
>> -https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D120061#c13
>> -) is before the decrement the start of the line after the #include li=
ne and so
>> -the decrement is really desirable in that case to put highest_locatio=
n
>> -[jakub@tucnak gcc-15]$ git log -1 --format=3D%B r15-9638-gbfcb5da69a4=
1f7a5e41faab39b763d9d7c8bd2ea | cat
>> -libcpp: Further fixes for incorrect line numbers in large files [PR12=
0061]
>> -
>> -The backport of the PR108900 fix to 14 branch broke building chromium
>> -because static_assert (__LINE__ =3D=3D expected_line_number, ""); now=
 triggers
>> -as the __LINE__ values are off by one.
>> -This isn't the case on the trunk and 15 branch because we've switched
>> -to 64-bit location_t and so one actually needs far longer header file=
s
>> -to trigger it.
>> -https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D120061#c11
>> -https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D120061#c12
>> -contain (large) testcases in patch form which show on the 14 branch
>> -that the first one used to fail before the PR108900 backport and now
>> -works correctly, while the second one attempts to match the chromium
>> -behavior and it used to pass before the PR108900 backport and now it
>> -FAILs.
>> -The two testcases show rare problematic cases, because
>> -do_include_common -> parse_include -> check_eol -> check_eol_1 ->
>> -cpp_get_token_1 -> _cpp_lex_token -> _cpp_lex_direct -> linemap_line_=
start
>> -triggers there
>> -      /* Allocate the new line_map.  However, if the current map only=
 has a
>> -         single line we can sometimes just increase its column_bits i=
nstead. */
>> -      if (line_delta < 0
>> -          || last_line !=3D ORDINARY_MAP_STARTING_LINE_NUMBER (map)
>> -          || SOURCE_COLUMN (map, highest) >=3D (1U << (column_bits - =
range_bits))
>> -          || ( /* We can't reuse the map if the line offset is suffic=
iently
>> -                  large to cause overflow when computing location_t v=
alues.  */
>> -              (to_line - ORDINARY_MAP_STARTING_LINE_NUMBER (map))
>> -              >=3D (((uint64_t) 1)
>> -                  << (CHAR_BIT * sizeof (linenum_type) - column_bits)=
))
>> -          || range_bits < map->m_range_bits)
>> -        map =3D linemap_check_ordinary
>> -                (const_cast <line_map *>
>> -                  (linemap_add (set, LC_RENAME,
>> -                                ORDINARY_MAP_IN_SYSTEM_HEADER_P (map)=
,
>> -                                ORDINARY_MAP_FILE_NAME (map),
>> -                                to_line)));
>> -and so creates a new ordinary map on the line right after the
>> -(problematic) #include line.
>> -Now, in the spot that r14-11679-g8a884140c2bcb7 patched,
>> -pfile->line_table->highest_location in all 3 tests (also
>> -https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D120061#c13
>> -) is before the decrement the start of the line after the #include li=
ne and so
>> -the decrement is really desirable in that case to put highest_locatio=
n
>> -somewhere on the line where the #include actually is.
>> -But at the same time it is also undesirable, because if we do decreme=
nt it,
>> -then linemap_add LC_ENTER called from _cpp_do_file_change will then
>> -  /* Generate a start_location above the current highest_location.
>> -     If possible, make the low range bits be zero.  */
>> -  location_t start_location =3D set->highest_location + 1;
>> -  unsigned range_bits =3D 0;
>> -  if (start_location < LINE_MAP_MAX_LOCATION_WITH_COLS)
>> -    range_bits =3D set->default_range_bits;
>> -  start_location +=3D (1 << range_bits) - 1;
>> -  start_location &=3D  ~((1 << range_bits) - 1);
>> -
>> -  linemap_assert (!LINEMAPS_ORDINARY_USED (set)
>> -                  || (start_location
>> -                      >=3D MAP_START_LOCATION (LINEMAPS_LAST_ORDINARY=
_MAP (set))));
>> -and we can end up with the new LC_ENTER ordinary map having the same
>> -start_location as the preceding LC_RENAME one.
>> -Next thing that happens is computation of included_from:
>> -  if (reason =3D=3D LC_ENTER)
>> -    {
>> -      if (set->depth =3D=3D 0)
>> -        map->included_from =3D 0;
>> -      else
>> -        /* The location of the end of the just-closed map.  */
>> -        map->included_from
>> -          =3D (((map[0].start_location - 1 - map[-1].start_location)
>> -              & ~((1 << map[-1].m_column_and_range_bits) - 1))
>> -             + map[-1].start_location);
>> -The normal case (e.g. with the testcase included at the start of this=
 comment) is
>> -that map[-1] starts somewhere earlier and so map->included_from compu=
tation above
>> -nicely computes location_t which expands to the start of the #include=
 line.
>> -With r14-11679 reverted, for #c11 as well as #c12
>> -map[0].start_location =3D=3D map[-1].start_location above, and so it =
is
>> -((location_t) -1 & ~((1 << map[-1].m_column_and_range_bits) - 1)))
>> -+ map[-1].start_location,
>> -which happens to be start of the #include line.
>> -For #c11 map[0].start_location is 0x500003a0 and map[-1] has
>> -m_column_and_range_bits 7 and map[-2] has m_column_and_range_bits 12 =
and
>> -map[0].included_from is set to 0x50000320.
>> -For #c12 map[0].start_location is 0x606c0402 and map[-2].start_locati=
on is
>> -0x606c0400 and m_column_and_range_bits is 0 for all 3 maps.
>> -map[0].included_from is set to 0x606c0401.
>> -The last important part is again in linemap_add when doing LC_LEAVE:
>> -      /* (MAP - 1) points to the map we are leaving. The
>> -         map from which (MAP - 1) got included should be the map
>> -         that comes right before MAP in the same file.  */
>> -      from =3D linemap_included_from_linemap (set, map - 1);
>> -
>> -      /* A TO_FILE of NULL is special - we use the natural values.  *=
/
>> -      if (to_file =3D=3D NULL)
>> -        {
>> -          to_file =3D ORDINARY_MAP_FILE_NAME (from);
>> -          to_line =3D SOURCE_LINE (from, from[1].start_location);
>> -          sysp =3D ORDINARY_MAP_IN_SYSTEM_HEADER_P (from);
>> -        }
>> -Here it wants to compute the right to_line which ought to be the line=
 after
>> -the #include directive.
>> -On the #c11 testcase that doesn't work correctly though, because
>> -map[-1].included_from is 0x50000320, from[0] for that is LC_ENTER wit=
h
>> -start_location 0x4080 and m_column_and_range_bits 12 but note that we=
've
>> -earlier computed map[-1].start_location + (-1 & 0xffffff80) and so on=
ly
>> -decreased by 7 bits, so to_line is still on the line with #include an=
d not
>> -after it.  In the #c12 that doesn't happen, all the ordinary maps inv=
olved
>> -there had 0 m_column_and_range_bits and so this computes correct line.
>> -
>> -Below is a fix for the trunk including testcases using the
>> -location_overflow_plugin hack to simulate the bugs without needing hu=
ge
>> -files (in the 14 case it is just 330KB and almost 10MB, but in the 15
>> -case it would need to be far bigger).
>> -The pre- r15-9018 trunk has
>> -FAIL: gcc.dg/plugin/location-overflow-test-pr116047.c -fplugin=3D./lo=
cation_overflow_plugin.so  scan-file static_assert[^\n\r]*6[^\n\r]*=3D=3D=
 6
>> -and current trunk
>> -FAIL: gcc.dg/plugin/location-overflow-test-pr116047.c -fplugin=3D./lo=
cation_overflow_plugin.so  scan-file static_assert[^\n\r]*6[^\n\r]*=3D=3D=
 6
>> -FAIL: gcc.dg/plugin/location-overflow-test-pr120061.c -fplugin=3D./lo=
cation_overflow_plugin.so  scan-file static_assert[^\n\r]*5[^\n\r]*=3D=3D=
 5
>> -and with the patch everything PASSes.
>> -
>> -The patch reverts the r14-11679 change, because it is incorrect,
>> -we really need to decrement it even when crossing ordinary map
>> -boundaries, so that the location is not on the line after the #includ=
e
>> -line but somewhere on the #include line.  It also patches two spots
>> -in linemap_add mentioned above to make sure we get correct locations
>> -both in the included_from location_t when doing LC_ENTER (second
>> -line-map.cc hunk) and when doing LC_LEAVE to compute the right to_lin=
e
>> -(first line-map.cc hunk), both in presence of an added LC_RENAME
>> -with the same start_location as the following LC_ENTER (i.e. the
>> -problematic cases).
>> -The LC_ENTER hunk is mostly to ensure included_form location_t is
>> -at the start of the #include line (column 0), without it we can
>> -decrease include_from not enough and end up at some random column
>> -in the middle of the line, because it is masking away
>> -map[-1].m_column_and_range_bits bits even when in the end the resulti=
ng
>> -include_from location_t will be found in map[-2] map with perhaps
>> -different m_column_and_range_bits.  That alone doesn't fix the bug
>> -though.
>> -The more important is the LC_LEAVE hunk and the problem there is
>> -caused by linemap_line_start not actually doing
>> -    r =3D set->highest_line + (line_delta << map->m_column_and_range_=
bits);
>> -when adding a new map (the LC_RENAME one because we need to switch to
>> -different number of directly encoded ranges, or columns, etc.).
>> -So, in the original PR108900 case that
>> -  to_line =3D SOURCE_LINE (from, from[1].start_location);
>> -doesn't do the right thing, from there is the last < 0x50000000 map
>> -with m_column_and_range_bits 12, from[1] is the first one above it
>> -and map[-1].included_from is the correct location of column 0 on
>> -the #include line, but as the new LC_RENAME map has been created with=
out
>> -actually increasing highest_location to be on the new line (we've jus=
t
>> -set to_line of the new LC_RENAME map to the correct line),
>> -  to_line =3D SOURCE_LINE (from, from[1].start_location);
>> -stays on the same source line.  I've tried to just replace that with
>> -  to_line =3D SOURCE_LINE (from, linemap_included_from (map - 1)) + 1=
;
>> -i.e. just find out the #include line from map[-1].included_from and
>> -add 1 to it, unfortunately that breaks the
>> -c-c++-common/cpp/line-4.c
>> -test where we expect to stay on the same 0 line for LC_LEAVE from
>> -<command line> and gcc.dg/cpp/trad/Wunused.c, gcc.dg/cpp/trad/builtin=
s.c
>> -and c-c++-common/analyzer/named-constants-via-macros-traditional.c te=
sts
>> -all with -traditional-cpp preprocessing where to_line is also off-by-=
one
>> -from the expected one.
>> -So, this patch instead conditionalizes it, uses the
>> -  to_line =3D SOURCE_LINE (from, linemap_included_from (map - 1)) + 1=
;
>> -way only if from[1] is a LC_RENAME map (rather than the usual
>> -LC_ENTER one), that should limit it to the problematic cases of when
>> -parse_include peeked after EOL and had to create LC_RENAME map with
>> -the same start_location as the LC_ENTER after it.
>> -
>> -Some further justification for the LC_ENTER hunk, using the
>> -https://gcc.gnu.org/pipermail/gcc-patches/2025-May/682774.html testca=
se
>> -(old is 14 before r14-11679, vanilla current 14 and new with the 14 p=
atch)
>> -I get
>> -$ /usr/src/gcc-14/obj/gcc/cc1.old -quiet -std=3Dc23 pr116047.c -nostd=
inc
>> -In file included from pr116047-1.h:327677:21,
>> -                 from pr116047.c:4:
>> -pr116047-2.h:1:1: error: unknown type name =E2=80=98a=E2=80=99
>> -    1 | a b c;
>> -      | ^
>> -pr116047-2.h:1:5: error: expected =E2=80=98=3D=E2=80=99, =E2=80=98,=E2=
=80=99, =E2=80=98;=E2=80=99, =E2=80=98asm=E2=80=99 or =E2=80=98__attribut=
e__=E2=80=99 before =E2=80=98c=E2=80=99
>> -    1 | a b c;
>> -      |     ^
>> -pr116047-1.h:327677:1: error: static assertion failed: ""
>> -327677 | #include "pr116047-2.h"
>> -       | ^~~~~~~~~~~~~
>> -$ /usr/src/gcc-14/obj/gcc/cc1.vanilla -quiet -std=3Dc23 pr116047.c -n=
ostdinc
>> -In file included from pr116047-1.h:327678,
>> -                 from pr116047.c:4:
>> -pr116047-2.h:1:1: error: unknown type name =E2=80=98a=E2=80=99
>> -    1 | a b c;
>> -      | ^
>> -pr116047-2.h:1:5: error: expected =E2=80=98=3D=E2=80=99, =E2=80=98,=E2=
=80=99, =E2=80=98;=E2=80=99, =E2=80=98asm=E2=80=99 or =E2=80=98__attribut=
e__=E2=80=99 before =E2=80=98c=E2=80=99
>> -    1 | a b c;
>> -      |     ^
>> -$ /usr/src/gcc-14/obj/gcc/cc1.new -quiet -std=3Dc23 pr116047.c -nostd=
inc
>> -In file included from pr116047-1.h:327677,
>> -                 from pr116047.c:4:
>> -pr116047-2.h:1:1: error: unknown type name =E2=80=98a=E2=80=99
>> -    1 | a b c;
>> -      | ^
>> -pr116047-2.h:1:5: error: expected =E2=80=98=3D=E2=80=99, =E2=80=98,=E2=
=80=99, =E2=80=98;=E2=80=99, =E2=80=98asm=E2=80=99 or =E2=80=98__attribut=
e__=E2=80=99 before =E2=80=98c=E2=80=99
>> -    1 | a b c;
>> -      |     ^
>> -
>> -pr116047-1.h has on lines 327677+327678:
>> - #include "pr116047-2.h"
>> - static_assert (__LINE__ =3D=3D 327678, "");
>> -so the static_assert failure is something that was dealt mainly in th=
e
>> -LC_LEAVE hunk and files.cc reversion, but please have a look at the
>> -In file included from lines.
>> -14.2 emits correct line (#include "pr116047-2.h" is indeed on line
>> -327677) but some random column in there (which is not normally printe=
d
>> -for smaller headers; 21 is the . before extension in the filename).
>> -Current trunk emits incorrect line (327678 instead of 327677, clearly
>> -it didn't decrement).
>> -And the patched compiler emits the right line with no column, as woul=
d
>> -be printed if I remove e.g. 300000 newlines from the file.
>> -
>> -2025-05-08  Jakub Jelinek  <jakub@redhat.com>
>> -
>> -       PR preprocessor/108900
>> -       PR preprocessor/116047
>> -       PR preprocessor/120061
>> -       * files.cc (_cpp_stack_file): Revert 2025-03-28 change.
>> -       * line-map.cc (linemap_add): Use
>> -       SOURCE_LINE (from, linemap_included_from (map - 1)) + 1; inste=
ad of
>> -       SOURCE_LINE (from, from[1].start_location); to compute to_line
>> -       for LC_LEAVE if from[1].reason is LC_RENAME.  For LC_ENTER
>> -       included_from computation, look at map[-2] or even lower if ma=
p[-1]
>> -       has the same start_location as map[0].
>> -
>> -       * gcc.dg/plugin/plugin.exp: Add location-overflow-test-pr11604=
7.c
>> -       and location-overflow-test-pr120061.c.
>> -       * gcc.dg/plugin/location_overflow_plugin.c (plugin_init): Don'=
t error
>> -       on unknown values, instead just break.
>> -       * gcc.dg/plugin/location-overflow-test-pr116047.c: New test.
>> -       * gcc.dg/plugin/location-overflow-test-pr116047-1.h: New test.
>> -       * gcc.dg/plugin/location-overflow-test-pr116047-2.h: New test.
>> -       * gcc.dg/plugin/location-overflow-test-pr120061.c: New test.
>> -       * gcc.dg/plugin/location-overflow-test-pr120061-1.h: New test.
>> -       * gcc.dg/plugin/location-overflow-test-pr120061-2.h: New test.
>> -
>> -Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=3D=
edf745dc519ddbfef127e2789bf11bfbacd300b7]
>> -Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
>> ----
>> - .../plugin/location-overflow-test-pr116047-1.h     |  6 +++
>> - .../plugin/location-overflow-test-pr116047-2.h     |  1 +
>> - .../plugin/location-overflow-test-pr116047.c       |  5 +++
>> - .../plugin/location-overflow-test-pr120061-1.h     |  6 +++
>> - .../plugin/location-overflow-test-pr120061-2.h     |  1 +
>> - .../plugin/location-overflow-test-pr120061.c       |  6 +++
>> - .../gcc.dg/plugin/location_overflow_plugin.c       |  2 +-
>> - gcc/testsuite/gcc.dg/plugin/plugin.exp             |  4 +-
>> - libcpp/line-map.cc                                 | 48 ++++++++++++=
++++++----
>> - 10 files changed, 69 insertions(+), 18 deletions(-)
>> - create mode 100644 gcc/testsuite/gcc.dg/plugin/location-overflow-tes=
t-pr116047-1.h
>> - create mode 100644 gcc/testsuite/gcc.dg/plugin/location-overflow-tes=
t-pr116047-2.h
>> - create mode 100644 gcc/testsuite/gcc.dg/plugin/location-overflow-tes=
t-pr116047.c
>> - create mode 100644 gcc/testsuite/gcc.dg/plugin/location-overflow-tes=
t-pr120061-1.h
>> - create mode 100644 gcc/testsuite/gcc.dg/plugin/location-overflow-tes=
t-pr120061-2.h
>> - create mode 100644 gcc/testsuite/gcc.dg/plugin/location-overflow-tes=
t-pr120061.c
>> -
>> -diff --git a/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116=
047-1.h b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047-1.h
>> -new file mode 100644
>> -index 000000000000..3dd6434a938b
>> ---- /dev/null
>> -+++ b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047-1.h
>> -@@ -0,0 +1,6 @@
>> -+
>> -+
>> -+
>> -+
>> -+#include "location-overflow-test-pr116047-2.h"
>> -+static_assert (__LINE__ =3D=3D 6, "");
>> -diff --git a/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116=
047-2.h b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047-2.h
>> -new file mode 100644
>> -index 000000000000..048f715b4656
>> ---- /dev/null
>> -+++ b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047-2.h
>> -@@ -0,0 +1 @@
>> -+int i;
>> -diff --git a/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116=
047.c b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047.c
>> -new file mode 100644
>> -index 000000000000..33f2c4ce8def
>> ---- /dev/null
>> -+++ b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr116047.c
>> -@@ -0,0 +1,5 @@
>> -+/* PR preprocessor/116047 */
>> -+/* { dg-do preprocess } */
>> -+/* { dg-options "-nostdinc -std=3Dc23 -fplugin-arg-location_overflow=
_plugin-value=3D0x4fff8080" } */
>> -+#include "location-overflow-test-pr116047-1.h"
>> -+/* { dg-final { scan-file location-overflow-test-pr116047.i "static_=
assert\[^\n\r]\*6\[^\n\r]\*=3D=3D 6" } } */
>> -diff --git a/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120=
061-1.h b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061-1.h
>> -new file mode 100644
>> -index 000000000000..ebf7704f568e
>> ---- /dev/null
>> -+++ b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061-1.h
>> -@@ -0,0 +1,6 @@
>> -+
>> -+
>> -+
>> -+
>> -+#include "location-overflow-test-pr120061-2.h"
>> -+
>> -diff --git a/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120=
061-2.h b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061-2.h
>> -new file mode 100644
>> -index 000000000000..048f715b4656
>> ---- /dev/null
>> -+++ b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061-2.h
>> -@@ -0,0 +1 @@
>> -+int i;
>> -diff --git a/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120=
061.c b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061.c
>> -new file mode 100644
>> -index 000000000000..e8e803898da3
>> ---- /dev/null
>> -+++ b/gcc/testsuite/gcc.dg/plugin/location-overflow-test-pr120061.c
>> -@@ -0,0 +1,6 @@
>> -+/* PR preprocessor/120061 */
>> -+/* { dg-do preprocess } */
>> -+/* { dg-options "-nostdinc -std=3Dc23 -fplugin-arg-location_overflow=
_plugin-value=3D0x61000000" } */
>> -+#include "location-overflow-test-pr120061-1.h"
>> -+static_assert (__LINE__ =3D=3D 5, "");
>> -+/* { dg-final { scan-file location-overflow-test-pr120061.i "static_=
assert\[^\n\r]\*5\[^\n\r]\*=3D=3D 5" } } */
>> -diff --git a/gcc/testsuite/gcc.dg/plugin/location_overflow_plugin.c b=
/gcc/testsuite/gcc.dg/plugin/location_overflow_plugin.c
>> -index d0a6b0755648..6f4497a1cb16 100644
>> ---- a/gcc/testsuite/gcc.dg/plugin/location_overflow_plugin.c
>> -+++ b/gcc/testsuite/gcc.dg/plugin/location_overflow_plugin.c
>> -@@ -101,7 +101,7 @@ plugin_init (struct plugin_name_args *plugin_info=
,
>> -       break;
>> -
>> -     default:
>> --      error_at (UNKNOWN_LOCATION, "unrecognized value for plugin arg=
ument");
>> -+      break;
>> -     }
>> -
>> -   return 0;
>> -diff --git a/gcc/testsuite/gcc.dg/plugin/plugin.exp b/gcc/testsuite/g=
cc.dg/plugin/plugin.exp
>> -index 933f9a5850bc..438c6d87aad9 100644
>> ---- a/gcc/testsuite/gcc.dg/plugin/plugin.exp
>> -+++ b/gcc/testsuite/gcc.dg/plugin/plugin.exp
>> -@@ -126,7 +126,9 @@ set plugin_test_list [list \
>> -     { location_overflow_plugin.c \
>> -         location-overflow-test-1.c \
>> -         location-overflow-test-2.c \
>> --        location-overflow-test-pr83173.c } \
>> -+        location-overflow-test-pr83173.c \
>> -+        location-overflow-test-pr116047.c \
>> -+        location-overflow-test-pr120061.c } \
>> -     { must_tail_call_plugin.c \
>> -         must-tail-call-1.c \
>> -         must-tail-call-2.c } \
>> -diff --git a/libcpp/line-map.cc b/libcpp/line-map.cc
>> -index d5200b317eee..1e659638d9f7 100644
>> ---- a/libcpp/line-map.cc
>> -+++ b/libcpp/line-map.cc
>> -@@ -618,8 +618,8 @@ linemap_add (line_maps *set, enum lc_reason reaso=
n,
>> -        #include "included", inside the same "includer" file.  */
>> -
>> -       linemap_assert (!MAIN_FILE_P (map - 1));
>> --      /* (MAP - 1) points to the map we are leaving. The
>> --       map from which (MAP - 1) got included should be the map
>> -+      /* (MAP - 1) points to the map we are leaving.  The
>> -+       map from which (MAP - 1) got included should be usually the m=
ap
>> -        that comes right before MAP in the same file.  */
>> -       from =3D linemap_included_from_linemap (set, map - 1);
>> -
>> -@@ -627,7 +627,24 @@ linemap_add (line_maps *set, enum lc_reason reas=
on,
>> -       if (to_file =3D=3D NULL)
>> -       {
>> -         to_file =3D ORDINARY_MAP_FILE_NAME (from);
>> --        to_line =3D SOURCE_LINE (from, from[1].start_location);
>> -+        /* Compute the line on which the map resumes, for #include t=
his
>> -+           should be the line after the #include line.  Usually FROM=
 is
>> -+           the map right before LC_ENTER map - the first map of the =
included
>> -+           file, and in that case SOURCE_LINE (from, from[1].start_l=
ocation);
>> -+           computes the right line (and does handle even some specia=
l cases
>> -+           (e.g. where for returning from <command line> we still wa=
nt to
>> -+           be at line 0 or some -traditional-cpp cases).  In rare ca=
ses
>> -+           FROM can be followed by LC_RENAME created by linemap_line=
_start
>> -+           for line right after #include line.  If that happens,
>> -+           start_location of the FROM[1] map will be the same as
>> -+           start_location of FROM[2] LC_ENTER, but FROM[1] start_loc=
ation
>> -+           might not have advance enough for moving to a full next l=
ine.
>> -+           In that case compute the line of #include line and add 1 =
to it
>> -+           to advance to the next line.  See PR120061.  */
>> -+        if (from[1].reason =3D=3D LC_RENAME)
>> -+          to_line =3D SOURCE_LINE (from, linemap_included_from (map =
- 1)) + 1;
>> -+        else
>> -+          to_line =3D SOURCE_LINE (from, from[1].start_location);
>> -         sysp =3D ORDINARY_MAP_IN_SYSTEM_HEADER_P (from);
>> -       }
>> -       else
>> -@@ -657,11 +674,26 @@ linemap_add (line_maps *set, enum lc_reason rea=
son,
>> -       if (set->depth =3D=3D 0)
>> -       map->included_from =3D 0;
>> -       else
>> --      /* The location of the end of the just-closed map.  */
>> --      map->included_from
>> --        =3D (((map[0].start_location - 1 - map[-1].start_location)
>> --            & ~((1 << map[-1].m_column_and_range_bits) - 1))
>> --           + map[-1].start_location);
>> -+      {
>> -+        /* Compute location from whence this line map was included.
>> -+           For #include this should be preferrably column 0 of the
>> -+           line on which #include directive appears.
>> -+           map[-1] is the just closed map and usually included_from
>> -+           falls within that map.  In rare cases linemap_line_start
>> -+           can insert a new LC_RENAME map for the line immediately
>> -+           after #include line, in that case map[-1] will have the
>> -+           same start_location as the new one and so included_from
>> -+           would not be from map[-1] but likely map[-2].  If that
>> -+           happens, mask off map[-2] m_column_and_range_bits bits
>> -+           instead of map[-1].  See PR120061.  */
>> -+        int i =3D -1;
>> -+        while (map[i].start_location =3D=3D map[0].start_location)
>> -+          --i;
>> -+        map->included_from
>> -+          =3D (((map[0].start_location - 1 - map[i].start_location)
>> -+              & ~((1 << map[i].m_column_and_range_bits) - 1))
>> -+             + map[i].start_location);
>> -+      }
>> -       set->depth++;
>> -       if (set->trace_includes)
>> -       trace_include (set, map);
>> ---
>> diff --git a/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710b=
ea66ad651720d71c938b8.patch b/meta/recipes-devtools/gcc/gcc/gcc.git-ab884=
fffe3fc82a710bea66ad651720d71c938b8.patch
>> deleted file mode 100644
>> index e5abdcc703..0000000000
>> --- a/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad6=
51720d71c938b8.patch
>> +++ /dev/null
>> @@ -1,549 +0,0 @@
>> -From ab884fffe3fc82a710bea66ad651720d71c938b8 Mon Sep 17 00:00:00 200=
1
>> -From: Jonathan Wakely <jwakely@redhat.com>
>> -Date: Tue, 30 Apr 2024 09:52:13 +0100
>> -Subject: [PATCH] libstdc++: Fix std::chrono::tzdb to work with vangua=
rd format
>> -
>> -I found some issues in the std::chrono::tzdb parser by testing the
>> -tzdata "vanguard" format, which uses new features that aren't enabled=
 in
>> -the "main" and "rearguard" data formats.
>> -
>> -Since 2024a the keyword "minimum" is no longer valid for the FROM and=
 TO
>> -fields in a Rule line, which means that "m" is now a valid abbreviati=
on
>> -for "maximum". Previously we expected either "mi" or "ma". For backwa=
rds
>> -compatibility, a FROM field beginning with "mi" is still supported an=
d
>> -is treated as 1900. The "maximum" keyword is only allowed in TO now,
>> -because it makes no sense in FROM. To support these changes the
>> -minmax_year and minmax_year2 classes for parsing FROM and TO are
>> -replaced with a single years_from_to class that reads both fields.
>> -
>> -The vanguard format makes use of %z in Zone FORMAT fields, which caus=
ed
>> -an exception to be thrown from ZoneInfo::set_abbrev because no % or /
>> -characters were expected when a Zone doesn't use a named Rule. The
>> -ZoneInfo::to(sys_info&) function now uses format_abbrev_str to replac=
e
>> -any %z with the current offset. Although format_abbrev_str also check=
s
>> -for %s and STD/DST formats, those only make sense when a named Rule i=
s
>> -in effect, so won't occur when ZoneInfo::to(sys_info&) is used.
>> -
>> -Since making this change on trunk, the tzdata-2024b release started
>> -using %z in the main format, not just vanguard. This makes a backport=
 to
>> -release branches necessary (see PR 116657).
>> -
>> -This change also implements a feature that has always been missing fr=
om
>> -time_zone::_M_get_sys_info: finding the Rule that is active before th=
e
>> -specified time point, so that we can correctly handle %s in the FORMA=
T
>> -for the first new sys_info that gets created. This requires implement=
ing
>> -a poorly documented feature of zic, to get the LETTERS field from a
>> -later transition, as described at
>> -https://mm.icann.org/pipermail/tz/2024-April/058891.html
>> -In order for this to work we need to be able to distinguish an empty
>> -letters field (as used by CE%sT where the variable part is either emp=
ty
>> -or "S") from "the letters field is not known for this transition". Th=
e
>> -tzdata file uses "-" for an empty letters field, which libstdc++ was
>> -previously replacing with "" when the Rule was parsed. Instead, we no=
w
>> -preserve the "-" in the Rule object, so that "" can be used for the c=
ase
>> -where we don't know the letters (and so need to decide it).
>> -
>> -(cherry picked from commit 0ca8d56f2085715f27ee536c6c344bc47af49cdd)
>> -
>> -Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc=
.git;h=3D5ceea2ac106d6dd1aa8175670b15a801316cf1c9]
>> -
>> -Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ----
>> - libstdc++-v3/src/c++20/tzdb.cc                | 265 +++++++++++-----=
--
>> - .../std/time/time_zone/sys_info_abbrev.cc     | 106 +++++++
>> - libstdc++-v3/testsuite/std/time/tzdb/1.cc     |   6 +-
>> - 3 files changed, 274 insertions(+), 103 deletions(-)
>> - create mode 100644 libstdc++-v3/testsuite/std/time/time_zone/sys_inf=
o_abbrev.cc
>> -
>> -diff --git a/libstdc++-v3/src/c++20/tzdb.cc b/libstdc++-v3/src/c++20/=
tzdb.cc
>> -index c7c7cc9deee6..7e8cce7ce8cf 100644
>> ---- a/libstdc++-v3/src/c++20/tzdb.cc
>> -+++ b/libstdc++-v3/src/c++20/tzdb.cc
>> -@@ -342,51 +342,103 @@ namespace std::chrono
>> -       friend istream& operator>>(istream&, on_day&);
>> -     };
>> -
>> --    // Wrapper for chrono::year that reads a year, or one of the key=
words
>> --    // "minimum" or "maximum", or an unambiguous prefix of a keyword.
>> --    struct minmax_year
>> -+    // Wrapper for two chrono::year values, which reads the FROM and=
 TO
>> -+    // fields of a Rule line. The FROM field is a year and TO is a y=
ear or
>> -+    // one of the keywords "maximum" or "only" (or an abbreviation o=
f those).
>> -+    // For backwards compatibility, the keyword "minimum" is recogni=
zed
>> -+    // for FROM and interpreted as 1900.
>> -+    struct years_from_to
>> -     {
>> --      year& y;
>> -+      year& from;
>> -+      year& to;
>> -
>> --      friend istream& operator>>(istream& in, minmax_year&& y)
>> -+      friend istream& operator>>(istream& in, years_from_to&& yy)
>> -       {
>> --      if (ws(in).peek() =3D=3D 'm') // keywords "minimum" or "maximu=
m"
>> -+      string s;
>> -+      auto c =3D ws(in).peek();
>> -+      if (c =3D=3D 'm') [[unlikely]] // keyword "minimum"
>> -         {
>> --          string s;
>> --          in >> s; // extract the rest of the word, but only look at=
 s[1]
>> --          if (s[1] =3D=3D 'a')
>> --            y.y =3D year::max();
>> --          else if (s[1] =3D=3D 'i')
>> --            y.y =3D year::min();
>> --          else
>> --            in.setstate(ios::failbit);
>> -+          in >> s; // extract the rest of the word
>> -+          yy.from =3D year(1900);
>> -+        }
>> -+      else if (int num =3D 0; in >> num) [[likely]]
>> -+        yy.from =3D year{num};
>> -+
>> -+      c =3D ws(in).peek();
>> -+      if (c =3D=3D 'm') // keyword "maximum"
>> -+        {
>> -+          in >> s; // extract the rest of the word
>> -+          yy.to =3D year::max();
>> -+        }
>> -+      else if (c =3D=3D 'o') // keyword "only"
>> -+        {
>> -+          in >> s; // extract the rest of the word
>> -+          yy.to =3D yy.from;
>> -         }
>> -       else if (int num =3D 0; in >> num)
>> --        y.y =3D year{num};
>> -+        yy.to =3D year{num};
>> -+
>> -       return in;
>> -       }
>> -     };
>> -
>> --    // As above for minmax_year, but also supports the keyword "only=
",
>> --    // meaning that the TO year is the same as the FROM year.
>> --    struct minmax_year2
>> -+    bool
>> -+    select_std_or_dst_abbrev(string& abbrev, minutes save)
>> -     {
>> --      minmax_year to;
>> --      year from;
>> -+      if (size_t pos =3D abbrev.find('/'); pos !=3D string::npos)
>> -+      {
>> -+        // Select one of "STD/DST" for standard or daylight.
>> -+        if (save =3D=3D 0min)
>> -+          abbrev.erase(pos);
>> -+        else
>> -+          abbrev.erase(0, pos + 1);
>> -+        return true;
>> -+      }
>> -+      return false;
>> -+    }
>> -
>> --      friend istream& operator>>(istream& in, minmax_year2&& y)
>> --      {
>> --      if (ws(in).peek() =3D=3D 'o') // keyword "only"
>> --        {
>> --          string s;
>> --          in >> s; // extract the whole keyword
>> --          y.to.y =3D y.from;
>> --        }
>> --      else
>> --        in >> std::move(y.to);
>> --      return in;
>> --      }
>> --    };
>> -+    // Set the sys_info::abbrev string by expanding any placeholders.
>> -+    void
>> -+    format_abbrev_str(sys_info& info, string_view letters =3D {})
>> -+    {
>> -+      if (size_t pos =3D info.abbrev.find('%'); pos !=3D string::npo=
s)
>> -+      {
>> -+        if (info.abbrev[pos + 1] =3D=3D 's')
>> -+          {
>> -+            // Expand "%s" to the variable part, given by Rule::lett=
ers.
>> -+            if (letters =3D=3D "-")
>> -+              info.abbrev.erase(pos, 2);
>> -+            else
>> -+              info.abbrev.replace(pos, 2, letters);
>> -+          }
>> -+        else if (info.abbrev[pos + 1] =3D=3D 'z')
>> -+          {
>> -+            // Expand "%z" to the UT offset as +/-hh, +/-hhmm, or +/=
-hhmmss.
>> -+            hh_mm_ss<seconds> t(info.offset);
>> -+            string z(1, "+-"[t.is_negative()]);
>> -+            long val =3D t.hours().count();
>> -+            int digits =3D 2;
>> -+            if (int m =3D t.minutes().count())
>> -+              {
>> -+                digits =3D 4;
>> -+                val *=3D 100;
>> -+                val +=3D m;
>> -+                if (int s =3D t.seconds().count())
>> -+                  {
>> -+                    digits =3D 6;
>> -+                    val *=3D 100;
>> -+                    val +=3D s;
>> -+                  }
>> -+              }
>> -+            auto sval =3D std::to_string(val);
>> -+            z +=3D string(digits - sval.size(), '0');
>> -+            z +=3D sval;
>> -+            info.abbrev.replace(pos, 2, z);
>> -+          }
>> -+      }
>> -+      else
>> -+      select_std_or_dst_abbrev(info.abbrev, info.save);
>> -+    }
>> -
>> -     // A time zone information record.
>> -     // Zone  NAME        STDOFF  RULES   FORMAT  [UNTIL]
>> -@@ -462,6 +514,7 @@ namespace std::chrono
>> -       info.offset =3D offset();
>> -       info.save =3D minutes(m_save);
>> -       info.abbrev =3D format();
>> -+      format_abbrev_str(info); // expand %z
>> -       return true;
>> -       }
>> -
>> -@@ -469,12 +522,9 @@ namespace std::chrono
>> -       friend class time_zone;
>> -
>> -       void
>> --      set_abbrev(const string& abbrev)
>> -+      set_abbrev(string abbrev)
>> -       {
>> --      // In practice, the FORMAT field never needs expanding here.
>> --      if (abbrev.find_first_of("/%") !=3D abbrev.npos)
>> --        __throw_runtime_error("std::chrono::time_zone: invalid data"=
);
>> --      m_buf =3D abbrev;
>> -+      m_buf =3D std::move(abbrev);
>> -       m_pos =3D 0;
>> -       m_expanded =3D true;
>> -       }
>> -@@ -544,9 +594,7 @@ namespace std::chrono
>> -
>> -       // Rule  NAME  FROM  TO  TYPE  IN  ON  AT  SAVE  LETTER/S
>> -
>> --      in >> quoted(rule.name)
>> --         >> minmax_year{rule.from}
>> --         >> minmax_year2{rule.to, rule.from};
>> -+      in >> quoted(rule.name) >> years_from_to{rule.from, rule.to};
>> -
>> -       if (char type; in >> type && type !=3D '-')
>> -         in.setstate(ios::failbit);
>> -@@ -557,7 +605,7 @@ namespace std::chrono
>> -       if (save_time.indicator !=3D at_time::Wall)
>> -         {
>> -           // We don't actually store the save_time.indicator, becaus=
e we
>> --          // assume that it's always deducable from the actual offse=
t value.
>> -+          // assume that it's always deducible from the offset value.
>> -           auto expected =3D save_time.time =3D=3D 0s
>> -                             ? at_time::Standard
>> -                             : at_time::Daylight;
>> -@@ -567,8 +615,6 @@ namespace std::chrono
>> -       rule.save =3D save_time.time;
>> -
>> -       in >> rule.letters;
>> --      if (rule.letters =3D=3D "-")
>> --        rule.letters.clear();
>> -       return in;
>> -       }
>> -
>> -@@ -719,58 +765,6 @@ namespace std::chrono
>> - #endif // TZDB_DISABLED
>> -   };
>> -
>> --#ifndef TZDB_DISABLED
>> --  namespace
>> --  {
>> --    bool
>> --    select_std_or_dst_abbrev(string& abbrev, minutes save)
>> --    {
>> --      if (size_t pos =3D abbrev.find('/'); pos !=3D string::npos)
>> --      {
>> --        // Select one of "STD/DST" for standard or daylight.
>> --        if (save =3D=3D 0min)
>> --          abbrev.erase(pos);
>> --        else
>> --          abbrev.erase(0, pos + 1);
>> --        return true;
>> --      }
>> --      return false;
>> --    }
>> --
>> --    // Set the sys_info::abbrev string by expanding any placeholders.
>> --    void
>> --    format_abbrev_str(sys_info& info, string_view letters =3D {})
>> --    {
>> --      if (size_t pos =3D info.abbrev.find("%s"); pos !=3D string::np=
os)
>> --      {
>> --        // Expand "%s" to the variable part, given by Rule::letters.
>> --        info.abbrev.replace(pos, 2, letters);
>> --      }
>> --      else if (size_t pos =3D info.abbrev.find("%z"); pos !=3D strin=
g::npos)
>> --      {
>> --        // Expand "%z" to the UT offset as +/-hh, +/-hhmm, or +/-hhm=
mss.
>> --        hh_mm_ss<seconds> t(info.offset);
>> --        string z(1, "+-"[t.is_negative()]);
>> --        long val =3D t.hours().count();
>> --        if (minutes m =3D t.minutes(); m !=3D m.zero())
>> --          {
>> --            val *=3D 100;
>> --            val +=3D m.count();
>> --            if (seconds s =3D t.seconds(); s !=3D s.zero())
>> --              {
>> --                val *=3D 100;
>> --                val +=3D s.count();
>> --              }
>> --          }
>> --        z +=3D std::to_string(val);
>> --        info.abbrev.replace(pos, 2, z);
>> --      }
>> --      else
>> --      select_std_or_dst_abbrev(info.abbrev, info.save);
>> --    }
>> --  }
>> --#endif // TZDB_DISABLED
>> --
>> -   // Implementation of std::chrono::time_zone::get_info(const sys_ti=
me<D>&)
>> -   sys_info
>> -   time_zone::_M_get_sys_info(sys_seconds tp) const
>> -@@ -839,12 +833,72 @@ namespace std::chrono
>> -     info.abbrev =3D ri.format();
>> -
>> -     string_view letters;
>> --    if (i !=3D infos.begin())
>> -+    if (i !=3D infos.begin() && i[-1].expanded())
>> -+      letters =3D i[-1].next_letters();
>> -+
>> -+    if (letters.empty())
>> -       {
>> --      if (i[-1].expanded())
>> --        letters =3D i[-1].next_letters();
>> --      // XXX else need to find Rule active before this time and use =
it
>> --      // to know the initial offset, save, and letters.
>> -+      sys_seconds t =3D info.begin - seconds(1);
>> -+      const year_month_day date(chrono::floor<days>(t));
>> -+
>> -+      // Try to find a Rule active before this time, to get initial
>> -+      // SAVE and LETTERS values. There may not be a Rule for the pe=
riod
>> -+      // before the first DST transition, so find the earliest DST->=
STD
>> -+      // transition and use the LETTERS from that.
>> -+      const Rule* active_rule =3D nullptr;
>> -+      sys_seconds active_rule_start =3D sys_seconds::min();
>> -+      const Rule* first_std =3D nullptr;
>> -+      for (const auto& rule : rules)
>> -+        {
>> -+          if (rule.save =3D=3D minutes(0))
>> -+            {
>> -+              if (!first_std)
>> -+                first_std =3D &rule;
>> -+              else if (rule.from < first_std->from)
>> -+                first_std =3D &rule;
>> -+              else if (rule.from =3D=3D first_std->from)
>> -+                {
>> -+                  if (rule.start_time(rule.from, {})
>> -+                        < first_std->start_time(first_std->from, {})=
)
>> -+                    first_std =3D &rule;
>> -+                }
>> -+            }
>> -+
>> -+          year y =3D date.year();
>> -+
>> -+          if (y > rule.to) // rule no longer applies at time t
>> -+            continue;
>> -+          if (y < rule.from) // rule doesn't apply yet at time t
>> -+            continue;
>> -+
>> -+          sys_seconds rule_start;
>> -+
>> -+          seconds offset{}; // appropriate for at_time::Universal
>> -+          if (rule.when.indicator =3D=3D at_time::Wall)
>> -+            offset =3D info.offset;
>> -+          else if (rule.when.indicator =3D=3D at_time::Standard)
>> -+            offset =3D ri.offset();
>> -+
>> -+          // Time the rule takes effect this year:
>> -+          rule_start =3D rule.start_time(y, offset);
>> -+
>> -+          if (rule_start >=3D t && rule.from < y)
>> -+            {
>> -+              // Try this rule in the previous year.
>> -+              rule_start =3D rule.start_time(--y, offset);
>> -+            }
>> -+
>> -+          if (active_rule_start < rule_start && rule_start < t)
>> -+            {
>> -+              active_rule_start =3D rule_start;
>> -+              active_rule =3D &rule;
>> -+            }
>> -+        }
>> -+
>> -+      if (active_rule)
>> -+        letters =3D active_rule->letters;
>> -+      else if (first_std)
>> -+        letters =3D first_std->letters;
>> -       }
>> -
>> -     const Rule* curr_rule =3D nullptr;
>> -@@ -2069,9 +2123,11 @@ namespace std::chrono
>> -             istringstream in2(std::move(rules));
>> -             in2 >> rules_time;
>> -             inf.m_save =3D duration_cast<minutes>(rules_time.time);
>> -+            // If the FORMAT is "STD/DST" then we can choose the rig=
ht one
>> -+            // now, so that we store a shorter string.
>> -             select_std_or_dst_abbrev(fmt, inf.m_save);
>> -           }
>> --        inf.set_abbrev(fmt);
>> -+        inf.set_abbrev(std::move(fmt));
>> -       }
>> -
>> -       // YEAR [MONTH [DAY [TIME]]]
>> -@@ -2082,7 +2138,12 @@ namespace std::chrono
>> -         abbrev_month m{January};
>> -         int d =3D 1;
>> -         at_time t{};
>> -+        // XXX DAY should support ON format, e.g. lastSun or Sun>=3D=
8
>> -         in >> m >> d >> t;
>> -+        // XXX UNTIL field should be interpreted
>> -+        // "using the rules in effect just before the transition"
>> -+        // so might need to store as year_month_day and hh_mm_ss and=
 only
>> -+        // convert to a sys_time once we know the offset in effect.
>> -         inf.m_until =3D sys_days(year(y)/m.m/day(d)) + seconds(t.tim=
e);
>> -       }
>> -       else
>> -diff --git a/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbre=
v.cc b/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc
>> -new file mode 100644
>> -index 000000000000..f1a8fff02f58
>> ---- /dev/null
>> -+++ b/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc
>> -@@ -0,0 +1,106 @@
>> -+// { dg-do run { target c++20 } }
>> -+// { dg-require-effective-target tzdb }
>> -+// { dg-require-effective-target cxx11_abi }
>> -+// { dg-xfail-run-if "no weak override on AIX" { powerpc-ibm-aix* } =
}
>> -+
>> -+#include <chrono>
>> -+#include <fstream>
>> -+#include <testsuite_hooks.h>
>> -+
>> -+static bool override_used =3D false;
>> -+
>> -+namespace __gnu_cxx
>> -+{
>> -+  const char* zoneinfo_dir_override() {
>> -+    override_used =3D true;
>> -+    return "./";
>> -+  }
>> -+}
>> -+
>> -+using namespace std::chrono;
>> -+
>> -+void
>> -+test_format()
>> -+{
>> -+  std::ofstream("tzdata.zi") << R"(# version test_1
>> -+Zone Africa/Bissau -1:2:20 - LMT 1912 Ja 1 1u
>> -+                   -1      - %z  1975
>> -+                   0       - GMT
>> -+Zon Some/Zone 1:2:3   - %z 1900
>> -+              1:23:45 - %z 1950
>> -+Zo Another/Zone 1:2:3 -     AZ0     1901
>> -+                1     Roolz A%sZ    2000
>> -+                1     Roolz SAZ/DAZ 2005
>> -+                1     Roolz %z
>> -+Rule Roolz 1950 max - April 1 2 1 D
>> -+Rul  Roolz 1950 max - Oct   1 1 0 S
>> -+Z Strange/Zone 1       - X%sX    1980
>> -+               1       - FOO/BAR 1990
>> -+               2:00    - %zzz    1995
>> -+               0:9     - %zzz    1996
>> -+               0:8:7   - %zzz    1997
>> -+               0:6:5.5 - %zzz    1998
>> -+)";
>> -+
>> -+  const auto& db =3D reload_tzdb();
>> -+  VERIFY( override_used ); // If this fails then XFAIL for the targe=
t.
>> -+  VERIFY( db.version =3D=3D "test_1" );
>> -+
>> -+  // Test formatting %z as
>> -+  auto tz =3D locate_zone("Africa/Bissau");
>> -+  auto inf =3D tz->get_info(sys_days(1974y/1/1));
>> -+  VERIFY( inf.abbrev =3D=3D "-01" );
>> -+
>> -+  tz =3D locate_zone("Some/Zone");
>> -+  inf =3D tz->get_info(sys_days(1899y/1/1));
>> -+  VERIFY( inf.abbrev =3D=3D "+010203" );
>> -+  inf =3D tz->get_info(sys_days(1955y/1/1));
>> -+  VERIFY( inf.abbrev =3D=3D "+012345" );
>> -+
>> -+  tz =3D locate_zone("Another/Zone");
>> -+  // Test formatting %s as the LETTER/S field from the active Rule.
>> -+  inf =3D tz->get_info(sys_days(1910y/January/1));
>> -+  VERIFY( inf.abbrev =3D=3D "ASZ" );
>> -+  inf =3D tz->get_info(sys_days(1950y/January/1));
>> -+  VERIFY( inf.abbrev =3D=3D "ASZ" );
>> -+  inf =3D tz->get_info(sys_days(1950y/June/1));
>> -+  VERIFY( inf.abbrev =3D=3D "ADZ" );
>> -+  inf =3D tz->get_info(sys_days(1999y/January/1));
>> -+  VERIFY( inf.abbrev =3D=3D "ASZ" );
>> -+  inf =3D tz->get_info(sys_days(1999y/July/1));
>> -+  VERIFY( inf.abbrev =3D=3D "ADZ" );
>> -+  // Test formatting STD/DST according to the active Rule.
>> -+  inf =3D tz->get_info(sys_days(2000y/January/2));
>> -+  VERIFY( inf.abbrev =3D=3D "SAZ" );
>> -+  inf =3D tz->get_info(sys_days(2001y/January/1));
>> -+  VERIFY( inf.abbrev =3D=3D "SAZ" );
>> -+  inf =3D tz->get_info(sys_days(2001y/July/1));
>> -+  VERIFY( inf.abbrev =3D=3D "DAZ" );
>> -+  // Test formatting %z as the offset determined by the active Rule.
>> -+  inf =3D tz->get_info(sys_days(2005y/January/2));
>> -+  VERIFY( inf.abbrev =3D=3D "+01" );
>> -+  inf =3D tz->get_info(sys_days(2006y/January/1));
>> -+  VERIFY( inf.abbrev =3D=3D "+01" );
>> -+  inf =3D tz->get_info(sys_days(2006y/July/1));
>> -+  VERIFY( inf.abbrev =3D=3D "+02" );
>> -+
>> -+  // Test formatting %z, %s and S/D for a Zone with no associated Ru=
les.
>> -+  tz =3D locate_zone("Strange/Zone");
>> -+  inf =3D tz->get_info(sys_days(1979y/January/1));
>> -+  VERIFY( inf.abbrev =3D=3D "XX" ); // No Rule means nothing to use =
for %s.
>> -+  inf =3D tz->get_info(sys_days(1981y/July/1));
>> -+  VERIFY( inf.abbrev =3D=3D "FOO" ); // Always standard time means f=
irst string.
>> -+  inf =3D tz->get_info(sys_days(1994y/July/1));
>> -+  VERIFY( inf.abbrev =3D=3D "+02zz" );
>> -+  inf =3D tz->get_info(sys_days(1995y/July/1));
>> -+  VERIFY( inf.abbrev =3D=3D "+0009zz" );
>> -+  inf =3D tz->get_info(sys_days(1996y/July/1));
>> -+  VERIFY( inf.abbrev =3D=3D "+000807zz" );
>> -+  inf =3D tz->get_info(sys_days(1997y/July/1));
>> -+  VERIFY( inf.abbrev =3D=3D "+000606zz" );
>> -+}
>> -+
>> -+int main()
>> -+{
>> -+  test_format();
>> -+}
>> -diff --git a/libstdc++-v3/testsuite/std/time/tzdb/1.cc b/libstdc++-v3=
/testsuite/std/time/tzdb/1.cc
>> -index 796f3a8b4256..7a31c1c20ba7 100644
>> ---- a/libstdc++-v3/testsuite/std/time/tzdb/1.cc
>> -+++ b/libstdc++-v3/testsuite/std/time/tzdb/1.cc
>> -@@ -39,11 +39,15 @@ test_locate()
>> -   const tzdb& db =3D get_tzdb();
>> -   const time_zone* tz =3D db.locate_zone("GMT");
>> -   VERIFY( tz !=3D nullptr );
>> --  VERIFY( tz->name() =3D=3D "Etc/GMT" );
>> -   VERIFY( tz =3D=3D std::chrono::locate_zone("GMT") );
>> -   VERIFY( tz =3D=3D db.locate_zone("Etc/GMT") );
>> -   VERIFY( tz =3D=3D db.locate_zone("Etc/GMT+0") );
>> -
>> -+  // Since 2022f GMT is now a Zone and Etc/GMT a link instead of vic=
e versa,
>> -+  // but only when using the vanguard format. As of 2024a, the main =
and
>> -+  // rearguard formats still have Etc/GMT as a Zone and GMT as a lin=
k.
>> -+  VERIFY( tz->name() =3D=3D "GMT" || tz->name() =3D=3D "Etc/GMT" );
>> -+
>> -   VERIFY( db.locate_zone(db.current_zone()->name()) =3D=3D db.curren=
t_zone() );
>> - }
>> -
>> ---
>> -2.43.5
>> -
>> diff --git a/meta/recipes-devtools/gcc/gcc_14.2.bb b/meta/recipes-devt=
ools/gcc/gcc_14.3.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/gcc_14.2.bb
>> rename to meta/recipes-devtools/gcc/gcc_14.3.bb
>> diff --git a/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb b/meta/r=
ecipes-devtools/gcc/libgcc-initial_14.3.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/libgcc-initial_14.2.bb
>> rename to meta/recipes-devtools/gcc/libgcc-initial_14.3.bb
>> diff --git a/meta/recipes-devtools/gcc/libgcc_14.2.bb b/meta/recipes-d=
evtools/gcc/libgcc_14.3.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/libgcc_14.2.bb
>> rename to meta/recipes-devtools/gcc/libgcc_14.3.bb
>> diff --git a/meta/recipes-devtools/gcc/libgfortran_14.2.bb b/meta/reci=
pes-devtools/gcc/libgfortran_14.3.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/gcc/libgfortran_14.2.bb
>> rename to meta/recipes-devtools/gcc/libgfortran_14.3.bb
>> --
>> 2.49.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#218323): https://lists.openembedded.org/g/openembe=
dded-core/message/218323
>> Mute This Topic: https://lists.openembedded.org/mt/113566417/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

