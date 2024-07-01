Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862FCC2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 03:28:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11692.1719804514719959597
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 20:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=79121261fb=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4613MBJQ032191
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jul 2024 03:28:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4027fx9d4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 03:28:33 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4613SXnT007451;
	Mon, 1 Jul 2024 03:28:33 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4027fx9d4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 03:28:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNLeScCVOFAnbAY/QAKTPolBWIiHNmDKff4EdMiFh56i0lHw7bvJOH7EPQdlLdMFLkR33qVi91IpYamSxt9Z4BGOolduTRHwawT+lfyopFT0JWTahLNclFmDgIkDwfgT5qbgEv6jENOr/7VEHWabKw3FGIFC4bnmersGYQAgLgySbOu/vtsrxtE29HcfAOBtZRn1GYsGXOSGxsLpe5kXqGVTIH6w/LYMdHj5UYhfdnQ2PkSAhXyukbk+IWJOoed6upucVytNiv+EV+plwiqWGdOVpSFzWO9ZUlgh09AoHpab5CN2VVYZgoZsN+SF3WnCyao1bHxwhjStdBNopQxgww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CoTaoZki1eRZTCc5NF5NKTwFSYEk+zxCOATBeu9m+v4=;
 b=gTALrN1hm84i2flkR8fZnEyyoEfTaIq9gaXas9pmWBEZD8Ouro0cKEP1Owms6XeVZY5rXlIr8JxzTXGKsX/X9Y4bpAQEF1MQ8iyUxNET/r578cIJZL71bCazvAAcWWRAdtXM6a9m57fjyairpmqbTBY/nCT3+XvJ3cHTFcLLq3fCWxvbBhCsHlm86IH3FN8I/UleKKUh3wPedR2QFh+0ZIgirLdpXK33vdptT0dQX7PsBJiPL2PQIv3ZRj9B6up2zMhww/RK1LK9bp//xX9ZIjU6N3dUO7lSaBnw8JXwdU4017WZ3ICqB/6DrVo0X7aXooM7xpzHaC4Ei9fo+fmyhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 by SJ0PR11MB4815.namprd11.prod.outlook.com (2603:10b6:a03:2dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 03:28:30 +0000
Received: from SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569]) by SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569%7]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 03:28:28 +0000
Message-ID: <c3b5090c-db10-4063-89db-12c5354faa82@windriver.com>
Date: Mon, 1 Jul 2024 11:28:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 0/1] Update for gfortran
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: richard.purdie@linuxfoundation.org,
        openembedded-core@lists.openembedded.org
