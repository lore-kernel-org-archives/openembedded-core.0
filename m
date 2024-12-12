Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AB7E7717D
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 01:00:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9820.1733965227182497375
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 17:00:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2076af337b=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC1037N014701
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 17:00:26 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy1vydv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 17:00:26 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BC10P1U015112;
	Wed, 11 Dec 2024 17:00:25 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy1vydu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 17:00:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mu5TTsfBM2xY3F3B3x7wAeMrXfERUcB3teqDParZ7Abl0prsxJYInU53wIZMI4BsjwUjRH7Bcwz2ttLMaN4CJl5DY6NHPDjdwitd8KuZXi8AitwicSJaO/Lxxd3IMG328Gs2Owgyv98rN4kE3Gxal1igyhmxnooLmlhNQFxv6n5YpCRIMsD2ikpt2XsA1J7oVpGTT/1RfbA2EQkOu7y4Z1QNXboVQwbg/CreF6uhedkG7fs2LkbZdRPzcw6TCQLDQhvsbUpQFVBJ2d+X5+PGrWrOAl9lXQpC41EENmNYLSmQznRRj1igpTH9YDdZhBSpbNoGBxKZVbw0iUy7/zAT7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQizjHSa+sqJPPeng/a9QriwCTh2/OoCDc6RJThgmq8=;
 b=wvKizI2gZWZ4+hzKhOXiaSFAw7+vTdZXSRjnLq2LqMs/0jDsjh0bLtk9wRB/Y3CYSezdIWUGe1865WITaz0l6G4QhC/yBhmj8a6TAKTuFV/gu4rd1jnq3ji88PoA4FXSO6iJiwEr1ja9ndiLi3uWc4jMLTTbuoCI+q6luo+haCEifFDhbPqTm59PtCSR8K3eR4sPtYf3zcsfcFG8iMf6HvBTUbYTlNEo5QIEYq5ZenpM4Rs7yJUmuFCzcpOXNIIlupGP4w8n7Dhxo56KwRPPSVg8s3TNaN92cDJu6937dsVxAq9ABFiw6qtlgKUVroXXjfrPhaeO78zBoXYrRNt23A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA3PR11MB7653.namprd11.prod.outlook.com (2603:10b6:806:306::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Thu, 12 Dec
 2024 01:00:22 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%3]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 01:00:21 +0000
Content-Type: multipart/alternative;
 boundary="------------CNqkk8cIA9BVOPjAKj8JBHRF"
Message-ID: <7e40d598-c61b-4665-9de5-1b60fae69f71@windriver.com>
Date: Wed, 11 Dec 2024 20:00:18 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [AUH] valgrind: upgrading to 3.24.0 FAILED
From: Randy MacLeod <randy.macleod@windriver.com>
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
References: <0101019341233958-bc9f112c-fcff-4f31-9543-aaf8d865ccfe-000000@us-west-2.amazonses.com>
 <CANNYZj8w-pNwEMw4QkX9YR6mqLLBQmd_O5fhq+0P8V0rk2MWEg@mail.gmail.com>
 <5138cb18-0faa-4f87-b803-8d6ec253f5d8@windriver.com>
