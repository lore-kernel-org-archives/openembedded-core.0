Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C48CD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 08:49:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15089.1781772591933364479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 01:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rJWt3Vif;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0629408699=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8FO0Y3904296
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 01:49:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ZIgHiDGS3cLOwCHGQ75v9L5ZQR/356/3QkIDifo1tHA=; b=
	rJWt3VifTT0XTwWmohnkdOXMVMGYvf+uoZn34n+KiNP+nXk1fkQQnG/ZHlwLZncm
	UwfPd78Iq0/mRYeU8TzvnNkvJ+8SzEbZ3Wi5BW81B2a9drSd3a5zbKRjJsgnyLVu
	Uro644zKLTmTYT7aZg9NCx3/qVR21nMK6ZnPRGQS8wJU+lmOWSlHrtJCNt+xASte
	c5VQW9yyPTvHJgsufeSHe9XSC9IFdbuhHHV2wzngu1uRO0+wYDbsGOsnsEGZcBFt
	NRqlQp8ksEmebarGn2z/4MMcA4ki19SrkE2cY26mRk9GZQsUEL7xr8Nel9G+vOGR
	ZTPMfQwvYm+TR1WiuIy2Sw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011062.outbound.protection.outlook.com [52.101.52.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4euefbtcsg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 01:49:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyqFL3U/3INLsGM40gfZpWIRJy9NmlpaHQ2i8dljDSCv+3D7v5GcsbCzGEcJQlwLdgpah2kCWTRDwccS3cyYHmbJlQn5DitESccoHS6bXjQt5UqDV0T72E8Y8XV82mg1Gyuzd6gV3VuyrKTV/6yp0kpf+XQKSMKxZrkjBIq5izpbifKQyMwEinL2XxLM59bo7EoHF43m3XrCIbNSBvXi1qQNMGNa21XXrEwGfy/AaxsJTYeb0fwFjQXS025y/z4VcoNBKmVLdrpSG2MhRjSFLWxs95ETPdaUnKsSh3UD6oyqaUG58KXL+sTW30mJk3qISoJFRaJMyXIxGkjKkOCedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIgHiDGS3cLOwCHGQ75v9L5ZQR/356/3QkIDifo1tHA=;
 b=PSzBCfp41ne58siCf5uIjRosD6hzphLBFrhV8rVxhVi1pBrsXxGe1cHEw5tDQuvnRaB531T4rc2VIpR6FejJ+D361EY1Wweb4UEII+NnqRBZC0t1+p19Xv3gzXwn8pL73GH6inRcIYflI/e+5wPFLYhncmT/3sVZ/o4GtsGf24puNLynVA7SSBG+T90oUoql6uEPZSM91ogQ9hLTC/KzcKe7ojbikBVn1HM5HRHKXtxCsaf2N99X8csumGab+bREDLGfC+L2GGbllb3VdNeFMpZefSX+ZZUlT3m22L4UN9TGQrBaOJwmv5uDWRSl6GXp2aB/gx32WI/TlYSGvrsT0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS7PR11MB5989.namprd11.prod.outlook.com (2603:10b6:8:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 08:49:45 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 08:49:44 +0000
Message-ID: <e3fd8230-36de-4436-a8e7-8d5432cafad5@windriver.com>
Date: Thu, 18 Jun 2026 14:19:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] binutils: Fix CVE-2025-69646
To: Yoann Congal <yoann.congal@smile.fr>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260420042409.1727728-1-Harish.Sadineni@windriver.com>
 <DJACAG7CMC18.3FXGQ7XY58UM4@smile.fr>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <DJACAG7CMC18.3FXGQ7XY58UM4@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0283.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::14) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS7PR11MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: ef92eb1d-c7bf-4dc5-2f8f-08decd168a8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|23010399003|366016|13003099007|6133799003|22082099003|18002099003|38350700014|5023799004|4143699003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	CSOQ+OOWCj2Lxi9Je3l02mFyFGD0G3lE0jaUeYiDDDT7xVLRiZkLKWlhI3DNxyasLo6bjng9Lx5iJ8AQpOjD8TTw55z8yCLLAkkCKcJH2VRlWkcSW/sylrOt5xAIBkWcTWgEu0t87/fQwFj8tgicRdPSI7m1RPmfw8IA8HRws7lyNGURdLrLSjzLnfwqJXiQYES8l9oX+Rp4vbjggYKTTFRqmsM74/KUJO8hV1a78M0ePrJlweXhCedbeXtCaOKQDyl8J810r1OcHkiMNMXIg7eyxFn4v8mwR8vHjFfYD9/beA9WNrO8N2BWj3z+61++hkpZ5iFy3OLMD6zZA1yUXQkC1o18YgRJFPpauEx9KYWd3OdY6pyiq6//8hKuwntLkRrDkj90VlpvGSpn8NgwEvKzAHsIp30YD1AD6hiz/oMZLcmX+StBHr0QvLXIzpkwfhLoy2eqf3chVT8o2I1ARZAcvOu82HfAeT9yxeeTnLhjWc6G/cXiGUin++IdY5urEdopPkHgjgr9yr52herD8PZrTvjpE6lcLWp6q0hGU7ebrvYtVHTXV1+mp46DiWr86R7QjCoVkYvqGqlZwmhenmpu8USOdLdL3tWbwQLTv6uc9imx9sZYCWjMZ+KE9FwNTFrASkByAMCVkBxqJgYJKDMLAj8me6k4Br/+Y0TbnPUWD142hukJs6anzYuwO2U124WodPrKcRfoLuxIDxajUdnB21cY7aWKX7J5g9+64gLElIqk/e6M3vrF00pMeIcc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(23010399003)(366016)(13003099007)(6133799003)(22082099003)(18002099003)(38350700014)(5023799004)(4143699003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UWZOa1hkTnBxRTZKQjZmNXVKQURHamRoUS9pQnJSMmZERWZDbkJLc2Qrb3RR?=
 =?utf-8?B?S0diNm1rYXFSSDc5WEtRMll1Mys3VithUnpqNzUyY0NyNUFlN3p5WjNpTVJl?=
 =?utf-8?B?dEdPZTBBeHJ2a25tQ1BZRW5rMnFMVFhwQmRkWHJKUGVLUXczUHR5c283eTJz?=
 =?utf-8?B?R1pCWExIZXM1RlFqNk5lQkRReElGS0YyYTJPVEgvdU15ZE1yZEliMWM3QUdt?=
 =?utf-8?B?djZPZVVpS2Y0YzQ2QTIza1VqTWFTcHN3NEFmait5RDhWUXR3U3U4WUN4R0U4?=
 =?utf-8?B?ZHo2ZEpOTVR1SFpZR3lOY1k2V1Q5ZHFHdjhBYmkzZEhaOHZZTG5YbGxWYXND?=
 =?utf-8?B?STFlaUhYWnl0SFhVZGdnMk15YVRBZlY3WitwVFlOcWZTWFlRaVgvdGNIYVNC?=
 =?utf-8?B?bVptZFFYM1lGL200RDc5MWtodWNJWjFUUUtDQWVvcVZJOGJJbFZkQ3RoUHBD?=
 =?utf-8?B?c2JHUUlqWFpaWEhvVmpGWFUycnVGQTJ0enRVNUFOUHdxd1lQTVdnWkpoVXpR?=
 =?utf-8?B?WnZTZkFNQkFycFU2MkVadVYveHh6MUpGWDBTT0F2dk8rUm1WY0pSWXdtMHpm?=
 =?utf-8?B?WlhqWHFQdU4xN2w4TkVQQ1Z6dXMyekJidmV3eXZVbm1ZS0pyUGpJOHBSVGZV?=
 =?utf-8?B?YXBKczhxcUJhL1lJdWlBYmRBUWIxaGpCMWhDNzVKR1ZDZ1NBRTYyR1cyMTlN?=
 =?utf-8?B?YUhRM0tCMlRtaDFabGM4YVo1KzNUa2tDSVV0dUJ1ZWJUaWFEampVVWc4RHF1?=
 =?utf-8?B?TmhLenVFR25TYWZkVTV0aDlKQUhsSHplcFllVEpaZ3c3a1dJZHRsamNzYVRz?=
 =?utf-8?B?MEtReVdUanppUXNDTndFdXN5TVZhR3NUdGJ3QW9BbGdaaFNGeEswVFU5WlJX?=
 =?utf-8?B?dWx3RURkdy93TmNsTDEwT2QxUHQ4Y3kxeEI1dHpsdnRSQWRCSFpZelRTOUVG?=
 =?utf-8?B?d2syczJQd3lqazk2V3ZJWjVoekR4TnBYWngwemNJaUdoOTBuY1drOUp3SDhq?=
 =?utf-8?B?WnJlL1ZkdjYrb0xpWC95bTlEemt2NHRrWFhFQm9QSHFsdS9JeU5VK1EvcTdW?=
 =?utf-8?B?dWZMZ3RiOGo5QVk5MCt2d3Y1NlJvVjVQQmtjSzZKQUxIeVFqQVNHRks2VkN5?=
 =?utf-8?B?OXpucEtjcUZ4blphMno3YmZLbUY1K2l1dEVITWhNMG9kejQwWGFXRXBuNm9m?=
 =?utf-8?B?QVdYdnVQd2ZnNEZuekxpakZrVDhER0MvRE5tQTl6WDROWWl6VzZHVE8wRDdj?=
 =?utf-8?B?V0R1RVNsb2RkQ0d5ZUlNU0hHTWVzT0dsQis0NlJvZ083ZUFwY0cza25IaVVU?=
 =?utf-8?B?c1hSR01Ld2d6SWE2c0R6cUJrcVZlL1FwdDI1d1NRWVZYbVlFRnRyaTJ2bzFF?=
 =?utf-8?B?dXhqbjZxbHA2VndhUEpuTkRXL0swSjlQSSsrRTZSSCtqZXZ5blRZT0d5K3J5?=
 =?utf-8?B?SnVQU2ZRNVFXY0ZYdThmcUZwRWh0enR4MWxVaElaYmk0VUY5NEZ2c3VuSzdY?=
 =?utf-8?B?Y0xTaVhTOVFwM0FlTkhUYW1aYmx1cUV5R1F3cTFLVnJnUXJPWWI5ODg0b3Uv?=
 =?utf-8?B?eDAvMVE1SmxUR2FJbGY5MGlUc3F4RmQwWDJqNmRBOXRUcnlNbVpJUG1vNWZt?=
 =?utf-8?B?WmJMbTByREVSVk10dkNPWHg4QUF5cEwyTnRlZmxxeVJwT2I4V2FSVjdaTkxC?=
 =?utf-8?B?Q3NhYlI3d2h2bjFlSzdkNDI4RUlSaTkyMmpTZm44OERTeEpZTTNwQlZHUm9x?=
 =?utf-8?B?Tzk2MFU5VU1PYUMwREhCQjN3Sy8vNm9ybnNjWlFMUUhsVlFmZUZERVBicUti?=
 =?utf-8?B?Ykl5MHp0TTFUUkxGQ3pyM0RheUkxclRDNlBxMWhWckVjQlVYS2hiam1uaHNL?=
 =?utf-8?B?RWswa2tPYnVubEpQSUdmQ1NWYnRLRnAySTNCVjdMem1MWFlRcENrYVRzSTV2?=
 =?utf-8?B?dDZYZjNnMFJrdFZmVlNDM0dON0t5QXFzd2tSVXZXNTVFWGxORFF2cC9ONWt6?=
 =?utf-8?B?aDMrRzZLU2JiUzBRdVdmdVpMZURlZFBpWmxSOWo0R1RKaCtySURmOFB0YURa?=
 =?utf-8?B?RmFKVVZEM1I3elJDOEQrTlZFSjdWcVRVbzc5citwdkVhVGx1aTdCOUl2dDdy?=
 =?utf-8?B?eUxoZlVNSDEwN0xUMmF2UlNaa3BkdWJqT21wZ0ZYd2xvTTNBTnNSbUZucUsy?=
 =?utf-8?B?RHJMZ2JqTTU1T3dpNnE0alJqcEJ0N2xhSUk0ZEh4azBPVmNEQ1dvb1kvb1cz?=
 =?utf-8?B?VXZqUVBUMjdPN3lJNW03eU9LOU5XZ3dET3NMWmRvdzlQMDh2SUZxK1BtRDQ0?=
 =?utf-8?B?dXozRTBFY1A4VjlZUzAvSDVDVVVIbUdRUHp2akhUTzhRS01vT3ZtcWhZV2lZ?=
 =?utf-8?Q?nHp9/qkzHQ77ipmo=3D?=
