Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F121FD8FCB
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 15:32:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72592.1772119913179402102
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 07:31:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Ku9OkEVI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65172f1559=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q8ITMF1816971
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 15:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=kxJN+3MjVsxF7OA5MHrc1j
	N6nmZ8bxytITKxmM6mHlA=; b=Ku9OkEVIXfWIcXFdIVpfOOvwnrq/3KEdD4fX6G
	JHHrNyXqjiCnYPTfOtMvBrPhcr7IsFzir/mM8zEL08QcT10LdRC30DCRF5nciY6w
	GzFXeyrMpbIBUcTOxDlJZ/7A12BXCtArsakL1T89WmvSMAxBDV5qXb2Ns5MAHEm/
	+hC0tYGUk7AIpXVL4wGQ/7/q7PKfk8W5COor6rykAOz972I/WnWkdY5SkE0u6MFg
	QS3T82M6yaYx1ppzoYbTX+0yVf4gcFzecurCa9JcJflMuxn0ActFEEw35vvoHsKc
	/qMmmHYPdZcIqhCRg+KFmyboHAb9AO9k3O/LyWsxGxcnei4g==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010033.outbound.protection.outlook.com [52.101.56.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdvdrnbd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 15:31:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4xTg8OYNwUuj4cEubpAHtwN8A0MFnTZq8i4PQMX8zUin7NqsSpHMyEmUfgSp/c56DkCbetptUqFbFqD/iuLEm2cO6yeZNK5pw6fjqYStMxf5cIlYM0LBgXzrrj6KklhQjG+IpxdFJ/dYn2/ESYzwE2QDGRbr6OEP1jl73InQTIL8lNNTMErgczUeKsko6QAScRR7DNGbGeaJWbcf6AnRKevpIlQDxfrz/RaGjpaE+iU3Z2Z51b/m79oFwbqQ2tZEonrrE/w9nCTvBxkaM3wrv58C6ZxxH+T0ssqbfWyRitBJATS2JeYXwydpnuy1rCa+LWJQ7DjI78V1T29UXhHIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxJN+3MjVsxF7OA5MHrc1jN6nmZ8bxytITKxmM6mHlA=;
 b=NdhVkY9ygFFhFrzv8O1aHc1kW19TMK75WA3eeOi8D8thKSgog+LZsK/KXHHAFyNE2E6Q/l3JwW6jIed0Eaxjrvpbi5wSmJhcvDpQIOmez+dphiGvKonE+2YaoL1cbbyf+QIhQltix+YujM7UAxpSoqoZNXyH1ekLSKN5Myec5EQvs4nB+PUiOcLcK2huZKtj8Iegk8z45+brY0NxIRrAow6s54r5PiHcL2I3evnQsGHeRv8+wU1xAbbrkwj1oIL9GOqMeAOEpIsISOAOkU00FTPhm32vkdMdZMYJUwnuNMzN+ojpfSmqwgeqN7YP6JnmhV5qod5oTDRlbTcSyiDP+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS7PR11MB8854.namprd11.prod.outlook.com (2603:10b6:8:256::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 15:31:47 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 15:31:47 +0000
Content-Type: multipart/alternative;
 boundary="------------Z0ns9g5uOQLvJQGJSCaJiM6J"
Message-ID: <f75b8d9a-3f91-4f09-ac72-1511940ef54d@windriver.com>
Date: Thu, 26 Feb 2026 10:31:44 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Oe-selftest for Clang, LLVM, LLD
To: Deepesh.Varatharajan@windriver.com,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260220060252.77248-1-Deepesh.Varatharajan@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260220060252.77248-1-Deepesh.Varatharajan@windriver.com>
X-ClientProxiedBy: BY5PR20CA0014.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::27) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS7PR11MB8854:EE_
X-MS-Office365-Filtering-Correlation-Id: 139bc884-7afc-4e28-eb41-08de754c2758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	ZE+MY3UmGocGPDIbHdl9vgiyI9n8GE1IyxfeZBWh4tBhz45dPUszQYIygFeb+KSyAtbTF4HEt8fhEB/sgaYzKN0duc2Wawn9zqU882LqbjX9r1J588EMuyWA+0pFuswNSxe98RUpEEldzXrc/RRBCQfTh/IakpLsMsHZsM6Dnv3K1q3SYLe+Yrltj2x+qXbuJN8EPjWEVuTXaWjocGgXg7WRs9PSC49JqUMl2V6nFUMVQzpgicKqL1Rdxc0TWZBYDzxEU4y3oBYc2uwMyfoOpJl1hnWu6DWBtJ+u1k5WdLi8O76qAHPJ09R+aCqDug7fGiwTPpb7ETL/PI5+9PYtEVB8FqvZ8esg33Hf2veNSKN0GyhcYmyONq5+XOb4AeV+qfpMomJziUQ/xW2jwHxkYHr4vf/lUQ9mXIx8xNua3kiOXfu8xlMEmgf1K5mGLbb80e4EAa5fJrH5Ddpk2xrc4SqE51HA03/Mvt471s8mIkWiMpC/TDhGWVG0DYpZJvakg0EwyCkBYX1YOm34VrvOEKeFtXlmM+SBrcEmHGCOQCFts8iw+K07kDVmbeGycVC/vDjD7KMi288yDbVkEqOQOAqsWvdygkfIgSf5Xm/V3RR6xzbcVthj23j+l9iiXmz2NQcTetOu/lZyo+QuZuyi/NlGeO5H9x5/ngMwGTGxXzFBo46bEQc7X/maHuCURcvQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QmlhWG05cEhiS0hSODAzQWk1RXArQk5TSngwWFVtaDhwbkY5OW9sSVAzOW1R?=
 =?utf-8?B?Sno0dnFVM2hUb1doakxTSVRORk8wQXE4UWl6ZCtJUzJZY0MwbHZHdytSbndk?=
 =?utf-8?B?dDdjSE1aZDB6bzFZZDZ3alZKOWUxRkVzNVJXbm1oS3RFSmtLVUhxbE1PWURT?=
 =?utf-8?B?YjkrWVU5VTRvWUhpcEM2aVJ2Ny8vWVB2OWFURHl0cnNzeU1VczV4bEFNTmNN?=
 =?utf-8?B?K2FybXhFdURGQVlhOHBKa1p6MlJNb0trM0kwcCtsSno1NUJOdzVtMzYrcHl5?=
 =?utf-8?B?aVN2M0NDNkFxUTU2ME9XbFZod1hCTDhVRnFvOGlSRlRMYnBKeHhKMzA5alB2?=
 =?utf-8?B?TW9MR05leXdEd0ZKMzFBdnUwQlQ0U0xXZ3VxUUpUSkVhQXRCMzZvcUZkMlg3?=
 =?utf-8?B?UkV3NzNBR2ZKcHEzNkZieXI0aDdRR0xkVGc5Umk1SW9QV1JVenVYWTBoellQ?=
 =?utf-8?B?SVZ1Ync5YmU4UmxObDNPTE9XcENrWVBYZW9vVkdiZkd5MC83TktaY01wYXZs?=
 =?utf-8?B?U2gwdFd1N1BGQi80QTM5VHBUMFA4cFZJSS9TUVZ4UHpmVmtMT0ZzTjQvQzZV?=
 =?utf-8?B?Sk1Zcm1yUEk1THFIU3h3T3lhNFhtRUowMGttdGFiRW9INGlTZVhCSmN2b0Nx?=
 =?utf-8?B?MmtMaTJoRjlMTnRPUmF4UWsySDN5WS9qeFJwSjh2Z1pkZDJUMzUzaE9aUVAy?=
 =?utf-8?B?cEhaRE1DSzJYdytlNHNNbGJFR1VJMUpyaG1WeDBtZk1rajZmRS9wTGcyMXFC?=
 =?utf-8?B?cE9UeFVuY0xlRDd2WnptRFR5S1lOTC8zZ2k1U1V2VjBCVHZRNld6OWhyS0d2?=
 =?utf-8?B?L3k0a3JRdUZrcGpxS2Nmckh3ZkszYkdzUmtJRURTQVNOSElCTjJwQWNNS0Fk?=
 =?utf-8?B?bVdpdUNtcTlyMkJZRU0vZlRXUEdrZUJXbGUwYTNkeXFaK3lzamZuUGhBWll1?=
 =?utf-8?B?bjlJaS9yQW9oRkN4NDMvdTBRUzFxY2liZXN1UTFDV2gwOHZMUGhYc05jQm11?=
 =?utf-8?B?eUJWbG01QzltTWFUQmtyaUhwTmNPbFhnMDJ1MVZVZGx5bmpNU05EdkZ5R3dL?=
 =?utf-8?B?SE0zbDY5dXc3NW1IbmZaMlFyZG5wSkJrekREK1lSenY0cXFGNytwSkJoSndv?=
 =?utf-8?B?L1paNGJURzhjMTZpaUt3WGxXMVRPSlRSRGpKcXgrQ1JtMXdTL1pZVFVwMFdH?=
 =?utf-8?B?RzFrWEl2dS8vUFJ5TmFkMmVJVkxHK3JVSlFWSFRYR3FLSWVzbnNndXN3bnFs?=
 =?utf-8?B?WEsyV3RvaEhEZTc4U3A0VjdLeG15VW1aN3B4NDdFM0lOc1RUcC9SQWVuNTBN?=
 =?utf-8?B?S3EwcVpUc1JrVWxTeldzMGdJRzNDOXRmeVd0ellmSlUzWklVRkxHWndQS3hL?=
 =?utf-8?B?UkhHSzJDV0FDRldlSmhzYzdiNkN2cDZ0UzRCNnVYNnBDOHFwMWo0MklFeWF2?=
 =?utf-8?B?V05Dd3RWWHhud2l5K0JNK1JlME90T3ZHZEdWV21odVh2Mlg4NFR4QmdBR0cr?=
 =?utf-8?B?WVdRb0RhYlBqeDhpUFQxdXpZc3A2eXZxUCszdTFEN0dydXV2bWpNZ3ZoTjJr?=
 =?utf-8?B?MGV0REdSUGIrZmhLOHlwY2dnQzI2U3htc0tGNmo2eTR2SGs5QTc0TjBycmZl?=
 =?utf-8?B?WXQ5TnAzVzZ0WmhtU3poaUpRRFVtNW1PWFRNeEhjWXJuYkR6MHZRZVFsSE9n?=
 =?utf-8?B?WlR6SXJhS2FNVDViNXZ0cU9kV0w4bGE1NFZkSEdIVnA1VEY2NVVQTElKNE5x?=
 =?utf-8?B?SVlocUI4T3AybFEyQkloSWRKNmdPUFVtRVRwOHJqN2FlZlhIdXMyOTlpNm1n?=
 =?utf-8?B?N3dZczdIZThvNHF6THVQbEZDNDB3UzkwcTV6bGFqSnVqR2pFOWk0WW0vMG84?=
 =?utf-8?B?Q2R6UXAwTmVPUm85bUZzUEwrR1QrSEsrNG5URURTRnR3dS9jeUxyeXNoc2Vi?=
 =?utf-8?B?ZmY1cGV0VndkMGZTTmxQZ1QzblpDenFNVTBLekQ1ZnQzUDREdDZEN21Hcll5?=
 =?utf-8?B?RGJ0MlRJMUZEUjRzZ1BXTU5CNnN2N2R0RTFYa1pQN1dVYTkzSFNKZTlBc0Rq?=
 =?utf-8?B?YWp1WU5keklSV1p0SmdXRUkxMTlZUlZhOUlnSFVxcG5xc1owa2dDY1MwRVBv?=
 =?utf-8?B?NVhYTXB0NzA4VE9GRlFhVW9IN2I3THk3VFdSMEhRN3dreWhKai9EdGZpRkg2?=
 =?utf-8?B?dWhIb01VTnZsTjkwaFRobjVkY1hFUjI1Q29LQkw1YzhaT0hnVndzMzd5eW52?=
 =?utf-8?B?TGxzVlBMdE8vUmNhRmowVVh2UGwyU3BVQnd0RmdBcEdQQTc0WWtrd01sVm9S?=
 =?utf-8?B?ZDlibCtuZmRialBOcTRSQkpRUjVUd0tPYk04Q0F5TW1PZWU5UkFjQlVSaVVy?=
 =?utf-8?Q?mkP/iCr/Dq0X/g84=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 139bc884-7afc-4e28-eb41-08de754c2758
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 15:31:47.3837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BME5TfnY4WOrZVtjVbMua4LNgTgwzLlnzniMsKH4lTaE5efZdXyXdWnT6etSPyqFr5bBJMBN8e7SbbFkrzqBf8F6jyeo3jefljf+6rxihHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8854
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE0MCBTYWx0ZWRfX/TIyjPAha7ef
 Rhxdv+PsZ9Oz5pAzWbtmO5sn7i0d8u5Onq/KGMUpCFl8xhkCMr9DRNfEhy82vegDb/nEE8LRUoG
 jOoDlfLfylvFWLXHZ6/wos9Q+zqPnz1RyJSwZ+d0BCfWp2MG/6kzPOQ8vBK46pZklGgGHH3UpHd
 vkmtBsToSZZhFKllg6qrM5yngUTDoT+boey3DSezUm64b4/UGsHRAgsFyaALXsRZEJMBgtA+sLY
 rTh2j4zi7K0JLdg02bi2ZGR2SJcFDNTASxWzY1r5oYDXNt1dcXtO/Z7PjgshcBB9AS6qyFVDP32
 Nrceue8J1DfUtNRJK3ckDTz9z2ndWGlM3KxUMoWONwKF1BuKga4ApcRD969h6SC+xaoo8zOI6Jh
 s/geQ1Wi0bcXtB2U19bsJPxB6YkP1EgQfsEJbYJLv8jFIw3b0iOl2v2Wslq0avK6O1WyDm06dfQ
 1CKbAbY9eRxNnuwvnBQ==
X-Proofpoint-GUID: kPBu_0oFzrGmlFSw15jY_-VcU3w7KfxK
X-Authority-Analysis: v=2.4 cv=UKzQ3Sfy c=1 sm=1 tr=0 ts=69a06767 cx=c_pps
 a=3IxC/HLiWPPRhiYFHlIRMw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=kKYPXb5LO6ZK-_xD1mwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mb5MGwdmeah9k_E9aZEA:9 a=aVpjAeYd-ZaBf5yp:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: kPBu_0oFzrGmlFSw15jY_-VcU3w7KfxK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 15:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232035

--------------Z0ns9g5uOQLvJQGJSCaJiM6J
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61Q8ITMF1816971

On 2026-02-20 1:02 a.m., Deepesh.Varatharajan@windriver.com wrote:
> From: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
>
> This patch series introduces a test framework to run selftests for
> target builds of Clang, LLVM, and LLD.
>
> Summary of changes:
> -Patch 1: Disable clang-tools-extra tests, as Clang's CMake cannot
>            detect the llvm-bcanalyzer target.
> -Patch 2: Enabled the necessary CMake flags for clang, llvm & lld tests
> -Patch 3: Selftest script for Clang, LLVM, and LLD including exclude li=
st
> -Patch 4: Fix rust build failure by replacing target llvm-config with n=
ative
>
> Testing:
> 1. The test suite has been successfully validated on x86-64, arm64, ris=
cv64
> and arm32 for all Clang, LLD & LLVM components.
> 2. Clang and LLD tests passed successfully on x86. LLVM tests are skipp=
ed
> on x86 since it's broken. A follow-up bug will be filed and addressed.
> 3. Clang, LLVM & LLD all together ~80K tests are there and we currently
> ~250 tests to exclude list which are failing (0.32%).
>
> Impact on build time:
> These builds were executed in a controlled environment without poky-sst=
ate
> enabled.
>
> Default(without changes):
> |  Target   | Run 1      | Run 2      | Run 3      |    Average     |
> | --------- | ---------- | ---------- | ---------- | -------------- |
> |   llvm    | 22m18.441s | 22m31.905s | 22m23.718s |   22m24.688s   |
> |   clang   | 30m09.774s | 30m22.680s | 30m15.312s |   30m15.922s   |
> |   lld     | 1m26.994s  | 1m30.415s  | 1m29.006s  |   1m28.805s    |
>
> With the testsuite changes applied:
> |  Target   | Run 1      | Run 2      | Run 3      |    Average     |
> | --------- | ---------- | ---------- | ---------- | -------------- |
> |   llvm    | 23m32.104s | 23m45.887s | 23m38.157s |   23m38.716s   |
> |   clang   | 30m31.402s | 30m46.198s | 30m39.445s |   30m39.015s   |
> |   lld     | 1m29.845s  | 1m34.212s  | 1m31.925s  |   1m31.994s    |
>
> Comparison:
> |  Target   | Default Avg | With Changes Avg |     **Diff**     |
> | --------- | ----------- | ---------------- | ---------------- |
> |   llvm    | 22m24.688s  | 23m38.716s       |   +1m14.028s     |
> |   clang   | 30m15.922s  | 30m39.015s       |   +0m23.093s     |
> |   lld     | 1m28.805s   | 1m31.994s        |   +0m3.189s      |
>
> Impact on tmpdir size:
> | Metric                               | Size  |
> | ------------------------------------ | ----- |
> | Default target `tmpdir` size         | 74 GB |
> | Target `tmpdir` size (after changes) | 79 GB |
> | Difference                           | +5 GB |


Nice data and nicely presented. Thanks.

I was wondering if there was any other impact due to the changes so I=20
added clang and llvm to my local.conf:
IMAGE_INSTALL:append =3D " clang llvm"

I know this isn't a common work-flow but I was curious.

I also added:
INHERIT +=3D "buildhistory"
BUILDHISTORY_COMMIT =3D "1"

as explained here:
https://docs.yoctoproject.org/dev-manual/build-quality.html#enabling-and-=
disabling-build-history

I made sure there were -no- llvm or clang files in my tmp dir or=20
sstate-cache, then I ran:

=E2=9D=AF bitbake core-image-minimal
...
I applied your patches and built again:

=E2=9D=AF bitbake core-image-minimal
...

and ran (1).

My summary (with some AI bot help) is:

|+---------------------+----------+----------+-----------+------------+=20
| Package | Old (MB) | New (MB) | Diff (MB) | Change (%) |=20
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+ |=20
clang/clang-dbg | 44.99 | 59.79 | +14.81 | +32.92% | | clang/clang-dev |=20
30.22 | 30.22 | -0.00 | -0.00% | | clang/clang-tools | 5.05 | 29.58 |=20
+24.53 | +485.87% | | llvm/llvm-bin | 16.40 | 71.77 | +55.36 | +337.50%=20
| | llvm/llvm-dbg | 386.79 | 646.12 | +259.33 | +67.05% | |=20
llvm/llvm-dev | 32.67 | 33.67 | +1.00 | +3.05% | | llvm/llvm-src |=20
387.54 | 389.44 | +1.90 | +0.49% | | llvm/llvm-staticdev | 609.68 |=20
616.80 | +7.12 | +1.17% |=20
+---------------------+----------+----------+-----------+------------+|

I think you already have a solution to this target package size bloat=20
that you mentioned in private chat.

Please explain here and send a new patchset when ready.

Thanks,

../Randy


1)

