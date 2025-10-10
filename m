Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF553CCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 16:11:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.165.1760112695463584624
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 09:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=GaPF0vL8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=237847d218=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59A6egIc2114693
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 16:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=kwsRGODHUH4aPR6Q5BQgRR
	YfzoMXhrVO7KU8kV01zNI=; b=GaPF0vL8HbbeapIXNbuUbNXXoUnOpHBf+G6nYx
	apj/Xc5GRH9iW6jXmJEwbKqdzLJMK9tp6UQPN00bJtbAn8iaA9t58x6MdxFa5F5L
	0IeJAurKVyd6DJfc/Vaga4kb/fCLqymtRwcI8+/GXjl4MZpmx4D56m1gx4basRvT
	Cwd6kSI2OUldkqFdA/Z1taO5++DMYC5R1pNs8/SSQ5uo18aTK+RtCfIxQQDc9E+j
	PUpxeRq0ppZgl60R2x5ou/nkns6dpKc/Jib/zxfJkS9JI3ghYsWJGPxBk9Asw0QA
	fMhwceh70d+KVRYyoEWyaFI6Hp7Ee+ZZXaVlu+5GhlwmiBDA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012010.outbound.protection.outlook.com [52.101.53.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49nx37tcbt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Oct 2025 16:11:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sI3lJBPorA2zonietAbS/xZReHPhFF+snVBK1dYgQfICalGPPyqeO/u8PEH9DyCNPdINQm9Z4bCpIQW5p2+egGHqume7KaKY4ywd3vpL13JU/GTIfkj7g3DG82uQvEGJGTv1U9T42uxou4l+f2JGGRzQ0X3DHQAivf8/2t9vWEOTXxUkN4p4Jj3ORZ2VV3OpNjH4OMuIxHcTnH4/MDG61ECejy6tzUmvXdJR0r/sBLE/z2ntPsBccoRevGAzWlxl3DPr6U4IyOOi3JlwyiEO28rMIQ7ZQOkc5sRK1eA8HYHBGWEa62bSysaYC3Xd8wpBHpbrJujiDQa4koKnOe3KoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwsRGODHUH4aPR6Q5BQgRRYfzoMXhrVO7KU8kV01zNI=;
 b=y6u8odtC/7p9EeIV5V+GRlVweY+gVryIgKSXPIgz6iT8IbuoyxGFR5C3YCsbjN1DhzRWt2Em2V+N/tXl2TH1jWABP3kPq28t8kCeHDs9ciQ/nfjVtWDmbgAyuGhDol7nX/PdNW6TIxo6oMo+fyz3ouSGO3OMZqXV82C1nm4cCrWnjjqedqwc97Q5fG4e3yyiziGE5wp5OIW7ybqKzIF/FHSHDbLbMy1fIf/VPcIXUfJRWsAaM9D5gO/KsfFr0gH2kPCxuhH57jn18HtzQIGI7QEVIco41adgDNK+8r/wuLYP61hhNVieqq92SgDvuvEsVuZBoHrbT3N3O+p5K0TBfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS4PPFDB7809488.namprd11.prod.outlook.com (2603:10b6:f:fc02::56) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 16:11:30 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 16:11:30 +0000
Content-Type: multipart/alternative;
 boundary="------------R6fI8M0RyjA0h6vJ42AA0bof"
Message-ID: <f5f6dea2-85ba-417b-a65f-041a0ba6f0fc@windriver.com>
Date: Fri, 10 Oct 2025 12:11:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] rust: building UEFI software in OE
To: dmitry.baryshkov@oss.qualcomm.com,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
        "Shinde, Yash" <yash.shinde@windriver.com>,
        Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
