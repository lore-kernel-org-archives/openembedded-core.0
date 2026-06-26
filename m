Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B8CCDE00B
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 01:38:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26460.1782437910834015862
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 18:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=cTo9/bnE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0637d125c9=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q1J6No2568160
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 18:38:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=caVWz6gJm1eO4uLT2fxWCY
	p0TIINhq/c8+W0eoySD5g=; b=cTo9/bnEq4ht/xJCHzCyszhmnraxgYTKO+12TS
	YItJuLUEIJcRei2SUbLFgL7hbMYZtlLG1nx87cE/zCICk8ygbNxvIt3A/1qTUl2F
	PMZsLsClUIpUp33akfKVU0PDOiMY6FrLndBwngI7vasxy1dOoxi9cuHtijhuGIrP
	mORE19tHt3yz2Uugg4sSg2KW4EeXKpeQUa4uQGAhFkN6+iXgGxs6gZ7hxY4BxE7t
	qvrw4JW60XuWvPhU1VTFz9Jwih/zdohW/kYRm4Eg/iLFBUfI70OuAFJOMZieFTfY
	zb4ZssZxLWYLGXHJs/ytoh0sbCB9yVqzVjJLIsbu06CIh4HA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012044.outbound.protection.outlook.com [52.101.43.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f1ewpg1fp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 18:38:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWvE05QWb5BdwULtMmYG4LhIArBzcuQnEkJtNW+9UcqKY2Sdy3htvrSaXXrnhMQTJq/9/l3+ldJvdaCLbKu6hKJcYCPxejnJ6DtfKB+C/CaXYMnj0CUJrxqlALHzfYjrXy3isB1bz6rUPBXRBkqwnFh59q1sRfM5kyOKra4Kaw8a70BPtRAO+bgKvFkSTCt4I5OBFaeB6kfMUzVBnFBy6fyT0e6gzTa1sjY17Ip/nD6nQjJB+pul6zJaOVLEqehR+MJ3oZlYDtN5ITtWj2dzBadegM9N+olQwX7dsgW7Pod7TD99A4fk2RBsN87EIxQKLn1EI3d9+M5OzJet18OLZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=caVWz6gJm1eO4uLT2fxWCYp0TIINhq/c8+W0eoySD5g=;
 b=Q21fNZNuOmZNH0977LOADBfh5bYacEDm2u8Q2vKCHSA/X7vsDV5fEONIJSERmTYjZxSBKyG42o3u+/3QctGajyyYWXOMP03ERihKLMYcPLkU2e5rwzUnni+75TSpvMoDk7tH6OHyYjQNJK0H+dyXCh5LEzwMnQbPrZPnDAI42bqnjJcRNSSWYgdLMM1ukLOAbvIaKm0fl1kuxpODKuzR4s2ae3Q/vRopIl18Eb7taOEx2Gwm0fpU1b0LQaqrnFBbCS5809DMnpgAeDz230EFAdJ8JAeg9i1alXARkTA5iYmSIyoiCXIRyCl7yGXjZ8C37fC2Xp6fHG5FrBhZTTZ16A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 PH7PR11MB7642.namprd11.prod.outlook.com (2603:10b6:510:27d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.17; Fri, 26 Jun 2026 01:38:28 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 01:38:28 +0000
Content-Type: multipart/alternative;
 boundary="------------cdEZGM1DFZf5NT8ju0nUvADx"
Message-ID: <b08b8b71-c4c9-4a5e-99ad-ce7391bf46da@windriver.com>
Date: Thu, 25 Jun 2026 20:38:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] python3: skiptest tracemalloc_track_race
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
References: <20260624223336.1254487-1-kris.gavvala@windriver.com>
 <CAMSfU+4DoS4g1hZdLtK45fo3rmqiXXthb5kNusWjcts+S8MV9w@mail.gmail.com>
Content-Language: en-US
From: Kris Gavvala <kris.gavvala@windriver.com>
In-Reply-To: <CAMSfU+4DoS4g1hZdLtK45fo3rmqiXXthb5kNusWjcts+S8MV9w@mail.gmail.com>
X-ClientProxiedBy: VIUP296CA0045.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34b::17) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|PH7PR11MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: b018cbef-86ea-4356-9839-08ded3239f5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|4022899009|376014|52116014|22082099003|18002099003|6133799003|8096899003|13003099007|11063799006|4143699003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	H3rcbA5zOfniQTwkV108902fYR+WM/hWW379IQlcqw51zhwv00yNi88aXSjEd23joe9iZ5obSeEjtjdI3VB1nG14xFstxCSLIcSXskDNjkGNDDLLntSAcvL7cXMmdUz/HmB/jyLg1RuaPkvNRQtH+Da+fDwWlXDptXxlxxdrkSqaU3R2x0kBltov27a/l+k3Pas2EZ8g8adk2jRdgiP+Q4/OnyZK9D632ZtmaLLtzUZ2hfGj1hS3G04hq8ZvN1NMWJV59Pb54p4+2yZs7OhF49rEm3/yfxCee770CdjtDI8KkGvuAK5whpcHQqNEiI+PatU52OtWd62crKjyyL+jt7vXfMBWnUrOIDx+gkQjHd1VcJQuvdCwxy1rHebj7WEgAyPF/tdMUyGFyJkFH5lpBRh+tJPT2tMuFf0PJJ+yALS8b7QDERjKj75sw0GBTwLTaa1I/yN6ofhqDfhQRl355SbMoCDih6hOL9O/3oKcFQwOfr1L1kVmjHV7NUXJloLPpEBURP9V8+8yErK1JFdtDN+LCPUpFnSGOUVB+Pq94p+1eZYIjSE6EQzYCB52Mxju6c6HccLbEg2/ht3yM0hOl2sAxZ/bJUkX1Ao18eCX4gNXw6hLD35aoazRMpBx6SkjjzY82om46i2WcVvG+svExBuLf99aj2RlU+8AaNwmLug=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(4022899009)(376014)(52116014)(22082099003)(18002099003)(6133799003)(8096899003)(13003099007)(11063799006)(4143699003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bi91aUIxWkJGSU9XWEc5WWJhT1dBWGN2TDE4TVhrUzc0ZFpIVVBlV3JxdUtz?=
 =?utf-8?B?VUQ1dTl2SDc0YTJVMGJ6eFJ2a0RYaTJIa0hnVjIyNEpNZ2ZwZ1J2aEVuSEZ0?=
 =?utf-8?B?Ly9zZlVuRVBIdWNkeVVIclFEY3dhN1BYVHZPM2k5eUIwejRCTU9WWWdFc0VE?=
 =?utf-8?B?d1I1a3RqTitDYlFhWVExZWs1ZkI3SzdhZUZhcmh3bXY5ZzFEYTlwNFpoWDl1?=
 =?utf-8?B?M1QvZnYyYk9zL0RvVyswem5lWnFacXhUbDllaFI5VWlDM1ZlNUdlcjkvb01k?=
 =?utf-8?B?dWZ4UTJpQ1o2MzNoYnNtTlpXeGhNM3dHSE9IMTBBbkZaUVY3eFF1dGsyZ05i?=
 =?utf-8?B?NkJ2YmlJbDBlQ3J0VU5uMUsvSHJXUFM5dE96ckJEUk9aQjdXMGZYc3MzMjdB?=
 =?utf-8?B?Vm9oRlZ4VmVEeHpWaVZ4RGh0UVc1ZEF6ZmdzVEEvZWtnTEZySUVqcGI5VUhx?=
 =?utf-8?B?WjFHc2hhUDJLY0RkV3ZNMUtxZmxEOVNJOHBHQTlvZkZDZ1cxakpFRWFnTjEw?=
 =?utf-8?B?Y1BBNkMwMmNEbTRsWFFjcHRCWjJZbGhZNjFIK0x3UVBhSmg4aURMcFVUWUR0?=
 =?utf-8?B?VFdoaHRibUI1S0I5MEhLaDNZTDhhbjRiS3N4SEFQb1N6WkNTV0o4clhveHpi?=
 =?utf-8?B?bjcvWlhvVWNjQVFMQVBoTTBwS2M1NGxEU1dKLzdnYW1TU1dKZnRBMi9Feldn?=
 =?utf-8?B?M2VqR2pLV2w3ZjdLQVB2OXRTeFBpRVE0TVdVcVFPWDdmNkZOUG1yOEdoY3dZ?=
 =?utf-8?B?Mms4M3VyWVJPTDUyTFc1TlVMcjYyZHlyWVdhdVc5bjJKVHFqZkdlTW5IQWVl?=
 =?utf-8?B?OExNZHVDRVkwUWJoV2V0TnFUYTdnR2MvSmhBbmdwa0M2NjhZdUxuN2dmN2JE?=
 =?utf-8?B?MmpFZnpUajdjSjA0WDVuRTR5RmhKeWlxeFNiNkNJZXdtVFNLSjJyNllHbkpu?=
 =?utf-8?B?U0QzaTM2amhEUDJBQ3MxZVhJSnNBWGhHcXBCbWkwa24zZGhXZSt5NmxnR0hZ?=
 =?utf-8?B?TzN5bERGQmhTVEpsUTViR25vZ1k3akljS21mYkVPd0dZd3o5dUNZa3JFS1Ju?=
 =?utf-8?B?VkZNOGVTTHNtazhWZmNlejJtMkpBWXNKejBFVm9mdGh6T2laUEF4dk5KbmJ2?=
 =?utf-8?B?azBtNGJiWlZwWFZWcHhQZk9ORE5oSjM1SE1zbGZjeUlUZHFrRHhIR0RvY082?=
 =?utf-8?B?cUhhN2k4eEpsdzJmb3Y5NCt1WXljcXFSeXV4bzBJZC9mOGFveDM0NFhwYldS?=
 =?utf-8?B?MGE5VlFIZjdmUUZqS29jR0RDcHVsTXB1VXV2V2hQSlNWNXhjaUNsUEF2VnN6?=
 =?utf-8?B?OEFRcks3NHl0TXVMVjBaU1pUMy9BVnlhQlhnYmF1dVl0aGRKL0UzZDNBM3lY?=
 =?utf-8?B?Vk9wd2xNQnVZV2taZnVwWXpNU0VPRkFsM1greURkeXBhYWxWLzhINlA2MjdU?=
 =?utf-8?B?cXpLRGZzRU05emxicG5KS3JMNjlBenpnSnBFVWpiOFROSmR5aVh0UlF3SE1i?=
 =?utf-8?B?MldJaTlXQ3R4QzR4dUFFOEltenREdFNhZnozckllOHB3a1djWDMxTTFTZ2ZI?=
 =?utf-8?B?Y3k5SVJScVNGdHgvYW84OGQrQngwcXZlRWhsTGVIZXkvRmlxQysrbkhYdXBL?=
 =?utf-8?B?eTBqNExrdkFodVFCekpwWExKc3A0NWljTWFDeXVkM1czWHhRTWNzaGJhQ25K?=
 =?utf-8?B?ek51bzhwU0lHZTNUNitId1FUV21sQXlBSDdZZlhDQVlDSUhjQjRqeXRmR2VN?=
 =?utf-8?B?bUwwV3V3RjBldG5XMzFFRnBOL1Z4cmVFNEpad013MFVMM2FZUGJNZXRDaW5X?=
 =?utf-8?B?ako3RWZ2M3NiNDFQVVRuMkd2cXpzQ0R1c3M5NjZ2Rnp0d3I3aXRJeWRKdFNG?=
 =?utf-8?B?eHNOb3E5T3JHV3Q1QXJYZWN0Vm1ZUnc0MUJKWXViNGFEYnRlRjZMc3N2Zjd6?=
 =?utf-8?B?aitJNVgxdDhpTzYwWXdydFh0VWpMSE0xQVFSUUV2eGhwbk00NEhXVjNJbVFH?=
 =?utf-8?B?V01GQ1NiRWdWUE84UkV1am1Ga2F1UUVhRUJvYk9VK2Q3V2dYZUIyQUlXbzlu?=
 =?utf-8?B?SnZxdGhPOVl2dm5uNVlNYkJpOWFkY2p4NksybDdUdW1uKzlLVFhoanRINUdN?=
 =?utf-8?B?ZG1hb2htMW1VMXZ3Y2VOdHdBOTVjUmhZYXRrcENydGx6YlpHNkxtVzNrcmpO?=
 =?utf-8?B?cnhYcUttR3FvaXIzem9HcStxcW5HSHJxUUJleTVvZUN1NDQxQVlrbE9Fd0VX?=
 =?utf-8?B?OXVDYXhzT2FVN0hiMEdNc2VSM2t4YWpMdC9kTHFSN29EMUNxY0duL3puT0J5?=
 =?utf-8?B?Vzk1RCtiMDBBeUcwU0ZYcVVhbTVzcVNSeVFERXVsTWF4ZnNGWThOZFgxVHVD?=
 =?utf-8?Q?nKnLdzIqmz3cm7p0=3D?=
X-Exchange-RoutingPolicyChecked: 
	kMMKKSZKaDyKcQA0f2IfUbhnPazuB9NlINkEYLzwunhQLrTsdCZZC5tY1oBNIXEWIYv9FBorfGiTj1B0DiS1pWvDOXtJgdRQp/CZPRqYKgu9jZLPQ8kbPBxXVUCCRDB0CKIJuputRQJgwL+Y3kEyBGHxO35862BgO2zqasYhnnXdIMpvfjyQS9rxTIvAzu0PI5C4VgkqOmfm1ZPSdhs19Y5h0nCHKsePQSW8auWDc+0SuRnZat/5ED8ijPknIm896cQgEZLVG+QBS0GMWSGiNN9ZrhIkKMeyDymycshqc9QZgInJbdDYb9jB1ce5bgkUV9kIf5/qrXucalkgb++eSQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b018cbef-86ea-4356-9839-08ded3239f5e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 01:38:28.5090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PlNByK3lm+2SRpfWH5HkfGuOC0ie1cPfXCjDaHb0Q9pNjaG1PlX1e3BAu22WEtkLj97H+qtt3r6F6wwQeRPp7cm/ljnvju18KoPPH0vGqBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7642
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ATgdUWSu-sQWXAR_IrpuQ8QvTCOdLKmR
X-Proofpoint-GUID: 0p0ZTdJ5R82wORw9zyeJYkvvyZRyk-So
X-Authority-Analysis: v=2.4 cv=AdSB2XXG c=1 sm=1 tr=0 ts=6a3dd816 cx=c_pps
 a=JJOFz727VvkGy7wKLfv01w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=NEAV23lmAAAA:8 a=zhH3trtjAAAA:8 a=t7CeM3EgAAAA:8 a=i4UPQfKq1Y4wHX5fFlgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=XUKDfiOwNNzw2CGhfCwA:9
 a=KoYaNpbFDByDiwEk:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=lap4kSrHH8eKdvMWMUGw:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAxMCBTYWx0ZWRfX+V8yPwh6DCas
 1DtZRS4FneujKwrs/dH7c9MVxNsRbTLRhuX3rOGrobcVxWtv3wCcfHLLuvKReq0aEQEjoDd41P5
 ToMvtfHzia3rQ8iFmHYw/U5xKKkHbfnbrackIXqPHyGOEphpZQe0L0wV75cWTViToDjvrmIBJh8
 8kEnSEKS/xpkd7+HFpJhX2qjmUL+90BTmLrKn4+BFINZx2tbmqDQ0bm4y+E90kr9nAALuTc9qUg
 JA2v0qQg6JC07f47Uqc3UD6BdOneXX5GC8qDSZhWNaVHwe3l2Hopck2Ft1V64jbedHUE4dXgLlU
 7ALm9wkFOhuLsKDCbWwONplfNu5PBPXMKdOZ6GUImbqQRxcQABkFmbh9c6+6TYap6rti/3oJYV8
 nxjyu5pzF9pot7X+L6W8YXY6xdd2N8GDA6oDNAxnz2/PP8m8/uF8pra0hYkLQYgvYdFlCXPSQzB
 86MwYjaG0mIEHePFbTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAxMCBTYWx0ZWRfX/4gTnb4POP5h
 VGL7PaQxxd0QWZ/Bq8c8pEKbFgySkvWgdlhw4lsoumWJBmE15JKRT6JoodpOp1OnMMEWLHQhsIj
 QoEVJGCcHB3ji4xZwucsay/jjY+tI4agt+tT4/gn7gxzNLwwXGRw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 01:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239591

--------------cdEZGM1DFZf5NT8ju0nUvADx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65Q1J6No2568160

Hi Yoann,

Yes, my mistake. I will send a v2 mentioning that its for wrynose.

Thanks,

Kris Gavvala

On 6/25/26 2:18 AM, Yoann Congal via lists.openembedded.org wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> Le=C2=A0jeu. 25 juin 2026 =C3=A0=C2=A000:35, Gavvala, Kris via lists.op=
enembedded.org=20
> <http://lists.openembedded.org>=20
> <Kris.Gavvala=3Dwindriver.com@lists.openembedded.org> a =C3=A9crit=C2=A0=
:
>
>     In python3 ptests for whinlatter, tracemalloc_track_race fails
>     with a segfault.
>     To avoid ptest failures for now, skip test_tracemalloc_track_race
>     in ptests if using glibc or musl.
>     Making the change on master to backport to whinlatter.
>
>
> Hello,
>
> I think you meant "wrynose" instead of whinlatter (which is EOL).
>
> Thanks!
>
>
>     Fixes [YOCTO #16182]
>     Upstream Issue: https://github.com/python/cpython/issues/143143
>
>     Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
>     ---
>     =C2=A0meta/recipes-devtools/python/python3_3.14.6.bb
>     <http://python3_3.14.6.bb> | 8 ++++++++
>     =C2=A01 file changed, 8 insertions(+)
>
>     diff --git a/meta/recipes-devtools/python/python3_3.14.6.bb
>     <http://python3_3.14.6.bb>
>     b/meta/recipes-devtools/python/python3_3.14.6.bb
>     <http://python3_3.14.6.bb>
>     index 291bde70f6..0fd1831b86 100644
>     --- a/meta/recipes-devtools/python/python3_3.14.6.bb
>     <http://python3_3.14.6.bb>
>     +++ b/meta/recipes-devtools/python/python3_3.14.6.bb
>     <http://python3_3.14.6.bb>
>     @@ -320,6 +320,14 @@ SKIPPED_TESTS:append:libc-musl =3D " \
>     =C2=A0 =C2=A0 =C2=A0--ignore
>     test.test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym \
>     =C2=A0"
>
>     +# Fails due to potential race condition so remove it for glibc
>     and musl
>     +# Bugzilla YP 16182 (test_tracemalloc)
>     +SKIPPED_TESTS:append:libc-glibc =3D " \
>     +=C2=A0 =C2=A0 --ignore
>     test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race \
>     +"
>     +SKIPPED_TESTS:append:libc-musl =3D " \
>     +=C2=A0 =C2=A0 --ignore
>     test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race \
>     +"
>
>     =C2=A0do_install_ptest:append () {
>     =C2=A0 =C2=A0 =C2=A0sed -i -e
>     "s|SKIPPED_TESTS=3D|SKIPPED_TESTS=3D\"${SKIPPED_TESTS}\"|"
>     ${D}${PTEST_PATH}/run-ptest
>     --=20
>     2.49.0
>
>
>
>
>
>
> --=20
> Yoann Congal
> Smile ECS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239546):https://lists.openembedded.org/g/openembedd=
ed-core/message/239546
> Mute This Topic:https://lists.openembedded.org/mt/119965939/10383205
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [K=
ris.Gavvala@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------cdEZGM1DFZf5NT8ju0nUvADx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65Q1J6No2568160

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    Hi Yoann,
    <p>Yes, my mistake. I will send a v2 mentioning that its for
      wrynose.<br>
    </p>
    <p>Thanks,</p>
    <p>Kris Gavvala</p>
    <div class=3D"moz-cite-prefix">On 6/25/26 2:18 AM, Yoann Congal via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMSfU+4DoS4g1hZdLtK45fo3rmqiXX=
thb5kNusWjcts+S8MV9w@mail.gmail.com">
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
            <div dir=3D"ltr" class=3D"gmail_attr">Le&nbsp;jeu. 25 juin 20=
26
              =C3=A0&nbsp;00:35, Gavvala, Kris via
              <a href=3D"http://lists.openembedded.org" moz-do-not-send=3D=
"true">lists.openembedded.org</a>
              &lt;Kris.Gavvala=3D<a href=3D"mailto:windriver.com@lists.op=
enembedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
windriver.com@lists.openembedded.org</a>&gt;
              a =C3=A9crit&nbsp;:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              In python3 ptests for whinlatter, tracemalloc_track_race
              fails with a segfault.<br>
              To avoid ptest failures for now, skip
              test_tracemalloc_track_race in ptests if using glibc or
              musl.<br>
              Making the change on master to backport to whinlatter.<br>
            </blockquote>
            <div><br>
            </div>
            <div>Hello,</div>
            <div><br>
            </div>
            <div>I think you meant &quot;wrynose&quot; instead of whinlat=
ter
              (which is EOL).</div>
            <div><br>
            </div>
            <div>Thanks!</div>
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <br>
              Fixes [YOCTO #16182]<br>
              Upstream Issue: <a href=3D"https://github.com/python/cpytho=
n/issues/143143" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"=
true" class=3D"moz-txt-link-freetext">
                https://github.com/python/cpython/issues/143143</a><br>
              <br>
              Signed-off-by: Kris Gavvala &lt;<a href=3D"mailto:kris.gavv=
ala@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"mo=
z-txt-link-freetext">kris.gavvala@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;meta/recipes-devtools/python/<a href=3D"http://python=
3_3.14.6.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">python3_3.14.6.bb</a>
              | 8 ++++++++<br>
              &nbsp;1 file changed, 8 insertions(+)<br>
              <br>
              diff --git a/meta/recipes-devtools/python/<a href=3D"http:/=
/python3_3.14.6.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">python3_3.14.6.bb</a>
              b/meta/recipes-devtools/python/<a href=3D"http://python3_3.=
14.6.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">py=
thon3_3.14.6.bb</a><br>
              index 291bde70f6..0fd1831b86 100644<br>
              --- a/meta/recipes-devtools/python/<a href=3D"http://python=
3_3.14.6.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">python3_3.14.6.bb</a><br>
              +++ b/meta/recipes-devtools/python/<a href=3D"http://python=
3_3.14.6.bb" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">python3_3.14.6.bb</a><br>
              @@ -320,6 +320,14 @@ SKIPPED_<a class=3D"moz-txt-link-freet=
ext" href=3D"TESTS:append:libc-musl">TESTS:append:libc-musl</a> =3D &quot=
; \<br>
              &nbsp; &nbsp; &nbsp;--ignore
              test.test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym
              \<br>
              &nbsp;&quot;<br>
              <br>
              +# Fails due to potential race condition so remove it for
              glibc and musl<br>
              +# Bugzilla YP 16182 (test_tracemalloc)<br>
              +SKIPPED_<a class=3D"moz-txt-link-freetext" href=3D"TESTS:a=
ppend:libc-glibc">TESTS:append:libc-glibc</a> =3D &quot; \<br>
              +&nbsp; &nbsp; --ignore
              test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race
              \<br>
              +&quot;<br>
              +SKIPPED_<a class=3D"moz-txt-link-freetext" href=3D"TESTS:a=
ppend:libc-musl">TESTS:append:libc-musl</a> =3D &quot; \<br>
              +&nbsp; &nbsp; --ignore
              test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race
              \<br>
              +&quot;<br>
              <br>
              &nbsp;do_install_<a class=3D"moz-txt-link-freetext" href=3D=
"ptest:append">ptest:append</a> () {<br>
              &nbsp; &nbsp; &nbsp;sed -i -e
              &quot;s|SKIPPED_TESTS=3D|SKIPPED_TESTS=3D\&quot;${SKIPPED_T=
ESTS}\&quot;|&quot;
              ${D}${PTEST_PATH}/run-ptest<br>
              -- <br>
              2.49.0<br>
              <br>
              <br>
              <br>
              <br>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <br>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">
            <div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal=
</font>
              <div><font face=3D"Raleway, regular">Smile ECS</font></div>
            </div>
          </div>
        </div>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#239546): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/239546">https:/=
/lists.openembedded.org/g/openembedded-core/message/239546</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/119965939/10383205">https://lists.openembedded.org/m=
t/119965939/10383205</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:Kris.Gavvala@windriver.com">Kris.Gavvala@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------cdEZGM1DFZf5NT8ju0nUvADx--

