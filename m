Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13B0FC5906
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 07:09:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65541.1772089742701494984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 23:09:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ugp0l3u/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6517627b85=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q50fgl104461
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 23:09:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=CQvZcxg5BdSe0UZLNcI2KvhpkKKvy8ywck3Gt1M+bU8=; b=Ugp0l3u/rgfP
	QT4P8ROV7xslHWDYKP11ceYZUoUicOIq69ratThSdPO65HhP0+82oc3PmergAY9q
	NAKxqqpXfL8RtmedgbWs4xM8htV0r/uGqcXpoV6AStr8X8t/42wVLaCFO2O0ciCr
	bCOjJbd5xchotEc8QxnfQjdWjJoUPsKY8NAKVrC3MRtCvXjnoIAeV6k5xlqZeiRX
	eGM8KRMlNi9LImydWAO20rL/k7hHY7u/ka8g8vYRsCzoin8rb8VDiPj+RZfKY+3G
	LfLIaZuzxzoceInSVkOlkQSxoE28gT8mYnBouB7XlnyJJ1x0UNd0XGsGNns9TzgT
	wYStDEuaxg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010023.outbound.protection.outlook.com [52.101.46.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdu2r5d3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 23:09:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iycK2sIIpkLOaaClVHsDOr/FROOZKcAbebY3R2G4bhz7gkn/G7p3vGm2Af9z3q4xIEUeO0X7JQE5Bbi5G6dTpbFRNX4o0VLdcErH+slon5qzsO4OsZGIBN8QEXCZs1tDhJlXgSJ7KSfwdq7rCQiKB9nynsqMGMDkFbV83EsxuBnew5jMw2sP2TBDUep916wO+b6PyQFZAAZIn/ryasunhSG0xF3RbUEe3CQ9qPjqEnjuei2GqZpyqE9vg6km4q7RBstf/eChjHnm6U0kefkbEmookK7Et3OP6txqZV+7BUIb1kCiSN4Otg6h3bYr1DPBFvuLz0Xz934vhT2O+EpDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQvZcxg5BdSe0UZLNcI2KvhpkKKvy8ywck3Gt1M+bU8=;
 b=Wa+jvcwDvmhTISCzxgLT+cjiLWuN7aMLhIHg49gIxAt4Eb5dcgsjkaGd9mvu1s3Ogq0jXZX89O7wvZd7RPiDUPyYt7Wut2NOksJEap4rWywN6EQ6XPG/ouIYnV2ivJ7EfEOIuIDyzPCiDgxYS+peP1q9f3UmXs1wexb3vexthVKg6BS/gtNqSQ6OA//VALHNi4Z/9U0belrb53KmNfr1IxVUoyHd+jy3aGu9nfbNSniGAmKUJtQSpieGUKji9KDcowJ6Ebdz483kVsVuRLZyj4RZp1E57p7Fn6WYXXtNZHV9kFrjM2ZAIKJ885oN7rkaAd7k6ZTjO+24W200L4ah7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by PH3PPFAC6BA7F25.namprd11.prod.outlook.com (2603:10b6:518:1::d42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Thu, 26 Feb
 2026 07:08:59 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 07:08:59 +0000
Message-ID: <58775ef9-22c1-4ce5-aa44-ffe6c7d9a598@windriver.com>
Date: Thu, 26 Feb 2026 15:08:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [meta-xfce][master][PATCH] tumbler: fix segfault on
 startup when built without any plugins
To: openembedded-core@lists.openembedded.org
References: <1897B8E525EA5156.1454197@lists.openembedded.org>
From: Peng Zhang <peng.zhang1.cn@windriver.com>
Content-Language: en-US
In-Reply-To: <1897B8E525EA5156.1454197@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|PH3PPFAC6BA7F25:EE_
X-MS-Office365-Filtering-Correlation-Id: 1510f1cf-d073-4d89-6d5b-08de7505ea1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	r9kpOzN4DxaD8aENqZmyVFfNHiKPj3sLxG0CNf8lr8/uk3OUhFmVOZ8poDIJj1uSO2AAo+EPPHHd40HgNZd+6w5eRcIcjC+aiiuNLVDm53ZsJQYPQFZR4frrST7nz3cq837c5wcWr7Ay2UeDglNYOMP1IPsEekLo6vgfirXnURc6vpMuJO+LsSVI7QNzAeQtES1l7H1rnBurw02ne9fC47x+RtbP5Uu9xzqDgj4Bo4s5OABAoXusPMyqhFJBkrEdehj56CenD3RAEW4bp0nee2EbsazK67dDSmWYEO76jtP6la5uNxCdP5UCHM7t+aF9J1try89hAPsvBJ1m4D8+tnm5U/5lQXt6tLvMYQXTkJhvtAWAevBQ2d5cJiuKEZDXz6neeYjNqujyImsF4R/v9Y8KudArosg1ojJE/rIQHan9pxB0b2Zn1eCX3LLwRCFzCWA1kyCuhUj9MFG9BqZ2jfR7350DWU9+wagIFjeuATJ1b8O14o4trQWi7ZKXc+tYWarhMK2VN2y1Ziy4ms7Fo+sDXxq2yQjBFVQQvjUlJWf6ikoiT36J9BwbTEbc+ir5bh0PFf220DUamSowC5antt/jmIHed41n7752eQPLDdG3GthMIxNRfgYE6ctSN9cHLrL3KXCwbvh+5+JA2ml8LsW1lb0SYBKghHhl3KFEceg2C10iPhZQPuVx2Gt3+BTB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VWloQUZiZ2tod2tra1lYdWg2WWdnZnBqU0d6QWRueVAvZzhaRm90M3BwMEQ2?=
 =?utf-8?B?dmJDQnp6Z3V2MktNclpQNW8wTjQ3anB5ZWJTb0JnVzA1Vm1OM240cGNEMDJ0?=
 =?utf-8?B?QUFrSWpLdTlpOHp3QjNNQXVSVVRaZkRFd2JzWHR2SDdTU21OTktaNEE4NkJm?=
 =?utf-8?B?bHN6Mkk4MXRPa1daTW5kWVRSNjRGcEhoeTVjRGQ5QSsvTXFFZ3c5NzNKRUpo?=
 =?utf-8?B?TkJuTk5ZUGgzYkw2Q0xiSmY0OUo2cFE5VGZETXVsMWhZT3VzaW8wa1RQcnJh?=
 =?utf-8?B?dDNrWXpuUTNIWk9QWmxRNXlXM3lSRFN3VzkrU3U1dlV2MVRhMjRMK3VmUHdm?=
 =?utf-8?B?TUI4NmVzODRsR1M2Vmw3T1JEbDVxZzFQd2FLV2VrTXBrNjBJSUl2N3VYeXow?=
 =?utf-8?B?V3paWWVtZ09GM3NibTJWdHFZUCtQVHBIMEo1TzcyVDM1Nkp1OXlEbkZYS1B1?=
 =?utf-8?B?djhNcE9iOGU0YkZ0Yk5DZ1pnaGMrRmpKS0pKYm5Ld1VSRXRiM09qSGFFcTJt?=
 =?utf-8?B?RXhjRlByMmVSYkpUY0hxT09rQTA1UHA4TnBSQTl6Qy9FNVNHT2FGTkhWd1Bk?=
 =?utf-8?B?OVEraC84SUNPUDgxU2pEd09PVXMvN0JSM0pkOUV1RW9DVGFnc2ZoNTZYVUtY?=
 =?utf-8?B?UW00TmJnY2RhMXE4Z0tkdWRIODF0NU8zdHN6dDVzSVArbUhJd3I1b0NRaU0x?=
 =?utf-8?B?T0g3NDB0UVA1VGwxcUdEVHRnNnQ5WitLeXlqSDlHLzJzVTJQRFNvNDNERmIz?=
 =?utf-8?B?ZWN1VU11RXlSWXFEd24wRGRIMTE3TDdwbmFoVWE1U2lSZy91ODZ0ZVV3em45?=
 =?utf-8?B?UmtmeUdRRU1EQ2w5LzVtbldxZnBqVWhmNE5tN1h6YUs3aE9uRUROYnlvOG15?=
 =?utf-8?B?L2dsN2NoVVNxbGV6MHViNzRad05QbHNOK1lOeGlDZHQwVW9zRFJjNXRtRE91?=
 =?utf-8?B?Nnc1K1BxZVFWMEpIWTE2WGhVNmJmdmZlTWo0c1RlcTlNMFY5dWtGdVgwbXRR?=
 =?utf-8?B?elQ0S2NyY2NZMXYyMXNwclZBczkrSWlDbmRLMFFGYUZQMW91aEFlMmNTeWVS?=
 =?utf-8?B?VWdZK3hNVUFHUVhiOG0rVXZvWlFGTjFLNGplSGIzWDg5THNZZWxVUEZUS3R5?=
 =?utf-8?B?cXViTERoVE84QzhlUmg0NjVSYjZTNmRpam8ya2NtMjFQLzdZRzg3ZjI5YnRy?=
 =?utf-8?B?ckcrMXlDd1hpMEhWdThnaEI1V2hpSkZ2ZVhLMUFmc0RwVDhEanJoYUsydDRC?=
 =?utf-8?B?d3lIWmZUOHJPdVlVNEt0TS90RG45VlQwVlV3cC9CYnBTUGExeW1GZXVTRXFq?=
 =?utf-8?B?Z21iNkdhbmxIQlVFeUJZTlNkSTJKNHcwZWN1dlRZalNvWVViUTRLNXlZb2N2?=
 =?utf-8?B?aFpZNmZlbklPUDljQnlBcTdMNU0rcW84QUZwbDhjTStMTGdYUXVNQ1hpQXBh?=
 =?utf-8?B?dGxNemJQL1BQbjMyMUEyL3FzTGsvNC9aYmRuNllsT2lHQlcyaHVKcU9ab05z?=
 =?utf-8?B?c25sZWNOTzZOYTVJU1hNUDBha2R4bzNid3RFVDVhY3k5QWFad3RSWWU5aE8y?=
 =?utf-8?B?QW1kMmNtZThwcHJOK09ITVVWZExKakpqbThnS2ZMcEErUzZKK3hOQUNvUnF3?=
 =?utf-8?B?L3NIQytmNHJlZVZrTHdOYTNwSHZxRDhQQ0tlZkJ1YndZU0YvdlVLVkZ5N3E3?=
 =?utf-8?B?RXI1T1ZrQjJwTnpOaE5SYjdvRWRnenp0cVZmbnJEaTAvRW96QkFZZkZ6OUYw?=
 =?utf-8?B?eDAzVUkwOGZhYi9wTE9kS0pSYTFzNVdjMWpXbVdTVVdYT2ZPM3R5OFZNVW9p?=
 =?utf-8?B?bmRjRm8yTDNBVkxqbzhZdGJjUzdOb2t5VzcwYlZpd2JzNUIzNEFWdDhoV2Zl?=
 =?utf-8?B?dTJtZGpnd0pvMWhVMFE5Y2IyL0tOUXlvaWdlYkF2cDVualNUZDNHd29ET1lK?=
 =?utf-8?B?T3hVR2srbUwyRjFNN0Qvc2s5SjhBVTlmTnBYT0tEVkVZT1RXSWdlaEJ3azJz?=
 =?utf-8?B?anlSUU96aC9wM2pVbHNzY1dhVlFzZkdadDNLME1kcU53UjhTais1MTJpZTU3?=
 =?utf-8?B?U3VQLy9Ya1ROL3pjanNoTTlaeGc2L2NYVmFGSGxpQjVhY2R4K2tEbEFtSWwz?=
 =?utf-8?B?Q0E1NW84a1M3Y2RWako0ZWxxN0NsVG93QjRNVE45ZXFKOEhjcnVOOGdMMjhZ?=
 =?utf-8?B?ZWt2SHZVMFRLWlJWdzdWUE1JSDViaTYxMWRNRHd0WENZSTJFOFNLVjIxV252?=
 =?utf-8?B?ek4vTUpqa3B0Qzh5eE05dWx6NTZldEZITm1GZ3RRaDZRZ1RFenFyTWZrRXU4?=
 =?utf-8?B?SUlBb2wvenpjbCtibktjSHR0cFhMdGVMd1RWOVJoSXIzOGFPUFp3Q051dGtP?=
 =?utf-8?Q?0sqSHkAc/+bi0I3g=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1510f1cf-d073-4d89-6d5b-08de7505ea1b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 07:08:59.6912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHmYqalBqUn+qcVsAQyVB1hqn56njwsQB4rlNJCOMzlqPkcaX9korAnaRtNdOBQ1atzxqg1Kj15x5EuUA2FJYzCbwU7kvDMyXtx6jSrrENI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFAC6BA7F25
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA2MiBTYWx0ZWRfXx7poN8ISJtr2
 RZx3os2sIU12kiB5Fg7B3hb6ViyYUSgMO2/JWepdrSlEGO8JGTHrz0GuPLd9awjnGLlSnr+e/Hp
 9FktoL/iml6pOiInU9+5b7l6/5BWubQDYQrGMA6aGZ0t0N1mopJMdWimVWw81ouU5qo6Huhm8L+
 qRPm/dtH7LYtLRcWTNBpRayRxjhE6yeZDp8pVHQd5XtsdS/2/9WOKYRzyg9eD1EyG1lMmATakPy
 KCi3PnFoQEDJyBffFVLHf101Om2K3ot2szxC8l0P/9dtVTDZysHS0zRw0R/i4aMxZUCahWeB0a2
 mMAwKFDhYEXhv29Irg3vxCqM9kKCBVfZORLMHsC/6aKAxetN1FLSDrbMpmpfIJE4I+JkzLWZSQo
 7wX5DoN7crDrapTT3une8M0Ly2XSWEL47+s03rqpSxXWpvBwNIyqk3CF35TO7CDKYIS2QxBa7jo
 yB51rKwzG7hCKAXckqQ==
X-Authority-Analysis: v=2.4 cv=WpMm8Nfv c=1 sm=1 tr=0 ts=699ff18e cx=c_pps
 a=f30+ahQCdjj2/zPB7vFTLg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=O24Aq5uEAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=rPOsHOATv2rxDBiUHsEA:9
 a=QEXdDO2ut3YA:10 a=SYBONWESK5muIIdMMRMZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Luk6ElRv8287BHndxcGhmcTZfswATYlB
X-Proofpoint-GUID: Luk6ElRv8287BHndxcGhmcTZfswATYlB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 07:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231991

Sorry for the noise. This patch was sent to the wrong mailing list.
I have resent it to openembedded-devel.

Please ignore this one.

On 2/26/26 14:44, Zhang, Peng (Paul) (CN) via lists.openembedded.org wrote:
> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>
> tumbler default build without any plugins. In this situation, when
> xfce desktop startup, tumblerd will segfault as following:
>
> ```
> tumblerd[1138]: segfault at 30 ip 00007fc5dc169fb0 sp 00007ffd03ee3be8 error 4 in libglib-2.0.so.0.8600.3
> [aefb0,7fc5dc0da000+a0000] likely on CPU 2 (core 4, socket 0)
> ```
> Backport upstream fix to handle cases where there are no plugins gracefully
>
> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ---
>   ...here-there-are-no-plugins-gracefully.patch | 58 +++++++++++++++++++
>   .../recipes-xfce/tumbler/tumbler_4.20.1.bb    |  1 +
>   2 files changed, 59 insertions(+)
>   create mode 100644 meta-xfce/recipes-xfce/tumbler/files/0001-Handle-cases-where-there-are-no-plugins-gracefully.patch
>
> diff --git a/meta-xfce/recipes-xfce/tumbler/files/0001-Handle-cases-where-there-are-no-plugins-gracefully.patch b/meta-xfce/recipes-xfce/tumbler/files/0001-Handle-cases-where-there-are-no-plugins-gracefully.patch
> new file mode 100644
> index 0000000000..a4e60f998a
> --- /dev/null
> +++ b/meta-xfce/recipes-xfce/tumbler/files/0001-Handle-cases-where-there-are-no-plugins-gracefully.patch
> @@ -0,0 +1,58 @@
> +From 95244ee0d1f3184e2c2cae9d33095dc03829b10e Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
> +Date: Fri, 20 Feb 2026 17:07:56 +0100
> +Subject: [PATCH] Handle cases where there are no plugins gracefully
> +
> +Not sure it makes much sense to allow the cache plugin not to be built,
> +but then again, why not? It could be replaced by a customized
> +implementation, and it has always been possible not to build it, so we
> +might as well leave it as it is.
> +
> +Fixes: #109
> +(cherry picked from commit b4f4db4bfc1a45f0a405c4516e38394a44c90fcf)
> +
> +Upstream-Status: Backport [https://gitlab.xfce.org/xfce/tumbler/-/commit/95244ee0d1f3184e2c2cae9d33095dc03829b10e]
> +
> +Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> +---
> + tumbler/tumbler-cache-plugin.c | 5 ++++-
> + tumblerd/tumbler-registry.c    | 7 ++++++-
> + 2 files changed, 10 insertions(+), 2 deletions(-)
> +
> +diff --git a/tumbler/tumbler-cache-plugin.c b/tumbler/tumbler-cache-plugin.c
> +index 50700a3..e308638 100644
> +--- a/tumbler/tumbler-cache-plugin.c
> ++++ b/tumbler/tumbler-cache-plugin.c
> +@@ -188,7 +188,10 @@ tumbler_cache_plugin_get_default (void)
> +       g_object_add_weak_pointer (G_OBJECT (plugin), (gpointer) &plugin);
> +
> +       if (!g_type_module_use (G_TYPE_MODULE (plugin)))
> +-        return NULL;
> ++        {
> ++          g_object_unref (plugin);
> ++          return NULL;
> ++        }
> +     }
> +
> +   return G_TYPE_MODULE (plugin);
> +diff --git a/tumblerd/tumbler-registry.c b/tumblerd/tumbler-registry.c
> +index 705dbc9..b58e831 100644
> +--- a/tumblerd/tumbler-registry.c
> ++++ b/tumblerd/tumbler-registry.c
> +@@ -534,7 +534,12 @@ tumbler_registry_update_supported (TumblerRegistry *registry)
> +
> +   /* abort if there are no thumbnailers */
> +   if (thumbnailers == NULL)
> +-    return;
> ++    {
> ++      /* we need NULL-terminated arrays for the _get_supported() dbus call anyway */
> ++      registry->uri_schemes = g_new0 (gchar *, 1);
> ++      registry->mime_types = g_new0 (gchar *, 1);
> ++      return;
> ++    }
> +
> +   /* clear visited flag of all thumbnailers */
> +   for (lp = thumbnailers; lp != NULL; lp = lp->next)
> +--
> +2.50.0
> +
> diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
> index 7a01882d57..3cbc43fc20 100644
> --- a/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
> +++ b/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
> @@ -7,6 +7,7 @@ DEPENDS = "xfce4-dev-tools-native libxfce4util"
>   
>   inherit xfce gtk-doc systemd
>   
> +SRC_URI += " file://0001-Handle-cases-where-there-are-no-plugins-gracefully.patch"
>   SRC_URI[sha256sum] = "87b90df8f30144a292d70889e710c8619d8b8803f0e1db3280a4293367a42eae"
>   
>   INSANE_SKIP:${PN} = "dev-so"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#231989): https://lists.openembedded.org/g/openembedded-core/message/231989
> Mute This Topic: https://lists.openembedded.org/mt/118008932/8576101
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [peng.zhang1.cn@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

