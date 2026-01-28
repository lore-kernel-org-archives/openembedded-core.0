Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6D0D46BE3
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 17:35:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.373.1769621715738282253
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 09:35:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Wg3D1G7m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6488026b51=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SB1Sll3431226
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 09:35:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=s1uUlvUtS5U9qoAuJEfbs1
	sFajlNhT2WvlDXRaaDotQ=; b=Wg3D1G7mE3MgH5+lqjC+nV9DWB2uR3Mql/S89I
	7jTgdfg3cQyr/ceXFvK+iqHBx9Zo382kIz/ck4oxLIzs8i9/aVqi8GLPd+cbEq9g
	ujgGQ/eHXB16Ma2DihX99ldxYmSf9DkGYtnxzZMxdW+VSaJXhcG4IiLzWhlIbRfV
	Lqx4SQPj0gMrgwbZJiFTJFwfSD2GTEfiDJqw5JAmeTZ+Pex5BRY4RhHkf5P0FRkl
	ZwvVaOXmKoD8py2tso5wLk9FDbmu5WeFQdjun18a5korPmGbErnDi0aTQsgUL/EF
	tNVCA9KZX+lP8She/LPpr1zAI1SWGBj7aCPKcX5ixlnSnt1w==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010012.outbound.protection.outlook.com [52.101.85.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvt85dac7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Jan 2026 09:35:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+g2/W5qJOtl9RoI2yKJo6WyXuP36W/dlurGispopH96X7/SWPb1Uj4aCNuNGa/4X6jZcYUjq+uxYs0qW4+FurSEMZMGkLUc26j7XSYfPUmMQ/tFvwIyEvf9Woef4itFOdyhiK89ciUBW2E8Q2c/YNjD2c7/PtcZRciYokxHo+FVbl9WVJT02HUPONPgJA1BY219f+5isd2LB9ruFXfF41C2OkTPiVhaaFE5X11QDZsntbKLoYDfGO++h0LwwUga2BQ3+eWepIpNvggHrP4xHFoxM8mTb8Asp+j8hPpQqGAD00Rhv6JXeAWuJOL7Q9kXQ6GXI/E6uH9wQDWplCFsDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1uUlvUtS5U9qoAuJEfbs1sFajlNhT2WvlDXRaaDotQ=;
 b=ly+qz2gHwDxTY116vMAUyw1HxOd1wvs0nS/O0VEC/Jv9wXWHcYBlggm94LhWTWbRWe3XiF8v8KLABCtFKv3tgqV7ohFrHCvYhcxAbtNvQOAUSmF1izpaJk6nf3eZMIBFiER2u16vfgt15Ik6fxvNbRweh3T5lHe3XttkbQjovNPMEnYBw14c6mzVgxJZNwjEUlUPyB3TFJuSqBBRJ7J051INg6YKBmg3UP7I/6x0mRYFxXh2FhHLcKC6tnKdKPif7gE+FlMn3gprczSSsNFq0ElCb8d0Ao6C2W227pKXqy20TXwBTo6h0Z+gOXc5aZ8EHm6YEbQFosC9DUFzZ3zRBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH7PR11MB6553.namprd11.prod.outlook.com (2603:10b6:510:1a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 17:35:07 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 17:35:07 +0000
Content-Type: multipart/alternative;
 boundary="------------3YFx19TKYNqSvaeY2czFkPKf"
Message-ID: <9fcc4fbe-d575-46ee-8d16-08bca32d44d7@windriver.com>
Date: Wed, 28 Jan 2026 23:04:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 00/16] Enable rust support for linux kernel
To: Antonin Godard <antonin.godard@bootlin.com>,
        openembedded-core@lists.openembedded.org
Cc: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>,
        Alistair Francis <alistair23@gmail.com>
References: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
 <843161.1768934499700757613@lists.openembedded.org>
 <DFUD78TMO2O0.1WB04Y9FC5LNH@bootlin.com>
 <ee399b5a-f8ca-453c-a451-c646766b61c8@windriver.com>
 <DFV6QL85IOND.261RTUSIWUPHO@bootlin.com>
 <DFYCXSVMAPCN.R3OW6N5BF8ZJ@bootlin.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <DFYCXSVMAPCN.R3OW6N5BF8ZJ@bootlin.com>
X-ClientProxiedBy: BM1PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::17) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH7PR11MB6553:EE_
X-MS-Office365-Filtering-Correlation-Id: 5535e5e1-50e5-4f8f-5005-08de5e93943d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|8096899003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WjdHOHB3QnorUytvY2ZudkdGOStORWZTTjFkT0Q5UFhJYng3UlZ5VlE3cnJE?=
 =?utf-8?B?U2JjdTdaN1RQNDBJa3grZ295RGptZEl6RFZkZHRKVzNGVFFoYVpOZUMxL0VU?=
 =?utf-8?B?L3B0TEpSQmZQZ0d5UTVmQnI1YjRpUjdQTkhZN253ZkFzQkpqOUVOR3RBNTBk?=
 =?utf-8?B?ZlUwWVFhWHVJbkpGTjc1Z3lXWHFkeE4yZVFIT0dVSlpxZW41b3ZBTVRPME1k?=
 =?utf-8?B?b1JzRkwzYWZhNnRCUXlsM2xTVmxEaVROOVRFMllXUFlKMlB6ZVo4UVpIMUVn?=
 =?utf-8?B?QzBSR1kzYk5tbzhDeCtROEw3a1NGU2U5YW5uZjZDSENUL3g0b3J4Z1Zsajk5?=
 =?utf-8?B?ZXRSWnM1VXVmTEZUdkpXMndnWmd5VWxNUVdQZFU5TUlzQWtna3ZZTHhCeWE5?=
 =?utf-8?B?SzJWQXdyZXc3NWgrVmV3L0MwYTE3aGtwNlpqR0JwYWxHclJ4d2FlK3NrREtB?=
 =?utf-8?B?a3h0dHdOK2h6Nm4rSTJiSFBQTDJBMHltVU9JZnZPMXN1REc2YlIyQ1k5Z3RN?=
 =?utf-8?B?bTlUTVI2THdCRUo5SHNScGhlZTBJSUdjMGNMUEc2SXhxdkhNNGpFa0VScFJN?=
 =?utf-8?B?Yjc4YWN1VFdrSHV2ZGwwR2k2ZFNkU0xTWm8wQ0ZrQVY0UCtza1VmaStvT3ZV?=
 =?utf-8?B?Ykp6cGJ1KzloT3R4ZE1odzBwNTN4bFlEUEpqS0ZQVndmRm54QnBBeW9lZmlU?=
 =?utf-8?B?TUs0NE52OFkwWFRjeDAyNWVQQmlISFJ1QWxtTk5OVWRuRXRURDdnQ3UwRWZR?=
 =?utf-8?B?dWtLUXJjUkt5OFkxUENuSWFMUjBTWGRRVHQ1T0tPVEowQ2FlM1lNSnhkN3pl?=
 =?utf-8?B?MDV3RmtHYld1T3BVc3pvSWx0aUhPUTZPVFBjTm13N2JoYk03OHczSGFXYzdO?=
 =?utf-8?B?YXJxVE1LeVBnNEhGQzFqS3FMbms4ZElVT2prU2RxRHNJc1pVWHVCWmJBbUtK?=
 =?utf-8?B?VlR1SVRSZnNZSmdkL2Ira1d4WTQxUWIxYWt1dmpBdVJ2eUkySm41SU5rVERK?=
 =?utf-8?B?OVpTa1FoVnUzWkwzaTZ0ZXRSc1JDQ3NrcHZKa2REY1dQazVFd3U4OWlPUkRU?=
 =?utf-8?B?eFpoRnJVeUFtcklzeGdRWHFkeU1VdmZvcmhVNVkvblZGcC85dDJUNDI5MWlK?=
 =?utf-8?B?bVMxeG9lRkdkeXFycCtqUU56UjFNMGRhRUNZMmxsNGhlOEsrWHFhMkVmVVRC?=
 =?utf-8?B?UGtvUldQOXhiUWVvcEdTaDExbEo3aERHUnlkK0g5dG5BTk1LZE1WZm9BNDVY?=
 =?utf-8?B?UC9UZHNRUUpPM2lGM2F3TG1MQ0RtNXhUT04yQUJPbithU3IwQ2k5bzF2THEr?=
 =?utf-8?B?UTF4UHA1eVZjb2FwR0ZIWTVYbDV4TE1QVGFNQmtBdFZmejJ1MkRUbE5pdEQw?=
 =?utf-8?B?Snl0ZEdZTm1WVFAwY2MrTUdRcU0yUUpHQkpocTB0TG1KNHR0SmZlTmVtbFJW?=
 =?utf-8?B?Y24wUzNHSy9WQmRoRkZKVHJwL0JRQk16QjJtR0Y0L0l1c2hjVjFUdnUwS1p2?=
 =?utf-8?B?amhIZHBlbHlpMmZrYWZTbm5GazNMZ2lRMVlrUDQ5eUlEWTVCNllkN014bUM4?=
 =?utf-8?B?R3p3L0JQNk4vd25KWk5ZZSsxTFFNOHJiZGJXdVl5aG5rTk9DbkJDWlA3SDlI?=
 =?utf-8?B?ZUR6Y2tLWEkraXFUcjRjMFV6VFZ6WnVET2t3WUt1Y3JIZGZwZTVxRWVreGxl?=
 =?utf-8?B?TWNoOWRGdVRoeVJVVWNRNEtmLzZMZnNtb05QOTY3cTdTcCtVbHJpc1RMZkxU?=
 =?utf-8?B?ZDZRYldPVWJEdEdyRTRXeml4N2NlWDJydmswblFyRjlZckh2Mmg0d0NuQ0w4?=
 =?utf-8?B?aVZQRFg0ekRFdVdzcitTYXVNSmhJU0xvOWY3QmNraTdUcEt2TGJweWNGSEts?=
 =?utf-8?B?djhpK1Jid2I4bXZZa1F5LzFPUU1QODhqQTNndThyYUg0TWhNaEtBaFlGTm1L?=
 =?utf-8?B?d0dwc3Z6TkgxNmw5ODZGekh4TXhEZlJnc2JKdjd3b1QwcnNEZFgwdWxmcnM4?=
 =?utf-8?B?QlVXRkFKdEE3R3FjSXp4QUlERW0zZGRSeThnSHh1bnRiQlJMV0hvQU9Fd2dS?=
 =?utf-8?B?dUFhVnA3eDh4WXF6TkJ0UjFZYjdLWTI5OHFjYWpKSW5wbkdwOC80Zkt5SkxT?=
 =?utf-8?Q?ScQXDr/b9UKBsXl2OsbrM+Uqs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(8096899003)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QWF6d0xEQjFrTWZDV2kwV0dVVUlBWjcxb1FHYkRhcytEQVh3YlR6cXpvOGxQ?=
 =?utf-8?B?YzBNcEtyQndIMGlFOHY4ZjR2ZVRra3dubmxRVjVVY1UvMUhhb1EzNE0rMUxt?=
 =?utf-8?B?Y2VWb1M1MWFjdTlxZFV3ZkM1UmlEYVovVm1YRm81MTZaNjVOSTBYU1dLS0NV?=
 =?utf-8?B?S1JTdCtYVFV5WmFWNnlsZXczakNlbTJqZklPUjhSZlhvMWlJMFEzYjZPN0p2?=
 =?utf-8?B?Unl2Qm5LUUdXeDNqQ2JiYWgyMWg3THVXN3laK1VOS0dlSSt1RFlRa0xuMEJD?=
 =?utf-8?B?ZnlSRmxySmdpbkIxMEc3VU5kYWRpVXFiOGs1VTNwNUY5bVJLb0x5MmgwRGcz?=
 =?utf-8?B?UzBOeVNLMkJJZHVqcEM0K2RTT0FDeGpCOGZLdWsxTHVEZU0yNUdDcmV6T1Iy?=
 =?utf-8?B?OFBLMzBLckp5T2NlTHNjaFNGMVRBN25rdkd6azliUnNWUWtVNmpvcjFZVUVO?=
 =?utf-8?B?SUNNOU10anF5TktSa2xMM3ZIRWcvVlhLZjFQbTQ5Z0Z6SURCMG1CMnkyb2wz?=
 =?utf-8?B?WjRldXZ4bVRhaUc3TlprTDhXenM5NjR1NHBSNXpIQU5sS1hRSVBqM1VxcGZv?=
 =?utf-8?B?enhIQTg3SWdFZHJMb2J0SDAxd3hlbWZ0UUNMKzBMNC9oZDNZTjQ4L3l5dGFo?=
 =?utf-8?B?NEdveFJibWhVUVJQVWtVUnUyL3Z5ZENzUk9GREQ1TWtlUU9rNyttZDQyM05q?=
 =?utf-8?B?MXAxcUNaQ3RhNnp2SXArUmI1UXozSG1EKzIvbHRyZHMvOHlCT2RESFo2bnIz?=
 =?utf-8?B?UUxGamZtZ3dlSTNHQVJNZi9qVWd4NlZWK0hXcEFiSWo1c2JyYkdva3o4a0kz?=
 =?utf-8?B?UG45cXg4Q29kVGVUZDJ6MFdYTU5wOHhRd2xwWFZQT29kSDZRdmZYR2c2dGs5?=
 =?utf-8?B?WFovUlpNYmJ2UmVaT2VUdFBzN2ZBVlpnS2QvOXVlbERGcngzRGQyYU5yQ3Rl?=
 =?utf-8?B?cDdGMHIyT2psTHFtTG1TeEovWi9PKzVXRVNxQngzQUI3SXI4MW5lUUZsTWpq?=
 =?utf-8?B?R1lDUGRCVnd6SnhBKzlROG5QL25NdHNFaEFzTExzM0ZweW1vTjgxTzR4YmJk?=
 =?utf-8?B?S1JDRE5pT0F5S0NKaklvRTBBVnVlTlVpUmt1QUdhL21kTlBhL0RadUN0MkQy?=
 =?utf-8?B?bkdTZ3hQVkhZUnNTcmx5b0lmOFQwb0hoYzY3KzVKTjFFWmRiK2xSb2s4UFZI?=
 =?utf-8?B?d3h3VzdDUFVYaE05eG1MUkxvODNDRmx3N3puUGdMRXFyZUFzeDlLYmpYQnFB?=
 =?utf-8?B?b2RJU2txVi9KOW9Uc0JkZ3BzL0QrZ3lMVitZNDVYOTBqOWs5VUpCN3Nzb2gz?=
 =?utf-8?B?SWdQRHVJdUFFZmpvdnFnTE0wR3pBSWR3dzkySktoRVR0Mmg0cW1mNEN1UlVZ?=
 =?utf-8?B?VVNYU2ZrUlZKMzQrc0xkZ3k0R0duejc5WThjRlhNR3pOWVNmU1lGcG03aWdT?=
 =?utf-8?B?bGdreDRnNjF5cGVSZ0dGUmFvTnZNRTVlTysvTUNUS2RaV0RxTkxKTzFYZjlo?=
 =?utf-8?B?WGRGUkl0YzJhM2trU0FaT2NIL2dnYlZPUHlocDlMY0RKYzJqV05WRmFiYzZn?=
 =?utf-8?B?SDZBaG1OT2hZNkZYdzJneFloOThEMFB2TlpxUmQzWUZJRi9PMlJhaHBVWnMw?=
 =?utf-8?B?RVBLQWhRQ1JzcUd3cmNoazNLcFI4WUUrZXdsaEhMa3dvaU16dXc5Nmk2YnNE?=
 =?utf-8?B?Q2MxdWpmY0hhaE83TXFuNFBrNFBqYnl4blBiQ2dUcmRmbmQwQjhpKzJxV1BG?=
 =?utf-8?B?SS83ZFhxTjRhdnB5VlFmNUdRWjcrdWRSQjJxMnJwalUxVGdGbUFIaU1Jb0JZ?=
 =?utf-8?B?TXBzMUd4Yjkxc3J0V3FkcUxkYVdZRXFzSUNVZTZhUHd2cHhka3g3eURBRGVI?=
 =?utf-8?B?S3JaRU00WTJhdUpWTEhhYmhvcDMyS0t1S2JJZUJwNTZzK3VPVU51Mmt6MGZF?=
 =?utf-8?B?a0svMzd5YlRwVWFIdU1BQ2p6NFhRSHpERnRpcWw3Z3hKZFJaU3BqaE9odkxy?=
 =?utf-8?B?QnFLay9TT09lYWkxcEdxK2tHYmhqUWNCSmhOUGhIZ2FlRmlwVDZjNUtsK1NF?=
 =?utf-8?B?ZFY0cWovOVZYdlVUaXdNditKckNUWXdNWUJFN0xYUytxMzdlZXNnb3QyOGxO?=
 =?utf-8?B?MUtCc3E4eWdQd0o5NzBZWUVjWHh2NkZjSTFMSzNZMXN2T2VUM2p3b05uZ1lj?=
 =?utf-8?B?S2xIU0U1LzVuem80emJFR1h1cUhtQnVYL0hVbUcrY2FlaEVVRlc4cXlRV1pM?=
 =?utf-8?B?aTFRNkREM0pmaStvK2wxOERyeFRkbDhiaU9TbmpzQXBMdm9pd1ZvQWt4bmJF?=
 =?utf-8?B?dTg4M1VRWW9FRWNLdXppSkZuNDFBQmZtY3ZpRkFPVlJja2NXamNUTExadmg5?=
 =?utf-8?Q?S9lbO5fgbJ6zhjX8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5535e5e1-50e5-4f8f-5005-08de5e93943d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 17:35:07.5221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXmNf6rAhi4QuLqS9haT5vF3FyLzcp4N69TMkT8iJCnVaeNzDnKBJJ69/CQUJ/LmGvN4pDVOQdnWqbDLH0w9fxK47/Ma2PPe6lH9fbRxpJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6553
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDE0NCBTYWx0ZWRfX8WL2IQn4Z+Fk
 BU/fz8xP1uzU2xB3vPSz7XBVIABNUa3O0uvXanMbhC5WSsFJgullMj7UmNEuSZo5n8kCrXdqyX9
 +2O6LSiSFMWDnvLhlh6CyDsgqQxjgFGHpbApWhclSA1vAW9pddir/5zP6xucHb7+I7XUTpouuuz
 7+ErKzQMqFE1QQkZEa9W+sYn8XAiIu1okWIeK1VQrO6pL/vIDQ74HLL1u7quZV1PY1O0OSJQKEI
 4L4/kcoFe9haqmIMhWAwYXvhW6NRiPKGOro9I9DOcPrYAEP1C8CEQF5f0D1Y3OdhwYH3+WWdxem
 Gb4oTcdUZ+N/Cc0zIaCcj8z849wdm1AoKuHA1ZKiob7b05yBAhUcNtW6oXwg5RWuMJ+GlrUqJTy
 SY+Gjw8uP2MXRxtHFJ6VaLtrGyy0vbo8GNwE8VgIHd89qjAtKQSFtK7h33p5ErfOPPDeEzoUIwN
 lutYZU7lCRFdjQysa2A==
