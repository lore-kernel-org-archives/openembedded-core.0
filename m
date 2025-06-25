Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21B7C7115C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 12:30:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14059.1750854649909615054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 05:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8271694343=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P6Ikn2014825
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 05:30:49 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14v7pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 05:30:49 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55PCUmUL018083
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 05:30:48 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14v7p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 05:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5gY9d2BPszjb1wv83Mb037RfsTRiQOaMc7DA9011gmuts1EvPIIHm0spnIUoKRZYrE6cM7llzzmGNo0EW6NeXl27Fva5zE3d1GlgvCtUyzTLo17oPq7iAyWu8Vyx35n5hZWHCiH96eZ9LdyiGjS1Pubub8WMvX1A08jsK92Z04CCGWn3qr0uSaCJuvsFvuumVVZ7LSvIT70fe23dfSdg6w/cXTsG06mWst2UOu1pjTu0F7uUjrx0REEQEfFDQ2CpxcPhABluCdefIirdGHA1xPed52uT7WBIq9iKNnpAhkh7Ixq3Gk8asoBsbRTelE/dhv8OIAM65EgbEiLxQVJAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DWHkknSa9dTao2Ah0fA/+OtYt8UoQEepL3JCwII0qA=;
 b=HXzAyiODQQWm1XwOY0L2xNWp23UtaXbYHEnOQRq0/B26JUsBBe2djfV+GPs/mbQQ0fAlcK0GrCoozeTmNr9D/0u53J+GkWh1kjbFoopeo8HWWdVUmh5a4UJre0mBqb5LgPn85JezUgqXyYHaWPmlJoJoluXca68OnHzxIUZR8hRrG7HWoJIOEFQRWb/6+pBNnAfCLq8W1EprT9ZyzlfCwMdTty1SrZ2SScDsCiH9OxLE6LSstBIN9O6DGjTJZucdAlX/IsoWw0QiwmSKSp+zr1Yu6QwDdUm4TqMelYmNRTReoslHDA4mqllCHAUC9Qd2y2Jw/jFscl73ZAyYdZbpng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by CY8PR11MB7033.namprd11.prod.outlook.com (2603:10b6:930:53::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 12:30:45 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69%5]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 12:30:44 +0000
Message-ID: <8b42cdbc-26a9-4aaf-8caf-ea23426cb634@windriver.com>
Date: Wed, 25 Jun 2025 18:00:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: Can Rust and Clang use a common llvm ?
To: Randy MacLeod <randy.macleod@windriver.com>,
        "Shinde, Yash" <yash.shinde@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        Ross Burton <ross.burton@arm.com>
