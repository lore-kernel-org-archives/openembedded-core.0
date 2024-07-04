Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F65BC3065C
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 07:50:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5338.1720079407303199664
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 00:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7915407677=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4644eKkc024766
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jul 2024 07:50:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 405jrsg83b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 07:50:06 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4647o5io004028;
	Thu, 4 Jul 2024 07:50:05 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 405jrsg83a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 07:50:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bM5+POcXlAy+WuW5ETzur0ZZLCPPcS9NMvw8wnazJb0/4ijeTfHOn50uD8iDhIlYMSaCUpPNozN+QFEQp/Aj6tDrbIEEB9oct8wn/bM8qB3pK48KJK2qgyxwBuS7kE59XzwrU/3S5NPwrhy4aISgQmkYlKmZv7MUcdzg/utS19x4hL6ZeGAIIbuBIEhnjfFQrmQbGw3/zR0tu/NRKLIc6FDmLppPSG9Rfz594b5CkEl6bUdxJxmqB5AV5RI66wTyn7V9HzntjlUTQZr15zGL4a9EeY8PBjf27IeKs7CX4c1gZgTT2riv4OYylOu4YgaNP3fbs/t1p13WlMqjEn4seg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/vNSrvkTKkkFBdRylN7KwhKujkstfsKN6w5Vsuc6nw=;
 b=XW6aAEFBjBGwQD9/W+0fOxEGIyvZXvWFOxT/Gq+I439JT1Pn9FV3P9hQFQft/6Ta7wOh/gQ9M2G40QES+cZ2mirUXRJ9q/ppPepPAhhQ/+vGGLpPLwVuLPYo6oIUKiRNBj3gGgsASX+ygCQpeUm0adpTIH2/f10kjKYVf3fv9f0dFHi0LDxcRs8EVv9zf5gUwG2+8yTFa5J0cdpL9SxFZ6dgDCeeuq8J9uJaEkWh6B6zS6SNJDNHLbTruV0shNzoYQCBvHriIAu96JDonEQkVKw3g2KcVNUeA8jmzWZBX+p1f1gBBMVwrmM4KkAUB4Jqz4j2qQF2s6U4VjlxEVMK3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by LV8PR11MB8583.namprd11.prod.outlook.com (2603:10b6:408:1ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Thu, 4 Jul
 2024 07:50:02 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.7741.027; Thu, 4 Jul 2024
 07:50:02 +0000
Message-ID: <47137b74-b746-7ca2-e4ba-13edce044239@windriver.com>
Date: Thu, 4 Jul 2024 15:49:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH 1/2] systemd: Mitigate /var/tmp type mismatch
 issue
