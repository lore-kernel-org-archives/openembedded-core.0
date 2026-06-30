Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226F1C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 07:54:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15857.1782806034929577903
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 00:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=f6xrXA1e;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1641dd4043=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6DCdw377141
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 07:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=4I7QAd4ojyOsZU9n03yLG3
	xtg3zvQOq3kuLOq9mvr1I=; b=f6xrXA1eoyHtRPo/mz1sdzxFboHx7G4EwzRHWK
	SxfVnEwybb4+BPjagSaAWqT2fSjT18y6k1zT6rwXGyKEG20WS6vguVAC2SXOpOvq
	Az61RcAUx9GKvZRRvPk7hN7vxe8oFCPR/LjYe5rtWJY81bKbqik1Ob0Mx1Uasvq7
	p8FfARD4ETJJ9RsGGQGEuz8Rebp80AXc5aUsRK5cLY5VQOVEljRLWJnlLo3EQXnG
	eUsNOj38hZOm1eYIVvcIB8H8B4mz9UDppEmHo2iD/LIKUzLRd57cWg8QqWv2Fqm5
	VOQTiKNvY8EJs+C7/eQ7CTG4E1UMMb+bNkHdHpoQN8mY9dEA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011020.outbound.protection.outlook.com [40.93.194.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f23r0bjdh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 07:53:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xTK/CF3a3BZBjs7ESSrUyNmvNo5dKDuAexiazGSnzbjhjsG+n04ycI9wEkpguDKsF4h694/ubvdfqGX1Rh20bryCbVh3f8VkDqxLJ7AT68+eGye+CoEM3zHejRNTbqGYmtVmP6M/PSTriJBoDkbGz/SJ7AEVSajwZmI9dhValR4UigjL02h+1sD9K7l8sEsoI44ftlIB94SOVTt7qFN3YN2Uuu2K8KUbn4VijorIo2llKmy6lQNHaKqFGChX1pGIZBoilKWzpI3my9qGsk7NpQ2RJuBLdksRnCwKCdKzqKw83WmAY19StXRIQ5LaU6cHYcVrgyeNGdhij1jOOhQQ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4I7QAd4ojyOsZU9n03yLG3xtg3zvQOq3kuLOq9mvr1I=;
 b=ouoxGq4lR/GEvUq3aqPluib5j+sONXturKez1/fXa0Gerd7IgC44I3HSGkBfRKNpL4+DEoiuHhba1DPdOPfSzHfYad3iNaa2P4mAHbk7TebqD2osaz0M5Coj8IA70mhTGqwJrPVARidwgCUpcVJNvjdROUCeCwPGxIuERd1KsQEO9YxSXmXvfPW8XYxTJXPF3G0yb8o0VooXGibp6+1q+tGduXDf+KY1tMZGKAnaOgQ7MqFvTYwE8f6Kt6z8Ujmu9q9SpPcJQtQdzwgbBN5ZBzpLSDG50m0JNCFYmtJsVI6OkjGjtvZy8vN3JbCKl/ef4+lKy+JP8+2CRtFMcAyxww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by PH8PR11MB9878.namprd11.prod.outlook.com (2603:10b6:510:3c5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 07:53:51 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 07:53:51 +0000
Content-Type: multipart/alternative;
 boundary="------------SBr5vqFJH6qvQ8YkRYF8tWZ2"
Message-ID: <85c7ee94-2b88-4d9d-be40-9d703ea436c7@windriver.com>
Date: Tue, 30 Jun 2026 13:23:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [wrynose][PATCH] gdb: Upgrade 17.1 -> 17.2
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20260630071906.1274019-1-Deepesh.Varatharajan@windriver.com>
 <CAMSfU+5ynmjEwTpVh-N-+a-L1nF9hADu73QeKuBDeUX1-OtTMA@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CAMSfU+5ynmjEwTpVh-N-+a-L1nF9hADu73QeKuBDeUX1-OtTMA@mail.gmail.com>
X-ClientProxiedBy: MA5P287CA0066.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::11) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|PH8PR11MB9878:EE_
X-MS-Office365-Filtering-Correlation-Id: a60ad4b2-d72f-451b-ee40-08ded67cb920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|4022899009|4133799003|56012099006|18002099003|22082099003|6133799003|3023799007|4143699003|11063799006|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	pGiBupP8jOgzzh+tPkZhC/CmFPvBbQ/6ZLwvTr2j8a1Eq38iIGaHeLF659JGBdXQPb5pWQRW8UzhW3fuzKRjGcEExSGqrDw8bQF/T8t8Tcs6vAg6fj8N8pbLxQSwX1pHReEkAeWl9QE8yY+kw0iYiyFW+GN2U0XFV5t1BCEi8orvj6ozj1wd5pZ2A+Evs459WZBy+xhY9yyL79BgGrqNje+AgRP4qoO5OtnQUa69fD8BJ1Le4fIJhDPbPy5eYz847WLOlFH5pZbMs3aKMXzGSc7VU0tzyQ6M3cSXoTDCgrqmGYYjFgaV5uiM2oxJ1sK3D4MQc5nL8kwUNRqEQAMrggVyFeTNat36/8yLGSs/bt4OTtAk25F0U0CzIquT6n4PVYxXo7QFCoIcenuzOKPFxOliT47csMgXYKDwjMXNTHdsgFJcpfMELL5eqa4SasOiQb1aSx+5H783L+nDFE5XQ2zA53txxbylT2skCEmvLQgonV3tnnMyQyrQf/JkpR1J/QnXD0w5bpwhkbNjCKWwuPO+HtbKlfwYkNl/m5s3nJETeYfSU9mBO6axL3tkFNc3q5O6fY3SOX9SjEMX7lVGDK8svx3vMLYUFgEVUH3OPQo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(4022899009)(4133799003)(56012099006)(18002099003)(22082099003)(6133799003)(3023799007)(4143699003)(11063799006)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d2pUOVlGSGpmWVRBT3VvN0NrY1JMK2Q0S2hqcXlmbzR6Q0RMVlFUNmtDRStl?=
 =?utf-8?B?M2ZLSE9JNzdRKzE0YTJjdHdXU3ZVNXlFbG9PNXlHTG5pS1ZuU0ZFSmlQdngv?=
 =?utf-8?B?Q21KbEJaSnFVNUNxWEdDQlRsTHhyZFI0MURmRXRmR3NFYXNQWWtwWmFuRmw3?=
 =?utf-8?B?cDZvb0ZJSDRtTXlOb2FIQ2E5aHBFTkxOekNaaVFNdXJ6dzlmR2lHV21JcXE3?=
 =?utf-8?B?UVFydHEzWUNhTWZqekgvV1BpeDdWZzRBZDJGcVhDN2NuaUxSMFhPbFk4dE1V?=
 =?utf-8?B?M2hLSncyb3VOd29JQzlzajVTYkFYdFdweFA0WjcwSEprNDJHRjd2U0E4QmR5?=
 =?utf-8?B?Q082YmJQNmdCMnJ6TEh3Y2wwNHJzQUl4OTRYbzZLYWxReGJHWFNLaUFiTUFu?=
 =?utf-8?B?enNMT21Zck1YcllyU3R4Y3lXSW9mVSt1d0hpa1hTVTQrK1JkVUZrUUkxSTlu?=
 =?utf-8?B?NFZJbVpiQnJ3QWxMT25ScUQrSUhyK2pIeUM3STRkNXRMUG8rVFNYbmNkNnRj?=
 =?utf-8?B?YzJuTXkrK2U4WnE0aDJXWmw5TFBiRHl0UGRmYXJ6Nkhva0VvNWJCNFpBaVFV?=
 =?utf-8?B?M1I1WFBGdXlnaDJibWE1bDFucU1DMW9XOWk5VWluZi9sSnJyU0lVVlN6Mm5U?=
 =?utf-8?B?V0xZR1Jnb3VEM2RPMTRtdzBjT2tNd0V2YS9KdTdlV0pLQWdadVRiNkNHRjc5?=
 =?utf-8?B?WWxUVDlsc1ZEeHR6dEt6WkpUUXRRY0IxZmFadzAvSDlsbTJUWk9rVlRSbjBB?=
 =?utf-8?B?eUVwNGJ4aU9UWUZsd2VLNGhsS0VwMkhJRndFaFFIYmVLNFZyY2RybDIvenF0?=
 =?utf-8?B?amxKNkhvbVMzeGRleDk4aFhBakdSbzhab1k1aFVsY09uMW1ES01wekFPWmVo?=
 =?utf-8?B?VDR0SUpaVDBGTTNDb2lMVjZyTGlqalp2RHEzY0VLWjZKcm5UQW0wOXZzYnF2?=
 =?utf-8?B?ZTBqTUxIcXE2SFdHeDArcmRGR05yNFhQRjZEcld6WU1HTlBGN214OElaZWVY?=
 =?utf-8?B?QWlPYlRSVzBoWnpHK0NYZCtGNW56cG1EYW1oMVRoWjZDaGVhajhML3JvRUIw?=
 =?utf-8?B?VUVsT2pwU2RrTDBQRHVDVXBVZFdEenI4RVVTL0lZWllSMXN1b2dsRmtJczBN?=
 =?utf-8?B?VmF5dWlramk3ejg5YUJXcGN3Z2NWRDUxcnNBang5YndnSVEyai9RcDZjMEFl?=
 =?utf-8?B?RjBvVDlKZDUyUTlnd2QxWUZnTitKS0RQR2dyMEtMZkRabHZuWHJjQmhJYnZh?=
 =?utf-8?B?NlBsVzlVM2g4U3FHQTFUcHJkNWtxT3kyL1puWW5FTGVWSXBzcllTM1h0UlNY?=
 =?utf-8?B?a0VCN1lWSmpTVTlBMW1iZ3JsWEh3Q1hiak9JQmVnWFJkTEpHWERTU3RkaDFs?=
 =?utf-8?B?QmRTUWRlRGdab2VHaG5MeER6WGs4VVZxK3U4SERIbi9wVVRFZC9pL0lZSW93?=
 =?utf-8?B?L3Q4VGJPQ29UZXNkb0VuR1ZwUzA2b05vYXAvSDdSRmJFS2E3U3NCN1hEY1dm?=
 =?utf-8?B?RVdta1h1SytmY0xLS3BjeHhUM0l4eFBRUUFwcytvTjZKR0dHN0FXaXpFclps?=
 =?utf-8?B?OG4vOXVkTDk5OXJ2bjVFSWsyQ3Q4M0ZMVmNEVlp1SjZsU2llSHczVTFVTjJL?=
 =?utf-8?B?WmFxaUprcnZWNVBIc2ZDaStMbVQ0alFXSXBJOFRGU040NCt5WEdBYUcwNGlk?=
 =?utf-8?B?K1RsVCtxMEpubXAyakRVTlhDRHFBVDBBRWpScGt0VmFscU9XRnBjb0ZWMFpy?=
 =?utf-8?B?OHJsam5tS1EzaWlCb3gxWjMrR0JoV2llcldBazBPTmNKR1JxbE9uTTZCSThJ?=
 =?utf-8?B?TzVHUWxQSkJJRjV6UVMwL29TalRJd2xYY3R5dTBSZXcvdzk5dWdxcllvanYz?=
 =?utf-8?B?ZlJZYlc4dUFDK1NiNVQwMWJsenFxS1QybmoySWlsd2l5STFBdm9xKzNtaW1z?=
 =?utf-8?B?VU5zdGhpcmp3THBQdExkVjBwU1V5Y0QyUUFZOWs5WnVZeEhQUXEvK1hna09u?=
 =?utf-8?B?dVZTdURQeDhQclBWWW02aWdBUEp2SzAwSkVBd1VFVTdFZllaRG10QXpiaUtZ?=
 =?utf-8?B?MSt2NWhlKzRCSVZOdVgrWGpUL3U5RWNtRjRMTDNRekZHdWRsMlFrOE1SdzY1?=
 =?utf-8?B?czVObHk2ZGtacVYzcHdiU1J2cy9pck1KMThQcUg2Tkt6NGR3VjNkT25kRU9E?=
 =?utf-8?B?Wi9walc0Z2xIM3R5TEVKenBhM2FhZkNOVVVvc2ZYeGpGcHRlaVFCVDZncFFY?=
 =?utf-8?B?VXUyS2VEWC9mWjRJQmhNMjVDUkxwV1Z2anN6eTcrTTVxK1NxaEVObC9FN3NW?=
 =?utf-8?B?ektwVGh2SEhZMC8wd2xUM0FGSlUvNkNRRWN2bGQ3TUFTMVFJU3JaUmZwVHFW?=
 =?utf-8?Q?4FqvCmXHq1OUp/Z9wnXOAzxr2ajZHjo3W7K0x?=
X-Exchange-RoutingPolicyChecked: 
	PbSUYfjFMv0nMtYDQXCBoqBIQnPHWrKMI9pn1qZSnCEvz6OaPLcG20X4QPpi7d1ggRNNp+0Ec5EEdQIr22kqsuLAtD/1D02SIEtMVaqMr4Begamp7p4VT0XCqAFwY7WMvSCipwQ0qT8z6JtgOtgMC8BvqIhbus8MWVwrU+Pry127rciMdbK4x5OXq6Y4xhJ1CnIy4QtMVakLfTjQo0aCWpjZG/WKsomWkpbC0AVaL3Nzr4fJ8XUVnCgmcngImrw7QuDhJ8TLhZPaMDNpUPHGX5pecN2t1gAI4R/5ys+og83KYdgzPFi1MsSTBM4SDYMV825TRyPMZjqD45qPEpc+zA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a60ad4b2-d72f-451b-ee40-08ded67cb920
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 07:53:50.9067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxUhehEYB0L4rHve6AT9OeI5gABPiKmD0FYAOzKapgVSEuI0wcilthIIbc/6VO+zSEpDRMkrTP3rlSBElKY1b/ef3mJtpEu7KhhQHaJjRzLxuvqkYr1M61XURPa1Tquu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9878
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=DNC/JSNb c=1 sm=1 tr=0 ts=6a437611 cx=c_pps
 a=ut66qxPycOxoCiL0Gbz/2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=CCpqsmhAAAAA:8 a=vmi6oJg5AAAA:8 a=ygfikJQSAAAA:8 a=OS-wmupUAAAA:8
 a=yBkMe2MyAAAA:8 a=Hr2hzXo4AAAA:8 a=ypPjOdA0AAAA:8 a=Qj1obPWzAAAA:8
 a=kvLmvFEdAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=BcPKCTjPAAAA:8
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=W60SWa2TvHFoiMpGbgcA:9
 a=HCINmKHFQ_U6d0ff:21 a=lqcHg5cX4UMA:10 a=PRpDppDLrCsA:10 a=O9Trw71uoXUA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x6f2Z2hcwYeVEtuyBIIA:9
 a=3FWrRw_SKs5zDDEm:21 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=ul9cdbp4aOFLsgKbc677:22 a=ioboX4i089tB3dTPuEcW:22 a=rfsfOhzgo-V0TFs3tIRs:22
 a=b4bZioYaYfAbrF9XAwU5:22 a=sbVJoEiPTMKJheeyIoKo:22 a=53as8YsKq3-og0CBIB0j:22
 a=jIBd2pN-XQE8sgNOjSGu:22 a=gToc2k3r6yXCwdzXzRfp:22 a=blV-NV76DT_euKPIjdAg:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=MNXww67FyIVnWKX2fotq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WeyoATeMU6KaooBlxCUXerql4Gs850bm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2OCBTYWx0ZWRfX/f0LSUGS3oPc
 m5RQLhhYJTuBB4ucDsvBKWDXYobF6PNzr+w+yKwlRUPUhe+KUacryX8hG5nYMzoq2gKQHjRO4QB
 xas3loCgpbekux2m+UhpLtHgJRsAkHGGi7G6wugSrs3vhuKUcxhCaRsYp8OQrneoQVNJoj9oXhf
 fe4SL139xpV7aiB+SC1M8UYBtRo5/hCn8IFhpCJ1qFUq54jVM/xZlSKfMFtkDpK+D2BYx/RnnCU
 1miLtc1ywj5YLVF1YmOEwVXQrlo8bDKzAHkWmBWv/EIjDAW/n1TQhasFsC22sxpI2QMRDwtADUi
 kRyripeAyAgbNlVqNsVKQfIcRy+VWQmF81fu8GnMyWll5dyLrk9bm00WNwRGotOgHGRcdh3jDyx
 /c88dArsZ7SYUhfDZNtqxyp0REJKo1khF/htIqOKvCVCws08DMKqb0NTyNnrRIgOXtt5UtjZdyh
 o6YDHZZZHnJQFDbUHKA==
X-Proofpoint-GUID: bPNSnHEyJrYpbMOW1k9DND9HxFXvab0p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2OCBTYWx0ZWRfX7PlpUMm2RPEE
 0zgBO0sSUSLUM9fRKdxaC4mjlg9wwePdW0lNpSWDJD/Ahl4llyjJADPpKb2XKBecxnD1GwbGvrk
 lCIs8ANrs25jIiKfFKLFL8zpNX80GWpI/bwZSsWMfKPg500+k9HL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 07:54:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239864

--------------SBr5vqFJH6qvQ8YkRYF8tWZ2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65U6DCdw377141


On 30-06-2026 13:02, Yoann Congal wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> Le=C2=A0mar. 30 juin 2026 =C3=A0=C2=A009:19, Varatharajan, Deepesh via=20
> lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVt=
iY5U9MftNMOnk1_cOqLx6zv1JC9NQ$>=20
> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> a =C3=A9c=
rit=C2=A0:
>
>     From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
>     GDB 17.2 brings the following fixes and enhancements over GDB 17.1:
>     https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblob=
_plain;f=3Dgdb/NEWS;hb=3Dgdb-17.2-release
>     <https://urldefense.com/v3/__https://sourceware.org/git/gitweb.cgi?=
p=3Dbinutils-gdb.git;a=3Dblob_plain;f=3Dgdb*NEWS;hb=3Dgdb-17.2-release__;=
Lw!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_=
yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6w6DF219w$>
>
>
> "enhancements" =3D> That sounds like something that is *not* acceptable=
=20
> under stable policy. Did you check?
Hi Yoann,

Thanks for pointing this out. I had copied the commit message from the=20
corresponding commit on master. I verified the changes included in GDB=20
17.2 compared to 17.1, and they are all bug fixes. I've updated the=20
commit message and sent v2.

Regards,
Deepesh
>
>
>
>     =C2=A0* PR dap/33228 ([gdb/dap] error while listing register childr=
en)
>
>     =C2=A0* PR gdb/33737 (gdb --help says 'For more information, type "=
stream"
>     =C2=A0 =C2=A0from within GDB', but "stream" is not a defined comman=
d)
>
>     =C2=A0* PR build/33747 (Incompatible with MUSL libc: no member name=
d
>     'c_ospeed'
>     =C2=A0 =C2=A0in 'termios')
>
>     =C2=A0* PR gdb/33748 (gdb17 regression with displaying ANSI colors)
>
>     =C2=A0* PR gdb/33753 (Out-of-bounds writes in string_{v}printf -- t=
hreads
>     =C2=A0 =C2=A0and static data don't mix)
>
>     =C2=A0* PR cli/33761 (Setting style colors is broken on MS-Windows)
>
>     =C2=A0* PR gdb/33768 (Loading compressed GDB scripts from
>     .debug_gdb_scripts fails)
>
>     =C2=A0* PR symtab/33775 ([gdb/symtab] data race in
>     =C2=A0dwarf2_per_cu::{set_addr_size,set_offset_size,set_ref_addr_si=
ze})
>
>     =C2=A0* PR symtab/33777 ([gdb/symtab] dw2_get_file_names doesn't ca=
che
>     result
>     =C2=A0 =C2=A0for dummy CU)
>
>     =C2=A0* PR symtab/33825 ([dwz] Extremely slow symbol lookup with
>     DWZ-compressed
>     =C2=A0 =C2=A0debug info (thousands of partial units))
>
>     =C2=A0* PR testsuite/33845 (gdb: There are 4 unexpected failures in
>     =C2=A0 =C2=A0breakpoint-in-ro-region.exp)
>
>     =C2=A0* PR gdb/33872 (`skip -gfile` has inverted logic)
>
>     =C2=A0* PR gdb/33926 (GDB 17.1 AArch64: redefinition of user_gcs st=
ruct
>     on musl)
>
>     =C2=A0* PR breakpoints/34112 (rbreak `file:regex` sets breakpoints =
for
>     matches
>     =C2=A0 =C2=A0outside of `file` [reproducer attached])
>
>     Drop patches merged upstream:
>     =C2=A0 * 0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.=
patch
>     =C2=A0 * 0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.p=
atch
>
>     Signed-off-by: Deepesh Varatharajan
>     <Deepesh.Varatharajan@windriver.com>
>     ---
>     =C2=A0...ian_17.1.bb
>     <https://urldefense.com/v3/__http://ian_17.1.bb__;!!AjveYdw8EvQ!fyA=
FzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9Mf=
tNMOnk1_cOqLx6yB0ZouuA$>
>     =3D> gdb-cross-canadian_17.2.bb
>     <https://urldefense.com/v3/__http://gdb-cross-canadian_17.2.bb__;!!=
AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEA=
i5CePPVtiY5U9MftNMOnk1_cOqLx6yJe89jLA$>}
>     |=C2=A0 =C2=A00
>     =C2=A0.../{gdb-cross_17.1.bb
>     <https://urldefense.com/v3/__http://gdb-cross_17.1.bb__;!!AjveYdw8E=
vQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVti=
Y5U9MftNMOnk1_cOqLx6yoY74hZQ$>
>     =3D> gdb-cross_17.2.bb
>     <https://urldefense.com/v3/__http://gdb-cross_17.2.bb__;!!AjveYdw8E=
vQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVti=
Y5U9MftNMOnk1_cOqLx6ylk0WWdQ$>}=C2=A0
>     |=C2=A0 =C2=A00
>     =C2=A0meta/recipes-devtools/gdb/gdb.inc
>     <https://urldefense.com/v3/__http://gdb.inc__;!!AjveYdw8EvQ!fyAFzcZ=
AS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMO=
nk1_cOqLx6x597hGWA$>=C2=A0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-
>     =C2=A0...-ser-unix-modernize-Linux-custom-bau.patch | 248
>     ------------------
>     =C2=A0...ux-Fix-build-failure-on-musl-systems.patch | 196 ---------=
-----
>     =C2=A0.../gdb/{gdb_17.1.bb
>     <https://urldefense.com/v3/__http://gdb_17.1.bb__;!!AjveYdw8EvQ!fyA=
FzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9Mf=
tNMOnk1_cOqLx6xWLB4o5A$>
>     =3D> gdb_17.2.bb
>     <https://urldefense.com/v3/__http://gdb_17.2.bb__;!!AjveYdw8EvQ!fyA=
FzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9Mf=
tNMOnk1_cOqLx6wwl9u49Q$>}=C2=A0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00
>     =C2=A06 files changed, 1 insertion(+), 447 deletions(-)
>     =C2=A0rename meta/recipes-devtools/gdb/{gdb-cross-canadian_17.1.bb
>     <https://urldefense.com/v3/__http://gdb-cross-canadian_17.1.bb__;!!=
AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEA=
i5CePPVtiY5U9MftNMOnk1_cOqLx6yFqh5ynQ$>
>     =3D> gdb-cross-canadian_17.2.bb
>     <https://urldefense.com/v3/__http://gdb-cross-canadian_17.2.bb__;!!=
AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEA=
i5CePPVtiY5U9MftNMOnk1_cOqLx6yJe89jLA$>}
>     (100%)
>     =C2=A0rename meta/recipes-devtools/gdb/{gdb-cross_17.1.bb
>     <https://urldefense.com/v3/__http://gdb-cross_17.1.bb__;!!AjveYdw8E=
vQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVti=
Y5U9MftNMOnk1_cOqLx6yoY74hZQ$>
>     =3D> gdb-cross_17.2.bb
>     <https://urldefense.com/v3/__http://gdb-cross_17.2.bb__;!!AjveYdw8E=
vQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVti=
Y5U9MftNMOnk1_cOqLx6ylk0WWdQ$>}
>     (100%)
>     =C2=A0delete mode 100644
>     meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modern=
ize-Linux-custom-bau.patch
>     =C2=A0delete mode 100644
>     meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-fail=
ure-on-musl-systems.patch
>     =C2=A0rename meta/recipes-devtools/gdb/{gdb_17.1.bb
>     <https://urldefense.com/v3/__http://gdb_17.1.bb__;!!AjveYdw8EvQ!fyA=
FzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9Mf=
tNMOnk1_cOqLx6xWLB4o5A$>
>     =3D> gdb_17.2.bb
>     <https://urldefense.com/v3/__http://gdb_17.2.bb__;!!AjveYdw8EvQ!fyA=
FzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9Mf=
tNMOnk1_cOqLx6wwl9u49Q$>}
>     (100%)
>
>     diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
>     <https://urldefense.com/v3/__http://gdb-cross-canadian_17.1.bb__;!!=
AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEA=
i5CePPVtiY5U9MftNMOnk1_cOqLx6yFqh5ynQ$>
>     b/meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
>     <https://urldefense.com/v3/__http://gdb-cross-canadian_17.2.bb__;!!=
AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEA=
i5CePPVtiY5U9MftNMOnk1_cOqLx6yJe89jLA$>
>     similarity index 100%
>     rename from meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
>     <https://urldefense.com/v3/__http://gdb-cross-canadian_17.1.bb__;!!=
AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEA=
i5CePPVtiY5U9MftNMOnk1_cOqLx6yFqh5ynQ$>
>     rename to meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
>     <https://urldefense.com/v3/__http://gdb-cross-canadian_17.2.bb__;!!=
AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEA=
i5CePPVtiY5U9MftNMOnk1_cOqLx6yJe89jLA$>
>     diff --git a/meta/recipes-devtools/gdb/gdb-cross_17.1.bb
>     <https://urldefense.com/v3/__http://gdb-cross_17.1.bb__;!!AjveYdw8E=
vQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVti=
Y5U9MftNMOnk1_cOqLx6yoY74hZQ$>
>     b/meta/recipes-devtools/gdb/gdb-cross_17.2.bb
>     <https://urldefense.com/v3/__http://gdb-cross_17.2.bb__;!!AjveYdw8E=
vQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVti=
Y5U9MftNMOnk1_cOqLx6ylk0WWdQ$>
>     similarity index 100%
>     rename from meta/recipes-devtools/gdb/gdb-cross_17.1.bb
>     <https://urldefense.com/v3/__http://gdb-cross_17.1.bb__;!!AjveYdw8E=
vQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVti=
Y5U9MftNMOnk1_cOqLx6yoY74hZQ$>
>     rename to meta/recipes-devtools/gdb/gdb-cross_17.2.bb
>     <https://urldefense.com/v3/__http://gdb-cross_17.2.bb__;!!AjveYdw8E=
vQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVti=
Y5U9MftNMOnk1_cOqLx6ylk0WWdQ$>
>     diff --git a/meta/recipes-devtools/gdb/gdb.inc
>     <https://urldefense.com/v3/__http://gdb.inc__;!!AjveYdw8EvQ!fyAFzcZ=
AS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMO=
nk1_cOqLx6x597hGWA$>
>     b/meta/recipes-devtools/gdb/gdb.inc
>     <https://urldefense.com/v3/__http://gdb.inc__;!!AjveYdw8EvQ!fyAFzcZ=
AS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMO=
nk1_cOqLx6x597hGWA$>
>     index d367486d02..cbb5885459 100644
>     --- a/meta/recipes-devtools/gdb/gdb.inc
>     <https://urldefense.com/v3/__http://gdb.inc__;!!AjveYdw8EvQ!fyAFzcZ=
AS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMO=
nk1_cOqLx6x597hGWA$>
>     +++ b/meta/recipes-devtools/gdb/gdb.inc
>     <https://urldefense.com/v3/__http://gdb.inc__;!!AjveYdw8EvQ!fyAFzcZ=
AS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMO=
nk1_cOqLx6x597hGWA$>
>     @@ -13,7 +13,5 @@ SRC_URI =3D "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
>     file://0006-Fix-invalid-sigprocmask-call.patch \
>     file://0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.pa=
tch
>     \
>     file://0008-Add-fix-for-packages-that-are-not-compatible-with-C2.pa=
tch
>     \
>     -
>     file://0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.pa=
tch
>     \
>     -
>     file://0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.pat=
ch
>     \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>     -SRC_URI[sha256sum] =3D
>     "14996f5f74c9f68f5a543fdc45bca7800207f91f92aeea6c2e791822c7c6d876"
>     +SRC_URI[sha256sum] =3D
>     "1c036c0d72e4b3d1fb5c94c88632add6f9d76f4d7c4d2ea793c12a9f19a3228c"
>     diff --git
>     a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-mode=
rnize-Linux-custom-bau.patch
>     b/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-mode=
rnize-Linux-custom-bau.patch
>     deleted file mode 100644
>     index 30d22b21f9..0000000000
>     ---
>     a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-mode=
rnize-Linux-custom-bau.patch
>     +++ /dev/null
>     @@ -1,248 +0,0 @@
>     -From 1a77c71303b552140613d49595baebdff1a4716e Mon Sep 17 00:00:00
>     2001
>     -From: Sunil Dora <sunilkumar.dora@windriver.com>
>     -Date: Tue, 17 Mar 2026 01:58:55 -0700
>     -Subject: [PATCH] PR gdb/33747: gdb/ser-unix: modernize Linux
>     custom baud rate
>     - support
>     -
>     -The Linux custom baud rate implementation previously accessed the
>     -struct termios members c_ispeed and c_ospeed directly. These field=
s
>     -exist in glibc but are not exposed by musl, causing builds to fail=
 on
>     -musl-based systems.
>     -
>     -Update set_custom_baudrate_linux to use a capability-based approac=
h,
>     -with three distinct code paths:
>     -
>     -1) If POSIX cfsetispeed/cfsetospeed accept arbitrary baud rates
>     -=C2=A0 =C2=A0(HAVE_CFSETSPEED_ARBITRARY), use them to set input an=
d output
>     -=C2=A0 =C2=A0speeds.
>     -
>     -2) Else if Linux termios2 interface is available (TCGETS2/BOTHER),
>     -=C2=A0 =C2=A0use it to support arbitrary baud rates.
>     -
>     -3) Else if legacy struct termios supports c_ispeed/c_ospeed, use
>     -=C2=A0 =C2=A0the TCGETS/TCSETS fallback (primarily for glibc on ol=
der
>     -=C2=A0 =C2=A0architectures).
>     -
>     -4) Otherwise, emit an error indicating that custom baud rates are
>     -=C2=A0 =C2=A0unsupported on this platform.
>     -
>     -This preserves existing behavior on glibc systems while restoring
>     -build compatibility with musl and other libc implementations.
>     -
>     -Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=3D33747
>     <https://urldefense.com/v3/__https://sourceware.org/bugzilla/show_b=
ug.cgi?id=3D33747__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas=
5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6x5rToniQ$>
>     -
>     -Upstream-Status: Submitted
>     [https://sourceware.org/pipermail/gdb-patches/2026-March/225952.htm=
l
>     <https://urldefense.com/v3/__https://sourceware.org/pipermail/gdb-p=
atches/2026-March/225952.html__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6=
v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6zX2Iunnw$>=
]
>     -
>     -Suggested-by: Kevin Buettner <kevinb@redhat.com>
>     -Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
>     -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
>     ----
>     - gdb/config.in
>     <https://urldefense.com/v3/__http://config.in__;!!AjveYdw8EvQ!fyAFz=
cZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftN=
MOnk1_cOqLx6wtaWha9Q$>
>     =C2=A0 |=C2=A0 6 ++++++
>     - gdb/configure=C2=A0 =C2=A0 | 52 +++++++++++++++++++++++++++++++++=
++++++++++++
>     - gdb/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!fy=
AFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9M=
ftNMOnk1_cOqLx6zsHPeD8A$>
>     | 22 +++++++++++++++++++
>     - gdb/ser-unix.c=C2=A0 =C2=A0| 55
>     ++++++++++++++++++++++++++++++++++--------------
>     - 4 files changed, 119 insertions(+), 16 deletions(-)
>     -
>     -diff --git a/gdb/config.in
>     <https://urldefense.com/v3/__http://config.in__;!!AjveYdw8EvQ!fyAFz=
cZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftN=
MOnk1_cOqLx6wtaWha9Q$>
>     b/gdb/config.in
>     <https://urldefense.com/v3/__http://config.in__;!!AjveYdw8EvQ!fyAFz=
cZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftN=
MOnk1_cOqLx6wtaWha9Q$>
>     -index efc3100cb9e..b2469c8dabd 100644
>     ---- a/gdb/config.in
>     <https://urldefense.com/v3/__http://config.in__;!!AjveYdw8EvQ!fyAFz=
cZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftN=
MOnk1_cOqLx6wtaWha9Q$>
>     -+++ b/gdb/config.in
>     <https://urldefense.com/v3/__http://config.in__;!!AjveYdw8EvQ!fyAFz=
cZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftN=
MOnk1_cOqLx6wtaWha9Q$>
>     -@@ -110,6 +110,9 @@
>     -=C2=A0 =C2=A0 the CoreFoundation framework. */
>     - #undef HAVE_CFPREFERENCESCOPYAPPVALUE
>     -
>     -+/* Define if cfsetispeed/cfsetospeed accept arbitrary baud rates =
*/
>     -+#undef HAVE_CFSETSPEED_ARBITRARY
>     -+
>     - /* Define if compiling support to gdb compile. */
>     - #undef HAVE_COMPILE
>     -
>     -@@ -517,6 +520,9 @@
>     - /* Define to 1 if `st_blocks' is a member of `struct stat'. */
>     - #undef HAVE_STRUCT_STAT_ST_BLOCKS
>     -
>     -+/* Define to 1 if `c_ospeed' is a member of `struct termios'. */
>     -+#undef HAVE_STRUCT_TERMIOS_C_OSPEED
>     -+
>     - /* Define to 1 if `td_pcb' is a member of `struct thread'. */
>     - #undef HAVE_STRUCT_THREAD_TD_PCB
>     -
>     -diff --git a/gdb/configure b/gdb/configure
>     -index d0bdba6eb36..8a0e2fa2771 100755
>     ---- a/gdb/configure
>     -+++ b/gdb/configure
>     -@@ -27336,6 +27336,58 @@ if test "$ac_res" !=3D no; then :
>     - fi
>     -
>     -
>     -+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rat=
es.
>     -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether
>     cfsetispeed/cfsetospeed accept arbitrary baud rates" >&5
>     -+$as_echo_n "checking whether cfsetispeed/cfsetospeed accept
>     arbitrary baud rates... " >&6; }
>     -+if ${gdb_cv_cfsetspeed_arbitrary+:} false; then :
>     -+=C2=A0 $as_echo_n "(cached) " >&6
>     -+else
>     -+
>     -+=C2=A0 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
>     -+/* end confdefs.h.=C2=A0 */
>     -+#include <termios.h>
>     -+int
>     -+main ()
>     -+{
>     -+
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0#if B9600 !=3D 9600
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0#error B-constants are not numeric sym=
bols
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0#endif
>     -+
>     -+=C2=A0 ;
>     -+=C2=A0 return 0;
>     -+}
>     -+_ACEOF
>     -+if ac_fn_c_try_compile "$LINENO"; then :
>     -+=C2=A0 gdb_cv_cfsetspeed_arbitrary=3Dyes
>     -+else
>     -+=C2=A0 gdb_cv_cfsetspeed_arbitrary=3Dno
>     -+fi
>     -+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
>     -+
>     -+fi
>     -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result:
>     $gdb_cv_cfsetspeed_arbitrary" >&5
>     -+$as_echo "$gdb_cv_cfsetspeed_arbitrary" >&6; }
>     -+
>     -+if test "$gdb_cv_cfsetspeed_arbitrary" =3D yes; then
>     -+
>     -+$as_echo "#define HAVE_CFSETSPEED_ARBITRARY 1" >>confdefs.h
>     -+
>     -+fi
>     -+
>     -+# Check for members required by the legacy Linux custom baud
>     rate path.
>     -+ac_fn_c_check_member "$LINENO" "struct termios" "c_ospeed"
>     "ac_cv_member_struct_termios_c_ospeed" "#include <termios.h>
>     -+"
>     -+if test "x$ac_cv_member_struct_termios_c_ospeed" =3D xyes; then :
>     -+
>     -+cat >>confdefs.h <<_ACEOF
>     -+#define HAVE_STRUCT_TERMIOS_C_OSPEED 1
>     -+_ACEOF
>     -+
>     -+
>     -+fi
>     -+
>     -+
>     -
>     -
>     - # Check whether --with-jit-reader-dir was given.
>     -diff --git a/gdb/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!fy=
AFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9M=
ftNMOnk1_cOqLx6zsHPeD8A$>
>     b/gdb/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!fy=
AFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9M=
ftNMOnk1_cOqLx6zsHPeD8A$>
>     -index 52924106bca..26e8d1ee276 100644
>     ---- a/gdb/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!fy=
AFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9M=
ftNMOnk1_cOqLx6zsHPeD8A$>
>     -+++ b/gdb/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!fy=
AFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9M=
ftNMOnk1_cOqLx6zsHPeD8A$>
>     -@@ -733,6 +733,28 @@ AC_CONFIG_FILES([jit-reader.h:jit-reader.in
>     <https://urldefense.com/v3/__http://jit-reader.in__;!!AjveYdw8EvQ!f=
yAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9=
MftNMOnk1_cOqLx6yfW7KtxA$>])
>     -
>     - AC_SEARCH_LIBS(dlopen, dl)
>     -
>     -+# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rat=
es.
>     -+AC_CACHE_CHECK([whether cfsetispeed/cfsetospeed accept arbitrary
>     baud rates],
>     -+=C2=A0 [gdb_cv_cfsetspeed_arbitrary], [
>     -+=C2=A0 AC_COMPILE_IFELSE(
>     -+=C2=A0 =C2=A0 [AC_LANG_PROGRAM([[#include <termios.h>]],
>     -+=C2=A0 =C2=A0 =C2=A0 [[
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0#if B9600 !=3D 9600
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0#error B-constants are not numeric sym=
bols
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0#endif
>     -+=C2=A0 =C2=A0 =C2=A0 ]])],
>     -+=C2=A0 =C2=A0 [gdb_cv_cfsetspeed_arbitrary=3Dyes],
>     -+=C2=A0 =C2=A0 [gdb_cv_cfsetspeed_arbitrary=3Dno])
>     -+])
>     -+
>     -+if test "$gdb_cv_cfsetspeed_arbitrary" =3D yes; then
>     -+=C2=A0 AC_DEFINE([HAVE_CFSETSPEED_ARBITRARY], [1],
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[Define if cfsetispeed/c=
fsetospeed accept arbitrary
>     baud rates])
>     -+fi
>     -+
>     -+# Check for members required by the legacy Linux custom baud
>     rate path.
>     -+AC_CHECK_MEMBERS([struct termios.c_ospeed], [], [], [[#include
>     <termios.h>]])
>     -+
>     - GDB_AC_WITH_DIR([JIT_READER_DIR], [jit-reader-dir],
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[dir=
ectory to load the JIT readers from],
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[${l=
ibdir}/gdb])
>     -diff --git a/gdb/ser-unix.c b/gdb/ser-unix.c
>     -index 6f2766518be..fbd73970dbb 100644
>     ---- a/gdb/ser-unix.c
>     -+++ b/gdb/ser-unix.c
>     -@@ -508,36 +508,59 @@ set_baudcode_baudrate (struct serial *scb,
>     int baud_code)
>     -
>     - #if HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(BOTHER)
>     -
>     --/* Set a custom baud rate using the termios BOTHER.=C2=A0 */
>     -+/* Set a custom baud rate.
>     -+
>     -+=C2=A0 =C2=A0Prefer the POSIX cfsetispeed/cfsetospeed interface w=
hen it
>     accepts
>     -+=C2=A0 =C2=A0arbitrary baud rates.=C2=A0 Otherwise fall back to L=
inux-specific
>     termios2
>     -+=C2=A0 =C2=A0(BOTHER) or legacy termios interfaces.=C2=A0 */
>     -
>     - static void
>     - set_custom_baudrate_linux (int fd, int rate)
>     - {
>     --#ifdef TCGETS2
>     --=C2=A0 struct termios2 tio;
>     --=C2=A0 const unsigned long req_get =3D TCGETS2;
>     --=C2=A0 const unsigned long req_set =3D TCSETS2;
>     --#else
>     -+#if defined(HAVE_CFSETSPEED_ARBITRARY)
>     -=C2=A0 =C2=A0struct termios tio;
>     --=C2=A0 const unsigned long req_get =3D TCGETS;
>     --=C2=A0 const unsigned long req_set =3D TCSETS;
>     --#endif
>     -+=C2=A0 if (tcgetattr (fd, &tio) < 0)
>     -+=C2=A0 =C2=A0 perror_with_name (_("Cannot get current baud rate")=
);
>     -+
>     -+=C2=A0 cfsetispeed (&tio, rate);
>     -+=C2=A0 cfsetospeed (&tio, rate);
>     -+
>     -+=C2=A0 if (tcsetattr (fd, TCSANOW, &tio) < 0)
>     -+=C2=A0 =C2=A0 perror_with_name (_("Cannot set custom baud rate"))=
;
>     -+
>     -+#elif defined(TCGETS2)
>     -+=C2=A0 struct termios2 tio2;
>     -+=C2=A0 if (ioctl (fd, TCGETS2, &tio2) < 0)
>     -+=C2=A0 =C2=A0 perror_with_name (_("Cannot get current baud rate")=
);
>     -+
>     -+=C2=A0 tio2.c_cflag &=3D ~CBAUD;
>     -+=C2=A0 tio2.c_cflag |=3D BOTHER;
>     -+=C2=A0 tio2.c_ospeed =3D rate;
>     -+=C2=A0 tio2.c_cflag &=3D ~(CBAUD << IBSHIFT);
>     -+=C2=A0 tio2.c_cflag |=3D BOTHER << IBSHIFT;
>     -+=C2=A0 tio2.c_ispeed =3D rate;
>     -
>     --=C2=A0 if (ioctl (fd, req_get, &tio) < 0)
>     --=C2=A0 =C2=A0 perror_with_name (_("Can not get current baud rate"=
));
>     -+=C2=A0 if (ioctl (fd, TCSETS2, &tio2) < 0)
>     -+=C2=A0 =C2=A0 perror_with_name (_("Cannot set custom baud rate"))=
;
>     -+
>     -+#elif defined(HAVE_STRUCT_TERMIOS_C_OSPEED)
>     -+=C2=A0 struct termios tio;
>     -+=C2=A0 if (ioctl (fd, TCGETS, &tio) < 0)
>     -+=C2=A0 =C2=A0 perror_with_name (_("Cannot get current baud rate")=
);
>     -
>     --=C2=A0 /* Clear the current output baud rate and fill a new value=
.=C2=A0 */
>     -=C2=A0 =C2=A0tio.c_cflag &=3D ~CBAUD;
>     -=C2=A0 =C2=A0tio.c_cflag |=3D BOTHER;
>     -=C2=A0 =C2=A0tio.c_ospeed =3D rate;
>     --
>     --=C2=A0 /* Clear the current input baud rate and fill a new value.=
=C2=A0 */
>     -=C2=A0 =C2=A0tio.c_cflag &=3D ~(CBAUD << IBSHIFT);
>     -=C2=A0 =C2=A0tio.c_cflag |=3D BOTHER << IBSHIFT;
>     -=C2=A0 =C2=A0tio.c_ispeed =3D rate;
>     -
>     --=C2=A0 if (ioctl (fd, req_set, &tio) < 0)
>     --=C2=A0 =C2=A0 perror_with_name (_("Can not set custom baud rate")=
);
>     -+=C2=A0 if (ioctl (fd, TCSETS, &tio) < 0)
>     -+=C2=A0 =C2=A0 perror_with_name (_("Cannot set custom baud rate"))=
;
>     -+
>     -+#else
>     -+=C2=A0 error (_("Custom baud rate not supported on this platform"=
));
>     -+#endif
>     - }
>     -
>     - #elif HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(IOSSIOSPEED)
>     ---
>     -2.49.0
>     -
>     diff --git
>     a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-fa=
ilure-on-musl-systems.patch
>     b/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-fa=
ilure-on-musl-systems.patch
>     deleted file mode 100644
>     index 2d91a351d2..0000000000
>     ---
>     a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-fa=
ilure-on-musl-systems.patch
>     +++ /dev/null
>     @@ -1,196 +0,0 @@
>     -From 654223c799910837c80d0964a971fbdf7808864a Mon Sep 17 00:00:00
>     2001
>     -From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
>     -Date: Tue, 17 Mar 2026 02:24:48 -0700
>     -Subject: [PATCH] GDB: aarch64-linux: Fix build failure on musl
>     systems
>     -
>     -(cherry picked from commit 02090062127d59978ccc312dabf63c6ea838cd8=
5)
>     -
>     -When building against musl (e.g. on Alpine Linux), the following
>     error
>     -happens:
>     -
>     -=C2=A0 =C2=A0 CXX=C2=A0 =C2=A0 linux-aarch64-low.o
>     -=C2=A0 In file included from
>     /home/bauermann/src/binutils-gdb/gdbserver/linux-aarch64-low.cc
>     <https://urldefense.com/v3/__http://linux-aarch64-low.cc__;!!AjveYd=
w8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePP=
VtiY5U9MftNMOnk1_cOqLx6xCC5mxjg$>:42:
>     -
>     /home/bauermann/src/binutils-gdb/gdbserver/../gdb/arch/aarch64-gcs-=
linux.h:35:8:
>     error: redefinition of 'struct user_gcs'
>     -=C2=A0 =C2=A0 =C2=A035 | struct user_gcs
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~
>     -=C2=A0 In file included from
>     /home/bauermann/src/binutils-gdb/gdbserver/linux-aarch64-low.cc
>     <https://urldefense.com/v3/__http://linux-aarch64-low.cc__;!!AjveYd=
w8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePP=
VtiY5U9MftNMOnk1_cOqLx6xCC5mxjg$>:35:
>     -=C2=A0 /usr/include/asm/ptrace.h:329:8: note: previous definition =
of
>     'struct user_gcs'
>     -=C2=A0 =C2=A0 329 | struct user_gcs {
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~
>     -=C2=A0 make[2]: *** [Makefile:565: linux-aarch64-low.o] Error 1
>     -
>     -aarch64-linux-tdep.c fails to build in the same way. This happens
>     because
>     -aarch64-gcs-linux.h uses GCS_MAGIC to see whether the system heade=
rs
>     -have GCS-related definitions.=C2=A0 The problem is that GCS_MAGIC =
is
>     defined in
>     -<asm/sigcontext.h> while struct gcs_user is defined in
>     <asm/ptrace.h>.
>     -It's fine on glibc systems because in the set of system headers th=
at
>     -linux-aarch64-low.cc
>     <https://urldefense.com/v3/__http://-linux-aarch64-low.cc__;!!AjveY=
dw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CeP=
PVtiY5U9MftNMOnk1_cOqLx6yxF3rpGw$>
>     and aarch64-linux-tdep.c include, <asm/sigcontext.h>
>     -ends up being included implicitly as well.=C2=A0 This doesn't happ=
en
>     when using
>     -musl's headers though.
>     -
>     -There isn't a macro in <asm/ptrace.h> whose presence is
>     correlated with
>     -the presence of the struct user_gcs definition, so a configure
>     check is
>     -needed to detect it and conditionally define the struct.
>     -
>     -Also, this change requires aarch64-linux-tdep.c to stop using
>     -struct user_gcs because target-dependent code can't include
>     <asm/ptrace.h>
>     -and thus even if HAVE_STRUCT_USER_GCS is set, the file won't have =
the
>     -struct definition available. To fix this problem, also backport th=
e
>     -definition of AARCH64_LINUX_SIZEOF_GCS_REGSET and use it there.
>     -
>     -Note that there's another build issue with musl, described in
>     -PR gdb/33747 affecting compilation of gdb/ser-unix.c.=C2=A0 In ord=
er to be
>     -able to test this patch, I applied the patch in comment 11 there.
>     -
>     -Tested with a native build on an Alpine Linux aarch64 system, and
>     also
>     -verified that all gdb.arch/aarch64-gcs*.exp tests pass on it.
>     -
>     -Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=3D33926
>     <https://urldefense.com/v3/__https://sourceware.org/bugzilla/show_b=
ug.cgi?id=3D33926__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas=
5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6xV7oGggg$>
>     -
>     -Upstream-Status: Submitted
>     [https://sourceware.org/pipermail/gdb-patches/2026-March/226049.htm=
l
>     <https://urldefense.com/v3/__https://sourceware.org/pipermail/gdb-p=
atches/2026-March/226049.html__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6=
v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6w1KI1NIQ$>=
]
>     -
>     -Co-authored-by: Chris Packham <judge.packham@gmail.com>
>     -Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
>     ----
>     - gdb/aarch64-linux-tdep.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++--
>     - gdb/arch/aarch64-gcs-linux.h |=C2=A0 8 +++++---
>     - gdbsupport/config.in
>     <https://urldefense.com/v3/__http://config.in__;!!AjveYdw8EvQ!fyAFz=
cZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftN=
MOnk1_cOqLx6wtaWha9Q$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++
>     - gdbsupport/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 36
>     ++++++++++++++++++++++++++++++++++++
>     - gdbsupport/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!fy=
AFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9M=
ftNMOnk1_cOqLx6zsHPeD8A$>
>     =C2=A0 =C2=A0 | 19 +++++++++++++++++++
>     - 5 files changed, 66 insertions(+), 5 deletions(-)
>     -
>     -diff --git a/gdb/aarch64-linux-tdep.c b/gdb/aarch64-linux-tdep.c
>     -index 76bde85188b..6c402e7ecdd 100644
>     ---- a/gdb/aarch64-linux-tdep.c
>     -+++ b/gdb/aarch64-linux-tdep.c
>     -@@ -1684,8 +1684,9 @@ aarch64_linux_iterate_over_regset_sections
>     (struct gdbarch *gdbarch,
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcs_regmap, regcache_supply_regs=
et, regcache_collect_regset
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0};
>     -
>     --=C2=A0 =C2=A0 =C2=A0 cb (".reg-aarch-gcs", sizeof (user_gcs), siz=
eof (user_gcs),
>     --=C2=A0 =C2=A0 =C2=A0 =C2=A0 &aarch64_linux_gcs_regset, "GCS regis=
ters", cb_data);
>     -+=C2=A0 =C2=A0 =C2=A0 cb (".reg-aarch-gcs", AARCH64_LINUX_SIZEOF_G=
CS_REGSET,
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 AARCH64_LINUX_SIZEOF_GCS_REGSET, &aar=
ch64_linux_gcs_regset,
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 "GCS registers", cb_data);
>     -=C2=A0 =C2=A0 =C2=A0}
>     - }
>     -
>     -diff --git a/gdb/arch/aarch64-gcs-linux.h
>     b/gdb/arch/aarch64-gcs-linux.h
>     -index 018ca37a522..632823a8120 100644
>     ---- a/gdb/arch/aarch64-gcs-linux.h
>     -+++ b/gdb/arch/aarch64-gcs-linux.h
>     -@@ -27,8 +27,7 @@
>     - #define HWCAP_GCS (1ULL << 32)
>     - #endif
>     -
>     --/* Make sure we only define these if the kernel header doesn't.=C2=
=A0 */
>     --#ifndef GCS_MAGIC
>     -+#ifndef HAVE_STRUCT_USER_GCS
>     -
>     - /* GCS state (NT_ARM_GCS).=C2=A0 */
>     -
>     -@@ -39,6 +38,9 @@ struct user_gcs
>     -=C2=A0 =C2=A0uint64_t gcspr_el0;
>     - };
>     -
>     --#endif /* GCS_MAGIC */
>     -+#endif /* HAVE_STRUCT_USER_GCS */
>     -+
>     -+/* The GCS regset consists of 3 64-bit registers.=C2=A0 */
>     -+#define AARCH64_LINUX_SIZEOF_GCS_REGSET (3 * 8)
>     -
>     - #endif /* GDB_ARCH_AARCH64_GCS_LINUX_H */
>     -diff --git a/gdbsupport/config.in
>     <https://urldefense.com/v3/__http://config.in__;!!AjveYdw8EvQ!fyAFz=
cZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftN=
MOnk1_cOqLx6wtaWha9Q$>
>     b/gdbsupport/config.in
>     <https://urldefense.com/v3/__http://config.in__;!!AjveYdw8EvQ!fyAFz=
cZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftN=
MOnk1_cOqLx6wtaWha9Q$>
>     -index 0beacf22c05..2957ee0f030 100644
>     ---- a/gdbsupport/config.in
>     <https://urldefense.com/v3/__http://config.in__;!!AjveYdw8EvQ!fyAFz=
cZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftN=
MOnk1_cOqLx6wtaWha9Q$>
>     -+++ b/gdbsupport/config.in
>     <https://urldefense.com/v3/__http://config.in__;!!AjveYdw8EvQ!fyAFz=
cZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftN=
MOnk1_cOqLx6wtaWha9Q$>
>     -@@ -271,6 +271,9 @@
>     - /* Define to 1 if `st_blocks' is a member of `struct stat'. */
>     - #undef HAVE_STRUCT_STAT_ST_BLOCKS
>     -
>     -+/* Define to 1 if your system has struct user_gcs. */
>     -+#undef HAVE_STRUCT_USER_GCS
>     -+
>     - /* Define to 1 if you have the <sys/param.h> header file. */
>     - #undef HAVE_SYS_PARAM_H
>     -
>     -diff --git a/gdbsupport/configure b/gdbsupport/configure
>     -index 133ddfa7f6c..66135791aa5 100755
>     ---- a/gdbsupport/configure
>     -+++ b/gdbsupport/configure
>     -@@ -14307,6 +14307,42 @@ ac_compiler_gnu=3D$ac_cv_c_compiler_gnu
>     -
>     -
>     -
>     -+# Check for `struct user_gcs`
>     -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for struct
>     user_gcs" >&5
>     -+$as_echo_n "checking for struct user_gcs... " >&6; }
>     -+if ${gdb_cv_struct_user_gcs+:} false; then :
>     -+=C2=A0 $as_echo_n "(cached) " >&6
>     -+else
>     -+=C2=A0 cat confdefs.h - <<_ACEOF >conftest.$ac_ext
>     -+/* end confdefs.h.=C2=A0 */
>     -+#include <sys/ptrace.h>
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0#include <asm/ptrace.h>
>     -+int
>     -+main ()
>     -+{
>     -+struct user_gcs u;
>     -+
>     -+=C2=A0 ;
>     -+=C2=A0 return 0;
>     -+}
>     -+_ACEOF
>     -+if ac_fn_c_try_compile "$LINENO"; then :
>     -+=C2=A0 gdb_cv_struct_user_gcs=3Dyes
>     -+else
>     -+=C2=A0 gdb_cv_struct_user_gcs=3Dno
>     -+
>     -+fi
>     -+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
>     -+
>     -+fi
>     -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result:
>     $gdb_cv_struct_user_gcs" >&5
>     -+$as_echo "$gdb_cv_struct_user_gcs" >&6; }
>     -+if test "$gdb_cv_struct_user_gcs" =3D yes; then
>     -+
>     -+$as_echo "#define HAVE_STRUCT_USER_GCS 1" >>confdefs.h
>     -+
>     -+fi
>     -+
>     - # Set the 'development' global.
>     - . $srcdir/../bfd/development.sh
>     <https://urldefense.com/v3/__http://development.sh__;!!AjveYdw8EvQ!=
fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U=
9MftNMOnk1_cOqLx6x1YDSefg$>
>     -
>     -diff --git a/gdbsupport/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!fy=
AFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9M=
ftNMOnk1_cOqLx6zsHPeD8A$>
>     b/gdbsupport/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!fy=
AFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9M=
ftNMOnk1_cOqLx6zsHPeD8A$>
>     -index b7ccfabd6c6..d3b4c05daeb 100644
>     ---- a/gdbsupport/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!fy=
AFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9M=
ftNMOnk1_cOqLx6zsHPeD8A$>
>     -+++ b/gdbsupport/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!fy=
AFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9M=
ftNMOnk1_cOqLx6zsHPeD8A$>
>     -@@ -68,6 +68,25 @@ GDB_AC_PTRACE
>     - AM_GDB_COMPILER_TYPE
>     - AM_GDB_WARNINGS
>     -
>     -+# Check for `struct user_gcs`
>     -+AC_CACHE_CHECK(
>     -+=C2=A0 [for struct user_gcs],
>     -+=C2=A0 [gdb_cv_struct_user_gcs],
>     -+=C2=A0 [AC_COMPILE_IFELSE(
>     -+=C2=A0 =C2=A0 =C2=A0[AC_LANG_PROGRAM(
>     -+=C2=A0 =C2=A0 =C2=A0 [#include <sys/ptrace.h>
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0#include <asm/ptrace.h>],
>     -+=C2=A0 =C2=A0 =C2=A0 [struct user_gcs u;]
>     -+=C2=A0 =C2=A0 =C2=A0 )],
>     -+=C2=A0 =C2=A0 =C2=A0[gdb_cv_struct_user_gcs=3Dyes],
>     -+=C2=A0 =C2=A0 =C2=A0[gdb_cv_struct_user_gcs=3Dno]
>     -+=C2=A0 )]
>     -+)
>     -+if test "$gdb_cv_struct_user_gcs" =3D yes; then
>     -+=C2=A0 AC_DEFINE(HAVE_STRUCT_USER_GCS, 1,
>     -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [Define to 1 if your system ha=
s struct user_gcs.])
>     -+fi
>     -+
>     - # Set the 'development' global.
>     - . $srcdir/../bfd/development.sh
>     <https://urldefense.com/v3/__http://development.sh__;!!AjveYdw8EvQ!=
fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U=
9MftNMOnk1_cOqLx6x1YDSefg$>
>     -
>     ---
>     -2.49.0
>     -
>     diff --git a/meta/recipes-devtools/gdb/gdb_17.1.bb
>     <https://urldefense.com/v3/__http://gdb_17.1.bb__;!!AjveYdw8EvQ!fyA=
FzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9Mf=
tNMOnk1_cOqLx6xWLB4o5A$>
>     b/meta/recipes-devtools/gdb/gdb_17.2.bb
>     <https://urldefense.com/v3/__http://gdb_17.2.bb__;!!AjveYdw8EvQ!fyA=
FzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9Mf=
tNMOnk1_cOqLx6wwl9u49Q$>
>     similarity index 100%
>     rename from meta/recipes-devtools/gdb/gdb_17.1.bb
>     <https://urldefense.com/v3/__http://gdb_17.1.bb__;!!AjveYdw8EvQ!fyA=
FzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9Mf=
tNMOnk1_cOqLx6xWLB4o5A$>
>     rename to meta/recipes-devtools/gdb/gdb_17.2.bb
>     <https://urldefense.com/v3/__http://gdb_17.2.bb__;!!AjveYdw8EvQ!fyA=
FzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9Mf=
tNMOnk1_cOqLx6wwl9u49Q$>
>     --=20
>     2.49.0
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#239857):
>     https://lists.openembedded.org/g/openembedded-core/message/239857
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/239857__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4=
bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6ztvsCUVA$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/120043435/4316185
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1200=
43435/4316185__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXm=
G1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6zyaHAOsw$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Ta=
s5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6wq9xQI-g$>
>     [yoann.congal@smile.fr]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --=20
> Yoann Congal
> Smile ECS
--------------SBr5vqFJH6qvQ8YkRYF8tWZ2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65U6DCdw377141

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 30-06-2026 13:02, Yoann Congal
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMSfU+5ynmjEwTpVh-N-+a-L1nF9hA=
Du73QeKuBDeUX1-OtTMA@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr"><br>
          </div>
          <br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">Le&nbsp;mar. 30 juin 20=
26
              =C3=A0&nbsp;09:19, Varatharajan, Deepesh via
              <a href=3D"https://urldefense.com/v3/__http://lists.openemb=
edded.org__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3=
w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6zv1JC9NQ$" moz-do-not-send=3D"=
true">
                lists.openembedded.org</a> &lt;deepesh.varatharajan=3D<a =
href=3D"mailto:windriver.com@lists.openembedded.org" moz-do-not-send=3D"t=
rue" class=3D"moz-txt-link-freetext">windriver.com@lists.openembedded.org=
</a>&gt;
              a =C3=A9crit&nbsp;:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              From: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Va=
ratharajan@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" clas=
s=3D"moz-txt-link-freetext">Deepesh.Varatharajan@windriver.com</a>&gt;<br=
>
              <br>
              GDB 17.2 brings the following fixes and enhancements over
              GDB 17.1:<br>
              <a href=3D"https://urldefense.com/v3/__https://sourceware.o=
rg/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblob_plain;f=3Dgdb*NEWS;hb=3Dg=
db-17.2-release__;Lw!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas=
5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6w6DF219w$" rel=3D"nore=
ferrer" target=3D"_blank" moz-do-not-send=3D"true">https://sourceware.org=
/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblob_plain;f=3Dgdb/NEWS;hb=3Dgdb=
-17.2-release</a></blockquote>
            <div><br>
            </div>
            <div>&quot;enhancements&quot; =3D&gt; That sounds like someth=
ing that is
              *not* acceptable under stable policy. Did you check?</div>
          </div>
        </div>
      </div>
    </blockquote>
    Hi Yoann,<br>
    <br>
    Thanks for pointing this out. I had copied the commit message from
    the corresponding commit on master. I verified the changes included
    in GDB 17.2 compared to 17.1, and they are all bug fixes. I've
    updated the commit message and sent v2.<br>
    <br>
    Regards,<br>
    Deepesh
    <blockquote type=3D"cite" cite=3D"mid:CAMSfU+5ynmjEwTpVh-N-+a-L1nF9hA=
Du73QeKuBDeUX1-OtTMA@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <br>
              <br>
              &nbsp;* PR dap/33228 ([gdb/dap] error while listing registe=
r
              children)<br>
              <br>
              &nbsp;* PR gdb/33737 (gdb --help says 'For more information=
,
              type &quot;stream&quot;<br>
              &nbsp; &nbsp;from within GDB', but &quot;stream&quot; is no=
t a defined
              command)<br>
              <br>
              &nbsp;* PR build/33747 (Incompatible with MUSL libc: no mem=
ber
              named 'c_ospeed'<br>
              &nbsp; &nbsp;in 'termios')<br>
              <br>
              &nbsp;* PR gdb/33748 (gdb17 regression with displaying ANSI
              colors)<br>
              <br>
              &nbsp;* PR gdb/33753 (Out-of-bounds writes in string_{v}pri=
ntf
              -- threads<br>
              &nbsp; &nbsp;and static data don't mix)<br>
              <br>
              &nbsp;* PR cli/33761 (Setting style colors is broken on
              MS-Windows)<br>
              <br>
              &nbsp;* PR gdb/33768 (Loading compressed GDB scripts from
              .debug_gdb_scripts fails)<br>
              <br>
              &nbsp;* PR symtab/33775 ([gdb/symtab] data race in<br>
              &nbsp;
              &nbsp;dwarf2_per_cu::{set_addr_size,set_offset_size,set_ref=
_addr_size})<br>
              <br>
              &nbsp;* PR symtab/33777 ([gdb/symtab] dw2_get_file_names
              doesn't cache result<br>
              &nbsp; &nbsp;for dummy CU)<br>
              <br>
              &nbsp;* PR symtab/33825 ([dwz] Extremely slow symbol lookup
              with DWZ-compressed<br>
              &nbsp; &nbsp;debug info (thousands of partial units))<br>
              <br>
              &nbsp;* PR testsuite/33845 (gdb: There are 4 unexpected
              failures in<br>
              &nbsp; &nbsp;breakpoint-in-ro-region.exp)<br>
              <br>
              &nbsp;* PR gdb/33872 (`skip -gfile` has inverted logic)<br>
              <br>
              &nbsp;* PR gdb/33926 (GDB 17.1 AArch64: redefinition of
              user_gcs struct on musl)<br>
              <br>
              &nbsp;* PR breakpoints/34112 (rbreak `<a class=3D"moz-txt-l=
ink-freetext" href=3D"file:regex">file:regex</a>` sets
              breakpoints for matches<br>
              &nbsp; &nbsp;outside of `file` [reproducer attached])<br>
              <br>
              Drop patches merged upstream:<br>
              &nbsp; *
              0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.p=
atch<br>
              &nbsp; *
              0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.pa=
tch<br>
              <br>
              Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:D=
eepesh.Varatharajan@windriver.com" target=3D"_blank" moz-do-not-send=3D"t=
rue" class=3D"moz-txt-link-freetext">Deepesh.Varatharajan@windriver.com</=
a>&gt;<br>
              ---<br>
              &nbsp;...<a href=3D"https://urldefense.com/v3/__http://ian_=
17.1.bb__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5=
-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6yB0ZouuA$" rel=3D"noreferrer" ta=
rget=3D"_blank" moz-do-not-send=3D"true">ian_17.1.bb</a>
              =3D&gt;
              <a href=3D"https://urldefense.com/v3/__http://gdb-cross-can=
adian_17.2.bb__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXm=
G1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6yJe89jLA$" rel=3D"noreferr=
er" target=3D"_blank" moz-do-not-send=3D"true">
                gdb-cross-canadian_17.2.bb</a>} |&nbsp; &nbsp;0<br>
              &nbsp;.../{<a href=3D"https://urldefense.com/v3/__http://gd=
b-cross_17.1.bb__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5C=
XmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6yoY74hZQ$" rel=3D"norefe=
rrer" target=3D"_blank" moz-do-not-send=3D"true">gdb-cross_17.1.bb</a>
              =3D&gt;
              <a href=3D"https://urldefense.com/v3/__http://gdb-cross_17.=
2.bb__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FL=
W9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6ylk0WWdQ$" rel=3D"noreferrer" targe=
t=3D"_blank" moz-do-not-send=3D"true">
                gdb-cross_17.2.bb</a>}&nbsp; |&nbsp; &nbsp;0<br>
              &nbsp;meta/recipes-devtools/gdb/<a href=3D"https://urldefen=
se.com/v3/__http://gdb.inc__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4b=
Ucjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6x597hGWA$" mo=
z-do-not-send=3D"true">gdb.inc</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;|&nbsp; &nbsp;4 +-<br>
              &nbsp;...-ser-unix-modernize-Linux-custom-bau.patch | 248
              ------------------<br>
              &nbsp;...ux-Fix-build-failure-on-musl-systems.patch | 196
              --------------<br>
              &nbsp;.../gdb/{<a href=3D"https://urldefense.com/v3/__http:=
//gdb_17.1.bb__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXm=
G1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6xWLB4o5A$" rel=3D"noreferr=
er" target=3D"_blank" moz-do-not-send=3D"true">gdb_17.1.bb</a>
              =3D&gt;
              <a href=3D"https://urldefense.com/v3/__http://gdb_17.2.bb__=
;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_y=
xEAi5CePPVtiY5U9MftNMOnk1_cOqLx6wwl9u49Q$" rel=3D"noreferrer" target=3D"_=
blank" moz-do-not-send=3D"true">
                gdb_17.2.bb</a>}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp=
; &nbsp;0<br>
              &nbsp;6 files changed, 1 insertion(+), 447 deletions(-)<br>
              &nbsp;rename meta/recipes-devtools/gdb/{<a href=3D"https://=
urldefense.com/v3/__http://gdb-cross-canadian_17.1.bb__;!!AjveYdw8EvQ!fyA=
FzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9Mf=
tNMOnk1_cOqLx6yFqh5ynQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-=
send=3D"true">gdb-cross-canadian_17.1.bb</a>
              =3D&gt; <a href=3D"https://urldefense.com/v3/__http://gdb-c=
ross-canadian_17.2.bb__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz=
1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6yJe89jLA$" rel=3D"=
noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
                gdb-cross-canadian_17.2.bb</a>} (100%)<br>
              &nbsp;rename meta/recipes-devtools/gdb/{<a href=3D"https://=
urldefense.com/v3/__http://gdb-cross_17.1.bb__;!!AjveYdw8EvQ!fyAFzcZAS5Sw=
W5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_c=
OqLx6yoY74hZQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"t=
rue">gdb-cross_17.1.bb</a>
              =3D&gt; <a href=3D"https://urldefense.com/v3/__http://gdb-c=
ross_17.2.bb__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG=
1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6ylk0WWdQ$" rel=3D"noreferre=
r" target=3D"_blank" moz-do-not-send=3D"true">
                gdb-cross_17.2.bb</a>} (100%)<br>
              &nbsp;delete mode 100644
meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Li=
nux-custom-bau.patch<br>
              &nbsp;delete mode 100644
meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on=
-musl-systems.patch<br>
              &nbsp;rename meta/recipes-devtools/gdb/{<a href=3D"https://=
urldefense.com/v3/__http://gdb_17.1.bb__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3ko=
SFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6x=
WLB4o5A$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">g=
db_17.1.bb</a>
              =3D&gt; <a href=3D"https://urldefense.com/v3/__http://gdb_1=
7.2.bb__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-=
FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6wwl9u49Q$" rel=3D"noreferrer" tar=
get=3D"_blank" moz-do-not-send=3D"true">
                gdb_17.2.bb</a>} (100%)<br>
              <br>
              diff --git a/meta/recipes-devtools/gdb/<a href=3D"https://u=
rldefense.com/v3/__http://gdb-cross-canadian_17.1.bb__;!!AjveYdw8EvQ!fyAF=
zcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9Mft=
NMOnk1_cOqLx6yFqh5ynQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-s=
end=3D"true">gdb-cross-canadian_17.1.bb</a>
              b/meta/recipes-devtools/gdb/<a href=3D"https://urldefense.c=
om/v3/__http://gdb-cross-canadian_17.2.bb__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I=
3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqL=
x6yJe89jLA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">gdb-cross-canadian_17.2.bb</a><br>
              similarity index 100%<br>
              rename from meta/recipes-devtools/gdb/<a href=3D"https://ur=
ldefense.com/v3/__http://gdb-cross-canadian_17.1.bb__;!!AjveYdw8EvQ!fyAFz=
cZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftN=
MOnk1_cOqLx6yFqh5ynQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-se=
nd=3D"true">gdb-cross-canadian_17.1.bb</a><br>
              rename to meta/recipes-devtools/gdb/<a href=3D"https://urld=
efense.com/v3/__http://gdb-cross-canadian_17.2.bb__;!!AjveYdw8EvQ!fyAFzcZ=
AS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMO=
nk1_cOqLx6yJe89jLA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=
=3D"true">gdb-cross-canadian_17.2.bb</a><br>
              diff --git a/meta/recipes-devtools/gdb/<a href=3D"https://u=
rldefense.com/v3/__http://gdb-cross_17.1.bb__;!!AjveYdw8EvQ!fyAFzcZAS5SwW=
5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cO=
qLx6yoY74hZQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tr=
ue">gdb-cross_17.1.bb</a>
              b/meta/recipes-devtools/gdb/<a href=3D"https://urldefense.c=
om/v3/__http://gdb-cross_17.2.bb__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppd=
Xq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6ylk0WWd=
Q$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">gdb-cro=
ss_17.2.bb</a><br>
              similarity index 100%<br>
              rename from meta/recipes-devtools/gdb/<a href=3D"https://ur=
ldefense.com/v3/__http://gdb-cross_17.1.bb__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5=
I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOq=
Lx6yoY74hZQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">gdb-cross_17.1.bb</a><br>
              rename to meta/recipes-devtools/gdb/<a href=3D"https://urld=
efense.com/v3/__http://gdb-cross_17.2.bb__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3=
koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx=
6ylk0WWdQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>gdb-cross_17.2.bb</a><br>
              diff --git a/meta/recipes-devtools/gdb/<a href=3D"https://u=
rldefense.com/v3/__http://gdb.inc__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwpp=
dXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6x597hG=
WA$" moz-do-not-send=3D"true">gdb.inc</a>
              b/meta/recipes-devtools/gdb/<a href=3D"https://urldefense.c=
om/v3/__http://gdb.inc__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcju=
z1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6x597hGWA$" moz-do=
-not-send=3D"true">gdb.inc</a><br>
              index d367486d02..cbb5885459 100644<br>
              --- a/meta/recipes-devtools/gdb/<a href=3D"https://urldefen=
se.com/v3/__http://gdb.inc__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4b=
Ucjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6x597hGWA$" mo=
z-do-not-send=3D"true">gdb.inc</a><br>
              +++ b/meta/recipes-devtools/gdb/<a href=3D"https://urldefen=
se.com/v3/__http://gdb.inc__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4b=
Ucjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6x597hGWA$" mo=
z-do-not-send=3D"true">gdb.inc</a><br>
              @@ -13,7 +13,5 @@ SRC_URI =3D
              &quot;${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class=3D"moz-t=
xt-link-freetext" href=3D"file://0006-Fix-invalid-sigprocmask-call.patch"=
>file://0006-Fix-invalid-sigprocmask-call.patch</a>
              \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              <a class=3D"moz-txt-link-freetext" href=3D"file://0007-Defi=
ne-alignof-using-_Alignof-when-using-C11-or-newe.patch">file://0007-Defin=
e-alignof-using-_Alignof-when-using-C11-or-newe.patch</a>
              \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              <a class=3D"moz-txt-link-freetext" href=3D"file://0008-Add-=
fix-for-packages-that-are-not-compatible-with-C2.patch">file://0008-Add-f=
ix-for-packages-that-are-not-compatible-with-C2.patch</a>
              \<br>
              -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://000=
9-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch">file://0009=
-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch</a>
              \<br>
              -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
              &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://001=
0-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch">file://0010-=
GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch</a>
              \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
              -SRC_URI[sha256sum] =3D
              &quot;14996f5f74c9f68f5a543fdc45bca7800207f91f92aeea6c2e791=
822c7c6d876&quot;<br>
              +SRC_URI[sha256sum] =3D
              &quot;1c036c0d72e4b3d1fb5c94c88632add6f9d76f4d7c4d2ea793c12=
a9f19a3228c&quot;<br>
              diff --git
a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-=
Linux-custom-bau.patch
b/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-=
Linux-custom-bau.patch<br>
              deleted file mode 100644<br>
              index 30d22b21f9..0000000000<br>
              ---
a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-=
Linux-custom-bau.patch<br>
              +++ /dev/null<br>
              @@ -1,248 +0,0 @@<br>
              -From 1a77c71303b552140613d49595baebdff1a4716e Mon Sep 17
              00:00:00 2001<br>
              -From: Sunil Dora &lt;<a href=3D"mailto:sunilkumar.dora@win=
driver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-l=
ink-freetext">sunilkumar.dora@windriver.com</a>&gt;<br>
              -Date: Tue, 17 Mar 2026 01:58:55 -0700<br>
              -Subject: [PATCH] PR gdb/33747: gdb/ser-unix: modernize
              Linux custom baud rate<br>
              - support<br>
              -<br>
              -The Linux custom baud rate implementation previously
              accessed the<br>
              -struct termios members c_ispeed and c_ospeed directly.
              These fields<br>
              -exist in glibc but are not exposed by musl, causing
              builds to fail on<br>
              -musl-based systems.<br>
              -<br>
              -Update set_custom_baudrate_linux to use a
              capability-based approach,<br>
              -with three distinct code paths:<br>
              -<br>
              -1) If POSIX cfsetispeed/cfsetospeed accept arbitrary baud
              rates<br>
              -&nbsp; &nbsp;(HAVE_CFSETSPEED_ARBITRARY), use them to set =
input and
              output<br>
              -&nbsp; &nbsp;speeds.<br>
              -<br>
              -2) Else if Linux termios2 interface is available
              (TCGETS2/BOTHER),<br>
              -&nbsp; &nbsp;use it to support arbitrary baud rates.<br>
              -<br>
              -3) Else if legacy struct termios supports
              c_ispeed/c_ospeed, use<br>
              -&nbsp; &nbsp;the TCGETS/TCSETS fallback (primarily for gli=
bc on
              older<br>
              -&nbsp; &nbsp;architectures).<br>
              -<br>
              -4) Otherwise, emit an error indicating that custom baud
              rates are<br>
              -&nbsp; &nbsp;unsupported on this platform.<br>
              -<br>
              -This preserves existing behavior on glibc systems while
              restoring<br>
              -build compatibility with musl and other libc
              implementations.<br>
              -<br>
              -Bug: <a href=3D"https://urldefense.com/v3/__https://source=
