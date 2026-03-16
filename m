Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1672F30295
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 02:24:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42569.1773627865803000778
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 19:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=shSDwinS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75357a93d8=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G1D1rf1871932
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=BVLqXpDClvf1Pf5ic6GdFEGmpvvxG/NQ3bVHztYc3Go=; b=
	shSDwinStq89+EeYzo2j+bEheDv+321WqLcbjBj7BIo+enDS50+qb5MqltTfTFzT
	VBFC/FouQNz6fWoMg+JEdLnNZYJ9loos/6U6UKTkqp06rFOotAqCZldlFCqMpjd5
	9S8vMTni9K0jG2PiKcxtt33mOFV4+5rD6oJbZhsAq9CadKASxXQKVx3Jgbt3NaG8
	wSU5iBHqAYQBgbsuRKbLk3fwYsvxzShbfQft/QX/9Nelnph+t6NYILzCEuPRIEbg
	nXedmbZ/JAtbWAIpR7caTwjYgR1Xa0CoOvzpAd0spYyuRs9r89ckWsahjVGFRx7B
	oVoiDAf9h7nmCHwUJ1uNMw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011041.outbound.protection.outlook.com [52.101.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cvvvyhjbt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Mar 2026 02:24:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmc3oJGOCMXQHFn5/DoG5hm12LDJ83xHWhrnShg10kDmY7Mq/WSfqsUMgyakT8xf/68Slr6WBLQU5EzsVu1oXuSHFTo1fn50VPds5muRVHCetZfmgN45lk2FvxcZ+ltYYGuHZ1RlpQnZiXKy0i8hCb7Co3Mlm7/UuOA/p96zMkJvNJ5AxLSwrLsI2vgm/6NEXL2FbSYE3SFH9mHbNwQSaMA/2/66ODlgjJCFM4+QSl5Z5pbElEdTu9ZiDlTX5UuV1TDkFYa6HehJA41jNgHxtMRaCUszVF/RLFrlAf9w7SasoREZiFohO1i6h2Vietu8V0RtYmtkLRzFsyVj9c+D6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVLqXpDClvf1Pf5ic6GdFEGmpvvxG/NQ3bVHztYc3Go=;
 b=W4tENlmMwZ3Uk5SIw7GEyGZISbW4osnlmjRoJfk2I/nuzgAWYvlmFr+zZx3kCwdvJ5wJ0kA9CtaSGPyc/6KiyhSiDWrgcK5xaTBkHWavDcHpfCH4FZg64moxGtGJ1Aq5tMg3I2yVCDZckFobUzxQFq7Po9xlVnnySTsypzzrIAjfqOJ41PXKHEjaQwWUR/YHOnH0ymfyiF+8BoJQqLq7DktR0Eb+91QfRkqvD1vrnkzVKSExYH1JhxjVAz8HqWCbNqrZEwRmFH5WoeqqDboQEuq2Osic2Zn9gAAtVXIQkkGC/QAo3fY5MI5/Vz0dk94RGDPJonbThoq6ve80SfLc7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SJ5PPF4422C5374.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::824) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.13; Mon, 16 Mar
 2026 02:24:20 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9723.013; Mon, 16 Mar 2026
 02:24:20 +0000
Message-ID: <a2daf4b9-9b4f-418c-bddc-11ade8b3920e@windriver.com>
Date: Mon, 16 Mar 2026 10:24:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/4] python3-setuptools: upgrade 80.9.0 ->
 82.0.0
To: Martin Jansa <martin.jansa@gmail.com>, marcel@ziswiler.com
Cc: openembedded-core@lists.openembedded.org,
        mathieu.dubois-briand@bootlin.com