X-Exchange-RoutingPolicyChecked: 
	dtPtJx3THLr2Ky8z4SxjZpew6lVWbc6AyxrGvIiLb8GZpUK1Nybjd7t1C/5eYNMrfbOiIqCU9GRYwNS9J1AV0mmBDj3om2JNWnXnT2yhigcygipwO3QNrG3aCbG/kLAn83CAWvKb+l9wAyAGhvWi0QJOiz8yaArd8cc0lGhUv6ab0rHHH1tXM7msFIVWHpBp4TgKH2IKUl1Rl20FU0ljUISYVX4dZ1aiUbMRszTEmGOSmmDmfRZDfvt9WCwZSKsa+Dpdp59qAt/8J+8EL6g+8+6eiXRaaUO8y3NPgUqNYktlUjv1RCELbzbypHb/s0OYdd5ugY4NlRP41yp+gS2AtA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef92eb1d-c7bf-4dc5-2f8f-08decd168a8d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 08:49:44.8547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUq4eoH7m6CZG0KBjbBC3DgoeCjEAOV3ezR9GNzyyC032B5YG8wa97uapKHtu6CvFXT1eoO8E65tqaLz1owZ3KTqhQ0rArJVsBlx4RvcfGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5989
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 3qu-bxNZCwpYb_2nP949z3u5pdgzdTao
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4MSBTYWx0ZWRfX8xsmX5MAzM6D
 fQCkUSSgGhT3wrNpBK/aE6KD4JiAiQixih6czOqlZT9YMG0cRL9BLyQ/FlTcZ2YwZlVGDy16PNl
 bnmZuCNVGaBWw4rAL4C/ZlkaYi/c18FBaseu8ydd8SHOhFlapmSFAvRiIoR7lonmY9mlKxBABhK
 S3SVLnFaD4Z7fjVOkY6sKt9cUQVeA97EVkE60C7ctB+IUm6gaYP/VJ+RbSgozWaAS0lO9qeSfZL
 0jhaVQmJ2weCKe8IciiBzGJRooCOXiL7Xuw+VPUffT/cbWJviiFg3J5Yuq5RGlG90NltwmNcUNN
 /Q5qqWta6UsF7WD8SUjtX80sIVQ3M8uqNH7DAQixtC+HNlwjrQ3ZW3oBV234ciFJvNV387iisvW
 lP8qNZzs3LSLusbf17Rx7hkVgthEKtNOuMRMSFdE/BtAcJ7xVaTg9x8IHW4fRa9xBpxO3DxIRdU
 FoLauyhslSu2Ev3qqMQ==