=E2=9D=AF buildhistory-diff -a
images/qemux86_64/glibc/core-image-minimal: IMAGESIZE changed from=20
273524 to 273528 (+0%)
packages/x86-64-v3-oe-linux/clang/clang-dbg: FILELIST: added=20
"/usr/bin/.debug/c-index-test"
packages/x86-64-v3-oe-linux/clang/clang-dbg: PKGSIZE changed from=20
47171320 to 62698976 (+33%)
packages/x86-64-v3-oe-linux/clang/clang-dbg: RRECOMMENDS: added=20
"libclang-dbg libxml2-dbg"
packages/x86-64-v3-oe-linux/clang/clang-dev: PKGSIZE changed from=20
31692933 to 31692927 (-0%)
packages/x86-64-v3-oe-linux/clang/clang-tools: RDEPENDS: added "libxml2=20
(['>=3D 2.15.1']) libclang (['>=3D 21.1.8'])"
packages/x86-64-v3-oe-linux/clang/clang-tools: FILELIST: added=20
"/usr/bin/c-index-test"
packages/x86-64-v3-oe-linux/clang/clang-tools: PKGSIZE changed from=20
5294619 to 31019723 (+486%)
packages/x86-64-v3-oe-linux/llvm/llvm-bin: RDEPENDS: added "libzstd=20
(['>=3D 1.5.7']) zlib (['>=3D 1.3.2'])"
packages/x86-64-v3-oe-linux/llvm/llvm-bin: FILELIST: added=20
"/usr/bin/llvm-exegesis /usr/bin/obj2yaml /usr/bin/yaml2obj"
packages/x86-64-v3-oe-linux/llvm/llvm-bin: PKGSIZE changed from 17200574=20
to 75253038 (+338%)
packages/x86-64-v3-oe-linux/llvm/llvm-dbg: FILELIST: added=20
"/usr/bin/.debug/obj2yaml /usr/bin/.debug/llvm-exegesis=20
/usr/bin/.debug/yaml2obj"
packages/x86-64-v3-oe-linux/llvm/llvm-dbg: PKGSIZE changed from=20
405577928 to 677509048 (+67%)
packages/x86-64-v3-oe-linux/llvm/llvm-dev: FILELIST: added=20
"/usr/include/llvm-gtest/gtest/internal/gtest-param-util.h=20
/usr/include/llvm-gmock/gmock/internal/custom/gmock-generated-actions.h=20
/usr/include/llvm-gtest/gtest/internal/gtest-filepath.h=20
/usr/include/llvm-gmock/gmock/gmock-actions.h=20
/usr/include/llvm-gmock/gmock/gmock.h=20
/usr/include/llvm-gtest/gtest/gtest-test-part.h=20
/usr/include/llvm-gtest/gtest/gtest-param-test.h=20
/usr/include/llvm-gtest/gtest/internal/custom/gtest-port.h=20
/usr/include/llvm-gtest/gtest/internal/custom/raw-ostream.h=20
/usr/include/llvm-gtest/gtest/gtest-spi.h=20
/usr/include/llvm-gtest/gtest/gtest-assertion-result.h=20
/usr/include/llvm-gtest/gtest/internal/gtest-death-test-internal.h=20
/usr/include/llvm-gtest/gtest/internal/custom/README.md=20
/usr/include/llvm-gtest/gtest/gtest-printers.h=20
/usr/include/llvm-gtest/gtest/internal/gtest-type-util.h=20
/usr/include/llvm-gtest/gtest/internal/gtest-internal.h=20
/usr/include/llvm-gmock/gmock/internal/gmock-port.h=20
/usr/include/llvm-gtest/gtest/gtest_prod.h=20
/usr/include/llvm-gmock/gmock/gmock-more-actions.h=20
/usr/include/llvm-gmock/gmock/internal/gmock-pp.h=20
/usr/include/llvm-gtest/gtest/internal/custom/gtest-printers.h=20
/usr/include/llvm-gtest/gtest/gtest.h=20
/usr/include/llvm-gtest/gtest/gtest-typed-test.h=20
/usr/include/llvm-gmock/gmock/internal/custom/gmock-matchers.h=20
/usr/include/llvm-gtest/gtest/gtest-message.h=20
/usr/include/llvm-gmock/gmock/gmock-more-matchers.h=20
/usr/include/llvm-gmock/gmock/gmock-cardinalities.h=20
/usr/include/llvm-gtest/gtest/gtest-death-test.h=20
/usr/include/llvm-gtest/gtest/internal/custom/gtest.h=20
/usr/include/llvm-gtest/gtest/internal/gtest-port-arch.h=20
/usr/include/llvm-gtest/gtest/internal/gtest-string.h=20
/usr/include/llvm-gmock/gmock/internal/gmock-internal-utils.h=20
/usr/include/llvm-gmock/gmock/internal/custom/README.md=20
/usr/include/llvm-gmock/gmock/internal/custom/gmock-port.h=20
/usr/include/llvm-gtest/gtest/internal/gtest-port.h=20
/usr/include/llvm-gmock/gmock/gmock-spec-builders.h=20
/usr/include/llvm-gtest/gtest/gtest-matchers.h=20
/usr/include/llvm-gmock/gmock/gmock-matchers.h=20
/usr/include/llvm-gmock/gmock/gmock-function-mocker.h=20
/usr/include/llvm-gmock/gmock/gmock-nice-strict.h=20
/usr/include/llvm-gtest/gtest/gtest_pred_impl.h"
packages/x86-64-v3-oe-linux/llvm/llvm-dev: PKGSIZE changed from 34258809=20
to 35304811 (+3%)
packages/x86-64-v3-oe-linux/llvm/llvm-src: FILELIST: added=20
"/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/DisassemblerHelp=
er.cpp=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest.cc=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/include/gmock/=
gmock-matchers.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/BenchmarkCode.h=20
/usr/src/debug/llvm/21.1.8/llvm/include/llvm/ADT/CombinationGenerator.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/RISCV/Target.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/RISCV/RISCVExeges=
isPreprocessing.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/ParallelSnippetGe=
nerator.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SubprocessMemory.=
h=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/include/gmock/=
gmock-cardinalities.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SchedClassResolut=
ion.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/RegisterValue.h=20
/usr/src/debug/llvm/21.1.8/llvm/include/llvm/ADT/PackedVector.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/RegisterAliasing.=
cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/wasm2yaml.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/xcoff2yaml.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/elf2yaml.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/PowerPC/Target.cp=
p=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
gtest-death-test.h=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
gtest-test-part.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SnippetFile.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/RegisterAliasing.=
h=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/src/gmock-inte=
rnal-utils.cc=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/PerfHelper.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/archive2yaml.cpp=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/UnitTestMain/TestMain.cpp=
=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SerialSnippetGene=
rator.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/BenchmarkRunner.c=
pp=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest-inte=
rnal-inl.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SnippetRepetitor.=
h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/AArch64/Target.cp=
p=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/ResultAggregator.=
h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/ValidationEvent.c=
pp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Analysis.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/ParallelSnippetGe=
nerator.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/RISCV/RISCVExeges=
isPasses.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/obj2yaml.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Target.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/UopsBenchmarkRunn=
er.cpp=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest-type=
d-test.cc=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/CodeTemplate.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Target.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/UopsBenchmarkRunn=
er.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/LatencyBenchmarkR=
unner.h=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest-test=
-part.cc=20
/usr/src/debug/llvm/21.1.8/llvm/include/llvm/Support/raw_os_ostream.h=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/src/gmock-spec=
-builders.cc=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Error.cpp=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
gtest-matchers.h=20
/usr/src/debug/llvm/21.1.8/lib/Target/AArch64/AArch64GenExegesis.inc=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SnippetGenerator.=
cpp=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest-matc=
hers.cc=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/DisassemblerHelpe=
r.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/X86/Target.cpp=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
gtest-printers.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/offload2yaml.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/dxcontainer2yaml.cpp=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
gtest-message.h=20
/usr/src/debug/llvm/21.1.8/lib/Target/X86/X86GenExegesis.inc=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest-asse=
rtion-result.cc=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/RISCV/RISCVExeges=
isPostprocessing.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Assembler.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Analysis.h=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest-port=
.cc=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
internal/gtest-port.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/TargetSelect.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/MCInstrDescView.c=
pp=20
/usr/src/debug/llvm/21.1.8/llvm/lib/Testing/Support/Error.cpp=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
internal/gtest-internal.h=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
internal/gtest-filepath.h=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
internal/custom/raw-ostream.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SubprocessMemory.=
cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/obj2yaml.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/minidump2yaml.cpp=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/src/gmock-matc=
hers.cc=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Error.h=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/include/gmock/=
internal/gmock-internal-utils.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/LlvmState.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/dwarf2yaml.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/MCInstrDescView.h=
=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/BenchmarkResult.c=
pp=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest-file=
path.cc=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SerialSnippetGene=
rator.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/lib/Testing/Annotations/Annotations.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SnippetRepetitor.=
cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Assembler.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Clustering.h=20
/usr/src/debug/llvm/21.1.8/include/llvm/Config/TargetExegesis.def=20
/usr/src/debug/llvm/21.1.8/llvm/tools/yaml2obj/yaml2obj.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Mips/Target.cpp=20
/usr/src/debug/llvm/21.1.8/lib/Target/RISCV/RISCVGenExegesis.inc=20
/usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/coff2yaml.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/CodeTemplate.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/ProgressMeter.h=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/src/gmock.cc=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/include/gmock/=
gmock.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/macho2yaml.cpp=20
/usr/src/debug/llvm/21.1.8/lib/Target/Mips/MipsGenExegesis.inc=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SnippetGenerator.=
h=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/src/gmock-card=
inalities.cc=20
/usr/src/debug/llvm/21.1.8/lib/Target/PowerPC/PPCGenExegesis.inc=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/llvm-exegesis.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/LatencyBenchmarkR=
unner.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SchedClassResolut=
ion.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SnippetFile.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/LlvmState.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/BenchmarkResult.h=
=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest-deat=
h-test.cc=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/include/gmock/=
gmock-spec-builders.h=20
/usr/src/debug/llvm/21.1.8/llvm/lib/Testing/Support/SupportHelpers.cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/ValidationEvent.h=
=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
gtest.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Clustering.cpp=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
internal/gtest-param-util.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/RegisterValue.cpp=
=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/BenchmarkRunner.h=
=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest-prin=
ters.cc=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
gtest-assertion-result.h=20
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
internal/gtest-death-test-internal.h=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/ResultAggregator.=
cpp=20
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/PerfHelper.cpp"
packages/x86-64-v3-oe-linux/llvm/llvm-src: PKGSIZE changed from=20
406369891 to 408360607 (+0%)
packages/x86-64-v3-oe-linux/llvm/llvm-staticdev: FILELIST: added=20
"/usr/lib/libllvm_gtest_main.a /usr/lib/libLLVMTestingAnnotations.a=20
/usr/lib/libLLVMExegesisMips.a /usr/lib/libLLVMExegesis.a=20
/usr/lib/libLLVMTestingSupport.a /usr/lib/libLLVMExegesisPowerPC.a=20
/usr/lib/libLLVMExegesisX86.a /usr/lib/libLLVMExegesisAArch64.a=20
/usr/lib/libllvm_gtest.a /usr/lib/libLLVMExegesisRISCV.a"
packages/x86-64-v3-oe-linux/llvm/llvm-staticdev: PKGSIZE changed from=20
639292726 to 646763728 (+1%)
Changes to packages/x86-64-v3-oe-linux/llvm (sysroot):
 =C2=A0 /usr/bin/bugpoint was added
 =C2=A0 /usr/bin/count was added
 =C2=A0 /usr/bin/dsymutil was added
 =C2=A0 /usr/bin/FileCheck was added
 =C2=A0 /usr/bin/llc was added
 =C2=A0 /usr/bin/lli was added
 =C2=A0 /usr/bin/lli-child-target was added
 =C2=A0 /usr/bin/llvm-addr2line was added
 =C2=A0 /usr/bin/llvm-ar was added
 =C2=A0 /usr/bin/llvm-as was added
 =C2=A0 /usr/bin/llvm-bcanalyzer was added
 =C2=A0 /usr/bin/llvm-bitcode-strip was added
 =C2=A0 /usr/bin/llvm-cat was added
 =C2=A0 /usr/bin/llvm-cfi-verify was added
 =C2=A0 /usr/bin/llvm-cgdata was added
 =C2=A0 /usr/bin/llvm-config was added
 =C2=A0 /usr/bin/llvm-cov was added
 =C2=A0 /usr/bin/llvm-c-test was added
 =C2=A0 /usr/bin/llvm-ctxprof-util was added
 =C2=A0 /usr/bin/llvm-cvtres was added
 =C2=A0 /usr/bin/llvm-cxxdump was added
 =C2=A0 /usr/bin/llvm-cxxfilt was added
 =C2=A0 /usr/bin/llvm-cxxmap was added
 =C2=A0 /usr/bin/llvm-debuginfo-analyzer was added
 =C2=A0 /usr/bin/llvm-debuginfod was added
 =C2=A0 /usr/bin/llvm-debuginfod-find was added
 =C2=A0 /usr/bin/llvm-diff was added
 =C2=A0 /usr/bin/llvm-dis was added
 =C2=A0 /usr/bin/llvm-dlang-demangle-fuzzer was added
 =C2=A0 /usr/bin/llvm-dlltool was added
 =C2=A0 /usr/bin/llvm-dwarfdump was added
 =C2=A0 /usr/bin/llvm-dwarfutil was added
 =C2=A0 /usr/bin/llvm-dwp was added
 =C2=A0 /usr/bin/llvm-exegesis was added
 =C2=A0 /usr/bin/llvm-extract was added
 =C2=A0 /usr/bin/llvm-gsymutil was added
 =C2=A0 /usr/bin/llvm-ifs was added
 =C2=A0 /usr/bin/llvm-install-name-tool was added
 =C2=A0 /usr/bin/llvm-isel-fuzzer was added
 =C2=A0 /usr/bin/llvm-itanium-demangle-fuzzer was added
 =C2=A0 /usr/bin/llvm-jitlink was added
 =C2=A0 /usr/bin/llvm-jitlink-executor was added
 =C2=A0 /usr/bin/llvm-lib was added
 =C2=A0 /usr/bin/llvm-libtool-darwin was added
 =C2=A0 /usr/bin/llvm-link was added
 =C2=A0 /usr/bin/llvm-lipo was added
 =C2=A0 /usr/bin/llvm-lit was added
 =C2=A0 /usr/bin/llvm-locstats was added
 =C2=A0 /usr/bin/llvm-lto was added
 =C2=A0 /usr/bin/llvm-lto2 was added
 =C2=A0 /usr/bin/llvm-mc was added
 =C2=A0 /usr/bin/llvm-mca was added
 =C2=A0 /usr/bin/llvm-microsoft-demangle-fuzzer was added
 =C2=A0 /usr/bin/llvm-ml was added
 =C2=A0 /usr/bin/llvm-ml64 was added
 =C2=A0 /usr/bin/llvm-modextract was added
 =C2=A0 /usr/bin/llvm-mt was added
 =C2=A0 /usr/bin/llvm-nm was added
 =C2=A0 /usr/bin/llvm-objcopy was added
 =C2=A0 /usr/bin/llvm-objdump was added
 =C2=A0 /usr/bin/llvm-opt-fuzzer was added
 =C2=A0 /usr/bin/llvm-opt-report was added
 =C2=A0 /usr/bin/llvm-otool was added
 =C2=A0 /usr/bin/llvm-pdbutil was added
 =C2=A0 /usr/bin/llvm-PerfectShuffle was added
 =C2=A0 /usr/bin/llvm-profdata was added
 =C2=A0 /usr/bin/llvm-profgen was added
 =C2=A0 /usr/bin/llvm-ranlib was added
 =C2=A0 /usr/bin/llvm-rc was added
 =C2=A0 /usr/bin/llvm-readelf was added
 =C2=A0 /usr/bin/llvm-readobj was added
 =C2=A0 /usr/bin/llvm-readtapi was added
 =C2=A0 /usr/bin/llvm-reduce was added
 =C2=A0 /usr/bin/llvm-remarkutil was added
 =C2=A0 /usr/bin/llvm-rtdyld was added
 =C2=A0 /usr/bin/llvm-rust-demangle-fuzzer was added
 =C2=A0 /usr/bin/llvm-sim was added
 =C2=A0 /usr/bin/llvm-size was added
 =C2=A0 /usr/bin/llvm-special-case-list-fuzzer was added
 =C2=A0 /usr/bin/llvm-split was added
 =C2=A0 /usr/bin/llvm-stress was added
 =C2=A0 /usr/bin/llvm-strings was added
 =C2=A0 /usr/bin/llvm-strip was added
 =C2=A0 /usr/bin/llvm-symbolizer was added
 =C2=A0 /usr/bin/llvm-tblgen was added
 =C2=A0 /usr/bin/llvm-test-mustache-spec was added
 =C2=A0 /usr/bin/llvm-tli-checker was added
 =C2=A0 /usr/bin/llvm-undname was added
 =C2=A0 /usr/bin/llvm-windres was added
 =C2=A0 /usr/bin/llvm-xray was added
 =C2=A0 /usr/bin/llvm-yaml-numeric-parser-fuzzer was added
 =C2=A0 /usr/bin/llvm-yaml-parser-fuzzer was added
 =C2=A0 /usr/bin/not was added
 =C2=A0 /usr/bin/obj2yaml was added
 =C2=A0 /usr/bin/opt was added
 =C2=A0 /usr/bin/reduce-chunk-list was added
 =C2=A0 /usr/bin/sancov was added
 =C2=A0 /usr/bin/sanstats was added
 =C2=A0 /usr/bin/split-file was added
 =C2=A0 /usr/bin/UnicodeNameMappingGenerator was added
 =C2=A0 /usr/bin/verify-uselistorder was added
 =C2=A0 /usr/bin/yaml2obj was added
 =C2=A0 /usr/bin/yaml-bench was added
 =C2=A0 /usr/include/llvm-gmock was added
 =C2=A0 /usr/include/llvm-gmock/gmock was added
 =C2=A0 /usr/include/llvm-gmock/gmock/gmock-actions.h was added
 =C2=A0 /usr/include/llvm-gmock/gmock/gmock-cardinalities.h was added
 =C2=A0 /usr/include/llvm-gmock/gmock/gmock-function-mocker.h was added
 =C2=A0 /usr/include/llvm-gmock/gmock/gmock.h was added
 =C2=A0 /usr/include/llvm-gmock/gmock/gmock-matchers.h was added
 =C2=A0 /usr/include/llvm-gmock/gmock/gmock-more-actions.h was added
 =C2=A0 /usr/include/llvm-gmock/gmock/gmock-more-matchers.h was added
 =C2=A0 /usr/include/llvm-gmock/gmock/gmock-nice-strict.h was added
 =C2=A0 /usr/include/llvm-gmock/gmock/gmock-spec-builders.h was added
 =C2=A0 /usr/include/llvm-gmock/gmock/internal was added
 =C2=A0 /usr/include/llvm-gmock/gmock/internal/custom was added
