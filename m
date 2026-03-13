Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89D0106FD6F
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 03:27:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7934.1773372435737526396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 20:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=jpLH4Lfk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7532e9d984=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D00dR03614206
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 20:27:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=p8K20vpH1uwlLw4svXRhA7WB3ecovln6eA6bKiKowYI=; b=
	jpLH4Lfk0Ds+7aZMJWtfd6LKpUwy1z/6ef7wFg6Wd5VftZKU3lvlfPPlxPt97vml
	6gsnocFR2awcfJjdAse/O0BwqL80xJ3DpPdz/JWfq86UIH2H33HIu9wVMAg1Yx0M
	Dd65JSeZuOCKHyObaZnTKMWLs4Aq1dISagOuFHwfISK2iWXJuJgk97sKlVHmRTkG
	T2UXVcI6nKTOZiBnltmql/Z3mycZv65Lv8fCMZ62RS0xNs55SNwUgRKOSqer4mlu
	WwzzZqRe4uTjukmbbGBAN987kXRvYIrA78tai13qAoHjE7hkZBE4he/+mgV7TJq7
	jyk9nzs6mMauR/Q23OR4Sw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010004.outbound.protection.outlook.com [52.101.56.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6psky6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 20:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCBTPwUpOAK6m2+kNW4PfOE4J0SRbP2ohJag5Db17mkL5oPcjmn3BNmotSaUbUVsYr9Udigh4RWn24+PtDOdbvncB3vTp82s3dcp5eeRgvc2MnyzxXSDHMzcrSwPfN0OsLDlHN1JOMUKJlJtFrbH1NXayAN8/wxl39vOlA52td3o40FbvRbuFrPlP00VgdMU12oUhjhiAZvCq7s966fY1E7iwOiqMOJnTfFB6H6vMIjthYpVomoAdaaCawf3tlFvxd783SxjFxO27aRCfeislrBdyJhxt7MozaaUWG86HTIuUAqTv+UDzmnTQnXFnwnAJL+/8oEbqEK0bMfRImk90w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8K20vpH1uwlLw4svXRhA7WB3ecovln6eA6bKiKowYI=;
 b=eT3//IzAQkHpLe+PZ6TJ9vivfPPGbIqpZOlSiUosNXceC+HnfSbpTdKbviuXTw3VBmU/U9hfQzkpb8pLRDUoWZJ3fqvRcGBAmPNSFaJcbzSBsB34MNYoRz5r4+fkAo0UGDAzEowFqR4Hf5dE3RqtmFwtWKuHX7sSj9sjrfH6UdnThQ7LKh9V4/SakGd7Zk0ZomnFVRbQ9ViwjZLslX1xKetykTyK9Q77lKWpXM4NaRRRv/MlrBCOl8h4qPENPMXzV6ayuaRsfkx6rHvbwKxv1kRfWHvT5bucvWuapY8WC2XLRcOCaK8y4vu3ykvxAGBQHOPIJ4xANtAy8GO1J25CoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB6869.namprd11.prod.outlook.com (2603:10b6:806:29c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 03:27:09 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9700.009; Fri, 13 Mar 2026
 03:27:09 +0000
Message-ID: <24cfe9bc-6bb7-484e-981d-464f059c6011@windriver.com>
Date: Fri, 13 Mar 2026 11:27:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] machine/qemux86-64: Recommend extra kernel
 modules
To: alistair23@gmail.com, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Alistair Francis <alistair.francis@wdc.com>
References: <20260305053505.1632077-1-alistair.francis@wdc.com>
 <CANNYZj9FNw4F0228tOo_BJUzrkvWFy-_5pLDv7XG=J-Z3FWP0A@mail.gmail.com>
 <CAKmqyKP7+qWZfEsg1R8geLVeOoime8w0wAOf5kK2qp12PDZ+bw@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CAKmqyKP7+qWZfEsg1R8geLVeOoime8w0wAOf5kK2qp12PDZ+bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SGAP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::15)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA1PR11MB6869:EE_