ware.org/bugzilla/show_bug.cgi?id=3D33747__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I=
3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqL=
x6x5rToniQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">
                https://sourceware.org/bugzilla/show_bug.cgi?id=3D33747</=
a><br>
              -<br>
              -Upstream-Status: Submitted [<a href=3D"https://urldefense.=
com/v3/__https://sourceware.org/pipermail/gdb-patches/2026-March/225952.h=
tml__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW=
9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6zX2Iunnw$" rel=3D"noreferrer" target=
=3D"_blank" moz-do-not-send=3D"true">https://sourceware.org/pipermail/gdb=
-patches/2026-March/225952.html</a>]<br>
              -<br>
              -Suggested-by: Kevin Buettner &lt;<a href=3D"mailto:kevinb@=
redhat.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-l=
ink-freetext">kevinb@redhat.com</a>&gt;<br>
              -Suggested-by: Maciej W. Rozycki &lt;<a href=3D"mailto:macr=
o@orcam.me.uk" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-tx=
t-link-freetext">macro@orcam.me.uk</a>&gt;<br>
              -Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar=
.dora@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"=
moz-txt-link-freetext">sunilkumar.dora@windriver.com</a>&gt;<br>
              ----<br>
              - gdb/<a href=3D"https://urldefense.com/v3/__http://config.=