/usr/include/llvm-gmock/gmock/internal/custom/gmock-generated-actions.h=20
was added
 =C2=A0 /usr/include/llvm-gmock/gmock/internal/custom/gmock-matchers.h wa=
s added
 =C2=A0 /usr/include/llvm-gmock/gmock/internal/custom/gmock-port.h was ad=
ded
 =C2=A0 /usr/include/llvm-gmock/gmock/internal/custom/README.md was added
 =C2=A0 /usr/include/llvm-gmock/gmock/internal/gmock-internal-utils.h was=
 added
 =C2=A0 /usr/include/llvm-gmock/gmock/internal/gmock-port.h was added
 =C2=A0 /usr/include/llvm-gmock/gmock/internal/gmock-pp.h was added
 =C2=A0 /usr/include/llvm-gtest was added
 =C2=A0 /usr/include/llvm-gtest/gtest was added
 =C2=A0 /usr/include/llvm-gtest/gtest/gtest-assertion-result.h was added
 =C2=A0 /usr/include/llvm-gtest/gtest/gtest-death-test.h was added
 =C2=A0 /usr/include/llvm-gtest/gtest/gtest.h was added
 =C2=A0 /usr/include/llvm-gtest/gtest/gtest-matchers.h was added
 =C2=A0 /usr/include/llvm-gtest/gtest/gtest-message.h was added
 =C2=A0 /usr/include/llvm-gtest/gtest/gtest-param-test.h was added
 =C2=A0 /usr/include/llvm-gtest/gtest/gtest_pred_impl.h was added
 =C2=A0 /usr/include/llvm-gtest/gtest/gtest-printers.h was added
 =C2=A0 /usr/include/llvm-gtest/gtest/gtest_prod.h was added
 =C2=A0 /usr/include/llvm-gtest/gtest/gtest-spi.h was added
 =C2=A0 /usr/include/llvm-gtest/gtest/gtest-test-part.h was added
 =C2=A0 /usr/include/llvm-gtest/gtest/gtest-typed-test.h was added
 =C2=A0 /usr/include/llvm-gtest/gtest/internal was added
 =C2=A0 /usr/include/llvm-gtest/gtest/internal/custom was added
 =C2=A0 /usr/include/llvm-gtest/gtest/internal/custom/gtest.h was added
 =C2=A0 /usr/include/llvm-gtest/gtest/internal/custom/gtest-port.h was ad=
