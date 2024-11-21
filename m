Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E420BD75BBC
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 05:55:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4591.1732168528145215618
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 21:55:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=105597799c=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL56Bj0023263
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 21:55:27 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq4ymr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 21:55:27 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AL5tRst028610;
	Wed, 20 Nov 2024 21:55:27 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq4ymp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 21:55:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouoNCE8YXdbpStpZTIUy3qkU3pGRap69PHe8D6WtLO+WzgnPmoeY+7g4OnsdnsbpvY2wtohiLMtm9gt6Ho+Hizp/xuIhjcgsA1ZmA7Aq6f99XbXTl4dY56SMpynZiMNBgo2RcYZ6HMDvz9WP4cI7x7X7459tukC+/p5kG3bnVNjfhMszCUBbPElOA2EJPn0vGeXcjcIMkJIdFGBHgM50zQuF9Hn7Dv62fnX5PQ2QMtDgZlR3ziQlXYI3spne1RZExM+O7z/eQkC4wef5YYs2T7Yd9mCpCxAnQRC8KwwwPa8JnXsqmYK3HcOV0x/B6thUc4RYiYQV0jkhQEaf7Q6KZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gWz3tOQwJfAQrm/eCM2CxOdefWqMrD07VScwImjshc=;
 b=rTMUJvRKCa5YLkvrQydZlZO3V0wzif/+fkYVk3m44yrejaOiJMKYxXsQlb4hL3whc7Z3/zx2MGTFXg11TP1ka0FmBv5FDxDzyiSPwitnXAGqN/X/PJ8grFFNRRFVQozUEvVPqzSyMTqVTG9IeJbSQD3uR194rH6hsWd1uCxMj+emvpDLd0ZBuqTqplInzKNQeSoQs6d7OWIZ+0mNEr4fl4nMnwDinq0elug7UB9fSZDT93/sDgEt9NroL67g3iIUbA0XG5pz96YmCKAqVVErVIwBCBSnTHoiOmhxj4o8Ybn+cjCRh6cl6jMkphy5XMU8XdwW80m59679lQb7HufBZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MN2PR11MB4646.namprd11.prod.outlook.com (2603:10b6:208:264::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.14; Thu, 21 Nov
 2024 05:55:22 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%7]) with mapi id 15.20.8093.018; Thu, 21 Nov 2024
 05:55:22 +0000
Content-Type: multipart/alternative;
 boundary="------------Q2Ep6oLYT4EEShOtEzNhBPDH"
Message-ID: <911703f8-9473-48f5-b1ab-107d6722cc81@windriver.com>
Date: Thu, 21 Nov 2024 13:55:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rxvt-unicode.inc: disable the terminfo
 installation by setting TIC to :
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20241105101214.4095063-1-changqing.li@windriver.com>
 <B3814EDD-D5B5-423E-AD39-BC71478CBAF7@arm.com>
 <f715fbb4-bcea-4ac6-b460-0d99d0603794@windriver.com>
 <CAMKF1srb=9=zeN3J-DyYOySBKPwCCSmQHEc8p=iF=xZdhESecA@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAMKF1srb=9=zeN3J-DyYOySBKPwCCSmQHEc8p=iF=xZdhESecA@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0155.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::13) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MN2PR11MB4646:EE_
