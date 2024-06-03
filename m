Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E12C25B76
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 15:07:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.86047.1717427250438263245
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 08:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=688417d902=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4535Cggc008350
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Jun 2024 15:07:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yftm7suuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 15:07:29 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 453F2TDs026197
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Jun 2024 15:07:28 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yftm7suux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 15:07:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0xVSZ6c6lKOSAUbbf3hRyR+qYtZ9FPkk+dFgYSboFgGwqXKtZ0m2ij0EOtcDYWBlo344em8vqsmk0vNSOxadMo3GfoR9HsiZqQ/BC5zpk7CIjStOSZ7aVaE7aUNcRZoJXDoKcWDyESWyKfkk1R3AcVZMVbVNY3Rs6fpzykH8MJBvnB1EX/jRdE4MRDqh39mnvqjGJcd8seJ2If7DvEFZCvyPlTbq4Hoei5GG72eIbkq5rv0jQo3g4mI749ApkRqEUfwH4BDXAGIb85uEdksPcUe5egOKqei/6/m8BKA3LBjX/RhCYnuo9NVuaauWokMpHAH/Ay8b2HPwnEfNWSiLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9F17zoNuK0T8unHbL+55Rqth1QMGGDNm85kv00oU+Eo=;
 b=DmBrCxNSmSBW8kNvKOmxcEX2ygxfY2rynDbnRFbezfnwSIeqCTNIjXCBQ5HVhPvibljaGoFQvTbEwLzYpG/SlT8J1lH3IPfDWy4Vxw79kZiRrLEfgPzGuz4UVElyVIk5aZ2uOTAI0vh4y5xIncB+vRQdvcgZg7eRtDGtPrBBkYgLfbpMhZq27cvicFvLcGGmOdqeX6hbqq8Ck9g11CUJ5a5nnbmaga3lJRz0D+eEQYx1FUOYmHQSByI5TrcDDbGATW1thVOkThMJ5gBuU2koivO7BDapiomL26KYgMXzA7TX39TZMZqNaB8QS7yRhL+pp/4WDf7YH7PA5QgeEjAeXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3063.namprd11.prod.outlook.com (2603:10b6:a03:89::11)
 by SA1PR11MB7016.namprd11.prod.outlook.com (2603:10b6:806:2b6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Mon, 3 Jun
 2024 15:07:23 +0000
Received: from BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99]) by BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99%5]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 15:07:23 +0000
Message-ID: <14893660-1952-4e6e-89f3-70883d2b465f@windriver.com>
Date: Mon, 3 Jun 2024 20:37:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: rustdoc reproducibility - disable PGO
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
References: <20240603144545.163535-1-sundeep.kokkonda@windriver.com>
 <CANNYZj-CgmCG3+iCoUWV=Se8gENS7TCxOS6eLGb7RCm8nzejEw@mail.gmail.com>
