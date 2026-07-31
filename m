Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79458C55167
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 01:44:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2206.1785462264271067804
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 18:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=rxN2/OFt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2672878dcf=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V18TGK932745
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 01:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=T3VTfWf9BBV9MRCqbT9Zkf
	y0IfDKUPrlkumVQBEnm1Y=; b=rxN2/OFtOedTgGCfKf1NKUpYYjsjbgQgteaO+W
	GVmZbQq3JFJIwzzmpUqoGu8lwqyBUH2u6wJ5uNE8Vp585f+MSjp9rijqrxAe6K93
	LwbNA4UXhUR99aX9Y0NKU9kAdX4Lc996GJjd8tXBy5xNWc3bCbUEyKQhKwQxm6M3
	fX4G1hnzB3M3p/rFDKKtYE3Ml/vEUGgFGcQRuNffiNQqBymh3SlasgWjVNRTjTMY
	CTDvnwf4pTFjbTkl5VomTPYnnWG1Jdf4wndTgjhZkXRV/aVPgIW57fxZzBeh8ztQ
	z9nOTnl5zVDUocgKNTbJojK48WfPt8l8xbkycRmLUJI5I7lA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4frhsh00w8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 01:44:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vga/3gdDjH58n+NpcBaVVba7GW9k8z8p3FkDIa5g6G138bNJxSxbDL+sQDXUVkWJVS9+neSSjPnP+ZS/bOnqnl27ndJBg6C6swKx7aR8NY8c9tbPIzknAyetuxaVnojtBOsjluIlJ8BCCxzWksK/nAC3ngUNJS9mG3xcZcQZRRjsd5gMCe1lWvIL4dHQjUWiVcGE0CHx1sHqmueMVqNt3nVRQFsag0+7TW52gkEx0Vx2ynvy9pVPk8V63HFWJ29uf0fM4GhE/YAFEKqK5HUV6U/SCbNaGPU/0OuX0MkRvdEMeGxouWCUR53BwnXo7vNHYYSsr+k100KjYrphqiOm/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3VTfWf9BBV9MRCqbT9Zkfy0IfDKUPrlkumVQBEnm1Y=;
 b=Q5rMbLL97qj6gtpjDTK+wbn37dTu6289veipbpwAiPA/SOlq++ttBFp9Y+942H2pqNCHEFwlgbzKMSsCXrzIcX/aiXmY2X6xmHo/MWJLRHEtN0JIRV3CK8AqRpJOyv/r4Jg/dq6+LAa21Ib7ejYeJ3JJSFluM9Gqf3zVnXaDSfhitPnCFap/P0ASUzubsYQ3QmlaFGFU41hE+SBDuJppHVrCHGMGezt1J9I9a9rCs0mLP1eDJLd0UpPBYOpWdUIMU6nKXebrMKok3Vx1nQssIfwBPUq2UhhMRi9LoRTWygpXtgRp4sruOqRiBldl9HwM/+xbsxKtFElvMKvhI6NtVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS0PR11MB8667.namprd11.prod.outlook.com (2603:10b6:8:1b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 01:44:16 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 01:44:16 +0000
Content-Type: multipart/alternative;
 boundary="------------VpB85FRX4vKGsNJwM2BbcxHZ"
Message-ID: <7df63fc5-c134-430d-bc49-1ec83b0e517a@windriver.com>
Date: Thu, 30 Jul 2026 21:44:14 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v11 0/9] rpm: 4.20.1 -> 6.0.2
To: "Gavini, Sumanth" <sumanth.gavini@windriver.com>,
        "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Cc: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
        "mattware@cisco.com" <mattware@cisco.com>,
        "esparlin@cisco.com" <esparlin@cisco.com>,
        "peter.marko@siemens.com" <peter.marko@siemens.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260729235141.1067679-1-sumanth.gavini@windriver.com>
 <DKC0OQ8NEVPS.2A0FULELCCRJH@bootlin.com>
 <40d27de1-afee-4c92-abef-b2d09ab7a036@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <40d27de1-afee-4c92-abef-b2d09ab7a036@windriver.com>
