Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BCBC004D4
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 09:32:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11552.1674034336484966075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 01:32:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=fK376Jjy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=038215bab1=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30I9ULMV002549
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 01:32:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=ZJ182FpEqIR1q2PB09HE0PC5jApSuQIlCAWDS6TnhRo=;
 b=fK376JjyEAAz2ImWlNRqSiI377OpZYDPcdXxxMCytS4g3b98QfkJ8FLLkutGEimpOR+K
 6I1Spu4uvb4A7KUSYDsz09MrduAvX6rNUiM3t12BBfC6IU6uFpS3rs8YacblmmqfSpgl
 PC20WGE6wIJHyjCXBFoxh0kK01ZsyYry4WYSlBDmZU2YbKIGZzpDfdtUTowVXJFd6gVf
 WwQpfzMsWhkmL2W2eqQhyoGKlEHDdsVl2hYuOoybtGQH4MGKOOYi4Fvaztaxfd7d/WVQ
 PG0yWJRRY5Y1TsfFHHJRzsDzSBiqTST3FUXmVWSTF51J8Lqa2yqPF4AiXWFw3YXZzgUD tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3vsqbfne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 01:32:15 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30I9WFTg004377
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 01:32:15 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3vsqbfnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jan 2023 01:32:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtlwiWjtegYgl3OnjjZ788wOro7+nM/MyOr9fUehNC1y+fMr5Jbf0pPcQ1DJ39/nFyMudvJb/VA9di0V8d9DT/GFCjob70U1fiwoZsKeyltuD/aqdzeVsnslYFsWwBmbFHTqW1fzjCluly7y8P7A3/+kWj2s+josI2GQeTB5rahuWIbjqR8JnfN/MnsUg0YIqKixAWB9YWZ3ldn3AuVUGUY00+dTcqflTktxTFYtQahFJYRsW4PNuGfE6E9A9yJ4B7eKKYjDqhw1t1jg8yLVYMs9UrTmrQ80kailQeSz7iifA8ZSoM1Qd5GSRZV0elcz7Jca9nFW1EjF9B/2Rp6eTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJ182FpEqIR1q2PB09HE0PC5jApSuQIlCAWDS6TnhRo=;
 b=L8bQ2ZeF6diG76OmZ+XA1qBmmM9UFnH5KW2/950Dw8ZJwkedJ4YPtyO1c3LLwFNoMLTCiUmplOKrYIjvJkv2Ho447rU0LgLPiHeeeAa+1rchRfhI1+ZI9jz33sb+ZVJPh8O1cTdQ43LcmOjqTaaQSdQ0U/i4N/3g+vCGup5Hs+3AS2XUOwMSdtaLXECNcmyzmgoVdJvlXbhppvtJJndLvXRtWKB75pOEbXRutHwJzPjpQww9PQUZgkqjwkYe8ED//zG4x5DIEI8MRPvSoign0PGAMmCuzJsTZ0RdkqVm7Y+N5dduF2nTgE02ASwQENjGLfM3jpS5w8ql+MoihLIZ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 DM8PR11MB5669.namprd11.prod.outlook.com (2603:10b6:8:36::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.24; Wed, 18 Jan 2023 09:32:12 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::8397:585:1500:c7f1]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::8397:585:1500:c7f1%7]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 09:32:12 +0000
Content-Type: multipart/alternative;
 boundary="------------kVqKwKwo5nMkgW00TeLy0ZbQ"
Message-ID: <f6b4672d-5c0e-2119-0364-24b2560be261@windriver.com>
Date: Wed, 18 Jan 2023 17:32:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH] mesa: update submitted patch with backported
 version
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <173AD3C1BA38F444.23170@lists.openembedded.org>
 <CA+chaQfkZ4XT5doXmjdASfeoVs6RNzUjCQxATKOdOkOgcgr06A@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CA+chaQfkZ4XT5doXmjdASfeoVs6RNzUjCQxATKOdOkOgcgr06A@mail.gmail.com>
X-ClientProxiedBy: BYAPR11CA0055.namprd11.prod.outlook.com
 (2603:10b6:a03:80::32) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|DM8PR11MB5669:EE_
