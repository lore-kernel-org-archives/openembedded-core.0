Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA60C54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 03:47:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.29463.1711511240018861516
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Mar 2024 20:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TxyN9O3G;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3816dfcd29=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42R3dp7Q015348
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 03:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=Qna6Spq9f3Jz7JkEiZQ4fHE55GbdmA3XuIr+yPlK8SY=; b=
	TxyN9O3Gl5+r86VSqSzCrhKVMmX2EzEJxDDBL+7G3dxoCE7SHWGyvFhj29mhlRUu
	bus9ODHOIz46jLfoWYOIc4rgSu8pvhBDFtlCig9n90afAxn2BlokweMJ3oyULrr/
	ZJmSNX5zHcSwFCM3gWT687I7s7DZ0XZlRCmRuajUGsVyU4tFsHPZubxdeLmbLWUo
	7mdOW/SPDNXtO4zwNmHHrQcvZ06cWDt8F4Lz6aqr/y4LK8sMKF7L8iIHJAsCPkYt
	LyOyySWoX58vmNStEeBi4u7L337EqkVJSoW4TSvKu0EG/XyLj2ioc4HXPXfItdAF
	tkWk+syqekNS3YrhWdZRtg==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1p26mq8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 03:47:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTJArSkC5hSGy3KInEqPMNNro+5R2ODN6rpTrxkdOY/I0kM2HKeW/k/Pks6Rje2/K1nK1Ug6rM78nYagZNsenGvgICBPj8dU152BCos4hDBLg7SZyHV+4oykBQ96fEbMqJ3nSX1nhyWTBsIRynq9wA/phlAr/a1lSzBUz8N3TXqL4s9w07nrHxte1ioaGDags36d71JuNtP4mvICZd9KQgQ7t54hkHyGVH/YqTzfBkYPM98cSt793DWbt7vajJd8mmRvwnbdsiWvJ53OSGNgJ17Cz3Y5qo+uCIG2m+fvM1ci5BI3fLAzbzVsNcBAuEaVR/jRmJnhpBIPZw94hLqJ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qna6Spq9f3Jz7JkEiZQ4fHE55GbdmA3XuIr+yPlK8SY=;
 b=fjTA1U5Vcczz64pyjrWNqlk0zCi5sbB5Ue/bJ9+KMiiitSpJbKEPZxFyqJIkIwbPNQ/i+5VU68kzFEfOfJ1CHl0icd70Y2dB0OU7fhMizZi4hozwRaX0cqv9TN+zBBJCJvyqehkP7DRk6oZpEeFv/JJYUm5spWReqz8+ED852/6iHZh22W4ac5ChdmCdGQBajSqdKN0oobKuKf4afjmRFhuGGDliYTduP3IlpzVR5HGBpHNSauLigkKfB7CH6N0B09OBmHQ+3YcKX6E7LpaXYa0vnI7PlUfpBasc7+JOI7HZH5wsG9kuVM7UYqooxM/20BhogL4DrxIn1l0925FFzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4732.namprd11.prod.outlook.com (2603:10b6:303:2c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 03:47:16 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%5]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 03:47:16 +0000
