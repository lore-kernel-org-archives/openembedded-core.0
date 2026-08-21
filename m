Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A22C5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 08:55:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3507.1787302518127439550
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 01:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=fpeMBWtW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2693828977=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L8X3nC3889945
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 08:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Z60vw5wUxC85szHZstkj0S
	voPVitE21b7q3jkSFXa9U=; b=fpeMBWtWcWo78Zuvwx5PK2j57hKFSEuoR96gKR
	Dcr/SX/+UDQeVR3wCLXBeGRW5kzcFl9b9NASB+02TF+ubwmRQR99G8CXVuESSDFL
	7T6R1BTNdhYQOd1Y3+9Igx2PzJwdKgMSnmv1Lnh1ANlzFlO1GnfFb01N0d5lhVQS
	PhX7YxgqBbrFRexa/IEG3px91vri4Pj5VwEKdQOKhToQMhn1/RZCdKXRNJkK1N/j
	mIufdfP1hrKJrn8pTQDK3qH1dnG3K4a1ghFbfmYIrAklOBbwa9sZUHVRfFXRmlxY
	ExuJQIfVIQDK08jIBdu2kmYWvof0NuBB6OkjuvYWTRM6bBgQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020087.outbound.protection.outlook.com [52.101.85.87])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g6cs6rcg1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 08:55:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNMqD//G6U/3AFmdat74Z806lvuKLK4GbWuisq5lYbLsW8NjqAAygD3ACs5/VV40sdlfJKpw/qNZh4UPVbU62UuxH35qAlst5HKXoC51i5aoULvB6oBs+hRSaFWzP6ZagRgLsH6wbozvpakDAKxyHIh9KlgphezmGYkl+H7hqsvDIDwfzo5xuJGMgaBQjTVjb9TMqKBw9kcFwFgwoKsKihBYzrfAKlKPcVbDk3znGoK9GTiFuqPGAIxb48b+DXqHKmDhKPzqadBTTuhVSBBINRfyNSSdF33MDGanHiciD6gn929B+T98Mt6vwL9CcvUratix4Yt9UB6dmL1oVEG5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z60vw5wUxC85szHZstkj0SvoPVitE21b7q3jkSFXa9U=;
 b=yEYB6WxorGSp2U3RA3DjyRp/Lh0yBmMRjIRtM4FjZd7ILUU9+j8NaOcF7cUc5G0PhKCcxUpYv/ZYQLaX6tw/lAqGigEkGWfX3pFqEyFjFRBodqlJXgNfeyxWz5ABoraEAzBXVCXZ6Fr8ChJ7x8qxzSmv0qXAC9+xCeckNSwe5b0NY0MPJRo+qXc719/GDvApzzED24Ouqb3yP002SV6rQNNIyIyE1xQ4b/GMvHuAU6iiMAB+inUnDoddarUxBi4DNbIhORw1PiuXqlsNGfUL6gkd9F7QBR1fkRFjNJeL9NWpYVn1Nu38d7/p77xQTpDoDXDB7sbxnE2Y6/RIgUxipA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4536.namprd11.prod.outlook.com (2603:10b6:208:26a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 08:55:13 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0292.024; Fri, 21 Aug 2026
 08:55:12 +0000
Content-Type: multipart/alternative;
 boundary="------------8lJ24tKl20v8qx1ieqNHIds0"
Message-ID: <ff0f740c-91b2-4ab1-93ff-223c3546c2b9@windriver.com>
Date: Fri, 21 Aug 2026 14:25:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/3] rust-cross-canadian: install
 target-specific env scripts and fix rustlib lookup
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260807093116.3680514-1-Harish.Sadineni@windriver.com>
 <d489c96976fb770d0499ef325cedf7e085dcc775.camel@linuxfoundation.org>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <d489c96976fb770d0499ef325cedf7e085dcc775.camel@linuxfoundation.org>
