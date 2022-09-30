Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B33C1C433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 01:32:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.974.1664501536914451587
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 18:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=dy3ahUSp;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=72725421ac=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28U0bDZ8019128
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 01:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=oRLIFqJidXAJB90F1teOQ8+XILYYU7dOXf2W8ZEfuf8=;
 b=dy3ahUSpHHsefNMAv6eRFWbgXgTJ3gsxNCV5Kptx/Q7ZDZMVK6og+Gq8vpxhr4S2s99Q
 tAwQLY+6waCtR6nxgkMruV+Zgv5Az+5vBCqq6QlhQym/UMT+AAKYJboqPODypouTi/W+
 vTwcw8Xl03dMG9n41/Gz7eAMvUbEysO//Qe1LdmDWRVXd97zGFTRF+qnYFXJyZ68wqgD
 dN7qlcexD8XvrltUjoAGC8CDYjeD25Y/OKN8G6m5uavWedLh67P2Jz0Uy/Pi1E7CF1pD
 kATDtxz6SkE5BdqvclDxXCyVeeh3W9TB8rRBJq/UuBNq+ALxHzH+SUUsIxyXvM259BsH gg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsrv9n1ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 01:32:15 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28U1WFgm023376
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 01:32:15 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsrv9n1eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Sep 2022 01:32:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VoA4R0EDV1/xOurbntjs/D4SawmWKbPe3DnNZ6v00Qf8tV/CtaSfEfm+RzGS8mXyEISdN3eGwHS0wTcpkAIJYHjFyM7ekmvgfoOxsSXGjMKzM/1jI5nVSyXDwgEfAGkWupEwbDuZLCAPiHqZ2NYRnacisTyv/fbjctSHrYT3B1a+bjMP61J2JKe0B9/Za+EtoI8LkTdEKVcYBTb1eE3aGQ0suyLWWsGOTn7Sqd2UUcB1ksVJRaZiMXsV2SBR7zgWwrphAHPYrKkhTfuxJevlEDMcHUNPk3YmSh0RrgwGWJOHSUF4mCVvoJ1SYLuAfybhXeA77oLoOhhnyLw70B02sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oRLIFqJidXAJB90F1teOQ8+XILYYU7dOXf2W8ZEfuf8=;
 b=mmwfPEW332GU7Gq0MkAGAeI73fb8s7jMVypKMVmERPJRbTRgRBwyDfpWgk+XtHXnqcXCtQtxonTE7Ok8F4t9WshLw64Aw9+iY4VwqEX5FCDCJfSdDOlPyzHzxRA1y0SRmaOnp+PwMggI4yrumMZy5WycoE2Tq+cg1+MQAwNiGb3hGA0VYkKdWfJ1kuyJmItRenZ6Jn+MTTfGyNVhGikIj7cCZlNnCGPs6KEeIQH2MKkchsP7+9SfyeejDR32WgYRdw5eLAMxp25vgoW6oHHqJLTeuECwOy3O1S1mUt3ea/QYJlYG14e36gTBLekpo/TP5+7p2U42lVbAJpEGzNcTNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 CO1PR11MB5074.namprd11.prod.outlook.com (2603:10b6:303:97::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.23; Fri, 30 Sep 2022 01:32:12 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::28f6:87a8:896c:30a0]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::28f6:87a8:896c:30a0%7]) with mapi id 15.20.5654.026; Fri, 30 Sep 2022
 01:32:12 +0000
Message-ID: <4bf59ea0-85b9-0164-2483-0afbfbc41c52@windriver.com>
Date: Fri, 30 Sep 2022 09:32:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v2] mesa: only apply patch to fix ALWAYS_INLINE
 for native
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, raj.khem@gmail.com,
        martin.jansa@gmail.com, openembedded-core@lists.openembedded.org
References: <20220921080357.8493-1-kai.kang@windriver.com>
 <51cc35c11610c638c75efc6de20845f3e497c8dc.camel@linuxfoundation.org>
 <0d77f98c-1a7b-f1ad-be89-82776cb2ca92@windriver.com>
 <YzYZDkznxW1tCbmQ@mail.local>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <YzYZDkznxW1tCbmQ@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SL2P216CA0083.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::16) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|CO1PR11MB5074:EE_
