Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B544CA1007
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 04:10:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4450.1756872656186907993
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 21:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=sRwckmWe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1341cf759b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58340Vxd3586072
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Sep 2025 04:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Nws6+xHBXb4noru1j5xfQh4ZXkvHXNh/Zap9QKAuY+Q=; b=
	sRwckmWee5MlW9SCivol7/P5ujjzVKAqdLPzuWwQEBdqjK6Ek7WMIgRLGyjL7kXF
	Jq4jNYZE1xn5agEb0Kxcfjdq2zHnCNejEQcgpuOgSFZTJsQTkXm4pJKJBbYPkFL4
	ClN0eoG0CVsgVm1AWU6JK5G3N5jEIlmHf75hC3v3s7QNn/0tNC35o3SfXat+fFMH
	OPf/86uYtcZ1txLM8/HBSjCry9DqV+NIvy9bG4gx/tyVS1E6o6b3OIsWH3sg9WTU
	Bi8NhjeUYUlIHR4iC5SANAGNaTpqTeMdnFJf/EzGPMyr3XuLszPPVNRN6JaiEiGr
	hQXcbsOjvRPWiJ4JzoCE9w==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48upgykkv0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 04:10:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgiOzArLGiBknOwTNdiazSPEoUviy8z7vJksK50RwW4s/EpX8WmVBuOtvT/lkzPDDArTuglKt6ELdbit/Q5TgE6xTcNKLh51h6PcuQfShfL2ShPbv8bERpThSgLWk6JYYNvxTeh+Jk4yGo6qdbPdfFr7ah10xkaBkL73fU9QFGg6vEdLKtn1dlKnWVe2L2/TgR0MVG5NuzzVRCYVVhojEcRZGJaGuqXDbY+xb9Jc7AxcOS9P5z9P+Pww53i6QVoejPA8iCTFFKO5R2Jr4ukgB9RCCqLhuBUTEEjCDaJE48BiqNjBAkFAlZzx2mfvX6HecuANCO8vjM5eqcqAiRNBtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nws6+xHBXb4noru1j5xfQh4ZXkvHXNh/Zap9QKAuY+Q=;
 b=LwZ8NXaCQW0fLUvZxPx9nwT2w1oLi6DKuGodb/UXXNbIfgazSPexcv7P+rw/CuMesb76i2WOAld+N4p9memP1DgdWbMXKsffBpaS5kQoEHStn00ZL5ZKeqVtjbTVpCFaozNNbxIrHjTmlt5ojm+65+lhXEP/mCDap2Q7m7g6lotvZwU/3F+hdVLxysxuVS0Hwq5WlE5FdJIwd3rf+UoR8q2FrWObxtJO/BoKUHKGfatpyeiWvvM4euX1VBBve0FgzVHyALOcmjaHtPv6CszGEQMJGDqN2uOT5mJcet67LQQXDV+3QtyxEVPxuDDXGdsUDUy628nGjm+LMwHqbp4Q+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by IA3PR11MB8965.namprd11.prod.outlook.com (2603:10b6:208:582::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Wed, 3 Sep
 2025 04:10:51 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 04:10:50 +0000
Message-ID: <93b2e327-eeae-4840-ba13-2d8fe4044c1c@windriver.com>
Date: Wed, 3 Sep 2025 12:10:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/2] automake: 1.17 -> 1.18
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: ross.burton@arm.com,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1749554012.git.liezhi.yang@windriver.com>
 <3a20c600314b7acb3eb3015583a6cbc4ceb4970f.1749554012.git.liezhi.yang@windriver.com>
 <2420FDDE-F7F7-4A02-8696-66554E56924A@arm.com>
 <b38d42b5-c6df-4bcf-bdeb-b3cc32808e1b@windriver.com>
 <87a6b6a1-c221-4d26-946c-d9c7deb5bac7@windriver.com>
 <CANNYZj-yPFRibYvBsz84hv+wB2VG2yjU_MQoUU_W73+D14KHqg@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CANNYZj-yPFRibYvBsz84hv+wB2VG2yjU_MQoUU_W73+D14KHqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR06CA0241.apcprd06.prod.outlook.com
 (2603:1096:4:ac::25) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|IA3PR11MB8965:EE_
