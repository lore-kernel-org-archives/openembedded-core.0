Return-Path: <Quan.Sun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39B9CD5BB1
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 14:42:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38818.1779806528911578308
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 07:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=E8tyjVrV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9606e6094f=quan.sun@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QDaark724693
	for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 07:42:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=+N3E1vrPsbX4D1QCtQxqN/3hr1VxwZEaFpdmvdz2e5Y=; b=E8tyjVrVtErv
	DVNVgXiVjN7GY86ceuZxpIvJfmySSOyQnzPjZhjN4jV3W/c3f2j9kHSBPc+Meqbv
	Gp1BgRSRRld1qBfulKIPv4eelXfSpLZm53DEVUFsTff7ehBiE8CKPGKgccEn6j1X
	ikHsvw7AzLar9QmSKFPIAmDZGsisPutjY2a9j/dNQsOYQN90rKZx2QBsW4wFlIPC
	I/pfN4GhoMI6SfuK7rHvrke9TV0AaETzU0cz09DrGvkQk6qIDVSQ6BY7OURe2HsX
	u6ssusTWu0kkIGGOI9l8E02fk4ZucvPXiVetQlXqrtj1WA7YNpuQfArj+YYBqaV1
	kKSvgD4tMw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012053.outbound.protection.outlook.com [40.107.200.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb7h1utg9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 26 May 2026 07:42:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJp4Xg378x6mEuaGmGd8fH6+jgmVHfEYUS6D9OUQwGyhw4q/C5F7IRLkNeSHAwqYA8DbHxFKRKiBqDdZNjv1ZJu6ZAxOBOU+skQZlBiuyneMRxocK3GZsQNadffxhzlyXCA0MDug6atm3guU1I+BqA4QwQ667z/bmjRV5eB61Em1CuQC+vQRRCbEcONcy2XhV42r7RLAFEKm2kmeh5UO4xHaurdPTrYdyAzi0uz1nIi8m2jfmBLH7N0/8//a6aYfzKiccLr1XvkmMRt37hUkxeXN8t6y0rUCgSLJiB8eJG7kXjOb13igR1gYYed3czrF+pO38fjlPuaonTxRGHVrRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+N3E1vrPsbX4D1QCtQxqN/3hr1VxwZEaFpdmvdz2e5Y=;
 b=mZblphuUAm6kgIg9xW/MqCGZJRTm5MtBPJIM513vO4drNpxjJocINy2gX9mLQgDAm2ZcUeXrg/kx1yr1I4A0RH71v1LoFxEEtpiiLmtmAKVEed+HQV2coXmAAO/Ywhb733hLriZV5zSzOV+c6+PCl1DaQXHeSF+xRCbro8a1eFE7BASXiO332UFwwD+aQSfgCQGSQGEWf1WRFwxyzqsDNjRYkpZQhMjUEf9r61ieH68I2wFDrqpnxV0fMynT15rypt9slqX718+XN0h10gWt/MK7HGkv9qy9tsNTKUq1XLCQoagom6bEkE/3gop4r8HxvIAM37h6S7tRmHl4u/3JYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 by CH3PR11MB8548.namprd11.prod.outlook.com (2603:10b6:610:1ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 14:42:01 +0000
Received: from IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8]) by IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8%3]) with mapi id 15.21.0048.016; Tue, 26 May 2026
 14:42:01 +0000
Message-ID: <070d5be3-3a0b-40ef-8b4e-de85843788f8@windriver.com>
Date: Tue, 26 May 2026 10:42:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260525201135.183095-1-Quan.Sun@windriver.com>
 <DISIBA2T5ZC3.3QQF4IY54NI7@bootlin.com>