References: <rkasjmloevi7fplsyvh2s5z5wxmulvyrewrol6kjlcgn64oe63@5ajr7yfw547a>
 <0f0773981e12d39f55edeb24a82aa5793b3f80b5.camel@linuxfoundation.org>
 <tnqvt5akhc5f77hicxjmbkwjlhsgnccwr5gywc6zntrdepdjc6@4ayi5e3gwgt3>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <tnqvt5akhc5f77hicxjmbkwjlhsgnccwr5gywc6zntrdepdjc6@4ayi5e3gwgt3>
X-ClientProxiedBy: FR4P281CA0361.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::17) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS4PPFDB7809488:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a150c1a-b0a4-4fce-6ebe-08de0817ac6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RnVWeDFkVmxGT0x1aDVEVW5iV0ZxMGFld3NYUjlmenBWOE9WU2ppU3dnenFR?=
 =?utf-8?B?WEwrSVVkTmp5L3BsQi9ucVNib0ZDd2tzZG5pV3JORU1jU3UzbHhSOXU1aTBH?=
 =?utf-8?B?UHRJbzZqc3hSMThHSzUwbzU0b29WKzZqcjFHT3pRRWl2bnVGODhiazVoMWtQ?=
 =?utf-8?B?K1diZVN1ZURxZXB2VDFud09SYytuSHFBL1J4MGdVYlNEd3hpcHhXNzlyODVn?=
 =?utf-8?B?cTFkZk15VmdYYmpJRmNkRVFqeUo5Q3lNNE5yY2ZWalZWSzBCUUY3bUZWRitK?=
 =?utf-8?B?djRSdmpsOUgzaUN5Z1RyQTdmbXJEK1NuZy9ibUFrV0lPayt0bmh3MXoyanlO?=
 =?utf-8?B?amhIeXVzc2dZd3JCNm0xcWF2OXBXU2NmT2dDaHNoQnAySlNkTlB2RU91Nmtm?=
 =?utf-8?B?ZjRHdi93Q294TllHNVJWRm5QM09BQnVDWEJzUm42Q00vaCtmd3BtLzN6NEZV?=
 =?utf-8?B?R3Y0QjBOd3ZhcENpQTMvT3VPdUU3eE9pN3ZPakIrL3BSQUxjVkVZV1dDME9m?=
 =?utf-8?B?UEhuMEM4Nm5uMGl4ZGlnR25TM2gyK0FKQkFZUUFGMnZPUjEvbHA0MS9Ud1BP?=
 =?utf-8?B?dXdtL3gzNndJZU5Qd3JLQ2JycUxWZGxYdmhWSFBicUVZSitlN2JHZU5wUnVB?=
 =?utf-8?B?UEVLRE9ndVVmWGprWVhydDc0MGt6dW5YbmtoREwyTi9IQzVlQlIxLytCVWtw?=
 =?utf-8?B?d1NQRlF2ZWlRanNOZkpTbkd1M000Y2IwZ1QrQ3lqWEpUUzBUcW5HZ1VSdXdj?=
 =?utf-8?B?Q29JKy9WaU04elZFZ2laWlVhVS8veEpqMG95dmdGWHRQeHA0Z0ZFaVMyOCth?=
 =?utf-8?B?NDRoeXFmREpkdWQ3ZzRvc2FaN0c5QzhzQlNQVDYxTEFYQkhIWmY1TElxNDdu?=
 =?utf-8?B?cWZkUk5EV3BmaEFLd3BuQU5TZXkxV0JFVHpJOEFkRitNc1IxS2U4enVwRnhs?=
 =?utf-8?B?cTdZNTFWVUpBQjFob1JaT0xkeDc4b1JCREw1cERpbFdVaHlGQk54YlF0Y1RS?=
 =?utf-8?B?VTJsbUo3RldOK0RCYTR4U0dGWmtXWmVkRXpCMXcvMkNiOUl5TG5YYlpldEds?=
 =?utf-8?B?Y0ZUTFcyVFVtTXZ5RGREeXpIcjRjZkJhRjBlaCt1WGpmV2VDZ3R3aytvRjl2?=
 =?utf-8?B?MlFhZzFpeGdOYkthdkRyWmNzVU5SUzUwQURCUVlqcUxyWjdoem9CNmc2dnY2?=
 =?utf-8?B?YkJxSTEyWjNzTjd5NTIzM3JHdllHcnBHanhiT203S2RmYnh0NmpPcS92QktS?=
 =?utf-8?B?aks4SS93NDMrQWRYR1FYTTdyRldtcUZVUzN2dGNyME45VlpySXc4T1hnWDJS?=
 =?utf-8?B?TXR3LzZFMjdhK1lqOXhYNnhTRkRoUU1vMFc1Y25ESHlDU3pVUWNQMjFvVjRU?=
 =?utf-8?B?MzlvYlNZQStQVWJOSlRCZURYa2FFSjkvK0RHSU84UHlNVC85N21rUGVHVVV0?=
 =?utf-8?B?RFpwQUNsY2FCcE12YXM1WDNHb0htOVI3RjQ2TzhacVQweVNmckhPMkljTURj?=
 =?utf-8?B?YjJ6R1NVQU5iSjFZRDJ6MEFGc3IwT3BMYmpzRUg4b0hNRURDYXpWL2l6ZE1D?=
 =?utf-8?B?bXhzbkRLTzJyUlFha1k1NUFDWDZIc1hjUS9WK1pvNUxPMm1Ua0xrWnVIekJB?=
 =?utf-8?B?TElnd2FCK0hKMmlLTDdER2FHL05welFRUjR0bGRGYWJmVnRvOUhUN2FndnJE?=
 =?utf-8?B?Q0luQ3I1ckZnZjl0em1FU2hPNjNVc1JrQU0vR1BENHVhVUYzRFdSVFAyTGE1?=
 =?utf-8?B?M3NXa29pd2RNZ0M2QnVDN2xoOFB0NUdaSmc3YVM5T09vZ3VOcFhRQVJwaXkv?=
 =?utf-8?B?Z1JrakV5RFFtNnRLa05ST0FTT2tzL2hyQURuNHU2K2dlVTJUNWIvOHFEM1Bs?=
 =?utf-8?B?WEM3WGJSbUtkcHBKWmgvL1c0c2pENVFySytmM2hjYXlOQnc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R0ZFa1RiKzdDcGNsOC9mcWcxcStFaXR2cFhtejErT3FvWXFDNWNyVkN2TlNK?=
 =?utf-8?B?U0JRK2xtMnNiNXNxUnI0K2RUOXY5cUZqTlJoTGMwNmtOQ0s0YkRNR3c2SXY3?=
 =?utf-8?B?ZmR0MVpzN2NkdENpNDVmZktsYWxsNHAwVmN5U2VYRDJkb2htYUh1UCs4aWMz?=
 =?utf-8?B?SWlKRUZ6WUtzdU1HeWM4QS9NT0Q4cXFYTzhWN3Y3dEttaU1rdGJUYkx2RnND?=
 =?utf-8?B?UmEzYy9HNGFraHpGYUc2NWtOSmp0bTRZU096ZUpGWkRIMDNET3N5QlpkWG9V?=
 =?utf-8?B?WUQwV2JiOXlqK1ZiOGRadUJMR2NUT0oyRm43NW1vYXpoRnZOSXhaTjJzc0pu?=
 =?utf-8?B?ME5uekFqNWcybzAxL0pYRzAwSmRxRmY5WEpYZVN3aS9FWDVFVVAxR2R3dXNu?=
 =?utf-8?B?WFA0WllaTk4zNEhWMTY2MkJxTTRqVGhUZjdnT2o0Y2U1RUt0UEJRRUdpZjZa?=
 =?utf-8?B?SG5kMVFoU2JxeW1uUWZwZUxQcnI5WHdTV0M0SzFkamFkTGFGZThDUGFFY1Jw?=
 =?utf-8?B?bkZEN0dKcnBsQ05waHQrbWtmVUczeVkzOExGcWNFL3MxaVlwMUd0S3BGdEpk?=
 =?utf-8?B?OXFTZlBjZ0ZqUTVkeERuWUQyR1lvV2loR014c1JFL3BOdVpuRFgxYnV1QWhX?=
 =?utf-8?B?eUhlTVQ2cW1VNnpKYVZ6WTZ2eFdjbEpsS2x0RXZxRnFyZzdoRG5xOGtvVGNs?=
 =?utf-8?B?UGNrdVBJaXhFRVBZMlVYaTMwYnRNVUNGMmFKNElwQ054TUt6M2w0b09ZeTJW?=
 =?utf-8?B?OWNSTWQ5KzN0a0V0VUkrZjYzTWZOWDZjcGp3TGw1bEt1WmFPUjJnYWJEQUdQ?=
 =?utf-8?B?M0Q3dUtwaXgxSVZsRnZhNU00N0YyekVxQ1daT3BEdmhVSlpacG5KOHQ3MnJS?=
 =?utf-8?B?MFhPSDN5UmVsNy9YWUZqeHpZYmcrZDlrUXBpeWx1ZkQ2a20yMktMdkZZSkw5?=
 =?utf-8?B?QVNIeTg5L0JTQ084djgxWmEydDVvcUtjbURMY0RZZjJDTGExM1dDYkxtZXdO?=
 =?utf-8?B?VXZzdlNGSmlwRDlnTis1azRWblE3WlR2SHhkMUoyeDlFeFFXd2RQVGVUclRk?=
 =?utf-8?B?SzNQbFQ3WHFBMnJ6MGFSV0JrVVRSRjZrMTIrYTFxN1FUVzI2dkFCYlM0RlF1?=
 =?utf-8?B?ZjZ1TjhwclNpSDJjNFRUWEs4a2lMSzJvREJyS2h1RkQxb3c1RDJrQzRjdG1k?=
 =?utf-8?B?U2lOcVRTMzFNSTJUOURtQWd0OURaRGxmSkU2WjNGNnZQSWFCcithZXhSOGJa?=
 =?utf-8?B?SE9rQ0xpY01EamorOTc2dDlaWnZCS2x0L1htZHJtTDhiUnp2RzhSZ2tYN0Nl?=
 =?utf-8?B?L2duQzN0eC91N1N4ekZxcDRmQ01iU3VuUW4vWUlaa1ArdTRVTlZnWDA5WU9s?=
 =?utf-8?B?SDArM1JacG9LbzRORGcrblAvZHk1SWpGNTZTRHVCdUFHaGh6T2xEdmRHcDVU?=
 =?utf-8?B?Mi9HRkk3aUJsclgvd3RIZUp3Nk1IRHNaLzEvMG5lMUQ4emZONnlFOGcwRXZX?=
 =?utf-8?B?NU53YThWN0JhSGo5TWlMdWFWS1pHRmNua3dRWGJjR1JYRWVFaFduVWVhcnAx?=
 =?utf-8?B?SjlnOVhLQ1pUYjZBVXdZamZ6WitkM2ZNZUh4WGR2clZ1djRNbk1WeERKRVZk?=
 =?utf-8?B?dGZIdXJJM0hXa292VThXdTljUHE1RkpDelJ5TngvN0pEZWIxVEJVcGZlelhm?=
 =?utf-8?B?aWt4K2hOczNiR05rSzNndmtrdC9Dd05VWG4vcWoxclVnNm9aa0VQN2dPRDJy?=
 =?utf-8?B?cGVZTU4xZ0JYa0hDVC9qUkhOMjBDYThaL0xkOW5XVjRSZnVwM2JIckxFV0Ew?=
 =?utf-8?B?UVp4SHJraG01cUlZRlMxeHlHK0FrOEk1ODZUcU4ybDRTakhjd3BZMWNlV0l3?=
 =?utf-8?B?SkJtaVYxU3RZNWRYSGhpSUZ0aUQxU3kvZFk1VlViTktTWSs0UExEQ24ySXZP?=
 =?utf-8?B?SkpjWXFCTHovYWprYkp1MVdraFdmRmxuY1krRDVUdys0MUVsL1NaRWdURmpZ?=
 =?utf-8?B?aVlGUzZ3NlI3M2VLU1VnTEtuckVaTm9kaTNWL0pwKzJQTkRCRjIxV25WZUNB?=
 =?utf-8?B?a2VBem9hMENCajl0NVpLeTdBc0xSdjBhMWplMFl4ZWE5U296MnhmUFVoL08r?=
 =?utf-8?B?ZEw0aWdVRmZrMzNxOVF3S1J5alRQd3gxaUU5cXdyTlMvMTR5YW4wYTZaYzRD?=
 =?utf-8?B?WVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a150c1a-b0a4-4fce-6ebe-08de0817ac6d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 16:11:30.5878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u75XsJGJ0SdZE+p1AfkelWBBNjmfRHggsQ5gj4AHeKcRm3Mrh3QhMnmpRfDj7poGvK4/oT9xsPdxCEVOPPgE1qv4CNc494p591jcEF8VDcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDB7809488
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=68e93036 cx=c_pps
 a=bwjaHK0hsJlcehRpTf+kTg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=T7x7SROWXzsA1i0iyN8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=U9HdqPU-miOBb0bjryEA:9 a=-DTRJ4MK_qeGl2ic:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: ef8bCrAOwv6GMb12RWXJ2KrG-TyaewMK
