Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5FCCD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 08:17:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2718.1778660265093314020
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 01:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=L7JZEDFV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9593f74c6b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D3xmGw251624
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 01:17:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=6+/XzoiGxwo3Gb3dH9IV98I/7yl2UL55Pgs6LWbh948=; b=
	L7JZEDFVdiucvmoi+MmS5fREJyNUOPzeVipSlTWXhrB4n4Bfxw1sq37FmbLITbbt
	EpT/6qelasgA54fyw2AL9lXfPDM4MGX4wJthy67lpkZrVPSxTWX3wa+7zQ0Iw3B4
	6y4lncDWng/dnaUs/IE0aUEL+bRTUU9CEhzSKTCucvfDtrGSbK5Y4G3sedyu2ZT3
	u3p1nOcFYdsBOP0IDdwkLD/n/ON9lTOqg4Vz7Bu8gklDeJ1UeyeK5sZ31L2IR+UG
	l83au2veuoUAlaaf2sD4gTrug+/KKGxB/vhquUKP+SYP8ZOavCF1sBP+dFCLqyLR
	W+tK7DkQQbrdomSTSt+7XQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012061.outbound.protection.outlook.com [40.107.209.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4ftb8dd2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 13 May 2026 01:17:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxz8CCOZNugOckZlV1sR21JNYoDujRXUNhf+i409khC3FNc2KmAbNelzdL/vgvE5PZfvWx1RsnzAuUtovfTpXp/drBtkTxkcNLy/jKKLf4IyOlpkTNZ9TU3jU7CwknpOHOqOOYWDLIAo84hjh4u2nl/VmlF3bEhE4Vz158S+kkfUCBdbnuZ/sr5JSyZeuf5Xh/Gqt0u/7SyEPrYYEX+1YE+4EX8wMv2AhhZPTfueKCX8x4XR7TZ07VYUWFfEsd6Y6ByUBMqLxSX6UnmKxhRcnXW8+nhLuX3BaPjqRTdD8rabANQyzY3SVNG1ov44zXO9f5YlwDjhgNNiUycj8vth1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+/XzoiGxwo3Gb3dH9IV98I/7yl2UL55Pgs6LWbh948=;
 b=W1QlNY1zrKE9iXhm0jJLvAbdVLdPyHdoBdUkv0Si+DSJ9hNOnxw5Um3xOkEa0JIUt81QwoTEX2K9xK/Am7s+B1Ru4qY4Me7039sAEEgUgW+tXkBDyIWXo6z0gx8YqRQ62Wg6gr4lmYwAaX19RPHegMBoXsS4T5Kl/FuNCIZi8x+NSfz4LuURRu6wUwNpTcWlApEub8Wy/MGvI/O5i23bVxXW/OR+HG466Ti2MouoDgHd5YcUKkjjkIXs2tIwFIKD3shFX1dkg/mPRYO16a3zZXls2xFgBsEnsJezRuj69ldScqwG2kTZOp+MrDUGvBHnWSLV45qun3JhJX4/eSOpMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by CY8PR11MB6842.namprd11.prod.outlook.com (2603:10b6:930:61::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 13 May
 2026 08:17:42 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 08:17:42 +0000
Message-ID: <ecf2526f-ff0c-4e6b-a0a5-e343cdc6ceef@windriver.com>
Date: Wed, 13 May 2026 16:17:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/3] strace: upgrade 6.19 -> 7.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1778251103.git.liezhi.yang@windriver.com>
 <b45f339c84baf27040248d667f2a8d02ee2f25fd.1778251103.git.liezhi.yang@windriver.com>
 <1C70E210-D752-4CE0-8145-8B4FF7D58D8B@arm.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <1C70E210-D752-4CE0-8145-8B4FF7D58D8B@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SE2P216CA0073.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:118::16) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|CY8PR11MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: 63afd8c0-eaa8-4cee-b757-08deb0c81aac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|3023799003|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	pNBUZ5EobkB9reCQyuKBc/qo0LYPaidPpMRPHDhVqymdonErlbW1kvuswvO36I3oKc7ZKI+3T2+j7gG9T8pNc7LloUDRxR7fKnpP2IgK9UGLIMs22cHOVA6iZG/T0+LcK7CDXuSo7Y4amesYckcxdZk9xBlvvHsZGUWAD/qfLkc+MyTSy7h5WULZ3X/zdC0l2GwDWSKTXDyMxvX/qRpFeZI5t1u4BvQpnKutzotOHq1AylTSOV+Yl3bz0FbgfgwiReIFpPFBiYIuxFMFIXZzVGl5qob6Eqo+duecuddaEiHaA3VNxrjSHVdmNLdmOa2disk795UlaQplfZDpDACOoTEaWDdhdJfRUwnQUokfeLez0SDuEhXppuqzEAOKmbSuATUUczVGitZJbvg40bqZH7WMHPSf1ZxVT/WUFKKm6tL/bcQjhjZeFqDu/SonLHbFBD4MyNdDMGpxsfj1pWEkEotRP1vTyKoRI4Trx3yOw8SbNXcITQgUIT6wpvMbjOHfg7VeZvk+6bR9+AxUZQJodDVoRUDAZcSaQ0yvfbcVrXVJvyHeeMsvA0WCS4K0QEV4KIsxEWSVrRDmpZEWm0vg0wIL8Bl8hkya/q0voFwc+U1QflKE4MlO950YBgb9TPftsRhjWYwrWI4NWlIAa273kSPzDzR0CwZzL1NirodSZNeQs8+mnKntpNaQTfXjIbgx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(3023799003)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZFhzc21JdE9MSHF5TjZ3YnNwUXp4amw0V2ZTMHlYSDV4NzRBZ0oxRmZNcUho?=
 =?utf-8?B?UTUySzRyM2hYWEQ4RVJUa3RqUVRDUVJ5Zk9YYnRRSVg4WXh2RHJlNzVsQ0JK?=
 =?utf-8?B?cElpd3g1K2FKTE9yaFpLam5TMlBhdktOdVlKNlkrdmFOWnd4TERjNUxYNGVV?=
 =?utf-8?B?OGFWOXIrRE1ibm9LL1hNK2dmTjArSm9JUmdyV3hQUGdRN0ZSeXhGNUhhcnkv?=
 =?utf-8?B?ekpIQS82ZGx3enByUjRaeHFmTWVUcXVMT2NqVmE0Snhla0tOaytQNUo5UW5W?=
 =?utf-8?B?OC9XcEVEK3B5b01ybllDbldvREFoa2N3V2tVbFlMR3lmRFMwbzQxQitPaEJw?=
 =?utf-8?B?OUg3Uk9SWE16clFaNjVRTGx4WWcxZkFIQTc1NzRvTmVWd0NRcjdFREZqTnhR?=
 =?utf-8?B?NUNMRE9sNUtnMmZveERwY3VpVkQ5Qk1xaUlIZEMrc1RMOGMwVVN2TkNuekxa?=
 =?utf-8?B?TFpiZjEybytmTnNQdEc3cThkaFhtUThwMUlmZmZjNFFRUkNGSUx2aXdtT3p1?=
 =?utf-8?B?R1UycDVoaFB6VlRqQ0YrTVJ5SDhSaE9DUEd1RzBNU2xnaW8rS1FEaUNRSHNF?=
 =?utf-8?B?eUpxb29MT0NsK2pCdVdUcjkvaUFIalpSYW5mU1d4YndBL1c0Z0djY2NhL20x?=
 =?utf-8?B?WHB1a3RTUkFpbGp2VHBCTVZYMzFaQnI2alRpM0VqQzJSTFd0ek9VZHg4eXZl?=
 =?utf-8?B?aXZacGk0bThQVHc3aTRtRVZUNmNtVjVkWEtJVkFPVWJnRUw5aWVwRXQ3Z2VW?=
 =?utf-8?B?aGtaV0xLcmQwTjVtQlduYTZMTW9vaFBDdENVSEIyTkRjVE9FczJLWUxTV0g1?=
 =?utf-8?B?S2pGZ3hBMDZvRWlHUE52L2lWdVo4NDM3by8rcXdyU1p2OEZaTUc2ZGRRZnQ0?=
 =?utf-8?B?RktRZ2VHNWk0V1hFSTlwSGdKaHZrQmZwU0QrZndkOGJtSnNJaUJyTUNjTXZD?=
 =?utf-8?B?SXZpWFIzaGJGNjBkWUhhZVl1MmJ5S01ORUtMZDVYWXNrVWFLVUwxVnJoR1M5?=
 =?utf-8?B?SWh6Qmx3d3pQT2VBSU1BMDRjbG8wQzRIbEdoSXRLRXoyandlWVFYVmtBbXpN?=
 =?utf-8?B?b3NZZnYvS0ZxQ3UxdlNsWkdoL3VhNGxqUmoxMTU5Z1NFRXhFOFY5TTVkNTVw?=
 =?utf-8?B?ZWFTd24ybEUwcGZWSmg5RXR1RWtMWWk2cmJjMXloLzYwdmxCOHN1Z2UvN1hB?=
 =?utf-8?B?ZXh6RlptVW9aM3dkSE0wVGxUZGFUbFkyV2MyT0VzMHZHcW1DWWxWTGw2Rnpi?=
 =?utf-8?B?c2NrMWZFc2VkcTFTaHM3bTY2Z2VMdmpkRktGUTNkMnljd3ZNSXRqcGtEK2ox?=
 =?utf-8?B?a0RoTVAvQnhkR1pGRi8vSUo3Q0xIWGZkMGw3ZUM0VGo3Y2UxNnBmNWk1SEtW?=
 =?utf-8?B?Y3dlREtlNUFMQS85NUkzWm5ZQ2szZGZVcjhuYXpwZHN1RWVHQmVuVXpocTZS?=
 =?utf-8?B?VUR3Q3RqNzRrMlh3TUFBYjBCY2NKa3JrRFpkcVdnVnlNS0FxM0U2Z0RENjRo?=
 =?utf-8?B?aXVzd1gzOWY5MytWYm84dUFZT1kyR3lMZHMxMjhnVFl1VGFjVVZzRUJTWDRs?=
 =?utf-8?B?SkpRKytCMGlYWlNxMlZkYW5tRUVlUENITmZ5VzhVMWR5S2lodW1SM3I1Wlpa?=
 =?utf-8?B?c0tKWmM3dTZCV3FqQkhsQWJRYS9SNlM1dmNTV2t1Q1ZvWjFrNEM0MXZqc0x0?=
 =?utf-8?B?aEJnQ2h4ZFArbWsxVUgrSkIzdkZUQXhUWXg3N1loaHEyd3pQYnI5MjlobGdU?=
 =?utf-8?B?NDNtS2tFR2psNEtEYTB2TnBrMVJSOGg2TVAvQWFWNzdVcVBXNytDYllWSS84?=
 =?utf-8?B?SjZhb0ZxZmVEdVJJTkI3WSttWEw5STh6VlZGYTVja0E4TDV6c2xVRmZwdFV2?=
 =?utf-8?B?QkhNUldvcGFlRW5XY2YraUFsd2lHbnFZTTFNYXBheVF5U09wZFdMVThLQ0lC?=
 =?utf-8?B?eHlJNk9VaXZFeFZEVkNQalJ2Nm1aOUtEeUJ4ZE80ZEp1dStvWTAyb3d4aFhq?=
 =?utf-8?B?SHNQaDY1VDAzT1M4ZUdrSm1aOXNxRThUSGZtSFVuM3pHT3dKa2lSWEhMcjJj?=
 =?utf-8?B?Mi9VSG96d2V1VHE2aGtiZy8rME11aFZYZE4zaXZXb3E5Vlg5dHBTY1h6cUhV?=
 =?utf-8?B?eDhhU0duZkI0QVZuSHpEMTlMc1c5SzAwYmVid2JjMjluQjhmb0FtanJ5L3J4?=
 =?utf-8?B?TUZXUWVDNE4rOVFFVkRicTlzdFFBSEV5M1JRSk1BTzFUNHdIWkNEZnNEYkNa?=
 =?utf-8?B?bTI4WlZoTUVxcjNBWEFQaDFIbGR4OUVFcFFYbG9UOUw4NkpTS1BCT2plN2h0?=
 =?utf-8?B?cFp2NFM5QlM0aVk3SE9FSkxCSjA5N0RVSmJxeDVEMXVHSU5RUk1OZz09?=
