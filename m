Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1957C1125853
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 13:43:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21853.1773323001655909982
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 06:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fr3bZiYd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75312aa6c1=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C7aqTu2010471
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 06:43:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=1BeYU+COgrrkeTyCkz7ve2aZnCMpMscVSe9ZhLZ5IaQ=; b=
	fr3bZiYdbvfLIXum6L1sRXBon8i7SGPP8mKmet4Yx/DQFv248VZqLjRT/AGKzX7g
	HrDj+G8mbF0Tx9A2fbhj/8h6cnBA2zGUoyShsfP2itxn6OqvwtmB+vFTLG446Ija
	2u25cm4hkkGIQSoa6etAOjuQV/6W+hQrxGhhi3/HsFSmLhk8fJ+SGes7l4oov3aU
	aQy7wMNit1auL6DqelWOkPPdY4RtDE9ixVTyfOVNCsDPqgDhEWK79/E+7Uncz5/R
	7e6h9MRi9/r3SAczdT6TlXy+zz3amGkzwdHS3GqYv9afD8uzzHXplj0TSLmgI+9Y
	BAFge0oRygnXUDq3OV5XJA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6t8rga-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 06:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9Xo09agfHi92tGnSfrVJPpnl6MXB7+QRLNqDZXN2x/8Ghe1RSLMoKHsSwlFWpjORTBBmrS6fRPnn+K/iPYtk5kW3DfIN6bE9g3/b04nTAluFkPX/mHTYsdvOOAK+tJ4zjqR9yj2+PrfN+7lqoXS8Ik1glNPUzQU3Kyvf8izXyQtJDAkbDOPR9peopxVYWwky8KpoaJeKoJ6AvnAVWk50wsMz008eMMFBXRnxqE/ZdOAEcP0gC9A4bjS5eq8BactRxRH/t2pScVai2Wqu3G9eODKMTBFHc3XVJoq/z45gLFL5Pdkm4aEPjiAfcjCDcQCu2AJttz+G8fF6HSvMKChqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BeYU+COgrrkeTyCkz7ve2aZnCMpMscVSe9ZhLZ5IaQ=;
 b=Cd/telro/wuPDw9MhoDK2dJ2YMtx7p5lLqC3FOAoIfRBSJbHMX0a5TBmFpMt/qG0D8OkiJp99tAoYDvP0B+i6mAlPM6yxf11mqNOR4SDkc7F8wmghOcL27TWcJysV4FqhnGGLdD87+n7ZlJcRZ5I9on/RKz3+GYOCY7xXL3lX/MmvPoIi1pgj7J8ouVt0tYAfikiFPeM/vkkbQVUkftc8PnKZ2U19k3eEerJb4LMtghOXAmvBRi/Brc/yKn2DkUSsXWq7SGjZma5uH6haTXbMb037Bylvle3Tyrjs8w8kovLylqEATFxFyrw/VAKdZjJMVHJjChPMWCSmDhCNJBm2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by IA0PR11MB7260.namprd11.prod.outlook.com (2603:10b6:208:43b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 13:43:17 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 13:43:17 +0000
Message-ID: <99c8b40e-3776-45da-b606-39e66d931640@windriver.com>
Date: Thu, 12 Mar 2026 21:43:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v7 1/7] package_rpm.bbclass: Drop external
 dependency generator to support rpm 6
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: alex.kanavin@gmail.com, Ross Burton <ross.burton@arm.com>,
        openembedded-core@lists.openembedded.org
References: <cover.1772367692.git.liezhi.yang@windriver.com>
 <8e2bf6e0befe331a0f834687317a3dcd2d735b92.1772367692.git.liezhi.yang@windriver.com>
 <2bbd3ebdc7f525fc5fdb5848ec6d80c70dbb9e22.camel@linuxfoundation.org>
 <86d3c351-16e9-44bd-8b38-b8c6ed75aa0a@windriver.com>
 <e4bed048-61eb-425a-a3bf-a3906145938d@windriver.com>
 <DGU6U0PB5R0J.2FMV5TJUWPZJV@bootlin.com>
 <e85b7909-392f-4fb1-a463-46a09484060e@windriver.com>
 <DGY263XJ28Q5.S68LXPC7JMI6@bootlin.com>
 <DGY2F6IHB5J8.19O12JA60I1SB@bootlin.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <DGY2F6IHB5J8.19O12JA60I1SB@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0111.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bb::11) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|IA0PR11MB7260:EE_