Content-Language: en-US
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <CANNYZj-CgmCG3+iCoUWV=Se8gENS7TCxOS6eLGb7RCm8nzejEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0026.prod.exchangelabs.com (2603:10b6:a02:80::39)
 To BYAPR11MB3063.namprd11.prod.outlook.com (2603:10b6:a03:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3063:EE_|SA1PR11MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: fb4a9cb0-15a8-4c00-e5e3-08dc83dedf49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|376005|52116005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZUxTNGRiSk5pNFlHRld2S2xVUWpnUG10V3RNdzIrZ3hKeGxxUThxYWF4Z3NE?=
 =?utf-8?B?Rng2YW5ROEFQajhNYXRUS3VTRDFyU2lvK3RJOWZJamo4VzliT1VzOUtPN3Ba?=
 =?utf-8?B?Y2lYZDZweTdFcG9ucU8xSmROU3pRcVN2UGk1NndTaU1tcnRIdWh2bEhDUjJk?=
 =?utf-8?B?TGd0S0FIN2FBblFiTHdBWGREWWJ2NHZQK2RNcHl3VXJnV1pXZTlWTDB3VklC?=
 =?utf-8?B?MUhFLzQySVJxRnMyV2lVSHRNOEo0VWdhRXEzT2JPY3VEYk4yeW9oaEZhQ3oy?=
 =?utf-8?B?NEc2cmtNa04xdDFrUmxIU2JuUW8rUGxzU3lhd2hlVmduNmFzQUpMN3hVQlVo?=
 =?utf-8?B?cEZsZE8wRVFjVVZTUkE4VzJpQjBrZ0FxS2RETWRvRzFUTjVtOHBsd3lnVENy?=
 =?utf-8?B?aDB3UFNLeFhXU3d2V1FYcWNMRVU2T2NaNjhzWDdzM2FSelFBbEZPa3AxV3c4?=
 =?utf-8?B?OXFGdEZLeUFTZDhKcG5wVHRzUC9mK1pTQXBtZXhMdDBYWEZNRThQN296eGVl?=
 =?utf-8?B?eWZZOVpyakVmcWprTmt3R1hIeWxtbTZqUi9qYTVlWG8zcjlpU0RLc0RRalgy?=
 =?utf-8?B?b1I0aUhEcVVmNTR1SkVJbFZqcUMzNDNXemZ3OFpZQ0hPSEJIclZBcjQ1WDA5?=
 =?utf-8?B?djNIeGZrSVlzU1pTdUhNdU41NTlhekZ2SHB6R3VHV3hrWUJrbWVnYVlSV3M5?=
 =?utf-8?B?enBJKzZNM2NVTVkwZmU2SGd3S0JBRzBTTWZOUGhOamd6MnE5V2pKdVU1MU1u?=
 =?utf-8?B?NzRwOC9KS2IvamVxbTMwa2NTVGN6bHppZ3FZa3ZoNkJydkl1cm1GNk1PeGFJ?=
 =?utf-8?B?YndNdlp6R0JickkrT3FKdlVvY2VMcE1PTW1hcUNHT2xzUm5kK2RaYnZCelF5?=
 =?utf-8?B?L3h0dHV1WkdQT2FmZHpBeUZOeExrT3gvcFMvdXBydXVEU1ByUnpFaTVIL00z?=
 =?utf-8?B?SlpWUmp4aFhyK1BJY1dmY1h3NURjUnQzUFRSSlJXSXV0a1B0WXpnSkdXOTJR?=
 =?utf-8?B?eWZabStNTFBvU2g0UzBWUTdpNFZSSHlLQUtPNTBiYUpIaDNHbHV4Mzllc0pM?=
 =?utf-8?B?QzhuSmh3b0hoMm5KWjY0SHdPR2RVK0tkOEJ2THlqdThqYlc3VlBNQXdibjNS?=
 =?utf-8?B?ZVNsWlo3cFYwdkRNd3hVWHRWZEFGUUNGNVNobEkwb2RwakcxS0ovMDBxS0ti?=
 =?utf-8?B?b293SmdEYThIZEtnWURSL3Zjajg5alY3em9BSlB2S3BXd3J4R25BQ245Y1ZS?=
 =?utf-8?B?SHJtVDZrSVVFdTdJemFPei9LWmxXeUFRUlBocFlBckxmcUg2M2VtemNHM0R5?=
 =?utf-8?B?NXRocHBZaWJobnR6MG9pb2VRQ1A5SlI1RUtML2gvbWtwTTN0Qk9jbHg0RjFN?=
 =?utf-8?B?a2lvdW5KYlQ4WGlMSXAxUDFZTWZ5VVo4dGdrdnY0emMwWEk0Ri9BcDB0c09S?=
 =?utf-8?B?MnBoWFVkc3dNU3NtcEZhTW9QZ3ZGSmlvejNlQnRCY2xoNVZkYUV2SHI4Mm9O?=
 =?utf-8?B?TUE4Umk5SzZYSTZoTXdoSzhpUmZIdkUwRmd4MW5hUVpTcFU0NSt5VFZWa1VZ?=
 =?utf-8?B?RFhhSFBvQjlJL1lHWGRZMmFNb3VYZVNPQllSV3hBNFViOWIzM2xmeHJ2S0xh?=
 =?utf-8?B?ZXB2L3BCd2VSb1NIMmFqa3BpZCsvZThneW1xQnNxbzRxQUJycHhPZGtyQS9H?=
 =?utf-8?B?QnU4UzVnL0VFL0F1VmJESE5xazdxNTNjSzFYaE9Xd0trY0tEcFpoQk40QXEz?=
 =?utf-8?Q?xSUvbHXYKEF9uEYS2s=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3063.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MWdKOHlscE0rS0V0NVBqZ2ZHN29XNGtlYmMxemFHV1hWVmlZVmh2aVNkeUxM?=
 =?utf-8?B?K2lyZytXTEFmQS9RbTc5NzdyZk1VNWNFNEtYVDNqS3hZSXFSMlRpUlU5V1A1?=
 =?utf-8?B?M21xbWEvcWg5SlRMbXZjZ0s2ampKUnptYUI0UEl5SjZMYS9zUnY3WGh4U1pk?=
 =?utf-8?B?VUpTNG96UVUrd0pjVFZ0TDZlY3RSZ3hGWFRRbDJhMWdsaHQrb3h0V3NHY1F4?=
 =?utf-8?B?S2svcjI4RUFZeUxFcXRpYk16ZDdyeGN5K1dBQ3BHRkUzVnVmaTZoSDNhZHVx?=
 =?utf-8?B?bVFBM2k3QVpROGJrMGRwMEloNytYeUw5ZEpzOW1Ed2N3TVo0cDJBajVwbkMr?=
 =?utf-8?B?cEpYeUdxSEw3TTY5SzRBcVdFdFNLUENqbUFJWUpDWnFYMU4yUFN4MU5QbzM4?=
 =?utf-8?B?WFd1ampGNGJpTENyTVA2SCs1bnNWOTRlbTM2VTVWVWpyaGJHWDhQbXovaTcy?=
 =?utf-8?B?V29vTGVOUk5VOVl3alRkb2prQ0JpVHVXSlN4ck80bVpDQlR5ZFZvMlZNbTRI?=
 =?utf-8?B?VDBRYWMzdCtHOFhuKzhQUnBkV2JkSm1OSTlVN3FJc3FTY2ZnUjB0TFVmV3J6?=
 =?utf-8?B?WkZYR21KMlZwMkJoRDFPOVZxYkl0R2Jpei9jTk1uSmNaeEY2Y05MWFNhWS9a?=
 =?utf-8?B?WmVZcm1nb2ZnZWNuUTA0bjZBVmxNUFBLUjhnMDZYSDZNN1luWjlDR25mNjhM?=
 =?utf-8?B?MXdjTnlxMHp3K0xMWkk0Z29rcHljOFBsMVVVVE8ybGZCbFlONDVLTTcyV1JZ?=
 =?utf-8?B?T0FYc0c3MzJzQmwwT2h3NWpNV2JIcTcrbG92Yi9PVFZ0bW9RbHR5cXdBdU9a?=
 =?utf-8?B?a0RpSTZjS0RCQlRJU3VPNUMyK2xJTE1TS1lCNGtPalkreWIrak9KOWVmNEQy?=
 =?utf-8?B?Y0c2d3lMd09taUNXcTJVUWZhSzBHOGc5TlZuN3hudkQ0aitmazRGYkFGWmtv?=
 =?utf-8?B?NENQM0pzdVZ6NGtnczhhcko4YmxyRWZqcmlIZDUwNy9MK2k1YWtqU3NpakIy?=
 =?utf-8?B?TmdHaUpEQ0xUVWFXSkQ3VkErTjZ6czE0OWc2SXBsejE0b3RRTTgyRVFCZCtm?=
 =?utf-8?B?TGRzZmV3L2tpb2VDajlIcnBqVWFWNnJlYTZaOGRjQm5sRk9uNy9Xa2s2QXBV?=
 =?utf-8?B?NFZESGZtN3I4N25sa1U3bmRLdlc0RkRNK1dRRGhSdnZ4Yi9OQUFxV3dvWUpS?=
 =?utf-8?B?NWRnVUErZWFzV0l1TWFCQUJTSVEwRlVqaWpMSmRVQlhHcUVuNkVPbE9uaGZO?=
 =?utf-8?B?eFpwNjJlWGd4YWg0amtwQmI0bytGaE14cFZUeFlCMlQyZDNYZlF3dmRUWHFO?=
 =?utf-8?B?Zk8reUlLVFFWcG1MVldVMDhWMGhhRzlSUFFXRWt6ZWZ5ZUR2Z01DaEQyM3pX?=
 =?utf-8?B?RThGbit2NTNVZG5YZi9qYjhSdG1NNS9FNUUzNjI1YnAwbytlNklzZE4rZVkx?=
 =?utf-8?B?bGFYajV5L2k4M1NzZWRRTVBRWERYazBBTmY0dUJUUVR4RkNJNFJDakU3dmxk?=
 =?utf-8?B?WjB3WmtyeUQxS2dSMGcwVlFhTmJ6dXpIZlRDT2dHTnFhUjY4UEZWdUFQTm9V?=
 =?utf-8?B?akJIMm0wSXh5ZWF6MExtWUdNbG1sb3NlL0kxRnRPRDB1WTQvODNlNEt6UGs5?=
 =?utf-8?B?clc2ZEpsc0ZNaWdUd21Wa1dzS1V3OGkrRHNnTXk2YWJjTXR5V0ltWVowa0p6?=
 =?utf-8?B?SCs3eVFRT3lXUU1neG1wcVVXTTRzdVlnMkV0OHc2cEJtd3NCKzFnejFXeFpF?=
 =?utf-8?B?NUQwZ2xTK0locFJMSXFES215Vm9hdnhQVXowNkJCaGJ0NHZ3c3NVL0ZCaUE4?=
 =?utf-8?B?RHMyck8xNEJJTUlNdDJRM3kzN08wMEM1WUZJcllPdk1KT2Q0LzAzNGxla1lS?=
 =?utf-8?B?K1JCaWlOdHpjMzZrWU5nMi9KRmp5UmJBc0xMUWJsaGNKUlNBMlVkcVBKVnY0?=
 =?utf-8?B?aFJMNnBPMzZjL3lhV01HSnJrR0J1WGUxcUhuRlhFcVRRUDNJTnNBc3pZN25T?=
 =?utf-8?B?NE4xRExNd00rSnBwczlCUkdwNDBaL2ErNlJyRWMvQkluejFadjkxSXhUdms4?=
 =?utf-8?B?UFVoOElXbjhaVDlEZHNvREZTOWF4STJXVjh1V2w1c1ZvSFJ5SStBU3Fmd2NK?=
 =?utf-8?B?Si82Y2w1VGhEYmw2VjhuWjFOakhKOXJJdUJ6ejhyaUhKYWFWZDRiZ1p0ZUZv?=
 =?utf-8?Q?pg/caPVe8EzDGkc4LM+BktM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4a9cb0-15a8-4c00-e5e3-08dc83dedf49
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3063.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 15:07:23.2565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E06LnLMadiXxYBic4EOOWYwlt1OUt2P69zeUcvJKNhSfSIEQwcXdIPnXYwPWISYUyY7/82V3CqrtvaDJdY0QFZEwI7Gs3ovwSR0zDM/J4o0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7016
X-Proofpoint-GUID: FqxcDqQoGeEg85KQg00LyK0SYdRQfCK6
X-Proofpoint-ORIG-GUID: 25vIcSEiiJJBOG-gXiOW-97vN80aO5cc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_11,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406030125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 15:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200262


On 03-Jun-24 20:20, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Wait, did you test this patch locally? What was the outcome?
rust-rustdoc_1.75.0-r0_amd64.deb is generated and the binaries are 
identical.
>
> Alex
>
> On Mon, 3 Jun 2024 at 16:46, Sundeep KOKKONDA via
> lists.openembedded.org
> <sundeep.kokkonda=windriver.com@lists.openembedded.org> wrote:
>> From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>>
>> The rustdoc binaries are differed on their .llvm.<hash> suffixes between the builds.
>> This is a test patch to verify the PGO effect on rustdoc binaries. The issue discussion is here:
>> https://internals.rust-lang.org/t/rustdoc-binary-is-not-reproducible/20027
>>
>> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/reproducible.py | 2 --
>>   meta/recipes-devtools/rust/rust_1.75.0.bb    | 4 ++++
>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
>> index 97a9c3da90..80e830136f 100644
>> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
>> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
>> @@ -16,8 +16,6 @@ import os
>>   import datetime
>>
>>   exclude_packages = [
>> -       'rust-rustdoc',
>> -       'rust-dbg'
>>          ]
>>
>>   def is_excluded(package):
>> diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
>> index c66c14cc5a..4caa5892e6 100644
>> --- a/meta/recipes-devtools/rust/rust_1.75.0.bb
>> +++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
>> @@ -153,6 +153,10 @@ python do_configure() {
>>       rustc = d.getVar('RUSTC_BOOTSTRAP')
>>       config.set("build", "rustc", e(rustc))
>>
>> +    # Support for the profiler runtime to generate e.g. coverage report,
>> +    # PGO etc.
>> +    config.set("build", "profiler", e(False))
>> +
>>       cargo = d.getVar('CARGO_BOOTSTRAP')
>>       config.set("build", "cargo", e(cargo))
>>
>> --
>> 2.43.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#200260): https://lists.openembedded.org/g/openembedded-core/message/200260
>> Mute This Topic: https://lists.openembedded.org/mt/106463035/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