X-Proofpoint-GUID: TOydHD0Tdpcki2obDjmPJH4tlSt2xCPq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA5MyBTYWx0ZWRfXyIawDoGwiAMc
 pSb64bFxEdswY6DRA4a6mf3zQXRgB5IZENic797SoQcAopZm0Y0OKlQPn6TgtFovEHAL5hY8af2
 4soGqwVhVK7GQEJjoNRXbh/6DJ2HcX0GUgB6sZx9pTF8btGbWlN+MgokeVf04aMvPfqzM5s8tLi
 TK8c7vx1qpHiH8sP+OYfNhNSnvubcAuLD4/t7dI9dZ54uyg3UmMx1CJ+KKzqPz3qSJI1pARH6uq
 qdkvOlDzap9A9ouLgU8edu/3lA0YXpvw2qwy+kD58uKee/zjZmXIql+ED2pYcasOzsPGAxr0H3b
 X7s5/S0QaG+7XhBRhAJNJbtJkJEh6ZxCB1vnjWQkWlCB54KyYPAs18lbQv2D6AxxMW9Di68LZLo
 MmTNZj9vRS8GQAG8o2vv/qNJAIppjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510100093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 16:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224700

--------------R6fI8M0RyjA0h6vJ42AA0bof
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59A6egIc2114693