References: <20260304045413.3265198-1-hongxu.jia@windriver.com>
 <d291e85326d0d184045b7492aa5a1241b210763a.camel@ziswiler.com>
 <CA+chaQfjTQxPAWr0jomTZmsFRMvKh-D-=AAtfYkZxxOsZhUh3Q@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CA+chaQfjTQxPAWr0jomTZmsFRMvKh-D-=AAtfYkZxxOsZhUh3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:4:197::10) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SJ5PPF4422C5374:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f2d7d9-a33c-437c-ca34-08de830321a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	fnbJVk++d5ImXStCLIIZiMC1HtlZNwI5G22/5Fhlwxd4ghcB6Oe44LjIn23vpr5Yssgwf5fYlQ0Csgllm+n618wwMKwsQiAzFCFVpkwON7dMQHuEqLv6ommdZROTde/owm0BKNkJLRZzJiSezMPr8WoscyxNq9uNxLjdSN2a2AwjIGBJHlCqeHN2/8fyA2DuYaQjaHf7iUGgG/xG4y4JcKw8gpLcZLd50VfSAYjqy8lkHnYFdxe7LBFQ6LWuV5jhMYk4oyfeNDpFpeXD/3oo+jKpf+6XMSpTYDO0AFCVMZRIhK2hEs3XGEFnSVZqP+pfitlUs+0a0kI0tGcDXHxVK23H5PIypNLYyk4xPuhSEiG0MYUuJ8o2hY/KWu8VVUN8cVYA4TG2EFXhrmBkDhfnjXPkrtDKzGbnLEHj44k155SaI04c06b83JbM9Ihfo0j6Gz6nQCewDjV9iqdyjsP7idmTJQLep92fcYffXxt6L0bhkGZuJUe6dzeo9K8FBiI3pZwC4qFNd9+QE4+f49q/QgfOFsiNa5j75XwpJIbaWOLJKmxferzbA9bDH05OZyxcJcbzEVN7zG83tTV6Lv/KRO2YbVxJHuS5+fBOYIBAdUy5U3MBrW31COHgwwXf2TLGUhsHzQkNmbnSGjvfKHnB9xRCI2DvuV8fmvQ2HkJ0cPOFw7tWjsguuoJlWrSD/IMU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OUE3N3h4bVJzUXRrSnpiK0dEN3FtQ0U5ZFNXUFJ1QlIvVUlsekdwV0JyTURn?=
 =?utf-8?B?czVLZ1RhZmV1ck9xWGQxRVNTTE9FUU9zS1lJNmtvMG1iYUNicW5CcHdnYkto?=
 =?utf-8?B?ZlVTcUcxSHhRRHFWSWdMUVYrb0l6V3NCN0RWWGJZRjM4ejBOYVlVaGpkVTBz?=
 =?utf-8?B?RFo3TldoNXhFdDdBYWdlL2RPcmRjci9jMmR4Y2xqdTdaeERmbS80SzB4cFRn?=
 =?utf-8?B?TmptN1JBcjJLb29NVWd0VFNEY041b0FDM1dEaWZPTTU0ZWQ2SjdnNnhlanFV?=
 =?utf-8?B?d0NWWFBkTG9INVRsZDkvMWY5MWp0eTQ1a0VZa0FlOTUxQ2RpbjVhcVdvV2Ro?=
 =?utf-8?B?Wk9LR0dxL2t5U3Z6UFhpbDZ0YnJVZmJ6T0lkWTZib1VwWUZMTnNOeVR0ckhC?=
 =?utf-8?B?bDBBdWNWU3FvV3lQazhZdlpCWUMwRU0rVmdiY29vZ000TzRRSXMyM1greFhm?=
 =?utf-8?B?bFFLTVptZVhkVVVSUXdwbHladHV4N2Q5ZGt2U012SG9BOEE0TUpkN3VkTGJs?=
 =?utf-8?B?bHUrZkNzUTNpWDNHVUpCekoxL1BneVVHZjFMcFh4NG1GMVc2bUxMU0w3R1BK?=
 =?utf-8?B?cFZ4SmNITC8ybVRySXRtU3lHSllhQlhUK1pLQ1VQZ1ZxNWNMR25TYnVxaVRv?=
 =?utf-8?B?UjVQcndUOGs5ODRIcGFwTXFyZmNET0ZvK08veTZuanFMbTZ3VW9tcDNZUmRw?=
 =?utf-8?B?aS8xa040YjVzUG5JWTJxV3FFYUwrLy9kajRESHJpMENlN094ckF3dFYrSmlE?=
 =?utf-8?B?YUR5c1E2TXdxZzVta3lUYlRWVEEwMjNQbk56bGNIYmhGaThnMXMycGZnT21X?=
 =?utf-8?B?emVyUFJ6cVlWNEIyLzdQYkI4UTQrbENZejhEZzdpNkpwRU81L3FmOWJkVm1o?=
 =?utf-8?B?aWJHWWJXRzN3R2hCNFFSeWlzdU9EeFM1QVYxMnRoZEI2K25WQmUrcmY1ZFF3?=
 =?utf-8?B?OGJzZXh3dzJNanNFYVljdGRoR28xTTVvVk5pSWFnTzMrTEU0UXNpMjZ5d0tr?=
 =?utf-8?B?eExmdDNhYjNGckQ4TlJGUHlJR2dpRXJ6MGRLM0hXREsrWWlSbEJJYy9pTGJq?=
 =?utf-8?B?TExqTXFQZnpVY1FjUTFLODJnZE5pRVBlVDFrTEorSUwySVFDNk1xQndGUTVL?=
 =?utf-8?B?ajU5TExhdnhwOUlidGp6NVBtQUVncGhiTkdtcmFwbjZYWUV3ZWRicWMvMVQw?=
 =?utf-8?B?TFoyUGk1bFdyTXV2SGVweFhoa0VGYWJ2TDJ1dUkzWlpXaE9XdWs1ODd3ZkIv?=
 =?utf-8?B?NUtudnhDS0JLQWVDQU5tUXNZTE90RllKZmptL1k3OUYwWEExTjl3V1Y5UUVU?=
 =?utf-8?B?YXF0UUZhSWJicHQ1NEV3NDVzNTRtTXJlaTlrM284anhIdmpFdnp2WlQzc1hG?=
 =?utf-8?B?UTZFb0UxUGNwNXlCenl5TlBPZ0h6MGRjUEp6T2IzT1RZUU5OVFNPT2xid0Js?=
 =?utf-8?B?MEZnV1RkU3RwV1IrQnRvb0Rod3VyRVJDS0tyMDFBeWR6ZExSK0x1UXorb0Zt?=
 =?utf-8?B?QzhTMDV0NjJMTlY3VkdQSEMrR2RYckxlWXRsQXl2aFlMOWJrOTl5U2dBYmUr?=
 =?utf-8?B?T2p1NXQwM3JDRnNNa0tncjFFaXkyeVA1OXRrYVhqYzc0M0xkWXRYREdmUDA3?=
 =?utf-8?B?emZNOUo4amxJVXFYekJuNmJDdnQ2TSswUy9XWjlxZG9EWHdDczc3cG5YMFQ2?=
 =?utf-8?B?QzZlZ0FzYVgwTFk0OVNiV1liZUlPNzgxT1h1dHNhUG56dzVaTjViU0VyWDBk?=
 =?utf-8?B?MWF4RlkxZUNPMjJpc3dQQ01BSUVlSUhubG1pcmRnRWdHUC8zUmpmaWNFQ2k5?=
 =?utf-8?B?Tk9LclVvZXhtMjYxdmtkWVA2V2FCM0hBZnBScnZYTnZ3Z0Y2TTZnZ1FPKzdP?=
 =?utf-8?B?NjNZZEZvczJUQmF6WEJGdXZmUkNTQ0tkek9pZExKbXM3MWV3eFJ3OVgvbHpr?=
 =?utf-8?B?WTJvUHJrTU9EbGZjNmhFYXQwQ3NpL1ZpOWRuclpVdUdOSUVuRVZzZkNCNWF3?=
 =?utf-8?B?Skx1Z1V4eDQ0TDE4b0lpMU9TbkVGbWl1SXB3cG5lZHZybjhvd3N1U3dhYVVS?=
 =?utf-8?B?eGM1NHZBeTdsTGxMRkYwaEJIT2JxSmdXeDM3SWlTeEFiVnhTZkxFc2hjSVVs?=
 =?utf-8?B?QXBQOElWcFNDTlJ3MlVsREJJYUt5cVVQT0lMbWF2OUNpRzlqQmlsZGg4Vkhl?=
 =?utf-8?B?MEZ2ZFIyT3dkTmVSb3JuU3oyR2JXQnloaE0wR0sxUWY3WU9QTGVJRzNGTjUy?=
 =?utf-8?B?QnFwd1o5eWc4SExhQ2VhYWZ6eGVMV1Z5T2JtZGo4S0d3a0FCT2tPYUFNeEtr?=
 =?utf-8?B?bGU4ckJHQVdaRmdaYzVrM0p3dXBVZXZ6QWc2eDJOdk5XY200Z1BPZz09?=
