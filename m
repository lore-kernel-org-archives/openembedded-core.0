Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E80DC001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 08:57:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.43525.1690189019424702482
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 01:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gTp+jmLS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65692af2bb=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36O8YrmK026873
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 01:56:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=3vIBXmQYgycizY4yI9Nda01UOgipzLjYRw5pTXgDx2I=; b=
	gTp+jmLSJZaVqxRS8fkSJkmeEqupelkjtvrcjMVBAE31MmKWKklux/YdMQpx2DyF
	crIT8Pf4WqINJ1qStJ/HB65Lr1Dcdbo0T0Zt2z8K/j5e8125Mqa/H3Dj3A/GGAX0
	fTbhSJ+P9iqGDQG9MSm1pgC6acIzqy1ZP5cnQCv9Sbaij75NWD/EYy7qXBBT6/na
	YNAL2UbYbQaLmy3bdkP2jvPXaDkYQKn/aK8VEQ888A4rmBeNGgXCTnkSQ4yE4rh+
	9woUgib0IoPM3yPx7UbMB2w+XHztGi3Yeq3vs0G8P3VLlkg/aywLoSitaBJ2i/IA
	IECxQTa2pkHPVGmP43SExg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0emfh4s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 01:56:58 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36O8uwOP001921;
	Mon, 24 Jul 2023 01:56:58 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0emfh4s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 01:56:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJmP48e0XGOryn/Tlnuv+VkREoxNNTtuhwXlkp8WzOOhM4jBSKsr3i3jIajXbyqyFVhna2a1FPlVjI7uhs9S2oX0lTFra4P1uEpbXeVWNKcFtWHvgR6HAhvsfRChyyVRtfG48qVCDVSKoNQRwhha6tn/r+XcAefoEt1eYKJJ2RCUm+BxPW/gGKVriLeMHsxtKKsiJpSVyXOVSGY+Y2ZsX9SQucCU96OYo3ydr5aVp/zKlGHUcwBKcZjMcZCpzBx18neRk1ezhxzUmhGcI9fHGiGFNgO49U3VbKF1lbllNkcV3yqSQAxvrkH6hNaH+Z4kNWF8f1lhkJ7fYkDwBkMofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vIBXmQYgycizY4yI9Nda01UOgipzLjYRw5pTXgDx2I=;
 b=FWVVE9I4uuJ7gLZDxHAt8rwus+bHsUGh8g5ijdny0O6MNKD4EQ0GE9tlZGqltmkPN3sgj07BpjuSNTlFsB9sDNNNV3vkD8qlP6z8DSx/I/XEbykCH9op6Y2nKUuSm0jGjLPfZFJDpn7mHcU3cIFNoJqe/C4hiFa/v2e3GCBOU4PAApa0iHyypuA8swk06Y/pN2FdDw/gxaMOr/SeC61enTvfgeHX7n8NmHnweAeDG5Z7xjdcWTiUpf/SNp3isRP2/TDDUg9PSnHv2q/myJPBcThlyGj5p/99mseapaEDhDdzkFr1P88QWSZ8H25wsnXphSzQx/X3/HzK900z+quz/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 DS0PR11MB7411.namprd11.prod.outlook.com (2603:10b6:8:150::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.32; Mon, 24 Jul 2023 08:56:56 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::68d7:380d:8386:a34a]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::68d7:380d:8386:a34a%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 08:56:56 +0000