in__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9=
Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6wtaWha9Q$" rel=3D"noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true">config.in</a>&nbsp;
              &nbsp; |&nbsp; 6 ++++++<br>
              - gdb/configure&nbsp; &nbsp; | 52
              +++++++++++++++++++++++++++++++++++++++++++++<br>
              - gdb/<a href=3D"https://urldefense.com/v3/__http://configu=
re.ac__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-F=
LW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6zsHPeD8A$" rel=3D"noreferrer" targ=
et=3D"_blank" moz-do-not-send=3D"true">configure.ac</a>
              | 22 +++++++++++++++++++<br>
              - gdb/ser-unix.c&nbsp; &nbsp;| 55
              ++++++++++++++++++++++++++++++++++--------------<br>
              - 4 files changed, 119 insertions(+), 16 deletions(-)<br>
              -<br>
              -diff --git a/gdb/<a href=3D"https://urldefense.com/v3/__ht=
tp://config.in__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CX=
mG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6wtaWha9Q$" rel=3D"norefer=
rer" target=3D"_blank" moz-do-not-send=3D"true">config.in</a>
              b/gdb/<a href=3D"https://urldefense.com/v3/__http://config.=
in__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9=
Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6wtaWha9Q$" rel=3D"noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true">config.in</a><br>
              -index efc3100cb9e..b2469c8dabd 100644<br>
              ---- a/gdb/<a href=3D"https://urldefense.com/v3/__http://co=
