Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5051CCCA471
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:45:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5916.1759992300184527528
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=A/f8nSu0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2377c47664=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5994kxgI242609
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Oct 2025 06:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=HhvQnNlugDIjO+0wawQFg4
	DksAAXAxU+ul0w7gfudy0=; b=A/f8nSu0/SAZHjouh//aq6tbfzyRpR9XtKcWGk
	UxXAwUHBRREiegS5gx9fVxvpGtBUXrgh6XkidCHjZXLrzBL1STbjVKY52AloMMqU
	7i4naajhSgs9IuIES2y/NzEdvHrjNWx/chw7CGkXE9DFFxLy1xXw0jlU1ZHdfh+5
	l/sKSSlUWS21VRfbIV6H+5ZTxQDcdZGmZHSv6bln8HRQ8UOM6OL96sp5wF3lHloG
	mn1braAgCUBbqeouUxQrsMmABHHhKd2y/mXKkrBf7F4g6TRQ6Ot2oAaDfvvB0voA
	43lKAv6f3h0WDCoAWowtkJS4Fa2UJZf84aHAGvcQY/eesnBQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011047.outbound.protection.outlook.com [52.101.52.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49nx2yrehh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 06:44:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enkCoX3pDP6gtzvn+vd5USqAERqBL7WGZlHOItB1OSDbigMHpGVWbXXzevvQqvUDRdyk207gCQgUcMSKauPPETSNf3nUhZTxACUCJ+sLOZn258W2dnYARjwETWbMnIUV5MT951s8zcgJojfwl/iFz9Cl3rnXkALL+kpfu/Id3UMKnBSacA9nUknctndi75xPvzKLS6qnzQ3Ku+XiwvsoFYe0SEak8gGKPNmKajMQuhmIege+4/+6LA1PFYjuYzI7UV0tRKYbQnrtTYT+BNkWzZGHGWGnPv9gtcJbSnz7apT0uMMMIX9T0nYDFmnN++zXswv8FhOyajI0Ud8xe/QHfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhvQnNlugDIjO+0wawQFg4DksAAXAxU+ul0w7gfudy0=;
 b=t1GQZB70PkccdSbLFu9OOEUOqMFNmvUfNZcRv8BlbDyBoBRoV+aSuCH5d0+uvFOWYGv7p7PrDpitNJjTimZl+a4MJql1b2ptG7JZBv5tOr/yi0Fv+3QW5DMasVQdFZ0NhIj0FArlQc3MTyP9K5JpxTW69McTK0v4M6oUmTOGpgvYT5J8V6nxDgGTGxE3NS+tCi17B/cB2G0Jj8C9PwpUO/gkRtg6IGjPh4WUD1wofZgBVXPrEY/HFvlWWZ8wDB0ln5G/A2/5t/7B2h5ZrmJsUwP12YzGcxf/7B0U9QqGVnmAc8Zf7gYvKQkGCezERUgu5yaPFeEfEbLhIjCJLbJ23Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH3PPF6E8D29981.namprd11.prod.outlook.com (2603:10b6:518:1::d2d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 9 Oct
 2025 06:44:55 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 06:44:54 +0000
Content-Type: multipart/alternative;
 boundary="------------QPK8x0O15ovn2J2hlBboVz0y"
Message-ID: <54760438-be36-471b-8634-070b767518c8@windriver.com>
Date: Thu, 9 Oct 2025 12:14:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] cargo-c: fix debug symbols containing TMPDIR
 references
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com
References: <20251008130137.2266449-1-Yash.Shinde@windriver.com>
 <CA+cAker8MWe6PCE9VfoWs=9CqnkGxzuAa2OA+3wpkEHh+BYJ+A@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CA+cAker8MWe6PCE9VfoWs=9CqnkGxzuAa2OA+3wpkEHh+BYJ+A@mail.gmail.com>
X-ClientProxiedBy: MA5PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::6) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH3PPF6E8D29981:EE_
X-MS-Office365-Filtering-Correlation-Id: e8a90871-c7d1-4e73-73a3-08de06ff5aee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MC9LWmo0N2w1Z2ZHbmJxSnVsa3ZLb1V3Skl4UzBibnRDbjYyRUZhWHRjazRR?=
 =?utf-8?B?eGdCUWJIMUVEMGpNM21Za0VzeW5ya2xrM0dhblluQ0tmZ3c2TE5aWElPdWVQ?=
 =?utf-8?B?QlhhWFNrZi81d1BmRVRrTHFEQm9lMnRrelJxT21DOUJ5ZDhJTVFWYzBvTXE0?=
 =?utf-8?B?Nyt1eWs1ZnpwZVAzTHJUajZIMUZNZDYwbXNJOFJVb2ZNZTQrWnpveFRXM0py?=
 =?utf-8?B?VlkxNlRZVkFsZTE0c1FIV2JjblVyY2UzbUFUMGFiWjZIcUIyaEZ2cm9pSno3?=
 =?utf-8?B?TU54VjNmLzJuR3A2bkJIRUZEYzN0NWZjTlZnU2M1YzJHVnVLYnBtV1BXZDJp?=
 =?utf-8?B?VEs4MFBpSlBDSkJyTlBwTTNSMmxpTmRBbG50SjErcG1lSE5SZXAxUjhLcXFo?=
 =?utf-8?B?a0w0OXpXT2JKaEtyNTFNVTNGQThyNzFOaERGU0ZPTklNSTRQS2pWTDY3Nnkz?=
 =?utf-8?B?d29JR0M3RjA0eCtHVGxRakpvTjZxWlIzT3lyVDVaNDZQcy81UmpEd2IrcHVQ?=
 =?utf-8?B?bDV3MkZxV1NMbWNsOU8yS0JDMzdOMW95QmRWdEh6UlE0MEFhMi9GMGR4cEs3?=
 =?utf-8?B?K3ZKb2ttWGcyUDZKeVlDQUUxb2hibWZlakFVUk83WnAzS1BTTU9OMzJOb0dw?=
 =?utf-8?B?K1U0UzRlSDJTOTA5OXp3eU5TRXJKZ1RBVVNJR1JrQXNJNEVCL0gvNVZvN2lP?=
 =?utf-8?B?dHhKR2UxeUkxaWtBRW1KQ1ZjRkFWYlh2aDFkTTJHRzNqeUtjblJ0YVU3OXFL?=
 =?utf-8?B?anllL1VWQXRZOXd3Q1I0Q0JzUitTZlJPakJwU055OGI0RjJQQ0hVd21EeVBm?=
 =?utf-8?B?VkdiZ1ZkWEFyWlE5Zm9aOTU5TEFuTG4xbjdKcWdTNXJzUXhYZDhSOERaUTNJ?=
 =?utf-8?B?dXhyTXZXbDJFWVkyUXd3amc4c2VIQWZncndUaEtWOGU2MUFmRS83RXNMZzBk?=
 =?utf-8?B?OVFNNlFOdHhSaWJ4Zzd1dUQzT3NNVkdpRk5ySC9HbmFpTVJOTmVQV21nNzE2?=
 =?utf-8?B?ZnpRTENXakZKY0hZa25OOGg0Z0NDSjJWUGgvZjZPQlNWQldEeEtyWXdsNzUw?=
 =?utf-8?B?V3FyeTFId1JtMXFXVk9CM0Zuc0JqRGdSd0dqTHJuMlkzZGNReTQ5QlVTa3V1?=
 =?utf-8?B?ejc2a2gxMURsdzQrYjlDdFpiUnBoTmFVaTQxc2tJb3puK1R1ckdHbEpCNXlC?=
 =?utf-8?B?T3ZQajhIcis4VVJabVd0eGJGR0ZLMVhzV1VpMWNXdWVURm96aDhESlFheGpQ?=
 =?utf-8?B?YVZ0M3FIaWdoMmlWWldrVDBJa1dha09BZW9oTUtJQjZMOGN6cDN4eGdZMHQ2?=
 =?utf-8?B?c2FGMjlkcEdpUjU2NE14ZVFkWmpsRXhYVnZTNWpDbkRnNEtiMkZ0cTBSQS9r?=
 =?utf-8?B?MHNOOFluVDhqTjJDMThtR2ZzUnVWVWxBQ3EyTG5ZUXdma1hpc1FvVUZTaWdR?=
 =?utf-8?B?NzhHb3J0UE5QRmVZU0hPTWQ3VVBSQkxzVTdhcVFWR2MzWTNsSkJkRHZ6Y3Jz?=
 =?utf-8?B?eE1nUStTL2tLbGkybWEva1pZQ1VqM0x0aDBYVDJ0S0N1eG8xY2tMNy80Z045?=
 =?utf-8?B?OXFPUU43MGx6V3FsOVhlU1dXd0hSZTlDUVlzYm4zTSs0WEN6UndZQmpubi9O?=
 =?utf-8?B?YW16ZzAxOW45STMvZjBtZ3A0MnpaSTlHblRaK1FHMEFTZlNCbDgxY2hOQUxO?=
 =?utf-8?B?bUVoVXg4cjF0QWNiemtWWmFWd1FocTRvWVpXVFJXdGY0b3A1TUwrSUMrSmdn?=
 =?utf-8?B?eUM5ZGF4SFBYV0txRGptTHdxSW4rYjJ6Y0hNSDVpb25hVENuakdtNmdmYlJ3?=
 =?utf-8?B?Y0xId01FVWJoRjNCdXM4VnVJRWJkbVR2ZElYYmNTeXRMUEk2VmZKY0JhVjNB?=
 =?utf-8?B?VDNveExhYldRV1V0UzhSNkR4aEp2SmoyTllBL3JUam54RWc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?elRFY2x5K01Hc1lsUnY4Y21qL1NlajJkYm1uK1hZKytuVFNUaFRVemVOTVVh?=
 =?utf-8?B?em90SmZlbndnbkphM1F4SlRXc3A5U0Z1S2hhVG1yVUd1Yk5tVEowL1FXNDFa?=
 =?utf-8?B?NHREcE10ZVMxNXRlWm0vcWo4NUJVZzFFSWI2K2NCbzRxemZIS0FPZUp0OW1a?=
 =?utf-8?B?dFh0U09yM3pLV1JjUUhCM2lxbFk4VENad0RoRngyejN6NnhlV2VHblRMUVRQ?=
 =?utf-8?B?THNSUklPRmdGYTdrbFRac1dnaGpBdGNHUGlMVXpiaUZIZmtHaThkUkxyNCs4?=
 =?utf-8?B?d0dTemFvdXlIODQ0RDBGUTdrQ2tMQkRJWTJ5NmVMZnBCdlFuS01iN2hoK3o2?=
 =?utf-8?B?Mit5TTdyV2JMVVB6YUpxalJxblFSaVg0aHBVemVWZFlHbEFtNituRStmYnVp?=
 =?utf-8?B?RjRFUlZOUFZJUnpXbnJlOUc1ZU9BV2Y4QjJoODR1VWFySHdiRmVVZEpQYzJ5?=
 =?utf-8?B?RldpUXh0dUxXNTlIN1ZhMG54TTFNWnlKdkIxNXljR2dlaEhSQXZreGYyOVc2?=
 =?utf-8?B?QVlHcDRaV2oycTAwRWFzMWtxM2REZ2YzZ1pCMlMwWU1xYnY1Um1tR2cyamVj?=
 =?utf-8?B?ZUpTQlJteDhDMXM1Y014WUdhSmpRMzZCRXNQOHhsWmhBYTFhLytCL0xuaERW?=
 =?utf-8?B?d3BYU3hGSXhPaGlJWU5LYVM3VGtvR2RITXc4SWpud3RGVE16Nms1MnBYMkFU?=
 =?utf-8?B?bzd0elIvRWVUNlNVUXB4a0VjbjIyTlp3S05remZvZk0vcWsyc1JoWlZYZndn?=
 =?utf-8?B?Z3JudWRxTStSVm4rVnpSMUE3OENQZHV1WEswbG5INFZPbUw2cnAxN2xsWmhv?=
 =?utf-8?B?TDlNY0pIU3VEQkQyNTRsWmEzbitZZGtES1gzY3NSN3ZPTVgwWmZnVk1xdkxU?=
 =?utf-8?B?N3JIeDJUN2VrVXVPMzEzWnJQTGhEVUpVd0cwME9ZQlR5OHRkUG0vZFlzbFlo?=
 =?utf-8?B?b3RaVlZLZWFUS1ZmbEhKaFZaUXpPckRNTFhrQWpGTGxSN2poYW1XQ3VKTkVp?=
 =?utf-8?B?TFM0YXo5RWRmOHhpUVovdnNjTEhwY2JCclJHMjdJUE1wN2krMDRpNmYwUGxK?=
 =?utf-8?B?Q0UybVpnQ2kreVBiU09Cd2hUQUhTemIvby9wUmNIN0oyV3pab1ZFTXcxdCtE?=
 =?utf-8?B?UjlwZit4TTZ5Sm14L3ZhbzdjbDNIajR2NWMxTHNQT1R4QzFkVjNUZlBoM1V4?=
 =?utf-8?B?SklvdnZXTjZuWlkxbXlXb1B4Rk9uN0RpNmZPSDZkWnowMnZtb2hvb3NFRjdx?=
 =?utf-8?B?MEYwQ1M4MjMrZEdVYVJPclRPUml1SE1oZThsSUtDMi9sVzd5b2UrckF6SnpV?=
 =?utf-8?B?dDZYOHhwT00vWEJSSjhMR3dpMkFtZ0w3azU4azBSVDlTckZKdjUrZlRPK2tr?=
 =?utf-8?B?aHYrdEtPNXRDUTAvM2paRkJCNTAxTk5nenY2K25udTZmNzhiTDVlb3N4VDZ4?=
 =?utf-8?B?cXpLNzBDdDZPRkExTENtWk9iNkRFS3hJSmxhUVA0QllHeElXWWhuWkxIR2xV?=
 =?utf-8?B?TnJ5UjFNZEQ4VGhxWHFzd0VFcjNnMWlkTTROMU91T0J0ZkNyRkNSV2U2M2Jx?=
 =?utf-8?B?M3BHUEMwa0ttZ2xvT1VyTHV2T2VSSys0UGJaR2ZKa1ErSy8vdzRYejg2c2ZH?=
 =?utf-8?B?U0gvemszVVZtOHhqQnVYMmc3cDBvTkFDMVFvS3VlVk12bmhSbXJ4ZW1obUZB?=
 =?utf-8?B?WDU2M1IrRldpN2JjY24rcWRPTWpPcHMvSUVyY3VBd0o2aXdKeTJoOGFZaCtF?=
 =?utf-8?B?d0tQOTdmdHRibHBzTWlwT0N5ZThOdjAwVGlFMUt1L2VGckpIZGpNMkJBd1dY?=
 =?utf-8?B?ekpLVS9Nb2lPZ3NpVlRSMHR3WUJOMHplcExiL2hqUWlDcXA5ays2M09VL0ZN?=
 =?utf-8?B?VkN0MWxzYXdibTkvb2ZXV2o1OGhYdUpYSTl1cnlOYXNuM1dhWHVZZ0x6NzJm?=
 =?utf-8?B?bFRIcHFuTGtiWk5HYjB2c0orcTRoV2EvU014QlA4TjV0aytmWFZiZ2NyRDR3?=
 =?utf-8?B?YWF6UEl2RGs0ajJBM3o5VHJva2xSQVl5K0YrNm5LQ0xEbnViUzhKM2p4NnFN?=
 =?utf-8?B?eUZvYlZuRGFBUnpJSEF5Z1NXZ21PUUNkMjJoeDFvcGJTOWtzVE5jQkFSQnl1?=
 =?utf-8?B?cjExQW9TZkwvUFp4b3F3ckpEam1QU3VTeDNBelBodDVIY3hlVVBVOS82Vmtu?=
 =?utf-8?B?T2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a90871-c7d1-4e73-73a3-08de06ff5aee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 06:44:54.8856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VfI21npE9mdsmaDbBXDvsVTXccVbPU/8tyv7v2dcSQ45KQ0bvJwszrh/STT6zxU8ynuDHU2t91QZy2VSgYuiQzUL9ZzxuEXDmvW497z8MfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF6E8D29981
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Wd8BqkhX c=1 sm=1 tr=0 ts=68e759ea cx=c_pps
 a=Y50mrEwtfcpO0Uk6WJhX1Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=0zhiEtMHAAAA:8 a=OcE5tU-iAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=WrPb93XDvJTWn2QaBJ4A:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=r2KKfeo-E3OLEVh2UcAA:9 a=VEOX1oy1VpoLEdfT:21
 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=v7CeC1Rd8Ef7gCqLsajQ:22 a=qwkNQZnGtIHGNKTLT1RO:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=poXaRoVlC6wW9_mwW8W4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDAzNSBTYWx0ZWRfX/HPSI3aevb4y
 otqqDgGFWHMTlDGt58cl5Ls95zOlEUCgyCYesnlppW5cTKkhPJ0G72NCbKkGSxKRUdH/APhTTt2
 wq/HadobGUyugl/CfkvdXjjhPe+eBwXSNcCQMmWJz9n4e7tIApIgpvXoRyPPMZ3RMvzNkj09jP2
 JBqMwU/h7PZdLxqFI8XaP+FV0UneEJUa2dQ2LfpAyfEQ5JOnrUE9vvSfi6QXCwO8Vzj3MlGFK1z
 hD8wdF0cZxwK9BD1eqy42EQWH84A4uDGwiGuv3EGDjcGKyUH8IYjaGT+dsoT6WOsnNWBqZiyQkJ
 Q5PGe/6kx/ArXt9PuuYLjnNIV9bnx+KZRd7Xa2jv+yV696o58lYtBZSwodCpqt1RJQRbrE+oHUt
 0sIAKzEwBXqmvdWOH13AtjjG9hpr1g==
