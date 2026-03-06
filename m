Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670B6FCC065
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 19:00:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2282.1772823611801235792
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 11:00:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=LhKDJyI7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7525053b8a=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BQWUB1172055
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Mar 2026 19:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=CXeW1AHWoHDCu4/daD5g+k
	Vm8nViXqzJweIYwDGr9fs=; b=LhKDJyI72XX6+bWpzkEUqyzfLSHL8aX9JEsOCE
	2tmpHOGF3znQzjngizgf+XBkXP0pBr+We3rZRmuS6JlhK+Xo3IVr/4FftYOch0x1
	BFoFE0somjVH6PZtAhxwBb5vFdMfe/0+OWzx/czy04ZcMq+RmTk8EAY26zCMlOUe
	HZMyyvhYdd+ein0MVkA+Hac4xi8yO4tw71b3nUk47kXlJKp0/Jl4ma5OyBTsueVc
	cJzqkZc7R6k1WGI536vkEhSY8DS2X853MdUJgJkwjQ4QfOROjJJpkqDZJznREROY
	mUkKS/xAC2Lvo9C+7Ai1MUo0dFVs5fpsuxPuzSQgY5UTuwPw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010022.outbound.protection.outlook.com [40.93.198.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cqv1yrj35-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 19:00:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCJDJe+/pP961LBsx7RwSHlET5KtAfmGOE50Zaz4D/VXrI1dNPeniPV6gRq7mlEQxHbFq6phKXtWMB3sWOTRIHfm5MnDdY6rf5wifcOSbriseztZ65C7t8SGwXpJXQHqYvi1b+IR8htvrgOgC/KPq3WCBkeE7i3G70PIXZP9SQACW29ifSDmI/n5ubbSR9v623WVY2h+72l5LqiCGWbGYtEKEiqO3DqT2Mqv8SstalSBY/gdFHywFQlyi0+J3NbJRiZ1NhJLsUP30I8AT34J/e4CeoWjrOjJ5vdXF/1+iauFkDnChjLavHvmpF59S2TOJQErQTPXCcxFMCfPUazPKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXeW1AHWoHDCu4/daD5g+kVm8nViXqzJweIYwDGr9fs=;
 b=Qx9sJkoR+s73eFgTRcrkCfIrISs12/fga+sL1CtJ/ys5fgt+ZidnGiN4sPzM5nwW26p7OeV2DmzMwsU10URvo7V/G7i8PuGwOONAiPI3/POI5BdTxHOg3rfLpWj4WAYNPuUki0phka5gkxMlzC/H5pBRHB9ED656c7i9hWMFln85sl0EqRdEQojAmQcV/P4jub615+aVPdl2nNBtYHBmlqv4Ou3zpCVDdAZapPKYs4OG0K21XJbB/V4HwTEXsVwQarjh5hSkEjiYzphuTQQFUcQQzfJmPlqTa9AgZ+OLNoqJ92HFKLx5/ASU8tZj8yT8vG+hdBfcSEJrMSr+7eXacg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 IA4PR11MB9394.namprd11.prod.outlook.com (2603:10b6:208:563::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 19:00:06 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 19:00:06 +0000
Content-Type: multipart/alternative;
 boundary="------------L0V5rroXwgFuJrZrza75rbaI"
Message-ID: <59a0aba3-8d3b-4bf1-9d5a-c1b2e7b16e8c@windriver.com>
Date: Sat, 7 Mar 2026 00:29:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.43 release
To: raj.khem@gmail.com, Randy MacLeod <randy.macleod@windriver.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
References: <20260127053941.792825-1-raj.khem@gmail.com>
 <DGM7WKPONTXD.ZOV8O0CMQHXR@bootlin.com>
 <25b7aea3-e05c-4378-95b7-ad269a4ee93d@windriver.com>
 <CAMKF1sr+-xaOSezgQ92xPUSX7qPH_ruG6_Zkfq+TAG1gGpWh5A@mail.gmail.com>
Content-Language: en-US
From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
In-Reply-To: <CAMKF1sr+-xaOSezgQ92xPUSX7qPH_ruG6_Zkfq+TAG1gGpWh5A@mail.gmail.com>
X-ClientProxiedBy: MA5PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::15) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|IA4PR11MB9394:EE_
X-MS-Office365-Filtering-Correlation-Id: 90e94caf-a3ea-4b08-92bf-08de7bb29489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|4022899009|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	UZMD75At5sb1bygHgmxWIWAJEHBHZ3rT9Zs0Yk1Zgye13rDnJEb5Tx06PZ39xQxe0TkDqV+Qj5GOTLJnC3VSGIYfnTOUTtJShwqGrDIsE9GwDOpsdansq+j6SJS/hvKMp2VnUoL6HDWTZjT+GMtDWgmrYMZnAweD4sNHNo1RTMInwgVMVn+KwD8uLsCAVcP0LNHJ1zgMtHfwXX7AmDAfc6kF/usYzI5FwPZYDZU25Mi/mqPRc/suLvg/xYjG++lfJDpbYTwnfb/e9frDPfL8XWl7/2jV0bWJ9GnIUlqUwS8RmtsORri5s9BwDVOqWM+WjjCf2BmRIUJYBRwE9BCOpXEH/0KcubjYmCbB0zCx09sc2NWJPok8aBEQob4b8CR7HrXr9iA8yvo9wPJTSJgsu+GdauPj4xcUOsRgwYC4tfkGwe0IGKMJdf1+m2sJ/a2BFOIPIdviG48DMPzYaSW9wAqFSNW1IRTIshYKRaoHNE6yapt8T9qusyJJFJC7KCoJaY/aszTZHvS0AzOmVTIr4lTqDIuEz/3CLeNa4bEbpTTHtUjks8zvHEJtn22nOFqQMPEAiYC8MGEG0iRGBYVhOniH4EfTJYAERgcj91RaIEo2f6+gKA7wxXWai+aoqMr7KnR4EYANb7xhAuPORO2Li3NW9gNakBtVJqCJQzHjO9+Mt1jxUhgW+N5YFf5rhF3l
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(4022899009)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?enRzNkxsWnYwajFqaldNS0gxSnVjV25qZ1ZQdEwzUUFpdDY4aUE2cHdBdW4r?=
 =?utf-8?B?M001UGV0QzZkSVdEK2FKbWt4NGdWdkVSL0ZmUnR6RDJnNkJ3Rm9LSllsSG1Z?=
 =?utf-8?B?NmdJL0d1cG1vd1RCa2V6dlpFUVd1ZzdlVmNjb1o0QTVFck5IakFPc0Y2QlpJ?=
 =?utf-8?B?ZDNRaGo3ajB4dFg1Q2JNdEJKK0UxQm9ua3A1cS9LcnlvV2M4KzFPNHkrSkE5?=
 =?utf-8?B?K1FWVGxydS9FbXRQYlNoaWgvd3RJNm1vN0E0OU96MVdLUGlkc0dmQUNLL2ZM?=
 =?utf-8?B?bmxzSVV4aXFIZVpqWXpVenRXSExxR2RMMDQrVVBGVWJEaGlHeWs2bHF6QnRW?=
 =?utf-8?B?K1NkYk05a3pUS0NCY3pXZHRiTU1CZ21JYUxCQ1psamRlVTE5ZHhENXplNGZH?=
 =?utf-8?B?SFZjRjQydG5STE5Pcy9oemVSR2ZoWkl5bW01Y1NyVFdYQnB6ZnhtMThOUTF2?=
 =?utf-8?B?THdGYzVXY2hleUNBQlVoUUZ5L2poalYzS0lDcy84Q0s0Um1sK3NpMTgyOTdY?=
 =?utf-8?B?TXNoM29IU3hqNWhCSXNoSytxR05mN0hHUGJORXhMeENsVEEzWHNvK2lodGQw?=
 =?utf-8?B?c24zUnI2Ukt1Sy9qT1g4Z1VGVUNSZXZkUmVoKzRFZm5XZGU0MUtGL3lNalhK?=
 =?utf-8?B?VkpiK1hHcGxBMUNaYmNMTytDRllWZFJCNTFNYWU1N2VickQ4OWtSeTJ0UVNr?=
 =?utf-8?B?dWwrbGFhK3ZXbElvSTFqVVBSRGJJNTUvVWFwOHB5ZjhwOXBrd0MzaEcyRldk?=
 =?utf-8?B?RGwydHYwTmlVdlhKTEx0N0gxWFR4N3dFVjB2alNYNUEwM2tLQW1PMGFLQk5W?=
 =?utf-8?B?TDB0bmJHTkRFUXlZbS9EMHlOTHJ4eU14MCtmSnJXYVM4NHBGMVRwd2xZUk1V?=
 =?utf-8?B?Q3BiaGd4V2dGWWRMZUMyRU9LY1pQU0I4SktLTTY2bE5PYnZpWmFXOEhvdUdE?=
 =?utf-8?B?b3ZhZ1pwSVoycVBPMWJ4RGdSUmVaYlhMQ09GK1RQZmNQalN5ekIvS1JaTmJy?=
 =?utf-8?B?Q1VETThwVnBiQ2YrRFVzWFIyQ213SUxLay9UVFRuRWtSY1VXODFOK2tkNlhu?=
 =?utf-8?B?VVdTd2xhVlc1VGV0YUFQMW8zSk01VUVOdUNSejB2OUJ0SGFSWmVHbDdiRitH?=
 =?utf-8?B?QXp5blVEZDVMN2VMUWlrcnVRSWdhYzNsTEs5eldYcWtoUEVpdFRHVStrQmNW?=
 =?utf-8?B?L1lMOEFldkpCbkE4aEJCZG4ydkJudVhpMnlWMjY4bGd4cnhyTElpV3dHaEhk?=
 =?utf-8?B?Y2J5bUp5WmpKdG5teTk0NURHYUV4SDExRWExQ1JId2tyNVdwTzVEQUFGZ3ZM?=
 =?utf-8?B?ek51SitreGJRY3FTUWVWelJueHQyc2VaREozS1RjUHpldkNsNVBNMVI3Umhh?=
 =?utf-8?B?TkRHcGI5OVFOZTJhU1Flb1lON0UxZjB5MjJydXlHbGVBU3hla1VINUxRMmpX?=
 =?utf-8?B?Y0VhK2k5SUdIbER3NFNPVHI1NTBTWGxueEhoR2dpaDFpQ21aRlVoRHVpdVJ0?=
 =?utf-8?B?Ump4M09wWDFmVk9NV3dqWEVDQ0RqNVVjbnp3T2JzSlhaRUM0VUYwQlJjKzBQ?=
 =?utf-8?B?ZTl2UDI0U2xBYTFRRUttdmFPOHF1akJja1VkeVNXQisrMWt4TTZkM3BRMi8z?=
 =?utf-8?B?YUhUM2ptN2VXc0R0dDFld0lMK3VGMHpGUExwN2VOaHkvNldnR25qVUovZ2VN?=
 =?utf-8?B?Mk5aV0tDSXBSbS9XOHhEQ0JRY0lKaFZZbVExVFIyV3h4NDZVSFR0RFZkelJQ?=
 =?utf-8?B?R3gwcWE3Rm95VFpYZWcyd2RZQ3h6N3NQR1VzUjQyUXM0bEJSMlFwVlNCWmZZ?=
 =?utf-8?B?dVYyRjBQT2JrUzloMkpjcmo3NnlmUFVxMVJYdEZaaWxQVEhpZXI4VWwvTmd1?=
 =?utf-8?B?R3JWNkdpRkpkZkgvaGpnd2JpWVV0Z0o2Vkc2LzBjRG1yRHVrbFArKyt5WXVN?=
 =?utf-8?B?b0JtWWkzWVA4ZWtxVjFHZC9mMVYrQmJsYnY1bmR4S2hMYnpudHFSVmZDOXFp?=
 =?utf-8?B?Q1l3WGFyNnhkQ1N0L2hEUGZYSzRxZng4Q1dxNzRsU0VEdVZmL3dsS3paNkEz?=
 =?utf-8?B?anBRbjc4bHFMbVFPMjdPdjFvWHYwbHNzMDVvZHpBRkk3cWQvM2RkRXZXcjkv?=
 =?utf-8?B?Ui9maXpKQyt4aEt6WmgvL1ozZitTaFlwK1d2eXJNc0hnMUVRK001U3U3MGVV?=
 =?utf-8?B?MnJXYUk0R3VKSVJzZktKbyt5bUFJK2JGNFVlTWh6UDUvejg1clVjWmN6M1pW?=
 =?utf-8?B?d0liN1FNeVhqV0JFTUJlUktMZHJMbzJHT2lkN3p2QmNFblowQkorcXF3QTFK?=
 =?utf-8?B?bSt2S0I5WXRsUVlsN2luQlJBMzlsbm01THRpMHgvOTVaOEFqdHZLZVZPLzFy?=
 =?utf-8?Q?SuEa+A1HpExhhepDFcBmbqM6nQvJV3Go+j9AkSkoZ/F+9?=
X-MS-Exchange-AntiSpam-MessageData-1: 1YpJz1YehX/jyUmzuBLqNBTcwy0qRj92gvA=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e94caf-a3ea-4b08-92bf-08de7bb29489
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 19:00:06.0455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SkRCuvkP9hehOg9hXs+1gsv8Yq34JuYUSYbErfgkBGSlOzNnhKlYW1jJnCAWTE/P65cc8paL1gME2SwktRaftyUCSW5WjXzCRoS6I2eyng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9394
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ObGVzxTY c=1 sm=1 tr=0 ts=69ab243a cx=c_pps
 a=F9MFHRSrL/QBKEkL9+MzCA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8
 a=CCpqsmhAAAAA:8 a=pGLkceISAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8
 a=GkcpNlNsh9uwZDpbLkMA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pi6R10etsEVP1wgH554A:9 a=rq1ImG4UR2zzLEno:21
 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ul9cdbp4aOFLsgKbc677:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 2uS1Om8qarxA01fOFJkEIY4lIZns_-ot
X-Proofpoint-GUID: xW-Od3VlXhq1KXSM9RRknk-rGXMa26Vt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE3OSBTYWx0ZWRfX2ipIbLo+kzm6
 6oR1s7p64fJ7+9NeyMSaR4oKOtRzf8f6S0jUw3DmNp1oeId47smACaUAzeuWRvDDLGLJQmV285p
 yKCbXdpcam05JwgXKI/Qt+MN3KGAoLaHOy6z+HIhTIPD/ZqVjzD2FuGhvOqQre11eLHEhal6f5g
 RTyad4Fo9uMBlQNHwXShTGzMQNzAY19snZK14o+NZ9ww8c3CHRDBoZ057P1BqK/d7bqUleOGwDT
 jWR3FAA+S2V30k4WqI+frTitXYpPYxZeOsX9X8iYV5LuY7pTbhwKo35VRHtlQ8jstroqRrIIhal
 wYlqZR8l81ulyXFArWsXPpHFHu8bVdzoxG27Q1eCFgk/8Psm876GUORcZnM+8EZbkqFzELRVHBr
 lfd1xiinfneq0ppD4y1tXootj+o804JkzOnmYsdFnyKehlHlJKBbGIM/5pxZXUX6RWWQDw4YA+l
 iN8BXMpb7FzNCnB96ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060179
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 19:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232589

--------------L0V5rroXwgFuJrZrza75rbaI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 626BQWUB1172055


On 06-03-2026 01:59 am, Khem Raj via lists.openembedded.org wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> Please pick the latest from my branch I will be traveling for next 10=20
> Days
>
> We picked up Khem=E2=80=99s patch and have been working on resolving th=
e=20
> autobuilder failure. The earlier autobuilder failure reported in this=20
> thread has been addressed However, running a bitbake world=C2=A0build=20
> initially exposed failures in the following modules:
>
>  *
>
>     gettext-0.26-r0
>
>  *
>
>     lib32-gettext-0.26-r0
>
>  *
>
>     dtc-1.7.2-r0
>
>  *
>
>     lib32-dtc-1.7.2-r0
>
>  *
>
>     m4-1.4.20-r0
>
>  *
>
>     lib32-m4-1.4.20-r0
>
>  *
>
>     lib32-ltp-20260130-r0
>
>  *
>
>     ltp-20260130-r0
>
>  *
>
>     lib32-barebox-tools-2026.01.0-r0
>
>  *
>
>     barebox-tools-2026.01.0-r0
>
>  *
>
>     lib32-pseudo-1.9.3+git-r0
>
>  *
>
>     pseudo-1.9.3+git-r0
>
> Several of these issues have been resolved by upgrading the affected=20
> components or by backporting upstream fixes.
>
> The remaining failures are currently in:
>
>  *
>
>     lib32-ltp-20260130-r0
>
>  *
>
>     ltp-20260130-r0
>
>  *
>
>     lib32-barebox-tools-2026.01.0-r0
>
>  *
>
>     barebox-tools-2026.01.0-r0
>
> We are continuing to investigate these issues and will share the=20
> updates soon.
>
> On Thu, Mar 5, 2026, 8:23=E2=80=AFAM Randy MacLeod via lists.openembedd=
ed.org=20
> <http://lists.openembedded.org>=20
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
>     On 2026-02-23 4:01 a.m., Mathieu Dubois-Briand via
>     lists.openembedded.org <http://lists.openembedded.org> wrote:
>>     On Tue Jan 27, 2026 at 6:39 AM CET, Khem Raj vialists.openembedded=
.org <http://lists.openembedded.org> wrote:
>>>     License-Update: Match to changes [1]
>>>
>>>     Added free_sized, free_aligned_sized, memset_explicit, memalignme=
nt, and new time bases (TIME_MONOTONIC, etc.).
>>>
>>>     Support for the Linux mseal system call to protect memory mapping=
s (sealing).
>>>
>>>     Added support for the openat2 system call, allowing more granular=
 file opening options.
>>>
>>>     New, optimized, and correctly rounded functions from the CORE-MAT=
H project (acosh, asinh, atanh, erf, erfc, lgamma, tgamma).
>>>
>>>     Significant 4x improvements for fused multiply-add (FMA) on AMD Z=
en 3 by updating ldbl-96 implementation.
>>>
>>>     Improved remainder, frexp, and frexpl.
>>>
>>>     Experimental Clang Support: Added support for building with LLVM =
Clang (version 18+) on AArch64/x86_64 Linux.
>>>
>>>     New CPU Detection: Enhanced detection for newer CPU architectures.
>>>
>>>     64-bit atomics for 32bit x86 patch is no longer required since up=
strea has dropped this logic in 2.43 release
>>>
>>>     [1]https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Da0ce8=
b0779e290596e99ca6d96c301684a2d7cfe
>>>
>>>     Signed-off-by: Khem Raj<raj.khem@gmail.com> <mailto:raj.khem@gmai=
l.com>
>>>     ---
>>     Hi Khem,
>>
>>     I have some build issue with this patch. Yet I had some merge
>>     conflicts, so maybe my resolutions were not correct.
>>
>>     ERROR: nativesdk-gcc-runtime-15.2.0-r0 do_compile: Execution of '/=
srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-nati=
vesdk-pokysdk-linux/nativesdk-gcc-runtime/15.2.0/temp/run.do_compile.3275=
864' failed with exit code 1
>>     ...
>>     | /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work-s=
hared/gcc-15.2.0-r0/sources/gcc-15.2.0/libgomp/affinity-fmt.c:330:25: err=
or: initialization discards 'const' qualifier from pointer target type [-=
Werror=3Ddiscarded-qualifiers]
>>     |   330 |               char *q =3D strchr (p + 1, '}');
>>     |       |                         ^~~~~~
>>
>>     https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/=
3240
>>     https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds=
/3229
>>
>>     The branch that was tested if you want to check:https://git.yoctop=
roject.org/poky-ci-archive/tag/?h=3Doecore/autobuilder.yoctoproject.org/v=
alkyrie/a-full-3260
>>
>>     Thanks,
>>     Mathieu
>
>
>     Khem,
>
>     Will you send a new version of this patch or should Deepesh do that=
 ?
>     We need this ASAP.
>
>     ../Randy
>
>>
>
>     --=20
>     # Randy MacLeod
>     # Wind River Linux
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232518):https://lists.openembedded.org/g/openembedd=
ed-core/message/232518
> Mute This Topic:https://lists.openembedded.org/mt/117484328/10244482
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [H=
emanth.KumarMD@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--=20
Regards,
Hemanth Kumar M D

--------------L0V5rroXwgFuJrZrza75rbaI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 626BQWUB1172055

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 06-03-2026 01:59 am, Khem Raj via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sr+-xaOSezgQ92xPUSX7qPH_r=
uG6_Zkfq+TAG1gGpWh5A@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"auto">Please pick the latest from my branch I will be
          traveling for next 10 Days&nbsp;</div>
        <br>
        &nbsp;
        <p>We picked up Khem=E2=80=99s patch and have been working on res=
olving
          the autobuilder failure. The earlier autobuilder failure
          reported in this thread has been addressed However, running a
          bitbake world&nbsp;build initially exposed failures in the
          following modules:</p>
        <ul>
          <li>
            <p>gettext-0.26-r0</p>
          </li>
          <li>
            <p>lib32-gettext-0.26-r0</p>
          </li>
          <li>
            <p>dtc-1.7.2-r0</p>
          </li>
          <li>
            <p>lib32-dtc-1.7.2-r0</p>
          </li>
          <li>
            <p>m4-1.4.20-r0</p>
          </li>
          <li>
            <p>lib32-m4-1.4.20-r0</p>
          </li>
          <li>
            <p>lib32-ltp-20260130-r0</p>
          </li>
          <li>
            <p>ltp-20260130-r0</p>
          </li>
          <li>
            <p>lib32-barebox-tools-2026.01.0-r0</p>
          </li>
          <li>
            <p>barebox-tools-2026.01.0-r0</p>
          </li>
          <li>
            <p>lib32-pseudo-1.9.3+git-r0</p>
          </li>
          <li>
            <p>pseudo-1.9.3+git-r0</p>
          </li>
        </ul>
        <p>Several of these issues have been resolved by upgrading the
          affected components or by backporting upstream fixes.</p>
        <p>The remaining failures are currently in:</p>
        <ul>
          <li>
            <p>lib32-ltp-20260130-r0</p>
          </li>
          <li>
            <p>ltp-20260130-r0</p>
          </li>
          <li>
            <p>lib32-barebox-tools-2026.01.0-r0</p>
          </li>
          <li>
            <p>barebox-tools-2026.01.0-r0</p>
          </li>
        </ul>
        <p>We are continuing to investigate these issues and will share
          the updates soon.</p>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 5, 2026, 8:23=
=E2=80=AFAM
            Randy MacLeod via <a href=3D"http://lists.openembedded.org" m=
oz-do-not-send=3D"true">
              lists.openembedded.org</a> &lt;randy.macleod=3D<a href=3D"m=
ailto:windriver.com@lists.openembedded.org" moz-do-not-send=3D"true" clas=
s=3D"moz-txt-link-freetext">windriver.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <div>On 2026-02-23 4:01 a.m., Mathieu Dubois-Briand via <a =
href=3D"http://lists.openembedded.org" target=3D"_blank" rel=3D"noreferre=
r" moz-do-not-send=3D"true">
                  lists.openembedded.org</a> wrote:<br>
              </div>
              <blockquote type=3D"cite">
                <pre>On Tue Jan 27, 2026 at 6:39 AM CET, Khem Raj via <a =
href=3D"http://lists.openembedded.org" target=3D"_blank" rel=3D"noreferre=
r" moz-do-not-send=3D"true">lists.openembedded.org</a> wrote:
</pre>
                <blockquote type=3D"cite">
                  <pre>License-Update: Match to changes [1]

Added free_sized, free_aligned_sized, memset_explicit, memalignment, and =
new time bases (TIME_MONOTONIC, etc.).

Support for the Linux mseal system call to protect memory mappings (seali=
ng).

Added support for the openat2 system call, allowing more granular file op=
ening options.

New, optimized, and correctly rounded functions from the CORE-MATH projec=
t (acosh, asinh, atanh, erf, erfc, lgamma, tgamma).

Significant 4x improvements for fused multiply-add (FMA) on AMD Zen 3 by =
updating ldbl-96 implementation.

Improved remainder, frexp, and frexpl.

Experimental Clang Support: Added support for building with LLVM Clang (v=
ersion 18+) on AArch64/x86_64 Linux.

New CPU Detection: Enhanced detection for newer CPU architectures.

64-bit atomics for 32bit x86 patch is no longer required since upstrea ha=
s dropped this logic in 2.43 release

[1] <a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Da=
0ce8b0779e290596e99ca6d96c301684a2d7cfe" target=3D"_blank" rel=3D"norefer=
rer" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://sou=
rceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Da0ce8b0779e290596e99ca6d96c=
301684a2d7cfe</a>

Signed-off-by: Khem Raj <a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank" rel=3D"noreferrer" moz-do-not-send=3D"true">&lt;raj.khem@gmail.com=
&gt;</a>
---
</pre>
                </blockquote>
                <pre>Hi Khem,

I have some build issue with this patch. Yet I had some merge
conflicts, so maybe my resolutions were not correct.

ERROR: nativesdk-gcc-runtime-15.2.0-r0 do_compile: Execution of '/srv/pok=
ybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-nativesdk-p=
okysdk-linux/nativesdk-gcc-runtime/15.2.0/temp/run.do_compile.3275864' fa=
iled with exit code 1
...
| /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work-shared/g=
cc-15.2.0-r0/sources/gcc-15.2.0/libgomp/affinity-fmt.c:330:25: error: ini=
tialization discards 'const' qualifier from pointer target type [-Werror=3D=
discarded-qualifiers]
|   330 |               char *q =3D strchr (p + 1, '}');
|       |                         ^~~~~~

<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/bui=
lds/3240" target=3D"_blank" rel=3D"noreferrer" moz-do-not-send=3D"true" c=
lass=3D"moz-txt-link-freetext">https://autobuilder.yoctoproject.org/valky=
rie/#/builders/4/builds/3240</a>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/bu=
ilds/3229" target=3D"_blank" rel=3D"noreferrer" moz-do-not-send=3D"true" =
class=3D"moz-txt-link-freetext">https://autobuilder.yoctoproject.org/valk=
yrie/#/builders/19/builds/3229</a>

The branch that was tested if you want to check: <a href=3D"https://git.y=
octoproject.org/poky-ci-archive/tag/?h=3Doecore/autobuilder.yoctoproject.=
org/valkyrie/a-full-3260" target=3D"_blank" rel=3D"noreferrer" moz-do-not=
-send=3D"true" class=3D"moz-txt-link-freetext">https://git.yoctoproject.o=
rg/poky-ci-archive/tag/?h=3Doecore/autobuilder.yoctoproject.org/valkyrie/=
a-full-3260</a>

Thanks,
Mathieu</pre>
              </blockquote>
              <p><br>
              </p>
              <p>Khem,&nbsp;</p>
              <p>Will you send a new version of this patch or should
                Deepesh do that ?<br>
                We need this ASAP.</p>
              <p>../Randy</p>
              <blockquote type=3D"cite">
                <br>
                <fieldset></fieldset>
              </blockquote>
              <p><br>
              </p>
              <pre cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
            </div>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#232518): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/232518">https:/=
/lists.openembedded.org/g/openembedded-core/message/232518</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/117484328/10244482">https://lists.openembedded.org/m=
t/117484328/10244482</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:Hemanth.KumarMD@windriver.com">Hemanth.KumarMD@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Regards,
Hemanth Kumar M D</pre>
  </body>
</html>

--------------L0V5rroXwgFuJrZrza75rbaI--