X-MS-Office365-Filtering-Correlation-Id: ec592cff-fcad-470f-7846-08de803d50af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	EUNy1tuGnTRxvgVbJ05RJyC3q+bxyTeZswBlzDKYkGgQ/xYssI1NM0xvhjg6UhQcQL/kK1YDexbNnola5ukx6zZHNFEddLHlCnXrKu8xsdt0to2/YFHK2ATv6cQbKrfG/cxFkyKyJAHrBaQTd/YSi4l4MMCHPmm7og3RD3taOtRtvyFeUGUeKKu28dARjxcPSgRkFllE9Rcc3//Rcc4IymMBB6fMoJG6DweYRNBD8MNL24BjVy1p8BSANab/vSlQWITxdjuOKahlpyMVgQkEcpe4rhZWzEDJpit1lZ0TLTsd7fpnrk3gntCv6iuZ1dC9oUeAYPJQ9fGyVXNr0u8/nWzr95dEjSPASfOcFYSYRTVc4sZKiwTeEzeGCvBuE7HU7irG1k4aTH3HkORFaNcRwLWZL1aPNpd90LXVsMkoFEOIsfsWjxBtuwxnBJBuFOMLDBTSRYHMck2e7Wtl/c0PY8PY9KJKBOkLSCVz4U+4ltjbBVXaEmuYFr06SIBDBODZSn4qziWdmoP9SkaWKgaVZpEZu4TjNYFcVfFNqvIUWGGGYzNT+UV0Rn3wJGeGXUc8rsyACPdF2t5vukldfd2Nd+eej6mVHh84SfDrPg7p7TbZFf6RKDRFQgYr1NseIqUziDPmzmxv41TZRLl5KOwLycrk7asMDLn/cdz4Qi3W39mfgbveREfGU+165mBDMpXD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cWVZSHJoZSsxUVN4azZ2Nm55SlhlZXpSSTlBeXN3dy9jcTRYdmdtODdBZk0w?=
 =?utf-8?B?ckYzRE1OTTBlaXlzelJZdWxXYklMQVZWbFY5VEE1K0V4NzJxei92OEFoM3Bw?=
 =?utf-8?B?cGxlNll4RTZQektEeXlZOU5ya3BjclRtN2FGUVdLUHFPaUpCMGdUUGpvUUZJ?=
 =?utf-8?B?R2FBVlNpcEZMbUxMM1JCWjJ3MmJXNWRZUDlqRHUyOHRPNmhwNVQzZi9hKzd5?=
 =?utf-8?B?cHQ3SkdRZnNUZkxueE9ZT28xSzRFdi9Bc29nRGtRNjdUYUZucmhlRitrdWsv?=
 =?utf-8?B?ZGtuS1lCK1pWSGMvOG9CaHUrRHdPaWJCNXl3akpJNVNYZmVEZ2h2WGhaOTJB?=
 =?utf-8?B?VWNwUWlYdlRGc0lxMUtTWllXeWFRVHZYcEV1bW5ON1ZpNzFmV1N0MHpVbGIy?=
 =?utf-8?B?bDRkYzhqU0UxWkhSYmhQSkEzSGxzVjRHQzl2YlBiWHk4TDVPbFpyOGw5THlZ?=
 =?utf-8?B?UU9WMGNMVHBJSFdXYzBxelYrRFlDTmZabmtSYm9GRTJpaGd2QTVPNTVhMjVD?=
 =?utf-8?B?ejliZlIxNlRzS0U4ZjZZZ3ovcWZPTXlkU00wODBnZTlWWkhiaEVaeTBJYnJv?=
 =?utf-8?B?Wm02Tm9JOTJ2Mmt3MmpNWERSSkpTVU5aZXIvK2xHN0NCNytNTW9hL2hTWE95?=
 =?utf-8?B?NUxUM3h6ajhhR3FPOXFpSG9MWjBhM2xBUmZ4VTBxS3U0d1pqYWU2RWdhMWxs?=
 =?utf-8?B?OGxPV3gyczcwZ3JJYmlCaGxLNklWRDdrYjF5cXdIWkF2WTBxZ0taODdRTS9W?=
 =?utf-8?B?eXNBZzZ0V0RuSCtyVVF0UE05R2xRNVJ4V21WcUUwOWpaOEVvM1ZRNVR6QWFX?=
 =?utf-8?B?WDZ2REVjRGpMcEMrUzdYQTlHaUdpOVd3UXQ2d1RWWkpjWHdYTG5SWVNCMXlH?=
 =?utf-8?B?OVQwK0haWGwxaEdBSkRwSUgrNDRDRTVOVzFPZVFzVGZtd3hkbG1xQ3d1MUpX?=
 =?utf-8?B?d29LTXNwVHNQWmZzT3JJQ3lzbkpFV3dZcTZlaFpiVVhKalNEaW1vNTlpeUNj?=
 =?utf-8?B?T2dMYVFIbTZNTHIrTHpHZGFGbmxhclZJQ2lSZlY1SDloNUt2czdDRE1zeDJ0?=
 =?utf-8?B?Q2JVK3Z0a0dGZkZTQ0JRRTNqbW5rcHIxUkdBallNLzJmSUhlWlJhU2I3QWRn?=
 =?utf-8?B?Mzl2Y1dYaDliekRpSExLSXZERU8xY0k3Nk5PN0RuTVU4T3J5U1hEWnJrN21x?=
 =?utf-8?B?a25GKzdXRmZxZXY2cE1xdWI5cDRDQXVteXJ3a0YwRWs5MWFieTNJelRPUXBL?=
 =?utf-8?B?S0hDQUdjdXRKUXNKcnNZSmxMNTl6ZUNuYXRoRHZDQ0tvYm5xOEpUWFh3R0tu?=
 =?utf-8?B?NnhTenJ3T3dXT1hLd1dwSW8wMDZYUTdRcmhTZ0IydjNUZjUxakVMZlc5UGNF?=
 =?utf-8?B?MWM0UEhsTmlGOUdOWXRmaTJwNHV1Yi9sZFVoTWJoZ1ZGNkJzdXV3S3NFakw1?=
 =?utf-8?B?QnNkbVJYcVBJNmZURlRqV09GN2lpcjRMcDFVWlZWakgzY0FZc3NGc2h5SjVs?=
 =?utf-8?B?WUtUWWc3T0U5TGhaL1FROHpZVHhlcEoycURQckRmNVN3YmlOZExQeTFIOEhv?=
 =?utf-8?B?L0s3OFRZZmtGWXg5THJXbVhPKzdhRnViYmJPT2NEeG45K1BYZEprREtaL0Ez?=
 =?utf-8?B?WUpndVM1WUsyOVhaRjJoOVFoMW9EMmhlN3QvMjlJQURUakxMTDVIbDdSYk43?=
 =?utf-8?B?dEtZWDNEVUp6QVNHcEJPc0xsd0xJVDlIU3VDa1BPdW05aXcvTHdoVm1VZUJl?=
 =?utf-8?B?RmxneHZ5L2k2KzN0WmJjbVNVYTBsM0U3L3YxbU5uM0FaR0l3MS9jckdMdmYv?=
 =?utf-8?B?MEwzWmdiYmgzY2xwUFR5b3k2UzVOTnV1VDB5eDFsN2tTZ0hKc0MzSXJEWWZQ?=
 =?utf-8?B?WTdkNkJXSGt2WnZFd3ZiL05oYzdNV0oxa0FWOTFWZExlaDRLZFl0RnE5cHRh?=
 =?utf-8?B?aXhSNG5UcWVnalptT3VpWk5DaDZ3WHJoR3VRZ3BQNWoyblJKV3dick0wTTlJ?=
 =?utf-8?B?eVFhMmFjckl3UXhRSDU4WXVrWGxpLy90cFpSRFNka2RnTktJRzViNmxBOEFk?=
 =?utf-8?B?N2lNa0ZReEc0RE9Mbmt3T29MRkpVZThpUCttNEtoQjdtVlI3QW0vTzBSdUtN?=
 =?utf-8?B?b3pRbCt4M1BGSy9zalJiK3VaZzZpa3F6YkUvei91RjByQkV3TzFHa0tIZEc5?=
 =?utf-8?B?ZnRqekNhSFdrOEs5MkRqR1p5V0FZOEtwZVdXeTRlcHVoT3dqL3dzSjM2WGlB?=
 =?utf-8?B?c1ppU2dUeVhGemtYNHJHcEp5L0FtdGhGNG56OHJ1YVVMK1lONzNmb2oreWNl?=
 =?utf-8?B?Q3hYUzRtVUdoMFFKb01vTFNKWVVsU1A1YjlFL3lSZm9hWGEzL2VXcUxraEFQ?=
 =?utf-8?Q?r9fnVIKHCUk9HdJE=3D?=