X-Proofpoint-GUID: C-A2ElxbElLhQtn3zJGWvuuyJL8e4ALj
X-Proofpoint-ORIG-GUID: dZr1SOC9b9cd9vi9VmqE8ax9nt1q-ksN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510090035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 06:45:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224606

--------------QPK8x0O15ovn2J2hlBboVz0y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5994kxgI242609


On 08-10-2025 23:13, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> Do you think it is cargo-c specific? Or all recipes which inherits=20
> cargo class must have that?
>
The error logs pointed out to cargo-c binaries only.

For cargo, DEBUG_PREFIX_MAP is already defined:
https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/rust/cargo_1=
.90.0.bb#n22

This remaps the rust source path i.e $RUSTSRC.
However, cargo-c uses a separate source installation directory=20
($CARGO_HOME) which isn't covered
by DEBUG_PREFIX_MAP.



Regards,
Yash
> Le mer. 8 oct. 2025, 15:01, Yash Shinde via lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO=
9cR6w0vcM-0RUYHKsb9Ca4-IUA$>=20
> <Yash.Shinde=3Dwindriver.com@lists.openembedded.org> a =C3=A9crit=C2=A0=
:
>
>     From: Yash Shinde <Yash.Shinde@windriver.com>
>
>     When building cargo-c with DEBUG mode, QA checks fail due to
>     absolute paths from the build environment (TMPDIR) being embedded i=
nto
>     the debug symbols/binaries. This causes issues such as:
>
>     =C2=A0 ERROR: do_package_qa: File /usr/bin/.debug/cargo-capi contai=
ns
>     reference to TMPDIR [buildpaths]
>     =C2=A0 ERROR: do_package_qa: File /usr/bin/.debug/cargo-cinstall
>     contains reference to TMPDIR [buildpaths]
>     =C2=A0 ERROR: do_package_qa: File /usr/bin/.debug/cargo-cbuild cont=
ains
>     reference to TMPDIR [buildpaths]
>     =C2=A0 ERROR: do_package_qa: File /usr/bin/.debug/cargo-ctest conta=
ins
>     reference to TMPDIR [buildpaths]
>
>     To fix this, pass an additional -ffile-prefix-map option to
>     DEBUG_PREFIX_MAP to
>     ensure that paths under `${CARGO_HOME}` are remapped to
>     `${TARGET_DBGSRC_DIR}`.
>     This ensures debug info is reproducible and does not leak
>     host-specific paths.
>
>     Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
>     ---
>     =C2=A0meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb
>     <https://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8EvQ=
!eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR=
6w0vcM-0RUYHKsb90kr3UWQ$>
>     | 2 ++
>     =C2=A01 file changed, 2 insertions(+)
>
>     diff --git
>     a/meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb
>     <https://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8EvQ=
!eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR=
6w0vcM-0RUYHKsb90kr3UWQ$>
>     b/meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb
>     <https://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8EvQ=
!eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR=
6w0vcM-0RUYHKsb90kr3UWQ$>
>     index fd15f02da9..5ef68e13c2 100644
>     --- a/meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb
>     <https://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8EvQ=
!eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR=
6w0vcM-0RUYHKsb90kr3UWQ$>
>     +++ b/meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb
>     <https://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8EvQ=
!eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR=
6w0vcM-0RUYHKsb90kr3UWQ$>
>     @@ -12,6 +12,8 @@ SRC_URI =3D
>     "crate://crates.io/cargo-c/${PV};name=3Dcargo-c
>     <https://urldefense.com/v3/__http://crates.io/cargo-c/$*7BPV*7D;nam=
e=3Dcargo-c__;JSU!!AjveYdw8EvQ!eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhy=
DXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-0RUYHKsb9-NilF0c$>
>     \
>     =C2=A0SRC_URI[cargo-c.sha256sum] =3D
>     "17d431789b050b0fcf678455dfd5ceb7e5b45cd806140f8fe03b16b995d6cbff"
>     =C2=A0S =3D "${CARGO_VENDORING_DIRECTORY}/cargo-c-${PV}"
>
>     +DEBUG_PREFIX_MAP +=3D
>     "-ffile-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC_DIR}"
>     +
>     =C2=A0inherit cargo cargo-update-recipe-crates pkgconfig
>
>     =C2=A0DEPENDS =3D "openssl curl"
>     --=20
>     2.49.0
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#224581):
>     https://lists.openembedded.org/g/openembedded-core/message/224581
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/224581__;!!AjveYdw8EvQ!eT6NUyxobn9jkx3pHarcK-637_es2=
YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-0RUYHKsb9Y5bg2LA$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/115653303/6213388
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1156=
53303/6213388__;!!AjveYdw8EvQ!eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyD=
Xsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-0RUYHKsb9IEGgQYE$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHcS2=
uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-0RUYHKsb9b7ysiMA$>
>     [frederic.martinsons@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--=20
Regards,
Yash Shinde

--------------QPK8x0O15ovn2J2hlBboVz0y
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5994kxgI242609

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 08-10-2025 23:13, Fr=C3=A9d=C3=A9ri=
c
      Martinsons wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CA+cAker8MWe6PCE9VfoWs=3D9CqnkG=
xzuAa2OA+3wpkEHh+BYJ+A@mail.gmail.com">
      <div>
        <div dir=3D"auto">
          <div>Do you think it is cargo-c specific? Or all recipes which
            inherits cargo class must have that?&nbsp;</div>
          <div dir=3D"auto"><br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>The error logs pointed out to cargo-c binaries only.&nbsp;</p>
    For cargo, DEBUG_PREFIX_MAP is already defined:<br>
<a class=3D"moz-txt-link-freetext" href=3D"https://git.yoctoproject.org/p=
oky/tree/meta/recipes-devtools/rust/cargo_1.90.0.bb#n22">https://git.yoct=
oproject.org/poky/tree/meta/recipes-devtools/rust/cargo_1.90.0.bb#n22</a>=
<br>
    <br>
    This remaps the rust source path i.e $RUSTSRC.<br>
    However, cargo-c uses a separate source installation directory
    ($CARGO_HOME) which isn't covered<br>
    by DEBUG_PREFIX_MAP.<br>
    <br>
    <br>
    <br>
    Regards,<br>
    Yash
    <blockquote type=3D"cite" cite=3D"mid:CA+cAker8MWe6PCE9VfoWs=3D9CqnkG=
xzuAa2OA+3wpkEHh+BYJ+A@mail.gmail.com">
      <div>
        <div dir=3D"auto">
          <div dir=3D"auto">
            <div class=3D"gmail_quote gmail_quote_container" dir=3D"auto"=
>
              <div dir=3D"ltr" class=3D"gmail_attr">Le mer. 8 oct. 2025,
                15:01, Yash Shinde via <a href=3D"https://urldefense.com/=
v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!eT6NUyxobn9jkx3pHarcK-=
637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-0RUYHKsb9Ca4-IUA=
$" moz-do-not-send=3D"true">
                  lists.openembedded.org</a> &lt;Yash.Shinde=3D<a href=3D=
"mailto:windriver.com@lists.openembedded.org" moz-do-not-send=3D"true" cl=
ass=3D"moz-txt-link-freetext">windriver.com@lists.openembedded.org</a>&gt=
;
                a =C3=A9crit&nbsp;:<br>
              </div>
              <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                From: Yash Shinde &lt;<a href=3D"mailto:Yash.Shinde@windr=
iver.com" target=3D"_blank" rel=3D"noreferrer" moz-do-not-send=3D"true" c=
lass=3D"moz-txt-link-freetext">Yash.Shinde@windriver.com</a>&gt;<br>
                <br>
                When building cargo-c with DEBUG mode, QA checks fail
                due to<br>
                absolute paths from the build environment (TMPDIR) being
                embedded into<br>
                the debug symbols/binaries. This causes issues such as:<b=
r>
                <br>
                &nbsp; ERROR: do_package_qa: File /usr/bin/.debug/cargo-c=
api
                contains reference to TMPDIR [buildpaths]<br>
                &nbsp; ERROR: do_package_qa: File
                /usr/bin/.debug/cargo-cinstall contains reference to
                TMPDIR [buildpaths]<br>
                &nbsp; ERROR: do_package_qa: File
                /usr/bin/.debug/cargo-cbuild contains reference to
                TMPDIR [buildpaths]<br>
                &nbsp; ERROR: do_package_qa: File /usr/bin/.debug/cargo-c=
test
                contains reference to TMPDIR [buildpaths]<br>
                <br>
                To fix this, pass an additional -ffile-prefix-map option
                to DEBUG_PREFIX_MAP to<br>
                ensure that paths under `${CARGO_HOME}` are remapped to
                `${TARGET_DBGSRC_DIR}`.<br>
                This ensures debug info is reproducible and does not
                leak host-specific paths.<br>
                <br>
                Signed-off-by: Yash Shinde &lt;<a href=3D"mailto:Yash.Shi=
nde@windriver.com" target=3D"_blank" rel=3D"noreferrer" moz-do-not-send=3D=
"true" class=3D"moz-txt-link-freetext">Yash.Shinde@windriver.com</a>&gt;<=
br>
                ---<br>
                &nbsp;meta/recipes-devtools/rust/cargo-c_0.10.16+<a href=3D=
"https://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8EvQ!eT6NU=
yxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM=
-0RUYHKsb90kr3UWQ$" rel=3D"noreferrer noreferrer" target=3D"_blank" moz-d=
o-not-send=3D"true">cargo-0.91.0.bb</a> | 2 ++<br>
                &nbsp;1 file changed, 2 insertions(+)<br>
                <br>
                diff --git a/meta/recipes-devtools/rust/cargo-c_0.10.16+<=
a href=3D"https://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8=
EvQ!eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO=
9cR6w0vcM-0RUYHKsb90kr3UWQ$" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk" moz-do-not-send=3D"true">cargo-0.91.0.bb</a>
                b/meta/recipes-devtools/rust/cargo-c_0.10.16+<a href=3D"h=
ttps://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8EvQ!eT6NUyx=
obn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-0=
RUYHKsb90kr3UWQ$" rel=3D"noreferrer noreferrer" target=3D"_blank" moz-do-=
not-send=3D"true">cargo-0.91.0.bb</a><br>
                index fd15f02da9..5ef68e13c2 100644<br>
                --- a/meta/recipes-devtools/rust/cargo-c_0.10.16+<a href=3D=
"https://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8EvQ!eT6NU=
yxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM=
-0RUYHKsb90kr3UWQ$" rel=3D"noreferrer noreferrer" target=3D"_blank" moz-d=
o-not-send=3D"true">cargo-0.91.0.bb</a><br>
                +++ b/meta/recipes-devtools/rust/cargo-c_0.10.16+<a href=3D=
"https://urldefense.com/v3/__http://cargo-0.91.0.bb__;!!AjveYdw8EvQ!eT6NU=
yxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM=
-0RUYHKsb90kr3UWQ$" rel=3D"noreferrer noreferrer" target=3D"_blank" moz-d=
o-not-send=3D"true">cargo-0.91.0.bb</a><br>
                @@ -12,6 +12,8 @@ SRC_URI =3D &quot;crate://<a href=3D"ht=
tps://urldefense.com/v3/__http://crates.io/cargo-c/$*7BPV*7D;name=3Dcargo=
-c__;JSU!!AjveYdw8EvQ!eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzq=
gfXyiGljcR3YtFoalO9cR6w0vcM-0RUYHKsb9-NilF0c$" rel=3D"noreferrer noreferr=
er" target=3D"_blank" moz-do-not-send=3D"true">crates.io/cargo-c/${PV};na=
me=3Dcargo-c</a>
                \<br>
                &nbsp;SRC_URI[cargo-c.sha256sum] =3D
                &quot;17d431789b050b0fcf678455dfd5ceb7e5b45cd806140f8fe03=
b16b995d6cbff&quot;<br>
                &nbsp;S =3D &quot;${CARGO_VENDORING_DIRECTORY}/cargo-c-${=
PV}&quot;<br>
                <br>
                +DEBUG_PREFIX_MAP +=3D
                &quot;-ffile-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC=
_DIR}&quot;<br>
                +<br>
                &nbsp;inherit cargo cargo-update-recipe-crates pkgconfig<=