Content-Language: en-CA
In-Reply-To: <5138cb18-0faa-4f87-b803-8d6ec253f5d8@windriver.com>
X-ClientProxiedBy: SJ0PR13CA0199.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::24) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA3PR11MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e69c1e-59c7-4cbf-42ad-08dd1a485a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|4022899009|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eGpXSThDSW1kQnJrS0s3OWIydG1RUE1YbG5lWUlsSEV2RmZ3aE5TSmxtMDc5?=
 =?utf-8?B?TzFjbm5zNlV0RzdVRTF3Mjh6cjFoZzJOdnNBQWUrRU9BTUtrYjM1VDByWGdH?=
 =?utf-8?B?SDFGenMreFdLRnZrcVIxS3RXSlQ1Q1hDVklJZmttTkUySTQzRy9IT1BBbWlR?=
 =?utf-8?B?VFNDR0Q4OUgxekUrOWZUSVNYVEdkcy9lQ0J3U29GN0NVNWZ0TU9uVkppUTAx?=
 =?utf-8?B?cDlLT3JheGVNQW4rQ2xNbDJUZ05WZkpQV3Y5dml2U1ArOWYydmlnbmlpa2ZR?=
 =?utf-8?B?aklpTUJyNks2bldHUVNIS0JnaGF6N1hoYTRnNWZRWEtEdS9zNXB3MzV3VmtI?=
 =?utf-8?B?RFR2Zk9JWmhnSEFHcDMzS09HRm1FSWlHKzJLanlBbzZPYURtWExodnorK2ls?=
 =?utf-8?B?ZWhoN1V2dkY1SDNVcmw0S2Voa0Y1QXBBMlNlenBLRVQvT3RydWk1V3VoN01y?=
 =?utf-8?B?ODVLbWRRTU9lZ2c4Q3BoaDNwOXQxRmZFcSt0bTViUmRxZXdtQnQ5cTFLcUZ1?=
 =?utf-8?B?QThVWDFVM09MenhNeXN1UzJJNXUvNE8yMUdKSTRBenpJbjNMdk5QSTlaVU9l?=
 =?utf-8?B?Z0VBR0hXeXQ1OVE4SlNHOXNja1psRk9KeGdOeXU5NWNsUVBSREdxVjdYK0hE?=
 =?utf-8?B?UjJUV0N4RXRTSDBBMFBBZFc1cXdQaTJPS0RRYzhySFlCT0NreWlYV2M5TXdF?=
 =?utf-8?B?TnRVUTFXU2ExenhkY0tpN2MzY1drOG5zWGFJb2I4SUkxUG5YQjFRTC8yelB4?=
 =?utf-8?B?MHMrNmprazJNbU5La1liam1DMCsvMGFGUW5DMCtRVzAyZ1RqQm03WmlFQ3FV?=
 =?utf-8?B?V3hzeUFhS1pqbEZKSzZHT0JpWnNldTBmamREdjVhSkNyZXJxZThFRkZxYUxM?=
 =?utf-8?B?QnNkaEJ1b2VlTVhaWTlBeTgzS1BWa01VYmlsVXU5bmdsbFd3QzZncU5xc1BT?=
 =?utf-8?B?NFc2Mk92V3lkWGVJY25hWTA2Q3EwMVE3eFR6cmFBRjhFYlRCemJyc0MzZFRB?=
 =?utf-8?B?Q2dhTW8vY1JXc2NWZ3FFKzhMNGs5cGhTb2gxZHh5YXkyN1Q2eXM0UTQ4MlVG?=
 =?utf-8?B?bTloOUFtQTJWT3lJSHRiOFU2N1B5UXpCbVRKVlljM1M2Wmk1aVVkSkpOMTF2?=
 =?utf-8?B?by9oU2dpSkZKbGU5SHJSTG5ybFFBamRKRGU4Yk1BV0VJQjZVdkRpTUFKWWVP?=
 =?utf-8?B?T29lSkFySmR6aEQraE9GZGRocXBBcEtzWHRLZ1Z4WjhUaVJ5Uk5WM3lnL1U2?=
 =?utf-8?B?M0FBQmNkeDBpMFpYbitYaFBIeVFydjZIcDdFSlVIeVNtdm1Kc0JkUGo3VzMw?=
 =?utf-8?B?Y0JxVXA3aGk0MWkzU25GSnRBT0hUd0dQUHYwcVFQalJwMjMzOWlMVVlQZ0JF?=
 =?utf-8?B?UjR2OWowbzR0a215SGpxUiswSWU3RitsVkhRV3p3N0xQV2lkaXdaNUlUVkFK?=
 =?utf-8?B?d3dHZmhMeFMxWi9oeS9GTWxyZkV6cEc2TkQ4MCtnV2wrbkNqRHpWWGVRR2N0?=
 =?utf-8?B?L20xYUtoeWhqN0dRWmJhNGlySTVwdlc5WnNqUWxIWllRWDA3eHhaOGgwZ29P?=
 =?utf-8?B?Z1ZoVVhLbGtseGc2dldCM09BWUJybXAwVUc1TmxLa2JTcm9GU2xINnlEc3Zp?=
 =?utf-8?B?clIwNGh4NUFJMklMeUpDWjdaeDArSjd2SjlQbGtWK05uNnlmN3V6elNUcHBh?=
 =?utf-8?B?VFZmcTBvdVJrc0JSMUxJN3djL3FrRDFVK0p3SFhldWt4OXAxRTB4UFJhNWVZ?=
 =?utf-8?Q?KezolarhJMK9chWR08=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UU1VUWdVWS9jeE9kQ1VQZDBiS3daUVpzQW5ZZVd3a1hqYlNOTGcrd2puTm9w?=
 =?utf-8?B?ZG5GcDRibSt6TTNjeGxDTFNoTTlMeGhDU2VjdVBaWWIyWmRIZGgrMUQycGJ2?=
 =?utf-8?B?QVNlUVNqSEtaSGZJRlc4STdJYVN5enBYZEJTRTFiU1hvYTBWWWhsQ3g0cDRo?=
 =?utf-8?B?MUNNdU1iOHRhd1NNSUxOcEM0N3IyWU1nbjFFSHpwbjJMb2pUQitPVlA3MFIx?=
 =?utf-8?B?ZFduTVREM0lzU2cyVUhadUZLWlI0M0xrY0o4UjdjZWUxU05EOVhTZTVHeUNq?=
 =?utf-8?B?S3grZk5NNWlZWGl1YWppaXBhc2lDZ1RzV01UOUkwR0thUW43LzV6OGZKN01u?=
 =?utf-8?B?WTJQZWJMWllRVDZhVmZDQ1hpVFJRaGxjeUhQRG5BNzAwM05QNW1SYStuTlBq?=
 =?utf-8?B?OUhTQzdMQmFEL1JSNjlHVkhvczdJWStTVjkzbXV3TjNjd1prMVFONUcrdlJ5?=
 =?utf-8?B?QzdxUWlDZXgvSGZ1Lzh0anZEbHBIdjdERXdIVWJxTnd6Y2x5b3NTTmNDQit1?=
 =?utf-8?B?RHVNYzVad1lmbHV4Znl6Q1lwNFNtUmdBeVpNdTBlUmg0aDN2TWRMNGh3MzFs?=
 =?utf-8?B?bWhhNW1QQVgxMFFNZmZPNmo1NG1TcGVXVEhZS0RqLzdEQ09VOFhXU0VseDNY?=
 =?utf-8?B?SmIyM3VtT1RzZXdobithaUFpWE0zRi9zNXB2MDA4OGNMK1ZGRW94NWtkQ04z?=
 =?utf-8?B?dXgwMXlrVVJocVdjdVRtRVRGbk1GZzRmL3JROGdEdmJmajViQU9yc0E0ODU5?=
 =?utf-8?B?MnJsQm4zZDNNc1FhaGV3VDR4WlMvM3ZBSjk0Q0c4MDY0MU1DdmVZSm5wQjlH?=
 =?utf-8?B?ZWRheFVhczhXVWdUTmVEMWcvdFU4NFkrUTBleGcyMFlic1lzTG1KRUNSM0xa?=
 =?utf-8?B?SEpvT1NWQWQ3ZGFvRE05UVBneUFPbklQZG9tUTFFYTlXc0ZweDBxbldYOEFl?=
 =?utf-8?B?cSszcE1LS2p3SGxCQ3o2ek9TWXNVbGZqQXZkOWZQRjB1TDBhakhydm4zWFJU?=
 =?utf-8?B?OGhYemtTbDBPbDRJUGZORit2V2QwNDh6RFA0cXNLSFhGcDRWTHJrM01lQWJ1?=
 =?utf-8?B?THZIUVpIT1lzN25SaUpIVEtxbkd1K01FdWMwRHp6MGU4MGphTzY0d0o4YXVW?=
 =?utf-8?B?U3U3QkN4aXJnbjQ2SzhtY3dhNmRhbklXNkdUQlpoenJEcGVoMDlBOStoWE5q?=
 =?utf-8?B?NDM0Rzl6U1ZYelpzTHJ6ZC9KK1REem5NRzdjQkpPT3c3L1Jvc0ttTHBWTGJs?=
 =?utf-8?B?YzRELzdVOHF5MmlOMkNHS3BqRzdzWi9OSWRTdW1PK0hQeUNJL1VNOGtlcnBy?=
 =?utf-8?B?QkJ4dks5V2lZeVR2OWk5SXdNc0crL3g4TEhGOTIwOGsranZNVmFPVjBrV2sr?=
 =?utf-8?B?VTAreWUwQ21iVFZER3B5RUVudTNBQ3hMTXlwYXNJZnBvKytKT1MwVTNXMm52?=
 =?utf-8?B?TlZ2aUZLTHl6WkliMmFTcXdsanlxaU9Vd3RzMHVtK1NvYk1kWU1qc3d4V050?=
 =?utf-8?B?WHZ1VVJHVW4vUGpHUytwNS9yNHZYQ0ZMNG1sdXZBNWJGSVpNakp3ZVQ3WEtw?=
 =?utf-8?B?WWl3eDk3N3hkZnRnbUphZGhoTlpFcGcwTEIvbituVk9UUm0ydVJhTEdjdktk?=
 =?utf-8?B?L1dGR0hnV1ZlR09DWVBCaHZMNmZmTXZERFVPRUthc2prRkxEbWF2dkpDZTlT?=
 =?utf-8?B?WXhlL3dka29SWGg3Z1NraE5rYm1uUlhBUVRvT3R6WnlvV1RPMmpMK2xEd2tj?=
 =?utf-8?B?RER3am02Q2kxNzZ4VHliZlNhU2l3WE1xQ2RCckwxOTRMTThDNGhJWkt6UmtV?=
 =?utf-8?B?YmdSeDNsUUlieEZjbEZZVHBQNkoyY2g2elNQamdsejhqamxERG9zcUcrV1U1?=
 =?utf-8?B?ZjhBNnlaYmpSUmlIMm43aEZNTHlSNXhKVENYSVdnK3Y2dXpRaDNTcHhMUlRi?=
 =?utf-8?B?VDZ3dVZHTUdrN21hVlNKSVhRMk4xalprOWMxMWM5Q1lPSUdLNzBxUFNUc1FQ?=
 =?utf-8?B?c3NEYkQzVmtpTmo2RnF0dytTN2h3czFiN2FGVkpxZndzSWVRQmMzOExnNU9Q?=
 =?utf-8?B?S29BbHRCQVVTQ2pJTlExVnA2YlhPYkh3WG01R2FZQ1pQMmltOXY5Rmc1cDlQ?=
 =?utf-8?B?QVkzSzFwajdIclVZenZURkI4TExNYU1tdDJzazFOMXNLQVphNXRGSHhndGF0?=
 =?utf-8?B?dkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e69c1e-59c7-4cbf-42ad-08dd1a485a72
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 01:00:21.5921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ro55+DXIp2fOJTFXDfKEMC99gu31FJQdkMVYLVb+BOKIWKKQXSV3LIyu8fPpL+joKJQwN0atpUC9809WY3N22lYdxP3KV1z+hCZB6SxqXBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7653
X-Proofpoint-ORIG-GUID: 1lrdygK6dXdEWNj5_jZ3JOGvfgvYG0yy
X-Authority-Analysis: v=2.4 cv=eePHf6EH c=1 sm=1 tr=0 ts=675a35aa cx=c_pps a=Odf1NfffwWNqZHMsEJ1rEg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8
 a=CCpqsmhAAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=SjtOLzO4TsQDoMCXRPAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=Mv1m6qyoo-cPyz85JmsA:9 a=YOGOEFdrvfEML32c:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=ul9cdbp4aOFLsgKbc677:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: S2is4iZcuxEtdnYT5IpttowQChVP9Wrk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-11_11,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412120005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 01:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208620