X-ClientProxiedBy: YT4PR01CA0481.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::23) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS0PR11MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: 6640d86f-f20d-4f07-1e09-08deeea53b43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|4022899009|1800799024|13003099007|6133799003|56012099006|10067099003|4143699003|5023799004|11063799006|8096899003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	o1hgv/Obrqo6HabKPW+MM2j2ueX4EUM3iS4zT1ezBABzdAgXhen7T80iZHhrG8TAQHt3JzLaATTjKVDuL9b4fv3d7Z2GzJguSmP6/A2THmUT8QQJgKCussoux3q+zCAGLi5toxNJVXxs7czyMu/XGrEFh1KeH/sm9mOgzs24OfHAE4huEuhchkylG8jEzmnejl1iy6RZA5D1Jkwz8qrQkTH3+JksohhzYKdFylnv5/dFVOhXCjpwBk5IEYkrVnjj3gJp+Nw+jIEeeE1aQJjoogBPK45lxbCUxBro8EntyHdCGp8iVM0yS9JV2oMRZCSeiMtXZgA9OMTsR9GjiKBu1nOkc7+OhqE1Bc2P5FrWqfxky2FCVUiMMtFdAcjlLaY/q4Zwipzev0DYnns8KaqXBAS77xDvcHfKFn6MC3nelBPJXzcc+XxIOqzMB5ZhE4dGUokGh92+EOB9ePMN8gBliULzLW1DmsXL/IWBqHuLCrHXV6HruUXmx0cuAp//ls3q8g7BRu4d9etMc2Dazy62cgKXMpRDPK4WuY1jUfE6m6Z4U456y0UYgzKAF8xlI2XmdvG0c+C2+5eHO+0eMJ+c50FEYj46XdSVHmi6GpLhWtE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(4022899009)(1800799024)(13003099007)(6133799003)(56012099006)(10067099003)(4143699003)(5023799004)(11063799006)(8096899003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?azd2cHFGa2lMdTFoVU8zZXBaNlFFV0RiZFR2andyOGlyRStyQ3NXaXhCdUwv?=
 =?utf-8?B?bzZ5Y3A2K1A0aUlSeE1QUzFTRm9iSDJjUlJNdXl3K1FhTXpNMEx0TXVOOVhP?=
 =?utf-8?B?UEhlNFIvanhsdFk0a3Jldzhpc0pjY2JTUVNCUnNXL09HTXUyTWdQMFVPNmU4?=
 =?utf-8?B?RENEN3oyMU1oamhld21nbS9HUHJPektPeWFXWEJwcVIydHdiY2NURmVEVXdk?=
 =?utf-8?B?L3c1SHVzdEZPUW0yT25sYWRwL3g5MlFka0VEdmlPVnZaUUVsY2VjU0N2RkNn?=
 =?utf-8?B?NUJtSFNERzA3RVU3cHU0T0JWWjJTNFIwcStaQ2ZJRC9FYWJJWU9Tb2VBSW5q?=
 =?utf-8?B?VHloTFVpemh4ZjBNekh1YWV6QzV6ampnZm9MOGhvMUxmV1FxQWk2cXRsOXZ4?=
 =?utf-8?B?WnEzYW1SdkRQVFNwRm9HWm5LTWl3ZkVIVGRLUVFWc2dPbndJbWhUVmwrcTRZ?=
 =?utf-8?B?cjd1a1dneEtseEVFcWJpd2lMRXJ3clYwRGlkQzMxcGtTd3hreTFoUGhzemdK?=
 =?utf-8?B?YmNuUDJiMjVOR29SVnpPd3dqYnBnTnU3ZmlNMGN3bE1xeVdHOVdicnhQQVJR?=
 =?utf-8?B?U05qRXIvMlpVTThDYjBLR3BpTkFHNEpaczhyS2F0RDhaNGVMam9QOUxiNHR5?=
 =?utf-8?B?TkVMaVcxQ2RzcVJFcnhVbERmaFBENm1KbVdWSFBtRWY0dTBNKys1UklRVDAv?=
 =?utf-8?B?WjJjQ3BrdUw1dXNFbHRqaXBtQVJnOUhBRjVybUZGSWZDMEZGNTRmSW5yeEdR?=
 =?utf-8?B?K3RkTzR6cGlLYTNxMWJ5bU15TTdUSTJWV1Nmc3V0MGpwSHRSQUE5VEhwbFJD?=
 =?utf-8?B?L0lPa25zL0dWSmVWM2tIWFpSY1FuVXJOQ1VacHZRSkZsNTZmb21sODUxUEQv?=
 =?utf-8?B?MUg0STRmb0JqOVV4SS9TdTllZ2hMSWh2REhYdTRCeFBFbzhidG1ITEpCdHVv?=
 =?utf-8?B?QnVuMlJaN3h6elU3RGhXTWgxc1FObGFqdEY4QnhMcDVGYTJLdVpKWU5kMUwx?=
 =?utf-8?B?ZjlSVDJtbXpVWFJPSndXZUR2YUJPaCtFTzVqWjdYSFc1engxK2QvckJrdTlM?=
 =?utf-8?B?ZjFTR1pWV2xqL3gzem1WaHc2d1JvUHdKSk10TVNqcHd5NWUyOHFzNU9XTDdp?=
 =?utf-8?B?S20xN1JoZHV0WmZBbG1hMDNZbG91d1Z3cm0vNS9BZXRWZ0pSb3VySUw5dzZM?=
 =?utf-8?B?UWg3elhIbSs4bzUyODJBck9Tbi9tN09oeXN1YnpiZUtxQ1o2R2RBNkRsUmh0?=
 =?utf-8?B?M21kOG1UaEE5L29mbGNqZTFVcnhkdnZxOEFqWU9XdHZwK2h4bkRObk1pVG1O?=
 =?utf-8?B?TVd2V0xHSnowRVlOVVhXay9uZE92cTZCazU1UWJJUzZrejhMTzBjN2M0UHpR?=
 =?utf-8?B?cVBuVFpKeHVDYTErWEdjbkpkYVNZajZrRGRDTmNBT1Y3dC9BNVBJWDlIWFdO?=
 =?utf-8?B?Q1RiQVVUNFB0MFVsbUV0YkVnMklRRXlZM3F4VEcvYmlESkt6clNrNmJHSy9L?=
 =?utf-8?B?ODZVQ3VmZVk4WVI0N21UOUxIVDA1NEVjVFV6dU4ySWhxVFI4eXFwaEVEK2RF?=
 =?utf-8?B?K2IxR1hMcERzZi9JTk9PY0thVEYra0JWTGVWTFEyK0dRSk0wZFZNVGNYUWNB?=
 =?utf-8?B?aXNSeVZrYlVDTmZoZ3F6UEtXMEVWMWR2NXpFMm8zNnRpZG5mZFFnV1QybVZU?=
 =?utf-8?B?bTZBRHFhMWNMaEs3Wk1XcGxmZ1pzbDMzeWRhT3ZFaUxOSVZxeVA0UWo5a2I2?=
 =?utf-8?B?QnA5dXdhWTRGWURXKzRUZ2VDeWZPeUk2eUQxL3laM1J3U2g0TXVCR1U0eU1B?=
 =?utf-8?B?N3hWUWpzRU0yZlFLQXdURW05VEFLbWY2NkxDUW12ZUpaQ250ZXcrZjlyZ3d1?=
 =?utf-8?B?SG1rOWE2LzhpbWM3VXg1SVRibDcrWWtWNFJVTUdsdExtbVo4ZTlZQng2VVM2?=
 =?utf-8?B?bmwxZG1hb2ZZcTZwRzZpUjFHNFNZMklvSVBtUytGUFZSaWxaQlBLZnFtWmRK?=
 =?utf-8?B?bnEzTEhOa1dpSTYyU1VTQytGQjVEbmZ6TnZMUUpUQzFxYWYwNWxHb0d6OEt6?=
 =?utf-8?B?RmFCNTNpM2NLaVcvU2xOTm50Ym1pR2p2bzNPL0VJd2lXVTM4dy9hQVIvLy9n?=
 =?utf-8?B?OFRvaklpMHZwYXZlKzVPM2NxOFZHU2REdTFlTUpwMW5DZW9GbUdwTmpXK1VB?=
 =?utf-8?B?K3k2VUlRZjhyelZLaEdIVXkvckJKeUY2Y01RQmpoVSs5REpvTjk2N2ZJK2Vu?=
 =?utf-8?B?dktLaFdxdUNlN2V5SzBYL0RWVHozalIxcDNzQnZhOEpkUnFycDNjSjY5cjJH?=
 =?utf-8?B?c25PT2tFREU2b2FSY1AyZzdWTVBiazdOcTU5czJUclcrcjEwQnQ1NFBpcnpI?=
 =?utf-8?Q?dFdaUVUka6yGTfjs=3D?=