X-MS-Office365-Filtering-Correlation-Id: 60c43ba9-5903-41d0-e77d-08dd09f11639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UCt4MVFEWHZYdmphUzhTZnVrYUdXeUJHSGN0c2pzdnNmMUcyYmNrejl1a0x2?=
 =?utf-8?B?RTVXRUZ2ZE84dTZFRjIxZjBzQXlVemViTnMyV2UwS3cwUmVnZzFwSmM5WTRB?=
 =?utf-8?B?UE53SFR1Qlg2UE9xaHovbVRuTC8rNzZudHJGdXdHNmpvRW10QTA1c1VhWDJw?=
 =?utf-8?B?dkNCK2YzYSthU21aejJWYkg0Y2Q4eWtEbitQWE9LeGJSS2FJSzc3TkZnaVNQ?=
 =?utf-8?B?SXNyRWZ0UVpkUWhzSmZSK0s1ZmRQTW9yV2UvLzczR2RDQlJwOGtRRE4vMVAr?=
 =?utf-8?B?dUNhaWZJRGlXVnMxRTlBM0I0TlBneGRBT0kwNTVoaWhLbUd5Y1pTK0dZa2Q3?=
 =?utf-8?B?UUNoTTZqdkV5OWhRQjZuYmNuT1pzMVo0c1FDYkJLeGJ2TnVZS0srR3BNTXpz?=
 =?utf-8?B?MWNWNGZQandXMUt1Q1FTaWdWTjNsVFVnaisrVTBrT3FsODBRdDdnNXBoaEFz?=
 =?utf-8?B?dE1YczdhZHpTLzNVbExCQkMrSThmc3U5K1cxMWxVWDBsMCtFdTVrWmQzNDVU?=
 =?utf-8?B?dTluZ29ZdHB3bFNEUmE0MFU0SkRLQVFodFFSOUUyVzc4TStGNHNsdHowZGtT?=
 =?utf-8?B?WkliSTFjMjRnbXowZTI3ZHhMMHVtZGk0RkhPU0ZYWnorMndqMjhvc2grbk9L?=
 =?utf-8?B?bEhoMHR0RDZhOTcyakJCd1QyL3NXd0dYeXVFSW15QWhvbkhmTHhHY2hVRHlG?=
 =?utf-8?B?TmtpZFEwUktIbjZydmFqRVdyZDU4Rmp6bG1acnQ1R1pIbFNJVU5TMDBxVkh6?=
 =?utf-8?B?UVRYMTVtUlVTbCtqY3A1VnNwMmVoMHRTWUg1d0JWc1FvL3hoVDE2b2JkSnRr?=
 =?utf-8?B?cEUrcE1qM1pZVkJuNG5YS0hSbTlYVnE1T0ZZZzhvU1AyaUVBVjVJVDFqaTJj?=
 =?utf-8?B?ZFZPakVkTXJzdkVqWWhXQXMybUc5L2g2YmcyUjdVVzVFYmxUYnZKVk5QNHEw?=
 =?utf-8?B?ZUJPSCtYYU1QSmNQRXZDQVlrRjBFTjk0YkpnSzdkTGZ4WjVvaTlXSGlFZ0Vy?=
 =?utf-8?B?VldVM1JDb0ZWemI4L3VjNjY1cmFlM1N2Y09kQXU3aFNLejVva0w5S0ExcGk1?=
 =?utf-8?B?WDczY1RtNXplS2ozWHk3QmlweWZrd09KU1ROUjBuV0cwdzNSQVhZTkhhd3M4?=
 =?utf-8?B?NUZqaE1SdzFITEhnUStZNHhUL1BkcUxQY2FRckxzZXRsWncxZ2tSRDhmMFhB?=
 =?utf-8?B?bUlIYmhxTVVOUXZhRjJXUE5GYVkrTWNOTWlIaWZqbERSN1dXTzNGdm1ncVZa?=
 =?utf-8?B?RllKck85d2pqM1BteExNWVVDcXZhd0xzY1pTRFpwRjRJWmYzbHN4ZlRpOHB1?=
 =?utf-8?B?ekVTbFppbVVBY1krTmVNcG9NNERIVTNzaDdtUFBYWTJlSmN5aTF4N2g1ZDhJ?=
 =?utf-8?B?bGNibkJLYitDWGEwaWNKdnNwVnpmRUEzdm5aUGFuUk1UcmhhaXBLbDFTLzBr?=
 =?utf-8?B?bnJzdmthb1orVlFrTzdZekpiT1Y3dlYzR1lCMTczOHhlWk1ucE12aWR1eTc4?=
 =?utf-8?B?S05vTEV0VjU5RnhGc0RtVzRVRHhlNWpDRDlVbnljaEIrdnVnangvS0VTK0Qv?=
 =?utf-8?B?RmtwRk83Uk92RFEvdUdOVGkzVXArOFVKV1p2TVdKT0tVOUVvN2hqckxqaENG?=
 =?utf-8?B?TG1QRGJkNHowYnlMNHltcUZOVTY1c1F6VmlBTzJMUE1EcXp2UitUeDYxT3Mz?=
 =?utf-8?B?cGFxU3JQMlpNMEhxaGNMSWdQTDBkS3d1WlM3N0E0QXdmVXZVMUcyWjZ3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eXVzeG8xQWYwUExac0NXR1FCZUpFREhEdnVGNmdPR0lsZmFrTXorUEgyS05n?=
 =?utf-8?B?ZGQ5Zm93aENoRTltb3AwKzB3cnc1ZGozYTVtdUtMeDNBamdRcnpRakFvWmNJ?=
 =?utf-8?B?ckYzNXhWNlgyNGtsS09uSVFiZzc5NEVyUGMwK3M1SElzTVRkam5ueXpkaWZw?=
 =?utf-8?B?RWZRVzEzSDcxNzI5TDk3MFpVV3AxbGpQenVyT3k2M1B3eWdYMnJxc2hoc0tX?=
 =?utf-8?B?anIzc3BxQkpWMVVZRnhUMjNPYi9ZV1JwNWpFVWV2VTBiQWd3ZXp5STFtQnJy?=
 =?utf-8?B?dGI3OEMxaDVaZDVoMkcwYm9FeGUvNStLREhYRFByY3RqS0wxVHU4dzZGUUhY?=
 =?utf-8?B?WHFsKzA0U2JvZW1RY1ZpS09MMEtyMFB1QTVaV1VkclRLK21mWU9NZmljSWFP?=
 =?utf-8?B?Mkt1WEtQa3FDelB6dzVOWlN2YWRjYWVvTHJxSStxWmgxaEpOOWVFMHExd2tx?=
 =?utf-8?B?MElISStabUtnQ292ZWthUDZHSm1iUlkvRkQrU2pwR3FDUVNXakNTcEhiSVFz?=
 =?utf-8?B?Z1RYeEV0R003RFpFVG04cUJhS0VCaUVGMmdqV1J3dWtWemQ2cFNFMktYL0lW?=
 =?utf-8?B?TzF2a0xreFd4RnRYTlpPMDJUbDhOb0VseVpHRXJKLzZqN2JDRjM5VDJCazVV?=
 =?utf-8?B?MDloaWZHY2ZseTJHbkdIUjl2UlpvbHFENjQ0WEl4dEo1N1BDS3Y1c0xJQTRu?=
 =?utf-8?B?THhtZlZWYkpiMHc5MTd2eG9YNzdITzQ1dDN1Tm9Ma01yUHRsRVM5bGQ2eGJI?=
 =?utf-8?B?Z1lmQi9wT0daWU1pSlFKQ2s2NVE4aTMzT2pHcGFBTVBudnRDamVTZ0ZFK080?=
 =?utf-8?B?TUFpR1ZscGZpZ2pCdWd3ZDhLVGpwSFc4S1E4VFJsOWU0Skp2QmNkemM5TFYy?=
 =?utf-8?B?KzREQjJUSjJLeWNXNWdaOVdvUk1FRXRvVzB0Rktwend0UTF0aXpvdWFMTFRO?=
 =?utf-8?B?bGU2czRqbGYwSy90SFlFK0dCVkRjUHZmNGY0RS9VMkxQcHhQYzdwVTV1WW50?=
 =?utf-8?B?c2NoTW9NS0M3R1NybElBcXd6bUdENk9jZWdtNG9NY3k5dGZ5eVB4U0ZveUQ5?=
 =?utf-8?B?djNNVmJXNUgwY0tySUdWaWtESTRoR3dteGVNTWt4YitJR0VNREVnSVFlMU9C?=
 =?utf-8?B?Zm5Bb0Nxa2I0MWN5WU9jUkw1SWFITmcvRzFSb2syL2Z2VmdYMnJkQnNJeGJ5?=
 =?utf-8?B?UFBwN3pISThlQVdGcW02cC9Sc214eFdzZXNUN3piVUxVcUVicWEwVU9SMGlI?=
 =?utf-8?B?MGwwajZMQktFYzlwUDhlVW9BWHBvcVBUMXhiZmdIS1o5S25mbmVnZ3J1TFFh?=
 =?utf-8?B?N25adzZpMm9TT2lrMHhnVVJ2cGNWZzRQMmZURC82QXBoaFppaXlqY2JmYno1?=
 =?utf-8?B?NWwxTFVGSnBPRnBZY0N3QkE0M1VkTy82NkZzUUNGVEtXSy92d290UWs2UDJN?=
 =?utf-8?B?bklQNDUwZ3h1RnUrSzJGYXh0NHR2WnVTbUlPelJjc0pVQTYwcmtrYjNhNm1R?=
 =?utf-8?B?cmN6empISitYZ3NDdXd0cHl4dkE2YUI1VytISkdXMFdaL2w5Mk1tMHRrOXVo?=
 =?utf-8?B?SzZ6d2ozZmI3c3l2NzhzRkphejllcysxd0kzOWVQVXA5ejkzaTh5ekhiMkh1?=
 =?utf-8?B?d29iWThUYzBGNDRFMGZncFJxZWQ1UCtWZGJkSytoZSsyNXZZT1ArblpiaHlI?=
 =?utf-8?B?c0c3R0ZtdTByN3JvbkU2Wk9kbzM0SzlaTDFIRjVmTlZkWlI0Q043d1NHT1Vt?=
 =?utf-8?B?dkdpZjdROVg1aW5COGRVSnpncFpjMjZLYUpPd3grZWh4YjBVQXI4by9keUYr?=
 =?utf-8?B?ZjgrRUN4ZUVhaGtxMVpZc2tjaVJ6Wjk1VXkwNEU4dHhycHNlZlZzQ1pCYnNu?=
 =?utf-8?B?Z05PRFdqV2l5T2t6UEJRYVFoMkdlMXkrODQva1UxaDFKVkJXelBIVUhBNVoy?=
 =?utf-8?B?MG5PcjFDQWFlNk1sQTEvMlArdzY5Ui9aK21DSTRjakNrN0ZXTXJlaTFYYlNN?=
 =?utf-8?B?eFZZOTFaa2xSL0NGa21tL3ZQRXFFYW1ySVpjYnF5eHVrckdkOGc4d001d3JW?=
 =?utf-8?B?UmFES0YvYllyM0VtVDMzTUhpdmpkMG1NalVWSFd3UlFtM2ZENDNsSXBLY01Q?=
 =?utf-8?B?ZVpjTERFeGpoYW9UN0ZwcUkzcHlYaUV0VzBZcWQwQ1pNS2xXd0dxU3A3Qksz?=
 =?utf-8?B?dEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c43ba9-5903-41d0-e77d-08dd09f11639
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 05:55:22.3444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SrBFQ7OIkEaFF6W0R6DkVU47kqD0PON1QW7IhMJUAYls2/cldhiCJZ96u4fNsCFwM92ehJ3RgpY/P5qnNsZs2q3RtbaYwrYrYXkH7twDvjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4646
X-Proofpoint-GUID: f5Afp76j6PrFpgc7x6_MV-yfOIo5Nbmk
X-Proofpoint-ORIG-GUID: saaEqTgHCznX4A5wxImaQjgpc2CZmVYA
X-Authority-Analysis: v=2.4 cv=d9mnygjE c=1 sm=1 tr=0 ts=673ecb4f cx=c_pps a=smr7v+wKk2SgYJk0SwJNKg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=IvQJNAUUq8ru2VKf7xoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=yj-aMKAYKbz0kkd27lYA:9 a=If7nKnOWcfXlX78F:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_04,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 mlxlogscore=973 spamscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411210043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 05:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207509

