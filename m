Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D89CD4F4A
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 16:47:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1774.1779122859358565725
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 09:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KcCkgHyn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9598d01d55=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IEJohl1574616
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 16:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=8dr7kWMBzQn+8YiZWzIbbn
	Y8mDZ9Piqdi5udMbpTd7g=; b=KcCkgHynNZTQD/HT+u++b1mK82+OVgPB/YQ6C4
	tDuySyCNEbg8M5sYAf4WK0WpCoocmlTtsP1FOMjkt66OrWMjcJbiTfaMxISpVfNY
	wHVuBC+kNOzAwDj7FR36krtVJNe09RBWkuVnoNtBbE+uacy7OVtSNkNCpGqrT2N7
	gjfH22x8dg7x88usdt5yAruDsyqecXmSX5AvfkgVV72adjcyTM/WEwnfV0Z/bnv9
	CtDWLxik5gRZbc2Q1UN/UR1cayktNr2M2v9lNblS19s5yyTIW82ucamolb6FPNbk
	kQrc53iXHLwxtkw8qU4PNHLSzEYDPnUJdT0Lsu+b9ctckfWw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012050.outbound.protection.outlook.com [40.107.200.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6ecf2dn9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 16:47:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCRZL/frB9zuXUjMG8rlqmaCckGvk4+f1crQ2+J/OmDE0yGklRiKaroquWDelDPnCXiu8fpWJEnwp2K/ojdNa9CJ9clEy9auwgrUxRuw5/bxx2j4oNT4vhj7sjUALPsgm+uEtcwgbSr1bzLfurknirth/qBVPQr/CH9+0sFKaZT/ZncaTka/uZC7AePDptl+l1UJuphD32+RwRXUA8FmLFpeLr6sAEnNT9xPQA5JEBjuTRkaSGz8el+IGSC4oKcGF1/nVRfDJuXR7llssGYzPxTiaIDcXkY8dKPydF9ewotrUijL0pYcSdFJrT4SAAlAJJkz9cZQqsod+PehbDv7eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dr7kWMBzQn+8YiZWzIbbnY8mDZ9Piqdi5udMbpTd7g=;
 b=gmraru4b63MRtGQzx34dHcZ8fGV3CLyONgfUZ+yMkANeyFpIxhfPw1/9Oz6hknJkB+qdBP1/2Hg3qoleMgLfLIqGw9bOCxmY2nUjBnrDqrQR43cDDIRevltjpykhu5c6G3FFSIm0BZx+P+cKTPB/FmzRpYaYuzftuR/w//VF6WeJ+8gloADXjSaeZydr9YEVZQq/s7xuR8TlsmjZjhVbyBBSFbwNfLe5bd5L3PId0tE8bIXcDi/8TSM0Wdqdeu4EgW9hykLB+caEPspEFIgU7K/+eXC0e3aixGT/bHLpv3OnKa55n1DEc1ZBeW2+qKKs+ak0X17nX6TZXdx0PXCVYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 16:47:34 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 16:47:31 +0000
Content-Type: multipart/alternative;
 boundary="------------I8gpsUyPlQXPcYO7y8EbsA5m"
Message-ID: <7c922c5f-b179-459c-801d-b1303aaa0018@windriver.com>
Date: Mon, 18 May 2026 12:47:30 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] subversion: fix svn-revision.txt conflict
 between 32bit and 64bit packages
