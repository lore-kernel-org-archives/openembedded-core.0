Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFB7FF8867
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 06:30:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5677.1777444241172023885
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 23:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=sa/9IoLE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9579970def=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T55LZZ1564853
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 06:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=BMvf0/b37jaed3p7QQjnJp
	b9qsj1FrWNyBWKyEYt7XM=; b=sa/9IoLEaoVJ7La97Ew1EiI71cIs3GgdI8DUAm
	jCY6AwHbcN8VQYlfLwfBYXgWQvJBN9OZxxMvGZ/GwvrWAT91yMaWD+V++b77DlPm
	WJlflERU6uPN9x5lGvwYbCWlToGTQOsNnJBV+b5dLIgAbMc8kiQTanFDQ7hG2UzU
	d3+HpX4mVf+k4l6uu/n4XQRLe1Pj8mL7LbDfQym2iRriWtqCUCQucWxKtFX2UCXA
	ebVyfv85RjgfWn/KsZ8ZG2bj/9lpblnS3FWgbcCKOEDlKzbhw2RczwhKCqJXQ4z2
	2rgpm+L2EAn8o0z+1aY6Bjgws8YKTwI6QqbAcUWeov5zdYEA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011034.outbound.protection.outlook.com [52.101.52.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drmk6vhbc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Apr 2026 06:30:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVopYc8IgT8VbTdVq/z8UX/q7WiiI1hXyHBP73sgE0qqZ3u/8O6Avz8T3IlUVcPHNEYD4Dw345tv6fDekHhSmOI8dil0SBQyDPQ6ZLsEeTMS6TT0cz77clfup5AFf24x1fRHuXDkDvr5EX8A31lR80Ng2Jx8Jr+NaX0xIQxKI9rcWHGoVt0YfnMd12E9gBahCQ02b244KuQtZAje1CipRmFZDqD5BvLrpyopH2lOt9gQwTiNpYP+XnJMB/jD3GZ8Ke15i1VvR5aDbUnnJxyeZ9V3ESEK0tAz4gGUseLX6uHBKo/Xtftt6ylKz/kGrtA8+3GFVjqa6158GoaFDTy/WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMvf0/b37jaed3p7QQjnJpb9qsj1FrWNyBWKyEYt7XM=;
 b=RacLNN9tVN5sMuO/pZZB03Q/X0H6cDmIMcYS+192aHbxPcAUlDBGkbQ39dxybaLVQtzKYiOniF3um6yx5UkbsaKoHG9A3NEbN7CvPmt3bSPIrMdtFUfwMC84jeRC88CucYrwJzGmsiztyevSDYTqr6ZdYpinKOHk52Ii3/ABXu6BvIulzt4uy0lpflMhaW15GT7D/Hfp9lSA733/jKk0KFWwR/4IV5OpVh8023FJmAWp+zBIpBFRX/a5Vivg7jfZQAJpAZBZQfozHrdJDo1NeXgNki88AWLIyxBcgaxFR4u85B0BhlplGKrJ9UtygsO1bEqL0EwhBPxbn8C3DIAJqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA1PR11MB7319.namprd11.prod.outlook.com (2603:10b6:208:425::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 06:30:36 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 06:30:36 +0000
Content-Type: multipart/alternative;
 boundary="------------HZYv39LJhAda8MjTTjnsrAyS"
Message-ID: <c6a4b20b-abe1-4ec8-89d2-57463a0fde97@windriver.com>
Date: Wed, 29 Apr 2026 14:30:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH 3/4] libsoup-2.4: fix CVE-2025-14523
To: Yoann Congal <yoann.congal@smile.fr>
References: <20260429061533.858115-1-changqing.li@windriver.com>
 <18AABF512DC5339B.2390993@lists.openembedded.org>
Content-Language: en-US
Cc: OE-core <openembedded-core@lists.openembedded.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <18AABF512DC5339B.2390993@lists.openembedded.org>
X-ClientProxiedBy: SEWP216CA0082.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bc::15) To CH3PR11MB7297.namprd11.prod.outlook.com
 (2603:10b6:610:140::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA1PR11MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: 9922135f-283e-4336-cac8-08dea5b8d2b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|8096899003|22082099003|56012099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	sBt7Eah5J4TCE8IzcpytZ5GjREat2mycWF4haacKIs9SrjD9ZPG5Gx0xqPDuZes8Hv7lrte/5/wwgJbYn3A2tFXxFGPYItBMz1dsPe+zBY+71yhGCokaRxyHGkxlljp3YPNvRt18QXuEBkO6EAg81JDIrNpTR7VeqCgl2YJlB8ovVIXDcqtukbgXn5Ll3FcnYv4++RGoULSvx/y/mtXYr7Z9VCLVEPhcw/3NXgYMxZhxlzl01VBs70AelzpACJisW/oEc3pND4zfWIQmvLNpAFQdaLAAJJHII4PHiyfRLMpFXMF2yrJkJB9OrqbStTRx4vlIU54kNNUjtP2HT5uCaKVBlHtS4Vbl1kexy2MaKQBkknjtYEljjQmrlUMxtSZhH68SJBWe7bbhpY8cPtAEPB31TRxUbZjIZwyZfxDBdg4q7ckaN3qha8D2Qte7y4hDYZIfi+N5puvnKxUIQk6ddRKoLgDs88MaIKCD4sQi5tvtFQflOqGVc2wlodYsgQHrhNuVqLXZBjR9m36shjTuToKggJMgbP7Kw9IRIwxpVsiKnLIwUj9/NJQQ1x3tlN303bl4nxaxwUSS88NEVCMFyFvbWNFn4seQgGiiZ/rspU215zlumMCmck2sZCrvZRlgd0aEGLOlrzAZtCaXmK7Xty/eDMn6j97PCy6GFpBs7eP49DZJcX/sJzxid+2BD7nV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(8096899003)(22082099003)(56012099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VWlBbXpocTZGdVhmajRiNFBRamFJS1ZLc0NUTGRwT05lZ2ZhVTZYU2pzR090?=
 =?utf-8?B?ZmZoRVN6RHhjZEpLZFpyTnRXcHk5K3pNeTFXSGFNYlVLVE9NK05kZEUzVlJk?=
 =?utf-8?B?MU9jSmhXY29OeEErb2NrTU11WXdoWGp0SWR6UktxYVR3bktTR3ZSNHI5KzJM?=
 =?utf-8?B?U2xNMlNoemRFaEhJbjNMNFMxMExocFA1cnFkbXlTU2tPMTJiT2gzbkdYdUkw?=
 =?utf-8?B?QThUTUpPZVY1T0dDNEZNT2lraDlFYmNXTHlQa0doTUZUVXc2S2JPTUc1L3Jz?=
 =?utf-8?B?NERialR4dEhSRVl6eThwTEErU0c0Nml1REQvYkVpUmVabFVVK3l5RituUG9s?=
 =?utf-8?B?clFLNGpjMC9aeC9RY1lpL1RES2h5c2FnV0orVVczbjhGTTlXNWlDbko0aVFp?=
 =?utf-8?B?cDNqSkMxL0RWc1VsQS9nOEVOTEx3U25oQ2U5eHhlT3Q4dEFZZXR1V3NKSkxh?=
 =?utf-8?B?Y0RtSHZsdkkwdnVsSHZZOXdSdzFZQm5MeDVRY1Y4TWVTU0wzN3AvTStnOVZ4?=
 =?utf-8?B?Q2NhZ1Uwdk1ENTI0YkFzVk9hVG9saVNLM25veWJma2FnMk41VjBxRUh4Smlu?=
 =?utf-8?B?ZTVBWk5FVUp0WmgvK3NNbmpJRU9LQTB4c0VqbW1oeVBGSFhnTVk2ZnJ4cVdM?=
 =?utf-8?B?TUxoaEQ0ak00THBqVGRKVVpTODE5UjZhUFoxb3ZtZGxhdHNiZTVQY1NhTHFT?=
 =?utf-8?B?YVc5RmNqT3FjZDF0WEJZUFJ0bUg5RWhJa2Q0YWR2TUl1Z1htUFVRSzJQODZX?=
 =?utf-8?B?STFHWUlzaUVlWEl3ZnJqekJOVGZLZ0hDdmMyNXluVEdTTUlFdlRYYmdPTHIw?=
 =?utf-8?B?ZTF5dXpUaEpqUUo5QmczM0hNQlNGWFhjTHFuc0lKRkdvSXNhK05nd1JkMEpx?=
 =?utf-8?B?MTBYeHRLbXpKQ3RVMWNWMVVmOWtaZUtSbVNwRlREY3IzSlpUWE1SY3FvL1g2?=
 =?utf-8?B?bXo2cUlaSk5zdzNlUHFDVWJPb3o0SWROL3M5c3lSL0FYZ3dLZXhPWk9UY3c3?=
 =?utf-8?B?b0FMNHorYWF4eTNLSEozOUE0bXY5WWVOcjlaQUpxcGl3Kzc5Y1lVeWllcXZC?=
 =?utf-8?B?ZHhYVE1rMU85YjFWYzdFOG1sa3lKOGRYbWJyZjBiRDIwQzZCVWhuRW4yZWpP?=
 =?utf-8?B?U0FoTCsyZUk0VzJiTW45TVpVOW9GVGZkcWRiUUJvVjdneDhESHZERnBPWlQz?=
 =?utf-8?B?WFEvNUQvRlZpOU9yV1hvc3YwQ1BVbml1RTMrVy9rTUJDZkREMWVDS1NHMlMv?=
 =?utf-8?B?dkVJeVpGelZMb3EwbzQrMXZ4dEZMYzY0WElGb1k0djB6cEd6WWpBck1MNE9n?=
 =?utf-8?B?bTNlL2liZFFxWTJiZ2RLV0NFRU9DWDhGV3gxN0Q1TENjS1loeE5QNG5WbmRB?=
 =?utf-8?B?d3kzSnhaWnFyaDA5VkN3SUluOHF2UjUvWWp3T0FjendHQXYydUpiUWlFRlpq?=
 =?utf-8?B?bjFWYzNicURUY1lhUmJ2Tkh3N1dHZytzYVRZTnNGNzE3RFJCd3h0YXpFdkor?=
 =?utf-8?B?dmdTMi9iYnJDeVBYRDhtdVhQS2d5U1pxQ0hrMmpScjl0V29CTWxSNkxjQ1FK?=
 =?utf-8?B?R0NvcGM4NURaem9vMjh0bFFuNVJaSE5jT1M4ODBrTEF1L0lBdzRTSVdsemlN?=
 =?utf-8?B?ZE1TVlAxUlRabk84b3BqRGVsUlQxRXIvQmZDSHNWdnhZMEFKUzZrOTFUaEUx?=
 =?utf-8?B?dDEzcXlGbjJuaVI0RTFwTVRCbStwN1I5RFU5ZERtcVRMRFBpcWVtcVZ6NCtr?=
 =?utf-8?B?alpaeGIzUUkxSDhYNWJqNk1tUmg2QTJiUmpuRk50clVoelNNVHNZRVZBTlVG?=
 =?utf-8?B?UnJZQVhwNnVRL3QyWHlYSjJTZzRvOWJ0cjNxRGZma21tV28wTWVUa1FLZ1h5?=
 =?utf-8?B?a2JLSlE2WUV4TWhvdUtmYXpjcDlmcHRxWjdzSzFHaVgwSHhWNE91bUJGdWtB?=
 =?utf-8?B?WU45N2pHaExBT0ZxNGY5b0c1QUlLaDdyL3BmV204dVlnSm1lT3E3ZGIzeG5h?=
 =?utf-8?B?WEtMNXJpbkFmSWpUbHlSU012QVdFNWM0TlczaEdtYWNabVc3bE93QmkzRnFm?=
 =?utf-8?B?TkxzRjRLMEpVOTJWMlV0ckJrSVV3T21pamhaNExDWm9VTk5lRjBxZ3FsMkwz?=
 =?utf-8?B?KzVMczNwMnN6L01mRXY1OHMzVmcvZFQ1UnhaenQ1STNYREpXbVRYUmJzYitz?=
 =?utf-8?B?K21nL0xCdWFNWmNaS0xmZ05qZ0J5eGNXVUpYM01RcVpoL0FEWmxDZnpaQ0Zp?=
 =?utf-8?B?ZG9zRkZSRkx1WkpnRlV4eFNQS083T1JFaVBlaUJQdm42YjNZeVFRTVBySzlK?=
 =?utf-8?B?S0hFcTdMeDlUN05lOXB5SGJTREFDb1FBR2wrTzVwL1BnNW4yay80ODdBWVQz?=
 =?utf-8?Q?X26Jhw3FWOTdseoY=3D?=
X-Exchange-RoutingPolicyChecked: 
	cSG4hPAfLuWPuFTM7uUFS8xPu30G7gLrrIjEGW9PKgRzQRk2cNPu44Pjtpo5HDIJoVajvNMSQxmjJYalOou7FSpkS/UShtjJAqdIeyWLpFWCmHaZrO+A+EhRn2dahIMZ/9N/25wFazSWrdoPzzXeXTvrOhRbLPZeTV8xFTP2T7BhgFdbpPD1o+DXsKI4T6yQnvl8Ue/zX4L8qzCNN5Bdp5T+Kg/2UnSlpLhu04EPfjnDbCJfWPvMTmosIzdkWinalquS3OkqfkH5vjxz8zJ43r+4TOihZ5fHaKWhoBymSGDypwNUVnChtxQEex98vVUk/yPaT/tqzFoc3fLP2DGEBA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9922135f-283e-4336-cac8-08dea5b8d2b3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7297.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:30:36.7912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OYbpebh864TJw6gcdIAdEcdo3SyIQrIHQ413mwQYV+4NAIwEw+1UU2bEqcj4MzybQSLqRFoyCYRd0/I7mpgWp0wy2PfMiQGl1c4dWK2Mts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7319
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 5Q2y5sgcMBhmTC_P0V1dCrLd4oiOWbg-
X-Proofpoint-GUID: iFmhj5KF1-ZQBMiDhwaPg5F8XysdGfxd
X-Authority-Analysis: v=2.4 cv=RN6D2Yi+ c=1 sm=1 tr=0 ts=69f1a58f cx=c_pps
 a=8o+REoaIO3XrXU6fRoneHA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=GHR8O2WEAAAA:20
 a=LRLYrf9nAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=rWoYLi1WtUZQ4S1PAs8A:9
 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hcKQafzR5jIi97y3eM0A:9 a=yrrzdD5awDnzQI7N:21 a=_W_S_7VecoQA:10
 a=ctNd1-se8QBkj9sPkfQg:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2MSBTYWx0ZWRfX/GB5LktP4QGw
 zHmiX7JJzZTn8pT1udKWs9n8EtVU2P7BsjghTvTFzUCWbvQeTziKzVh7czuFUcmQ/SBgzCDe3m6
 qxG59YOEUdoQgbHiqvI1m1H5oP/Bv89OytZc/pgrUAAsXYVG6gi9Q4+vYLgA3MV5TQ1x+kjHMvR
 2EW7tWZjiQgia5BcGX/B/xeAVRNRDMBvHlPOyhNWrFy6aQHJXRKtOKf6jHaf5sAuyhXQ3DQqIhJ
 bewke3pkVhbB4rqU8s46VZEWw4QuvepgqN6mvElntokUuG9lhoou5VafRVcEHrm/qKyEBBNX+Ru
 rdV/sdabKfq+5UxJlRmW4wzUHzUPSAmWi2zmF++pcBN7LPHIW+z9+eoyOS5+AWYj5Oaq0UqJ7Z4
 edOX7F7nolMimERQwSdsgGaTW6BtzOjhegz1qyWGby1tXrdT5IZj4cTssTieFbP09w3xXsHYkwu
 wQarNN/32kPs9rfcZGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 06:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236081

--------------HZYv39LJhAda8MjTTjnsrAyS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 63T55LZZ1564853

On 4/29/26 14:15, Changqing Li via lists.openembedded.org wrote:
> Refer:
> https://gitlab.gnome.org/GNOME/libsoup/-/work_items/472
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   .../libsoup/libsoup-2.4/CVE-2025-14523.patch  | 52 ++++++++++++++++++=
+
>   .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
>   2 files changed, 53 insertions(+)
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-=
14523.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.pa=
tch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
> new file mode 100644
> index 0000000000..0f1d751aeb
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
> @@ -0,0 +1,52 @@
> +From d6028a6e6a8417b7fb6c89f6c10fb94781435ee6 Mon Sep 17 00:00:00 2001
> +From: Changqing Li<changqing.li@windriver.com>
> +Date: Wed, 4 Feb 2026 15:08:50 +0800
> +Subject: [PATCH] Reject duplicate Host headers (for libsoup 2)
> +
> +This is a simplified version of my patch for libsoup 3:
> +
> +!491
> +
> +Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsoup/-/c=
ommit/d3db5a6f8f03e1f0133754872877c92c0284c472]
> +CVE: CVE-2025-14523
> +
> +This patch is a MR for branch 2-74, but not merged yet, maybe it will
> +not be merged.

Hi, Yoann

You have mentioned your concern about this not merged commit,=C2=A0 so I =
do=20
some tests with these patch series to help

you decide if we will merge this.

For libsoup2/libsoup3 I have test POC of CVE-2025-14523 and CVE-2025-3204=
9.

CVE-2025-14523:

without this patch:

root@qemux86-64:~# ./host_svr listening on http://127.0.0.1:33339=20
libsoup parsed Host=3D b.local

With this patch, the duplicated header request is rejected:

# printf "GET /whoami HTTP/1.1\r\nHost: a.local:%d\r\nHost:=20
b.local:%d\r\nConnection: close\r\n\r\n" $PORT_A $PORT_B | nc 127.0.0.1=20
8081 HTTP/1.1 400 Bad Request Server: Server Content-Length: 0

CVE-2025-32049:

without this patch:

root@qemux86-64:~# ./ws-server-3
(process:361): GLib-ERROR **: 08:03:32.913: adding 98303 to array would=20
overflow
[=C2=A0 182.528155] traps: ws-server[361] trap int3 ip:7f35f4a91ca7=20
sp:7ffe41212800 error:0 in libglib-2.0.so.0.7800.6[7f35f4a4e000+97000]
Trace/breakpoint trap

with this patch, the connection closed and no traps.

HTTP/1.1 101 Switching Protocols
Server: ws-server
Date: Wed, 29 Apr 2026 05:05:28 GMT
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Accept: s3pPLMBiTxaQ9kYGzzhZRbK+xOo=3D


Traceback (most recent call last):
 =C2=A0 File "/home/root/test.py", line 31, in <module>
 =C2=A0 =C2=A0 s.send(fragmented_frame)
ConnectionResetError: [Errno 104] Connection reset by peer

And also run the tests in the repo, at least no regression. Those failed=20
test

maybe caused since not suitable for the test env, I did not=C2=A0 deep in=
to=20
them.

//Changqing

> +
> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
> +---
> + libsoup/soup-headers.c         | 3 +++
> + libsoup/soup-message-headers.c | 3 +++
> + 2 files changed, 6 insertions(+)
> +
> +diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
> +index ea2f986..6cd3dad 100644
> +--- a/libsoup/soup-headers.c
> ++++ b/libsoup/soup-headers.c
> +@@ -138,6 +138,9 @@ soup_headers_parse (const char *str, int len, Soup=
MessageHeaders *dest)
> + 		for (p =3D strchr (value, '\r'); p; p =3D strchr (p, '\r'))
> + 			*p =3D ' ';
> +
> ++		if (g_ascii_strcasecmp (name, "Host") =3D=3D 0 && soup_message_head=
ers_get_one (dest, "Host"))
> ++			goto done;
> ++
> + 		soup_message_headers_append (dest, name, value);
> +         }
> + 	success =3D TRUE;
> +diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-hea=
ders.c
> +index f612bff..bb20bbb 100644
> +--- a/libsoup/soup-message-headers.c
> ++++ b/libsoup/soup-message-headers.c
> +@@ -220,6 +220,9 @@ soup_message_headers_append (SoupMessageHeaders *h=
drs,
> + 	}
> + #endif
> +
> ++	if (g_ascii_strcasecmp (name, "Host") =3D=3D 0 && soup_message_heade=
rs_get_one (hdrs, "Host"))
> ++		return;
> ++
> + 	header.name =3D intern_header_name (name, &setter);
> + 	header.value =3D g_strdup (value);
> + 	g_array_append_val (hdrs->array, header);
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/=
recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> index 7e00cd678a..253a389e21 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> @@ -41,6 +41,7 @@ SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libs=
oup-${PV}.tar.xz \
>              file://CVE-2025-4476.patch \
>              file://CVE-2025-2784.patch \
>              file://CVE-2025-4945.patch \
> +file://CVE-2025-14523.patch \
>   "
>   SRC_URI[sha256sum] =3D "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a03=
4153df1413fa1d92f13"
>  =20
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236079):https://lists.openembedded.org/g/openembedd=
ed-core/message/236079
> Mute This Topic:https://lists.openembedded.org/mt/119060651/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [c=
hangqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------HZYv39LJhAda8MjTTjnsrAyS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    <div class="moz-cite-prefix">On 4/29/26 14:15, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:18AABF512DC5339B.2390993@lists.openembedded.org">
      <pre wrap="" class="moz-quote-pre">Refer:
