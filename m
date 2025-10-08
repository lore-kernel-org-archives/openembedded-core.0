Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B729CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 12:50:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15114.1759927806205546636
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 05:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=exFffFBh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=23760a30dc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 598A04w0579687
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Oct 2025 05:50:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=uvRAvf7ke1r5SX//ffwdyJsgV1YAIGknyOTERVZNXzc=; b=
	exFffFBhkalCWic+xrbGFUWOPmDGr4Vf38n1H/SIpUQic+t93wADVTyVeGwdKFYf
	DjDTSl+Rb/KkkOh4d+u0vrzjve5XXJxruH8AeWZcIVvGl4ZvK9ZDjPGJec8RBkBm
	wOv5xsqAEbXYyZMhmfUDXr1gE0/gGlbGVp6u/CEiM9LSR4vTMTgKAS/kwpoG6spU
	2OfMpvoA13HkXHAaWbPGTM8NAdBUC8AxUU4gh6S+H/XSacJbFSSzyjB9MIRh9TvK
	Fp0mNihP84sla3qAkxKY9cX7sC2Gz5MtYIGkpJKZ5MkhxEZ8Ga2UL3C/Jj5REsdk
	7WJca8eXhioLEy8AoZtVFQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011059.outbound.protection.outlook.com [52.101.52.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49k33f4789-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 05:50:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f73ayCdMRBsAmAeAMNaHE5z2C3EVvQdzSuBFKkZFTw4itFiOqs4iwyZzwWA1+Ss9Rq6zXOXDLhY6JNPaBzSB0xkj1Glc8uADgdg0jKyogDdBgGUU3O2IQD22xLnZrn0duVAx/St0octt4yAJ564Y0SC9JiwzoQ1+uEV8zC8FvllzG9VG2gPc3Cb34rV9im3YsX0B7C/BM0Y3Xw8OV+VbD4aRvatvaX5bu38FwhFOiNdZq2vZsc5g0RpTUElwM3IpQxPr+jDuiyJdJWJm8aLNxmnxpLnSMfEAgEyqXJemRuqbHGZ+WubZsgSt6T4QfYerQqSkpGr+xzy3u4wSFzegyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvRAvf7ke1r5SX//ffwdyJsgV1YAIGknyOTERVZNXzc=;
 b=y8epCsXY5HRT84B0GvQKFQb+BeNAZEwlJlC+oED4v8yan180bgjFSS+h+GMj/MjOg2zUUIu5neMBmhVjdWqP+eKCMZs2lj+QqF361fQvBmnYmimGJwhGgIWioyLQTV/s0Vy6qxVdWFZ5NgzgFFEJJYX53kBdwSBs5upRa1JRQxUvwV6vD5SCLz4c2RaEQzydHVpSJkqUgORW9Mak1yWHdH03r64hI+PDsSw01xB9frHnJqiiZhWokbNL+ksfyE+8xgLqgqVrlDdYmFcZkRKjk/sw8EruDW5n6KFhGx01oxAJSNdVupcrm05hzWZ4hUleyli/YVRbtCd71KDIwj8EUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH0PR11MB5928.namprd11.prod.outlook.com (2603:10b6:510:144::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 12:50:03 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 12:50:02 +0000
Message-ID: <a7b7c7a1-7110-427b-b883-c097e62c447f@windriver.com>
Date: Wed, 8 Oct 2025 18:19:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3 1/2] rust: Use clang instead of rust-llvm
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
References: <20250926102411.3742996-1-Deepesh.Varatharajan@windriver.com>
 <9433bf5a-8648-4142-a17f-69092253dd46@gmail.com>
 <f07bc225-e3b6-4ac9-b6e4-de52d4053618@windriver.com>
 <CAMKF1spO_MP=CtN8rdG3S=YE2qmUEVYfCDsRrxzo6pipvpJD6w@mail.gmail.com>
 <55dd2edb-6faf-446d-b28a-4bace9859169@windriver.com>
 <CAMKF1srTjQc4ib7vo4+OPdDxzKj6fWowniUQajcvRGy-nUDv2w@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CAMKF1srTjQc4ib7vo4+OPdDxzKj6fWowniUQajcvRGy-nUDv2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PN4P287CA0121.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::8) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH0PR11MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b235b74-fd0e-416c-6ec2-08de066932c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UDlveGEyQVNaNWRET25DUSsveFEyVzRqRXY2dXpzSlhtdGNvYlFuUytEcjl6?=
 =?utf-8?B?THpLcDBRQkRVNE1zNUdkeWtIUFgycmRib0Nkb3lpUlhBZVpBYmJUME04OTcy?=
 =?utf-8?B?cndIa2Q0eE4vWk54VGpxMFMwMFNUSmt6TUZLL0dhRyt5ZCs2OU1CTjZ0UFBV?=
 =?utf-8?B?S1hjZGFjRW8xWlhHdU1HNlI4Mk5ESk5qKzdIb2hCMG9wYmh4S2xmemNjVnR1?=
 =?utf-8?B?OE84UkZwcHFSOWlpSUloNHZtbWk1NEZvQkhHSmtQNHlZMU1vQmkybVhtSUM2?=
 =?utf-8?B?a3J4bDl4U204RldZWXJuNnE1SjBQSVBzZ1pHc01jYTN4VXRKNEpzTXFaejZ5?=
 =?utf-8?B?djMxNTdJdWlMQ1hkNTc5T3dTSFY1Y3U5TktFdVM2NXpWS3Ztc0tvMzFqMVJR?=
 =?utf-8?B?c0RBZ1JRS3JIWGpPcFZqM3daSU9qbGJDdmI4dE1qbStBWkJBQURUU3U4a3M0?=
 =?utf-8?B?SFdZVVdGSS9MQklyLy94RXpWbDJnVjNRSG5Uc1BrWWdKUVFhTWZTei9kWm82?=
 =?utf-8?B?MjUwcEFLSjdudnhjeHFIKy9QeHJNdFY2RXZUYXc4d296aGtlUWQ5N1pIazN3?=
 =?utf-8?B?M3YrQy9DY2cxKzZZako4T1BGeWN5cEJrS0hWYkZ1L2pxdldFb1JTYlB1Z3pY?=
 =?utf-8?B?emFUcWRNbkR1TmljdzdEanFNQXJhWTF4dnZtc1lUMCtwK09rRDRQMkZ0cmFa?=
 =?utf-8?B?aDdoTzhFSmtaTnU1bHZXaHdkdVJpODkvdkpjVWh5bExkcHVqVFlRSVBUSERD?=
 =?utf-8?B?dUl0QWNQU2YxSUhpZEJoWDU2TktubDRrM0tsMzBieHVoMFR1eEc1R0hkZEdw?=
 =?utf-8?B?Vy90aFF5VUQ3V0FoYXpNd1RRNXZDTkE4elN4Z1BmVnBDYnRjTjRnamRsOEJQ?=
 =?utf-8?B?WHI2VmtCMVNqOTc1aElkNkcva1ZxcXBoY2pKR051YmNNQ0p0N1JlMmMxS09p?=
 =?utf-8?B?STVRaVJacFNTa1hKQWpibWNyalJzcXYwTU1nZHZOZzhhN1lFVjF5c3llM3pY?=
 =?utf-8?B?ZW9KQmd6cFFKcmd5T0p5bS9GdllyQWlOZFF2NEd3MytnYnh5SEx0NHJCaTRQ?=
 =?utf-8?B?NlZQNTdnRjZvaE8vVG5NY2N5ZHB1cFg1dmsvR1poakdKcW0rYXFMaVhqLytq?=
 =?utf-8?B?eXVnL1V0SmtiMk1jYUtDckNNZ0pOVElGbkhvZUpNNEh4ZHc2MHlxYzNiUDdU?=
 =?utf-8?B?N0dyenFKenNDV1p2MW13TXo5ZWtBcjJOOC9wa2UvbkEzMjZ6OFVpMDhGQ01L?=
 =?utf-8?B?K25TS2w5cUgvR2dEQlZIa3JMQjZPdE95dnNhTTFnU0VnL3RyZzJnUXdsZEFQ?=
 =?utf-8?B?ay9SV3dVbEllZHRDdERnMUJmTmdadUZicWVzbHdLOFVqUCs2UndIcHFxSVVV?=
 =?utf-8?B?OWoxQmNqM29BZ1FMN0doOVpzOE1KSE0zbnZtYlhKY001d2Z4K2pNOGZUUFpJ?=
 =?utf-8?B?MktLcmRIeWZVSTJRZkJSTk5PVzNxV1RuTlZ6OTY0YlRzZyszbWtWQVRuajZP?=
 =?utf-8?B?NzhBcDJ0Wm5rTEZjMHcwN3dKY1ViSWoxY1VISEo4UW8wT3RST3VvVXgyOE9k?=
 =?utf-8?B?Vk91MU55R3hJRlNBeW94K1N1bUhpdGlrSUZjTkFvYXRUTUplS2ltaG15RXA0?=
 =?utf-8?B?NWNtVWhjcWgxRjJnUW9KN1V6Y09RRUtMcGc4U3VhaTd1ZnVtN3ZJSmVYQ0ZQ?=
 =?utf-8?B?Z1BWa3RkWm8rZm9GZXo0ZnJrTEhwa1pPNW1YMFIyRVNabkF1cVdpYzFjRFFQ?=
 =?utf-8?B?Q0JISzUxdzFBUjVQNXBNdFhDNmN0RjVyZm4yWkNkclYyMzFPTGtudHQzYXBZ?=
 =?utf-8?B?dzJGUkRqRlp4MHJJYU53NEM2WEZzZnIxMldoVlNrUEZYeTlRRWpWUEkrdm5Z?=
 =?utf-8?B?WFp0dXpJRWxMbzJ4emFXTHkzUkxQMzVOaGxaNlBmMW5YL0E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TWl3K3I2YmpEOU41V3dOSHlvTjdNQkRYWURYNzAyWUhwVmdaZWRZYlE0MmZy?=
 =?utf-8?B?UUpWa1ZFUklZbzZaSitNRXZuMDcrT1RBNE9vZ1R6cjkxc2xWWHBYQ0FqckZ6?=
 =?utf-8?B?NFEvSTBNWjdObG1leFYyMWZoaTVIRDM1M1o5T29KcEsyZ2dqZ0N0Mkl1dStT?=
 =?utf-8?B?dXl1ZUhaRTBlbTduWWkxcEVFR2hvTmpMVm1QYXdDSXJoZjFWYW1EQ0VXOGxr?=
 =?utf-8?B?c3ErUWRJVnVQTVdUcEMwVTg4V1hoTHlsSFAxSm4zM1c3bkhhYTlmajh6SUZv?=
 =?utf-8?B?YWN2UUJvZlBNVUgxa3VCQWt1SERVT1g0MC9ZTGhna01HWDJvSFFtcmhyMUpL?=
 =?utf-8?B?TExwS1Z3bW91a2ZMek43SWdSSU5YdU8vZlladjNwSGJTQW14VGJ6VnExSEZl?=
 =?utf-8?B?cEdHc1ZOaUd2S1BXMXFGQm11dlNNekpKUk04aGh3ekRiemU1cm94RnVwT3J2?=
 =?utf-8?B?b3ExUERrZGZ2cDRtQlRUMkZhQ0ZWWWloRjJMa3krbGkwSGFsdGRtNTBQVGt5?=
 =?utf-8?B?MUlkMzFnWGU3bklNNDZJMXdNY2M1bFZ6VTBwOSswYUMyK1RDNVBTVlF3cmNt?=
 =?utf-8?B?OUFaOHk3MEZqRFJ1OS9UTlNHd1lrL3lIV0lrY0xEM3BQMVZDV2Q2UkNLa1NJ?=
 =?utf-8?B?RU45MHhxMzdZeGJyUXAwQ05CbjRWMFBraGJyRlV1MFdNMURVSTYya2RpdjJK?=
 =?utf-8?B?a2x3ZnJJYnJ2aDZVeWZXVndEdUNWUDJBK3p1MG4wUmRDVkpZYVhrSTA3eVNB?=
 =?utf-8?B?cWd5ZnJwTnByelRXODByNzNzdjZxNTNvd2QvbnhEMUh2ZnlQdHIva1BkWUZP?=
 =?utf-8?B?SEZ6S2krbksrbmVsNURLL2RrTTRBTGxhL3E0MXUrMUNCSXJRdEZ0eUlUYVRl?=
 =?utf-8?B?TUY1V2x0dWo4SnpPajR4ZXBNOU1UMUwrRnRLVTVrODczY3duKzc5RHVjNGFm?=
 =?utf-8?B?a3ZJU3lWdFhuaXpvSWNwRjhRL0t0N2k0SGN0d1NMckkwUFlZeFJqSjNQdkZT?=
 =?utf-8?B?MHlqVVJZeVVFNlJOQ05xeUt1UXZka2c4NHhBVWVoZTJUM1V5OU5pTm4xbnZK?=
 =?utf-8?B?NkxuSmN5MDlwek5idTl2VmRYYnl2T2FKRWhhc0NVWUpJYWY4M1ZZZlgrblZB?=
 =?utf-8?B?RWI1MkdCY2lrVVNtRHpKNkxmNXllNlcyTnFKK3N2aVQvbFJhYk9NRk1GNjQ3?=
 =?utf-8?B?Ym52NG1oTERUQ3VPQ1ZLQ09uZjFzVWM2V3pDSzF5Vjlpdno2TVI0R1kwNnNS?=
 =?utf-8?B?WW0rWnJvMlBrbTdxTzhFNWRla3ltSXUzNXo0bC9wdDRGajVxQ25vcWpXdWRi?=
 =?utf-8?B?dEJDdXlTeFluUUgwQW1FNkgrQ3pWMkh0eFNEa3R2ZTREcnlUaFA2dXc0Wm1w?=
 =?utf-8?B?aUJ0b2FsSkdBV0FVdkVIb283NDFDdUdyVnpMYXBsZEpQUEpvcUZkd3JrdXQr?=
 =?utf-8?B?T1NkZkZsUmZPMXA0TmVxTkhnNG8yMGdtTG9VZURrcmoxb0NvRTJxUWRrZ3Ry?=
 =?utf-8?B?bnpRWmlTbXExamgrZzgydTBRYkxsVGxtaVhVMTZCQ0FEQnZlMXJTcWhWRGtW?=
 =?utf-8?B?bnRtZ0h0eVgzRWNBZDdHUW9BOERJQi9Vd3A5RVRqZG1obGNkWXpLTGwzMjdt?=
 =?utf-8?B?eHlTZzkzc3dxdUtpUEhZSGNDeWQrZlozUE9kd1E1cjhsOFpFU2p6cVNzNjAx?=
 =?utf-8?B?MTR6YzR3MUM3V1JYT3pOYUNIMmhyTXR3UHAyZmhFUmx2NE1BSjFhcHo4K2xE?=
 =?utf-8?B?U2duZ2ErSVRWWjFNSWpXOWtEaTlEdEtIdUQ3cUVIelRreWx5TEhncC9BTVIx?=
 =?utf-8?B?a3lDdmdaR09WRHdhb2VDZVByMUVseFB5MkVpMGRhY0MxVFdKZVIzSkVGNTl2?=
 =?utf-8?B?dW5CSlVsWVNOelc0cklYM0NERGY5dlRpT3FvcU9ZbkppUFAzb3BQMUxQRHN1?=
 =?utf-8?B?RE9FYjY3UURvQVBCOHZ1YUR2UWJjZzFpUkNnS2JvS2pHR1U2K1B1amlOd0tx?=
 =?utf-8?B?bk9HMmQrOHpvOWYrcW50dmtTOXNBbkxhdEpIMVJjQjlGSUNXVlZVKzZwZGlJ?=
 =?utf-8?B?KzFBcHl4QlVtWHRXZHp1STh4WCtPdnN6YmlERXZneDQ2RUJhYTFqRkZSZklS?=
 =?utf-8?B?azJ5QjlpQmw1THlXaE12citBZkQ0UFRpNzNMc2E1d3lJWkhsRHBFRC9xeDNZ?=
 =?utf-8?Q?8vAFHrqaixalc2ECTztHtrE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b235b74-fd0e-416c-6ec2-08de066932c0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 12:50:02.8782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NAaPlHx56mWycqNGYRO8K7O8zBIZbZGkUM6IPLUO8obcGeXlIwYDI9nzr2BAE73JZ/YEtYNOvCxqpeNPesiql4wUTpdNKeW8Bf0a8fH2Th0LXmanxe4v6mxrbO6lL6zg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5928
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDA4OSBTYWx0ZWRfXwWpZX2RbhFVi
 I6Zbcx1hA+TbrWUSlQqwzKIrMZ3jR5f7YTjxkTlDaFXB2nXwRinOWKkfnel082MNRGWolTdPuml
 2olWjcgyYO+PfkmAnkHNlaYykVNzBaFESNQjsX4N22naRldJ4NRpJSrywOmWtEs0PpMgkvdFoAu
 ib+tO4WlsNiJiqpN8oxCoQvucIonTW0te2rwZJa+0LiQiJGgqmttVfTzzt1krlfw4h48uCffcsl
 y0Ng+QUHFwUWnRod1B9V4YBd4ntDqdxrSoCKTuzTPrDsqaBBlC8zL/JZT7oLSgW8r6rCYsRZOWj
 rgO8EXKktsagMirXoUxLSlNANE9oRitx1+Tcp/aXXxNBgU0EAYvxeicVFUJ0kZwMzUJaZuPJzmA
 JLF+ZmValg1Rme/QAI3Wi9NyovkrRw==
