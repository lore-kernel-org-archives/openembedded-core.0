Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74092CAC5B0
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 01:05:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6585.1758848706977706616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 18:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pBqksZ5n;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364979e65=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q0QSYg1207085
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 01:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=tRrB2ISuhBEs23Vm+HJsNDgmvEQWUOMYqqR1OYZB+p8=; b=
	pBqksZ5nsnaTg3mHRTVdVjWu9ZpqZy651SY6U8MZ7Sj64hzGow+3TdHx+uQntYr1
	gzZQRJWTx7r2y2+JyRITC0E+4p21iSszrXBw1XZuFD2k1VBdmjRJSea062XyDmpQ
	YMMshUzw2PbEVg+EQiWX2aydgq1ogDKdwiGeKEUJx/VFWt6KRhLff4rRXlDmeGOR
	OCjUltmP9y13jC7nu6fb1Rtq6oFP3MNX8ygNX/7lJfU7X3M3LFku2kBwwg/S4Eid
	1+3iCcdJpltLLFglKlQJi55lslV+nerA2bw2Xq/9h/023JWE9iav87StjR9nlSdp
	kLjFlUmZQXWl4NRwDe3dJg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013027.outbound.protection.outlook.com [40.107.201.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsm88me-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Sep 2025 01:05:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEtVLIMcqS5iyLtmKfZHgRiX3YXwsqutETpT10dRir/tpH3Z+4dyj4ng3mgc3NNDC9xBUsq4V/pXxPZxk7r6LRWZg3iMhcznaNizx/LCRbYR3kqK7ThyIrl3hFlaqtNIxr/4m+bueiikE+N5vwE1L+CNlQNHB7z0/WuWpjKP5KCyNyFM3/xYJ4+uY7NELz4whhGg+5dGNgv/UwOZmDnCg1PFeXBo2+PnWuGg4jOmppNm2TlJle33USpZAoMVF1swBg/NOONYB+fQ+gOkOXiKT6W1F1IN4EEFvjJndIEE4iS6DaXCxFD0hIJ7ZzdAilCRDUVLSGgg2JIli2ZFRGYBAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRrB2ISuhBEs23Vm+HJsNDgmvEQWUOMYqqR1OYZB+p8=;
 b=cYaH77dVlPT/QyXCEmkSygzXhjiH80zzQIzFtpGgyRNTWZxu7UDGrg5ec682HJNYSvAHkiSfO+a02oEvd5woPW40gT3SaqR3ajeIkv+XVqgyuUj4/USYpMiKgd9EYVGx5lN8aRN3fafREmMa6BDQ1V0B5ftTosyfUXCRCDAOJZVvBa0L5bkJ9NzEhC7KdutC0HS/9nXn0mZZ8RoTAU9icy4LgaHX/x2diuBAIcakDhnGqJ1G2zCFjn//MXN8c7boRVK7cv8hhXZ6cRossp8RnSpvNqChGYjwlMiyWkcxI9SaUorkGOlMGogIhzGYklW/SWdkiXwu5mUhieAJM9hKMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by IA1PR11MB7271.namprd11.prod.outlook.com (2603:10b6:208:429::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 01:05:03 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.9137.018; Fri, 26 Sep 2025
 01:05:02 +0000
Message-ID: <f238b771-5b28-4244-9907-ceb29dd80fef@windriver.com>
Date: Fri, 26 Sep 2025 09:04:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 9/9] debug_build: defer inherit bblcass
 debug_build when DEBUG_BUILD is true
To: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org,
        peter.kjellerstedt@axis.com