X-Authority-Analysis: v=2.4 cv=B4qJFutM c=1 sm=1 tr=0 ts=6a33b12f cx=c_pps
 a=hroH2nosuffgF65CSEropA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=CCpqsmhAAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=FIWlwnfn0dxGhyZdWZAA:9 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ac9Ds4r2H8eMaeBVLIbP2y4awEQsTFGA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4MSBTYWx0ZWRfX30TH0IICqJsO
 ZvWM1lWw2TrVetV9dWcytq7xWmYXCaqQmZbPvPn6XEeMX6J/Z+pZSM3pmCppiBd/kl2RfMXeyC1
 ObS254bztiWmZFigiBEEotKw2Nfm4xmCdhw7tcMrzADEQsqJUu4R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 08:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239067


On 6/16/2026 2:13 PM, Yoann Congal wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Mon Apr 20, 2026 at 6:24 AM CEST, Harish via lists.openembedded.org Sadineni wrote:
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>
>> CVE: CVE-2025-69646
>>
>> PR 33638
>> * dwarf.c (display_debug_rnglists_list): Return bool.  Rename
>> "inital_length" to plain "length".  Verify length is large
>> enough to read header.  Limit length to rest of section.
>> Similarly limit offset_entry_count.
>> (display_debug_ranges): Check display_debug_rnglists_unit_header
>> return status.  Stop output on error.
>>
>> Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=598704a00cbac5e85c2bedd363357b5bf6fcee33]
>>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> ---
> Hello Harish,
>
> This patch was lost for a time, my fault, sorry.
>
> Now, when I try to apply it, do_patch fails for binutils. Could you
> rebase on the latest scarthgap and send a v2?
Hi Yoann,

