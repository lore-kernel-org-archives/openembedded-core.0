Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F72104BEDD
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 10:41:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17818.1773225659122818334
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 03:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cD7ueT74;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7530cedf69=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B5kVZ2616543
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 10:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=RD+6HeGggIH0T+woPfIVShYBWSLLfsKO0ffcqr1rDm0=; b=cD7ueT740JEX
	9bL4a/XM9EL2lx8CioX99uUPcdXLvZEdmUnioxf8NuRBcDI2ooDVHvqm3EXpPp8n
	PIFaGDb4AoLYgRDbR0hCfVEpv/VddzvtnYie4oE7po0XeJiI/P7mstTCj7BPSNjM
	xtIVjyxZsXtQSphc9AdNJnUCCswEnXZTFSUdXUrOiUIn8h2hyOLJAVruYS6X7t7n
	LSEQ0Zh3FG1xoB1//X3szSZMSHvEYmzHMpKSfYuT5ca7oIVPk9ymx9xDgG35rZvr
	D9cEKcDBVCfjdycVoU/Ij2L7IkyXmkOagQhpLrExcP2tt9ReHTOh23Hk/KLpjzXY
	qEvMb+oX6w==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012019.outbound.protection.outlook.com [52.101.53.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cty578fej-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Mar 2026 10:40:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvvBCGFxCoan2b7arCsdqDyVRa5uybp1Mn9yQnrjzTI4GVcaG8i0C/uKr8YjSg6oLfhaXZ5zUCjTAvIwaRjrKgDi7MGj2JfF/izQu2frDk8pxi0afpykBGHPV1FFHi+6q9jwI7grs4qa/Sk2VwvC2GXsz/7A5HrFQ3qOnN8o7pN3ee+Y3JfAs3JQbhhF+r8v3Z609YhsdfTC4Yx9BpsARzGmEpZkjp5h72w1eC7pHeTCe+H3YC5eU84pHIUBTlxKzDUj0UUlda+iQ2M4OJJMNMZvTmve6/LV6AdopN/WssldaKYgbIayNbrGQBXhU3d53eacNXghe8jltswZGTvaqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RD+6HeGggIH0T+woPfIVShYBWSLLfsKO0ffcqr1rDm0=;
 b=M0DiIFEeN/60MIEbdqB/+RjxDkTrKLNGn2S2eEVbnEe44rBKCUF0WfVHScldGAqtR/MwM/aJFip4kxLdNs4ypuohqfalnXWTpiRqiqWrRbYHDDJkVXTmT/BeWQqtgwYjJmSu2IUu4Z+bEvk48TYsEQ6+5Yqvh0r2D1mA9EL9YFYm3kGwFF79v/C3S8Npg5ilQtJb1Exs5tfD61v8w1qEaLnCVebehbSDBo40CGct/jel7ze+yo9ohXGlcpq9TN7VoE9USHMkkt3j2RXToC+WDLuMYFEm/K7K426uHzIXKDNcUt07+C+dV/dpoDrxJ1HNp/jNmT4Br3JDu4PuGWicRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by SA1PR11MB8448.namprd11.prod.outlook.com (2603:10b6:806:3a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Wed, 11 Mar
 2026 10:40:53 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 10:40:53 +0000
Message-ID: <a3aa4063-a403-47ed-a0af-9eba85d71cf7@windriver.com>
Date: Wed, 11 Mar 2026 16:10:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: dynamically link with llvm for all rust
 variants
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260310181354.2396448-1-alex.kanavin@gmail.com>
 <131089.1773216425426295510@lists.openembedded.org>
 <DGZU61EDNZ2W.1DOR2YWGZUYFE@bootlin.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <DGZU61EDNZ2W.1DOR2YWGZUYFE@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0273.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::15) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|SA1PR11MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: dd132c19-b638-41ed-e567-08de7f5aab2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	0eYYyQWTl0ytdhtUsg8kLhzokLjqH2g/dMik99Sf/QdkNRLCiq9WVguqd1zWymBe6RXE1qAwBJ/X36dGqNdwsRs7BVJpT0zeILq5NHrLkKQSC5myfD9ske/Ecoawux9yG7Q158hWOfFxlYKXQk759Bmb9iG3SVCvMay923+oydGu7M/cg3bSVdAewZojDXQ1zekAtlw4W0XyrwrS4vtRll+d8VEFVvCqnxWDPdcj0MpS2GTq8+cLv7t0OJxpRtmW+A/2OMLHw72dsd10A/A72qsJLthsqhSSba0RaX9PUb9KnbLncwO7zvAVHus5uJqUzQpKc2lnz+F3h1yuNycy0PVksXHA9QQZ52rFLI6HkIgRTZ5zALgqDRfb7OqQsi8wp+4Sqc3gpjEn4L5/eBDyxny5JIACD07BZVPasUx4CLtMd/bmordHlEtQF9AAeEZXbeHvKyhidpTntdUCd5G6c4Xa1EieiuOUfp2nelmj8K1W25t/ip8n4GQRXqYEshw4Xprn1qcdzJmOw7oy5vVek4gLxbpoOM+SDgKsJbPuRk23wTxVh5CSk6RwH5TSm7GZxjItOFqfrrj1AgOYNJSCujkgKll5sW8v4ZcKagZCpiX740MXprH4s9m88aMH267CaHQbE101527TFGCPz37PXbMgJJhFRdDXWsaexesBWSzvTSgzFb9Hl1XabrFRUU3P
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OUFQMGFTakh2Mi9jcmNJT0JSZ0JHa0xoTVdmdkJGOHQ2R05yNEJPL1dSZ0ZB?=
 =?utf-8?B?NVBkNnJETjN4NHRDZUpUMjB0SFg1NHhUTUhyeVVWUE5sN1VOUW9zOUxOV1hS?=
 =?utf-8?B?eTN2YmFDTStZZXFKNmVYRlIzWDZKZmRHejlnejFsSGJOMENMeDEzb2VNQWhv?=
 =?utf-8?B?NjVtTnBmbmZDV2w5V1JnQUFISnlETkdqK0NaQ0lPYVQrejVrZGo2N0xmUzBj?=
 =?utf-8?B?aXM3emtRT3NGUHl6amExcEFOTVNGMDF2S1gyQkhOSnVlMG5zbjA3Z2d5WWRt?=
 =?utf-8?B?aldZTGdHVG5XNi9iNEpKaDVUc2NkTHY4amZEbHVZTi9Mb1pqU05wc1lERUJp?=
 =?utf-8?B?V3Y4RVlyZmVBN1ZONWZnaHU5MktaNGpsUkJHTUNoRFA0cUp0L2M4dDI5UU1J?=
 =?utf-8?B?ZGFpVjRpQU5Sanp1a3NBWmc0L2NWR0Z4eUliMlRBcmIyOGJWUTV5L3huakZp?=
 =?utf-8?B?eVNmTkRHZ0tFVnZWaHBsSEIzaStUMjlMMC9oemtCTWc3RGY3K0t2S1VzQmVw?=
 =?utf-8?B?Z3kxQ0JQc3hWeFMzZ0hPNmVRcWI4U3dXMGhta0hBUTRHOGNTK2FJZ3VzeGVk?=
 =?utf-8?B?QXB4R2FBQ3dZa1FORmxGcUJsNjNwZmtYVE5uZndLaUtoazJjZnpEWnFHR0pk?=
 =?utf-8?B?RVhsaFhJZ25wUmZyMGR0UUlvWmNRYThBZFlHWE4wZWEyd2pjM0lpUjFBaXI4?=
 =?utf-8?B?ZHNqMEttTGlySmkvK2xPUE9KQkVBTzJxNzNSTFkwMkpZMzliVzdKdW02SDFR?=
 =?utf-8?B?QjRJQ0txQ2MyQ3IySGo5VVlKbVFUYW5GY3dqb2t6Y3lEdkhrTG5PenM3Vm50?=
 =?utf-8?B?V3hLZkxYUEpaZUZRVFRIMm1Bd1BJSzVZcVZzN201SmxoYmFZMWw3VEdDT0Vw?=
 =?utf-8?B?WWRLc1Y4K2pLcHBVVEttUlYzdXM5QU16V3hEMm9xSnd2MzVtZExvcms5VjNF?=
 =?utf-8?B?ckhWbFlQZUZnQ0E4S1M2VkwwdzRkNmdzV2N6b1VzU25VaGZCb3VHeWM3a1Zs?=
 =?utf-8?B?ZlpIY0ZkVTF4RkcxOWZaTUtrVlNCWCtjeFQ0c0hnZWFoemQva0hYbnZiVGNT?=
 =?utf-8?B?V05EZ0hlOXorTTJsbTJuVFUrQ0JlaEtGME5xMTBCa2h4bTJoUmlYNzg5U3BQ?=
 =?utf-8?B?MlNIWkpzTUQwSlJSVkY4dTZWMngwWXU1bHFGQkd2SHBBZWl4YWU3STNuN0FO?=
 =?utf-8?B?d05COHJBUjBxa2E0SU5kN1NKcDlRKzA2Ly9tUmNoSTFaaktVZEdwVERPL3hS?=
 =?utf-8?B?dm54dFlkNVRaQUQ0dnVRVW9PSmtwQUFDcGdvOE9NVDBmKzlPQWtJTlM1bmZ5?=
 =?utf-8?B?clh6RUw0QUJKbnRwRVRqbkVEL1k2djljdXdyeG1SaGxzL3RITHlXcHRISDNk?=
 =?utf-8?B?YmNWVFMzbGFxemk5dDc5TDdBMzhOczFKWnRQSWNsMWtUSndVVkw4UEhwdEhx?=
 =?utf-8?B?Mit5d3V4TUhkV0N5K0tkZEdYT2lJalY2VWVjR2NpYVBYeXpSV3N3S2d0SmNm?=
 =?utf-8?B?SEJHMEJ5NU1uNW80OVNHZXpsMFMrT0lqRi8rdWF0cm4vcVpmTThvTkVrcmo1?=
 =?utf-8?B?YmdKcXZmbTlXVFpuenpvUEcvYlZYYVlESjRVTWpZL2ZEUzM4c21Td3hYT1ZN?=
 =?utf-8?B?RGJ3WndxYjZoWVpoZE1HaFdhYWF1WG5VNTVjMjhwSHJSMDk3SkgxNEZ3UmlC?=
 =?utf-8?B?dGx5Y2U4SW41a2xIQ0xLbzVPSU96ZGxQSkVmbU9UaURMSnF1amZDcUZUS1lV?=
 =?utf-8?B?TVgwbk9SaHhiNEp0SDVkU0VOQTUxNDYrMjFTNUxZVHlyNWtMZ1FseXRZeGl0?=
 =?utf-8?B?UStFSzRibnorR2RIWkx2ODc3Z1E2YjVYcmlKeFlXc1FYTHBFd3ZFdUV5K1B0?=
 =?utf-8?B?M0xzQ0xHcWxvaVhYKzIvWTRSQnVzTnBvd3ZHb3h1ek9kMUo1MHRmSHFObjcr?=
 =?utf-8?B?MHJzT0c5djR2WVROUDRTZGFka0FHYzk4Z0RaWUp4aEpxVmVLbnVlVVJ5dFNL?=
 =?utf-8?B?TXlyYll2R0tkMHhLMEltUTB0L1VaUkdidWJtRDRJL2M3V3lSRmNPR1NFM3Bt?=
 =?utf-8?B?eER6S0gyd3J3OE1JdFYzZzI5aEplU0dCcDNTZGhwZ3pkdm1TbW5zK21MNmto?=
 =?utf-8?B?SWNqcm8rNkVzb3dUdEIwZDJBUWVqdlI5REVNODVwS1RtSEQ3MFU0UXRhMk4x?=
 =?utf-8?B?S0oycWVpSGU0d2laNjUyeFB1WU5IZkljVzcyZkZUNVJTam9tTXJlbjg0Ynkw?=
 =?utf-8?B?VFVWa21VRkxHUUI5OFovOEpFZWlJZUxaNUtkSUpzVVd1LzJtYVhKaGtYZ2h0?=
 =?utf-8?B?UzQvNDN4VjJSMXZJWGJBZDNOcUYyY21iWVVYbU1QdUd2MjNyU243MlFybkpK?=
 =?utf-8?Q?kCkljgOuPOwSQ0W9JFhpf824jl4vtNCIF29X0?=
X-Exchange-RoutingPolicyChecked: 
	PStPM+LmEPoSV8wIuryFB3V7gMxVc3pnAZ66NZ+zJF8uQZhow1virZhbmIwA29InkuIhBZQSNqGZkPLhqVrrUYrX5teXhBVf2r9b1LXi0c/1ykeOVC4xJ+iQmVhhDiY2iAUK9pwzmWoPCUl+FWTuYGDxf0ngYbA8tGQ1zV3IxCM2cTiN9j3UFEsmto4GMwRgg/Vy0zZKHU2mGkHw8oDBPsGo5bR+laNor6nPS0QDoKnbHqtfqxgDHJTQPPdiBU6uHmH167DpDO2QPdjujrQ5qCV1G53zLOWd/h/XM9CoGGOhB4h/xoZH6Zwbla0mgvxm6kkQKkY3KCnXgHJYd/GcCA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd132c19-b638-41ed-e567-08de7f5aab2d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 10:40:53.2251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ie7L62qWh6+HnaEhMETMJHqmyKiSrE0NXStPxsvZBrNvQ1HtiWzdu/qELlWB7q66+rU5M04syN9/d2IOOIn887O21WZmI5ULdnD0oMvlrePRnEesVQpEQW3rhglFbzx4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8448
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 4eKrANHQCfonQ-dSO8GYgRY2kIK5fkoR
X-Authority-Analysis: v=2.4 cv=fpnRpV4f c=1 sm=1 tr=0 ts=69b146ba cx=c_pps
 a=zrUOGFyhpnkGsAL0isy7CA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=WVF5ubd-KYtqipoXlQ8A:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: h0O7KoTN6ZziV3tJiihspxOnGMjzD7TL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4OSBTYWx0ZWRfX/d5TiloixqFc
 9YQ8Uu5K0xfyq3WJvj/ChbYkO4v9/gm+z8+m9BGRmoqd9s3IuteGW8rDLrd30js3nskWdCx/LEY
 9geMpaF4vK1WxodimwqBL9TiKZmnajiHmKhd0CIj8wlmPVio2/Fa6D1YUmtC9rl/2Of/C7+xQPD
 4n/waouPfUv0ux0BDMQaZCc9rQ51TWEqfoL8pElOGMYbnLcG+3lrqk+9gjAIaUZijk+Iist6y4z
 qZKtsZXNViQuTtOeBnZ5NJCtEh8nERVLue2lONlFzFHYvsTJzvQ0wT13aOYQl0o5MB2yLBu5IV8
 WD4iDn0/IyLeCp82ZiATxqktLZDTzralR+8eW+Dv/ePjgADf/zezxKDa5nIv3tgqzYa+E7pLJTg
 2rz+snqzltt+jASngl0pwx3s2VuQbW7OhPQAujN4U1g/ilcXNdXsAc1v35NqZ7wMo+17oaWaF8e
 VQgkGsbmkYT/+EtuinA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 10:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232863


On 11-03-2026 14:43, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed Mar 11, 2026 at 9:07 AM CET, Deepesh via lists.openembedded.org Varatharajan wrote:
>> Hi Alex,
>>
>> This change need tweaks in rust.py and rust recipe to support multilib builds.
>> Without tweaks rust selftest and rust multilib builds will fail.
>>
>> Required changes can be found here :
>> https://git.openembedded.org/openembedded-core-contrib/commit/?h=deepesh/sunil-rust-issue&id=44ce23e12e411ef9a1724e79c2b6ac6d5f0ddedc
>>
>> Regards,
>> Deepesh
> Hi Alex, Deepesh,
>
> I believe it is related to this error?
Yes it is.
>
> /tmp/work/test4341/rustc_codegen_llvm-e21c84994fd391cb: error while loading shared libraries: libLLVM.so.21.1: cannot open shared object file: No such file or directory
> error: test failed, to rerun pass `-p rustc_codegen_llvm --lib`
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/1177
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/3286
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

