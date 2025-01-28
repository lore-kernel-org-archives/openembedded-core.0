Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAE9C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 15:51:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.177.1738079471222788355
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 07:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41233a820d=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SB2liB007545
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 07:51:10 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44enykrjk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 07:51:10 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50SFmvJI007731
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 07:51:10 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44enykrjk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 07:51:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dPjhUfGaiOfnPyVHADRrCUzvY9QafoxZrlsSZ6REEYcUnGsxvDWGnURtbtu3jcsfAEqT4hlM1Q2OZhnjLiAzVXPRcQCX8a9/MZqe05WbDdfkj1QRbaj4blevRj+tgsxPLZq/0++Jc2T1Aac/qOySDZaYbqhKjOS/gSMSuoMc2bzVThhkkgAXlJmGjZ61Y1Pg2fkPzSrgc0Lq7rec0y1eAjIet+8aLU+uaY40MqMlQ9rWpehT714qMFmSOhDzujN0gDTu2OdKOxy+WAQYOloiaUGVCuvqEGZS+rasRCGPdjB3ycF1kKxHdZ9xpnGUn7ELdpolF4prXL4SLTRkOODEWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOWWNVHE86FzaxaJ5hQ9HzUaffhmhlDbzGymwytGHJw=;
 b=WVoM67pKwQmlumzyM8KQGmLIOFOQm+rd87io9IaMr94n0HilFcsQezyu6HVp/CFRjkzcfgJyre1GfiZIgb/IDaLHPPWq8BRZvRUCgDDBNJ8xnjeJbtT2I+HX4Rikbt2iCJcwNnhMD12hKNVUTJvlHurQpUVV1LwlWbdjAnCWzEr49Wotr6HsCjX9C3NMvUCRFZgQi9/9Zw3CB9XDBTBfKGZkmb8hbJvPif+5RLmx9gVMPKgzy6o5tFKhAfSuN0njc6+SUQlVwZ/RzMfve29x7s5sAL7zNNB4p2YBiDNdeEmX907u6SE1CErAJhOLzx8XMFbfWv4/ig8m4dUtQM0PDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by BN9PR11MB5307.namprd11.prod.outlook.com (2603:10b6:408:118::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 15:51:07 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 15:51:07 +0000
Content-Type: multipart/alternative;
 boundary="------------41RqTnUq2ufKNIyrnIYqdDBV"
Message-ID: <96981090-c00a-40cb-802c-f709450036f1@windriver.com>
Date: Tue, 28 Jan 2025 10:51:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] qemuriscv: Enable Sv39 memory address scheme by default
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org,
        "Ramasamy, Rajeshkumar" <Rajeshkumar.Ramasamy@windriver.com>,
        Khem Raj <raj.khem@gmail.com>
Cc: Sundeep.Kokkonda@windriver.com, "Hao, Kexin" <Kexin.Hao@windriver.com>,
        "He, Zhe" <Zhe.He@windriver.com>, Trevor Woerner <twoerner@gmail.com>,
        Alistair Francis <alistair.francis@wdc.com>
References: <20250128101633.3664659-1-Yash.Shinde@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250128101633.3664659-1-Yash.Shinde@windriver.com>
X-ClientProxiedBy: BYAPR01CA0051.prod.exchangelabs.com (2603:10b6:a03:94::28)
 To CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|BN9PR11MB5307:EE_