X-MS-Office365-Filtering-Correlation-Id: 47234f45-c7c5-4cff-2ef6-08daa2839906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zad+W7Uv2eRH08Yn6Nery8O5TMQ0ZzeyqbqzNv3QGjXCl7v/7ZI8y/eRseNQdA6tf0jyG4nzm/uVyfrEONaMmrcYyUrDUZcOdvGWwWNdxBgJZF0+QeAlyyPX8OIk+oksMg1ybwvcaNWaaK39sROcTZOhRJ64LpEnzQdaWCHycwke/+FjPWdVAOx/W3xwGMdEd+ETi3tPokvAbuzf3LB3xvkGMySVAve/5iEhjuZDcNuxN2Jlj0o6eacT2pco57Ujtyy3S72xKuWRoKdxYynOwba78JnFMWJYnfusZsptoOSBSfuXRiQBnjKbrtEj/89xqtJpjQcz5dCE0fOJls9PdG5k6BYlZiudGk7SYlO/ihySLN7ZLyeXu/yykCeYE/i651j2wlI39OfB0H0GDbewvMGWLoJ9QPOkTLLDLSFvS6OeUFww4XDmN6d5iM7zzWLwcKwIqXzeHO1mjoK3O68xLtkEWa1RfvgvNo3qOYVlUnHR6HcP6AEpRBkM/eO4wsBzFhIBHQGahxsDHNTkeOIXam1jdIyyOQQHpIpJmiQGZZ6kz4BDqVpGYsoWXfNw7RIzpYbjWTYwzcS6083t+yj7vB0Sbwruc9R9MD9iTaATwi+/Hrs3VTSULMw7giHvcXH4GLnSfJo4jtbgCFiITfglLNdIyLD9B56nIjhAjCl/mmyMjQhLOEWTdXARuh84KwPGUTCqbaJ9vcOrvMeUUHepO3frXJW+3Jk8r30dI9sANaavcrXFtJNZra7pdB8CHj1+vP58ODszZIxbXo2I2IakBEwh/HFGezlCMiSCtkZVaDunGRYVXlMMeYOVKoALAKapOFjkP2UPmVe74MsnSA4XdGghQfVfUROhAhY9zPxqxk8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(346002)(396003)(366004)(376002)(451199015)(6666004)(38100700002)(2906002)(6512007)(26005)(36756003)(2616005)(8936002)(66946007)(41300700001)(4326008)(53546011)(66476007)(8676002)(6916009)(86362001)(6506007)(66556008)(31696002)(186003)(5660300002)(316002)(31686004)(478600001)(6486002)(966005)(66899015)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SUVpdWppNmJ1U0hxV1pNOWVhZDJ1NXBJZFN4TTJMNDNFSjJkMEE0UExWbUhk?=
 =?utf-8?B?dzRDMHNMeXJCS052TmhUaHo4cXRUNUZ6MW9mNUR1ZXNUSUh1V3RTcXhiMXdy?=
 =?utf-8?B?eFdOU0U0a2t5UUlvSlNPd3NmUnUzeUxRU2dqN2pLeU1DUWZwblI2by9wbWFR?=
 =?utf-8?B?NUJXdGRLSnFRNGNjUnFCaFhPZ3gzQ1RWcnZRVHlZUFU2ZCtkdXBWQzFoQ3lw?=
 =?utf-8?B?TEVtUkQyQThJL0x4OFVjRCs2NHhuVVJjYlhmLzg4Q2xkV3BKbTlkUnN6emhC?=
 =?utf-8?B?RXJ4NFJqczdBc2FQakx0RWFPTWRqcEVZMTBPZHJPQXdtbm5VSWtiYlhjZVd3?=
 =?utf-8?B?RytqL0pxMDR1TmdqMHdtQ0tzTXgxN3RnTjQyYUEwMXQzSWZCK01KOUMveEs0?=
 =?utf-8?B?ekhNdmZPclBnU3VESE9zbHZPaWtsaDdsVlp1SEgxdG5UVitDUkZHNnJpTGJa?=
 =?utf-8?B?M0NCNHV3OVhmRTVCVkpkZFY3NGFVRXNHWkRiWklqSllob21HbjE1U2lZQVdU?=
 =?utf-8?B?T3pHc2JuejVtQkZCWWdZN2F2NWNLT1ZkeW5IZ2xrWm1VTXhzaVJvdTdZbkpv?=
 =?utf-8?B?TUEwZG9VU0NkS0NLRFBrdWhzS0o4K0xBMTU0QzNaWmh0UWVFQkRtcUV1MUk2?=
 =?utf-8?B?WGVoa1hsckYzU1BVaExUSk1oOWdGWFlSZ09uYVk4SHVxVU96WDBzZEQrS0Ex?=
 =?utf-8?B?ZmFob2cwWDBxakhaSG9DZ3hwOTB1OXBpUW52L3NhcW9iR2NPc2I3WkU5VHpK?=
 =?utf-8?B?N3c1YnBVSGNIS2hSS1hiSk0xay8zSFUwMkZqR3F5L2JGNVM5NG5zd1BBaVJk?=
 =?utf-8?B?bCsyWE5ZdVRLcmwzdFo4MzBEbmlrVld0OE1qalJaeGxIZ2JDVytmOWJOTndY?=
 =?utf-8?B?L0I5elY1QkNxaGV2N2VOWkpUcHJBdmhXL3JrT2ZhOFF2Q21uU3ZSZDZnVDVQ?=
 =?utf-8?B?SnRNaVlvaGVUVks2eENFNG45Nm1zWGVXRjJPd2Z2YWREaGdXdy9jKzV1T3Fn?=
 =?utf-8?B?TDF3UGltS0FZenlZLy9SenBTeCtIRXc5TTBLT1JpM3pXckxrRlZHL21qTU1n?=
 =?utf-8?B?dGZLQ2ZLSitnYjEwTGMwSVdRZllycDZFcTh5Z2YzaW56amtmemRSOS9kRWg3?=
 =?utf-8?B?OE9CMkt2UE5DMk0wNHFHUllZZ3Era3BhR0xUTDZ5M0VaMWZzc3lvM2hCV2tW?=
 =?utf-8?B?Mkpoa3VvZHdnMGJ1eldtM2VYMUNKYURGWkVCQ2p4aUtNbEJFTFJiUWwzWU5t?=
 =?utf-8?B?b2JtZHN2YTdFenFLeUJxeVNUZmZSR25GMFhoMEU5U2RRc0U5clJlQmJwazlq?=
 =?utf-8?B?MVBiVVdwU2I5Ump2a1FsdEsrLzRoOU1MOEFLa2tsWlFGbm12d3hmUDNmVExt?=
 =?utf-8?B?NUViSGR0cVAwZTBHaUZCeHVKd0Y5WTdWM21OdWpnMllFNlFQeW1Ya28yWVNm?=
 =?utf-8?B?SWl1eXJaK1V2VHMvb3J5Qld3OUZ2TFRGTk5vb25WVTJkS283SW84SDNBZjZx?=
 =?utf-8?B?c0lqREpEQitBU2VHMTBFaXdQVkFQS2RnRlRKTHZ3dWY3aEk2Q3plMzFob1hx?=
 =?utf-8?B?Zm9BcFZRSnczZTN0dG54TVc1U1Ayd2pwT01Kd21MMVpLQW93STg5bytiNjFk?=
 =?utf-8?B?RmcvTnR3YVBUcGs4Q2ZqVEU3ZlQ3SGlnbjhVZXNWd0l4MnhPbWZmN29CdGtL?=
 =?utf-8?B?azUzU3N1RTNjRzZzNkRqNnVsZW85aXFoano1QnVwd1liT290ODc2TWs3YTJK?=
 =?utf-8?B?dms0TWN4Yi9mZ1BsSnQxWE5lZS9nQ3BBUm1jMnNmdi9xOTNEZXo2MVNTdTcz?=
 =?utf-8?B?YjZnQktJTWhXTEhVMVhmNm1ocEloa3ZzSk9zWXNsZEhzV21BdmxveXYzTUJr?=
 =?utf-8?B?SS9uQ0Zabk4zMFE4cmZOS3EvdUcyblF1dklQNmdvSkZPTVJzT0dPeUF6dkFN?=
 =?utf-8?B?Vkc0a2hzQ1JLc1dLbGkwSXExbUFiVEoyZVlGemFDQlRJcjJvYng5TkpyVnF0?=
 =?utf-8?B?ODg0cDVtRXdmYm4yWktUeHcxZ2xHczJoVEQxa2kvcHNHdS8xWjg5YnhnUWFp?=
 =?utf-8?B?OGEzbnE5SFVSRG5HS1gxZE44b0Q3cUFYN3hnZWtGajJYVWF1cUJUTjdlVG9o?=
 =?utf-8?Q?AWbqQK8ktKgOWufH4LRx3cLvl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 47234f45-c7c5-4cff-2ef6-08daa2839906
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 01:32:11.9174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZXYjOCnTsISQ/hseqIbVSj/cXxAM9yzZZlkgwJ+Mj1BAmoldIx3+cDBHj0EBs/gSsN8f+M/Fvgn1Y25YfCqP5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5074
X-Proofpoint-GUID: PgHU_6tBVsTOHYesU4OxWDolTnk6AYPA
X-Proofpoint-ORIG-GUID: 0AtpCqoVWngfjcGkk_bR5ODXO1NIqIcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_01,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209300008
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 28U0bDZ8019128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 01:32:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171200

