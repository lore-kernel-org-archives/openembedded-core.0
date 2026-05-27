Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53882CD6E41
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:31:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16507.1779874274796076135
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 02:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=GiaF7Hfk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96079a5f83=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8kcvG2757539
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 02:31:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=KOz1CX3PlhNOX9SJtDGeHK
	a4ekPbOLhj/LbdKse3vWk=; b=GiaF7Hfk3n8paV4EsmzhT9q095mvSWSSp0Kfld
	zBZK60/uI4Y6gG7qkG9MY5ecSANHTXwlTJencASRpPKsIEZVAQdR1ZZ0M7N/sH+x
	V2E2UzSMUJInl02wVZRP+Sm8vrSRTiG38ppcu/77KTQ/a3KiqQCVhrvwK6ve8VAM
	UagkGR9BJQfbniHEj3spW5dEEGkIuzs2MqFSGXd3HdYSOXqVcVjcRTzSihklbMgx
	Nhg4tlDIa0lgm+QNruvPJidO7XgyuG2BvMcAWnIGvkNh2Q+CkZmfLTpm4mpLCfnW
	0xr4d1fdCL4x/WNABl3/LU8sQVAFO6RbOwm5TDcAMMCP4WwQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011025.outbound.protection.outlook.com [52.101.52.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ebbren8d8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 27 May 2026 02:31:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMTRJkgHH0Gw34pdzNxyktinGaFBkWIaP2Wp9cxR6Ghw2g62yH1HjqmbD54dnAhO+nP6FyL7oKvu0s+6F4eewux3WQJkxe5vLeGCYodNDU7WWYwuJOaUpt3Six6LA7h42/l83vWstFE9yHY+t/zzhOQt5YSiQGA6XqgBk+PAtortJ2DKxnZF5pz7u+iL7XDUDDMgQw6NypUob5lSysOlJc7pdIDWE3nrMHAuBPfpjfntPwqmkjApYkj1ixzaDGKfXz9xBVUmiLDfxJayf8ZNW/UenFMCbNnO8bBud0dWdbdyAwOEP6VMHYwEnDbgAEAfqn0+mLfkJWpzyWXaU03X7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOz1CX3PlhNOX9SJtDGeHKa4ekPbOLhj/LbdKse3vWk=;
 b=u1f/CKUskiWVeItZRa/14T6RGJmjLm+UVpfgE4aaeDQMPnsHE2adwmVKCNx8gjb4pyGCw9Xa4ZEJJoBBNvSJpg31sIxSRzbs3Wyrf0r/mIzA9YHdn86ax3lJncY4V8aPo2CKcgboBuFs7UCSsGNORjNcCMGv+ToNwnY/EsZcDRGPSDN212Oxkr7C47rz86l1fSIkWK0vDnYUiijq9tZXaSfVpxfUO1ctVmAv9OkSD+XGNMVEEqCRBWSA4MfGBsxaMROnxrjHt5w6EYMM3ZkVbSkUkqfb3eTIYf0X7VYaaPtclgRo1qsbKMCGicmlq3XB5b+AYAiLggKUHqm+BviZ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MW4PR11MB7150.namprd11.prod.outlook.com (2603:10b6:303:213::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.17; Wed, 27 May 2026 09:31:10 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 09:31:10 +0000
Content-Type: multipart/alternative;
 boundary="------------xbgyu2Ae3bzNLnqCroQ8r9Fc"
Message-ID: <f7f971c4-fe63-4a9a-a64c-42803f239858@windriver.com>
Date: Wed, 27 May 2026 15:01:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 07/12] gcc-runtime: avoid passing
 MULTIBUILDTOP to libatomic
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com,
        Randy.MacLeod@windriver.com
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
 <20260519072534.24588-8-Hemanth.KumarMD@windriver.com>
 <CAMKF1spaC4NPT8rL6GHhtP8aDwV87Kmr0EM5yuPZ5YJhxpau7w@mail.gmail.com>
Content-Language: en-US
From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
In-Reply-To: <CAMKF1spaC4NPT8rL6GHhtP8aDwV87Kmr0EM5yuPZ5YJhxpau7w@mail.gmail.com>
X-ClientProxiedBy: MA0P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::6) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|MW4PR11MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: 1067eb67-4d52-4407-e774-08debbd2afaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|4022899009|13003099007|8096899003|56012099006|22082099003|18002099003|4133799003|4143699003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	fMOHgISydgZtDz8vg9RzJi0Ii+fdTnmjvKZa+M17Ct9YhrZX7OibrVjzVfHhpKzSWqDJ86MSL7pDmGYsmr5vBvlqQHCQskueNQ7u6pH92+MtjB76LdR9f8qlemFa2xLWr5Gvdzm1Wes/PTR4yJB9p/t3mA66lA24CND6HZWC2wKIMSAHuMhwSKYENq4cIVxaw5EhO9FTj2Op2J3iG/mErHg8Ad0Welrb10FBYCRml5cVDTg6nJ5z2Ds2cGV4FJV2+A52YadTNW5z0cRPyvuyNmU1dfJma7f4V51nP9jA7TAAcEh/ROl8f9JCkTiKADEqxPX7/xflJMswnHNpeQiMR57myiQFBEKu8Vc9vdXu9yvBoBAKykfL6LUP0V/2FLpV68mGsz9N7/8CPBT57BMXT2VGVxiUukWUsFYnBvgbli/ECTyxt+xlZ1ZZi5Hkeq/Nuv+0jwZ3jcF6UPQCT1BcEo6qFAZatHUf7zH5oFXuSRDYele3T1L6DIQY1XdK1x26tzM75YnjHsMwvpO+jURlN8N/9TgDbP4qQWpGh+78s3viaT49GV4hwHOtFZ1NnXfEBJ2ZJH8GQAOUTaXyVexGJBk2XRNSO9bda9ESbNLm+BrFc/uQFNNHT/JF0EybcZWiJiCTDvPNNgO8JWVnr06r4w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009)(13003099007)(8096899003)(56012099006)(22082099003)(18002099003)(4133799003)(4143699003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ckVwZCtXSTJuSEhMSWxyOHdjd2dHWitya2tyeUNBUkNGaTkvZzlVbzl0TnVK?=
 =?utf-8?B?ZWQ0M3QwVnlzbkN3YlVrWjlEb2VyMGNNTTJNWVZnYlB0QWRaTHUxZVpBWXky?=
 =?utf-8?B?QWg2UVNJb2VZZEpjRmR0WEpFWUZMZWQ1K2Rybno0Z0tkQWRXY3RxenJFT2l3?=
 =?utf-8?B?ZUV6NGNYczBJaEc1SjBrVk0wRGxGeEl4THU0VThXTm1ka0lQOUt0Ty80bzBT?=
 =?utf-8?B?dzNQK2xVVVBBOUNOTDYyV00vNEtJUVcyTHFkSzU1MjlVUVNSU3JuVlU0NGFG?=
 =?utf-8?B?Y1RxTW0zUTJHeXRoTG5YTUJJeUU4NkZmNWlab3p0ODBFbmhiZkw3MlkrWmNj?=
 =?utf-8?B?OXRWc1EybUVXSCtGSWRsTytFRWtVNDJkS2IwV2JhZVlHeXFtSE1kN2RoNG81?=
 =?utf-8?B?TEdUTXNSUkc3akI1MkgzY0lHZzhYT2tlc1ZRRDRJRG5aclJPV3NsNytsR1dY?=
 =?utf-8?B?ZHd6OTc1UXpOSHFweFVRMWYwTnd2dThlalZuQUZqOUNNK3JvQ2UybWR1eTVo?=
 =?utf-8?B?cGVWOXZLTFc0Q0t4RnRjNDN6UkdYWUE5Ui8yTEdBRDhNdUF0b2gvVXMwOXMz?=
 =?utf-8?B?L1Q3LzAvMEdIcUZ6WmFzdmZpQi9RZEZtNmM1T1ovWWF4OEJPMmtrWVF2Y0w0?=
 =?utf-8?B?NkNHSWVpOWdmWlVXbjBuMlBPLzFkZCtZeWdsVGxQOFduRzA4bmt2MG9yNWs4?=
 =?utf-8?B?d0FHZkFBdkRqVlFZeVNQMW1UcTYxd1E3STl2eHhXYWM4TVRRUzRHQUtUem9i?=
 =?utf-8?B?YzFpckYwUEJ1YzhnL0RFSFgyRXkyd1FadU52R3lWL29lYzM1Ny9DK3FSNDE0?=
 =?utf-8?B?dytMcVBORm1FSEp2L0E4UkV0T2dNdk1SWTh6UHZXcFd6L0lDV3phb2ppL3dl?=
 =?utf-8?B?RDZZazJaSS84bFd5dHUvc05ZZ0pqeXlsWWpjd2ZkbjlqeUtrVG85ZmpaR0Zz?=
 =?utf-8?B?dzBta0YxZmVIZGlIb1pJZForT2x3cElzS2tWZVg4OVFOZnl3c3l4ODYxZHND?=
 =?utf-8?B?US9HYVhTMXdObkpJdkp6ZzMrd2ZzUmJQUlBSQ1J0VXpaZ3dzRWdNTWpxbWd4?=
 =?utf-8?B?TmJlT3F0RTBLU2Z6dno5Rmh4U2Z0ZUZUNDdPUVdEa0JXZ2hrclB2c3pUNnVp?=
 =?utf-8?B?SmdUcVBYaGhVUlZTc2YyeDBlNERyL0JZL0JzTVppSW5hbko5YlFMYXZCaG4z?=
 =?utf-8?B?aGl1MC9CUlN4emNXMnp0ZkdwR3lBQ01PVjdYY2toYUtPOEZkN3MrOVl0TXpO?=
 =?utf-8?B?L3hjdjdIVlNJczdtbkxMT0ZKWGhudGFKdDFIOS9qMml2bWxLUWt1L1ZZVU5p?=
 =?utf-8?B?TzVRakNjZFc2U0QzTTdZaG1ZdzUremZ5Vmh2WlBYWTFtdkdKUVJpcHhzNXVy?=
 =?utf-8?B?RDQxT1RXbkhJblp4UlQycnNzaGVKdFVyWXBjU0FXY0dPc092WjdCR3R6cmFx?=
 =?utf-8?B?VGVtdXBaQ3AxMmJNUHhwSjdtYnA0bVdhcTRDRWlsaVd1empqYU1ZMzNHdlRq?=
 =?utf-8?B?TXBEYzdVc1VCSFVEeTJJSFNTTnlSUCtBaDE5bWRmZDFaRVhHdk1ZRm5tV1Q3?=
 =?utf-8?B?ektIV0NkVDYxVFM1NGZCcEtlUkFyc1kzT28wVkFCYW94N2ZvVlBLa1FYU1oz?=
 =?utf-8?B?SEFBbTlHZ1VpSjMzeFM2eXBlUlh3VzRldERkQkpVT2JiUEdUMXJMc3Ruc2tH?=
 =?utf-8?B?VUdyNzJqdm11T0d6dnIvN0Q5R3RjY1ZSa1ptSW1vZVU5SzBya2ZZMGFtRjdn?=
 =?utf-8?B?dTF1bm1mOVJlOWpvVjVYVEl5T3Nxb1ZFVHk4WDZkdUR4QmhPRDJyTUtEWHhB?=
 =?utf-8?B?R1F2bURjNy9VYmwxb1U5NTBoMCtobk02bmxwaVU1aXhVRktwODlEUnFVMUhL?=
 =?utf-8?B?cGlEd3kzaEljRWFQMk9PK3BOQm1BcEpDU0ZUdjJqYkl0dWtNdlZnZWI1ckhr?=
 =?utf-8?B?T2NucWZwNU9NNGpmVzB4Q1hEQ1d2ZjU1NGxKcUtMVUlEYnpBa3Nld0liZHRx?=
 =?utf-8?B?UkpOcEgrK0tGclNJT0dUOFM5Qy9rcVNoWDJSd0I3WHZaZWkyZ2ZSZzNLRGp3?=
 =?utf-8?B?UEJpTU5idUxDOFRRTW5sL09xRHFEZnppQXFyODRIWDBISVJvaC9Ob0xFNXlO?=
 =?utf-8?B?ZDlXWmNVMEJKZGZVZmIybm1SWlp4QnAxa1hWaXpFZHhCOEx5dW43d1NPejRY?=
 =?utf-8?B?bWJaZ1ZiTlpvMm9EU2U5Mm12Rk1CN2pEcmFqMFNvZUFNaVBsVC82VTMveC9U?=
 =?utf-8?B?K3JYODg3amVBcUM4TUpiK0wydmJiVjA2MnhFdjlhNVlKNGJRTHU0T1FXaWhR?=
 =?utf-8?B?S2NDR0UxSGIvUSs2K0wxZ3FGakZKS0FjcnFVc0g0ZEZBYUNVU3VjUDlDV2hY?=
 =?utf-8?Q?W+x6E+v3DU5yx2YU=3D?=
X-Exchange-RoutingPolicyChecked: 
	EQXku7OUKFkKRuDU+/O9MWlKg90ShdkqUuE4ejxuC2QQ2v5/PlQK/VUA2ceTcUdaK2sci5nq7O2AMfe+a2ButSIo03lavMHHkKY30nCsVp7dnIQvUUpfCwnYTVnS4bae4aD+PBQKSmzySku2Y/Imr/9rybZePiTchPCnaW00niA10R34QVuMIf5Lu+LV1RW2tN93vsyzGlFwYZBiYrLxOyJRMShclvfm0ORy61ESjuQVwp1dhceFN5SsHg9X9mxI3a8IUqUVCZimKIvleo9zEnuWvz/qd78ZBfcwMyjNERE5q8XYGtpJqa6DEWacq8tmK2aeZnlIOrqEhACvsrTfmA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1067eb67-4d52-4407-e774-08debbd2afaa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 09:31:10.2928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YlE9MvE8MotB36mgY2Hju5PDZc1QoLZcvM5DB1umdZUfdLoAGtZBb+YM7RGmoo5KP0OxYbUums2U4fNgVEXVgUgw67cXSB0AQGbzI9ua9aE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7150
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Oga5J34ENQpBCqcPsf60zDeeM0ZsNJ3P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MSBTYWx0ZWRfX5jIY2xO7Whey
 BOtCjJpB68RJp2aBDhmQs3+0z4xh0WLBvj2gAWr7/74qnWJHAMD08aiCtNp6Kp4e5fTZOhmP9p3
 HzwlIqssDCQ8oJI1AYvriDpCmP8NLSim7S5qDgtdLbVFNQQP9aNtIFgPUM5q4xbIXklMOJt3d3g
 CiIuJqlnR6erCmf/5Y+tgj0Og9TCov2VYAI/DrprMArnBQB65wVC1ASTls3ZwxzZd2+oyW40p0x
 x28W/qcerQSVbTeq2m6Mr7uzF3AjYgkfPhhqyJD6nHquk3OUO1QInQp/txkKju1GALuatsa5TCA
 MbhpFOKluyA0k+rPbrQEH7JJVDG25j62W3Kbgy4kCnvzxbpmYj+cVTuTy5pbDcLNskQZ39UcWkI
 NtZiVC1OCewo23WrDMUB8tScSgyKZ4Ex1zcW7JK5d1p3KLi5iC1NKxMjJtYMfmcvSpKPkskYJGN
 Qbb9RO5Vtd1p08YSvUA==
X-Authority-Analysis: v=2.4 cv=IMUyzAvG c=1 sm=1 tr=0 ts=6a16b9e2 cx=c_pps
 a=AyKazF/bLMNy1/nXoCkdcg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8
 a=NEAV23lmAAAA:8 a=mDV3o1hIAAAA:8 a=l3AAxoKfAAAA:8 a=69nY34h2AAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=uvfPIEYss-Wu4eJo0qcA:9 a=lqcHg5cX4UMA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=j6fAqC0LR5kF5A1QgqEA:9
 a=ADDxwSnllBfaMuKv:21 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=kvrLZrNG06BMISKf9NX4:22 a=v0c5d-ypcSyHzxH3vEE-:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: rergMI605kWevLxqEyj8sF8Hb8LqQVWZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 09:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237633

--------------xbgyu2Ae3bzNLnqCroQ8r9Fc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64R8kcvG2757539


On 23-05-2026 07:08 am, Khem Raj wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Tue, May 19, 2026 at 12:26=E2=80=AFAM Hemanth Kumar M D via=20
> lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!fIjDCZOqeIvU5tBeDszltF5-mgerauWqLOnwdmO_dVbVBxKuk8pb1o8dHC4hYiKpJWfgE=
lDScNKN2kIU6FfjAXI$>=20
> <Hemanth.KumarMD=3Dwindriver.com@lists.openembedded.org> wrote:
>
>     From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>
>     libatomic constructs gcc_objdir using `pwd` and assumes
>     MULTIBUILDTOP is relative. Passing an absolute MULTIBUILDTOP
>     from OE results in malformed paths during libtool install
>     operations in both compile and install stages.
>
>     Avoid passing MULTIBUILDTOP for libatomic and use the upstream
>     default handling instead.
>
>     Link:
>     https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d=
3d40faca10ea2e
>     <https://urldefense.com/v3/__https://github.com/gcc-mirror/gcc/comm=
it/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e__;!!AjveYdw8EvQ!fIjDCZOqeIvU5=
tBeDszltF5-mgerauWqLOnwdmO_dVbVBxKuk8pb1o8dHC4hYiKpJWfgElDScNKN2kIUeqxA3y=
Q$>
>
>
> It would be good to start a discussion/bug in gcc about it, I think=20
> using=C2=A0pwd relative paths is perhaps
> less than ideal to use here. We can accept this additional logic here=20
> for OE in the meantime.
Hi Khem,

I=E2=80=99ve filed a GCC bug for this issue here:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D125449=20
<https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D125449>

>     Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>     ---
>     =C2=A0meta/recipes-devtools/gcc/gcc-runtime.inc
>     <https://urldefense.com/v3/__http://gcc-runtime.inc__;!!AjveYdw8EvQ=
!fIjDCZOqeIvU5tBeDszltF5-mgerauWqLOnwdmO_dVbVBxKuk8pb1o8dHC4hYiKpJWfgElDS=
cNKN2kIUzaMJWEM$>
>     | 12 ++++++++++--
>     =C2=A01 file changed, 10 insertions(+), 2 deletions(-)
>
>     diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
>     <https://urldefense.com/v3/__http://gcc-runtime.inc__;!!AjveYdw8EvQ=
!fIjDCZOqeIvU5tBeDszltF5-mgerauWqLOnwdmO_dVbVBxKuk8pb1o8dHC4hYiKpJWfgElDS=
cNKN2kIUzaMJWEM$>
>     b/meta/recipes-devtools/gcc/gcc-runtime.inc
>     <https://urldefense.com/v3/__http://gcc-runtime.inc__;!!AjveYdw8EvQ=
!fIjDCZOqeIvU5tBeDszltF5-mgerauWqLOnwdmO_dVbVBxKuk8pb1o8dHC4hYiKpJWfgElDS=
cNKN2kIUzaMJWEM$>
>     index 30b2832c82..e305180c64 100644
>     --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>     <https://urldefense.com/v3/__http://gcc-runtime.inc__;!!AjveYdw8EvQ=
!fIjDCZOqeIvU5tBeDszltF5-mgerauWqLOnwdmO_dVbVBxKuk8pb1o8dHC4hYiKpJWfgElDS=
cNKN2kIUzaMJWEM$>
>     +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>     <https://urldefense.com/v3/__http://gcc-runtime.inc__;!!AjveYdw8EvQ=
!fIjDCZOqeIvU5tBeDszltF5-mgerauWqLOnwdmO_dVbVBxKuk8pb1o8dHC4hYiKpJWfgElDS=
cNKN2kIUzaMJWEM$>
>     @@ -83,14 +83,22 @@ do_configure[depends] +=3D "${COMPILERDEP}"
>     =C2=A0do_compile () {
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in libgcc ${RUNTIMETARGET}; do
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}/${T=
ARGET_SYS}/$d/
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake =
MULTIBUILDTOP=3D${B}/${TARGET_SYS}/$d/
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ "$d" =3D=
 "libatomic" ]; then
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0oe_runmake
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0oe_runmake
>     MULTIBUILDTOP=3D${B}/${TARGET_SYS}/$d/
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
>     =C2=A0}
>
>     =C2=A0do_install () {
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in ${RUNTIMETARGET}; do
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}/${T=
ARGET_SYS}/$d/
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake =
'DESTDIR=3D${D}'
>     MULTIBUILDTOP=3D${B}/${TARGET_SYS}/$d/ install
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ "$d" =3D=
 "libatomic" ]; then
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0oe_runmake 'DESTDIR=3D${D}' install
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0oe_runmake 'DESTDIR=3D${D}'
>     MULTIBUILDTOP=3D${B}/${TARGET_SYS}/$d/ install
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${datadir}/gdb/auto-load=
/${libdir}
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${libdir}/libstdc++*-gdb.py
>     <https://urldefense.com/v3/__http://-gdb.py__;!!AjveYdw8EvQ!fIjDCZO=
qeIvU5tBeDszltF5-mgerauWqLOnwdmO_dVbVBxKuk8pb1o8dHC4hYiKpJWfgElDScNKN2kIU=
-UrTfKo$>
>     ${D}${datadir}/gdb/auto-load/${libdir}
>     --=20
>     2.49.0
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#237280):
>     https://lists.openembedded.org/g/openembedded-core/message/237280
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/237280__;!!AjveYdw8EvQ!fIjDCZOqeIvU5tBeDszltF5-mgera=
uWqLOnwdmO_dVbVBxKuk8pb1o8dHC4hYiKpJWfgElDScNKN2kIUNSXecxk$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/119387078/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1193=
87078/1997914__;!!AjveYdw8EvQ!fIjDCZOqeIvU5tBeDszltF5-mgerauWqLOnwdmO_dVb=
VBxKuk8pb1o8dHC4hYiKpJWfgElDScNKN2kIUa_Sd8Ug$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!fIjDCZOqeIvU5tBeDszltF5-mgerauWqLOnwdm=
O_dVbVBxKuk8pb1o8dHC4hYiKpJWfgElDScNKN2kIUdN2hPAk$>
>     [raj.khem@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--=20
Regards,
Hemanth Kumar M D

--------------xbgyu2Ae3bzNLnqCroQ8r9Fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64R8kcvG2757539

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 23-05-2026 07:08 am, Khem Raj wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1spaC4NPT8rL6GHhtP8aDwV87K=
mr0EM5yuPZ5YJhxpau7w@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border: 1pt solid rgb(156, 101, 0); padding: 2pt; bac=
kground-position: 0% 0%; background-repeat: repeat; background-attachment=
: scroll; background-image: none; background-size: auto; background-origi=
n: padding-box; background-clip: border-box;"><strong><class=3D"msonormal=
" style=3D"line-height:11pt"><span style=3D"font-size: 11pt;">CAUTION:
              This email comes from a non Wind River email account!</span=
></class=3D"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size: 10pt;">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr"><br>
          </div>
          <br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 19, 2026 at
              12:26=E2=80=AFAM Hemanth Kumar M D via
              <a href=3D"https://urldefense.com/v3/__http://lists.openemb=
edded.org__;!!AjveYdw8EvQ!fIjDCZOqeIvU5tBeDszltF5-mgerauWqLOnwdmO_dVbVBxK=
uk8pb1o8dHC4hYiKpJWfgElDScNKN2kIU6FfjAXI$" moz-do-not-send=3D"true">
                lists.openembedded.org</a> &lt;Hemanth.KumarMD=3D<a href=3D=
"mailto:windriver.com@lists.openembedded.org" moz-do-not-send=3D"true" cl=
ass=3D"moz-txt-link-freetext">windriver.com@lists.openembedded.org</a>&gt=
;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              From: Hemanth Kumar M D &lt;<a href=3D"mailto:Hemanth.Kumar=
MD@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">Hemanth.KumarMD@windriver.com</a>&gt;<br>
              <br>
              libatomic constructs gcc_objdir using `pwd` and assumes<br>
              MULTIBUILDTOP is relative. Passing an absolute
              MULTIBUILDTOP<br>
              from OE results in malformed paths during libtool install<b=
r>
              operations in both compile and install stages.<br>
              <br>
              Avoid passing MULTIBUILDTOP for libatomic and use the
              upstream<br>
              default handling instead.<br>
              <br>
              Link: <a href=3D"https://urldefense.com/v3/__https://github=
.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e__;!!A=
jveYdw8EvQ!fIjDCZOqeIvU5tBeDszltF5-mgerauWqLOnwdmO_dVbVBxKuk8pb1o8dHC4hYi=
KpJWfgElDScNKN2kIUeqxA3yQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-n=
ot-send=3D"true">
https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40fa=
ca10ea2e</a><br>
              <br>
            </blockquote>
            <div><br>
            </div>
            <div>It would be good to start a discussion/bug in gcc about
              it, I think using&nbsp;pwd relative paths is perhaps</div>
            <div>less than ideal to use here. We can accept this
              additional logic here for OE in the meantime.</div>
            <div>&nbsp;</div>
          </div>
        </div>
      </div>
    </blockquote>
    Hi Khem,
    <p data-start=3D"10" data-end=3D"51">I=E2=80=99ve filed a GCC bug for=
 this issue
      here:</p>
    <p data-start=3D"53" data-end=3D"104"><a data-start=3D"53" data-end=3D=
"104" rel=3D"noopener" target=3D"_new" class=3D"decorated-link moz-txt-li=
nk-freetext" href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D12544=
9">https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D125449</a></p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1spaC4NPT8rL6GHhtP8aDwV87K=
mr0EM5yuPZ5YJhxpau7w@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              Signed-off-by: Hemanth Kumar M D &lt;<a href=3D"mailto:Hema=
nth.KumarMD@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" cla=
ss=3D"moz-txt-link-freetext">Hemanth.KumarMD@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;meta/recipes-devtools/gcc/<a href=3D"https://urldefen=
se.com/v3/__http://gcc-runtime.inc__;!!AjveYdw8EvQ!fIjDCZOqeIvU5tBeDszltF=
5-mgerauWqLOnwdmO_dVbVBxKuk8pb1o8dHC4hYiKpJWfgElDScNKN2kIUzaMJWEM$" moz-d=
o-not-send=3D"true">gcc-runtime.inc</a> | 12
              ++++++++++--<br>
              &nbsp;1 file changed, 10 insertions(+), 2 deletions(-)<br>
              <br>
              diff --git a/meta/recipes-devtools/gcc/<a href=3D"https://u=
rldefense.com/v3/__http://gcc-runtime.inc__;!!AjveYdw8EvQ!fIjDCZOqeIvU5tB=
eDszltF5-mgerauWqLOnwdmO_dVbVBxKuk8pb1o8dHC4hYiKpJWfgElDScNKN2kIUzaMJWEM$=
" moz-do-not-send=3D"true">gcc-runtime.inc</a>
              b/meta/recipes-devtools/gcc/<a href=3D"https://urldefense.c=
om/v3/__http://gcc-runtime.inc__;!!AjveYdw8EvQ!fIjDCZOqeIvU5tBeDszltF5-mg=
erauWqLOnwdmO_dVbVBxKuk8pb1o8dHC4hYiKpJWfgElDScNKN2kIUzaMJWEM$" moz-do-no=
t-send=3D"true">gcc-runtime.inc</a><br>
              index 30b2832c82..e305180c64 100644<br>
              --- a/meta/recipes-devtools/gcc/<a href=3D"https://urldefen=
se.com/v3/__http://gcc-runtime.inc__;!!AjveYdw8EvQ!fIjDCZOqeIvU5tBeDszltF=
5-mgerauWqLOnwdmO_dVbVBxKuk8pb1o8dHC4hYiKpJWfgElDScNKN2kIUzaMJWEM$" moz-d=
o-not-send=3D"true">gcc-runtime.inc</a><br>
              +++ b/meta/recipes-devtools/gcc/<a href=3D"https://urldefen=
se.com/v3/__http://gcc-runtime.inc__;!!AjveYdw8EvQ!fIjDCZOqeIvU5tBeDszltF=
5-mgerauWqLOnwdmO_dVbVBxKuk8pb1o8dHC4hYiKpJWfgElDScNKN2kIUzaMJWEM$" moz-d=
o-not-send=3D"true">gcc-runtime.inc</a><br>
              @@ -83,14 +83,22 @@ do_configure[depends] +=3D
              &quot;${COMPILERDEP}&quot;<br>
              &nbsp;do_compile () {<br>
              &nbsp; &nbsp; &nbsp; &nbsp; for d in libgcc ${RUNTIMETARGET=
}; do<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cd =
${B}/${TARGET_SYS}/$d/<br>
              -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe_=
runmake
              MULTIBUILDTOP=3D${B}/${TARGET_SYS}/$d/<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if =
[ &quot;$d&quot; =3D &quot;libatomic&quot; ]; then<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;oe_runmake<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;els=
e<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;oe_runmake
              MULTIBUILDTOP=3D${B}/${TARGET_SYS}/$d/<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fi<=
br>
              &nbsp; &nbsp; &nbsp; &nbsp; done<br>
              &nbsp;}<br>
              <br>
              &nbsp;do_install () {<br>
              &nbsp; &nbsp; &nbsp; &nbsp; for d in ${RUNTIMETARGET}; do<b=
r>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cd =
${B}/${TARGET_SYS}/$d/<br>
              -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe_=
runmake 'DESTDIR=3D${D}'
              MULTIBUILDTOP=3D${B}/${TARGET_SYS}/$d/ install<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if =
[ &quot;$d&quot; =3D &quot;libatomic&quot; ]; then<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;oe_runmake 'DESTDIR=3D${D}' install<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;els=
e<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;oe_runmake 'DESTDIR=3D${D}'
              MULTIBUILDTOP=3D${B}/${TARGET_SYS}/$d/ install<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fi<=
br>
              &nbsp; &nbsp; &nbsp; &nbsp; done<br>
              &nbsp; &nbsp; &nbsp; &nbsp; install -d ${D}${datadir}/gdb/a=
uto-load/${libdir}<br>
              &nbsp; &nbsp; &nbsp; &nbsp; mv ${D}${libdir}/libstdc++*<a h=
ref=3D"https://urldefense.com/v3/__http://-gdb.py__;!!AjveYdw8EvQ!fIjDCZO=
qeIvU5tBeDszltF5-mgerauWqLOnwdmO_dVbVBxKuk8pb1o8dHC4hYiKpJWfgElDScNKN2kIU=
-UrTfKo$" moz-do-not-send=3D"true">-gdb.py</a>
              ${D}${datadir}/gdb/auto-load/${libdir}<br>
              -- <br>
              2.49.0<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#237280): <a href=3D"https://urldefense.=
com/v3/__https://lists.openembedded.org/g/openembedded-core/message/23728=
0__;!!AjveYdw8EvQ!fIjDCZOqeIvU5tBeDszltF5-mgerauWqLOnwdmO_dVbVBxKuk8pb1o8=
dHC4hYiKpJWfgElDScNKN2kIUNSXecxk$" rel=3D"noreferrer" target=3D"_blank" m=
oz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-core/message/237280</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/mt/119387078/1997914__;!!AjveYdw8EvQ!fIjDCZOq=
eIvU5tBeDszltF5-mgerauWqLOnwdmO_dVbVBxKuk8pb1o8dHC4hYiKpJWfgElDScNKN2kIUa=
_Sd8Ug$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
                https://lists.openembedded.org/mt/119387078/1997914</a><b=
r>
              Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@li=
sts.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
                openembedded-core+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!fIjDCZO=
qeIvU5tBeDszltF5-mgerauWqLOnwdmO_dVbVBxKuk8pb1o8dHC4hYiKpJWfgElDScNKN2kIU=
dN2hPAk$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
                https://lists.openembedded.org/g/openembedded-core/unsub<=
/a>
              [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" mo=
z-do-not-send=3D"true" class=3D"moz-txt-link-freetext">raj.khem@gmail.com=
</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Regards,
Hemanth Kumar M D</pre>
  </body>
</html>

--------------xbgyu2Ae3bzNLnqCroQ8r9Fc--