X-Exchange-RoutingPolicyChecked: 
	vwXdN93SuWwqCHxyYLzFfsc9SnR/N7BDfX274OYgVDlYks0EocRBO64GxGza9qe2LWNfOPrJiECY0DIdCWSuO/BVWSzhEVHt7nmqqrkSfCvGi94PVGMJr5YcoJ1v4AJ7i8QRnK8Kz4ybOODarDTiVo9ljlKfAerQLClOnXpP5xHsYOp/Q7i7YQW0/Nb8Hh5BnKWsmXKNQs5QkhSWTB8vguCQcqoOFfHpDOC7GH4jZlNFRKA/lnAhxi9ifhDKqn3CSy2mP0s8+VoN8d/hF8sDtS7TGrBzLcXPHl5ZIZRCdNu46iPdEfPZ04ySwJsOda5+IxnImv5FvYKB2xf49k1bTg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec592cff-fcad-470f-7846-08de803d50af
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 13:43:17.2233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOsz7/gYPqKgz9v41CyOAOep3RIC22KpyWyeHcXvufaX6zaYJ6oBrwgzpQ9eJGXmDaiBixAwNng5ZQMF/RFOIj8cnQIxFpMIj5B/oHxqbWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7260
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: hnUq4_K3LDGBPR1WniQUE5DMQQRmzk_v
X-Authority-Analysis: v=2.4 cv=Cf8FJbrl c=1 sm=1 tr=0 ts=69b2c2f8 cx=c_pps
 a=9MZ2ugitVzia3XLGoiWL/g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=ezDmdS2tp_B0pVeNf8IA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: oWvsUzbGv2Gr67kXBfKgvpUqAn0AdlRz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwOSBTYWx0ZWRfX6Y6lzxaz8e/I
 rhndRNMmVKJEyYRezUJ/DH8SmhyKCj0ChTUzzCLoSENmQ8hKEC+X4yXxIGn5agRD2kyPT9ZwW0u
 HJxZUAn9jJVOFsEcXCshLvigdQRTg2kGztoWzJYhdGdackaGMjdMvLRsUNO3BG4TaG/yAsiItQ9
 o5Kp04e9GxJVIg7Fldyr8MoY+MzKZdqCs/qVJfURx7SK4tgKk1DzKHZcsXUuvbXUJHHlYtWsS7I
 3e2FBB178iw/FSl0/EFXgcof5LVAiQepIWc9Z9ntWY2DmRJcbOcx64b4zAzTrxCU7iHLN0O9PHR
 hi9p8/kNPS5gj5FAva7Nq8sOmP5ZELuKTACkz7z/crX0oZpC5M1qOTIXpVT/9FLHN7Fm45KzkmL
 cxWYGCV9UW8WCFR/wECFB5UsBqBc3dp1tc2D18QJkAxv7MemkU0azbXtD/kFLYaLAGqLZofSPOd
 4C1KBrYadC6NHmsVJKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 13:43:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232955