References: <f3f89cc6-2e9a-4d6c-a977-eaeeca39c17c@windriver.com>
Content-Language: en-US
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <f3f89cc6-2e9a-4d6c-a977-eaeeca39c17c@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::8) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|CY8PR11MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 50297e50-96bc-4ea5-8b5a-08ddb3e41b1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R3QxZmczc2RCdWRJYjMyREN6TlVGWHQwYzlHQlBReHdLUlJ3eVdhQUc2eGZR?=
 =?utf-8?B?STV6R0NpRyt1YW9WVC93VkI4QnRGaFFjU24rWGVxZUJaYW1CM3d1QjhzUjk3?=
 =?utf-8?B?NEZVb2ZVRG1DTXdSaVF1TWplUWJXK2RxSHM0MnRCay8zb0FNTFltakdsTDJv?=
 =?utf-8?B?cmFqM0lXdjVOb2ttQzAwdjRSM1ovTXRDdHFrci9LUjVYU0o3dXM1YVhKVUdy?=
 =?utf-8?B?UUZxcVY5YTNuZ2YvVlVYTlZqaVR4WW9nNXZPRTI4WjRzRjQwa1hEcko1Ymhs?=
 =?utf-8?B?V0lVV1JEaXZ1WmZDdVVHTXp2U3grZlQrTEsvdFNLdlAvOFp5RUJuNUF4dmZ3?=
 =?utf-8?B?dkxsR29wN3JrWC9kMzBCbzgyaEZTbmpqamYwaGhQZ0FaeG9TaDRBK1hZT2Q0?=
 =?utf-8?B?bXBRYjBWTEROVjJFZFBhd21SWTRENEsxajFxc21QL2JlNmZPejUzWVRycldB?=
 =?utf-8?B?OVZSNENRWkVKSTBqWmU3TzNvMVk1S3BPZXBuYld1OFNiQjdDdG9BUHdxZnNr?=
 =?utf-8?B?Z0RYaDhWcVpNeTB1ampUMlp6dWltV09OK3o2OFI0RTVmckVjN2lrcGpKZWJG?=
 =?utf-8?B?Rk5xcjEzRE1oTUJNdU9ZbFh0Z2xVQ2hhYU5nNmtJSERJUmY4R0p0U3ZENEdY?=
 =?utf-8?B?YUtEREE5Q1k4TFdpV1duYUt0OHppRFJIcUN3TndrdUh1RHZRRFc1cWk2WUF2?=
 =?utf-8?B?NFpRWTI0WjRWY2p4c2dkb1gvbUliL1BaWDdSSEV4bU1KTmY3L1BSVFJDWE00?=
 =?utf-8?B?NURza0hWY0lqM2NEYjNnZi9Fd1VRK2Y3M2JIM0hEWWErRGowTXhXbHlDYnR6?=
 =?utf-8?B?c0c5L01rMnd5TDU5MGE2N0Z4RHZrQ3lLbWxWbHBDUFpkc1BBUSt4MlVxU0ZO?=
 =?utf-8?B?K3RVdTR3U0wyUkZXaEhOYlpoV3VHSlY1YmV2bi9QUXBTNW1KTUJRTTJGTTVR?=
 =?utf-8?B?ejVkeGJjU2RiZWtGS3liTC9WT1VreDJ1Q2pXTFA5aUdmZGsyWnJFdW1hSmND?=
 =?utf-8?B?empRbVRyZkZLS2trSEp3dTQ1a1h6OHByaW9JYnBPKzFPWXZ3UWFqRG0yQ1FT?=
 =?utf-8?B?UjlTQkpYeEFKTWxKU3NMTS9nRmtWT3FqSkRPWE9ZbEdPcGJDMXcxbDlkMEgw?=
 =?utf-8?B?NUtyNVNDbXFiVmxmRis0aVJjbHRlalJxV2wySUdSbDNQQUsvSEZFV0xETTgz?=
 =?utf-8?B?S29zUmloTWxuQTVKMEFvajJib1d5TEhjOXJUcUpDL0htKzE2Rm1pb0tWUGh6?=
 =?utf-8?B?RGdtcjhVV2VvcEtkYmJrMUZHL1ZWd0plaVcvTVpaWHBvUlJMV05EeG9uQmRv?=
 =?utf-8?B?eHNHOWFTWm13WnNscGJVcVpOWExGYTNrVUNQVklUMVBDVzdrbWFxaXdsZG1T?=
 =?utf-8?B?OHc5VE9GVVNRTU0yTG1HOHd0LzVJM1dmTXNKTUJNdmVYQ1BXMmk1ZDB0eGpR?=
 =?utf-8?B?K1R6OHRkN3dTdTRpSm1yT25MMnBFZ0JPTGxPU2Y2L3lrbXpOT2xJdmRtc1dx?=
 =?utf-8?B?L0pjQ2R3Ymt3WnExM242MTk3ZzZxN3dTYkEva25xbHVkVTNSYmxzelMvcFN5?=
 =?utf-8?B?ZldtSFVsb3ZGeXRaM25kNHFzWkZsd0pRRVJDZ1U1Qkc4RmpZSWh0cnd2ekZF?=
 =?utf-8?B?SUJ6VUFiOGxmbDBjaXVRU3hOOVBhOFRpZlRLT1hFN2dFM2NQVGtxNEZrbHVo?=
 =?utf-8?B?VzAwcEx0VWpObHhUZHlBUDFuampPM0cvU3R6b0dJYkU2QUlzVlhWbC94VklV?=
 =?utf-8?B?ZG9rc2ZaQ3Q1aVowa2NSa212MWx6T1RUeUZmVVBsdGhaVi9tYWhodThlRTFS?=
 =?utf-8?B?MEgxc2hkZWZBUCtXS29zMitzTnpoUUo5UFJBK0xEY2hLODdqdlo2UUcvcGFv?=
 =?utf-8?B?c2dvQVRQWVVodGloQ3ZFR2NTQ0Ztc29FMTdYUEhXK3VBUXRoc1E2Y25qTjJq?=
 =?utf-8?Q?zU+nUCVBOEs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TWUzRHNpbk41d2FBZkpka1hZcWhnODZwaFgzOU5jemF3ekRhN0VIQitJTHJ5?=
 =?utf-8?B?NVUzY1g4TzhrL2NiTDM3bHZ4aEhCOHVDZkRsNFZSMkdqcnZTUUk5VHd3eVNE?=
 =?utf-8?B?NzZaNHU5dEwzR0duM3FMMnJlVzhvc3VIaXFsOTd2OUR1UkZiK3R4bkJsYkc2?=
 =?utf-8?B?aE1kSDRxTkovd1ZGeUtPajlXK05DK3FMbGd3TmJLMUYrZW1SSyt4WG5GS0Ez?=
 =?utf-8?B?aitPNEFRMzBIWXFiWXd5ZEhRYy9DR0QzYmpYM1JwUGNiMkZNcVVXSnc3NWo3?=
 =?utf-8?B?U0JucEtzbElITjlsOWVzbWVCTktkWm9sOU4vNHBiUEh4eW8zYzVLeHJRM3RF?=
 =?utf-8?B?cXV2S1hnWWJKMDdMazB3OTkvbHdhRjVLL1lMOHcrNmF3ZWN4TG10QU9NUDBs?=
 =?utf-8?B?UTh3V0ZnOGRZaWdLYnRJNXpINGx4NVBSU2poMjgrdVo2MUdNbStjdFRiRVJy?=
 =?utf-8?B?STJSc2NvVXZYcXJDeE1KY3o3Nmtob0RSNFdQaHNMYnErcFNOWGNBdWttRkZJ?=
 =?utf-8?B?MzhpOHZkcVhYam5odGZuc0xrNjFNMFJvSURua3FxNnh5M0pzUmYyNFhDd0RY?=
 =?utf-8?B?YnF5TTRmTGlMSzJBK3Z5K01tM0V0TDZFRitzcFZkWmh0N2dHRGJvemV4bmhi?=
 =?utf-8?B?N2dYNGFIMW4zTW1wZmhQVFp2Tlg0QlNVaW5tZW5HQUpHN0lLOFJLTVBsNk5C?=
 =?utf-8?B?YUVTQUF0eXQ3dmx0UVF6cGpmamVBQmY2OUJOWXNBR1BINUp2QzNmWU9xdnUy?=
 =?utf-8?B?cy94dVdLU3dHS0pwMmJXSTF2b3kyS1pBU25jTzl4TWI3SUZDYmh5MW11R0Qz?=
 =?utf-8?B?TTZUNTNCRk0vUTdGMXh5VEk5eU8rYzBwaXRuU1cvTDBkN09ZdHlKVWw1ZkZ6?=
 =?utf-8?B?aGZUY1ZxMk1WWkg2V1cxUUducVlneFdvbVpESUZsNjlJZWE4QjBNRHBqOTRl?=
 =?utf-8?B?cm1WOU56RFhFbFRrSFh0SjVSVTluUENoWnFEMUdtMDQwT2RXRnZUWkxDNUtF?=
 =?utf-8?B?S2kxaVVxeVorZnFBSDNmbHlDUDVOMlYwUTc5aS9adEY2SCszRi96ZU1tNWpp?=
 =?utf-8?B?Y0ZjZDk4YzZRc1FzNmJMdldNcHJBVnp1dDlpYXp5YWtXMCtzY2xKM3dycVV6?=
 =?utf-8?B?RzhNbUFkZGZHZWZQbU93NTk4aEszZzA4bzBEa1NmY2NkMzloUlptN05XVWwr?=
 =?utf-8?B?UGl1TmkvQVY1Q1JLSGhLQ2NvODdTZ3lpVWlHUkYrZmV2ZUs1eUFhczRsSHZJ?=
 =?utf-8?B?RHVUZkJaVmFaRTY5QWFUcHpsSlFvaUZJbW5DQU5vQndkbjFMV1NLSnRQa2FZ?=
 =?utf-8?B?d3Q3NU5BaFZtV3BvZXlFUzZZMUMvbDQwcjAzRHU4M3h5NVFrNUxHdnFrcC9H?=
 =?utf-8?B?dFl6RkprWlRRdFgvRGFycjIwbTVoL2V3TlFQR3hwY1k5RGQxcUpUQmhkTmUv?=
 =?utf-8?B?S1VjeVFvSlZqU0p4WmNqK3lqMmJGSjFLdkw3ZGhxU0FuN0xrbFE5OFIrUUNi?=
 =?utf-8?B?czFGZ0phTDgrT2FqNmhmT1VjdlBoMnhkVUNuM2JQQ0U0NDJzQ0pDZ0pwOTZs?=
 =?utf-8?B?NHBxWFJnS0RGWlVXRTh6dFZlSmpRaDhMamlUaVpBU1RQQ25hd0RXbWVJZDBm?=
 =?utf-8?B?enJnTGFhK21yeHRPU09LbEMxdG9HSUhBQ1RBcFczdjhLaXhKL0wyeUIrZzVZ?=
 =?utf-8?B?Y3kzZktmdDkwRVppcnczWWF2Z1BPR1RBdzhlejdFRFR3MzAyTForZmhLTFlD?=
 =?utf-8?B?WHhiZFc0aEZXTUMrMGg5eFhVUzkzclNXb3VPcHlBam5yK1dDT1VOODgxWi9v?=
 =?utf-8?B?eFgzOXdYakZ2TVpuM3RTamZmazY4bE1yVnBLQTlDSXhpNGdMY1ErL0NUSnJZ?=
 =?utf-8?B?Z0hselFLYzhuNm14bXRqL3llRWJjb3o3QUZMb3VMYW1UcFRKZHhoRFZlbFh6?=
 =?utf-8?B?S3FlV3VyL2pES2hUM3oxV0dFWCtmdzJOaW1OUldvdjArTnJBeFEyMEREcVBD?=
 =?utf-8?B?K3d2ZVB2eUk5NGFWeDNFb0VBdzNuQzNKa0NObDc4OGFUYVZKeHg4Q3ZSWHVE?=
 =?utf-8?B?bm03TVFXWnpIdXRCUlhmQVgyZll3V1ZIdjB2RnhzRUlsMzlNbkVIK2poK0hL?=
 =?utf-8?B?L003cm8zQVdzY1lFQjhaaVBVRkE2eCtBVWUwMURRc2x6WVo2NnNENEpydER3?=
 =?utf-8?B?NXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50297e50-96bc-4ea5-8b5a-08ddb3e41b1a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 12:30:44.8512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5gcJ08XhgLuJopxjv18X2S8Hy2NFjTC86m/0mp9iZ7KGDCUfn2nhj1LmR8rItyPh6YN5STuu30/M/QamlyiIDQFZMsjgFUjHVc65nh6ndo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7033