X-MS-Office365-Filtering-Correlation-Id: c1123fe3-66c4-4642-3834-08de80b068ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	tdwHmsxYbWcleSni6qAbkNRJLoHr+LUsIdmVxm+Xwqy9evu78nU/hDKAy0s8KGt92xBoZo34YKJL6TTt6Wa35RKifOtWh5DUxZ5chHT+GXTSFwaytg23TynThKinmg9RHJU3Uon6vuLnbXNEt9rFVksVYA3da1WNzwfQryIsQJTsmrv7PIDRlm7jF5D0WRnkuJH19LnCaSd7hESgTBOecFEldGAXgmyNpKTKWaVS3Tf8EZQT/+NveTA0sYPhkzuQioy8TqcJHZAYMC7iSHrrqJKKpGW5VYcysKVX38m6q4HOI9bJujB5pLB3j2kaYIkpIIPxQb+/ayiTTfnBgrxaVv0IxYiAwGQg8+KyDcUxr+oF23hpLYuIfePjY5YqEtmBO1A2rjM1uS6m5CfNwRnD1EjK4ufp09qi4sxEXh3phYvcdaghD3Mw4LX3+CTjRfG5TREvVMbqOme1+35Sih9VJCIBVCfoRrDii7OKjAFE39f9+LSdtsA5FBZl3BDMmzk7Dag5kmWBbNC8PSjee3K5GVoQE6OUxhsrUSDd3oMod9iSTpHwU+cVOq3yrI1pGHbnQ/hUzGD0b+2Dk1ZnFKOPxJ8R8d8esGFeLGnxZJOjIHGNoWmi/H1t5kcS9rEo/0KlJ1hGic9B3iv841g9KZ4YxL3oHaV9lUh6hMRUcXYVLoz9+YN/gl8f5WcJircgDqaK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MUFKci9QNGExS3kzVCtCS1NCNytENlUydW8yaGdyWWcrVlJpaXFjei9QQk1x?=
 =?utf-8?B?a1k2TjNqWkJFY2RnMU1tWVA1WndEU2c1VlRja1FET3V1Vzd4MkFvSnU1YjBY?=
 =?utf-8?B?Wld5MndmbUgvamxTSHFoYno4R3JFWE5SUEZHL25yZWxxVXhTK1lZUXBQYXY2?=
 =?utf-8?B?R253ZlQwVU5rMEg4VFUwRm41Z0dOSjFtMFBON0pmZlRha1NwMFdzalhWSUdz?=
 =?utf-8?B?WTBzd0syblRmd3c1SVdNb2ovNVBTNzd3UlVibDNNbVZud3hNMThCanJxMGtS?=
 =?utf-8?B?enFGdktGRnk5RDVzT1hDQWd6SEFLRk5SWmxvcUtacmdkTS9pb1hBaXg5MU1T?=
 =?utf-8?B?NzNFY0RmT3UzbnczT2VvdGg2dEJYMStNaDlTZWd4aDdDUUlua3RNMDNzUjFI?=
 =?utf-8?B?WEcwMUQ5STB1Q29lbnR6Y1krTFc2cUZsenpJVk45ZVpLZHZ3Uy8vRzRDTThO?=
 =?utf-8?B?MlZIUVlHZ0x3TVZGWDRzeVY0R2lvbnI2L1BvQVRTbWg5dVNLRExtaHF1dllV?=
 =?utf-8?B?YXRyc0RxWWw1ekVEb3FQckZCUE5nSXVybkx3RkNIR0I2Y0VSOUtHN1g5QXJt?=
 =?utf-8?B?Ni9TWUpxQmovLzB2WGJoa29QNXNhNmZMc3ZnaGNPNGsrSVRvSm5NQ0I0Y2Qw?=
 =?utf-8?B?VGtQUytxQVdBa3VJdjJlYlVQWlF4VlpsYzBEVVNxTzlTekdla1ZPZ2QxdkNI?=
 =?utf-8?B?Y25xdkpMSUJLa2czMDM5WEh3dFFsQndyZWVHdUYzam9Sb2dFSVAvNG5HZGZE?=
 =?utf-8?B?VHg1UHVmR2hzSEhBMlJtaURhaERyeEx0UG1qOVJBSDhua2g4c2w2OXFZZi95?=
 =?utf-8?B?bXR2SWE5NU5xdGJtbG1RQlFqN2htVkpVRHdQNTh2RFZxR3p6K2VLakx3NUkx?=
 =?utf-8?B?Q3NmSWM1VXVZNTdyZTBVYWxVY01BaDFRdjl4TVdhK1dhN2FWdHJsYVhQOU1j?=
 =?utf-8?B?TWNiN1krQzFocTdkNlppWUdEN2p3R2wxS3NBWjhpSUxkNFhlMDN6ZXhSUzRw?=
 =?utf-8?B?VTJHZzF4bEE3ZEFxQnBDSnJ0R1NqSHowV0ZEZkphOWF0cUd1SEtqM1JnaVZI?=
 =?utf-8?B?Y2JUaWlweTNhcHgveC8wdktsNFpwaWo4WGdHNWxzSGlLa2JIREVxSVZYZ28w?=
 =?utf-8?B?SkVZTnhSL0cyM0hoUWZKRHEvaEJNWkhlNkVlYklxRTVjSUZRMDBwT3JoWGQ4?=
 =?utf-8?B?MkdOWE9tS0ZwdjVJU3JrMVpaeTg4RW14eUlqWXlOOXllRm83NkR4VTdhRUJy?=
 =?utf-8?B?Nm01dW5jM0JKK2U3eVZYbWJTOTcwQldRcmloK0lzczlwU3hJNnBtcjBsMmtT?=
 =?utf-8?B?bUdWRlVPOTUwNmE1MGFoWlFRM05aeERSS1d2N0t2eHYycTdsMUZQdS96U1lF?=
 =?utf-8?B?YWZxdm45SUNpME10VEtSbWIwWHhBRUdSMTMxM3ZhQm5zWGxjck1iaXd1YTZp?=
 =?utf-8?B?K1RzYUh6SUNkK3dOTGEzM2RkeTdBbGl1TnR1N1RuNzhQMlRPeUFWRG8rZTJE?=
 =?utf-8?B?ZEZTR2NOS1lRQVBBaG1rckNydlZubUFUSjV6Q3hwNTBjVFkyR1JZamIvQWd6?=
 =?utf-8?B?cUEzVm1sT1hKaWl3TVlyZjF5WXFvSXZnY1JwWUt5Y1VLd1pZSHQycFZJN0lZ?=
 =?utf-8?B?SElVcGVjcUo0K0FOckVRQTNjSmVzUkdrZ3RkT3VWZ1hCWUpja3RLeElsa3d3?=
 =?utf-8?B?NTh0bHllMEwwV0toRGlYMm80U1VwRm94NG9hb05JbWVJRVJ5cG9rdXRsV1hz?=
 =?utf-8?B?V2wwcHBKQVlna3ZjK290WUx1cG1YRGkvSlkvOGtvT1FNZDRQNzdTT1Z6cFNQ?=
 =?utf-8?B?Z2liNEI4MzVycTBrYUt3eHVxTG44MHNaaDJtWWM1UEYxZVFSbTIyY1BXekIw?=
 =?utf-8?B?Z2w3U2VvMWNTbzNNOGllczZyZit3U0ZtT3pLQy9LK1ZJTGVsSXFDZXNaRkp4?=
 =?utf-8?B?ajVNbjJ1Nkl3V3BONTJQNlRUdDdIdkV3Q0plL2daRHI2OWVqeHp0dWhwVkRo?=
 =?utf-8?B?V3FZVGc2dnBMc0MwTldEVTBJN1kwbnFub0xXQnBYNy8yRlc0U0tlS0t2K3pV?=
 =?utf-8?B?bVRwcnhPN21rNWNJS1BpV2ptZlVnRERLMlc3QyswQ1RQazY5WEV5UUFuMzNN?=
 =?utf-8?B?R1ZkWUtuU29NMzFNNVQxTnlBblVneUsxVTY0WTIvQ1gvMlhvQjFlc0Vkb1hk?=
 =?utf-8?B?WGVPcmVvTHhlYlp1bGw0T0ZvSHZzYzB4clJ6VlBKZ09paFZzeUMxMkVSK2JK?=
 =?utf-8?B?RGxJVUUrb3VOeENKWDRUKzhiNEJxTjFtSDRMcHFrdHR4RzBRTFRhZUNvRTk1?=
 =?utf-8?B?bmxqWlU0SDBEcHhSTSt1ZWZrTCtVaDJ5dTlnb3BnclRleFMrOHhpZz09?=