X-MS-Office365-Filtering-Correlation-Id: 621e7397-23be-41dd-eb2e-08dd3fb393e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M2hGRmNhSWNaSStoWTZrR05ROS9ZaEt3NFBCeXN4VDlCWnRPNk8rUDFtUE5y?=
 =?utf-8?B?NTVhQWs3aFpQZTF5c0pIampSRk1wYlRjUjNRb3dzZE0wTUNxZDZSSnhYUDlT?=
 =?utf-8?B?anZJTW1WeHN0d1pPWVl5bnAyZ2RKMnlOWHBsYmJ3US9VbjQyaVU2L3lNVUVq?=
 =?utf-8?B?eEN0dFRTUmNHVFNjdUI1Y3ZLbWsyTkZ5ckc0U1pHZWxmT0F6TGp4aXlzQXVn?=
 =?utf-8?B?bkxoZG8zQkVoQ3J1dDdvc2R5SXllWU0wRUUzcXJrb1JjL1hHUkpqOXJUV09a?=
 =?utf-8?B?eGNqZjI5R0xLU1cvTm9sWmc1ZTNBcC9BL2NlemNLN1k2QWNtYm04bjlCRHlW?=
 =?utf-8?B?dGFjUkI3YVlsY3RMbzhCTHY3MVdvMUUxcUtGOVRGVWNqL005RjZ6YkQzRTNG?=
 =?utf-8?B?Q2k3R3d2bTlYOTlxVjByWGZ2cUlxWlh3bGRjMlRaN3g5TXEwbWwzWUtJdjhT?=
 =?utf-8?B?bU1sQk92U21tenYxYzRaVW4zLzh6Wko5VjZmaklpVFo5bElodDBXWC9qNDRu?=
 =?utf-8?B?Zkl1K3QzOVo0TDAyaVRXeGVmNnZMSFkvYWJYaExCVWJjS3ZzdGdFT3JQMEJ4?=
 =?utf-8?B?a3Bkc1dHbnpxbjgvalFFNkVBLytwdUJiTVRrWnJNakp0a3VkcWtuQ3FML0t2?=
 =?utf-8?B?alJjSG8yTU42UWJUaFpIYnhueWVXNjQyL1NFSDBvQ2lEUk5xb1AvZXhXWFFP?=
 =?utf-8?B?MVBBRktKSVFxWnpRUmVrM1RWVFZ3R2g1aTh2OW5HNFowNUd2N01lRGFZdm01?=
 =?utf-8?B?dml2UTUwL2l2ZXR2VWcvVHd5NzUvdnBTNTlnbUw3YjlET2ZMN0tRWEJNdjh1?=
 =?utf-8?B?Rm9COHJXOTlOeGQvNHhVVU9nRGVsTDMrK3VRd2thN1NSeHVBTnRLRlhiNDdz?=
 =?utf-8?B?bVUwdnk0WENSRGVVSmw2VlVZbjNrZVBuNjhrMlJzSVdzZE52TXhWNE83U3Z5?=
 =?utf-8?B?WHVvSjJRWUNBT3NjdFVKSDAyaCs1MjlvbTE5MVhiL2FNbjV2eWxYWlBMQWJT?=
 =?utf-8?B?KzBWdDVZQUVHWnpyUGh2UVlWRnpaNGRRaU82RFhWMHhWWHE1VEJnUmVDV2ZH?=
 =?utf-8?B?VW0xT3k4ZkxsV3ZZT3FnUEtuaWNXS2luUWg4cEtIS1dJbjA1eTdXeCtqajNR?=
 =?utf-8?B?eS9jeG1SVnJjTlRGNTc4dXpYRDVvcW9OMUdwOGtTZ1BwS3o3SlNpWndjelJ4?=
 =?utf-8?B?dHBGMW4yL0x0bmNITFVVWUdwa2draDFOM3ZWR3pMQkRJdnlRN1lnbGpsUXRk?=
 =?utf-8?B?N2lXT1VydWJhNHRNTVh3OWJ5cVVXeGxncHlvVEk2SVNsYXpYV2h3QWJUSEZ3?=
 =?utf-8?B?bXhRZ3F1Q3F3SHYzNG1lR3ZaeEFSTDhHNTRaTEs4WlBsTjR1OEFyK2ptQ2dW?=
 =?utf-8?B?eFFZQ0RhWmRCZlROVDlESm41Uy81NUhKdnZRek5aN3VwYzNUMFBnbmkwempM?=
 =?utf-8?B?NGhQd0l5R0ZCN3o1aHVpWktETGs0amJZRGpScWpzSHhtcmxEWkhBcHhTaFdZ?=
 =?utf-8?B?WnF5dTlpa2dFbzZuVUhIRUlLR3VWcFRzclkvYVNqdHhRbXBvV04xcjlYWUl6?=
 =?utf-8?B?WHBpQ1AwZ0dQN0dnNVlKOVlkT2JHemJmSEJmb1JCWk5kem1aVENGVW9JcHJH?=
 =?utf-8?B?aXc1RG0wbkI1a0RXN2h4bS9kTXJpVmVzanNDRWJHWnVwVlRlSDVhMEIrRXpw?=
 =?utf-8?B?TDBiRm4zQU9iTnMyZmxSUFNnME95RGJkREVJTDZ2elhzeXFPNitnWTNoTG1h?=
 =?utf-8?B?ckZ5REkvRmloUFRVSnk5SW5ZOXJ2cGRyRzIrWFdQQVU4RytncnZMRVJrdXpw?=
 =?utf-8?B?SVJ3WnFkZmxJaWU4bHhIZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RVdUYkxtVis4T2d1cmsvNVBwVnk2ZUxPenRvcnBSRHF3cTVkTkNLOTZTSUFX?=
 =?utf-8?B?UGRpTTJmNm5VMCtxa0Q4S3kxMFdGMmt4N09oZEJsd0JodlNKVVNXYmFmdVhi?=
 =?utf-8?B?S0l2ODdidmF2b1QxaWNrOFR1VXVVVTczZE9qSzB2NXBkNURoL05IVDlPaXlM?=
 =?utf-8?B?aE9CVGVtYk5lbElNL2ErNUQ2MVRuZTBHdXZERTdvUzB2a3owSzBMc3FQZk85?=
 =?utf-8?B?Q0pXelJndVZIRUZGeDhZa1BkRXYrOFJnRTViVmx5YUx4ZFArRVJDeHI2cE9D?=
 =?utf-8?B?VkJIZktVcEtJb0p6VjRrdDhGRjc2WmNJQzc1cTV2Tk1KSGlxV3ZPaTZJeC9s?=
 =?utf-8?B?cWNEMEdUSU1Cd21lVUdsVlBJOGgxWURrNVVRK3pwYzBSamZiNG44U1c3SDhi?=
 =?utf-8?B?RUlBcGtUTnN5Q1dBWUcrTWFzMG8xdWVzZnI4bGJMcUdQQ1ZBZ2c0RC9VbzY1?=
 =?utf-8?B?RFN2eklSRi8yL2trcXlWQXhUdEoraUJBbXhyODVpckdvd1BkcHNoeENsblRQ?=
 =?utf-8?B?SE55OE9NYUdaYUdYUHRuR0tsT2tZTUlCZ1dKZWFqd01rK09BUTgwOXlNMU9F?=
 =?utf-8?B?aUVlMGtzQVNLaG1ZWXp1Y2dCRHF4NUp5cmVWMnJwelg4SFA4N0tkZlpzSHlD?=
 =?utf-8?B?NE4yMWIrdGxwRGJvbnAxbUtkcjlPd0lwR21GRkVTL3dCMklaTVRvMGlvM3NT?=
 =?utf-8?B?NGZmZ05LVmliS0tUUmdRenFjbCs3TmtvK2R6SnkvWmVQOHBFWk4rZFYrNElx?=
 =?utf-8?B?WWZLR2E4VmlhWkZ4L0ZjY20zVDI1K0paRHVVdWhVRnhVaFJMMGtHSFphTTdv?=
 =?utf-8?B?OVhvTjd4NzQ0azdCbWRvckNqWFFyM0UrVHFqRmpERUxFcDhBbHovMk5uZEx6?=
 =?utf-8?B?bU1wc2pKakwwWUlEKzFNbzdKS2FmNnFCaUtYSU5HY2RpSkN1cXlENVN6VHFw?=
 =?utf-8?B?TWl5UTZndHRtQ1psZU4xTUx1c2lQYlVMZnpiWUFtdUg5WGNwWmhMd3Y4alpO?=
 =?utf-8?B?NFZndG95VlVvYm56NzAwUlczYTI4SFI2Z1EybFZvZVMyYlRUZUZOS2kwUVRk?=
 =?utf-8?B?YUZSUHl6L0dhOUt6TmU4OUNwNERTNDlERElEeGswTTFmK2NaM1N2M3E2RWVz?=
 =?utf-8?B?MDJxZHpESkd4Q21qaVJYc28zU2R4UldkczE5ZG5Fa05lUVk3akFpclU4bnRi?=
 =?utf-8?B?dlptYzFFUk45cnNTT0VTK0dIRkhPZytYY3V4QURleXN1RTB4anJtWmtaUVhv?=
 =?utf-8?B?eXErSGVKV21HbmRUQ1FmaVBQMlgrb21UOWdLdklqK1hnN3cvUVdqNGpyWEdF?=
 =?utf-8?B?ZkxkakVJNmV3eFIwWHQrSXl1M1NZWW4wYWU2ZEhveDNsdnFKOUJnemk1WWdt?=
 =?utf-8?B?aldENGVBMnJkdjdKUnJ0ajhicDB3NUJaRmUyZ1RlSVBqK3QvcDNjNjh6NUVD?=
 =?utf-8?B?Q2NLK3NWMkpBcTdDY01Uam54NWRjcU82RkpwQjF0SWhPL1dsQWc5VTJWc0RJ?=
 =?utf-8?B?Nkh5RWhXSHhTUHFXZysvNk9ITXY3cFRvVDVBM3FVT0F2TWdTckNkbXZsL0ww?=
 =?utf-8?B?MHhlRUNmVjcyUm83VXhJdXRBOERqWHJ5N1BlalNNdTFwem5PL3lBMVc2bmxG?=
 =?utf-8?B?aHFlYXhKYVVMSDFqRmdkalZ4T3ZjdWpNUWFaVXNkQ2VQZFRTcUFPNnBqZ2VV?=
 =?utf-8?B?YmFpYjBMWWNOS1laQy9sVjVGYXNHc0dYcFM0K3VwaU4rZmdzcElabFpkMlBY?=
 =?utf-8?B?YWdQRXBOQkR1QUtqbWx2K1NIK1ZkeFVEOURDUjdDYXV3cU9JQW1DNktQcGhU?=
 =?utf-8?B?UE4wRXRtcnRScVhnQUo0N1BNTnVJTFg0OVdYdE5ud0FpTnYyZllzYUtEK0FS?=
 =?utf-8?B?d2JmbUtKWUtTWm5WWC9nQTVFZzhrMmtsVTJ0TkREakVwODlFMm5KbVV5Um5m?=
 =?utf-8?B?OEhUdjk5TmNYbXlCbEJGWC8vTFBtZnRJa2hPc3lCRHFRbysyYWFJeXYrOGFO?=
 =?utf-8?B?ZTFReFZNR3M3WlVyeURxdTRWaEwxTjAyM2tZQ1kxNmIzczJ2TnkvS3J5bXRE?=
 =?utf-8?B?SS9MUWxrcG03TUtzZmlsVGF0QXdoL0JnRXRrQUtaK0RJd0x6ZGlYTXJvL05D?=
 =?utf-8?B?dG9zWUQ1NW1vQzhvS2VZRGwwOUNINTZkWFRSbG9Fc2VBSmpyVmExenYweUtP?=
 =?utf-8?B?OHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 621e7397-23be-41dd-eb2e-08dd3fb393e7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 15:51:07.1621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zCjkDmda1D5FWsQm9HXcqa73ctIKcGaVul342dAilRgB8jbDAdTs2slGXIZKjgf1hOar9isjPUiLXJ++hn5W/ri924fal5daIT5epEHtj9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5307