Content-Language: en-US
To: niko.mauno@vaisala.com, openembedded-core@lists.openembedded.org
References: <20240704071519.566147-1-niko.mauno@vaisala.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20240704071519.566147-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|LV8PR11MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc781c1-77d8-4e27-ba66-08dc9bfde91b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SXVYNjI0cE1sek9KNlpkK2lSQjI4OHBWVCtZdFNza1YrOGkzSm5UYTBCaktt?=
 =?utf-8?B?amdkdFVNQkQrSGZKei9iMWNlRkFrb1VvbEZZNHdkVytkMHF5b1pHRXZWTjdk?=
 =?utf-8?B?ZDRUY3Z1SE50ZGZxSEw4UEtXNUtGL3BYbmE5OGJSS0V3SWk2eEMvNmg0aHpP?=
 =?utf-8?B?TXJTRUFMbVJuaVBsNHh4bTNTOGNFS0JqeDdvUUFRVjJHMWxEeTFuTmM5UElX?=
 =?utf-8?B?SjJBMG5GOVkvODQyTllpMTBIM0UxUzY3c1Nid1BxTkF4WTV5OXcwcjI0OWlz?=
 =?utf-8?B?Wko2WUJPVk90RlI5dWI2NFZ6Umd4cHFMYkpxdlBkWVMrY2FEZ1dlQzlFemFO?=
 =?utf-8?B?ZFdiMm91WXdjcmNYamk3R3lodk5WaDM3V0pEWXZNZjlKc3BrT09uUWVmcXVi?=
 =?utf-8?B?VWhNYk9OQUpOWk5ybldDNUxHTjZrbWIyWW9RSEVUNWxoNHhIcGpuZUZMYzB5?=
 =?utf-8?B?U3dGWndBZEM5WWp0ODhrKzFtTDlUU2xBdEd2SXdLeUdWc1NNdnZlVzd1UE9t?=
 =?utf-8?B?Ni9XeHB4Y1ZKYTlkY25Ka25ILzNnUGZwY1Fwckg2VFM2K0M5UlFKZDZEd1lB?=
 =?utf-8?B?SXBZTWkyaE5CMlBRTzNnSVFFbnB0RXRyNWEyZXlXSFQ3ZWhPRGdtOStzVDhl?=
 =?utf-8?B?L2dKYXZ5UFdXSGFvS1JPS1owTENJeU41dmxwb1NOMDBJZ005Rk94bkpIc0tO?=
 =?utf-8?B?Rk4rVDl5bEszVDZScmQ0bWoyUStwQnRCVXBkVUtyWVpKUm9Qcm1qR0ZRaWV5?=
 =?utf-8?B?WlZ2T1hySy9GaWZzaDRGNXQweE5WRXRNZGN6dktKQnZkbTNUZU5FeXhCdkhw?=
 =?utf-8?B?elBjalRFMDBsSDNjRTFzNHFVS1o1cHE1dUV0dVIxK0pVT0MvUW5KMkhwV2pQ?=
 =?utf-8?B?VlFJbkVPb2dnUmtnTzM2U1dnOVJiekxhU3FhbmRZb0VNTk5wbmZpZGlmRDhq?=
 =?utf-8?B?eW1HTE1NNEJvUkRyZWVzVzhFdmhLa3N2VXJZRyt1MHlOVzJSaXRjY0FlTzBK?=
 =?utf-8?B?SDBFZjlpNDF0UDdyaXV6QkpxcCtBVXoxSGNnVU1ZNnE1TEJkWUU2cTI2am4v?=
 =?utf-8?B?Q0tGTkJXeVR3U2VOdjJLUW1iMUJzRXVWbTI5UG85U05FUnJENWk2dzVUdURS?=
 =?utf-8?B?bFZLSzVuREYvTjdYdDkyanFJc2tjN2UxZDJkUmNLN09JSnlyVXlqNTdKcVVR?=
 =?utf-8?B?bnNDS2kwWGx3NVhMcUp5OFZnU1dYaW9LNE9hWjIvMzZoUkx4L29YcHhtNStm?=
 =?utf-8?B?NHQ3Y3NLbjQzYXBEbWtUcEZiUC8zaHpuemE4Ny9xREI1UHEwc2tobmJFOG95?=
 =?utf-8?B?RjQrTlhrODhWZzhxWUdhOVhBdGNLZnVGdzhXOE1YTmhqMnY2enVKMGZ6SGJH?=
 =?utf-8?B?a2Z0TDkra3M2bTBKQkc0Ny9xVHlzMXU3M3VMSG4vZkhYeTZPVkh6UnFuTmw3?=
 =?utf-8?B?SHJ6SU5UUnR6cUROQ1UyZzIrQ2JaY2pMVU4zS1NrbzNsbEZRTiszdDBENTNX?=
 =?utf-8?B?VEtIckE4MXBISDZtZWwxcndkTGhORThTT0kzNnZiRmlBeWc3TDBGUFkranFh?=
 =?utf-8?B?Q3BHdEZFaGxMS1VhOFB0cS9YeHdGYUtsaWNyZVMwcGtSem8yMEs3VlRsT2hF?=
 =?utf-8?B?R2lSWFFoUWovbkhTN055MnZHd0xwcnp3UitCUXZxdnJXUkVjRUZzc1U1bE9J?=
 =?utf-8?B?MjNXdnNTMUY4WnkvRzB0WWp0T3JPSTJybDhrMURLTC9VSHlJamJLcTBEU2pK?=
 =?utf-8?Q?LFzQ3tv0ngMdR+fwFE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ODJYaFgxUFRaNFY3SUlwNmNQWUU5SWFieHFVZ1VFN3ppdEJRMGttWTI0eFVs?=
 =?utf-8?B?Z2VSeVBYdHFRbkdNR0huWmF5WlJzZ0lhREdRNk5SUkR1WE5CR25lTGIwTHB2?=
 =?utf-8?B?MlllNmx1cnlaQVY0L0N3U2F2Z0lkaW9xWnZBaGZmYXpaQU1zUzN0T2hWdnhH?=
 =?utf-8?B?bjBqcmQ1aWtmL0l6V21aRXlCRmwvNkdPYWJEZnA5TTdvYjZWNmVnbGVjNUY5?=
 =?utf-8?B?TmV5KzlTNU5sK2lNQjNOa0tzRG01bytxRmFiWmJ2ZjFEZnRDNjBldjdJUTM1?=
 =?utf-8?B?VjU3T0dyaWtvZVRkY3VnZzJGYzJKQndpc203RXJuOEp2ZGxmRGY0WUV1dXJF?=
 =?utf-8?B?cDBxL2VteEp1cWQ2cm5udUpmb0d1RWhzaTE3Ynh2MTdkYWhzSTNLa1UxN1Iv?=
 =?utf-8?B?VkJwN0toT0lIaG9iZ2d2VmVDaFlySDFBd21qZmVOdzVWNFAzRGJkNTZBRU9G?=
 =?utf-8?B?M05YT1BrQWdsOVE3aDU4bnFIT3JqRmdRTjFyUGQvUXZiODNaRHVnUkdiN29s?=
 =?utf-8?B?cWJQYUhXUVhkSEJhSzc1UVdRaFduNEhQZlFBSEZYSC9pUmlObWt1V2NqR0I2?=
 =?utf-8?B?L3R4L3kyNy9sRkM3SFAwSitSL1oraXgvb0lkeW1hRGk2SU1FaHh3RGxUNmVM?=
 =?utf-8?B?WjZ6Y0N2TzdSaXA4RGt0M3hFUm9ZeDloVlBNT3BLN2dHT0lTc25mNnpuZGtr?=
 =?utf-8?B?YTlKVEtUUzZSVjYxNFMrZEZVdmsxdjlqWFBHb0tZaVhDQUZ4aTJVclg5Yms5?=
 =?utf-8?B?OW1zY0RCZUNOamlOQjhNNi9kM2pSbHVRRk8yNEpXSTZEMnkvd1lBcjNSSWRZ?=
 =?utf-8?B?UVREZ2NySnhjYUQ3cVBXNmk4VWlSQ1FwRE1SV1puNVJNNEFZcTNCWi9XcXdt?=
 =?utf-8?B?ejJnbkx1bTdNdFBPZGNCN082OWdtUkFiTCtqZHdHTS9WaTk1K3pmdFM2ejNr?=
 =?utf-8?B?c2Q5a0g0OFBFdUJaWWtXRUVabFVaaStzNHRzdTMzVGVqRFZMdjJ4M0tSeEo1?=
 =?utf-8?B?Y3RQeUJmSlU2ZFFFRUNsVUlsWlN4S2VmSDIwQjhML0llWHdBQXFjbExLRDJx?=
 =?utf-8?B?SUxIWFRqY2E0UGo3bEdVTzVTZVZxSTMzc2Z6V2g1VVlsUjBicFlqSStIQytz?=
 =?utf-8?B?QmN2SXR4U2NLWVJWbVNNVFRxWDhwd093cTR4bUFZTWUwVnFNUEFJQWhhTU1i?=
 =?utf-8?B?OVp5OVAvZHZWL2xMdEU5YnZ1V3pRbHY1YVNWOFFOdlpwQkk3dm0vNTdWVWh6?=
 =?utf-8?B?UnFMMTNSUFBwOHFRRUdiMC9DczZ3djZTTXVQM3VNWUV4d3B5dXl0ck9lRnFp?=
 =?utf-8?B?NDluOVVUVERBbVlPSk9DWGNoclYwSUllR3FsZVZla2R6UUlMaEZXWCt4RnVo?=
 =?utf-8?B?cnd6RE52RnhFOGd4TURzZXUwT21Zd2M2Q3ZxQk1SSjk1ak9ZYTVzbmJoR2tU?=
 =?utf-8?B?aHhVc00xRE4zM3gvS1RGcnE4emZUNUZGWHBqMWVNKzhkcDVPYnlobHUzTXZX?=
 =?utf-8?B?T1laVk4ybEFxSkN3RUh1b2pvRVN2bFlqUVBRL1d4OU92NnZOMWwvclhqTHVB?=
 =?utf-8?B?UjkvMkkyYVd0MnFHNTRPY0MwR2NScllJYzJWNEhtdHNHYVoxNG9jT2c2S0pl?=
 =?utf-8?B?bnMxZ2FrY0gwZUVRdzFUaVpjbC80aHRRT2wwV0RScG0rN1pmOFhvaGhYcEk4?=
 =?utf-8?B?WURVL1pzWW1vNzBJb05UcDUyd2NZa3YycEdMUjNLWGlVUy9vWjZka3JOcGx4?=
 =?utf-8?B?SXRPdE14OGlKK25oUXF4S2hZbytTY2RSdkc3S2hTTUpHNWR6SnQ1dkVwcTBR?=
 =?utf-8?B?Tk9xTmtidHhVOERPa0NobkNxaHcxYTMvd3dZMjA4K3ZaUzRISDlkdWdid3l6?=
 =?utf-8?B?M3lQeFc1SWZ3RlR3NW5pWDJsRHZXUnF0OFd4YnJTUW8vTkhXbGdtS3MvcVhK?=
 =?utf-8?B?b1p4ZXprdGZnNDlzakpQVFRSaCs2U1V4SVdRNjRsZURMaEt4bnVjOGpaczBK?=
 =?utf-8?B?SGRZSXdJTm9KZGtWZ0RJSzlzUVpEc0pkN1J5c0x4QnNqeG96TUlMR2J3VjFO?=
 =?utf-8?B?R0tVakZWZlozZzB1OHM5MG8zVjR3TUt6dFU1ZUxhZ3JHUWEzQ1o5OXZ0YXlV?=
 =?utf-8?Q?jhfsBnK/d0aG0LDXheXT640N0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc781c1-77d8-4e27-ba66-08dc9bfde91b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 07:50:02.2987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xzk1YflbyBYAPJaevC8H1HvUkAR4pAFtyILj3UBG7lkBi+pnBfSbf+Bwr+8GlruT1Njfqxbr4JbMQkuZHx/RzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8583