To: Haixiao.Yan.CN@windriver.com, openembedded-core@lists.openembedded.org
References: <20260515102141.3748275-1-haixiao.yan.cn@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260515102141.3748275-1-haixiao.yan.cn@windriver.com>
X-ClientProxiedBy: YT1PR01CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::7) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DM4PR11MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dac8949-532e-4acc-f3fa-08deb4fd2770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|8096899003|56012099003|22082099003|18002099003|13003099007|11063799003;
X-Microsoft-Antispam-Message-Info: 
	xN1MS+DqkhYkN3FaRma3mJzwH5X+rKlFJUmffUMupeZD5xf0RMv9rp3E+QA1awheqTKOPZI0Q31UbvDj+5gXj/B0WnYz5AQeHNDMfQ+qFp3df3eqf2P0krMvBP4WKHuQRBrs5j6JSYcVlC9huo/6jyTCD9ITSJjLVhksvdSgVaOTcTTyeDXsGROe7qwRNdZ/8XYkfXo7YMF6+zzMMTzsvyfb52gkMo+i6A4VzRwhzFlN6n8/X58o6V8uHE9tcHn5t2cPdLf1q4yw2yULdr8HzXtjw1MFfsRY1QlROAC9VpNn1g2TulsmOgKYAmhp1hrIsani3gBD7LbMIoptbftYC7pq834haZKwec3Z6rYcEKzzQE8mffFWHmWx5CO0HfORN5R0Cb5ay5OsXQdmPxAqxJ4x8L2iOhkhtm2NBnKLok5kL4SSBqbzGPlSUH3/6m2XLjJCUQj8RjIn6X3oonm1LfntC7hVF5lUE+ciH5B2vE/zXk5LDk0xPiLj49LavjyaUOYrDGjz10+ojJBKZbtsou6X1Jg1ttVaS5QOPS/ezrzWRx3gj8xBJKXBPi10TVea0KtnPUtDtAzVVjRyFWSt0a0bt5s4m98Vj4l7muWCzx0oes4cCaUJ8JNP37miQbDxVcZkPyMF9NI0WvlhG5a47A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(8096899003)(56012099003)(22082099003)(18002099003)(13003099007)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZHFEb3JLeVU1aEE0amZUekpucnJ4Mkg5TzNmbEV3cDZyRkphcVpGcUcydHlJ?=
 =?utf-8?B?TDBDZlR5ZEltV2YyQ0JuMTRJU0dESHJ1TDkxemhjMVFvVXhHZE9xeURkRjZD?=
 =?utf-8?B?Y2lPa1RTajk0N2RKWUhiU09iTUc4bkZiaVRuTXpPRzB3U0MwU0VHOXNiVzdk?=
 =?utf-8?B?MVdRQjBPWENZR1FiWStFQzUyVWpUSFNZRFp3M1pUdnl1cG9Fc2xPYzMzNE1r?=
 =?utf-8?B?T1RaZHRiWVQxQk5JLzRhRzZKTDJXaW5zR0JSeUtUMnVZQnJZWWFJTHJ5WENC?=
 =?utf-8?B?VTlIM21DZTZDVWRPcm1SZlB4bDNFUkFzeHNuR0NSa3hSL1k4NTdTdWlPUUND?=
 =?utf-8?B?WlUwV1d0L3lKYWlpSlN3QWoyd2NMMmdGVzRweUV1SEFsbXhQcTBLalVya1hS?=
 =?utf-8?B?U0wxTVBZQjNlemJXWUtpUXhwZ1Q2bXo3ZHdneVgvWENlZVRoUkV0enBZTGdL?=
 =?utf-8?B?Zy9lTHJPbS9FWWhJVk1UQmFMekdXWUhISnJvZnkyNU5LYWxFTnFJSkM0UWlJ?=
 =?utf-8?B?L1VncEI5OTR6cjFCZExQZ3ppZmdsNGtuVS83bHVCQ0VweVcrZEpmQ1gxRWQ0?=
 =?utf-8?B?RTh5L3VwNHZiWVZ1Vjl0empqeCt2K1FPdUpydGhEZC9mVDFsVFhwaVZwc3hP?=
 =?utf-8?B?d05Bc0xwa0xzWHFkT1hTRTVHSWdlRURRcFkxaGM3b2xHOWt6eTBpUVVzVVFZ?=
 =?utf-8?B?MTBYaU1XWVQ4Y2ROcXdObmVDbUROT3VaOFVlTitWOGltclRkTDhMMU1hUjhP?=
 =?utf-8?B?MkpjTmpucUpMdldLbE95THgycmtEUjBVSEtwQm1yN200L3ViMVpSSzZSVExK?=
 =?utf-8?B?ZVl6clp6elVTcmJNc2oyWkdHMXMxajhVelZrWjRwcnRFVmYrRTJrTGkwRkFV?=
 =?utf-8?B?SVhpSm9GMDV6dTdlMldOQmYwNXFteXJRZDByNDN1UTZKRmhzb05CMGRLMjRi?=
 =?utf-8?B?ZUtxUmJjSGJ4aE5jNVNsWmlOc1d2cVpCRVBSZ3ZxWWZYMk1VOFNHakpBUlpN?=
 =?utf-8?B?a3Ftb2RiV0VMS3lkV20vUXpxRlhicmRuc3NsNVBWUkZnTklYUERvMlhuN2RQ?=
 =?utf-8?B?MUROU1BLcnMrRnBqemxpVWJjZk1UL2FkR21ablE4SW5oZml0dXJCdkxuMnJ1?=
 =?utf-8?B?dEVSdFR6c1FSZWkydFdOR2JqSzlVNzRrZ2FGNTBncG9haXhLeit6YnZoS2tQ?=
 =?utf-8?B?bkZqVnYvSDJXbWF4aWloZWtmNzVNVWo2L3JhWTYyRE1iV1Y0SmE5ckVqeUVV?=
 =?utf-8?B?N1NPS2NOUG5rNEczd3hUZEJtekhoS1MzWlhodDJyRTBvY3BReUZSV2RBTWtM?=
 =?utf-8?B?YmdZK0dWamZqdzZmOXNKNEJnektCK0RLOVNMZkFRWjBlSlg4cHdsV01DVHFl?=
 =?utf-8?B?ZytMNUxtOHlPOEpVVGVWV2Y0b3JDNFltV3FnMWNoRk9kdnRJa0xCV1hIa20v?=
 =?utf-8?B?bitxWGdnOHp6WmR3dDJWcTJzQlVmSGswd3ZNa0M3RWdHMXU3NGZpNzMxQm9E?=
 =?utf-8?B?NE55bndWVTdxVzBmd1l0MHdLOEpSKzFSNllvK24venV0OW1lbU9YNWx6OGVW?=
 =?utf-8?B?SWpzQW05UVprUmRTbzE5MTMrbmFONm05a2tPSU5mRW50TFRzN0FGcEpXK3VP?=
 =?utf-8?B?UXZhNkxZUEtkVGZOZS9tTG5DY0J6VnIrSEpUTFd1ZUlPV2tFTHE0dDRKSjlM?=
 =?utf-8?B?cTVSTVAvT3FBZzV1Y3J4Nmk2OTdzaXdnckJzWU1DMjZhbHJqOFYrZUVWS0FP?=
 =?utf-8?B?QklneFA3RUVkSnhxRlNqRWFXbVFUUTF5emordGtDNHJjWkpMbEkwZ1FQdXEz?=
 =?utf-8?B?WVBrZnlHV0xGUXpsRXFxMGtYQW13ZHQ5S2FzVWVwKzlMUjJUUDVod2VqQzdv?=
 =?utf-8?B?dEpYRWppY00vRXBNclhsQzhxQXFKYWJMWGl3M0tjRTZWNldrd0pMK0liaFZT?=
 =?utf-8?B?cWxHNTN0UytUQVF0MWpDOVZaQzRhUHRGc3loaCtPZkYyL29MUW8wemV0VFlY?=
 =?utf-8?B?VlJzaTAwbWRodkI2S3JUUzJmcEMweEZSa25LRW1mbWdoQjIxNUFYMysvMFNw?=
 =?utf-8?B?SitsMmJKUHNHdXNHN21nVU5CQ1J0NHpJOUZlYXFJN012c0hHS0dIRkRHVmhV?=
 =?utf-8?B?QXU5Uy90MC9kL2E5ZW8vWW00eGZVV21tS0ZmditIUWcvcDQxbzZNdkVtUC92?=
 =?utf-8?B?c2F3Vms3NlRXcjRDSjdlWEVNUUhhS2lLMXE3czRDK0dWb0ZYNUgrU3NVU284?=
 =?utf-8?B?dzRaYlRUcmZ4dm9rcENsTWlSdFF4QkZVaTNFaDhzSlZJbEtxdGhXb3FURDRi?=
 =?utf-8?B?Qkt1bWgyUC9kWUJDbVgzbC9OYjdZdXJvd0ZzZU5WaVpHU0pSeEZ2bG9Uc3Mx?=
 =?utf-8?Q?0YIwG70nV5RgPBD0=3D?=
