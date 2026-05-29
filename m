Return-Path: <Quan.Sun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF0BCD6E49
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 16:11:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14246.1780071050569896129
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 09:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=N7uW1shd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0609d6bc0d=quan.sun@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDjTE5317504
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 09:10:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=KlFw988l/OjS2DAyE7XZvshkePgxa5rDf/3sB1p3Hus=; b=
	N7uW1shdYGfputgN7o53HP5mVXr0UT2tB6gTjDzEdzD60uVA7Eh6KlD99oI0cfPV
	/Eur7WZ6nw/frcn1u7v6t/phtBM7l4rY/trD2nMsT33/hPpbRjfZR45j45+VCycu
	0UzSEzugzFGhwTHlI7IRYZ70ZAEDOKs/R+Xl7xHCn7pXjYSNVVRbJGowGq9riBZe
	Tu/DGfSrcqN02R/MGaoDuH4NYx06UYFyjot/PxNBrmo3L9LnO18rYs13+jvhM0na
	1T40QFg41qNEt+Q3QHSomWTG+IAx6laLi7r+L+HuGE9qp6eMaxmy3Cl2geK9WGtz
	UuRZSTMuZyN67XtkaPKyiA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010068.outbound.protection.outlook.com [52.101.85.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x6trrx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 09:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tggIdyGzyphZwHcTeo4+PrxN2fMCyc5/utpHvmfA+17hN93SBAelWFdt74ffOw1H8AUy3VsaZj9VfNDnnhyaHFms324cJbSqwLJI3qVrAIR2C8R3ClnZLjWh6F0Whu9fn+Uad72VscDaPGz1UaZht2YlOR0TBIr969Ruu5KiT8qcA72kG0E8GE2aR2y4Vt0tSg5e+FxhaYxjbGhSs+nQCquYG7RjdSIziNrvY7+1kVYPGuzn5fRCZZdUUev5GfQQxzi8pz/3tyMZ1uygYImQ5h85UDPrdU/IvMhq6Kwp36793Q9ACd7fnJkYZvJKoLdJhauKmoNsTNgxOwPmkQXddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlFw988l/OjS2DAyE7XZvshkePgxa5rDf/3sB1p3Hus=;
 b=tSzUPL5XTmxoOfJkDEWfRgiGB2zlJEO7k9bygySqjrRFWZKfJmZRKzUlzjwF4wRwX5STTycdVwj8b9f+LtaNvOyRaM4fUaxOR2OQtEMHn+ceUMR+zPSoLG+igA0NWLugMyAs4xro/D/3fy7ygTwcBfq3352cmIX2GF+sDG16DaVhCVh488lvfwfou+AkR6bAp6VjJV3PGzgNK/12T+IFskeKkRflPzr5UWt4VGN0fGFSfI5J8ofmm5QWKUg91VUq5optnfu2yi89gpbxb6c0wgsLmeQbUyXu5+mWW2ZV2XfLKKnJZTrUZuZVWy4GvqiXErMroCOyj7M++inDSq6i+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 by CH8PR11MB9482.namprd11.prod.outlook.com (2603:10b6:610:2bf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 16:10:45 +0000
Received: from IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8]) by IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8%3]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 16:10:45 +0000
Message-ID: <3bde2ef8-5565-4495-9904-dd3db839de1d@windriver.com>
Date: Fri, 29 May 2026 12:10:43 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        alex.kanavin@gmail.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com>
 <be287797-1941-4afa-8aef-b015ca194476@windriver.com>
 <CANNYZj8gMc8PdWMse=g1J7goZC5Ga=nwN5hA+uX02-G+LNHEwQ@mail.gmail.com>
 <7da33301e8a0bae93a33695b4fd41f67a08e1b9f.camel@linuxfoundation.org>