--------------CNqkk8cIA9BVOPjAKj8JBHRF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BC1037N014701

On 2024-11-29 8:08 a.m., Randy MacLeod wrote:
> On 2024-11-29 5:57 a.m., Alexander Kanavin via lists.openembedded.org=20
> wrote:
>> Hello Randy,
>>
>> are you able to work on this upgrade? The rebase conflicts in
>> vg_regtest.in are significant and I don't quite understand how to
>> resolve them correctly.
>>
>> Alex
>
>
> Yes, hopefully I'll have an update next week.
>
> ../Randy
>
Alex and others,

I'm not sure if I'll finish this tomorrow and I'm taking a long weekend=20
starting Friday so here's a status update.


I picked up your work from:
https://git.yoctoproject.org/poky-contrib/commit/?h=3Dakanavin/package-ve=
rsion-updates-later&id=3D44015f5f5cb8e5611843efa4437bd1086dd97ddc

The=C2=A0vg_regtest script in valgrind that runs the tests has changed qu=
ite=20
a bit.
I'll adapt to that and perhaps stop skipping tests to see how the new AB=20
behaves.


I've experimented with dropping the part of run-ptest that avoided=20
problematic ptests
and for 3.24.0 we on qemux86-64:

=3D=3D 830 tests, 6 stderr failures, 12 stdout failures, 0 stderrB failur=
es,=20
0 stdoutB failures, 0 post failures =3D=3D