Message-ID: <3c15c8f0-7122-6773-b5c4-06ead44b1601@windriver.com>
Date: Mon, 24 Jul 2023 16:56:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [mickledore][PATCH] webkitgtk: disable DEBUG_BUILD
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Kai Kang <kai.kang@eng.windriver.com>
Cc: steve@sakoman.com, openembedded-core@lists.openembedded.org
References: <20230724074815.591827-1-kai.kang@windriver.com>
 <CANNYZj-79JCh1A74Z3G_Z5W2GXoN734YKgSt4Csx7uEexwANgw@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CANNYZj-79JCh1A74Z3G_Z5W2GXoN734YKgSt4Csx7uEexwANgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:4:186::18) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|DS0PR11MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d7e51c1-d404-4efb-39d7-08db8c23eef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xiCloZlOhsghR81fbYa62nAoVv9Wf5DeEc/aBIPfLyr5bA3WMsQN7H2OlEiyQNC1FJEfztipw0FwANEr+M7L0OPRFVRmdyLAsgh+zqxnt0C1RDBD6kwV5Ago70w9RcewZWAGzGgu6rKzYfWvDvHXa8fuon7ER9IZKqb09YEKlu8IS1BdQlLmjzvR9Jju0eOHBJFdyxJJNl7thlrFFNyMgB+8rYXka3XA35AVsIFinpN4gf4XNGK9/SfGFX5WmOQPINE7pOyzFFA7P1JfoPDEvWv5HWkAM1qx/SSJBrlLTSd0xY1Hp3PqHl0fDahsWKCx4ttkIeuUNwDYG+VyzvgmDynfFNo67Yf+kQwwBS7XS4DoixLu9KiJ/zbZQqu4SgOk6paHdvwUspphy40zcOYAvzNE4IEnL/+ig8b2kMKyLFdU8me82OzL4Q5M3JVUBcIS7TCz3nNfEw/cVfnjyXfuB0bg8Uco1vbTgF7KCezLD2Pl+MI369lK0z73po95tp9kfse8PlGS2fatE1pS8GhuS3F99/JKZR1BzTi8UFFxrvTeC2+OLwLGMQBQtkcihKzk/QKonZwOIMgdWtvas3Yp86Xxf4uODTqXcbyEOAd3ef2/a+grgJL4IwRO6v3e6sSRCMpmY5cgKCiTJr7p9Jvt55L1JHZFiuUAKJdM9HRGxBU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(366004)(376002)(346002)(396003)(451199021)(31686004)(66899021)(966005)(6486002)(6512007)(478600001)(6666004)(110136005)(83380400001)(36756003)(31696002)(86362001)(2906002)(2616005)(186003)(53546011)(26005)(6506007)(316002)(38100700002)(66556008)(66476007)(4326008)(66946007)(41300700001)(8676002)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YjYwVEg1OS9ralBvRWZPbWRLa04zZC9TQThRODdsNzZhdHFwU0ltSjVIM2Y2?=
 =?utf-8?B?Rk05VkxRenlaSDQ0Zk92NVZ2MTM3a3RKZDgwSnlYMUNtcExRSFN5dVdhM3RN?=
 =?utf-8?B?ZTZyTUVOM0drNGxOMkZXUExTV29yUEswOSt5OW91Z2Rzbmc1azAxaXVBeVZ4?=
 =?utf-8?B?ZG0zS0VJbVFFZDY2ZjF2ejBtZWJzSnFzNjgycG9ITEEwWTVudWVidmsvWXFx?=
 =?utf-8?B?RXVvRU9jcHBGM0o4aFNWK05kK2ZWc3FkVFF3b1JNZEVVRmxwejdZU0ZSZE8z?=
 =?utf-8?B?WmN2MjFMTEdDUytSd2ZUOXpSeTNuU3BSVlRMd1B2M0o2TVdmcWIyMW9jZEtP?=
 =?utf-8?B?cWlKc3dVSXFtaDkrbjkwTUZWb2pRcHI0STZEU3JiejBNYXRNNnV2dnhEZ2dB?=
 =?utf-8?B?VXMxZ1ZpK25zTlpUbGc4cEM2VTVBMXBjZUxCSElQTk5CbHhvRHFYdWZtaU5t?=
 =?utf-8?B?cElOeWg3YWczWTVROGE4a2VkM0JlMmg0ZFZQdVdlNUFnNkxCY3puTUpDL2FL?=
 =?utf-8?B?TXdETkF1K1I1RHhZSXFaYnhHWVVKN3Nwa1ZHdHRBc3VKV2ErcjNvaktOZUEz?=
 =?utf-8?B?eVBHMktjNEZzRTQ3THliRXFNZldibUsyV0NMazl0eGlXd0xad1hrT3hTOTlW?=
 =?utf-8?B?QXdGQkFmeE42TjZ5NHRiZnBmL0dVUWg5ODlDRDlCTVFMWDNYdVVmRXZHeDBD?=
 =?utf-8?B?UVRzVzBzbndIY1kvaFJycUl1MVM2ME5DcjNGcjRNb0VlUDRIMVdsc3FOVm9p?=
 =?utf-8?B?N3F2MVhsbG5rdmxmdzVIcnpHOTdNZi9jUXpQWHVDVG1YQzlKZFY5ZDI0azVi?=
 =?utf-8?B?cDdkNmU1Ky9URER5dFhiOXlnU1J0bnE0NUxtRUZyaURYT1FKd3hzZEdhcGxz?=
 =?utf-8?B?d3hzcndwb3dNRkw1RDBlb0N1NHVwbDVNRTl1UWViN2dWSnAyWktWTTQrelhz?=
 =?utf-8?B?dm5SZXVUeXdMMEkreGoyT201MllSN1lxNzRqVnlzSkgxbmxoeXUxMThNSTlQ?=
 =?utf-8?B?TkdITVp1bmlkS2dUbzdhQnIrTXpKVVNXZFBYdnhxeXF3S1hoTmF0dllQa2Rk?=
 =?utf-8?B?TDQ4ZHNSeEV1ZEhVL3ZSeHBURm8wdTBKbUtPMkJ1Qm1HT09vVDJyN001b2FB?=
 =?utf-8?B?ZlEvak1NbFl0dldJMEpJMnJyZ3VYb1pwVmpTYmNNR2xNQjhzNkp5MjBOSmdR?=
 =?utf-8?B?YWFieEpaaDFqdytGZmhMN2trOVlXTE1mWW9Eb0JLY3QvaUNyeXJCaE40blNG?=
 =?utf-8?B?MHNMVUZPUTZMc3FROWJrQWJpMjNOL2hGbzZHbWF5NTBocEJyZmJLalhnM2RN?=
 =?utf-8?B?ejZFeWNZZnRYRW1ZNE5WQXJ5NHVmUDB1STdlN1ZTcERDb1QySEV1SW5ES0JW?=
 =?utf-8?B?ZHJodmFqT3BPTUpvUWR5VU00SlJleEI4RVRiY3NuTHJKZlVicC9uY09mRDBD?=
 =?utf-8?B?Zy9KaHVOd0NLUGtRYmIyeFppNWJ5Q282SStHTURkOHRISzcxWjNrcFA2UzNR?=
 =?utf-8?B?ZnJKV2N5VGREMnF0N1ZZa1hmdGg0UHJ1UlVsU3pYeWUrdW1mdENiaEJTQUdm?=
 =?utf-8?B?L0FwNWFPYWlUVVlWRTNGQUM4UGliTjRxR00vRWU0YkNneVN5cTBoVWY2R2Yz?=
 =?utf-8?B?cm05UFBSSUQrZjFuS2pxSTROVXc1eC9TWEZ2NnN3cmk1TmhHWExsK3psS1RY?=
 =?utf-8?B?Rk13WDZPbVppeWNzcURTdXZ5RTZjcEo3dytNTFpaR0djWnFlTHY1ZExtd3Vm?=
 =?utf-8?B?SDdvN2JxK0VxZDcyNVhaK0Jha1VqOTBFVE8yM1V5RGV0NnMxNWlFd0VnQzhN?=
 =?utf-8?B?SWRyelBYNkk0Wm05ZTI0WkN6RzFSUENUT0N1UmZYQll6OUtRYXY4NlNVR1lv?=
 =?utf-8?B?VERDZlNMeXNPN2VZMWlrWlBsaHMwOXNiUnBqaUVldlNyLy9aejhOak9YQXFq?=
 =?utf-8?B?V09LTmp0R21Mb2xuOHlEdzRIY3NqM2U4OXFJZUxYNzNuSFdMTE1OOXEvbEF0?=
 =?utf-8?B?dWxkRitOMzF5cmNidEl3NjdRNHNVVkFiaE1OY2c5OXpLQnVJcWEwL0lUWHNN?=
 =?utf-8?B?KzBCMVkyQ0IrTjhtK2pva0hMWlR4eGF6cHdBcXB3aWxMZytoQ3RXZnVJbkc2?=
 =?utf-8?Q?B7qQ8r5NlM8wxmdj7qCid5xH7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7e51c1-d404-4efb-39d7-08db8c23eef1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 08:56:56.4918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nrgnYrUoau6QP+CnO9l3WFZCMSJ8eRLsmJrAMwvhQrNP0VC+hXbo/lKE9iUf4QA598kvATs0suMn7HU7O3UZsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7411