Content-Language: en-US
From: Quan Sun <Quan.Sun@windriver.com>
In-Reply-To: <7da33301e8a0bae93a33695b4fd41f67a08e1b9f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: YQBPR01CA0084.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::20) To IA0PR11MB7283.namprd11.prod.outlook.com
 (2603:10b6:208:439::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7283:EE_|CH8PR11MB9482:EE_
X-MS-Office365-Filtering-Correlation-Id: d1cd4699-a4de-46b6-f7cd-08debd9cd6d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099006|6133799003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	nhJRWBjIVG31H1Rpe9rCiBhMxFXMtDT5cg2geYCQl8XpQrNeuf19z8SGgdRZZB5ArRukK8oRGQxRUnQpF54UaDCjclTP6WpBLQ1+OIaUh/FOQcDwFwK95z3Vf74JXAyJt1WIaY09k1l09Bz4bWLhDsLX0BQctB/t1GLc0tddnyRf/gUFtYg/TPVRpyMX+KwzZEwzRmN8nIWJrbSvyZGGYKq6WAwtmmX6Ll6M6D1c12V9wW68T5VKqpFCs/1Nm+bNFegwdWRAZYQLyd39hG+eUYMFyoCooVQtB5bJdZS9E/+O3usUoCNI8TaweMwwrJBrFUuf3ekN60HldH8YCLMWITK2ORNk94EAFbuWFTnkewKEvJEVKf68MpihbCpvDIlGHY88Nx70WeO3/TelA9JFfxBRuuxYaa2Zmx1NFyZFlmnFeBdx3TVjEJ8siTiuZFzLJWppBkzlYqxXkNoUyoiqgHs+wwMjbZbTu+VA9maOoH0CqzHOkcv6u0zfodzdUgT5LevhDaXJCfqG5M0cBIOk9+84rkV2v0hEkwgc4Y7M418+eJJTXsB0am0C+0tcSZKhjXxlLurTELrG0UI8AXmxyALsJTWByXM3I4xlc2iEs4W6r3ZqxIGlAqSyYztEAS6lDzWETjG76b7RLW9TCgtqDw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(6133799003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OS9OTEgzN3BrSE8wUEJzRGZRM2NJemtqbi80TDBHZ2lqblcxRXhTcjV6TWd4?=
 =?utf-8?B?YXlOTCtaZGxXT1ZDQis3b0NOYlM2SVgyM3ZtQkNlNzZWSU1lUitwVnlzblZh?=
 =?utf-8?B?MXpVQ1lhOXFBQW9SaitGNnA0dWk3L0JyQmdMeTJmZzkxbnpWOG1sZHFYWVFz?=
 =?utf-8?B?d040eCtWOGo2TEtaTEc3ZGVlNWtNVFJaalhOOEJaRTBLamJoOVVXamhEL2Nn?=
 =?utf-8?B?UWtGdE1ZQkJSZHFtWkkxZHhjYnRrQTlBTFRpZGxucGlQYTUwVHVCdlQ2VjFu?=
 =?utf-8?B?UVdBVTZXQ1gvQitBWGk3RU9odTJYNExEcWJyclhaT3Y1eDlxK242eTRRTE1p?=
 =?utf-8?B?dmlGSlFBbEZQblB1RGRKZ2hmelNxN3NHVFFHamJyV3Q0UVZhWUlSNnFGc2Zh?=
 =?utf-8?B?ckx5dStHZXVjMUdNN2xVeUhabVgvR3hkQjA0VkNXcERFbUF3L0QwRlNDelpT?=
 =?utf-8?B?T0w5K1dOUVVVaDBvWWlSd25KMGVFS3MzTlcwMk8ycVFOU1VoaUpaMVRhTTcz?=
 =?utf-8?B?VWFsQnltZEZ6TndzSUxMb3FKMzczWGlJWWVBRzAwV1JkVS9LSXNUM3NRNnhn?=
 =?utf-8?B?dnMxaXpjT3B3dWdGTngrYU5WYWxFanI4WVY0bFpXRDhpeGM4VXhnRVVUaldo?=
 =?utf-8?B?YWZ4cmxxU3YzVFpoKzROaGRlTGFUYm8xa2dqYzY0a0E5ZnBidzRsQ2lLQjNP?=
 =?utf-8?B?R0R5eFltWlhoZllkNFpNdkQwVmtKOU5QZEEwbzB1bnNzU2duNnZ5L1ovUHRQ?=
 =?utf-8?B?VHJJRUNySGJVREd1OHJXQkpicU13TkMzVkRXa3AxNS85TWpZYmpIVnBwTUxI?=
 =?utf-8?B?cHNzV3ZJYUVvVmVieWFFd1F5cWtoZkVRWmgwNVlZdmNDdXl5Y2dkWnpVMktv?=
 =?utf-8?B?bjZFZ2lKMnRaeWswSHdXWVFDcDErb3A3c2xrMUVTQUhiQ0F5WXZGZFFUVmdt?=
 =?utf-8?B?bi84TG5uTVd4c3d1MUk3R0VBdU56VzgvT2I5RDgwQmQ5aG1FdzJxZTllZmRy?=
 =?utf-8?B?Yk1GbTM5b1R0b1lHbXhqbm1CVE1XM3ZOeE9ZbmpURG9uRWRZZ05QZDR4MjRO?=
 =?utf-8?B?VTNuaTY4N2ZoTlA0aG1YS3Z3dzRHMkg3cEUxTkgrYkVYd3JmdE1LUGNTK2Ji?=
 =?utf-8?B?N1EweE1EQkJXM0MwSTBLWmlNb0FZaHFGSU5ZWnpFTE52c0VsMWRkZlJyOEhr?=
 =?utf-8?B?cS9tM0xXTzlBZGdCQ0RqdGFwZmZmNWExcmNEVU5IdGluV0cyKzRnUmJLMEt5?=
 =?utf-8?B?aEs1VmV5VUFCZGVrRUZGWkRuRnI1MEZRLzE1cm54K0tUbUxycE1UYmRjTjZD?=
 =?utf-8?B?UmpLK0ZDeVFHY1IrMVFuWnVqU1NrOWNaVkNhQUtIaHltVVJ2ZXdsTzBkSWRs?=
 =?utf-8?B?WFNRUTNKUUJQVlcrZ3l0VGZ1T3JQUllDZkZ0RHFuOHZIRGxCNjhpSHFiQURv?=
 =?utf-8?B?T0Z5a1h2Ui95OE5HV0wrbXdHQ2hlMVpqS21iazMrbkpTek9wd0hXbm13allC?=
 =?utf-8?B?ckN3cVkwdXB3MjJhMmJ0UndYazgvMUliY0ZiWm9vRWNLamk2bkNaVHE3UGNr?=
 =?utf-8?B?UGRPWm5KSTJZcUUyVVhHNE9MbkwwbDV1ajNNbkRRSkdsbVRDcko5TFd0NVZK?=
 =?utf-8?B?VU1kdWJtaTJCbUF6TnJJSlpnUXlpQXhsYWlXNTY5NkNRa01Ld2N6c21GdFl3?=
 =?utf-8?B?Y0FBazlRQi9kOFlaUm91MDJhZk5RSERJbVMwakRvZ1ZuMnlhNUZISnpnWFhL?=
 =?utf-8?B?WTJjWTlBRS9nMnFtSTkwdUYzMEVlT3JJMEEyaEpCQmZzZVUvZllhb1h4SnVx?=
 =?utf-8?B?blc2KzFuREQyYVAyNVpER0dDQW9Yeng4cWd6a3llWDdPTmMrYkw1VU4wOUZz?=
 =?utf-8?B?cGNVZEZ1Q2hRMzRudXBINTJsK2I4Q2pOUGFMQVQ0MlVyUStjSlRKdWRHUGJW?=
 =?utf-8?B?eWpERlFkdGROWWdDc3RXbGp6VWJYWTBMc2xxOTBwcms1dkd6VDg3YWFxQ1Ev?=
 =?utf-8?B?OVI1eVp0WFhmaHdkT1hTTU0vT1lTYlRPTDJPUXVJb2dwaDRPc0FJcUYrUVFQ?=
 =?utf-8?B?VWJhRjA4RldqWjNaa2tUYnhubmNSM1d1RkFXaUNOdWVNdnRxR3IzRW94ZnFX?=
 =?utf-8?B?OTN0eVNGWTgyS0VmMWx1M0dDT2JIcnljLzN2OGxoRngzWWIzclRzT1JvbHEv?=
 =?utf-8?B?Wlh4MnFlWVRvdlNQRHlIZytqMWVSSWdxQUZ0R1FGaGRRY1VZRUhSZFRxemVH?=
 =?utf-8?B?TGNQVVlnWXlac0V4cDhTYU1JMnJ4L3hjbWgyb2hUNGJBamlYQ0tzNXpHWW9R?=
 =?utf-8?B?S1owQXQvbEhjYjlUQUt5VFZwaU81dVBSeE1Va2l2UFo5TGIwUlIvQT09?=
X-Exchange-RoutingPolicyChecked: 
	Jz6IORj3Bvr4dXEtxU+pp1ewrMjVT0Kg4HG2kEMoDH54I4omqyncgg7mN9FOw+vs6s27PrGnbzC+v1Dca/WGco2p9MsxDup2HHObAubOV061oMisCTEp2E1SzA5Fgub8FkJMbAvACyva95eZrdyn6CjPUzCtDTw726V/lElb/GC+VgjOwEMvtqIqXzBwFO9LiRnBA6LjgcI3C4fvf6xgDACTup7zkCzNkKxz/QE/fKRB0JQHe7YIbTJ2LXFy6ys9mAUht4HstMqynlULtfqol795AjJ8fsoRBLkB9KAb+o/l0hUC/zsKyN5AAV+4klfrGuczob8lNWOHRq+UcNJvwA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1cd4699-a4de-46b6-f7cd-08debd9cd6d0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 16:10:45.2227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aakIIdIvShkFfjtCFs26MclEu14zINbg1m/Jm6w796sqXe2jInIbIJ0TdwkjYQLeWkGeoH9FX8I4NHxRmiEUtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9482
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: BVGt_MT0fcx0jXINESaC5lCnSOU2D-zf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE2MiBTYWx0ZWRfX0J1TbQK/m4WE
 ygfZpAscsRlcJ1wcS515ywYFSyGZ9N67lr1h83N7qwEndp4NT97x2PMqsF5zwMKwAxd19HJeGnw
 LCg7RO6Pd2Jmc5IjlWEnIjwNTZ3ZINekkgeI+hMI81LiDig0//aaP1PmjrsKZeG+kU+48JtMxQY
 91pRtFfhmCrvvUFmr+5YlPB2C5ABxhZei+rZzp2vkGHwwxcTEWsn4NXguOmp4w4LRwMPN1bWA7f
 Rp9d3ic1e64yqC/SV9VRV8aYerMMjis9zIN1EfW05J27E6Fl64Lt156/qwc33K6rSjN9DXeeQca
 XrLDP8/WRaQbroP1LiSp5x8DdGFLGsZSnmHB9vuxJpHIQ4mkO21RubAU5Ww//AqZgj2njqXWcpu
 VGjboE74GH6RhI5nLteYLl47S4n6qmGgGPKYNQxVdP+dJeWc0ruWSS6fMo5OFIBsHkVedseKezC
 in+f5LdFdaW9qNyuUUQ==
X-Proofpoint-ORIG-GUID: Hb4qMUdZc44P_Gelq_jbeGcOFC3PMWX1
X-Authority-Analysis: v=2.4 cv=FcEHAp+6 c=1 sm=1 tr=0 ts=6a19ba89 cx=c_pps
 a=wv7XMN/IKY0/lkzoMchZCw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=5ILErrrWTQhk08MLmfEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290162
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64TDjTE5317504
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 16:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237764


On 5/29/26 11:49 AM, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 2026-05-29 at 17:23 +0200, Alexander Kanavin via
> lists.openembedded.org wrote:
>> On Fri, 29 May 2026 at 16:45, Quan Sun via lists.openembedded.org
>> <Quan.Sun=3Dwindriver.com@lists.openembedded.org> wrote:
>>>> glx: failed to create dri3 screen
>>>> failed to load driver: vgem
>>>>
>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3=
924
>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3=
786
>>>>
>>>> Can you have a look at the issue?
>>> It seems this issue is not caused by the qemu upgrade. I also asked
>>> an
>>> AI agent to carefully examine the build/test logs, and the
>>> following is
>>> what it says:
>> Unfortunately AI has produced a total hallucination in its analysis,
>> because it looks only at the build log given to it, not at the actual
>> change that is being tested (e.g. it wouldn't see in that log that
>> there is a qemu update, and it wouldn't go and analyse the qemu own
>> changelog and commit history, and it wouldn't run the same test
>> against qemu 10.x to narrow it down and so on).
>>
>> I went and tried this test with qemu 10.x on the same host, and it
>> passes just fine:
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/392=
8
>>
>> Then I cherry picked the qemu 11.x patch, and the test then fails:
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/393=
0
>>
>> It's still possible something is misconfigured on the host (it runs
>> tiger vnc standalone server to allow X clients such as qemu to render
>> into it), but the issue is clearly triggered by the version upgrade.
>
> I should add, I looked into a couple of the failures on the autobuilder
> and it appeared qemu is segfaulting after the upgrade. I'm fairly sure
> that is related to the upgrade as it doesn't do it before.
>
> Stack trace of thread 2714954:
>                                                        #0  0x00007fec63=
67b4f4 __pthread_mutex_lock@GLIBC_2.2.5 (libc.so.6 + 0x924f4)
>                                                        #1  0x00007fec60=
3c0f40 wl_proxy_create_wrapper (libwayland-client.so.0 + 0x8f40)
>                                                        #2  0x00007fec60=
182bc0 n/a (libEGL.so.1 + 0x2bbc0)
>                                                        #3  0x00007fec60=
17a4e0 n/a (libEGL.so.1 + 0x234e0)
>                                                        #4  0x00007fec60=
16aa9c eglInitialize (libEGL.so.1 + 0x13a9c)
>                                                        #5  0x00007fec64=
a89a8c n/a (libSDL2-2.0.so.0 + 0xbaa8c)
>                                                        #6  0x00007fec64=
a98226 n/a (libSDL2-2.0.so.0 + 0xc9226)
>                                                        #7  0x00007fec64=
a9ab19 n/a (libSDL2-2.0.so.0 + 0xcbb19)
>                                                        #8  0x0000558d31=
710aa4 n/a (qemu-system-x86_64 + 0x6acaa4)
>                                                        #9  0x0000558d31=
71224e n/a (qemu-system-x86_64 + 0x6ae24e)
>                                                        #10 0x0000558d31=
710732 n/a (qemu-system-x86_64 + 0x6ac732)
>                                                        #11 0x0000558d31=
64b554 n/a (qemu-system-x86_64 + 0x5e7554)
>                                                        #12 0x0000558d31=
3a8e59 n/a (qemu-system-x86_64 + 0x344e59)
>                                                        #13 0x00007fec63=
60efab __libc_start_call_main (libc.so.6 + 0x25fab)
>                                                        #14 0x00007fec63=
60f0cb __libc_start_main@@GLIBC_2.34 (libc.so.6 + 0x260cb)
>                                                        #15 0x0000558d31=
3aa015 n/a (qemu-system-x86_64 + 0x346015)
>
>
>                                                        Stack trace of t=
hread 2714967:
>                                                        #0  0x00007fec63=
680102 __syscall_cancel_arch (libc.so.6 + 0x97102)
>                                                        #1  0x00007fec63=
674fb8 __internal_syscall_cancel (libc.so.6 + 0x8bfb8)
>                                                        #2  0x00007fec63=
67529c __futex_abstimed_wait_common (libc.so.6 + 0x8c29c)
>                                                        #3  0x00007fec63=
6779a8 pthread_cond_wait@@GLIBC_2.3.2 (libc.so.6 + 0x8e9a8)
>                                                        #4  0x00007fec41=
996ff9 n/a (libgallium-26.0.6.so + 0x596ff9)
>                                                        #5  0x00007fec41=
c64ee3 n/a (libgallium-26.0.6.so + 0x864ee3)
>                                                        #6  0x00007fec41=
996f37 n/a (libgallium-26.0.6.so + 0x596f37)
>                                                        #7  0x00007fec63=
67832c start_thread (libc.so.6 + 0x8f32c)
>                                                        #8  0x00007fec63=
6f3b2c __clone3 (libc.so.6 + 0x10ab2c)
>
> [and more but probably not so interesting]
>
> so it is failing in eglInitialize().
>
> Cheers,
>
> Richard

Hi Richard,

This is likely a real QEMU 11.0 regression, but may not be in QEMU's=20
code itself.=C2=A0 The QEMU 11.0 likely changed its display initializatio=
n to=20
be multi-threaded or reordered it, triggering a race condition in the=20
host's Wayland/EGL/Mesa stack. Maybe setting SDL_VIDEODRIVER=3Dx11 could=20
solve the issue.

This issue is different from the "glx: failed to create dri3 screen /=20
failed to load driver: vgem error" seen earlier, which was a missing GPU=20
driver issue on the host.

If you have any detailed logs, please share with me and so I have more=20
contexts.

Thanks,

Quan