nfig.in__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5=
-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6wtaWha9Q$" rel=3D"noreferrer" ta=
rget=3D"_blank" moz-do-not-send=3D"true">config.in</a><br>
              -+++ b/gdb/<a href=3D"https://urldefense.com/v3/__http://co=
nfig.in__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5=
-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6wtaWha9Q$" rel=3D"noreferrer" ta=
rget=3D"_blank" moz-do-not-send=3D"true">config.in</a><br>
              -@@ -110,6 +110,9 @@<br>
              -&nbsp; &nbsp; the CoreFoundation framework. */<br>
              - #undef HAVE_CFPREFERENCESCOPYAPPVALUE<br>
              - <br>
              -+/* Define if cfsetispeed/cfsetospeed accept arbitrary
              baud rates */<br>
              -+#undef HAVE_CFSETSPEED_ARBITRARY<br>
              -+<br>
              - /* Define if compiling support to gdb compile. */<br>
              - #undef HAVE_COMPILE<br>
              - <br>
              -@@ -517,6 +520,9 @@<br>
              - /* Define to 1 if `st_blocks' is a member of `struct
              stat'. */<br>
              - #undef HAVE_STRUCT_STAT_ST_BLOCKS<br>
              - <br>
              -+/* Define to 1 if `c_ospeed' is a member of `struct
              termios'. */<br>
              -+#undef HAVE_STRUCT_TERMIOS_C_OSPEED<br>
              -+<br>
              - /* Define to 1 if `td_pcb' is a member of `struct
              thread'. */<br>
              - #undef HAVE_STRUCT_THREAD_TD_PCB<br>
              - <br>
              -diff --git a/gdb/configure b/gdb/configure<br>
              -index d0bdba6eb36..8a0e2fa2771 100755<br>
              ---- a/gdb/configure<br>
              -+++ b/gdb/configure<br>
              -@@ -27336,6 +27336,58 @@ if test &quot;$ac_res&quot; !=3D =