X-Exchange-RoutingPolicyChecked: 
	j3uL6LCtHsbZTCwrUpy+eHk2QuT8o0TT3tOvw46pMj3IkNWJ1bhZ3ItOu9nRkvWcHB1f3uHgsLWGWJqW5AYsxJgKiQvZpSzX3PT9cPHSkF3xzYBfQYCp6aDowdsgmrVnRRdBnIJO8+6XeeeLwJqINHRhAY9jJaH4Gyp9mn2BXq2Q7HUwFLRM5q4SQrt2DX4T9CQR6HG4qWn5CZr0wFJJyCGgRHBhEXW0JdtDn6OAyaedCjF8MEq0I/aWMTDvZVWQdq6OHEpT0XX0MYoh2U2gH38pUd/hcg9hw+WvzAVeqnE9y4H2By2sxHytIr+HiBdR/MOfnA2nEvF3D49Meon60Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6640d86f-f20d-4f07-1e09-08deeea53b43
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 01:44:16.6060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwYaf1yr3EcrIH0Qa+KGbC3Qv5C4RzgcLu3KEz3uO3Q68lP8aVsHvSEnpMbQ0fHLQijAXb9pRs198F6nmNZH5GPTAhAtJ/LaMBWpdMtw+HA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8667
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: CC6AEYvL1QmuNUxw3aIddnffo3b9zw0U
X-Proofpoint-ORIG-GUID: W6WwM9aon982a9M0kY4rL415PbdybMS_
X-Authority-Analysis: v=2.4 cv=Fvg1OWrq c=1 sm=1 tr=0 ts=6a6bfdf6 cx=c_pps
 a=8P36fUQdMjs6HQlwNDQNwg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=wYDQrIcDh-ke9ta52s8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=QsCpQYXtCOPNkC9Na1gA:9 a=DitlCJ1aAMeKg64X:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAwOCBTYWx0ZWRfX5fm1rHWdWrNJ
 5j75CTTmXqZOXyMEIErBUbs28B3XEyP2RPLC7yKH/S+SSvsKiBlRWiqxgb/6H9m/Bs9MoJbag5K
 YJ5bU6koAiSk227qVrRCEbOZ33WHxe3FKLJp5lZR6+XxCSy+PRdjdHTfZvvUDI7U0kka08/nzWU
 YXTdw9AzYK0C6bSSqOMTA3GjKXZ7QNPU9d4W52kOzDVkXvwgcer0fvpwwtcN10MwXL3qSwQJh9W
 cKhrIAHEigdl8Zf6AQG2eIxxn5klW+HZl0obsvoDJLrD0icVebr+8QblY5l0TDV1twf9KNzKO99
 zGdoNP99t2cyShflBPHdxE4NqPsFkBhEzIU/oArpDkrQ+qxKLfzj7FZdRzWFJNUmRdXCDRmrV9b
 xwGWoQOrKQaR+UgvUx6XrmcXDO3laSi//QLkJ1IMzz1sNssvQB7xFB2SJvr/zWmEKkAXawxyhKS
 hhrFvzY8GX77+cAUtjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAwOCBTYWx0ZWRfX/eO7yDWo9KTw
 r2XOMbkk2VcKgmrcVIA+cznKBGqWgn3WABjP92iPvXiYWetIOyokuDvulOl1gNXuYVAgBz3uKZN
 YotNz5B5Sem/Lua+ANaNr8jTgIKp2ris+UeMijgYX+BWxq+8rJPV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 01:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242388

