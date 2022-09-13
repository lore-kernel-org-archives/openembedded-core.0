Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFA2C6FA8A
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 12:53:39 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.45])
 by mx.groups.io with SMTP id smtpd.web10.4383.1663073611676565061
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 05:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=tzGazJ6h;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.13.45,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hY7HrFQVm7KXugIWx6uY6aK/oyExvQtImgbnYaQZiP5sFo1j57+MLwA/lJ2+TI7gv7rUfzLszt4fvNaRweUYA0GK17TvRsvU0CBGTzIViP060xbDH8FD2cXoy0WxZlRt10ABpfF6ORWawgy4fsJUVOv7va7wr1xMIgQTMDvEwPvwC4WWX9oX2FyP/DVvLt+z6szhUnQxOadzaHfMB0ZTPfIdr91hmpqnXWUHL3GFeujA6Tm/VZnl4cGWkCfLEBinHIx4U4ogExWEFaE84dXJ0cLRqqtA6qzjzANid5ybq+RhULjWrTeJOrNCB0nfSTgDLoB0riQFIN9KmV6j69xVsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+KvuwoewbCA+cA0e8kgb5WV8hU7PeKvvDeSMCkrbic=;
 b=B9pWEBN0pUYHcK4JzL+1OjunArpwFqnSk2XxKagKlk8CniPKRvP9em8l3jAUilMU6scP9rO4Xul6yhWaJjRRaIXurxqojxf568Q6ahw5KWzMKuRPNPLPi/UGoJIHEEq/zMj9bulQYf9rX0cLxhAKn0Qr4imczb6y8MovfE5EdbEWaZP3t3U7chwWIY1FYLw7Ggisksi10msjXMIgh2L45wQUWu1v5fV8a2Z2LOEHo9x0Zspx6KzWPv+mygyDnhgDNFC5vrNUfhLgCm+M1ZTinME3Td1N2gNmuCCOGiXJAO0kqlG0fhzCRkwazahWm0dpXyjWl+j5q7MX2mjLJO40Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+KvuwoewbCA+cA0e8kgb5WV8hU7PeKvvDeSMCkrbic=;
 b=tzGazJ6h2P/Z5ACEMTXMed655/zYamQoZ+haAXSosSamzewggnXlAztFf7p0OuAy0EwTJVFZ811TAUbiovq7i3NgfE4AG540uHnZxsNLQpuzZChpVLFgDNiUT6wWvg8mSLgYCYXTfhvxmJreFjzV7GP7cz9IF/Hr6BfbjP1Gr6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PAXPR04MB9186.eurprd04.prod.outlook.com (2603:10a6:102:232::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 12:53:27 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 12:53:27 +0000
Message-ID: <4164993b-6069-cf33-75de-0fb82dd150e0@theobroma-systems.com>
Date: Tue, 13 Sep 2022 14:53:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [OE-core] [PATCH] python3: add PACKAGECONFIG[editline]
Content-Language: en-US
To: ecordonnier@snapchat.com, openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
References: <20220913123910.3428647-1-ecordonnier@snap.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220913123910.3428647-1-ecordonnier@snap.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0174.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::22) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PAXPR04MB9186:EE_
X-MS-Office365-Filtering-Correlation-Id: 623764ce-bf1f-4bf7-7a62-08da9586f3c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZbWIgqttpxJDc/cjKJDybkPeT4ue24q2tMtX68U1jO6ni0A4X0sJPM+QAnbek43X2tidDxcZlRyMU/XEt1vMCP26DQfRDp/dZ55jrbE42usgpWQXRu2REOYPXBAUbdO3yAnooAq7O41ICXHK8tPLyIMdmIPgS1HgRy1JqAnlt9WlIHyKlODRHXleIs8t8ONNse2TFWiQ4kBOx5eHv+AA6x4MtKTeYCkPxo/SaeNk+P+LcFktf9PEvfZvUkzewtappunHhd+Dt1zAMYXw0cgCOgn7ilNTvk0It6FL3b7aJEzo4eiwG7BK4NZVp3j+RKuFl55uEx190MhnOJuUupmDbTl9j8C3HOylRBKeFgg0OvCvyaqiChndUG5SdOSbroVs7AgMZCiHviC/N53BWYCOXhbB9A49hc+yH0ELqsfyQytEF6kyv/ARbDx41eSBLnZe9GvmYu8DwA5A9ULDh09V1q/ynWUtmJQa/Nxm28/IVQQksqqD5gUJZgQ2XDD6CcTmbS25rFJmbB+/t5mJ+v0RXzuMOgFrpHX0+iZ6UaYtw2mzcnYvrPNuIIYimI3pCNS9ozFpwibcEB+3Yq3UX5+fdR+0fcJ0l45hqM7Ql8oUkO8CpKhHJnxIi3TKYN6Ra+kZUUL2DdWCRqfcsAffY9SYh5nkfyQcvxkJDrtUzlDUDU9JcVeEg3uy+bAxhv7Ol++GzfnECbfw5Ow2UqF2go00d5DYlTkjk3lGD1cvVYpzm0vuUVZ0RDRIwXSUrs6yJMhKylXTqNQKGckdfhZGlzi58u9gj8WbdQ7/L3LR8WKCpSmw1bMuJ1usTjOO8mleur2l
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(366004)(136003)(346002)(39850400004)(451199015)(83380400001)(31686004)(36756003)(5660300002)(86362001)(8936002)(44832011)(4326008)(8676002)(66476007)(31696002)(66556008)(66946007)(316002)(6506007)(41300700001)(478600001)(6486002)(38100700002)(966005)(2906002)(186003)(26005)(2616005)(53546011)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MmVRVEtGSjg0dXozVEE1VWlyNVFZdmlTbUs2MCtQZDE1bHcrbS91SE5YbEsy?=
 =?utf-8?B?akJIekR0TXdnU3l5RzNoYndjMFU5elAyRThUSUN6SkdyT0owOGE5cnhGc09M?=
 =?utf-8?B?ejFjdm03MlBlYWlRZ0pzdi92cXR0dW45TGxxVGtuOUFqWklPUVMwZHZQMjdT?=
 =?utf-8?B?ZnVldENyRVVPcCtOdktYODMyaWxLQVY4T3hWa0FUeTc1TmpQaVU5ekpUOFBM?=
 =?utf-8?B?V3RvRmRzM0RBS1Q0cXNOcEtWdVZUSHIxQUlINFltWWN3Nk5QRjFwUDBPM1Mv?=
 =?utf-8?B?VWZXd2JvRGg3QlJETDc2QStOc3MreUJjTzN4T1FhSGVmRnloaFFnTkI1bk9G?=
 =?utf-8?B?OUNnYTNQc0NpWjErSm5kU0QwelBxNi9PUjduLzEzU1B3cmsxQ1pSL2xEdWhP?=
 =?utf-8?B?K2xOYW5kRTh2L0tyWGFvZTNEVCswS2VVRmJLMFZCbDNQdzVYNUtucHNpSnhn?=
 =?utf-8?B?YzNmNWI1RVFrZmtrZ3pLRktjQ0lkNUdoZ08valNHTnR6Qm0zUmRlSjFKWUhv?=
 =?utf-8?B?VnhWdy9pTk5xZndjSDkva3E0NVBjVy9WSVpIRVlFcjd1K0ZsazRRdEhIQTNQ?=
 =?utf-8?B?WGJ1NndmSEorWlUveFh1TEs0bnZEU2VUbWVaeVJRVFduMzZMbmxWM1VCS1Bi?=
 =?utf-8?B?OHVrYm05b1gxSlhJOUZ2SWVQd3NlcUpBYTQ0RzhGZS9BNG12eDUxQXN2Vnly?=
 =?utf-8?B?L0FvcmFZWEdVRVl5aTcvYWNBdFhtdTk3d3k2Wm94aU5KRTBJOE83V25IUGYr?=
 =?utf-8?B?VTZ4d3RSMzVrNkhGakZYZ3pjUUh3MlQ3MldzaGtEcDAyL0M2b2hjSkRjQ3FQ?=
 =?utf-8?B?Zmc0SVlMbGw2MmRIZlk1SVdiN3Z4MkVqYmhzMzJxazFGbGlISzV4elVaV1ND?=
 =?utf-8?B?MTZCNFc4WUpqeGhVZEhMQm9yU3ovbVVRdkJHclZTQkFrUFBBeFRIWGNBQmFm?=
 =?utf-8?B?UXR1Uzhma0pVMDc0aGtnd3lzNHdXTXZlcVh3QUZMNm00eHY3cXRrSzA3UXRa?=
 =?utf-8?B?RWp1U1VjdGd4TWgvYlJreUE2L3JDWEZVUU94Y1RXVEx3VTJwQ1owaHFCQmlU?=
 =?utf-8?B?bmU4U2NhbE10bmRrVEZQTE1NZ21BRGpSZU11Qno4YXZYSnVyWTREL3RhMmtQ?=
 =?utf-8?B?bVU5Rm96WU5Cb0FUS2IzTGdsZ0htbzVSUk1kakwxeEN5Z2NvZmpvbjFCbEgx?=
 =?utf-8?B?V1A1WFlsOWVVZDdmS3dkQnk2OGZPcmhmZ2RacS9QaXZjc0JITy9CclhhY2ZL?=
 =?utf-8?B?Yks5TEZ4bGI5ZGZCMEVzMlJkNkMzOGI1MTVReWhNYUY1bXkvSU13aWk5WFk2?=
 =?utf-8?B?TnlFRWhVdnJJVnFUaFhMMUk5aHh4M24vZXNXU3JxcmtZNndReHZjYzBITkVP?=
 =?utf-8?B?VXNnbDBINURhOUhPdUdJOWlWN2JRTXpyY1RVYjJnS3k2bUxVbllvODNHbTdK?=
 =?utf-8?B?MFpnL2dsTGR5SlFWYUJGczFKQ2xDMFZWc2svVUZQWVZUZnl5Y25aSTBZNkNq?=
 =?utf-8?B?RjhlMUJKQitEZ1lnTWFlVXJpYkRxVld6SDZ6NStKanVuMmdFb2Q4MTE3STAz?=
 =?utf-8?B?YTFKTGVUZzVKdklhYmRWYWZDNDYrRlIvYkdQbEVlbWlqeUtQT2htQWIzdGV6?=
 =?utf-8?B?WkE3UFMyaVQ5SDcxMGZpVXg5VnJUMmdaaUQxWjVjRjcrczB5ZUptVXhJbzdo?=
 =?utf-8?B?R3ZGcytwaHlBbFRZaFJhbzBTbk9nbFFGNDEvTHg3N0o1TWNJMlR4UzRVaExv?=
 =?utf-8?B?R1liZTk3bVAvSCt2MUs3OW5GdUZYK1o3NXgzOURQTDVJQUhtS3ZEc3puUktj?=
 =?utf-8?B?Njh2OWhSYmpBSW96Q0lWL0xXVVVGbU5pdGN2WWRaSk00K2NXU2ZSWS8yd0Z6?=
 =?utf-8?B?bkVsc0hmOXRWZ05vemFHZEJiT1ltNG5LZno1akNyeWFUUFdBcVNCeGZqc3gv?=
 =?utf-8?B?T256Y25oRzdyN3M3ZjQzNmhNeC9VYWxMckFIS2dsQXBkeUJqTTNhazY3aVRG?=
 =?utf-8?B?RFoxRkdPQjkyZUxKZDdJdG9HV2NPV3EwRi9OdllmR1ZKcGdDVGhRSDBjSzhE?=
 =?utf-8?B?L2FBeVBmU2tZUUtQSlZYTnRsempVdE5FT0VqWmh2UGZpdGRuMWZ0UVpNYTJK?=
 =?utf-8?B?SElYazUrNERtcHduREFyMHJ3WVJGcWs1YzI1bXBLTkU3blJueHZpRE9MOUQy?=
 =?utf-8?Q?C+RGDeZueQKdo2jsQdGt9rY=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 623764ce-bf1f-4bf7-7a62-08da9586f3c8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 12:53:27.6379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RSPybJDWcugVwd8rQOjSwctQ3OBV3CsX6xEpPazS1DeL6IIKXLI++BDKh2Str80CTvG0/ICmXUy5d9OccF5WR/5hEZzp9EgoOrWOfhDcjlf4SevCHmMVyInIRyOfGpY/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9186
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 12:53:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170578

