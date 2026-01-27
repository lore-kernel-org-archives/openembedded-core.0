Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E9CD2F02F
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:40:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10910.1769521211866118281
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 05:40:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aNIAxCJx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5487761cdf=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R88X1I4124751
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 13:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=3dpbDdWDI9HfUsXDlf7OThG3LlNXYT/64DIm9bRZbEs=; b=
	aNIAxCJxDCByb4WYlwd5bEA76ygecDhZASY31OgCjLFaCH4Zx4iWVURYZ+muq5Au
	03VWPJZDDxBJHNh71DB3MlPS4gw3SOH0t3rxKiy0R/udCWqteIc8UYKZGzdqMjqK
	/eRvw91Ry5f+HtF7iOHAWBy+CZqkxFHuSsB8JY/EBUj/nOAmbc9kwRgPrBX3TDQv
	npEu5YFla9eUmbeyVnCunmfti+wH6PNTMcg8yQKXmbyeI/gwYZUBRWWYyAT3JSo9
	6ePUMS9Kp/GHU1stbvpgqJgAk77QG21LkYppP7UKKMV+kYxOYyX1xxj9RO23w0JB
	ltvsdD4Y/SCJjlrN5jwOag==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011051.outbound.protection.outlook.com [52.101.62.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvka038qb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 13:40:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2fbDPOUqTKj0i7Jgph97vdciQEw8cZROFry31T9od8uQdQa8UfzhhzRzMNnJBzvcGOOnPG3ic0XKrRMhxDJJV20AT8XkkIOQ65zbbLcuzqT+POSnF8sRKZtl3X9r3M/p8DhmvH8ggwPtgNe1KfM6uUlkKofuOqrt4FFG0qz5cl6YzXTRaPf7oB05DFJPwcGS+JoX1li+wdAfpIzbSWAB6TYRj3UJU/S1PT364QDC0RLZGd/IIwabcMHgxgdlwCEIac9GhhuUUZ+e78RL2d7R3vwGBK98GNu3BH7PR3wdpL8sMcdMnlHma2Y6pAeTxifPVhSWwjUquceS7Mgt4wjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dpbDdWDI9HfUsXDlf7OThG3LlNXYT/64DIm9bRZbEs=;
 b=TZcNOO5t6HFHUUALTpDhIfFeMEG1sMlAwYSW2Xz05EOUE3cDNFeO/kc/MQT3jWmlqv28/lC5bS7LkCW6lmf+n2xts3jRaxPioObU1ODALW9tvOFcikkfOsS3g0tzZa6VQvGHI4wzSm0JGMt14QEMIrXmeE2TYvnus70pFhxFOYxYcx7HpWfbn0xTPVm/W8voHmvZ+xsk55TAUzztmCzBg3ZnepgVvdzWm4VIkCuC+UsZqONhXGibBvet4bJkSri5kFI1F+L2pRHaC/qj/0SiqqqFzsJTDXGnfbDO/pZIXNDOZLRe0uH7T+Vjzb34QvlwA4i4ORgdlqoXS3U5xD7bgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ1PR11MB6274.namprd11.prod.outlook.com (2603:10b6:a03:457::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Tue, 27 Jan
 2026 13:40:07 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 13:40:06 +0000
Message-ID: <2dcf596f-b83c-4ab9-ad8e-093409f7e28a@windriver.com>
Date: Tue, 27 Jan 2026 21:40:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2 v3] blueprint-compiler: add recipe
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
References: <20260122015855.2022014-1-yi.zhao@windriver.com>
 <CANNYZj9m=R8boP=A8_-iuJ9YBGXoSx+dAcn032GuWN-zNiCxeQ@mail.gmail.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CANNYZj9m=R8boP=A8_-iuJ9YBGXoSx+dAcn032GuWN-zNiCxeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ1PR11MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: f1ca2aba-ce85-4368-f9bd-08de5da99513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?enQ5bzZvMGNnU0ZFSVlrTG5sN09pNEpVTDFYQlFMamRnSC8yWkFINnNaSUpS?=
 =?utf-8?B?Zkp0RnNPVitGQmM3eUxxVFliVDVNZGpUY0RBQ0g1dkprcDV2aDRpLzNCZk0y?=
 =?utf-8?B?aXZzQkkzZW1VNWlJT254bHpMeFZoTWhTaHlobjExaXRFYS9nQVdqTTJIU05x?=
 =?utf-8?B?SHJZN1JaeWtacFVwVUVza3I4OFNuWkJJcnBSekxrcTFkQVpuOUwvd2lOQmta?=
 =?utf-8?B?bnVha3d6R01WWUtUdXVTTWhyclJDMldFRGcvWUxneXlwRnBHWEJtK2xiUnkw?=
 =?utf-8?B?N1dYQ3U1RklyQW50QzUwbFZZalAvc1NqRkpVWld0QXN1SGpZWGxkS1p3Mklh?=
 =?utf-8?B?YWVhYllXNERiWmsyT0F6VHp6elVTUFJFREpsUXpWTHo5RjJ0MDdJOG1zaFhN?=
 =?utf-8?B?c3FDN0xPQlVIcnlBMUVqSGtQNHlqNmdsU0ZQT2o5V3g4SU9KZ0FJdkdKd0dB?=
 =?utf-8?B?M3MzMzJSL0twUkdmc3ZKL0xERzFzOE9Xd2RIVEY4OHVMRTEydkNQWUlRWUsr?=
 =?utf-8?B?a0NEMjBsYlo3M1V0TFJjUnlOTVgrQ25sbzBzN0pOWFc1RVFEYTVpS2FjV3N4?=
 =?utf-8?B?YjF1cGdpUThzZi9CdE5QUlFocWlkZmVITHo4NklSWGNUOHdqM1UwQ0JsYVNW?=
 =?utf-8?B?SXBmYmxscExWckh5cUE4dGVLdlorTDgyaWcyRVZiYlA1KzVvRU9yNm1HUEo2?=
 =?utf-8?B?dDg2U2tXRnZkTDc4WitaN1JnS3pjR2RGd01mS2VudDBnOXpiMnRkMlU3UEh3?=
 =?utf-8?B?SjVMSVRkQnQ0T2V6QURmWmNlaUFHWmw5V1RuMmRNUzEwUFBkSVFQRFJNczNm?=
 =?utf-8?B?SzlwZXBOL0pROEQxMC9ORnhLZitQRGlENDVuQzJuUzFWWkdMa3NCQUFyOHZM?=
 =?utf-8?B?QjJEWENKSEtqODRMOGdlNEk0d3hmVGR3MS92SWl6cUNNZnYydVBNRWJYT3BV?=
 =?utf-8?B?N2FVUytOUm5aY3JwR2tVYkJFZmQ4YmJOaWdnaVFZRzdnSzVDOXRONm14dGpT?=
 =?utf-8?B?SWk2UStZcXNqWUlLWkpUL2QvTkpvbHhxWWxUTnRtNVo0b2FFaEFkaTVpY1h5?=
 =?utf-8?B?NWNXdUNFQWthbmY0RXJ5dE1JRU5odEk4V3hDVTRLWk05ZldqY2ErQnVCR2dF?=
 =?utf-8?B?S25nd2tHSE1IZHZmOVZHbXpzNnRYbk5wODF6d2pVakZWQWg3aXhrUEI4dVRR?=
 =?utf-8?B?Ym1FaHBUVEZDeVFySWo1bDIwUUo4OUNvUkdsUW5rMkIySVlNUGhKMHpBNGd4?=
 =?utf-8?B?TFNGemJGdW1aakswUmpYa295TzBkQWFLUDhVOFdZZk1BcDU5aDFFbGhqQi92?=
 =?utf-8?B?dVhTMU1RSVZ1WTFKdWEwOUF0ZlV4N3dRaDZtWEJ4QUhjTlR3Z3Q4dlRsMWdJ?=
 =?utf-8?B?NFNBZXZpYzF4OGpYUUJTZ0xaT2R5eFRGUi9rc2VMWXc5dGh3N2VlVUdUWjRL?=
 =?utf-8?B?WWt4UUpGYUw3am1McmtaeU45QzV2K2ZJNzhKV3hNMVhYQU5ZMjhOajc4dENG?=
 =?utf-8?B?QXp3TXJydnlHWVBBYTBwamhvd0VCOVRxMDRvTHlnSEZrVElGVDhxU3duUzR4?=
 =?utf-8?B?cXVLTjJyV0JMLzZ0SzZZVXBlVkhRTit6amU1cXNmdzM1ZzFlRWFnZ09iMWVi?=
 =?utf-8?B?ZGZxb3kwMEZBOHhBMjBja1JwWnBsaGw4TFg5czUxUDQ4bHFuWTJtcXR2V1Bp?=
 =?utf-8?B?VzQ2djJpSi9nVHF6dG1xejNKWVY3RkVuUEN5RHpaeFdaZ2w1NTRVL2luUFhR?=
 =?utf-8?B?UnFjN3NlNlF6U1pvZ0RFeEMzdndYQmZjZ0p5NkNvemZhS2huNU00RXl3WWVs?=
 =?utf-8?B?TjExdlpGTm1pNElpRXkvNGMrUFZLQUo1cTNTQzVTVlJZUTF0dXFPQjNtOWRL?=
 =?utf-8?B?Y29XOVlmUldhNjFGdnVvT2x0RSt4bk5jbGUvQ1Q0eGl4U1JUZm1DdDBpbkV5?=
 =?utf-8?B?bXVNWER4bzEycGwzSS93cEhMbUMxRTkxUTdQN1NFbFlPRW1aQ2hRYWsvM3Z1?=
 =?utf-8?B?R2RDVC96MkdXcitxQjlkWTRIQWZUd1RNSHpOei95aUFuWEhuQVNKYWM3Ymo3?=
 =?utf-8?B?ZUtGRUVsWlhGK1JXZHE3S2dQNnBrcXNTTTBRNjlOSytzRHdjVmFjSzF1SWcz?=
 =?utf-8?Q?/aWBrhDx01ONcTrAII7aZfsmi?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZzljanB1ZjZpSm5vSDdKR1VKYmdyd0h2eDRsVlprSytOVTJ0RzdKT250bWNp?=
 =?utf-8?B?bHFuckRpZWtDUm9FYmVCY3hBK1pucmJndkdJR2dKWGtsb3I0d3R4NXBGb0Nt?=
 =?utf-8?B?dXYxOHg5TTkzR3RqWEdQTWVpdldpMDVLNzlvS21OMzZyNEdWNUhsOCt2Y2Jw?=
 =?utf-8?B?V1g2UVBxWEdGeFJCZlFDUm9UUTY4TityVVBQU3djNk9lNzZaWUd4eTdRbWNP?=
 =?utf-8?B?UjJyTFJ4eGFZMTNZbTlnUThkbGJIeUVEY1NLMktFcUVZZHQzYjhLMU9UdmZ4?=
 =?utf-8?B?bFd5VjZBVThVNFYvTmNoeTVUMExxNzZQWlpSU0Fib2w4bjlseVNaaUswUXB6?=
 =?utf-8?B?MTZ5OGdUZ0hXakZQNysrUUU2UDZQY0lOeHJwdUIxQTgwdm5KdXBTcGpOM0pL?=
 =?utf-8?B?L3VnSHpCc3AvVGEzSUV1OWxsY1BKdGhlaW41YzBXTmYxSCtUbE9rYSs2Kzhs?=
 =?utf-8?B?RDVHUEhCVENKTFI0Vkc2TXdFYUV0cG01aEx6bUxjWWRyb1BVSW5IU25GY3l6?=
 =?utf-8?B?TUZJaHVtdndRbXAzbE45WmxpSGxuREluZUI5MWlJa1Jxc2tIT2xLdW14KzVU?=
 =?utf-8?B?SmliYmNaYnYzYnlMblRxM25LUGtLVCtFWGhkY3ROa0RjTkJ3bDU1VWxKTjJx?=
 =?utf-8?B?bW1TckVndzNpNllvWmFHUWhlUmVhU00zeFp6cExMK2tzVEJhcnhjTkJQMVlv?=
 =?utf-8?B?cmFzNnlnZFlObC90M2h1VUJrRThxY1hwK0VrRGpGUmt4d0wrS1N1NTlaeTZP?=
 =?utf-8?B?QTZ2dU40dlZCYmR2Z1djd2RHcm5sMFZaazlBa01wbXJ2MG52S1FLUXQ0d2Ez?=
 =?utf-8?B?cDZKUGhXOUJDS3ZPUDEwVVg2RUtZeVFkT3ZmQlU5WldOUVM0UmYySWhCT1I1?=
 =?utf-8?B?MVN2SkxlVzdxSklqNHBEMHRjOUtTcHFFT052b0VJYmlOMjcwS0c1V0YyeDJN?=
 =?utf-8?B?UUZMZ3RIWDVXWHZjV2w3WnMyS21xSTlLYzRhUVFTTTUwa1llMTAzdU43TnBE?=
 =?utf-8?B?WHd1UHpOTTJSU0VodE45TVp4QjQzaXpnZzE4MlRjbjk1aDVaZTRQU2IySmF6?=
 =?utf-8?B?UExONmRwejAvSDVCU1B4RXBKMHFkQnFIcjI2dnlEbUhOZ01FaTRYdUxQbG4z?=
 =?utf-8?B?ZTVIQXhVR3F1QWpZb2FyOEdNT2V3Y3RCNkRNMjJHdXdzRUs4SmF0aWViaWt1?=
 =?utf-8?B?TGhFWmZQbWtubjU1RFZ6QjBtcFR3M3JQU2IzdG1HNkF2U1l1WGhOZUhVclZN?=
 =?utf-8?B?QTEyRmM4cEhRMi8waWl5NXNYYy9XaFcyU2FzQy93bVlkbDV1anZXY3FSWDRS?=
 =?utf-8?B?b2lRWnJtbDZ2U2FGVUYwakN4UVFjbGg5NC9PaGpPNUFLYU43VkpvcDJFVFNz?=
 =?utf-8?B?TE5QK0FoSHZZdE9BVStUanlhajU0bkZNaDdRdlJFbXYxc1RVdjZFczc2UEll?=
 =?utf-8?B?bXFkdGJmbi9YZk1vVlplRnBYMWgwU0JtdTFwUW0zZ2FEUGlHL1FIZmlDbGlX?=
 =?utf-8?B?c2NyRHNybXJTSzFpVzJmdnFjVGlvN21mTU9qYytodzdGeWNkTER2bzZUWVZr?=
 =?utf-8?B?cXJDbEVDOHgxallQL1pKd2Z5Tm9jdHdLdFJLbEo5L0c4MnlHTEZXNFQrL2d1?=
 =?utf-8?B?dXZseXpPY2lIL1c2SGV0UTFoMUlwMS85eG91TEl2akNnRUowS2VUL2N5bzE0?=
 =?utf-8?B?TlRDZWtrQVJsdkMxV1J0a3lndVp4dC81WjJyRWZnTm9oYUY4Qk5QaXhwVjhI?=
 =?utf-8?B?dndOK3NFanVLdktBWU9mVWxESmlFUDBoZlFMMiszM0x2ZmhLTWcwQXhSdjla?=
 =?utf-8?B?MmpQNVBCZ2REZlpNSllGL3lhaDc5QUFUS1BvdFU4MEN2SGlVNks4bms2VEJZ?=
 =?utf-8?B?WlU4Qnk3OWJnMzFGNW1FZG1FK0VFZHQxbDltRmowckUzdWIzc1lKZzN3NDRp?=
 =?utf-8?B?Tk13WmhRQTFSV0RCdWV6eFNpSWx3OGlKcURGSy9uZ1lIY0pselVtYmVEeXhy?=
 =?utf-8?B?TSs3YVVQUlhHeTBrbTlvUW0wZ1lkL3ZTWDRyWG4za3gyeXU1OEZScXZvSHhq?=
 =?utf-8?B?Q3N1QnFTenNLdmdoR2ZSQ09CTUExeXdnSnV0MUc3a1dXWnFKR3FJMUhPdjNh?=
 =?utf-8?B?ZjRXRG9WSWt2NXkrK0tPNUZDVG1BZG9WR0dRMDNGTGxIMUlrRmJLTHFFNnhO?=
 =?utf-8?B?V1ZLeCt1Yzd5U1VaYVRzYU1IQmdQc2lBbFJaekNxWXBMMW5XdWJONGFDenpK?=
 =?utf-8?B?RjkrZVZGKzZjdEwxTzFESy9lN2IwNDN0OFFJeUdzWHBxcFk3WUZyNG8zK1l4?=
 =?utf-8?B?T2dSQXBlMk4yTTBEdzZiKzNlcXBYVWpWZ1A1WFIycEtCZFM4OHFZZz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ca2aba-ce85-4368-f9bd-08de5da99513
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 13:40:06.8417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VnaLNEALR7N/OnmBIYfD+uLoHmYgqrOVdPUM7qufxirfVOu8hGHw1jkzset2lqp2cLvM5pMRNjTUbQuC4ppJlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6274
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=I+hohdgg c=1 sm=1 tr=0 ts=6978c03a cx=c_pps
 a=qX5DP9EEIf1faxnBSU0rOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=AE9BMMlHUglNtbuGVMwA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDExMiBTYWx0ZWRfXzouBJTHrLYH9
 CPB4yy4r2qTptXI1vaoc1+ERXf2xSWs+oimXCjXQia9Mrz4PGDEd1x7U0xuQi3F/y8Wj+rJ8gg3
 8SiVd7DnshM7Tpw73C36BXekz0NexXTo6qSKKfX0X8L1YUG9YoYi7wB8KbCQAITX7FHxL5VaxyN
 /NRILiiScEgatmljowNX5qjVUUz0SKiRmRusZWjTbJZlNKqBEpeC8gQXx4H3R1a0mWGBbo0Zysw
 CtvdDcMAomNZUFaDcnUpDBP1WzoPcaFR33VpdSgproBALcwmKD0bMHNi4/BDNm0QHwckdYZVMN7
 fdAgxuW/wOU46OHMqCve3I//of6fmAPoiZgx4nyC1xS56+E7fcgBg4f58lhF7riX94j4osWHWXZ
 389cf7cOdMJljtU9j3tugYVPrwjSLzZPXo1WqMtQw2DEHr/9TP5MKrpM1QtvvhmHAM+2xHQljsp
 rMXsfbCcHKq6Kz/M+DA==
X-Proofpoint-GUID: 4wjvWdfrqw8TaIYMRNy8qOBxmBEI3sKW
X-Proofpoint-ORIG-GUID: bnnWtvHeU6E_4YQCN05vuQNZife6pnr5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 13:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230042


On 1/26/26 17:59, Alexander Kanavin via lists.openembedded.org wrote:
> On Thu, 22 Jan 2026 at 02:59, Yi Zhao via lists.openembedded.org
> <yi.zhao=eng.windriver.com@lists.openembedded.org> wrote:
>> +Subject: [PATCH] Make python site path configurable
>> +
>> +By making the python site path configurable, we can set the correct
>> +installation directory when enabling multilib.
>> +
>> +Upstream-Status: Inappropriate [oe specific]
>> +-  config.set('MODULE_PATH', py.get_install_dir())
>> ++  config.set('MODULE_PATH', get_option('python_site_dir'))
> This needs further investigation. Why isn't get_install_dir()
> providing the correct value? It should be multilib-aware. Does the
> recipe need to inherit python3targetconfig to ensure proper target
> paths are returned?

Thanks. Inheriting python3targetconfig can solve this issue. I will send V4.


//Yi

>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229976): https://lists.openembedded.org/g/openembedded-core/message/229976
> Mute This Topic: https://lists.openembedded.org/mt/117393399/7283133
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yi.zhao@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