X-Exchange-RoutingPolicyChecked: 
	Tmy/VYUFSRlTCM6AJH5RZR++sXjZ/uuHQAx5JDYLB6yISTTK3hU5MQPpzkF2cApbG4ZY3Dmy8m4Ey3V4SBACkz5BpXYSCldSp8G01O0LDnoOX0OnKSVH6P+55aOKsbxOxeYBIBPXmi1vp6dLYjgz7E/p6nU965VhGAQ5t8/5jBDWPzTzsKhlX+idEVyk4gBXqYFe9EMal4jFti2+tt851WgHMXrNz1gNkZPy6isyMCOWvLd/+9DadIQKxzxWqUwwoI/3BIRRJv/oDHT+Nn6MN2sHWAh3aPmjCMu1gtKigVZKB5/VTkv265B1aV1i0qrpoXjN+zrKsJjqQ9+5GmdYWw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f2d7d9-a33c-437c-ca34-08de830321a6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:24:20.7116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Non/YZcsCUqTCl8l81MHFLsXbb/Un4f8VlNuUyPpSMcosVFvNbZ7N8RJhr0Z3rsTPsb6eiwIwJbCFijs6ToBsD4XCiYNSgGk3tu62r0nnC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4422C5374
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=E4XAZKdl c=1 sm=1 tr=0 ts=69b769d8 cx=c_pps
 a=QmrQXVULtgJTkzLS4HxzTg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=iGHA9ds3AAAA:8 a=dXvAoEkxAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=pOPcLR2oCMueDlcXuXwA:9 a=36DcYDAlGrXZe9iL:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=iJ39DRKJB4kz2P1Iyp3E:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAxNyBTYWx0ZWRfX2X/ZDK38BQKZ
 FzjwUmazsx6eu6uPfRqshA/pzuhFCxDCUArmSPz+0X7MCZi4o9zK6LXKrPqts11J/vybNh/bKee
 fogsvpaqU/kK4zbq4rgN7BYTUw3WuT3IRiDOcULgyxi7hNu0xmcksGgJ91h3qS1QHN3nx3UrLwq
 iTj8tfMWd8Arh3Cj9lMN2aH/h0H0w5OEyOJMLQX2pAwyRAu6INom2xCWsmobxAh7X1KJazlhrnC
 /jVrGPE4ZTLL+H9jyOwaOwPZOnCfAFdvAjDbntlLQ121r0NImEgpF9qIb3u59y3enKhEV0ot2XC
 Pjpq96OvDPx62X7xNFiTtALDcD7jbGSWRxslor7eketw2aUTRHqvqSmBz3moXeI0rlZ6OsiP70t
 StB2xPOQhLBbV0zYXYhK51uEqRnhIlP5Y3mnAexTPhjTAXI4VdT4qWEm8CuWtRWThdnkDgbmr/L
 JFc9+OlfbnANWft7zaQ==
