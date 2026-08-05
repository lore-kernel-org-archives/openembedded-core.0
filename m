Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C4EC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 12:49:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39573.1785934161618767102
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 05:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VxoqONd3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=267792312e=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BvneF2009184
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Aug 2026 05:49:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=kbeux6SMn3McradXZZT6H9IhuwnLd7dK+bgZR8xkaLk=; b=
	VxoqONd3KzbmZZjRloURmPDrV5hyzyslLYysblgjujKTgntbUV3YjIv3dlgBPQp5
	jdbip4x+Y11ClMysf1oRghtugWIIqOCWL3hLUNF1++OcMyjYeaHJui+rFnkoytpF
	tvtlc4FXIWUTOlddk4qV4cSwUpPA6GFtn1IkNVGVDrPI7sLgUafiKPdpjI8JK8TV
	P4u6iMM0P0q8ZDyAwumskJ16t6Ghro5zJa7lGflbart0gwoQ/3+mZFQqn6y0V2mz
	0ptSlkvMlkhqsTaXfYLzb+n0UDmuxV4bmHEATPdiek047IuDEHI2QlZeQQKkNJLu
	BSEsJevFJYIUbKSmKPH3rA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012046.outbound.protection.outlook.com [40.93.195.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fsc31pqbp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 05:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsfYqtVi1WCl6VY7XVCudNy2mzPYsyH8q6qV7z+vIOr/1/QGzP9ukZQUxJ1v+udlzPhqROOm4vcQYsh1F2wX8PEN5nRV0CPBRSwJ1p7yxBXJNf2kC7BMAzSmTVrp+oqnYh1/rmEDYoN/EhNeDXB4FpPmtMJ6x879yYK3LS9wi1fsRkVaWDLeX3GISv5oV/ljlV6m6VMhaDJHvWy9x0jQ7LQqKmsG/t41JJwS39DI7ElqgNX5MKXNrcvSVKUJMOgxzH/N48p6BWwRiA5l/urXXe6g+ReFdP3xWHVDX4YF1VhfhLmCjHJrwz48lszAa2KxvHMhwFWvHNNofgHzx5igfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbeux6SMn3McradXZZT6H9IhuwnLd7dK+bgZR8xkaLk=;
 b=fGJN3xB/f9LUCeexIkYBHL4o8eJsq+fE0M0857eHq92ai6aXopls8vOD8huiUoaZcvyXyRMnOtDBcsxRoI08TG0BpA6sCKaSBcFzoylEPVWRZWH2O0fHH7wez/HGkX2JaKFswubr47f1Jg2KiD0oDlQH5So6g/0dVpH2t16lsXiI6up5/LR/3qyT4kL/LgwAnF+I9jxKO1F2S0aTLO1CrMKWRnc7fwGU6dx8uNQKpFs/i+ulMtg3hKrydDyrGZ16eRv7tkzQF9m9zWLgFFG0e5q8lKCDJTU25Qo1/Q65VRThZXYYGAD7lLWh8ATpGSvisekeAIuobylK0LquRA3eug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SA0PR11MB4655.namprd11.prod.outlook.com (2603:10b6:806:9d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 12:49:17 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 12:49:17 +0000
Message-ID: <97f32d03-044f-470e-937a-ec9a4724d785@windriver.com>
Date: Wed, 5 Aug 2026 18:19:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] packagegroups: add
 nativesdk-packagegroup-sdk-host-rust
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260717130109.2187282-1-Harish.Sadineni@windriver.com>
 <20260717130109.2187282-2-Harish.Sadineni@windriver.com>
 <151438b76ffe19c6ee5e28c446bfa29c3dde896b.camel@pbarker.dev>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <151438b76ffe19c6ee5e28c446bfa29c3dde896b.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0054.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::19) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SA0PR11MB4655:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e71e609-9e1c-4725-ab89-08def2eff5d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	2DjmgEpXqBQtZqkN5x4iYHKQOhLv8Lwg+yJLzEY/6ITEEHY41d1C6SsBw6X43goKs8nk+Ygt51amTJw3uexpnDnMfbkNNyPCnjMCHx7lcjdbFx9Dw3luL5ac58gEF6bQWjzzqXwmhj1g0M6m0pMMozXz3+ipF5QCaqbv9PCa1PDXMIBASZaErOhAVi8bkEL4Da7S+xred/NwFL62MFx9fGjAKQwv57XMt8nGmdZElbl5hrimBLI8inoON3i9eXEJ7H35GoJ6X5dAWVUrD2XkbJgHtjTBZjaUcDzxXWPxATMA6t2MQ8XPqpSR+L9T51ao6PptHqxPlwFaTJlQKnCtjo9j5z2dDp+gD9APkEQTr9GTV7wddTbtDBkqbsYb19wdfuK1FL7mFVQOVjA71rb9TaptZTo8/GiA6Bb+LQm3GLwP0sqAIS92+gUURcSxF2bOi0AhkY2e9rkK5JIXSfS7Gyq87dhj6Xy4ZeMMGCOxTs1poaAI3VXnM4F52ACfWFvHAJqtjtYpyAnZOEWrmS/ngus2t1n0VDGou6Jg1v/iZm4BC9gEi1OeyA4Cg3x5sJ8LbASznlNyPKSfMAos+1SRmi9Z3r0yRx6sFkGxgNuG9lMGzAmK1d5fcTIwwyIWKPHe9gS7io6aKdiyu4Nd7YpKSPhKaBp7uZOBVXkHE1krcwI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bENTZVl2MmMvT29aSDUxUEZzVkg3ZVl5dk1kSVk5WHhUUStVV2U5dWV5WW9C?=
 =?utf-8?B?UDhETjQ4TjVZZTg4MDljdHdoajlDQ3ltTDhkRFE2QzJZKzUxZklhK3ZqVTlI?=
 =?utf-8?B?dERXZWp4bklwZ29xT3BzL3pFNnovSndCeFJJMVhGc0FWOVpSSU1tdHRZVHBV?=
 =?utf-8?B?K1FZeUNickhUVitwRGgvdnFoUFk5bUFKZFNKQ0lwdVNwNEdBdTBmQTAwMklS?=
 =?utf-8?B?WUVVUTE1ZTZ1VzQ0V0ZVVXdhbDRzeFdvaWhHdTNPc2krc3JUdU9qUENYVHJp?=
 =?utf-8?B?bi9Ed0Zkc0Ivb3orUFRzWVpLeU1La3BwKzd4MWtxaDVGVFNqdzBtRmN6TkYv?=
 =?utf-8?B?eTMzajloTXpyRE9vQm1jZ0RyK2FQSmdxUW5tOEpBYzk1ZWptVmZnckRDS0ZJ?=
 =?utf-8?B?d0Z1OVFBdzdscDlOb3pZWkhaYXFWU1prYXVNQlZFUFpEKzFZdlB6eXR6cmUw?=
 =?utf-8?B?Vy9sK0haVllOVEVQR2lSR3ZLMFJnNS80NGYxZmx4ZEpMNWxqQTFjZHREUjVV?=
 =?utf-8?B?VmNMUUNDeVIyTlFuaWxCdkdPdU5tY1Rza2lHNGhhRGNkMDlxVkFOYk80YXpD?=
 =?utf-8?B?bXZWZXZqeHJqV3QxS1pabzBaZm1LOHk2Q0FIRFVGVk1hQStLcEowQ3d1Ymxh?=
 =?utf-8?B?MUJjTGpZKy9xY3FodmpjL3oveDFLUzh3bXZHNDRUOUhwS1lxNi9ZZU5qcytQ?=
 =?utf-8?B?eU9FZGRsVzVRUHFVTWR2ZER0cGx6cWVzNEIyT2hFWnVna3pYb2JRN0hVcDhO?=
 =?utf-8?B?Y1pLakgvZFdyVDR1TXpLZUpjU2dYTTRISHpVT2tWcTRydjBuQkRMN1lvR2Nz?=
 =?utf-8?B?VVRqTHhsSERoOFY4S0FabCtYWVJLU2ZFaG00ZHpFWG52V3BubVBoUVRwa3FI?=
 =?utf-8?B?N3Q4OGRrdEM1SWJncElUNjg2TlRMdTNVYzNxeitmNnZPWkhuQ0tmUG9TQ05V?=
 =?utf-8?B?NHVua0tYVjZpR0xlb0dWS1FGT3lHaDkxa2ZYT3RCUzV5dnhJNmtycXpNZzBG?=
 =?utf-8?B?NjVlTTZKWWlZOUEzY013UDlmbzczdXdyZnlaRU1XdXNPRmwrVFRYdGs0MEow?=
 =?utf-8?B?REZKYVZwY3dBNU1ML29ZeXVoblpHS292ZlhpNkdkUllKaDhJdEprNVhOQ3Vw?=
 =?utf-8?B?TGlUMU9hRXhDUGN4a2ZkSEFyRnI3dEpGZVVHejAzaTBiNDI1VGdLaUxSRVRj?=
 =?utf-8?B?OVlLbllsajJ5eitwVmsxd1pJckEyazdKR3UyYjRSKzUrWmdRdUR0ZE41cmFp?=
 =?utf-8?B?dEJVNEJOczNEbjRURjkxNDM3b2RoL2FVb1IwdngwYzFpTEIxemJXVDNhNkhP?=
 =?utf-8?B?bk4xZDZ5dTJhQnJhL2dNaEUxTU1NME5jelg1eUhpdFFyTURSS1REZWZYSVdy?=
 =?utf-8?B?MTEzeGlPVyt3Wm1ySTZFUVVXQllUSnZwTFRwRmpoZWdvVWZxTVB5Z0JQSDBz?=
 =?utf-8?B?NEtmNUxqSHpvcy9Zd3B2VUFyd3F6L1JLTWVOMUoyWVhVOERJTG9FQURKVDZX?=
 =?utf-8?B?R3hWTWlHeWFuSG1IbS85MnVvZEI4OHZzVzVaU3ppRW9TeXhzc0h6TVIyNGEr?=
 =?utf-8?B?VDloOVhtWkVUc05iTGEwZzd6RmNaS1VUZEI3UEIrcFppbDc4NmdRV0xka0xP?=
 =?utf-8?B?TXJMT3NpcWV6aEk3SVgwTDZjZVNFcW9EcVJERVc1RjdZM2c3WVdYc2FQc25G?=
 =?utf-8?B?WW5BdG9sR1VObzFNNC9nTlFoK0cvKzBVMERFUStKOFFPc1JVY1BLWGUweXJC?=
 =?utf-8?B?TFFwMHlMckxCc21lbU93SldsZFFyeHNJRGdERG1Oejc1WmdFdmdhT1FTZUFE?=
 =?utf-8?B?MHVidWtnMjJxcnQ3Q0FqenA2ZHNReitJWjllN0RCRkRJTFl1TE9jOGFJSnVL?=
 =?utf-8?B?bGp5Y3AxVjRXMWZCT3pQTXluWlp6WURDVHp1QWRMT0tab1J1cytOdUNxY3pV?=
 =?utf-8?B?Z3h5bDdHRDlMUEJySW9ZYVBVOWZlM2hleU44OXpzcURnNExCMHhWOUFsck5L?=
 =?utf-8?B?ak9waks2Q1hjZGY2NW56bXFzT2xTSzVaVGw3Y0dLR1c3OWxnMDJ0OXVLWVBL?=
 =?utf-8?B?aGdXNFI1d2xaQWFnb3RtRjJUTndCUGs5MmZwVmJNYnRxamJjNzBSWnVHcWNF?=
 =?utf-8?B?TE0rR1pncHZXWnNNYTgrVmo5S2k4a1hzQzRPMGtZdzB3dGg2SVF6N2VpK3Vj?=
 =?utf-8?B?dWJidmtWMTJ1SzVZV1ZqOVluRmpsM01ORVJGWFJFelFoUm9DcGN3d3pJUTd3?=
 =?utf-8?B?aWpGY1Exb1hFWGZzbWh1R2lyQ0FXSUNnc1JLK0VHV0xSU2x3cXZqR1FySVVR?=
 =?utf-8?B?N1llV2Z2WkltVjBDUXBHcFlmS1NjZFhhVm5jMDdPNkVUTDdJdjN1Uk51Z2w5?=
 =?utf-8?Q?TKTunFjKqsBkfWXg=3D?=