ded
 =C2=A0 /usr/include/llvm-gtest/gtest/internal/custom/gtest-printers.h wa=
s added
 =C2=A0 /usr/include/llvm-gtest/gtest/internal/custom/raw-ostream.h was a=
dded
 =C2=A0 /usr/include/llvm-gtest/gtest/internal/custom/README.md was added
/usr/include/llvm-gtest/gtest/internal/gtest-death-test-internal.h was ad=
ded
 =C2=A0 /usr/include/llvm-gtest/gtest/internal/gtest-filepath.h was added
 =C2=A0 /usr/include/llvm-gtest/gtest/internal/gtest-internal.h was added
 =C2=A0 /usr/include/llvm-gtest/gtest/internal/gtest-param-util.h was add=
ed
 =C2=A0 /usr/include/llvm-gtest/gtest/internal/gtest-port-arch.h was adde=
d
 =C2=A0 /usr/include/llvm-gtest/gtest/internal/gtest-port.h was added
 =C2=A0 /usr/include/llvm-gtest/gtest/internal/gtest-string.h was added
 =C2=A0 /usr/include/llvm-gtest/gtest/internal/gtest-type-util.h was adde=
d
 =C2=A0 /usr/lib/libLLVMExegesis.a was added
 =C2=A0 /usr/lib/libLLVMExegesisAArch64.a was added
 =C2=A0 /usr/lib/libLLVMExegesisMips.a was added
 =C2=A0 /usr/lib/libLLVMExegesisPowerPC.a was added
 =C2=A0 /usr/lib/libLLVMExegesisRISCV.a was added
 =C2=A0 /usr/lib/libLLVMExegesisX86.a was added
 =C2=A0 /usr/lib/libllvm_gtest.a was added
 =C2=A0 /usr/lib/libllvm_gtest_main.a was added
 =C2=A0 /usr/lib/libLLVMTestingAnnotations.a was added
 =C2=A0 /usr/lib/libLLVMTestingSupport.a was added