X-Proofpoint-GUID: YrZXjeXnJ-Xd1kcQkgCsENfTyBA5qdEV
X-Proofpoint-ORIG-GUID: Es_HMKhjGHslW6e2NUwyUED0dP2-uZkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160017
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62G1D1rf1871932
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233201

On 3/13/26 17:43, Martin Jansa wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Don't you have meta-tensorflow included in your build and set it to
> use python-3.13 instead of 3.14 as in:
> https://git.yoctoproject.org/meta-tensorflow/commit/?id=3Df1b4477144597=
0cb389a50b5885356c987b8931a
>
> 3.13 is not compatible with new setuptools, I have seen the same
> errors then removed meta-tensorflow and it built fine again.
>
> Hopefully https://lists.yoctoproject.org/g/yocto-patches/message/3323
> will be resolved soon.

I am working to upgrade meta-tensorflow with python 3.14

many failures to fix, coming soon

//Hongxu

> Regards,
>
>
> On Fri, Mar 13, 2026 at 10:25=E2=80=AFAM Marcel Ziswiler via
> lists.openembedded.org <marcel=3Dziswiler.com@lists.openembedded.org>
> wrote:
>> Hi Hongxu Jia
>>
>> On Wed, 2026-03-04 at 12:54 +0800, Hongxu Jia wrote:
>>> Remove python3-pkg-resources
>>>
>>> History v82.0.0 [1]:
>>>
>>> Deprecations and Removals
>>> - pkg_resources has been removed from Setuptools. Most common uses of=
 pkg_resources have