X-ClientProxiedBy: MA5P287CA0320.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21a::7) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4536:EE_
X-MS-Office365-Filtering-Correlation-Id: f9dc19fc-ff3a-4038-7d9f-08deff61e8f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|56012099006|4143699003|8096899003|3023799007|6133799003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	wsiDHyYwY7DMIDf8oJcvImVCIzIu7ItmG5m0bC6D3Eqd3/80jty0ENJqvaVNqph0boTpb/cOkamvceNLdG5Nnx2bfYK4YKA+XLMxG7byK9/3+/C8OGcQgkqbmjtRbp+1GQb72i4QSdhlr1YdQdYS3kSVXQ9BYh6uSVFRtzJ6xDdi+jZ1XK1oigeG8Ugnqzmhea8xdy6GPcG9H92R0FbnzlObwJ5QXs1YmgfTMeUNSd550eQIcC2VyzygAEHfuuF8UMvyZxdvsOytrhXnaSu8rPWPkKyhMwtM0P6Bk4cnJrB8Iz6Cqr8oTFMDd0UYxPG9URA3VWLGx2//19krwjh+xaL05dhza/NOWCnKeATpnG+LwUYBL7IdPbCvtI+D6TpZZqa84DnbOuMnZWYfswxFwQKL+mbmiwjOslye6RtIzLi5slsooZ9XzyY2Jz4QN1cxfkm25vr1G7beZboZ6mgJ8TOO/SDEAPLIlBeHkGnzHKsFvinJ9EZlIxFukYoI8LWQFbrv+RHQ/1FmxljC/Yd6h+rA6t1+7dmCmn64b6b/a1vh4MMAcOxJJPR1xQhLBapmuutL7QhxQg4KCDqRGDpTCkiVLwiB3zf3dus9oZMaCkLmaQugqNXKhtF+Jv/82thsh8+VrlVaeu9HjrI5daHMhQqo7EdNcT2fb3idxoa2fl4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(4143699003)(8096899003)(3023799007)(6133799003)(10067099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cDE1UWE2ZlJJMThGMmQvaTZXMGloMzRHc0JwUXJSMGpCSEg0Sk4zSjQ2a1Bv?=
 =?utf-8?B?VGk0YXEySkN5Nm1EVnZwUkprNVEwRHFOUFExbCttUkFPNWdmYm9mQmdROXVE?=
 =?utf-8?B?UWIwbjRLZVhpSlc2TTlaRldGVWc3YUtTTjlVMlRJYWNscGRqMWJiL1lqQXFl?=
 =?utf-8?B?OTdSNzNnNHduMXlSdmgxK21idHMwWmt0R2VXaEVBcDNSb2ZDaDF6TlVBb0Fh?=
 =?utf-8?B?SEVyZDladms1ZnZrQXFBeUR1Vm9PQzV3QlhyTXNvTHcwN2JLK1VZL1ZWSFBo?=
 =?utf-8?B?bXF3YUwrM1hub2o5TWJ3QWdudWlUNDZUREpEZVpXYU1hVERaV1pRNXBqTWl1?=
 =?utf-8?B?SXhKb24wbko1clRyTW52NWhLa0hxUjNGTy9uMVBMTDVGbWJPUXVPMlo3TXBX?=
 =?utf-8?B?RGdpeWhFbm9oMWRXN1gwMDBrYzNLcEpBaDNsOHhTc0h0S0gwKzRSNnBhdkIy?=
 =?utf-8?B?Q2sxVVpFSytybzlUdjhDNW1CK0xWM0dTY1MyTktYR3pSRnNPcXR0Z3UxdjNw?=
 =?utf-8?B?UlVVcGdZbElFc1N4U2ZYRSt5bnhCV09MTktEb3g3Ly9iOHM2d3NISHg2YlpH?=
 =?utf-8?B?ZkYweSs4dXNmZEFPMFFSUWxwaU4xaTMydnd5K0RCUVVjNWh3djNNQnE5ekNF?=
 =?utf-8?B?aE0wOWRNam5ueTcxaEw1cWw3b3FVbmpyZ3hOaERlcnZKSG5nQjEwcUlCUU03?=
 =?utf-8?B?WmN4TkhTemFLVSs5OC8zWk5jYXdjQmtGWllrYUVIY3B3eDUyL1kwZzZTdHlD?=
 =?utf-8?B?T2FQTjMyVjlpU1NyRmdVRGN2UmV4R0xpdFNGTFhXM1FBY1ZqbE0rcUh3U1Nj?=
 =?utf-8?B?bVRVTFQwVHdvSHJOSE5FV0Y1ajBJenorNkNad2VBNlh4T1JZVklCN2FWelo3?=
 =?utf-8?B?aVlRQjlWTWVVQiszOUpzeElEaHdERkQ2aFZoMktSWFRSWDYreDNVK3dNTzhC?=
 =?utf-8?B?Q2tGazROMHNBN3BoOHlILzBiSG8yZFNMUHR4YUp2Z1o2MkpqS3FHUGZhMEs2?=
 =?utf-8?B?ZHdkaHc5ZmRBdkJKWk13NmdydU9aOXo0cUJKOWg1bnRmY2xNSzNmOWNzUmFZ?=
 =?utf-8?B?a3VPVFJ0czcyYnlqTENUdUs0SFgxOU0ycG9pZ1owcmNYaStCNEp4Zk9OZnU2?=
 =?utf-8?B?TlJjd1JRb0VUcHgvclVpZjNkT2NETzhVb2NWOVVyTmtod3F4d1RrNFlWc25w?=
 =?utf-8?B?eFhlS283VmpLdlFjaGtCRVcyZ2J4Y24xb3RUczFrTmlQSUg3VkUzR1Q1TEFH?=
 =?utf-8?B?bGd6TGc5OFFVMGRGUCtNWWxrRk1qcXFKOTQ5WnMwOWhxbTlQTXNPbDQ2TXZJ?=
 =?utf-8?B?K2V0eG1rcGJva1EvMmo4cEpFTVhkdUg4N0FzZktDKzYyajJiQUNPZ0tKSFVl?=
 =?utf-8?B?Sm54N3hXQWh1OXFycklFYVQ3Y0x4eEZkc0IzdWdGNS9GSTRRY3RROW9qL1c5?=
 =?utf-8?B?SXBhSEhlRHRnOGR1TDdZZnNueVlZV0F0ZlJadnNQQjIvU2VxR1hNc2VGNlQ0?=
 =?utf-8?B?SUg5WFdTSElva2JrS1VaY2FoRlFuTVlSUDA0RTJYRjZwRGt6OEdSZENaMlhJ?=
 =?utf-8?B?NjQ2Y2RxakRaN29zN05jcDZ6eDJWcFI1anB4NVI2V0t5QjZia0J1T1duNjR6?=
 =?utf-8?B?bjI4MVdMTTJKVUZOSW42bzc2WHJnYmpmSjNVVEE1WWYrWmRLdE9IcGVRN2g5?=
 =?utf-8?B?Q1c0cUt1djJhaXFiaGl2dlJNL3ByeHJqeCtaSkVqU3g4VTJNbDNMM2doSXVw?=
 =?utf-8?B?YkRDU0Fna2JqN05zamo2SE9TbVRnajh5N0JqWmxFLzFMNG5iZUp1TXBXZ0dy?=
 =?utf-8?B?dzBXaFpRMWMwME1zMndrZFdiR25CekpWdXZOc3ZINUltZlVmbko5SzR6dCtS?=
 =?utf-8?B?TGVsS0NONnAyaUVsVlRyejd0Y3FhZnQ5L1hRWDQ0UFhTT2dWVktkaHRTR29L?=
 =?utf-8?B?NjNzUDZ1Nm55TjNIdngzQjEreWlwclQ4SEw3VDBLTndKKzJ5MDFsMmlyS1ZS?=
 =?utf-8?B?U2tUMitUUUJOWUxkMzB0Qk5ZM3o0Y3JOYW50MTRXNldMTVJ0U0hPYWE1bE9E?=
 =?utf-8?B?Y3U5OHJ6aWs2bFFHVGJsNXB4WnlaV3doY21ZQUZiYXBqY3BjaGtMbVc3NUxF?=
 =?utf-8?B?bWRTOXhwdlc1RlRuNHRZVStXQlZ0b2xyRndjT0taSjNBa010OC9EcnlpbkFS?=
 =?utf-8?B?d05uSk9mL0FvRHZEVmVwdllodytCOURwbkpFWHJCbm5SVHVMcXRLdkN1VEVy?=
 =?utf-8?B?d3lVaExHcndDN0RFQXducHRaQkhPdXRQakdzV0NwMTJMVG1xQVJGK0I4UHAy?=
 =?utf-8?B?VmNLRk1FQmFYVTJZRVBMQzczY1NMazN3c2hQUlBHM3VPQ2ExcmVuVEo0OFNB?=
 =?utf-8?Q?nyNojrxjJzCO2hxM=3D?=
