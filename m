Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30267FEE4C2
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 03:27:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.112982.1772249250765870700
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 19:27:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=aUmZW0Do;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=651954697e=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S1lT3V304349
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 03:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=b1r53yJU1Jkl+6Y9WH8zUP
	Eq4GPvsDp+DqDRma5dRg0=; b=aUmZW0DoEBz+IvBKfl3ln/jWE1mi1SdR9feg1q
	EtDHuT/QQgMBQkb4guAlTmlYPUhKjiqtgkYN1FWKXDhQmwCMKNRMy9TRs8O4XRU6
	CS/TbV8mOpFcABn/BpgNNlR6UolLr+X7EWykuDnrH2QWT5s671pt6EPP1dDyYpbo
	3OdgyRbRVrbfXpdQn6A6MgOyN8ifhcM8iWdZc6620INlZRNMs4OqUuQXRSoy/kxB
	Jc+2ABGXe11ThfCXCJmevTA/FEfTBmT/9Q5rSKW7egdzQNv3/6Bwmiyv3c4M8Om4
	8mmeqQ0wCGN5jmc/kABJdssm9Td0QDeC3E3FuCLq6TtV5Hxw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013044.outbound.protection.outlook.com [40.93.201.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvg4c3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 03:27:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grwNpyqo1Hit2GV0vYSbUqTEsez4APFgnQ5XZvzP4e7VPe0db6YEgRhlbj9pEGiVBkB1+0q72or5plGmFdfqb4rGdQS8RaQYLoVG6LILYRIFLZxTnZAhGCH4XiD+NBeyfS2A18mu9JBlvGmWxUeJiDv8/m6lIswpSltffgN+Xm41HoiIALrqeFElPeUzKXdxJRV6vod2ifxElWEXdTlmxILiua2TJR+H90bcWr4WC2xFofjnYbvZGBOw4SB3qS9kZZQorHWfqUbrrVEWMuwYOPOLg/XQJM/ktQUO2k6T4i2Iu8jfMhqn4yiIyNH8XUZOItj1ZBwSBr1Dd4CWVcJgWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1r53yJU1Jkl+6Y9WH8zUPEq4GPvsDp+DqDRma5dRg0=;
 b=FpbNrPKjwyN/MOU/YEBeCcPqJ1Ah922kVXfQoiZCBHm5kkM/w7OQDe3ES58vAhYWc+G7ec1h5KHSdK/useyY960Czs2AiYLpFdsGAlnu7K5eEwrrDbD2QIhSsxUj6OYKfFmf0xI429F91UjcZCNGIJSUoRxk2eXeu+dTwM/YjO/qzHqF+snJvpRyXXHRIA1U5LEDVNO5oOMXEoSjzuxBXNDMUo2bEQbrZ2HiDx8NRegFir3OrA81Af25ZjQFc+10kQt5PyjS+Vh0/o8mZZKN0n7iMGHkmQJgX6ovLEmGYo4iDFHFs9eEhQvWAnPC34vZwgLEaXQltUhFOU4Zr5MOOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by PH0PR11MB7658.namprd11.prod.outlook.com (2603:10b6:510:28d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 03:27:26 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9654.014; Sat, 28 Feb 2026
 03:27:26 +0000
Content-Type: multipart/alternative;
 boundary="------------NDDnFetKSavMZC9uFixcl780"
Message-ID: <7c4ae514-f95e-43b6-8e3c-c5fbe4ad3048@windriver.com>
Date: Sat, 28 Feb 2026 11:27:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] classes/yocto-check-layer: allow to explicitly
 skip check_network_flag in recipe
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260227072110.2807435-1-hongxu.jia@windriver.com>
 <CANPvuRkDSpvyioZvO7iVLhPBtUQQytYRG-Z4KJ7cPn6jeMyC5w@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CANPvuRkDSpvyioZvO7iVLhPBtUQQytYRG-Z4KJ7cPn6jeMyC5w@mail.gmail.com>
X-ClientProxiedBy: SI2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:196::23) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|PH0PR11MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: 209f9781-b276-4666-1ffa-08de76794b33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	r8N/D9KPEe8rXzp70LW1+1lYJO/U2YzBCIXubAxbHJynrSY2ib5L2eqNJNB097Fv3bdw76tGBwSSPcagxkHsfY4XprSbOYhKnHoefy/xdrMfuIwVdpgApY6YGM59Cl9OA7X1KRD/Ovz09ikEMV4rsxKOxD9iG5O7lZCwE0UvP0kzLRO4sHcFMxPqMi/VGBeYOAWiAh1AbB0jOuc27eML24zlh1cajpK3EU+GTG+jS8UZfSqU/vn2no/xP7+SVhA6xk/g1WvV9bcEbrp9hXpbyfz/je2p2nP+RJqofvGU5IRvt8mKLqFHQIHzMNHDc7MYx8Zxlje5lBqvCXv+8GuDcXxtO/K4mWHuIitwSOYesEsGWQOnFlSMnxGxo2WR0YPTJrwet1db2nTUzc+O5e/793qRLvXYHqWRA4YoXKMZ2GJ9Mvz/kVirCVmuXldLVUhMgU+AgxZGXtF1t4qyjS1ZyvNTFxCGAPxbsCxQh6PaNPvEmisW9Hjdy4Ap9qksQ4h4RUALtcP08QQ4OcZ31wgCM9KHY/Bk8EdQDwClt5aaWbuSCm9MM6bpCqeSb5Heaz2Y1LzxcvJXPEQu9DlbSn3YP7zbBDERsWmiUhnTejkYlY+jmSX97o0THIRjVhvLBj/65QIKt+UA987N2FfnnZjw/n+z4QOucJ11kjrqf06/AiE1VwuzqLuS5R043QW/mEkh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U0tNNk5hd2k4TnZWZ0Z3Tjlma1VpMm5ETk1BdG0zdDh4eVlEeUxCVVZjT0k0?=
 =?utf-8?B?MndFeGtIWDc3aUdYdWt5Mis1TUsxaFh3NjNDNTZMaXdvUzRYRGFha3c2Uldy?=
 =?utf-8?B?eVUzaG1kbWxZRWwvRitRVmJvdkZheGNnWWhkYjZLWFdiaE1HRkUxa2pybVZ0?=
 =?utf-8?B?YkZGTlZNRENMNHdoOUxmaWMwUFAxY2E4bUtORnBUWFpGRVJpWlJmMkFPUDNX?=
 =?utf-8?B?aDIxRnRaMkFJUkRmZXUyMTJOYmNxdEZkNCtYWUNsSXB0UHBiWHVNbFhJMUxq?=
 =?utf-8?B?YWRVdGoybmlRN1FZMFdPb05UOVo3UERlOUJnT2xhQVovTCs5SG5qOGFDWmI4?=
 =?utf-8?B?ejJtMEhSR05rV2ZOVHphSEVZRVg5czEyQTZUblR2a1NINmdYZXBmL0NtTDJq?=
 =?utf-8?B?MzFMZkVuRTh5dUY2ZWxqTy9vMVl5WVRkejZSU2lKdUhmN3NkMGk2UXNyTjZV?=
 =?utf-8?B?ak9mbDh6RlVZNzRseGozSWZqZ1hHdFMyMFFuR0ptWk52c3JIem1SOVIxbk56?=
 =?utf-8?B?YlpDZXI3VlJXSFE0ajI1ellpdThVSURDZWNuWG9NZG1jd2FaQVR1TXFrb290?=
 =?utf-8?B?bngxbTlzMXowWUtrNEtOOHEvSGdiL01oYXZzek05SWtyTVdQVGxpTE9qN2d4?=
 =?utf-8?B?ZkdtT1VOVXNtdTNCakRMM1E0dEZGTXkxd0tISW5ZaEw4dEZqR2tsOTAzVFN0?=
 =?utf-8?B?MHZsOTdlbUJFUTl1T25WL21WRlpqaG1uSjBDeHFDcUR5dTQyM2VLenY5anpW?=
 =?utf-8?B?cTFGUGJ6T1NQSU1lZW5KMkxEWUxERWlKVWZYUUZEK2lOODdvRmgyRW84Qmxy?=
 =?utf-8?B?b2JzWU1FdHlWbHdZSEdrNGwvRVVTU0c1NjdUMC9qSE51aW1oSVZvMXY0WDVm?=
 =?utf-8?B?eTBnU1dkZS9mWVU3ODJPSkZjdWZyNGJ3QU96YjZub2k2bXBsVmFFZjZjdXFy?=
 =?utf-8?B?aEpXbC9iVjBodEpPUlMyWDFnNGt6bXo1cVBQN3JjVEY2THgrYXE5TmxBQUFJ?=
 =?utf-8?B?UVY0M2dRcVQrOU5reFBpWlEwRDhJWUtucUNzYnMvRldtbFVTbWg4N3FnTFFF?=
 =?utf-8?B?dTVHdG0vOHJ6ekU1a2lWQ0FINnhEd25uVWFBN29jLzA4Q000NzlvS003NExL?=
 =?utf-8?B?TnYwRTdEV2huMmJldjNIQUNJWlUzOS9sL2JOaVFZa1B1MWt1N01Rc3BmTnN1?=
 =?utf-8?B?ZzdNa2kwbU5pVzFmVnZJMDd2a05hTmZuWnRpcWFuOGRqMW1IUkIyVFZxWm9i?=
 =?utf-8?B?UDQyWFJaVEk3ai9PSnVxZk1US1IyZ1hzRDFQc2YzYVJLdG1PaU5rbVVCczRs?=
 =?utf-8?B?c2RBNENtYW5NNUUrdm1QTXZtZUc2NytCZWpJUzEzOWs4VjFzNXZWbW1mSFZW?=
 =?utf-8?B?NWNab21zMndvNzdmakRUU01IUXJlQ2k5eXArOTh2SFZEb0ZiVTY2TUVrQTJj?=
 =?utf-8?B?Ulh1dTFOMk56WVJsK3EvN0grN2tzdTZkWUtjSlFHSGFIVyt2RktmY3VlYnEw?=
 =?utf-8?B?QkRoQlFFODkwODIzTDh2RndrQ3VMT1E5Z1dTYU4yTDB5ZmJ6WXNCNHg2Y2dC?=
 =?utf-8?B?UmJnaXIrQ0QyTmhZQTFVQVBlS3F6NDN2RUpWNVdXT0taY2pyU3c5b2VkZ0FE?=
 =?utf-8?B?eEp4ek1QQnErSUxLQnBGWmtUTnNQZlp2YWJKSkVCQXc3S0dlaVFNOUNBN2dq?=
 =?utf-8?B?MFQzcEJoVWdSYmtRcTlPSG0wNDdZNEZKZHlvdm5FTzdvNXRQZCtJYSsxZEdh?=
 =?utf-8?B?TzZUSWttaGVWYUlBUHZHdll5ZWhQVjNoRVRIQ1FHOFJCbzJUUVdlZmZJdFEv?=
 =?utf-8?B?WkdLQUozallGL3NLRktmUjUxUGt1cDYybWhaYUpLWHc3Q1ZDZ1B6RnhJZzRt?=
 =?utf-8?B?TlovWHc3U3F0WTRhKzYzWlZRdThrZWIzRlE4Qnk4WjJGNlI2Q29ZRnlxSU12?=
 =?utf-8?B?WWVZRDdCTmhoK3psdm95SkxGaXZiL1BTVnFjRTJQeWFrdnorSEd4YUVMRldC?=
 =?utf-8?B?bVhiMmNaM25OOU5JWFBYSk9PT2FTdmhuMitvVndWVEFtclhYeVRmeWdsWFo5?=
 =?utf-8?B?ODJqWHQyKzdVbkV5Qk9kTzdXOURqMXJqaVVHWW0vU3EzZ2gxVUtEeEJudnI0?=
 =?utf-8?B?N0NZL25pN25pWGYxcFZZWG1rVmVPWDdvb00xSld4bHlGK0xzR3UwYVpYaEZU?=
 =?utf-8?B?YVlFa2tNa0x5b2ZmU2tXU1E4QUszdHRmWU9EUjQyM1A5ZEEvNm5LUWlwcStk?=
 =?utf-8?B?WVhNMFUvZndSQTVZbzN0bVNQRjVGMjk1SmpSWHZaNTF1dVhXU05iSmQyYWRK?=
 =?utf-8?B?KzV1UTZuWkdneVdyTnRKOW1oYWxrcWExVFEzajRCOFFKNk5WU3F5dz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 209f9781-b276-4666-1ffa-08de76794b33
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 03:27:26.0971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXzbSWjkKwLVBgOBfmD8z6Ki7c6i+U2cxOfbeoV5JtfahJP63aF6JnyMDirk9joWQlIKfhQnTWy2eMStBXrtcl0YKpfFPibAgd0pXtrBl1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7658
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: F3I4aqlhL7zsz5BpR-MohbC2I2qYhIMw
X-Proofpoint-ORIG-GUID: jeuLV2QIuMJnRDq4KMNKarJEKPNnrIZT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDAyOSBTYWx0ZWRfX0XssaDYkPbp4
 D3RMRHBPuSkRFnwDf9ns/ALAU7srvMALkU62D5qGepMV5Hn/+/qgOFU49O4+9z5CBOycCG1Nh+q
 PneMtuZvXHIr9KKEjFnqlngzubrv0RDZ8S9Myo1oo1fB7UU7M3aLCc/nzabzTVJG/5aYqVY7Ies
 M+mYmWEoYw5toJpEycISONO50x6I8hN0gC0XXpQJdt3JDdSCghaNHT5vbXGPkZHnNJtL7UotY1S
 9Un9vVpeLG/9715UaSzx7GSRH1FB/pvtJeAbrZ9UV1Sqlhh2T+dHDyJnQ5ukRYkOYVKLwPk0yR5
 cQU628vednI8Cn1uoz17+buoSVRZs+/E5Y4K8q7LcJXwplNKwfrtpWsf6+eVzrgklAccK2vaWoq
 Yy3f2ArkCXaf8zzHQoY/0eoT+CNUf660svT7mVfRfkSaIjxwNnXfng5N3EXxydHj+WF5ztKA7Kr
 eGy0Be/fMa0+QfSQ0kA==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a260a1 cx=c_pps
 a=fVVZRgaqDuj868rfKEvgUg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=nIQbAWep_uJQ2sWTwi8A:9
 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OliMa9AwXL8W3VwHWTQA:9 a=M00klYDK1_4gByN1:21 a=_W_S_7VecoQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 03:27:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232123

