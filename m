Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4063D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 02:30:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10670.1765247448502347271
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 18:30:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=J74huL01;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4438aff1f5=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B90djEb3215566
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Dec 2025 18:30:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=ZgVS7bUuOacRqaRtGGgmnY
	TgkpkeapZr3Pf00jD+sUc=; b=J74huL01QRGqO96DTUciFHwniK0D+n7n4EhjI0
	QhGjIlcE9a6f5ZGZO2AOIoHjQVYaVrW24gXtji0JGIjCVyJQ82wkbVimwGx1RqIR
	tnBaQIBhuDvfQBhTo0jkhZnXyPu/+Cof6EOgdFRbU56e/ZJ6eZ0Fee20x7P76zMD
	DMbupwkdLTpjmyq9HzSp61Iw9OuanQKnAq2fqMGQHLpAfhYY3kw3jHAJL24VsVgx
	2G6B5CV/VcBarMdVPrZWPWI2GAO4GbqKFuI7UTmjsAavl3yDGntjJjDEvwm+njcL
	ikg5uuGsywLigWnL+p6yrdqYRC28n9lIKB+AsD+/Cm+xP4VQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010055.outbound.protection.outlook.com [40.93.198.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4avgn5ja48-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 18:30:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNsCLzvlp3ee/oGS/G1887XLGbsat/8+0BSn/RHxSPXhLryHi8iVz0GWm9Q6UMVfcXzjQrJSrbCMWeYxKpovAHTrW0O3kLveWP2nzplpaO/jxmzxr0NRWG5xWEBHkJKDgWUYrR4cT3BOL4cbuIt6t96nMLgJswa+3/95JoymLUP0r3HygB6yyIAqFja0g/VbG7OslEiYWz5Cmal+PhGbT0azV4ijEc4wI+XSmiw3kmcpW9BBX01+l5vPPelWmZx/3LbAAzvZKcBpskQ7BF5B/gvf6MKpm7vcWdL9f0Tld+1ZhtGRW9DsJ5kSIBC6HJezXdZbZ4wKL7wFl4TDPymHcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgVS7bUuOacRqaRtGGgmnYTgkpkeapZr3Pf00jD+sUc=;
 b=ZU1OERoeWsCwL0u4kgfv+kcvWW7orlSfPZwSeblbTv1Pd9F4pga/vhICvMYyIWD30H6Uc1leInsoI+db4nXOyncCR2g7hmasRJ4UOPO83IGyDVJPjLIECeJwfzb4MB7SK4R5oZD6pYTAxv95Vi9cvKzSDd1eVD3sZWxGo3M8aNRTcpTldhNaYYYLZlPyOgXdg6DXI5y6SpP4fo8Or+rxVZ3zVtSkCYzDqjTXDNmyqZPGH+vsuZxZ2q0UbM5iEp8+z9+X23iLN0LQeDhqsLOHpbMYTUfEaNl4Bq8zRWbJMAruKbKyaObQ4H0HbquyaVE6an/+GtLwgeHC2PdJPoI19Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ5PPFED9C9AC99.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::85d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 02:30:45 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9388.012; Tue, 9 Dec 2025
 02:30:44 +0000
Content-Type: multipart/alternative;
 boundary="------------cP0075CpJWACNqvucg8l4E6M"
Message-ID: <f8fece40-cfdd-4e0b-a200-b52d78c25fa5@windriver.com>
Date: Tue, 9 Dec 2025 10:30:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] go.bbclass: set buildid to empty string to
 improve reproducibility
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251208091148.368769-1-changqing.li@windriver.com>
 <20251208091148.368769-2-changqing.li@windriver.com>
 <DB5PR02MB10213CFA39B1989410B8D5AFFEFA2A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <DB5PR02MB10213CFA39B1989410B8D5AFFEFA2A@DB5PR02MB10213.eurprd02.prod.outlook.com>