X-Exchange-RoutingPolicyChecked: 
	sokjdo9NthxizBjKoK/TdA9RN1lIlahSgnDmYfOnr1Wr93P4z3iM/UV3TKPeCnGZ+wZI53yL+Held0ZBYMBfaCEleI84NFQM9vwr7fwtSodT7AhIL07QQ0Aj1FkWJpA4u7p8+/jvqVy6UrZ8Y0iDLKNAMBKZh5ip7v2BD1kkI2aV1zx9+TE/xE8GO3EUrAHBL14uYEBjWcsrBaYTi6rsXB/xdY7THRlp3x7Or8loOecyIF6iwwyylX+UBgYpSh7Spf20xuW8rTq1uJZDRUqh7WMJ8C29S0JMMdCItGkj7zbazZ96BJdP5aj/5sh7u2y4IVrY8UQMbKw6EUeGM1pjCw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dac8949-532e-4acc-f3fa-08deb4fd2770
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 16:47:31.6136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPdu1HRxx6WWcIaT0tfQXHi4fqzEa0URmdhkYuupjcnLALp3kQzhsbsH9vvFnSSp+OqzrwaqBi7CL6MfpWfmeMcloV3xARPL04xZFDNvNwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
X-Proofpoint-ORIG-GUID: e124T00Izu72QsbP-pMzSwZABYGUW5Id
X-Proofpoint-GUID: e124T00Izu72QsbP-pMzSwZABYGUW5Id
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2NCBTYWx0ZWRfX3izPp3oJ7jeV
 MBO6ikq07sD2kGRtIGpqM8ZTQIu4eFdop4BgAhk3f0LCyIykO8IyDIQZdqe3mxeOJ+qBHIY+0Wx
 ujM0MzyWRfCRLSG+6JBrpQmnu5I2sBbf3VM3TzzPOiZww+cFfPWrvi0XNo+fazKfmdS1EoBUdd/
 SyQUPSAm4d+KuW8wtBjaolIgdNHrMV245gIZXKsgn+IKyRHyDrfQ83Ke4ag1XZTYYEY8ZqjPD4v
 mYRvTGAy071Yz2SiW5vkM4VAeMyAfECMLkny8djH48LDtPPzrVlKALUjgMSe1pGWCdfZIg5/wac
 2OeX+LI+AeAHdd2LPfPisP1gqvLwXOcfpqbndRvsM0XzDiZp39Hhfdf0LEQEp/G558nfxaKY7Ww
 OcWVLIhPSdHV4ZJE/nLZsq/I4U1egAWrr3axolRCXKvOR2ob40ekxs2fBsnOIzxX9g8plJIyYtS
 x5wQgRFprQRXwwUao4g==
