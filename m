Return-Path: <Quan.Sun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C178CD37AA
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 20:50:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5937.1778187003228360386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 13:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=so6iyg/R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9587ce8c1c=quan.sun@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647CxuEb1760114
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2026 20:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=vSOZ2OLlGNNYLq6DBw3WLgaeGsCPDjoteUrFzdbQVM8=; b=so6iyg/Rc3Mt
	aTLico0fkTlpS1JjqMTAugsHdMNr5NEnU03tQ8YRRu/4MD8/ipVxpKmbIMKuivQ2
	cp28mv85lsUb11igQeyTub9/Fuqq1EjSY69ps1oG1bVOBjukDN4vsjClta8vQtws
	YRw50yHZD+61gy77fVCE+m79algpQYjrCPkMQ6MFM/CbcisHIq2h2Tv92Ug2QnAa
	AXIr0zF4wEx739gd4AIhHltM+oj1llkW/knQL0OF9ZDzoaaSJHBGu0QqoYzY1BwE
	3825l+CvHoMzEdKBMM0MtdS8Kqs9Ep/a8JguEKRQa8ACRt5oc81RwIUzLxt7TGly
	L4Qki5902Q==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011021.outbound.protection.outlook.com [40.107.208.21])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dw8t5y969-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 20:50:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJVZk8GQXh2z+KkfZgE1daRuXd3B/HfIfLIRtyB6kGMlahi6zYRmR5BbB/l6mAbWJzLSWTA+u7ucisB8S5Aw3402GvV7f2jgQ55xFk/grVOZOYzNQSvY4QMlMUFU/GfwcQR6hG2N9J5XcVe44An0VUi47dpBuPjzz7L+FtYZ9/r41NXR8e30agLG0P6QHhpVzAIrM01seBIyhzA/b0lNv/BhdwIQOjbUcwnAJu4vRqYgkBp/FEab3sjsEzxmeyLRGGSAKc/wt3jJUgVvYpRU0qsOrzIwI3p03ApXQLzRI2bRhdw+cohOahx251rbTa8MEHvbfu9wxx8/xAYXeRAOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSOZ2OLlGNNYLq6DBw3WLgaeGsCPDjoteUrFzdbQVM8=;
 b=c3xFPYoad6HyJf3yHoITjQF82b3kFMS36vATuURD+JsaE5IqkXYlpJHopfHokZ6cQ4t1kcvCCghnsBLVeAWoK+ydWLY/Ab0KV4OEuMhme2glzLYewNhX8sv9fL9oIPRklzn/djfKL6oAckB5kQMdEqoflHWNgFPB92jh9tcObmVpWyCmsjCY73ZnF6YMMxNXWnv30UQjOf7lhI5J1P/RqJBCYF9zLPWgv3gwvcZ4ABU8ImHkWRP2aSWIFmaRySwisyhtsmb/6lJLAvWXcsC17ZO2pRt35hY+Y3Y/tNdYDbVzR+hG2Qa/E2v2KzehFD2G0+Jy3XKMxVPwsVVSyLzGNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 by MW5PR11MB5811.namprd11.prod.outlook.com (2603:10b6:303:198::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 20:49:57 +0000
Received: from IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8]) by IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 20:49:56 +0000
Message-ID: <9a5c606b-4063-4d1d-9340-68928fd27213@windriver.com>
Date: Thu, 7 May 2026 16:49:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260506214835.1578529-1-Quan.Sun@windriver.com>
 <DICDKZZ8Y5MD.TV8LSEDQ3M6Q@bootlin.com>