CVE-2025-69648 is a duplicate of CVE-2025-69646.

The fix for CVE-2025-69648 has already been merged into Scarthgap, so 
the corresponding fix for CVE-2025-69646 is already present
and no additional patch is required.

Thanks,
Harish
>
> Thanks!
>
>>   .../binutils/binutils-2.42.inc                |   1 +
>>   .../binutils/0031-CVE-2025-69646.patch        | 187 ++++++++++++++++++
>>   2 files changed, 188 insertions(+)
>>   create mode 100644 meta/recipes-devtools/binutils/binutils/0031-CVE-2025-69646.patch
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
>> index 839d31242e..beeb758b64 100644
>> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
>> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
>> @@ -69,5 +69,6 @@ SRC_URI = "\
>>        file://0028-CVE-2025-11494.patch \
>>        file://0029-CVE-2025-11839.patch \
>>        file://0030-CVE-2025-11840.patch \
>> +     file://0031-CVE-2025-69646.patch \
>>   "
>>   S  = "${WORKDIR}/git"
>> diff --git a/meta/recipes-devtools/binutils/binutils/0031-CVE-2025-69646.patch b/meta/recipes-devtools/binutils/binutils/0031-CVE-2025-69646.patch
>> new file mode 100644
>> index 0000000000..42b0b858cc
>> --- /dev/null
>> +++ b/meta/recipes-devtools/binutils/binutils/0031-CVE-2025-69646.patch
>> @@ -0,0 +1,187 @@
>> +From 598704a00cbac5e85c2bedd363357b5bf6fcee33 Mon Sep 17 00:00:00 2001
>> +From: Alan Modra <amodra@gmail.com>
>> +Date: Sat, 22 Nov 2025 09:22:10 +1030
>> +Subject: [PATCH] PR 33638, debug_rnglists output
>> +
>> +The fuzzed testcase in this PR continuously outputs an error about
>> +the debug_rnglists header.  Fixed by taking notice of the error and
>> +stopping output.  The patch also limits the length in all cases, not
>> +just when a relocation is present, and limits the offset entry count
>> +read from the header.  I removed the warning and the test for relocs
>> +because the code can't work reliably with unresolved relocs in the
>> +length field.
>> +
>> +     PR 33638
>> +     * dwarf.c (display_debug_rnglists_list): Return bool.  Rename
>> +     "inital_length" to plain "length".  Verify length is large
>> +     enough to read header.  Limit length to rest of section.
>> +     Similarly limit offset_entry_count.
>> +     (display_debug_ranges): Check display_debug_rnglists_unit_header
>> +     return status.  Stop output on error.
>> +
>> +Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=598704a00cbac5e85c2bedd363357b5bf6fcee33]
>> +CVE: CVE-2025-69646
>> +
>> +Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> +---
>> + binutils/dwarf.c | 67 ++++++++++++++++++++++++------------------------
>> + 1 file changed, 34 insertions(+), 33 deletions(-)
>> +
>> +diff --git a/binutils/dwarf.c b/binutils/dwarf.c
>> +index 615e051b2bf..d718d97c771 100644
>> +--- a/binutils/dwarf.c
>> ++++ b/binutils/dwarf.c
>> +@@ -8206,7 +8206,7 @@ display_debug_rnglists_list (unsigned char * start,
>> +   return start;
>> + }
>> +
>> +-static int
>> ++static bool
>> + display_debug_rnglists_unit_header (struct dwarf_section *  section,
>> +                                 uint64_t *              unit_offset,
>> +                                 unsigned char *         poffset_size)
>> +@@ -8214,7 +8214,8 @@ display_debug_rnglists_unit_header (struct dwarf_section *  section,
>> +   uint64_t        start_offset = *unit_offset;
>> +   unsigned char * p = section->start + start_offset;
>> +   unsigned char * finish = section->start + section->size;
>> +-  uint64_t        initial_length;
>> ++  unsigned char * hdr;
>> ++  uint64_t        length;
>> +   unsigned char   segment_selector_size;
>> +   unsigned int    offset_entry_count;
>> +   unsigned int    i;
>> +@@ -8223,66 +8224,59 @@ display_debug_rnglists_unit_header (struct dwarf_section *  section,
>> +   unsigned char   offset_size;
>> +
>> +   /* Get and check the length of the block.  */
>> +-  SAFE_BYTE_GET_AND_INC (initial_length, p, 4, finish);
>> ++  SAFE_BYTE_GET_AND_INC (length, p, 4, finish);
>> +
>> +-  if (initial_length == 0xffffffff)
>> ++  if (length == 0xffffffff)
>> +     {
>> +       /* This section is 64-bit DWARF 3.  */
>> +-      SAFE_BYTE_GET_AND_INC (initial_length, p, 8, finish);
>> ++      SAFE_BYTE_GET_AND_INC (length, p, 8, finish);
>> +       *poffset_size = offset_size = 8;
>> +     }
>> +   else
>> +     *poffset_size = offset_size = 4;
>> +
>> +-  if (initial_length > (size_t) (finish - p))
>> +-    {
>> +-      /* If the length field has a relocation against it, then we should
>> +-     not complain if it is inaccurate (and probably negative).
>> +-     It is copied from .debug_line handling code.  */
>> +-      if (reloc_at (section, (p - section->start) - offset_size))
>> +-    initial_length = finish - p;
>> +-      else
>> +-    {
>> +-      warn (_("The length field (%#" PRIx64
>> +-              ") in the debug_rnglists header is wrong"
>> +-              " - the section is too small\n"),
>> +-            initial_length);
>> +-      return 0;
>> +-    }
>> +-    }
>> +-
>> +-  /* Report the next unit offset to the caller.  */
>> +-  *unit_offset = (p - section->start) + initial_length;
>> ++  if (length < 8)
>> ++    return false;
>> +
>> +   /* Get the other fields in the header.  */
>> ++  hdr = p;
>> +   SAFE_BYTE_GET_AND_INC (version, p, 2, finish);
>> +   SAFE_BYTE_GET_AND_INC (address_size, p, 1, finish);
>> +   SAFE_BYTE_GET_AND_INC (segment_selector_size, p, 1, finish);
>> +   SAFE_BYTE_GET_AND_INC (offset_entry_count, p, 4, finish);
>> +
>> +   printf (_(" Table at Offset: %#" PRIx64 ":\n"), start_offset);
>> +-  printf (_("  Length:          %#" PRIx64 "\n"), initial_length);
>> ++  printf (_("  Length:          %#" PRIx64 "\n"), length);
>> +   printf (_("  DWARF version:   %u\n"), version);
>> +   printf (_("  Address size:    %u\n"), address_size);
>> +   printf (_("  Segment size:    %u\n"), segment_selector_size);
>> +   printf (_("  Offset entries:  %u\n"), offset_entry_count);
>> +
>> ++  if (length > (size_t) (finish - hdr))
>> ++    length = finish - hdr;
>> ++
>> ++  /* Report the next unit offset to the caller.  */
>> ++  *unit_offset = (hdr - section->start) + length;
>> ++
>> +   /* Check the fields.  */
>> +   if (segment_selector_size != 0)
>> +     {
>> +       warn (_("The %s section contains "
>> +           "unsupported segment selector size: %d.\n"),
>> +         section->name, segment_selector_size);
>> +-      return 0;
>> ++      return false;
>> +     }
>> +
>> +   if (version < 5)
>> +     {
>> +       warn (_("Only DWARF version 5+ debug_rnglists info "
>> +           "is currently supported.\n"));
>> +-      return 0;
>> ++      return false;
>> +     }
>> +
>> ++  uint64_t max_off_count = (length - 8) / offset_size;
>> ++  if (offset_entry_count > max_off_count)
>> ++    offset_entry_count = max_off_count;
>> +   if (offset_entry_count != 0)
>> +     {
>> +       printf (_("\n   Offsets starting at %#tx:\n"), p - section->start);
>> +@@ -8296,7 +8290,7 @@ display_debug_rnglists_unit_header (struct dwarf_section *  section,
>> +     }
>> +     }
>> +
>> +-  return 1;
>> ++  return true;
>> + }
>> +
>> + static bool
>> +@@ -8327,6 +8321,7 @@ display_debug_ranges (struct dwarf_section *section,
>> +   uint64_t last_offset = 0;
>> +   uint64_t next_rnglists_cu_offset = 0;
>> +   unsigned char offset_size;
>> ++  bool ok_header = true;
>> +
>> +   if (bytes == 0)
>> +     {
>> +@@ -8419,8 +8414,12 @@ display_debug_ranges (struct dwarf_section *section,
>> +       /* If we've moved on to the next compile unit in the rnglists section - dump the unit header(s).  */
>> +       if (is_rnglists && next_rnglists_cu_offset < offset)
>> +     {
>> +-      while (next_rnglists_cu_offset < offset)
>> +-        display_debug_rnglists_unit_header (section, &next_rnglists_cu_offset, &offset_size);
>> ++      while (ok_header && next_rnglists_cu_offset < offset)
>> ++        ok_header = display_debug_rnglists_unit_header (section,
>> ++                                                        &next_rnglists_cu_offset,
>> ++                                                        &offset_size);
>> ++      if (!ok_header)
>> ++        break;
>> +       printf (_("    Offset   Begin    End\n"));
>> +     }
>> +
>> +@@ -8461,10 +8460,12 @@ display_debug_ranges (struct dwarf_section *section,
>> +     }
>> +
>> +   /* Display trailing empty (or unreferenced) compile units, if any.  */
>> +-  if (is_rnglists)
>> ++  if (is_rnglists && ok_header)
>> +     while (next_rnglists_cu_offset < section->size)
>> +-      display_debug_rnglists_unit_header (section, &next_rnglists_cu_offset, &offset_size);
>> +-
>> ++      if (!display_debug_rnglists_unit_header (section,
>> ++                                           &next_rnglists_cu_offset,
>> ++                                           &offset_size))
>> ++    break;
>> +   putchar ('\n');
>> +
>> +   free (range_entries);
>> +--
>> +2.49.0
>
> --
> Yoann Congal
> Smile ECS
>