X-Proofpoint-GUID: 6PREl_lbzXIm_GJyqNkCvuIEwnV82WyR
X-Proofpoint-ORIG-GUID: W9z52SnpGouJjiLwkAkuHx5w0HszsEbu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_18,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2407040054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 07:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201522

There's a pending patch from Changqing, which also handles /var/tmp.
The title is: [OE-core] [PATCH] VOLATILE_TMP_DIR: Extend to specify the 
persistence of /var/tmp

I think we'd better handle that patch first because you may need to 
change to the way you used in your second patch to handle this /var/tmp 
link.

Regards,
Qi


On 7/4/24 15:15, Niko Mauno via lists.openembedded.org wrote:
> From: Niko Mauno <niko.mauno@vaisala.com>
>
> The base-files recipe provides /var/tmp -> /var/volatile/tmp symlink
> which is in conflict with systemd upstream tmpfiles.d/tmp.conf which
> defines it as a directory (or subvolume on btrfs).
>
> This generates following error in journal:
>
>    Jul 03 15:37:21 qemux86-64 systemd-tmpfiles[158]: "/var/tmp" already exists and is not a directory.
>
> Mitigate the issue by defining /var/tmp as symlink corresponding to
> the one created by base-files.
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>   meta/recipes-core/systemd/systemd/00-create-volatile.conf | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
> index c4277221a2..043b2ef1d8 100644
> --- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
> +++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
> @@ -6,3 +6,4 @@
>   d		/run/lock		1777	-	-	-
>   d		/var/volatile/log		-	-	-	-
>   d		/var/volatile/tmp		1777	-	-
> +L		/var/tmp		-	-	-	-	/var/volatile/tmp
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201520): https://lists.openembedded.org/g/openembedded-core/message/201520
> Mute This Topic: https://lists.openembedded.org/mt/107033957/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


