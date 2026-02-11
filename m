Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D706EEB5950
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 02:36:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10129.1770777356217536925
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 18:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DYGWPNui;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6502e09c5b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B0n9jJ3711776
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 18:35:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Lff6Iq+uSwtHLO/Yes7PC5aHsWAeV7KRbgt9QfxG/Vs=; b=
	DYGWPNuia7Qc96rKqa6BLJ5bdtxpTLFo+tEKFIguUplZ2UKAzOmsk4UC9ZeNz7jb
	QkrpAzSKGWjtQCSm5yt7PviUU3zJvwM/vWtcJbxlU+ibQP2G7wmzwgCkEw+dmB9u
	BLC2IYXkhzTRl5J6RBPN++Vivpd+4EhZMz/nojdvCjEY0VlUnrUD43aLkbGTCJGM
	n+b+sS0Na9dXMxP0pYL2Jp3p9xkhdhQ5T+KTfbza9iPdBEFWp/Yxk5948IJiuvKa
	UK2YTYoFKWTz2qmID3ZB7e5+kBKjv8R2oMjZaJrMI4HwAA4/TXqlVVxFGZ8lBXdc
	/KxOqsdZmu3f6JMEi23AZQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011032.outbound.protection.outlook.com [52.101.52.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c61j4uxx0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Feb 2026 18:35:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+SRrJMAXJDvliSrcvA1djpwfgemMsBbmYXboVYNMS4Bc41qiRj4A0E657KqwD1Sw6zZOf6rSc7rfuO9KN7PxERbFl7uR7qr1K2nM6/Q5Rq1xZYM0lCybem4jAGbluFeMx0Rmeq/tqQ5QeelqdhRBMB6QSuwvKHEQ8yRXoGYr5fNJ3F/4qNrWuyHh9vJA0dYaf2lbOyqNw1EzLOv1kG+2enUmU+Y8yF71PkfORF+OLIaub5tD910cNDTw+9UNQZETvlalJyuUko0WfMKtroI4bUop1qZCe0Pi1z4I9Ge52j5lbIi9XmluAkOEh6aQ8tbquZWL1hSqr0yXwUUOc15hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lff6Iq+uSwtHLO/Yes7PC5aHsWAeV7KRbgt9QfxG/Vs=;
 b=ju6aI6tbpgZeyTPfvFP2OmVCVkCGShml4LOHw/lh2q9+lCUMu/nTYe4+rCa+/eex7Swtxfx3aaYUOqHxIIcHmbf0YCM/OPkFgvw+0yRhazZqoUTCD3r7i5aKBz12X5FSQJ+nBOQXBH8r05uRNhSMT7wfA4L6XOz6pu/tmjrN8Ri4GKOYwwZoL9sc25YcFGiSxMDrfMslYTgaZoLXfe/lydmqc9DWtfaBb/4EZi9IYr14j8TK3zcuDImtzEytMhpa85+Q61i2vaftex0EFso+ie73417MVmfV6yPe490MZPtydTWHE6v2jIgriKIH6OA6sbD/Pu6vII0Cv5CgK0UFpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by MW4PR11MB6571.namprd11.prod.outlook.com (2603:10b6:303:1e2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 02:35:52 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 02:35:52 +0000
Message-ID: <280737ef-da39-4008-b44d-6255fc5ec9d9@windriver.com>
Date: Wed, 11 Feb 2026 10:35:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for [PATCH 3/3] gnupg: 2.5.14 ->
 2.5.17
To: "Marko, Peter" <Peter.Marko@siemens.com>,
        "patchtest@automation.yoctoproject.org"
 <patchtest@automation.yoctoproject.org>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260210095025.633860-3-hongxu.jia@windriver.com>
 <0101019c46ff2150-c2b795c2-726b-4274-8690-58a40f98be10-000000@us-west-2.amazonses.com>
 <AS1PR10MB5697AD37C0ECCBC9E8B71456FD62A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <AS1PR10MB5697AD37C0ECCBC9E8B71456FD62A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:4:186::20) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|MW4PR11MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: 25043450-455f-4581-3dff-08de69164642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TjRSVnZsWjQyUGpRN0c3STB0R1VIUnBMM1o5Z1Fqby9MRVBOUWVIT1NsbWNK?=
 =?utf-8?B?WTM2NzBJeVRhajFvQlU1N0NmRTlKbWQyd0JRb1grM1EzZXoxYXIxcUJLSS9z?=
 =?utf-8?B?d1BBVU82dUpDTkNlbVhDQ3B6VUVlUFZwQU5LbTdkUVNCUmRTQkMvam1aNkhx?=
 =?utf-8?B?RVV2dDVoZFVlbmtVUUdoOU5wOVhpdU1HUGQvNlFlaVdnZVNhUkM0SWI5RDF5?=
 =?utf-8?B?bUt5eE5ZMW5rVXVJOXZNMGxQTjlvVHpsaEkxaFBON2trOVF4WmE1eTZtZmxW?=
 =?utf-8?B?N3l4YmIzQ1BoT1EwZUExVFhabVQwS3JHT2duTDc0Z0lraVlPbG5waTlRVE5k?=
 =?utf-8?B?cm90WWtHNVF6b3BGSTViVFErSzFDMUdJM0d4OWVzZkM2cmUyM3h5bjFocExQ?=
 =?utf-8?B?Si9TeGVLbG52Rmt5WXErMmQ5dlpLRDBEaWdDZ09La01UNE4zTUZuOEdjNVBK?=
 =?utf-8?B?Mm52K1JkZUZKbnhzVE5PVlFzN0pnOUowTjUzS0dNTHpXN3hZZ1FqUnI4dzl5?=
 =?utf-8?B?emlVQjVzbTN1S3NzazEwL3NBOXhDNm1GbU9RTHg0RUJ3RWhrb0RLRU5FK1N2?=
 =?utf-8?B?b2J6djVsY3QzWXloUW1Ja1dRYkZCSk9WUGRlNjExYkhYZGI5eHJmUWVTSEts?=
 =?utf-8?B?YkZLK0dsQklZaGI4US94cmhybEtzWkpLdGkyTWtiQTlTOU9VM1VhblNoaHE1?=
 =?utf-8?B?MDFpalFCMnZobkl0ZVhzN3FESGJtdHpEY0d6Qk9aSW94NG9oOVFnWTVuSXhT?=
 =?utf-8?B?eEV2VjNvSmZ0b2xTYnYrVGJTeFVtRWl3bmlSZWJqZjZ2Rk5aeVV4Qm9RWVpU?=
 =?utf-8?B?Q2U5TFd5b3RZZ0UzTFg1NjVqSVpzT20wVWR3TTZiaTlnc2RwU1NyVjlmbEdx?=
 =?utf-8?B?bm8rWWVldFpvc0RFd1BjWmxjMHNZYk41a3YrS1M3OFFRQmN3TWpKaGc3VTN3?=
 =?utf-8?B?eGhtZjE3cFByQ2JROUJKSFdXRWFkcG9OTjBiK0NxS1U5ZHNIQTlMd0wremx4?=
 =?utf-8?B?NW4ySGVSUUc5THdFZ0RCWlR0WVQxcDF6NUlnYnVOVi9XSC9CS0VEUzJhWmFl?=
 =?utf-8?B?eVVxWldnNVg3ZEdOMnI0M0Flc2RLd3o5ZHVJWENiNkVFRGlNMy8xU1FxRm9n?=
 =?utf-8?B?V0NsSGdhUkxLTHEwTnFwVllZMjBWd2VJcnFWYklSTnMyK1hKZjdWOU1XY0pW?=
 =?utf-8?B?TVNyTU5ZOFFLR1k3TktOL2pjNTRTVjBtQy9oR1psa0lWWmk3UkxyV1ZXK2VG?=
 =?utf-8?B?LzZ5aUNnejUrcFRTc0NzanNMTWRQSGljdE5KQTF6eWtpMk9sZVJ5UFhhNER1?=
 =?utf-8?B?T0phRW8rb3NqN2FXNUhMb2RmdjBmaXR0M2NlVW9DdjYyQ253MUtUTXFEeVRm?=
 =?utf-8?B?SU1QUmJBWnI4NzZHSUxHOUpiNXdxRDF0SHEvUlppSE82NlROL0lJNjlVTmg3?=
 =?utf-8?B?SC9YSzdnZW5ibjZSUFJTdTY1ZjhwT2tGazNnZ1FqWndFZThRQmJLTmhpNGlG?=
 =?utf-8?B?THByN0c4aVV5K3JSUXpodkIvWnNGSk9kWGM5T3BWT3dVWjYrcnMyM3M4OWJa?=
 =?utf-8?B?MTNzK3F1ckF4MVFQWXpDUUpEbXJsT3A5ZSs4ZGdOZGV3MmVCdEluRmlHeUhp?=
 =?utf-8?B?a3J2UDJSV1hrV1NyRTNmanZCdENhZDk5Wkd2REM1WUdwSERYemZzZnJuRk5G?=
 =?utf-8?B?NDJsa2JLTmxBQU1uRnc5LzJFUjcxejVEdmdVTWZQb2xIY2lqWFpTNnNoUWln?=
 =?utf-8?B?dVNPcndRRkRWNzlKOVd4c08vcXJOdFQyaVg5WFo0L0tvWFd1UWhPcWlod2k4?=
 =?utf-8?B?WS82MlNPc1htMUUxand4aFRZNndiTzBpaG5qYXVXWm94WVpqcGVGTzlDNjYr?=
 =?utf-8?B?RWh6YXNEYmdZTHFqNlFycUxDb3VpTTkxQ3BmeXBWQW01alVjNk9ZcjRmZi9F?=
 =?utf-8?B?NWpxSkgrdFRMNCsreUIwNUlrdzVIbTBVd3JMaFFBQ255VFc3VXFlWjdzM2Yv?=
 =?utf-8?B?MTkzR3pwVC9WUVpETW44Z0ZxZGVrbTUzTGsvSlZrdFh0akRicjAwb1Uxc25R?=
 =?utf-8?Q?N5YpPa?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SVk0ZEVMT3Q0R1BZWlk2eHNnV2J4UU9pQXMvVXljWjBLUlNyVk4ySGlpVk9U?=
 =?utf-8?B?WkUycmRabnRhWXIvaEtwajFydnEwUmhxcHlORzJmRzlRRDRCTTMrcDNEVU50?=
 =?utf-8?B?Zm5Vb2s0LzFIUEZpM2JLVVpQV1Y2dlBhdXhteUlTTDBqMldhcUFESHRQZkcw?=
 =?utf-8?B?Um9vRmtRNjA0N2I2d0hDVmh0UlBHREc4azBWRVRSTGVEdUMyd3lFNFdaYWNJ?=
 =?utf-8?B?RTJyWXREMm5LM3laY3dGdllsWmRKUTFZbG9ZMlR5ckdFRWQrOGdFYmJCZUNQ?=
 =?utf-8?B?a0ptY2xXajh4YzIzQ3VxVjdhdmJLK3A5WmNVSDJHMDVNZnVOeWRneXBld2VX?=
 =?utf-8?B?ZWsrOVFXcE5sa2lROVB6VGZYRXdJQ0pXYlVvQXNZUmI3TzRHUDFQSyt1U0di?=
 =?utf-8?B?V2JlRVVyQ2ZING1qanJpNWQ1QU1QeE9GajAxYlVpY1dKOUpobWVtSStsNjdj?=
 =?utf-8?B?eVg4SmpGSUlaVnRHclZHRGdsTjlXTEhGNXF5aUxaRVRuUDEyZ3o4b203Mzdy?=
 =?utf-8?B?VzBFYVFkM3VaUlJScEVwS2lzOGN4ZXRoRmk5TWg3VGJOWHpFZmpmS1U4cnl5?=
 =?utf-8?B?M3BVT3pwTi9jdkFod3BBTGQ5RDY0dlB6TGtXYTVPYlJSekx4Nk1FalFOUUl6?=
 =?utf-8?B?TmxaajQ5SlR1UnBRMjVianI1RysvcTBVL2tzNm5HK3NZdW16clNZN29TUndJ?=
 =?utf-8?B?dDVnTTZtUklMemVFRzhoVGJoMjVOaFVsb2w3MTFNOCtxNlkrc3RUZzA0L1pP?=
 =?utf-8?B?R2drY0I5NnNRcDd1OWRlbmdQelRJUDJaZEJaQWZXTHlnZjRlMWFvOEduR0M3?=
 =?utf-8?B?QW5pcmxGbmVjUmx5SFA2L0prY29MMjRndHo4NmtPdmlZcENoeWUvZU82R3hw?=
 =?utf-8?B?Z2hhY241eXR3N0tXVjZvcVQvRU9qYlNWU3dkSVpWRW9sSzQzcFBqemc5cWRh?=
 =?utf-8?B?WFBaZTJ6U3QxcnFPcVJhU3Q3MzUvRllpbEYyN3hqaDk2dThuekh4SS9ndE9Q?=
 =?utf-8?B?QzIrdE1vN0ppdDl0c0MyUzhuZGkrSUpyTC9WRE1KOStZRldCdlVUODYwTmtr?=
 =?utf-8?B?ZmpTWVpxYTcxbDdnTEQxc0psSjVpZk5MbEU2WDVNMzNQVGovK1pRS1RKaFA4?=
 =?utf-8?B?U3JzQ0ltVHZtdlVyNWVTR0JTWjRheXVJMVBwV0lvM2xkZElEeVkvMUxkR0F2?=
 =?utf-8?B?akJsMUlkR2lQY2piSlhYOVQzSTBCRmpTWXpqUkM2TWphZXRhS0FoNlhwck90?=
 =?utf-8?B?QXBNV3NScGc2RUw1eURNS25EQ2krQTg4UVd0Y0R0R1p6Y0pQcXM0c2YraUxH?=
 =?utf-8?B?LzZwVG53M0dGQi9SQU9xRGJWeU1rWE1maHp4VVlwZHFRVmVta2o5N0dHUTht?=
 =?utf-8?B?blNUNkUwaWhUTFJ1eDYzUWZtS2dLYksyZEZBWXJ6dDJzemhhcDRZbmdiUWtj?=
 =?utf-8?B?Y3l1WmdUNExlYVcvUWtrQVVqY3BtQUpiM2NnSk1TMkxUdnN2V1NMaSt4T2dV?=
 =?utf-8?B?RjdCOGl0aFZDYU5mT3BYWk50VkkyY052dkllL2prMkg2N2lWSjY1RWlsT2Zh?=
 =?utf-8?B?T1NwV0s3Q2YyM1NYYS9iTmMwWXh2YTU2UHZDUVhkRmQyMzB1a3NxVUwySVlX?=
 =?utf-8?B?RUVNZVFCVjNDWDRWaDVVVW5ZTUFpekFjNmh6RG9wY3g1TXpxalh1ZUE3L3JP?=
 =?utf-8?B?b3ZzbVI0Nnl4TXZMQy9rM2t0RTZFaXQ5VU5oTFJiZ1lEVEk4YXAxaTdIdXJ3?=
 =?utf-8?B?V2FxTVN0NlI3UXFXWUNYb0JidThZd3hsb1p4cFpmdjVncjVYRFVoZVgvc2F4?=
 =?utf-8?B?TTVvOEQvaTdONmxZZStmdjFRdndEb253YVVURkU2aFYrM09lZldJSXpxcWZx?=
 =?utf-8?B?Z3htMEs0dWpkK3ZjZU56MWxydHZXc0g4c2ovZ1FYZ0RtWndOc2kvaWNtZkRt?=
 =?utf-8?B?VlUySW9jWk8wZHdJWDY3d0ZNN2lGWkE0b3FiL1Urb293VXN5bjJUcDN6SkVO?=
 =?utf-8?B?cldaRE1kV3hxUjJkWlQ3ODV4MHZrZ052OG4rek5KRDNXZHYxZ3JDamhSU2tU?=
 =?utf-8?B?YmY2Mlo3ZFkrUE5SemFFWFltU3M3Z1NaV0ptRHUvMC81Tis1bVhidUxJVzJk?=
 =?utf-8?B?andyeGF1YzBsbDIzeXp5OXQ4aGpubU1YZlR4UHQzQ3N1NTIyaDN4LzUxblZB?=
 =?utf-8?B?cGs3Q2d5MFVJQjNzdVhIYWFzUldmNDdKdjNWYzFzak5kak9RTEx2TVBFQUVn?=
 =?utf-8?B?cjFjZnVlKzJDQmI1UUltbnpNZ2lNVWk1enhKZFZLTWdISWh0YUh2OWNsenhx?=
 =?utf-8?B?L2E2MlVyRS9nRmx2blJwcHdWaWlqdEsrZGRjL2ZCbG8zd2tMZUhYZz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25043450-455f-4581-3dff-08de69164642
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 02:35:52.5121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xAoEyJ73F1LiKQIqKThIo1Rt540wgkoxTSgBHU5UYKAhd58/r24jqdPs2PybGGVJrVJ6IE7A3Cj9nFvPedZyEwCcq0+S9K06T1uMEm/2Bfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6571
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Wb0BqkhX c=1 sm=1 tr=0 ts=698beb0b cx=c_pps
 a=vMZ8N8iCC09X6dpNzQs02g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=G3XJomv6gOWX1wsforYA:9
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 7iDbsSzTTlfi5IPT8Yi6ld22aXG5VzJn
X-Proofpoint-GUID: vgbPprqql2LQAps1LNPM4QS6K67ss_E7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAyMCBTYWx0ZWRfXwE/Ma7Ih/U7X
 VgO6G5ynPNKUzC4i0VyHwWzbjdbS2MDaCI3y553kb+akLvMx8vbCG0TYMK1qgkUNMH4VpDgb17m
 siZIfRcl7mg8UcaR9Dakou9wFnZQKnytmblZp1bGkVabOfeSi8OArgaW9psynkk5TPToOPruUjo
 wtnXzgxn6QTvnwjj7sUUw/Xx/7UH7ROKBNt973odCDADVu+ZHr8VFS8RixuF82j9c3uwIvmOY61
 8R/ks8LEjWmU/neGSA5F6+wRoA8gL8j7WIdt6qcsOgEQXToq/JlKpEEqcwybpIObsgwLu6geKWr
 bjLozKyEOTAZQmowqcW98IqlNvLpWI5jsKsI4frDshDEyC+AHjjqOIyuuB3bPc5Q4fb4jxJGrnb
 7B25TCJ+QttVNHsZcUEpi1iz79OvBX+JDbKaxsiayeLqZmEMHsaSzuV+1Sv/3qwTkJVXIO874a0
 IG32+Gb23Aai8fqwhhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 02:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230945

On 2/10/26 18:36, Marko, Peter wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Patchtest via
>> lists.openembedded.org
>> Sent: Tuesday, February 10, 2026 11:01
>> To: Hongxu Jia <hongxu.jia@windriver.com>
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] Patchtest results for [PATCH 3/3] gnupg: 2.5.14 -> 2.5.17
>>
>> Thank you for your submission. Patchtest identified one
>> or more issues with the patch. Please see the log below for
>> more information:
> Ideally mention security fixes: CVE-2026-24882 and CVE-2026-24883.