--------------VpB85FRX4vKGsNJwM2BbcxHZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 66V18TGK932745

On 2026-07-30 14:13, Gavini, Sumanth wrote:
> On 7/30/2026 10:39 AM, Mathieu Dubois-Briand via lists.openembedded.org
> wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.
>>
>> On Thu Jul 30, 2026 at 1:51 AM CEST, Sumanth Gavini wrote:
>>> * V11:
>>>    - Added 0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.=
patch
>>>      To fix "bitbake core-image-minimal-dev" Could not invoke dnf. Co=
mmand...
>>>      pkgconfigdeps.sh unconditionally emits /usr/bin/pkg-config as a =
hard
>>>      Requires for packages shipping .pc files. In OE/Yocto cross-comp=
ilation,
>>>      pkg-config is a host-only build tool not needed on the target ro=
otfs,
>>>      causing failures with -dev packages.
>>>
>>> * v10:
>>>     - The ARCHIVE_FILTER_RPM macro was commented out in a previous
>>>       libarchive change, causing do_compile_ptest_base to fail with:
>>>       error: 'ARCHIVE_FILTER_RPM' undeclared
>>>       Restore the macro definition. The ptest now compiles and passes
>>>       successfully.
>>>
>>> * V9:
>>>     - Updated SRCREV to the 6.0.2 tag.
>>>     - Incorporated all V8 changes and updated them as needed for 6.0.=
2.
>>>     - Dropped
>>>       0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch
>>>       from V8, as it is no longer needed. After filtering out the
>>>       /usr/bin/pkg-config file dependency, "bitbake core-image-sato -=
c
>>>       populate_sdk" completes successfully without the patch.
>>>     - Fixed the filtering of the /usr/bin/pkg-config file dependency.
>>>       pkg-config is a build-time tool, not a runtime dependency. Filt=
ered
>>>       the /usr/bin/pkg-config dependency automatically detected by
>>>       pkgconfig.attr for packages containing .pc files, preventing
>>>       unnecessary hard runtime dependencies in -dev packages.
>>>     - Removed v8 libarchive-related changes since the latest version
>>>      (3.8.8) already includes the required updates.
>>>     - Fixed the "oe-selftest -r debuginfod.Debuginfod.test_debuginfod=
_native"
>>>       failure observed after upgrading to 6.0.2.
>>>     - Verified that previously reported Autobuilder issues are no lon=
ger observed.
>>>       The following builds/tests were successfully completed:
>>>        "bitbake core-image-minimal"
>>>        "bitbake core-image-full-cmdline"
>>>        "bitbake core-image-sato"
>>>        "bitbake core-image-sato world"
>>>        "bitbake core-image-full-cmdline:do_testimage"
>>>        "bitbake core-image-minimal:do_rootfs"
>>>        "bitbake core-image-sato -c populate_sdk"
>>>
>>> * V8:
>>>     - Fix build with systemd (Check patch 7 for detailes)
>>>     - Make rpmbuild can find the pkgconfig (.pc) files in /usr/share/=
pkgconfig
>>>       (Check patch 7 for detailes)
>>>     - Backport a PULL from git/libarchive to fix oe-selftest failures.
>>>
>>> * V7:
>>>     - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patc=
h:
>>>       To fix "bitbake core-image-sato -cpopulate_sdk" error on Ubuntu=
 24.04 when
>>>       pkg-config is installed on host, now the host contamination has=
 been fixed,
