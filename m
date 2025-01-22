Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4323EC02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 04:52:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.35888.1737521551687564663
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 20:52:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=31173a9983=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M4F3HM001037
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 20:52:31 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqg0r4eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 20:52:31 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50M4qUZe022458;
	Tue, 21 Jan 2025 20:52:30 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqg0r4ea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 20:52:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGFc5cgv23cDCBGQG8lssZLtnCYSfd0v+Xrqd+b1OCRY705CEepzYDjlTjnQfE8wzgPi3ljRqoAB5jsoOwHNGV0ZCNUD0D2FbHgraGlIDMFiyK8bzrMQleixqY0hWdbLVdW/u5Rn9HtfOO/azn9PjAhPourO2j1Y9blP1sQhvsUQWXS8t/HUj91J8waG0d0pZMt4oLKADe5BIiWzlcb90cEyerOxKlK8VqDIlA14m/zW0S0WcZZdv7DE36bt7iwBsmeWkGG2LH0G2d0ktOiMztSsHsz9dIH3m7/t+zt+UkesR5jyPQNQhn3mbJljmpn8ODUypdEit9rWEnwiije5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcKDiUemNNKCoTPP+PPpIn8pEsL8rOnJ4ppdW5YiwqY=;
 b=CbtBHFzaxlHwHxnZrZfW76DdHGYFmFZwYIK5M3GXzytKMQMYf9gvvVi/xkPrwaqALMSzuHEY2p2Gtrkgn3jRMLoOZZhcAkzcXZYMZyryoNxCjSZ4RcrY4gM53kMwzN/7Cq7Dil7L6I0ZB4/ELkrZR8Q5O8rb+cX/iR1fMxrfqxl2u4w3SoK03xvmdo2nqEMlagSo1FdEsKY/DgE2K2TKhYHv77HNfSiuRHgm8sbcLsQjYX6TXUB1T2pOrauqX1LoUawxNn6UDhSdU82R4jPPFcZmDEGVGUnuBus/o5vBC6lfcJ2ftM4O7qNhEvfaP0XchaFSqfPTXeLBb8U20nSw3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5605.namprd11.prod.outlook.com (2603:10b6:8:26::11) by
 MW4PR11MB8265.namprd11.prod.outlook.com (2603:10b6:303:1e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 04:52:26 +0000
Received: from DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a]) by DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a%3]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 04:52:26 +0000
Message-ID: <49d7fc07-48a7-4317-8571-ed84909e8235@windriver.com>
Date: Wed, 22 Jan 2025 12:52:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for building
 32bit binary with 64K alignment
