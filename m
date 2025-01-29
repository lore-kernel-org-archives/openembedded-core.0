Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C7AC02193
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 12:12:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11052.1738152773078069572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 04:12:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4124c6a8b6=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T8H4VU006968
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 12:12:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44eny71jjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 12:12:51 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50TCCp5F025320
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 12:12:51 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44eny71jjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 12:12:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tVmGxIm2MzURHq2gKU5ZhjcKNZc2JnzbHYdfAEkzFOcN0bcn3W5FR1JQZr+ax3HtHRRwrTlz9AILTraaoxTlrZHMpJeEjF3PJcYa3hqPsVVc0P1QCBmevb9lLzMEpkCcFc8+gSfsr7eg2/zaNM6rVyWMWB7oGz6IFxdfzK8SDOb5uA+YLT8hsCrBp04dP6YeGVgWHugNpFCIwte6XhPtDBx4gG2WktGvjbm/HMl7v1hL/MsYi9AQsqllFxjqHCvdzexmbbrEwLgLCMgI5aebrF2RfguHl1p2m80ed9QCIfofze9dpUker7Sp464dUtpHoEfJOJnU3KxSz3E7sbJr1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwJ9g9KxOsLY4eaY4N+iNKE4CCXTIWMkO6klFgwdo0Q=;
 b=i2Fr8rvbKtgdx4ZKg43B86gDsvqbA1x1BzIm9EIg8/FPGlFuvQQV8Mvuzm2MuFzVN7ATz7/ho2BjfgSpTLk4Qil+iT7NT4keepnI4gC67Cy9hjjwMLVc0w76EPUOhUGTdun60esovFz3OOTm17lZY+pQJZ1zjDbAQYSZqrZsP8NT2RhA1Bt+Vx2rCMHzwlFRwyVn8z1z9ULvfHbw2dDdtU8CrrOiXm1/EiRl+4qJMXxhIDbV98dFbZidynrB/cUnRmTpJXodJ988FBaDMPvDHYzZVbpFreoB42dM8SqxDAuQULPAIe5ZcHIAhxQeaNTgpUdbaRT35Ewk4IUIvLdKYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by DM4PR11MB7205.namprd11.prod.outlook.com (2603:10b6:8:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 29 Jan
 2025 12:12:47 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 12:12:47 +0000
Content-Type: multipart/alternative;
 boundary="------------6jwtSAnrVKgRTW5SRraOqF7B"
Message-ID: <a52736b6-71d1-4301-a602-096808a60209@windriver.com>
Date: Wed, 29 Jan 2025 17:42:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] qemuriscv: Enable Sv39 memory address scheme by
 default
To: randy.macleod@windriver.com
Cc: openembedded-core@lists.openembedded.org,
        "Ramasamy, Rajeshkumar" <Rajeshkumar.Ramasamy@windriver.com>,
        Khem Raj <raj.khem@gmail.com>, Sundeep.Kokkonda@windriver.com,
        "Hao, Kexin" <Kexin.Hao@windriver.com>,
        "He, Zhe" <Zhe.He@windriver.com>, Trevor Woerner <twoerner@gmail.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        Alistair Francis <alistair23@gmail.com>
References: <20250128101633.3664659-1-Yash.Shinde@windriver.com>
 <96981090-c00a-40cb-802c-f709450036f1@windriver.com>
 <CAKmqyKNHc0rGAAc=3cJZN+uQ8BPhSAyb96Y1+pFGt8bk=ouY6Q@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CAKmqyKNHc0rGAAc=3cJZN+uQ8BPhSAyb96Y1+pFGt8bk=ouY6Q@mail.gmail.com>