X-Proofpoint-ORIG-GUID: kP5sDg0AJqjwt7nhhWVgkLTrm7SmrX1g
X-Authority-Analysis: v=2.4 cv=XeCEDY55 c=1 sm=1 tr=0 ts=68e65dfd cx=c_pps
 a=MNM/txilNqeExyaWs+jKwg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=ei4SEBeUAAAA:8
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=XDMEyqH4H6nsMeDKiIIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Hqou25T6mLgA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: RzFSsSjckGs584Pb7ryjRoY_q9R1r7Pz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510080089
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 598A04w0579687
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 12:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224579


On 08-10-2025 01:47, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, Oct 7, 2025 at 4:10=E2=80=AFAM Deepesh Varatharajan
> <deepesh.varatharajan@windriver.com> wrote:
>>
>> On 02-10-2025 00:59, Khem Raj wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> On Mon, Sep 29, 2025 at 1:29=E2=80=AFAM Deepesh Varatharajan
>>> <deepesh.varatharajan@windriver.com> wrote:
>>>> On 26-09-2025 23:00, Khem Raj wrote:
>>>>> CAUTION: This email comes from a non Wind River email account!
>>>>> Do not click links or open attachments unless you recognize the sen=
der
>>>>> and know the content is safe.
>>>>>
>>>>> On 9/26/25 3:24 AM, Varatharajan, Deepesh via lists.openembedded.or=
g
>>>>> wrote:
>>>>>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>>>>>
>>>>>> Updated the Rust build to depend on Clang instead.
>>>>>>
>>>>>> *Summary of discussion with the rust upstream about using latest L=
LVM
>>>>>> instead of Rust maintained LLVM fork.
>>>>>> https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-=
of-llvm-fork-what-rust-uses/23489
>>>>>>
>>>>>>
>>>>>> *Upstream LLVM is generally compatible:
>>>>>> - Rust does support building with upstream (vanilla) LLVM, especia=
lly
>>>>>> the latest
>>>>>> major release and the one or two preceding ones.
>>>>>> https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#u=
pdating-llvm
>>>>>>
>>>>>>
>>>>>> *Impact on Yocto Rust upgrades:
>>>>>> - Rust upgrades shall always check for updates on rust forked llvm
>>>>>> and backport
>>>>>> the relevant patches to clang's llvm.
>>>>>>
>>>>>> *Regarding the rust forked llvm local patches:
>>>>>> - There are no local patches on rust forked llvm other than the
>>>>>> backported fixes
>>>>>> from llvm master.
>>>>>>
>>>>>> *We now add these flags "-Clink-arg=3D-lz -Clink-arg=3D-lzstd" bec=
ause of
>>>>>> this following
>>>>>> diff otherwise we will get errors during link time.
>>>>>>
>>>>>> Setup in rust-llvm
>>>>>> -DLLVM_ENABLE_ZLIB=3DOFF \
>>>>>> -DLLVM_ENABLE_ZSTD=3DOFF \
>>>>>> -DLLVM_ENABLE_FFI=3DOFF \
>>>>>>
>>>>>> Setup in clang
>>>>>> -DLLVM_ENABLE_FFI=3DON \
>>>>>> -DLLVM_ENABLE_ZSTD=3DON \
>>>>>>
>>>>>> *When multilibs enabled:
>>>>>>
>>>>>> llvm-config expects static libraries to be located in the lib
>>>>>> directory rather than
>>>>>> lib64. However, since LLVM is built as a non-multilib component, t=
he
>>>>>> lib directory
>>>>>> doesn't contain any library files. To accommodate this without
>>>>>> breaking multilib
>>>>>> behavior, we copy the required library files appropriately.
>>>>>>
>>>>>> Previously, when we depended on rust-llvm, this worked because we
>>>>>> specified:
>>>>>> -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust
>>>>>>
>>>>>> With this setup, llvm-config was installed inside
>>>>>> ${libdir}/llvm-rust, which included
>>>>>> its own bin and lib directories. Thus, llvm-config located in bin
>>>>>> would correctly find
>>>>>> the libraries in the adjacent lib directory.
>>>>>>
>>>>>> Even when multilib was enabled or not, llvm-config would still loo=
k
>>>>>> for libraries under
>>>>>> lib in this structure, so everything functioned as expected.
>>>>>>
>>>>>> *Changes needs to be done when llvm splits from clang:
>>>>>> In rust recipe:
>>>>>> Update the dependency from:
>>>>>> DEPENDS +=3D "ninja-native clang" to DEPENDS +=3D "ninja-native ll=
vm"
>>>>>>
>>>>>> In llvm recipe:
>>>>>> Apply the same changes that were made in the Clang recipe, as thos=
e
>>>>>> configurations have now been moved to the LLVM recipe after the sp=
lit.
>>>>>>
>>>>>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windrive=
r.com>
>>>>>> ---
>>>>>>     meta/recipes-devtools/clang/clang_git.bb     |  4 ++--
>>>>>>     meta/recipes-devtools/clang/common-clang.inc |  6 +++---
>>>>>>     meta/recipes-devtools/rust/rust_1.90.0.bb    | 18 ++++++++++++=
++----
>>>>>>     3 files changed, 19 insertions(+), 9 deletions(-)
>>>>>>
>>>>>> diff --git a/meta/recipes-devtools/clang/clang_git.bb
>>>>>> b/meta/recipes-devtools/clang/clang_git.bb
>>>>>> index 53bca1c24f..3e117b308b 100644
>>>>>> --- a/meta/recipes-devtools/clang/clang_git.bb
>>>>>> +++ b/meta/recipes-devtools/clang/clang_git.bb
>>>>>> @@ -83,7 +83,6 @@ OECMAKE_SOURCEPATH =3D "${S}/llvm"
>>>>>>     # https://github.com/llvm/llvm-project/blob/main/llvm/CMakeLis=
ts.txt
>>>>>>     LLVM_TARGETS_GPU ?=3D "${@bb.utils.contains_any('DISTRO_FEATUR=
ES',
>>>>>> 'opencl opengl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
>>>>>>     LLVM_TARGETS_TO_BUILD ?=3D
>>>>>> "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;${LLVM_TARGETS_G=
PU}"
>>>>>> -LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(b=
b,
>>>>>> d)};BPF;${LLVM_TARGETS_GPU}"
>>>>> compiler we build is building all architectures once because it the=
n
>>>>> reuses same compiler for all cross compilers just by creating canon=
ical
>>>>> symlinks, this change is not going to work.
>>>> We removed this line because, for the clang class-target build, LLVM=
 was