To: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        "MacLeod, Randy" <Randy.Macleod@windriver.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20241225030437.972359-1-Qi.Chen@windriver.com>
 <7008933E-1611-4683-86A2-083772D4CE71@arm.com>
 <PH0PR11MB5611A86DA4C9CE43DEFA2EB5ED132@PH0PR11MB5611.namprd11.prod.outlook.com>
 <181B122FF6A5F825.28670@lists.openembedded.org>
 <218aaf1a-7320-4514-bace-78ce19b313f8@windriver.com>
 <CAMKF1srqww1x7Yh9qff58cZ2fS2cib4QLBRDmMwh1tHnUyuhmw@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CAMKF1srqww1x7Yh9qff58cZ2fS2cib4QLBRDmMwh1tHnUyuhmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::12) To DM8PR11MB5605.namprd11.prod.outlook.com
 (2603:10b6:8:26::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5605:EE_|MW4PR11MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: e313b093-0465-42e0-2d49-08dd3aa09125
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K3U2VC9QUjJrMjJsSytrNlRwNFVmLytiNjVLQXJzNCtkS1MzT1BvbDJiNmlW?=
 =?utf-8?B?M1hHWEdrVFBvNWYzaHJ0M0YxQmhtVmJJeHhoZFBtWkhmQko5K2RhcmRSOFl4?=
 =?utf-8?B?dlUwQ0RydDU0bmtoaGxob1p5VDJSY2Y0eFNCZktJUk5TRkxiWkVmV0NseCtv?=
 =?utf-8?B?UmtCR3Nnd1A5R04rVVhCWXI5V08yRzB4bjdKUmFjQXRZRm8yN2tGc3BDYWRz?=
 =?utf-8?B?TDVhNWJQelpVajE4TzUyZGFBRmJKSlJDVjZsV1A5ZUhxSWt5WklpZkJvWVM3?=
 =?utf-8?B?eWkxajJiVDVnc1Vjc3dCcXJRa2RUNW1aTWpFRHkyVktYQ2tySzBMK1Y5OStS?=
 =?utf-8?B?d0pJUTJVeVpDT0lac0ZLRGFFY1J5Zld0dzE4aEJrVy8vTEljY1NPSmp1NFhl?=
 =?utf-8?B?ZEdqR2kvUWlrMTBVTjJNT1R1MFdOTnU5LzBXNVNSNW9QYnhWZ0pKbXlVb0NT?=
 =?utf-8?B?MjMvSnZoRW9BRHNmWDlXY3Z2eEVOVXpEbUZKVmh4L3ZNVWxGY0tQQlVkL2c0?=
 =?utf-8?B?N0xTVEZRMU9kRTVJbk9jek0rd1lHQi9kbnB4Yk9EdGhpZk1xeGZyNnJFejBi?=
 =?utf-8?B?MTZUY3FmMjF3K3FJdnRueEoxNGhaUmkyUlV2eVlUaFd2ZTF5N29pN2F5WVUx?=
 =?utf-8?B?dmY0SVYxWElIVlJXWHFVUXJwTGpxRlMvZ2IyK0ZTbDFiSzJMUDVFNE92ajNS?=
 =?utf-8?B?NXVDZTAzRWwyQmNiN3FENTRhanMxd0RUSXdSWm1jZ2dZbkdKNStEMkluVUlT?=
 =?utf-8?B?UDUwSzZLaE9vUUEyWm9Hc0FjZExld2dTZmNGUXZrdkVxUW1ZOGw1d2FCTGpB?=
 =?utf-8?B?eHRCUjMyYlUrZ0RCd2dCZ3AvUGQyc0FhM3FFVllMSE5aeEhnYTFMVjhRWk1J?=
 =?utf-8?B?blkwVVRGOUp0bzZBMW9oa1g0TXVyMHNZODFPQnZhVkRIT3BvVitsNUwvSmwz?=
 =?utf-8?B?QVJTT1dxTmcxVnVXdW5RaWxDVTN6b2FuUGtGVzdYU09JWFpuajV5V091Q1FW?=
 =?utf-8?B?MW9zZ3VkbktYcS8rWVZDMHZ1enE2aStTZ2VhOVVWeCswMTVaZUpiTExIenJJ?=
 =?utf-8?B?blI2NnlpaE9YOE9HaFgrSFF3MHY5YWxSQkpGMnAyMFdJUTRWMjJibDFONEYy?=
 =?utf-8?B?Zk1vbEg1dDYrQ0M2WGpsV2tOcFFQU2hkTWxNWU96b1QwR1BWRkJEUEVzTVM3?=
 =?utf-8?B?Yjd0YXowOUFpZGtqeUlFOWw4Z0thdFF3azN3YkovL0NiL0pWZGRTRmlEU254?=
 =?utf-8?B?YllwVjJEbUROWmh4cnNzNll4ejlmVC93cWk4UkxSb1VtYnlPOWxtL0ZPemxx?=
 =?utf-8?B?MGFFeGR5Sk54c0E3a05sdE9RN2QwKzk4TENWTFNtNnB6bStBekVmY0l4aEI3?=
 =?utf-8?B?YU1pMDdmWHBnZ2ozVTRKeW9ERnJKVndSbmZRYnRCRXg0dDc3MFdMa2libTZM?=
 =?utf-8?B?SmZDbjZ1Q1czc1J0OHcwMDBLYlQrYkYvWXpZQjZLS3lhT1JzaE9tTExlcFV1?=
 =?utf-8?B?OXN3S3Ewbm1FRUYvSkxHMSs4SFJXQVhiZHhQdEllUzFncFVwbHN6ZXN2MmZr?=
 =?utf-8?B?aCtoYjg3ZktHWjhVendNbG5VK085Qkowb3lnRDZKTjhYZVpOWG1QMktmaVNW?=
 =?utf-8?B?eG1lNGNvUHlMTG13czhLaWlTWGk1WUtWbU1OWURpTXRTSmZic3pXai9RemNj?=
 =?utf-8?B?ZUNTWTdycnV6WmVGZnYzTXNYbUpoY2c2bzhyQzBRQ0NGUVhpTm1ZSC9ibTBl?=
 =?utf-8?B?ODlkSVh1QmIybTZVdnRidFNIRkRidWs0SXI2blJjSmFjYjhlbzZrTDhhRXdJ?=
 =?utf-8?B?enJIalQ5ZDlzNTZmRVFWUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZDdTZkRoTHh6akdCdXBpMUxwTUk5ZkVLN1pjbUJqTjIvZFhtWGZZaERsSGFn?=
 =?utf-8?B?RmtpZ0tuZkZ1djZSTGw4VStoM2FkUW51ZU5Vclk0Mk1GRHJXMk9BQS9GYnJi?=
 =?utf-8?B?RThDUVhFTTE5cVJWYUFoREdPK25HM2NVYncwK1dWOEZoMWtpcE96dVFXQ2cv?=
 =?utf-8?B?SGs4RkpZU3BuWlNQVHNyMHpmaEFNT1FJb3ZpdWYwK3VsYXVBMUtwS0lMSGc4?=
 =?utf-8?B?bUR2RXNpM2tLeXZMNzZ1TWVUOFdLZEh5YWhOcmI0TU5pWVBxYUFYNzVCbUJO?=
 =?utf-8?B?bFp6WXM5UXI0OTNtd3FXMmpTaUVLYjFWWTM2VXhMRDZWdGZiRzluUjgwOC9V?=
 =?utf-8?B?THhOWWxodG91U3pSUk5CNStZMkMrcHdHcCtLWllhbWJzRjd1ZkNOWktkS3JE?=
 =?utf-8?B?SSt6Zm4xVU5EbHVaRFZDOSt4R01BTlM5bmxoTklQelE3TFZhbzNkbm1YaVMv?=
 =?utf-8?B?WGxsNW8wUUNTU2NyYVBUaytsMkM4MzF4NmlBK2FaRzZZV25GaitKWmdLVGxC?=
 =?utf-8?B?dzJUU1NZNXZ3bjFBeEUxNkIyRWFmalVOazFheFFGdUJXMHFHajVHOE5adXpW?=
 =?utf-8?B?S1ZLK1U1KzlWOEI2eTFXMFpaRTIxOHVKTFFmdU43NS9TWmlIUkpMWlF4K1VB?=
 =?utf-8?B?aVlXdzA3VDZ4eDFLblJVRU5hZ3hTRGFpMlVUUFhMZ082K1FuVnZQYXdwbDJt?=
 =?utf-8?B?K1A1UXA0aEtWZnp5SFZkbHlpWlY3ZkRoTy9jc3k1cmozZVFRcVJ0ZHF0Yysw?=
 =?utf-8?B?YTNUTXliRGs5WHJpQkg5R0dIS0MwMUpVbjVLVmhicGQvYllYOEdaelZ0bklW?=
 =?utf-8?B?VVZicTRqQ0FFSjRKK1RDRElMUlJYMGZ0V3NoYkpKQUR5cFZCYW8vVXYxK0Jh?=
 =?utf-8?B?R3FCOHR1TEE0ZTVzeEcyWGh0NTBESEs5eTdBRFlVUXRCMnp3eHVtSnB2U1dG?=
 =?utf-8?B?aUdINHFSNUM1SThlNUJmK01yTmtPdjh2MUVBb2o5QmVQbWdNWWQ2cHRpQllF?=
 =?utf-8?B?R3RDOTJTVkFyM2I4RUxzZng0dXZpdEdza3VqR3lhVUhKdFRjNHVNT2tUQzdi?=
 =?utf-8?B?QkxIbDA3Sys3TUVPOWVuNGx1bDlpZVFTdEpmbWFQT1d2V1RrTm52UzFjUlo2?=
 =?utf-8?B?UjUwQ2U1NGZ1UjduSU15akNWeHdwa01pM1R4RlFqbURmUzFhMEJRUTlsYWcr?=
 =?utf-8?B?d1FRU1ZWdDBoeFhxbUF1YXh3cTRoSmxiM3V6REN0eE15UjcvaVVNL3lqNmw4?=
 =?utf-8?B?QW1tajFoZ2pPUkRtTEdNMXhvK3FscHhqTXU2ckl1dHE5QXBIcDJIT0xJNEdm?=
 =?utf-8?B?QXRYc09kejhibzJhZ0lsN01wWWZlcjRRYll2S092YldDVDdtbmxCWmtxWEly?=
 =?utf-8?B?b3NXZU1DNk1yLzJ0ak9aSG13QmlwOVQycXRJVVl1Z05TRkdqUGk2aXdxQnRr?=
 =?utf-8?B?NVVHcWdadlR6cnFyZXhmWVQvYmhUSk1aOW54QldjS0Nid2hiaHlvTUVSdmQw?=
 =?utf-8?B?aVBndFNpSDNsclh3UXVkR25BRzNUS3lxNmkzYUY4VTlwTCt4Y3UxLzl5S3N4?=
 =?utf-8?B?SFFBeHpRWFZ3ZTliaFI0NkJUU243YTdoQnhXQWQ2QXdaS0F5d09JcHRyS2N2?=
 =?utf-8?B?NENZSmFiaDdObC95R2JXckVKbGtJSXZVRFVJV05xZDZ4MzMwb0lUeXp3Q3Vk?=
 =?utf-8?B?Vzl1OWdVQ1ZRNWxFK1pySnl5Wit0SkNCTytOTmpLMUd1ZFp2bnN6OXZ5Tm9q?=
 =?utf-8?B?RjRhK1NvWXc2aklTL0hzdXk3MWozQkZjRGRnaklCNUV4VndJcTFJb0Jad3J2?=
 =?utf-8?B?bERCOWJaSHA2VEpwUDhTSWVsYTZObzJIV0U3OTJDRlQra2JMS25JcGRsbnc2?=
 =?utf-8?B?OCs5TUFvMEFEUSt6SVI5OTlIZ1F6KzNpQi9SSWlNRmpoTC9TcDNnT0c5WnNF?=
 =?utf-8?B?MGJpOWZsUDRZVUtuSXp6ZENray9MNEswa25YV3ZTSXRhVkNhcktObklIWFpu?=
 =?utf-8?B?NlB1NlBuT2ZKTWxOeGdyM09tbVJGdmRXa1RPeENBTU5yVXFWRTZiNE9yRVpY?=
 =?utf-8?B?b3VHL28yYjFmVVl2dWgvenBTTWdFdTU4Skp1L1VYbUxIU204dUdYR0tUU3lM?=
 =?utf-8?Q?InR0VuEj16EpadaHaZtEHzks4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e313b093-0465-42e0-2d49-08dd3aa09125
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 04:52:26.2033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: autS+dNQJXXThkq7R4BlGXa85pzUbO02px7HaYkru03+q4pm+9eg1RQ0PqOgTQtO5UusfsWb+gmWYMWyupPSqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8265
X-Proofpoint-GUID: QYbhdwZ4Ha4KR4bQK32OevwTDZ8mW_O2
X-Authority-Analysis: v=2.4 cv=Kue32XWN c=1 sm=1 tr=0 ts=6790798f cx=c_pps a=gIIqiywzzXYl0XjYY6oQCA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=NEAV23lmAAAA:8 a=CCpqsmhAAAAA:8 a=Q4-j1AaZAAAA:8 a=7CQSdrXTAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=TCjS8ceqxTIAHsdSTssA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ul9cdbp4aOFLsgKbc677:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: YQkagWskn3XrDi4FsxKpv7RrDdvUa6Md
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_01,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501220033
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50M4F3HM001037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 04:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210133

On 1/22/25 12:18, Khem Raj wrote:
> On Tue, Jan 21, 2025 at 7:03=E2=80=AFPM Chen Qi via lists.openembedded.=
org
> <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>> ping
>>
>> Is there something I need to do for this patch? Or is this patch not
>> suitable for oe-core?
>>
> if we are enabling 64K pages then 32bit aarch32 apps should also be
> compiled using 64k pages. Usually this could mean different
> performance characteristics and 32bit apps are usually only rebuilt if
> not used as prebuilts, so how will it function in a multilib
> environment?

Hi Khem,

Sorry I don't quite understand what you mean. Could you please elaborate=20
it a little bit?

This patch's purpose is that if users enable 64K page for arm64 and they=20
want multilib support, they can include this file in some conf file,=20
e.g. some-machine.conf or local.conf, to make lib32 apps work.

Do you mean that when users use multilib, they usually have some=20
prebuilt app or library with 4K alignment? If so, then this patch is not=20
suitable. In such case, they need to turn off the 64K page in kernel conf=
ig.

Regards,

Qi

>
>> Regards,
>> Qi
>>
>> On 1/16/25 12:34, Chen Qi via lists.openembedded.org wrote:
>>> Ping
>>>
>>> Ross & Richard, is there anything else I need to do for this patch?
>>>
>>> Regards,
>>> Qi
>>>
>>> -----Original Message-----
>>> From: Chen, Qi
>>> Sent: Thursday, January 9, 2025 9:54 AM
>>> To: Ross Burton <Ross.Burton@arm.com>
>>> Cc: openembedded-core@lists.openembedded.org
>>> Subject: RE: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for=
 building 32bit binary with 64K alignment
>>>
>>> Hi Ross,
>>>
>>> The "./bsp/marvell-cn10xxx" exists in yocto-kernel-cache's origin/yoc=
to-6.6 branch.
>>> In its master branch, the marvell-cn96xx.cfg also enables CONFIG_ARM6=
4_64K_PAGES=3Dy.
>>>
>>> This patch was tested on pristine poky + qemuarm64. The test steps ar=
e in the commit message. I didn't test all softwares in oe-core, but as l=
ib32-core-image-full-cmdline started well with no failed systemd service,=
 I assumed that most softwares should also behave well. I also tested lib=
32-sysstat with core-image-minimal.
>>>
>>> The help text for ARM64_64K_PAGES changed with this commit: https://g=
ithub.com/torvalds/linux/commit/db488be354bc85724d7b9523e94435fdaa761a35
>>> So 32bit arm was not supported at first, but at some point, it was.
>>>
>>> Regards,
>>> Qi
>>>
>>> -----Original Message-----
>>> From: Ross Burton <Ross.Burton@arm.com>
>>> Sent: Thursday, January 9, 2025 1:02 AM
>>> To: Chen, Qi <Qi.Chen@windriver.com>
>>> Cc: openembedded-core@lists.openembedded.org
>>> Subject: Re: [OE-core][PATCH V2] lib32-64k-pagesize.inc: add conf for=
 building 32bit binary with 64K alignment
>>>
>>> On 25 Dec 2024, at 03:04, Chen Qi via lists.openembedded.org <Qi.Chen=
=3Dwindriver.com@lists.openembedded.org> wrote:
>>>> When 64K page size is enabled, for 32bit multilib, we'll need to bui=
ld
>>>> applications with 64K alignment, otherwise, we'll see errors like be=
low at runtime:
>>>>
>>>>    root@marvell-cn10xxx:~# /lib/ld-linux-armhf.so.3
>>>>      Segmentation fault
>>>>
>>>> marvell-cn10xxx in yocto-kernel-cache enables CONFIG_ARM64_4K_PAGES=3D=
y by default.
>>>> And the issue was first discovered there.
>>> Do you mean _64K_PAGES?  Where is this marvell-cn100xxx?  In yocto-ke=
rnel-cache there are no users of arm64-64kb-pages and nothing called cn10=
xxx.  Is this a Wind River-specific fork of yocto-kernel-cache?
>>>
>>>> However, there's a kernel config fragment in yocto-kernel-cache whic=
h
>>>> enableds 64K page size for arm64: arch/arm/arm64-64kb-pages.scc. So
>>>> it's easy for other
>>>> arm64 BSPs to enable this. And when they do so, they'll have problem
>>>> with multilib. This patch adds a config file to help people a little
>>>> bit in such situation.
>>>>
>>>> The max-page-size option is used to fix this issue. This option is
>>>> added to both CFLAGS and LDFLAGS for the purpose of covering as many
>>>> recipes as possible.
>>> First, I should point out that changing the page size is an ABI break=
, and the 32-bit ABI was formalised long before 64kb pages were a thing, =
so things _will_ break.  That said the loader should work, as a decade ag=
o binutils 2.25 changed the alignment to 64kb pages by default:
>>>
>>> https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblobdiff;f=3Dld/=
emulparams/armelf_linux.sh;h=3D280db842208e06e3231ec3a8322369193630a07d;h=
p=3D35891f1fc91bddd03677aaefd7146ae5333e6cf0;hb=3D7572ca8989ead4c3425a150=
0bc241eaaeffa2c89;hpb=3D8335d6aa34b88ce31b62e1b578d54ab4aa364435
>>>
>>> That won=E2=80=99t help specific pieces of software that eg assume th=
e page size is a built-time constant (and use the wrong constant), but he=
lloworld should be good.  Can you replicate with pristine poky master and=
 a minimal configuration in a qemu?
>>>
>>> Ross
>>>
>>>
>>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#210113): https://lists.openembedded.org/g/openembe=
dded-core/message/210113
>> Mute This Topic: https://lists.openembedded.org/mt/110280373/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