X-ClientProxiedBy: SG2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:3:17::28) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ5PPFED9C9AC99:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d2ef78-5ae1-43da-2528-08de36caf46b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bFJ6UmJKYkxOUmVRT29iLzJkenJIS3MwT0dvWFRvb2VZQThpSk5jc0lKbDdt?=
 =?utf-8?B?dlRLNkN5b3RLeXlyOG01YzhtWEU3MTNPTGVuYTRlSmZMU2UzS2J1T2pOeVJD?=
 =?utf-8?B?SmJoSmxxZmNTdlp4SVd5SjhRelBEdTBzb1U1ZmcrMGNoQlkxcDM1RWxyZTQ0?=
 =?utf-8?B?YzFFMm5rWG8xT1VPZlFHcjh4bVBKN1N2UEdTYlBFRDZSUmgvdlBvbG43WVBi?=
 =?utf-8?B?cUxhRnR1VURDYVAyZjRnS0w2L2FJaFhhYVJpWEdncnZtbFliYU5MdDE4UnNj?=
 =?utf-8?B?S1hEQlJib2k1NHo2YUFlRC9sYjlOTGhyZzRiTWQyQzJocGFrWTBpQzZ5MWxN?=
 =?utf-8?B?aW1BTHpJbzZjNUh3YXJMQk1BVWhSWms0aDRncmxidFBvVFl5d2FjYWFlNEdJ?=
 =?utf-8?B?eHpzc0dHZk1DR2RkUGVZZUJVS29sbmxDL0JJYXpXTDVQanA2MTRYVkV4MXU0?=
 =?utf-8?B?RzBZcE51cUlNZHdvbnVvWlZ5aWo3MDA4TUZ2MDlRZ3JIQkdFelhCQUk1aGQv?=
 =?utf-8?B?VnVnYlAwejlEdXhITjBqL0hCWE5FTkIzL05UUGUrSTRrRm8zNi9CZHZ5NmNK?=
 =?utf-8?B?Q0xCb09oS0J1Wk1ybzZuL2VXekd0WGk3bGZhdXc1MXlxa2Q2LzBwNS9GQWU3?=
 =?utf-8?B?NnM1OUVLY3MwNHJBRlQwN3V2RTNBY1Z4dUxNR0RwaW5JSEpsVUVNMkxtL215?=
 =?utf-8?B?THhVZFl2SUVxN3FJN2VzZ3pnMy9SN1NnMHZmMWJjOTdwQ1d3VVprMC9ZWjdl?=
 =?utf-8?B?VmM0Ynl1R0s4K3NZdEpCYUZUQjZ4b3lpWHZoUi80Q0lwVzNLTHp6cmoyZkVJ?=
 =?utf-8?B?RUNxbk1lMytvSGprdFVhM3ZTT3EyRk85N3VySGwxVmx2NnQ4MVNMVWV1SGht?=
 =?utf-8?B?SG5laGRFcHhhR3hhL2VteDFJR0lYUnhnVEUramw0WHhGenVCNkM0Y1hwZDBi?=
 =?utf-8?B?OGpidVdGaVlaTGxkTHIycFZ6MVo1amhNWGt2ZU12MERaQ1B5TWs3NWpLcWZS?=
 =?utf-8?B?WGlPSXYvYURLd3lFVjZSZUJJc21WOUxZMm1haGxwWU03MXRjL21TUlp2QjVv?=
 =?utf-8?B?ckV6Y1NGaUV0UXJUNFBzTjhVUlhaZUhYSWVuOWVXYk56SUZUTnplak1XUjQy?=
 =?utf-8?B?NlhiangvT003M2wyazBhM0ppR0xqUFNGVFJmeGdXN0h3QlJLRG5pdXhDcWdW?=
 =?utf-8?B?aDFUU05TRkJMenovMnpWenFkQUNXV2NJbkk1ZFMwUUNiTjFkZzdlNk03K3FI?=
 =?utf-8?B?U0lsZWpsMWZoQjd4ZTRJdXFJTkkyYitnSU0rZUJEL1BxTUo2SzdleHNpZUtF?=
 =?utf-8?B?TXhlY3FNMXU2WCsyTWVmajlWVDQrQWtieE1oYXhvelBJbUtuYnZ2eHhXUld4?=
 =?utf-8?B?bkRHL2xXVVVWa2xVQ1V6Um9YQS9TOWptVjBwb3dPWUFnUkNWRHAvNWF0YWNn?=
 =?utf-8?B?ckJ4MUNSek1vVlBHTjJHSGMvakhMR3kyZHYrMjlmZ21XaWFPMnFLS1FYT2FM?=
 =?utf-8?B?WHVDN2t0TzNKWi9ZdDB1T3B2c3M4WUlEU2M4OVF0UW9VelNCbVdZWHZvQjFK?=
 =?utf-8?B?V29SRk9tVjVlME5oKytJdUpNTHNMdUk0K093Q3FMYUR4bWNNOGZRQ1FZazZv?=
 =?utf-8?B?WUd2cTdnUjFFajc2bllUZ1lzY0d0amFNRVBKa1hqVktVNkRSN090MW1udjlY?=
 =?utf-8?B?MkU3ZzM5SzRPVUJHWmxha2grbWtFSTBjUlYxSHdRYlZqM3E0RmQwOTczMUly?=
 =?utf-8?B?T0xSaEVFdkNrKzdWMzNweUdUUHRVdGFMYThLeExpRW1aM2ZJNDg5Qk1VUVcv?=
 =?utf-8?B?cnVWNGJlODBrd2VsZWY1bVVUbm5vQTV2NmE4WS92V2JHYkpiMG9JQzM5SkZP?=
 =?utf-8?B?VmxZbm1IdytFb2dydUFvZms2Vk1hek54SG9Ua0Q0UC9iY0I5WUxNWW5CNEwy?=
 =?utf-8?B?bThHM1lpVWFNTnZESU1JOXpJWWFtY0dzT2dRZUFJRlNOOExqallwSk9PZFlp?=
 =?utf-8?B?T25LS21USW9RPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VHo5cDVCY3NlODFXQ2dWeUMxckV3a3Y3aFFEZ08vREQ0STJVaXZUOUpCRko0?=
 =?utf-8?B?MWZCRDBwekl1TVp3QnBwWDJRejdBTWllT2NSSFJBZ293MFcyYStPeS9kN2Vt?=
 =?utf-8?B?WmhBTmNoVldGTk1JMEVNWVk0YXpCbDk5Sm9RNGhVcmVkc2F2MDgxZzB3VW4w?=
 =?utf-8?B?RXE0L2lwSHhPZnIycXl3enpMRFdlTHNydEVGanRmSURKbzVpdkk4Z1c3TXZj?=
 =?utf-8?B?MDR6NnVaeWJyQ0xrSlBnVVRkS0g4S0JLQk81dDBFanR2amdlVzRvUXhQR0VG?=
 =?utf-8?B?UkJQdjNhMTNHZG5RU3BuSzBvanhVemVBRXU4TDZYdHY3SXJkV1lzQTNaVEJB?=
 =?utf-8?B?aU81dWRTK3l2bnBBV2g0ei80WEpsbUxOVGw1bEVXZmpvc3lDYTZ2cUxVUVFm?=
 =?utf-8?B?U1MvRytqb3dTMlpuOXBxODlCNVRFT3VPYzZVTExSNE0zYkY0S2FubFZzd1ZF?=
 =?utf-8?B?MElhNGhHajlvdkpwQTdSUVk4dGYwWjBjSWtEdXZTaFpvSnZDVFZNRDRMSGor?=
 =?utf-8?B?TnFKVHlXTUpDZDJxN0N1am9vZlQvVkQ0aUx3RWNPZWtjMEVrSXpPaWFaNEJu?=
 =?utf-8?B?NHhEUGNTQnZTNzlKa2Vhd1FPbkJ0VUg3QkRoZ0NvNmhPL0NNcjJUcGh5Mzlh?=
 =?utf-8?B?QkgrQ1VRMm1xMVRmZC9Cd0FHcHlONGlkUWxtUHhJQkQ2akd5akczeG1kaEU3?=
 =?utf-8?B?ZlMwbEZDTzVDbDgwdGZ0K0NTaXMvSkZDcVNSSjlHak5DRHpVaTRzWnVpNDF5?=
 =?utf-8?B?Y2kra0t1bEQyU2RkRXE0NDFRVEFsMEpMdTZtbmI4S2N5MUJmdzNnK2xuTlJr?=
 =?utf-8?B?NDhSbW1YeTZnc2xYYTFjTkxSS082QjhJeURtMnNScFh1ZFpnZHY3VzRSUjNx?=
 =?utf-8?B?TzhydlJkSTRuOTVuUTVsS3hTMTNjVTZSTyt3NGFzbmt2RXdKWmVHays2Lytk?=
 =?utf-8?B?QysvZUJHRmNVajltdWlhYlJPVjNHd01rNVpBY0dVSzJYTnBhQS9xS1hLSXVT?=
 =?utf-8?B?b2FLUkJUR1FZeFZQWEw4VjVSUnZoZmloVjJsVUZmdHFlOVVycWRNYXlQZVpj?=
 =?utf-8?B?Q3EwRWlqcWU3ZmdSS0p3ZTM3SGx4b2RmOWNKMTJLYkovcUdHdXZrb250ODEv?=
 =?utf-8?B?cHNTWUZZU3FpT0tHejRMMkhseUNuVVlMOEgxZENCMU9KT2xlVTA0VVdubHJm?=
 =?utf-8?B?c0RrVDJHbzVMWjNGZ0F0U1ZLTjVVRmxzajRlbEtidlhkUko0OFMzYXdIeFdS?=
 =?utf-8?B?Y0lnNTJzNW81SXRqSUsxZ0pJWjV5TCtreFJSRjV2Qk9OSlFTSFVTSFNaSDNW?=
 =?utf-8?B?NnZKRnlJSGpBRGRjSVh3R2NqNmZKS2xTVFdjVmdXOFRuU0JKa3dLeWt4RG9q?=
 =?utf-8?B?N2FkNHp4WWJETW5HMlNsZ3FDRHh4SWxLNjR3UGxEdVQyL2lJRCtCV1NxVlVK?=
 =?utf-8?B?NDFPQyt0UStMcWhGTFptRWZ3VDRCMGNaaER3aVVzdWphRGhQMmhyVGJ0TllV?=
 =?utf-8?B?MGFvbUJ4M0NvdURUQzFudURHdDZMWkJkUFQxTFpkN1B0NUY2SHhId2ZMZ1hK?=
 =?utf-8?B?UDJ3OEhwcUVpTkxOdG4ydFV6aDFpN0pkU2twbXBURnZaT2xpSkVIdXJxRlpB?=
 =?utf-8?B?N0xBOUx0VkFVN0tpQ293RHBwVFkySURLSUpnalEzcnROQzBJYzNBRFZZSkw1?=
 =?utf-8?B?RklJQWh3Q3pUbUxFN2F5dlN4dldEdlRTT3FnRkpXL3FYek5mNkJhaXZoU2NX?=
 =?utf-8?B?Yk1vc0ZwNWtwRk5lK2tSZkJzaWdFcGVETTJzYmVONXdzMHhjMU51Y0xiUjNP?=
 =?utf-8?B?VHh6dlFJU3JYbHpwZXl2eGh5eWRkSkpmUlZOM3FWUGZ2TlJsMUdFOWU3L09t?=
 =?utf-8?B?bmRDZ2NubVVmTkkwa09SOFU4V0xrNDdXbjIxb1ppQ3NFd2h3c1IyeldsU2V0?=
 =?utf-8?B?MEoweE16RXZ5T3NTd0gzakU2UFp4SjNvMDY1THF3c2tXWHRLOXo4SStzVS9z?=
 =?utf-8?B?YjhNODA3UzhuQ3U4aUJEMXg2NDZXWEtxclQ2WGdwOWJDbGlTVWNqeHloVGJU?=
 =?utf-8?B?NHQ1cFFwczV1NFlnVHlIQmhveHpJQ1B1NkN5V0RzbzhySnF3cEtwamEwT0Fn?=
 =?utf-8?B?eDF6eUlGb01VM2lzNWpsUmtCaUdpS3FPOGJ6VzRVT0U2T0FzUk5xNS9PcXJU?=
 =?utf-8?B?d0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d2ef78-5ae1-43da-2528-08de36caf46b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 02:30:44.9000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frY5kXjhZROO9+20wp+wBzYQ3tJEhXf9VanMtGntnXe4vH4QcEixfEFBNL/YLEjh7IPJnyi79cAx6tSdECvB/VVYirzV5HcZ5xSwrA4FkYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFED9C9AC99
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: adu55Yx2Ik7nIcbk_FKRTwjld8St13GD
X-Authority-Analysis: v=2.4 cv=MtJfKmae c=1 sm=1 tr=0 ts=693789d8 cx=c_pps
 a=aDjbMzJe6/auvryAEMJQMw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=Gx2nT7eDiwncn7tCOvkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=UqCG9HQmAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9
 a=XaAa6V0GyomdkYRG:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDAxNiBTYWx0ZWRfX+237+1JG5hhg
 zeFdtgGhsdtfcTvr6sZL+lr+PfrQvAYxKE1A8V+PNSf0Wi8KDiJdRTcMdH3YXtkB0B1OA0E8w54
 FHhM9GoNonQ2+eKCoPD98rgWSOTX5fXNcJLfCct5qDEnw2Kx5LOkOY6bNeP9wYEgsfWrEkl/0eb
 mhB9Mh1m8oz6UnJX9qNb1Z7sAuBRhtPHDdEnS3Gp18CPGSN64U7zRtmNRs8hYwU+UzzCgRGaauK
 KQ9bIW1RUCmT91ad/uPlKl+O0nC8xZI9Wv/cexGqFC2x40Uji6ocSBVC3EtTbRe5D52QrWHCXUV
 J6rL7auUkLXPxLSOJ6oYOtCohCm8tHCdzfoj/SdCIeNnEn+If57aR+VV5jDQvgnfEXXRhjGmtMK
 C9C/bq0MHqY+C7bldbHkV9hKuzIEVw==