X-Exchange-RoutingPolicyChecked: 
	RoBKop8f9py6s2GgudjZ0/Pz9Cwpkxiyyh8AL5+C3GncG/DYA6b2IV9URatJTk754raeW0yXx2MhbNIVEFLE7fWvvV0AxSwXEp1tEi89SI9/GjQD7OcKtMXAfyFQlzzeTqCVduo2rRZaAt1MzUMI5W6zNsE/nFhNxe384Fwfy0A8CGSycBAp+zzD87EwZIvxIqvxLRs3s/57rPrhQIKK93vmLKeb6KBOX5+e2tzqo1GFYgx+f3eQMBELZG/BZAoDqq+RoNVQ6Knk8fMbSc/7VvHZLB+K0meZxDM1JTKu7Vw0ATQSh0yfm9EyWX1V++A8HICwCXDqUigY4Gx/YT+TfA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e71e609-9e1c-4725-ab89-08def2eff5d3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 12:49:17.7243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCEWuQfrMjf9pmMuIUgJsksPWxVFR9ANIQbgGbiyxiBjr7Z6WX+J3yZDGgtVWNeiqQVAkDVCifqCvSgqlDzK6URAQd75fV3zzQDsflDAbO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4655
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: bCN7iN16DqZZ9cSlnmVS4sbBkxEvXyfC
X-Proofpoint-ORIG-GUID: hEh2daXUzdq0HZU97KVbNSIvkwO8T6TJ
X-Authority-Analysis: v=2.4 cv=afFRWxot c=1 sm=1 tr=0 ts=6a733150 cx=c_pps
 a=bI4C2FY7jnHyvFZ3dxthkg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=t7CeM3EgAAAA:8 a=B-t7X7kAqWhYun1YvM0A:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEwMyBTYWx0ZWRfX0dnsjRkWmMHl
 7rF0p6whVDGSUsDonW+Ci7xq3mNc77loFVtc+4/XNYWh3KUXIxUa622g187g9MbXfCqyBFBExf3
 2puxDMKCIg6DLqjkv2hx9f3G91E+38CIN0U2ls6u1Vzbs0l6lKVn2DO3tebIETL+HlB60shH1MS
 iADUe7DZmG98W3l9TbmU61nyzeslhxhzozE+tiNuciOqucH5lkMrlqMgnCJ4MWfEY2b1X0F/Tp+
 p3aEEi4qPmjCaIi8Vr0u32vgOLaCAR63dZPqFgcpyO9BBVdeGUeP8rKCa4w/BLiUpGE4FRvv2Tl
 OJzqHjfX3O+lfJj66H2aYKCijmYnMOAvvJqOUE2KVvnkktJbmmILzNG6FxyitG2U8SemKV3vCS6
 c+5LIhFyzPzLYFSUDbYgG4m7xl4frIApXcAvfKVHcCIWULVwKeJjcgnHfuAhBXsoeDXPi8FJlnd
 bmTvIZz/gE/BjybFrVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEwMyBTYWx0ZWRfXy0yQ9c3dJMAV
 dwxWznh4okw0ZJHJbmvqLLoA02OJeW1+Jmh6PsMVxEdhDkg8NaqgZ/sVDVWwnctwSekeC2dEB7C
 XABLk7UXJqg7LeSmDwol/+KwwVx0OClKP1zj1DxlBfpdomJrRAZs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 12:49:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242865