X-Exchange-RoutingPolicyChecked: 
	XvjtLlndzavTYpTsn+otVsxQmOmUaN29V+z3QJqug1ggaEffoep7cySJ8MID8boLb9ta6t4DJ1qpwthURzhVe5Wprb79VIzpu+lIP8tE7ZVYbHwilLiRBfLyPw6H3ulKFjDeaI9cA/dakUVUnNhh47N5ThcmMHcgMzVBFQPSg8IHPg+rW8/XpUmWDsVgSyg77NuAL9pDsCb8Br4+6GKWJLwNmbgNKFQGb0HlKrFHZ1k+f8EynahGqR9VM/sgrg6G3kLpZu5+ob2viwITrV8OniiPPzOsAQ4UcuF+q13C1U8X7bMR9DGZIccT6wr/Epcoi3CDVxN2mivvWL0w1exR6w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9dc19fc-ff3a-4038-7d9f-08deff61e8f3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 08:55:12.2105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tjb6Ld5a4SaVosBv4rHEa1Z/PWPfTdeChBlUNYVrySk2UHolIof7I92oMB4dx5x6aF2RV9/RKvbDEIhNQ+8LS7d3evzx5GDx1zcgE71ISTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4536
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA2NCBTYWx0ZWRfX8aUW/v1pdA1H
 dacaYj007aNgjm8yWqXNSj3EzbtWoGDv0NGcy+q7eVqGbIKTvtYhrvai/s4//+AbSfAJoFnlS0w
 g/GS1xLy6im0OErAybn4irmYGbs9Yd55Q9hBvHYW6lHU5fP6g8BD27mFc1qXgETOeR29Q3YOh3y
 J3R/dg35RngGUqQ6EHzn7oLhs4u+Sp1xpvpwm97sm/S0uV0FEyy/d8sFPKipWNVFJ7Yp2rUb2fD
 a0pt2RcRdgi/LpSRevoL7NXgKqrKygKiUQSBHGkTwlgbbxzdLz+GxyavzVUEvJBGbn5plb/F7M0
 UaeFlCObPJov+Y8vuwNbG7tR10r97WejrVTGVEn+Y1GSbd98e8i/Fr7XINASaI/rg2fZ6lj9yXe
 y2yWnURFI+1qOJjN4ZyDIrvBK5+Ys3ky3o9fXIWBH5qQ9vmTESr4V28Uo1HLzwpeuoSjIJCmTdM
 Sekk9oyaB4OYiSMp3uQ==