>>>> only compiling
>>>> libraries for the target architecture and GPU targets and kept insid=
e
>>>> the target
>>>> sysroot. Since we use the llvm-config built for the class-target dur=
ing
>>>> the Rust target build,
>>>> it was failing due to the absence of static libraries for other
>>>> architectures in the target sysroot.
>>>> Here the target is x86 arch. So, it compiled libraries for x86 arch =
only
>>>> and we can see the error
>>>> for missing libraries for other archs as below:
>>>>
>>>> |   --- stderr
>>>> |   llvm-config: error: missing:
>>>> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/=
usr/lib/libLLVMAArch64Info.a
>>>> |   llvm-config: error: missing:
>>>> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/=
usr/lib/libLLVMLoongArchInfo.a
>>>> |   llvm-config: error: missing:
>>>> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/=
usr/lib/libLLVMLoongArchDisassembler.a
>>>> |   llvm-config: error: missing:
>>>> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/=
usr/lib/libLLVMMipsInfo.a
>>>> |   llvm-config: error: missing:
>>>> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/=
usr/lib/libLLVMPowerPCInfo.a
>>>> |   llvm-config: error: missing:
>>>> poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot/=
usr/lib/libLLVMRISCVTargetMCA.a
>>>> .
>>>> .
>>>> .
>>>> |   thread 'main' panicked at compiler/rustc_llvm/build.rs:277:16:
>>>> |   command did not execute successfully:
>>>> "poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot=
/usr/lib/llvm-config"
>>>>
>>>> "--link-static" "--libs" "aarch64" "amdgpu" "arm" "asmparser"
>>>> "bitreader" "bitwriter" "bpf" "coverage" "instrumentation" "ipo" "li=
nker"
>>>> "loongarch" "lto" "mips" "nvptx" "powerpc" "riscv" "x86"
>>>> |   expected success, got: exit status: 1
>>>>
>>>> Maybe instead of removing. Can we change
>>>> -LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(bb,
>>>> d)};BPF;${LLVM_TARGETS_GPU}"
>>>> to
>>>> -LLVM_TARGETS_TO_BUILD:class-target ?=3D
>>>> "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;;BPF;${LLVM_TARGET=
S_GPU}"
>>>> ?
>>> I think we don't want to build all the general arches for target, onl=
y
>>> the target arch and gpu arches
>>> is what is needed.  If we build all the backends, that will slow down
>>> things. But if target rust needs
>>> to support all the architectures to generate code for, then we don't
>>> have much choice. Can you see
>>> if we are ok to just target one architecture ?
>> The issue doesn't originate from Rust directly, it stems from the
>> following logic
>> in the Rust recipe, where the natively built llvm-config is copied int=
o
>> the target sysroot:
>>
>>       # Copy the natively built llvm-config into the target so we can =
run
>> it. Horrible,
>>       # but works!
>>       if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D
>> ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
>>           mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
>>           cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PA=
TH}
>>           if [ -e ${STAGING_LIBDIR_NATIVE}/libc++.so.1 ]; then
>>               patchelf --set-rpath \$ORIGIN/../../../../../`basename
>> ${STAGING_DIR_NATIVE}`${libdir_native} ${RUST_ALTERNATE_EXE_PATH}
>>           else
>>               patchelf --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
>>           fi
>>       fi
>>
>> Since llvm-config is being copied from ${STAGING_BINDIR_NATIVE} to
>> ${STAGING_BINDIR},
>> and the native Clang was built with the following configuration:
>> LLVM_TARGETS_TO_BUILD ?=3D
>> "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;${LLVM_TARGETS_GPU}"
>>
>> The copied llvm-config will expect the corresponding target libraries =
to
>> be present in the ${STAGING_LIBDIR}.
>>
>> To address this issue, as far as I can see we have three options.
>>
>> 1) Build clang-target also for all mentioned archs for clang-native.
>> 2) Copy all the required libraries from ${STAGING_LIBDIR_NATIVE} to
>> ${STAGING_LIBDIR}.
>> 3) Instead of copying llvm-config from ${STAGING_BINDIR_NATIVE} to
>> ${STAGING_BINDIR},
>>        directly make rust-target build dependent
>> on  ${STAGING_BINDIR_NATIVE}/llvm-config.
>>
>> Are there any better or cleaner alternatives to handle this situation?
>> Any suggestions would be greatly appreciated.
> I would prefer option 3 since these libs are inherently cross built,
> it perhaps does not matter if
> they come from native or cross built clang. But that would have been
> default before this copy dance
> was done. I might have forgotten now, if this was done specifically to =
address a
> case which we can testout now.
Making Rust depend directly on the native llvm-config is not feasible=20
because librustc_llvm*.rlib
is built for the host architecture(x86-64) . While this works if the=20
target is x86-64 or x86, for
other architectures we get the following error:
we encounter the following error:
ld: .../librustc_llvm-f50ec2a9934e24d2.rlib: error adding symbols: file=20
format not recognized
collect2: error: ld returned 1 exit status

