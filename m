Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB9CFCAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 15:23:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.54836.1758554617275193804
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 08:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=ovEFLuER;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=136061f5d3=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58MB6scD870658
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 08:23:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=wfXUPozmfDIobbVGTzeuyx0iMuefWdR2tl4ZkNC4/UQ=; b=
	ovEFLuER4mzB+8Ispl3nTdJJs7kddgswkHh1PlVG8RAxzGmpaEq0V2KsL3PKjt35
	odrg4npwxXbXaJ+cRFxlsor2nKwveEJPKnCv6xkZ1L4UOzhGKBRISj6eH0I5oQ6z
	Q9VvWTw++dEdEgZ4XnLFCFf/LZK1ky+KEbnDdBQFDngTlasT9dtyHKzVp0Q9ltox
	7FvFTH98UscquIP82vIhiXBSx2l4hKoCWJOIo1NGUp7ViL4/k/iUcDVlH0YSxlt6
	enOwiq+3PUbMZbpVtosAHaC2J9KLkRaQJuB1Wu0fiDz5GCHCaVzJdHTydnfp1Em+
	LcRdD3jfuycceN1V1C7PWQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010013.outbound.protection.outlook.com [52.101.46.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499qj2ssj5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 08:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7bEwR8F1dNxrM/qmO4+v3IzrrT6oIj0AHCYuTJ7haSVRDkMTHIFISEQWimYBB7B+H6YQFAiecUy9r8k2nShNUX1fFr99zbtR3uVtpgCMk/WqOshX5g0sBenhFlRZKkOxRqSnO9AL29nz8QxGJRDdOBPN/d3SxW7jSbC0gNm/CrxDG/AinfcRXSC7jgyxZLosjv7kRsCwIgMTYmzDTuoGH4Ki0uNyEZGYzqVdeTJ9qM173036sgelHXLGNnZDXjCTyRGDun3JlRTNoX1yYmiNmTKLAKKP8qxmK7XSKUSxbA/eVlIRpups3IClUeXQDWU22li2fOBWGVd3tfi0/3RcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfXUPozmfDIobbVGTzeuyx0iMuefWdR2tl4ZkNC4/UQ=;
 b=CKqbhGx5iP+j0/DkcxhwybEJVvykt/A+7AAlFqwWrb/JzeFwjWjG2uYydoEfXJU7nEIUDodF3R6LmsV2qU8kbDnefubCWzM4fkvxXuhiC/FcT+qjCryDADTFZcCHHfRT5eWUTpQ7NilOor1ht9btqlG16heHjlr0vidaMwePj+5qC0dk9WSFxxfICwmsXOnh7v10L6xc6x7eq9d1x1oMn/VTDGR0ihyOkWVAZw05PomJGv/jNiJ/aCm1NGTM/+9/0N0DDAZaOgm5OeF/UZ3zJZH1BoE6roxLpy0wF0g0pjde2pIxM5dHI6eQZaO0kx71kL46QMI61If5dW7Na1AsnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Mon, 22 Sep
 2025 15:23:33 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 15:23:33 +0000
Message-ID: <cdfe72a9-87a4-431f-9f27-e29a1298f434@windriver.com>
Date: Mon, 22 Sep 2025 23:23:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] openssl: 3.4.2 -> 3.5.2
To: Steve Sakoman <steve@sakoman.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1758250424.git.liezhi.yang@windriver.com>
 <c33930b39db477506067200c5c4f19cec0079b95.1758250424.git.liezhi.yang@windriver.com>
 <CANNYZj8_iTg7ukB=Zhimh5cDuUKs520AojDta3UyM7jDHFscNQ@mail.gmail.com>
 <DB5PR02MB10213D9AC1AC7D4603BD982E4EF11A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <859a5fd7-7293-406c-a1e5-a4b0737914cb@windriver.com>
 <CAOSpxda7Jdtm0ewuCQ2JSoF_E7r6NKs--q1_4YUa6GsWUof7OA@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CAOSpxda7Jdtm0ewuCQ2JSoF_E7r6NKs--q1_4YUa6GsWUof7OA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0313.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::8) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|DM4PR11MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: 06fba675-adad-4b73-3e22-08ddf9ebfe39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TTdSRjFhUFpTeEZzOTdsdkc5ZmJlTmdMOFIzaEsveEVQVjh1bU9McTBuVkxL?=
 =?utf-8?B?RHdycnN3Z2JkTXlUaVlBekRsZzRkYW5oV01UZGw3UkliZm5lYmZnajEvQ3ZO?=
 =?utf-8?B?L2p2S1JobXJxZncyWllpYVk0Zng2Qk1SZWpIVEhIQ2doZExibFpGTjFndkZI?=
 =?utf-8?B?UUIvYldzOHJOQy81dE82YS9uekFCZEpNWXFnL0FBakNVUmc4UEhGWGtIYXRt?=
 =?utf-8?B?Z2JZbDVocVpycHI1Yi81Q3dJaUhKRStlYkZJOFlzVDRZSTBkbEw5UEM4MUJB?=
 =?utf-8?B?SzVYLzNuVUdCT2tCRWU1dFp6aStoQU0vV3QxbkNROWd1SzBjcEg0OWNjNDZQ?=
 =?utf-8?B?TWJIcXQ0bU1yMUZpSW4vWUR4VERxNEx0aFcwWEsrUEhHcjRXZGhtNlIycVVy?=
 =?utf-8?B?Y0ZSM3VyUE9OVWl5dDAvQUd5QnRncGR0MVZTdCtXbGpBZEJ6UjZXNHRiS3kw?=
 =?utf-8?B?SW15cTJnL2RRQm5mZ29nZ3Vjdmo5UlNkY0ZWUk8vQzlHZXh4T2ltc1lpSzFn?=
 =?utf-8?B?R083Qkp2SVdjRnYvTjBoenNUNGUyaHJjYmJDMkYrUDBwZkcvWE9TenE1Skxz?=
 =?utf-8?B?QWJHc2JWR0V2dTRtd2NBQXhKT1d5UjJyeVIvVHZxdmN1OVlCMG5McUQxYUoy?=
 =?utf-8?B?WjVUYjBsVTBMOEg0VUJTeVJPTnhjUDFwVjZBZVU2NXZUd2x0MWJucnRzSnhk?=
 =?utf-8?B?d0daNlU5NExjZmIwU3RPWHZUUVZOUG9ha2lkV0Q5K1VWOUo2VHBCazZJdmht?=
 =?utf-8?B?VDhFbGpBdHFLMmRsZ1pKZUpONW9wdXdzbERwVEpYQXBFT3lhTHFYOFU4SjhN?=
 =?utf-8?B?dXAwR2I3cWJoK3R6Z0JCQlU5MmcrR2FiUVgzZWp4ODhhNDlXVzU3WmdDNTVp?=
 =?utf-8?B?SWZrdWFEYm9JMG9acWhkUDA2T1RPOHhHbFhwWDBPU1VCQnVNbEl0N0EvWmFa?=
 =?utf-8?B?eC96UVkxY1hISWF5NGZFZ3BnWTB4NGJSVThDczcrNVJ2SXBJOFNDMzdpSFk4?=
 =?utf-8?B?YXpiZFlYVlJ5R3pCNkNiZTY1Z1FSam9uTUdsLzRtUUN4VjdUOUdjYkNIMHlF?=
 =?utf-8?B?a2kvdHE1Yk01d0FpM0lrcXVsSkJ3eDlUZkVHSHFYQ2FJc3R0RVNVT1RTSHYy?=
 =?utf-8?B?V2QvRWNGZkR4L1gvOTczNUdrSEFna3VhU0xQYll3QzZUWGUvODF5REZrSERH?=
 =?utf-8?B?TWFTVXdoU0cvek9pbkxDMnhXNjlxSXkwYmNEalpLSU9DZGxWd0tvR01LblAw?=
 =?utf-8?B?QzRLaFJXMHVrbHVTeXQvQkZFZFJ6T0ZHWFBsSnhjR2d5RDJDWHpVQVJaRzFT?=
 =?utf-8?B?QnNqd1Iya3kzUzNCbGl0RWMrdGpCeFFNaXVQRWRvcmpSQlpONEhtR3IrUkR2?=
 =?utf-8?B?VStuQkIzR2FqK3lpTytLZUFXeEtkRTZJQnBybEhGcXAycnpYOHpya0NCVnFr?=
 =?utf-8?B?eUNTaVFpZC9FSmk4NEVLL2FWZitPQnM5d0ViM3JyWFg2L25QczlvNkJCeXYz?=
 =?utf-8?B?cC91TTg5eTFUeGNnUDErNmx6YWpLSlNHWUVoMEhmWWxyQ1FkdmFrTzl5ekxO?=
 =?utf-8?B?a0t1QWtURGo0YTlhc2dZcitTbjg1VkY1bndRN01Ya3gwNDJSOUsrYzQzeGVl?=
 =?utf-8?B?NVE4blI4aUUrOTdiU0J0YXFnZkF2ZFRvQWd2RHBWVkpqYXZyZ2l0OU9iSEcz?=
 =?utf-8?B?cW9hUVRqdUZaS0NGM3hSZ3B1ZDlFc2JpVDJIbUNqZWlFcEdNRHl6amtOSytj?=
 =?utf-8?B?WS9TZGtIdUUzbXBhNTh3bDFoVVJUZWwzWmhaMlg4ME4rSmh5SitSM2EwR2tT?=
 =?utf-8?B?bzUwdE9SbTY5bFM3eXE0WTBPTGtwclBFcUc2MFkrZW1YSGFzakEvcHZDTlRs?=
 =?utf-8?Q?IE6B4afDrtrIv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U2M5SG1oZURxOHNjWXdlWHBaeEsrcHhWenYydDQ1QWJTQUNCUlV1RXN4WUNx?=
 =?utf-8?B?RnIzc0srS2Y2OWNwa2JUZGZQcUNSOVJISjRjSVd3aW5jVGs1eEdzczVHQXBl?=
 =?utf-8?B?NkNEKy9HWFpHNzNrdndkRVk0ODZrWXNCQW1IdzdmdVpZVzZSK3NFZTJRSU80?=
 =?utf-8?B?WnNUYXVNZ2Y3cGc5QnlnSmhOU0NEQWJpeXJBdUZPUzFyWHloZkZNaTRZdnI2?=
 =?utf-8?B?dk1GTjlJN0dZVVpxMUxUaXA0Z3A0Vi9IRTErOXVhbTN4dUNzVU1tZTZrZWFP?=
 =?utf-8?B?dnh3dGZtUm5sSUFBZzlGSWpnN2hjR3p0L2VNNERDZ3ZVUm90cGhyWEtVREVJ?=
 =?utf-8?B?eDNsVEF5M0lWNnJYK2g5Z2ZpQVFaZjRKTGI2ZFhyanJQaWxtdlNRVDdVMXh0?=
 =?utf-8?B?OUJCNEZxcXgwZ1NBbHRIRm9aek1HQ3JCUWdUR3RicjY3N0hFRUlzSjRLM1Ns?=
 =?utf-8?B?NUxaNWFPQ3djQ0R3cXJ5S3FBMDAvUCtqMExyTzh4THREUVJmdE1pNkI2Q2I2?=
 =?utf-8?B?R2ZNQzFPdVFDcm9sOXByR0xuVStJcFhSbnVlMDF4eEZsMUR4cWhkcTErZ0RB?=
 =?utf-8?B?WHJPTHE2SFNydThqbG9RSDNXTERjcUhqOGZjbkw4R1QyemdvOTV6UStrQi94?=
 =?utf-8?B?VTA0UWUvNmhkWXd5ejUyZ3R0SnYwOGR6TGtJY0xVbUlSeHVxQXNNdFF3YXdX?=
 =?utf-8?B?RllyY1Z2eXdvTWY5bGNUUzdWOGg5NzNHSkROSHZkQTJDUVRZbTZjVzA5dXFI?=
 =?utf-8?B?eGp3bUtyRmZSL3h3MHlqWVFsT3pkQWt3WWQwemg2eS9sQnVtOTNjQ2U3WVVE?=
 =?utf-8?B?TU11WWdvVlNXNEFJZ1QyNU56TTZFd0dwSjBubndCOGt2R3dMREVMMHNTa25H?=
 =?utf-8?B?WnRoUFNSUUZ6Z2lOQVZIclRnNHA3VEloTWZhT1V5L3Z2S05qVGVWc3U2YjNI?=
 =?utf-8?B?bDZ2TFdKV1FLcTBFemE2ZWZzU21rdHVnV3RrWFQxQkxLalV1QmRuZXROeDhO?=
 =?utf-8?B?a0pMVzNndm5xY2swR0g3UzVwTWhLSytRN09CSUpjNExuRkFZdG1MMGx6bHNE?=
 =?utf-8?B?ZFJBNlpLb2VYTEhERlZ5SG1zZWJYWWFqcGJhUnVWT1J1WVlEVS9QU3piUHNL?=
 =?utf-8?B?ZzVRWFJEVTFlNmkzRXJyRmpXSzZqc2Q0bExMVzZQSitwZXdoVnoyd0k1a2cw?=
 =?utf-8?B?a1RSbVcvVVZ4aE1LN0VyOXVJMmgvN2Fza21tbS9XcDFwMWNPUnJCdndGaWRU?=
 =?utf-8?B?WWVwb0I1ZnFMczIyRUhXUFEyeWxOaWJlVlJCcXc2ck9jN2MwVFJPOWJSWU9O?=
 =?utf-8?B?dmxqMnFJTGduTSs0ZzdsM3ZEWU1UeEhLQzNXby9nN0kvbndWR0dCcGZBWU5K?=
 =?utf-8?B?WU5SQWFtbUhtZTVVTzRMWW05RUcxblltUlEwMElZRktjOE9ieDlUQ2xxYkRR?=
 =?utf-8?B?cWNCNUdKZkRZV3hyMVR1MUFTQ1dBTUEyNUVKODRReTk1WVFpL0JPMmM3N2tn?=
 =?utf-8?B?RmJsSGZMczFFNm1xQmNQTDRudUtOS1c4ZW03b0p6QjNvNXNleEE4NWJGNG5W?=
 =?utf-8?B?NjVVdkJpVnVPMlhZVDByVXQ2RVJxT0xXcTVGQXp5cUJ2WG11QzBFV1VLbExm?=
 =?utf-8?B?UGU2dkJBbDg3Ny8yZWk4c0tFUHE1WEhreVlBbC9kUXJhSkdzQnYwZ2Uza0hI?=
 =?utf-8?B?MzZMZkJiRnlrbkRkRnNKSElrRWRsWmJrNGJ1TTJIOGJEcElrMEZUaUV4NUZI?=
 =?utf-8?B?ZWdIYlZiRDJnK25lYWE1SnJYaGFvN0FBcEtzaDNkZ3dCYk5tekdBblJPdkN3?=
 =?utf-8?B?aUhzQzgwRnY3eTZQMFJaejltR3NzNldESzZQSVcyNFdPSDRzSGNZeEdUV3Qx?=
 =?utf-8?B?YnYrcEhqRDU0MDMxbWxwT2h3MFV2c0Zla0l4MkdxRjRNTllWRWYrZEswaG9a?=
 =?utf-8?B?M2J1aFJkMEtnazVaU1dzOUZHdzhDejV3Q0djMzBPaDN2QjlGd2dPWG1OVXll?=
 =?utf-8?B?eWF1M0FFd3hjMHBsWEdJdDUwQzZBaFd0bVZ2STFPcmtnUUlwdURBWVBqY3dG?=
 =?utf-8?B?OHZaUjh5dGZMYWVWeGFlYVJEWGdsL2dqaEF5TXdLdVFMbHNUTnFSUkRVTVNa?=
 =?utf-8?B?aWNNdlM2MGpBNUhuYkxTRTk4MGtob2NGQXRCb1RJZjZlSjltbGpUVTFOZ25X?=
 =?utf-8?B?bUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06fba675-adad-4b73-3e22-08ddf9ebfe39
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 15:23:33.6646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJQlnS5qQ1vRmDTfR4wkMZn68O64iC7HMr8GR6zLl2L0Rp6VUMIVWPyZbgHknjC5ZVOMK21H6Nsslownr9OIK2l8mE+gPm7kVviUW7bvzZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6312
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE1MSBTYWx0ZWRfX26LUD0C/hzrr
 B48X9/UD/cTsbPVNyNmDDJPy2LtssCogjL9JJyfcZ3VDg7MNj44D56myeIvfLxDaOLHSbh4Ch/1
 Atwo+o8RJh5AVYnZP6B2QEO6HiGH1tUjbQ4iDJ0OiGvBiSWRrMSwYWMwW61i6PX/tXulQUwmr+k
 Ay5KWs3A/Dn9Po4Oa0sDOS9qoAZLuJ4CR0kV/zA2TzYp3rMx7SnBYaEsKDYq/92Gkwuw96hcDnO
 clxzQfOXRodlGPGmNu9ZNLY76XO+3x2HcdbAUJuTFpHMV7z4mHvphgTw+q3aWyU4g9u5fsR/x69
 177TpUFXy3+sFpim09u6r5X0rX3noj5earvgIBfFT48kK1uGQNYQiKDXEUBs1o=