no; then :<br>
              - fi<br>
              - <br>
              - <br>
              -+# Check whether cfsetispeed/cfsetospeed accept arbitrary
              baud rates.<br>
              -+{ $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking
              whether cfsetispeed/cfsetospeed accept arbitrary baud
              rates&quot; &gt;&amp;5<br>
              -+$as_echo_n &quot;checking whether cfsetispeed/cfsetospeed
              accept arbitrary baud rates... &quot; &gt;&amp;6; }<br>
              -+if ${gdb_cv_cfsetspeed_arbitrary+:} false; then :<br>
              -+&nbsp; $as_echo_n &quot;(cached) &quot; &gt;&amp;6<br>
              -+else<br>
              -+<br>
              -+&nbsp; cat confdefs.h - &lt;&lt;_ACEOF &gt;conftest.$ac_e=
xt<br>
              -+/* end confdefs.h.&nbsp; */<br>
              -+#include &lt;termios.h&gt;<br>
              -+int<br>
              -+main ()<br>
              -+{<br>
              -+<br>
              -+&nbsp; &nbsp; &nbsp; &nbsp;#if B9600 !=3D 9600<br>
              -+&nbsp; &nbsp; &nbsp; &nbsp;#error B-constants are not num=
eric symbols<br>
              -+&nbsp; &nbsp; &nbsp; &nbsp;#endif<br>
              -+<br>
              -+&nbsp; ;<br>
              -+&nbsp; return 0;<br>
              -+}<br>
              -+_ACEOF<br>
              -+if ac_fn_c_try_compile &quot;$LINENO&quot;; then :<br>
              -+&nbsp; gdb_cv_cfsetspeed_arbitrary=3Dyes<br>
              -+else<br>
              -+&nbsp; gdb_cv_cfsetspeed_arbitrary=3Dno<br>
              -+fi<br>
              -+rm -f core conftest.err conftest.$ac_objext
              conftest.$ac_ext<br>
              -+<br>
              -+fi<br>
              -+{ $as_echo &quot;$as_me:${as_lineno-$LINENO}: result:
              $gdb_cv_cfsetspeed_arbitrary&quot; &gt;&amp;5<br>
              -+$as_echo &quot;$gdb_cv_cfsetspeed_arbitrary&quot; &gt;&am=
p;6; }<br>
              -+<br>
              -+if test &quot;$gdb_cv_cfsetspeed_arbitrary&quot; =3D yes;=
 then<br>
              -+<br>
              -+$as_echo &quot;#define HAVE_CFSETSPEED_ARBITRARY 1&quot;
              &gt;&gt;confdefs.h<br>
              -+<br>
              -+fi<br>
              -+<br>
              -+# Check for members required by the legacy Linux custom
              baud rate path.<br>
              -+ac_fn_c_check_member &quot;$LINENO&quot; &quot;struct ter=