Therefore, copying the natively built llvm-config into the target=20
sysroot and unsetting the RPATH
is currently the best approach, and that=E2=80=99s what we are doing. How=
ever,=20
even after unsetting the
RPATH, the native llvm-config still references to static libraries for=20
other architectures during
compile time. To fix this, those libraries must be present in the target=20
sysroot.

 From what I see, the only feasible solution is to build LLVM target=20
libraries for all supported
architectures. Copying these libraries from the native sysroot is not=20
feasible because the native
sysroot contains libs for all OE-core targets, while the target sysroot=20
contains libs only for its
specific target=E2=80=94copying would cause conflicts.

Below are the build timings and space consumption after splitting clang=20
and llvm.

LLVM built for only target:
bitbake llvm
real=C2=A0 =C2=A0 25m3.899s
user=C2=A0 =C2=A0 0m6.904s
sys=C2=A0 =C2=A0 =C2=A00m0.673s

bitbake clang
real=C2=A0 =C2=A0 28m28.827s
user=C2=A0 =C2=A0 0m13.178s
sys=C2=A0 =C2=A0 =C2=A00m1.193s

../poky/build/tmp/work/x86-64-v3-poky-linux/clang/21.1.2 > du -sh .
5.4G
../poky/build/tmp/work/x86-64-v3-poky-linux/llvm/21.1.2 > du -sh .
5.6G