Changes to packages/x86_64-linux/llvm-native (sysroot):
 =C2=A0 /usr/bin/llvm-exegesis was added
 =C2=A0 /usr/lib/libLLVMExegesis.a was added
 =C2=A0 /usr/lib/libLLVMExegesisAArch64.a was added
 =C2=A0 /usr/lib/libLLVMExegesisMips.a was added
 =C2=A0 /usr/lib/libLLVMExegesisPowerPC.a was added
 =C2=A0 /usr/lib/libLLVMExegesisRISCV.a was added
 =C2=A0 /usr/lib/libLLVMExegesisX86.a was added


>
> Deepesh Varatharajan (4):
>    clang-tools-extra: disable tests
>    clang: Enable cmake flags for llvm, clang, lld tests
>    oeqa/selftest/clang: Add oe-seltests for Clang/LLVM/LLD
>    rust: Fix rust build failure
>
>   meta/lib/oeqa/selftest/cases/clang.py         | 298 +++++++++++++++++=
+
>   .../0042-guard-clang-tools-extra-test.patch   |  74 +++++
>   meta/recipes-devtools/clang/clang_git.bb      |   2 +
>   meta/recipes-devtools/clang/common.inc        |   1 +
>   meta/recipes-devtools/clang/lld_git.bb        |   2 +
>   meta/recipes-devtools/clang/llvm_git.bb       |   8 +-
>   meta/recipes-devtools/rust/rust_1.93.0.bb     |   5 +-
>   7 files changed, 387 insertions(+), 3 deletions(-)
>   create mode 100644 meta/lib/oeqa/selftest/cases/clang.py
>   create mode 100644 meta/recipes-devtools/clang/clang/0042-guard-clang=
-tools-extra-test.patch
>

--=20
# Randy MacLeod
# Wind River Linux

--------------Z0ns9g5uOQLvJQGJSCaJiM6J
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61Q8ITMF1816971

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2026-02-20 1:02 a.m.,
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Deepesh.Varath=
arajan@windriver.com">Deepesh.Varatharajan@windriver.com</a> wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20260220060252.77248-1-Deepesh.=
Varatharajan@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Deepesh Varatharajan <=
a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Deepesh.Varatharajan@win=
driver.com">&lt;Deepesh.Varatharajan@windriver.com&gt;</a>

This patch series introduces a test framework to run selftests for
target builds of Clang, LLVM, and LLD.

Summary of changes:
-Patch 1: Disable clang-tools-extra tests, as Clang's CMake cannot
          detect the llvm-bcanalyzer target.
-Patch 2: Enabled the necessary CMake flags for clang, llvm &amp; lld tes=
ts
-Patch 3: Selftest script for Clang, LLVM, and LLD including exclude list
-Patch 4: Fix rust build failure by replacing target llvm-config with nat=
ive

Testing:
1. The test suite has been successfully validated on x86-64, arm64, riscv=
64
and arm32 for all Clang, LLD &amp; LLVM components.
2. Clang and LLD tests passed successfully on x86. LLVM tests are skipped
on x86 since it's broken. A follow-up bug will be filed and addressed.
3. Clang, LLVM &amp; LLD all together ~80K tests are there and we current=
ly
~250 tests to exclude list which are failing (0.32%).

Impact on build time:
These builds were executed in a controlled environment without poky-sstat=
e
enabled.

Default(without changes):
|  Target   | Run 1      | Run 2      | Run 3      |    Average     |
| --------- | ---------- | ---------- | ---------- | -------------- |
|   llvm    | 22m18.441s | 22m31.905s | 22m23.718s |   22m24.688s   |
|   clang   | 30m09.774s | 30m22.680s | 30m15.312s |   30m15.922s   |
|   lld     | 1m26.994s  | 1m30.415s  | 1m29.006s  |   1m28.805s    |

With the testsuite changes applied:
|  Target   | Run 1      | Run 2      | Run 3      |    Average     |
| --------- | ---------- | ---------- | ---------- | -------------- |
|   llvm    | 23m32.104s | 23m45.887s | 23m38.157s |   23m38.716s   |
|   clang   | 30m31.402s | 30m46.198s | 30m39.445s |   30m39.015s   |
|   lld     | 1m29.845s  | 1m34.212s  | 1m31.925s  |   1m31.994s    |

Comparison:
|  Target   | Default Avg | With Changes Avg |     **Diff**     |
| --------- | ----------- | ---------------- | ---------------- |
|   llvm    | 22m24.688s  | 23m38.716s       |   +1m14.028s     |
|   clang   | 30m15.922s  | 30m39.015s       |   +0m23.093s     |
|   lld     | 1m28.805s   | 1m31.994s        |   +0m3.189s      |

Impact on tmpdir size:
| Metric                               | Size  |
| ------------------------------------ | ----- |
| Default target `tmpdir` size         | 74 GB |
| Target `tmpdir` size (after changes) | 79 GB |
| Difference                           | +5 GB |</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Nice data and nicely presented. Thanks.</p>
    <p>I was wondering if there was any other impact due to the changes
      so I added clang and llvm to my local.conf:<br>
      IMAGE_INSTALL:append =3D &quot; clang llvm&quot;</p>
    <p>I know this isn't a common work-flow but I was curious.</p>
    <p>I also added:<br>
      INHERIT +=3D &quot;buildhistory&quot;<br>
      BUILDHISTORY_COMMIT =3D &quot;1&quot;<br>
      <br>
      as explained here:<br>
      <a class=3D"moz-txt-link-freetext" href=3D"https://docs.yoctoprojec=