X-MS-Office365-Filtering-Correlation-Id: 952d1c93-8af5-4f73-ec90-08ddea9fde30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K2pjdU9VTmpyZWduNjEzcHpDYW9Wb0xDbkN5M1FMajNlL3h2dmlXdVNJY29I?=
 =?utf-8?B?dm9zOEZ0eERxZHVTdFpaVFFkR3NDdUtzeUtqU1Qvb1lIQ0RkeEhXbGNzOFlZ?=
 =?utf-8?B?WEMwVkdmMVp4NlYzMzVuYzJFUnc3ZEpOeHV5emw3Umg1U0xoQTI0NkdnbnpP?=
 =?utf-8?B?K3ZhbjR1dHBkcjJsYndPYzRLcm5MREpQa1NmTFdxNlZ5Y3RiRWM2SnovKzk1?=
 =?utf-8?B?YzFmMnlScndmSVNSUlVZT1hxNU4vMERUcXBFQjJ1bWZ6TzFWTk5Pa3lkTlFW?=
 =?utf-8?B?WThBNUErYktPY1U5Zmo1RmFHVm5FRkZvVWVZRWZqdE9RV1V1ckxEaXRZQi8z?=
 =?utf-8?B?U2JnR0xZT1J6QjB1NGJhMm9RVW1rWUZxaHl1ZTNIck1nZENtNUZ0YWRGSEV6?=
 =?utf-8?B?aWc5MHZjbGdWbmFCTVBBaXZHQTJhYWNaNEhKZVppRTVSVmJzSlRTZU1lb3pE?=
 =?utf-8?B?SG4vUkNmS1RBZ0w0M0ZnT05UbStYVUw0ZE1vZUpseFlKUUo1R3NUOTRUZVpY?=
 =?utf-8?B?QTdQNDFPdUpsRWJkSUk5eXUvazEzSG5BMkhQc0dDcWtXYUpKdml1RHJWanZs?=
 =?utf-8?B?dWRvQUxkN0Y4cmlINnlUTGt2K0xOd3ZuWUFzcnByN0ZGb2svdDRwUTNUMVlP?=
 =?utf-8?B?aC82MS9ldEFCR3hJZmNJajBPVGZTRW9GS3BnTE1mY2RMdkJhZ0JScU9tblk0?=
 =?utf-8?B?dnlsbSswZ1ZmZExxdGY3K3ZXRXE1c200dWNkVWJhRTZUdkhLYlZGMFVzaUYr?=
 =?utf-8?B?U0VFVUlhNitsMER2Y015K1VoQjd2QWM4Mjh6aUtFRDVhRGV1bEJrRThTK2ZD?=
 =?utf-8?B?TUh1aVJDc0oxcDRpa1NTdlA5YUFhY0x2M25mbEE4dmkwWkNvN2N2YTBLbWN2?=
 =?utf-8?B?bUVVamtxNkJ0VTcxZ3I1NDRZSHRhbFVnYlBkY254TUlqaVpwVEM0ZFQ5YlZS?=
 =?utf-8?B?YWJVRHN0Zm5RYVVjTTNMQVlRbE5nMWpudThMV0E4QTMwWDdmdG03OUZLRDla?=
 =?utf-8?B?TUhMVTcxdjhlRkxkeXpRVVB0Y01RbitEQVhyaGN6QWtvSVRzSERYOG9DUXZj?=
 =?utf-8?B?eGRYK2dycG9LYkN0c2dGNklwUjdSUkNuSW1PMEh4Vm0zUFhRck9uMmhqQ0hP?=
 =?utf-8?B?anZuN3MvWjRoenYwM1NMeFRYZ1ZycVdMdlJ5b0NNdms2M05UYzQ3RUJwQUQ1?=
 =?utf-8?B?aEY1TWpMd1VNazFOM0VLaW9qL2hzdkFtSHdjQkZUa2djR3VYZ2NyZ1J5U1Y5?=
 =?utf-8?B?RWExTERqTWZXK3gzTkVncTcvS21RRnJGY3dmMXNJQWd1eEdCTUo3WlFOYTBo?=
 =?utf-8?B?ZjdncHZFQTJ1a3o1ZUwvZWpnL2xvVERlSDhxQi9Na3FSMlhEMWdGRFBLaVBn?=
 =?utf-8?B?MEZ5T00yeFZYNGhKbzZmMWQvUzlhcjRRUUZpMG1RZ0xKWVhTRUlDNDRWTGdF?=
 =?utf-8?B?SlRHNVZLdjlUZ3Y4UkJWbVg5K1R6YWYrVFZqYXhLQjVhN21yQnUxdStDdUNr?=
 =?utf-8?B?M0tHOHYrWVNYQmc1TGhhalR3Y2M0VUhzb3RuK1drd1VjbUtkUzhoK1FJR29j?=
 =?utf-8?B?c001VUNselRyZGQwVnExZ2RJSXFRWlJPdWdqcmNoMi85WnFmUno1S0FjTlhj?=
 =?utf-8?B?WXR0YUt1aUI1Y1k5RUNiQ25FRWV3OERacFBnOHJaWDZKTFd0ME81N2VxRkdR?=
 =?utf-8?B?WEQ0RXhRaEQrbGp3NVhqY3N0R2xFOTJHRU1ZK2M5czk5RHVwVjJRaTNOc2VW?=
 =?utf-8?B?RUFSSExDTXlUTFRMdllnbGVIYkRNZFpLMm1TWW5xKy9GQ2ZEUEZCR3JzVGV6?=
 =?utf-8?B?azZrVW1IbFNHcnJnazRiQWM3SEVPd2FQTGZwQ2FLU1VONGJrQmhjWCtGUGZQ?=
 =?utf-8?Q?v5W1L9mv0Qbiy?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WHc2eStUZTJZbUVoTHVGaGxsZ0ExejFIS0NkNVViZzluTVhBbVBqeDBNWWJh?=
 =?utf-8?B?NU1ob0hqRFBPV29JKzdFblphanZwQ2dpNFVmMUJRamx4K1R2ai9iUU1INVE0?=
 =?utf-8?B?cEdDRWNkNTVHeWF5aHlLb2JlbHRtdmV6alE0bWhVR2dNdlllTGNFcUhETjA0?=
 =?utf-8?B?dGo1ZDRhQzF3dkZrZ2lvbTYzSHZhM2RHMTlXTElIR1A3TS9KYllPQmFmTzlX?=
 =?utf-8?B?eVJBTHFZdTg2a3R6Vy9hNTNoV3dxM0x5aDI4RklkdE43eWVXbHdmOTlOSG85?=
 =?utf-8?B?TXVzcG1BVmxma1NZWG90S2xXbWFCMzR0ODN3dVVPVGlPcDd2MEU1MUFwTEtF?=
 =?utf-8?B?THRVVXlVTWFmK01uSFlYT09HNllxZmRrc0E2ejZYOUlNQUt4V3JRaldwUmNX?=
 =?utf-8?B?ZExGaHJSeCtYakNKYlpVa0s3dGljMUQ3THUyYkhRNDB1U1RjRGQ4T2ExUEZs?=
 =?utf-8?B?WjFuUnhzdXBkOWlOR1JaTVNZa3gxRDRqcEVqWUR5UXJ2Kzg4Y1pEQXdNc09s?=
 =?utf-8?B?UFp6YXM0YkdYMjVaZEFtQmpiZ2pTLzUvY0xqTys2UGh3LzBqVStZcWsrUlZI?=
 =?utf-8?B?UVpTekNZTHdmc0FGWUp4WXBxMmpQUWUveERKSFZsMk01aUc0SW12Sm5BTUtz?=
 =?utf-8?B?UDc4UTRqNjNucHRtUWNXQ29Dc0VKYlNnM0M5TElZd3NsWGJFR3diTXZqbGlz?=
 =?utf-8?B?ak1icVBxRTQ3SzE3cmE3Y3c0UUJOR1ZoaThxT1JvR24yOFFydFQ3MlUwTnpx?=
 =?utf-8?B?cUJlMzRuZURzcUx1N0ZrQUxaZjBINjg0Rjl6SjJVcjhxODJNV0tkekY2dmxZ?=
 =?utf-8?B?amMxOWVHSG1hR3FDUExzZklhakl2WWhrU3FMMzN1djZ0YlBCOENnYU5SWTkr?=
 =?utf-8?B?K25MTTVxQ1RFQnBlVXRMMVJTblhMOStZQlpzMFVNczRYam5qYzA4Y3ovY0Ri?=
 =?utf-8?B?bnJhUFAxU2RDZzNleWhCT1k2dWhZMk1hSDRlcUUxb29NMU16SlZCVlliLytj?=
 =?utf-8?B?QVZ2eGI0cTRHNEdMYXVicHFyR2Z2QWxiaWg4WkxBYysvOWRKYjMvUEZQVlly?=
 =?utf-8?B?TDdtN1I2YW04WUs2eEhEZk5NWlhBWVk2L1dkMUM0aFVRSXdCUWhIWEFDNWVo?=
 =?utf-8?B?YS9kV2ZSSEROZnRFZmpvZlB2ejVzZnBwRUpwZklmSUlCc1pFaEV1b2hNajhp?=
 =?utf-8?B?SjU1UXlnekxRWFd3K3A5NUIvRnBJS09rR3Ruc1Q1Q1pDL0NnRm94NWJNWllQ?=
 =?utf-8?B?ZVh6TklhRG1SQUJDcmtrZkNwTmVRSDZJSGxVTys5OGx6WkJadE0yaWprd3hs?=
 =?utf-8?B?VmlVczNHTmVRNy9rT2xpMWJBdVI4SjZ1TWlpRGwwNGkzTVY3STF2dnVsN2tl?=
 =?utf-8?B?d3QxMTBTVUhvRnZzc0I0SDVLOVNHN2Y1YUFkN0YxellkV2NUcndzTGthbVQ1?=
 =?utf-8?B?c1Zqdyt2REZUVm8zOTdLbjIxTFhyWUpWalJEL1RDajFJVUNrbTdXWTJYYndX?=
 =?utf-8?B?aXZndS9JNnRnRVZUV2lNenlHVDVLaWZmYVIrS0E1aU9USTV6cmZMdkkxQ2xm?=
 =?utf-8?B?eW5hTEw1dFdNOC90c3lzVjVDcUZOMVFwVDEyMWsyQmhxL0krbG9YekVEWHIx?=
 =?utf-8?B?RUlJVGxPL2ZtQ3BmZC8zSnY3WmVUZmcxMTRIRmRGZjljYWdkU2t3bnczSEp5?=
 =?utf-8?B?dytHd0s3T1ZjUWJsUmROMkpWR3ovekdiTytnaks5V2h6UFFxR2lndHdNbmJF?=
 =?utf-8?B?NGorMTJiRVBsd08rWi9tS3k0c0J5ZzBkWnF2QWJzT3ZyL0FMK3JTTEJVcUZE?=
 =?utf-8?B?YnpSOVFrSGs2YUJtSjU0VldUb1NSc2p3NUlldGlia1NYaFRuUmV4dnk0Uzh4?=
 =?utf-8?B?MzV2dms4azBkdTB6U1BzT0t1eVpSemt5RWpEZGwvVzhqM0EyejNLUU5IOElC?=
 =?utf-8?B?ODRsODN2cFFRd1F1WEFFNE95Qk9VZ2FFNW1hck9JN3hVaEtsOFhnSGw3aVlt?=
 =?utf-8?B?NnRtd3hwazdpdFAzLzdKMFBkVWhjQ3ozdkdDR0NocTZnUmNxelBESnJBYmoz?=
 =?utf-8?B?bjZLRXJ2YjFKaVdnSjRQb2ZoVVpNNDVnZ3ZBbHlJSktvUnRydVZXcDVQSnA4?=
 =?utf-8?B?TDZMTHY0by9Xb2FOZkdyYzZ1bnFocUpXMTJmZUZPZkUrNHo2TkNacGZoSWZ3?=
 =?utf-8?B?cnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 952d1c93-8af5-4f73-ec90-08ddea9fde30
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 04:10:50.9188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UsfgVHuQiDv/gllov+I55FIlluQpuCCe/5wgLzoplSP9qWU5k4PlTIM1SJ5G9BCXSmpaq7LUSXShpHsU7qa87xejU9sMJGTZNTKvOgNEHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8965
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDAzNyBTYWx0ZWRfXxvoGXL8xlStw
 iX5k3JBEDy5WBYvwoCJXLcXpQ0C9fso8zdB4nGZSKyrjPxUaQSt8DQuCHj2+FhcrVweho+dDXLd
 wF/sIzx0PHTVfIslavfJfEQTRv5dT9Btu0eNrsi0e7V3fjDPb03zANLZOYdWrKgBBPzMc+MbUwb
 6ixp51EKkOthD2ASOADXp3FLtJYYBnQ63hvWC/MAfQEOzLZhEIwu0fSkISGdK3m22Wqn2ZLh+Vu
 CA35k9EOiQYTxF9ogJujf1JhXHBakrZLRDAvTM44fxhTKeJvYGAtnSqWu1pNC8exvrcLlSVgz54
 koQIlWGl/+i3ISwIY3UBmyW6GEF+DjcGWULMwb4jHIjRk+PrLpKLDT3rGRJsog=