X-Authority-Analysis: v=2.4 cv=feadDUQF c=1 sm=1 tr=0 ts=6a881274 cx=c_pps
 a=R61xy7Sxgg6fOHg0EL+J9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=O-NCMQRZ-rbxHSSQ9F0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ag1SF4gXAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9 a=EA6t8JqaGvPn9Kos:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA2NCBTYWx0ZWRfXzyi7bgAKaYOh
 2cDa3R8Hdj3RLyxjVK7L+MnOUtVaS6Az0SyrR1E1aABWiLqFAb668hEV06tAmoRWzFS1yv7mK4K
 Mo7KoOiiJRYZ2WFHXuU2VqoldYxvWbnKpEmp21AjeTYapNCt/RoF
X-Proofpoint-GUID: uKNe2dLxic-eEsK3E_ZtUH0-apXXHwtR
X-Proofpoint-ORIG-GUID: jVw-ASMwi88xmeJq4rJmbDjx26M5bviX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_02,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 08:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243903

--------------8lJ24tKl20v8qx1ieqNHIds0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 67L8X3nC3889945


On 20-08-2026 02:24 pm, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 2026-08-07 at 02:31 -0700, Sadineni, Harish via lists.openembed=
ded.org wrote:
>> From: Harish Sadineni<Harish.Sadineni@windriver.com>
>>
>> YOCTO [#15061]
>>
>> Fixes 32-bit Cargo build failures when using multilib-enabled SDKs.
>>
>> Store the generated environment setup script in a target-specific
>> subdirectory so that sourcing the SDK environment always loads the
>> matching script for the selected target, avoiding accidental reuse of
>> the 64-bit configuration when building for a 32-bit target.
>>
>> Also update `CARGO_TARGET_<TRIPLE>_RUSTFLAGS` to add an explicit
>> `-L` search path to the target `rustlib` directory inside the sysroot.
>> This ensures Cargo can locate the correct target-specific Rust librari=
es
>> during cross-compilation with the cross-canadian toolchain.
>>
>> Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
>> ---
>>   meta/recipes-devtools/rust/rust-cross-canadian.inc | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta=
/recipes-devtools/rust/rust-cross-canadian.inc
>> index f083bcda82..bdc63e221f 100644
>> --- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
>> +++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
>> @@ -51,15 +51,17 @@ do_install () {
>>       chmod +x "$outfile"
>>       create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld-wrapper" "CC"
>>
>> -    ENV_SETUP_DIR=3D${D}${base_prefix}/environment-setup.d
>> -    mkdir "${ENV_SETUP_DIR}"
>> +    ENV_SETUP_DIR=3D${D}${base_prefix}/environment-setup.d/${TARGET_S=
YS}
>> +    mkdir -p "${ENV_SETUP_DIR}"
>>       RUST_ENV_SETUP_SH=3D"${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh=
"
>>
>>       RUST_TARGET_TRIPLE=3D`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '=
[:upper:]' | sed 's/-/_/g'`
>>
>>       cat <<- EOF > "${RUST_ENV_SETUP_SH}"
>> -     export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS=3D"--sysroot=
=3D\$OECORE_TARGET_SYSROOT/usr -C link-arg=3D--sysroot=3D\$OECORE_TARGET_=
SYSROOT"
>> -     export CARGO_BUILD_TARGET=3D"${RUST_TARGET_SYS}"
>> +     export RUST_TARGET_SYS_VALUE=3D"${RUST_TARGET_SYS}"
>> +     LIB_PATH=3D"\$OECORE_TARGET_SYSROOT/usr/${baselib}/rustlib/${RUS=
T_TARGET_SYS}/lib"
>> +     export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS=3D"--sysroot=
=3D\$OECORE_TARGET_SYSROOT/usr -C link-arg=3D--sysroot=3D\$OECORE_TARGET_=
SYSROOT -L \$LIB_PATH"
>> +        export CARGO_BUILD_TARGET=3D"${RUST_TARGET_SYS}"
>>        export RUST_TARGET_PATH=3D"\$OECORE_NATIVE_SYSROOT/usr/lib/${TA=
RGET_SYS}/rustlib"
>>        EOF
> I'm a bit confused here. The script in question already has
> ${RUST_TARGET_SYS} in its name, so it is already target specific. Why
> do we need to move it to a target specific directory?
Hi Richard,