Message-ID: <e5738101-43ba-1a6b-b064-f87c1a5320d4@windriver.com>
Date: Wed, 27 Mar 2024 11:47:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH V2] ovmf: set CVE_PRODUCT and CVE_VERSION
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <17BA1A717836D800.29618@lists.openembedded.org>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <17BA1A717836D800.29618@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYWP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW3PR11MB4732:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+qVU5GNidVCzkzUc6vQ7pfGVZ3/l0E6vkbtgS8JGP2/7lNxxJHxMCHP1krjBoO1+Uc17Lb5nuBPr3UHUEqiZmyLTpmfoCEobNoEazco3ga3+sCSQNqPotzAS6zAtNiRvX44duOldIm5lDzolKZKesBZgATM0s0EsQRBs316d3gNlEvnAdT1r9XMVYjpg4OqJGSXfDTM9YKb5D5dW+gWw8y+6bBOseWGS/AEIa+60Moib9StTqA2oyBu7htqobIJKeQcnC+UGT99zQlqX1HkVfXWchUamW0LLPKVIlRfquNRwSyojmGU97VXZkEYvVx4GpAVOaKt9rAEz6TuIk2/uXleZX8433DgU4BM5j6w2UOQ10zriKgI9TsQuTDPpP/9RmkvbKPdNeweGdore9zXBD+YslB9QpMTnImxIe1wcvD/gUyXvyk1IqyFv9dWKxTSbEGnjwf4TMLRR0Dah6yvYdKtnp7LI7oaYQAaR8WGsP68qgzGgxbz1vv+BQh6S12xJSJkdNXoBIPJ/lszV5YFZPC0kyfWJXGwB3lx3w+tivLliT+GZMJRF0NF4jFNtfh768p9+LstFkIdAeZg1Ztd5j5N6vPW5dQOuZBDLWcv64UE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Um1VYXhsWkF0NTFEUk9mYlhVRkZ2clZXS2dqVHpCMnVvOEl5RHFBZTFmNmN2?=
 =?utf-8?B?amFlbXdFY21vWWlUU2pibEU0aUlwS0MwUkZ0MDhldUIyNWFheVY0UlRYOTBB?=
 =?utf-8?B?RW9MUjl4Z0JlYXpEaUVWQkFLNExacmFUYjkrdXJNQk5Pa0VUMDc4MXhXL0dU?=
 =?utf-8?B?L29PTFlFUnNQM1dmQVlBUGVDaU00elhtcTAzQzBvczVRZ2tJdTBwaStMRmxt?=
 =?utf-8?B?WE0zclhhSGltUENTZzdFNDFRUXlEbFliM2dXcnp6MmpzdDNjQk1oRGU1alIr?=
 =?utf-8?B?RlBPR3BmeFMzanZMb3dGcjY3OXFOd2xFZXNGV2hTeG5WM1lXaktPSktDeFFy?=
 =?utf-8?B?TUxCbUlRejR6aUthbTJDdjdFOE1FOTV1L1o1VVFiSDNGMFZVZ2ZwRWozV05n?=
 =?utf-8?B?UnBlUVFGb1c1c1JDY0lVVUphSWRTTWIrdnd5UWJwcUhlMThTM25iODFGSWZH?=
 =?utf-8?B?RnhHcnpxY3R3MHVPSnNwbm01SVQyaWRsYnZ5Sm9RRWJlVlhkZ2dTTUR4d0pF?=
 =?utf-8?B?YlIyL3h5UnZ3bUxDRmx3bVI5L1NMSGJZbE1ycGtMVVZxUXEwQ21lZktuMlox?=
 =?utf-8?B?eDg0ZVhHKzNwdE9Ia2lsS0Y4S21HSUJTcEZKNGRkaFFpREMzWXdWUGNRS2Rm?=
 =?utf-8?B?K1d6dklKb2ZDYXMzckU5VFdlaDhGeHRhRWMrdG5ZM0VGdzhQb3lKZVdWS2Zz?=
 =?utf-8?B?STJNcGR3MHFFTGtWWit4QkliYm9oaTl4TTczcWJSQUxkUmd2V0VDNlhKMmN4?=
 =?utf-8?B?MkNPNHpRSWxiczM0OHI5ZE1RR3FDOW9Fd3VxNjB5ckNqUDhQaTFVVE9saTV6?=
 =?utf-8?B?N0tKWktlYVM5NUhNdzZMNERBMHVGd0ZnMGR4NmJxbXlQZ1RNVS9YR2o0Z3lw?=
 =?utf-8?B?TU9paERra2RadTd2NUhnQURqMHl4SG42VnpyMmhmQ0xBVzkrSXI1dCsyL0lk?=
 =?utf-8?B?ek8xdHY2RzVSV20yUHVFaVJwV3I1ZEt1NFMzSStUcnpWblpncHppKy8xcXph?=
 =?utf-8?B?ZndPYTVFVkhKZldoSk9LTlJuUTh4YXREdC9mTGV6N1hJTGFtSTZJTXJUZnV5?=
 =?utf-8?B?UzNpNkdUd2h2TzVoSU54U2hTRGxmS2hlQk82ZmFyYTR0VW53MkRmSDVDbGZH?=
 =?utf-8?B?OEZRN0FZcGFUMUd4Wm5BSlo0UXFtZ2loWGF1VlF5Zk1Ca1ZTY0dieTB2NFE4?=
 =?utf-8?B?b3Rnc29sOVE0eG5ZT1RQZWxZazBKaloxRUQyeENScWl3YVhMWkYwNlZVdWFG?=
 =?utf-8?B?RXRFcEFIQnNPbGllUXhtaFF2QU1OQVloRWxPTnlXb1BXbFo4bWwyK0ZBaUxy?=
 =?utf-8?B?VkhBN1VVeXhvMFFYcFYwOG1FVXRWbldvRm1SUjdoRzFhRVFydE9XRHkxR05y?=
 =?utf-8?B?bXFaRkhuZ0gzdWJoMXBZZVRxYkNsb2pBMHpmZjBjQTNlRWtFcW9xK0Y3a1JD?=
 =?utf-8?B?ZEJ5SmdNcUorSDhaTHhDR2lSaWpIL0dPRVFMR0RobTNsK3VTTi9jVWx5eExn?=
 =?utf-8?B?ODVLdTM4Q3BuMThQKy9lZVkvNFZBNDhKR1FCVWpxRkNMejNJT1VVdGYxK1ZB?=
 =?utf-8?B?dEJYa1RXZnllS0d5Yk5lMWFXaURXN2cySDJVY2M5V00rN1NTQ3pTd01ReVgr?=
 =?utf-8?B?NjZsSFpDWU5SbFNCbTVjQnBCaS84eHo5cnIwbndmMTJ0T3NRaXM0L2NRMnNJ?=
 =?utf-8?B?WDJIeWh6NWhKMGl2Tjh6WE9GMWw1aE5YWlF1YStWM0pJWU8zaW5JWXN5bXJ6?=
 =?utf-8?B?cmcwZS9Yb1Jrc0QxenRLMFMxWGNQVld6MDVvdUlVTTQxemlGMUptMEtKa3dp?=
 =?utf-8?B?STZLQ2JybUtRMHI1blBkdmlWNiswYmR5UWFOWmxqWHJwaVAyNEdvZ0d5SEhM?=
 =?utf-8?B?WDZ5QnZwajNxdW1Ybkp2SmtMelZKSi9DREhFT1JFa0FuekhzTVp2Yzg3L1Nv?=
 =?utf-8?B?QkF6U0lqakwwYytQV2lsMFU5eTN0SEh1cVlFNlpsd2l1WTZYUWwzdmFTelZ5?=
 =?utf-8?B?MEZUbHV2S05PZmJGa244QnR0ckgvV0N6eEt3TCtML3hWQnYvdkMvd0FPakR4?=
 =?utf-8?B?aHk5MlV0YmFKTXgwWmF0Zm5FSUF1UkhoZkNjalNSSjZRZS9vRFhwZDNWUXlq?=
 =?utf-8?Q?ZWqU3oq31ta7V0jD0uNt+Hf+1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cef6ded-cb0f-46da-57a6-08dc4e10984d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 03:47:16.2986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fucN+Ce8fDymiZW/RHhdoQRTap1Tt198DIeX9Ip51Pl8jMZSaS+1LDvyOD4psLlut7v1yEszmc/fFC0SJII11A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4732
X-Proofpoint-ORIG-GUID: 9IK0QKttd7RoPjCDpvXC6w2bmXB2SdmE
X-Proofpoint-GUID: 9IK0QKttd7RoPjCDpvXC6w2bmXB2SdmE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_12,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=815
 impostorscore=0 adultscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403270021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 03:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197547

ping

On 3/6/24 14:54, Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Set CVE_PRODUCT and CVE_VERSION for ovmf. NVD uses 'edk2' and the
> version should be the date only. Here's an example:
> https://nvd.nist.gov/vuln/detail/CVE-2023-45232
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-core/ovmf/ovmf_git.bb | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
> index 3dc031d3b6..5b1353b8e8 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -30,6 +30,9 @@ PV = "edk2-stable202308"
>   SRCREV = "819cfc6b42a68790a23509e4fcc58ceb70e1965e"
>   UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
>   
> +CVE_PRODUCT = "edk2"
> +CVE_VERSION = "${@d.getVar('PV').split('stable')[1]}"
> +
>   inherit deploy
>   
>   PARALLEL_MAKE = ""
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196659): https://lists.openembedded.org/g/openembedded-core/message/196659
> Mute This Topic: https://lists.openembedded.org/mt/104761710/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