References: <20240616153135.3058410-1-kai.kang@windriver.com>
 <202406180640385120dfe3@mail.local>
 <e8fa3278-4d25-45e5-a22a-95d19475cb9b@windriver.com>
 <202406272216073fa71992@mail.local>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <202406272216073fa71992@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0239.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::17) To SN7PR11MB8264.namprd11.prod.outlook.com
 (2603:10b6:806:26c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8264:EE_|SJ0PR11MB4815:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c81633-7f06-44f8-a22f-08dc997ddf6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|4022899009|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZkQrQ05XdjhhMlI5Wk9NMnJlMXRRcS9vTHpSaHF1azE0RkV6ZFJhWitvSURJ?=
 =?utf-8?B?dEtWVkJWV3VsY3UvNzNVTGxKMUVtSVA1cUpzSmZVL2locTRUNzBXMS9VMUtX?=
 =?utf-8?B?L3NUNkZ6ZUVTTXowOGxwN2Z3R0Z5YVFuckJRUmpmampvT3ZpRjRiUWl1WXdQ?=
 =?utf-8?B?TERrRC9CMXBLa3hKazJGZkwxMDI3N0VtMVcvdWJNZU4vUW1KUDdkaklWckVw?=
 =?utf-8?B?RTd4emRKQlA4aEY5ZU1IN2lxWlF2a0hCQnV4clF3SkV0QTR4MWxWb0FsUUJD?=
 =?utf-8?B?NEh1TUFsMzZ0aEJRZGlYZWZaVjA0VW9wb1R3SmprYjBFajladkNkZXFWcURZ?=
 =?utf-8?B?UEo1Um1odzFkODBoYkZCS1VoQUEwT0RUWjYxL08rRnN5cUxZMTBtUFMvV0hk?=
 =?utf-8?B?YUt3aHVVMGo1dlJQY3NEbGRnV2cwUlU0UGJISWtzb3ZQNVdLZWFBN3pSSXBK?=
 =?utf-8?B?d2NzczduMDVJY2YxU3dOTEQ4cmpoTjljTDhvT1Z2ZENIUDY0YVJDenFQYnpG?=
 =?utf-8?B?cG52dm9iVHJQZmpmSFcwamRsWEpjVmlwUHY4OTJXbnJOalZvdDRYWHI0UHkv?=
 =?utf-8?B?eHpycEw3RHM4TEp1cGxWL2VvSjJEY2VTQXlLNG1JRGpGSGhTNmUwKys2K2lR?=
 =?utf-8?B?VzhHc3cvd0F0K0w1TkhzeVhYeS9NSlN2WnIxZml6ZTNQZ3FzWTcvZHl0MXl3?=
 =?utf-8?B?OW5xOWJvUUpiczE0Y2hEMWhjRWNNMzgreThDeVNnNnVCN0lzbG5OVTh3Nll0?=
 =?utf-8?B?MWFucnRUWTlLeEJhN241ZiswUytNakZPc2pGcncrMHNUdVVnV2hJTVpURy9y?=
 =?utf-8?B?SWlkVmlHWUJQUEJkbi9uZTV0ZSticWJjRmFDV296V2xNd3ZWQXVoTWQrOXRP?=
 =?utf-8?B?bzlpYnIzYWNkQW5qenpLYzBhUHJNREdQNDZ2czkyeTVhTWV0M0lQdTZwd2t0?=
 =?utf-8?B?RWhTWUxtRDV2b2pZYzc2dFZkcjBscXp1U2pHTmVSck5Gb3R0WGdwelJjMjhB?=
 =?utf-8?B?RG1mZkUrdStlWUtsRTBJSDRwRkJRZ3ZsZGJNZFVES0RjRXZRbHExNHZjTTJW?=
 =?utf-8?B?REcvVit1V0lqMGhDZ2lPVDZPZjhhODFLc2tDWmJGalJyWmp0ZTkvS1dWd1dt?=
 =?utf-8?B?b3c5T25WSzJKSHhoWkYvbVYwVjBoNE54UWJlZWo1V0pRZWFEWno5RzdLWmtS?=
 =?utf-8?B?RjRUb01wN2VMVHQyenpDV3A3L2xaODZYMzhDUHFsQ00rckFHUXBKQ1pKbHRR?=
 =?utf-8?B?WDlMVHVmUlF2UXFCNi8xazU1M3RHMC9mNVJvVkRNeitiV3IxMFZheEVTSHZ6?=
 =?utf-8?B?NDJUaXRFMC9DcVB2OGIwT003WEJkN0tRdVVPdDVXeG1IQmZkYWZ0N0EzUW1v?=
 =?utf-8?B?TjJHTEREUTI4K2hRL2dFcmIyVTkyZVJPaC9XMFVqY2g2Q0dnYXB2SlN1d2ty?=
 =?utf-8?B?QVZlZFU4OXE5MTRlbFJjWUZXbUdHYzNicjhFUVd3QkdBTFZZY1RETENya0tl?=
 =?utf-8?B?L2VvZldCdzFCcHdCMWJFQ3F2WUw5VytpbVowWngxNk9sWWVXd24xUEM2dU5G?=
 =?utf-8?B?MkpEMjQwY0hmN2RjaDRUQ2lIR3Jld2lYTVFHT1hHTVgySkVETWpKTERJR3dr?=
 =?utf-8?B?UDQ0U2svWW5OWkRXM0ZXUG9NVEF1cUhDOHRLNkVVaGY0MXNpWVRuY01TWFRK?=
 =?utf-8?B?Qm42TEkvYUI3QVJPQmhmK0VOelFxSkVDV21LQWJ2L1h3T0FhQ2pidnBvMHJH?=
 =?utf-8?Q?xoEsiZsEY8FYIRaBwY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dnRXRUQzMEVLMkFzSXI2aGh1Q0FGNnlZR28ySEdJWjZGMkw2R0gyZ1UyaVl3?=
 =?utf-8?B?UlN3OEpXRmdtQmZRVXV5RHhvaGIvcjErbCtPdmY0Y0psNTMwQW5OMEVEN1pw?=
 =?utf-8?B?b3ovTTBPaFNPOGhZZUt5L2VhekVTZjROTVZuQTlMS2tGSk42WGlIRmt6WmNM?=
 =?utf-8?B?UDFOclRFSTFZc3NKMDJaNVhpNWREOFZxOTNjMk5nVi9oMDl5Rk1zZ2dGKzF2?=
 =?utf-8?B?V2ZBRnQxd3FtRm9WVFhsV0Q3WWQzQVNJejEyc2FXWXcwVS9ybStXWTZMSmRZ?=
 =?utf-8?B?dCs2VTBBMjdMaS93c1dnR0dtVm1mc1I4VEJaWmR2ZjlLZ3pBN2Q1a0EyMWU2?=
 =?utf-8?B?MjBSV2ZaREE5cFZhcUQ5d253d1dOZnFzdlFCR2UwK3hzOTNQU1MvM2Vqdm9J?=
 =?utf-8?B?azBHekl2WG9ibUhDWDJEUkpycFFUdVpjNExQRzYxRzN6b0Q3UU5ib2NpRisy?=
 =?utf-8?B?d0hNWVVkbFgzbmNNaXE2UEVnWXlwSERvQnR2aEdsTzB4a05jd21tNHFDUTlh?=
 =?utf-8?B?QmpjTWVFUWlrRjR3ejIveUpKK0tXMi9GOCtFSEk5QW5mZW5MSlJYdUVUaTEx?=
 =?utf-8?B?Q3ZQQjErOERMVlJNc25EQk9pMXl6MjBSUStGWlBwK3lBZWxZdFl0eE96ckc3?=
 =?utf-8?B?SXRmNkxBMUhmTGgza1ZKVXhyaFp4QnNiK3pnSElnSUcvK2VkbTBWT3NBUlpO?=
 =?utf-8?B?TGVhQjFHVng3T0R1T1F5dG5hZ29Ta3IvcDNKQ09qaC9UV05RSVlnQ28rYWlr?=
 =?utf-8?B?bURKejRZL0dvam9BOG5FTnplTTFiUHJRTTNEU0lHQTFUd2k5aTBHMDBlV09F?=
 =?utf-8?B?d1c5NDVyMEtmUFdHbFR6em9FMFd4eWNIYjY4Umg1a2d0RTBlcjhQdVppSXFI?=
 =?utf-8?B?TkxLQ0oxMkNDT2dtRGplSDFOWFh0NnV1eU1Hak1XWW84SytUbHpFT0ZabGtS?=
 =?utf-8?B?YzBBY1BhQzJkK0U4dVpkR1IrRDVjWXhVVklZVWczNkVqaFR0UWVkaXhsL1M2?=
 =?utf-8?B?ZzB2RVByMkdnQ091TTJVenMxMDdFaFVvNExmOEFUSHVZNStLY25BV25LRGdS?=
 =?utf-8?B?dUtvVWhtTy9YM3ZnYnZtTmlTOUFrRHg3OEhZSFlxMjlQK1VQZ01yejFWMi9n?=
 =?utf-8?B?S2o2V2VQOC9WN1JxSm5KQktHNWdPNWVRRkhKc2tSVGhtV2JkRjFSVHlCSE9h?=
 =?utf-8?B?MnlZMUhkY2lCbWxDMm16SEpmSVFBZFpLeVR1c0hYbFhtcFljajgyZnA2U3V1?=
 =?utf-8?B?Y0FKd3NkSFN5YVRUS3JZN3JIMVhkN3JFRG1KZ25tRGRKUkNoS1BWMlJFMlN2?=
 =?utf-8?B?VVo1eEpEeEZZeXZRanpFK1Z3UjRlSmtqVnFvZGhndnVWZXlPSmhSaXN1TEpB?=
 =?utf-8?B?VDdqNW9HK0dUdjZYQnFOVXJqMGVWdzgzcUdTQndSRzFiK1hVK2lrdzhjYkNT?=
 =?utf-8?B?aC84Wk41MW9Bd1hNZnR0SFR4LzJxamlPRGx5MjF2WmdVdWVFaE9MNWlxdGZw?=
 =?utf-8?B?Z3hVSk5xMTh0MHpHdncrUS9UbWRhcFpoeFhJNmg1ZU11QTNMOTNjRkh1NlNN?=
 =?utf-8?B?bTFIVDBpbCt5YmRpWEYrWUQxZlVYKzFVSmZ0b3ArWGNWK0hkNGFkV3hBeGNE?=
 =?utf-8?B?L3lrdlJ4Y3ZwSnlTcUpyNHMvMVJNeld1VUNXZ2FsT2plbVEzVzNNcVdLWk5P?=
 =?utf-8?B?VVdwNytwdkdwd0RKblZFVUJnY0xyQUJoSno5ME9GV243RjBkV1lBV083Qi82?=
 =?utf-8?B?MDc3OG9LbUZvaFFxQ2lkUldOTmtnMXp2OTYrN2tPY21EK2tQMFNIamJkRmUx?=
 =?utf-8?B?ZCtFT3JrZHFZaXRhOG83YXBidzJHUlhVR3FiS2t0bTR3dnF5c3ZJdEFManBI?=
 =?utf-8?B?TmVQOUdLY2ZGWkEyMnplNlovei9KSDN2K1BIS0xHMmN3MTRMSWJhWGdQVkxZ?=
 =?utf-8?B?WDNUUWJZeTV2emx0RHliNlZQdlJOWXhFYWdOcW9jU2ZycFRNaXRvd0Y0N1JW?=
 =?utf-8?B?dnVFdGwrWGN5bmI3S1ZGNDJKeHB6ZTYrUk5DbG9YclovamhvZ29DRFREeGI1?=
 =?utf-8?B?QzFBOFRNK0Y1blRXRWdoYS9LOEI5QTFjR2tsR3hsRkIycHlERkV6cjZGc1dt?=
 =?utf-8?Q?MCtsWQ0aM+3Nz7Z/gDkV2vS6E?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c81633-7f06-44f8-a22f-08dc997ddf6e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 03:28:28.1363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XBo+PFM8Oif4MEie6bAQdYHSLC719AVivxFa5gZ5IWPH3uWF5CnKSYKV4X0TTX3GisStQsWYcMXMB+JRKwFHMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4815
X-Proofpoint-ORIG-GUID: 01XMeZTVNIcWeqhN_OOJWg-hIENra9jB
X-Proofpoint-GUID: GUHYzOxLlVwtWZ0XH1BcQlm029S2fZrX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_02,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=720 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407010024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 03:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201273

On 6/28/24 06:16, Alexandre Belloni wrote:
> On 24/06/2024 18:06:38+0800, Kai wrote:
>> On 6/18/24 14:40, Alexandre Belloni wrote:
>>> You must always resend the whole series, else ths patch is not
>>> applicable as-is. The work must be on your side, not on the maintainer's
>>> side.
>> Because the first patch has been staged in master-next, then I just send the
>> other one which
>>
>> rebased on master-next.
>
> master-next can be rebased, please base your patches on top of master
> unless instructed to do differently.

OK. Will do next time.


>
>> Regards,
>> Kai
>>
>>> On 16/06/2024 23:31:34+0800, Kai Kang via lists.openembedded.org wrote:
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>
>>>> v3:
>>>> * update INSANE_SKIP for ${MLPREFIX}gfortran
>>>>
>>>> v2:
>>>> * add sub-package gfortran conditionally
>>>>
>>>>
>>>> Kai Kang (1):
>>>>     gfortran: update runtime dependencies
>>>>
>>>>    meta/recipes-devtools/gcc/gcc-target.inc | 9 +++++++--
>>>>    1 file changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#200779): https://lists.openembedded.org/g/openembedded-core/message/200779
>>>> Mute This Topic: https://lists.openembedded.org/mt/106704989/3617179
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>
>> -- 
>> Kai Kang
>> Wind River Linux
>>

-- 
Kai Kang
Wind River Linux


