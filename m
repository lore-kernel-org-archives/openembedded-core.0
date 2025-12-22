Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FD6E67815
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 18:57:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86478.1766429873794547114
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 10:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VlPJRPlU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4451c17654=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM5dssn1111506
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 10:57:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=yHRcvzMquk2Ni3L6ZCpE3x
	fBzvbM+ugnLOwypttQkcE=; b=VlPJRPlUq5xGUfOgp9ZiXvlSmsS9qNPu+OUbsN
	AFzttBfnwMvXBwmPwJA8cAYCXsPuesvHaPprbWTFJwNWlbO8RF+T0MDJlwezqbGf
	t18dpMgQRVgDlxjLHgHCIYKwI5ZMjThgrnafoxQ3BTl6Qoj40QbPzGwSpIcX6WoA
	FdHzTNg09IUCIF/aPW+OmLgY9BrxVmS02XQC2MDZj31I4CBM/R+ZZUr9lfHhhVM1
	K+TNmRQlDUZarUBJzCVNVp8X7Sy0lHPRKXJTY70wdweNuoRiItSU4D8pltHE4/YU
	3O5MXPPc0mWrZPn0OmXEYVOpiEFb3yKzoVo9VVZy1EmMemZg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011004.outbound.protection.outlook.com [40.93.194.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5qy4swyb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 10:57:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1eJzWy1ndZOCX53jkRemSlKO55u8wvvz0tWvUNPXSFsX0CMy7Lw9gwGp2Cw3VUfr7xCRtyCYvuaQ+ZfsjHVU7Wi9dAJSue/NfIRNbZeC6mdhAQr34rtxsQPgbWjANs7/R7+aDjHtzSPkV/Q9mEV7LMuCOPD6SaSjlQPbUHpM7A0G9v7fSJ7RtLqZhSC13WMHByFvu7530NDdpEfrJ6MbRX4i9RRuvt0fYaPHEjb7BhgUII3TqSRqy51H0PaUboDGbdpKIp7/FwFSAOBn9nWj2Zn6reumLHqplVVQBMFV5WS0BdkngBjcz0Ex2HMaVa7RLaZCG4KE2ZMXM7+mkpUAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHRcvzMquk2Ni3L6ZCpE3xfBzvbM+ugnLOwypttQkcE=;
 b=VXoEuak8zRU3eoZC9h6nrJAcyNQ0chu7rRCqR4RvBGIX/9vwaqo5CCv7Bgxl5YcSKx/aU0zV/VBkpTjzVoahvtbYWq93XozuYmYXFL1I9coHti63THsmM4H2JIfeGFP2ZCueG9ay37S2nJI2E/6jorzYKICWpPmEgQH68LGMDb8CB0FP73ivoBgJQJPIKa9mU6DdKU1oYXLAzrJ+2xEtVQA3OKWZ/s7BoznJ9XTt2FIZsaQ4D8XDQemLOjWbmdoemq2LqAEKzodI/r7ZD5+mjYeQ39SQGe0gZE64oxCalktxJ8oXpUlg6U1SZi19LWTnBNx3zWBm3/olChGDTVD+CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS0PR11MB8184.namprd11.prod.outlook.com (2603:10b6:8:160::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 18:57:50 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 18:57:49 +0000
Content-Type: multipart/alternative;
 boundary="------------qtPAKZLW1rgTUj1f3jvR77ks"
Message-ID: <9fde92b6-427a-46ba-96f2-a3dad500d919@windriver.com>
Date: Mon, 22 Dec 2025 13:57:47 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] libtheora: set CVE_PRODUCT
To: k.kurematsu@nskint.co.jp,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Masahiro Mizutani <m.mizutani@nskint.co.jp>,
        Yoshitaka Ikeda <ikeda@nskint.co.jp>
References: <TYRP286MB5995F2B556CCD6EDFD533D3CDBA9A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <TYRP286MB5995F2B556CCD6EDFD533D3CDBA9A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM>
X-ClientProxiedBy: BY3PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:254::25) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS0PR11MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 29bfcaca-ea10-47c2-ccc1-08de418c008c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|8096899003|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a201Z2p4NjBaMDRNbkZYSFhCZFZnQTEybVdlSlpFZzgydE1heTUxTnAwOFFT?=
 =?utf-8?B?NkI4VS9mcXhTenprM3N0WWlxNytHOThKbExhMkNBQ1VIRnhnV3owNUJyTU9u?=
 =?utf-8?B?bmFPbGFXejRBSWdqWUFwTzgyRzROMUE1S1lUVTNYWVR6d1VpOTliSGgzLzc5?=
 =?utf-8?B?OEVnQm9KeCtacmR0eXR2NTRySktxZThZb3Z1MnhPZmNYYUxvK2NnaW9rd3Z3?=
 =?utf-8?B?TWJ0ZEIweDhaUG5XN3hiTUl1N3JrbS82TUFTeUt1bmxjNFBIME42NnhCbHIr?=
 =?utf-8?B?bFJlZ3BoL0crajdWNHZVNWt4UTdacTdwWWk3K1hPQnQ5c2VJSWk2a2pFLzlF?=
 =?utf-8?B?cXVEMk01R28rNWxUay9XRkVod3d4RmFsakp6ejJwdXZQenliUG9hK05PbnAz?=
 =?utf-8?B?Ty9FVGFQWWlPK29WZ3Y2d09QOTdETU1UaU1hcFA5TWZoSExlMkxxaHozNGRw?=
 =?utf-8?B?UXd2ZFZDVlNreUEyR3pLZGFGbWFHN0Z3bEx2YVRFSGZ5MHhsMGhhWGpDU28y?=
 =?utf-8?B?QTVKbGd0b0tseFg4UGFHVHFSWkdrTHR3RUpIdUZWbjhGa3FiZHIrRGVJUzR6?=
 =?utf-8?B?S09VeGdvcUtsR0YxK29qeWJtUWdHN29XSEZtSllUR1hHdnd4MHhmS2twcDEw?=
 =?utf-8?B?QjlYR2R0RDdqSkJnTFcveTFvNFdGOERUSHhXbXhZREd2ZHh3WkhmUTdqdEwx?=
 =?utf-8?B?V1J5dnovdVhLL1VhcEZoSU5ESllCTGVRQ1FBUzdzUUUwb3lKWS9MQ3p2SEl5?=
 =?utf-8?B?OTdvNmJoamNVWGVIK0dMdmVZNndqNHJXUXFmNGZneTdVTWVkb3gwaTVBRU9m?=
 =?utf-8?B?MFlDNmhPSmU0dU9PZkFxc2t0cFJOZDR4QVFRcUhkRm9qTkQrQUd3citzdzJK?=
 =?utf-8?B?WVZHTG1TWm5CamZRSmRTenBMcHBERG1HTzR5em5VTTRQZDRGL3pwRlRpbVpi?=
 =?utf-8?B?cmFqeWE5TS93dG5sWWQrV2tGV2FLNkxOZUZEYThDN1VLV01GcEd6YXVja3dx?=
 =?utf-8?B?dnhuaDJvWWk5SjFEc0JjQ29QOEQ3dUszalJNdmdOWjFTUTlBV3lUelJoNk5x?=
 =?utf-8?B?NVRJWUcxQlM1Mm5JMnVPQzcwdVFiaWZIOWh0YjFKcWFFUU1LSk1YZW5PUXY5?=
 =?utf-8?B?MmtuTVZ4QUdIMlFJdXp2ZkkycG9OdnFXQU5WN2tZWDNFNlFpbDhJQ2NmRGJH?=
 =?utf-8?B?ZW5CVDNoSWZJSW5CaVNKYlZzVTBCL21vVmE5MW5kM2xwYUdSRGlXWmZGQmw5?=
 =?utf-8?B?bmRwbWFEUm42Q3Vla29uTWErc0xRZkFMUFUybmZvUk5LYitNV3ZBUkVCZ01B?=
 =?utf-8?B?ZVJRY1krZkNqSTZ6NmhoTS8vOGN3YnVod0ZHUzE0aEYxMmRySE1tQnNLY2tT?=
 =?utf-8?B?UEJ0YzlvcFErUGpuemt3dHFkRFpiMnEwaXR3UHdOZFBQUkZnUGtmWmxERUp4?=
 =?utf-8?B?VnZVK1dGOUxPRzdXclUxSG5BdFhkZzZYajc1N2hSV1RhVEkyalNPK202MUwy?=
 =?utf-8?B?QU5JQmxDVzVKL2VpcHFjMXcyTlVjaUhBaWdMYTduRm9zWjRLRy8xRnVLZzVr?=
 =?utf-8?B?V3l5YndDdUx1UEVGcm9RWHJOTTFLb2kzaVovRkdFVEE3cllGTGl0Y0VwRTVG?=
 =?utf-8?B?clVYNlNuQmdQbnhSU1lUSm5OWi9ZSFQ5Wkl1NEpKTTUrbUNOSkVZLzIzWTRW?=
 =?utf-8?B?OTFURWhCcFdjV0ZkOGhZOUtFajUxNW1QQkM3cnMxeE1rSkg0QmtkaWg3SXBz?=
 =?utf-8?B?MmRISFlQZnZuRm9tT2E3VW1rYU51U00wbGpiT3NkTUd0a2t4YlJCRzB5S0pt?=
 =?utf-8?B?UlR6UFphMFltSWE0Q0ZubyttNzM2UjFPdWYxd1lSKzVBR0VFazRqUWRuOUVs?=
 =?utf-8?B?SGQrcHJnWEhJLzE0MWkwZytnU0haQ0ZKTFBueEkwWUJpQXFYQkJkZmRDNURN?=
 =?utf-8?B?Vy9hYTJ5YmJuNkRMOGhRcDRrVStRTi9sSzFZMlQrU3dRam5SdWdZQVhqazFh?=
 =?utf-8?B?RFVxTnVHeVFRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N3FyMGZnRTI0ckhOYW5wUmZDamlYMldkN21hTk1zZStFMmZsZnF0clJicHcz?=
 =?utf-8?B?bTFLYXhJZHVZalhCZXN1MUpOMW01cHVkSVYzQTJIT0JubnYreTRtZHVBNVpT?=
 =?utf-8?B?c0ZTUkdoVmpmalJkVlEwTTVoNXJmQzIzZXRqQytUQ0RPTlRFKzY1eERmZksw?=
 =?utf-8?B?cUJOWHlKcWFPVXdxTUtzMXZ6SW9ZT1VwM0I0LzdTbmp2eVdUR3J1NlBnTXFt?=
 =?utf-8?B?cHppRWJhd1FKVXpRRm1jc0FralhuUmQ3NFVzWEtWUllZdTNBTlg5OGMwVTha?=
 =?utf-8?B?WDJHVW00UWxmemorWHB6ZXM4bXc4bzkyeEZ6eXpGMkYrYVYwWUtqdzl2d2s2?=
 =?utf-8?B?d2oxODI2aXI1ZmFRa1B4QmU0TmxvKzBPYjhaRFRpNFlxMjcyTTFYVzBpWjF3?=
 =?utf-8?B?c0tGZzZNZ2tSaVdWcEl5b285K3B6RjdTRmZGb2xZMHlZa0pRZ2p5KzlYRDNs?=
 =?utf-8?B?R1dmbjFJSkIzMFh2UDd4eUh1UU9uTk5HY3JwL3VrTlhLS3F0R0V1MTVxbzlN?=
 =?utf-8?B?QUVoaHJTYnBYNE5STmlVRW5QUVpaRDdzZ3RETDEyWDVJTm92cERjaENUcXZ0?=
 =?utf-8?B?SVRBdXIxa0s0dWVGejJSaW0vNjYrZmJVV2thOENMaThVRUhmUkxCeFR6K2tY?=
 =?utf-8?B?d0JuV0UvQmlBeG44bFkzYUZ1U1BiT0M4NEFLMXN0OGFEK01EckNrSUNrUnBT?=
 =?utf-8?B?Sy9zTzI2ZmpmRGk0a3EvS0RiaTFBZGhrbjNqSC8wTXhvOXVERXBsYjEvZUdh?=
 =?utf-8?B?ejVNc211VHNBWXBuMXk3dUtWdEFIK1h4clNKYXlaSlV5T2FmRmEzdDhEbU1u?=
 =?utf-8?B?SjJKK3BlNjdtM0tJZmljVlFXSkpxWjFaR1lQdzl4bWhPVlJCaGRmUnNvTWZi?=
 =?utf-8?B?bmZ5aE9LWXhBM2g5WWZTZnFBcExCVW1MMW5DRlVBSCtZd0haREEzRUVMMXpT?=
 =?utf-8?B?NHM3ZndNNlRVN3YzNUlxeElwUVl0UWlhbWp3WUtna2xFd1l5bUhHY1M5VHFa?=
 =?utf-8?B?cUpoNXlxU0pXbm5VdFRwL3hMVnJieTZnNTRvb1ZhektzMmtmQk5sRWFHKzZz?=
 =?utf-8?B?MnhqVFFadnVnTExGODFkNm9GMWJCNXZxWHVsZlVGYnN3RmNvcmcxYTFxZlMv?=
 =?utf-8?B?ZTBtZUlpeFJCQmRycWVaaTNac2dXYXVnSWpxaUlJMlpGbWZrdHEvcm5YMEIw?=
 =?utf-8?B?b0ZpN1grR2YvelJRQzA5ODk3bDI3QkwrVjdKR0loRzNmZHFEUlgvbU42RDlV?=
 =?utf-8?B?VUxmbUxQWHVSWStEK2ZxNDRiODdualJ5dEhJQ0E5MDBTeGE5b3N4WUVId2gy?=
 =?utf-8?B?VFZFR2NUbm5SRkVnUVZWSjZGOGVCaWc5Z2FZZTg0bVdmSTlld3ZiWE5vLzIr?=
 =?utf-8?B?ZTBna1lXUmVSQm5POUhnZHZYMkJnTlZHM2RuampBZW1WRXk2RHQwTkdoWVJi?=
 =?utf-8?B?NW9WTHR4bWhMMTk1alRma05YUmhRT1Q0Q0lGMEJIOFcxd3BYYWs5M2w2aGdU?=
 =?utf-8?B?SXM1c1lPUTNoclJGdmlqNnpQVWFGY2FuZ0RPSTY5TzNXZWpRbHhZMWU0QUhI?=
 =?utf-8?B?ZlBtaXlFdUZMTU1DVkpGM0o4OHVkd3N5enpjU01xRzU2Q0ZQaXJJQTR0Vk85?=
 =?utf-8?B?UVZNekl0S1JTdFJNWXR3bVQrNDBXRFpLOVJtUVYyWHVqbVB5eGMxUlhTQnpB?=
 =?utf-8?B?SStvQ1Z5OWREZjlNNElMRlE2eFZhWkFaallsUXNpT1FMSTVSSzZWYTJjSnFp?=
 =?utf-8?B?NTF0by9WcS9RUzN6b0ptMGxoUTlJNjlFWExEemdpc0ptdGY3L0F6NWxYVTNi?=
 =?utf-8?B?OHdXL1dIK1FtOHd3YmNrQkFYaEdzQUZXQTNEWDdqMkNqc2Vhemp1elgvMUtq?=
 =?utf-8?B?YTZRT1VQay9HS3p6dS9tbnV6MkZyYWtWWHlGRE5ndDVROHd3T0N5YUlLTlV3?=
 =?utf-8?B?S2pDdjJHYkNsYytHcEJlZmhoaVdBMVVBcWwwN2FJQVVycks4T3VzQXRONC9k?=
 =?utf-8?B?U1FvV0VkajdSRVhPcmY3STg4WjQzbUdQWmFFQUJBb1ZLSDFCMjR0MVhYTm1y?=
 =?utf-8?B?QUhwd0NGYzV5ckRCL0k1cU9wSW5xTE1mZWg5SnFpSmJXUUlHaXhVYkRsQWFk?=
 =?utf-8?B?ek1lNE5OY01SMFJpa3J5U1VHYzhmbXdvVmpMNzdiQmFqQ1k2NEtmWlpZK3RT?=
 =?utf-8?B?ejhJWkZQRDdNTzlZbWRqa1cvVnUyZTFra2VOVG9uNWdlaUVuK05mRUVPcXF5?=
 =?utf-8?B?SC9aR3hjQ1ZoQVpoV2Y5SlVFUFMwcjhtZHNCMkVneHN4NXV1ei9hcGozSkZh?=
 =?utf-8?B?eXVTd1pRUy9WaForMmZPbUxzTzVWWlFpbHlWVkIwU2pLWW5zbGlEWlJLWkda?=
 =?utf-8?Q?IVPNDgpjUNr2hYvg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29bfcaca-ea10-47c2-ccc1-08de418c008c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 18:57:49.5959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YiL0Z7JchR50iwMx1wqClIfbM5Za+qXHW5AaVdnZd6D0yu7d4W2dw0pzTrKEQ2mefZhLc+zq+78mZ6bZJ/Ua2iyQi0h6zEQaEpBRiubd1SM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8184
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: p2wLon3_h6xc6BaVChlqvqP-ScYKLWg-
X-Authority-Analysis: v=2.4 cv=Q+vfIo2a c=1 sm=1 tr=0 ts=694994b1 cx=c_pps
 a=FYRcjPsbj8Vbl0y3HSZiwA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=wzDHSL5T1hBOT5EoFs8A:9 a=QEXdDO2ut3YA:10
 a=UqCG9HQmAAAA:8 a=ptT_MQpp9tUlnUVqZHAA:9 a=PwU9hDo3TMwSkau4:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE3NCBTYWx0ZWRfXyfq2fSFM9Lyn
 7drJMl/2NLf9vMaG0WTGiey1225Cxc+2hVxFftgcvYYSbupR3iUHLLIbonWYonAaZe//qCWovPI
 CV1eje8eA4OztAESWLK4yCkJrs6UcRQQafvd+pLCnqvAEAzmxSr34VIQSK+K3XWmLLbT9pViKsa
 h3fsMgSAbtRelJ718gARFH6dM1kkdX4+GBHUPBrur0NDkQdQVZ8NMDysmoqZ1qEb0qA2imoqR+y
 4BWNmIOXfoJB3rXImnEH3Jdl8i0etGaruAzyFNnkTeFh0HsV4abx2LLlq3JL7bvXjYDmuWGF+9x
 o8xKOo83zwR/7JtDQ9HMV95XJM6PJY/ZWnDTAC4HPisgHQkheEJl1uopgUCM4OFJ+M3bCJ/ZO6T
 KQXGAiFGyDJ0X6Ui6miyNiTLfF/tLCElmghy3TORaG+wOxr86u0RcG6Zz3+HhgwRmYfUB9k4Ime
 taWZ4hAby7CPHiyimIQ==