X-Exchange-RoutingPolicyChecked: 
	MjAuc+HEbqKml3zve0iE9SXtR8Ez3m2Js08c6OxCKjxiYRkCUarcim8/WSfFUnqS/3A/eKXYOLpHmvmG6GKgwxKm55FH5UGnvRsA8CPHY7OrQXQuUv5CcbGzq6SIE2O4R0ds3p1QIo+kWMLIpeyteuQLZaIJYoboREbVSqZHDCiOiy1ejt8Oe5SSi2hHGxBOIQSv9bFTIlIJdciSHPrrgN2TmlPHG/oT4uhubgNuj2eFIHuLlBPuT/Ka7jOsBs8TKIZ+tRGTiddp6pHUE4K2hlAoudyV6BVhObmbIUfrqwasGOcA6R1ZCaPsVxpWkIzB//UOts9VIRcDUsu8cE++Dw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63afd8c0-eaa8-4cee-b757-08deb0c81aac
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 08:17:42.2047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rP9XB+Itux9gA8PUpWFwA5NyaqulIPzfBbYsmABr0FoMBE5kfe+z0EPf06iDwC805OXGGvbFMCe9u1/9pIKgYNjvHquiM+R6OLNz1eQwpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6842
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA4NCBTYWx0ZWRfX3F5h+DLXOK4U
 amlos65H92i21da8IQ8jzEoVLOg9ZGswtHPGv3omPFxP3yqvVV4ZKjE7YTTfw/LRQih7IlY9Edr
 mRaWOCBoUuhgbRRxfa5vKaD//Yi0HRc2nrS5HLyU4gI7yQgv6+zpo7OL7ZZGwph/X5VHK+heaYm
 mgZ3CjWj2Sdlg+uZMPMWVWQ3qaRbKlz4hHMHjdqZQlZGizH+gCOOcHNyD9hW14P2puGFLtRKqOM
 tGe4L8GaGMaAgxNGSFzPIPM+bcAl2MkMiDo1wgtb385u/0G8hWyPa2jvI/524fkODm1iJ48AOYN
 TBM/pP0rsfLMbNhXvgahpyzEIPKrqkbgp/JKnI7qiv10Zz0NTRkia4DQWoB4yODNioOoxdb6m74
 UyrnZsMUi+rj2523ld6B3nrkDMgwljGe5t3ls0Ssn2XRH1DAvQBZuPaI9wx52Rts+KQgAxEptSe
 66T/nUxdv1o949eVWcg==