compared to 3.22:
 =C2=A0=C2=A0=C2=A0 =3D=3D=3D Test Summary =3D=3D=3D
 =C2=A0=C2=A0=C2=A0 TOTAL: 774
 =C2=A0=C2=A0=C2=A0 PASSED: 755
 =C2=A0=C2=A0=C2=A0 FAILED: 0
 =C2=A0=C2=A0=C2=A0 SKIPPED: 19

so one fewer failures/skips and 56 more tests being run.

Partial log below.

More to come but all for now,

../Randy


./run-ptest

...

track-fds-exec-children: valgrind=C2=A0=C2=A0 -q --track-fds=3Dyes=20
--trace-children=3Dyes ./track-fds-exec-children
unit_debuglog:=C2=A0=C2=A0 valgrind=C2=A0=C2=A0 -q ./unit_debuglog
use_after_close: valgrind=C2=A0=C2=A0 -q --track-fds=3Dyes ./use_after_cl=
ose
*** use_after_close failed (stderr) ***
vgprintf:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 valgrind=C2=A0=C2=A0 =
./vgprintf
vgprintf_nvalgrind: valgrind=C2=A0=C2=A0 ./vgprintf_nvalgrind
xml-track-fds:=C2=A0=C2=A0 valgrind=C2=A0=C2=A0 --track-fds=3Dyes --xml=3D=
yes=20
--xml-file=3D/dev/stderr ./../../tests/true
-- Finished tests in none/tests (in 1026 sec) --------------------------
-- Running=C2=A0 tests in exp-bbv/tests/amd64-linux ---------------------=
----
clone_test:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 valgrind=C2=A0=C2=A0 --interval=
-size=3D100000=20
--bb-out-file=3Dclone_test.out.bb --pc-out-file=3Dclone_test.out.pc=20
./clone_test
complex_rep:=C2=A0=C2=A0=C2=A0=C2=A0 valgrind=C2=A0=C2=A0 --interval-size=
=3D100000=20
--bb-out-file=3Dcomplex_rep.out.bb ./complex_rep
fldcw_check:=C2=A0=C2=A0=C2=A0=C2=A0 valgrind=C2=A0=C2=A0 --interval-size=
=3D10000=20
--bb-out-file=3Dfldcw_check.out.bb ./fldcw_check
ll:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 valgrind=C2=A0=C2=A0 --interval-size=3D1000 --bb-out-file=3Dll.out=
.bb=20
./ll
million:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 valgrind=C2=A0=C2=
=A0 --interval-size=3D100000=20
--bb-out-file=3Dmillion.out.bb ./million
rep_prefix:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 valgrind=C2=A0=C2=A0 --interval=
-size=3D100000=20
--bb-out-file=3Drep_prefix.out.bb ./rep_prefix
-- Finished tests in exp-bbv/tests/amd64-linux (in 5 sec) --------------

