Return-Path: <daniel.dragomir@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CA7D3F074
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 14:36:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14323.1769610967089974105
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 06:36:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=pi09Rd8T;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6488b4f5f7=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SB1mAg3275623
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 06:36:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=7KI8CQQqfDbPtP2B5vZp8iZCRQ0ZYjd+76vmxRG/T9I=; b=pi09Rd8TA+Dn
	vD+T2Mhr4csjldQuHSFeLzakoAOi6l74Ps7vScFPiDlwAEE28Ab9OCQD5ozRA7KQ
	9nzMyaCjKWf5LWdWam4TJRiVJbAu+OlvMnv5OBG1/JBZxTOw+WdPatObwvnPAqRN
	NaDcPUSIYVL14xeI+gt9QTf8ZoQM0/IqhVE5uxIZ34HymHk8LiwDq4LB40J+ZUwe
	CtQMbklJki6dxmKRG08r9+/HYre75UbMlbor0m8YpxTIp9NrLLV+5cyhSmQEFzuI
	VJfIn3GX9XVpk98zItaSsbauIDTAAm2YMnD9N4+H3M7GrmEqzyizZvRXRb9y4Bm0
	gtIWlG+sgg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010032.outbound.protection.outlook.com [40.93.198.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvxfm4x5r-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 06:36:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZM4AJIdTeDyc3ti8ZU+wRU01pD2B6OUzMHJ5bStI4LHmpnGc9gTtOjoIi49ThSdF26m1GWPpcW7Joy1vTATkWANKjZWtKaB4faZLfpTnMkAo0G/R5z3MnJ6WtVUjMbjJmO/yDQxwYpl62A6dyA0I5KJSTXVqZbJLaZ5pkMzlcli6a48xi7BYXHzH343P4Cq6+c5L+PUD9yGoSFv89mt31XLWg6ursHTLPoqaGZKd9xinNDUNidK2OK4M8fKlo5JSEnA+4Yh6rtIoh4Xrus2YP3kmIwDBQyzhdWOnL5DjbPhRaw1jXEhu8JI+sWdIGulZWfy/5pyWipHCZUBp810pxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KI8CQQqfDbPtP2B5vZp8iZCRQ0ZYjd+76vmxRG/T9I=;
 b=yXc1YA07I7K4VpvBcg0HMUupSLMwhFgsxKgvbANlR5oF39ws1Es4VOfPSw4/6oa7zutQee+KmtPOBqP/HShzgtmzuNiuAvxmpMpYETdQ52QQNh+eTrkcvogrBWB/jY5aydh7aDBEXi2P7aEOLuFacktPorgivkdsgcYROwT5hJ43U/zyPVAdipVEbpRiLOkXx6T5QF9H6/aHM4zgjVI8NNGPe+dzBWo3WgNvb7orGuX76NvMcwIzk/ES0BNTLUZr/y23L1snWOyCaMRr4yPHmFXRshn4lTorUI0CcRD2jOOiAN68F2Pfwp01luJHRL/5y93pFghR9UeZC3KPTw+6zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB7968.namprd11.prod.outlook.com (2603:10b6:510:25f::14)
 by DM4PR11MB6406.namprd11.prod.outlook.com (2603:10b6:8:8b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 14:36:05 +0000
Received: from PH8PR11MB7968.namprd11.prod.outlook.com
 ([fe80::bd3a:5dfd:4a5b:223f]) by PH8PR11MB7968.namprd11.prod.outlook.com
 ([fe80::bd3a:5dfd:4a5b:223f%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 14:36:05 +0000
From: Daniel Dragomir <daniel.dragomir@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] oeqa/selftest/wic: test recursive dir copy on ext partitions
Date: Wed, 28 Jan 2026 16:35:47 +0200
Message-Id: <20260128143547.1239286-2-daniel.dragomir@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260128143547.1239286-1-daniel.dragomir@windriver.com>
References: <20260128143547.1239286-1-daniel.dragomir@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: VI1PR06CA0185.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::42) To PH8PR11MB7968.namprd11.prod.outlook.com
 (2603:10b6:510:25f::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB7968:EE_|DM4PR11MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c47a83b-ab89-4669-39be-08de5e7a9144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UmxjN05VTUpZQlpTWW1OWjZaNTJjRC9mc1ZMOVIrWG9DQ2hHSE9zZ2pPelJB?=
 =?utf-8?B?WXhST2dDM0Racjc0RE9IUlpzV2dOOG0rKytRQXVIU3QxOXhQMnFJYzBOTFRn?=
 =?utf-8?B?UFBrN3JzbmhYNnA2dmJGYWpMZFpJKzFlQmllVXZrVWc4T1JqRDNCb2NOMEM1?=
 =?utf-8?B?SUFoditLa29ySnlBeUxxMTBJQXhwSUNiUm5pdUNWQUxySDByZExWYXBFa1A1?=
 =?utf-8?B?SHNRTENkdU1uQmdvYnM2Y3JMS2pIT3pyU2h6QmNaOVh2WEVFcFlKQ2M0cUk2?=
 =?utf-8?B?UkxFNG93Nm1KS0NJdFZPcVlZQ0lweFpkVVhlK2RPMFRZc0s2TzM1UEZXNWc3?=
 =?utf-8?B?M3BXbzk3RFFheDFDMkM5WUovQmlkSVJYSlV3aDh0alZQamk0L2Y3ME1SQ2NQ?=
 =?utf-8?B?YzlJd2dkZHJGVzF3dTd6TUs3RWg3RUovMXpKNm9kQzF4SURkTFNzaUt6eGpm?=
 =?utf-8?B?eFhwMTluc1ZxYmdqTndvQnhpVUg4OUh4QzBkdXpVa3AwRFdBV3Zxd2phRVpu?=
 =?utf-8?B?TVZwam1ONkVHd3NtUTh2Q2YrWTc0cmNYd1RLOVh5RGdLREpvMmRlWU4yVTI0?=
 =?utf-8?B?UkFJRk5ObzdubjVpQXkxRTBRejJGU2RMVDg1aGJqNFpNclRpOE11OGZnaGF1?=
 =?utf-8?B?WWl3NS93NWRqZFp3MmsrZDdiU0l1d2N6SlVFMHRySFhYVEZFZWU5Rm1xSGx0?=
 =?utf-8?B?RXhIYktsNjJXOEp5dFo5Rm5nUDNvWVZFWTZtd3htc1hWWWpqN2VkYXkranVn?=
 =?utf-8?B?MUV1QXpLeGpaQkFxRzR6Uk5mUllEYlFaaFg1Q0oreHFmTm0xeGpGV052d3Yy?=
 =?utf-8?B?WUI2VDBldXhGODAzSStyTlVwNklKbmpseEdVN3huTThudU9Wb3FzZzlOd1Jl?=
 =?utf-8?B?bWpwSGJqZXIxZmc3TUxBM1VBaE5iOUJBdnpONVdjMWFSM0tnOEZPeWJSMHgv?=
 =?utf-8?B?clBjcTdPVmNTUmpFVWRPSEFOcGxQR0Y1RXFKcUU5Q3lGZzArcHdGTFM5K2Qv?=
 =?utf-8?B?UTJjTHlQSWtVT2x0d0d4ZHZvcDM2Mlo2WFdVQ2FzL3FDd3JuVkwzMWdkWFpF?=
 =?utf-8?B?QWcxUnZoNmNsS1h1eXhpRTBWa3hUMDVXMEcwM1I1TmIyMlFreWVheWxrSGg5?=
 =?utf-8?B?NEY4L0wvWFh1dzV4YjA5a2NYQjZxQkRWLzMxR2FmeTJDMTJONEZIanJJV0FH?=
 =?utf-8?B?TWEvMHBUNzk0VjVTR09LNEhRdzhNY1Y2WlZvZitTQ2VmazA0S0xHVHJhUzIy?=
 =?utf-8?B?ZE1HT1NZVUpVR1JqU3VNUmh0c1k5MGpPS3FOYjhHTDdyYU5DRS8rS1FoVFMz?=
 =?utf-8?B?UkpCV00xand2cllmeXlCMFNoeWM0R3pBV0lXSGFjbGF1VFRoYlJIbTRaaWRI?=
 =?utf-8?B?aDhLZDBrWEs2bThWWS8vaFdqc3hhMXlOaGMzRE9NRnJ4ek5lUURldUJmS2w1?=
 =?utf-8?B?WjA0d1F2cFpJRHZBU2Jwd0orRTZxNnN2ejVuOWdwVk1FZmZHenV4QTl3N1hJ?=
 =?utf-8?B?NGNrYW52dmdoRk5nS2w1c05ncllhNnNSWHRVSDlnaEpQdUhnMVZDcHkvaUF6?=
 =?utf-8?B?TWRvVXc1RSswZFRHN0pzbUlTa05DM0hzemJBc0tTK3dXZGxoVnEvYWhCTExJ?=
 =?utf-8?B?VTBMdlNMQjJoY1pNWXlaWTk1U0xlTURzSlEwQ3EwbDdsOUV5TVpMejZMVWFE?=
 =?utf-8?B?elZObGtzcmk3QjBxVGRmc1hlcEhRUzVKY01hTEhhYnVSUkFQTXhQSkp0V25i?=
 =?utf-8?B?ZXZaeFUyK3dhV2ZMN0srOFJMTXhSMGNZTnZwdGpZK3VNVFZCRWhPbm9TWFNn?=
 =?utf-8?B?dkd6eitwRE0yNlJkUmFFUjhTeE5XY1dFdUZqREFjZEZ2YlVHTGVoUVQybmFv?=
 =?utf-8?B?bWdTd3BjMUJsbTFkZjlrNFh5ZG5xcGNyb0k0UDlXZnkvZ1RiLy8zL1JhcmlH?=
 =?utf-8?B?TkZKY1dwMnVEL2krTHdwTXh4YjFuRHd3eWxxeThyYVkzYkZCdHhDMGptczJC?=
 =?utf-8?B?RUIxSGFzWC9FbHdUbTBLbzVHNGM3dnVxV0UvWHloTTN4aDNKVVBPQU5SRWZn?=
 =?utf-8?B?dE9Hd1F2YVc0OGg1L2hmRWFSSlB3UnV6S3JFOHhXWXlJR1FUNCtBUmFQeWZa?=
 =?utf-8?B?RFE5QjIydkp4MUlmb0dtaDBrNXpSM2EyQS9XcE04SmlvZW1zK3YxYlRnTDVF?=
 =?utf-8?Q?b2Ydfcdh90FmtxEUaRFnHOk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB7968.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MlI3ZGhkNzNNQklwNjVpbHZvVThjZ2JzOVRhQzdtbUcrcjlXT24rQWlPN2tD?=
 =?utf-8?B?VXNwUm9kYkFkV1drTFdzZkE1U2ZxbWtScDFCaWtnOFMrdE5oblBUNnk5YW1X?=
 =?utf-8?B?MEl5cmpkNzJmR3ZvUXpLOEJSTWN0MytpbzExSGExSXhOL2ttQnBzdkYzU1lz?=
 =?utf-8?B?WnhPL09lN3Q0UFVyRGF3M0grc094M2NUd3FZTHMvdmh3V2RhMzdSTUFRZVhy?=
 =?utf-8?B?L0Vhb0x2SndvN2duZlJPcy9LLzNpOUhtZmhEcGdXUENDU21veVVBb2gzTjRo?=
 =?utf-8?B?R01hNnYwYmgrMFFCRXNzV05jZWs4Tm5CNjZpY1BNdGQ4R3VDRVZkTVBjUG5s?=
 =?utf-8?B?QmJZQTFiRUJDZ2tnK3I2TEY5cVRiMXpvT3JGOGMxR0dKM0dYeVh2bVZ4cXZF?=
 =?utf-8?B?WG9lQ3grcE9PZTIwVW9NQjRwMDdpNzY4U1pKOHdqbDlSNEZKZXhjaCtsdGRo?=
 =?utf-8?B?R0g1SkJXZlB2bkZCVGJQTDMzQncwL21yWVpEdks3V2tteHd0d2YyazRDMUJr?=
 =?utf-8?B?QmdDam9COTV4VGJBNFlHbWtGZmZ3TWtqczRFczJpcklRVE9USjdLYkNQd0FG?=
 =?utf-8?B?S21WaldseTZYamY2bjUwYnlvY1hXckw1NVc4QjVuQkI4aWFQNEhmcFRocUZM?=
 =?utf-8?B?MFFBMytIaTRkWXB3Z1p4Mm4vT01aYVVEeGpmVUhqQVowbXYxRlpiQ2NLb3J1?=
 =?utf-8?B?enZOakpRWGFQaXE5bnNsSUxXTjdtMUhHN1lYSTdmTmMzcTJpaUVMSjVFUnNm?=
 =?utf-8?B?eTNGUjJ3ZnJlb1dEY1kwTVdwdEFhaHR2MmJNVjFjWjhBZlIyV2xmUWFNQldP?=
 =?utf-8?B?OHdwSk9WM09vKy8rdGZmV1B4bUdBa2pDbmh1c0JIRCtGYWxpeDRPcTdJNS8r?=
 =?utf-8?B?VWlaaE9BM1JpenBCcEY4MG05dG0vN2tYYitxaVBvNDQ5TEZhaXZzRVNIM0Mr?=
 =?utf-8?B?amg2U085bFBlZEFmOVpqamc1aG9OZDZIZS9DOUlyOVVvUnBEemttc3o3dzdk?=
 =?utf-8?B?NXRSYnErckN1aGhLekx3RjdjMUJJVGVRMmpxQ1F2Yk5jS1VWa29mMFJRWGRl?=
 =?utf-8?B?VHBibVE2dlZEYlY4aURpWUJrTzkvbFcyU2Q1WkpHUURnR1VCK2pwU0ozZnI3?=
 =?utf-8?B?c3gyODZ5Z3kvYWRtYmRQT2pNWXFHRlR1SnFvZ1RCU0Q0TnlXM0FicUtpNCtJ?=
 =?utf-8?B?N1Q4WHg5ZjBOa2NGQjQ3cDJ6NjNYK1p3ZVVleGl4bEMyWXAycEMxckxyaTFz?=
 =?utf-8?B?QzhQZ3dEb0IzYUN2Yk51SU9MdFNIWGtoZVVwOWhwdnc1YTZBQk9WRmhFV2Va?=
 =?utf-8?B?aWJOQVJCNSs3VXlLWEluY2VxUkRMY01sSHNPT0E5NjVPUjBGeDI1dllBYWlN?=
 =?utf-8?B?MjBVS2l4YklvSkx0NklHdzY4L2YrU1RmV2ZFNEJJMDI0Wk1vWGVaNVBuQ2dG?=
 =?utf-8?B?T003bXpRQ0tyVjBTSGxiQmtrUWJMNkpqVmJQMHk5d3FNSm1GQ1BQVzBRWDhB?=
 =?utf-8?B?VDQ3b2hwT21mejBmSU5ET29yM053S2FvREtEVEVLQUtUYTNwQ0xpcTA4WkVV?=
 =?utf-8?B?cXBiUkZGQTRZS3dwL2h5SHA0NmhsT3VKNXZ4Z0VGTlU5RllQU0pORnY0NDBa?=
 =?utf-8?B?Q1NrQTc5Rmk0NFlJcitSdnU4VjBOdm9pRmp0MC9HSE04Mk1QVURLOHorVy9P?=
 =?utf-8?B?N0t2Q0JoOFpXQ3ZLdWZBSFRTOWVDQVp3Ums3aUU1anRiNEg4cndJc25NcUFC?=
 =?utf-8?B?aVY3NEgvWEJkN094SjJpaXNZVTdMWTJXbldIRnRmVFJ6SnBxSzAzdFgvYkQw?=
 =?utf-8?B?U2EwaXFzSXBiYk5iejk4eUg3bEZUMVJ2c2l0QkIrUjFoV0lmMUI5d2cvV0R5?=
 =?utf-8?B?OEJRZEV5ZytqSFNVdzNQYm0wbCtlVFlSUlZxRHJLUXd1aXZKK1BYQWs2alhY?=
 =?utf-8?B?N2JpMVMrZ1FSMlljNHp6S2MrRlNoZFlqRjgzQWVTWVRVd0tvOFJFdko2aTll?=
 =?utf-8?B?aVdrdWlxblZiWEhaQ2JWaGFCL3U5Z0twWkszTWpxeld4eVp0bFZCSEJFSGZ5?=
 =?utf-8?B?SVpNREwvd29iMXRHeFZRS1BPYVlJSTRRbHZyNHF3dy9GcmVrVkFJK05XdzhY?=
 =?utf-8?B?SVJtN3c5VUJjNm9rR3dsZk14K1R5dW5xMkY3MVREY0tyN1ovVzNlL3dOOVBG?=
 =?utf-8?B?WlZkMTFpdktudmtVeklZNUtab0lJKzF6TENCRS9Ed3VvSjBieE9nSEl4cG81?=
 =?utf-8?B?T2VIVnJENUFRNGMyWEJHZ2NBL1JtVFYwNVF0VHQvSlpKQWN3L0I2MTB4VDF3?=
 =?utf-8?B?OGFvQmxXZFlxaWprSDg4MVJJeFV0VlFjd2tHU1UvUk5GRHN1NERJWnR1a3R6?=
 =?utf-8?Q?4ZIkbk/IjF9KGkZ8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c47a83b-ab89-4669-39be-08de5e7a9144
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB7968.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:36:05.1137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRP0RgSwMfZ0FVI8ahEcz8aVhyfe3wXhdGp0gppXSRvzeXkgqEF2VRg/gWvGKhLJxdQUPsSHAvV+7IdlrQnKiab4cfmIqIQXxVrLfUgwwkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6406
X-Proofpoint-ORIG-GUID: JlqvffWLyRRA2GAdinQyuBfE8jTzEjq-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDExOCBTYWx0ZWRfX3fkKekPre2A1
 3SzcbspNbK2/kgsAGuUh5KWopnwSLsCM9K8/3si9eQRVaLZehNYJOG+KFIZulM47En/RwwIw8HB
 iWOGiZyCAT0cXMH82ZMft3a2PuUmK48TuGAiPbg+/78zMy6TcUEsq8XoSOo3uPf1eJa4Uy+NAMA
 rqjVxqQyFeehIlmHjTOGfHnIjIreteEJdkfoCmMM/81B90W8EOUZ7+Uzh4JHrmn+gj1id9GWmDW
 TJMQ1V1E4naaXRNsON7ekFMcPQQtVH7k6cQdf5w8gNw7nz4qwhOZYrs1A/b4/GWXvGnG62yX2h5
 UuGzFpdtRfKEXhVbknTdD6pAgEoJaB1QojrmOMSyHx+XSBYpq8LBuKkdkoIoAAIDEDbZLyHK8aE
 H7rtFGQWGuEhRF3UZll3ujn52TclgO4SCcEu1ZX+cez5BbUDwm4DzZ2sQ8+DJtvI5NbjbC1O0XX
 MXAuD6/3tEIKtM+7muQ==
X-Authority-Analysis: v=2.4 cv=Lo+fC3dc c=1 sm=1 tr=0 ts=697a1ed6 cx=c_pps
 a=A8yAwjBYovhlCeyetBcGtw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8
 a=AoXOhhOut3wUavBMMSwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: JlqvffWLyRRA2GAdinQyuBfE8jTzEjq-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280118
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60SB1mAg3275623
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 14:36:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230098

From: "Dragomir, Daniel" <daniel.dragomir@windriver.com>

Extend the wic selftests to cover recursive directory copying
into ext partitions.

Previously, copying a directory into an ext partition could
appear to succeed, but attempting to access the directory
contents would fail with:

  -l: Ext2 inode is not a directory

This was fixed in commit 4fc3b42774 ("wic/engine: fix copying
directories into wic image with ext* partition").

This test now verifies that directories copied with "wic cp"
into an ext4 partition:
  - are created with correct inode types
  - can be listed recursively with "wic ls"
  - preserve files and subdirectories
  - can be copied back out of the image without data loss

A simple directory structure is used in this test:

wic-test-cp-ext-dir/
=E2=94=9C=E2=94=80=E2=94=80 topfile.txt
=E2=94=94=E2=94=80=E2=94=80 subdir/
    =E2=94=94=E2=94=80=E2=94=80 subfile.txt

Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 65 +++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
index b616759209..1ba180ff0e 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -12,6 +12,7 @@ import os
 import sys
 import unittest
 import hashlib
+import filecmp
=20
 from glob import glob
 from shutil import rmtree, copy
@@ -1662,6 +1663,70 @@ class ModifyTests(WicTestCase):
             runCmd("wic cp %s:2/etc/fstab %s -n %s" % (images[0], testfi=
le.name, sysroot))
             self.assertTrue(os.stat(testfile.name).st_size > 0, msg=3D"F=
ilesize not as expected %s" % os.stat(testfile.name).st_size)
=20
+            # prepare directory structure
+            testdir =3D os.path.join(self.resultdir, "wic-test-cp-ext-di=
r")
+            testsubdir =3D os.path.join(testdir, "subdir")
+            os.makedirs(testsubdir)
+
+            # add a file in the top-level of the directory
+            src_file =3D os.path.join(testdir, "topfile.txt")
+            with open(src_file, "w") as f:
+                f.write("top-level\n")
+
+            # add file in the subdir
+            src_subfile =3D os.path.join(testsubdir, "subfile.txt")
+            with open(src_subfile, "w") as f:
+                f.write("sub-level\n")
+
+            # copy directory to the partition root
+            runCmd("wic cp %s %s:2/ -n %s" % (testdir, images[0], sysroo=
t))
+            basedir =3D os.path.basename(testdir)
+
+            # check if directory is there at partition root
+            result =3D runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot=
))
+            root_entries =3D set(line.split()[-1] for line in result.out=
put.split('\n') if line)
+            self.assertIn(basedir, root_entries, msg=3D"Expected directo=
ry not present at root: %s" % root_entries)
+
+            # list INSIDE the copied directory
+            result =3D runCmd("wic ls %s:2/%s/ -n %s" % (images[0], base=
dir, sysroot))
+            self.assertEqual(0, result.status,
+                             msg=3D"wic ls inside copied directory faile=
d. Output:\n%s" % result.output)
+            self.assertNotIn("Ext2 inode is not a directory", result.out=
put,
+                             msg=3D"Regression detected (inode not a dir=
ectory). Output:\n%s" % result.output)
+
+            inside_entries =3D set(line.split()[-1] for line in result.o=
utput.split('\n') if line)
+            self.assertTrue(set(["subdir", "topfile.txt"]).issubset(insi=
de_entries),
+                            msg=3D"Expected entries missing inside dir: =
%s" % inside_entries)
+
+            # list inside the subdir
+            result =3D runCmd("wic ls %s:2/%s/subdir/ -n %s" % (images[0=
], basedir, sysroot))
+            self.assertEqual(0, result.status,
+                             msg=3D"wic ls inside copied subdir failed. =
Output:\n%s" % result.output)
+            self.assertNotIn("Ext2 inode is not a directory", result.out=
put,
+                             msg=3D"Regression detected (inode not a dir=
ectory). Output:\n%s" % result.output)
+
+            sub_entries =3D set(line.split()[-1] for line in result.outp=
ut.split('\n') if line)
+            self.assertIn("subfile.txt", sub_entries, msg=3D"Expected fi=
le missing in subdir: %s" % sub_entries)
+
+            # copy directory from the partition and compare with origina=
l
+            outparent =3D os.path.join(self.resultdir, "wic-test-cp-ext-=
out")
+            os.makedirs(outparent)
+            runCmd("wic cp %s:2/%s %s -n %s" % (images[0], basedir, outp=
arent, sysroot))
+
+            copied_dir =3D os.path.join(outparent, basedir)
+            self.assertTrue(os.path.isdir(copied_dir), msg=3D"Copied-bac=
k directory not created: %s" % copied_dir)
+
+            copied_file =3D os.path.join(copied_dir, "topfile.txt")
+            copied_subfile =3D os.path.join(copied_dir, "subdir", "subfi=
le.txt")
+
+            self.assertTrue(os.path.isfile(copied_file), msg=3D"Missing =
copied-back file: %s" % copied_file)
+            self.assertTrue(os.path.isfile(copied_subfile), msg=3D"Missi=
ng copied-back subfile: %s" % copied_subfile)
+
+            self.assertTrue(filecmp.cmp(src_file, copied_file, shallow=3D=
False),
+                            msg=3D"topfile.txt differs after round-trip =
copy")
+            self.assertTrue(filecmp.cmp(src_subfile, copied_subfile, sha=
llow=3DFalse),
+                            msg=3D"subfile.txt differs after round-trip =
copy")
+
=20
     def test_wic_rm_ext(self):
         """Test removing files from the ext partition."""
--=20
2.25.1