X-Authority-Analysis: v=2.4 cv=Wv/RMcfv c=1 sm=1 tr=0 ts=6798fcee cx=c_pps a=H8RDR50mQ1szzU+C1Tr1+Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=3DWwVrQRWzlIKs_BgJ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=EAANymjFHU3wsFqUKEkA:9 a=ngMMgqPnNPQRbIJ8:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: _MJ9enoGygm0Oz2t-i2rvq_MVugJcA2X
X-Proofpoint-ORIG-GUID: omwou3wEWJ7MqHwb8VIBfeDA36O0s7Yh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011 phishscore=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501280118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 15:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210329

--------------41RqTnUq2ufKNIyrnIYqdDBV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50SB2liB007545

Add Raj, Khem, Kexin and Zhe who know more about RISC-V than I do.
Kexin and Zhe are on holiday for a week or more.
CC a few people who have contributed to riscv* conf.

I am not all that familiar with either qemu internals or riscv=20
specifications so any input is appreciated.

I have some comments and questions below.

On 2025-01-28 5:16 a.m., Yash.Shinde@windriver.com wrote:
> From: Yash Shinde<Yash.Shinde@windriver.com>
>
> Currently, GCC Asan supports only Sv39 on RISC-V due to custom allocato=
r configurations optimized for large allocations.
> These configurations are incompatible with larger address spaces like S=
v48/Sv57.
> This fix enables RISC-V's configuration for Sv39 by default when runnin=
g `runqemu nographic`,
> eliminating the need for manual configuration via command line flags (`=
qemuparams=3D"-cpu rv64, sv39=3Dtrue"`).
>
> Fixes [YOCTO #15691]
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15691
>
> Reference:https://git.openembedded.org/openembedded-core/commit/?id=3D4=
b4450ff695ef73bf7a2437e142d2e0730d6a547
>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   meta/conf/machine/include/riscv/qemuriscv.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/=
machine/include/riscv/qemuriscv.inc
> index d01d988eee..6170ce65f2 100644
> --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> @@ -27,6 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D "0x80200000"
>   # qemuboot options
>   QB_SMP ?=3D "-smp 4"
>   QB_KERNEL_CMDLINE_APPEND =3D "earlycon=3Dsbi"
> +QB_CPU =3D "-cpu rv64, sv39=3Dtrue"

Thanks Yash.

To save everyone from doing the math, sv39 gives the system 512 GB=20
virtual address space.

Should we use the ?=3D operator here so that users can easily override=20
this specification
just as is done for=C2=A0 QB_SMP two lines above?

Please summarize what testing you did.

Did you test with TCLIBC=3Dmusl ?

Since you are changing qemuriscv.inc you and the YP AB should test=20
qemuriscv32 and qemuriscv64.
qemuriscv32 should, if I'm understanding how this works, be unaffected=20
since it has to use sv32 mode.

Did you find out why sv39 isn't the default for qemu?
If not, please check the git history and it there isn't an answer there,=20
ask one of the qemu developers
who work on risc-v. It would be nice to have a sentence about that in=20
the commit log.

Did you consider a different RISC-V cpu sub-arch such as rva22s64 ?

https://github.com/qemu/qemu/commit/3ba8462c4ca55720239fdc6fa30b9870d22a8=
814

I'm only asking because it seems like it might be a good fit for us and=20
I noticed it when
searching the qemu commit logs looking for sv39.


../Randy




>   QB_MACHINE =3D "-machine virt"
>   QB_DEFAULT_BIOS =3D "fw_jump.elf"
>   QB_TAP_OPT =3D "-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,down=
script=3Dno"


--=20
# Randy MacLeod
# Wind River Linux

--------------41RqTnUq2ufKNIyrnIYqdDBV
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Add Raj, Khem, Kexin and Zhe who know
      more about RISC-V than I do.</div>
    <div class="moz-cite-prefix">Kexin and Zhe are on holiday for a week
      or more.</div>
    <div class="moz-cite-prefix">CC a few people who have contributed to
      riscv* conf.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">I am not all that familiar with either
      qemu internals or riscv specifications so any input is
      appreciated.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">I have some comments and questions
      below.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2025-01-28 5:16 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Yash.Shinde@windriver.com">Yash.Shinde@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250128101633.3664659-1-Yash.Shinde@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>

Currently, GCC Asan supports only Sv39 on RISC-V due to custom allocator configurations optimized for large allocations.
These configurations are incompatible with larger address spaces like Sv48/Sv57.
This fix enables RISC-V's configuration for Sv39 by default when running `runqemu nographic`,
eliminating the need for manual configuration via command line flags (`qemuparams=&quot;-cpu rv64, sv39=true&quot;`).

Fixes [YOCTO #15691]
<a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=15691">https://bugzilla.yoctoproject.org/show_bug.cgi?id=15691</a>

Reference: <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=4b4450ff695ef73bf7a2437e142d2e0730d6a547">https://git.openembedded.org/openembedded-core/commit/?id=4b4450ff695ef73bf7a2437e142d2e0730d6a547</a>

Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index d01d988eee..6170ce65f2 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -27,6 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 = &quot;0x80200000&quot;
 # qemuboot options
 QB_SMP ?= &quot;-smp 4&quot;
 QB_KERNEL_CMDLINE_APPEND = &quot;earlycon=sbi&quot;
+QB_CPU = &quot;-cpu rv64, sv39=true&quot;</pre>
    </blockquote>
    <p>Thanks Yash.<br>
    </p>
    <p>To save everyone from doing the math, sv39 gives the system 512
      GB virtual address space.<br>
    </p>
    <p>Should we use the ?= operator here so that users can easily
      override this specification<br>
      just as is done for&nbsp; QB_SMP two lines above?<br>
    </p>
    <p>Please summarize what testing you did.</p>
    <p>Did you test with TCLIBC=musl ?<br>
    </p>
    <p></p>
    <p>Since you are changing qemuriscv.inc you and the YP AB should
      test qemuriscv32 and qemuriscv64.<br>
      qemuriscv32 should, if I'm understanding how this works, be
      unaffected since it has to use sv32 mode.<br>
    </p>
    <p>Did you find out why sv39 isn't the default for qemu? <br>
      If not, please check the git history and it there isn't an answer
      there, ask one of the qemu developers<br>
      who work on risc-v. It would be nice to have a sentence about that
      in the commit log.<br>
      <br>
      Did you consider a different RISC-V cpu sub-arch such as rva22s64
      ?<br>
      <br>
      &nbsp;&nbsp;
<a class="moz-txt-link-freetext" href="https://github.com/qemu/qemu/commit/3ba8462c4ca55720239fdc6fa30b9870d22a8814">https://github.com/qemu/qemu/commit/3ba8462c4ca55720239fdc6fa30b9870d22a8814</a><br>
    </p>
    <p>I'm only asking because it seems like it might be a good fit for
      us and I noticed it when<br>
      searching the qemu commit logs looking for sv39. <br>
    </p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20250128101633.3664659-1-Yash.Shinde@windriver.com">
      <pre wrap="" class="moz-quote-pre">
 QB_MACHINE = &quot;-machine virt&quot;
 QB_DEFAULT_BIOS = &quot;fw_jump.elf&quot;
 QB_TAP_OPT = &quot;-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no&quot;
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------41RqTnUq2ufKNIyrnIYqdDBV--