<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/work_items/472">https://gitlab.gnome.org/GNOME/libsoup/-/work_items/472</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 .../libsoup/libsoup-2.4/CVE-2025-14523.patch  | 52 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
new file mode 100644
index 0000000000..0f1d751aeb
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
@@ -0,0 +1,52 @@
+From d6028a6e6a8417b7fb6c89f6c10fb94781435ee6 Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+Date: Wed, 4 Feb 2026 15:08:50 +0800
+Subject: [PATCH] Reject duplicate Host headers (for libsoup 2)
+
+This is a simplified version of my patch for libsoup 3:
+
+!491
+
+Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/commit/d3db5a6f8f03e1f0133754872877c92c0284c472">https://gitlab.gnome.org/GNOME/libsoup/-/commit/d3db5a6f8f03e1f0133754872877c92c0284c472</a>]
+CVE: CVE-2025-14523
+
+This patch is a MR for branch 2-74, but not merged yet, maybe it will
+not be merged.</pre>
    </blockquote>
    <p>Hi, Yoann</p>
    <p>You have mentioned your concern about this not merged commit,&nbsp; so
      I do some tests with these patch series to help</p>
    <p>you decide if we will merge this.</p>
    <p>For libsoup2/libsoup3 I have test POC of&nbsp;&nbsp;<span style="white-space: pre-wrap">CVE-2025-14523 and </span><span>CVE-2025-32049.&nbsp;&nbsp;</span></p>
    <p><span style="white-space: pre-wrap">CVE-2025-14523:</span></p>
    <p><span style="white-space: pre-wrap">without this patch:</span></p>
    <p><span style="white-space: pre-wrap">root@qemux86-64:~# ./host_svr