X-Proofpoint-ORIG-GUID: S9c-Uq4q5ZsW22GaK8uK7J6PbhhBlQf5
X-Proofpoint-GUID: ykr0M-5cAJQ5j4UqpPpu1jwo8odJtxpT
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=685bebf9 cx=c_pps a=vLlm6fOi2ONy/6Pih9zO2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=iGHA9ds3AAAA:8 a=iRpe_r1ov643oiirIkgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA5MiBTYWx0ZWRfX2E/bKUJwuuTU z71T/cXA1E94L40l70cOcmthOf3T0cQpxu7VJ5qpmuf64+oJDagU77/FFtIomXXUhb0TqIl+PGs /xMQbx3zzr/HpA0zRX3/heVhH2898uIWsYZYS+MLvtRw5AcDtyOXVRZKVpzDgapc+WllHsYvP3T
 8yZNIwF9un1lxtPVZFMxKVxTOIUxGthAg+UBcr/d57ZeJPu0hc7RU/YvatLrboqM8UrcIrmP3Tm 4hxC5MrpfSBLQY3Dvs66o1Cs35O8hnfCzhF63QM4cu5bC0gRrWxg5yg+xkMNihExj1bNs74mwKe rsTgEafFExtY68Z2W6bASa4UvQRcqBMBmGPxueVYYTCGaZ94dmemR8oiEJYyCvPNBvz2DJ6T7EQ
 hRatWeOPQZTSgW6Lf2lM/90R587OT9FoiYog6KDlncMmFuZEOEghNNVm8eMAvOu+MnriKGoj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506250092
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55P6Ikn2014825
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 12:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219318