X-Proofpoint-GUID: pTvUNb3mKkFc8CYZ82sGfkfo3QTTfw-t
X-Authority-Analysis: v=2.4 cv=du/rzVg4 c=1 sm=1 tr=0 ts=6a0433a8 cx=c_pps
 a=RA+XJ41QLaSqwPGKFjpXOA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=Q4-j1AaZAAAA:8 a=MePgxwVQt3hykuPWq64A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: 4ABMcPwhiV4nKD9E6dPiFNhMuicP4ODa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130084
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64D3xmGw251624
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236946



On 5/12/26 21:20, Ross Burton wrote:
> Hi,
>=20
>> On 8 May 2026, at 15:45, Robert Yang via lists.openembedded.org <liezh=
i.yang=3Dwindriver.com@lists.openembedded.org> wrote:
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-fh_key=
_file.c-Fix-build-error-for-musl.patch b/meta/recipes-connectivity/nfs-ut=
ils/nfs-utils/0001-fh_key_file.c-Fix-build-error-for-musl.patch
>=20
> There=E2=80=99s nfs-utils changes in this strace upgrade, they=E2=80=99=
ll need to be put back into the right change.

Sorry, that's a mistake. I removed it and send a V2.

>=20
>> # remove at next version upgrade or when output changes
>> -PR =3D "r1"
>> HASHEQUIV_HASH_VERSION .=3D ".1=E2=80=9D
>=20
> Remove all of this block (the comment and both assignments), not just t=
he PR.

I removed them in V2's PULL. I didn't see this comment in the first read,=
 sorry
about that.

// Robert

>=20
> Ross
>=20


