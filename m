Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69358C433FE
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 09:19:59 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.123])
 by mx.groups.io with SMTP id smtpd.web11.34826.1653902393574349642
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 02:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=C02325aQ;
 spf=pass (domain: prevas.dk, ip: 40.107.20.123,
 mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lr5eyb/Td9/AqCVX1bM0QCrz7dtqwRTGHWnxF1u01UwG8GAOLcwG0qIthmynOgsXwilaIWsU6e0HWbEq3YOA5MAKI0gR1BYd+YOO3jt5+shtwmfPUjT7MYypkaZ8aW3+ngiVJhv4d6vUDwcjrKmuOfjASb7NkdojigMgcWy/Qs72PJSMcmU8SoS1QwbBiQoEKXmDM01OsQhjzQMV+HLlofOHdQfTtG+WdMysOKfgKHGfwhLoXI8cws8rJterdnUSJLvVZ7hhif2AmWqeAb63ZrORotZ40dcJSAW/AjkmL64BJ8oHiNGSQt3S4HEAPMpup63OmKDorDG7yzxOwNNfSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpTLHjrJe1qOp2nic0E88mYNENctv6AaM29hzJnN7L4=;
 b=nYvQwvz2cK3uy4GPZVHiHaP5uRRrDzD0io42AqwEmFJ4+e6ickZoEjver5ijhWDx6zU9YgjB+baieY8STOub23tDGwcDxf3NLvinQFbHgt54MDK20uhV0LZ19wVjLtofiXGeuKUZYQ7Pf3fdUVAx+wg4P25CBf+lofj5SUvXDJcBskVe1rrZ4483Zd03bid5eZdb6x8co2vlw7Ejp0mSKQQwcyRd0xVv5wfCkHw7FC49uyqiEUUYGkHfh4fcycV1w2oPuIceR4gj88ensg7eiSoyigjUraumBd9n0EUANej8GN1tLh/Uq5ss1ANbixXWcFR8zt1TD0p2TjWY9O/JxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpTLHjrJe1qOp2nic0E88mYNENctv6AaM29hzJnN7L4=;
 b=C02325aQ8Gmh/c/8yXI3vkHn7uBZzuhhRNDqXvukOq7lafNzUZKlobcLycY2cr4ovJ/Zo7r1P1obYpOgRWTYQ5T/ZNl8C+KrxyOzQq+RxzBtC9Ep3rTsVDCW8bSr9RrVWZwlQWFOcu/hr66JprVTvXLkLOj4kW5fsW3rtlvxuNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by DB9PR10MB4794.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:255::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 09:19:50 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::edf8:6e1a:8d97:57ee]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::edf8:6e1a:8d97:57ee%5]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 09:19:50 +0000
