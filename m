Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF17AFD8FD0
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 16:00:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73307.1772121614752929596
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 08:00:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hDsv5Msl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6517dfffda=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QD02Ni887697
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 08:00:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=jhONKJTSzMSeETWYkAXPAC2hoY07rv2+teQQdLq0o7U=; b=
	hDsv5Msl6ZoFO8cdtOhwDNncaPu4ktjgJJQd5iAmM/l+4lP1zzDrcWh857WS1Dv4
	Zk+hqejpQRAULeIwVXGdFPGaHnffMPGRjahNnRNSEweeow2PaLEVbcy7OZtUAHGi
	9Vqq7DDm8SLoyliLYFDPIhWKtBmRU2Rzj5qI73mM+KYtvvSipqiYcBgmLsCF0RIg
	Csu9njVQu4R9JjARl3YwmqTYynMPgjr6zEW4NJ6gQMBBXx+M1DpftkyfReGil0pz
	4wNhwjX645tL1DVb7Ad2HABU3QW262ayitZq4B9LVc7094PPWLZetLOhG8KnHSv/
	8O8nfMSrx1QHsWlQ0l7D1g==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011009.outbound.protection.outlook.com [52.101.52.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdyjrp08-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 08:00:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFiwzo4LpPkA3QV4p6Zsj/0Q7QENbEWBQy5cG4Lxo50LRuQe/bOib1DSULhvG+DVPBjGsAymW9A3eu5Xng2d8Xbpgh3OKI71Wpa2Fx41O2mqiI1vHJG0I7cptXJontWuVM2j5ttupMedmdtZ+tn0cRLcD274WmxaOp9yc+8Sl5zElhbjvPZ27JKpJgC4kNiaIGRoCQjyxju4SMGtfYeKcXNDR+v5nxJkm6GA19ODlV0EiRoTjZECfAgrTTBggZlnbrlI4EbwdYZ+iUaSBwwS/NQU3ZpwfqkunT1UtLt5dZLUfcCmEpEF7ak7u3/1MlNKE7YqRHS3l2tSV8AJDLPCAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhONKJTSzMSeETWYkAXPAC2hoY07rv2+teQQdLq0o7U=;
 b=dNGkuVbRmwouNbFbv90eLngeEd/fksNORIWIfmm4sOss/bQp8+mkFfRGMc7hTBY9pxh8N1y1ielyZWmYbDj29zcIcdltiB+OXMCjPoVbyF+QI92lPKJXa22xY9vmXYmvKFDAMkGCoBqytxjmLz1m8SccO1lJdTRXn5X3hSzoSiny0rbEBJwI5Gz5V4UPxIjiw3I/Waiw37vzccfNkpDuqtpIKASdohniyUiNWZjjI9FEL6vAUrzVEEeYmHRsvZwpnDxk535VnYks0JIEo40oCxm3+1uxJFVKSkaafPbhJeV0VMX8pUEqK2HN/fSbaAHyw/rpp1OebOPbonsHxUH9OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by IA3PR11MB9447.namprd11.prod.outlook.com (2603:10b6:208:571::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 16:00:09 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 16:00:09 +0000
Message-ID: <01d72b81-ac28-409a-abea-99671fd3b214@windriver.com>
Date: Fri, 27 Feb 2026 00:00:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v6 0/7] rpm: 4.20.1 -> 6.0.1
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
References: <cover.1771409846.git.liezhi.yang@windriver.com>
 <DGIA0D4P60DI.1CA8PWS58YCCF@bootlin.com>
 <212e8187-1b6f-4c2c-8d57-97cc66387c56@windriver.com>
 <DGKMRZ496JHU.1T1MJETE5VNUN@bootlin.com>
 <CANNYZj9DHuV3rmaAsZsPcbZ2ZsbMrNe+keNgVazav=3hUnYQKQ@mail.gmail.com>
 <DGMFHKEHBIY4.24DUCLY3ZXN7N@bootlin.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <DGMFHKEHBIY4.24DUCLY3ZXN7N@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096::17) To
 LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|IA3PR11MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b24b71-9958-4b00-974d-08de75501d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	Lzbd/tcZwZobGHBhEIH74F/9HaedK/mPIVBPLDdZ05LCfUKdmZ0KUsDG8RIWc40IAsANGMj59LjXGpK5+wh7MfwuXfnQn9DW6NNB4I4wyQ6+fXSHwm6pRTsNcrcjuJu+msRd1eSF0321gJbH00XfpPJAQ+iCcGD8xFQjSDbdU6AkEnDNYa/rexi8Mhfmf8z7CimoPq3umBJw3PcBVvS+StRDfnu1dxNNgoLp7e0X0KRztSM31rTg6YoImPY1bgqDPGIoP/9Nq3VFFzSDlYP0KNh1CWAEGAlQYeRQNVQO40YEJx3kJJuGoR/sDcBCmVWdDxyfY0FRXoqoaskuViYeQ/1DzvobhnWH2FcjPW8vT6UI/hB0Tfz4pJHdzt9mp0BGdQmXsIftgsSTZjpbirG5xCcytuCqZqLxH42lA1K3oQMC5txtWHcYilYH+/8Vs/2sSxLXSfRHAkUwou83DXrWjVQq8MuDSSdhZ5VYDv2masZg7/qAKDu/5yDwMTn1Tn7BWzeUD7cfTBxR/YME4B7O2Ll5UMHMkzGABQmRgTLhG62fs5ogjTKZCS3xB2Q85hfcAn7sM5xmwMirSKwk1qNl9QD+4dGDR3MNPCcFHWwB8ztlriDzf/dRChyhunXeIt53BWYOOW2k62R0RUrmxHX+mUWxxh191rKfiK0GiMqdQB8aS6+SBYqbmfZcnO7XAkJk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TUw0OXY4dS9EMmV4YmJPZkRSQWxjNlh4cy8rd3BnOGlTMWtCeWlHQjA2a2lN?=
 =?utf-8?B?Z3p3cVdXUWRCRmZRQkJjbjcrd3NkYWJ1eHBQQ2lvVjM4a0t5RVpFK1JzRnU2?=
 =?utf-8?B?Q1hVOWdwb1phN3BHTFRzQzZHMEI0VytUVG51c2YyMmowUnZWM3NGSEM2Y0x0?=
 =?utf-8?B?S0VHNDFhdFdBODE5T3pSQkcwLzRIZDhpbDBRbHNHT0hiRm1yLzJteVo2eGxs?=
 =?utf-8?B?eEZ2UE9DNDFiSmN4Z1ZZbnFMSmVrclRqVTJOVzZSV2NMVVV5RWZydXVUcmNN?=
 =?utf-8?B?MThlQXcvNGRqRWl3dmZiK29aTDhsWi9BajVEZ25PREc2azdUcy9hNXhWNGlX?=
 =?utf-8?B?R08wS25ZZEtlOXJOYzJnbzJnd2lYdVRMUldEN0J6cStmdHhvUEwwQ0FEdGJZ?=
 =?utf-8?B?M2xHUDZWZkdtelVFcnhqaWNNWmI1UkpINzVXTGpOc2RtcitjMy8rL0xsbEY1?=
 =?utf-8?B?M3NmTXM0cEhSWkVNNHlzVDl3WEorWnRpZjlHQXQ2bnJsaGwva09qUWV6WHVP?=
 =?utf-8?B?T0FrbG1ZTEpCL3lvTjVEQjBjVmEzUmwvdXNQc2pWL3l6M1FobmZ0SDQxQkN1?=
 =?utf-8?B?UmtWVFo3T0dwVUliT3RRZ3VpdnZQV3pqSk80Vy81MEF4Q1NmNnNzZjRYVjRE?=
 =?utf-8?B?WnBkSS9OV20xc0kreWNhaVR5VHdGWnFDb3dvNzJPdU1XWXRvQnFaRTd4Rm0y?=
 =?utf-8?B?b1o0UllZQkUzRThNOCtUajJkYkxFN3lkZTFuREpKQjJackllZnVlL2RGT2ps?=
 =?utf-8?B?NnUvNm1Tc3lwclRwZXFoMzVUa3RTSlFyRmQxMFBoU2EwZmJKWGc1Z1VWdmhB?=
 =?utf-8?B?RWh5dHk3aE9WZndSR2xVTGV1VEhVUmxudUh3dlQ5cng5MXMyeEo2YmRmRlpw?=
 =?utf-8?B?NzMySk5oSkhCWUJJdUZqcFczeWs4cnJXTW1uWkZNS2p5WGZycXdJemxsTDRP?=
 =?utf-8?B?enVFOStsTFBDdDByblZKVERqQnBJd1dqS2ptczBsSlBkaCtWL0hVUjQvaWJw?=
 =?utf-8?B?ckpnMHJQakdKVGxMWXJWL1FJcDN1RVo2N0RnNzhyRkY0MFRiVUlveHYzaXJJ?=
 =?utf-8?B?NkhOT3RMWExJcmlDekJiT1JzUmp0THZmbHJsVVozejBlRnFDcWpLVEE4R1JE?=
 =?utf-8?B?dlY4Ynh4cXF0QXBTSUZBWVROV2dvb0pacHUrd1pRN1paZW5JVC90WG91WlZS?=
 =?utf-8?B?WTVVYVhUMHBSak5BOVVDSkhFVUNCaTIvWndCUGlzMlorUGtXZTNIbUlkd0k5?=
 =?utf-8?B?VXlJc2N2Y3kvc20yclkrU3ZMdENFdXBjM0g5d2RhUWxra1gwSlpXMFZteTN1?=
 =?utf-8?B?TEtVUnpUQjZUNGViWm0yVTdoVSsvbS92cmtzSjkzOCtWdkZMak9XZjhQdk5L?=
 =?utf-8?B?VVVjWmRHbk5oamF0TzdrYnRHV0dhR2lqZ01IRUt0SVhGZzUzcDErU3hlOEZh?=
 =?utf-8?B?RmxFb2NqcUJUQ09hYVpveWJDTGtuUTUvRHcxTEFyME93TVFKbENFOVg5Zzk1?=
 =?utf-8?B?NGZpcWZiOWJ2UFlYeHZFWGZVL2V0QnUrelVqV0lrN3ptM3VmdHg0Tkg0M2ZY?=
 =?utf-8?B?R0txajBOb1ROUk5kdjJ6SlBXVDZKaVJYVHJUNWkwSGp5aUpMeC91SWkrM3Vi?=
 =?utf-8?B?M0JSV0xoWng1dFhKZ3VVOXpxVERITVFRdzVmdVhCb252VzF1K0lIdUxqQWRs?=
 =?utf-8?B?NjdMdklHYkNwQ3hqM3AzTFMvSGVrVnppUVZROWRyb3FnOVQxanlHR29haVdx?=
 =?utf-8?B?T3pWeDdkR2VUMytacUpLVS9GMDRCbFcveEcyc05mUGMxZS8zYVZLei9ONGNo?=
 =?utf-8?B?clUrTjR6NG5UVHI3OENoNEhKNUhyWmRHUkdnTUN3QnEyV3NyeFJzK2sxTWdJ?=
 =?utf-8?B?YjZLNU4vM0Y0NVJIa1FLbm14T1Z4OG1CbGo1dm5FcFM1ZGl4VUw3akQwelZX?=
 =?utf-8?B?VUFxeDJMMCtsMDB5cGlHamIzaTZlbW5JVm5OM2dKTEdibHBlc3NicFQwaXFK?=
 =?utf-8?B?SHM2cSs1bnhvRjRmTndVQzFIbzFDREd0SWpjalVTNVRic2dzTHFXQzN5TDdD?=
 =?utf-8?B?N1BkdFhwTkFIUzNHckdNZWwyTTd2YUNVT3lTbCtuSE41WEJyeHg4TFdoZnQv?=
 =?utf-8?B?WVVXcTJnMm4vTVpKM3c1anNFdE44ejkwL2xJaEcrQUJpdkRib1o2UDhHWXdP?=
 =?utf-8?B?Q1RBVjNmb3RpbzdlbDB1Z0c5djJwRmJRWlcvTWRNcUZoVDR1TVk5YUptY1RB?=
 =?utf-8?B?VEFMOWJWVDdwOTUxVWdvcnNtdkpGcm5BMDhGMjdUNldiL1V0akJwS1RYU21k?=
 =?utf-8?B?aEpxa2FKUEdhWVdZVGNoeVdrY0RvWVkwTmIvTURmREI0OFVLdVpJZ2w5ZGlX?=
 =?utf-8?Q?hwUwZSBgfvI1tPBc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b24b71-9958-4b00-974d-08de75501d5b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:00:09.4195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GqAbo7KokpLegSROtsaC/FjRlIy/NdmcbnW39GvCfjY65pP9EWHRhgUI9iHcUFys6MwAUkNoexhAzQOMovnjSqFaip9ZsODrch2ZRfSiFUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9447
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE0MyBTYWx0ZWRfX/aVSRWC7+dAl
 rzfFn9h813CU3WB40qwvqslNaep+EhvGl9rZNBQTdmtV44UiZjeWDu5nXTUPEDq2E8hMX3M4Q2m
 aDHSBLnIJPoja258jwe67VxrNdi7yCxmj21VDo43Sy6eUGQP+M1K5aUrZb+Yc/8eSK6B3Sswe0u
 w3++5VLhJhS61pNqL+veUqp5LFdxaeQbJhiDJ18x81UoIc9+vBZif45+YiVsnTOApQbe4mXMDQr
 8c+Uq5n/z9J+jxaU7H+unEXoUnEAZqxxh65W9mLaeRB8EjLgq3jeY9VMVrICO4MRVWL+AWKm4rM
 p/8eTVimdiKISEIqnTHEl/51sC+2VNiXhM00rmAlg+hE4r6W0W9M1f056Ja+kjw0gkayrZ4n/jS
 qW0qFlL87jONFrjxcDtsER1L0VXERgXGmCxhbGCxlEZ7wRJ4okXLDbpyuzyls5Vq6As0Lf6+o2X
 np0tZ1UhG+CPCzokOrw==
