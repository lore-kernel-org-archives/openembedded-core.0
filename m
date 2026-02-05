Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0BBE91299
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 09:08:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16652.1770282514191586031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 01:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=JdXBRVPW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6496a5a8f6=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6155vBsS2127478
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Feb 2026 01:08:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=PGGfX5ezQTBaWZuaC17jO+
	DSWxxpkb8tLQ8hx0IyIt8=; b=JdXBRVPWsI7LHoZvtFB7KkFN4vTPuIRewyObm9
	hgyJlf1RpDwqOqqXKnTAIcaqPmx5fRBFmK5hEE5fRnzTRBLzr+oHtGnuoYLmY9/M
	Tu1mvfd4UZaAkuuZTYWnE6LsZyu0nO6bGnUZJVJzW+KdgqlLBaPHmxExeYyY16Dj
	vTryl2ki9aZUiQVC3Fjd5zZtNTBVwJdKiHLTqw889hfV8W9r9RcmkBK+gl5R/oA1
	XPrQZJoaCpK53uscy21m7+5XC9YnNCQKpEE2eUCRSR2hjETJDhgoWYcOanWYOrFe
	xTUgC0u+zcQGjdnqJJhpUnJQ6NP97ZOZjN2JxLiz0IT/40dA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010052.outbound.protection.outlook.com [40.93.198.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c4jbhga7v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Feb 2026 01:08:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAuQ49YqrbBdPDxtauivjRChuUVInLtC7lZRFmceFYjdXzE52DFGhLcJAgOogHMzMgDCirvL1s52wud2xL9nXRadUXPJaODdfwuyGY/7GL6zOSILTY/Y1uBVwiSYwNv5kZNI+tYT4sPPHxsh2Yu9hzLF9U8aomDyVU7IPAcsbMT5jW4Uh8PrRlXG1f66bZKJ8fi0AQ8QZ0BNL9sf8yEBJLmHoxIsfhD4oYS/yIynaCpcisCRP5jZ7f2d9J9DBN1gg56gsFP3MVfbzYIvM1KWwsRiNI+sYoIZoc+WXbALDxXrlCOes+73dMat8+cKCDQlru40Wu6tskEf56BN4FuECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGGfX5ezQTBaWZuaC17jO+DSWxxpkb8tLQ8hx0IyIt8=;
 b=R0YraPgJdINfRDf0Q9y0193PtRmLndFpbio6eoZwFYaPV2GXczfPOk16ZgWaNrJoF5kTq2GhDmyImFPXp2/KnLifbBOO4lrSQrb95D57SBbk5qf65uOtWLRkGpSAdTGmFjSYs75CINsJdEB4BDvj0Lo4yTN1n4dl9ftcOKXp7yVi3jr+E071epeTgu9a2I8Sug/XrMBhTydAYxjIZsNrdG5bkAJSXEF7bf98rUzV7QVjGD/q6NX9kQLvM44VDx1lFRya/ZP4AQWpugAB2mpmk40qNhKnx3uT4SeojiJxhAdZ/yzjw8cEsAYQUV9xMRduO8QeED5DfPFy3OztW5/Cbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 09:08:30 +0000
Received: from SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::9fca:dc5d:4230:e12e]) by SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::9fca:dc5d:4230:e12e%4]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 09:08:29 +0000
Content-Type: multipart/alternative;
 boundary="------------8ZkJr8h7zsXFrntNyMHZYO5K"