X-Proofpoint-ORIG-GUID: mwRTpQsigoaFqPhY_Wt81JkaO9CnV08H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 18:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228322

--------------qtPAKZLW1rgTUj1f3jvR77ks
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ken,

On 2025-12-18 11:01 p.m., Ken Kurematsu via lists.openembedded.org wrote:
> In the NVD database, the product name of libtheora is theora.
> This was set to ensure that cve-check works correctly.
>
> Signed-off-by: Ken Kurematsu<k.kurematsu@nskint.co.jp>
> ---
>   meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
> index 04de8507fb..bacaf3aee6 100644
> --- a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
> +++ b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
> @@ -14,6 +14,8 @@ SRC_URI[sha256sum] = "ebdf77a8f5c0a8f7a9e42323844fa09502b34eb1d1fece7b5f54da41fe
>
>   UPSTREAM_CHECK_REGEX = "libtheora-(?P<pver>\d+(\.\d)+)\.(tar\.gz|tgz)"
>
> +CVE_PRODUCT = "theora"
> +

 From YP patch review,

Please use:

CVE_PRODUCT += "theora"

to catch both libtheora and theora


Thanks,

../Randy

>   inherit autotools pkgconfig
>
>   EXTRA_OECONF = "--disable-examples --disable-doc"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228198):https://lists.openembedded.org/g/openembedded-core/message/228198
> Mute This Topic:https://lists.openembedded.org/mt/116854732/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------qtPAKZLW1rgTUj1f3jvR77ks
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi Ken,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2025-12-18 11:01 p.m., Ken Kurematsu
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:TYRP286MB5995F2B556CCD6EDFD533D3CDBA9A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM">
      <pre wrap="" class="moz-quote-pre">In the NVD database, the product name of libtheora is theora.