--------------Q2Ep6oLYT4EEShOtEzNhBPDH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AL56Bj0023263


On 11/21/24 12:10, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, Nov 20, 2024 at 8:04=E2=80=AFPM Changqing Li via
> lists.openembedded.org
> <changqing.li=3Dwindriver.com@lists.openembedded.org>  wrote:
>>
>> On 11/21/24 00:51, Ross Burton wrote:
>>
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.
>>
>> On 5 Nov 2024, at 10:12, Changqing Li via lists.openembedded.org<chang=
qing.li=3Dwindriver.com@lists.openembedded.org>  wrote:
>>
>> --- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
>> +++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
>> @@ -37,6 +37,7 @@ do_configure:prepend () {
>> if [ ! -e ${S}/acinclude.m4 ]; then
>> cp ${S}/aclocal.m4 ${S}/acinclude.m4
>> fi
>> + sed -i -e 's#@TIC@#:#g' ${S}/doc/Makefile.in
>> }
>>
>> A brute-force sed feels ugly and prone to silent breakage.  Wouldn=E2=80=
=99t this work just as well:
>>
>> EXTRA_OEMAKE =3D =E2=80=9CTIC=3Dtrue=E2=80=9D
>>
>> Hi, Ross
>>
>> Thanks for advice.  But this @TIC@ cannot replaced by add configs like=
 EXTRA_OEMAKE.