br>
                <br>
                &nbsp;DEPENDS =3D &quot;openssl curl&quot;<br>
                -- <br>
                2.49.0<br>
                <br>
                <br>
                -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                Links: You receive all messages sent to this group.<br>
                View/Reply Online (#224581): <a href=3D"https://urldefens=
e.com/v3/__https://lists.openembedded.org/g/openembedded-core/message/224=
581__;!!AjveYdw8EvQ!eT6NUyxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgf=
XyiGljcR3YtFoalO9cR6w0vcM-0RUYHKsb9Y5bg2LA$" rel=3D"noreferrer noreferrer=
" target=3D"_blank" moz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-core/message/224581</a><br>
                Mute This Topic: <a href=3D"https://urldefense.com/v3/__h=
ttps://lists.openembedded.org/mt/115653303/6213388__;!!AjveYdw8EvQ!eT6NUy=
xobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM-=
0RUYHKsb9IEGgQYE$" rel=3D"noreferrer noreferrer" target=3D"_blank" moz-do=
-not-send=3D"true">
                  https://lists.openembedded.org/mt/115653303/6213388</a>=
<br>
                Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@=
lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer" moz-do-not-s=
end=3D"true">
                  openembedded-core+owner@lists.openembedded.org</a><br>
                Unsubscribe: <a href=3D"https://urldefense.com/v3/__https=
://lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!eT6NU=
yxobn9jkx3pHarcK-637_es2YI-QyHcS2uLhyDXsf2bIzqgfXyiGljcR3YtFoalO9cR6w0vcM=
-0RUYHKsb9b7ysiMA$" rel=3D"noreferrer noreferrer" target=3D"_blank" moz-d=
o-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"=
mailto:frederic.martinsons@gmail.com" target=3D"_blank" rel=3D"noreferrer=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">frederic.marti=
nsons@gmail.com</a>]<br>
                -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
                <br>
              </blockquote>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Regards,
Yash Shinde</pre>
  </body>
</html>

--------------QPK8x0O15ovn2J2hlBboVz0y--