X-Proofpoint-ORIG-GUID: HJ6QXl95dTWZPoVg6C4n_Y7_Dc8QQjHU
X-Proofpoint-GUID: cZy8NMHt--jKUejHtiNlbaUBEHXkz625
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_06,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=878 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2307240079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 08:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184782

On 7/24/23 16:37, Alexander Kanavin wrote:
> Does this happen on master? If so, does this need an upstream bug
> report, or maybe a better fix?
Yes, if fails through webkitgtk 2.38.x to 2.40.x. It needs many 
replacement that replace 'PAS_ALWAYS_INLINE'
with 'inline' and I'm not sure that is a good fix. I'll discuss with 
upstream about it.

Regards,
Kai

>
> Alex
>
> On Mon, 24 Jul 2023 at 09:48, Kai Kang <kai.kang@eng.windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It fails to build webkitgtk with DEBUG_BUILD:
>>
>>    Source/bmalloc/libpas/src/libpas/pas_generic_large_free_heap.h:140:1:
>>    error: inlining failed in call to 'always_inline'
>>    'pas_generic_large_free_heap_try_allocate_test_allocation_candidate':
>>    indirect function call with a yet undetermined callee
>>    | pas_generic_large_free_heap_try_allocate_test_allocation_candidate(
>>    | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> So disable DEBUG_BUILD for it.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-sato/webkit/webkitgtk_2.38.6.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
>> index 5e8adf50fc..e6d817cb62 100644
>> --- a/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
>> @@ -42,6 +42,9 @@ DEPENDS += " \
>>             gettext-native \
>>             "
>>
>> +# webkitgtk fails to build with DEBUG_BUILD enabled
>> +DEBUG_BUILD = "0"
>> +
>>   PACKAGECONFIG_SOUP ?= "soup3"
>>   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
>>                      ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
>> --
>> 2.34.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#184778): https://lists.openembedded.org/g/openembedded-core/message/184778
>> Mute This Topic: https://lists.openembedded.org/mt/100324919/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Kai Kang
Wind River Linux