LLVM built for all Oe-core supported targets:
bitbake llvm
real=C2=A0 =C2=A0 25m2.809s
user=C2=A0 =C2=A0 0m7.017s
sys=C2=A0 =C2=A0 =C2=A00m0.679s

bitbake clang
real=C2=A0 =C2=A0 31m7.457s
user=C2=A0 =C2=A0 0m14.471s
sys=C2=A0 =C2=A0 =C2=A00m1.544s

../poky/build/tmp/work/x86-64-v3-poky-linux/clang/21.1.2 > du -sh .
5.6G
../poky/build/tmp/work/x86-64-v3-poky-linux/llvm/21.1.2 > du -sh .
6.0G
>> Regards,
>> Deepesh
>>
>>>>>>     LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?=3D ""
>>>>>>
>>>>>> @@ -107,6 +106,7 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3D=
OFF \
>>>>>>                       -DLLVM_ENABLE_PIC=3DON \
>>>>>>                       -DCLANG_DEFAULT_PIE_ON_LINUX=3DON \
>>>>>>                       -DLLVM_BINDINGS_LIST=3D'' \
>>>>>> +               -DLLVM_INSTALL_UTILS=3DON \
>>>>> tabs vs spaces inconsistenty. Please fix it.
>>>> Sure.
>>>>>>                       -DLLVM_ENABLE_FFI=3DON \
>>>>>>                       -DLLVM_ENABLE_ZSTD=3DON \
>>>>>>                       -DFFI_INCLUDE_DIR=3D$(pkg-config
>>>>>> --variable=3Dincludedir libffi) \
>>>>>> @@ -137,7 +137,7 @@ EXTRA_OECMAKE:append:class-target =3D "\
>>>>>> -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
>>>>>> -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
>>>>>> -DCMAKE_STRIP=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-s=
trip \
>>>>>> -                  -DLLVM_TARGET_ARCH=3D${HOST_ARCH} \
>>>>>> + -DLLVM_TARGET_ARCH=3D${@get_clang_target_arch(bb, d)} \
>>>>> why is this change needed ?
>>>>>
>>>> I made this change to ensure that LLVM_TARGET_ARCH is set correctly =
to
>>>> the actual target architecture.
>>>> However, it appears that even without this change, the build complet=
es
>>>> successfully for the target. I checked
>>>> and printed the value of HOST_ARCH and realized it was already set
>>>> correctly my mistake. This change is
>>>> not required.
>>> LLVM_TARGET_ARCH is different than the backend architecture which is
>>> denoted by LLVM_TARGETS_TO_BUILD
>>>
>>>>>> -DLLVM_DEFAULT_TARGET_TRIPLE=3D${TARGET_SYS}${HF} \
>>>>>>                       -DLLVM_HOST_TRIPLE=3D${TARGET_SYS}${HF} \
>>>>>>                       -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX}=
 \