On 2025-10-10 11:36 a.m., Dmitry Baryshkov via lists.openembedded.org wro=
te:
> On Fri, Oct 10, 2025 at 04:29:44PM +0100, Richard Purdie wrote:
>> On Fri, 2025-10-10 at 16:27 +0300, Dmitry Baryshkov via lists.openembe=
dded.org wrote:
>>> Hi,
>>>
>>> I have tried using OE to package the UEFI binary built using Rust ([1=
]).
>>> So far I can compile the crates with minimal hacks to OE, but the
>>> linking stage fails. The ccld wrapper tries to use the (non-existing)
>>> "aarch64-unknown-uefi-gcc" (and fails). The aarch64-unknown-uefi
>>> toolchain installed through rustup uses rust-lld for linking, but we
>>> cannot even try building rust-lld because Rust doesn't allow building
>>> LLD with the external LLVM.
>>>
>>> So, several connected questions:
>>>
>>> - What is the reason for rust / rust-llvm split? Would it make sense =
to
>>>  =C2=A0 squash them together and enable building of lld (which we won=
't use by
>>>  =C2=A0 default)
>> There are patches merging them on the list!
> I think the patches are doing slightly different: they are merging
> rust-llvm with llvm.


Hi Dmitry,

True but we also plan to have a PACKAGECONFIG option for rust to enable=20
using lld.
I'm not sure if we have a patch that could be posted for you to try -=20
Yash, Deepesh, Sundeep?