On 3/9/26 15:15, Mathieu Dubois-Briand wrote:
> On Mon Mar 9, 2026 at 8:04 AM CET, Mathieu Dubois-Briand wrote:
>> Hi Robert,
>>
>> I ran a build, not with your gettext patch, but with the one from the
>> glibc upgrade by Hemanth. We still had similar errors.
>>
>> Any opinion?
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3378
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/3330
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/3302
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/3307
>>
>> Thanks,
>> Mathieu
> 
> I also note a lot of selftest failures, that are probably related. Like
> this one:
> 
> 2026-03-08 19:02:19,088 - oe-selftest - INFO - debuginfod.Debuginfod.test_debuginfod_qemu (subunit.RemotedTestCase)
> 2026-03-08 19:02:19,088 - oe-selftest - INFO -  ... FAIL
> ...
> [Sun Mar  8 18:59:18 2026] (1950649/1950690): cannot open archive from pipe /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1129110/tmp-debuginfod/work/cortexa57-poky-linux/xz/5.8.2/localpkgfeed/cortexa57/xz-locale-pt-5.8.2-r0.cortexa57.rpm
> [Sun Mar  8 18:59:18 2026] (1950649/1950690): libarchive error: cannot open archive from pipe: Unrecognized archive format
> [Sun Mar  8 18:59:18 2026] (1950649/1950690): exceptions encountered during archive scan
> [Sun Mar  8 18:59:18 2026] (1950649/1950695): cannot open archive from pipe /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1129110/tmp-debuginfod/work/cortexa57-poky-linux/xz/5.8.2/localpkgfeed/cortexa57/bash-locale-sr-5.3-r0.cortexa57.rpm
> [Sun Mar  8 18:59:18 2026] (1950649/1950690): cannot open archive from pipe /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1129110/tmp-debuginfod/work/cortexa57-poky-linux/xz/5.8.2/localpkgfeed/cortexa57/bash-locale-hr-5.3-r0.cortexa57.rpm
> [Sun Mar  8 18:59:18 2026] (1950649/1950691): cannot open archive from pipe /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1129110/tmp-debuginfod/work/cortexa57-poky-linux/xz/5.8.2/localpkgfeed/cortexa57/xz-locale-nl-5.8.2-r0.cortexa57.rpm
> [Sun Mar  8 18:59:18 2026] (1950649/1950691): libarchive error: cannot open archive from pipe: Unrecognized archive format
> [Sun Mar  8 18:59:18 2026] (1950649/1950691): exceptions encountered during archive scan
> [Sun Mar  8 18:59:18 2026] (1950649/1950688): cannot open archive from pipe /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1129110/tmp-debuginfod/work/cortexa57-poky-linux/xz/5.8.2/localpkgfeed/cortexa57/bash-locale-pt-br-5.3-r0.cortexa57.rpm
> [Sun Mar  8 18:59:18 2026] (1950649/1950688): libarchive error: cannot open archive from pipe: Unrecognized archive format
> [Sun Mar  8 18:59:18 2026] (1950649/1950690): libarchive error: cannot open archive from pipe: Unrecognized archive format
> [Sun Mar  8 18:59:18 2026] (1950649/1950690): exceptions encountered during archive scan
> [Sun Mar  8 18:59:18 2026] (1950649/1950694): cannot open archive from pipe /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1129110/tmp-debuginfod/work/cortexa57-poky-linux/xz/5.8.2/localpkgfeed/cortexa57/liblzma5-5.8.2-r0.cortexa57.rpm
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3254
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3362
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3482

I've looked into these failures as well. 16 of them are related to the rpm 6,
I've taken a PULL from github/libarchive to fix them:

https://github.com/libarchive/libarchive/pull/2846

I will also take the libarchive upgrading in V8:
[OE-core] [PATCH] libarchive: upgrade 3.8.5 -> 3.8.6

Otherwise, there will be conflicts when you merge it.

And for the other failures such as:
ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on 
locale-base-c, but it isn't a build dependency? [build-deps]

I can reproduce them without rpm 6. I will leave them atm, and focus on rpm 6 
upgrading.

V8 is coming.

// Robert

> 
> Thanks,
> Mathieu
> 