X-MS-Office365-Filtering-Correlation-Id: 5907ed20-30ff-431c-f4b1-08daf936e0bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tKnPwk6+58eEVjrvP2Wu9wNTEKm89kDyrgYKh7sqahvlExDixX9ZpmLGO/f4YzagIvQFtYvkNlhDTI7k+oxWipA33FK48sD2ObRMb5+sk9xQi/f/GmSUXL/ESRq2YrVsoL5qLybnMR/ruooWDQFTlb8iGQERTG59r78QvNOTSmcOMgJ0hVH4LCdNFW5AVTiqEfMPNT9uEi8xKx6CMeQ+6LaNK6qLjeYo1pYBtyz8pL0Ojd+gfveR/mVQxnEm2WEb8QP1nkD6+eSbv2EwdWWstOemt4FNlcaC5XPDUJ4iHLOUFwrwTcfkQfZd0QeeyTbxBIf3qAGBxAwNgCbc6kfBJUyYx9AzS3SLZvCjwy+tKiH3OvXb2B2EjiUW+ZsfnJZ3GJRxN7gWOsVcppKckswwQCCoRI/QV3Sa8lzTbmlqxo/DVoKksibY+73hD+C55+3NZDusHhch1rP7g1vueqCIGPiFizdR2R3XlU9IVhbz8sPIFW9bMdQvF199etkMfOYe+g42u/njBiJICTVW93VkWGIUZZ3iAYwIejqfrDKjsbQE9Oxl21Kzc0UE9bpDQW3iMz3Bsh9vyP06hQ5Mg3PSz3SoLFG8HyK6qduW7YK14RZ8NLEDVcY/V7ClR4e5kuFUJhQ+bnGgklnn5PH+IuwH6Da4dEbzGtXJgi6ANm1ZRcsTQI2fsIMlRTCoAjAEH250tI9/Eqb54OYVxiejTOMRebkRpO3tMO7q6dy2Zwyz9EMvlUkjcA9OykcbivbKq0L1lc7b5jLszjqE10u2JtdHJ1Ln43rCjxBLGIALY6Axqj8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39850400004)(396003)(346002)(366004)(451199015)(66899015)(31686004)(86362001)(2906002)(30864003)(15650500001)(66556008)(66476007)(66946007)(8936002)(5660300002)(166002)(31696002)(38100700002)(316002)(6666004)(33964004)(53546011)(6486002)(966005)(6506007)(478600001)(36756003)(41300700001)(8676002)(4326008)(6916009)(186003)(6512007)(26005)(83380400001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RXBxMzdyS2wyL1FvUHJUcTBkQlNmVmpDdWdPNEpGbDd1UjB2ekEzYmNOMXJ2?=
 =?utf-8?B?OWtDc0cwR0pDcXp0ZCtoUWlOTmFTTlBxTmNvc0plaHczNkV6dy9WV1NudTVS?=
 =?utf-8?B?MnZ0d0JhRkNYc2UyT1VpSXdYdCtYK0JTbnQ3d2JJQ2RtK2loYjZNR2JneUpM?=
 =?utf-8?B?SjZ2RVM4SXhKUldxaE9mWG9UR3l0elBIdi9ra2RUeHg4dDUyUGYrSUF2WmJ6?=
 =?utf-8?B?TDBjMmo5bStEdko1ZE5ZOGZCbFphNUNtVC9FS0thaVpMVDdPWWRTVlBCZ2Q0?=
 =?utf-8?B?d2Jjc1RuWkU2WHNEQVdvdFEwUUtkQlhDVlE4VDgxcGdBNUpnYWZyQ0N6WnlV?=
 =?utf-8?B?dUxhaHU3WUl3SUIzTnlhOVhpL1VjK3E1V0ErVmpXemd1YTRON2NGdnFtcGwx?=
 =?utf-8?B?VG9FM2tNeXdIaFVISDhpc2pLMTl0S3RVMlFSUnFMQlVhU2pTNGlTY3pUZFV1?=
 =?utf-8?B?WW5EWC9FRWZxaCszUE1qcG82Y1NnL3hhVEZhU3hHQ2VSaVNOSnlVYVFvTmU5?=
 =?utf-8?B?RUFjeDBXQ3VqZDBLeEdrVkM4NWI2dGRTLzRERzFiMlpJZHViMzZ5OVYvUzJm?=
 =?utf-8?B?VDVyTU9oSjU4REp3cHZRYVRuSjUyUmx2ZUdqUWlIb0JYZVBYZnk0WitEdmUr?=
 =?utf-8?B?SmpLZmM2UER3SXZuMkVnQTFrQWFvM0lEbnRQcEtLM2ZrSlNTRHNRbzlZRnVZ?=
 =?utf-8?B?alFFTnM3V2ZaZ1FqYm1Kak5pMUtiN2FjK2ZpMjFnc1FOU0Jkb3lMMnZuS2hK?=
 =?utf-8?B?R1Z4MS9jVnJnVEpGQk9aOTZhUTEzUEl4WXJjcWpUVTU1YmZQN01wdlMyZ3M3?=
 =?utf-8?B?Q2doNVA1L3dXNUFyOFpWbEQ0ZW5ZOE5WKy9Wc3l1OXBuM2ZaNlBnYmY5Wjdm?=
 =?utf-8?B?NDNwajY4WEQrSFlKVmRrVmdjMUd3b3A5S2o3UjdiQm1yMXp6ZTA4anVQbVls?=
 =?utf-8?B?dWN1WW9NSzZZUnc4QTNId0ZQUjB3dzVnZ3lzYTZFU2JweXk2NmJFRDYrRnYz?=
 =?utf-8?B?VFh3QjEyYUNWeFRFa0RnNmpmeTZHRDQzZ1Zhd3I4SUxsZWkzNzZVcHpxdVc0?=
 =?utf-8?B?eHhzUDZNT2hydUVuN09xVWFTLzlSTEc2emNqclcvbk9vYlljRCtEcW1MalNO?=
 =?utf-8?B?SENyMTBjNUJkUHNWa0JYMjBxSERQM2lEWGtOV3hvNzhDd1c1VWhabDBLQTNG?=
 =?utf-8?B?a2wzR3QwZmFuRk1sdkFJWldhd1ZvSWRudWIrRkV5MWZ6cGF1RndiQVJ2QlVa?=
 =?utf-8?B?dzM0cG8rWWhXWlBwem8zUEFaY1FZVnlvbFlreUZqRFRJMDZuZEl1L3RNUXRH?=
 =?utf-8?B?eTBBVnI1T01kWVcrVVpZSTZTOWgwM3c4aVVpeFcrTUhRUStycmtoYUZxaXky?=
 =?utf-8?B?WDR0NisyMTdhVzBmSjlXeCsyeWovY2xUV1p0ZkV1c0pGTWVOQWZkNk9rWVZq?=
 =?utf-8?B?OGVYY0x3UURhNWpRVStaNTl2RmRhQTdjcUcrN282ellMKzdTZGZVL2syYzRi?=
 =?utf-8?B?QjI3MTJ5NzFnbEVHRkk5TVlQb3ByRTBtVFAxOEZTbDhNUXVzUk8welE2dFJW?=
 =?utf-8?B?ZjhqaDdEcno0ZlRJQ2lpYTczc2hFNlRjTWtQeFRYQm95NzRRMkV5dk5lVnlL?=
 =?utf-8?B?czJrYXlkSjlpZzRFUmpzcXlZMWc2S01NSTNybksxZDI3MHBkZXdWZEplcE1o?=
 =?utf-8?B?eDJQMjVTbFZzQkR6SnJ5UVR2TWRjcmYrTjlOVDN3T0tIQjQvc0xQY1M3azQ1?=
 =?utf-8?B?NDFVaXlucklCemNIbDRCcWxhNTRIKzJjTmg1RmhFSHBwQng3bWRBSlVsN0VM?=
 =?utf-8?B?TGE1VGVUdlNEVTdSTHM2ckMwUDR5Sk9FMys4ZHFpRXdvVWFVeHlqTzBwNE5m?=
 =?utf-8?B?NnRvTWp4emhPZVkxZ04yamZ1VzQ2RnltSEFDZm5sZW9xRndTbkI2NktENndk?=
 =?utf-8?B?VmhoaSsxcFkxeW9RK0U1WGZMc2RzemI0Q1JBOVA2MjQvWlZGS3B5bGYrV2Vl?=
 =?utf-8?B?MmkyWU8wNTRhelRQQkErK2VIcHMra0IrZkljdlRRMXQrV2pselNzUnMvL1R5?=
 =?utf-8?B?VzBJMG1SMzhRU2ZxbUROREsxN2xwS1BTTGdzQlAwQ1l1bXFQanpGd0hZcDV4?=
 =?utf-8?Q?1pnEiTmOyYAx9mCq1kOVkvMA+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5907ed20-30ff-431c-f4b1-08daf936e0bb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 09:32:12.2185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1H3PAoeDqFbVW4+tKKiy0RIjiyJQqqwZthwm3OE4fdlipSyIP+8o4ypoAxkQMy6PIPM/Rs8Q6U2LUrlHQ2HeEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5669
X-Proofpoint-GUID: x_zhTvGX_-MH5d3VtIY1GV6AGlvAKoqq
X-Proofpoint-ORIG-GUID: FjReH5RKSLxxlpKUlJSvCR4bk88ny7H2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_04,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301180082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 09:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176081

--------------kVqKwKwo5nMkgW00TeLy0ZbQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 30I9ULMV002549

On 1/16/23 23:33, Martin Jansa wrote:
> Kai: can you please test it on ubuntu-18.04?

Hi Martin,

It works for me with & without DEBUG_BUILD on ubuntu-18.04.6(gcc 7.5.0).

Regards,
Kai

>
> I've tested it with DEBUG_BUILD in native and target build on a host=20
> with new toolchain (gentoo with gcc-12.2.1) and according to=20
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439=20
> <https://urldefense.com/v3/__https://gitlab.freedesktop.org/mesa/mesa/-=
/merge_requests/17439__;!!AjveYdw8EvQ!d1I0Oop5Q1K7nA2qwulHGN9mgP7ofnN-EUU=
ea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_ChByclpNB_Q$>=20
> it works with old toolchain as well.
>
> On Mon, Jan 16, 2023 at 4:30 PM Martin Jansa via=20
> lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!d1I0Oop5Q1K7nA2qwulHGN9mgP7ofnN-EUUea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9=
aAW5Cz_ChByW1_uzh4$>=20
> <Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:
>
>     * this version was merged to main in:
>     https://gitlab.freedesktop.org/mesa/mesa/-/commit/267dd1f4d571ee606=
141aa66f1665aa152b4e911
>     <https://urldefense.com/v3/__https://gitlab.freedesktop.org/mesa/me=
sa/-/commit/267dd1f4d571ee606141aa66f1665aa152b4e911__;!!AjveYdw8EvQ!d1I0=
Oop5Q1K7nA2qwulHGN9mgP7ofnN-EUUea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_C=
hBy7EjBk3I$>
>     =C2=A0 and cherry-picked to staging/23.0 as well in:
>     https://gitlab.freedesktop.org/mesa/mesa/-/commit/54cfb552abc50e816=
7cdc46d87455a9a414d7c65
>     <https://urldefense.com/v3/__https://gitlab.freedesktop.org/mesa/me=
sa/-/commit/54cfb552abc50e8167cdc46d87455a9a414d7c65__;!!AjveYdw8EvQ!d1I0=
Oop5Q1K7nA2qwulHGN9mgP7ofnN-EUUea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_C=
hBysISDH1Y$>
>
>     =C2=A0 and as a bonus it doesn't break the build with DEBUG_BUILD
>     =C2=A0 for newer toolchain, so we can apply it for target build as
>     well, see:
>     https://lists.openembedded.org/g/openembedded-core/message/169002
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/169002__;!!AjveYdw8EvQ!d1I0Oop5Q1K7nA2qwulHGN9mgP7of=
nN-EUUea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_ChByT2LkadU$>
>     https://lists.openembedded.org/g/openembedded-core/message/170930
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/170930__;!!AjveYdw8EvQ!d1I0Oop5Q1K7nA2qwulHGN9mgP7of=
nN-EUUea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_ChBy4OYfHIk$>
>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>     ---
>     =C2=A0...ove-fix-ALWAYS_INLINE-compiler-error.patch | 81
>     ++++++-------------
>     =C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 5 +-
>     =C2=A02 files changed, 26 insertions(+), 60 deletions(-)
>
>     diff --git
>     a/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS=
_INLINE-compiler-error.patch
>     b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS=
_INLINE-compiler-error.patch
>     index 7989843eb4..1cf23492fe 100644
>     ---
>     a/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS=
_INLINE-compiler-error.patch
>     +++
>     b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS=
_INLINE-compiler-error.patch
>     @@ -1,67 +1,36 @@
>     -From da6e47f1717f34c73de388c56ffaf4861a07fdc5 Mon Sep 17 00:00:00
>     2001
>     -From: t bettler <thomas.bettler@gmail.com>
>     -Date: Sat, 9 Jul 2022 09:28:51 +0000
>     +From 267dd1f4d571ee606141aa66f1665aa152b4e911 Mon Sep 17 00:00:00
>     2001
>     +From: t0b3 <thomas.bettler@gmail.com>
>     +Date: Sat, 10 Dec 2022 14:32:53 +0100
>     =C2=A0Subject: [PATCH] nir/nir_opt_move: fix ALWAYS_INLINE compiler=
 error
>     -MIME-Version: 1.0
>     -Content-Type: text/plain; charset=3DUTF-8
>     -Content-Transfer-Encoding: 8bit
>
>     -Backport merge request to fix mesa compile error when debug build
>     -enabled.
>     -
>     -Upstream-Status: Submitted
>     [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439
>     <https://urldefense.com/v3/__https://gitlab.freedesktop.org/mesa/me=
sa/-/merge_requests/17439__;!!AjveYdw8EvQ!d1I0Oop5Q1K7nA2qwulHGN9mgP7ofnN=
-EUUea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_ChByclpNB_Q$>]
>     -
>     -Signed-off-by: Kai Kang <kai.kang@windriver.com>
>     -
>     -MIME-Version: 1.0
>     -Content-Type: text/plain; charset=3DUTF-8
>     -Content-Transfer-Encoding: 8bit
>     -
>     -fix call to =E2=80=98always_inline=E2=80=99 =E2=80=98src_is_ssa=E2=
=80=99
>     -
>     -Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/6825
>     <https://urldefense.com/v3/__https://gitlab.freedesktop.org/mesa/me=
sa/-/issues/6825__;!!AjveYdw8EvQ!d1I0Oop5Q1K7nA2qwulHGN9mgP7ofnN-EUUea_iv=
sroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_ChByYbcOI8M$>
>     -Fixes: f1d20ec67c3f186886b97de94f74484650f8fda1
>     ("nir/nir_opt_move: handle non-SSA defs ")
>     +Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
>     +Reviewed-by: Adam Jackson <ajax@redhat.com>
>     +Closes: #6825
>     +Fixes: f1d20ec6 ("nir/nir_opt_move: handle non-SSA defs ")
>     +Part-of:
>     <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439
>     <https://urldefense.com/v3/__https://gitlab.freedesktop.org/mesa/me=
sa/-/merge_requests/17439__;!!AjveYdw8EvQ!d1I0Oop5Q1K7nA2qwulHGN9mgP7ofnN=
-EUUea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_ChByclpNB_Q$>>
>
>     +Upstream-Status: Backport
>     [https://gitlab.freedesktop.org/mesa/mesa/-/commit/267dd1f4d571ee60=
6141aa66f1665aa152b4e911
>     <https://urldefense.com/v3/__https://gitlab.freedesktop.org/mesa/me=
sa/-/commit/267dd1f4d571ee606141aa66f1665aa152b4e911__;!!AjveYdw8EvQ!d1I0=
Oop5Q1K7nA2qwulHGN9mgP7ofnN-EUUea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_C=
hBy7EjBk3I$>]
>     =C2=A0---
>     - src/compiler/nir/nir_inline_helpers.h | 10 ++++++++--
>     - src/compiler/nir/nir_opt_move.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 2 +-
>     - 2 files changed, 9 insertions(+), 3 deletions(-)
>     + src/compiler/nir/nir_opt_move.c | 4 ++--
>     + 1 file changed, 2 insertions(+), 2 deletions(-)
>
>     -diff --git a/src/compiler/nir/nir_inline_helpers.h
>     b/src/compiler/nir/nir_inline_helpers.h
>     -index 125dd8a..ec33f05 100644
>     ---- a/src/compiler/nir/nir_inline_helpers.h
>     -+++ b/src/compiler/nir/nir_inline_helpers.h
>     -@@ -73,8 +73,8 @@ nir_foreach_dest(nir_instr *instr,
>     nir_foreach_dest_cb cb, void *state)
>     -=C2=A0 =C2=A0 return _nir_foreach_dest(instr, cb, state);
>     - }
>     -
>     --static inline bool
>     --nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void
>     *state)
>     -+static ALWAYS_INLINE bool
>     -+_nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void
>     *state)
>     - {
>     -=C2=A0 =C2=A0 switch (instr->type) {
>     -=C2=A0 =C2=A0 case nir_instr_type_alu: {
>     -@@ -162,3 +162,9 @@ nir_foreach_src(nir_instr *instr,
>     nir_foreach_src_cb cb, void *state)
>     -=C2=A0 =C2=A0 dest_state.cb =3D cb;
>     -=C2=A0 =C2=A0 return _nir_foreach_dest(instr, _nir_visit_dest_indi=
rect,
>     &dest_state);
>     - }
>     -+
>     -+static inline bool
>     -+nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void
>     *state)
>     -+{
>     -+=C2=A0 =C2=A0return _nir_foreach_src(instr, cb, state);
>     -+}
>     =C2=A0diff --git a/src/compiler/nir/nir_opt_move.c
>     b/src/compiler/nir/nir_opt_move.c
>     -index 81bcde5..051c3cc 100644
>     +index 81bcde5c436..9aeb9f4cf86 100644
>     =C2=A0--- a/src/compiler/nir/nir_opt_move.c
>     =C2=A0+++ b/src/compiler/nir/nir_opt_move.c
>     -@@ -60,7 +60,7 @@ src_is_ssa(nir_src *src, void *state)
>     - static ALWAYS_INLINE bool
>     - instr_reads_register(nir_instr *instr)
>     +@@ -51,13 +51,13 @@
>     +=C2=A0 * lower register pressure.
>     +=C2=A0 */
>     +
>     +-static ALWAYS_INLINE bool
>     ++static inline bool
>     + src_is_ssa(nir_src *src, void *state)
>     =C2=A0 {
>     --=C2=A0 =C2=A0return !nir_foreach_src(instr, src_is_ssa, NULL);
>     -+=C2=A0 =C2=A0return !_nir_foreach_src(instr, src_is_ssa, NULL);
>     +=C2=A0 =C2=A0 return src->is_ssa;
>     =C2=A0 }
>
>     - static bool
>     +-static ALWAYS_INLINE bool
>     ++static inline bool
>     + instr_reads_register(nir_instr *instr)
>     + {
>     +=C2=A0 =C2=A0 return !nir_foreach_src(instr, src_is_ssa, NULL);
>     diff --git a/meta/recipes-graphics/mesa/mesa.inc
>     b/meta/recipes-graphics/mesa/mesa.inc
>     index 5fdb67ca2a..866b7fc462 100644
>     --- a/meta/recipes-graphics/mesa/mesa.inc
>     +++ b/meta/recipes-graphics/mesa/mesa.inc
>     @@ -18,11 +18,8 @@ SRC_URI =3D
>     "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz
>     <https://urldefense.com/v3/__https://mesa.freedesktop.org/archive/m=
esa-$*7BPV*7D.tar.xz__;JSU!!AjveYdw8EvQ!d1I0Oop5Q1K7nA2qwulHGN9mgP7ofnN-E=
UUea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_ChByN8-ENrs$>
>     \
>     file://0001-meson.build-check-for-all-linux-host_os-combinations.pa=
tch
>     \
>     file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
>     file://0001-util-format-Check-for-NEON-before-using-it.patch \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${NATIVE_PATCHES} \
>     +
>     file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch=
 \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>     -NATIVE_PATCHES ?=3D ""
>     -# required by mesa-native on Ubuntu 18.04 with gcc 7.5 when
>     DEBUG_BUILD enabled
>     -NATIVE_PATCHES:class-native =3D
>     "file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patc=
h"
>
>     =C2=A0SRC_URI[sha256sum] =3D
>     "bed799788bf2bd9ef079d97cd8e09348bf53cb086818578e40773b2b17812922"
>
>     --=20
>     2.39.0
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#175996):
>     https://lists.openembedded.org/g/openembedded-core/message/175996
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/175996__;!!AjveYdw8EvQ!d1I0Oop5Q1K7nA2qwulHGN9mgP7of=
nN-EUUea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_ChByuuFtNn4$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/96308437/3617156
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/9630=
8437/3617156__;!!AjveYdw8EvQ!d1I0Oop5Q1K7nA2qwulHGN9mgP7ofnN-EUUea_ivsroO=
0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_ChBynxgHZrw$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!d1I0Oop5Q1K7nA2qwulHGN9mgP7ofnN-EUUea_=
ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_ChByHCJTpEs$>
>     [Martin.Jansa@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
Kai Kang
Wind River Linux

--------------kVqKwKwo5nMkgW00TeLy0ZbQ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 30I9ULMV002549

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 1/16/23 23:33, Martin Jansa wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQfkZ4XT5doXmjdASfeoVs6RNz=
UjCQxATKOdOkOgcgr06A@mail.gmail.com">
     =20
      <div dir=3D"ltr">Kai: can you please test it on ubuntu-18.04?</div>
    </blockquote>
    <p>Hi Martin,</p>
    <p>It works for me with &amp; without DEBUG_BUILD on
      ubuntu-18.04.6(gcc 7.5.0).</p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQfkZ4XT5doXmjdASfeoVs6RNz=
UjCQxATKOdOkOgcgr06A@mail.gmail.com">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>I've tested it with DEBUG_BUILD in native and target build
          on a host with new toolchain (gentoo with gcc-12.2.1) and
          according to&nbsp;<a href=3D"https://urldefense.com/v3/__https:=
//gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439__;!!AjveYdw8EvQ=
!d1I0Oop5Q1K7nA2qwulHGN9mgP7ofnN-EUUea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW=
5Cz_ChByclpNB_Q$" moz-do-not-send=3D"true">https://gitlab.freedesktop.org=
/mesa/mesa/-/merge_requests/17439</a>
          it works with old toolchain as well.</div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 16, 2023 at 4:3=
0
          PM Martin Jansa via <a href=3D"https://urldefense.com/v3/__http=
://lists.openembedded.org__;!!AjveYdw8EvQ!d1I0Oop5Q1K7nA2qwulHGN9mgP7ofnN=
-EUUea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_ChByW1_uzh4$" target=3D"_bla=
nk" moz-do-not-send=3D"true">lists.openembedded.org</a>
          &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedd=
ed.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-=
freetext">gmail.com@lists.openembedded.org</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
*
          this version was merged to main in:<br>
          &nbsp; <a href=3D"https://urldefense.com/v3/__https://gitlab.fr=
eedesktop.org/mesa/mesa/-/commit/267dd1f4d571ee606141aa66f1665aa152b4e911=
__;!!AjveYdw8EvQ!d1I0Oop5Q1K7nA2qwulHGN9mgP7ofnN-EUUea_ivsroO0Ks1bU1j3VJq=
ZuTQ0X2H5ycY9aAW5Cz_ChBy7EjBk3I$" rel=3D"noreferrer" target=3D"_blank" mo=
z-do-not-send=3D"true">https://gitlab.freedesktop.org/mesa/mesa/-/commit/=
267dd1f4d571ee606141aa66f1665aa152b4e911</a><br>
          &nbsp; and cherry-picked to staging/23.0 as well in:<br>
          &nbsp; <a href=3D"https://urldefense.com/v3/__https://gitlab.fr=
eedesktop.org/mesa/mesa/-/commit/54cfb552abc50e8167cdc46d87455a9a414d7c65=
__;!!AjveYdw8EvQ!d1I0Oop5Q1K7nA2qwulHGN9mgP7ofnN-EUUea_ivsroO0Ks1bU1j3VJq=
ZuTQ0X2H5ycY9aAW5Cz_ChBysISDH1Y$" rel=3D"noreferrer" target=3D"_blank" mo=
z-do-not-send=3D"true">https://gitlab.freedesktop.org/mesa/mesa/-/commit/=
54cfb552abc50e8167cdc46d87455a9a414d7c65</a><br>
          <br>
          &nbsp; and as a bonus it doesn't break the build with DEBUG_BUI=
LD<br>
          &nbsp; for newer toolchain, so we can apply it for target build=
 as
          well, see:<br>
          &nbsp; <a href=3D"https://urldefense.com/v3/__https://lists.ope=
nembedded.org/g/openembedded-core/message/169002__;!!AjveYdw8EvQ!d1I0Oop5=
Q1K7nA2qwulHGN9mgP7ofnN-EUUea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_ChByT=
2LkadU$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">ht=
tps://lists.openembedded.org/g/openembedded-core/message/169002</a><br>
          &nbsp; <a href=3D"https://urldefense.com/v3/__https://lists.ope=
nembedded.org/g/openembedded-core/message/170930__;!!AjveYdw8EvQ!d1I0Oop5=
Q1K7nA2qwulHGN9mgP7ofnN-EUUea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_ChBy4=
OYfHIk$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">ht=
tps://lists.openembedded.org/g/openembedded-core/message/170930</a><br>
          <br>
          Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@=
gmail.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-li=
nk-freetext">Martin.Jansa@gmail.com</a>&gt;<br>
          ---<br>
          &nbsp;...ove-fix-ALWAYS_INLINE-compiler-error.patch | 81
          ++++++-------------<br>
          &nbsp;meta/recipes-graphics/mesa/mesa.inc&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;|&nbsp; 5 +-<br>
          &nbsp;2 files changed, 26 insertions(+), 60 deletions(-)<br>
          <br>
          diff --git
a/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLIN=
E-compiler-error.patch
b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLIN=
E-compiler-error.patch<br>
          index 7989843eb4..1cf23492fe 100644<br>
          ---
a/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLIN=
E-compiler-error.patch<br>
          +++
b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLIN=
E-compiler-error.patch<br>
          @@ -1,67 +1,36 @@<br>
          -From da6e47f1717f34c73de388c56ffaf4861a07fdc5 Mon Sep 17
          00:00:00 2001<br>
          -From: t bettler &lt;<a href=3D"mailto:thomas.bettler@gmail.com=
" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freete=
xt">thomas.bettler@gmail.com</a>&gt;<br>
          -Date: Sat, 9 Jul 2022 09:28:51 +0000<br>
          +From 267dd1f4d571ee606141aa66f1665aa152b4e911 Mon Sep 17
          00:00:00 2001<br>
          +From: t0b3 &lt;<a href=3D"mailto:thomas.bettler@gmail.com" tar=
get=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">t=
homas.bettler@gmail.com</a>&gt;<br>
          +Date: Sat, 10 Dec 2022 14:32:53 +0100<br>
          &nbsp;Subject: [PATCH] nir/nir_opt_move: fix ALWAYS_INLINE comp=
iler
          error<br>
          -MIME-Version: 1.0<br>
          -Content-Type: text/plain; charset=3DUTF-8<br>
          -Content-Transfer-Encoding: 8bit<br>
          <br>
          -Backport merge request to fix mesa compile error when debug
          build<br>
          -enabled.<br>
          -<br>
          -Upstream-Status: Submitted [<a href=3D"https://urldefense.com/=
v3/__https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439__;!!=
AjveYdw8EvQ!d1I0Oop5Q1K7nA2qwulHGN9mgP7ofnN-EUUea_ivsroO0Ks1bU1j3VJqZuTQ0=
X2H5ycY9aAW5Cz_ChByclpNB_Q$" rel=3D"noreferrer" target=3D"_blank" moz-do-=
not-send=3D"true">https://gitlab.freedesktop.org/mesa/mesa/-/merge_reques=
ts/17439</a>]<br>
          -<br>
          -Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriv=
er.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-=
freetext">kai.kang@windriver.com</a>&gt;<br>
          -<br>
          -MIME-Version: 1.0<br>
          -Content-Type: text/plain; charset=3DUTF-8<br>
          -Content-Transfer-Encoding: 8bit<br>
          -<br>
          -fix call to =E2=80=98always_inline=E2=80=99 =E2=80=98src_is_ss=
a=E2=80=99<br>
          -<br>
          -Closes: <a href=3D"https://urldefense.com/v3/__https://gitlab.=
freedesktop.org/mesa/mesa/-/issues/6825__;!!AjveYdw8EvQ!d1I0Oop5Q1K7nA2qw=
ulHGN9mgP7ofnN-EUUea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_ChByYbcOI8M$" =
rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https://git=
lab.freedesktop.org/mesa/mesa/-/issues/6825</a><br>
          -Fixes: f1d20ec67c3f186886b97de94f74484650f8fda1
          (&quot;nir/nir_opt_move: handle non-SSA defs &quot;)<br>
          +Reviewed-by: Iago Toral Quiroga &lt;<a href=3D"mailto:itoral@i=
galia.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-li=
nk-freetext">itoral@igalia.com</a>&gt;<br>
          +Reviewed-by: Adam Jackson &lt;<a href=3D"mailto:ajax@redhat.co=
m" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freet=
ext">ajax@redhat.com</a>&gt;<br>
          +Closes: #6825<br>
          +Fixes: f1d20ec6 (&quot;nir/nir_opt_move: handle non-SSA defs &=
quot;)<br>
          +Part-of: &lt;<a href=3D"https://urldefense.com/v3/__https://gi=
tlab.freedesktop.org/mesa/mesa/-/merge_requests/17439__;!!AjveYdw8EvQ!d1I=
0Oop5Q1K7nA2qwulHGN9mgP7ofnN-EUUea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_=
ChByclpNB_Q$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439</a>&gt=
;<br>
          <br>
          +Upstream-Status: Backport [<a href=3D"https://urldefense.com/v=
3/__https://gitlab.freedesktop.org/mesa/mesa/-/commit/267dd1f4d571ee60614=
1aa66f1665aa152b4e911__;!!AjveYdw8EvQ!d1I0Oop5Q1K7nA2qwulHGN9mgP7ofnN-EUU=
ea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_ChBy7EjBk3I$" rel=3D"noreferrer"=
 target=3D"_blank" moz-do-not-send=3D"true">https://gitlab.freedesktop.or=
g/mesa/mesa/-/commit/267dd1f4d571ee606141aa66f1665aa152b4e911</a>]<br>
          &nbsp;---<br>
          - src/compiler/nir/nir_inline_helpers.h | 10 ++++++++--<br>
          - src/compiler/nir/nir_opt_move.c&nbsp; &nbsp; &nbsp; &nbsp;|&n=
bsp; 2 +-<br>
          - 2 files changed, 9 insertions(+), 3 deletions(-)<br>
          + src/compiler/nir/nir_opt_move.c | 4 ++--<br>
          + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
          <br>
          -diff --git a/src/compiler/nir/nir_inline_helpers.h
          b/src/compiler/nir/nir_inline_helpers.h<br>
          -index 125dd8a..ec33f05 100644<br>
          ---- a/src/compiler/nir/nir_inline_helpers.h<br>
          -+++ b/src/compiler/nir/nir_inline_helpers.h<br>
          -@@ -73,8 +73,8 @@ nir_foreach_dest(nir_instr *instr,
          nir_foreach_dest_cb cb, void *state)<br>
          -&nbsp; &nbsp; return _nir_foreach_dest(instr, cb, state);<br>
          - }<br>
          - <br>
          --static inline bool<br>
          --nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb,
          void *state)<br>
          -+static ALWAYS_INLINE bool<br>
          -+_nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb,
          void *state)<br>
          - {<br>
          -&nbsp; &nbsp; switch (instr-&gt;type) {<br>
          -&nbsp; &nbsp; case nir_instr_type_alu: {<br>
          -@@ -162,3 +162,9 @@ nir_foreach_src(nir_instr *instr,
          nir_foreach_src_cb cb, void *state)<br>
          -&nbsp; &nbsp; dest_state.cb =3D cb;<br>
          -&nbsp; &nbsp; return _nir_foreach_dest(instr, _nir_visit_dest_=
indirect,
          &amp;dest_state);<br>
          - }<br>
          -+<br>
          -+static inline bool<br>
          -+nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb,
          void *state)<br>
          -+{<br>
          -+&nbsp; &nbsp;return _nir_foreach_src(instr, cb, state);<br>
          -+}<br>
          &nbsp;diff --git a/src/compiler/nir/nir_opt_move.c
          b/src/compiler/nir/nir_opt_move.c<br>
          -index 81bcde5..051c3cc 100644<br>
          +index 81bcde5c436..9aeb9f4cf86 100644<br>
          &nbsp;--- a/src/compiler/nir/nir_opt_move.c<br>
          &nbsp;+++ b/src/compiler/nir/nir_opt_move.c<br>
          -@@ -60,7 +60,7 @@ src_is_ssa(nir_src *src, void *state)<br>
          - static ALWAYS_INLINE bool<br>
          - instr_reads_register(nir_instr *instr)<br>
          +@@ -51,13 +51,13 @@<br>
          +&nbsp; * lower register pressure.<br>
          +&nbsp; */<br>
          + <br>
          +-static ALWAYS_INLINE bool<br>
          ++static inline bool<br>
          + src_is_ssa(nir_src *src, void *state)<br>
          &nbsp; {<br>
          --&nbsp; &nbsp;return !nir_foreach_src(instr, src_is_ssa, NULL)=
;<br>
          -+&nbsp; &nbsp;return !_nir_foreach_src(instr, src_is_ssa, NULL=
);<br>
          +&nbsp; &nbsp; return src-&gt;is_ssa;<br>
          &nbsp; }<br>
          <br>
          - static bool<br>
          +-static ALWAYS_INLINE bool<br>
          ++static inline bool<br>
          + instr_reads_register(nir_instr *instr)<br>
          + {<br>
          +&nbsp; &nbsp; return !nir_foreach_src(instr, src_is_ssa, NULL)=
;<br>
          diff --git a/meta/recipes-graphics/mesa/mesa.inc
          b/meta/recipes-graphics/mesa/mesa.inc<br>
          index 5fdb67ca2a..866b7fc462 100644<br>
          --- a/meta/recipes-graphics/mesa/mesa.inc<br>
          +++ b/meta/recipes-graphics/mesa/mesa.inc<br>
          @@ -18,11 +18,8 @@ SRC_URI =3D &quot;<a href=3D"https://urldefe=
nse.com/v3/__https://mesa.freedesktop.org/archive/mesa-$*7BPV*7D.tar.xz__=
;JSU!!AjveYdw8EvQ!d1I0Oop5Q1K7nA2qwulHGN9mgP7ofnN-EUUea_ivsroO0Ks1bU1j3VJ=
qZuTQ0X2H5ycY9aAW5Cz_ChByN8-ENrs$" rel=3D"noreferrer" target=3D"_blank" m=
oz-do-not-send=3D"true">https://mesa.freedesktop.org/archive/mesa-${PV}.t=
ar.xz</a>
          \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          <a class=3D"moz-txt-link-freetext" href=3D"file://0001-meson.bu=
ild-check-for-all-linux-host_os-combinations.patch">file://0001-meson.bui=
ld-check-for-all-linux-host_os-combinations.patch</a>
          \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          <a class=3D"moz-txt-link-freetext" href=3D"file://0001-meson-mi=
sdetects-64bit-atomics-on-mips-clang.patch">file://0001-meson-misdetects-=
64bit-atomics-on-mips-clang.patch</a>
          \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          <a class=3D"moz-txt-link-freetext" href=3D"file://0001-util-for=
mat-Check-for-NEON-before-using-it.patch">file://0001-util-format-Check-f=
or-NEON-before-using-it.patch</a> \<br>
          -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${NATIVE_PATCHES} \<b=
r>
          +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://0001-ni=
r-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch">file://0001-nir-ni=
r_opt_move-fix-ALWAYS_INLINE-compiler-error.patch</a>
          \<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
          -NATIVE_PATCHES ?=3D &quot;&quot;<br>
          -# required by mesa-native on Ubuntu 18.04 with gcc 7.5 when
          DEBUG_BUILD enabled<br>
          -NATIVE_PATCHES:class-native =3D
          <a class=3D"moz-txt-link-rfc2396E" href=3D"file://0001-nir-nir_=
opt_move-fix-ALWAYS_INLINE-compiler-error.patch">&quot;file://0001-nir-ni=
r_opt_move-fix-ALWAYS_INLINE-compiler-error.patch&quot;</a><br>
          <br>
          &nbsp;SRC_URI[sha256sum] =3D
          &quot;bed799788bf2bd9ef079d97cd8e09348bf53cb086818578e40773b2b1=
7812922&quot;<br>
          <br>
          -- <br>
          2.39.0<br>
          <br>
          <br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          Links: You receive all messages sent to this group.<br>
          View/Reply Online (#175996): <a href=3D"https://urldefense.com/=
v3/__https://lists.openembedded.org/g/openembedded-core/message/175996__;=
!!AjveYdw8EvQ!d1I0Oop5Q1K7nA2qwulHGN9mgP7ofnN-EUUea_ivsroO0Ks1bU1j3VJqZuT=
Q0X2H5ycY9aAW5Cz_ChByuuFtNn4$" rel=3D"noreferrer" target=3D"_blank" moz-d=
o-not-send=3D"true">https://lists.openembedded.org/g/openembedded-core/me=
ssage/175996</a><br>
          Mute This Topic: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/mt/96308437/3617156__;!!AjveYdw8EvQ!d1I0Oop5Q1K7n=
A2qwulHGN9mgP7ofnN-EUUea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_ChBynxgHZr=
w$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https:/=
/lists.openembedded.org/mt/96308437/3617156</a><br>
          Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.=
openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">openembedded=
-core+owner@lists.openembedded.org</a><br>
          Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://lis=
ts.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!d1I0Oop5Q1K=
7nA2qwulHGN9mgP7ofnN-EUUea_ivsroO0Ks1bU1j3VJqZuTQ0X2H5ycY9aAW5Cz_ChByHCJT=
pEs$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https=
://lists.openembedded.org/g/openembedded-core/unsub</a>
          [<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank" mo=
z-do-not-send=3D"true" class=3D"moz-txt-link-freetext">Martin.Jansa@gmail=
.com</a>]<br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------kVqKwKwo5nMkgW00TeLy0ZbQ--