--------------NDDnFetKSavMZC9uFixcl780
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61S1lT3V304349

On 2/27/26 17:39, Jose Quaresma wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> Hi hongxu,
>
> hongxu via lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!aBhDhydW4sVwHmPku-G3KfAkizU2zIqypxgoEenL-xjXJs5eoMzW0QXn8MVS7w9-QZvBe=
U26B0ju3x5wCHfoAWuj9pQ$>=20
> <hongxu.jia=3Dwindriver.com@lists.openembedded.org> escreveu (sexta,=20
> 27/02/2026 =C3=A0(s) 07:21):
>
>     The yocto-check-layer add a new test that checks that no tasks
>     between do_fetch (exclusive) and do_build (inclusive) are allowed
>     to use the network, with rare exceptions.
>
>     The only exception currently is build-appliance-image's do_image ta=
sk,
>     which is hardcoded in yocto-check-layer bbclass.
>
>     This commit adds variable SKIP_CHECK_NETWORK_FLAG to allow user to
>     explicitly skip check_network_flag in recipe
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>     ---
>     =C2=A0meta/classes-global/yocto-check-layer.bbclass | 7 +++++--
>     =C2=A01 file changed, 5 insertions(+), 2 deletions(-)
>
>     diff --git a/meta/classes-global/yocto-check-layer.bbclass
>     b/meta/classes-global/yocto-check-layer.bbclass
>     index ba93085325..9fb36f5646 100644
>     --- a/meta/classes-global/yocto-check-layer.bbclass
>     +++ b/meta/classes-global/yocto-check-layer.bbclass
>     @@ -27,13 +27,16 @@ def check_insane_skip(d):
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar("QA_ERRORS=
_FOUND", "True")
>
>
>     +# Format: "BPN1:task1 BPN2:task2", separate by space
>     +# build-appliance-image uses pip at image time
>     +SKIP_CHECK_NETWORK_FLAG =3D "build-appliance-image:do_image"
>     +
>     =C2=A0# Check that no tasks (with rare exceptions) between do_fetch=
 and
>     do_build
>     =C2=A0# use the network.
>     =C2=A0def check_network_flag(d):
>     =C2=A0 =C2=A0 =C2=A0# BPN:task names that are allowed to reach the =
network, using
>     fnmatch to compare.
>     =C2=A0 =C2=A0 =C2=A0allowed =3D []
>     -=C2=A0 =C2=A0 # build-appliance-image uses pip at image time
>     -=C2=A0 =C2=A0 allowed +=3D ["build-appliance-image:do_image"]
>     +=C2=A0 =C2=A0 allowed +=3D (d.getVar('SKIP_CHECK_NETWORK_FLAG') or=
 '').split()
>
>
> This could introduce severe reproducibility problems for someone who=20
> claims to have a Yocto compatible layer.
>
The meta-tensorflow, who use bazel build system to build, it requires=20
network access at do_compile if download mirror is not available.

The bazel is similar bitbake, has fetch, configure, compile, but it=20
combined as one command and invoked at bitbake's do_compile

In order to support offline build, I've apply a local patch to bazel to=20
save download tarball as download mirror [1]

[1]=20
https://git.yoctoproject.org/meta-tensorflow/commit/?id=3D88ca1af3768e5a0=
1e6ba8b2f09d6cf2a0bfb621e

If dowload mirror is available, the build will reuse it and network is=20
not required, the reproducibility problems should be detected by binary=20
comparison from two builds, we have oe-selftest case in oe-core by the wa=
y

//Hongxu

> Can you tell what other recipes require this?
>
> Jose
>
>
>     =C2=A0 =C2=A0 =C2=A0def is_allowed(bpn, task):
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from fnmatch import fnmatch
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#232081):
>     https://lists.openembedded.org/g/openembedded-core/message/232081
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/232081__;!!AjveYdw8EvQ!aBhDhydW4sVwHmPku-G3KfAkizU2z=
IqypxgoEenL-xjXJs5eoMzW0QXn8MVS7w9-QZvBeU26B0ju3x5wCHfov5GcSzk$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/118026872/5052612
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1180=
26872/5052612__;!!AjveYdw8EvQ!aBhDhydW4sVwHmPku-G3KfAkizU2zIqypxgoEenL-xj=
XJs5eoMzW0QXn8MVS7w9-QZvBeU26B0ju3x5wCHfodBBW8kA$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!aBhDhydW4sVwHmPku-G3KfAkizU2zIqypxgoEe=
nL-xjXJs5eoMzW0QXn8MVS7w9-QZvBeU26B0ju3x5wCHfo2v8OWTY$>
>     [quaresma.jose@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>
> --=20
> Best regards,
>
> Jos=C3=A9 Quaresma


--------------NDDnFetKSavMZC9uFixcl780
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61S1lT3V304349

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2/27/26 17:39, Jose Quaresma wrote:=
<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANPvuRkDSpvyioZvO7iVLhPBtUQQyt=
YRG-Z4KJ7cPn6jeMyC5w@mail.gmail.com">
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
          <div>Hi hongxu,</div>
          <br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">hongxu via <a href=3D"h=
ttps://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!=
aBhDhydW4sVwHmPku-G3KfAkizU2zIqypxgoEenL-xjXJs5eoMzW0QXn8MVS7w9-QZvBeU26B=
0ju3x5wCHfoAWuj9pQ$" moz-do-not-send=3D"true">
                lists.openembedded.org</a> &lt;hongxu.jia=3D<a href=3D"ma=
ilto:windriver.com@lists.openembedded.org" moz-do-not-send=3D"true" class=
=3D"moz-txt-link-freetext">windriver.com@lists.openembedded.org</a>&gt;
              escreveu (sexta, 27/02/2026 =C3=A0(s) 07:21):<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              The yocto-check-layer add a new test that checks that no
              tasks<br>
              between do_fetch (exclusive) and do_build (inclusive) are
              allowed<br>
              to use the network, with rare exceptions.<br>
              <br>
              The only exception currently is build-appliance-image's
              do_image task,<br>
              which is hardcoded in yocto-check-layer bbclass.<br>
              <br>
              This commit adds variable SKIP_CHECK_NETWORK_FLAG to allow
              user to<br>
              explicitly skip check_network_flag in recipe<br>
              <br>
              Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@=
windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-tx=
t-link-freetext">hongxu.jia@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;meta/classes-global/yocto-check-layer.bbclass | 7 +++=
++--<br>
              &nbsp;1 file changed, 5 insertions(+), 2 deletions(-)<br>
              <br>
              diff --git a/meta/classes-global/yocto-check-layer.bbclass
              b/meta/classes-global/yocto-check-layer.bbclass<br>
              index ba93085325..9fb36f5646 100644<br>
              --- a/meta/classes-global/yocto-check-layer.bbclass<br>
              +++ b/meta/classes-global/yocto-check-layer.bbclass<br>
              @@ -27,13 +27,16 @@ def check_insane_skip(d):<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;d.setVar(&q=
uot;QA_ERRORS_FOUND&quot;, &quot;True&quot;)<br>
              <br>
              <br>
              +# Format: &quot;BPN1:task1 BPN2:task2&quot;, separate by s=
pace<br>
              +# build-appliance-image uses pip at image time<br>
              +SKIP_CHECK_NETWORK_FLAG =3D
              &quot;build-appliance-image:do_image&quot;<br>
              +<br>
              &nbsp;# Check that no tasks (with rare exceptions) between
              do_fetch and do_build<br>
              &nbsp;# use the network.<br>
              &nbsp;def check_network_flag(d):<br>
              &nbsp; &nbsp; &nbsp;# BPN:task names that are allowed to re=
ach the
              network, using fnmatch to compare.<br>
              &nbsp; &nbsp; &nbsp;allowed =3D []<br>
              -&nbsp; &nbsp; # build-appliance-image uses pip at image ti=
me<br>
              -&nbsp; &nbsp; allowed +=3D [&quot;build-appliance-image:do=
_image&quot;]<br>
              +&nbsp; &nbsp; allowed +=3D (d.getVar('SKIP_CHECK_NETWORK_F=
LAG') or
              '').split()<br>
            </blockquote>
            <div><br>
            </div>
            <div>This could introduce severe reproducibility problems
              for someone who claims to have a Yocto compatible layer.</d=
iv>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>The meta-tensorflow, who use bazel build system to build, it
      requires network access at do_compile if download mirror is not
      available.<br>
    </p>
    <p>The bazel is similar bitbake, has fetch, configure, compile, but
      it combined as one command and invoked at bitbake's do_compile <br>
    </p>
    <p>In order to support offline build, I've apply a local patch to
      bazel to save download tarball as download mirror [1]<br>
    </p>
    <p>[1]
<a class=3D"moz-txt-link-freetext" href=3D"https://git.yoctoproject.org/m=
eta-tensorflow/commit/?id=3D88ca1af3768e5a01e6ba8b2f09d6cf2a0bfb621e">htt=
ps://git.yoctoproject.org/meta-tensorflow/commit/?id=3D88ca1af3768e5a01e6=
ba8b2f09d6cf2a0bfb621e</a></p>
    <p>If dowload mirror is available, the build will reuse it and
      network is not required, the reproducibility problems should be
      detected by binary comparison from two builds, we have oe-selftest
      case in oe-core by the way<br>
    </p>
    <p>//Hongxu<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CANPvuRkDSpvyioZvO7iVLhPBtUQQyt=
YRG-Z4KJ7cPn6jeMyC5w@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <div>
            </div>
            <div>Can you tell what other recipes require this?</div>
            <div><br>
            </div>
            <div>Jose</div>
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <br>
              &nbsp; &nbsp; &nbsp;def is_allowed(bpn, task):<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from fnmatch import fnmat=
ch<br>
              -- <br>
              2.34.1<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#232081): <a href=3D"https://urldefense.=
com/v3/__https://lists.openembedded.org/g/openembedded-core/message/23208=
1__;!!AjveYdw8EvQ!aBhDhydW4sVwHmPku-G3KfAkizU2zIqypxgoEenL-xjXJs5eoMzW0QX=
n8MVS7w9-QZvBeU26B0ju3x5wCHfov5GcSzk$" rel=3D"noreferrer" target=3D"_blan=
k" moz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-core/message/232081</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/mt/118026872/5052612__;!!AjveYdw8EvQ!aBhDhydW=
4sVwHmPku-G3KfAkizU2zIqypxgoEenL-xjXJs5eoMzW0QXn8MVS7w9-QZvBeU26B0ju3x5wC=
HfodBBW8kA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">
                https://lists.openembedded.org/mt/118026872/5052612</a><b=
r>
              Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@li=
sts.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
                openembedded-core+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!aBhDhyd=
W4sVwHmPku-G3KfAkizU2zIqypxgoEenL-xjXJs5eoMzW0QXn8MVS7w9-QZvBeU26B0ju3x5w=
CHfo2v8OWTY$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e">
                https://lists.openembedded.org/g/openembedded-core/unsub<=
/a>
              [<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blan=
k" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">quaresma.jose=
@gmail.com</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <div><br>
          </div>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">
            <div dir=3D"ltr">Best regards,
              <div><br>
                Jos=C3=A9 Quaresma</div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------NDDnFetKSavMZC9uFixcl780--

