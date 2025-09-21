Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A58CAC5A7
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 15:12:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.30978.1758467529268675729
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Sep 2025 08:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=G1Bchlra;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1359713421=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58LF8bWI3121996
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 08:12:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=qPWlliGub0ekODxwRSRXDXbSbGAGh9HzlEBT/w7+24s=; b=
	G1BchlraMtuKHf1M51js5+pDV+NJZ52O3Nhl+LO48hMAw24v0pig3xlLFGVXQDaH
	u9QZm6AzjAJ5r9gihLV8alSEJZmvf4X4oWq5z/dvzCmhnHcs8q+h0a4zwc72HTFw
	uWk58ZoqIISuNGejISoMXTFRlYmgJb44GUyU2Ck8beGNsrZo0OujPMx6ejaNq/uk
	VXDTxqEpZtPyK37OpRMDRIKKmhyOIZqrPfIYrETJ1c1KLnzqi+ocYsL6IcaZlBrf
	U9a2qQjRxZ03zbEaIgs3VRTDij5DepLMM/prC/WuormqVUjC3y9QvxREVYqiAg3l
	usNPLlLugXWM0LxnYtAeow==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011018.outbound.protection.outlook.com [40.93.194.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499qj2rueb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 21 Sep 2025 08:12:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5dA9BMgj1zvXuza+VGBWJJ23/3loa5nfu9ATLSoaQ3ZFkXo24kGxLyK+67EYFrPhS2umppojEtKK6uv7pqtQwsuOeG6aJVbn6+aEttXLC6bNVkEklCr8GRda4YMYLNjtHzfVRSJDqefuz6mCoGWQbIzZWHiOU21MPwDN6epRuUI7Ey/X1f4LZpRKugZgyXUGfQrqiYhR6ZxL3sG+mGzNVpMedEKPfJK5MiY8PJ+ZGepq2FVpT8IRETJRact+DrVDao+tMN17B4CehHnXaJsn2NwdAzGIxLg4m2tWbySKOMLEmlN1Pq5VaAtF90w/Gx1AE8kLnaS812qw/iFDI+CpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPWlliGub0ekODxwRSRXDXbSbGAGh9HzlEBT/w7+24s=;
 b=y/fC7WJawcPCYGrNTjsdZLSLx1b/a/fmwZIgp6hLDx9fpgDLM6RGnYMIZFaY6Z2EHB8FTCmE4Gt5owdZq0N5yfqYNAAG5vZymyTaNZmAZaY3sh+kiq5VjDIm3ed3521ZZMOm6hhzMV9XjlOPCL2Gdcdt3DOpQWD1+c+Jezb1BfUGlC9ILr6+Dwh2q+oqeeFPMTPWTc8tgiR2+BrfkYh9gfRHsW4hlWhS3x+Dua5zE8ZWigOUYUDkTLgIe2fh+5jyTV6b4pUMvqL+PnV7+X1+inJe0JYTVDUxd9SLU7aQMxnUgcM4nE61iQmBdFv7kJRDzxSnMYvZagO4T+FS86qDnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by SA1PR11MB5876.namprd11.prod.outlook.com (2603:10b6:806:22a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Sun, 21 Sep
 2025 15:12:05 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.9137.018; Sun, 21 Sep 2025
 15:12:05 +0000
Message-ID: <40c308bd-77b6-4256-8554-495d4a0dc3b7@windriver.com>
Date: Sun, 21 Sep 2025 23:11:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] gawk: Append AGPL-3.0-or-later to LICENSE
 when pma is enabled
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1758264088.git.liezhi.yang@windriver.com>
 <d619772b36cee9470e7ea8bcb245e98cd8033556.1758264088.git.liezhi.yang@windriver.com>
 <CANNYZj_=ovyCMXfrNAqcwJ17iraVRJJQnSVFugH3EVeKPs+6=A@mail.gmail.com>
 <DB5PR02MB10213C7F93117803D674E1CB2EF11A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <DB5PR02MB10213C7F93117803D674E1CB2EF11A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0203.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::16) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|SA1PR11MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: b5fb9622-210b-4ef5-442b-08ddf921395d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZkpHMUlkNGlNOG5vN2tIc3JETTVMNzZMbGNIVnlCL2hFMkF2K3Bybk9HazN3?=
 =?utf-8?B?MjZ4eUp2eS9ma2R3Mjhjb2VMZnhZY1lEaE9jUVVzWjBIWUdSa0cwaE9vNzBH?=
 =?utf-8?B?OGQwUnY1ckd4azc2eFl4ZU1qaStFTmNabU5nOHdJM0NQY3dma3VJZzluT1FZ?=
 =?utf-8?B?d0IxTkpPQzVXMlJEZVhqT05KT01GMUJjR1NzaTJsTHVlY3MzNVJXSXpTVFFH?=
 =?utf-8?B?c1N3TjgrQ2k0MlFGZ242UUFoTjB0VnhVR3lzd1Q3Y0thMkUxZ2k4eXIzelJZ?=
 =?utf-8?B?TjVEdDc0dnBxR3dkRnhzc2ZyZDVlbUl4M3ZrNXVNM1A0bytvWmdBeGNyUVN3?=
 =?utf-8?B?bEh6bHdCbkJNTUF3OWZDcHFYdTBSTU1PYWY5WWVOVDNVOCtTR3BCUWsrb25n?=
 =?utf-8?B?SCs0OWZrTkNjWEVrY0U3SjJpaE1YemdSU0dvNGtmMWZmVTFrRHFvaE91RFcx?=
 =?utf-8?B?ZThsQ3ExM1F1N3IrRXBaRy9nS3pMcmZ1NmRzZUV2Zm5hYjQyMEtBWUJ0b0VE?=
 =?utf-8?B?RHZKOW1DdnB4N0hmUE44UW1ycCthK2VsMWZwK3BKbHNTOTI1TlNhdElIaUc4?=
 =?utf-8?B?R2NYTmVJNWN2LytNSUQ5OUZxS0dXcVBEdm1OUEdvRmxBQy8xa3I3c0IxWWV0?=
 =?utf-8?B?Tkc2Wmk0SkhlbktydFhPTkhKM2taaFh0aUNrU3V2L3I0RmhZekxXYy8xbnkz?=
 =?utf-8?B?VGJJS1I5TFZzSzF3YjBDOHJReVdwS2E4cFNsQ214czJBTjA5bVFxK3BUYU1G?=
 =?utf-8?B?eHk0SmxvUnp3cWJQRVM1R1lkRGIyakVQOU5hRys3UUFkWTRCV0EzSDZxTW5w?=
 =?utf-8?B?MFB4WUs3UDN2Sy81M040WEtFMlJpOUgrSGFiUnRsWk05YmppVVVKQU9LUnBR?=
 =?utf-8?B?ZGpOTllOMmNEZEsvMGtMSUg2Qm1jWFluL3RCU2xiekY1Q29mUHNBN1gvMHRP?=
 =?utf-8?B?VjE5SnVIRDk1Y0NtalgvS3lFcDZ1bFFCZG1YYUQ1dGFjVyt0YVRqTmNqQ2JI?=
 =?utf-8?B?SHc1YkMzU2VKTGEzczdJbzkybVVpRUpyRi94RFNRSndJenF4SytRUlBYYWdN?=
 =?utf-8?B?OGVXZVNDbXA4MU9teFM2SHZDb29BRndvZmR6aG56L3dSWHpUdmZNY0pNcUcr?=
 =?utf-8?B?cm5UNGgxOElGeXNHbC8vWlFqSkRYUGs0OTJmaGRPUXJ5NjFjRjRER2FMN2JG?=
 =?utf-8?B?MHhlbGxiZmRLVlBRNytzaFlvSUxGdTBkWmhYL2hRSGlkR0ZVSDdqUWg2Smxo?=
 =?utf-8?B?d0FTMWE2dWlneTc1M0xhaWtVZ29BVjNKZ3BRR1V3cmxTcUFCS3RsWG9nRVFr?=
 =?utf-8?B?d0l6Q0doU0NKaWZ4RnJ1SU1RRk15bE5QRnhmakZFVmREY0FIaktUWS9BZUJ0?=
 =?utf-8?B?Tzg2VlV6bEc3OGtwL3J4RHhvTkJieU0rWDJEaG0zMGhvYmFJc3ZXSjBQdTMx?=
 =?utf-8?B?Ny84QTd3WkZLVnpEcHprYThsaWJKcC83KzE5RmFVKzRZV2tWT2ZtRU5vUkgy?=
 =?utf-8?B?K3UyRnZDdldBVjZmaVRIWVBudWdEVFJ3WFBwRlo2NnhzRmRrTkxPcXZyMUk2?=
 =?utf-8?B?TDJlTWJVNXRKSXRiUW1hQkcrSEh3REhpUzdydy9rWng1bmFOSDhDOUJkdnFx?=
 =?utf-8?B?QTR6Z2dZK1UzR0lseC9qd3FqZWZIVkxWSXRsa2htTWNjanFqMU4vK1NxMjhT?=
 =?utf-8?B?STZPejkvejlCWnJqS1pMTHl6RGdabDFkSUtIV3NtUGkxOTEvQ0UrYWJOa1Uv?=
 =?utf-8?B?RWRoa1dueFQ5QTZqeDNoUWNvRTBXWWxHUGdPS21TMkNscFR2Q0FicjBNNTRz?=
 =?utf-8?B?SnJ3MWVjVENzQitUTTdqdHlTZndWOTFNbHdSKzNHQkdtYW9tQ2NMUlY2K2pw?=
 =?utf-8?B?R0VHU1NNakJYSFhsN2hRYVdMM004SW8reGFwSEoycVhXY2phdjJHdk1BQS94?=
 =?utf-8?Q?eDr7YlP/6oI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WVNVY2JJejRuSGptLythYnZydnZqS0p4ejdibC9Nc1pSTFgvSndRQTZFQ0lv?=
 =?utf-8?B?M1F3cUViR0k3bFcrNjdLSWsxNUszWUtiMkZaTGdsbkVpRnVabCtPWGpZQVo1?=
 =?utf-8?B?OVBGYjY2U2oyNWo0SnNNV3BEUGVtSmJUT2kvUzBGbFRlcVl3ejdoVHV0Qmlr?=
 =?utf-8?B?RzVUVHVmQ3JrOTgyRGxUUnNBYTVHSVVkRGVYeExpZUMwNWZNV24wdGMxWitp?=
 =?utf-8?B?OEkyckxRN05wb0NkMCs1NmJJRDdidXFCS21YQTJkV3lhWHJTWlBJbUxTZGth?=
 =?utf-8?B?OW15cFQ2bTFpcE5HQmkvdlV0eWRXbTZrNHdlNFpmSlF0QytGSU9ZSXRLeW4x?=
 =?utf-8?B?aml1cERhbkdOQkhzV09SeFVQcE50TjR5QytKSUtGcE5GOE5HMzhrZDMrOWky?=
 =?utf-8?B?OFgxZnZjWVZ0RForMncwaW5iMm5wbXUzUm9pcFVScXI2VzM1eFR5R0Nra1Fs?=
 =?utf-8?B?RWsxQnRkMVZsSjdQS2JrOXY3emUyQUYzazF3L210UkFNM3dKUXlqU2wzMzF0?=
 =?utf-8?B?M1IyR1JDVnUzVFJhVUlBaytwY0E5aVVGWFd6R1IzbXl2azRzUXJFdkg4TkEx?=
 =?utf-8?B?b2FmbVlDM3A3bnZ2SVBoU2lBdEJna2JjYzErR2JVNWw3cXBhS1dZbFRWOTlJ?=
 =?utf-8?B?MTl5VzJvc2xtVmg5elpjR1R0RC9TaE55c0lwZ1hTdHB5akxyaENkeU4rOWht?=
 =?utf-8?B?ODJRQTNwWGhqWXBkRzFtMTIxVVBVT2JKNGd4Qi9yTStaeDRsOE8zOXZGS3Jp?=
 =?utf-8?B?L0lTRWNBaVB0V1hmTDZKZ3VKWG1Gek9BUmlYSFBxTkhUZ1A1cFowSVNCVkJC?=
 =?utf-8?B?SDNDekQ4S05LbWJ2Q0FRbmhFWktTbHN5REFYeWNITnhBY0RxbVpINWRya3Zj?=
 =?utf-8?B?QzVaQnRuRzNwQzJFbzhyZzFpTnlwZlZXWmlUZ2l4UHdDOGNYWlZERjJDSkRX?=
 =?utf-8?B?SDBzUjFBdWNNSFBuNHNOdDc4OVQvekxjbWVpZUxITU5jMnZNalJNcTRvNFpk?=
 =?utf-8?B?Qk4rK3BoRkh3OHVZWVU0Z1FUVVpTL09mLzY2bzIzdVFxekJObG9paDZxUVFm?=
 =?utf-8?B?WEp4bFFoWSs1V0VlNUJZOTdnZWRSZGpCWlVmUXBPbFMrelltQThnNUc5dzRB?=
 =?utf-8?B?cXUvQmpMT2EzcmtFQUxQeGhjWlJPZWZzMHZwZzR5TUJ3am5iZUkvUGo1M3RN?=
 =?utf-8?B?ekRudDA1eXErelNzRFlLUVE5bmYzSDNqZEkwM3RvRlJVVk4wRlJhWTVRN3gw?=
 =?utf-8?B?MG1RUTdjQVRtSlgwOW5VZ2NDK0NOemxPc0NTcjlQd0RxS05wWDFzSHF1R3Y1?=
 =?utf-8?B?TWFLVnRETXBCZTB5M0NDZW5KL3ZvbGRtUTJNZENHZTRuZ2srNlF0ZHdnbWpE?=
 =?utf-8?B?c1JIRlVwL3YwVnBJSndjcHBrREF0dW9aN3kzQnRTTFVId0d2enZKTDFEMUhq?=
 =?utf-8?B?VkZ2QXQ1TnBrTGl5SlhoNURQVWkyTnRiNTRVVkJZNU1IRXdjNHRJWXVuU2g5?=
 =?utf-8?B?RUlwMXR5eENTbXBRV3JiWUZYdU9CdEMwOFFpU1F1M3h5b08vcTlBSHlCMGZr?=
 =?utf-8?B?UkltWm02ZDR5WE1ySGE3OW1MOWhQcEFhTUJxd0tZcW9GdUgwNFB6U1RVWmRS?=
 =?utf-8?B?VVlob3c0YzhyL0Q5bCtKNnArWVcyMGVvdktuN1MvUEhHc1BsVkdqUnhiVlIw?=
 =?utf-8?B?eHJISGppaUg4UU02eXZHU1Y1a1hQM294UjRrT01RZStML0JHVTdBWnkxYnpm?=
 =?utf-8?B?R01wMlFTci9HTFJ2dmFqUDZLNkdBNm1jaS9pN1llL3daWVZ0RzBhclloenkx?=
 =?utf-8?B?SzROcit5UEpxdUUxd3NYdkpVVEtiQW45N2o0eDR3ZERmeHlIeFh3UFcxLzZ0?=
 =?utf-8?B?Y3ljNVI5TmxlT3dxTCttUzdsSG8rRHVNNFBBTlNLaVRuTjM3dERtV0RRWGl6?=
 =?utf-8?B?OHZScStLR2doVzEwNENYQVJaYmF0UHoxNS9QU0pkc2JoUmQzQnJBNnM4c3FQ?=
 =?utf-8?B?d1ZSd0xGWmRwTkpxYzYzQzVwVW5WMGlKbExUejBKUkNwUlk1UWVtV0ZlblpJ?=
 =?utf-8?B?VXVzeVk2UDRXRXVaYmp5K3FYYldDbFY5TGE2VEtRbzVHNG5sdE9BMzg4c3R1?=
 =?utf-8?B?Sk9Id1d1ZEtaMEpXUE9sbEtUZHZUangrRUo0NFFCd3hzQlZ2ck9JY3pMcjVC?=
 =?utf-8?B?TFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fb9622-210b-4ef5-442b-08ddf921395d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2025 15:12:05.0875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5FfJDuFM85D7cXuZ3IkwFga0O/+L9ZlPFJORBuwCQO4NbNfzAEOeNTQh5PFAodBk8reCe2MHDXPKEh4njg6mz0OVHLzs5CEDRCQ8Qn6Y68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5876
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIxMDE1NiBTYWx0ZWRfX2go8QEXlZ335
 W2TGt1VlTecvlrEewgbiSvzAZiK93/71QOSA0Zgoie/XbeKbEOkhm3Ru2xkv9tVSNVnXAmpPiUr
 6FZzkCfLZyOtmqSpWG6S9IDSq4VnLWWNdG9okZMSru5C25CVfIRFZZ8n+/l4pNk1QNvsAQRFUH1
 OmPxbBwc9qhAQ6GDWmgHRp/edl/LRjDAGsxkI3Wpj04Rrt9H79tQinJVs3THEYBES2wei3nUt/H
 znat7RrvrrqNZGzd9qsQNK/mEdpt6Dv1GTTOJqkrMivXpuQoFIGA0z4ljgBGdLIW8+cUTNCV8bD
 uGB2AxibuLwC+Jw5mWo32NDEOm6qB/Cw92Js1xHiUkULAKv04AE/8wqakiawSU=