X-Proofpoint-GUID: chlWaRY8zF0-HVTl5Ek8ZaLxl16v9gis
X-Authority-Analysis: v=2.4 cv=M6lA6iws c=1 sm=1 tr=0 ts=697a48d3 cx=c_pps
 a=cX17BFbqy3c2X70AxBoB8A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=P-IC7800AAAA:8 a=VIBLii6WRBDdWcpXVxgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=vcyDqTTk3COcxlDzs08A:9
 a=aXQbBnAWEaSE-f5U:21 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: CVvb3i-b6MeZy3uVWaN8vzqWmmYyTgYF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_04,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 17:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230106

--------------3YFx19TKYNqSvaeY2czFkPKf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60SB1Sll3431226


On 1/26/2026 1:24 PM, Antonin Godard wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Hi,
>
> On Thu Jan 22, 2026 at 3:24 PM CET, Antonin Godard via lists.openembedd=
ed.org wrote:
> [...]
>>> Thanks for reporting this.
>>> The error indicates that the linker is unable to locate libm.so.6 and
>>> libmvec.so.6 in the recipe sysroot.
>>> These libraries are normally provided by glibc, and this issue does n=
ot
>>> appear to be caused by our patches, as we are not able to reproduce i=
t
>>> locally.
>>> Could you please re-test the series once more to confirm?
>>>
>>> Thanks,
>>> Harish
>> Ok, thanks for testing again on your side. It may have been related to=
 another