Even though the script filename includes ${RUST_TARGET_SYS}, for=20
multilib SDKs both the 32-bit and 64-bit scripts end up in the same=20
environment-setup =C2=A0directory.

The SDK's environment-sourcing logic sources every '*.sh' file in that=20
directory, so both scripts get sourced regardless of which target you're=20
building for. Since 'CARGO_TARGET_<TRIPLE>_RUSTFLAGS' and=20
'CARGO_BUILD_TARGET' are set unconditionally in each script, whichever=20
one is sourced /last/ wins and that can silently override the 32-bit=20
settings with the 64-bit ones (or vice versa). That's what causes the=20
32-bit Cargo build to fail.

Putting each script in a target-specific subdirectory=20
(environment-setup.d/${TARGET_SYS}/) ensures only the script matching=20
the selected target gets sourced, so the two configurations no longer=20
clobber each other.

Thanks,
Harish

>
> Cheers,
>
> Richard
>
--------------8lJ24tKl20v8qx1ieqNHIds0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 20-08-2026 02:24 pm, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:d489c96976fb770d0499ef325cedf7e085dcc775.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Fri, 2026-08-07 at 02:31 -0700, Sadineni, Harish via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>

YOCTO [#15061]

Fixes 32-bit Cargo build failures when using multilib-enabled SDKs.

Store the generated environment setup script in a target-specific
subdirectory so that sourcing the SDK environment always loads the
matching script for the selected target, avoiding accidental reuse of
the 64-bit configuration when building for a 32-bit target.

Also update `CARGO_TARGET_&lt;TRIPLE&gt;_RUSTFLAGS` to add an explicit
`-L` search path to the target `rustlib` directory inside the sysroot.
This ensures Cargo can locate the correct target-specific Rust libraries
during cross-compilation with the cross-canadian toolchain.

Signed-off-by: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index f083bcda82..bdc63e221f 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -51,15 +51,17 @@ do_install () {
     chmod +x &quot;$outfile&quot;
     create_sdk_wrapper &quot;${SYS_BINDIR}/target-rust-ccld-wrapper&quot; &quot;CC&quot;

-    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
-    mkdir &quot;${ENV_SETUP_DIR}&quot;
+    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d/${TARGET_SYS}
+    mkdir -p &quot;${ENV_SETUP_DIR}&quot;
     RUST_ENV_SETUP_SH=&quot;${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh&quot;

     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`

     cat &lt;&lt;- EOF &gt; &quot;${RUST_ENV_SETUP_SH}&quot;
-     export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS=&quot;--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT&quot;
-     export CARGO_BUILD_TARGET=&quot;${RUST_TARGET_SYS}&quot;
+     export RUST_TARGET_SYS_VALUE=&quot;${RUST_TARGET_SYS}&quot;
+     LIB_PATH=&quot;\$OECORE_TARGET_SYSROOT/usr/${baselib}/rustlib/${RUST_TARGET_SYS}/lib&quot;
+     export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS=&quot;--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT -L \$LIB_PATH&quot;
+        export CARGO_BUILD_TARGET=&quot;${RUST_TARGET_SYS}&quot;
      export RUST_TARGET_PATH=&quot;\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib&quot;
      EOF
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I'm a bit confused here. The script in question already has
${RUST_TARGET_SYS} in its name, so it is already target specific. Why
do we need to move it to a target specific directory?</pre>
    </blockquote>
    Hi Richard,<br>
    <br>
    <span data-teams="true">
      <p>Even though the script filename includes ${RUST_TARGET_SYS},
        for multilib SDKs both the 32-bit and 64-bit scripts end up in
        the same environment-setup &nbsp;directory.</p>
      <p>The SDK's environment-sourcing logic sources every '*.sh' file
        in that directory, so both scripts get sourced regardless of
        which target you're building for. Since
        'CARGO_TARGET_&lt;TRIPLE&gt;_RUSTFLAGS' and 'CARGO_BUILD_TARGET'
        are set unconditionally in each script, whichever one is sourced
        <i>last</i> wins and that can silently override the 32-bit
        settings with the 64-bit ones (or vice versa). That's what
        causes the 32-bit Cargo build to fail.</p>
      <p>Putting each script in a target-specific subdirectory
        (environment-setup.d/${TARGET_SYS}/) ensures only the script
        matching the selected target gets sourced, so the two
        configurations no longer clobber each other.<br>
        <br>
        Thanks,<br>
        Harish</p>
    </span>
    <blockquote type="cite" cite="mid:d489c96976fb770d0499ef325cedf7e085dcc775.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">

Cheers,

Richard

</pre>
    </blockquote>
  </body>
</html>

--------------8lJ24tKl20v8qx1ieqNHIds0--