X-Authority-Analysis: v=2.4 cv=dK2WXuZb c=1 sm=1 tr=0 ts=6a0b42aa cx=c_pps
 a=ZVLNonFp53krOPJecICuKg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=AwNzkC1ORil3lq_ObA4A:9 a=QEXdDO2ut3YA:10
 a=S6Cj1v8LOazCiLCEZ7wA:9 a=5tB9gHphUZYaJahP:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 16:47:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237253

--------------I8gpsUyPlQXPcYO7y8EbsA5m
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAyNi0wNS0xNSAwNjoyMSwgWWFuLCBIYWl4aWFvIChDTikgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgd3JvdGU6DQo+IEZyb206IEhhaXhpYW8gWWFuPGhhaXhpYW8ueWFuLmNu
QHdpbmRyaXZlci5jb20+DQo+DQo+IFdoZW4gdGhlIGJ1aWxkIGhvc3QgaGFzIGxpYmFwcjEt
ZGV2IGluc3RhbGxlZCAoZS5nLiBVYnVudHUgMjQuMDQpLCB0aGUNCj4gY3Jvc3MtY29tcGls
ZWQgc3ZudmVyc2lvbiBiaW5hcnkgY2FuIHVuZXhwZWN0ZWRseSBleGVjdXRlIG9uIHRoZSBo
b3N0IGR1cmluZw0KDQpIYWl4aWFvLA0KDQpQbGVhc2UgZml4IHRoZSB1bmRlcmx5aW5nIGNh
dXNlIG9mIHRoZSBwcm9ibGVtICh3ZSBzaG91bGQgbm90IGJlIA0KYWZmZWN0ZWQgYnkgd2hh
dCBpcyBpbnN0YWxsZWQgb24gdGhlIGhvc3QpDQpyYXRoZXIgdGhhbiBkZXRlY3RpbmcgYW5k
IGF2b2lkaW5nIGl0Lg0KDQouLi9SYW5keQ0KDQoNCj4gZG9faW5zdGFsbCwgcHJvZHVjaW5n
ICJVbnZlcnNpb25lZCBkaXJlY3RvcnkiIGluIHRoZSA2NGJpdCBidWlsZCB3aGlsZSB0aGUN
Cj4gMzJiaXQgYnVpbGQgZmFsbHMgYmFjayB0byAidW5rbm93biIuIFRoZSBkaWZmZXJpbmcg
Y29udGVudCBjYXVzZXMgYW4gUlBNIGZpbGUNCj4gY29uZmxpY3Qgb24gL3Vzci9pbmNsdWRl
L3N1YnZlcnNpb24tMS9zdm4tcmV2aXNpb24udHh0IHdoZW4gaW5zdGFsbGluZw0KPiBsaWIz
Mi1zdWJ2ZXJzaW9uLWRldiBhbmQgc3VidmVyc2lvbi1kZXYgdG9nZXRoZXIgaW4gZG9fcm9v
dGZzLg0KPg0KPiBGb3JjZSB0aGUgZmlsZSBjb250ZW50IHRvICJ1bmtub3duIiBzaW5jZSB0
aGUgc291cmNlIGlzIGEgdGFyYmFsbCB3aXRoIG5vIFNWTg0KPiBtZXRhZGF0YS4NCj4NCj4g
U2lnbmVkLW9mZi1ieTogSGFpeGlhbyBZYW48aGFpeGlhby55YW4uY25Ad2luZHJpdmVyLmNv
bT4NCj4gLS0tDQo+ICAgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N1YnZlcnNpb24vc3VidmVy
c2lvbl8xLjE0LjUuYmIgfCA0ICsrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3VidmVy
c2lvbi9zdWJ2ZXJzaW9uXzEuMTQuNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdWJ2
ZXJzaW9uL3N1YnZlcnNpb25fMS4xNC41LmJiDQo+IGluZGV4IDEzYmVjNGFkNTk1Ni4uNDU0
NWNjZjZjNTMyIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3VidmVy
c2lvbi9zdWJ2ZXJzaW9uXzEuMTQuNS5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvc3VidmVyc2lvbi9zdWJ2ZXJzaW9uXzEuMTQuNS5iYg0KPiBAQCAtNDksNiArNDksMTAg
QEAgZG9fY29uZmlndXJlOnByZXBlbmQgKCkgew0KPiAgICAgICBjcCAtZiAke1NUQUdJTkdf
REFUQURJUn0vYWNsb2NhbC9saWJ0b29sLm00ICR7U1RBR0lOR19EQVRBRElSfS9hY2xvY2Fs
L2x0Ki5tNCAke1N9L2J1aWxkLw0KPiAgIH0NCj4gICANCj4gK2RvX2luc3RhbGw6YXBwZW5k
KCkgew0KPiArICAgIGVjaG8gInVua25vd24iID4gJHtEfSR7aW5jbHVkZWRpcn0vc3VidmVy
c2lvbi0xL3N2bi1yZXZpc2lvbi50eHQNCj4gK30NCj4gKw0KPiAgICN8IHg4Nl82NC1saW51
eC1saWJ0b29sOiBpbnN0YWxsOiB3YXJuaW5nOiBgL2hvbWUvcG9reWJ1aWxkL3lvY3RvLWF1
dG9idWlsZGVyL3lvY3RvLXdvcmtlci9uaWdodGx5LXFhLWxvZ3JvdGF0ZS9idWlsZC9idWls
ZC90bXAvd29yay94ODZfNjQtbGludXgvc3VidmVyc2lvbi1uYXRpdmUvMS44LjktcjAvYnVp
bGQvc3VidmVyc2lvbi9saWJzdm5fcmFfbG9jYWwvbGlic3ZuX3JhX2xvY2FsLTEubGEnIGhh
cyBub3QgYmVlbiBpbnN0YWxsZWQgaW4gYC9ob21lL3Bva3lidWlsZC95b2N0by1hdXRvYnVp
bGRlci95b2N0by13b3JrZXIvbmlnaHRseS1xYS1sb2dyb3RhdGUvYnVpbGQvYnVpbGQvdG1w
L3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3IvbGliJ3wgeDg2XzY0LWxpbnV4LWxpYnRvb2w6
IGluc3RhbGw6IHdhcm5pbmc6IGAvaG9tZS9wb2t5YnVpbGQveW9jdG8tYXV0b2J1aWxkZXIv
eW9jdG8td29ya2VyL25pZ2h0bHktcWEtbG9ncm90YXRlL2J1aWxkL2J1aWxkL3RtcC93b3Jr
L3g4Nl82NC1saW51eC9zdWJ2ZXJzaW9uLW5hdGl2ZS8xLjguOS1yMC9idWlsZC9zdWJ2ZXJz
aW9uL2xpYnN2bl9yZXBvcy9saWJzdm5fcmVwb3MtMS5sYScgaGFzIG5vdCBiZWVuIGluc3Rh
bGxlZCBpbiBgL2hvbWUvcG9reWJ1aWxkL3lvY3RvLWF1dG9idWlsZGVyL3lvY3RvLXdvcmtl
ci9uaWdodGx5LXFhLWxvZ3JvdGF0ZS9idWlsZC9idWlsZC90bXAvc3lzcm9vdHMveDg2XzY0
LWxpbnV4L3Vzci9saWInfCAvdXNyL2Jpbi9sZDogY2Fubm90IGZpbmQgLWxzdm5fZGVsdGEt
MXwgY29sbGVjdDI6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXN8IHg4Nl82NC1saW51eC1s
aWJ0b29sOiBpbnN0YWxsOiB3YXJuaW5nOiBgL2hvbWUvcG9reWJ1aWxkL3lvY3RvLWF1dG9i
dWlsZGVyL3lvY3RvLXdvcmtlci9uaWdodGx5LXFhLWxvZ3JvdGF0ZS9idWlsZC9idWlsZC90
bXAvd29yay94ODZfNjQtbGludXgvc3VidmVyc2lvbi1uYXRpdmUvMS44LjktcjAvYnVpbGQv
c3VidmVyc2lvbi9saWJzdm5fcmFfc3ZuL2xpYnN2bl9yYV9zdm4tMS5sYScgaGFzIG5vdCBi
ZWVuIGluc3RhbGxlZCBpbiBgL2hvbWUvcG9reWJ1aWxkL3lvY3RvLWF1dG9idWlsZGVyL3lv
Y3RvLXdvcmtlci9uaWdodGx5LXFhLWxvZ3JvdGF0ZS9idWlsZC9idWlsZC90bXAvc3lzcm9v
dHMveDg2XzY0LWxpbnV4L3Vzci9saWInfCB4ODZfNjQtbGludXgtbGlidG9vbDogaW5zdGFs
bDogd2FybmluZzogYC9ob21lL3Bva3lidWlsZC95b2N0by1hdXRvYnVpbGRlci95b2N0by13
b3JrZXIvbmlnaHRseS1xYS1sb2dyb3RhdGUvYnVpbGQvYnVpbGQvdG1wL3dvcmsveDg2XzY0
LWxpbnV4L3N1YnZlcnNpb24tbmF0aXZlLzEuOC45LXIwL2J1aWxkL3N1YnZlcnNpb24vbGli
c3ZuX3JhX3NlcmYvbGlic3ZuX3JhX3NlcmYtMS5sYScgaGFzIG5vdCBiZWVuIGluc3RhbGxl
ZCBpbiBgL2hvbWUvcG9reWJ1aWxkL3lvY3RvLWF1dG9idWlsZGVyL3lvY3RvLXdvcmtlci9u
aWdodGx5LXFhLWxvZ3JvdGF0ZS9idWlsZC9idWlsZC90bXAvc3lzcm9vdHMveDg2XzY0LWxp
bnV4L3Vzci9saWInDQo+ICAgI3wgeDg2XzY0LWxpbnV4LWxpYnRvb2w6IGluc3RhbGw6IGVy
cm9yOiByZWxpbmsgYGxpYnN2bl9yYV9zZXJmLTEubGEnIHdpdGggdGhlIGFib3ZlIGNvbW1h
bmQgYmVmb3JlIGluc3RhbGxpbmcgaXQNCj4gICAjfCB4ODZfNjQtbGludXgtbGlidG9vbDog
aW5zdGFsbDogd2FybmluZzogYC4uLy4uL3N1YnZlcnNpb24vbGlic3ZuX3JlcG9zL2xpYnN2
bl9yZXBvcy0xLmxhJyBoYXMgbm90IGJlZW4gaW5zdGFsbGVkIGluIGAvaG9tZS9wb2t5YnVp
bGQveW9jdG8tYXV0b2J1aWxkZXIveW9jdG8td29ya2VyL25pZ2h0bHktcWEtbG9ncm90YXRl
L2J1aWxkL2J1aWxkL3RtcC9zeXNyb290cy94ODZfNjQtbGludXgvdXNyL2xpYicNCj4NCj4g
LT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNz
YWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMjM3MDc3
KTpodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9t
ZXNzYWdlLzIzNzA3Nw0KPiBNdXRlIFRoaXMgVG9waWM6aHR0cHM6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL210LzExOTMyNzM5Ny8zNjE2NzY1DQo+IEdyb3VwIE93bmVyOm9wZW5lbWJl
ZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5z
dWIgW3JhbmR5Lm1hY2xlb2RAd2luZHJpdmVyLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09
LT0tPS0NCj4NCg0KLS0gDQojIFJhbmR5IE1hY0xlb2QNCiMgV2luZCBSaXZlciBMaW51eA0K
DQo=
--------------I8gpsUyPlQXPcYO7y8EbsA5m
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <head>

   =20
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2026-05-15 06:21, Yan, Haixiao (CN)
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20260515102141.3748275-1-haixiao.=
yan.cn@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Haixiao Yan <a class=3D"=
moz-txt-link-rfc2396E" href=3D"mailto:haixiao.yan.cn@windriver.com">&lt;hai=
xiao.yan.cn@windriver.com&gt;</a>

