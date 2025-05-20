Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94068C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:46:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16110.1747730763365250560
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 01:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72358c3a5e=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K4ITkd004700
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 08:46:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46phe8tyjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 08:46:02 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54K8k1a4016113;
	Tue, 20 May 2025 08:46:01 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46phe8tyjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 08:46:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXVFfS8d2DwK1Oko5538Xa7/g5upoRseX3SDf/uNr1UBWpY/gLwGsXDw53FfW8uyKXk4ayagybvyq2XwQtP+aCsvZ9KsOICWuNlaVhuyGQoWZ4wU9LT2UnbyJeRm2RdfmO4WA7K9qZgmmkESbAC/l6WIpDd/UOCOFUo140OWWNOifQDW/e3fH9z3k8o7LN7uuC2CdK2f3N+aFuItSFH5LCrHOUG0iWs8FrkeH41LOsZ/fG0kEMOHtfYpR3jV+bsS0Ahk33G8N6LtCzgCV5POcsKhUYjHWU2OuHbrzwiyyjaEsaeIQ3asDksw9NDlL0ZMSTXcXJp3XDh8Q8qQO/ljfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nwwl9iAjPXv4PhCsRYJswg1gSXtOq1p83w1xrP8DmNg=;
 b=l+pXiJCWgVC3eoGXVIEigCMwcua0XCiEGXiETqoDCqe9+U0EtR962Ggpr9hgcghmGEMqGHfdJ762jrFbPeEP8MkJbEZHq37UhE0PEpCL2yjtl9uE0p/lYy4JGvQTIzBtFMO4YilgBQrTM3NsyINihyHNf1AVIF20eYmewDX5fr0H3J/5kr+Pg4Zv3pqi+0+/oaJ+LgjCmDoYadczENj23x862Yw9RYXb9wPlyemu7jAbNwOCYKdGgp0S8COdAiBlVfX/bam2X0r9NVItrArYJqhMk2+7RP4WEDpENDPIcsn0xyIMrFrAkOOjRR1V38eG3TbSc4F008wp8wu0fsHDsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6653.namprd11.prod.outlook.com (2603:10b6:806:26f::11)
 by CH3PR11MB7868.namprd11.prod.outlook.com (2603:10b6:610:12e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 08:45:59 +0000
Received: from SN7PR11MB6653.namprd11.prod.outlook.com
 ([fe80::d322:da3e:6319:55a]) by SN7PR11MB6653.namprd11.prod.outlook.com
 ([fe80::d322:da3e:6319:55a%3]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 08:45:59 +0000
Message-ID: <8f6bc919-03b2-4d40-a3a1-0f42f118da66@windriver.com>
Date: Tue, 20 May 2025 11:45:54 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] coreutils: Fix file-rdeps for single-binary
To: liezhi.yang@windriver.com, "Marko, Peter" <Peter.Marko@siemens.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1747206852.git.liezhi.yang@windriver.com>
 <7d13d6ecafaaf0f06955156bcd9e19b61a92ea80.1747206852.git.liezhi.yang@windriver.com>
 <AS1PR10MB5697052E3C295B1843480375FD91A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <d7df85bb-8092-47d4-9aa3-0e0bf5f09f54@windriver.com>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait@windriver.com>
In-Reply-To: <d7df85bb-8092-47d4-9aa3-0e0bf5f09f54@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: AS9PR05CA0098.eurprd05.prod.outlook.com
 (2603:10a6:20b:498::22) To SN7PR11MB6653.namprd11.prod.outlook.com
 (2603:10b6:806:26f::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6653:EE_|CH3PR11MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: c431dad4-360e-4a2e-a76e-08dd977abe74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N1pMT3RnY21uSWJnM2poVTZWd1I2Smt3eUxJbWlaOTN6Z0laRk1EWTI0VEhP?=
 =?utf-8?B?azFTMWZidzZYQWpBSUNITDhDZVprWnVZaktQME1rWFB2a3pNRE5DMFJwdGFN?=
 =?utf-8?B?TmFmVGNpMHBFVXNUaVR6VXJCTXdPZ3JuT1hxUlRyRnBKeWdOaUxIVEpOUUor?=
 =?utf-8?B?b01LMEdNNHJJRXhXbXFScEd3WXRhaVFiTGwrZmZxLzU3VFVwMDk3dkIzSk5G?=
 =?utf-8?B?bG13TkJ4Tm4xNkExVjB2ejNUeFMvTi9vR1IyZXBoYjRNUFdMa1VjTGlBYm5a?=
 =?utf-8?B?ZkhFdUdLSEhMemU2Z0p6M283VXNaRjFSKzJMbDV3RlMvR1JWVHZCUmhNY0tE?=
 =?utf-8?B?a3RhQThNdHNmcFd5dHFuRTNxTlptQnFmOTAyQ1ZzQkUrMWFnbnY3OXQvSFhs?=
 =?utf-8?B?OUdaS25ZdUpmV283THJ0WFFVUkVHd3VEQnFOQ2VmTEQvcGxJTDk1S1JUTVBQ?=
 =?utf-8?B?b2xwZ2ErWGpEcWJIL1JzZVBSMDZhSVNtK3VmUDlzdk56SG9FOHY0alFuS3dN?=
 =?utf-8?B?L0ZpL1hKYkJKYXBrQU02SkhjaDFWeHIvV3FuTXdkV200SnFxOFJ3OExGc1Bi?=
 =?utf-8?B?OElJVnltTzhHWmRwNDdMOTY5Sk1Fby9TZXRaYjY4czFaVlc0SXA5TlY3SEZn?=
 =?utf-8?B?OWRKSDZaaGlZZmJLUmgwRStOK3ZuRGpISnZIU0h5L3FjVVErVDhqa3VXK28z?=
 =?utf-8?B?aFJRSjUzNlFWVjhmeVNhYUJ6SHhTbk5WWGJxWEhmbXdVaEZlTUVFa3ZUQjVm?=
 =?utf-8?B?NGhra0dTUk5BUllNS3NXT0VUa2crRkdkNGFCZUZyWmdGNWRZcHd0dTYxV0c5?=
 =?utf-8?B?U1Nla3RFSGVSOXVORmd0dzJVUkNaejUyeTAyakRLVlBlajQvMENNZkw5dldP?=
 =?utf-8?B?V3UrQjF4U0ZCTG9nSytEbktyRlUvRGtJL1hBa0wxY283T1hLNmhiQ1pFN3J3?=
 =?utf-8?B?Yk81VElJN3EwM2dDTy9OWGxYVGV6TUJYbFNER3pwSzhENkQzYzR6YVNuTnVD?=
 =?utf-8?B?c09BNVMvTGJBaUNCOEg2NUtoejBDb0NDN2NQaFhzSGIyMENCaDRxcW85aElW?=
 =?utf-8?B?QjN6cHg2YmVVbUEyNXA3WEZjd0hsa0cwQi9XMFNTOXcrWEtGLzJIU3V6cmNp?=
 =?utf-8?B?V2lYS2V5VmE5WURrUDY3Um4vRDhhN2RUczZ4K1hNelJWSzlwVjRwZ2tOM0NU?=
 =?utf-8?B?TGM5aXN6VnV6TEZPTTRCUFQvbDlSQm9DV0J5YmtwQkpVaFpkaFR5QnFVVlF6?=
 =?utf-8?B?Y0k4UlpEWktlR2lhNUZ4MlZwU3BJMUZOdEFKbVJURENyZWprTHRGRWM1YlJ2?=
 =?utf-8?B?aHJSeUhROHNvc3BuWVUrN0dTZm1xSzgzczhIbWZtVTVEQTN5M2NzQ1doUWNa?=
 =?utf-8?B?SGpTVmFYK0poLzBCREFPSXg4N1V0RDIyQzd2RWhzZ1NCSCswNEVORDVyb2N5?=
 =?utf-8?B?S1FraVgwdlB0L1M3U0dlS2NXWFFsbmJ5ZE1TTVBRd01mWFVYQ2prZHNVTnI0?=
 =?utf-8?B?aFFUbWJWeWtiRlJ0WnVXSUFFbHpNYVEvN2V2NjNSZ3c5Z1VCeElVN0g2TXEz?=
 =?utf-8?B?N2EvaFRyRWxYb012cTFEbis0UnNMYkg3M3JXWG5icGQ0NXB0VzVIZEMyd1hz?=
 =?utf-8?B?T0VwallKVkE5WTUydStBTTU2RmRvdExreUpqZkFHVzFSc05ZaFpyd3BHb25U?=
 =?utf-8?B?eUZDUFBzL0J5UURXT1lhQVdTVVJlQ1Q4UDU5M1lKWGNRdTRPcXJIMjZyRzJZ?=
 =?utf-8?B?RWw0TEZjZHRXSmZIT0x3Z2pnQXVzM2JQNFUwY3dhUFYxL0dVM3hmOGdQRmk4?=
 =?utf-8?B?WTZEdTZjekp3ZU9pYjdRZVBZT3dwU3Fna2x4MjZ0MlVLSklIY2w5bmJyWnZ4?=
 =?utf-8?B?NnQxNG9qdDRwb0Z2dVFOOGtpZlArRTRVcUtERGtzcVYyRFE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SXl6Y0Q4eExaR1IydWd6TXN2NHZxMVRKbWNQblFjZW1MamlHekRuaU50YUpY?=
 =?utf-8?B?OENNd1VPcmJheGh2d0tLTXNwQitWMEtTZklEd2ZhalpvdHgvWVJycjBub0pp?=
 =?utf-8?B?cVo3KzVpdmd4K2ZhU01MQ1VsN3ZuK0RHL2dROVJoeVpId1ZsM2NHcTR2V0tv?=
 =?utf-8?B?TWEvajlWT2l6bGZlRGlDTHpGZ29OY1dNSHArR2N5dVNBWEI3akpnZ2ZyK1Js?=
 =?utf-8?B?RXFoVVR5dXlsNW9QUXB5NXAxQnRNWXZHcVlTTXBzMVpYS2gxZGNoY3Vody9U?=
 =?utf-8?B?REFmUzRNeFBDUzFsbXJCM3FXZmNKbUc5bHN2TWtpdVJ4b3FWU0d1b1hPTm14?=
 =?utf-8?B?b0RWMkY3T1JUNXIrTkZVQjVXR0JxeGdtRTRoTUF2eXdQMXFuc2RxaWQzd2RF?=
 =?utf-8?B?Z29QNjZXb0ZCanFXbnowNlRZek5Ja1ZicHlHTnFYYTIwVkNkU000a3VDeUtC?=
 =?utf-8?B?b1ZEK1JCTDZYOGxWY1k0dUZvQThkVUZTcHlzZ0JDSFRveXlDc3lhMERiQVNh?=
 =?utf-8?B?MVM0akRpMzF5anpaK2FvMkJiYmNwVjdJazlzenBGbnRuY0p4MmpQRmgvMC9J?=
 =?utf-8?B?SHFLNFBkMW5RdGczZ2lkMGloY3NFemFWQVovZ2p3cktFVEVvRDlVdGIyQlJD?=
 =?utf-8?B?ZGlPOTF0M1V4cFNuaVV4cW9lUFlEZVh3NTB2NHNZQzVFL0NQL3JRNTVKSm5Q?=
 =?utf-8?B?emF0K3MxM1lES0ZaRW5VblhIaWVMN25PUXB5RHJmS1RUVk5uemxReTRyQTZs?=
 =?utf-8?B?WWdCMzlEWVFVUHU3OVF3UHVIU3ZLdytCZGlPNmtOSEtydkF0RXlZOHZJNmdH?=
 =?utf-8?B?UmZaaTdtNmdhZmtML2pNdVVic0NwK2NJUXpEa2g4S3RKc3gvL3F0cEl0ajJm?=
 =?utf-8?B?cE55TExCOUMydUFYSFU3WXpML0NLUUJoMzNOWkN0ZjRydUhsVVpubnRLbWJh?=
 =?utf-8?B?VEp2a2FIZmhWS0Y0MVN0WUZSUEtXQmNZTjFVcWxyWmNLMlBFN0Z3Y0JQc2Fr?=
 =?utf-8?B?c21UcVdPU2YycUUrZGhDOXM0T29CNnltZDZrKytxb3Y1NXdYUmZLalBGcUNi?=
 =?utf-8?B?ZEdGNllLQWRkT3dLOWdlbEtzYVUvK0hReTJYOTFaNXZRSEU2MUl6c01BM2ln?=
 =?utf-8?B?aE1oOHlKT3NzNGYzMStEbHR4Z2Ntck9sbjh6dnJ5RS91YnNiTEJEYWZQcUVS?=
 =?utf-8?B?dkNGMFJRMjhTRTgvM3JKa3VxVmFURkhvbWJJWnNJbFhDYS96ek5GK2pGREM0?=
 =?utf-8?B?aTViSE5wKzR6elFURXdtd1dDZkdrM2VLWkJsbzhBUExCQ3QwZDkxQmJlckcz?=
 =?utf-8?B?ME1kSjZEN0VnZzZMK2RBZ2xPUXREYWJYWi9uVVg4aVJTTTRPSDF5cGFlVkd3?=
 =?utf-8?B?cEFlekoyV0lBWkpNcTA4QTVsOXI2R0lvdERRcU9sYWlQRm94WGsyTTA4ck9n?=
 =?utf-8?B?djZTZi9rVlEvanZ6N1VWUnNYRnAyOC9CS0l3cTFib0N1TjFKRm9udDRKU040?=
 =?utf-8?B?aDNWWmNwWjZDSXUvWlZXRmFUbFpDeWhJTlExcTk3SmpibDRCK3ZtVytaaURY?=
 =?utf-8?B?QVpVTDdqUnhYcUlBSnpwVTBHTXFoVC9reHVqa1pLZis2NXJib1puaERWOFFL?=
 =?utf-8?B?dTFzcFl0cGtDaGMrbHdjL3Y2TVZPUndUeVZ3NFZPZzN0Ti9DRmFUdGFFZm9J?=
 =?utf-8?B?TnFsNW41cVQ1OW83T2hzcXpjaXpHU0s5ZWVKeVEydG10ZFFXSVFFcFlUVWV0?=
 =?utf-8?B?YTlZNEZ5bHp4Zm9DOUh0cU9Bb2FvcE1wandkMmdjckM1K0lBbjNlQ0daQk1U?=
 =?utf-8?B?eFNoRlJ3OEk0TVlXUkorTkMwSWNER0F3R3BZT3RlU3N6eUcyM1dFeXhVTGRL?=
 =?utf-8?B?SzVDT0NtSExzM3V6SWRjYjRLeDh3dzJvdWlaTXovOXR2VzhRTHdzbEM1R2dQ?=
 =?utf-8?B?eFFpQk9HUU1BNHhNcWtBRjBsTTVnS1Q2OEZzYnFVQVM0clJoT1ZVWFhTeU9M?=
 =?utf-8?B?YU1BZTJaUEQ1Sm5ROThJb05FUWhReTlTQ0g2VDVrdi9BbUFpZC9EUk82QWd6?=
 =?utf-8?B?UGJRUDI3ZXl2N2VQUWpDUi9BY0pEMTVIK25jZUdFT1p6U0ZLc09HYUpyaVRs?=
 =?utf-8?B?NnFJb09ITG1NdlNVK3M1RElNMFlNbUxPWVYraE5ZSmtFVE40eEw1M1c1ODlR?=
 =?utf-8?B?bzZCT1JweTQ3c2RoN0pSNUwyWS9uRmhKeWtnb05vNGMvYVgrZWJFcm5seS9J?=
 =?utf-8?B?Rk9aTUdmTXlIZUFTc0pIdWhqd0V3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c431dad4-360e-4a2e-a76e-08dd977abe74
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 08:45:59.5953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GAQNkuMV73E3Jw3t8I7gOUD+y0eNajrSNglcpk4bR+JNB4nLM2EGJCvsvzxGQmU7WcHdql59DXC32HdxGGct9WAxVZ3BgY+vS9Kn1W+Nf6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7868
X-Proofpoint-GUID: yUYj8VHnjMz25XFifasrSmpUE_AxV96q
X-Proofpoint-ORIG-GUID: Dx3x_hoBYl9wBswvf0W9BsuVw0AYFZmc
X-Authority-Analysis: v=2.4 cv=arGyCTZV c=1 sm=1 tr=0 ts=682c414a cx=c_pps a=50c+v8Vu7SRZtPLyLAZfNQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=zD_pd4pwYoAU_ZZq8-EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA3MSBTYWx0ZWRfXwDiQmOPJDwP5 pUeR26ulTyvrcSweBtnxvljQ4ecyYgU0OK2XGQhMYUp+gWcw3ja1PdL/k+vikiiJiQ2mHBqN4k7 7/y1dCMxTR1uVbB2jO2kAHMqt9bClIKMOxLJxTw051hiSV9Sra8UdXw0PjAemCUq7jvelSCow18
 x/Qr9560sHxBu+VIO+DOrynF50wS9SKKCIpY7VaJ8r9K0IoseCM0cDjbybEGm7iRoXHJKKtKXgq 3qKULcSMNoXeZdf4OKEsbtmeHQxj733pi1s+uHokZAUbJMOdgesG3q0yvWkM7pPqyhtPlmnNxAG C8NDYxJWzGY5nU5rrfsjmZfM7b4NwI5FrhT8LM+0VSdBtFhFbRLD8Cf81f/QFid9k/AmSfGbigI
 51JtyA2ML9o9glvzqt6nk4y7wfIaoT8l4+UDJiHUz82+fdys7aQCC0kXB1RNz3AZiDs+BZ23
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505200071
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54K4ITkd004700
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 08:46:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216891

Hi Robert,

On 14.05.2025 11:41, Robert Yang via lists.openembedded.org wrote:
>> -----Original Message-----
>>> From: openembedded-core@lists.openembedded.org <openembedded-
>>> core@lists.openembedded.org> On Behalf Of Robert Yang via
>>> lists.openembedded.org
>>> Sent: Wednesday, May 14, 2025 9:17
>>> To: openembedded-core@lists.openembedded.org
>>> Cc: liezhi.yang@windriver.com
>>> Subject: [OE-core] [PATCH 1/2] coreutils: Fix file-rdeps for=20
>>> single-binary
>>>
>>> From: Robert Yang <liezhi.yang@windriver.com>
>>>
>>> Fixed:
>>> DISTRO_FEATURES:append =3D " ptest"
>>> PACKAGECONFIG:append:pn-coreutils =3D " single-binary"
>>>
>>> $ bitbake coreutils
>>> ERROR: coreutils-9.6-r0 do_package_qa: QA Issue:=20
>>> /usr/lib/coreutils/ptest/src/yes
>>> contained in package coreutils-ptest requires=20
>>> /path/to//tmp/work/core2-64-poky-
>>> linux/coreutils/9.6/build/src/coreutils, but no providers found in
>>> RDEPENDS:coreutils-ptest? [file-rdeps]
>>>
I noticed that this patch was merged. It fixes the coreutils-ptest build=20
itself, but the sdk fails to build with this simple setup:

local.conf:
DISTRO_FEATURES:append =3D " ptest"
PACKAGECONFIG:append:pn-coreutils =3D " single-binary"
IMAGE_INSTALL:append =3D " coreutils coreutils-ptest"

bitbake core-image-minimal -c populate_sdk

...

Added oe-repo repo from=20
tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/oe-sdk-repo
User-Agent: falling back to 'libdnf': could not detect OS or basearch
repo: using cache for: oe-repo
oe-repo: using metadata from Tue 20 May 2025 07:24:39 AM UTC.
Last metadata expiration check: 0:00:01 ago on Tue 20 May 2025 08:25:20=20
AM UTC.
--> Starting dependency resolution
--> Finished dependency resolution
Error:
 =C2=A0Problem: package=20
target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target from oe-repo=20
conflicts with coreutils provided by coreutils-9.6-r0.core2_64 from oe-re=
po
 =C2=A0 - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_tar=
get=20
from oe-repo conflicts with /usr/bin/env provided by=20
coreutils-9.6-r0.core2_64 from oe-repo
 =C2=A0 - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_tar=
get=20
from oe-repo obsoletes coreutils provided by coreutils-9.6-r0.core2_64=20
from oe-repo
 =C2=A0 - package coreutils-ptest-9.6-r0.core2_64 from oe-repo requires=20
/usr/bin/coreutils, but none of the providers can be installed
 =C2=A0 - conflicting requests
(try to add '--allowerasing' to command line to replace conflicting=20
packages or '--skip-broken' to skip uninstallable packages)

Replacing the hardcoded /usr/bin/coreutils shebangs with "/usr/bin/env=20
coreutils -S" seems to fix this.


Thanks,
Ovidiu