>>>>>> diff --git a/meta/recipes-devtools/clang/common-clang.inc
>>>>>> b/meta/recipes-devtools/clang/common-clang.inc
>>>>>> index bf3a63914a..c22e3c1b19 100644
>>>>>> --- a/meta/recipes-devtools/clang/common-clang.inc
>>>>>> +++ b/meta/recipes-devtools/clang/common-clang.inc
>>>>>> @@ -30,10 +30,10 @@ def get_clang_arch(bb, d, arch_var):
>>>>>>         elif re.match('aarch64$', a):                      return
>>>>>> 'AArch64'
>>>>>>         elif re.match('aarch64_be$', a):                   return
>>>>>> 'AArch64'
>>>>>>         elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a): return =
'Mips'
>>>>>> -    elif re.match('riscv32$', a):                      return 'RI=
SCV'
>>>>>> -    elif re.match('riscv64$', a):                      return 'RI=
SCV'
>>>>>> +    elif re.match('riscv32$', a):                      return 'ri=
scv32'
>>>>>> +    elif re.match('riscv64$', a):                      return 'ri=
scv64'
>>>>> This is representing LLVM backend name and not normal arch and clan=
g
>>>>> uses RISCV for both rv64 and rv32
>>>>>
>>>> After this change were made,
>>>> -                  -DLLVM_TARGET_ARCH=3D${HOST_ARCH} \
>>>> +                  -DLLVM_TARGET_ARCH=3D${@get_clang_target_arch(bb,=
 d)} \