mios&quot;
              &quot;c_ospeed&quot; &quot;ac_cv_member_struct_termios_c_os=
peed&quot;
              &quot;#include &lt;termios.h&gt;<br>
              -+&quot;<br>
              -+if test &quot;x$ac_cv_member_struct_termios_c_ospeed&quot=
; =3D xyes;
              then :<br>
              -+<br>
              -+cat &gt;&gt;confdefs.h &lt;&lt;_ACEOF<br>
              -+#define HAVE_STRUCT_TERMIOS_C_OSPEED 1<br>
              -+_ACEOF<br>
              -+<br>
              -+<br>
              -+fi<br>
              -+<br>
              -+<br>
              - <br>
              - <br>
              - # Check whether --with-jit-reader-dir was given.<br>
              -diff --git a/gdb/<a href=3D"https://urldefense.com/v3/__ht=
tp://configure.ac__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas=
5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6zsHPeD8A$" rel=3D"nore=
ferrer" target=3D"_blank" moz-do-not-send=3D"true">configure.ac</a>
              b/gdb/<a href=3D"https://urldefense.com/v3/__http://configu=
re.ac__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-F=
LW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6zsHPeD8A$" rel=3D"noreferrer" targ=
et=3D"_blank" moz-do-not-send=3D"true">configure.ac</a><br>
              -index 52924106bca..26e8d1ee276 100644<br>
              ---- a/gdb/<a href=3D"https://urldefense.com/v3/__http://co=