>>
>> TIC is defined in configure.ac by "AC_PATH_PROG(TIC, tic, :) ", so TIC=
 will be native tic path.
>>
>> and during configure process, configure will replace @TIC@ in doc/Make=
file.in with native tic path.
>>
>> So in do_install stage, the doc/Makefile already have a hardcode nativ=
e tic path, not variable $(TIC)
>>
>> which could be replaced by pass argument. Seems no interface for us to=
 pass argument to change TIC.
>>
> you can override this via setting ac_cv_path_TIC=3Dpath/to/tic in
> EXTRA_OECONF or CACHED_CONFIGUREVARS

This way works. I will send a V2 later.

Just remembered,=C2=A0 I had tried to pass TIC=3D:=C2=A0 to configure bef=
ore using=20
sed,=C2=A0 but TIC=3D: cannot match as a path.

And didn't think of using ac_cv_path_TIC directly.

[snip]

e) case $TIC

 =C2=A0 =C2=A0 in [\\/]* | ?:[\\/]*)

 =C2=A0=C2=A0=C2=A0 ac_cv_path_TIC=3D"$TIC" # Let the user override the t=
est with a path.

[snip]


@Khem, Ross,=C2=A0 Thanks a lot.


Regards

Changqing


>
>> Regards
>>
>> Changqing
>>
>> Ross
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#207500):https://lists.openembedded.org/g/openembed=
ded-core/message/207500
>> Mute This Topic:https://lists.openembedded.org/mt/109403291/1997914
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------Q2Ep6oLYT4EEShOtEzNhBPDH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4AL56Bj0023263

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 11/21/24 12:10, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srb=3D9=3DzeN3J-DyYOySBKP=
wCCSmQHEc8p=3DiF=3DxZdhESecA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Wed, Nov 20, 2024 at 8:04=E2=80=AFPM Changqing Li via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Dwindrive=
r.com@lists.openembedded.org">&lt;changqing.li=3Dwindriver.com@lists.open=
embedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">