When the build host has libapr1-dev installed (e.g. Ubuntu 24.04), the
cross-compiled svnversion binary can unexpectedly execute on the host durin=
g</pre>
    </blockquote>
    <p>Haixiao,</p>
    <p>Please fix the underlying cause of the problem (we should not be
      affected by what is installed on the host)<br>
      rather than detecting and avoiding it.<br>
      <br>
      ../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20260515102141.3748275-1-haixiao.=
yan.cn@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
do_install, producing &quot;Unversioned directory&quot; in the 64bit build =
while the
32bit build falls back to &quot;unknown&quot;. The differing content causes=
 an RPM file
conflict on /usr/include/subversion-1/svn-revision.txt when installing
lib32-subversion-dev and subversion-dev together in do_rootfs.

Force the file content to &quot;unknown&quot; since the source is a tarball=
 with no SVN
metadata.

Signed-off-by: Haixiao Yan <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:haixiao.yan.cn@windriver.com">&lt;haixiao.yan.cn@windriver.com&gt;</a>
---
 meta/recipes-devtools/subversion/subversion_1.14.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/subversion/subversion_1.14.5.bb b/meta/r=
ecipes-devtools/subversion/subversion_1.14.5.bb
index 13bec4ad5956..4545ccf6c532 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.5.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
@@ -49,6 +49,10 @@ do_configure:prepend () {
     cp -f ${STAGING_DATADIR}/aclocal/libtool.m4 ${STAGING_DATADIR}/aclocal=
/lt*.m4 ${S}/build/
 }