>>>> do_configure of clang failed
>>>> with the following error:
>>>>
>>>> | CMake Error at cmake/config-ix.cmake:585 (message):
>>>> |   Unknown architecture riscv
>>>>
>>>> Since this change is irrelevant
>>>> -                  -DLLVM_TARGET_ARCH=3D${HOST_ARCH} \
>>>> +                  -DLLVM_TARGET_ARCH=3D${@get_clang_target_arch(bb,=
 d)} \
>>>>
>>>> The below changes are also not needed.
>>>>     -    elif re.match('riscv32$', a):                      return '=
RISCV'
>>>>     -    elif re.match('riscv64$', a):                      return '=
RISCV'
>>>> +    elif re.match('riscv32$', a):                      return 'risc=
v32'
>>>> +    elif re.match('riscv64$', a):                      return 'risc=
v64'
>>>> -    elif re.match('loongarch64$', a):                  return 'Loon=
gArch'
>>>> +    elif re.match('loongarch64$', a):                  return
>>>> 'loongarch64'
>>>>>>         elif re.match('p(pc|owerpc)(|64)', a):             return
>>>>>> 'PowerPC'
>>>>>> -    elif re.match('loongarch64$', a):                  return
>>>>>> 'LoongArch'
>>>>>> +    elif re.match('loongarch64$', a):                  return
>>>>>> 'loongarch64'
>>>>> same problem as above here
>>>>>
>>>>>>         else:
>>>>>>             bb.fatal("Unhandled architecture %s" % arch_val)
>>>>>>             return ""
>>>>>> diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb
>>>>>> b/meta/recipes-devtools/rust/rust_1.90.0.bb
>>>>>> index 5d804c7398..c2cb8f8829 100644
>>>>>> --- a/meta/recipes-devtools/rust/rust_1.90.0.bb
>>>>>> +++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
>>>>>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
>>>>>> "file://COPYRIGHT;md5=3D11a3899825f4376896e438c8c753f8dc"
>>>>>>     inherit rust
>>>>>>     inherit cargo_common
>>>>>>
>>>>>> -DEPENDS +=3D "rust-llvm"
>>>>>> +DEPENDS +=3D "ninja-native clang"
>>>>> I think using 'llvm' instead of 'clang' here is more appropriate to
>>>>> represent the dependency, clang provides llvm as well, it also ensu=
res
>>>>> that when we split llvm out of clang recipe then you do not need to
>>>>> change it.
>>>> Sure will do that.
>>>>>>     # native rust uses cargo/rustc from binary snapshots to bootst=
rap
>>>>>>     # but everything else should use our native builds
>>>>>>     DEPENDS:append:class-target =3D " cargo-native rust-native"
>>>>>> @@ -28,8 +28,8 @@ PV .=3D "${@bb.utils.contains('RUST_CHANNEL',
>>>>>> 'stable', '', '-${RUST_CHANNEL}', d)
>>>>>>
>>>>>>     export FORCE_CRATE_HASH =3D "${BB_TASKHASH}"
>>>>>>
>>>>>> -RUST_ALTERNATE_EXE_PATH ?=3D
>>>>>> "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
>>>>>> -RUST_ALTERNATE_EXE_PATH_NATIVE =3D
>>>>>> "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
>>>>>> +RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_BINDIR}/llvm-config"
>>>>>> +RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_BINDIR_NATIVE}/llvm=
-config"
>>>>>>
>>>>>>     # We don't want to use bitbakes vendoring because the rust sou=
rces
>>>>>> do their
>>>>>>     # own vendoring.
>>>>>> @@ -188,6 +188,16 @@ python do_configure() {
>>>>>>         bb.build.exec_func("setup_cargo_environment", d)
>>>>>>     }
>>>>>>
>>>>>> +#llvm-config expecting static libraries in 'lib' instead of 'lib6=
4'.
>>>>>> +#Since LLVM is built as a non-multilib component, the 'lib' direc=
tory
>>>>>> +#doesn't have any library files when multilibs enabled. So, copyi=
ng
>>>>>> +#library files without impacting multilib behavior.
>>>>>> +do_compile:append:class-target() {
>>>>>> +if [ -d ${STAGING_DIR_TARGET}/usr/lib64 ]; then
>>>>>> +    cp ${STAGING_DIR_TARGET}/usr/lib64/libLLVM*.a
>>>>>> ${STAGING_DIR_TARGET}/usr/lib/.
>>>>>> +fi
>>>>>> +}
>>>>>> +
>>>>>>     rust_runx () {
>>>>>>         echo "COMPILE ${PN}" "$@"
>>>>>>
>>>>>> @@ -199,7 +209,7 @@ rust_runx () {
>>>>>>         unset CXXFLAGS
>>>>>>         unset CPPFLAGS
>>>>>>
>>>>>> -    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP}"
>>>>>> +    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP} -Clink-arg=3D-lz
>>>>>> -Clink-arg=3D-lzstd"
>>>>>>
>>>>>>         # Copy the natively built llvm-config into the target so w=
e can
>>>>>> run it. Horrible,
>>>>>>         # but works!
>>>>>>
>>>>>>
>>>>>>
>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>> Links: You receive all messages sent to this group.
>>>>>> View/Reply Online (#224075):
>>>>>> https://lists.openembedded.org/g/openembedded-core/message/224075
>>>>>> Mute This Topic: https://lists.openembedded.org/mt/115446166/19979=
14
>>>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/un=
sub
>>>>>> [raj.khem@gmail.com]
>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>>

