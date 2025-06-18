Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A99C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 18:47:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3631.1750272476761956432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 11:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8264c2ae8d=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I9K2XE017102
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 11:47:56 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4794c3vvn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 11:47:56 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55IIlttl026472;
	Wed, 18 Jun 2025 11:47:55 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4794c3vvn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 11:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mX/yvYR3pKnB391jyUvufpSiwd7ltnNbbp8B4EiSgChwz1WOXcjcmVq563Pyn1MABS6BziCWvytkT7MWYxNL6EN0MFDePp6xIsm9QLxklghV8eyS5++elXeWNj6xsp2o/RgYWjQOlibU2mOyFYToYbCyQjmTL4uPJTiAtcAdZVQ1bczILMxm0ysdO5/5pXS5OH73XY9Gge0CeKFCvbxtjIGhj0HXPnoJvU44QisTOqFhlcsh4OQ0idwE0R+EZUTLUXzwZL1GZZ8eg09ZvzEwvwiXyZEYT2cPIa5t/Jw+nPi8WwPMv3SgOcTAaTz9wj4CjmnY8VFUJFkQIgbbvEXgzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yd/NjdFND4LAmrRpWkKuOPs5BboeInY+RG3VifFLbAY=;
 b=AiN+btrMVzK+4Q3fL8r+cnTDga3ix2l5BR15EkeP6Re0iuxI9oBSQ3dZTDq4ccklU1MwAwwYQEqMwHRO1EKhBts6fcKLxKymY+on9GnoSCCS1Uy1q316JXItHh6v47kl7hzFe/IIkSBAuAEvhAhgmmri4rCBMoDs3ykJkPIiO8/RYRpGICVHSn95bbldCyLPpkH2WVNYePRkFjOJZUepORcCdKIDsNHVk35IRktiuXM74KCbDC+g4iN3spcDKDarSvi43xqSYcSmTirympaE5BXBXRo/fYhIeuvPqLNho8CWFqPo/XHS7yZBHv+IrFlalqcerpk0PXek0sQLtRw7Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DM3PPFF2E67D388.namprd11.prod.outlook.com (2603:10b6:f:fc00::f60) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 18:47:52 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 18:47:52 +0000
Content-Type: multipart/alternative;
 boundary="------------hDJazZ4qud0rNj9VDJPG8D0C"
Message-ID: <20f9621e-eca3-459b-9701-45f92e66270e@windriver.com>
Date: Wed, 18 Jun 2025 14:47:50 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] should any other "recipes-* directories be added to
 recipes.txt?
To: rpjday@crashcourse.ca,
        OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <57db0373-ed36-b710-f360-5575f9e92497@crashcourse.ca>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <57db0373-ed36-b710-f360-5575f9e92497@crashcourse.ca>