X-Authority-Analysis: v=2.4 cv=btpMBFai c=1 sm=1 tr=0 ts=68d015c8 cx=c_pps
 a=jA10WLhXiBAWrDGJQFCh7w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=A6vu6muHNw2YlKLTRfgA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: xyqz1TVS_JvsHnbdh0E2sm0huMeVjZvr
X-Proofpoint-ORIG-GUID: _CJoVzHvSzPi5x2ep94m5C5oCt3cxZ-f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_04,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 15:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223799



On 9/19/25 22:04, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Alexander Kanavin via lists.openembedded.org
>> Sent: den 19 september 2025 12:25
>> To: liezhi.yang@windriver.com
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 1/1] gawk: Append AGPL-3.0-or-later to LICENSE when pma is enabled
>>
>> On Fri, 19 Sept 2025 at 08:48, Robert Yang via lists.openembedded.org <liezhi.yang=windriver.com@lists.openembedded.org> wrote:
>>>   PACKAGECONFIG ??= "readline mpfr"
>>>   PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
>>>   PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
>>> +PACKAGECONFIG[pma] = ",--disable-pma"
>>
>> This needs --enable-pma too, to avoid a floating feature
>> enablement/disablement.
>>
>>> +python() {
>>> +    packageconfig = (d.getVar('PACKAGECONFIG') or '').split()
>>> +    # The support/pma.c and support/pma.h's license is AGPL-3.0-or-later
>>> +    if 'pma' in packageconfig:
>>> +        bb.warn("Appending AGPL-3.0-or-later to LICENSE since pma is enabled")
>>> +        d.appendVar('LICENSE', ' & AGPL-3.0-or-later')
>>> +        d.appendVar('LIC_FILES_CHKSUM', ' file://support/pma.h;endline=21;md5=32bd750ee5aa5cbcf7978c1be6462b8a \
>>> +                    file://support/pma.c;endline=28;md5=a3f33ec236ab96537cdfd1dcda270c75')
>>
>> This should be set unconditionally, as it is specifying source code
>> licenses that apply regardless of build time choices. Then you can set
>> licenses for a particular package(s) to include AGPL or not depending
>> on packageconfig, but I believe that too can be done without resorting
>> to anonymous python.
>>
>> Alex
> 
> You can find an example of this being done in the cairo recipe.

Thanks Alex and Peter, I will send a V2 for it.

// Robert

> 
> //Peter
> 