=3D=3D 830 tests, 6 stderr failures, 12 stdout failures, 0 stderrB failur=
es,=20
0 stdoutB failures, 0 post failures =3D=3D
memcheck/tests/bug445235_ada_demangle=C2=A0=C2=A0=C2=A0 (stderr)
memcheck/tests/wrap1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stdou=
t)
memcheck/tests/wrap2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stdou=
t)
memcheck/tests/wrap3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stdou=
t)
memcheck/tests/wrap4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stdou=
t)
memcheck/tests/wrap5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stdou=
t)
memcheck/tests/wrap6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stdou=
t)
memcheck/tests/wrap7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stdou=
t)
memcheck/tests/wrap8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stdou=
t)
cachegrind/tests/wrap5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stdout)
helgrind/tests/hg05_race2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stderr)
helgrind/tests/tc09_bad_unlock=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (stderr)
drd/tests/hg05_race2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stder=
r)
drd/tests/tc09_bad_unlock=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stderr)
none/tests/amd64/avx-vmovq=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stdout)
none/tests/amd64/avx_estimate_insn=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (s=
tdout)
none/tests/amd64/x87trigOOR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stdout)
none/tests/use_after_close=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (stderr)

...checking makefile consistency
...checking header files and include directives
Failed test details...
=3D=3D=3D Test Summary =3D=3D=3D
TOTAL: 0
PASSED: 0
FAILED: 0
SKIPPED: 0