X-Exchange-RoutingPolicyChecked: 
	S4JKWFXnf9UEUpFoX/vSqz1Fo+/YBaH5Hy/SO0c7271nv42dAhtSgXVtZY+msqxNXwkmg32REZ7q9QUn604KvaSWKuhSFuPWZrXQ8CH+bmenKnWswWinhsFanAyhYcTCKM02QyIUnuu69PTANlMcU4fcKT++7EhnRR2gVV0bipUoIZ1/hylIzNsD6x6IGlfEC1YEbaDZYIM8kd2RjPuDk41Z1O/M7Y+ZL12Y9zb4TZZYqWuWUjq7rIlyjF3eiQ+Ukx/yd68EwFRHYvUtmGApQKmL4d509TB44zYHynkxv7mw08DmTMQQ4kAn9lMD/iRNx2UvFweUDCaLI0HFSghjfg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1123fe3-66c4-4642-3834-08de80b068ab
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 03:27:09.2784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAFmKNe41ViOGyUjmj6WRscLHP6ZfAxSB0kmaq1NVhw04EB+4vNgkNoPqoo1+K/VKwwrhrwvXNeBG3HBhGS0hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6869
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ePAeTXp1 c=1 sm=1 tr=0 ts=69b38413 cx=c_pps
 a=5+b0Cb5m1vs/r/JsbObUdA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=yLGi2X1nflk25Yfoh5IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 1MSLt9qVKvtFjJ_mugCFfTyFwCR0RXge