Cc: mathieu.dubois-briand@bootlin.com
References: <18669FECD58FB457.22280@lists.openembedded.org>
 <18678856A5E59549.12551@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <18678856A5E59549.12551@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR0401CA0013.apcprd04.prod.outlook.com
 (2603:1096:820:f::18) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|IA1PR11MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a716b35-e0db-4488-928e-08ddfc98b8f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bVluQWdCekUvTlFhRDlmaEIwak5QRC9EelBNMFQydHJ5T2ZCYlN2U0ZjT1NL?=
 =?utf-8?B?OUVrdFh4dzVaQ1VaUXpUQ3J4YjF3NjZVQ3NXT0JBSTRyUmRPRXdLK3F0U1o4?=
 =?utf-8?B?LzJnVjUyaW94S3N0RFd4dXJSQmpvd0o2em5rUG1nN0hGRHFYbXptWlJ0R2M2?=
 =?utf-8?B?LzBwV2dERkJsajFnRUF3UEJIbThiRlVMWmJrRUNya2hxc3h4SWgxNUNjMzc3?=
 =?utf-8?B?R1k0L1NWU3lIR0I5c0cxancrWEhSL2lBc2s5Z3hnZTBuYnJmRUNlNkg0dDFl?=
 =?utf-8?B?aXU0WkhnNTkyakdPVlBqQkIzS2E5SGZhWWZFY0xDUUpoUkY1S1FtOEhjYTF4?=
 =?utf-8?B?Z0JpUFEvUlZsQks2M1p6VFBpNlBDUUpoeURwNS9XZjlNcUd4OVp4VjJ0WkZM?=
 =?utf-8?B?NzFkajRWTDVSNHc0R2I2L1FESHphVzhUUjlRVWpqWmdLWkUwMFh4MVdwZ2pt?=
 =?utf-8?B?ODFjUElOK0MzbVVqV2dFYURDN0ZYekpZUHhyOG1XbXM0UWRncFY2M1hNbVVQ?=
 =?utf-8?B?UnN5S3ZHNUNRaDlVeHludkZyZnpqbnZuclA1dVJVN0tqL3VPVzArR3N0eW9G?=
 =?utf-8?B?RTdBNkxGR1hUZzRrRUkwNkdEMzdzVTZoVWlxT2NtYmRnUVdtbHQ0V3lONk4r?=
 =?utf-8?B?WFdhS1FvUjRFMGo1d25ROWMwOTh4bzZ0S2pxamdEM1Z4ai9NM0FnU2Y2TDJS?=
 =?utf-8?B?ZlpLeG1NcXQxdmg4Wmh0WFlOY1N1SkJ1cjd1d3E3NTlFUHFTUU5jQjQ5bTZZ?=
 =?utf-8?B?cmcwdFVYTVZJa1Zzc2doSTlnMHNQK0F1bWtEWVNBZzh1VTZLQ2F2cUE0d0ZX?=
 =?utf-8?B?dUZhc2hXTTVVdFUyWEVnM2t5YmJpWHUxUk5XaDA1VHgrNDh2ZjhlVm1UMUpC?=
 =?utf-8?B?WUkvcUhIS3o4NGVIQUFoM2NNd1Y1RC9GbkRCOW5TbkdRRXF3R0F6RTUrVEE0?=
 =?utf-8?B?d0V6c0JxOVdTeFJ1QUw2RU1oemsrMDZLQWNSVTEvQkxTbkhWZmRhTXlSQ0dN?=
 =?utf-8?B?M1VwMXhOLzVrYVNGNUhHMWVIVzNrbVQ2UHpSOXlINlFSN1Z5VjVTL0M0Y3NK?=
 =?utf-8?B?VUJWazZVS0JCQ1BMTjhYRTdteGQxVVN3dFlDa2VQYTJUOU8xVUpzM1I4WGFX?=
 =?utf-8?B?S3dPREdDbnpVZHRVT09UNTdtckxwd01GcXRENFRFSTh2UmFWWTdzVUpDVFZB?=
 =?utf-8?B?TE9XWTdZdjBjUGxEdkpSbHZ2cStxbzJwaUw3NVdYV2cyVVlUTTRTTk9UaDg3?=
 =?utf-8?B?TGZqU1lGUEd3NkEzY1R5aGFzb3N4a25WRkVrL09yaTN4U1JjZHdSWDNYN3Nv?=
 =?utf-8?B?RUQyNXljV1IvT3NnRHR2T2F3bnBLak1VbUVzSVVpN2hYRk5RcXZDZ3B1dnk2?=
 =?utf-8?B?aHViTVBYbWlkMmJlV2tETy93SEJ1dUM4QWh0cWxWVjAyV2lORm9vdUR3SWJj?=
 =?utf-8?B?cEpwZlJicU1QYVBDNXhQWXNTNkFPTUVHeGtzcVpRaWRxclBhS052L2dha1Rp?=
 =?utf-8?B?RFJjUVRWSVBVZ3JEUXRXR0Fkc2xleGxOMkpPSEt4YlkwRG1sTkpleUZyWnpn?=
 =?utf-8?B?a042Y2VWaHJiSWdzQmJZSVdJN0xhRExxMVY2VTR2UVNFYnRveW1sbktxWmtC?=
 =?utf-8?B?RUFHcmRLVE9WWWpSTEdFVHJzTG40QjRhNVJkMCtCNlE3YXVHY0xYcjRlcWR3?=
 =?utf-8?B?NkFKMGQvNG0zU1VGUzN3UzhML2s2d0p0SmZ5QXJnS3BFYklzcEE1TDVhTXBN?=
 =?utf-8?B?ZFprYTFQaVJOZTRBaW5vRTJ2MHNXNmM3RndFQ3dqTTN6L0VPaHBlcFJOQmFH?=
 =?utf-8?B?Y1BiWWI5L3FLUktmME53QU9xQnJYeXhzaUZjeHVJQU5Lak5zeUI4dDB4czZa?=
 =?utf-8?B?T2ZpSFgzT2g1RE1teFZKVWJReVowRVAycldVQUx3MGlwamx3TW8yQjNWaHRw?=
 =?utf-8?Q?xYZ0i37k44Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bCtqSzZJVUVkeGRPY21BZXR0alNVbW1TaHhjMDdyWmlENkJJWGJsQUROOUI4?=
 =?utf-8?B?d0MzaW5FWHdHaEFDME1JWWRYK0Y1cWJqdWFnRWxYNVY4R0xoSi9zRTJFT1BZ?=
 =?utf-8?B?Z200eFlFdmlCU2IzWG13dHpwZk9LRENYZ05DNTJORmtXSXNQL1lPV3N5cExW?=
 =?utf-8?B?bFlwd2pFci9aV0w5c0NtcUFOeE8zNmxNNUdtUURmV3BrL2xkS2FRanRiTXcw?=
 =?utf-8?B?aTN1dHFSUEd2QXljbW8zTWRMS25CWlM3MFo0NVRDeHJmSHF5d3ByY28xVm9B?=
 =?utf-8?B?ZGc2UVlHM25JY2pxUVgrT0d5QVJCaWtVRVpxbUU0Z3J6L040Z3NkV09oQlhp?=
 =?utf-8?B?NnJIam11S2J1b0RDcHVKejVsaVYyaUQvNHJlc3VjVUczb1VsRVZDbVlKb3hI?=
 =?utf-8?B?dW4ybW5yNFBsVmtpeDVkUFBkcDNxSWQxZGcvdXZ2RDBYMHF0WHg2cWtWSFpI?=
 =?utf-8?B?T2N3c0xqNTk4bVZJaE14SWFjMVpMeWF1ZDRtdDRxU0RIWWQvczFxOWxWSnYy?=
 =?utf-8?B?Vlo2UEVReW9rbXBmcStwOGZ2Qy9EWlFqa25tK1NGTzRHS1p4RlJYUDhRbGtm?=
 =?utf-8?B?NlRjeXArVnRBUUhJQjhwMENFK3RmUkQ3UjgzK3R0UklBd2V3TTNJYXRIZGxl?=
 =?utf-8?B?N0pHVFlJVHBkNjBpeUtndzZzQjBwdFhja2F3L2hqQ0IxdmVmdElMcWNIWGFu?=
 =?utf-8?B?ekVuNXczdXJtdTRSc3RBRG5MQjZPTm5MMU80ZUJxSGJPRHl2bnNpSmg4b1ow?=
 =?utf-8?B?emdPbGtPNHVBaVNKMy9CbE5ZclNKdmJybm5yZVFqM21pMkZPQjFxTUVuckhj?=
 =?utf-8?B?Q0pjZGltaVBCYXpnbHNxZ1lLYmxweGZQb0tqSDRwNXpkTGI5ejliMzhmeUxn?=
 =?utf-8?B?RVV6UWtRVlRaYmVzYUJ2RFBHZmt0b3ZIcVhrZ2RZZThhbHZ6TXJ4bmVJZElC?=
 =?utf-8?B?RU0zZkdLaXF3V25qdFBQaEc5c05Fakc3R2tJUllxdXNmU3I1UkZWMTFlOGV1?=
 =?utf-8?B?UElwS0lLYkFETzZBUDBCNStGTXpIQkxWNS94UzJ2Zy9sRW9LTGxxcTdycGtt?=
 =?utf-8?B?T3pXYUlBU21rODV1V3p3VFdWTlJVb3FGUjlldFVTdnVHejRRV2NLMjMxQ3lx?=
 =?utf-8?B?RVgySi80Z2E0ajlWT1UyRVBobjczN0JEL0hwRitEN1hxdFZFeTcxanVWYVlO?=
 =?utf-8?B?ZWp3cEcydWRkb051ZWphbE44b3pCRHRyY3FvaDE2NjFEN0lDdy82dzhxdElw?=
 =?utf-8?B?SzUvYnNiMmRNcmNnMENtTjFsdzVHc0JzVks3QkhkUlRvRGJVeFZrSit2c1VR?=
 =?utf-8?B?M3liNzF0T2thVVA3N2tWVTAyMlFGNlI2a1JBQWtKVG1pR1l0WVNMNGlsZEZ6?=
 =?utf-8?B?Mk5McjJKK01jb1lJZWkvbUFaR0dQcHcvemIxbThXV3h6Q1kvT0YrdVM2a1Nw?=
 =?utf-8?B?UVprMUVXNXgvS3dWM3A1M1ZiOU1iTWtqdEVrR0x2dUN2ay9KY3hqNlY4RlZK?=
 =?utf-8?B?YXd5KzFYMWMwNzBFbzJyeXBCU3d3K0RLMlE2ODBMaUc0aW5rRHBLd2UwNWEx?=
 =?utf-8?B?RDFjWGVBMVl1ZS9KQmxYN2hWWkFIbEZPSlgybW85SVBubm1JZzVqQW8wVTVC?=
 =?utf-8?B?a0hzWi94RFptandjSGZnWmducnZ2RzlmMis4Y1BvWjBlMlRFL3kvaDQzT0I5?=
 =?utf-8?B?OU8rN0hrWStMOWl5TTZGYlVSUjdtTWlIVkc5S3gyS20rVTdwaVJXQ2M2U295?=
 =?utf-8?B?VVpGcGpGRFVpSlg3dkIxZHYya0tQNnRWWGMwTmtzb3loU0ZITjVoT1hNVUsw?=
 =?utf-8?B?Q2Vyb2w0M0kxbFh1cnh1NEtBSkZSbUJqT3NXMUhoZVJUTHI2SHJQbzZad2Q2?=
 =?utf-8?B?Mk8wa2Q3eS9BUXVDVWpWM25hTWh2L3FTeDhKNVlJODdDOVNGN0dCalJ6MStk?=
 =?utf-8?B?cFFTV2FtQzBJbFVDZFJ5QTlFN2FCSFJNT2gvZXJIT1ZhSXhTWUdxNHJkM3Nh?=
 =?utf-8?B?ZndDdGd4b0JOMUFkVlBIWmM1VjAzc3NjenhLTGV3UVFrOExpNHQyNDRaR0Vp?=
 =?utf-8?B?K3E4MjJWWjFsTVpYaGl3alc1bmk1ZTVsMnF6S0N0S05Zd0kvRjdIVitqY2JE?=
 =?utf-8?B?andmZm82TmhGN0ZHODYrbmxaMzBoNmkyOFZTMzN0bERkZit2aEFKekxjdzFu?=
 =?utf-8?B?NGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a716b35-e0db-4488-928e-08ddfc98b8f1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 01:05:02.8636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JodDceEYqibyBvanBcJneFZHmb/w+OjnETlXhbeu8WjttbWOC23bnMu8E+xkW/4s3mhg+MJ+UidarMDfYDRkrMeb4PGeCZxbh2DnCN8V5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7271
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: CwBHSq7haqH1RkyHR-d5IX1tY2aHAybr
X-Authority-Analysis: v=2.4 cv=TJhIilla c=1 sm=1 tr=0 ts=68d5e6c1 cx=c_pps
 a=KTU/bV3Cu5xqMUx6SKv27w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8
 a=3-RhneuVAAAA:8 a=t7CeM3EgAAAA:8 a=72QHHWibSIsWSUD1MlYA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=VLVLkjT_5ZicWzSuYqSo:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: n4VTB2hBj1DAgrOtT8gohJQX6bbkwGZi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDAwNyBTYWx0ZWRfX+MaMJopQxdsx
 kpqC26KzkaEP7Ys3VbgbP/7uz3mH3bIxtDugD0qV4Pgi3mlNgrXSUF8DKUbbTp6YQxt+od5QTxs
 yGQjrxrrO8voIkp/Y8FFILpHhYHyHNEjFmwmggFl+HC85tsWUQDTnJDVDzKKxW9zuHIgKp7xZVY
 8Pelw0GdU9r/loU7Tqw8v+n06xwMqWOs1ua8BUpYIQ+S1WUfuTSv30VI+YrKDDX3roUAdbAp6p0
 wv1VhUWib6GNLYwEbTJ0xficoZA+KS3apCqWFgPoCCD4vOYiQyzExK56e8mZ2JVFA5whkAT6WBZ
 I4TE/cYNOCxlx2vp3D3yJy7sRc6CbokqPqRvZH7w1qXyZZYYVt/qfc6jrOKaQ4Aq5rmIVFqVXiA
 s3f1Nt+TzCgzgRV+yGTez8i3boFYOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 01:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224050