I am afraid we could not find CVE info in GNUPG release note or git commits

but I will paste release note link and compare git commits between 
2.5.14 vs 2.5.17

//Hongxu

> Peter
>
>> ---
>> Testing patch /home/patchtest/share/mboxes/3-3-gnupg-2.5.14---2.5.17.patch
>>
>> FAIL: test commit message presence: Please include a commit message on your
>> patch explaining the change
>> (test_mbox.TestMbox.test_commit_message_presence)
>>
>> PASS: test Signed-off-by presence
>> (test_mbox.TestMbox.test_signed_off_by_presence)
>> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
>> PASS: test commit message user tags
>> (test_mbox.TestMbox.test_commit_message_user_tags)
>> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
>> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
>> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
>> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
>> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)
>>
>> SKIP: pretest pylint: No python related patches, skipping test
>> (test_python_pylint.PyLint.pretest_pylint)
>> SKIP: test CVE tag format: No new CVE patches introduced
>> (test_patch.TestPatch.test_cve_tag_format)
>> SKIP: test Signed-off-by presence: No new CVE patches introduced
>> (test_patch.TestPatch.test_signed_off_by_presence)
>> SKIP: test Upstream-Status presence: No new CVE patches introduced
>> (test_patch.TestPatch.test_upstream_status_presence_format)
>> SKIP: test bugzilla entry format: No bug ID found
>> (test_mbox.TestMbox.test_bugzilla_entry_format)
>> SKIP: test pylint: No python related patches, skipping test
>> (test_python_pylint.PyLint.test_pylint)
>> SKIP: test series merge on head: Merge test is disabled for now
>> (test_mbox.TestMbox.test_series_merge_on_head)
>>
>> ---
>>
>> Please address the issues identified and
>> submit a new revision of the patch, or alternatively, reply to this
>> email with an explanation of why the patch should be accepted. If you
>> believe these results are due to an error in patchtest, please submit a
>> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
>> under 'Yocto Project Subprojects'). For more information on specific
>> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
>> you!