On 9/30/22 06:15, Alexandre Belloni wrote:
> Hello,
>
> On 29/09/2022 17:20:52+0800, kai wrote:
>> On 9/21/22 17:08, Richard Purdie wrote:
>>> On Wed, 2022-09-21 at 16:03 +0800, kai wrote:
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>
>>>> 0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch is not
>>>> required by target mesa any more. But it still fails to compile
>>>> mesa-native with DEBUG_BUILD enabled on Ubuntu 18.04 with gcc 7.5.0
>>>> without this patch:
>>>>
>>>>> ../mesa-22.1.6/src/compiler/nir/nir_inline_helpers.h: In function =E2=
=80=98nir_opt_move_block=E2=80=99:
>>>>> ../mesa-22.1.6/src/compiler/nir/nir_opt_move.c:55:1: error: inlinin=
g failed in call to
>>>>       always_inline =E2=80=98src_is_ssa=E2=80=99: indirect function =
call with a yet undetermined callee
>>>>>    src_is_ssa(nir_src *src, void *state)
>>>>>    ^~~~~~~~~~
>>>> So only apply it for mesa-native.
>>>>
>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> ---
>>>> v2:
>>>> * add comment
>>>>
>>>>    meta/recipes-graphics/mesa/mesa.inc | 4 +++-
>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-grap=
hics/mesa/mesa.inc
>>>> index ea7ed4fd27..913aec987d 100644
>>>> --- a/meta/recipes-graphics/mesa/mesa.inc
>>>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>>>> @@ -22,9 +22,11 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive=
/mesa-${PV}.tar.xz \
>>>>               file://0001-util-format-Check-for-NEON-before-using-it=
.patch \
>>>>               file://0001-Revert-egl-wayland-deprecate-drm_handle_fo=
rmat-and-d.patch \
>>>>               file://0001-swrast_kms-use-swkmsDRI2Extension-instead-=
of-driDRI2.patch \
>>>> -           file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-=
error.patch \
>>>>               "
>>>> +# required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_B=
UILD enabled
>>>> +SRC_URI:append:class-native =3D " file://0001-nir-nir_opt_move-fix-=
ALWAYS_INLINE-compiler-error.patch"
>>>> +
>>>>    SRC_URI[sha256sum] =3D "22ced061eb9adab8ea35368246c1995c09723f3f7=
1653cd5050c5cec376e671a"
>>>>    UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>>> This still generates warnings for musl builds, e.g.:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/588=
2/steps/11/logs/warnings
>> Hi Richard,
>>
>> The warnings are related with binutils but not mesa. Would you like to
>> review it again, please?
>>
> Sure, but it doesn't apply on master anymore, could you rebase please?

OK.

Kai

>
>> Thanks,
>> Kai
>>
>>> Cheers,
>>>
>>> Richard
>>>
>> --=20
>> Kai Kang
>> Wind River Linux
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#171178): https://lists.openembedded.org/g/openembe=
dded-core/message/171178
>> Mute This Topic: https://lists.openembedded.org/mt/93821960/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alexandre.belloni@bootlin.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

--=20
Kai Kang
Wind River Linux