X-Proofpoint-ORIG-GUID: EQaBLLSoSC5TEWmpSdKUEBIsJtW1JzKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 02:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227413

--------------cP0075CpJWACNqvucg8l4E6M
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B90djEb3215566


On 12/9/25 03:14, Peter Kjellerstedt wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
>> -----Original Message-----
>> From:openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of Changqing Li via lists.openembedded.org
>> Sent: den 8 december 2025 10:12
>> To:openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 2/2] go.bbclass: set buildid to empty string=
 to improve reproducibility
>>
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Seems there are other things making Go BuildID not reproducible, set
>> buildid to empty string to improve reproducibility, open a new issue
>> [1], and refer an old issue [2].
>>
>> Refer:
>> [1]https://github.com/golang/go/issues/76743
>> [2]https://github.com/golang/go/issues/34186
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   meta/classes-recipe/go.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.b=
bclass
>> index ed986ff5d4..2593368af7 100644
>> --- a/meta/classes-recipe/go.bbclass
>> +++ b/meta/classes-recipe/go.bbclass
>> @@ -50,7 +50,7 @@ GO_RPATH:class-native =3D "${@'-r
>> ${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE
>>   GO_RPATH_LINK:class-native =3D"${@'-Wl,-rpath-link=3D${STAGING_LIBDI=
R_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink'=20
>> if d.getVar('GO_DYNLINK') else ''}"
>>   GO_EXTLDFLAGS ?=3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_L=
INK} ${LDFLAGS}"
>>   GO_LINKMODE ?=3D ""
>> -GO_EXTRA_LDFLAGS ?=3D ""
>> +GO_EXTRA_LDFLAGS ?=3D "-buildid=3D"
> Adding it to GO_EXTRA_LDFLAGS will probably not have the intended effec=
t
> as some recipes already set that variable and thus will not receive thi=
s
> option. You should probably add a new variable for it instead, like the
> other options that are set in GO_LDFLAGS.