Content-Language: en-US
From: Quan Sun <Quan.Sun@windriver.com>
In-Reply-To: <DICDKZZ8Y5MD.TV8LSEDQ3M6Q@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0168.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::11) To IA0PR11MB7283.namprd11.prod.outlook.com
 (2603:10b6:208:439::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7283:EE_|MW5PR11MB5811:EE_
X-MS-Office365-Filtering-Correlation-Id: a66ae386-2aa8-4141-27e1-08deac7a3296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|22082099003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	PCA4xPXjAU+pZJL5DrskmIT/2WJi0HYh4tp8bxRuuNg0kPu63XLPKaeZFFe82vuDBOIpw+xCbUs8QdNc0xSNbj8Nw+jI1mJlD1dVZHKtyj449SfcSFhrQzMQJKIxDWJE9yCGtisUfFwogivcyLk8ZMIqTS31UJB137CSIEaR9XCNdBPEiyjFuTdfe0F2aHX3a186Q5+QII6pu5v4SFpzCIjJlfd2FxiVJXL7ZTGPWKR5YqiWgJ512gl4u+lYMikWWb1lIZSkW8jH7BVghwqQsf3lrF2wewxqIqx8LZzCkE8RXlNbQN0vBA2oiEbOj7ya0eB5rnKmnvYx/p0VctDeSa0LrVxHuOERXPiW0iHY/jpw5Keg3v1YteDZwyzgF74BqzXazIOpF4N5Bf/9W1N5wqzykKYgJKwqPw467sK44Nvgdp7WgwH6KkPcU2kkwPks3pNGOZLMa6QGwxdeXSn9zQhbZONoHAvYEMdKL30eMmPqH8xRSJdpwyOPY8+YhkWHhjapH3ZEDZi/cmV5zIHfCr8oprT5v05CsYb83UNtEYBXJLqe6I8UavrNw5XNe1blWd6ieZSjCcffZs3AZYDmAMcyTFyCxjo98W8/tdT/jiqnYgiEqstK7zeysMaKdiQC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(22082099003)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MitzUzZjcS80MVlWNEpyT3dKOE83V2dQTUNFT1YrZ0hWWldoMnc2ekFUZGlt?=
 =?utf-8?B?dlFLYXhGSDJUc1NhU2VXWlRMZGVBUjczR1NJbnNaL1c3eWdndHNkREFwWFB3?=
 =?utf-8?B?VDB0WXpwSURROGVHaERYRU1hdXJ1bCtoNnRxNWNlbm8zaVZOeWFRc1p4R2du?=
 =?utf-8?B?aGR4cEhaL2ZhYU93SU8vRmNyTWlZbFZ2MXRHQVJFL0doU0JSNmNUTXZ4UWxI?=
 =?utf-8?B?a0hURUp3ZGI2dnI4RUVmakx5aDl2WGdFenAyU0dldURyWldLNUptcG05UURX?=
 =?utf-8?B?MWhFcytXVVJwcWJKaXZnU3RuOWNCc3J3VDFiNjFhOUhsb3dzd3FkZDc2bzR1?=
 =?utf-8?B?elpvRGxoVEl4dVl2RHF0NXlFcHlCQTVZWU1XS0QxQmJwZHJkT0ZzS0RoVUtO?=
 =?utf-8?B?M3JXVkVYWGtxWm5lYnNGQUFNQTUvbXVlNXhWV3kxWmVRU0ZtUXc1UGZlcXI0?=
 =?utf-8?B?VHRvNSszVHZKQkQ3UTRxOCtmaXd2VkR1ZWM1NmNUYXY1dHFnVUthS2hpcVdB?=
 =?utf-8?B?bklzSVU3aVQwb3c2M05PSCtIaUQ2dFFnNHpmSnFyNzd6U3phNXpoTS9ka2xw?=
 =?utf-8?B?UzAyODB5RS95dkF2T1VPeWdhM1pyVXhzMjNic05CdmdLYktOZU9xL1FXaEM2?=
 =?utf-8?B?dXZ1SW9BL2JUNGZ1RDlieVRpS1NCSG92WGFvUTgzQWxiOW01dHc4TE8yRUFW?=
 =?utf-8?B?cTl0OXdjbmxCb0U1bzc0ODV1dWpHb1pBWjJORU5FT0lVVW5peFJWWHdPODJv?=
 =?utf-8?B?SlJ2aXRoMFliTnRFMDZKbERVK0lXMStMVGZoVUh1c0oyN3U5c0tpQzk5c1Vq?=
 =?utf-8?B?Q0FhaFBjTDM1T3BTbFdBbFk3d0lrSFY0NFJKTE5uZDVoUUlyMUVYUGF2WVhM?=
 =?utf-8?B?TzRGWHV1c203MGJyNHQ5SVlIWFNkaUhpbGtRWlBqajNQaFRmUWZLelFScXpk?=
 =?utf-8?B?aTYvR3AwblZ1UFVoTHovbno0L3FrcVRyS3ZlNGZudEsxQmNjdzlyL2pZOXpo?=
 =?utf-8?B?TUY2NmJGSDFDMEFhY1R6TndHZXVxTHJ4ZmNLck9Ubkl1TFRTTUZKK2l5ZU1a?=
 =?utf-8?B?Mk9ETEFxME5iZFZXcmJWZjY5Zkt2UHRuSmRNRUdmdlhmcHRQaWM5dlZDVERi?=
 =?utf-8?B?bm5QVTlEcHlseTdvbXhuOUhLL2h1aWVEU2lEWEE1bEZYanpuMXhxQ1lTNi9B?=
 =?utf-8?B?MENzV2M0N2dUVjc3WldRb1h4T1BUMWFBQ1daMWtwT1FkNXlnN0hKNjk5Q1RP?=
 =?utf-8?B?VGVNSWFzSG8zUGVVNFhHbUZkQXZUU3djUGNBL2lTdy9LSEJNbkxwYlhmc0pX?=
 =?utf-8?B?Tjh2dHVBWTBiNWpUZ0tYTnQrazNpTzBuY2tGZllyeFRjK0sxbVlaSXhSUFY0?=
 =?utf-8?B?bkRTV2xDc2E0UWtYcm9BbkhqTCtYeWcyNUtsUFJ4bDZwRGIxQkcyVGIyeE1I?=
 =?utf-8?B?eEV4SVdiRGd5MXh6eEowUTE5UDBvWGFaWXdMcEJ6b3pLMEJNTXJ2STYxOVVN?=
 =?utf-8?B?azhBZ2ROeHlyYlk3cVlWRnNVWFN0Y2NYZDNaQjNJRmpxTEJXdmR6bjROYU43?=
 =?utf-8?B?SFpqeFJvYUl3bHpYSi9qeHF3eGtwSHZNei96bzhsQkFJT2tZaFFoNjcrUFVY?=
 =?utf-8?B?ei9UTHZpQytRbFNEd3d2aXdtb09YR1hkK0ptQUxFSEVCVTFYc0lRSTRIOU5Q?=
 =?utf-8?B?L25JNGdFdG1GU3F5eFQ4L08xV3gxWXZyS3FZTzR0Y1FkQWVQODNwMndMaDZW?=
 =?utf-8?B?bDNzZGZzVk1TY283a2VvU0xRNzFlSHlvVVFhU1U3T21vRTQzeVhDQlFlRHE4?=
 =?utf-8?B?UVhTQjIzdUwwUi8zeGJPUXJwb0tESzhaejlmU3dUQllpQmZINkVPc2tFTnRH?=
 =?utf-8?B?d3NMay9zcTE2WnduUVBXQXVMSzZoZHNFcXVhSXU2dlZBMXBJTzQzQ3pGMjk5?=
 =?utf-8?B?UUhEYThQWVgrQzljQTZORUpOYWhYVEg0UUlGMzZMUE1hWnFFV0p4ZzlOL0Fs?=
 =?utf-8?B?dzdnVTh0Ym85bmRMWXY1ZStBWms2eStsbVBSTE8yQXprbFFwblJBQ3dxRjVL?=
 =?utf-8?B?TzJrRUw2Q0ZlUkhkbUpFN20zT2pGajZqQ1c1bmIzd3ZaeTZMVHJFeFNrU1Rv?=
 =?utf-8?B?TVRlU05tZWloNGt0R0E5VmF2TUZLblJRdk9vanFaL3hQWjhPTjlRWExUM1g1?=
 =?utf-8?B?TjM3L1VvOXFBWjBCT05sNld4eTRnK0xNdVo5QUI1UGk0VzdJRkp5NTZxYThH?=
 =?utf-8?B?aUN5Zld0M2lra05jbW9CamxjSG1LMGxJdVNkRVNQQWFTM0g3UjFnTWtsb0lk?=
 =?utf-8?B?cEFoT0JhZTNsdkFjakJpeHJXN3BEMXRvaWxxcGIvRHhnVW1uM0NTT01kYkND?=
 =?utf-8?Q?YAGOSlUzE9KPBYna7KcjJ3k+7khY0ot5H+6KYuqPQU8ux?=
X-MS-Exchange-AntiSpam-MessageData-1: 4q90nuO/H66j5Q==
X-Exchange-RoutingPolicyChecked: 
	QdsJVoNJo/1ioCWBMEE7P9fyh2CFywD5mDg7ISnXWnAPz4KE4uT4j9ghOd/TMH7/GMCfLKpOcc2uNannaKOBMOOdvcHZjzjK7UygUk3Ypgs58BsYIVScbtr7oRTWuEu1SIQ4ifmEK59oGMZPiz4mExaZZsu3MeMUNTakWbMDua6os3iK69jzoAPirUEChTmV2K2XjhldGZ8DWFJzfkYaoLe0+6yVbhMze0pZpfu9euO8GAL+CdN/EIwcaeN0CshFNsuDhnbZbRd0fqVM1mvN8e15fig2vOgDDt4JNdbMOXpZi1UJQTkM0gAqFk/AJcaiRThCfBR5WBkJ5BGg7X0RyQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a66ae386-2aa8-4141-27e1-08deac7a3296
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 20:49:56.9206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEQ3nOLpnCJgqn+6Cfxf5GfLTWHxJMwYgCAENvrkWMCKym6tpCaf8t+75OsdgD5/AQQkGDXBf+jGfvQ0CMcJSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5811
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIxMCBTYWx0ZWRfX1z/ZFZQzigcQ
 +EJ121ZKTFzhrBhzNq5azGDpbdCn1EP0XTjtxHWqVhS8AwWk4cICzSZJgCk6+xQu7KjZ2cC2NKU
 +MdYL+BNsflCsj/Np2ks+bZ7nd4DjGcz87BQPQeUHXMTIgezMv5ouYsWQvBH4RfJMF/gx2D4vZs
 m2BoXVsHnd6DE24RvSmbZQpbMLUh7UN1sKpOKR9IG7Kn2s9ECTgpXDUWjeQ2SFv+UNksWPgLT0X
 bMrhsGwu16zjzIYr9/7CeYn7Ba8ir7jK/ZgLqvJycDgk2Ny4+iygmP8KABVfdmmv8a+h2NmyVma
 CwABNy/E0RYweEijzXZSxblpP82cV4iXk7IGkhwqmwuMqARi5xtbs7NmUPIfeoS1ZrVN5wUDeUH
 PTk7VhhOXhd/uR+LgcbkUxlSt/NURNh772MP2FNr/h5z54TLFtfMVkvo6zpa0st3bGzc3wVLWA0
 A2iZ+Gso4P22LcALHpQ==
X-Proofpoint-ORIG-GUID: ces4ohmZcBAzRtinDi7GmkQ0KSN0aqLS
X-Proofpoint-GUID: mU-7uy4FHiHYnVO1aku51-RX-ogFl5sN
X-Authority-Analysis: v=2.4 cv=BcLoFLt2 c=1 sm=1 tr=0 ts=69fcfaf9 cx=c_pps
 a=6VX5YHTAOo6o8GlK2BM1ww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=p0WdMEafAAAA:8 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=Bd0BzHEFX-MjWNWzrjAA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070210
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 20:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236621


On 5/7/26 06:34, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed May 6, 2026 at 11:48 PM CEST, Quan.Sun via lists.openembedded.org wrote:
>> From: Quan Sun <Quan.Sun@windriver.com>
>>
>> Key changes:
>> - The qemu.qmp library was removed from the main QEMU repository
>>    (see commit e1e49b35b3c3). Source the standalone python-qemu-qmp
>>    v0.0.6 from https://gitlab.com/qemu-project/python-qemu-qmp to
>>    continue providing QMP support for testimage.
>> - Refresh patches for new version.
>>
>> AI-Generated: Uses kiro-cli
>>
>> Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
>> ---
> Hi Quan,
>
> Thanks for your patch.
>
> It looks like the build is failing in some conditions:
>
> ERROR: nativesdk-qemu-11.0.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-qemu/11.0.0/temp/run.do_configure.663311' failed with exit code 1
> ...
> | DEBUG: Executing shell function do_configure
> | WARNING: unrecognized host CPU, proceeding with 'uname -m' output 'x86_64'
> |
> | ERROR: C compiler "i686-pokysdk-linux-gcc -march=i686 --sysroot=/srv/pokybuild/yocto-worker/qemuarm64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-qemu/11.0.0/recipe-sysroot" either does not exist or does not work.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/3717
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/3699
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/1514
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3743
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/3816
> ...
>
> Can you have a look at the issue?
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Hi Mathieu,

Currently there are quite a few qemu boot related issues, and we suspect 
upgrading to the latest version 11.0.0 would solve some of them (at 
least one of them will definitely disappear immediately, see 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=16259). Due to some 
complexities upgrading to a major new qemu version, I'm temporarily 
pausing this upgrade work to plan to bring the relevant qemu commit to 
the version 10.2.0, and I'll come back later to investigate these build 
issues.

Thanks,

Quan