>>>       and the patch has been submitted to upstream:
>>>       https://github.com/rpm-software-management/rpm/pull/4127
>>>
>>> * V6
>>>     - Fix -cpopulate_sdk error when DISTRO =3D "poky"
>>>
>>> * V5
>>>     - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclas=
s
>>>     - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop depen=
dencies
>>>       between /bin/sh and libc.so.
>>>
>>> * V4
>>>     - Fix loop dependencies issues for libc6 and busybox
>>>     - Fix issues for can't find pkg-config files (.pc) on qemux86-64.
>>>
>>> * V3
>>>     - Fix Alexender's comments
>>>       a) Suppot rpm 6
>>>       b) Move rpm-setup-autosign to rpm-build
>>>       c) Remove -DLIBELF_FOUND=3DFalse
>>>
>>>     - Fix build for nativesdk-rpm
>>>
>>>     - Drop patch for createrepo-c since it has been upgraded (rev:
>>>       804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)
>>>
>>> * V1 & V2
>>>     - Initial version
>>>
>>>
>>> --
>>> # Sumanth Gavini
>>> # Wind River Linux
>>>
>> Hi Sumanth,
>>
>> Thanks for the new version.
>>
>> It does look better, but we still have a lot of errors. First, another
>> dnf error on core-image-sato:
>>
>> ERROR: core-image-sato-1.0-r0 do_populate_sdk: Could not invoke dnf
>> ...
>> Error:
>>    Problem 1: conflicting requests
>>     - nothing provides pkgconfig(fontconfig) >=3D 2.13.0 needed by lib=
cairo-dev-1.18.4-r0.x86_64_v3 from oe-repo
>>    Problem 2: conflicting requests
>>     - nothing provides pkgconfig(libsolv) needed by libdnf-dev-0.75.0-=
r0.x86_64_v3 from oe-repo
>>     - nothing provides pkgconfig(sqlite3) needed by libdnf-dev-0.75.0-=
r0.x86_64_v3 from oe-repo
>>     - nothing provides pkgconfig(libsolvext) needed by libdnf-dev-0.75=
.0-r0.x86_64_v3 from oe-repo
>>    Problem 3: conflicting requests
>>     - nothing provides pkgconfig(mount) >=3D 2.23 needed by libglib-2.=
0-dev-1:2.88.2-r0.x86_64_v3 from oe-repo
>>    Problem 4: conflicting requests
>>     - nothing provides pkgconfig(libudev) >=3D 251 needed by libgudev-=
1.0-dev-238-r0.x86_64_v3 from oe-repo
>>    Problem 5: conflicting requests
>>     - nothing provides pkgconfig(libudev) needed by libinput-dev-1.31.=
3-r0.x86_64_v3 from oe-repo
>>    Problem 6: conflicting requests
>>     - nothing provides pkgconfig(ncurses) needed by libreadline-dev-8.=
3-r0.x86_64_v3 from oe-repo
>>    Problem 7: conflicting requests
>>     - nothing provides pkgconfig(libxml-2.0) needed by librepo-dev-1.2=
0.0-r0.x86_64_v3 from oe-repo
>>     - nothing provides pkgconfig(openssl) needed by librepo-dev-1.20.0=
-r0.x86_64_v3 from oe-repo
>>     - nothing provides pkgconfig(libcurl) needed by librepo-dev-1.20.0=
-r0.x86_64_v3 from oe-repo
>>
>> ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: Could not invoke dnf.
>> ...
>> Error:
>>    Problem 1: conflicting requests
>>     - nothing provides pkgconfig(fontconfig) >=3D 2.13.0 needed by lib=
cairo-dev-1.18.4-r0.x86_64_v3 from oe-repo
>>    Problem 2: conflicting requests
>>     - nothing provides pkgconfig(sqlite3) needed by libdnf-dev-0.75.0-=
r0.x86_64_v3 from oe-repo
>>     - nothing provides pkgconfig(libsolv) needed by libdnf-dev-0.75.0-=
r0.x86_64_v3 from oe-repo
>>     - nothing provides pkgconfig(libsolvext) needed by libdnf-dev-0.75=
.0-r0.x86_64_v3 from oe-repo
>>    Problem 3: conflicting requests
>>     - nothing provides pkgconfig(mount) >=3D 2.23 needed by libglib-2.=
0-dev-1:2.88.2-r0.x86_64_v3 from oe-repo
>>    Problem 4: conflicting requests
>>     - nothing provides pkgconfig(libudev) >=3D 251 needed by libgudev-=
1.0-dev-238-r0.x86_64_v3 from oe-repo
>>    Problem 5: conflicting requests
>>     - nothing provides pkgconfig(libudev) needed by libinput-dev-1.31.=
3-r0.x86_64_v3 from oe-repo
>>    Problem 6: conflicting requests
>>     - nothing provides pkgconfig(ncurses) needed by libreadline-dev-8.=
3-r0.x86_64_v3 from oe-repo
>>    Problem 7: conflicting requests
>>     - nothing provides pkgconfig(libxml-2.0) needed by librepo-dev-1.2=
0.0-r0.x86_64_v3 from oe-repo
>>     - nothing provides pkgconfig(libcurl) needed by librepo-dev-1.20.0=
-r0.x86_64_v3 from oe-repo
>>     - nothing provides pkgconfig(openssl) needed by librepo-dev-1.20.0=
-r0.x86_64_v3 from oe-repo
>> ...
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/436=
2
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/425=
3
>>
>>
>> Some ptest images are also failing:
>>
>> ERROR: core-image-ptest-glib-2.0-1.0-r0 do_rootfs: Could not invoke dn=
f.
>> ...
>> Error:
>>    Problem: package libglib-2.0-ptest-1:2.88.2-r0.x86_64_v3 from oe-re=
po requires glib-2.0-dev, but none of the providers can be installed
>>     - conflicting requests
>>     - nothing provides pkgconfig(mount) >=3D 2.23 needed by libglib-2.=
0-dev-1:2.88.2-r0.x86_64_v3 from oe-repo
>> (try to add '--skip-broken' to skip uninstallable packages)
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/81=
9
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/416=
3
>>
>>
>> And also the libarchive ptest are failing:
>>
>> AssertionError:
>> Failed ptests:
>> {'libarchive': ['libarchive_test']}
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/414=
5
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/203=
1
>>
>>
>> Can you have a look at the issues?
>>
>> Thanks,
>> Mathieu
>>
>> --
>> Mathieu Dubois-Briand, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#242368):https://lists.openembedded.org/g/openembed=
ded-core/message/242368
>> Mute This Topic:https://lists.openembedded.org/mt/120512258/10534619
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [=
sumanth.gavini@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
> Hi Mathieu,
>
> In V11 patch
> 0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch should
> resolve the "pkgconfig could not invoke dnf" error"
>
> I have successfully verified the following:
> bitbake core-image-sato-sdk:do_populate_sdk
> bitbake core-image-sato-sdk:do_rootfs
>
> Both completed successfully on my side.
> Could you please verify again and let me know if you still encounter th=
e
> issue?
>
> Below is my local.conf:
> MACHINE ??=3D "qemux86-64"
> PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
> INHERIT +=3D 'image-buildinfo'
> IMAGE_BUILDINFO_VARS:append =3D ' IMAGE_BASENAME IMAGE_NAME'
> IMAGE_INSTALL:append =3D ' ssh-pregen-hostkeys'
> SANITY_TESTED_DISTROS =3D ''
> OEQA_TESTDISPLAY =3D ':1'
> EXTRA_IMAGE_FEATURES ?=3D 'allow-empty-password empty-root-password
> allow-root-login'
> #OE_FRAGMENTS +=3D 'machine/qemux86-64 distro/poky'
> IMAGE_CLASSES +=3D "testimage"
>
Mathieu=C2=A0 please confirm but since Sumanth is new,
I want to point out that we have a long history of people occasionally=20
not being able to reproduce
(all of) the errors that the YP autobuilder (AB) encounters.

This is usually because:
 =C2=A01. they only have one or two host distros at hand and/or
 =C2=A02. they don't re-use sstate cache between distros like YP AB does.

In this case, the build failure links were from:

A. https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/436=
2
 =C2=A0 =C2=A0 =C2=A0Rocky 8.8 worker 1

and
B. https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/425=
3
 =C2=A0 =C2=A0 =C2=A0Debian 11 worker 3

It is never clear what distro the sstate cache is pulled in from since=20
it's designed be distro-independent.

I'm not going to look at the other build failure links.

This package upgrade is particularly tricky so I'm going to ask Sundeep=20
to help Sumanth with
running some customer YP AB builds if Mathieu thinks that's a good idea.=20
Due to the timzone
difference between Sumanth (in Texas) and Sundeep (in India), this might=20
not happen until next week.

Hold on there guys, we'll get this figured out soon hopefully.


--=20
# Randy MacLeod
# Wind River Linux

--------------VpB85FRX4vKGsNJwM2BbcxHZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-07-30 14:13, Gavini, Sumanth
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:40d27de1-afee-4c92-abef-b2d09ab7a036@windriver.com">
      <pre wrap="" class="moz-quote-pre">On 7/30/2026 10:39 AM, Mathieu Dubois-Briand via lists.openembedded.org 
wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Thu Jul 30, 2026 at 1:51 AM CEST, Sumanth Gavini wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">* V11:
  - Added 0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
    To fix &quot;bitbake core-image-minimal-dev&quot; Could not invoke dnf. Command...
    pkgconfigdeps.sh unconditionally emits /usr/bin/pkg-config as a hard
    Requires for packages shipping .pc files. In OE/Yocto cross-compilation,
    pkg-config is a host-only build tool not needed on the target rootfs,
    causing failures with -dev packages.

* v10:
   - The ARCHIVE_FILTER_RPM macro was commented out in a previous
     libarchive change, causing do_compile_ptest_base to fail with:
     error: 'ARCHIVE_FILTER_RPM' undeclared
     Restore the macro definition. The ptest now compiles and passes
     successfully.

* V9:
   - Updated SRCREV to the 6.0.2 tag.
   - Incorporated all V8 changes and updated them as needed for 6.0.2.
   - Dropped
     0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch
     from V8, as it is no longer needed. After filtering out the
     /usr/bin/pkg-config file dependency, &quot;bitbake core-image-sato -c
     populate_sdk&quot; completes successfully without the patch.
   - Fixed the filtering of the /usr/bin/pkg-config file dependency.
     pkg-config is a build-time tool, not a runtime dependency. Filtered
     the /usr/bin/pkg-config dependency automatically detected by
     pkgconfig.attr for packages containing .pc files, preventing
     unnecessary hard runtime dependencies in -dev packages.
   - Removed v8 libarchive-related changes since the latest version
    (3.8.8) already includes the required updates.
   - Fixed the &quot;oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native&quot;
     failure observed after upgrading to 6.0.2.
   - Verified that previously reported Autobuilder issues are no longer observed.
     The following builds/tests were successfully completed:
      &quot;bitbake core-image-minimal&quot;
      &quot;bitbake core-image-full-cmdline&quot;
      &quot;bitbake core-image-sato&quot;
      &quot;bitbake core-image-sato world&quot;
      &quot;bitbake core-image-full-cmdline:do_testimage&quot;
      &quot;bitbake core-image-minimal:do_rootfs&quot;
      &quot;bitbake core-image-sato -c populate_sdk&quot;

* V8:
   - Fix build with systemd (Check patch 7 for detailes)
   - Make rpmbuild can find the pkgconfig (.pc) files in /usr/share/pkgconfig
     (Check patch 7 for detailes)
   - Backport a PULL from git/libarchive to fix oe-selftest failures.

* V7:
   - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch:
     To fix &quot;bitbake core-image-sato -cpopulate_sdk&quot; error on Ubuntu 24.04 when
     pkg-config is installed on host, now the host contamination has been fixed,
     and the patch has been submitted to upstream:
     <a class="moz-txt-link-freetext" href="https://github.com/rpm-software-management/rpm/pull/4127">https://github.com/rpm-software-management/rpm/pull/4127</a>

* V6
   - Fix -cpopulate_sdk error when DISTRO = &quot;poky&quot;

* V5
   - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
   - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependencies
     between /bin/sh and libc.so.

* V4
   - Fix loop dependencies issues for libc6 and busybox
   - Fix issues for can't find pkg-config files (.pc) on qemux86-64.

* V3
   - Fix Alexender's comments
     a) Suppot rpm 6
     b) Move rpm-setup-autosign to rpm-build
     c) Remove -DLIBELF_FOUND=False

   - Fix build for nativesdk-rpm

   - Drop patch for createrepo-c since it has been upgraded (rev:
     804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)