X-ClientProxiedBy: BY5PR17CA0061.namprd17.prod.outlook.com
 (2603:10b6:a03:167::38) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DM3PPFF2E67D388:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc5a529-2248-4668-03eb-08ddae98a194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cmpuandKODZ1R0Z6SC95R2daR1doVVVQY29meEhSVmN0TVRpMG51Y0RkeVFN?=
 =?utf-8?B?OWN6TXVJY201eUVnQ1lsK2pDZDlub2ZWdXFxK2xRTGlzVlJ6MnVSZVRKRitt?=
 =?utf-8?B?ZlR0S0YvMGI4UG5TNGc4WFlkMGhrY09acWkxcXlUdjRITjlkeGQrbzZIVHU2?=
 =?utf-8?B?Y2YraTZRbnVMMk4vR1hSRkpXTk1vUkp2SmNBUEFUNGxXTzVHZmh4Nnl5SXM3?=
 =?utf-8?B?KzN1b0JyeWRWOHpybFdUWWc1bndxNi9ucnVYYVVRWEptYmpzbTNzUlZQOGtX?=
 =?utf-8?B?dDVod2drbGExRjNtekhXMEF0ckU3a051bEJDbEpUcDFRWU9aT0lIMnZHa2g0?=
 =?utf-8?B?c0pGZkVkeGNEZGpMMkxYKytpeWM0cFNETStZeEpUeVBDUk9ZTlRXQUkrZDJY?=
 =?utf-8?B?aGkwdXRCbDJjWWE4T3FQQ0RrS0loMVlYT013RUZIQUxVYmJka1J3V0VwdlE2?=
 =?utf-8?B?aFpUbFExcHN1QUNNbmZrOWdYNzVUQ1VUSmNvZzA1aDRrUlVncy9WRWVlSndz?=
 =?utf-8?B?YkY2Tkl5dW1XVnBGenRXQi9kNGNudlh5RFQrRkk3bjJTam5rVG1KMi93SzJk?=
 =?utf-8?B?UHJjNm9CaFgwQ2RRYUhGUDBXbzRGTXladHN0cGV2Q0xIT0pvbVdJVi9RdTQ2?=
 =?utf-8?B?QThlODF5WGdodmp3U042b0kybDI5QXJZU2YrWmQ5NWZYcEsydkFmcFJPRzly?=
 =?utf-8?B?YlJSL29YWlZGRzV1c2ZsbWtqcXIrRDdMTm5ObWIxemtUU09iZ0RhbFRkUjhu?=
 =?utf-8?B?RTN6bUNuZUl5T0JvSkhqdWhqOXl5SDQyMmxnZnQ5VkRqbkFsUWJIWFFPb2tj?=
 =?utf-8?B?WmtKTU1jRGtFVUw5MENLT3MzV0h0SG5xV29yUEE3Tnl0c3grV2diOWlDR01h?=
 =?utf-8?B?TWlTa2cwMFlqMFEzbjVIYThFVUZhWTE0Z1NGN0lyOU52V3dLSlBacUZvbjhi?=
 =?utf-8?B?N2JrdFRpNW5sS2V1MVUzVUs5QmFsL1p0bjYzUkxtU0ZhdXBqRmJMODhCOXp5?=
 =?utf-8?B?NnZRclMzREp6VFNPcWgyeU5hMGRCQWtmVG5HMmR2cTJJSzhKVjkwTXJCazV6?=
 =?utf-8?B?ZlVIZXA1YjhvM0w0bS9NcGJCYVpGczdnUSt6STk2WGV4QW4vVXVzTTN4VDR3?=
 =?utf-8?B?ZmpuRFVyNlM3dFNUL3FyV1RwT0JmS1RqTTVyeDNob0tnSjhoMmlBeTNyQU5Y?=
 =?utf-8?B?TExGbEZMeGpUVTh1cy9KaXNVMkRpTVFCdEVReUMxWmd4bUR6REFaV3EzdENS?=
 =?utf-8?B?eTU2T1F2WHlkRXg3R1RWWSs4ZXBsNHdpRFFYUUN5ZVhVcTR4WGowNk9jSE5l?=
 =?utf-8?B?VklRSm1vamU4YWZuWm1teHdFa2F6OXM1UzE4K2h5ckhiSXlIV1B0VHhHTVVw?=
 =?utf-8?B?RktNOHJIaE5ETE9mZDdGczlqWXZXYUxHeTl1cHhiU0o2UHovdXRyNGcxazBn?=
 =?utf-8?B?OWFUd1hGbzlncHFTTDUzSTVxQmRGN3F0dytZcjFNL0tld0EwMlYwQ1ovcGd2?=
 =?utf-8?B?Ly9ZUUJuOUgvcE5iaEpYOVhWemxvUVMvVERDZHhubW5NL0o1NjVFQS9RdWhp?=
 =?utf-8?B?ZVlwV2JYUDZDWmZJVGFlMzVuSjhUY1dVMHdBNnZQWTVWdkJLalp2K1BGS1ll?=
 =?utf-8?B?Q2lWdmdEZGQwQ0phakNrUUFNcDhHYVFIelYvc3p5ak94cjZvZWQwV1ExdExr?=
 =?utf-8?B?cWJ0ZFpuVEdVQzY2eDJOUm1XYUxlQXc0RFV0OW9kbXk4RFlsRHUwVWxQV1gr?=
 =?utf-8?B?VzBnYlBTYlBRYTEvaG01Yzg4UUdJQnowNVJJNmhRc2Jnek1YdFlCSWFSYUpW?=
 =?utf-8?B?MHlnT1JZd3JqcFIzbHpUYkM1MXo4VTRXdjUrYUZPZUF2V0dsRElMTWoyOGls?=
 =?utf-8?Q?teXHZb63wKn89?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NTF1N2JHdS9oWUVobENiZU9lRFo3Yk93MXd0UDUwUkNzMG5BQUxwdE10dHRJ?=
 =?utf-8?B?L0JZSEtXZHdhb2tJdHQ1R0ZtdjRwZ3FDQlJvVXF2a0R5SGJKRUZjTVdDK3JB?=
 =?utf-8?B?LzVJdWp4bjIzaDFBejkrQXBVcktRUUlxR2ZDaXpFYjkrUkZ2L2Z2SVJVbC9x?=
 =?utf-8?B?YTZXNGZWdko3cHpTRG8xMWV6Sm1WcER0N1YvZFBBdWpOUWVVQVlLSzZsV0R5?=
 =?utf-8?B?ZXlzT0NnN3JDMzdqTVhuSGc5VzgybzRWdEt6RTk2b25MTHBiY3Q1NEpEa2xp?=
 =?utf-8?B?b0lGM1FuUWx4emY0QnBPT2ZxUllLTDFLOFhzd0NNbmxmWHhhb04rTXhTL0t2?=
 =?utf-8?B?QTVmZHhzL2JMZGZxcVVObUd5OVJHU2RJdmY3MnNlUzNTb1JoY1E2TnhxQWFR?=
 =?utf-8?B?bmlPMDU0UEF0NHo0Qzg4S3RiQjRqbmU4VmN5NjVMZnFGVkFleFR6a3FhRzcr?=
 =?utf-8?B?dW8rTGp1ZHJHQW1YMEc0akt1eGsyR0JNdHNoY3d4YUd1eWo5MVZjLzZVRlJk?=
 =?utf-8?B?RTlOQU91Q1FwVG54c1B1VWdVNmtUMHYwU0RKUkVSbVlxZmQwUjZQV2srM3Y0?=
 =?utf-8?B?ZW43aTFlaWllRDZEVjZyVUt5UFFlRThSL1RObUJzQTNOSE1BRkN0K0l4eTFT?=
 =?utf-8?B?R0RiS2FtaDdrdzZiZVdzQ3drdjFhcVZnMVl4TUt6NXFtZldKaWIzWGN4ZWhy?=
 =?utf-8?B?dThwYm9UV0pkSEJCNlIxZS9mVEJNSE5mditwL3pmb3dVaEtBeGRpQjRUQ0Zz?=
 =?utf-8?B?bGJPN093NzNqU2xQc3Mrc0FaeXpsTzhQQ3lKa0lxZnZtNGVDWk5rV1BBTDd0?=
 =?utf-8?B?U3QwWTcxTlpQd1ZhSnFRSmhQWGVNc21HU0d1OVZWOGV6dFUwamdyMHUyQTFt?=
 =?utf-8?B?TU5FZXlKTmYwQ1FUUTNYejNORk91Z085SEZJdjRLM092TTZqNWFDVGRRZHpO?=
 =?utf-8?B?bnVhQ2V5eEhDWmcxV0lhU3kvSkllOC9sVlhvOUtmZDJzZFFRaHhLQUpHM3VN?=
 =?utf-8?B?VjFoYXY3TWhVUkJ1eFNDdU9DaE1iTTJoUk5ISVlLT0R2QzFwa0RVZDljSEJS?=
 =?utf-8?B?VVNseW5LYy94QUphZktBdE5tME9kYUJjM3BCOW9wZGdmNVpUK3d3dlZHeXcy?=
 =?utf-8?B?SkhlaWN6SmNjalhxU21ibnhvV2cwVkJYS040OHYzZVJKdklDS1Q0RGdnOVl5?=
 =?utf-8?B?TG1aV1EyTnRFZEE4TXJtRDR3bzJycEdzUUVzU1ZFQXRkL3ViN2I2UXV4MjBK?=
 =?utf-8?B?elNjU01ZVm1EUmJVT0kvL3YxT1V4QmZwWDdKWGRrYnc5NjVyQ1hQaTZzVDRB?=
 =?utf-8?B?VEFKYWRlZXZITTBxY21GdDlVTk50MW9aYUY0R01CK01nQXVudDRTeUlEV0Rh?=
 =?utf-8?B?WVdSTEFmOFVXN2s4NUlESXh0WERDdWdtN0g5TzB4U1llbko5dkVUZ3NCaVFU?=
 =?utf-8?B?eDNHR2pnRFRZUVMyQnlmOVlqeUNmeG5SVVFLQ2Vyb244QzRLa2MyVFo5dndx?=
 =?utf-8?B?YW95bk5XZWNWb0hCQnFBZUpjcVJTMFZ5cWppa0RTWk9pZHNwQytGTGFNMEtv?=
 =?utf-8?B?UmthdUtnL2NxUFd6V1kvaVVPNXJqV1E2RjZkeElZNlVzS25BYittc21hcGFY?=
 =?utf-8?B?T2FpbGFuQnB5ME0vVHVHT3ViOGJMdUVJMHl4dmRzaE5FN2NTVzltMCtibVgr?=
 =?utf-8?B?MlpnVW5ZWURjYUMrc1FRWi81aVM5SDdsUGQxUFdYWHdhREZ4a3gxWXpmRmhG?=
 =?utf-8?B?RHkxMTJKWmxmQnU4dnpLK0NFbjNQRjdGVEcxNzMrazBnbTlYeElxN2RISkFm?=
 =?utf-8?B?bW83cEdudjd0Mm5qekNFdktocUIzRnV1WTFEOEphMnRrMW1oOHN4NVcwSWtZ?=
 =?utf-8?B?OWVSUUZoeTFlV3BNQkwwNTdVd3A4dEorUGIwMTdjSFVjVEhtN2FXK3g1aldm?=
 =?utf-8?B?VXlZQ1ZhQ2IvNngxYjhxMjFXMDl6Zm96NFNoM3hCU25PTzlWS2pTSzB1b0Ez?=
 =?utf-8?B?VlRydUpJS2E2dGdwYkRUL2ZTUkpjcVVJaHNsUjc5S3M5VEdldzlENUhlSWYy?=
 =?utf-8?B?eUgyZmFDN0I0QmtiMlRuVXFGK0ZRcWRIRy9BTkNKVGJ2ck9mQ0daR3JkREdZ?=
 =?utf-8?B?U0MzeFRHbW13WUFWUDg1N00rcXFMb0dLT2tqR0dvbVZ1MUd6OG1wU3FubnB5?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc5a529-2248-4668-03eb-08ddae98a194
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 18:47:52.6775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44Kd9iQ2teOVgdEPeSmzl0RfGaeadKmNczoanv7t25A3Buvv7TFTeeMeBrkr+/dWGXfQhj246dS4kmLlNJiG40YTYvUgSnmznFwN61o1LuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF2E67D388
X-Proofpoint-ORIG-GUID: HSvCaNjHinUIxQ6-ZJNsA9DQgL8zp8gV
X-Authority-Analysis: v=2.4 cv=b9Gy4sGx c=1 sm=1 tr=0 ts=685309dc cx=c_pps a=C6wV1Oyh/BQbLcKcsSgGIQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=ANAh7RqGL246LPfE2I0A:9 a=_PE9Q_0Z8bzuyU0-:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=CEtC_dnCAAAA:8 a=3AOd4q2eyX-jbEREmL4A:9 a=duDtoJRntH7RcAet:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Fr9QGtSrJqje8MTI1nyQ:22
X-Proofpoint-GUID: QS3wr7NrxBae11wGGlExYY7Om3-13XST
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE2MCBTYWx0ZWRfX7fB3V+GcNH0j uHQ511ODVDAD+79zF8SOtralubQGhrcSL5gWNoIuIR/VX7+KsSmbm3JbpZhf3D+2YeBaa7CxEYz muSIffzMWn16TXR1XxU9nVC3+5xL/muvuSdqxf4fbkjbdH5N+e+n1Su6m7z2TO/1X+IMiqQ/Qib
 ItflJ/yqf8DC4iVsgMrdEr0EfRKjLJVb8VNZSs1vc2Px0k3DCaD5uRyhYD7Ca8s+JJAN6WmDDyP DjXC1KEwKB+J+aMe2VsHyDTdf3uBul9pIgx6CC0F+9Yk1PUogg7u24HjymDRWTx0eqf1tb6s6Bs OHPctrYjMZ0Fd0fbyIV3xxHp5cKCRFzFghBHcPX1XtFzIZxes8Af6gpquR2FeNaERCHtN8gLmHP
 AJRrQzGlEM7kpwJ228B07R78DniF0hwcIgfYNN6BS8zgdsWeSpjVbFikDuidn9f3sZ+nPx+g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506180160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 18:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219034