This was set to ensure that cve-check works correctly.

Signed-off-by: Ken Kurematsu <a class="moz-txt-link-rfc2396E" href="mailto:k.kurematsu@nskint.co.jp">&lt;k.kurematsu@nskint.co.jp&gt;</a>
---
 meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
index 04de8507fb..bacaf3aee6 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb
@@ -14,6 +14,8 @@ SRC_URI[sha256sum] = &quot;ebdf77a8f5c0a8f7a9e42323844fa09502b34eb1d1fece7b5f54da41fe

 UPSTREAM_CHECK_REGEX = &quot;libtheora-(?P&lt;pver&gt;\d+(\.\d)+)\.(tar\.gz|tgz)&quot;

+CVE_PRODUCT = &quot;theora&quot;
+</pre>
    </blockquote>
    <pre wrap="" class="moz-quote-pre">
From YP patch review,</pre>
    Please use:<br>
    <pre wrap="" class="moz-quote-pre">CVE_PRODUCT += &quot;theora&quot;

to catch both libtheora and theora


Thanks, 

../Randy

</pre>
    <blockquote type="cite" cite="mid:TYRP286MB5995F2B556CCD6EDFD533D3CDBA9A@TYRP286MB5995.JPNP286.PROD.OUTLOOK.COM">
      <pre wrap="" class="moz-quote-pre">
 inherit autotools pkgconfig

 EXTRA_OECONF = &quot;--disable-examples --disable-doc&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#228198): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/228198">https://lists.openembedded.org/g/openembedded-core/message/228198</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/116854732/3616765">https://lists.openembedded.org/mt/116854732/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------qtPAKZLW1rgTUj1f3jvR77ks--