On 24-07-2026 07:43 pm, Paul Barker wrote:
> On Fri, 2026-07-17 at 06:01 -0700, Harish.Sadineni@windriver.com wrote:
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>
>> Add a new nativesdk packagegroup providing the dependencies needed to
>> build external/out-of-tree rust modules in sdk.
>>
>> Set PACKAGE_ARCH to TUNE_PKGARCH instead of the packagegroup
>> default of "all", since nativesdk-libclang is dynamically
>> renamed per build (e.g. nativesdk-libclang22.1), which is
>> incompatible with an allarch packagegroup.
>>
>> Add this to TOOLCHAIN_HOST_TASK to include it in the SDK.
>>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> ---
>>   .../nativesdk-packagegroup-sdk-host-rust.bb      | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>   create mode 100644 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-rust.bb
>>
>> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-rust.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-rust.bb
>> new file mode 100644
>> index 0000000000..b10d420acd
>> --- /dev/null
>> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-rust.bb
>> @@ -0,0 +1,16 @@
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +SUMMARY = "Dependent packages for building external rust modules"
>> +
>> +PACKAGE_ARCH = "${TUNE_PKGARCH}"
>> +
>> +inherit packagegroup
>> +inherit_defer nativesdk
>> +
>> +RDEPENDS:${PN} = "\
>> +    nativesdk-rust-src-lib \
>> +    nativesdk-bindgen-cli \
>> +    nativesdk-libclang \
>> +"
> Hi Harish,
>
> We've merged this patch but did have a follow-up question: should this
> packagegroup include dependencies on nativesdk-rustc and
> nativesdk-rust-tools-rustfmt? If so, please send a new patch to add
> them.

Hi Paul,

nativesdk-rust and nativesdk-rust-tools-rustfmt will be added into SDK 
with 'packagegroup-rust-cross-canadian'.
And, this packagegroup-rust-cross-canadian is not added here in this 
package group since it will be pulled by SDK_TOOLCHAIN_LANGS = "rust"

Thanks,
Harish

>
> Best regards,
>