* V1 &amp; V2
   - Initial version


--
# Sumanth Gavini
# Wind River Linux

</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Hi Sumanth,

Thanks for the new version.

It does look better, but we still have a lot of errors. First, another
dnf error on core-image-sato:

ERROR: core-image-sato-1.0-r0 do_populate_sdk: Could not invoke dnf
...
Error:
  Problem 1: conflicting requests
   - nothing provides pkgconfig(fontconfig) &gt;= 2.13.0 needed by libcairo-dev-1.18.4-r0.x86_64_v3 from oe-repo
  Problem 2: conflicting requests
   - nothing provides pkgconfig(libsolv) needed by libdnf-dev-0.75.0-r0.x86_64_v3 from oe-repo
   - nothing provides pkgconfig(sqlite3) needed by libdnf-dev-0.75.0-r0.x86_64_v3 from oe-repo
   - nothing provides pkgconfig(libsolvext) needed by libdnf-dev-0.75.0-r0.x86_64_v3 from oe-repo
  Problem 3: conflicting requests
   - nothing provides pkgconfig(mount) &gt;= 2.23 needed by libglib-2.0-dev-1:2.88.2-r0.x86_64_v3 from oe-repo
  Problem 4: conflicting requests
   - nothing provides pkgconfig(libudev) &gt;= 251 needed by libgudev-1.0-dev-238-r0.x86_64_v3 from oe-repo
  Problem 5: conflicting requests
   - nothing provides pkgconfig(libudev) needed by libinput-dev-1.31.3-r0.x86_64_v3 from oe-repo
  Problem 6: conflicting requests
   - nothing provides pkgconfig(ncurses) needed by libreadline-dev-8.3-r0.x86_64_v3 from oe-repo
  Problem 7: conflicting requests
   - nothing provides pkgconfig(libxml-2.0) needed by librepo-dev-1.20.0-r0.x86_64_v3 from oe-repo
   - nothing provides pkgconfig(openssl) needed by librepo-dev-1.20.0-r0.x86_64_v3 from oe-repo
   - nothing provides pkgconfig(libcurl) needed by librepo-dev-1.20.0-r0.x86_64_v3 from oe-repo

ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: Could not invoke dnf.
...
Error:
  Problem 1: conflicting requests
   - nothing provides pkgconfig(fontconfig) &gt;= 2.13.0 needed by libcairo-dev-1.18.4-r0.x86_64_v3 from oe-repo
  Problem 2: conflicting requests
   - nothing provides pkgconfig(sqlite3) needed by libdnf-dev-0.75.0-r0.x86_64_v3 from oe-repo
   - nothing provides pkgconfig(libsolv) needed by libdnf-dev-0.75.0-r0.x86_64_v3 from oe-repo
   - nothing provides pkgconfig(libsolvext) needed by libdnf-dev-0.75.0-r0.x86_64_v3 from oe-repo
  Problem 3: conflicting requests
   - nothing provides pkgconfig(mount) &gt;= 2.23 needed by libglib-2.0-dev-1:2.88.2-r0.x86_64_v3 from oe-repo
  Problem 4: conflicting requests
   - nothing provides pkgconfig(libudev) &gt;= 251 needed by libgudev-1.0-dev-238-r0.x86_64_v3 from oe-repo
  Problem 5: conflicting requests
   - nothing provides pkgconfig(libudev) needed by libinput-dev-1.31.3-r0.x86_64_v3 from oe-repo
  Problem 6: conflicting requests
   - nothing provides pkgconfig(ncurses) needed by libreadline-dev-8.3-r0.x86_64_v3 from oe-repo
  Problem 7: conflicting requests
   - nothing provides pkgconfig(libxml-2.0) needed by librepo-dev-1.20.0-r0.x86_64_v3 from oe-repo
   - nothing provides pkgconfig(libcurl) needed by librepo-dev-1.20.0-r0.x86_64_v3 from oe-repo
   - nothing provides pkgconfig(openssl) needed by librepo-dev-1.20.0-r0.x86_64_v3 from oe-repo