X-Proofpoint-GUID: f6vg3rAktL33PnSQCDKlMEbnGBpzbJ6v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAyNiBTYWx0ZWRfX9p2m6TmXYanl
 kyh30bZda5+/2brUcqtaR3CjTk35RY8fQEySuJ0GkwMu7avBOKFTuaWQR6dskVpszv6fCgDx3Dp
 GsoccA9FLN09D+GTVBXaJhGrg0Pr1ap5MD1JIRoMKOq/rMnKN5c/mBwlgQQGP3iQuLrSLLu8bn3
 9qK74X0h8Rm2anLnVRFDg6uSjuoV3UY8xNyucVVejsudcA/ikqquo7YBi+fn0l+RZNnZQWZjTul
 gehgf1T2ghKixXnGwDETDgNV4kkZJu+32iZ6eZEbgYPcHvc2GR8Uqz57LHGPHBw3qj4ZyQEMiDd
 XiBaGZ/V3ajIYnryGjKKGVNQNgqr9nA5isjN1JqsbuBaZAqUrgPjVkt/VKufnaFjhsinklaOqdT
 Ig3vvyHemmVSf4glBA40dt3okZN7lMUdWCkx9O9nUwMBm4UXnSOJPszuX1LdEX1g+GX/B/+MT+t
 y9mpHD7ScgYDMIXMgOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130026
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62D00dR03614206
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 03:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233020

IMHO, if you install all kernel modules for machines such as qemux86-64,=20
which are used by a lot of people including layer maintainers to do=20
basic testing, then the problem of recipes lacking dependencies on some=20
specific kernel modules will be covered up.

Ideally, if recipeA needs some kernel module at runtime, it should list=20
it in its RDEPENDS.

Regards,
Qi


On 3/13/26 08:05, Alistair Francis via lists.openembedded.org wrote:
> On Thu, Mar 12, 2026 at 9:22=E2=80=AFPM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
>> On Thu, 5 Mar 2026 at 06:35, Alistair Francis via
>> lists.openembedded.org <alistair23=3Dgmail.com@lists.openembedded.org>
>> wrote:
>>> When bulding Linux with kernel modules by default they aren't include=
d
>>> in the qemux86-64 machine. Let's ensure that they are included by
>>> setting the MACHINE_EXTRA_RRECOMMENDS to include " ernel-modules".
>>>
>>> This is already done for the qemuppc64, qemuloongarch and qemuriscv
>>> machines.
>>> -MACHINE_EXTRA_RRECOMMENDS =3D "kernel-module-snd-ens1370 kernel-modu=
le-snd-rawmidi"
>>> +MACHINE_EXTRA_RRECOMMENDS +=3D " kernel-modules"
>>> +MACHINE_EXTRA_RRECOMMENDS +=3D " kernel-module-snd-ens1370 kernel-mo=
dule-snd-rawmidi"
>> The consensus in the patch review meeting was that BSPs forcing *all*
>> of the kernel modules into images is actually an anti-pattern that
>> should be avoided. It should only list specific, known to be useful
> This is very confusing to users though.
>
> If I use menuconfig to enable a kernel module
>
> ```shell
> MACHINE=3Dqemux86-64 bitbake virtual/kernel -c do_menuconfig
> ```
>
> then I expect that module to be installed, but currently it's not. So
> even with a module enabled it's not being installed, which is very
> confusing and difficult for people to debug.
>
> Alistair
>
>> items, similar to how linux-firmware or python modules are packaged
>> and installed. This has unfortunately gotten into qemuriscv
>> definitions, but the correct approach would be to replace that with
>> specific module lists, e.g. by replicating autobuilder tests for that
>> target:
>>
>> https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json
>>
>> Alex
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#233015): https://lists.openembedded.org/g/openembe=
dded-core/message/233015
>> Mute This Topic: https://lists.openembedded.org/mt/118147967/7304865
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[Qi.Chen@eng.windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