X-Authority-Analysis: v=2.4 cv=Cv2ys34D c=1 sm=1 tr=0 ts=69a06e0e cx=c_pps
 a=kBTuJkHEWKOaoYTOH1TR3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=AKTC-yU4ps8rJWO7ZSYA:9
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: cVGgAtij0TN3_iNGt-Zvz7WgMia3ayzI
X-Proofpoint-GUID: yyZyYY9Ey5QJN7_wD2C2GFc07xVNKINt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 16:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232037



On 2/23/26 22:58, Mathieu Dubois-Briand wrote:
> On Mon Feb 23, 2026 at 1:27 PM CET, Alexander Kanavin via lists.openembedded.org wrote:
>> On Sat, 21 Feb 2026 at 13:15, Mathieu Dubois-Briand via
>> lists.openembedded.org
>> <mathieu.dubois-briand=bootlin.com@lists.openembedded.org> wrote:
>>
>>>> I'm sorry about that, but I can't reproduce the error, here are my settings:
>>>>
>>>> PACKAGE_CLASSES = "package_rpm"
>>>> MACHINE = "genericx86"
>>>> DISTRO = "poky"
>>>>
>>>> $ bitbake core-image-sato -cpopulate_sdk
>>>>
>>>> I checked
>>>> tmp/deploy/sdk/poky-glibc-x86_64-core-image-sato-core2-32-genericx86-toolchain-5.3.99+snapshot.target.manifest,
>>>> All the required packages are installed correctly:
>>>>
>>>> flac-dev core2_32 1.5.0
>>>> libcomps-dev core2_32 0.1.23
>>>> libreadline-dev core2_32 8.3
>>>> libogg-dev core2_32 1.3.6
>>>> libxml2-dev core2_32 2.15.1
>>>> ncurses-dev core2_32 6.5
>>>>
>>>> I also tested with IMAGE_CLASSES += "testimage", it also works well.
>>>>
>>>> Do you have more info on how I can reproduce the issue, please?
>>>
>>> I tried to reproduce it locally yesterday, and I had the same issue: the
>>> failure did not reproduce. Yet I tried again to apply your patches and
>>> got a similar error on the autobuilder.
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/3218
>>>
>>> I will try to investigate this next week.
>>
>> Note that the autobuilder enables the
>> 'core/yocto-autobuilder/autobuilder' fragment, which contains
>> significant SDK tweaks:
>>
>> SDK_EXT_TYPE = 'minimal'
>> SDK_INCLUDE_TOOLCHAIN = '1'
>> ESDK_LOCALCONF_REMOVE:append = 'BB_HASHSERVE'
>> SDK_TOOLCHAIN_LANGS += 'go rust'
>>
>> I suspect the above may be enough to trigger the issue (or maybe if
>> you enable the whole fragment).
>>
>> Alex
> 
> Of course! It was definitely the missing config, thanks!
> 
> So it was reproduced locally, with basically the template local.conf
> and the following added lines:
> PACKAGE_CLASSES = "package_rpm"
> OE_FRAGMENTS += 'machine/qemux86 distro/poky'
> OE_FRAGMENTS += 'core/yocto-autobuilder/autobuilder'

Sorry, but I still can't reproduce it, would you please help to try:

$ git fetch https://github.com/robertlinux/yocto rbt/rpm
$ git merge FETCH_HEAD
$ . oe-init-build-env ../../build
Add the following lines to conf/local.conf:
PACKAGE_CLASSES = "package_rpm"
OE_FRAGMENTS += 'machine/qemux86 distro/poky'
OE_FRAGMENTS += 'core/yocto-autobuilder/autobuilder'

$ bitbake core-image-sato -cpopulate_sdk

I checked the manifest file, the error packages were installed correctly.

Would you please help to send me the error build's conf/local.conf and 
conf/bblayers.conf?

// Robert

> 
> Thanks,
> Mathieu
> 


