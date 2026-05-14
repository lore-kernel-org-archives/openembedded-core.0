Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC1CCD4F39
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 13:03:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10504.1778763795165296466
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 06:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=mJxg/jVv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9594595b3a=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EC1Ym34008014
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 06:03:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=5p1+5m7Nu/7sbxf0o+jwx/KdgxmB27pI7ge2rf4I4hg=; b=mJxg/jVvzzfz
	Gp0G4E1Ngf/qaEnrj79MIBI5b17OVSw/jbzsoRjauBmKTKarPgVBluuos+XbyIfT
	xWPB7CeOewzHai/glTdzuMKkqXSewpmziXoI8BsVcI3h54eMkW6YN2XPS4/q4OgQ
	YdJF2pCSy19JsQsRe1rkwpuTkPSKWwXJDHKPMy44k/HJuyjuKFzeGivIyGSU+5Xg
	7fHhyov8ydiRalXYzSFH4P/4FaeHfqQww/LaevW6YzJWKQPvtZwF/+Omay21UabZ
	8iG+ivrE8zPDO1ngI+d+ihF28slFmvHsuAm7Aiduc9bJXLmRzhqs68CSIY+wKUdF
	MOJhP8jGpQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011065.outbound.protection.outlook.com [52.101.52.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4ftba9t5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 14 May 2026 06:03:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsgzPhPJNp6odiWWAfettRsMeg+HH+5W6Z8cIi7ysrZyPXevdmsn1tEePMvIk1k65uQR+w8eI6r9LpjNmSL3RvVP2W7/9ECV2epwRhqZvxlAPrJuDWLTpRs0N2rm7HBtvTXnuegaeROV21LBE2NpyLuYS2wXyqqceNaAlq8FWp3QBzkNYi2se4kK8TlKUScPtxIlShZnoOSMSE2jCNQaN/q64Yes2/zyJKqGzNShhLNL9nWZ9byhuVULydTsqJ7JSO9aW8iqZkepd2bpFPG4Sebv5qTHKMYF9RN7usnyyMBlBFzTSnbaaafGd0FcUFKWCfJAidmCBS4qHHAIqGr+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5p1+5m7Nu/7sbxf0o+jwx/KdgxmB27pI7ge2rf4I4hg=;
 b=nUXRzEnXKgE5viec7OGHjYifv24gBaIyVaKGCrptMKa9U+vB5IYrFJ66ZJSqmXxrsNpHsYr1N+M9EXn/nMJN5afzFwF/WXdsxxwzWz8ZpygVJS58J3dP6WAMznv/un7S93ej+8hdPtuPyRGFTT+D+/q2TTXxvrtJ+eqvzQjLosC8IDzIuKVron1/HDL8WuW7nZDrQToNKYXCQmHyfG0/NzvNSnbfDHTJZ+JnMAF1V3hm0WB/suRBL8PTmIEsAHCkFjJeLgRrxokSGYzHQKaSaGFaioQapGn2ZbdhUKeXt40uxk6op1/v/gBDXBXcHpgwJNW/iiFS8Tr5nRg+kF5IXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by PH0PR11MB7543.namprd11.prod.outlook.com (2603:10b6:510:26c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 13:03:09 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 13:03:09 +0000
Message-ID: <a1303ca7-7c7b-4579-bf8e-206fc456c735@windriver.com>
Date: Thu, 14 May 2026 18:32:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] glibc: stable 2.43 branch updates
To: Randy MacLeod <randy.macleod@windriver.com>, peter.marko@siemens.com,
        openembedded-core@lists.openembedded.org
References: <20260507224813.3496793-1-peter.marko@siemens.com>
 <aa4d8b7d-b7e6-4839-9a30-1bf82398e739@windriver.com>
Content-Language: en-US
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <aa4d8b7d-b7e6-4839-9a30-1bf82398e739@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA0PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::10) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|PH0PR11MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e3b69d8-64df-4b63-b00c-08deb1b92591
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|52116014|376014|366016|4022899009|3023799003|4143699003|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	hOCKbo918P558dJc7ugAFANf1kYGR5loQz3ow2Gf2yPJ678iZTuUfhOvD52Fi3dETFStVdY8rtmLadd5dAZMbFWUkIvgTyu9ReniBB9XJdYBGnMjH24ZFxbkj35Bw+wAGduZkwbLhpYTQxO+pR6XlPhUxFREMuLm749nVNgIQOsC5qUxVlIy+YVUZk5DBFPHuHuI2mYnttO58n/3xkB1TnTet4IXQKg7VKEgHEtk4sGesbw1vuw5bDH/WeYVeRofhdXjCp8o+bVB/SIwkFr1DJMxOE2RANUQ8mLvZ9sqVngO0bzYFadUbobAuuAaIjvN047Vw0DorGxIkQ02HDLClMMOUDkAO428sBmN5WXKGff0UXOsPGe5YVthQv/ydZbFQSAG55aVSn6cqV3XyKv7brTDCpPyC99Ebsz7MqxmCP0HCmcuPrWcCMeiQdYGQq0vAi2W35e8U5bKIDQ2ST3eJ2sw4hu3EGFXa71J36yt7sZtlKg8wKXMDP5XKlnqw2ztO0mRj7vdLZsz+lLfbLEXfxB/hld/eIccieLhdQr2JscDVdIhJZ9y0c2FaYQuNtS/UpNpUP44+DOpqRATCdzRiDhFgkdGEbhtvQu6XdNCDK9nY18rhhFRJE+g1RXS32ayIjvruEx8ZAp67p47MUKSEg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(52116014)(376014)(366016)(4022899009)(3023799003)(4143699003)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aG00TmRmazZGYmgybVZQdjJuYjJscVgyZjB0OFhIcGhDYlEzMWJtRitIYVJL?=
 =?utf-8?B?REZpbEZ0Z1BZa0hxa29zNCtmcWtOc1VuQ1VVNXQ4eGhZY1F6akZDZ3N4czd3?=
 =?utf-8?B?YUdVSElLZE4zUkYvM1N1NURoajJKcHI3dUUyYktmRmQ2TTVZZFhaVUFVNGVQ?=
 =?utf-8?B?a3o0NlROUGF3WTBELythd0VXTTlkWmRJbmFITG5kOHQxS1cvN05NVXhvV3F5?=
 =?utf-8?B?by85ZDFLRlozQnBkTnRTekEwejZEYzdLM0p0eExLNi9QVDlmM3AvZFQwUFFP?=
 =?utf-8?B?TXVnNUVpR21NeVhkSk9jV1FnMDBORWN3MHZZaGczZ0U0bG1GcFZKckVGUERv?=
 =?utf-8?B?b0oyeXlycDZzd21Ibi81SG4vclpSU0c2Qm5LZVM5aXBEQVpiTmRWVWp1MEtn?=
 =?utf-8?B?WTNFZXdqQXRoVlpwZlB3OHI3d1hZRkt6VzBzSnNsMFh6bm5jeHIwN3VROG4w?=
 =?utf-8?B?eEpteDF3QTNtNnZBSXk5UDEvdzdHUlc0RlJLZU9kK3NKbXIyNCtzRnBBUFBk?=
 =?utf-8?B?bTJpclVZQWhJUmdsYXdXakdOc1kwMGgydVBXS1JtUElDK05OK2JDUDdJQlJH?=
 =?utf-8?B?WDZiTFdIcEhadWtaNHBMc3RqV1lneWpRaWFadG8xL3JOWWxsZkEwTTJRaDcx?=
 =?utf-8?B?b05oVlVCNDB4bmp6OGQwUHgrVWkzd0JVWHhSL0lTQi9hZ3JWMzl0K3k0WWIv?=
 =?utf-8?B?cVNJd3Q3dVhxVmc3dGVYYTJaZ0x0SDB5THZMcWJ3aFBvdzBBWDlDWG1kOVha?=
 =?utf-8?B?Qkd5ZXpVdzFQZVUrcU9aY3JUTkhSWjNRSU9VRGRvN1BoYmpFejZITzF5dTBJ?=
 =?utf-8?B?M2Zub3NKOWoyUmVJdm9zWGhFVjNiM2M0Qy9KQnhIdGpWS0lRSGF2d2lBUUFP?=
 =?utf-8?B?S1ZrWk5WSmdiemRoZ3ZVUjg4S1E5TXMybGIxWXdwTno4MHZwT2JZemNpazZP?=
 =?utf-8?B?czVaLy9RWEQyNU4wZVNPK2x0ckcxemxudk5NUFBEaXlIemhZNUVjd2JkWTVN?=
 =?utf-8?B?K2ZxRTVUV0JCNy9MdEhhUHhTZElsaHh3R3BCaHUvdlFUMU9nUUU5bkpQLzZJ?=
 =?utf-8?B?Uk5laGJYNjJuS05MenRoMXp3SXhMS1I2Qk5GWG91U2JJUEpqSElmWlZXejdj?=
 =?utf-8?B?d2FaY0RRM1V3VXJvMlFVOVUvdEhPcmNRQU5XRWU4ZzRhUHVYT2FqSDhMK2g4?=
 =?utf-8?B?bWV1N0FlbUNNa1l0WVp1SWpvaVBkSWNHUTJqRFRQeFRxRExpV1lyQnIvWUpB?=
 =?utf-8?B?TmxLdHpFNnRCbjRvNUZHZFB5ZmNyTWVNSDU3OE9TN045MGQ3Qm1nL0hJZFFN?=
 =?utf-8?B?MTBhWkVzNm1QeVVpSFNYc3U1cWxRZUsxbmpQTThIMVVxN3pTVUxObDFjdUJz?=
 =?utf-8?B?U3hyRXBhOGNUT0ZYWXJ5QjVjUG1ob0daNjVZcWtBcFVYSDFERWVmOTNyRkR2?=
 =?utf-8?B?UHRScWFIS2p4Y0lNWDVjNWdkNHliT2FhWUlhUjhod1pqTVpzeHNEaVkzRlp4?=
 =?utf-8?B?Y2tzKzluN05nTXRDbmNxN1ErM3JNZFFLZlo4UXdvVytMcGVoalB4ZTF1c2FL?=
 =?utf-8?B?Y1dQN0QwRnI4WjhTckJFYUkyYXZJeEd1d1M2Sm5JNldLTnAyVS9Fa0pxWldk?=
 =?utf-8?B?ekNJSUV0bjh2b0ROMS9WWGJwcTBZY2NSMlVOMTREbC9rTndvOHpYOGh5UWJn?=
 =?utf-8?B?NlA2aVpxOEYya0dCaTI4QjB5MFc2QThid2MxUDVZclF1NXZVcnY3SkZmRGNQ?=
 =?utf-8?B?clVQSXFpcy9VdUVmUzA4Mk85d3VqQi9nRHNYU2o1M0IrNmg2a2w0YjhUZkJW?=
 =?utf-8?B?OWtOc1JrVUlpb0hFQmVncVVmd1c5ZVFtNzlJTUxKN1BBRFZPamJPUTQyTWVJ?=
 =?utf-8?B?SEF1WWMvdUxneTY5SzVsWlpWaXZRR2dhcXplVXdXeHVhTjREZmxqaFdpNU4z?=
 =?utf-8?B?LzI5VlkwU1RLQVVNbTkwMFBqUHZncUJ3NkV3dW1kdmE0dm5GTUhmRnhXdUpZ?=
 =?utf-8?B?QVFtdzRPdlBDVWRMSHdSOWxpd1ZYV1c0VWdmR2xmamRocVRpQkMxZFRTWFh4?=
 =?utf-8?B?aVlnNUVETzlWZkVuWTg3SUFJR0NPd09wNkp2UWpJMFhwNmlwWThHUk1PSHJi?=
 =?utf-8?B?WG5wWVh1ZTlBTFdGNWhEY2ZCSnBlN210UEoxREsyTUpsbHdORFNLSHJidllo?=
 =?utf-8?B?bE9YaG1MbnBJQXI2eXlWSFdzOUxERFJ1eCtXVVljTEJZMlpRb0FIZ2YvaCtW?=
 =?utf-8?B?OG9FRXorZEMvbmtibWxJdzAwTktIYzZxNUl2TjVDYUVKbWh2OS9ETS92d041?=
 =?utf-8?B?bDBvSnl3clBtUnZXU1hqdEgvSVJXTkxyQ1FTQTkxRG04WVRNR1JKbUYzYk5n?=
 =?utf-8?Q?XHyJZZizbLawK4gnxzfxKp6lgoHbtBHEFMg7r96aUDQB2?=