>
>> On Mon, 18 Nov 2024 at 22:18, Auto Upgrade Helper via
>> lists.openembedded.org<auh=3Dyoctoproject.org@lists.openembedded.org>
>> wrote:
>>> Hello,
>>>
>>> this email is a notification from the Auto Upgrade Helper
>>> that the automatic attempt to upgrade the recipe(s) *valgrind* to *3.=
24.0* has Failed (devtool error).
>>>
>>> Detailed error information:
>>>
>>> Running 'devtool upgrade' for recipe valgrind failed.
>>> NOTE: Reconnecting to bitbake server...
>>> Loading cache...done.
>>> Loaded 1880 entries from dependency cache.
>>> NOTE: Resolving any missing task queue dependencies
>>>
>>> Build Configuration:
>>> BB_VERSION           =3D "2.9.1"
>>> BUILD_SYS            =3D "x86_64-linux"
>>> NATIVELSBSTRING      =3D "universal"
>>> TARGET_SYS           =3D "x86_64-poky-linux"
>>> MACHINE              =3D "qemux86-64"
>>> DISTRO               =3D "poky"
>>> DISTRO_VERSION       =3D "5.1"
>>> TUNE_FEATURES        =3D "m64 core2"
>>> TARGET_FPU           =3D ""
>>> meta
>>> meta-poky
>>> meta-yocto-bsp
>>> workspace            =3D "tmp-auh-upgrades:d91c453382ace1e86d0f29f82f=
8d66e5dfc2e69a"
>>>
>>> Initialising tasks...NOTE: The /proc/pressure files can't be read. Co=
ntinuing build without monitoring pressure
>>> Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100=
% match, 100% complete)
>>> done.
>>> NOTE: Executing Tasks
>>> NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to =
be rerun and all succeeded.
>>> NOTE: Writing buildhistory
>>> NOTE: Writing buildhistory took: 13 seconds
>>> Loading cache...done.
>>> Loaded 0 entries from dependency cache.
>>> Parsing recipes...done.
>>> Parsing of 922 .bb files complete (0 cached, 922 parsed). 1881 target=
s, 41 skipped, 0 masked, 0 errors.
>>> NOTE: Resolving any missing task queue dependencies
>>>
>>> Build Configuration:
>>> BB_VERSION           =3D "2.9.1"
>>> BUILD_SYS            =3D "x86_64-linux"
>>> NATIVELSBSTRING      =3D "universal"
>>> TARGET_SYS           =3D "x86_64-poky-linux"
>>> MACHINE              =3D "qemux86-64"
>>> DISTRO               =3D "poky"
>>> DISTRO_VERSION       =3D "5.1"
>>> TUNE_FEATURES        =3D "m64 core2"
>>> TARGET_FPU           =3D ""
>>> meta
>>> meta-poky
>>> meta-yocto-bsp
>>> workspace            =3D "tmp-auh-upgrades:d91c453382ace1e86d0f29f82f=
8d66e5dfc2e69a"
>>>
>>> Initialising tasks...NOTE: The /proc/pressure files can't be read. Co=
ntinuing build without monitoring pressure
>>> Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% mat=
ch, 0% complete)
>>> done.
>>> NOTE: Executing Tasks
>>> WARNING: tmp-recipetool-x6d4ggx6: the directory /srv/pokybuild/yocto-=
worker/auh/build/build/tmp/work/recipetool-v2z_cd3c/emptysrc (/srv/pokybu=
ild/yocto-worker/auh/build/build/tmp/work/recipetool-v2z_cd3c/emptysrc) p=
ointed to by the S variable doesn't exist - please set S within the recip=
e to point to where the source has been unpacked to
>>> NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be r=
erun and all succeeded.
>>> NOTE: Writing buildhistory
>>> NOTE: Writing buildhistory took: 12 seconds
>>> DEBUG 5 [Errno 25] Inappropriate ioctl for device
>>> Adding changed files:   0% |                                   | ETA:=
  --:--:--
>>> Adding changed files:   0% |                                   | ETA:=
  --:--:--