listening on <a class="moz-txt-link-freetext" href="http://127.0.0.1:33339">http://127.0.0.1:33339</a>
libsoup parsed Host= b.local</span></p>
    <p><span style="white-space: pre-wrap">With this patch, the duplicated header request is rejected:</span></p>
    <p><span style="white-space: pre-wrap"># printf &quot;GET /whoami HTTP/1.1\r\nHost: a.local:%d\r\nHost: b.local:%d\r\nConnection: close\r\n\r\n&quot; $PORT_A $PORT_B | nc 127.0.0.1 8081
HTTP/1.1 400 Bad Request
Server: Server
Content-Length: 0</span></p>
    <p><span>CVE-2025-32049:</span></p>
    <p><span>without this patch:</span></p>
    <p><span>root@qemux86-64:~# ./ws-server-3<br>
        (process:361): GLib-ERROR **: 08:03:32.913: adding 98303 to
        array would overflow<br>
        [&nbsp; 182.528155] traps: ws-server[361] trap int3 ip:7f35f4a91ca7
        sp:7ffe41212800 error:0 in
        libglib-2.0.so.0.7800.6[7f35f4a4e000+97000]<br>
        Trace/breakpoint trap</span></p>
    <p><span>with this patch, the connection closed and no traps.</span></p>
    <p><span>HTTP/1.1 101 Switching Protocols<br>
        Server: ws-server<br>
        Date: Wed, 29 Apr 2026 05:05:28 GMT<br>
        Upgrade: websocket<br>
        Connection: Upgrade<br>
        Sec-WebSocket-Accept: s3pPLMBiTxaQ9kYGzzhZRbK+xOo=<br>
        <br>
        <br>
        Traceback (most recent call last):<br>
        &nbsp; File &quot;/home/root/test.py&quot;, line 31, in &lt;module&gt;<br>
        &nbsp; &nbsp; s.send(fragmented_frame)<br>
        ConnectionResetError: [Errno 104] Connection reset by peer</span></p>
    <p><span>And also run the tests in the repo, at least no regression.
        Those failed test</span></p>
    <p><span>maybe caused since not suitable for the test env, I did
        not&nbsp; deep into them.&nbsp;</span></p>
    <p><span>//Changqing</span></p>
    <blockquote type="cite" cite="mid:18AABF512DC5339B.2390993@lists.openembedded.org">
      <pre wrap="" class="moz-quote-pre">