Hi Mathieu,

Ping, or should I resend the whole series?

//Hongxu

On 9/22/25 14:54, hongxu via lists.openembedded.org wrote:
> While setting DEBUG_BUILD = "1" in local.conf, the debug build is
> enabled globally. For the recipe (such as qemu) which doesn't work
> without optimization, we have to set DEBUG_BUILD = "0" in the recipe.
> In this situation, conf/distro/include/debug_build.inc is included,
> although set DEBUG_BUILD = "0" in qemu recipe, the debug build is still
> enabled for qemu and break qemu build.
>
> This commit defer inherit bblcass debug_build when DEBUG_BUILD is true,
> then include_all so that debug_build.inc is only included if DEBUG_BUILD
> is actually set for a given recip
>
> Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/classes-global/base.bbclass        | 3 +++
>   meta/classes-recipe/debug_build.bbclass | 8 ++++++++
>   meta/conf/bitbake.conf                  | 2 --
>   3 files changed, 11 insertions(+), 2 deletions(-)
>   create mode 100644 meta/classes-recipe/debug_build.bbclass
>
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
> index 6de17d1bb5..0f4398e26f 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -35,6 +35,9 @@ TOOLCHAIN_NATIVE ??= "${PREFERRED_TOOLCHAIN_NATIVE}"
>   inherit_defer toolchain/${TOOLCHAIN_NATIVE}-native
>   inherit_defer toolchain/${TOOLCHAIN}
>   
> +DEBUG_BUILD ??= "0"
> +inherit_defer ${@oe.utils.vartrue('DEBUG_BUILD', 'debug_build', '', d)}
> +
>   def lsb_distro_identifier(d):
>       adjust = d.getVar('LSB_DISTRO_ADJUST')
>       adjust_func = None
> diff --git a/meta/classes-recipe/debug_build.bbclass b/meta/classes-recipe/debug_build.bbclass
> new file mode 100644
> index 0000000000..a917e9cbc9
> --- /dev/null
> +++ b/meta/classes-recipe/debug_build.bbclass
> @@ -0,0 +1,8 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +# Allow other layers to add their own debug build configurations
> +include_all conf/distro/include/debug_build.inc
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index f9818d2a06..93fd57548d 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -830,8 +830,6 @@ include conf/licenses.conf
>   require conf/sanity.conf
>   include conf/bblock.conf
>   
> -# Allow other layers to add their own debug build configurations
> -include_all ${@oe.utils.vartrue('DEBUG_BUILD', 'conf/distro/include/debug_build.inc', '', d)}
>   
>   ##################################################################
>   # Weak variables (usually to retain backwards compatibility)
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223806): https://lists.openembedded.org/g/openembedded-core/message/223806
> Mute This Topic: https://lists.openembedded.org/mt/115371609/3617049
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [hongxu.jia@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