As for the reasons that is isn't enabled yet, see other threads on the li=
st
https://lore.kernel.org/openembedded-core/?q=3Dlld

specifically those about the build time increase and the ripgrep benchmar=
k :

Also, I assume that the work you're doing in outside of oe-core, so if so
should there be a test case and if so where should it live ?

If anyone else has use cases that work with rust-up but not in Yocto,
please let us now by email and/or by opening a bug/enhancement in:
https://bugzilla.yoctoproject.org/

../Randy

>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224692):https://lists.openembedded.org/g/openembedd=
ed-core/message/224692
> Mute This Topic:https://lists.openembedded.org/mt/115688604/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------R6fI8M0RyjA0h6vJ42AA0bof
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-10-10 11:36 a.m., Dmitry
      Baryshkov via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:tnqvt5akhc5f77hicxjmbkwjlhsgnccwr5gywc6zntrdepdjc6@4ayi5e3gwgt3">
      <pre wrap="" class="moz-quote-pre">On Fri, Oct 10, 2025 at 04:29:44PM +0100, Richard Purdie wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On Fri, 2025-10-10 at 16:27 +0300, Dmitry Baryshkov via lists.openembedded.org wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Hi,

I have tried using OE to package the UEFI binary built using Rust ([1]).
So far I can compile the crates with minimal hacks to OE, but the
linking stage fails. The ccld wrapper tries to use the (non-existing)
&quot;aarch64-unknown-uefi-gcc&quot; (and fails). The aarch64-unknown-uefi
toolchain installed through rustup uses rust-lld for linking, but we
cannot even try building rust-lld because Rust doesn't allow building
LLD with the external LLVM.