t.org/dev-manual/build-quality.html#enabling-and-disabling-build-history"=
>https://docs.yoctoproject.org/dev-manual/build-quality.html#enabling-and=
-disabling-build-history</a><br>
    </p>
    <p>I made sure there were -no- llvm or clang files in my tmp dir or
      sstate-cache, then I ran:<br>
      <br>
      =E2=9D=AF bitbake core-image-minimal<br>
      ...<br>
      I applied your patches and built again:<br>
    </p>
    <p>=E2=9D=AF bitbake core-image-minimal<br>
      ...<br>
    </p>
    <p>and ran (1).</p>
    <p>My summary (with some AI bot help) is:<br>
    </p>
    <pre _ngcontent-ng-c239522828=3D"" class=3D"ng-tns-c239522828-47"><co=
de _ngcontent-ng-c239522828=3D"" role=3D"text" data-test-id=3D"code-conte=
nt" class=3D"code-container formatted ng-tns-c239522828-47">+------------=
---------+----------+----------+-----------+------------+
| Package             | Old (MB) | New (MB) | Diff (MB) | Change (%) |
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
| clang/clang-dbg     |    44.99 |    59.79 |    +14.81 |    +32.92% |
| clang/clang-dev     |    30.22 |    30.22 |     -0.00 |     -0.00% |
| clang/clang-tools   |     5.05 |    29.58 |    +24.53 |   +485.87% |
| llvm/llvm-bin       |    16.40 |    71.77 |    +55.36 |   +337.50% |
| llvm/llvm-dbg       |   386.79 |   646.12 |   +259.33 |    +67.05% |
| llvm/llvm-dev       |    32.67 |    33.67 |     +1.00 |     +3.05% |
| llvm/llvm-src       |   387.54 |   389.44 |     +1.90 |     +0.49% |
| llvm/llvm-staticdev |   609.68 |   616.80 |     +7.12 |     +1.17% |
+---------------------+----------+----------+-----------+------------+</c=
ode></pre>
    <p>I think you already have a solution to this target package size
      bloat that you mentioned in private chat.<br>
      <br>
      Please explain here and send a new patchset when ready.</p>
    <p>Thanks,</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p>1)</p>
    <p>=E2=9D=AF buildhistory-diff -a&nbsp;<br>
      images/qemux86_64/glibc/core-image-minimal: IMAGESIZE changed from
      273524 to 273528 (+0%)<br>
      packages/x86-64-v3-oe-linux/clang/clang-dbg: FILELIST: added
      &quot;/usr/bin/.debug/c-index-test&quot;<br>
      packages/x86-64-v3-oe-linux/clang/clang-dbg: PKGSIZE changed from
      47171320 to 62698976 (+33%)<br>
      packages/x86-64-v3-oe-linux/clang/clang-dbg: RRECOMMENDS: added
      &quot;libclang-dbg libxml2-dbg&quot;<br>
      packages/x86-64-v3-oe-linux/clang/clang-dev: PKGSIZE changed from
      31692933 to 31692927 (-0%)<br>
      packages/x86-64-v3-oe-linux/clang/clang-tools: RDEPENDS: added
      &quot;libxml2 (['&gt;=3D 2.15.1']) libclang (['&gt;=3D 21.1.8'])&qu=
ot;<br>
      packages/x86-64-v3-oe-linux/clang/clang-tools: FILELIST: added
      &quot;/usr/bin/c-index-test&quot;<br>
      packages/x86-64-v3-oe-linux/clang/clang-tools: PKGSIZE changed
      from 5294619 to 31019723 (+486%)<br>
      packages/x86-64-v3-oe-linux/llvm/llvm-bin: RDEPENDS: added
      &quot;libzstd (['&gt;=3D 1.5.7']) zlib (['&gt;=3D 1.3.2'])&quot;<br=
>
      packages/x86-64-v3-oe-linux/llvm/llvm-bin: FILELIST: added
      &quot;/usr/bin/llvm-exegesis /usr/bin/obj2yaml /usr/bin/yaml2obj&qu=
ot;<br>
      packages/x86-64-v3-oe-linux/llvm/llvm-bin: PKGSIZE changed from
      17200574 to 75253038 (+338%)<br>
      packages/x86-64-v3-oe-linux/llvm/llvm-dbg: FILELIST: added
      &quot;/usr/bin/.debug/obj2yaml /usr/bin/.debug/llvm-exegesis
      /usr/bin/.debug/yaml2obj&quot;<br>
      packages/x86-64-v3-oe-linux/llvm/llvm-dbg: PKGSIZE changed from
      405577928 to 677509048 (+67%)<br>
      packages/x86-64-v3-oe-linux/llvm/llvm-dev: FILELIST: added
      &quot;/usr/include/llvm-gtest/gtest/internal/gtest-param-util.h
      /usr/include/llvm-gmock/gmock/internal/custom/gmock-generated-actio=
ns.h
      /usr/include/llvm-gtest/gtest/internal/gtest-filepath.h
      /usr/include/llvm-gmock/gmock/gmock-actions.h
      /usr/include/llvm-gmock/gmock/gmock.h
      /usr/include/llvm-gtest/gtest/gtest-test-part.h
      /usr/include/llvm-gtest/gtest/gtest-param-test.h
      /usr/include/llvm-gtest/gtest/internal/custom/gtest-port.h
      /usr/include/llvm-gtest/gtest/internal/custom/raw-ostream.h
      /usr/include/llvm-gtest/gtest/gtest-spi.h
      /usr/include/llvm-gtest/gtest/gtest-assertion-result.h
      /usr/include/llvm-gtest/gtest/internal/gtest-death-test-internal.h
      /usr/include/llvm-gtest/gtest/internal/custom/README.md
      /usr/include/llvm-gtest/gtest/gtest-printers.h
      /usr/include/llvm-gtest/gtest/internal/gtest-type-util.h
      /usr/include/llvm-gtest/gtest/internal/gtest-internal.h
      /usr/include/llvm-gmock/gmock/internal/gmock-port.h
      /usr/include/llvm-gtest/gtest/gtest_prod.h
      /usr/include/llvm-gmock/gmock/gmock-more-actions.h
      /usr/include/llvm-gmock/gmock/internal/gmock-pp.h
      /usr/include/llvm-gtest/gtest/internal/custom/gtest-printers.h
      /usr/include/llvm-gtest/gtest/gtest.h
      /usr/include/llvm-gtest/gtest/gtest-typed-test.h
      /usr/include/llvm-gmock/gmock/internal/custom/gmock-matchers.h
      /usr/include/llvm-gtest/gtest/gtest-message.h
      /usr/include/llvm-gmock/gmock/gmock-more-matchers.h
      /usr/include/llvm-gmock/gmock/gmock-cardinalities.h
      /usr/include/llvm-gtest/gtest/gtest-death-test.h
      /usr/include/llvm-gtest/gtest/internal/custom/gtest.h
      /usr/include/llvm-gtest/gtest/internal/gtest-port-arch.h
      /usr/include/llvm-gtest/gtest/internal/gtest-string.h
      /usr/include/llvm-gmock/gmock/internal/gmock-internal-utils.h
      /usr/include/llvm-gmock/gmock/internal/custom/README.md
      /usr/include/llvm-gmock/gmock/internal/custom/gmock-port.h
      /usr/include/llvm-gtest/gtest/internal/gtest-port.h
      /usr/include/llvm-gmock/gmock/gmock-spec-builders.h
      /usr/include/llvm-gtest/gtest/gtest-matchers.h
      /usr/include/llvm-gmock/gmock/gmock-matchers.h
      /usr/include/llvm-gmock/gmock/gmock-function-mocker.h
      /usr/include/llvm-gmock/gmock/gmock-nice-strict.h
      /usr/include/llvm-gtest/gtest/gtest_pred_impl.h&quot;<br>
      packages/x86-64-v3-oe-linux/llvm/llvm-dev: PKGSIZE changed from
      34258809 to 35304811 (+3%)<br>
      packages/x86-64-v3-oe-linux/llvm/llvm-src: FILELIST: added
&quot;/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Disassemble=
rHelper.cpp
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest.cc
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/include/gmock/=
gmock-matchers.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/BenchmarkCode.h
/usr/src/debug/llvm/21.1.8/llvm/include/llvm/ADT/CombinationGenerator.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/RISCV/Target.cpp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/RISCV/RISCVExeges=
isPreprocessing.cpp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/ParallelSnippetGe=
nerator.cpp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SubprocessMemory.=
h
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/include/gmock/=
gmock-cardinalities.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SchedClassResolut=
ion.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/RegisterValue.h
      /usr/src/debug/llvm/21.1.8/llvm/include/llvm/ADT/PackedVector.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/RegisterAliasing.=
cpp
      /usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/wasm2yaml.cpp
      /usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/xcoff2yaml.cpp
      /usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/elf2yaml.cpp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/PowerPC/Target.cp=
p
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
gtest-death-test.h
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
gtest-test-part.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SnippetFile.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/RegisterAliasing.=
h
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/src/gmock-inte=
rnal-utils.cc
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/PerfHelper.h
      /usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/archive2yaml.cpp
/usr/src/debug/llvm/21.1.8/third-party/unittest/UnitTestMain/TestMain.cpp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SerialSnippetGene=
rator.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/BenchmarkRunner.c=
pp
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest-inte=
rnal-inl.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SnippetRepetitor.=
h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/AArch64/Target.cp=
p
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/ResultAggregator.=
h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/ValidationEvent.c=
pp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Analysis.cpp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/ParallelSnippetGe=
nerator.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/RISCV/RISCVExeges=
isPasses.h
      /usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/obj2yaml.h
      /usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Target.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/UopsBenchmarkRunn=
er.cpp
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest-type=
d-test.cc
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/CodeTemplate.h
      /usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Target.cpp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/UopsBenchmarkRunn=