X-MS-Exchange-AntiSpam-MessageData-1: SKHtEocYDRC/LA7Ykxf+g/GRMLj80ZXZ1SA=
X-Exchange-RoutingPolicyChecked: 
	OszVp3hwznZ2jEKzIyKORM5hgSu3KMmbykCFNStxY/iR9AUspCHSeud5nRF5ZXANyN5VPbucNY3K7V40rrewUCFct6FsIML91W6VUWKz1co00s26DCCfdCtHL3oEIDW173QqX7x0tYqpJxrS8Cbjs4ZIVKelajnwr599dMhvQ+CW1VXSjOtgEUqnZsxBBRmSPaPKCmZds2/j0wS+BR+emJf0TqySxb4NVMoaW+8rP9TYBqzARCPOAv+aFDZz/ht27k2u9Mg5kPvGfnRivCBMY2yOpPIhmyGxG/gd0xz/zE+LMsvLYrB8+KypyeFw8mw/zN12jkTnPqBKLMjbUrj9JQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3b69d8-64df-4b63-b00c-08deb1b92591
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 13:03:09.4504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DnEng+/m/p2zePPn/4OetNgkC1yvE42Iamb96LTyit974dqLjFcLk7FbcmH3HnuSTS5OUe5IF/L0cfB+7BlV/V0IOhybabpZKjWFR+X4eYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7543
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzMCBTYWx0ZWRfX4gZxfWQJ8Lv4
 vbmk7KlMW+fs1ZcuHV23pqvDPexytch/E0IW6EzH2y6h8yQdyd/v5um5Q26zBafQJhEDNSYj9oo
 7ub7jT22G92jXeSQhWRl0BwhhaGcVaDJKVeknpgMjdRjG4sbluWJ1ljOkHTwvZINw4pMBid960E
 jS6N7SM7M5HMmZGAdG3uE4jafIEdYXzakcj7wz3PjHHN/hllPqw7UimYY9+bIiBpGsCKSiHihC8
 r5Z87lvSpl6oN1ubw0JECTEFUchyxUqvUMNyF6SElMI3AcQKFYToPijjanC2s9QWQtl/4A3xq44
 NosiulgHm2O3Ki/ygcCf3rdAUbAp9stTYOl+l234sPS1lgJ53+3p7V73Z4tDAtdqXVePOU6niu1
 Il++D2iE4XFqjENXyTf804lwz3ZVc2DpfRKbMFS8W+RdHSP0upQK7kA6euIeKt9gfpktmYWDxiy
 uiHGJ3v6VbdNJo1N0sw==