>> commit on my branch as I'm not facing the issues again. I'll re-add th=
e series
>> to my branch - sorry for the false alarm!
> Sorry, but after starting an a-full run with your series again, I start=
ed
> getting the same errors again:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3110
>
> I've launched an a-full build with the same branches minus your series =
and I
> don't see the errors anymore:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3115
>
> You can compare the branches used for the two builds by comparing:
>
> https://git.yoctoproject.org/poky-ci-archive/log/?h=3Doecore/autobuilde=
r.yoctoproject.org/valkyrie/a-full-3110
> https://git.yoctoproject.org/poky-ci-archive/log/?h=3Dbitbake/autobuild=
er.yoctoproject.org/valkyrie/a-full-3110
> https://git.yoctoproject.org/poky-ci-archive/log/?h=3Dmeta-yocto/autobu=
ilder.yoctoproject.org/valkyrie/a-full-3110
>
> vs.
>
> https://git.yoctoproject.org/poky-ci-archive/log/?h=3Doecore/autobuilde=
r.yoctoproject.org/valkyrie/a-full-3115
> https://git.yoctoproject.org/poky-ci-archive/log/?h=3Dbitbake/autobuild=
er.yoctoproject.org/valkyrie/a-full-3115
> https://git.yoctoproject.org/poky-ci-archive/log/?h=3Dmeta-yocto/autobu=
ilder.yoctoproject.org/valkyrie/a-full-3115
>
> Maybe your build uses some shared state which is why your builds pass?
>
> You can base off your test builds against my a-full-3110 branches above=
, that
> may help.
I was able to reproduce the issue locally.