er.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/LatencyBenchmarkR=
unner.h
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest-test=
-part.cc
/usr/src/debug/llvm/21.1.8/llvm/include/llvm/Support/raw_os_ostream.h
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/src/gmock-spec=
-builders.cc
      /usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Error.cpp
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
gtest-matchers.h
/usr/src/debug/llvm/21.1.8/lib/Target/AArch64/AArch64GenExegesis.inc
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SnippetGenerator.=
cpp
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest-matc=
hers.cc
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/DisassemblerHelpe=
r.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/X86/Target.cpp
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
gtest-printers.h
      /usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/offload2yaml.cpp
      /usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/dxcontainer2yaml.cpp
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
gtest-message.h
      /usr/src/debug/llvm/21.1.8/lib/Target/X86/X86GenExegesis.inc
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest-asse=
rtion-result.cc
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/RISCV/RISCVExeges=
isPostprocessing.cpp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Assembler.h
      /usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Analysis.h
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest-port=
.cc
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
internal/gtest-port.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/TargetSelect.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/MCInstrDescView.c=
pp
      /usr/src/debug/llvm/21.1.8/llvm/lib/Testing/Support/Error.cpp
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
internal/gtest-internal.h
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
internal/gtest-filepath.h
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
internal/custom/raw-ostream.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SubprocessMemory.=
cpp
      /usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/obj2yaml.cpp
      /usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/minidump2yaml.cpp
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/src/gmock-matc=
hers.cc
      /usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Error.h
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/include/gmock/=
internal/gmock-internal-utils.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/LlvmState.h
      /usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/dwarf2yaml.cpp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/MCInstrDescView.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/BenchmarkResult.c=
pp
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest-file=
path.cc
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SerialSnippetGene=
rator.cpp
/usr/src/debug/llvm/21.1.8/llvm/lib/Testing/Annotations/Annotations.cpp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SnippetRepetitor.=
cpp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Assembler.cpp
      /usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Clustering.=
h
      /usr/src/debug/llvm/21.1.8/include/llvm/Config/TargetExegesis.def
      /usr/src/debug/llvm/21.1.8/llvm/tools/yaml2obj/yaml2obj.cpp
      /usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Mips/Target=
.cpp
      /usr/src/debug/llvm/21.1.8/lib/Target/RISCV/RISCVGenExegesis.inc
      /usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/coff2yaml.cpp
      /usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/CodeTemplat=
e.cpp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/ProgressMeter.h
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/src/gmock.cc
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/include/gmock/=
gmock.h
      /usr/src/debug/llvm/21.1.8/llvm/tools/obj2yaml/macho2yaml.cpp
      /usr/src/debug/llvm/21.1.8/lib/Target/Mips/MipsGenExegesis.inc
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SnippetGenerator.=
h
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/src/gmock-card=
inalities.cc
      /usr/src/debug/llvm/21.1.8/lib/Target/PowerPC/PPCGenExegesis.inc
      /usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/llvm-exegesis.c=
pp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/LatencyBenchmarkR=
unner.cpp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SchedClassResolut=
ion.cpp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/SnippetFile.cpp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/LlvmState.cpp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/BenchmarkResult.h
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest-deat=
h-test.cc
/usr/src/debug/llvm/21.1.8/third-party/unittest/googlemock/include/gmock/=
gmock-spec-builders.h
/usr/src/debug/llvm/21.1.8/llvm/lib/Testing/Support/SupportHelpers.cpp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/ValidationEvent.h
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
gtest.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/Clustering.cpp
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
internal/gtest-param-util.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/RegisterValue.cpp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/BenchmarkRunner.h
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/src/gtest-prin=
ters.cc
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
gtest-assertion-result.h
/usr/src/debug/llvm/21.1.8/third-party/unittest/googletest/include/gtest/=
internal/gtest-death-test-internal.h
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/ResultAggregator.=
cpp
/usr/src/debug/llvm/21.1.8/llvm/tools/llvm-exegesis/lib/PerfHelper.cpp&qu=
ot;<br>
      packages/x86-64-v3-oe-linux/llvm/llvm-src: PKGSIZE changed from
      406369891 to 408360607 (+0%)<br>
      packages/x86-64-v3-oe-linux/llvm/llvm-staticdev: FILELIST: added
      &quot;/usr/lib/libllvm_gtest_main.a
      /usr/lib/libLLVMTestingAnnotations.a
      /usr/lib/libLLVMExegesisMips.a /usr/lib/libLLVMExegesis.a
      /usr/lib/libLLVMTestingSupport.a /usr/lib/libLLVMExegesisPowerPC.a
      /usr/lib/libLLVMExegesisX86.a /usr/lib/libLLVMExegesisAArch64.a
      /usr/lib/libllvm_gtest.a /usr/lib/libLLVMExegesisRISCV.a&quot;<br>
      packages/x86-64-v3-oe-linux/llvm/llvm-staticdev: PKGSIZE changed
      from 639292726 to 646763728 (+1%)<br>
      Changes to packages/x86-64-v3-oe-linux/llvm (sysroot):<br>
      &nbsp; /usr/bin/bugpoint was added<br>
      &nbsp; /usr/bin/count was added<br>
      &nbsp; /usr/bin/dsymutil was added<br>
      &nbsp; /usr/bin/FileCheck was added<br>
      &nbsp; /usr/bin/llc was added<br>
      &nbsp; /usr/bin/lli was added<br>
      &nbsp; /usr/bin/lli-child-target was added<br>
      &nbsp; /usr/bin/llvm-addr2line was added<br>
      &nbsp; /usr/bin/llvm-ar was added<br>
      &nbsp; /usr/bin/llvm-as was added<br>
      &nbsp; /usr/bin/llvm-bcanalyzer was added<br>
      &nbsp; /usr/bin/llvm-bitcode-strip was added<br>
      &nbsp; /usr/bin/llvm-cat was added<br>
      &nbsp; /usr/bin/llvm-cfi-verify was added<br>
      &nbsp; /usr/bin/llvm-cgdata was added<br>
      &nbsp; /usr/bin/llvm-config was added<br>
      &nbsp; /usr/bin/llvm-cov was added<br>
      &nbsp; /usr/bin/llvm-c-test was added<br>
      &nbsp; /usr/bin/llvm-ctxprof-util was added<br>
      &nbsp; /usr/bin/llvm-cvtres was added<br>
      &nbsp; /usr/bin/llvm-cxxdump was added<br>
      &nbsp; /usr/bin/llvm-cxxfilt was added<br>
      &nbsp; /usr/bin/llvm-cxxmap was added<br>
      &nbsp; /usr/bin/llvm-debuginfo-analyzer was added<br>
      &nbsp; /usr/bin/llvm-debuginfod was added<br>
      &nbsp; /usr/bin/llvm-debuginfod-find was added<br>
      &nbsp; /usr/bin/llvm-diff was added<br>
      &nbsp; /usr/bin/llvm-dis was added<br>
      &nbsp; /usr/bin/llvm-dlang-demangle-fuzzer was added<br>
      &nbsp; /usr/bin/llvm-dlltool was added<br>
      &nbsp; /usr/bin/llvm-dwarfdump was added<br>
      &nbsp; /usr/bin/llvm-dwarfutil was added<br>
      &nbsp; /usr/bin/llvm-dwp was added<br>
      &nbsp; /usr/bin/llvm-exegesis was added<br>
      &nbsp; /usr/bin/llvm-extract was added<br>
      &nbsp; /usr/bin/llvm-gsymutil was added<br>
      &nbsp; /usr/bin/llvm-ifs was added<br>
      &nbsp; /usr/bin/llvm-install-name-tool was added<br>
      &nbsp; /usr/bin/llvm-isel-fuzzer was added<br>
      &nbsp; /usr/bin/llvm-itanium-demangle-fuzzer was added<br>
      &nbsp; /usr/bin/llvm-jitlink was added<br>
      &nbsp; /usr/bin/llvm-jitlink-executor was added<br>
      &nbsp; /usr/bin/llvm-lib was added<br>
      &nbsp; /usr/bin/llvm-libtool-darwin was added<br>
      &nbsp; /usr/bin/llvm-link was added<br>
      &nbsp; /usr/bin/llvm-lipo was added<br>
      &nbsp; /usr/bin/llvm-lit was added<br>
      &nbsp; /usr/bin/llvm-locstats was added<br>
      &nbsp; /usr/bin/llvm-lto was added<br>
      &nbsp; /usr/bin/llvm-lto2 was added<br>
      &nbsp; /usr/bin/llvm-mc was added<br>
      &nbsp; /usr/bin/llvm-mca was added<br>
      &nbsp; /usr/bin/llvm-microsoft-demangle-fuzzer was added<br>
      &nbsp; /usr/bin/llvm-ml was added<br>
      &nbsp; /usr/bin/llvm-ml64 was added<br>
      &nbsp; /usr/bin/llvm-modextract was added<br>
      &nbsp; /usr/bin/llvm-mt was added<br>
      &nbsp; /usr/bin/llvm-nm was added<br>
      &nbsp; /usr/bin/llvm-objcopy was added<br>
      &nbsp; /usr/bin/llvm-objdump was added<br>
      &nbsp; /usr/bin/llvm-opt-fuzzer was added<br>
      &nbsp; /usr/bin/llvm-opt-report was added<br>
      &nbsp; /usr/bin/llvm-otool was added<br>
      &nbsp; /usr/bin/llvm-pdbutil was added<br>
      &nbsp; /usr/bin/llvm-PerfectShuffle was added<br>
      &nbsp; /usr/bin/llvm-profdata was added<br>
      &nbsp; /usr/bin/llvm-profgen was added<br>
      &nbsp; /usr/bin/llvm-ranlib was added<br>
      &nbsp; /usr/bin/llvm-rc was added<br>
      &nbsp; /usr/bin/llvm-readelf was added<br>
      &nbsp; /usr/bin/llvm-readobj was added<br>
      &nbsp; /usr/bin/llvm-readtapi was added<br>
      &nbsp; /usr/bin/llvm-reduce was added<br>
      &nbsp; /usr/bin/llvm-remarkutil was added<br>
      &nbsp; /usr/bin/llvm-rtdyld was added<br>
      &nbsp; /usr/bin/llvm-rust-demangle-fuzzer was added<br>
      &nbsp; /usr/bin/llvm-sim was added<br>
      &nbsp; /usr/bin/llvm-size was added<br>
      &nbsp; /usr/bin/llvm-special-case-list-fuzzer was added<br>
      &nbsp; /usr/bin/llvm-split was added<br>
      &nbsp; /usr/bin/llvm-stress was added<br>
      &nbsp; /usr/bin/llvm-strings was added<br>
      &nbsp; /usr/bin/llvm-strip was added<br>
      &nbsp; /usr/bin/llvm-symbolizer was added<br>
      &nbsp; /usr/bin/llvm-tblgen was added<br>
      &nbsp; /usr/bin/llvm-test-mustache-spec was added<br>
      &nbsp; /usr/bin/llvm-tli-checker was added<br>
      &nbsp; /usr/bin/llvm-undname was added<br>
      &nbsp; /usr/bin/llvm-windres was added<br>
      &nbsp; /usr/bin/llvm-xray was added<br>
      &nbsp; /usr/bin/llvm-yaml-numeric-parser-fuzzer was added<br>
      &nbsp; /usr/bin/llvm-yaml-parser-fuzzer was added<br>
      &nbsp; /usr/bin/not was added<br>
      &nbsp; /usr/bin/obj2yaml was added<br>
      &nbsp; /usr/bin/opt was added<br>
      &nbsp; /usr/bin/reduce-chunk-list was added<br>
      &nbsp; /usr/bin/sancov was added<br>
      &nbsp; /usr/bin/sanstats was added<br>
      &nbsp; /usr/bin/split-file was added<br>
      &nbsp; /usr/bin/UnicodeNameMappingGenerator was added<br>
      &nbsp; /usr/bin/verify-uselistorder was added<br>
      &nbsp; /usr/bin/yaml2obj was added<br>
      &nbsp; /usr/bin/yaml-bench was added<br>
      &nbsp; /usr/include/llvm-gmock was added<br>
      &nbsp; /usr/include/llvm-gmock/gmock was added<br>
      &nbsp; /usr/include/llvm-gmock/gmock/gmock-actions.h was added<br>
      &nbsp; /usr/include/llvm-gmock/gmock/gmock-cardinalities.h was adde=