+
+Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ libsoup/soup-headers.c         | 3 +++
+ libsoup/soup-message-headers.c | 3 +++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index ea2f986..6cd3dad 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -138,6 +138,9 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
+ 		for (p = strchr (value, '\r'); p; p = strchr (p, '\r'))
+ 			*p = ' ';
+ 
++		if (g_ascii_strcasecmp (name, &quot;Host&quot;) == 0 &amp;&amp; soup_message_headers_get_one (dest, &quot;Host&quot;))
++			goto done;
++
+ 		soup_message_headers_append (dest, name, value);
+         }
+ 	success = TRUE;
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index f612bff..bb20bbb 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -220,6 +220,9 @@ soup_message_headers_append (SoupMessageHeaders *hdrs,
+ 	}
+ #endif
+ 
++	if (g_ascii_strcasecmp (name, &quot;Host&quot;) == 0 &amp;&amp; soup_message_headers_get_one (hdrs, &quot;Host&quot;))
++		return;
++
+ 	header.name = intern_header_name (name, &amp;setter);
+ 	header.value = g_strdup (value);
+ 	g_array_append_val (hdrs-&gt;array, header);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 7e00cd678a..253a389e21 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -41,6 +41,7 @@ SRC_URI = &quot;${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            <a class="moz-txt-link-freetext" href="file://CVE-2025-4476.patch">file://CVE-2025-4476.patch</a> \
            <a class="moz-txt-link-freetext" href="file://CVE-2025-2784.patch">file://CVE-2025-2784.patch</a> \
            <a class="moz-txt-link-freetext" href="file://CVE-2025-4945.patch">file://CVE-2025-4945.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2025-14523.patch">file://CVE-2025-14523.patch</a> \
 &quot;
 SRC_URI[sha256sum] = &quot;e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13&quot;
 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#236079): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/236079">https://lists.openembedded.org/g/openembedded-core/message/236079</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/119060651/3616873">https://lists.openembedded.org/mt/119060651/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------HZYv39LJhAda8MjTTjnsrAyS--

