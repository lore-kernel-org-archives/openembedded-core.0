Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFB7CD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 07:46:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19617.1780386393015172122
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 00:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=JxYlDe05;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=061317d246=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525QMxN982285
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jun 2026 00:46:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ST6qpXYdbS82MX+Y00gqF6vMdKb4gWy0FjLLuThH7Xo=; b=
	JxYlDe05EyD70oziNU4YdtbVIVYJrjQDQY6HQPqBo/FwtlLz0yjqy7S6b8dJCBpe
	saq+obFi8Xc8/9zmNBEKXp2IVWigrrO6UPwg68cO9HuT07bfNuor3V6uU7FrI57Z
	U1UYl6VHlLD+5OaUAE4sGzT2IQWmGE/h5UxELInkrgFGGblUcWx3GEFE6of51bfg
	Rt2G3quZCLzRWMniTHOFwZ6t9ThpUP4gI0dbifvbLH+ipJeaCDFNYQq9X3TOErnU
	pHinq0GycXsQ0C63xPHHP/nx/YCJAXh46KqV3FozvcIFz+Y9TvNAxHbhQl+NhkN9
	gt5/gL7O1saXhDOXQAwF+g==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011062.outbound.protection.outlook.com [52.101.57.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efydebwy2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 02 Jun 2026 00:46:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okLghMC1GLuZ2TjYi1hCmJ3p5GhYYdgSapozvcUwIPV3m5Q/QLe5nemIrj0QRPDk/yeHhIAJV2onljazJGyRADiXm1TcZ/S7GciQgaYgCRvJhlLNCxIvrswrNe6L4zAZk8Q94l2birwf53+Y292FeG32em22tK2VcE9bGv7LOq1OleiIYDoOmH9sRY25eDZRRgGVpJx9j/TunvkvdKiLb+pTblYq16xHvjo2LcCaTowfJWh5HzcSGfa/Lzc/5AAiX2xc4/MjD4DRnqFDhTpEZJEhH88uhMlcKKhwc6dP1kHDJ+cjg2gbKWUIn01cLBz/fZKP42CZSa6HNOkEyciX1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ST6qpXYdbS82MX+Y00gqF6vMdKb4gWy0FjLLuThH7Xo=;
 b=fLReYU0odRzcvOcAyT2kvl0jRWwHHOJxr48k0zAG4mgPOaJO39DHRy800tPehRlan7bpoXi70rZUIf9OZfBHzVIi/BMpph66Ug+Tims9ZX47lEIY9XiZ4Szq+AFVH7sQ/H4pQsU4vUTGDDiB+EoXLSubhTI+5wYPp/RRRwr5d/MRCC3Q9ALLtNrt9yCyUjEWsb/jppuKcMaAKd1CEBGwisdl3ZfVRWWbR3dkjUYdzv4Tuh53JETGtGH10AUadmtjI3itMliX6dbySOS6aXKai9ubcBiF3A06QvOTuIt1x+pBoxzYQL4qOWTg9VcyAtqSXsvZe2hAkohMcDAl8cNSOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN7PR11MB765673.namprd11.prod.outlook.com (2603:10b6:208:5f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Tue, 2 Jun 2026
 07:46:29 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 07:46:28 +0000
Message-ID: <ce842e79-1b32-4056-ac60-f41a95995135@windriver.com>
Date: Tue, 2 Jun 2026 15:46:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][master][wrynose][PATCH] ppp: upgrade 2.5.2 -> 2.5.3
To: Alexander Kanavin <alex.kanavin@gmail.com>, peng.zhang1.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org,
        Daniel Turull <daniel.turull@ericsson.com>
References: <20260602070344.1163210-1-peng.zhang1.cn@windriver.com>
 <CANNYZj_y3KBe3Qgp3cu-VzxrFn61rkNwWuLcPtjp+UWV62QoFg@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj_y3KBe3Qgp3cu-VzxrFn61rkNwWuLcPtjp+UWV62QoFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0056.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN7PR11MB765673:EE_
X-MS-Office365-Filtering-Correlation-Id: f91a329a-a1f5-430b-e971-08dec07b0e44
X-LD-Processed: 8ddb2873-a1ad-4a18-ae4e-4644631433be,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
 BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|4143699003|11063799006|56012099006|6133799003|12006099003|25016099003|22082099003|18002099003|3023799007|29003799003;
X-Microsoft-Antispam-Message-Info: 
 m9ZiErZQWOWdcjprM1IyFqm5Ido4qnS6WIBZnCXPVZcCNGiA0eQTXHMR0anKFQZ/l5b6QPgxApdG2N5kayMA+8iZo+jctg7ypGmeBIx4SqLU97brEXXHi1w15Htsmtmx16EXT4OosF0u1iZQhJzbRCE2JzZG0PkHnlbk9wFvECLh0dmGP1kjh2AlbGC4yoKZ744qT7xj6QZ4iRSp+ucDW0djq9eIf/dH8EZ4ZuWi3kxj0aiBVRgU04R9wWJPGwXBJh8mDtLynTEmQ0hKd2mrlFayeeTAI3m25IBDfjc3VPVuP9VUq59MQR+INbxj4kEQgQ44FgStZcz6JhGfKdQrEYnOS2F+OB2Z/WtKEtexz0JdbgbyEy514kPLjtglgCkids07dhCkPfKHrlKRFFJDksZNxS6a4SdPddRKGnuIKjPllMLc9VFc69Qx0EtJLIcgdcWpn3Ba6nNV/K5X8dkwGUImXbTGsazFlNSJsWe4sSaVphxBwcORroElJD2kTuK26abCqpxZKFPRKH6xP8SO2VnekVrRe8sz0xVNCgasjq+tBNjxa4G1ppkO2ukim2jE8MoV3nHPKbVo9kZBx0hGWIsq1BRa/RDrE3FrhhxUj4Y25r54j4keM2ImtVb0WPNZpX/NB6P1HPqNtXAn9/Mf7w==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(4143699003)(11063799006)(56012099006)(6133799003)(12006099003)(25016099003)(22082099003)(18002099003)(3023799007)(29003799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?eGdSandWYjZFS2MxakZqTnhwN0NRRWhDMEQ3cHNOa0ZTZHZtMEUyLzBiVVl0?=
 =?utf-8?B?R1hOOGhtUjhsOEpBbjBwU1pCT0pmdzR6SG9DanRoVTFNTzRhY1VqQjZRTlh5?=
 =?utf-8?B?eXhOUUU3WkNucit5enoyTGpJSkdnRnUwSFJCdHA3bmtGaitSNFFoc1hTU25l?=
 =?utf-8?B?dGNuc1dQRnRadDVQWi9yZVB0dWkwL3pzSk1rd0JSUnpSMFNqWFJyZ0l1cmg5?=
 =?utf-8?B?ZE9WWFVsZE5PK3BKTE9zQWhSRk1lckw0OS9jdlBIVEIzczZmQVQ1blBkZDBx?=
 =?utf-8?B?SmJlK1BLVnoxRnRCTmVtTTNZOGFJVFBjcWN2eXk5TTdHcmF4d1ExbzhsT1Rv?=
 =?utf-8?B?SmU3K1Q1S3BHRnpmMUJjTmhSTDBWNEhzQjNhT0RhSURNVFN2eS91TEEyeC9F?=
 =?utf-8?B?RU03a2VJVklzeG9URzRGNmNxZFpPQ0JaYkRMTUtZK0lIYWZiSmJQME9JeUVH?=
 =?utf-8?B?S0I4MGlZTnpvdkVpRU5hNzlqSFFRaWd2OWlrVHBqbnBWckRwUmMvY0JGVEo0?=
 =?utf-8?B?dFpPenVYOXlidXZPMm5ZVytmaExESk5WenpEWVhCTEZQeXJlcmNEMzF3WUE3?=
 =?utf-8?B?NHBlNHlwL3JRa2FWVkRocmwzM1B1bllDcWxZWjVmaEZ0VE81ZU1HQmFYaS9L?=
 =?utf-8?B?a3lUditHYnE3MElUOExKc1d2dGVoS3dpVUZlZ05kTUtBZ2dhRVNXcEkvL2hI?=
 =?utf-8?B?aEpva2JaRE9EVmVSVWVjM0htOHBDUkQ5bjNBQWZIZHhXY2tMakM0d2lJL2tY?=
 =?utf-8?B?M2RtOUtva0xDZzJycFpKWHRLaHY0RVUwZHh1aElPQ0dQODRvMFJkSkpPT2F3?=
 =?utf-8?B?U1dwbHlMMFMwRG1kRHNEd0RYM0ZnN2tjMXpSUlgyRVhBQ2hzT0Uya00zSXlG?=
 =?utf-8?B?QWhEQVMvdytlMTFyOHpqR2U3Y1ZQVkdxUHhnMEFHM0xYblBMTVJjVTk0NjIx?=
 =?utf-8?B?ZjFZSTh0NDRoLzU5bTlIbFZ5L0xoWFY2VTN5bGI3UUV0d3ZrVWIrM1FZdkxE?=
 =?utf-8?B?R0l3WUd2MWNNdVZZVDluanpjaXBzZTFITU1hUjJCWDJtL0lLZ2t1SHdzOHhm?=
 =?utf-8?B?TWY1K2ljMmxnMUFUT3RwUm9yUVpZdFBJdnExZWUvMEhpbXdodXlSeDI3RDQ5?=
 =?utf-8?B?MFlJaGp6ZSt4dU81dGQ4UWc2YUdzRzFDcks3b0dpQjE5d2JXd2NBUVNrSmhT?=
 =?utf-8?B?TkRXZ2tZZjBSdFpLV3JoS1FEalNRcnp2dUxUV0Z6NGM5eVAyTUlVRlBzb1Bw?=
 =?utf-8?B?U0R4MUFqaHJ5UTRUS1Bxc0I2b0hTZFZJL0Nna0ZRWHAvcWR4dytnaGVtajkr?=
 =?utf-8?B?Y1lpUkdkUDRzMXplL3FPNTZtTVpEdm5TcWtVa2M3cDh5cXFLWFVmaGR0NTA4?=
 =?utf-8?B?aE9VMVJWdzhTVjNSQWNRTjBEYWpLVU9IeDI1dVZOeThHaUVvN21MQ2d1ZVJh?=
 =?utf-8?B?Z0pSZVhjNG9QSlN2c3BHa3dUcjJhQzFMOHVlSGtBVlNDbmp0RURvMEFDTUth?=
 =?utf-8?B?QURFdk9PbHhodStLYXQraGZZUVNjK3drVGJQZnlxWXAwTkE4cVNFKzNnOEE1?=
 =?utf-8?B?czRJdSs1ZjBrNzRHSU1KMGpGZnZIcWpEcnV6dzN1b3BYdnJlU1h4SFl0QVJL?=
 =?utf-8?B?aTBPSWxDdjk3em9OaUVySlZBNDhXTTRheVhlK3RET2pMZFZ5VVlrS3RMMkJ2?=
 =?utf-8?B?blZONWJ3d1F2cVBBYVh2aGNwbm16Z2w4aC9xd0RrVzhIYWJhaS80dHEvSjRp?=
 =?utf-8?B?VWlKa1RBWVlsZXpzZ1A2SWZmdmx1VTl2U3dVbTNNMUFCMjR3Vlpab0U2UHdj?=
 =?utf-8?B?d0FQYVAvWVk5VDBReVhhUlk1TGErV0gwSFBVeEtsTkgxMytyQkIrQ0hXWXlu?=
 =?utf-8?B?SVREL2liR2NZc3FJVUxrRU8wb243NWthakY5TmtQdlVqSnBzcDF4c1BlWmdX?=
 =?utf-8?B?UHl6VnNpWVZZYXgxUmVMY0thNVplWjR3b2hrcmxjbzBjZ280bjUvdlpSVUZR?=
 =?utf-8?B?M0U4N1MxYXY1aWRvT0VOci9pNUhBNXl3Slo3eEFJQ0F5TTlQa0NTSWd4bWdX?=
 =?utf-8?B?ZzNVQlI3NXBtbnk3ZXVCQ2RlMFJmSzh1K2V0M21Vb0xmR1kxRjNrbWxGK0JV?=
 =?utf-8?B?L01hSzgyU0dJOGZVc3hOZ1Vhb3M3K294c2xCWDQ4S1JYOXA4dUhySFdIUWhz?=
 =?utf-8?B?azM1VkhVYkNTb2F3NHRZZW13Z1FOQVFzSmorT1hkWGFTVjljUnIrc3RqcG5n?=
 =?utf-8?B?TWlPbmJoREl1UUdYZjJxNjY1WEpHK0prY1NZeXJrZ01ZcWtNTVpFWmtWb3hm?=
 =?utf-8?B?MGZUV0hsWnFyOGppRVJuYjVFZHpicVpCeUswNHFMdTV4QkRKMjJ6dz09?=
X-Exchange-RoutingPolicyChecked: 
	sAP3sVqr+wIbo/M+31Zaku42TI0nJeaOgHNjpTY4t+/9wr165qEU3Q5D3P6UxvlLXXU84I/f1kNM3vb+pQSTW2rnm4DpIGLQzbXV5r8jIDGbhit1MscveVQOHFW6ZEPQvF0EPp3vFDc9QlwEaixxPiNl09XdmYcZ5NB64XprwRHoM0YIDTpH8WUXp8JYR8Wx+f0UFeSdoK6xnxbLX5b268fmEc9quq3uyS4um80U7kwoIkXntIk+LflXDOSkFRuErBmOPuj2JPZDQS1/qs58ig3NMdJqBVG0pIhchTnl0bfCxqoSHqlk0XXE7XxGZ3RsY7QAUDXpiFZ7djcnQYWNqA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f91a329a-a1f5-430b-e971-08dec07b0e44
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 07:46:28.8149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCAiTXvdA1Q1PN0M1JYJl2yT1s81WRRIMqkq/lYozVfN3T08LUxrmXNfbq3/+GsouyuVwYqDB1x3h6oXBqG+yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR11MB765673
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3MSBTYWx0ZWRfX6b2pPvpegd3E
 B87mbLVyiWrcTzVcb1At4CtSXT3aLxlN7eMPzE0PyPZ685vWZu4P6Y1yYn/GjgVfLHabuyqerub
 5Xvaup5Jf43nXV8dyGfQSRuCdCl4/zN6bJp/fegDsjZIGccgf0zOlMPjeJW/Ck9bhYfElZR2YP7
 REMcY4KIrLA4AlQT0zDLCDV9LoZ3ih13mvVc5hF2xn+2v4HRUffkm1HJF7V63dI3q/Qm11WQYjR
 8iHHNgx74azgKuK/bvrurdbH706rN8qwZKwWfMWQ7M6HrS0ufs3GOUH2lHov+oZLLl/bLRBpOO2
 4a7v6a3V0+xSAvHsF7ybRJXz3keDUHuFIreZd9iYtReWROEbg+25jUJ+e5muHfkU+MmAQRwIzwb
 FfYTn9YZKYNukk3rWxeT1j8lAxpgDwJklKnOF3joBDOQsZ2y84ZcDynBkFQqyYhGndymCTK2apH
 +9x2zTbnRI0/dracn3w==
X-Proofpoint-GUID: R7CJxs8kuoX8wm4r7Ny-UOuDaOoHLFMN
X-Authority-Analysis: v=2.4 cv=Iq0utr/g c=1 sm=1 tr=0 ts=6a1e8a58 cx=c_pps
 a=YV/sJQ11QjtKmCmeYosiFQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=MufGLDliAAAA:20 a=NEAV23lmAAAA:8 a=vTr9H3xdAAAA:8 a=hGzw-44bAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8
 a=Ne8iVhu6vPMc-Y8QFwIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=HvKuF1_PTVFglORKqfwH:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=bn7x_FpfJtc3yKQXRW3z:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 86GLBtF9cUuSX_-hrtZ6LPaa2BitnMpB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020071
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6525QMxN982285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 07:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238013

On 6/2/26 15:27, Alexander Kanavin wrote:
> This has new features, it has been developed on master branch
> upstream, and so isn't eligible for wrynose backport.
>
> Chen, Daniel: this is why point releases can't be automatically
> considered 'bugfix only'. Plenty of projects where that isn't the
> case.
>
> Alex

Yes. I learnt about this just a few weeks ago.

I guess I'm not the only one who did not know about this. Many other YP=20
developers out there are also not aware of the situation.

Having recipes carefully checked and setting=20
UPSTREAM_STABLE_RELEASE_REGEX appropriately will make things clear to YP=20
developers.

Regards,
Qi

>
> On Tue, 2 Jun 2026 at 09:04, Zhang, Peng (Paul) (CN) via
> lists.openembedded.org
> <peng.zhang1.cn=3Dwindriver.com@lists.openembedded.org> wrote:
>> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>>
>> ChangeLog:
>> https://github.com/ppp-project/ppp/releases/tag/v2.5.3
>>
>> Drop backported patches:
>> - 0001-pppd-pppdconf.h-remove-erroneous-generated-header.patch
>> - 0001-pppdump-Fixed-building-with-GCC-15-548.patch
>> - 0001-pppd-session-Fixed-building-with-GCC-15.patch
>>
>> Add ppp-dhcpv6relay package for newly added dhcpv6relay plugin.
>>
>> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
>> ---
>>   ....h-remove-erroneous-generated-header.patch | 98 -----------------=
--
>>   ...d-session-Fixed-building-with-GCC-15.patch | 33 -------
>>   ...pdump-Fixed-building-with-GCC-15-548.patch | 75 --------------
>>   .../ppp/{ppp_2.5.2.bb =3D> ppp_2.5.3.bb}        |  9 +-
>>   4 files changed, 4 insertions(+), 211 deletions(-)
>>   delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdc=
onf.h-remove-erroneous-generated-header.patch
>>   delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-sessi=
on-Fixed-building-with-GCC-15.patch
>>   delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fi=
xed-building-with-GCC-15-548.patch
>>   rename meta/recipes-connectivity/ppp/{ppp_2.5.2.bb =3D> ppp_2.5.3.bb=
} (91%)
>>
>> diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdconf.h-re=
move-erroneous-generated-header.patch b/meta/recipes-connectivity/ppp/ppp=
/0001-pppd-pppdconf.h-remove-erroneous-generated-header.patch
>> deleted file mode 100644
>> index a00706c184..0000000000
>> --- a/meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdconf.h-remove-er=
roneous-generated-header.patch
>> +++ /dev/null
>> @@ -1,98 +0,0 @@
>> -From a6eb65162db5bcc5ec26cff7361885c0a44cbbfa Mon Sep 17 00:00:00 200=
1
>> -From: Alexander Kanavin <alex@linutronix.de>
>> -Date: Mon, 17 Mar 2025 11:12:07 +0100
>> -Subject: [PATCH] pppd/pppdconf.h: remove erroneous generated header
>> -
>> -Upstream-Status: Inappropriate [tarball generation issue tracked at h=
ttps://github.com/ppp-project/ppp/issues/541]
>> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> ----
>> - pppd/pppdconf.h | 80 -----------------------------------------------=
--
>> - 1 file changed, 80 deletions(-)
>> - delete mode 100644 pppd/pppdconf.h
>> -
>> -diff --git a/pppd/pppdconf.h b/pppd/pppdconf.h
>> -deleted file mode 100644
>> -index 51a8f02..0000000
>> ---- a/pppd/pppdconf.h
>> -+++ /dev/null
>> -@@ -1,80 +0,0 @@
>> --/* pppd/pppdconf.h.  Generated from pppdconf.h.in by configure.  */
>> --/*
>> -- * Copyright (c) 2022 Eivind N=C3=A6ss. All rights reserved.
>> -- *
>> -- * Redistribution and use in source and binary forms, with or withou=
t
>> -- * modification, are permitted provided that the following condition=
s
>> -- * are met:
>> -- *
>> -- * 1. Redistributions of source code must retain the above copyright
>> -- *    notice, this list of conditions and the following disclaimer.
>> -- *
>> -- * 2. Redistributions in binary form must reproduce the above copyri=
ght
>> -- *    notice, this list of conditions and the following disclaimer i=
n
>> -- *    the documentation and/or other materials provided with the
>> -- *    distribution.
>> -- *
>> -- * 3. The name(s) of the authors of this software must not be used t=
o
>> -- *    endorse or promote products derived from this software without
>> -- *    prior written permission.
>> -- *
>> -- * THE AUTHORS OF THIS SOFTWARE DISCLAIM ALL WARRANTIES WITH REGARD =
TO
>> -- * THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILIT=
Y
>> -- * AND FITNESS, IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
>> -- * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
>> -- * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER I=
N
>> -- * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISI=
NG
>> -- * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTW=
ARE.
>> -- */
>> --
>> --/*
>> -- * This file is generated by configure and sets the features enabled
>> -- *   in pppd when configured.
>> -- */
>> --
>> --#ifndef PPP_PPPDCONF_H
>> --#define PPP_PPPDCONF_H
>> --
>> --/* Have Microsoft CHAP support */
>> --#define PPP_WITH_CHAPMS 1
>> --
>> --/* Have Microsoft LAN Manager support */
>> --/* #undef PPP_WITH_MSLANMAN */
>> --
>> --/* Have Microsoft MPPE support */
>> --#define PPP_WITH_MPPE 1
>> --
>> --/* Have multilink support */
>> --#define PPP_WITH_MULTILINK 1
>> --
>> --/* Have packet activity filter support */
>> --#define PPP_WITH_FILTER 1
>> --
>> --/* Have support for loadable plugins */
>> --#define PPP_WITH_PLUGINS 1
>> --
>> --/* Have Callback Protocol support */
>> --/* #undef PPP_WITH_CBCP */
>> --
>> --/* Include TDB support */
>> --#define PPP_WITH_TDB 1
>> --
>> --/* Have IPv6 Control Protocol */
>> --#define PPP_WITH_IPV6CP 1
>> --
>> --/* Support for Pluggable Authentication Modules */
>> --/* #undef PPP_WITH_PAM */
>> --
>> --/* Have EAP-SRP authentication support */
>> --/* #undef PPP_WITH_SRP */
>> --
>> --/* Have EAP-TLS authentication support */
>> --#define PPP_WITH_EAPTLS 1
>> --
>> --/* Have PEAP authentication support */
>> --#define PPP_WITH_PEAP 1
>> --
>> --/* The pppd version */
>> --#define PPPD_VERSION "2.5.2"
>> --
>> --#endif
>> diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed=
-building-with-GCC-15.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppd=
-session-Fixed-building-with-GCC-15.patch
>> deleted file mode 100644
>> index d95c72e96b..0000000000
>> --- a/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-buildi=
ng-with-GCC-15.patch
>> +++ /dev/null
>> @@ -1,33 +0,0 @@
>> -From 5edcb01f1d8d521c819d45df1f1bb87697252130 Mon Sep 17 00:00:00 200=
1
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Mon, 17 Mar 2025 14:38:26 -0700
>> -Subject: [PATCH] pppd/session: Fixed building with GCC 15
>> -
>> -Fixed building with GCC 15 which defaults to C23
>> -and find conflicting declration of getspnam() here
>> -with the one provided by shadow.h (extern struct spwd *getspnam (cons=
t char *__name);)
>> -
>> -Fixes
>> -../../ppp-2.5.2/pppd/session.c: In function 'session_start':
>> -../../ppp-2.5.2/pppd/session.c:185:18: error: conflicting types for '=
getspnam'; have 'struct spwd *(void)'
>> -  185 |     struct spwd *getspnam();
>> -      |                  ^~~~~~~~
>> -
>> -Upstream-Status: Submitted [https://github.com/ppp-project/ppp/pull/5=
53]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - pppd/session.c | 1 -
>> - 1 file changed, 1 deletion(-)
>> -
>> -diff --git a/pppd/session.c b/pppd/session.c
>> -index f08d8e1..9cc7538 100644
>> ---- a/pppd/session.c
>> -+++ b/pppd/session.c
>> -@@ -182,7 +182,6 @@ session_start(const int flags, const char *user, =
const char *passwd, const char
>> -     char *cbuf;
>> - #ifdef HAVE_SHADOW_H
>> -     struct spwd *spwd;
>> --    struct spwd *getspnam();
>> -     long now =3D 0;
>> - #endif /* #ifdef HAVE_SHADOW_H */
>> - #endif /* #ifdef PPP_WITH_PAM */
>> diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fixed-buil=
ding-with-GCC-15-548.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppdu=
mp-Fixed-building-with-GCC-15-548.patch
>> deleted file mode 100644
>> index 2a3b3cc84a..0000000000
>> --- a/meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fixed-building-wi=
th-GCC-15-548.patch
>> +++ /dev/null
>> @@ -1,75 +0,0 @@
>> -From 44a766a3d086f10cb584a0c423e5bed6af2e3615 Mon Sep 17 00:00:00 200=
1
>> -From: =3D?UTF-8?q?Jaroslav=3D20=3DC5=3DA0karvada?=3D <jskarvad@redhat=
.com>
>> -Date: Thu, 27 Feb 2025 23:00:16 +0100
>> -Subject: [PATCH] pppdump: Fixed building with GCC 15 (#548)
>> -MIME-Version: 1.0
>> -Content-Type: text/plain; charset=3DUTF-8
>> -Content-Transfer-Encoding: 8bit
>> -
>> -GCC 15 defaults to C23 which does not allow K&R declarations.
>> -
>> -Credit Yaakov Selkowitz in:
>> -https://src.fedoraproject.org/rpms/ppp/pull-request/12
>> -
>> -Upstream-Status: Backport [https://github.com/ppp-project/ppp/pull/54=
8]
>> -
>> -Signed-off-by: Jaroslav =C5=A0karvada <jskarvad@redhat.com>
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - pppdump/pppdump.c | 20 +++++++-------------
>> - 1 file changed, 7 insertions(+), 13 deletions(-)
>> -
>> -diff --git a/pppdump/pppdump.c b/pppdump/pppdump.c
>> -index c24208a..1534036 100644
>> ---- a/pppdump/pppdump.c
>> -+++ b/pppdump/pppdump.c
>> -@@ -42,14 +42,12 @@ int tot_sent, tot_rcvd;
>> - extern int optind;
>> - extern char *optarg;
>> -
>> --void dumplog();
>> --void dumpppp();
>> --void show_time();
>> -+void dumplog(FILE *);
>> -+void dumpppp(FILE *);
>> -+void show_time(FILE *, int);
>> -
>> - int
>> --main(ac, av)
>> --    int ac;
>> --    char **av;
>> -+main(int ac, char **av)
>> - {
>> -     int i;
>> -     char *p;
>> -@@ -97,8 +95,7 @@ main(ac, av)
>> - }
>> -
>> - void
>> --dumplog(f)
>> --    FILE *f;
>> -+dumplog(FILE *f)
>> - {
>> -     int c, n, k, col;
>> -     int nb, c2;
>> -@@ -241,8 +238,7 @@ struct pkt {
>> - unsigned char dbuf[8192];
>> -
>> - void
>> --dumpppp(f)
>> --    FILE *f;
>> -+dumpppp(FILE *f)
>> - {
>> -     int c, n, k;
>> -     int nb, nl, dn, proto, rv;
>> -@@ -375,9 +371,7 @@ dumpppp(f)
>> - }
>> -
>> - void
>> --show_time(f, c)
>> --    FILE *f;
>> --    int c;
>> -+show_time(FILE *f, int c)
>> - {
>> -     time_t t;
>> -     int n;
>> diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes=
-connectivity/ppp/ppp_2.5.3.bb
>> similarity index 91%
>> rename from meta/recipes-connectivity/ppp/ppp_2.5.2.bb
>> rename to meta/recipes-connectivity/ppp/ppp_2.5.3.bb
>> index 607678db8b..435559a815 100644
>> --- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
>> +++ b/meta/recipes-connectivity/ppp/ppp_2.5.3.bb
>> @@ -23,12 +23,9 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/=
${BP}.tar.gz \
>>              file://ppp_on_boot \
>>              file://provider \
>>              file://ppp@.service \
>> -           file://0001-pppdump-Fixed-building-with-GCC-15-548.patch \
>> -           file://0001-pppd-pppdconf.h-remove-erroneous-generated-hea=
der.patch \
>> -           file://0001-pppd-session-Fixed-building-with-GCC-15.patch =
\
>>              "
>>
>> -SRC_URI[sha256sum] =3D "47da358de54a10cb10bf6ff2cf9b1c03c0d3555518f61=
82e8f701b8e55733cb2"
>> +SRC_URI[sha256sum] =3D "ddda28dec8aca99a403ab6070d94ffd2b17d63e9a4c55=
09158e99e148f572d4f"
>>
>>   inherit autotools pkgconfig systemd
>>
>> @@ -60,7 +57,7 @@ do_install:append () {
>>   }
>>
>>   CONFFILES:${PN} =3D "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp=
/chap-secrets ${sysconfdir}/ppp/options"
>> -PACKAGES =3D+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-min=
conn ${PN}-password ${PN}-l2tp ${PN}-tools"
>> +PACKAGES =3D+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-min=
conn ${PN}-password ${PN}-l2tp ${PN}-tools ${PN}-dhcpv6relay"
>>   FILES:${PN}        =3D "${sysconfdir} ${bindir} ${sbindir}/chat ${sb=
indir}/pppd ${systemd_system_unitdir}/ppp@.service"
>>   FILES:${PN}-oa       =3D "${libdir}/pppd/${PV}/pppoatm.so"
>>   FILES:${PN}-oe       =3D "${sbindir}/pppoe-discovery ${libdir}/pppd/=
${PV}/*pppoe.so"
>> @@ -70,6 +67,7 @@ FILES:${PN}-minconn  =3D "${libdir}/pppd/${PV}/minco=
nn.so"
>>   FILES:${PN}-password =3D "${libdir}/pppd/${PV}/pass*.so"
>>   FILES:${PN}-l2tp     =3D "${libdir}/pppd/${PV}/*l2tp.so"
>>   FILES:${PN}-tools    =3D "${sbindir}/pppstats ${sbindir}/pppdump"
>> +FILES:${PN}-dhcpv6relay =3D "${libdir}/pppd/${PV}/dhcpv6relay.so"
>>   SUMMARY:${PN}-oa       =3D "Plugin for PPP for PPP-over-ATM support"
>>   SUMMARY:${PN}-oe       =3D "Plugin for PPP for PPP-over-Ethernet sup=
port"
>>   SUMMARY:${PN}-radius   =3D "Plugin for PPP for RADIUS support"
>> @@ -78,4 +76,5 @@ SUMMARY:${PN}-minconn  =3D "Plugin for PPP to set a =
delay before the idle timeout
>>   SUMMARY:${PN}-password =3D "Plugin for PPP to get passwords via a pi=
pe"
>>   SUMMARY:${PN}-l2tp     =3D "Plugin for PPP for l2tp support"
>>   SUMMARY:${PN}-tools    =3D "Additional tools for the PPP package"
>> +SUMMARY:${PN}-dhcpv6relay =3D "Plugin for PPP for DHCPv6 relay agent =
support"
>>
>> --
>> 2.50.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#238010): https://lists.openembedded.org/g/openembe=
dded-core/message/238010
>> Mute This Topic: https://lists.openembedded.org/mt/119607595/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