d<br>
      &nbsp; /usr/include/llvm-gmock/gmock/gmock-function-mocker.h was ad=
ded<br>
      &nbsp; /usr/include/llvm-gmock/gmock/gmock.h was added<br>
      &nbsp; /usr/include/llvm-gmock/gmock/gmock-matchers.h was added<br>
      &nbsp; /usr/include/llvm-gmock/gmock/gmock-more-actions.h was added=
<br>
      &nbsp; /usr/include/llvm-gmock/gmock/gmock-more-matchers.h was adde=
d<br>
      &nbsp; /usr/include/llvm-gmock/gmock/gmock-nice-strict.h was added<=
br>
      &nbsp; /usr/include/llvm-gmock/gmock/gmock-spec-builders.h was adde=
d<br>
      &nbsp; /usr/include/llvm-gmock/gmock/internal was added<br>
      &nbsp; /usr/include/llvm-gmock/gmock/internal/custom was added<br>
      &nbsp;
      /usr/include/llvm-gmock/gmock/internal/custom/gmock-generated-actio=
ns.h
      was added<br>
      &nbsp; /usr/include/llvm-gmock/gmock/internal/custom/gmock-matchers=
.h
      was added<br>
      &nbsp; /usr/include/llvm-gmock/gmock/internal/custom/gmock-port.h w=
as
      added<br>
      &nbsp; /usr/include/llvm-gmock/gmock/internal/custom/README.md was
      added<br>
      &nbsp; /usr/include/llvm-gmock/gmock/internal/gmock-internal-utils.=
h
      was added<br>
      &nbsp; /usr/include/llvm-gmock/gmock/internal/gmock-port.h was adde=
d<br>
      &nbsp; /usr/include/llvm-gmock/gmock/internal/gmock-pp.h was added<=
br>
      &nbsp; /usr/include/llvm-gtest was added<br>
      &nbsp; /usr/include/llvm-gtest/gtest was added<br>
      &nbsp; /usr/include/llvm-gtest/gtest/gtest-assertion-result.h was a=
dded<br>
      &nbsp; /usr/include/llvm-gtest/gtest/gtest-death-test.h was added<b=
r>
      &nbsp; /usr/include/llvm-gtest/gtest/gtest.h was added<br>
      &nbsp; /usr/include/llvm-gtest/gtest/gtest-matchers.h was added<br>
      &nbsp; /usr/include/llvm-gtest/gtest/gtest-message.h was added<br>
      &nbsp; /usr/include/llvm-gtest/gtest/gtest-param-test.h was added<b=
r>
      &nbsp; /usr/include/llvm-gtest/gtest/gtest_pred_impl.h was added<br=
>
      &nbsp; /usr/include/llvm-gtest/gtest/gtest-printers.h was added<br>
      &nbsp; /usr/include/llvm-gtest/gtest/gtest_prod.h was added<br>
      &nbsp; /usr/include/llvm-gtest/gtest/gtest-spi.h was added<br>
      &nbsp; /usr/include/llvm-gtest/gtest/gtest-test-part.h was added<br=
>
      &nbsp; /usr/include/llvm-gtest/gtest/gtest-typed-test.h was added<b=
r>
      &nbsp; /usr/include/llvm-gtest/gtest/internal was added<br>
      &nbsp; /usr/include/llvm-gtest/gtest/internal/custom was added<br>
      &nbsp; /usr/include/llvm-gtest/gtest/internal/custom/gtest.h was ad=
ded<br>
      &nbsp; /usr/include/llvm-gtest/gtest/internal/custom/gtest-port.h w=
as
      added<br>
      &nbsp; /usr/include/llvm-gtest/gtest/internal/custom/gtest-printers=
.h
      was added<br>
      &nbsp; /usr/include/llvm-gtest/gtest/internal/custom/raw-ostream.h =
was
      added<br>
      &nbsp; /usr/include/llvm-gtest/gtest/internal/custom/README.md was
      added<br>
      &nbsp;
      /usr/include/llvm-gtest/gtest/internal/gtest-death-test-internal.h
      was added<br>
      &nbsp; /usr/include/llvm-gtest/gtest/internal/gtest-filepath.h was
      added<br>
      &nbsp; /usr/include/llvm-gtest/gtest/internal/gtest-internal.h was
      added<br>
      &nbsp; /usr/include/llvm-gtest/gtest/internal/gtest-param-util.h wa=
s
      added<br>
      &nbsp; /usr/include/llvm-gtest/gtest/internal/gtest-port-arch.h was
      added<br>
      &nbsp; /usr/include/llvm-gtest/gtest/internal/gtest-port.h was adde=
d<br>
      &nbsp; /usr/include/llvm-gtest/gtest/internal/gtest-string.h was ad=
ded<br>
      &nbsp; /usr/include/llvm-gtest/gtest/internal/gtest-type-util.h was
      added<br>
      &nbsp; /usr/lib/libLLVMExegesis.a was added<br>
      &nbsp; /usr/lib/libLLVMExegesisAArch64.a was added<br>
      &nbsp; /usr/lib/libLLVMExegesisMips.a was added<br>
      &nbsp; /usr/lib/libLLVMExegesisPowerPC.a was added<br>
      &nbsp; /usr/lib/libLLVMExegesisRISCV.a was added<br>
      &nbsp; /usr/lib/libLLVMExegesisX86.a was added<br>
      &nbsp; /usr/lib/libllvm_gtest.a was added<br>
      &nbsp; /usr/lib/libllvm_gtest_main.a was added<br>
      &nbsp; /usr/lib/libLLVMTestingAnnotations.a was added<br>
      &nbsp; /usr/lib/libLLVMTestingSupport.a was added<br>
      Changes to packages/x86_64-linux/llvm-native (sysroot):<br>
      &nbsp; /usr/bin/llvm-exegesis was added<br>
      &nbsp; /usr/lib/libLLVMExegesis.a was added<br>
      &nbsp; /usr/lib/libLLVMExegesisAArch64.a was added<br>
      &nbsp; /usr/lib/libLLVMExegesisMips.a was added<br>
      &nbsp; /usr/lib/libLLVMExegesisPowerPC.a was added<br>
      &nbsp; /usr/lib/libLLVMExegesisRISCV.a was added<br>
      &nbsp; /usr/lib/libLLVMExegesisX86.a was added<br>
      <br>
      <br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20260220060252.77248-1-Deepesh.=
Varatharajan@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Deepesh Varatharajan (4):
  clang-tools-extra: disable tests
  clang: Enable cmake flags for llvm, clang, lld tests
  oeqa/selftest/clang: Add oe-seltests for Clang/LLVM/LLD
  rust: Fix rust build failure

 meta/lib/oeqa/selftest/cases/clang.py         | 298 ++++++++++++++++++
 .../0042-guard-clang-tools-extra-test.patch   |  74 +++++
 meta/recipes-devtools/clang/clang_git.bb      |   2 +
 meta/recipes-devtools/clang/common.inc        |   1 +
 meta/recipes-devtools/clang/lld_git.bb        |   2 +
 meta/recipes-devtools/clang/llvm_git.bb       |   8 +-
 meta/recipes-devtools/rust/rust_1.93.0.bb     |   5 +-
 7 files changed, 387 insertions(+), 3 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/clang.py
 create mode 100644 meta/recipes-devtools/clang/clang/0042-guard-clang-to=
ols-extra-test.patch

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------Z0ns9g5uOQLvJQGJSCaJiM6J--