Failure was happening due to Alistair Francis's patch from my v4 series=20
(https://lists.openembedded.org/g/openembedded-core/message/229769) when=20
applied together
with following patch "llvm: enable LLVMgold.so build by adding binutils=20
dependency(https://lists.openembedded.org/g/openembedded-core/message/229=
387)"

To avoid this issue, I am dropping Alistair Francis=E2=80=99s patch=20
(https://lists.openembedded.org/g/openembedded-core/message/229769<https:=
//lists.openembedded.org/g/openembedded-core/message/229769>)=20
from my patch set.
We will send a v5 series tomorrow.

Thanks,
Harish

>
> Regards,
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
--------------3YFx19TKYNqSvaeY2czFkPKf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60SB1Sll3431226

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 1/26/2026 1:24 PM, Antonin Godard
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:DFYCXSVMAPCN.R3OW6N5BF8ZJ@bootl=
in.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

Hi,

On Thu Jan 22, 2026 at 3:24 PM CET, Antonin Godard via lists.openembedded=
.org wrote:
[...]
</pre>
      <blockquote type=3D"cite">
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">Thanks for reporting thi=
s.
The error indicates that the linker is unable to locate libm.so.6 and
libmvec.so.6 in the recipe sysroot.
These libraries are normally provided by glibc, and this issue does not
appear to be caused by our patches, as we are not able to reproduce it
locally.
Could you please re-test the series once more to confirm?

Thanks,
Harish
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
Ok, thanks for testing again on your side. It may have been related to an=
other
commit on my branch as I'm not facing the issues again. I'll re-add the s=
eries
to my branch - sorry for the false alarm!
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Sorry, but after starting an a-full run with your series again, I started
getting the same errors again:

<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/29/builds/3110">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/29/builds/3110</a>

I've launched an a-full build with the same branches minus your series an=
d I
don't see the errors anymore:

<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/29/builds/3115">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/29/builds/3115</a>

You can compare the branches used for the two builds by comparing:

<a class=3D"moz-txt-link-freetext" href=3D"https://git.yoctoproject.org/p=
oky-ci-archive/log/?h=3Doecore/autobuilder.yoctoproject.org/valkyrie/a-fu=
ll-3110">https://git.yoctoproject.org/poky-ci-archive/log/?h=3Doecore/aut=
obuilder.yoctoproject.org/valkyrie/a-full-3110</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://git.yoctoproject.org/p=
oky-ci-archive/log/?h=3Dbitbake/autobuilder.yoctoproject.org/valkyrie/a-f=
ull-3110">https://git.yoctoproject.org/poky-ci-archive/log/?h=3Dbitbake/a=
utobuilder.yoctoproject.org/valkyrie/a-full-3110</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://git.yoctoproject.org/p=
oky-ci-archive/log/?h=3Dmeta-yocto/autobuilder.yoctoproject.org/valkyrie/=
a-full-3110">https://git.yoctoproject.org/poky-ci-archive/log/?h=3Dmeta-y=
octo/autobuilder.yoctoproject.org/valkyrie/a-full-3110</a>

vs.

<a class=3D"moz-txt-link-freetext" href=3D"https://git.yoctoproject.org/p=
oky-ci-archive/log/?h=3Doecore/autobuilder.yoctoproject.org/valkyrie/a-fu=
ll-3115">https://git.yoctoproject.org/poky-ci-archive/log/?h=3Doecore/aut=
obuilder.yoctoproject.org/valkyrie/a-full-3115</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://git.yoctoproject.org/p=
oky-ci-archive/log/?h=3Dbitbake/autobuilder.yoctoproject.org/valkyrie/a-f=
ull-3115">https://git.yoctoproject.org/poky-ci-archive/log/?h=3Dbitbake/a=
utobuilder.yoctoproject.org/valkyrie/a-full-3115</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://git.yoctoproject.org/p=
oky-ci-archive/log/?h=3Dmeta-yocto/autobuilder.yoctoproject.org/valkyrie/=
a-full-3115">https://git.yoctoproject.org/poky-ci-archive/log/?h=3Dmeta-y=
octo/autobuilder.yoctoproject.org/valkyrie/a-full-3115</a>

Maybe your build uses some shared state which is why your builds pass?

You can base off your test builds against my a-full-3110 branches above, =
that
may help.</pre>
    </blockquote>
    I was able to reproduce the issue locally.<br>
    <br>
    Failure was happening due to <span data-teams=3D"true"> Alistair
      Francis's patch from my v4 series (<a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/229769" class=3D"moz-txt-link-freet=
ext">https://lists.openembedded.org/g/openembedded-core/message/229769</a=
><a rel=3D"noreferrer noopener" title=3D"https://lis)" target=3D"_blank">=
)
        when applied together<br>
        with following patch &quot;llvm: enable LLVMgold.so build by addi=
ng
        binutils
dependency(https://lists.openembedded.org/g/openembedded-core/message/229=
387)&quot;</a></span><br>
    <span data-teams=3D"true">
      <p>To avoid this issue, I am dropping Alistair Francis=E2=80=99s pa=
tch (<a data-start=3D"479" data-end=3D"544" rel=3D"noopener" target=3D"_n=
ew" class=3D"decorated-link" href=3D"https://lists.openembedded.org/g/ope=
nembedded-core/message/229769">https://lists.openembedded.org/g/openembed=
ded-core/message/229769<span aria-hidden=3D"true" class=3D"ms-0.5 inline-=
block align-middle leading-none"></span></a>)
        from my patch set. <br>
        We will send a v5 series tomorrow.<br>
        <br>
        Thanks,<br>
        Harish<br>
      </p>
    </span>
    <blockquote type=3D"cite" cite=3D"mid:DFYCXSVMAPCN.R3OW6N5BF8ZJ@bootl=
in.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Regards,
Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
<a class=3D"moz-txt-link-freetext" href=3D"https://bootlin.com">https://b=
ootlin.com</a>

</pre>
    </blockquote>
  </body>
</html>

--------------3YFx19TKYNqSvaeY2czFkPKf--