X-Authority-Analysis: v=2.4 cv=eubfzppX c=1 sm=1 tr=0 ts=68b7bfce cx=c_pps
 a=0GGOvrlzKm2lUc/5HzQn3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=AJu5Q4vYAAAA:8 a=pGLkceISAAAA:8 a=ZhfoaYUP10YBcz4ZzdgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=1OHxEZ4uPFp8rhvYjniX:22
X-Proofpoint-GUID: xhQOVeL4NNU_Lf-q5k6wje55bkqu5DQ_
X-Proofpoint-ORIG-GUID: RHzdEKL9Qtj8DU4SPddQZ1mLMl4D0oLt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58340Vxd3586072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 04:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222840



On 9/2/25 17:42, Alexander Kanavin wrote:
> Robert, can you rebase to 1.18.1 and resend please?

Yes, I will.

// Robert

>=20
> Alex
>=20
> On Mon, 16 Jun 2025 at 17:38, Robert Yang via lists.openembedded.org
> <liezhi.yang=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>> Hi Ross,
>>
>> On 6/10/25 19:32, Robert Yang wrote:
>>> Hi Ross,
>>>
>>> On 6/10/25 19:21, Ross Burton via lists.openembedded.org wrote:
>>>> On 10 Jun 2025, at 12:17, liezhi.yang@windriver.com wrote:
>>>>>
>>>>> From: Robert Yang <liezhi.yang@windriver.com>
>>>>>
>>>>> * Drop 0001-configure-don-t-report-error-when-the-path-of-Perl-c.pa=
tch, it is a
>>>>>    warning not an error any more, so just drop it.
>>>>>
>>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>>
>>>> I still request holding off this until the rebuild problem that I=E2=
=80=99ve seen has
>>>> been investigated properly.
>>>
>>> I've replied in V1, did that address your problem? Or how can I repro=
duce the
>>> problem, please?
>>>
>>> The automake before 1.17's mdate-sh couldn't update libcheck's
>>> doc/version.texi, so the doc/check.info wasn't re-generated, then we =
couldn't
>>> see the build error before.
>>>
>>> I think this can also address Ross' question about rebuild libcheck f=
ailed
>>> with automake 1.18, it is because doc/check.info wasn't re-generated
>>> with automake 1.17, then we couldn't see the error.
>>>
>>> And for other recipes' rebuild, I've done the testing with:
>>> $ bitbake world
>>> Edit autotools.bbclass to triger rebuild
>>> $ bitbake world
>>>
>>> All of them worked well.
>>
>> Ping.
>>
>> // Robert
>>
>>>
>>> // Robert
>>>
>>>
>>>>
>>>> Ross
>>>>
>>>>
>>>>
>>>>
>>>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#218830): https://lists.openembedded.org/g/openembe=
dded-core/message/218830
>> Mute This Topic: https://lists.openembedded.org/mt/113567518/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