X-Proofpoint-GUID: SCskabcLn1nD8_CMufx1fQk9DzzPtT3W
X-Authority-Analysis: v=2.4 cv=du/rzVg4 c=1 sm=1 tr=0 ts=6a05c812 cx=c_pps
 a=os0lWWs/UWv4pnmIIs5naA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=Q4-j1AaZAAAA:8 a=a_U1oVfrAAAA:8 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8
 a=VUKyzqeMXwORfvg9rDsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -F6ApCwu18prt_BSD399Le2MhNKCKcn1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1011 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140130
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64EC1Ym34008014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 13:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237029


On 11-May-26 22:09, Randy MacLeod wrote:
> On 2026-05-07 18:48, Peter Marko via lists.openembedded.org wrote:
>> From: Peter Marko<peter.marko@siemens.com>
>>
>> $ git log --oneline ce1013a197eb4a3b8ff2b07e0672f4d0b976ce7c..e9517114=
acc77c0b8af9da6700107df16882b701
>> e9517114ac (origin/release/2.43/master) abilist.awk: Handle weak unver=
sioned defined symbols
>> 1634cc11a5 Linux: Only define OPEN_TREE_* macros in <sys/mount.h> if u=
ndefined (bug 33921)
>> d1d8d27164 include: isolate __O_CLOEXEC flag for sys/mount.h and fcntl=
.h
>> 8362e8ce10 Use pending character state in IBM1390, IBM1399 character s=
ets (CVE-2026-4046)
>>
>> Testing Results:
>> +--------------+--------+--------+------+
>> | Result       | Before | After  | Diff |
>> +--------------+--------+--------+------+
>> | PASS         | 6629   | 6632   | +3   |
>> | XPASS        | 4      | 4      |  0   |
>> | FAIL         | 105    | 103    | -2   |
>> | XFAIL        | 16     | 16     |  0   |
>> | UNSUPPORTED  | 559    | 559    |  0   |
>> +--------------+--------+--------+------+
>>
>> Changes in failed testcases:
>> malloc/tst-malloc-fork-deadlock-malloc-check  FAIL  PASS
>> malloc/tst-malloc-too-large-malloc-check      PASS  FAIL
>
> From patch review meeting, we're going to merge this but I have the=20
> following question:
>
> It's a little odd that his failed.
>
> Is the failure reproducible?
>
> Sundeep, can someone on the team reproduce these results
> and if the failure also happens for them explain and fix the issue?