Good suggestion.=C2=A0 Maybe I can add a varibale GO_BUILDID ?=3D "-build=
id=3D"

//Changqing

>>   GO_LINUXLOADER ?=3D "-I ${@get_linuxloader(d)}"
>>   # Use system loader. If uninative is used, the uninative loader will=
 be patched automatically
>>   GO_LINUXLOADER:class-native =3D ""
>> --
>> 2.34.1
> //Peter
>
--------------cP0075CpJWACNqvucg8l4E6M
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/9/25 03:14, Peter Kjellerstedt
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DB5PR02MB10213CFA39B1989410B8D5AFFEFA2A@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a> <a class="moz-txt-link-rfc2396E" href="mailto:openembedded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a> On Behalf Of Changqing Li via lists.openembedded.org
Sent: den 8 december 2025 10:12
To: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
Subject: [OE-core] [PATCH 2/2] go.bbclass: set buildid to empty string to improve reproducibility

From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Seems there are other things making Go BuildID not reproducible, set
buildid to empty string to improve reproducibility, open a new issue
[1], and refer an old issue [2].

Refer:
[1] <a class="moz-txt-link-freetext" href="https://github.com/golang/go/issues/76743">https://github.com/golang/go/issues/76743</a>
[2] <a class="moz-txt-link-freetext" href="https://github.com/golang/go/issues/34186">https://github.com/golang/go/issues/34186</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/classes-recipe/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index ed986ff5d4..2593368af7 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -50,7 +50,7 @@ GO_RPATH:class-native = &quot;${@'-r
${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE
 GO_RPATH_LINK:class-native = <a class="moz-txt-link-rfc2396E" href="mailto:${@'-Wl,-rpath-link=${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink'ifd.getVar('GO_DYNLINK')else''}">&quot;${@'-Wl,-rpath-link=${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') else ''}&quot;</a>
 GO_EXTLDFLAGS ?= &quot;${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK} ${LDFLAGS}&quot;
 GO_LINKMODE ?= &quot;&quot;
-GO_EXTRA_LDFLAGS ?= &quot;&quot;
+GO_EXTRA_LDFLAGS ?= &quot;-buildid=&quot;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Adding it to GO_EXTRA_LDFLAGS will probably not have the intended effect
as some recipes already set that variable and thus will not receive this
option. You should probably add a new variable for it instead, like the
other options that are set in GO_LDFLAGS.
</pre>
    </blockquote>
    <p>Good suggestion.&nbsp; Maybe I can add a varibale GO_BUILDID ?= &quot;<span style="white-space: pre-wrap">-buildid=&quot;</span></p>
    <p><span style="white-space: pre-wrap">//Changqing
</span></p>
    <blockquote type="cite" cite="mid:DB5PR02MB10213CFA39B1989410B8D5AFFEFA2A@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> GO_LINUXLOADER ?= &quot;-I ${@get_linuxloader(d)}&quot;
 # Use system loader. If uninative is used, the uninative loader will be patched automatically
 GO_LINUXLOADER:class-native = &quot;&quot;
--
2.34.1
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
//Peter

</pre>
    </blockquote>
  </body>
</html>

--------------cP0075CpJWACNqvucg8l4E6M--