X-ClientProxiedBy: BY3PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:254::31) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|DM4PR11MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: 54032330-5400-477b-c169-08dd405e3e04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RG14UUFEV0Fhem96WWdCd0lzazFLekxsOVljYUdGbVEwUVNiL3I5Y3JMZmlu?=
 =?utf-8?B?UlM3SXJGVXFsK2wrd2lDL1ROa1lhd2U5ZXFHVkp4WDYvbTBKL1hwSnhiN0w5?=
 =?utf-8?B?MDNxWnRDdHY0eGZPMUlVYWhVWXVEdSt5REROMUZXVERxcGpCMms3WVpxeHhJ?=
 =?utf-8?B?NE1zQXRHWDVSRnZVRDJkcEpkRHBNVE5HeWt6WmJwK3VhbHorMkpQWXlKNDdK?=
 =?utf-8?B?ckQ4M3FPNnNRNTFSOTBvMXNJWlpuc2RDY202Z1dNUDVveVA3VDRRUUxtbmhG?=
 =?utf-8?B?MCtoS0o3aVFSb3VHcHp4NjRDbDhTRkg3NFFNR3JBRHo1ZHdoSitjVlBnUTl5?=
 =?utf-8?B?VE1MWWZDQi91bVRCS21mcG94ZzZVenFacWZVYStWaEV1cEFKSkZuNVc0TEtG?=
 =?utf-8?B?TGdEMmJKa1pvL3ZOUWsrUkZ3T0dQUjhQK1gvNnRzdzBGM0RVUCt4Z3dOaTdw?=
 =?utf-8?B?VVp1MnI3eHBjUXZlNHJERHJ5d3poL2VsMHNnRE92TE0rOE5ldU1LZFlPZWVP?=
 =?utf-8?B?Zm10N2E5TjY4RlVyczlUaGp0MU9pNTM2dGdFN3RTakI2c0hxdXkvYlZYY1RN?=
 =?utf-8?B?U1k0clpGbnhqQkpFWEN2dnFxaGhMVncwSWc3VWFYall4WnFDcUl3NEVaeHdR?=
 =?utf-8?B?UHl4aEMvMXRkZ3J2K0xpL0E1bXpReGwrM2wrNHg2STFZOEQ0R1B5MW52M0xt?=
 =?utf-8?B?NDFXTTZPSmEydkxXcjNCV0RvVUVDNWZ4MWxjM3N0c3ZtRWNFTndOVWNjMDVi?=
 =?utf-8?B?b1JObzRKOFNPVGRlNUoxUnM1QlZSb2JDNXFoUEhqQ1JXcERyVm9RbW5KUnBp?=
 =?utf-8?B?RC9sL01oeG0yRi9FT0FVL1NvMWRFeXN5a1VEdDN1TUp3NU1qR3oyc1NDektG?=
 =?utf-8?B?cm9FMkVWNTVCb2xSREQyWW1oN1lQM1JUM09QNVhBMjZKSXdpRU5taHdnYkNZ?=
 =?utf-8?B?TWxTL0xocElmazE0RUhyUi9DdiswdUpHcG45QS9hT2ZDZVhpZ0xjeG5WQW53?=
 =?utf-8?B?cGR6MTBEMytzVzFld3pYUFJnQ2p1V010Q01jZzlOMGxJQ3JkTGdhdlM3SHF6?=
 =?utf-8?B?NTlEZDBwa3JlcElCZmFFMFdEUjhGczE2U2lqRWF6b0dGaS9JbEpYZmJQSjRZ?=
 =?utf-8?B?aEpkc1ZuZWpmVlI1dlNUNi9EK2tKeitPNDVHanlSU1FtVGk4V0FqNUM4cDVp?=
 =?utf-8?B?c2NIcm00b3VrZ2w3TVRSVGhyOVgvZzQvVDJibFNReTIreCt1Z1lsTWNRSXA1?=
 =?utf-8?B?c2xmM1VFTUxSN2RudU5welFKRUpyYWNoZEc1QmdydnlCcUJuQXFWOUQ1TTVk?=
 =?utf-8?B?YldzYXdWei9BaFdHQnZYbkJhY0hmT3BXMFRPZWo3SHBIc1AvcVRXNUZIV2I1?=
 =?utf-8?B?T3dUNW1aQlI4eGxkSXV6ZEJ4cmVQcWhSZU5WeTBGUFVXeHZaK0ZEODNxL0x5?=
 =?utf-8?B?T0dHbzg0MTZ1b1ZTTENEcmpRamdWcDB3a1hLM2xPdTlneWlFdDZJdDFWU29U?=
 =?utf-8?B?MkkvT29lK0Z2MlBzWThjcXVYOTRGbXVVNlJSS0pvQndkdXg5Wll1YldVQ3ZN?=
 =?utf-8?B?TTQ0QjFQcS9rbzFSTVdRc0hDQkZ5ODI0R2xGalNONXJhazBlTlc5K3g2SmJp?=
 =?utf-8?B?YWp3c0QvN2hIN3QxcFlrODc1RUVqSGtNc3A1Uk5sMTNGSkM0bElCMTg5MnFp?=
 =?utf-8?B?WGU4UlZBQlNKN0F0VUlUVmZBOGJDS1Q3SVZwcG5CUGxHYzJXa25ubjBqcHl4?=
 =?utf-8?B?WGgvVFUvVzRPSDA0ei9Kd0pKWW4wQUdmTnVGZFdBbk4zVkhMU0FKbTdSOExI?=
 =?utf-8?B?dUthcHF4aGJ6bWd4Y1NFdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?anVMWjRJOGJiRmoweWZLanJPdnZpblkrYlhFanltK1ZFczhhYXd4WVBxUXZZ?=
 =?utf-8?B?L0djdjBGcWJYbURaRXpOdTdGblVlNFV6MGQxUUZqcGU4SW9KcWtBUld4RUY1?=
 =?utf-8?B?b0VWWVozeDJ3SFR0bnY3UEdZU3hmYm1aU0V0ZGhXTzVvUjEwOEtnUVluQzFu?=
 =?utf-8?B?aUpDTW1KZGlsOC94UjU5ZGMrOGxjNlo4MDR3UC9wNkhZeCtzL1d4UHVCdnpy?=
 =?utf-8?B?d1FtNml5eHlMZkFyaWt3aUNsOUgxOUpWK2dlRTgxb2ZIZ2JOWUdzQnRrejUx?=
 =?utf-8?B?emFBU2I4R2taWWgyMHpoVGlEQlJ4VmVFMWZRTkRUSnFpWlExdDZvZkJWZU5H?=
 =?utf-8?B?aGRDUFlWQ3RzUmRaZFVEN2dBQ1ZYbVhFOWxJTDg4VWtQbHBXT3luNnRQTkUz?=
 =?utf-8?B?TUkzaDBpTmVlWmFub3VDWXBPMzZ3N3lYSWVqVHExUEt0V3FNTEliZWZmeXdW?=
 =?utf-8?B?Z1dvME52OTlEMjhpbCswOTVjODBZK0tzNDBxNU5JaG91MzNlL0wzVWEwWUZ5?=
 =?utf-8?B?MDZoZC9jc2VKaENUYnN5VXlNcHlhMTM4U052QVJYWC9IdlBJTW56RDJvNnBs?=
 =?utf-8?B?R1o0YXVJdmxzZ2lNME5XT0NuYS9kT2NIOTBlTlFPUDlZZGdsZ0VBQldMa3FU?=
 =?utf-8?B?Uy8vOTdWWnB4NnhkcmdNM2d5dmMzRHNqc2tHLzdNTTcyK3QvY1lVU243b2s3?=
 =?utf-8?B?VWNjd1J3RUNObGpzbmxhMEk2YWpsOU1tazVTTGRlWU5ycnEyekNtMVlDdUdz?=
 =?utf-8?B?Z3JicjdMakNvVVRIZk4xTUh3ZGlZdGhIeGlNWVNmbmpSNWw3WDNJZUdpRTNl?=
 =?utf-8?B?dzJMa25maWk2eFNLOVg3L1M0dy9ud2pqMWEzeksvejlwYXZyem1QSmNQM2dW?=
 =?utf-8?B?aDVWTlBPUXJTNGl5T1ppdGlKZzk5UVd2YWNtNXUrOTl1dTExeXFHWGoyaGNw?=
 =?utf-8?B?RDJqcWY5MzhnVm1jVmZMVm52a29zQk8zczZYKzN0YXNpWGovczFOS0VUNUFZ?=
 =?utf-8?B?UytwdG02N3liWWxQQ2FpbUhiVjAvVy9MdkkvcTE4Vk1vWDlhaFptcFhwakZm?=
 =?utf-8?B?UHRTS1R2OXVMQkQwaFZhR1h5L0xMc2c5azNJRVg0WXl1cmdidzdYaHJacDRC?=
 =?utf-8?B?MHZXN2hyeGNJRXZpb2VrcDM1VDRrTWF2VmxqSm85ZHMyUDg0a0hjMndWaTZs?=
 =?utf-8?B?QWN5SGtKOXpiOXhRTFpmbWJaWmJnWFlHN2NhRXd1WGprL1NvaHVNdzN5TFBo?=
 =?utf-8?B?NmZmalZCcUFYWHNieXh3QVhrZEpBdW83bW1ORWhwdU5vNEtwczlITUNGV3FZ?=
 =?utf-8?B?czlGTDVIdGd6bElPZDMvMmM5RTJFYXlDeHp3V2phTHRlRGJyc3RZOHV1V3NY?=
 =?utf-8?B?VEFIb2FaMHBrLzJTTFZaVVh3WEZuRVFjZzZYRkUrZlZ3SjYvaWRGT3BOYzFW?=
 =?utf-8?B?a2tuRnJnUkZtQXpERTlMMFVJV3E0TWdIREFNbG5YYXc0dkZkajZWd3BzdXRI?=
 =?utf-8?B?Y2hUdldaV2twa015QkRCQlU4b082RE13WTlKWUhGZzRRTHIrbXhXT0N6enpO?=
 =?utf-8?B?Z1pwcFVpVzNYWmJvWUd4OHEwVFhTOUhmcC9GZmRKUzZPR090dzZvTytjWU9a?=
 =?utf-8?B?YU0zeTJvelNpOUlwTEhrb3JNdVVIU1lmaVhLVVJHTHpaajJYSnZHaUl4Z3lx?=
 =?utf-8?B?ekM5cVlFd2U2dVFLZVFOb3dUNWFEbGViNjhZRUVMbkFvTks0V0hxWGgxek1n?=
 =?utf-8?B?eW1LNm92amxyZWYxQkpDSzlhRXJvd2pnT1FCdXUxdWh3ZndZdi9ia2hqSW9h?=
 =?utf-8?B?N08zZkVKU0RMNGp1UUt5ay81ZXFjTTF0dXg1YW5ZQ0VOdElURGRwMVdtNHFN?=
 =?utf-8?B?UmVKRkNBbWhPZzBGNW1GakRFeUVxNmFjbWUwdUltWmRXN0hxZktHOEM5TUZ2?=
 =?utf-8?B?WmttZ1lUQjNKMVBSOVRCcHVyZWQ4c3hTR1ExZm44VWtaYjMxMjV4K0Z5NzFR?=
 =?utf-8?B?dktHZU5KRmpFZE9SK1prekVJVUhMczhEelV4UXZDb2xYV0psa0xZbG11NFBB?=
 =?utf-8?B?dGx6Mjl5a1lmK2lhQUdnaU9vaHNvK3YrTFNaSTJLVlBBZlhad2I1Qk5VN2NR?=
 =?utf-8?B?S3lXY2ljVjRYWTBsMWpBTWw5c2ovWDBpU2tXUWsrQjZtcHphSENiNnhxRTFu?=
 =?utf-8?B?S1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54032330-5400-477b-c169-08dd405e3e04
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 12:12:46.9882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxgOv3QgwlJqQRHBB97yHQ/WZwhPt4aelNn+KvdH3UUaOya50ef7qh7I+A3gS6xuHoxCDJ5ytKBdc643JYx+VpRmbaa6wdySkGMsBN2FP+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7205
X-Proofpoint-GUID: eYvm7VN11OylGksk0KcDOAz7aQTqia5a
X-Authority-Analysis: v=2.4 cv=fYZXy1QF c=1 sm=1 tr=0 ts=679a1b43 cx=c_pps a=6DIaztarb0XTwjBPIWoXxQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=mDV3o1hIAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=lQwv5vPbA29mydXIIqIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=63kk_DafbJkA:10 a=TGWRFvGZnzJx6LKCTUUA:9 a=uuY9xkz8grlAeBkn:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: XJJR9d40vwOBClW9pA6_JKIvfuKZfarN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501290099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 12:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210378