I checked the earlier updates and with our local tests also we do=20
sometimes see inconsistent behavior with malloc tests. We will=20
further=C2=A0analyze these tests=C2=A0and update here (if needed will be =
handled=20
with a bugzilla issue).


Thanks,

Sundeep K.

>
> Thanks for the update Peter.
>
> ../Randy
>> nptl/tst-getpid3                              FAIL  PASS
>> stdlib/tst-qsort3                             FAIL  PASS
>>
>> Signed-off-by: Peter Marko<peter.marko@siemens.com>
>> ---
>>   meta/recipes-core/glibc/glibc-version.inc | 2 +-
>>   meta/recipes-core/glibc/glibc_2.43.bb     | 4 +++-
>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-=
core/glibc/glibc-version.inc
>> index 015e7943c5..af3db54cee 100644
>> --- a/meta/recipes-core/glibc/glibc-version.inc
>> +++ b/meta/recipes-core/glibc/glibc-version.inc
>> @@ -1,6 +1,6 @@
>>   SRCBRANCH ?=3D "release/2.43/master"
>>   PV =3D "2.43+git"
>> -SRCREV_glibc ?=3D "ce1013a197eb4a3b8ff2b07e0672f4d0b976ce7c"
>> +SRCREV_glibc ?=3D "e9517114acc77c0b8af9da6700107df16882b701"
>>   SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
>>  =20
>>   GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dht=
tps" diff --git a/meta/recipes-core/glibc/glibc_2.43.bb=20
>> b/meta/recipes-core/glibc/glibc_2.43.bb index ffc17eb072..b84c55ca17=20
>> 100644 --- a/meta/recipes-core/glibc/glibc_2.43.bb +++=20
>> b/meta/recipes-core/glibc/glibc_2.43.bb @@ -17,7 +17,9 @@ Allows for=20
>> ASLR bypass so can bypass some hardening, not an exploit in itself, m=20
>> easier access for another. 'ASLR bypass itself is not a vulnerability.=
'"
>>  =20
>>   CVE_STATUS_GROUPS +=3D "CVE_STATUS_STABLE_BACKPORTS"
>> -CVE_STATUS_STABLE_BACKPORTS =3D "CVE-2025-15281 CVE-2026-0861 CVE-202=
6-0915 CVE-2026-4437 CVE-2026-4438"
>> +CVE_STATUS_STABLE_BACKPORTS =3D "CVE-2025-15281 CVE-2026-0861 CVE-202=
6-0915 CVE-2026-4437 CVE-2026-4438 \
>> +    CVE-2026-4046 \
>> +"
>>   CVE_STATUS_STABLE_BACKPORTS[status] =3D "cpe-stable-backport: fix av=
ailable in used git hash"
>>  =20
>>   DEPENDS +=3D "gperf-native bison-native"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#236626):https://lists.openembedded.org/g/openembed=
ded-core/message/236626
>> Mute This Topic:https://lists.openembedded.org/mt/119206065/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --=20
> # Randy MacLeod
> # Wind River Linux