>>> Adding changed files:  23% |########                            | ETA=
:  0:00:07
>>> Adding changed files:  47% |#################                   | ETA=
:  0:00:05
>>> Adding changed files:  71% |#########################           | ETA=
:  0:00:02
>>> Adding changed files:  95% |##################################  | ETA=
:  0:00:00
>>> Adding changed files: 100% |####################################| Tim=
e: 0:00:06
>>> INFO: Extracting current version source...
>>> INFO: Extracting upgraded version source...
>>> INFO: Fetchinghttps://sourceware.org/pub/valgrind/valgrind-3.24.0.tar=
.bz2...
>>> INFO: Rebasing devtool onto cafaff76aa66d7f05d5e9be09f9a9edd39833b0e
>>> WARNING: Command 'git rebase cafaff76aa66d7f05d5e9be09f9a9edd39833b0e=
' failed:
>>> Auto-merging tests/vg_regtest.in
>>> CONFLICT (content): Merge conflict in tests/vg_regtest.in
>>>
>>> You will need to resolve conflicts in order to complete the upgrade.
>>> INFO: Using source tree as build directory since recipe inherits auto=
tools-brokensep
>>> INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/bu=
ild/build/workspace/sources/valgrind
>>> INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/works=
pace/recipes/valgrind/valgrind_3.24.0.bb
>>>
>>>
>>>
>>> Please review the attached files for further information and build/up=
date failures.
>>> Any problem please file a bug athttps://bugzilla.yoctoproject.org/ent=
er_bug.cgi?product=3DAutomated%20Update%20Handler
>>>
>>> Regards,
>>> The Upgrade Helper
>>>
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#208012):https://lists.openembedded.org/g/openembe=
dded-core/message/208012
>>> Mute This Topic:https://lists.openembedded.org/mt/109653242/3616765
>>> Group Owner:openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub =
[randy.macleod@windriver.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>
> --=20
> # Randy MacLeod
> # Wind River Linux


--=20
# Randy MacLeod
# Wind River Linux

--------------CNqkk8cIA9BVOPjAKj8JBHRF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-11-29 8:08 a.m., Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:5138cb18-0faa-4f87-b803-8d6ec253f5d8@windriver.com">
      
      <div class="moz-cite-prefix">On 2024-11-29 5:57 a.m., Alexander
        Kanavin via lists.openembedded.org wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:CANNYZj8w-pNwEMw4QkX9YR6mqLLBQmd_O5fhq+0P8V0rk2MWEg@mail.gmail.com">
        <pre wrap="" class="moz-quote-pre">Hello Randy,

are you able to work on this upgrade? The rebase conflicts in
vg_regtest.in are significant and I don't quite understand how to
resolve them correctly.

Alex</pre>
      </blockquote>
      <p><br>
      </p>
      <p>Yes, hopefully I'll have an update next week.</p>
      <p>../Randy</p>
    </blockquote>
    <p>Alex and others, <br>
    </p>
    <p>I'm not sure if I'll finish this tomorrow and I'm taking a long
      weekend starting Friday so here's a status update.</p>
    <p></p>
    <p><br>
    </p>
    <p>I picked up your work from:<br>
      &nbsp;&nbsp;
<a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/poky-contrib/commit/?h=akanavin/package-version-updates-later&amp;id=44015f5f5cb8e5611843efa4437bd1086dd97ddc">https://git.yoctoproject.org/poky-contrib/commit/?h=akanavin/package-version-updates-later&amp;id=44015f5f5cb8e5611843efa4437bd1086dd97ddc</a><br>
    </p>
    <p>The&nbsp;vg_regtest script in valgrind that runs the tests has changed
      quite a bit. <br>
      I'll adapt to that and perhaps stop skipping tests to see how the
      new AB behaves.</p>
    <p><br>
    </p>
    I've experimented with dropping the part of run-ptest that avoided
    problematic ptests<br>
    and for 3.24.0 we on qemux86-64:<br>
    <p>== 830 tests, 6 stderr failures, 12 stdout failures, 0 stderrB
      failures, 0 stdoutB failures, 0 post failures ==</p>
    <p>compared to 3.22:<br>
      &nbsp;&nbsp;&nbsp; === Test Summary ===<br>
      &nbsp;&nbsp;&nbsp; TOTAL: 774<br>
      &nbsp;&nbsp;&nbsp; PASSED: 755<br>
      &nbsp;&nbsp;&nbsp; FAILED: 0<br>
      &nbsp;&nbsp;&nbsp; SKIPPED: 19</p>
    <p>so one fewer failures/skips and 56 more tests being run.<br>
    </p>
    <p>Partial log below.</p>
    <p>More to come but all for now,</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p>./run-ptest<br>
    </p>
    <p>...<br>
    </p>
    <p>track-fds-exec-children: valgrind&nbsp;&nbsp; -q --track-fds=yes
      --trace-children=yes ./track-fds-exec-children <br>
      unit_debuglog:&nbsp;&nbsp; valgrind&nbsp;&nbsp; -q ./unit_debuglog <br>
      use_after_close: valgrind&nbsp;&nbsp; -q --track-fds=yes ./use_after_close <br>
      *** use_after_close failed (stderr) ***<br>
      vgprintf:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valgrind&nbsp;&nbsp; ./vgprintf <br>
      vgprintf_nvalgrind: valgrind&nbsp;&nbsp; ./vgprintf_nvalgrind <br>
      xml-track-fds:&nbsp;&nbsp; valgrind&nbsp;&nbsp; --track-fds=yes --xml=yes
      --xml-file=/dev/stderr ./../../tests/true <br>
      -- Finished tests in none/tests (in 1026 sec)
      --------------------------<br>
      -- Running&nbsp; tests in exp-bbv/tests/amd64-linux
      -------------------------<br>
      clone_test:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valgrind&nbsp;&nbsp; --interval-size=100000
      --bb-out-file=clone_test.out.bb --pc-out-file=clone_test.out.pc
      ./clone_test <br>
      complex_rep:&nbsp;&nbsp;&nbsp;&nbsp; valgrind&nbsp;&nbsp; --interval-size=100000
      --bb-out-file=complex_rep.out.bb ./complex_rep <br>
      fldcw_check:&nbsp;&nbsp;&nbsp;&nbsp; valgrind&nbsp;&nbsp; --interval-size=10000
      --bb-out-file=fldcw_check.out.bb ./fldcw_check <br>
      ll:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valgrind&nbsp;&nbsp; --interval-size=1000
      --bb-out-file=ll.out.bb ./ll <br>
      million:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valgrind&nbsp;&nbsp; --interval-size=100000
      --bb-out-file=million.out.bb ./million &nbsp;<br>
      rep_prefix:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; valgrind&nbsp;&nbsp; --interval-size=100000
      --bb-out-file=rep_prefix.out.bb ./rep_prefix <br>
      -- Finished tests in exp-bbv/tests/amd64-linux (in 5 sec)
      --------------<br>
      <br>
      == 830 tests, 6 stderr failures, 12 stdout failures, 0 stderrB
      failures, 0 stdoutB failures, 0 post failures ==<br>
      memcheck/tests/bug445235_ada_demangle&nbsp;&nbsp;&nbsp; (stderr)<br>
      memcheck/tests/wrap1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (stdout)<br>
      memcheck/tests/wrap2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (stdout)<br>
      memcheck/tests/wrap3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (stdout)<br>
      memcheck/tests/wrap4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (stdout)<br>
      memcheck/tests/wrap5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (stdout)<br>
      memcheck/tests/wrap6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (stdout)<br>
      memcheck/tests/wrap7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (stdout)<br>
      memcheck/tests/wrap8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (stdout)<br>
      cachegrind/tests/wrap5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (stdout)<br>
      helgrind/tests/hg05_race2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (stderr)<br>
      helgrind/tests/tc09_bad_unlock&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (stderr)<br>
      drd/tests/hg05_race2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (stderr)<br>
      drd/tests/tc09_bad_unlock&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (stderr)<br>
      none/tests/amd64/avx-vmovq&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (stdout)<br>
      none/tests/amd64/avx_estimate_insn&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (stdout)<br>
      none/tests/amd64/x87trigOOR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (stdout)<br>
      none/tests/use_after_close&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (stderr)<br>
      <br>
      ...checking makefile consistency<br>
      ...checking header files and include directives<br>
      Failed test details...<br>
      === Test Summary ===<br>
      TOTAL: 0<br>
      PASSED: 0<br>
      FAILED: 0<br>
      SKIPPED: 0<br>
      <br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:5138cb18-0faa-4f87-b803-8d6ec253f5d8@windriver.com">
      <p><br>
      </p>
      <blockquote type="cite" cite="mid:CANNYZj8w-pNwEMw4QkX9YR6mqLLBQmd_O5fhq+0P8V0rk2MWEg@mail.gmail.com">
        <pre wrap="" class="moz-quote-pre">On Mon, 18 Nov 2024 at 22:18, Auto Upgrade Helper via
lists.openembedded.org <a class="moz-txt-link-rfc2396E" href="mailto:auh=yoctoproject.org@lists.openembedded.org">&lt;auh=yoctoproject.org@lists.openembedded.org&gt;</a>
wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *valgrind* to *3.24.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe valgrind failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1880 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = &quot;2.9.1&quot;
BUILD_SYS            = &quot;x86_64-linux&quot;
NATIVELSBSTRING      = &quot;universal&quot;
TARGET_SYS           = &quot;x86_64-poky-linux&quot;
MACHINE              = &quot;qemux86-64&quot;
DISTRO               = &quot;poky&quot;
DISTRO_VERSION       = &quot;5.1&quot;
TUNE_FEATURES        = &quot;m64 core2&quot;
TARGET_FPU           = &quot;&quot;
meta
meta-poky
meta-yocto-bsp
workspace            = &quot;tmp-auh-upgrades:d91c453382ace1e86d0f29f82f8d66e5dfc2e69a&quot;

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 13 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1881 targets, 41 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = &quot;2.9.1&quot;
BUILD_SYS            = &quot;x86_64-linux&quot;
NATIVELSBSTRING      = &quot;universal&quot;
TARGET_SYS           = &quot;x86_64-poky-linux&quot;
MACHINE              = &quot;qemux86-64&quot;
DISTRO               = &quot;poky&quot;
DISTRO_VERSION       = &quot;5.1&quot;
TUNE_FEATURES        = &quot;m64 core2&quot;
TARGET_FPU           = &quot;&quot;
meta
meta-poky
meta-yocto-bsp
workspace            = &quot;tmp-auh-upgrades:d91c453382ace1e86d0f29f82f8d66e5dfc2e69a&quot;

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-x6d4ggx6: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-v2z_cd3c/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-v2z_cd3c/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  23% |########                            | ETA:  0:00:07
Adding changed files:  47% |#################                   | ETA:  0:00:05
Adding changed files:  71% |#########################           | ETA:  0:00:02
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:06
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching <a class="moz-txt-link-freetext" href="https://sourceware.org/pub/valgrind/valgrind-3.24.0.tar.bz2">https://sourceware.org/pub/valgrind/valgrind-3.24.0.tar.bz2</a>...
INFO: Rebasing devtool onto cafaff76aa66d7f05d5e9be09f9a9edd39833b0e
WARNING: Command 'git rebase cafaff76aa66d7f05d5e9be09f9a9edd39833b0e' failed:
Auto-merging tests/vg_regtest.in
CONFLICT (content): Merge conflict in tests/vg_regtest.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/valgrind
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/valgrind/valgrind_3.24.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler</a>

Regards,
The Upgrade Helper



</pre>
          <br>
          <fieldset class="moz-mime-attachment-header"></fieldset>
          <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#208012): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/208012">https://lists.openembedded.org/g/openembedded-core/message/208012</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/109653242/3616765">https://lists.openembedded.org/mt/109653242/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
        </blockquote>
      </blockquote>
      <p><br>
      </p>
      <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------CNqkk8cIA9BVOPjAKj8JBHRF--