--------------hDJazZ4qud0rNj9VDJPG8D0C
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55I9K2XE017102

On 2025-06-18 8:16 a.m., Robert P. J. Day via lists.openembedded.org wrot=
e:
> here:
>
> https://git.openembedded.org/openembedded-core/tree/meta/recipes.txt
>
> it seems like there are a few other directories that might warrant
> inclusion in that file ... perhaps:
>
>    recipes-demo
>    recipes-security
>    recipes-test
>
> just a thought.

Hi Robert,

No need in oe-core yet. We can add them should the need arise.

See below for a quick search for recipes that are in those categories.
There are some matches for demo, test but they generally belong with=20
related recipes.
There are layers with demos, security recipes, tests but they are not=20
part of poky/oe-core.

Good enough or do you want to explain what you were thinking of here?

../Randy


poky.git on master

=E2=9D=AF fd demo.*bb
meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb

=E2=9D=AF fd security.*bb

=E2=9D=AF fd test.*bb meta/recipes-*
meta/recipes-core/glibc/glibc-testsuite_2.41.bb
meta/recipes-core/images/core-image-ptest-all.bb
meta/recipes-core/images/core-image-ptest-fast.bb
meta/recipes-core/images/core-image-ptest.bb
meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb
meta/recipes-core/meta/testexport-tarball.bb
meta/recipes-core/musl/libc-test_git.bb
meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
meta/recipes-devtools/binutils/binutils-testsuite_2.44.bb
meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb
meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb
meta/recipes-devtools/perl/libtest-warnings-perl_0.038.bb
meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb
meta/recipes-devtools/python/python3-pytest_8.3.5.bb
meta/recipes-devtools/python/python3-testtools_2.7.2.bb
meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb
meta/recipes-extended/images/core-image-testcontroller-initramfs.bb
meta/recipes-extended/images/core-image-testcontroller.bb
meta/recipes-kernel/cryptodev/cryptodev-tests_1.14.bb
meta/recipes-rt/rt-tests/rt-tests_git.bb
meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.b=
b
meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb




>
> rday
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218998):https://lists.openembedded.org/g/openembedd=
ed-core/message/218998
> Mute This Topic:https://lists.openembedded.org/mt/113706734/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------hDJazZ4qud0rNj9VDJPG8D0C
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55I9K2XE017102

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-06-18 8:16 a.m., Robert P. J.
      Day via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:57db0373-ed36-b710-f360-5575f9e=
92497@crashcourse.ca">
      <pre wrap=3D"" class=3D"moz-quote-pre">here:

<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/o=
penembedded-core/tree/meta/recipes.txt">https://git.openembedded.org/open=
embedded-core/tree/meta/recipes.txt</a>

it seems like there are a few other directories that might warrant
inclusion in that file ... perhaps:

  recipes-demo
  recipes-security
  recipes-test

just a thought.</pre>
    </blockquote>
    <p>Hi Robert,<br>
    </p>
    <p>No need in oe-core yet. We can add them should the need arise.</p>
    <p>See below for a quick search for recipes that are in those
      categories.<br>
      There are some matches for demo, test but they generally belong
      with related recipes.<br>
      There are layers with demos, security recipes, tests but they are
      not part of poky/oe-core.</p>
    <p>Good enough or do you want to explain what you were thinking of
      here?<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p>poky.git on master</p>
    <p>=E2=9D=AF fd demo.*bb<br>
      meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb<br>
      <br>
      =E2=9D=AF fd security.*bb<br>
      <br>
      =E2=9D=AF fd test.*bb meta/recipes-*<br>
      meta/recipes-core/glibc/glibc-testsuite_2.41.bb<br>
      meta/recipes-core/images/core-image-ptest-all.bb<br>
      meta/recipes-core/images/core-image-ptest-fast.bb<br>
      meta/recipes-core/images/core-image-ptest.bb<br>
meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb<=
br>
meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb<br>
      meta/recipes-core/meta/testexport-tarball.bb<br>
      meta/recipes-core/musl/libc-test_git.bb<br>
meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb<br>
      meta/recipes-devtools/binutils/binutils-testsuite_2.44.bb<br>
      meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb<br>
      meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb<br>
      meta/recipes-devtools/perl/libtest-warnings-perl_0.038.bb<br>
      meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb<br>
      meta/recipes-devtools/python/python3-pytest_8.3.5.bb<br>
      meta/recipes-devtools/python/python3-testtools_2.7.2.bb<br>
meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb<br>
meta/recipes-extended/images/core-image-testcontroller-initramfs.bb<br>
      meta/recipes-extended/images/core-image-testcontroller.bb<br>
      meta/recipes-kernel/cryptodev/cryptodev-tests_1.14.bb<br>
      meta/recipes-rt/rt-tests/rt-tests_git.bb<br>
meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.b=
b<br>
      meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb<br>
    </p>
    <p><br>
    </p>
    <p><br>
      <br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:57db0373-ed36-b710-f360-5575f9e=
92497@crashcourse.ca">
      <pre wrap=3D"" class=3D"moz-quote-pre">

rday
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#218998): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/218998">https:/=
/lists.openembedded.org/g/openembedded-core/message/218998</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/113706734/3616765">https://lists.openembedded.org/mt=
/113706734/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------hDJazZ4qud0rNj9VDJPG8D0C--