Hi Etienne,

On 9/13/22 14:39, Etienne Cordonnier via lists.openembedded.org wrote:
> editline is a BSD alternative for readline which is GPLv3.
> 
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>   meta/recipes-devtools/python/python3_3.10.6.bb | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/python/python3_3.10.6.bb b/meta/recipes-devtools/python/python3_3.10.6.bb
> index 1b28728732..6c4ef5c7d1 100644
> --- a/meta/recipes-devtools/python/python3_3.10.6.bb
> +++ b/meta/recipes-devtools/python/python3_3.10.6.bb
> @@ -105,6 +105,7 @@ PACKAGECONFIG:class-target ??= "readline gdbm ${@bb.utils.filter('DISTRO_FEATURE
>   PACKAGECONFIG:class-native ??= "readline gdbm"
>   PACKAGECONFIG:class-nativesdk ??= "readline gdbm"
>   PACKAGECONFIG[readline] = ",,readline"
> +PACKAGECONFIG[editline] = "--with-readline=editline,,libedit"

Is libedit supposed to replace readline entirely in python3? If so, I'm 
wondering if it'd make sense to make readline and editline 
PACKAGECONFIG's packageconfig-conflicts-for-f1 the other so that we 
cannot have both configs enabled at the same time?

C.f. last entry in 
https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGECONFIG

Cheers,
Quentin

>   # Use profile guided optimisation by running PyBench inside qemu-user
>   PACKAGECONFIG[pgo] = "--enable-optimizations,,qemu-native"
>   PACKAGECONFIG[tk] = ",,tk"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170576): https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_message_170576&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=QwQT1E3jSDJ2g0NTR_v12IuTnVPJslfFNt7_11W1SfSnn-87qis_5jjFlcsp3W6V&s=BmvM79DREWtojYRC-ufOj7AZ5khUIuwoZ_cL1VgAGu0&e=
> Mute This Topic: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_mt_93654164_6293953&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=QwQT1E3jSDJ2g0NTR_v12IuTnVPJslfFNt7_11W1SfSnn-87qis_5jjFlcsp3W6V&s=QhIFYKrLZ1FS_BL-tsQvUEZtL5Fm4CrGs9aP-ihyae0&e=
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=QwQT1E3jSDJ2g0NTR_v12IuTnVPJslfFNt7_11W1SfSnn-87qis_5jjFlcsp3W6V&s=UVe3axFwAeEISx3bG_8YcrRRpZaV4V3DxhtIETyZjz4&e=   [quentin.schulz@theobroma-systems.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