>>>    been superseded by the importlib.resources and importlib.metadata =
projects. Projects
>>>    and environments relying on pkg_resources for namespace packages o=
r other behavior
>>>    should depend on older versions of setuptools. (#3085)
>>>
>>> [1] https://setuptools.pypa.io/en/stable/history.html#v82-0-0
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> [snip]
>>
>> Unfortunately, this seems to break all my meta-riscv machine builds:
>>
>> ...
>> | gcc -shared -L/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_=
64-linux/python3-cython-
>> native/3.2.4/recipe-sysroot-native/usr/lib -L/var/home/sumo/Sources/ri=
scv-yocto/build/tmp/work/x86_64-
>> linux/python3-cython-native/3.2.4/recipe-sysroot-native/lib -Wl,--enab=
le-new-dtags -Wl,-rpath-
>> link,/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/py=
thon3-cython-native/3.2.4/recipe-sysroot-
>> native/usr/lib -Wl,-rpath-link,/var/home/sumo/Sources/riscv-yocto/buil=
d/tmp/work/x86_64-linux/python3-cython-
>> native/3.2.4/recipe-sysroot-native/lib -Wl,-rpath,/var/home/sumo/Sourc=
es/riscv-yocto/build/tmp/work/x86_64-
>> linux/python3-cython-native/3.2.4/recipe-sysroot-native/usr/lib -Wl,-r=
path,/var/home/sumo/Sources/riscv-
>> yocto/build/tmp/work/x86_64-linux/python3-cython-native/3.2.4/recipe-s=
ysroot-native/lib -Wl,-O1 -Wl,--allow-
>> shlib-undefined -Wl,--dynamic-linker=3D/var/home/sumo/Sources/riscv-yo=
cto/build/tmp/sysroots-uninative/x86_64-
>> linux/lib/ld-linux-x86-64.so.2 -pthread -isystem/var/home/sumo/Sources=
/riscv-yocto/build/tmp/work/x86_64-
>> linux/python3-cython-native/3.2.4/recipe-sysroot-native/usr/include -O=
2 -pipe -
>> isystem/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/=
python3-cython-native/3.2.4/recipe-
>> sysroot-native/usr/include build/temp.linux-x86_64-cpython-314/var/hom=
e/sumo/Sources/riscv-
>> yocto/build/tmp/work/x86_64-linux/python3-cython-native/3.2.4/sources/=
cython-3.2.4/Cython/Compiler/Code.o -
>> L/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python=
3-cython-native/3.2.4/recipe-sysroot-
>> native/usr/lib -o build/lib.linux-x86_64-cpython-314/Cython/Compiler/C=
ode.cpython-314-x86_64-linux-gnu.so
>> | running bdist_wheel
>> | error: invalid command 'egg_info'
>> | WARNING: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-li=
nux/python3-cython-
>> native/3.2.4/temp/run.do_compile.2101018:159 exit 1 from 'nativepython=
3 setup.py --verbose build -j 48
>> bdist_wheel --dist-dir /var/home/sumo/Sources/riscv-yocto/build/tmp/wo=
rk/x86_64-linux/python3-cython-
>> native/3.2.4/dist'
>> | WARNING: Backtrace (BB generated script):
>> |       #1: setuptools3_do_compile, /var/home/sumo/Sources/riscv-yocto=
/build/tmp/work/x86_64-linux/python3-
>> cython-native/3.2.4/temp/run.do_compile.2101018, line 159
>> |       #2: do_compile, /var/home/sumo/Sources/riscv-yocto/build/tmp/w=
ork/x86_64-linux/python3-cython-
>> native/3.2.4/temp/run.do_compile.2101018, line 149
>> |       #3: main, /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x8=
6_64-linux/python3-cython-
>> native/3.2.4/temp/run.do_compile.2101018, line 166
>> ERROR: Task (virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/=
openembedded-core/meta/recipes-
>> devtools/python/python3-cython_3.2.4.bb:do_compile) failed with exit c=
ode '1'
>> ...
>> Summary: 7 tasks failed:
>>    virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedd=
ed-core/meta/recipes-
>> devtools/python/python3-pyelftools_0.32.bb:do_compile
>>      log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-lin=
ux/python3-pyelftools-
>> native/0.32/temp/log.do_compile.2101167
>>    virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedd=
ed-core/meta/recipes-
>> devtools/python/python3-markupsafe_3.0.3.bb:do_compile
>>      log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-lin=
ux/python3-markupsafe-
>> native/3.0.3/temp/log.do_compile.2100841
>>    virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedd=
ed-core/meta/recipes-
>> devtools/python/python3-calver_2025.10.20.bb:do_compile
>>      log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-lin=
ux/python3-calver-
>> native/2025.10.20/temp/log.do_compile.2101147
>>    virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedd=
ed-core/meta/recipes-
>> devtools/meson/meson_1.10.1.bb:do_compile
>>      log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-lin=
ux/meson-
>> native/1.10.1/temp/log.do_compile.2100900
>>    virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedd=
ed-core/meta/recipes-
>> devtools/python/python3-setuptools-scm_9.2.2.bb:do_compile
>>      log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-lin=
ux/python3-setuptools-scm-
>> native/9.2.2/temp/log.do_compile.2100993
>>    virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedd=
ed-core/meta/recipes-
>> devtools/python/python3-mako_1.3.10.bb:do_compile
>>      log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-lin=
ux/python3-mako-
>> native/1.3.10/temp/log.do_compile.2101162
>>    virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedd=
ed-core/meta/recipes-
>> devtools/python/python3-cython_3.2.4.bb:do_compile
>>      log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-lin=
ux/python3-cython-
>> native/3.2.4/temp/log.do_compile.2101018
>> Summary: There were 16 WARNING messages.
>> Summary: There were 7 ERROR messages, returning a non-zero exit code.
>>
>> If I revert commit ab6b2bf7b555d3516abea6255b800fe6f9673a69 all builds=
 fine again.
>>
>> Any ideas?
>>
>> Thanks!
>>
>> Cheers
>>
>> Marcel
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#233031): https://lists.openembedded.org/g/openembe=
dded-core/message/233031
>> Mute This Topic: https://lists.openembedded.org/mt/118127779/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