Content-Language: en-US
From: Quan Sun <Quan.Sun@windriver.com>
In-Reply-To: <DISIBA2T5ZC3.3QQF4IY54NI7@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: YQBPR0101CA0302.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::17) To IA0PR11MB7283.namprd11.prod.outlook.com
 (2603:10b6:208:439::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7283:EE_|CH3PR11MB8548:EE_
X-MS-Office365-Filtering-Correlation-Id: be48df7d-5924-49f9-ee02-08debb34f280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|6133799003|11063799006|4143699003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	UTmnxWx7+Z+lS7dxg0SFgj6TiS1maVG6hZqQQiiYJmCswPeKa6aBVrRI5hTxFtPcRp331HigGRvUzuKid6xMtd/zCieRHrLhMtZJ7xTOlOgheQaFKOYyw4oX2r3CBqXsPgdHRkC8TTdVrqAz3zDITHa/yoc1H8UpwFFvs7lyu67WqvFT9O5KPXu7aF/ViDrpWRLrV1F/XT2Pva4PVUcWIPqg7SOaLXQg21TptH3dw0yihmmnw+xKJgS4kAgRJeWF8fddyIQD2ybJ67V/cxC7DwHR5ZviRC791cmVRTc5eT1qZcwPhzXbcdOjNpcPlJIvFyGFq0kZ4H8qLNSMtzZNmo6AnK5ow64vjQ1ZVBis4z1zIf1+FRTXdYB+ffFcuuGnwfr5EDBgvk+XuuZBiC6RUIuyv/Gdjoqe7Hgdlg8J9M/u6OxI/HgM8R/CkeCyb/RPaC/WaunIrGc8WNeGnU+oTQkqF7h+WaHVb+2yTpKh/qdEnr3mNt0bYXb0r35WQ/CUff1KzwYhYxhBIJw65AXRaBEplvUWvQfOXYPlpXRLiA97ZggNfpA65CWp5HSsnQvBXZOGmTTfY1nziBundMjFPDTwpceeRma0MTG+t98k6vg1IF8J/l9QYMQgsvblR79KbmXvZ9h28kdS0MHaRT2BVg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(6133799003)(11063799006)(4143699003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ymt0Nk4vQ29Nd2NyY3FnSHlxdVBUS3ZtUy9jYlRFOUJrTGtqUkRIQUpXY2Nu?=
 =?utf-8?B?dVpjSkNibVV2bTUwRURBS2EyQmM5K1V2K20xVWFnRndEdnYxSjVRNUZvVktV?=
 =?utf-8?B?a3dkaGxLZmVQU2pYYzZ3c1EvNVVQQ0lEcm55aUFDNU1qK1VSMU9FekVkV0k3?=
 =?utf-8?B?VW9oaW1QL0N2MHRRSllBNkFQNlcvRzJmQnV2Z2N2RUFTemdKS1pRQ3pDZDVn?=
 =?utf-8?B?UG82MXhKekp1bWYrK0ZOQUZxTHBRODBxWnB0Y1NHbi9tenE3cWZMdEdwd3dK?=
 =?utf-8?B?cnNnTGZ4N1QrMUJyRU5EQzBaelBEWkIwQzl0dlFTQkx1R2xYUkRIaElVUFlW?=
 =?utf-8?B?L21xblM4ODJIUnJxS1NZUTJXYzhpL1IxYWpyRlY5Q0pBcnl1OFloUmliMGRR?=
 =?utf-8?B?eEt3b0xYaHNjeHB2Wm0rblA0VS9VNlVBckFhNUNsTVFNdXdMZ2pQUVZtMDEw?=
 =?utf-8?B?eUF2T0gydk11eXpuQkNUSklRVG9JMkpFWm9nZnp0MFRWWTEydlZqUTl4SWR5?=
 =?utf-8?B?cGlWZlRaWEdNdDRoRTZwbnB3aGtTdGs5SkF1TjZSNEloZDYvTnBrVlJ0WnFx?=
 =?utf-8?B?UjdsYWNJUXltMzd4S0lUWHZKZkpnaU80Qk9Cdkh0N25ORXV1aXAzb3Fsd0xK?=
 =?utf-8?B?MEIvL0tOZG8vNFVEeTJaR05DNFNrOUpKNEtJVk5hZndadFdwMHpLajBrVll2?=
 =?utf-8?B?ZDlxK1FqZFRMMjhGOXFuTHQyU1hSNjNCaUpJR0dSTGVHSHB3YWVGSDJLbWlo?=
 =?utf-8?B?a1YwdkNQWjRCTjZDSmsrL2NaNkxVSmVMdGZMZ1dGVkRINmNBb0ZjZG9LYjFG?=
 =?utf-8?B?eTdocno3VCtRcnZaV1UyS1FtSnpiOFlJSWM5bHZrelc1d0p6VkRuOUViekJX?=
 =?utf-8?B?Y3U4L1FHY1U4d29RTE5iSHI4WkZnSEtRSTRtOHF1OC8wQk56WEJBR2xGQlNQ?=
 =?utf-8?B?Q2hXenBvcGwxTHM0Rk5Hb21vak0wWDh2OU5ZdWwxQ1duOXNPK3FyY3BMZmVJ?=
 =?utf-8?B?aUMzbzdKaTMrYjdoZXk4Y1lIb0RQOEMwQkdlZzVLVWVDVWNPanY4SzhGQjU0?=
 =?utf-8?B?c3E3ellDWThnL1hQakQwRVl3Snh0bWdDWitUcUZjenBBeDNjYjB6OFNFbmts?=
 =?utf-8?B?TmhmeU5vZUxMZC9EWkV0Y0NBTFJ1ZFBpQi9WemRIdExDVGlnaWxCMkNLU3I0?=
 =?utf-8?B?VWo0cXdQMTF1cGZwSzRVbk9aL2QwR1VGYkNHbkFXckFsaFpWT1JsK2dqcExP?=
 =?utf-8?B?ZFRCYU8rU2EyWmJoV2FPWjBQUndNQy81TEhTWVZsdG5WOVU3a08zMW1lL3l6?=
 =?utf-8?B?d3JBTXJVZnVTWnR3a25aMHRrS0pJL3FPZ3ZiSm1HMGYwMVg0dlFvZ0xEbXQ2?=
 =?utf-8?B?ODBsZ3h4SVBzUldNMzFuQ0VzcmYzUno3dDUxYkFPY3FSOVppTWtUTVB4VUlY?=
 =?utf-8?B?RTlrYy9MbWJEUFpKQXpxaGN6bFRlcFFBZVBTVHRYMDhZR1grNVdhZE9EMThw?=
 =?utf-8?B?dmhTeGh0NmpYa3p0a2MxbTRobHZRbmJCL21rcUkveUEwWTdyZmZpeHVUUDEw?=
 =?utf-8?B?dHh3N1JJdnNZT2FsbmRxYjRxaUJwb0F2MjVBNTVyMXplcEgvUThyQXB0aFh1?=
 =?utf-8?B?d0hZcGs5TXlZd3dzUHVCSXhkSGdQR0Z0R1I5VmtUbnlTaElYSnQrSHBrMmlX?=
 =?utf-8?B?SDh1dHNJR1NBRXhFYlE5U0ZQb3dleW5zSzRrMzJ0QzVkcHZ6b0RiWXBIMmFa?=
 =?utf-8?B?eGtrdjc3RlJyM2ZTb2FMSlg2TUNpSHVMb0tmMHkrbllpNEJrb0NoQTMrdWxa?=
 =?utf-8?B?NDdyL2pxOEhkNXJxV2tFYSs2Nnd1cGdldkpmMCtLMzh6QmNhemhTSWRpSDJT?=
 =?utf-8?B?ZEZuMmVTbzMycjNUQy9wS1VmdWk2MjZoeTZ3SXhCMHU3UEtCK0VEVEtMeHlP?=
 =?utf-8?B?VFRFOGdDK3ZYZHh6cmlVaEh1cmlpQktWdzBZMzFwcERrd0drbmtmVG1WUHBX?=
 =?utf-8?B?ZnZxdk5HSUU5azlRcnQ1Tkk3a1J1ZXo4MHdiSHgyY0owRmQ2Q1dCcFhRK2N4?=
 =?utf-8?B?NnZFcUZkRHpYTU9xMDhLbmxoeUlWT3QwL05PekxwdU85YncyQlRxRHBrTThr?=
 =?utf-8?B?VTdab0I4K0NWbFNNR0dsL3hSK2dHYUNMNGdwdFYzUzlyQThjamduNXJ5aktP?=
 =?utf-8?B?aUZWckJwWmFMNmgvelBZN1JuU2ZkQlA0SElIaHdPNDJwVmhzaXNnTCsveE1O?=
 =?utf-8?B?dUh0TlBha3FDSHJUb0xieTY1M3oxS1RpVkliVnVsZDNYSDZDYm82Syt3dkdF?=
 =?utf-8?B?TEhQNGJtbW44bElRVUZNenRMUW1nZ1o1dEZNMHBNZS9iN2FsRzRmQT09?=
X-Exchange-RoutingPolicyChecked: 
	TU1O7Wh1eUZslve5C4AmQm7DEmxIpdWCqGsCepDqDH6T+498Q5fTz3FXacZ0EfnZTVtnkRjaAaRma36TIhe5PHyAuHnGInJm7PeXN5YGHYF9leLQ6g3mwSHGIkNyF4iiu3ca8H1WbQUTjpX0oQ9Hc1ctNaVmnbh5UepGVJ2GWEEeYNzC5uqGpvcRhaIJXuHs0kKrQlWbkvoPyDCu4y60l8nPKE6hVBD7t9uN69GZUB7Br7jMpWmTC264ggSalSucyLOKIiceKSa8KDsWhu713Pz1I3IKByHAqtaKcv7d8j75mHl+cXnp0UzbG2YfbGeOSmD83AunPKaFQm1/xvaG8g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be48df7d-5924-49f9-ee02-08debb34f280
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 14:42:01.5843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EeLrucv7cpalCQizIgsCY9x7Nt3WGagwHf6qUj8Ry56UHsglfOqG/gZ+f2TRAaZCZIYde6yg34vSVULCbrTXPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8548
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: ckOP160S6BGW-WHC1f7jh6boczcw4L7o
X-Proofpoint-ORIG-GUID: wz7NpLsQPm6M5wNIyk2tDvMV39XaBlHP
X-Authority-Analysis: v=2.4 cv=OuB/DS/t c=1 sm=1 tr=0 ts=6a15b140 cx=c_pps
 a=EGpQrqTzv4Kwq1gVXkqNKQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=VzE6jR-u68sPD18aQpUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNiBTYWx0ZWRfX2HRtVrjxgFGz
 N1BJV+K1EW8UYk1xe4namVclz75//G7PRQ8VEo6np+6gB/Wtkf9SaoIwLOx99kwHVP33I0783hW
 202Wau0/pdeIyndTwhFFY072bbV6ILuDAcLwjkNEwWojo3ob1J4XaIoAd9dDgpmKwEDXp87pjar
 ZhTbV++jFdEmDSxaq6fGWrtvbv3GIlM3wj/vE+gTLRn1NpJK+//cQJkuol/qG00ZDxHnTROiiel
 L6g917H1+1/Ocy/DvZi+PbyMEDwaKyatW2FPOi1wa0e+/EHA478aVSPl6k9IqFaBQq592XVccOd
 y2g7jJaNH+d96xzYleF4/iV3KcDZ9Dzr5zKHy848/MzOepVjfKu+T8ONF5J04/W4QF4Q5fw92AE
 v6xGb3yb7Y8PEbjI0y9l3RpppXbFDqfnYYKaKwJrufDfwGuy2G8NY46UaqA6mYaAaGNZAxkl+Rv
 B5FaP6n5zFcvVIbbC6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260126
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64QDaark724693
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 14:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237613


On 5/26/26 5:39 AM, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon May 25, 2026 at 10:10 PM CEST, Quan Sun via lists.openembedded.o=
rg wrote:
>> From: Quan Sun <Quan.Sun@windriver.com>
>>
>> Upgrade QEMU to version 11.0.0.
>>
>> Main changes:
>>
>> - Add python3-qemu-qmp recipe (0.0.6) as a separate package. The QMP
>>    Python library was removed from the QEMU source tree in 11.0.0 and
>>    split into its own upstream project. This is needed by
>>    qemu-system-native for testimage integration.
>>    Add an entry for this recipe in maintainers.inc.
>>
>> - QEMU 11.0.0 has officially dropped all support for 32-bit host syste=
ms.
>>    This includes the ability to build the system emulator (softmmu) on
>>    any 32-bit host architecture. Add COMPATIBLE_HOST:class-target to
>>    restrict target builds to 64-bit architectures.
>>    Note: QEMU 11.0.0 still supports emulating 32-bit guest architectur=
es
>>    (such as qemu-system-i386 or qemu-system-arm) as long as they are
>>    running on a 64-bit host.
>>
>> - qemu-targets.inc: skip linux-user targets when HOST_ARCH is not in t=
he
>>    set of architectures supported by QEMU 11.0.0's linux-user mode
>>    (64-bit only: aarch64, loongarch64, mips64, ppc64, riscv64, s390x,
>>    sparc64, x86_64).
>>
>> - Add --cpu=3D${TUNE_ARCH} to EXTRA_OECONF for class-target, and add
>>    --cpu=3D${SDK_ARCH} to nativesdk configure options to fix build
>>    failure. QEMU 11's configure script falls back to 'uname -m' (x86_6=
4)
>>    when it cannot detect the host CPU.
>>
>> - Add 0012-meson-fix-close_range-detection-on-older-glibc.patch:
>>    the meson has_function('close_range') check succeeds at link time o=
n
>>    hosts with kernel >=3D 5.9 even when glibc < 2.34 does not declare =
the
>>    function, causing implicit declaration errors. Add a prefix include
>>    so the check only succeeds when the header declares close_range().
>>
>> - Add 0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worke=
r-structs.patch:
>>    on build hosts with kernel headers < 6.0, vhost-scsi.c fails to
>>    compile due to missing struct vhost_vring_worker/vhost_worker_state.
>>    Include QEMU's bundled standard-headers before the system header,
>>    matching the pattern already used in hw/virtio/vhost-backend.c.
>>
>> - Drop fix-strerrorname_np.patch (fixed upstream).
>>    Drop 0001-linux-user-elfload.c-Correction-to-HWCAP2-accessor.patch
>>    (fixed upstream).
>>    Drop 0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patc=
h
>>    (fixed upstream).
>>
>> AI-Generated: kiro-cli
>>
>> Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
> Hi,
>
> Thanks for your patch.
>
> I believe it is the source of the following build error on the
> autobuilder:
>
>
> ERROR: nativesdk-qemu-11.0.0-r0 do_configure: Execution of '/srv/pokybu=
ild/yocto-worker/qemuarm/build/build/tmp/work/i686-nativesdk-pokysdk-linu=
x/nativesdk-qemu/11.0.0/temp/run.do_configure.2116027' failed with exit c=
ode 1
> ...
> | ERROR: Unknown CPU family i386, see https://wiki.yoctoproject.org/wik=
i/Meson/UnknownCPU for directions.
> |
> | ERROR: meson setup failed
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/3829
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3785
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/3801
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/3782
>
> Can you have a look at the issue?
>
> Thanks,
> Mathieu

Hi Mathieu,

There is a major difference from earlier QEMU version:=C2=A0 the QEMU 11.=
0.0=20
no longer supports 32-bit x86 as a host (see the (above) commit message=20
for more).=C2=A0 I'll add COMPATIBLE_HOST:class-nativesdk with the 64-bit=
=20
architecture restriction later. This will prevent nativesdk-qemu from=20
attempting to build for i686 (SDKMACHINE), which QEMU 11.0.0 no longer=20
supports.

Note: this means the autobuilder configurations that use e.g. SDKMACHINE=20
=3D "i686" will no longer include qemu in the SDK.

Thanks,

Quan

>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