Message-ID: <968e666c-590a-4a08-99ab-fd4147251855@windriver.com>
Date: Thu, 5 Feb 2026 17:08:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] module.bbclass: check whether CONFIG_MODULES
 set
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260204020908.864912-1-kai.kang@windriver.com>
 <CADkTA4PZ9df8xCge6F+m4M02OTXbiOhYJ7S7hPvze95ah5BWDQ@mail.gmail.com>
 <71fa18fd1ae7612c9d3f8161c6aeb2575d22e280.camel@linuxfoundation.org>
 <CADkTA4N=XXArnsygSnAUptBby_BBX1qxsL2bjT+r1gDePWVmZg@mail.gmail.com>
 <4c2fe6d55fc04781560d73fd038ee6b8d205c08e.camel@linuxfoundation.org>
 <CADkTA4Pr3GFrZVM6LLQ-ATL-y+YFybjtgtcVMrgYrUKnDeSo7g@mail.gmail.com>
 <260247994ff827c43a775d9f549dacb073e60f5f.camel@linuxfoundation.org>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <260247994ff827c43a775d9f549dacb073e60f5f.camel@linuxfoundation.org>
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To SN6PR11MB2589.namprd11.prod.outlook.com
 (2603:10b6:805:53::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2589:EE_|CO1PR11MB4804:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b0ad1b9-56bb-4190-3644-08de649620f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|42112799006|1800799024|376014|8096899003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YlZSTWFNcGFkV1pScUFSMDYxQW1LS2l0YVVGVmZJeFltK1RWeUEzSDNQVkp5?=
 =?utf-8?B?YXBsd2VCcXFaTHZxaVhMMldlVC94Tm1WNUw0b2F5cmVkcktJQm10ckNoaEtH?=
 =?utf-8?B?eU43dTJHMW5RNE1OWlRUYlpqdDB3bGpjcUlkZ3prWUJMRkdUcDZZUW83c0Jh?=
 =?utf-8?B?ZW1BQ0M0OEwzQzYwbDB0RjJFMXE3bmQ4SUhWZTVoclo2dFhlS2JyaWpXUGpC?=
 =?utf-8?B?SzBNQzhjcktTWjBrclVxYUI4dFBOZHZTT3VrYVZFZjYyajhpYW80N1AzOHFO?=
 =?utf-8?B?YlJwZWMxZVdQVEZsWFdzWnh4TkJTeWZLYWR2bW9LT1AxYVJ0c25OUGR5TzBv?=
 =?utf-8?B?dXNNU25GcVRvZnBZZWFsMUpFSGRQbFJtWWtJOTNWYzdtU2R5cDVIeGdKUGxI?=
 =?utf-8?B?cTVSSG9SMHBYb01CTE9hZWhSbXRZQ095eXhqS3pXdWZ5ejRRTEo4Z0c3eDAz?=
 =?utf-8?B?b1B2S3FZUmNiWDJ5dTIwVnZYQzM5cElJVVZJZ3k0aWwrRUpGc1VSN1hPeDhC?=
 =?utf-8?B?TFNRMkJydy9ZMWFDV0JjNEJ5QmtiTWFZMDZXZEgraUJEOXFWVWtWRmdTcDFX?=
 =?utf-8?B?T3A1aHppWkttT0JzemMwaTQ2S0dkeUJWSXZxU2VOSHp2SlA2YlBzOXB2YWwy?=
 =?utf-8?B?V2FhWS9YR3lzMTJ4NitoRkRmTEhZWk1KTmZqSHZIQng2eTd6OC9OTkpLTyti?=
 =?utf-8?B?ZG00eFhoQXVoY3VuR0hRU2U2aWlFN3BtUytCZkJ5S2FwbG1iYTdQbUtzUDVG?=
 =?utf-8?B?a3RnZ3RLUGZMVC9iRzcwNUM0TmRFeUJyZUY1b0VkZ2h0Y3lNVFBjT29Rclha?=
 =?utf-8?B?ZmxJWWdKMWRzSFFsUERwSUxpWksxZ3k0bDN6QnI4K0tXTkpOWDlsR1FwY2da?=
 =?utf-8?B?NkEwM3pKa09wY0tVY05vanBMb0RkUlluR3NqMFh1ZzB1eUVUUiswbDZWUVI3?=
 =?utf-8?B?b1pFRU9xQnB3UTVlV0haNWZQQ0hXZDlFbFZhRVFCOVduaEFVclBVaW1vMnRZ?=
 =?utf-8?B?NG1zdEJ1OXBFaitPSmlGWmhTd3hDRHBxdFpHYjA5RXRoNTNtcFFZWWswUE9U?=
 =?utf-8?B?UVo5M1cyRHIwRW9qSFpqTTNaU2U3R0QydjhWdDNIZDQydTBzeE9WaFBqTUVN?=
 =?utf-8?B?ejVYWTl0VXRCc3BubHFxRkdydzcrcENWYW9QQTFLdkx2Z1AwdXZEc0FsMytQ?=
 =?utf-8?B?SmtvQWIwMEw1clY4QkhZQ3NBOW55MS9CU2NuSVhRU3laN21wdWIrSUFRQkFh?=
 =?utf-8?B?TlJ0d0J4VC9CZnRPUTZJVi9iRExHYnZMbkIxSDNkczZPMk9DNFVlcFJGdWQ4?=
 =?utf-8?B?WEpQYWpKTEozVHBZMnNYVjROeWxVb1JxU2lONzFoN2FkbFZ5K0dSL29iQVZD?=
 =?utf-8?B?SHpMWit1Uld3T1NTT3lmMWRLNXFVNzlxUy92QVl5SVdtOWcrZFdyMFBmcTRY?=
 =?utf-8?B?TytLVGp3cWlXU09CUjdWUWJPK2hRaDdEUXB5bVJHdXE4dzlVWDNNdnB1Tzho?=
 =?utf-8?B?WGJla05YUlF1WDkyV3ZLZkJJQjEzdTFMRmpSRXUyVCtnNW02MHQ5eCtEMk9n?=
 =?utf-8?B?c1NGaGVCVEpsN05vVkQyVEhJN00rOUN2d2F4bDI5aHZEc1RDd3BpSVpqOUpy?=
 =?utf-8?B?Z0RyWlhBZFVPUDNidlF5RnFiVzMveUhvN0xGODRYSWpjWEZZVU1wb1hVZ1Z3?=
 =?utf-8?B?TWs0aFM4STMxVUN1R29VUmh1dzBzZXVtV0gyeHVpT0t5SC85NVBsU2kvMUxR?=
 =?utf-8?B?WHZSN3pRMzcvbjhZdTdGbGVCdzMxbG85aVVnK3k4emhOSGNNeVNBcmpUMWhD?=
 =?utf-8?B?QzJUOGVQTkxLdndxNUJKSUt0N2o5Z09rYnFHckFPTDhBMXZ0bWJReVNiNEJF?=
 =?utf-8?B?MWFRc3gyMUJHa1VINjB5WkJ6MEtxZnZNb2pKQmdORXBvSmtsWXZhQ3Q4d3Yw?=
 =?utf-8?B?SUlMaC9sc0czTmlmcDJoZlBGL1FXdUdXOVNabk1PeGgvWi9SR054VEdnYVFn?=
 =?utf-8?B?Z1dyOTFYUmJTRVNOdGNNZzYzVHZ5VTVPTTk5QmlSRTJ6eXlGMURvMGs0VllP?=
 =?utf-8?B?Q25wdWNVZ3VtTWdQcXdGcDBnbzVFRmYrbExBNExJVE9WZ01TcVloNnBtejdB?=
 =?utf-8?Q?Ffyk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2589.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(1800799024)(376014)(8096899003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QkUzTHVxVWdZc0RXeXh3dGJmek02NGJNdXBZK2JsTnZUWkZOV0lxNGdFZDhI?=
 =?utf-8?B?WjJKUFR4SXo4UmNMdVNmbW5MK1ZNN3llYm5uSy9keWZVME9hZGlLMlk4VFl1?=
 =?utf-8?B?MFlUQUg4VE5EYzJROGxKZVh0VVhYaldFMCtoUW5xRTNmelkyQ2pzQkxqbzlP?=
 =?utf-8?B?Mkp4czdCRkNNRGUrWFA0QW52ZWkzYVJpZ1pWeDQ4czl0TUpiUFBMUU5QV1E2?=
 =?utf-8?B?MHBRRE44bmZUYTJTL0NDTnN6MytNMFQzM3JsdEFsUEJFWlZoWVJ1MWgxcVZ6?=
 =?utf-8?B?YlZteklQRmVFMEhaelcyeUJmMjJYVzBST3lzSHBVOWxsbXI0UVZaWFJYamNM?=
 =?utf-8?B?czNzMEZVSDFUWEwvblJyQVRRWlhOMGpNTVVoRWJMZEZ2Y1NsVmVscnNxUDF5?=
 =?utf-8?B?MkdGQ2FzVU44VS80ZTJSbXlRcnZqZytWSDErT0dwNFpnQkdhVmNMOWFNcEpy?=
 =?utf-8?B?Mk1UV1dZYkRiMndZTEtPZFBBNjMwSERDZHorR2hqSEdZb0VBSy9qbXBjKzJL?=
 =?utf-8?B?bmIxeWNwTzJYRWh0dG5lV1U0MmJWbjcrd1FsQytpR0lwTFJ3QktaZ3B4Lzh3?=
 =?utf-8?B?UzVld1VLSDRnQzVnOHVscXUzUTdReUVFK0RzbkxJUWpZVm56T1ZZNHAxaW5E?=
 =?utf-8?B?bkpYTExTSTB6Y0ZReXlnT01DT0RiVTVrWVBFWTlKSnBtK1lJS3dyd24wRVFj?=
 =?utf-8?B?R3F5VHlOMTdqR04vamdKdTVtTkJZYVd0dENsTXlkSXlGK2kxV1p3ZkJKVVp1?=
 =?utf-8?B?SnZPS1p5TE0weWtraWt3UE1wNVlnbjlHcXcycDU2OUxUMzVHV3RUSHFCWC9q?=
 =?utf-8?B?MW16bzNxRkhoZXk0cmhjdkh4SlpySytmb0UzQW56M3ZRMGVwWnRLZDdmSGlN?=
 =?utf-8?B?aXQzQjNKVEhHVUZEbjlxdzhGNVBsSW5WQU9aeDIyakpYSzZWMXFMS1FjNGpO?=
 =?utf-8?B?VmtsTUlmeE8xYm9mbVl1SkQ2d1lpa3ppcEswT3hwTTBDY2h3dTErRVhUU0Fq?=
 =?utf-8?B?aExGRmF0dWc1a0JVb21lcnUrQUlyc0xwSE05TmxocWpWb0xVWGU2OHMyMUhY?=
 =?utf-8?B?TnV4QWFMYkthYThyUmtQYW4rWW9JTyt0b0gwQlNUSnpLTGFidHhVcDZwQ0tm?=
 =?utf-8?B?UU1IQUNyYlVaOHU3cnJHRzlWNVVUMmk4ejZGUDRHc2o5eVgyTGEvUGtmVGtJ?=
 =?utf-8?B?SGhjUTY5NmpMbVExQk1pOG1ySUtxYy9jMVVNSjM3YVR0WUI1dHAwaW1LZy8x?=
 =?utf-8?B?b1dkVURKTURBeElPN3lFV2xOZE9wUy94clVKTm0vdHlMRDZBdktjMEdLQ2gz?=
 =?utf-8?B?bW1OY1dHZmU4TGVwaEdpbzhHUVU5b3hWL3J4WGNtTlpnRHBzQTYrOUFzVy8x?=
 =?utf-8?B?ZDRIQk1pTy9HYlczSWJQbm55Y2Irak9jSXJ2a2laWTNIQ2pWVUxYSmFGNHJ5?=
 =?utf-8?B?TTdkSnVzZjZHeFc5TmFMUEVMSXRVUzJSazljTmZSZUsvanZNK0k1WWpEWDR0?=
 =?utf-8?B?bmxndmNaQ1dLUUlETnY5eWVONCtNK0hGUlhXNStDWlVsU1RCVnVvM3pXOHd6?=
 =?utf-8?B?RzhqYzc3WDgzZENNTnQrUVRQOW1LMmxreWtCR0Fqd0ZvWG16Zk5ndnhXdUhG?=
 =?utf-8?B?TStiNHNWczgrckZKRkYvdmhOY3Z3NksyRzJQL3pWUkdtRWRxYzZkb1hUMkhW?=
 =?utf-8?B?VDQ4TzNFbmNuZk5jN09GeS9KQ1R2dERKL29xM3padjBKOEt3d2JhQU1hQlUr?=
 =?utf-8?B?dUVpSzJEc3lUR1FXeWNoTHFIUjVnZEdhMnQ0ZGVBc1Z1VXd0WSt1ZmhpWmxk?=
 =?utf-8?B?MGhiMURuQWxaUExzZWFEQnRFUFk4NklPaG9YcUl6ajhpM0VJWWtGUURJTks5?=
 =?utf-8?B?VThtTEo4MzlyMktUM3dsQ2FtenkyMWJQR1d1cDdtOUdkaG81MEpHeUhhdzVR?=
 =?utf-8?B?MXg3RDFhSGJjZzNjVEpLQjVvVzI5eEJWTTJocWZjeDJaREpmOGVNKzA5UGt2?=
 =?utf-8?B?b0M5U05CVkVNNUh0b2syRnRmYXJiRFl4VEFSNGJDYklQcS9IQ1lDT1grd01J?=
 =?utf-8?B?RjlRTVloaG1BMlpZSy9jSFE5ak9Zb2NkWTFSMVkyMFJ4aUxsVVEwOXVSS0kv?=
 =?utf-8?B?YWFKN084Lzc5T29oN2xESUZ3QnB1dDRxcXJwWVJpa01qcm9KWU93aDNIWmNB?=
 =?utf-8?B?aHhXaUlGb3duaGYwWU5NZER5bGhvTGtKWGFFTFA0Q0RMM3M5cklxUlVSYlRa?=
 =?utf-8?B?VTZiZzdxMWhyNHhMY3MySzhNaG5wSlB1UnlkditaOW5rSFBIZFp0U05Sdito?=
 =?utf-8?B?UG9KVForWUZIUVNDd1l0Q01tS1Z4a3RrWXFwakJLSU13WWFuN0tzdz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0ad1b9-56bb-4190-3644-08de649620f7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 09:08:29.4986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xR1kBZokRpewBkpgmOzc34lOD5tZi/6lbYDmlPnwhm5rxuoWykeXjphp52Wt8LXrS5VGjbD4yktSL5SgNvIneA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=KtlAGGWN c=1 sm=1 tr=0 ts=69845e11 cx=c_pps
 a=JWHULccnNFljT/M/1wNMbA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ag1SF4gXAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=oxlhB1EPqofZvF1xYbwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=YdR4HWkEApw0X9Xmow8A:9
 a=LyzZvqL2xdjf9Nr2:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: i7XLB9hMPJXixqBdzqMsn9Y1EP8gRKGs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NSBTYWx0ZWRfX0jsSaTlYO7wR
 oBH8f3mGzngGTVeHFMn3jen/Gz4+5q4wW31Bg8akQXqCGKvwSBNDEmPx5OU1nWGAK3ox/po4GGo
 SxGz90HzGxMp2R093qX5PCclYOqzXq5+1LG7718Uu64BDUT4OtkJymLYHFbk/O1dPPsGQFdQcrW
 XpiuF1VHagIUFiCHUTPT95UuRXqOYNx8CIWJICOZl9y312DGSTsPKu0DcvDL4+xVCE9Uju7hL3d
 d34SjYdVqYTmwVtyzFbLZm+KGMLUWGXtWveIn2cEWTecUSBAWjkYTfdxuw3i5JG+Big1M9b+0qV
 JT5q2xZ9blSb5ApwiZdazgAYq4ku+KgkABgmzaRcOqspPERdd24NkGScpYwfjVuS83RzJ0YBVKP
 PAAvtA23pngmrICjwLcHO4++Krf4Zymjzov5BXFNoTz6NSf/FrhcHsiLoCK3/lw8uH4MPv5F5a+
 El9bDrnkP+U1jE10azQ==
X-Proofpoint-ORIG-GUID: wSLCX_6x8imnTya3x8k_o0_uq544xNJC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 09:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230568

--------------8ZkJr8h7zsXFrntNyMHZYO5K
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6155vBsS2127478

On 2/4/26 23:53, Richard Purdie wrote:
> On Wed, 2026-02-04 at 09:10 -0500, Bruce Ashfield wrote:
>>
>> On Wed, Feb 4, 2026 at 9:05=E2=80=AFAM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Wed, 2026-02-04 at 09:02 -0500, Bruce Ashfield wrote:
>>>> On Wed, Feb 4, 2026 at 8:58=E2=80=AFAM Richard Purdie
>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>> On Wed, 2026-02-04 at 08:46 -0500, Bruce Ashfield via
>>>>> lists.openembedded.org wrote:
>>>>>> On Tue, Feb 3, 2026 at 9:09=E2=80=AFPM Kai Kang via
>>>>>> lists.openembedded.org
>>>>>> <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>>>>>>> From: Kai Kang<kai.kang@windriver.com>
>>>>>>>
>>>>>>> Check whether kernel config CONFIG_MODULES set or not
>>>>>>> before do_compile
>>>>>>> and do_install in module.bbclass. If not set, it cannot
>>>>>>> build and
>>>>>>> install external modules.
>>>>>>>
>>>>>>
>>>>>> This isn't the place to do that check.
>>>>>>
>>>>>> If modules are disabled get modules_do_compile out of the
>>>>>> tasks.
>>>>> Does it make sense to have something including module.bbclass
>>>>> which
>>>>> doesn't have CONFIG_MODULES set?
>>>> Yes, that's what I'm trying to say.
>>>>
>>>> Don't even include it if you can't build modules. That puts
>>>> the conditional in a single place, and keeps the code cleaner
>>>> in the class.
>>> I think we're talking cross purposes a bit.
>>>
>>> The issue is that if you ever reach do_compile in something using
>>> module.bbclass which does not have CONFIG_MODULES set, that is a
>>> problem and a hard error.
>>>
>>> So I'd argue that:
>>>
>>> * we only need the check in do_compile
>>> * it should be a fatal exit hard error, not a warning
>>>
>>> which means the patch needs tweaking but not as you're suggesting.
>>>
>>>
>>
>> I don't have a strong opinion, so won't object.
>>
>> I just don't think adding any conditionals for module support in
>> moduldes.bbclass makes sense. So one versus two checks
>> is a wash for me.
> I agree the warn conditional isn't quite right. I think it should be:
>
> if [ CONFIG_MODULES not set in config ];
>      bberror Broken config, CONFIG_MODULES not set
>      exit 1
> fi
>
> so it is basically a sanity test that the config is valid.
>
> I'm a bit worried about what I'm missing though :/
The original problem is kernel config_modules is disabled, then external=20
modules such as lttng-modules can't be built.

Recipe lttng-tools RRECOMMENDS on lttng-modules. If install lttng-tools=20
into image, it fails to build lttng-modules.

Kernel config CONFIG_MODULES couldn't be checked whether enabled or=20
disabled after bitbake parse. Then there is no chance to remove=20
lttng-module from the dependencies. That why I check the config during=20
the do_compile and do_install with bbnote and generate empty rpm package.

Regards,
Kai

>
> Cheers,
>
> Richard
>
>
>

--=20
Kai Kang
Wind River Linux

--------------8ZkJr8h7zsXFrntNyMHZYO5K
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6155vBsS2127478

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2/4/26 23:53, Richard Purdie wrote:=
<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:260247994ff827c43a775d9f549dacb=
073e60f5f.camel@linuxfoundation.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Wed, 2026-02-04 at 09:10 =
-0500, Bruce Ashfield wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">

On Wed, Feb 4, 2026 at 9:05=E2=80=AFAM Richard Purdie
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:richard.purdie@linuxfou=
ndation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"" class=3D"moz-quote-pre">On Wed, 2026-02-04 at 09=
:02 -0500, Bruce Ashfield wrote:
</pre>
          <blockquote type=3D"cite">
            <pre wrap=3D"" class=3D"moz-quote-pre">On Wed, Feb 4, 2026 at=
 8:58=E2=80=AFAM Richard Purdie
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:richard.purdie@linuxfou=
ndation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a> wrote:
</pre>
            <blockquote type=3D"cite">
              <pre wrap=3D"" class=3D"moz-quote-pre">On Wed, 2026-02-04 a=
t 08:46 -0500, Bruce Ashfield via
lists.openembedded.org wrote:
</pre>
              <blockquote type=3D"cite">
                <pre wrap=3D"" class=3D"moz-quote-pre">On Tue, Feb 3, 202=
6 at 9:09=E2=80=AFPM Kai Kang via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:kai.kang=3Dwindriver.co=
m@lists.openembedded.org">&lt;kai.kang=3Dwindriver.com@lists.openembedded=
.org&gt;</a> wrote:
</pre>
                <blockquote type=3D"cite">
                  <pre wrap=3D"" class=3D"moz-quote-pre">From: Kai Kang <=
a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:kai.kang@windriver.com">=
&lt;kai.kang@windriver.com&gt;</a>

Check whether kernel config CONFIG_MODULES set or not
before do_compile
and do_install in module.bbclass. If not set, it cannot
build and
install external modules.

</pre>
                </blockquote>
                <pre wrap=3D"" class=3D"moz-quote-pre">

This isn't the place to do that check.

If modules are disabled get modules_do_compile out of the
tasks.
</pre>
              </blockquote>
              <pre wrap=3D"" class=3D"moz-quote-pre">
Does it make sense to have something including module.bbclass
which
doesn't have CONFIG_MODULES set?
</pre>
            </blockquote>
            <pre wrap=3D"" class=3D"moz-quote-pre">
Yes, that's what I'm trying to say.

Don't even include it if you can't build modules. That puts
the conditional in a single place, and keeps the code cleaner
in the class.
</pre>
          </blockquote>
          <pre wrap=3D"" class=3D"moz-quote-pre">
I think we're talking cross purposes a bit.

The issue is that if you ever reach do_compile in something using
module.bbclass which does not have CONFIG_MODULES set, that is a
problem and a hard error.

So I'd argue that:

* we only need the check in do_compile
* it should be a fatal exit hard error, not a warning

which means the patch needs tweaking but not as you're suggesting.


</pre>
        </blockquote>
        <pre wrap=3D"" class=3D"moz-quote-pre">

I don't have a strong opinion, so won't object.

I just don't think adding any conditionals for module support in
moduldes.bbclass makes sense. So one versus two checks
is a wash for me.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
I agree the warn conditional isn't quite right. I think it should be:

if [ CONFIG_MODULES not set in config ];
    bberror Broken config, CONFIG_MODULES not set
    exit 1
fi

so it is basically a sanity test that the config is valid.

I'm a bit worried about what I'm missing though :/</pre>
    </blockquote>
    The original problem is kernel config_modules is disabled, then
    external modules such as lttng-modules can't be built.<br>
    <p>Recipe lttng-tools RRECOMMENDS on lttng-modules. If install
      lttng-tools into image, it fails to build lttng-modules.</p>
    <p>Kernel config&nbsp;<span style=3D"white-space: pre-wrap">CONFIG_MO=
DULES couldn't be checked whether enabled or disabled after bitbake parse=
. Then there is no
chance to remove lttng-module from the dependencies. That why I check the=
 config during the do_compile and do_install
with bbnote and generate empty rpm package.</span></p>
    <p>Regards,<br>
      Kai</p>
    <blockquote type=3D"cite" cite=3D"mid:260247994ff827c43a775d9f549dacb=
073e60f5f.camel@linuxfoundation.org">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Cheers,

Richard



</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------8ZkJr8h7zsXFrntNyMHZYO5K--