Message-ID: <0fa72c6b-ba25-ff9e-8b8b-b9a854587ff9@prevas.dk>
Date: Mon, 30 May 2022 11:19:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Should BB_DEFAULT_UMASK be set with ?=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0041.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::19) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c6b2120-6205-4b10-808e-08da421d8c23
X-MS-TrafficTypeDiagnostic: DB9PR10MB4794:EE_
X-Microsoft-Antispam-PRVS: 
	<DB9PR10MB4794D344E15B313B7E644D6793DD9@DB9PR10MB4794.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XHBmYkuHyy59eMf+4hBNeLU3hAIQz9ntsfhNrNarPU/H+uhs0M5m909TXAEPKk/IOjoJExsAG2Ef7Q1EuxVTIa2Tqug8ZAfQX89rgb9BcWqfJPtiAlC1ePniuxIV9zBQXVEhRGtfg47yA9nWaJCgSule5pRDiuf4wL3NEMMuZ49fQj136xCQm9tovBPSw+/RdLxFqhfEMw5ZIPha4ZpwE3ObDH9sNWIxLVxtAW4ZuzsIy5QlI3NCc+4M6DBDIfHwhugJpxf3wcZY92oefzn9V3UDzUoEpQb61qF6LpyOUyUHUpB9z3Ez9MmE7n6BbkyiBz5YNmo9prUebbQAqiFsQoU+MLKXKr0Oj8ZkEpMomcotiPf7tFYRw17Fv0t0jO8yP4XnJlfZ2pUP1xVl/ZLK3Shjudq1XKI/VfXHAgaIS0I/DB55U1RytAb3PSXuyZ6BaJnnJqP5NkgLGtp6KW2bTSpwxMdhcPGKboggMUWoPj4BUL8f+25qxG4N3HZmxhf3+f3VFsjHOslmkIktMnsi9Z4eRYJwLilRqdJv62qc3EuiZhNwBZbVbZiYzpW5FoPF4gE10p4nmEw0Y5888SWTwHrEFQ8hliqZa4XlnSCY0rN1MIutCTVF9o7NCxn/IlG/jN4JBzYzm+J/wVx9oRu9TfvVf7PvMoCTK7dAugFMFZ2RIUKVs37hYfTGFCUJhhDW0seYL6qAHhLj5jFahaFqfWu2uKoWPXqNF3IEGxVuY50JVDJ3nE3cfYy7Ks0welBnmI4DK9+6i0l7C8WEs5IVSA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(31686004)(8976002)(36756003)(6512007)(6666004)(316002)(6486002)(6916009)(508600001)(6506007)(52116002)(26005)(31696002)(2616005)(8676002)(86362001)(186003)(66476007)(66556008)(66946007)(44832011)(38350700002)(38100700002)(4744005)(5660300002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q2RaRXRGYjRmK3hVUzB1MVJoMzNyNnVYdTFFci9vaGFSVnU4VnkyL0MyTHVN?=
 =?utf-8?B?UFA2cjRwWE4ySmpGS2pzbkpJcDF6dEU0OUNqSGpGTThKRWZNd3EyUzhWU3Iy?=
 =?utf-8?B?UkhJaE5sekt2TCttbEx2Ty81NWw3aldkTTFndnBDeWRYbk5pVDRBNktZN0VQ?=
 =?utf-8?B?bDZqZkV2UDdPK2FKUi9JWnFBeVc3R25UU1NuR2RuY2RxbloyQUZOWWRVS2lH?=
 =?utf-8?B?dmR2OG9XUTUyS1QvRXk1YnphUE5udWxiZHJRdXArR2tRUEFNSjhHbzB6WVdC?=
 =?utf-8?B?dmJaZW9uMmtITStvaWhpcnJHRlNUbElOZSt6dDk4VFBXVmEwcjNBUzNUclhX?=
 =?utf-8?B?cGExQVNvYXNIUkNQWHd0S09xRWhEMkNxNlB0WmZZdWs4SDBNa3dMc0UyRFdB?=
 =?utf-8?B?bGxiYlpidEFCWHRtMWg4WmdYRTNuZ3JPOWowQWRRUVZOOFpVWTQ2dXFNRnZL?=
 =?utf-8?B?M0FNT0xNaTJScVl5cTAzdVdlRHR3MWs5SkV5cVFWdC9VeWFpTEtUSzZDd01H?=
 =?utf-8?B?ZExsRm14YzlsTmxnMzhObVU0NjQ5NXhmRWN0REwydm94YmI2QzBZVDJ2VDBU?=
 =?utf-8?B?OCtXUTVpSGhrNldDMWRkaGZYTWVFanpFa2xiTWRiVGMrQnIyT2dFVnJYS084?=
 =?utf-8?B?aDYzeXArQ0tSaUl1SVFLRGtsZ2hYMUdTZnh2YXZkNVFwanpZSkJ0SlBQK2xp?=
 =?utf-8?B?ayt1a2pCNEVBS0lwUDZvSjB4TWxIRU95ZWNTRDJVK2tqWVo4S2dlSHhkeVpu?=
 =?utf-8?B?aXd3OS91b3hLWDlETTVEMFVST0FJUktqTldLZWtNUWswZUNpc2xrVitGVVAv?=
 =?utf-8?B?cUk0R1FOUHFJd2xKU2lYUVZleExpV3dyZkI5Y0ZXa3NWSHp0djZNd1JNUmRX?=
 =?utf-8?B?ZXRxclVvS2lxczFZanI4Ri96ZjhLdWQ1Q2xaVmRVeVcrRS9xMEFYYVo0QkpM?=
 =?utf-8?B?MnA5ZFpGY0FQbHFHWUVZMmZIM3Z3S0lRM013dkw2TFc5elhrWW9keFlOSjli?=
 =?utf-8?B?VmlON0JuMnhMVEhwbjM2NXAwOWdvRkF4cTU5b1dZYW1aNHo0YTZsVFlOajVp?=
 =?utf-8?B?T1ZuUmg4a1RidkpROHdBTnNGVVMrOWI4L0ZibXdCZ0NEN25sazUrcXJKaU9p?=
 =?utf-8?B?cjJvcTdqVmZreVRnVHNKaXBBNDBCYVNyVE5sVkVlek1vQmRkS3RsaXFsckw5?=
 =?utf-8?B?b3oyOGx1YVJGMm9ranRpMkRQYTlkVWxWZHR1eFFMK3haZ1JXaDA3RDNKM0pp?=
 =?utf-8?B?NE5DWitaS1JmeC90UU9lcFZDNlFGT21tYVA0cTQ0cm1uN0VnUk1rR1BVYk9G?=
 =?utf-8?B?RkVDVXZZOC9tMUhkMVpOUmZmMWV4NVpCREtpVWt0Q0FRaVg4UFZUVm0vekY5?=
 =?utf-8?B?QUxERisyUE13T2J1L2V3SmFIR25NNEZ5OG4vNFFva3JGR0hzNmI2RCtEMDVV?=
 =?utf-8?B?RFJVcVRTV2dzMjE2YmxQNXB0dWY5QmdtZ20xcjRGdzJEdWRnUFlyQkhHQmJo?=
 =?utf-8?B?aitOSjNwczRsWHc4c0pJcG9LVG9HMlFaeUtuZHhwSmZEYzdsYlp0ZWlmSkE1?=
 =?utf-8?B?TmI0bnRsMEJEcHFDK2MwcjlCU3dmWmtncjBZZENnM1BvbDFIRFUrODhyQUZr?=
 =?utf-8?B?bU9lQU5EdFh1VmF2dnFrNmxTOWxGVUZmR3hnenRDVXpEU2lWMTE3dVM4T1F6?=
 =?utf-8?B?WmJjbGNoeWYrTWt0UXdBd09RTUdGNHV4T1c1bHFudWRqS0dEN0Jra1dCTzdK?=
 =?utf-8?B?RlYzanp3VmNtVlRzZm80Z3NJZDVBNVdocXNnQ3BJQmZOdXMxb2pOemtBTlJm?=
 =?utf-8?B?dVVQa1lWNlRzaytTeU9sdGJpLzJSSkliWnh3ZVJaQlpXU1E3OTZyQTRFb3Vr?=
 =?utf-8?B?WXNxQ1B0NGdLQU5KK1RueTBLN1J4bzN5Z1l4N0F5RTdpZ1J5YkdiMlA3Zm1L?=
 =?utf-8?B?MXFvd2o4MmRheEMwSDJJQmJyalg3TzllME4vTHNYb0Znb0hSVDYrcVk3VGVT?=
 =?utf-8?B?RHJkYWZrY2JlNm9GN01pVlZCQmg5MkdkWW9PRTRJRnY1anhOSTRsSTBlOWJx?=
 =?utf-8?B?aXkwaVhqZDRCY0xFcjVHajhwZmluOUszd2tHMmVCUXVtR1VhcVVqNnkyTmo2?=
 =?utf-8?B?UU84a0NBL05WUllqSDR0TFY0WFhiZEdjbk12RklmZEhDbFRGTStJb1ZCVC9a?=
 =?utf-8?B?TUR2SHRmaW1SZWtTcEliTkZLeFdscHJNeVlJRmN6VjBOS1RPZW5NMitnelI1?=
 =?utf-8?B?MGR0TmY4aFBicVQ3Y2c2Y295YWJhbkgybEJVS0g4ZFlybStvNGVpYnpEaWZ1?=
 =?utf-8?B?cE8xZm55WEVwS2hsbEx3SHFxeWFVc0MwQjN3dHRtMVlRQU9RS0JMN05rOWo5?=
 =?utf-8?Q?5K2Idwy4snl+7uYE=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9c6b2120-6205-4b10-808e-08da421d8c23
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 09:19:50.0842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tXxLinIlv6yf3dbJ9MAVKl7aRVA3oKKnqXqw0HuXRehpsU9sOz4z11OUV0oGLA5hf8vTxtv5FmDcipOosADJIO1XMHnLaEcaZYAUE8Ei6E4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB4794
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 09:19:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166274

Hi,

Suppose I want to define BB_DEFAULT_UMASK in site.conf or local.conf (I
do have a use case for setting it to 002). But bitbake.conf includes
those files before it then goes on to use an unconditional assignment

BB_DEFAULT_UMASK = "022"

So how/where is one supposed to be able to set BB_DEFAULT_UMASK? Should
the assignment in bitbake.conf be ?= or perhaps ??= instead? Or should
the assigment instead be moved above the inclusion of the user's
configuration files?

Rasmus