On 24-Jun-25 23:47, Randy MacLeod wrote:
>
> On the YP tech call today, we were talking about the poky image build=20
> time and FS footprint.
>
> One idea that we've been blocked on for a while is to only build llvm=20
> once or at least not 3 or more times
> like we had been for llvm, clang-llvm, rust-llvm, ...
>
> Now that clang is in oe-core, we can make some progress and
> we should look into avoiding the need to build rust-llvm as well.
>
> Ross hacked things up and is able to build rust-native but
> target rust fails. See:
>
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dross/rustclang
>
We will look into it.
>
> Yash, Sundeep,
>
> Let's add this to the long list of compiler improvements that
> I'd say belong in the following order:
>
> 1. Keep rust up-to-date,
>
> 2.=C2=A0 Eliminate rust-llvm
>
> 3. Reduce gcc testsuite failures
>
> 4. Clang testsuite
> 5. Add ptest for binutils
> 6. Other toolchain things I've forgotten.
>
> Some of these things will be worked on by different people
> so hopefully we can deliver a couple of them (from the 1-4 part of the=20
> list)
> well before the M3 milestone.
>
Sure Randy, we will prioritize and plan the activities in given order.=20
We will discuss more on tomorrow's call. Mostly about the binutils ptest=20
activity, because the oe-selftest actually runs the binutils test suite.


Thanks,

Sundeep K.

> --=20
> # Randy MacLeod
> # Wind River Linux