nfigure.ac__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n=
3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6zsHPeD8A$" rel=3D"noreferrer"=
 target=3D"_blank" moz-do-not-send=3D"true">configure.ac</a><br>
              -+++ b/gdb/<a href=3D"https://urldefense.com/v3/__http://co=
nfigure.ac__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n=
3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6zsHPeD8A$" rel=3D"noreferrer"=
 target=3D"_blank" moz-do-not-send=3D"true">configure.ac</a><br>
              -@@ -733,6 +733,28 @@ AC_CONFIG_FILES([jit-reader.h:<a href=
=3D"https://urldefense.com/v3/__http://jit-reader.in__;!!AjveYdw8EvQ!fyAF=
zcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9Mft=
NMOnk1_cOqLx6yfW7KtxA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-s=
end=3D"true">jit-reader.in</a>])<br>
              - <br>
              - AC_SEARCH_LIBS(dlopen, dl)<br>
              - <br>
              -+# Check whether cfsetispeed/cfsetospeed accept arbitrary
              baud rates.<br>
              -+AC_CACHE_CHECK([whether cfsetispeed/cfsetospeed accept
              arbitrary baud rates],<br>
              -+&nbsp; [gdb_cv_cfsetspeed_arbitrary], [<br>
              -+&nbsp; AC_COMPILE_IFELSE(<br>
              -+&nbsp; &nbsp; [AC_LANG_PROGRAM([[#include &lt;termios.h&g=
t;]],<br>
              -+&nbsp; &nbsp; &nbsp; [[<br>
              -+&nbsp; &nbsp; &nbsp; &nbsp;#if B9600 !=3D 9600<br>
              -+&nbsp; &nbsp; &nbsp; &nbsp;#error B-constants are not num=
eric symbols<br>
              -+&nbsp; &nbsp; &nbsp; &nbsp;#endif<br>
              -+&nbsp; &nbsp; &nbsp; ]])],<br>
              -+&nbsp; &nbsp; [gdb_cv_cfsetspeed_arbitrary=3Dyes],<br>
              -+&nbsp; &nbsp; [gdb_cv_cfsetspeed_arbitrary=3Dno])<br>
              -+])<br>
              -+<br>
              -+if test &quot;$gdb_cv_cfsetspeed_arbitrary&quot; =3D yes;=
 then<br>
              -+&nbsp; AC_DEFINE([HAVE_CFSETSPEED_ARBITRARY], [1],<br>
              -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;[Define if cfset=
ispeed/cfsetospeed accept
              arbitrary baud rates])<br>
              -+fi<br>
              -+<br>
              -+# Check for members required by the legacy Linux custom
              baud rate path.<br>
              -+AC_CHECK_MEMBERS([struct termios.c_ospeed], [], [],
              [[#include &lt;termios.h&gt;]])<br>
              -+<br>
              - GDB_AC_WITH_DIR([JIT_READER_DIR], [jit-reader-dir],<br>
              -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;[directory to load the JIT readers
              from],<br>
              -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;[${libdir}/gdb])<br>
              -diff --git a/gdb/ser-unix.c b/gdb/ser-unix.c<br>
              -index 6f2766518be..fbd73970dbb 100644<br>
              ---- a/gdb/ser-unix.c<br>
              -+++ b/gdb/ser-unix.c<br>
              -@@ -508,36 +508,59 @@ set_baudcode_baudrate (struct
              serial *scb, int baud_code)<br>
              - <br>
              - #if HAVE_CUSTOM_BAUDRATE_SUPPORT &amp;&amp;
              defined(BOTHER)<br>
              - <br>
              --/* Set a custom baud rate using the termios BOTHER.&nbsp;=
 */<br>
              -+/* Set a custom baud rate.<br>
              -+<br>
              -+&nbsp; &nbsp;Prefer the POSIX cfsetispeed/cfsetospeed int=
erface
              when it accepts<br>
              -+&nbsp; &nbsp;arbitrary baud rates.&nbsp; Otherwise fall b=
ack to
              Linux-specific termios2<br>
              -+&nbsp; &nbsp;(BOTHER) or legacy termios interfaces.&nbsp;=
 */<br>
              - <br>
              - static void<br>
              - set_custom_baudrate_linux (int fd, int rate)<br>
              - {<br>
              --#ifdef TCGETS2<br>
              --&nbsp; struct termios2 tio;<br>
              --&nbsp; const unsigned long req_get =3D TCGETS2;<br>
              --&nbsp; const unsigned long req_set =3D TCSETS2;<br>
              --#else<br>
              -+#if defined(HAVE_CFSETSPEED_ARBITRARY)<br>
              -&nbsp; &nbsp;struct termios tio;<br>
              --&nbsp; const unsigned long req_get =3D TCGETS;<br>
              --&nbsp; const unsigned long req_set =3D TCSETS;<br>
              --#endif<br>
              -+&nbsp; if (tcgetattr (fd, &amp;tio) &lt; 0)<br>
              -+&nbsp; &nbsp; perror_with_name (_(&quot;Cannot get curren=
t baud
              rate&quot;));<br>
              -+<br>
              -+&nbsp; cfsetispeed (&amp;tio, rate);<br>
              -+&nbsp; cfsetospeed (&amp;tio, rate);<br>
              -+<br>
              -+&nbsp; if (tcsetattr (fd, TCSANOW, &amp;tio) &lt; 0)<br>
              -+&nbsp; &nbsp; perror_with_name (_(&quot;Cannot set custom=
 baud rate&quot;));<br>
              -+<br>
              -+#elif defined(TCGETS2)<br>
              -+&nbsp; struct termios2 tio2;<br>
              -+&nbsp; if (ioctl (fd, TCGETS2, &amp;tio2) &lt; 0)<br>
              -+&nbsp; &nbsp; perror_with_name (_(&quot;Cannot get curren=
t baud
              rate&quot;));<br>
              -+<br>
              -+&nbsp; tio2.c_cflag &amp;=3D ~CBAUD;<br>
              -+&nbsp; tio2.c_cflag |=3D BOTHER;<br>
              -+&nbsp; tio2.c_ospeed =3D rate;<br>
              -+&nbsp; tio2.c_cflag &amp;=3D ~(CBAUD &lt;&lt; IBSHIFT);<b=
r>
              -+&nbsp; tio2.c_cflag |=3D BOTHER &lt;&lt; IBSHIFT;<br>
              -+&nbsp; tio2.c_ispeed =3D rate;<br>
              - <br>
              --&nbsp; if (ioctl (fd, req_get, &amp;tio) &lt; 0)<br>
              --&nbsp; &nbsp; perror_with_name (_(&quot;Can not get curre=
nt baud
              rate&quot;));<br>
              -+&nbsp; if (ioctl (fd, TCSETS2, &amp;tio2) &lt; 0)<br>
              -+&nbsp; &nbsp; perror_with_name (_(&quot;Cannot set custom=
 baud rate&quot;));<br>
              -+<br>
              -+#elif defined(HAVE_STRUCT_TERMIOS_C_OSPEED)<br>
              -+&nbsp; struct termios tio;<br>
              -+&nbsp; if (ioctl (fd, TCGETS, &amp;tio) &lt; 0)<br>
              -+&nbsp; &nbsp; perror_with_name (_(&quot;Cannot get curren=
t baud
              rate&quot;));<br>
              - <br>
              --&nbsp; /* Clear the current output baud rate and fill a n=
ew
              value.&nbsp; */<br>
              -&nbsp; &nbsp;tio.c_cflag &amp;=3D ~CBAUD;<br>
              -&nbsp; &nbsp;tio.c_cflag |=3D BOTHER;<br>
              -&nbsp; &nbsp;tio.c_ospeed =3D rate;<br>
              --<br>
              --&nbsp; /* Clear the current input baud rate and fill a ne=
w
              value.&nbsp; */<br>
              -&nbsp; &nbsp;tio.c_cflag &amp;=3D ~(CBAUD &lt;&lt; IBSHIFT=
);<br>
              -&nbsp; &nbsp;tio.c_cflag |=3D BOTHER &lt;&lt; IBSHIFT;<br>
              -&nbsp; &nbsp;tio.c_ispeed =3D rate;<br>
              - <br>
              --&nbsp; if (ioctl (fd, req_set, &amp;tio) &lt; 0)<br>
              --&nbsp; &nbsp; perror_with_name (_(&quot;Can not set custo=
m baud
              rate&quot;));<br>
              -+&nbsp; if (ioctl (fd, TCSETS, &amp;tio) &lt; 0)<br>
              -+&nbsp; &nbsp; perror_with_name (_(&quot;Cannot set custom=
 baud rate&quot;));<br>
              -+<br>
              -+#else<br>
              -+&nbsp; error (_(&quot;Custom baud rate not supported on t=
his
              platform&quot;));<br>
              -+#endif<br>
              - }<br>
              - <br>
              - #elif HAVE_CUSTOM_BAUDRATE_SUPPORT &amp;&amp;
              defined(IOSSIOSPEED)<br>
              --- <br>
              -2.49.0<br>
              -<br>
              diff --git
a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-=
on-musl-systems.patch
b/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-=
on-musl-systems.patch<br>
              deleted file mode 100644<br>
              index 2d91a351d2..0000000000<br>
              ---
a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-=
on-musl-systems.patch<br>
              +++ /dev/null<br>
              @@ -1,196 +0,0 @@<br>
              -From 654223c799910837c80d0964a971fbdf7808864a Mon Sep 17
              00:00:00 2001<br>
              -From: Thiago Jung Bauermann &lt;<a href=3D"mailto:thiago.b=
auermann@linaro.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"=
moz-txt-link-freetext">thiago.bauermann@linaro.org</a>&gt;<br>
              -Date: Tue, 17 Mar 2026 02:24:48 -0700<br>
              -Subject: [PATCH] GDB: aarch64-linux: Fix build failure on
              musl systems<br>
              -<br>
              -(cherry picked from commit
              02090062127d59978ccc312dabf63c6ea838cd85)<br>
              -<br>
              -When building against musl (e.g. on Alpine Linux), the
              following error<br>
              -happens:<br>
              -<br>
              -&nbsp; &nbsp; CXX&nbsp; &nbsp; linux-aarch64-low.o<br>
              -&nbsp; In file included from
              /home/bauermann/src/binutils-gdb/gdbserver/<a href=3D"https=
://urldefense.com/v3/__http://linux-aarch64-low.cc__;!!AjveYdw8EvQ!fyAFzc=
ZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNM=
Onk1_cOqLx6xCC5mxjg$" moz-do-not-send=3D"true">linux-aarch64-low.cc</a>:4=
2:<br>
              -&nbsp;
/home/bauermann/src/binutils-gdb/gdbserver/../gdb/arch/aarch64-gcs-linux.=
h:35:8:
              error: redefinition of 'struct user_gcs'<br>
              -&nbsp; &nbsp; &nbsp;35 | struct user_gcs<br>
              -&nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; ^=
~~~~~~~<br>
              -&nbsp; In file included from
              /home/bauermann/src/binutils-gdb/gdbserver/<a href=3D"https=
://urldefense.com/v3/__http://linux-aarch64-low.cc__;!!AjveYdw8EvQ!fyAFzc=
ZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNM=
Onk1_cOqLx6xCC5mxjg$" moz-do-not-send=3D"true">linux-aarch64-low.cc</a>:3=
5:<br>
              -&nbsp; /usr/include/asm/ptrace.h:329:8: note: previous
              definition of 'struct user_gcs'<br>
              -&nbsp; &nbsp; 329 | struct user_gcs {<br>
              -&nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; ^=
~~~~~~~<br>
              -&nbsp; make[2]: *** [Makefile:565: linux-aarch64-low.o] Er=
ror
              1<br>
              -<br>
              -aarch64-linux-tdep.c fails to build in the same way.&nbsp;
              This happens because<br>
              -aarch64-gcs-linux.h uses GCS_MAGIC to see whether the
              system headers<br>
              -have GCS-related definitions.&nbsp; The problem is that
              GCS_MAGIC is defined in<br>
              -&lt;asm/sigcontext.h&gt; while struct gcs_user is defined
              in &lt;asm/ptrace.h&gt;.<br>
              -It's fine on glibc systems because in the set of system
              headers that<br>
              <a href=3D"https://urldefense.com/v3/__http://-linux-aarch6=
4-low.cc__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w=
5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6yxF3rpGw$" moz-do-not-send=3D"t=
rue">-linux-aarch64-low.cc</a> and
              aarch64-linux-tdep.c include, &lt;asm/sigcontext.h&gt;<br>
              -ends up being included implicitly as well.&nbsp; This does=
n't
              happen when using<br>
              -musl's headers though.<br>
              -<br>
              -There isn't a macro in &lt;asm/ptrace.h&gt; whose
              presence is correlated with<br>
              -the presence of the struct user_gcs definition, so a
              configure check is<br>
              -needed to detect it and conditionally define the struct.<b=
r>
              -<br>
              -Also, this change requires aarch64-linux-tdep.c to stop
              using<br>
              -struct user_gcs because target-dependent code can't
              include &lt;asm/ptrace.h&gt;<br>
              -and thus even if HAVE_STRUCT_USER_GCS is set, the file
              won't have the<br>
              -struct definition available. To fix this problem, also
              backport the<br>
              -definition of AARCH64_LINUX_SIZEOF_GCS_REGSET and use it
              there.<br>
              -<br>
              -Note that there's another build issue with musl,
              described in<br>
              -PR gdb/33747 affecting compilation of gdb/ser-unix.c.&nbsp=
; In
              order to be<br>
              -able to test this patch, I applied the patch in comment
              11 there.<br>
              -<br>
              -Tested with a native build on an Alpine Linux aarch64
              system, and also<br>
              -verified that all gdb.arch/aarch64-gcs*.exp tests pass on
              it.<br>
              -<br>
              -Bug: <a href=3D"https://urldefense.com/v3/__https://source=
ware.org/bugzilla/show_bug.cgi?id=3D33926__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I=
3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqL=
x6xV7oGggg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">
                https://sourceware.org/bugzilla/show_bug.cgi?id=3D33926</=
a><br>
              -<br>
              -Upstream-Status: Submitted [<a href=3D"https://urldefense.=
com/v3/__https://sourceware.org/pipermail/gdb-patches/2026-March/226049.h=
tml__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW=
9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6w1KI1NIQ$" rel=3D"noreferrer" target=
=3D"_blank" moz-do-not-send=3D"true">https://sourceware.org/pipermail/gdb=
-patches/2026-March/226049.html</a>]<br>
              -<br>
              -Co-authored-by: Chris Packham &lt;<a href=3D"mailto:judge.=
packham@gmail.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"mo=
z-txt-link-freetext">judge.packham@gmail.com</a>&gt;<br>
              -Signed-off-by: Sunil Dora &lt;<a href=3D"mailto:sunilkumar=
.dora@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"=
moz-txt-link-freetext">sunilkumar.dora@windriver.com</a>&gt;<br>
              ----<br>
              - gdb/aarch64-linux-tdep.c&nbsp; &nbsp; &nbsp;|&nbsp; 5 +++=
--<br>
              - gdb/arch/aarch64-gcs-linux.h |&nbsp; 8 +++++---<br>
              - gdbsupport/<a href=3D"https://urldefense.com/v3/__http://=
config.in__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3=
w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6wtaWha9Q$" rel=3D"noreferrer" =
target=3D"_blank" moz-do-not-send=3D"true">config.in</a>&nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 3 +++<br>
              - gdbsupport/configure&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 3=
6
              ++++++++++++++++++++++++++++++++++++<br>
              - gdbsupport/<a href=3D"https://urldefense.com/v3/__http://=
configure.ac__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG=
1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6zsHPeD8A$" rel=3D"noreferre=
r" target=3D"_blank" moz-do-not-send=3D"true">configure.ac</a>&nbsp;
              &nbsp; &nbsp; | 19 +++++++++++++++++++<br>
              - 5 files changed, 66 insertions(+), 5 deletions(-)<br>
              -<br>
              -diff --git a/gdb/aarch64-linux-tdep.c
              b/gdb/aarch64-linux-tdep.c<br>
              -index 76bde85188b..6c402e7ecdd 100644<br>
              ---- a/gdb/aarch64-linux-tdep.c<br>
              -+++ b/gdb/aarch64-linux-tdep.c<br>
              -@@ -1684,8 +1684,9 @@
              aarch64_linux_iterate_over_regset_sections (struct gdbarch
              *gdbarch,<br>
              -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gcs_regmap, regcache_sup=
ply_regset,
              regcache_collect_regset<br>
              -&nbsp; &nbsp; &nbsp; &nbsp;};<br>
              - <br>
              --&nbsp; &nbsp; &nbsp; cb (&quot;.reg-aarch-gcs&quot;, size=
of (user_gcs), sizeof
              (user_gcs),<br>
              --&nbsp; &nbsp; &nbsp; &nbsp; &amp;aarch64_linux_gcs_regset=
, &quot;GCS registers&quot;,
              cb_data);<br>
              -+&nbsp; &nbsp; &nbsp; cb (&quot;.reg-aarch-gcs&quot;,
              AARCH64_LINUX_SIZEOF_GCS_REGSET,<br>
              -+&nbsp; &nbsp; &nbsp; &nbsp; AARCH64_LINUX_SIZEOF_GCS_REGS=
ET,
              &amp;aarch64_linux_gcs_regset,<br>
              -+&nbsp; &nbsp; &nbsp; &nbsp; &quot;GCS registers&quot;, cb=
_data);<br>
              -&nbsp; &nbsp; &nbsp;}<br>
              - }<br>
              - <br>
              -diff --git a/gdb/arch/aarch64-gcs-linux.h
              b/gdb/arch/aarch64-gcs-linux.h<br>
              -index 018ca37a522..632823a8120 100644<br>
              ---- a/gdb/arch/aarch64-gcs-linux.h<br>
              -+++ b/gdb/arch/aarch64-gcs-linux.h<br>
              -@@ -27,8 +27,7 @@<br>
              - #define HWCAP_GCS (1ULL &lt;&lt; 32)<br>
              - #endif<br>
              - <br>
              --/* Make sure we only define these if the kernel header
              doesn't.&nbsp; */<br>
              --#ifndef GCS_MAGIC<br>
              -+#ifndef HAVE_STRUCT_USER_GCS<br>
              - <br>
              - /* GCS state (NT_ARM_GCS).&nbsp; */<br>
              - <br>
              -@@ -39,6 +38,9 @@ struct user_gcs<br>
              -&nbsp; &nbsp;uint64_t gcspr_el0;<br>
              - };<br>
              - <br>
              --#endif /* GCS_MAGIC */<br>
              -+#endif /* HAVE_STRUCT_USER_GCS */<br>
              -+<br>
              -+/* The GCS regset consists of 3 64-bit registers.&nbsp; *=
/<br>
              -+#define AARCH64_LINUX_SIZEOF_GCS_REGSET (3 * 8)<br>
              - <br>
              - #endif /* GDB_ARCH_AARCH64_GCS_LINUX_H */<br>
              -diff --git a/gdbsupport/<a href=3D"https://urldefense.com/=
v3/__http://config.in__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz=
1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6wtaWha9Q$" rel=3D"=
noreferrer" target=3D"_blank" moz-do-not-send=3D"true">config.in</a>
              b/gdbsupport/<a href=3D"https://urldefense.com/v3/__http://=
config.in__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3=
w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6wtaWha9Q$" rel=3D"noreferrer" =
target=3D"_blank" moz-do-not-send=3D"true">config.in</a><br>
              -index 0beacf22c05..2957ee0f030 100644<br>
              ---- a/gdbsupport/<a href=3D"https://urldefense.com/v3/__ht=
tp://config.in__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CX=
mG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6wtaWha9Q$" rel=3D"norefer=
rer" target=3D"_blank" moz-do-not-send=3D"true">config.in</a><br>
              -+++ b/gdbsupport/<a href=3D"https://urldefense.com/v3/__ht=
tp://config.in__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CX=
mG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6wtaWha9Q$" rel=3D"norefer=
rer" target=3D"_blank" moz-do-not-send=3D"true">config.in</a><br>
              -@@ -271,6 +271,9 @@<br>
              - /* Define to 1 if `st_blocks' is a member of `struct
              stat'. */<br>
              - #undef HAVE_STRUCT_STAT_ST_BLOCKS<br>
              - <br>
              -+/* Define to 1 if your system has struct user_gcs. */<br>
              -+#undef HAVE_STRUCT_USER_GCS<br>
              -+<br>
              - /* Define to 1 if you have the &lt;sys/param.h&gt;
              header file. */<br>
              - #undef HAVE_SYS_PARAM_H<br>
              - <br>
              -diff --git a/gdbsupport/configure b/gdbsupport/configure<b=
r>
              -index 133ddfa7f6c..66135791aa5 100755<br>
              ---- a/gdbsupport/configure<br>
              -+++ b/gdbsupport/configure<br>
              -@@ -14307,6 +14307,42 @@
              ac_compiler_gnu=3D$ac_cv_c_compiler_gnu<br>
              - <br>
              - <br>
              - <br>
              -+# Check for `struct user_gcs`<br>
              -+{ $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking fo=
r
              struct user_gcs&quot; &gt;&amp;5<br>
              -+$as_echo_n &quot;checking for struct user_gcs... &quot;
              &gt;&amp;6; }<br>
              -+if ${gdb_cv_struct_user_gcs+:} false; then :<br>
              -+&nbsp; $as_echo_n &quot;(cached) &quot; &gt;&amp;6<br>
              -+else<br>
              -+&nbsp; cat confdefs.h - &lt;&lt;_ACEOF &gt;conftest.$ac_e=
xt<br>
              -+/* end confdefs.h.&nbsp; */<br>
              -+#include &lt;sys/ptrace.h&gt;<br>
              -+&nbsp; &nbsp; &nbsp; &nbsp;#include &lt;asm/ptrace.h&gt;<=
br>
              -+int<br>
              -+main ()<br>
              -+{<br>
              -+struct user_gcs u;<br>
              -+<br>
              -+&nbsp; ;<br>
              -+&nbsp; return 0;<br>
              -+}<br>
              -+_ACEOF<br>
              -+if ac_fn_c_try_compile &quot;$LINENO&quot;; then :<br>
              -+&nbsp; gdb_cv_struct_user_gcs=3Dyes<br>
              -+else<br>
              -+&nbsp; gdb_cv_struct_user_gcs=3Dno<br>
              -+<br>
              -+fi<br>
              -+rm -f core conftest.err conftest.$ac_objext
              conftest.$ac_ext<br>
              -+<br>
              -+fi<br>
              -+{ $as_echo &quot;$as_me:${as_lineno-$LINENO}: result:
              $gdb_cv_struct_user_gcs&quot; &gt;&amp;5<br>
              -+$as_echo &quot;$gdb_cv_struct_user_gcs&quot; &gt;&amp;6; =
}<br>
              -+if test &quot;$gdb_cv_struct_user_gcs&quot; =3D yes; then=
<br>
              -+<br>
              -+$as_echo &quot;#define HAVE_STRUCT_USER_GCS 1&quot;
              &gt;&gt;confdefs.h<br>
              -+<br>
              -+fi<br>
              -+<br>
              - # Set the 'development' global.<br>
              - . $srcdir/../bfd/<a href=3D"https://urldefense.com/v3/__h=
ttp://development.sh__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1=
Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6x1YDSefg$" moz-do-n=
ot-send=3D"true">development.sh</a><br>
              - <br>
              -diff --git a/gdbsupport/<a href=3D"https://urldefense.com/=
v3/__http://configure.ac__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUc=
juz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6zsHPeD8A$" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">configure.ac</a>
              b/gdbsupport/<a href=3D"https://urldefense.com/v3/__http://=
configure.ac__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG=
1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6zsHPeD8A$" rel=3D"noreferre=
r" target=3D"_blank" moz-do-not-send=3D"true">configure.ac</a><br>
              -index b7ccfabd6c6..d3b4c05daeb 100644<br>
              ---- a/gdbsupport/<a href=3D"https://urldefense.com/v3/__ht=
tp://configure.ac__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas=
5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6zsHPeD8A$" rel=3D"nore=
ferrer" target=3D"_blank" moz-do-not-send=3D"true">configure.ac</a><br>
              -+++ b/gdbsupport/<a href=3D"https://urldefense.com/v3/__ht=
tp://configure.ac__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas=
5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6zsHPeD8A$" rel=3D"nore=
ferrer" target=3D"_blank" moz-do-not-send=3D"true">configure.ac</a><br>
              -@@ -68,6 +68,25 @@ GDB_AC_PTRACE<br>
              - AM_GDB_COMPILER_TYPE<br>
              - AM_GDB_WARNINGS<br>
              - <br>
              -+# Check for `struct user_gcs`<br>
              -+AC_CACHE_CHECK(<br>
              -+&nbsp; [for struct user_gcs],<br>
              -+&nbsp; [gdb_cv_struct_user_gcs],<br>
              -+&nbsp; [AC_COMPILE_IFELSE(<br>
              -+&nbsp; &nbsp; &nbsp;[AC_LANG_PROGRAM(<br>
              -+&nbsp; &nbsp; &nbsp; [#include &lt;sys/ptrace.h&gt;<br>
              -+&nbsp; &nbsp; &nbsp; &nbsp;#include &lt;asm/ptrace.h&gt;]=
,<br>
              -+&nbsp; &nbsp; &nbsp; [struct user_gcs u;]<br>
              -+&nbsp; &nbsp; &nbsp; )],<br>
              -+&nbsp; &nbsp; &nbsp;[gdb_cv_struct_user_gcs=3Dyes],<br>
              -+&nbsp; &nbsp; &nbsp;[gdb_cv_struct_user_gcs=3Dno]<br>
              -+&nbsp; )]<br>
              -+)<br>
              -+if test &quot;$gdb_cv_struct_user_gcs&quot; =3D yes; then=
<br>
              -+&nbsp; AC_DEFINE(HAVE_STRUCT_USER_GCS, 1,<br>
              -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; [Define to 1 if your s=
ystem has struct
              user_gcs.])<br>
              -+fi<br>
              -+<br>
              - # Set the 'development' global.<br>
              - . $srcdir/../bfd/<a href=3D"https://urldefense.com/v3/__h=
ttp://development.sh__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1=
Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6x1YDSefg$" moz-do-n=
ot-send=3D"true">development.sh</a><br>
              - <br>
              --- <br>
              -2.49.0<br>
              -<br>
              diff --git a/meta/recipes-devtools/gdb/<a href=3D"https://u=
rldefense.com/v3/__http://gdb_17.1.bb__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koS=
FwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6xW=
LB4o5A$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">gd=
b_17.1.bb</a>
              b/meta/recipes-devtools/gdb/<a href=3D"https://urldefense.c=
om/v3/__http://gdb_17.2.bb__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4b=
Ucjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6wwl9u49Q$" re=
l=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">gdb_17.2.bb</=
a><br>
              similarity index 100%<br>
              rename from meta/recipes-devtools/gdb/<a href=3D"https://ur=
ldefense.com/v3/__http://gdb_17.1.bb__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSF=
wppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6xWL=
B4o5A$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">gdb=
_17.1.bb</a><br>
              rename to meta/recipes-devtools/gdb/<a href=3D"https://urld=
efense.com/v3/__http://gdb_17.2.bb__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwp=
pdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6wwl9u=
49Q$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">gdb_1=
7.2.bb</a><br>
              -- <br>
              2.49.0<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#239857): <a href=3D"https://urldefense.=
com/v3/__https://lists.openembedded.org/g/openembedded-core/message/23985=
7__;!!AjveYdw8EvQ!fyAFzcZAS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9L=
t_yxEAi5CePPVtiY5U9MftNMOnk1_cOqLx6ztvsCUVA$" rel=3D"noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-core/message/239857</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/mt/120043435/4316185__;!!AjveYdw8EvQ!fyAFzcZA=
S5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMOn=
k1_cOqLx6zyaHAOsw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">
                https://lists.openembedded.org/mt/120043435/4316185</a><b=
r>
              Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@li=
sts.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
                openembedded-core+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!fyAFzcZ=
AS5SwW5I3koSFwppdXq6v4bUcjuz1Tas5CXmG1n3w5-FLW9Lt_yxEAi5CePPVtiY5U9MftNMO=
nk1_cOqLx6wq9xQI-g$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=
=3D"true">
                https://lists.openembedded.org/g/openembedded-core/unsub<=
/a>
              [<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank"=
 moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">yoann.congal@sm=
ile.fr</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <br>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">
            <div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal=
</font>
              <div><font face=3D"Raleway, regular">Smile ECS</font></div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------SBr5vqFJH6qvQ8YkRYF8tWZ2--