...

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/4362">https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/4362</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/4253">https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/4253</a>


Some ptest images are also failing:

ERROR: core-image-ptest-glib-2.0-1.0-r0 do_rootfs: Could not invoke dnf.
...
Error:
  Problem: package libglib-2.0-ptest-1:2.88.2-r0.x86_64_v3 from oe-repo requires glib-2.0-dev, but none of the providers can be installed
   - conflicting requests
   - nothing provides pkgconfig(mount) &gt;= 2.23 needed by libglib-2.0-dev-1:2.88.2-r0.x86_64_v3 from oe-repo
(try to add '--skip-broken' to skip uninstallable packages)

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/819">https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/819</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4163">https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4163</a>


And also the libarchive ptest are failing:

AssertionError:
Failed ptests:
{'libarchive': ['libarchive_test']}

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4145">https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4145</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2031">https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2031</a>


Can you have a look at the issues?

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
<a class="moz-txt-link-freetext" href="https://bootlin.com">https://bootlin.com</a>



-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#242368): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/242368">https://lists.openembedded.org/g/openembedded-core/message/242368</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/120512258/10534619">https://lists.openembedded.org/mt/120512258/10534619</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:sumanth.gavini@windriver.com">sumanth.gavini@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Hi Mathieu,

In V11 patch 
0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch should 
resolve the &quot;pkgconfig could not invoke dnf&quot; error&quot;