On 11/21/24 00:51, Ross Burton wrote:

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On 5 Nov 2024, at 10:12, Changqing Li via lists.openembedded.org <a class=
=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li=3Dwindriver.com@li=
sts.openembedded.org">&lt;changqing.li=3Dwindriver.com@lists.openembedded=
.org&gt;</a> wrote:

--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -37,6 +37,7 @@ do_configure:prepend () {
if [ ! -e ${S}/acinclude.m4 ]; then
cp ${S}/aclocal.m4 ${S}/acinclude.m4
fi
+ sed -i -e 's#@TIC@#:#g' ${S}/doc/Makefile.in
}

A brute-force sed feels ugly and prone to silent breakage.  Wouldn=E2=80=99=
t this work just as well:

EXTRA_OEMAKE =3D =E2=80=9CTIC=3Dtrue=E2=80=9D

Hi, Ross

Thanks for advice.  But this @TIC@ cannot replaced by add configs like EX=
TRA_OEMAKE.

TIC is defined in configure.ac by &quot;AC_PATH_PROG(TIC, tic, :) &quot;,=
 so TIC will be native tic path.

and during configure process, configure will replace @TIC@ in doc/Makefil=
e.in with native tic path.

So in do_install stage, the doc/Makefile already have a hardcode native t=
ic path, not variable $(TIC)

which could be replaced by pass argument. Seems no interface for us to pa=
ss argument to change TIC.

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
you can override this via setting ac_cv_path_TIC=3Dpath/to/tic in
EXTRA_OECONF or CACHED_CONFIGUREVARS</pre>
    </blockquote>
    <p>This way works. I will send a V2 later.</p>
    <p>Just remembered,&nbsp; I had tried to pass TIC=3D:&nbsp; to config=
ure before
      using sed,&nbsp; but TIC=3D: cannot match as a path.</p>
    <p>And didn't think of using ac_cv_path_TIC directly. <br>
    </p>
    <p>[snip]<br>
    </p>
    <p> e) case $TIC</p>
    <p>&nbsp; &nbsp; in [\\/]* | ?:[\\/]*)&nbsp;</p>
    <p>&nbsp;&nbsp;&nbsp; ac_cv_path_TIC=3D&quot;$TIC&quot; # Let the use=
r override the test with a
      path. <br>
    </p>
    <p>[snip]</p>
    <p><br>
    </p>
    <p>@Khem, Ross,&nbsp; Thanks a lot.</p>
    <p><br>
    </p>
    <p>Regards</p>
    <p>Changqing<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srb=3D9=3DzeN3J-DyYOySBKP=
wCCSmQHEc8p=3DiF=3DxZdhESecA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Regards

Changqing

Ross


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#207500): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/207500">https:/=
/lists.openembedded.org/g/openembedded-core/message/207500</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/109403291/1997914">https://lists.openembedded.org/mt=
/109403291/1997914</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------Q2Ep6oLYT4EEShOtEzNhBPDH--