X-Authority-Analysis: v=2.4 cv=btpMBFai c=1 sm=1 tr=0 ts=68d169f8 cx=c_pps
 a=vNEawcoOGvNHZjwsohOJ5g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=CC6-ndaRz8fCtP2VswgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-GUID: yseh5e0P6eLhM45DBd3jU5W_soteY_NV
X-Proofpoint-ORIG-GUID: EY0RLfGRvZ-Ia6hc_4-hsCBVlAv5oLiN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58MB6scD870658
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 15:23:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223830



On 9/22/25 21:57, Steve Sakoman wrote:
> On Sun, Sep 21, 2025 at 8:19=E2=80=AFAM Robert Yang via lists.openembed=
ded.org
> <liezhi.yang=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>>
>>
>> On 9/19/25 22:00, Peter Kjellerstedt wrote:
>>>> -----Original Message-----
>>>> From: openembedded-core@lists.openembedded.org <openembedded-core@li=
sts.openembedded.org> On Behalf Of Alexander Kanavin via lists.openembedd=
ed.org
>>>> Sent: den 19 september 2025 12:21
>>>> To: liezhi.yang@windriver.com
>>>> Cc: openembedded-core@lists.openembedded.org
>>>> Subject: Re: [OE-core] [PATCH 1/1] openssl: 3.4.2 -> 3.5.2
>>>>
>>>> On Fri, 19 Sept 2025 at 04:55, Robert Yang via lists.openembedded.or=
g <liezhi.yang=3Dwindriver.com@lists.openembedded.org> wrote:
>>>>> The benefit of OpenSSL 3.5 is that it is an LTS supported to 2030, =
which can
>>>>> save the maintenance time in the long run.
>>>>
>>>> Yes, and it also add new features, breaking the promise the project
>>>> makes to its users.
>>>>
>>>> This update cannot be done without TSC approval. You need to get tha=
t
>>>> first.
>>>>
>>>> Alex
>>>
>>> Also, this proposal was for Walnascar, which will be EoL after the
>>> next release (or two). Thus updating OpenSSL to a new minor version
>>> now makes no sense.
>>   > > If it had been suggested for Scarthgap and the meta-lts-mixins l=
ayer,
>>> then I would have more understood it.
>>
>> I haven't tested it for Scarthgap, I think we need do it firstly for W=
alnascar,
>> then Scarthgap if it works.
>=20
> I will be building the final walnascar release on Friday.
>=20
> I don't feel comfortable doing this just prior to EOL with minimal
> testing and bake time.
>=20
> The TSC can of course decide to do it, but I'd push for scheduling at
> least one more release afterwards to deal with any breakage.

Yes, delay it makes sense to me.

// Robert

>=20
> Steve
>=20
>>
>> // Robert
>>
>>>
>>> //Peter
>>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#223801): https://lists.openembedded.org/g/openembe=
dded-core/message/223801
>> Mute This Topic: https://lists.openembedded.org/mt/115322467/3620601
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