I have successfully verified the following:
bitbake core-image-sato-sdk:do_populate_sdk
bitbake core-image-sato-sdk:do_rootfs

Both completed successfully on my side.
Could you please verify again and let me know if you still encounter the 
issue?

Below is my local.conf:
MACHINE ??= &quot;qemux86-64&quot;
PACKAGE_CLASSES = &quot;package_rpm package_deb package_ipk&quot;
INHERIT += 'image-buildinfo'
IMAGE_BUILDINFO_VARS:append = ' IMAGE_BASENAME IMAGE_NAME'
IMAGE_INSTALL:append = ' ssh-pregen-hostkeys'
SANITY_TESTED_DISTROS = ''
OEQA_TESTDISPLAY = ':1'
EXTRA_IMAGE_FEATURES ?= 'allow-empty-password empty-root-password 
allow-root-login'
#OE_FRAGMENTS += 'machine/qemux86-64 distro/poky'
IMAGE_CLASSES += &quot;testimage&quot;

</pre>
    </blockquote>
    <p>Mathieu&nbsp; please confirm but since Sumanth is new,&nbsp;<br>
      I want to point out that we have a long history of people
      occasionally not being able to reproduce&nbsp;<br>
      (all of) the errors that the YP autobuilder (AB) encounters.&nbsp;<br>
      <br>
      This is usually because:<br>
      &nbsp;1. they only have one or two host distros at hand and/or<br>
      &nbsp;2. they don't re-use sstate cache between distros like YP AB
      does.<br>
      <br>
      In this case, the build failure links were from:<br>
      <br>
      A.
      <a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/4362">https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/4362</a><br>
      &nbsp; &nbsp; &nbsp;Rocky 8.8 worker 1<br>
      <br>
      and<br>
      B.
      <a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/4253">https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/4253</a><br>
      &nbsp; &nbsp; &nbsp;Debian 11 worker 3<br>
      <br>
      It is never clear what distro the sstate cache is pulled in from
      since it's designed be distro-independent.<br>
      <br>
      I'm not going to look at the other build failure links.<br>
      <br>
      This package upgrade is particularly tricky so I'm going to ask
      Sundeep to help Sumanth with<br>
      running some customer YP AB builds if Mathieu thinks that's a good
      idea. Due to the timzone&nbsp;<br>
      difference between Sumanth (in Texas) and Sundeep (in India), this
      might not happen until next week.<br>
      <br>
      Hold on there guys, we'll get this figured out soon hopefully.<br>
      <br>
      <br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------VpB85FRX4vKGsNJwM2BbcxHZ--

