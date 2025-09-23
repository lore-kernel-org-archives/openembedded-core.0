Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5939BCAC5B1
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 13:08:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16535.1758632902018399667
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 06:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H8q2iyFd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1361e06115=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58NC7JXA3345290
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 06:08:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=NZfQPctbSW1isQLPr1Wa+I
	YQ/ofvFBHHde+t1r1BxeA=; b=H8q2iyFdaYsCv+VS6pOsbLxZOn4dzzW/Ruivv+
	KP2GFzoeFg5SlGqSv9/u5qRbAR8ELJl54ePM56FJfdd2/zctJyjvRpNrV5oA2tt1
	Ycu+6hd04AHjOkHVTSUjlICNF1U+JgUoiORqM4k745IgAcEiYfto6HVSryMZuWhe
	2K/LAEOxeKscJlCG7hD8EwL+k/xxLxiV+SBZ7a2w0ePQIsfGcayr+GjiB7wt/147
	n3QtpfNKEX+UtIJp9CdX9xee7qa2T5Vfpe85X3WuBr8GecUEjTy8s4unEC0omfQl
	GafVFnkfbCRpKdn3nw7f4ga2aS6pvJQXijdoKKqJc59rQBwA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012023.outbound.protection.outlook.com [40.93.195.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499qj2tysy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Sep 2025 06:08:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekJiXetIRV1qGajp4FxURenUyF2SJgkXe3Z9dC9iT4vddTR1hKq/flaHMCdifvF7HXaP1JSz1bEe8OgHYZW6gVVMJmDThbct7TcRyvulNjGLjU7HBVMgjtIdsga4q6do9FsFNJduLCt1pFWLqKGDck+xzmQWQjnFhP7ZqlwEtyNnm9OKk3W2tcxHLOu2CqlppY3tqnbfHZNP4JOTEvg7u1EEqsml1QYvy+xOYqAefi5oVZAo7Kg3ITTpDHnkoBMphbNQpXh1Ai7H3ULXwuIyqmihXMJFNkWFBf6o3sN27076L5UbRmog7pILSvuLqQ21dVRmypDBLkFTiJ58wn/cIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZfQPctbSW1isQLPr1Wa+IYQ/ofvFBHHde+t1r1BxeA=;
 b=EGDhHruLVAOHt3FMs0IPmDnnloTBWEvt2+ijxhdmnjbqbXOQ332vK4a/YpuSIjnHRul3/p1L3lOSzkqLNXNLf2B2fubID45ajKQGxFUwQFnBn7kL+7gGCb5HmIXZpU9dMd6PkKrevwRdq80BxOOsvDbzgcAjFiRS+8/g0pJ6S9X/a3ynbEm+n8FdIzxbTdjZ5FcsPduGfngqPLT8vumQ/D8W3yZfXHVvlj+7ubdUS0e5vQeZsvEzSrwHtevvo1i1Lfy1BhAstZYdHrLnlf54CqpxeoD7xpX90Tj76m3M7CShhYXdSfQSrkWgghczGy0zp/ItJQuNfaDTblCWCWIvWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DM4PR11MB5277.namprd11.prod.outlook.com (2603:10b6:5:388::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 13:08:18 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 13:08:17 +0000
Content-Type: multipart/alternative;
 boundary="------------F3PmzR1Ljakg5HJWI2XgEXtY"
Message-ID: <27eb27a1-578e-4feb-a69c-adf1cb588fbd@windriver.com>
Date: Tue, 23 Sep 2025 09:08:16 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3] gawk: disable persistent memory allocator
 due to licensing
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Ross Burton <ross.burton@arm.com>,
        "Yang, Liezhi"
 <Liezhi.Yang@windriver.com>,
        Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20250923005234.2952070-1-Randy.MacLeod@windriver.com>
 <CANNYZj8xQKdfsJQP-r_qAEqYFHCnzZVCC_NLHbX6yFj1OU7mZw@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CANNYZj8xQKdfsJQP-r_qAEqYFHCnzZVCC_NLHbX6yFj1OU7mZw@mail.gmail.com>
X-ClientProxiedBy: CH0PR04CA0083.namprd04.prod.outlook.com
 (2603:10b6:610:74::28) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DM4PR11MB5277:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a21d44-e160-497b-610c-08ddfaa24331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K0M4T1V0NWhwaGs1U1VnRjloS0lmWlh6VjRVY0N3L3l0cWljMytsdC9lUDJV?=
 =?utf-8?B?WVpxMC9EVk5YSnFpeW1lVVVvSTZiL2JUL29ZeTZjUmNQUlNvMG1FK2N0OFpx?=
 =?utf-8?B?blB2bzRHQUdvdzh1Rk9QNy9VTHZLeEQ1a1J1dGZqNFhvc0I5Wk1Mdjd2ZVI3?=
 =?utf-8?B?WU1iQTRNR1p4b24rRzhJQks3M1QxQ3VxSEd1d3pEVFJ2UGtISzNRS1JDdUhv?=
 =?utf-8?B?ZEtaVXN6Q09IaFZlNFNwUVo1WEVUVVN5cHRIL2FkZ0VZTHo3N0JYbzlqL1NZ?=
 =?utf-8?B?Sk81RisrZzhqODFPZUFSS3ZvRkV4WEltNllLMXpta1MzUEdodVNlNURhTXF5?=
 =?utf-8?B?ZnRqL09vL005NlZjc3h2QTUwUzlZMElabTd1NXpGNVd0WENvZ2k2RkVjUmxJ?=
 =?utf-8?B?ZnROc0g1a3BvZmtGR0hvbmpCdGVjZ0lsb3RJR0d5NEZ4d3Y0TStXTGtxMFla?=
 =?utf-8?B?amZjTWV2SklVVjVmaEpsWmxzYTB5aHNISmxLQ2FNYUJJU1g3SUQ1QkIxVVdz?=
 =?utf-8?B?LzI4Q0RyOTBNakNsdVZObHlnMzlqaEZEQnZKQ0xPZ0Y1aTljYytNUkYwblNL?=
 =?utf-8?B?cVU3WTBhcG1JeHYwRlVOMU85TGxxcjBWQkxBMVFJVnV6N1ZncTd0QW4zbG94?=
 =?utf-8?B?Y3NyWFViUm1pUEkrOFlXbnR2eFpFQm5qMW5kTVBYOGFlQUsvWENVTkdOTjcr?=
 =?utf-8?B?RUJJVEFkSWJQd0NwZ2tzZnVHK0RPL3N3cHc5djlSaUtmSHhaZ1Rsb1AzcmhJ?=
 =?utf-8?B?cG1BSXNPT2QzTzFNenVqbGZmNTJxMXo3QUZuNi9yelZjUmNzcHhaU3A0bkdp?=
 =?utf-8?B?b0puT3BvdVJobHhXbjgrTmN0dzBlbGlzMEZZZThmRzA4ZXpNOGljQWF4S0lH?=
 =?utf-8?B?ZGcya3NxNlFzZjhvY3ArekZuNHpiVHRnMEFQTXczb3V6b2NjV1FGMUJUYWRh?=
 =?utf-8?B?V2xXUUxZVFF6WWdZWjhXZUwvdG13eGwvUU5uOWtWdVZ3TVdFTjRhdzl3V1ll?=
 =?utf-8?B?T3ZtRnF0V1gzWWREMHFxblg2b2xzeE5VMlpTNjh4WTQ2Z282c1ZrdWpHaXVw?=
 =?utf-8?B?dUlRaHhEYzBGTGpNNkVlN1lBZFRHMDNLMll0M0phOVowb0E0TCszZkN1amor?=
 =?utf-8?B?OUJOSGQxT3lRdW1rS05yTCtVaDFGNTJkOUt5eHlzVzQyZkdMOFczOXJXSmNl?=
 =?utf-8?B?ZUxXWFN5SkpMUXNXalNoOExrTVhKR3RMVmMxUnhGd2FoWTJWRWZKMzBhbXhB?=
 =?utf-8?B?eUgzbGs4QlRwck05V2JLTzlDbnhsMjhhc1N6akVLNlBHNjE1SnFQUjJld0xE?=
 =?utf-8?B?d1ZvZ0pOeUQveTJiOEx5b0l1eVAzY2hYQTQvcW1ENjVLQVo1QkJMTFp2NVVu?=
 =?utf-8?B?UGdiZDdhbVhnSk1RUEsvRVlMRkxIanNQTXNKTmpSSUVzZm5jWU44bkYyMHZT?=
 =?utf-8?B?S1ZkbGJsZzFLbmVldUM0SmlnKzNTYVBiZ1dPNTdyTHdqakFMMGo4cktqSGw4?=
 =?utf-8?B?RzJqSHBzWXZWdGMxNk9YZXM4S0M2RUdGb29yYUk4WGJUOWs2OUhTbFZMaFQy?=
 =?utf-8?B?bFFuZWtJN1hja0g4NVY5eU1OVlNXekcrbVVTcEc5ZHZkR3dtU1dyaFUwdnR1?=
 =?utf-8?B?eXFUYUJSODY0cUEwVjVXMUJWQ3YwZkNnRDNsMXNpdWlQTTJKUjdsWmUvdGJJ?=
 =?utf-8?B?QUZ4dmNjNjNWMUs1ZnF6OFNUY3RZRUNUQ2x0YVJ5ZlFGZUpzQ3hMNnVIdFpt?=
 =?utf-8?B?bUhIMjd4VFN6WUxNczRhVGk1UzZUb2ZsTFJSY2M3NFlPTU9VVUJ5ckNDWm54?=
 =?utf-8?B?YzRXczd3MnY0cytUU0pUM0JlSTVYcGE3SjNzczZOK3pWSE55MzJBbFZwTGhz?=
 =?utf-8?B?YzhaRWVrdVRVYjBmUGFmdWt3Ump0Y1pWNjNIZjYzTVQ4bnpMSE1hbnUyNklw?=
 =?utf-8?Q?XvZUBA8ZZz8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bWZ3QmRyRG15bEFrRUpuS0NEbHhUaGlDREtPbzVzL0dTNU85bVRQenNKMGNw?=
 =?utf-8?B?KzB3dmt0N0QzQmxnRis2NExyMDB5YTZWV3lhOGE3ZkJ0N0VnMXJtdm1kRU8y?=
 =?utf-8?B?OFV3NVVvN08zY3g5cXloU09YdFAxTjN5RUgzNnhtdGcycUVqMXBGOU1DR09h?=
 =?utf-8?B?YWcyV0FzQnVSNk1LVVYrcDhxTTFtRHZsbDcwb0Z2aUdBLzJnQ2VOTjdXQkEx?=
 =?utf-8?B?eUZnUnZqYzZ3U05DdEdSZWRyQTE1azhkd0lkbG95MGhjcFE2RHRURkV2TUVo?=
 =?utf-8?B?MnFVdkM2OVlrMXNoQ0JtL2RuVFBPMVpMUDhONDh2LzczVjgrL3EvdFozUGpy?=
 =?utf-8?B?aFN0ZXpaOUN5L0ttNzNTK2hGVVhPYnkyOGZ5ZjQ3NTZNRnB2UWNWRE04RWpY?=
 =?utf-8?B?eUJrUnQveTJvWkx4Y3NQNWdGNzBSU3pJdkNLaHI4TXBpTGFWNG4zM0N1dE50?=
 =?utf-8?B?Q3JLOE1YYW1tdkROMmhlZUhuSVhoT3g2RWtDc0ZqeTBHcTlyMS93NzYwZGFB?=
 =?utf-8?B?cVNyR2ZFRENidjZidWNBQ1BESlZMaDRZa0l0UW9LQ0lBWXlYMWkrVGF6Lzc3?=
 =?utf-8?B?UDBPUFRCazFwblpQbW5vTTFpYkJEUURORHhzMzBqa3RnRWcvSEh5bVUwQ0FI?=
 =?utf-8?B?K216Wi9nR3ZyS1ozZnNIanJUQ012SWdBMHE4QVFvaXlsbFU0NFJrQy8rVElh?=
 =?utf-8?B?VG5DR0RTK25ZU3IrYzBneUc3dnkwM0lHMjJNc3R4QVBXbVlBOTIxKzFWczFS?=
 =?utf-8?B?NHc5amVCa3pMODRpMEVFQnhmRkdJRGRIOC90UmZucFRUVGpUbFg1TFBCaldz?=
 =?utf-8?B?dlZkTDdEZHpMYnhjQmdyMTZjbkJFOXNKUXdWZldHM28xbE5lSkNFcUp4aElC?=
 =?utf-8?B?amozTW95NGVsL3F5WjhLVlg4WVFvVXRPNlNaTms4WlQrQ0pBOStvTFc1d3lQ?=
 =?utf-8?B?eUhpUFNsUDNHbXhTdlE4QTRSVTkvYkdoSzRMSlRGcWtqdHljOTFrcFNFQ2Jz?=
 =?utf-8?B?cFpSVnZvWVQyc1Q2NVVwSTZqTDRrYWprWGNWdlJyeWVzSSs1UUJmRmdwdGxT?=
 =?utf-8?B?RzNVbjJDejYxRkw4VGRsVnNiZWl6ejBZSVJ2bWI5TFRBbVIvazhIQlNGZ0JW?=
 =?utf-8?B?YWZHdC85YW0wM3BIRVpBcnQ4L2VKZlBWMXFDZmhmM2JDbU5rTFpubzl6SUF6?=
 =?utf-8?B?bFRZZHIxeHltcjhKUUFYbW4vT1VRWlhtdktNaGxKeElEVmhUME5MSzlLN1hl?=
 =?utf-8?B?c3JXMURRTEw3YXJJZC9xQTYzOXFOMm9wVGlFTkJEWUMxK0UzZlkwVU1pTjBQ?=
 =?utf-8?B?WVIzL2JTK2tSRUQvMWxGMzRnVU94NURlSUVVM1M1V3ErY0xkUDU4VjhQYTdK?=
 =?utf-8?B?L0hKMGgxc1FyRFFPdXV0YUNSc2p1TzJFY0cxY0hVR2dyNlFoRHUyNTJOSDhH?=
 =?utf-8?B?eUlqYTZTTjJBTVRTRHZiUEsyWnczMTExdDFMZlpRdmN5L2d1M0t4a3pqbllw?=
 =?utf-8?B?UUU1MUppQUZJalkyakZZMEpOeHF0L05yMVpEK0c3bCtzdFRwMTBJdThXc0Vj?=
 =?utf-8?B?ZmN2L1lwMThmdjRyVmVlK2h0ZDNTMGZwaHdqLzRIUmNwNTdYTkJ1WEpwT3Iy?=
 =?utf-8?B?Ry9RRGZNUzB3OXpnTml6MVplT2o4RmVQUHlEV2N5TzQxNjNRQUZJMHB3NGtB?=
 =?utf-8?B?UkY5M3RYdnJJai9pVW5FNy9GckNLMFNLMHVLdndMejlqZnRSRlI3MXlFTTF4?=
 =?utf-8?B?eFdWb2lBTVp3dWJnYzlNTDR1cm41emhiMDN6ZlE1RXRleC80TXFjVzlNbk0x?=
 =?utf-8?B?RFRjRkJ2OTBrTk1lY3ZsZWdzeFcvR09TU2E3VXNHY2ZmOXdlZjFpLzIzaGhy?=
 =?utf-8?B?dmVidlJlcUF0b0w4RDVRcThlVnZGTGtJekxsbk9ra1dxL3FhMkhXUDNzZkww?=
 =?utf-8?B?djExTzNUaVhlWHJST0dVZjhIMmI1OTUwVE02b0FHZkdyYUwvOGQwekgwaHFB?=
 =?utf-8?B?UFN3L3QzRW0xUVd4d2lITUZGa0VSZGZlOVlLQUo1TFpMck9jeTFHc2phanlQ?=
 =?utf-8?B?Mk5YQ2dBYnREM1oxWGdkZmU0MGV6L2ZZV0tHRHo2U2hlWEltWGtYbUlRdkwy?=
 =?utf-8?B?ZHBlT3RRNGZ3M0VGenJYczRTZ2RRT01MZW1WNGJFazI1YnBsWXd4MDVzRlZl?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a21d44-e160-497b-610c-08ddfaa24331
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 13:08:17.7142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: foFLYAE5HJ/DNEuoCY5NuBSWDVjwsGPIKlUqTJkAkYI01z/zuOC9uCcPQ3X5F0V2xsPlVRyJTbLUEoNplE0VnVIo4+Am8cKhlea2kasBhLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5277
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEyMSBTYWx0ZWRfX1v8Z9rCtMHVi
 CHNbsmjboEvoq+L6tTTKupT/cZVX/ugYVK23oo/Xzot7kEFsYRSuvf4sNM8f0eGmS5jltHJwupc
 CyzRh34u0LHVrBWaQEqeatTn0eSd/QeY5YaE+FbiPpGjN3BO7eRoVbmdiVfB/ecHh07MIe17EfD
 4XgDL6KHz0qmvYfIs1Q8a2N+Av/lenIrslF/wO8OQqc7dkLijpbvO+JiQ2dLOL4MqaRbwtcgYIq
 1vbR5Vlh6Z28QzSjc2morDTWVlfoZFPJ/Y9CPloxAI/CDcRP+sWNFbXvuDcauTpuyZ3WcjjJajf
 lnaFMWXijvkxFUltRsnJMGCZMljt6qMbSy7Ew90KIBXc8x7/N9WXyZ/a1mqav8=
X-Authority-Analysis: v=2.4 cv=btpMBFai c=1 sm=1 tr=0 ts=68d29bc5 cx=c_pps
 a=CfFGriBY15yWSKnMtEY+og==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=2BYrlvPEXFgAfg36SmkA:9 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8
 a=DJuZ4nUg5rC9E1TYpr8A:9 a=phw4HXlrNj4NkLT1:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: cGQ69n49nmxIU0ez-d36zwXBhZg2UFP3
X-Proofpoint-ORIG-GUID: oIZcq3WwdMU1I0nK2QGMVfizkjTBnTAP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 13:08:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223877

--------------F3PmzR1Ljakg5HJWI2XgEXtY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-09-23 4:14 a.m., Alexander Kanavin wrote:
> On Tue, 23 Sept 2025 at 02:52, Randy MacLeod via
> lists.openembedded.org
> <randy.macleod=windriver.com@lists.openembedded.org> wrote:
>> +# pma adds AGPL license
>> +LICENSE:append = " ${@bb.utils.contains('PACKAGECONFIG', 'pma', ' & AGPL-3.0-or-later', '', d)}"
>> +LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'pma', \
>> +    'file://support/pma.c;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19 \
>> +file://support/pma.h;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19', '', d) \
>> +}"
> This is incorrect, and has already been discussed in a similar patch.
Ah, I had missed Robert's email since I wasn't CCed:

https://lore.kernel.org/openembedded-core/cover.1758264088.git.liezhi.yang@windriver.com/


> LICENSE is for the source code license, and should be set
> unconditionally regardless of whether pma is enabled. Then you can set
> licenses for particular binary packages subject to whether pma is
> enabled or not.
I don't think that rule/guideline applies here since pma.o is added or 
excluded from
being linked with the main gawk binary based on the outcome of configure.
That's now determined by what PACKAGECONFIG is set, so one or both 
licenses applies to the gawk binary.
There is no separate binary produced using uses pma.o unlike the cairo 
case that


Do we really want:
LICENSE = "GPL-3.0-or-later & AGPL-3.0-or-later"
LICENSE:${PN} = "GPL-3.0-or-later"
LICENSE${PN}:append = " ${@bb.utils.contains('PACKAGECONFIG', 'pma', ' & 
AGPL-3.0-or-later', '', d)}"

?

../Randy



>
> Alex


-- 
# Randy MacLeod
# Wind River Linux

--------------F3PmzR1Ljakg5HJWI2XgEXtY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-09-23 4:14 a.m., Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj8xQKdfsJQP-r_qAEqYFHCnzZVCC_NLHbX6yFj1OU7mZw@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">On Tue, 23 Sept 2025 at 02:52, Randy MacLeod via
lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:randy.macleod=windriver.com@lists.openembedded.org">&lt;randy.macleod=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+# pma adds AGPL license
+LICENSE:append = &quot; ${@bb.utils.contains('PACKAGECONFIG', 'pma', ' &amp; AGPL-3.0-or-later', '', d)}&quot;
+LIC_FILES_CHKSUM:append = &quot; ${@bb.utils.contains('PACKAGECONFIG', 'pma', \
+    '<a class="moz-txt-link-freetext" href="file://support/pma.c;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19">file://support/pma.c;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19</a> \
+     <a class="moz-txt-link-freetext" href="file://support/pma.h;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19">file://support/pma.h;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19</a>', '', d) \
+}&quot;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">This is incorrect, and has already been discussed in a similar patch.</pre>
    </blockquote>
    Ah, I had missed Robert's email since I wasn't CCed:<br>
    <br>
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/openembedded-core/cover.1758264088.git.liezhi.yang@windriver.com/">https://lore.kernel.org/openembedded-core/cover.1758264088.git.liezhi.yang@windriver.com/</a><br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:CANNYZj8xQKdfsJQP-r_qAEqYFHCnzZVCC_NLHbX6yFj1OU7mZw@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
LICENSE is for the source code license, and should be set
unconditionally regardless of whether pma is enabled. Then you can set
licenses for particular binary packages subject to whether pma is
enabled or not.</pre>
    </blockquote>
    I don't think that rule/guideline applies here since pma.o is added
    or excluded from<br>
    being linked with the main gawk binary based on the outcome of
    configure. <br>
    That's now determined by what PACKAGECONFIG is set, so one or both
    licenses applies to the gawk binary. <br>
    There is no separate binary produced using uses pma.o unlike the
    cairo case that <br>
    <p><br>
      Do we really want:<br>
      LICENSE = &quot;GPL-3.0-or-later &amp; AGPL-3.0-or-later&quot;<br>
      LICENSE:${PN} = &quot;GPL-3.0-or-later&quot;<br>
      <span style="white-space: pre-wrap">LICENSE${PN}:append = &quot; ${@bb.utils.contains('PACKAGECONFIG', 'pma', ' &amp; AGPL-3.0-or-later', '', d)}&quot;</span></p>
    <p>?<br>
    </p>
    <p>../Randy</p>
    <p><br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj8xQKdfsJQP-r_qAEqYFHCnzZVCC_NLHbX6yFj1OU7mZw@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">

Alex
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------F3PmzR1Ljakg5HJWI2XgEXtY--