So, several connected questions:

- What is the reason for rust / rust-llvm split? Would it make sense to
&nbsp; squash them together and enable building of lld (which we won't use by
&nbsp; default)
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">There are patches merging them on the list!
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">I think the patches are doing slightly different: they are merging
rust-llvm with llvm.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Hi Dmitry,<br>
    </p>
    <p>True but we also plan to have a PACKAGECONFIG option for rust to
      enable using lld.<br>
      I'm not sure if we have a patch that could be posted for you to
      try - Yash, Deepesh, Sundeep?<br>
      <br>
      As for the reasons that is isn't enabled yet, see other threads on
      the list <br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://lore.kernel.org/openembedded-core/?q=lld">https://lore.kernel.org/openembedded-core/?q=lld</a><br>
      <br>
      specifically those about the build time increase and the ripgrep
      benchmark :<br>
      <br>
    </p>
    <p>Also, I assume that the work you're doing in outside of oe-core,
      so if so<br>
      should there be a test case and if so where should it live ?</p>
    <p>If anyone else has use cases that work with rust-up but not in
      Yocto,<br>
      please let us now by email and/or by opening a bug/enhancement in:<br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/">https://bugzilla.yoctoproject.org/</a><br>
    </p>
    <p>../Randy</p>
    <p></p>
    <blockquote type="cite" cite="mid:tnqvt5akhc5f77hicxjmbkwjlhsgnccwr5gywc6zntrdepdjc6@4ayi5e3gwgt3">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#224692): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/224692">https://lists.openembedded.org/g/openembedded-core/message/224692</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115688604/3616765">https://lists.openembedded.org/mt/115688604/3616765</a>
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

--------------R6fI8M0RyjA0h6vJ42AA0bof--