--------------6jwtSAnrVKgRTW5SRraOqF7B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50T8H4VU006968


On 29-01-2025 06:08, Alistair Francis wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed, Jan 29, 2025 at 1:51=E2=80=AFAM Randy MacLeod via
> lists.openembedded.org
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>> Add Raj, Khem, Kexin and Zhe who know more about RISC-V than I do.
>> Kexin and Zhe are on holiday for a week or more.
>> CC a few people who have contributed to riscv* conf.
>>
>> I am not all that familiar with either qemu internals or riscv specifi=
cations so any input is appreciated.
>>
>> I have some comments and questions below.
>>
>> On 2025-01-28 5:16 a.m.,Yash.Shinde@windriver.com wrote:
>>
>> From: Yash Shinde<Yash.Shinde@windriver.com>
>>
>> Currently, GCC Asan supports only Sv39 on RISC-V due to custom allocat=
or configurations optimized for large allocations.
>> These configurations are incompatible with larger address spaces like =
Sv48/Sv57.
>> This fix enables RISC-V's configuration for Sv39 by default when runni=
ng `runqemu nographic`,
>> eliminating the need for manual configuration via command line flags (=
`qemuparams=3D"-cpu rv64, sv39=3Dtrue"`).
>>
>> Fixes [YOCTO #15691]
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15691
>>
>> Reference:https://git.openembedded.org/openembedded-core/commit/?id=3D=
4b4450ff695ef73bf7a2437e142d2e0730d6a547
>>
>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>> ---
>>   meta/conf/machine/include/riscv/qemuriscv.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf=
/machine/include/riscv/qemuriscv.inc
>> index d01d988eee..6170ce65f2 100644
>> --- a/meta/conf/machine/include/riscv/qemuriscv.inc
>> +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
>> @@ -27,6 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D "0x80200000"
>>   # qemuboot options
>>   QB_SMP ?=3D "-smp 4"
>>   QB_KERNEL_CMDLINE_APPEND =3D "earlycon=3Dsbi"
>> +QB_CPU =3D "-cpu rv64, sv39=3Dtrue"
>>
>> Thanks Yash.
>>
>> To save everyone from doing the math, sv39 gives the system 512 GB vir=
tual address space.
>>
>> Should we use the ?=3D operator here so that users can easily override=
 this specification
>> just as is done for  QB_SMP two lines above?
>>
>> Please summarize what testing you did.
I tested a buffer overflow case for asan by booting qemuriscv64 and=20
using the command "runqemu nographic",
without passing any additional qemu parameters, as mentioned in the=20
follow-up message to the patch:
https://lists.openembedded.org/g/openembedded-core/message/210317
>>
>> Did you test with TCLIBC=3Dmusl ?
Musl builds for asan are still broken as mentioned earlier in=20
"gcc-sanitizers.inc" :
/
# musl is currently broken entirely
COMPATIBLE_HOST_libc-musl =3D 'null'/

http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/=
gcc/gcc-sanitizers.inc#n88

When built with TCLIBC=3D"musl", following error is seen:/
"gcc-sanitizers RPROVIDES libasan but was skipped: incompatible with=20
host riscv64-poky-linux-musl (not in COMPATIBLE_HOST)"/
>>
>> Since you are changing qemuriscv.inc you and the YP AB should test qem=
uriscv32 and qemuriscv64.
>> qemuriscv32 should, if I'm understanding how this works, be unaffected=
 since it has to use sv32 mode.
As mentioned in the below gcc mailing list, risc-v 32 does not officialy=20
support GCC's ASan and some of other 32-bit targets. So, this should not=20
affect it.
https://gcc.gnu.org/pipermail/gcc-patches/2020-October/557406.html


Also, there is no compatible host for riscv-32 in gcc-sanitizers.inc:
https://git.openembedded.org/openembedded-core/commit/?id=3D7d90d2a70f018=
4ad715e9917d3e7aa096cf98f79

Note: While testing this I found that the "-cpu rv64, sv39=3Dtrue" also=20
passes when building for risc-v 32.
I will send a V2 where it only applies to risc-v 64.

>>
>> Did you find out why sv39 isn't the default for qemu?
> QEMU defaults to the max supported SATP mode. I'm not sure there is a
> specific reason, that's just what we have always done since we allowed
> a user to specify the SATP mode.
Supporting to the above comments, here is the commit that allows users=20
to specify the SATP mode

https://github.com/qemu/qemu/commit/6f23aaeb9be13d4a26b7f863533c316105481=
640

It seems that Risc-V has multiple sizes for addressable memory and Linux=20
probes for the machine's support at startup.
Thus, the reason would be to give the flexibility to users to set it=20
rather than having a fixed default SATP mode.
The authors/reviewers of the commit can put more light on this topic.

>> If not, please check the git history and it there isn't an answer ther=
e, ask one of the qemu developers
>> who work on risc-v. It would be nice to have a sentence about that in =
the commit log.
>>
>> Did you consider a different RISC-V cpu sub-arch such as rva22s64 ?
> I think defaulting to a profile (RVA22S64) would be the way to go,
> that will also enable a known set of extensions.
>
> Alistair
>
>>     https://github.com/qemu/qemu/commit/3ba8462c4ca55720239fdc6fa30b98=
70d22a8814
>>
>> I'm only asking because it seems like it might be a good fit for us an=
d I noticed it when
>> searching the qemu commit logs looking for sv39.
I added=C2=A0 "-cpu rv64,sv39=3Dtrue" options for risc-v by default as=20
mentioned in the bug requirements.

The support for RVA22S64 looks good to have=C2=A0 provided that it doesn'=
t=20
break other risc-v builds/tests being done in Yocto.
Following commit adds the RVA22S64 profile and corresponding extensions=20
in qemu.
https://github.com/qemu/qemu/commit/af651969eb23ecf018bcaa8e0761b58425de5=
50c

<https://github.com/qemu/qemu/commit/af651969eb23ecf018bcaa8e0761b58425de=
550c>I=20
also tested with passing /"QB_CPU =3D "-cpu rv64i, rva22s64=3Dtrue"" /in=20
/qemuriscv.inc/ file and asan works with that as well.
I will send a V2 with setting "rva22s64" profile for risc-v 64 only as=20
follows:

*/QB_CPU:riscv64 ?=3D "-cpu rv64, rva22s64=3Dtrue"/
*

Regards,
Yash
>>
>>
>> ../Randy
>>
>>
>>
>>
>>   QB_MACHINE =3D "-machine virt"
>>   QB_DEFAULT_BIOS =3D "fw_jump.elf"
>>   QB_TAP_OPT =3D "-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,dow=
nscript=3Dno"
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#210329):https://lists.openembedded.org/g/openembed=
ded-core/message/210329
>> Mute This Topic:https://lists.openembedded.org/mt/110856569/3619028
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [=
alistair23@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------6jwtSAnrVKgRTW5SRraOqF7B
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50T8H4VU006968

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 29-01-2025 06:08, Alistair Francis
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAKmqyKNHc0rGAAc=3D3cJZN+uQ8BPh=
SAyb96Y1+pFGt8bk=3DouY6Q@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Wed, Jan 29, 2025 at 1:51=E2=80=AFAM Randy MacLeod via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:randy.macleod=3Dwindriv=
er.com@lists.openembedded.org">&lt;randy.macleod=3Dwindriver.com@lists.op=
enembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
Add Raj, Khem, Kexin and Zhe who know more about RISC-V than I do.
Kexin and Zhe are on holiday for a week or more.
CC a few people who have contributed to riscv* conf.

I am not all that familiar with either qemu internals or riscv specificat=
ions so any input is appreciated.

I have some comments and questions below.

On 2025-01-28 5:16 a.m., <a class=3D"moz-txt-link-abbreviated" href=3D"ma=
ilto:Yash.Shinde@windriver.com">Yash.Shinde@windriver.com</a> wrote:

From: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Yash.=
Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>

Currently, GCC Asan supports only Sv39 on RISC-V due to custom allocator =
configurations optimized for large allocations.
These configurations are incompatible with larger address spaces like Sv4=
8/Sv57.
This fix enables RISC-V's configuration for Sv39 by default when running =
`runqemu nographic`,
eliminating the need for manual configuration via command line flags (`qe=
muparams=3D&quot;-cpu rv64, sv39=3Dtrue&quot;`).

Fixes [YOCTO #15691]
<a class=3D"moz-txt-link-freetext" href=3D"https://bugzilla.yoctoproject.=
org/show_bug.cgi?id=3D15691">https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D15691</a>

Reference: <a class=3D"moz-txt-link-freetext" href=3D"https://git.openemb=
edded.org/openembedded-core/commit/?id=3D4b4450ff695ef73bf7a2437e142d2e07=
30d6a547">https://git.openembedded.org/openembedded-core/commit/?id=3D4b4=
450ff695ef73bf7a2437e142d2e0730d6a547</a>

Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/ma=
chine/include/riscv/qemuriscv.inc
index d01d988eee..6170ce65f2 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -27,6 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D &quot;0x80200000&quot;
 # qemuboot options
 QB_SMP ?=3D &quot;-smp 4&quot;
 QB_KERNEL_CMDLINE_APPEND =3D &quot;earlycon=3Dsbi&quot;
+QB_CPU =3D &quot;-cpu rv64, sv39=3Dtrue&quot;

Thanks Yash.

To save everyone from doing the math, sv39 gives the system 512 GB virtua=
l address space.

Should we use the ?=3D operator here so that users can easily override th=
is specification
just as is done for  QB_SMP two lines above?

Please summarize what testing you did.</pre>
      </blockquote>
    </blockquote>
    I tested a buffer overflow case for asan by booting qemuriscv64 and
    using the command &quot;runqemu nographic&quot;, <br>
    without passing any additional qemu parameters, as mentioned in the
    follow-up message to the patch:<br>
    <a href=3D"https://lists.openembedded.org/g/openembedded-core/message=
/210317" class=3D"moz-txt-link-freetext">https://lists.openembedded.org/g=
/openembedded-core/message/210317</a>
    <blockquote type=3D"cite" cite=3D"mid:CAKmqyKNHc0rGAAc=3D3cJZN+uQ8BPh=
SAyb96Y1+pFGt8bk=3DouY6Q@mail.gmail.com">
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">

Did you test with TCLIBC=3Dmusl ?</pre>
      </blockquote>
    </blockquote>
    Musl builds for asan are still broken as mentioned earlier in
    &quot;gcc-sanitizers.inc&quot; :<br>
    <i><br>
      # musl is currently broken entirely <br>
      COMPATIBLE_HOST_libc-musl =3D 'null'</i><br>
    <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D=
7d90d2a70f0184ad715e9917d3e7aa096cf98f79" class=3D"moz-txt-link-freetext"=
 moz-do-not-send=3D"true"><br>
http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/=
gcc/gcc-sanitizers.inc#n88<br>
    </a><br>
    When built with TCLIBC=3D&quot;musl&quot;, following error is seen:<i=
><br>
      &quot;gcc-sanitizers RPROVIDES libasan but was skipped: incompatibl=
e
      with host riscv64-poky-linux-musl (not in COMPATIBLE_HOST)&quot;</i=
>
    <blockquote type=3D"cite" cite=3D"mid:CAKmqyKNHc0rGAAc=3D3cJZN+uQ8BPh=
SAyb96Y1+pFGt8bk=3DouY6Q@mail.gmail.com">
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">

Since you are changing qemuriscv.inc you and the YP AB should test qemuri=
scv32 and qemuriscv64.
qemuriscv32 should, if I'm understanding how this works, be unaffected si=
nce it has to use sv32 mode.</pre>
      </blockquote>
    </blockquote>
    As mentioned in the below gcc mailing list, risc-v 32 does not
    officialy support GCC's ASan and some of other 32-bit targets. So,
    this should not affect it.<br>
    <a href=3D"https://gcc.gnu.org/pipermail/gcc-patches/2020-October/557=
406.html" class=3D"moz-txt-link-freetext">https://gcc.gnu.org/pipermail/g=
cc-patches/2020-October/557406.html</a>
    <p><br>
      Also, there is no compatible host for riscv-32 in
      gcc-sanitizers.inc:<br>
      <a href=3D"https://git.openembedded.org/openembedded-core/commit/?i=
d=3D7d90d2a70f0184ad715e9917d3e7aa096cf98f79" class=3D"moz-txt-link-freet=
ext">https://git.openembedded.org/openembedded-core/commit/?id=3D7d90d2a7=
0f0184ad715e9917d3e7aa096cf98f79<br>
      </a><br>
      Note: While testing this I found that the &quot;-cpu rv64, sv39=3Dt=
rue&quot;
      also passes when building for risc-v 32.<br>
      I will send a V2 where it only applies to risc-v 64.<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAKmqyKNHc0rGAAc=3D3cJZN+uQ8BPh=
SAyb96Y1+pFGt8bk=3DouY6Q@mail.gmail.com">
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">

Did you find out why sv39 isn't the default for qemu?
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
QEMU defaults to the max supported SATP mode. I'm not sure there is a
specific reason, that's just what we have always done since we allowed
a user to specify the SATP mode.</pre>
    </blockquote>
    Supporting to the above comments, here is the commit that allows
    users to specify the SATP mode<br>
    <p><a href=3D"https://github.com/qemu/qemu/commit/6f23aaeb9be13d4a26b=
7f863533c316105481640" class=3D"moz-txt-link-freetext">https://github.com=
/qemu/qemu/commit/6f23aaeb9be13d4a26b7f863533c316105481640<br>
      </a></p>
    <p>It seems that Risc-V has multiple sizes for addressable memory
      and Linux probes for the machine's support at startup.<br>
      Thus, the reason would be to give the flexibility to users to set
      it rather than having a fixed default SATP mode.<br>
      The authors/reviewers of the commit can put more light on this
      topic.<span style=3D"white-space: pre-wrap">
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:CAKmqyKNHc0rGAAc=3D3cJZN+uQ8BPh=
SAyb96Y1+pFGt8bk=3DouY6Q@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">If not, please check the g=
it history and it there isn't an answer there, ask one of the qemu develo=
pers
who work on risc-v. It would be nice to have a sentence about that in the=
 commit log.

Did you consider a different RISC-V cpu sub-arch such as rva22s64 ?
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
I think defaulting to a profile (RVA22S64) would be the way to go,
that will also enable a known set of extensions.

Alistair

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">
   <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/qemu/qem=
u/commit/3ba8462c4ca55720239fdc6fa30b9870d22a8814">https://github.com/qem=
u/qemu/commit/3ba8462c4ca55720239fdc6fa30b9870d22a8814</a>

I'm only asking because it seems like it might be a good fit for us and I=
 noticed it when
searching the qemu commit logs looking for sv39.</pre>
      </blockquote>
    </blockquote>
    I added&nbsp; &quot;-cpu rv64,sv39=3Dtrue&quot; options for risc-v by=
 default as
    mentioned in the bug requirements.<br>
    <br>
    The support for RVA22S64 looks good to have&nbsp; provided that it
    doesn't break other risc-v builds/tests being done in Yocto.<br>
    Following commit adds the RVA22S64 profile and corresponding
    extensions in qemu.<br>
    <a href=3D"https://github.com/qemu/qemu/commit/af651969eb23ecf018bcaa=
8e0761b58425de550c">https://github.com/qemu/qemu/commit/af651969eb23ecf01=
8bcaa8e0761b58425de550c<br>
      <br>
    </a>I also tested with passing <i>&quot;QB_CPU =3D &quot;-cpu rv64i,
      rva22s64=3Dtrue&quot;&quot;&nbsp; </i>in <i>qemuriscv.inc</i> file =
and asan works
    with that as well.<br>
    I will send a V2 with setting &quot;rva22s64&quot; profile for risc-v=
 64 only
    as follows:<br>
    <br>
    <b><i>QB_CPU:riscv64 ?=3D &quot;-cpu rv64, rva22s64=3Dtrue&quot;</i><=
br>
    </b><br>
    <br>
    Regards,<br>
    Yash<br>
    <blockquote type=3D"cite" cite=3D"mid:CAKmqyKNHc0rGAAc=3D3cJZN+uQ8BPh=
SAyb96Y1+pFGt8bk=3DouY6Q@mail.gmail.com">
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">


../Randy




 QB_MACHINE =3D &quot;-machine virt&quot;
 QB_DEFAULT_BIOS =3D &quot;fw_jump.elf&quot;
 QB_TAP_OPT =3D &quot;-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,do=
wnscript=3Dno&quot;


--
# Randy MacLeod
# Wind River Linux


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#210329): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/210329">https:/=
/lists.openembedded.org/g/openembedded-core/message/210329</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/110856569/3619028">https://lists.openembedded.org/mt=
/110856569/3619028</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:alistair23@gmail.com">alistair23@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
    <pre class=3D"moz-signature" cols=3D"72">
</pre>
  </body>
</html>

--------------6jwtSAnrVKgRTW5SRraOqF7B--

