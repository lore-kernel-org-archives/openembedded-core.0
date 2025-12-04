Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E2FD1CDBA
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 01:34:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32504.1764812038959897499
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 17:34:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=E0Ui71ig;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4433fe26ec=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B41RR7b1707708
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Dec 2025 01:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=L2lI0S2DL+mwctAuFj9KTf
	SHw9LdaSIGX2PIbky60K0=; b=E0Ui71igPmX1KJQniV12dEg5Ybtb5M7Aq9z7Hf
	xWyBiVp+tqfjzWaqhWJfOfBOUp7LcryJnra7hzP6d8iqnlVzjLUlnqPvGWNIVN3b
	rvhGI1d1oGkG09Pp4AdfZscSuyou1D+Gd++ie5ff8rcjp85K+qUIBKHFHvWsTs20
	WGBgpTAiZan/+FOXKj4IHO2x+OtRnGJtBwwJxFyAm7DTmbbZ8vmT79BfucQFU/lO
	Q9JXRNQ/uTWzEFbgV4EXQA8TTdTUpt5fLTr95365bV7DubhKP597jxo1DOFFyosS
	H2sVvhE0SstEyGR58BKwxduraZC8MsNzNBIav3LstxxRir0A==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011050.outbound.protection.outlook.com [52.101.62.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21wx0g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 01:33:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0zmdBiZab5BB3PATyfqk08Ldi6BnUIIWPL20Im0Cf8A/6d6dN2TLY07tmyRGd1241cgwqtetniaBATasaDmjiI3KN78Jv0m7jiW9oLORFrv6vxaMwp/b/vNXrfzX0d2HsEE4/PDQ3+zXvMZ8M7ptovpFp5FqERU/jpNdyxoEEYyGEaAnDpSv276mg5VrlsPXzjlK6qsivZqe0vZ+Mmp1NQa6xlSb9kR3DjZbsLaqHKOnPrJQKwpQJQysUAKiY3kknzGPvkbZlhctcjPEQg5PYNTTsJalAFbW12OSFypBPxFtjXf23B9ebbKrZ8Ikvp8E512cYK6z5Pvyzg4GxrLEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2lI0S2DL+mwctAuFj9KTfSHw9LdaSIGX2PIbky60K0=;
 b=IL3c42T0RTa05k+2eYS9pvhw/4tw75G7WcNJyaBpCxFSB3HyH3FTC86paZyuMHUw0bg+yA0ItdQKTWETyfU7Vreqc9cnbxmvSiUFc4ERzjXFEKz4rhAmaZkJGkiXF4xZu6QDNQoOgUbC9fQ6QP3swq8pZua4IvSXNbePUKYedO3bMLxCvxZTg2cuvAVvTtz0vm5ZNpAnOYtX9mkJAHfeSUZSFJMA9dsgJzYihraQu5f2IWiCP2rILTylHDoLX8lM/aaK6xXnOPHmv2LDCXNWAWU5df/MITkJ3T7tlFgG8FoHUjptj/mzLJAGUIeyMxxa2MuzZBYsGwutJCoANAJPtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CH3PR11MB8384.namprd11.prod.outlook.com (2603:10b6:610:176::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 01:33:52 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 01:33:52 +0000
Content-Type: multipart/alternative;
 boundary="------------Pm5OoJg1DPxz5ADXCuLhXtf0"
Message-ID: <cbae3c58-62ab-4b94-ba81-826a0628498d@windriver.com>
Date: Thu, 4 Dec 2025 09:33:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [V2][PATCH] shadow: disable econf for native
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <187D937D5EDF22BD.489296@lists.openembedded.org>
 <20251203062704.138197-1-changqing.li@windriver.com>
 <CAMKF1soiPObK5M_JhwvWCg3NZ4oKuEpOqdcDopJfj5070=BA4w@mail.gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAMKF1soiPObK5M_JhwvWCg3NZ4oKuEpOqdcDopJfj5070=BA4w@mail.gmail.com>
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CH3PR11MB8384:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b0850e9-e1c3-41ac-69be-08de32d52e1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z2gwZ3lBbnZjY3YyeFg1cGEySWVPV1Naejc3MDNaTHBVSlQzS1M4VlJRZGF5?=
 =?utf-8?B?dmlDUnpzcGxvM3ZxTnZicFlNYzdNWnRvNktJRFBidzdwM1kweUZERXBUbzY5?=
 =?utf-8?B?RUl3cEN0Z1BYOTFYVzluMnlORXRLQUJoKzBpRytqZTNTTGRaTFppeVA4UDlS?=
 =?utf-8?B?ZWIvYk54R2hVcmdJcXRqOXNsTTlPS0FubXd4TnRXU084YU9TSk1qZzRSTGo0?=
 =?utf-8?B?QXNrMjFma3NwTnhCZVljYTZDd3lUVXI3Vy9TbDRQL2RwR0xJVjhoaTJ3S1pw?=
 =?utf-8?B?M0xTTzBvQTZjQ1YrZVVnbmZ1TW5Ea0Q0SXJ4VjAzeXJ2MjVtZGVTWHN6Mmox?=
 =?utf-8?B?MlorL2FtVnQvN2Y4S004dzFSelM1bDlNazFLUnpKQkVVYU8vbDFETnBNZVJ5?=
 =?utf-8?B?aUJWTzNTclZibWZVejBCUlBLQ011aDNsN3YxbkhGMkJuWmpQUHI0Z3liL3hv?=
 =?utf-8?B?ZHNYempLWkRFZlp4RWtzVm0vMW5ESTVSeDBCanVsNlFIeC9ZK2ZoeEQ0UG43?=
 =?utf-8?B?cExJMEYreWVXK3lrcWJGRFZaUHk3dkNUdWZ6OVI5djdvQUJuZm5zaEZibFRM?=
 =?utf-8?B?VHQxQ2FqZlk1NzVxaTlNcVVhYXg5UU8vK3VkaHNLVWhSVVE5eEVpeHZ6djN4?=
 =?utf-8?B?RXhWVkMvbThBSHpzSWNQMVlOR2RxWGNuOFUwbDdvMUU1S1czOWlzVFBCdG9l?=
 =?utf-8?B?MS9qclk0NitPaGorUmhucHVuVExGdmVFeURVNXZpL1BmdVVmL1JaMlM3dDAx?=
 =?utf-8?B?NFBlVDBSV3pUZ2w2cXZwWmJ0R3pqNlJYOGcxanJXUFlNVHhSdE5MVXQyZGRq?=
 =?utf-8?B?a1FWUzB3QUxoNHJHZjkrWWFPRW5meHhZdFIzMERBTHFTMi9VY1Z2aWliYnVv?=
 =?utf-8?B?TU03Z1FsOGZWVk5xb0Y5eTBzeUpDTG14TkJZeHgxOC9NbDRPbDdCeGl3UFNP?=
 =?utf-8?B?Mm9PS1Q2ZmZrVjl0R29FQW1yN2RXLzBUVFY0eSsvRWVVR28yTjA4czNVWFY2?=
 =?utf-8?B?QnRKaG4yRVFPMnBMM0sxK3I4WHBNcmp6a0FYbmsyVEVKelNtaUtBNExNTVl1?=
 =?utf-8?B?MXBuSjZ5Z0FEbkY4WjFmVFI0cnBqVEJtcUpiUHRDcVVTcnkvN0c2VWxRUStt?=
 =?utf-8?B?TFN5TnIrdGhrb2l3d2dtR0VwMUtXa0RjOGZaVVdIcGZMak92WXQwZWpFTkxN?=
 =?utf-8?B?RGJvMHhkT0drNEIzWUZQdUdmUmEyeEVZZDdJUGg1NGlQb0xmV2lhWVB1QkJH?=
 =?utf-8?B?ZjlZSzdzaXMyNi9OWHFaRUVUZlJ5TWMzV1R2QWNVV1VjMGpjckNhcGNiN2Fj?=
 =?utf-8?B?am1xVW4yR05CRlYyK0t2QjFaQy9VQ0Rjb1daNGdvWXArUXh0Y2FwdU5WcU1a?=
 =?utf-8?B?SmVOaFo4UFkyL1N6N0JCRUZkT2x1bHNKSHB5Q2QrcE8yR1Y1Mk5PN2Z4Zjhl?=
 =?utf-8?B?Z0c1NytzbStOeHJSZFk5b3NEc2xEVnlaWSs3SVR3eG1icnhXSVF6NkI0bWdE?=
 =?utf-8?B?YjAwK3Z1MmkyY1BUakNac2MxQW9UcTVQaWYrRHltak1ITkhpN2ZmZ0k2Wlpz?=
 =?utf-8?B?NEFrODZqT3d6VTdPR3NwcUFFTnRZK3prTHhjSzdERXJxb1I2Zmx4VnQxaG1r?=
 =?utf-8?B?K3M1c1dPRWE5d1pwSk13aVlTZ0hZdVpVL0p0WnZsVnY3TWpNY1JRbmJ6Zkxu?=
 =?utf-8?B?UU1sekFSaHE3YkNWNXMvY213T2pLNGxLbGJ1bFVoN3dkWTZ3Y2xseGp5MUow?=
 =?utf-8?B?MnhEcUtkWXBKSkdhbDhKakxaSHJmT0JRek1HWmxYdUhrYVpLL0IzbHdrSWRT?=
 =?utf-8?B?aHVEWGFFeE45Wlo4a09WT3k1aGVmTTU3NTMybU9JdGova05zTGdPTUJxU2pa?=
 =?utf-8?B?MDNWNit1djN6OSs4K2ZDeVlYMjEvd1gzeW5mcEo3dmRaZXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WHNSYU1tR0M5ZWxRVkdpZmR3RzBHdWQzeDljWng0dlpzd29JTnFJSVRXelE4?=
 =?utf-8?B?dXVRWUdaL3ZLbmJaNDN5UEk3TkdYNUJiakNSREMyT3IrT3Y5Z0RjYklqbnRs?=
 =?utf-8?B?djNwaUV3Qm9tWWpFS0lhcHR3NWRKN2xhdHBaL21ZU2FQWXVESnVGa1lVVG1M?=
 =?utf-8?B?THp2MHkwN1JnUVlTMVI0ZHdyeVJQRnh4VDdIeEZRNXQzZkNQM3pzMTA1OWJE?=
 =?utf-8?B?WmlmTERZdGt1Tm5qcWZiaWpZdm1IYXcyZzlUQzJLYWJRTTY0V2c5Z09Yclps?=
 =?utf-8?B?Q1dCODNhUzI2b2RMQndvTUJQOXFMUml1SWZvdmowNmNXdWh6bEdhRWQ0QXJ1?=
 =?utf-8?B?UGR6U2pscVltN0lSWk5WWDRqVnRBWWk4WmFCeTBjWWRhUWtScEJ0L3lmWncx?=
 =?utf-8?B?QVBKdjJycjg3Tm9GN3A1eXN5RlJFV2FobjBlQ1YwVVdBYUppVm5XSDlBYVVw?=
 =?utf-8?B?SDBseTNadzZrTXNMbU9rWDRKclc4eEw1ZEozRnlTWUtaUkU3dXJab2N0NXdF?=
 =?utf-8?B?QkIyaHVubUw3Q2lydUFIQm0xUGlHSTNXQ0JpRUZKWCtwYm40SUUxZzN0WjE1?=
 =?utf-8?B?REsrcjk1MkdqL1RESlJZN2dZcm83c01VeUhXMUpTU3U3MStwV3BvSjNNL3Vw?=
 =?utf-8?B?b1g5cVp2VHZ4RlJrV0xsa3hMaTlRQXA0S2VYV3JOeVJNdHo1aTl1SjlGeXFG?=
 =?utf-8?B?elo2M2hjRVc0eWlNTzZFbGVWcm1nV053dlpXVC9xZDI4dUhNT0JDOXhHWlRV?=
 =?utf-8?B?cmd6bnRFOUpCSkgrbTBicGpHd0lKQ0hrZFZCNUFjU0hyc00rd05UNlhJdk41?=
 =?utf-8?B?ZU5sYnhSc3lhNllBYzNLWE1LRU01QTV4Q0trYTF1bEtZZnltazdsVjRCUktw?=
 =?utf-8?B?RVVVb09vL29qWHdkQWtEOVd0K1NlUTROb04wNUxkbmRINE9Pa2pQaThxNnZM?=
 =?utf-8?B?em9MQ2VLamt3cG9DRjVXS3Y1QUpLbFdmcVRtekkrMWthR09qeUNvRGFsMTJ4?=
 =?utf-8?B?b1RQdWZwL2kwenk1TTU4VmFKRitibk1DeUwzRmhYam5UTGxLSys3SEFXWTha?=
 =?utf-8?B?c2U5Qlg4WVVsZjA2RmFUUkZHRE96VkVVK002WWlwZWNrcS9tTUhMbzVqVzlH?=
 =?utf-8?B?SWtjM0V0VXlKd05kTVo3ZnlTS2w2aC9UUWNWOWRPZjZiWjlmOXcyZlY4eTZj?=
 =?utf-8?B?dFh2emU2Q2QrTHRvQ29xazE3K2hjaThibFJIRG1ZQWZicXpsRm9kU3hwUGE2?=
 =?utf-8?B?WGdRNklCaXdBK0Vwd0NGaTEybnd6S3NBQ0wycWVzN3lmNmxXdmp1OC9zY0RY?=
 =?utf-8?B?UXJQYy95OHFVa25sRFRyaXlkMDNXcUZvZGpPcENmYlZ3cGMrMTVuOWtPSGdI?=
 =?utf-8?B?YVp3SUFud0pNUTBqSnR5YzFCWmJ3QUdSY0lGZVNDNXljcVd1MzRZZ1IrZm8w?=
 =?utf-8?B?emVWWEsxOXAxZ1E1TUs3Q3FiUm44dkZodjdtYmpnZDNQdGhzemFnMjNieS8z?=
 =?utf-8?B?YVRGNGZPNHVBMXdTaDJ3RXpjSTVMdXI5eHRjZENqRjVvVGhkU2hsKzg5ZHJJ?=
 =?utf-8?B?Z2VrdGVyTVowM0wxcHRqbDJQZFpzaHdBQThreUlBUmdRcmJ6OG0vOEUrL2wr?=
 =?utf-8?B?dFhYT0lHQjd6YU5BampMcktYbVpzeUNrcHFhZkphUUMvaGovTU1oa1NGREpu?=
 =?utf-8?B?WGd2dDBWTEQwTXpSdzBuN0FER0xkNlNyUHRtYmJIZHJUUUdEYzJpakpXNFMx?=
 =?utf-8?B?V1cwUEUwZG9kRy84VklIVWl4VGV3MTBmYWFlcHBNMGt0TkFsUHBOdVBXdUJD?=
 =?utf-8?B?MmhCVnpDemhYNXJKTG1KZnkwNFVCR1pJVHFvdGxvYWVTc1VweERORjJ6VmJj?=
 =?utf-8?B?RUhmOUNxS1RDeVVOeFNBSnd0RFlvNW5QV3MwTlk1RUcvelIyeE5nNCtUUDJy?=
 =?utf-8?B?Ym16TGsybVBxMEhyZ3lvN1loZHg5V3kyZlZjVXZWa01QcG9jK0pqVkZVS1Nj?=
 =?utf-8?B?S0lmdjlVc01vU2dmTDVZNTBhM09renpJYW0vUEVyUWJDQTNSUVRkdVNtSzlr?=
 =?utf-8?B?YmkvTzB5c1lQcXphbm5yRW5xUEMyYzlQdHFpOTdEMDlYaFlZRkYwQnY2Szl2?=
 =?utf-8?B?WDVGaEhOMlFBdjdIKzRrc3JBb1Q4c2J0VHJFaHQ4VzljQlEycEl3UUNJQjh0?=
 =?utf-8?B?QUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0850e9-e1c3-41ac-69be-08de32d52e1b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 01:33:51.9650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B55QHSnxBpRi4OwgwX0gXjIIDE8gQUcgtTzgZHwhX+6CIxykiLyj2i5PUk93cnXidEsXdJ/TaJ/oAuEyBTVIV4FE6JNv52gxQ8KZdV+K6Es=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8384
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: k98qLFDkIDSbfMPx00FyUnBldB0kjle5
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=6930e505 cx=c_pps
 a=Vx/W+/sNOQWsPBnrpFcqzw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=ySjF6f4xAAAA:8 a=0zhiEtMHAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=FA6HuxQqLG_eDd8xSZUA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Ovip62wdMNR04WBdoD0A:9 a=Cq28mrzf1Dlbsf6k:21
 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=SVe2G6S_LxxHVpu7-jkk:22
 a=v7CeC1Rd8Ef7gCqLsajQ:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAxMCBTYWx0ZWRfXzjdYqImL2FFf
 001qy+hBPC0p+oT5cyV5to5HTl4gKXNjEE4IGe8tVWz9MGvBtnNExBDjRsgaplz/xC8YT8ILIMW
 CSzKQUMsqXN7k4erCDKpM04j6K9DdOXNvWuO6oDcTnWhLJqgTQrh2rm+dwDX4jeMRPm0RL8YFX8
 D1eT/XnL1kuj5jflVw0tchcGLTlehjO3ZAlOii1Y6ZanBzCvvtJhipt9rOADaTJSL8U29zNyTvq
 b0A2O3nQ/IiGAe6merHQu3HYBWV7IGgVDrFGEeQk9MHOStD4BmV02mcJ6YFKsjmPK8aF1sOvOtf
 fzyZncl6VbpFLtBwsXiIX68ON8rnwNDfVwUC4KPsY4Tayi3Pw1c1Rj+EJYP6RkviKcxunn62jSB
 CrMeLcSYxHP7VwupCrLyP/cfHwZcYw==
X-Proofpoint-ORIG-GUID: Uh63M0fniaXSlgCc1lWC0zjFyhMhOHsg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 01:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227246

--------------Pm5OoJg1DPxz5ADXCuLhXtf0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B41RR7b1707708


On 12/4/25 00:55, Khem Raj wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Tue, Dec 2, 2025 at 10:27=E2=80=AFPM Changqing Li via=20
> lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!ez9gin12PukVO1Esf8fELc2tQLbBMY3RUaK_JL55cLnhqppNa2WEVir3LZ0hiDMIVDKoD=
Vsjf0D_cs23DoWkFg$>=20
> <changqing.li=20
> <https://urldefense.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!ez9gin=
12PukVO1Esf8fELc2tQLbBMY3RUaK_JL55cLnhqppNa2WEVir3LZ0hiDMIVDKoDVsjf0D_cs0=
3k4UVTA$>=3Dwindriver.com@lists.openembedded.org>=20
> wrote:
>
>     From: Changqing Li <changqing.li@windriver.com>
>
>     When libeconf is installed on the host and GCC from extended
>     buildtools
>     is used, the host=E2=80=99s libeconf is detected and -DUSE_ECONF=3D=
1 gets
>     enabled.
>     However, the buildtools GCC cannot see the host header files, causi=
ng
>     the shadow-native do_compile fail with error:
>     ../../shadow-4.17.3/lib/getdef.c:22:10: fatal error: libeconf.h:
>     No such file or directory
>
>     This patch disable econf to workaround above issue.
>
>     Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     ---
>     =C2=A0meta/recipes-extended/shadow/shadow_4.18.0.bb
>     <https://urldefense.com/v3/__http://shadow_4.18.0.bb__;!!AjveYdw8Ev=
Q!ez9gin12PukVO1Esf8fELc2tQLbBMY3RUaK_JL55cLnhqppNa2WEVir3LZ0hiDMIVDKoDVs=
jf0D_cs1eR7BugQ$>
>     | 2 ++
>     =C2=A01 file changed, 2 insertions(+)
>
>     diff --git a/meta/recipes-extended/shadow/shadow_4.18.0.bb
>     <https://urldefense.com/v3/__http://shadow_4.18.0.bb__;!!AjveYdw8Ev=
Q!ez9gin12PukVO1Esf8fELc2tQLbBMY3RUaK_JL55cLnhqppNa2WEVir3LZ0hiDMIVDKoDVs=
jf0D_cs1eR7BugQ$>
>     b/meta/recipes-extended/shadow/shadow_4.18.0.bb
>     <https://urldefense.com/v3/__http://shadow_4.18.0.bb__;!!AjveYdw8Ev=
Q!ez9gin12PukVO1Esf8fELc2tQLbBMY3RUaK_JL55cLnhqppNa2WEVir3LZ0hiDMIVDKoDVs=
jf0D_cs1eR7BugQ$>
>     index ba65fc7196..42d0d54b3a 100644
>     --- a/meta/recipes-extended/shadow/shadow_4.18.0.bb
>     <https://urldefense.com/v3/__http://shadow_4.18.0.bb__;!!AjveYdw8Ev=
Q!ez9gin12PukVO1Esf8fELc2tQLbBMY3RUaK_JL55cLnhqppNa2WEVir3LZ0hiDMIVDKoDVs=
jf0D_cs1eR7BugQ$>
>     +++ b/meta/recipes-extended/shadow/shadow_4.18.0.bb
>     <https://urldefense.com/v3/__http://shadow_4.18.0.bb__;!!AjveYdw8Ev=
Q!ez9gin12PukVO1Esf8fELc2tQLbBMY3RUaK_JL55cLnhqppNa2WEVir3LZ0hiDMIVDKoDVs=
jf0D_cs1eR7BugQ$>
>     @@ -46,6 +46,8 @@ EXTRA_OECONF +=3D " \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --wi=
thout-sssd \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${NS=
CDOPT}"
>
>     +CACHED_CONFIGUREVARS:class-native +=3D
>     "ac_cv_lib_econf_econf_readDirs=3Dno"
>     +
>
>
> I think it would be good to add it to all shadow recipe classes.

Yes,=C2=A0 I ignored shadow also has nativesdk class.=C2=A0 I will send a=
 V3.

//Changqing

>     =C2=A0CFLAGS:append:libc-musl =3D " -DLIBBSD_OVERLAY"
>
>     =C2=A0NSCDOPT =3D ""
>     --=20
>     2.34.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#227201):
>     https://lists.openembedded.org/g/openembedded-core/message/227201
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/227201__;!!AjveYdw8EvQ!ez9gin12PukVO1Esf8fELc2tQLbBM=
Y3RUaK_JL55cLnhqppNa2WEVir3LZ0hiDMIVDKoDVsjf0D_cs0G7lZ7PA$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/116590532/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1165=
90532/1997914__;!!AjveYdw8EvQ!ez9gin12PukVO1Esf8fELc2tQLbBMY3RUaK_JL55cLn=
hqppNa2WEVir3LZ0hiDMIVDKoDVsjf0D_cs3EtiUgkw$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!ez9gin12PukVO1Esf8fELc2tQLbBMY3RUaK_JL=
55cLnhqppNa2WEVir3LZ0hiDMIVDKoDVsjf0D_cs0QaBOZYw$>
>     [raj.khem@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------Pm5OoJg1DPxz5ADXCuLhXtf0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B41RR7b1707708

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 12/4/25 00:55, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1soiPObK5M_JhwvWCg3NZ4oKuE=
pOqdcDopJfj5070=3DBA4w@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr"><br>
          </div>
          <br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 2, 2025 at
              10:27=E2=80=AFPM Changqing Li via
              <a href=3D"https://urldefense.com/v3/__http://lists.openemb=
edded.org__;!!AjveYdw8EvQ!ez9gin12PukVO1Esf8fELc2tQLbBMY3RUaK_JL55cLnhqpp=
Na2WEVir3LZ0hiDMIVDKoDVsjf0D_cs23DoWkFg$" moz-do-not-send=3D"true">
                lists.openembedded.org</a> &lt;<a href=3D"https://urldefe=
nse.com/v3/__http://changqing.li__;!!AjveYdw8EvQ!ez9gin12PukVO1Esf8fELc2t=
QLbBMY3RUaK_JL55cLnhqppNa2WEVir3LZ0hiDMIVDKoDVsjf0D_cs03k4UVTA$" moz-do-n=
ot-send=3D"true">changqing.li</a>=3D<a href=3D"mailto:windriver.com@lists=
.openembedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetex=
t">windriver.com@lists.openembedded.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windr=
iver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-lin=
k-freetext">changqing.li@windriver.com</a>&gt;<br>
              <br>
              When libeconf is installed on the host and GCC from
              extended buildtools<br>
              is used, the host=E2=80=99s libeconf is detected and -DUSE_=
ECONF=3D1
              gets enabled.<br>
              However, the buildtools GCC cannot see the host header
              files, causing<br>
              the shadow-native do_compile fail with error:<br>
              ../../shadow-4.17.3/lib/getdef.c:22:10: fatal error:
              libeconf.h: No such file or directory<br>
              <br>
              This patch disable econf to workaround above issue.<br>
              <br>
              Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing=
.li@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"mo=
z-txt-link-freetext">changqing.li@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;meta/recipes-extended/shadow/<a href=3D"https://urlde=
fense.com/v3/__http://shadow_4.18.0.bb__;!!AjveYdw8EvQ!ez9gin12PukVO1Esf8=
fELc2tQLbBMY3RUaK_JL55cLnhqppNa2WEVir3LZ0hiDMIVDKoDVsjf0D_cs1eR7BugQ$" re=
l=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">shadow_4.18.0=
.bb</a>
              | 2 ++<br>
              &nbsp;1 file changed, 2 insertions(+)<br>
              <br>
              diff --git a/meta/recipes-extended/shadow/<a href=3D"https:=
//urldefense.com/v3/__http://shadow_4.18.0.bb__;!!AjveYdw8EvQ!ez9gin12Puk=
VO1Esf8fELc2tQLbBMY3RUaK_JL55cLnhqppNa2WEVir3LZ0hiDMIVDKoDVsjf0D_cs1eR7Bu=
gQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">shadow=
_4.18.0.bb</a>
              b/meta/recipes-extended/shadow/<a href=3D"https://urldefens=
e.com/v3/__http://shadow_4.18.0.bb__;!!AjveYdw8EvQ!ez9gin12PukVO1Esf8fELc=
2tQLbBMY3RUaK_JL55cLnhqppNa2WEVir3LZ0hiDMIVDKoDVsjf0D_cs1eR7BugQ$" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">shadow_4.18.0.bb<=
/a><br>
              index ba65fc7196..42d0d54b3a 100644<br>
              --- a/meta/recipes-extended/shadow/<a href=3D"https://urlde=
fense.com/v3/__http://shadow_4.18.0.bb__;!!AjveYdw8EvQ!ez9gin12PukVO1Esf8=
fELc2tQLbBMY3RUaK_JL55cLnhqppNa2WEVir3LZ0hiDMIVDKoDVsjf0D_cs1eR7BugQ$" re=
l=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">shadow_4.18.0=
.bb</a><br>
              +++ b/meta/recipes-extended/shadow/<a href=3D"https://urlde=
fense.com/v3/__http://shadow_4.18.0.bb__;!!AjveYdw8EvQ!ez9gin12PukVO1Esf8=
fELc2tQLbBMY3RUaK_JL55cLnhqppNa2WEVir3LZ0hiDMIVDKoDVsjf0D_cs1eR7BugQ$" re=
l=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">shadow_4.18.0=
.bb</a><br>
              @@ -46,6 +46,8 @@ EXTRA_OECONF +=3D &quot; \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; --without-sssd \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; ${NSCDOPT}&quot;<br>
              <br>
              +CACHED_CONFIGUREVARS:class-native +=3D
              &quot;ac_cv_lib_econf_econf_readDirs=3Dno&quot;<br>
              +<br>
            </blockquote>
            <div><br>
            </div>
            <div>I think it would be good to add it to all shadow recipe
              classes.&nbsp; <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Yes,&nbsp; I ignored shadow also has nativesdk class.&nbsp; I will=
 send a
      V3.</p>
    <p>//Changqing<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1soiPObK5M_JhwvWCg3NZ4oKuE=
pOqdcDopJfj5070=3DBA4w@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              &nbsp;CFLAGS:append:libc-musl =3D &quot; -DLIBBSD_OVERLAY&q=
uot;<br>
              <br>
              &nbsp;NSCDOPT =3D &quot;&quot;<br>
              -- <br>
              2.34.1<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#227201): <a href=3D"https://urldefense.=
com/v3/__https://lists.openembedded.org/g/openembedded-core/message/22720=
1__;!!AjveYdw8EvQ!ez9gin12PukVO1Esf8fELc2tQLbBMY3RUaK_JL55cLnhqppNa2WEVir=
3LZ0hiDMIVDKoDVsjf0D_cs0G7lZ7PA$" rel=3D"noreferrer" target=3D"_blank" mo=
z-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-core/message/227201</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/mt/116590532/1997914__;!!AjveYdw8EvQ!ez9gin12=
PukVO1Esf8fELc2tQLbBMY3RUaK_JL55cLnhqppNa2WEVir3LZ0hiDMIVDKoDVsjf0D_cs3Et=
iUgkw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
                https://lists.openembedded.org/mt/116590532/1997914</a><b=
r>
              Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@li=
sts.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
                openembedded-core+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!ez9gin1=
2PukVO1Esf8fELc2tQLbBMY3RUaK_JL55cLnhqppNa2WEVir3LZ0hiDMIVDKoDVsjf0D_cs0Q=
aBOZYw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
                https://lists.openembedded.org/g/openembedded-core/unsub<=
/a>
              [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" mo=
z-do-not-send=3D"true" class=3D"moz-txt-link-freetext">raj.khem@gmail.com=
</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------Pm5OoJg1DPxz5ADXCuLhXtf0--