=20
+do_install:append() {
+    echo &quot;unknown&quot; &gt; ${D}${includedir}/subversion-1/svn-revis=
ion.txt
+}
+
 #| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuil=
der/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/sub=
version-native/1.8.9-r0/build/subversion/libsvn_ra_local/libsvn_ra_local-1.=
la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-work=
er/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86=
_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yoc=
to-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion=
-native/1.8.9-r0/build/subversion/libsvn_repos/libsvn_repos-1.la' has not b=
een installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa=
-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| /usr/bin/ld: can=
not find -lsvn_delta-1| collect2: ld returned 1 exit status| x86_64-linux-l=
ibtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/n=
ightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8=
.9-r0/build/subversion/libsvn_ra_svn/libsvn_ra_svn-1.la' has not been insta=
lled in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotat=
e/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86_64-linux-libtool: ins=
tall: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-l=
ogrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build=
/subversion/libsvn_ra_serf/libsvn_ra_serf-1.la' has not been installed in `=
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/b=
uild/tmp/sysroots/x86_64-linux/usr/lib'
 #| x86_64-linux-libtool: install: error: relink `libsvn_ra_serf-1.la' with=
 the above command before installing it
 #| x86_64-linux-libtool: install: warning: `../../subversion/libsvn_repos/=
libsvn_repos-1.la' has not been installed in `/home/pokybuild/yocto-autobui=
lder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linu=
x/usr/lib'
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#237077): <a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://lists.openembedded.org/g/openembedded-core/message/237077">https://lis=
ts.openembedded.org/g/openembedded-core/message/237077</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.o=
penembedded.org/mt/119327397/3616765">https://lists.openembedded.org/mt/119=
327397/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openembed=
ded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openem=
bedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.opene=
mbedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/ope=
nembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D"mai=
lto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------I8gpsUyPlQXPcYO7y8EbsA5m--

