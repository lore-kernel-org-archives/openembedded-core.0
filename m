Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B432BD41C34
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 12:57:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8611.1765457832916548175
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 04:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Vb+kCtkd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=444065b617=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBC0vJ6174128
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 04:57:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=jT2UY4M00GCdYtZrf1Kw1s
	EhX3+BVgfBmk4RNx3Ikic=; b=Vb+kCtkdS1/T3HrSAUgZBgF5L/VfPbyy2Rb+F0
	k2WCjlcoNMfqjOOjzPurcWXXmbrGwmtijZrgaaggep5CPmxR96+VJ40GaGTRwR0J
	u1RehWbyNQgKE5oDis3ZD27gaKsHogx71mZYB4bSQsvivT7fht2D74YlrNlQYK7R
	hojPGqu5vkf1ByT5Pl6N7P+9xG0sg2l4AT3JC8otRRmp9orxWMfryciSaiBmlLHp
	SWQxJSwq+ITcwMvd8bUx5HsSMiRmoc1KGi499lJ1TPBhocgrNWqOf11hqCedjXFO
	YhfCPac7LFX72Vl0cToMoHjFJlcIXAu1LfZbx6M5iTfD5+Pg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011013.outbound.protection.outlook.com [40.107.208.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay07u22u2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 04:57:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eo0G7/2H0b6RSpddvs014Cywo3fpZl61iBZNfEtaVKIQXApbFrL1NxTXIADJr9JNOf8zcqTX5eF09ey0eXJPoIFXzvlBhVFWvWXpYjnL1D4qUHxmkzBCZ7HF96C0sX7EdlfAFhEVskiZnakEZ0fsoz7uiRYkyzyAGdEDEmqrpdI20cy28nxUOzfNkLQppjzgierpeS2qKL9vU3+yuC5rcYhBd1nNLHq8gnfQJYhiC8nBGdUVPIJDaKIRtcsGYTkVsmCqe0glHU3UIOIfn/qO3J88sL/XISBsB8axkxGDACJtEgOAs4UwLyd2KRKpsHUau0hCNeK0xO2jD6e1/CcPRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jT2UY4M00GCdYtZrf1Kw1sEhX3+BVgfBmk4RNx3Ikic=;
 b=x76WRfuPfLeIZKHz6oPqAeTnN1mJd4crLSfTz9UGr5mdZ77/NfqOZXlGXZ0TPTGdl5iNvDmVCNVGQfYA+HXA7uoJmTomlF6XHcMV69DX5DxbF/0px3+10smjIG4BYcP+Xlr6A784SdCqn1F+BQbOleFtxRbStWrXkiiKQG1DHH+8nRHyzFcxY1JHpWIMpnUD4SQzvnop32CHc3mYFk3zablH4d10QHFTeDg2oM/eVKNqbY6dpqn/jNIQLPmpjGtlNxzu8rdGk/BXi8hp2QGjgemxy3Y6TijMcE3qFoJEe8KbCR5V8c6oPb2INmsKwtR3IjsCXHR5DFcr3QU50mPEjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8505.namprd11.prod.outlook.com (2603:10b6:408:1b7::21)
 by DM6PR11MB4689.namprd11.prod.outlook.com (2603:10b6:5:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 12:57:09 +0000
Received: from LV3PR11MB8505.namprd11.prod.outlook.com
 ([fe80::e59d:2e70:4371:48cf]) by LV3PR11MB8505.namprd11.prod.outlook.com
 ([fe80::e59d:2e70:4371:48cf%6]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 12:57:07 +0000
Content-Type: multipart/alternative;
 boundary="------------OUVmQtiBZXHGn601s1tOti8W"
Message-ID: <6d5e1aae-6ab6-4425-b5c1-d553f44ab0a6@windriver.com>
Date: Thu, 11 Dec 2025 07:57:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] rust: remove passing tests from excluded and ignored
 list.
To: Yash Shinde <Yash.Shinde@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
References: <20251210101803.1120711-1-Yash.Shinde@windriver.com>
 <20251210101803.1120711-4-Yash.Shinde@windriver.com>
 <c1d25645-bafb-4d28-b1f2-31931288133c@windriver.com>
 <32af68a4-a8f5-404c-b7cd-baab63223a9c@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <32af68a4-a8f5-404c-b7cd-baab63223a9c@windriver.com>
X-ClientProxiedBy: SJ0PR05CA0081.namprd05.prod.outlook.com
 (2603:10b6:a03:332::26) To LV3PR11MB8505.namprd11.prod.outlook.com
 (2603:10b6:408:1b7::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8505:EE_|DM6PR11MB4689:EE_
X-MS-Office365-Filtering-Correlation-Id: daeb552e-cf78-4202-0c7a-08de38b4ca63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bzNycUVEWHMwVStRbVNTejU4N1NUcDdjOGR3QjZ0VkhRMXpoemtrL1NpYU9K?=
 =?utf-8?B?YUZQeG9CYTNac2s3eGxCdGRGTis4OUJhbVhPWVFxQXV6dTAySGZ4Z1BtRWtw?=
 =?utf-8?B?R251Y0g5a0lGZk8wampPdVR3TVJOTHJqNVpGeUlFODFYZCtJOSt3TG9JZ2tz?=
 =?utf-8?B?VGRmbG5hdE5tcjdOWEt6UkdNeGxleFZ6M0tvY2VHdEZhRmg2Y0ZQSWVLWDJU?=
 =?utf-8?B?VG1NS3hhOVUxNUkvKzB1TG9HZVFLRHFEdzhtc3MzWGNRcG92ekhPUGc1NUM5?=
 =?utf-8?B?Q1dBc2k4QkxiamxBV2xmWHBsMlBKeDd3b3g3VVhJeklxdnBYOFdFc0dxS0xL?=
 =?utf-8?B?QnBreWtPWm5DendCL0JON2lHcm9jdnRJejErc2RhSWxYeUxGQmpFdktFenNZ?=
 =?utf-8?B?eDJaQjF3MUhwalliTVBpa1ZiUVl0RDc4VnkyUHFLKzRqektvM0hVd1NramN1?=
 =?utf-8?B?ZFhVeDdMeEVmTksxSjVrSVBHeXVrbGtuWDZKWWxZQlFjYWpHdDAwODNodktQ?=
 =?utf-8?B?VExNQnZtRGZNUkRYaXdQckVFQVhKRDg2TE9RdDRWdVRhKzJQK2hZa1d4c1BF?=
 =?utf-8?B?Vzk1cVZNWUFHTEViYW5Xd3VvQjhScS9lay9Xb1hZNkZ4SmpuNXh6M3o0Mkc5?=
 =?utf-8?B?blYvYno5eTBLNis4ZjVPQlFLK1JwZFlYZzJETS8rT2JaaDVVd1p5WFVyaGtB?=
 =?utf-8?B?ZFJ6TEVQWTQ1S2Q0akZTN2czYXdYd3F4N25sTHVqeGZ0S3lsa3IvenhjVzVN?=
 =?utf-8?B?VStYT21xWDc0Ulk2elJ0RUIxQktab01nU3IzcWpLK3RpNERHTnZkSEdZaWV0?=
 =?utf-8?B?UmVxcGFKT08xb28wQ2xVNXJWMjRKbUVPWDVLeGJ6N1lZSlhobGh6MG5MeS9N?=
 =?utf-8?B?ZmZPRkNuUVk0VFBPN1djbHlWd2VKUGlhckM3NG12UDVBd3RtbmJFUXh2Y0dF?=
 =?utf-8?B?MktFTjI3V0t3emdSWTI3TWt5dTBmVnhaa2hKNTV1b2l6VkV0QkR4MCtrbUQv?=
 =?utf-8?B?bi9NQ3lCL0RXc1VuVG1SNWprcVRodW5NNlN6bjBVQXB3M2RLcnU3M0VuVUJj?=
 =?utf-8?B?bnpNNlFsaXlpaEkyTlJ0RE9HY0lLaXh1N3ErWERiUkZKbDBtV2piMDlyekcz?=
 =?utf-8?B?K29yME5EcGFQVlBpRllzbEhBTXhIYkxVREt6UDRpc0xHVlZVZXhWN3BRUmYy?=
 =?utf-8?B?OE44M3MwWG9qVTBuSXN2NkhlRUZYQzQ5eWVvRnhnQXZ1anRPbThlSzZIVzVt?=
 =?utf-8?B?UmtTakQzZEtrMUd6dTVmTGJES1V0QitGa1Q2dkVuZE84UWJnRDUxNnovQ2E5?=
 =?utf-8?B?RnFieTA1SVhxNE1qTWVkZHc4a3pDRWtKZmFFaEFMTlROelFzT1VtVHVvbXBx?=
 =?utf-8?B?QjV6QlpWSHBNTVdsUWxhWTBsQVQ0dXNkZEZUT2hOejlvSDMzeE9xa0tDcEQ2?=
 =?utf-8?B?Vkg2TDk2RHF1bTRvb05SaFdwV01hOXc2THpqaDFMNkVZYnlWZFlRQVp4aGdk?=
 =?utf-8?B?ZFprWHA2R1hxQlNGUVhkZ2V1bnpzQXBkNXlabVFBcEVwVWVycG1IYTY3S0FC?=
 =?utf-8?B?a2dnQ0VIMDd0TTdsbENwYy9uQlhnY1pqbVIzSjI3dGdWYWhvV29jdWw0Umhm?=
 =?utf-8?B?Z2s3OWt3U1JhenpXUWZ2bjZxMW0vVU5jVm1tMjB5NHlvWEdPRTdXSGdwWk9R?=
 =?utf-8?B?cUFnTkVWTTFKbnBuLzc4SXN3M2I2bndmMzJCdC80Q3ZWVjdoS1pnT1ZJaHZJ?=
 =?utf-8?B?dmU0bWRwUXZwRnA1a2JKRWVGTFJ1QVNYcFVOOVIxb2IxQXU1bzFneGV0YS9x?=
 =?utf-8?B?VDg2T1BER1FEQi9iQ2lvdzU4T3krL0pHNUEvUlB6bUdNNDJheSt1czN3QkNL?=
 =?utf-8?B?eVBNdW5hYVJWdDBhUS9IcEszejFjS0dTYitNUEg2TWc1bTk1NThRdmFoZWty?=
 =?utf-8?B?RE5TRVZVbXA1c1lPWmRhRWxFdUt4Tks3NWFmOUdhdVBIcFkrVU10a0ZCdGdl?=
 =?utf-8?B?cVFOeitzdENRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8505.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?REFuaDA2Z0p1Z0hYb3pUUDhRYmxRS2pia0NJZ3VHdE9rdEpmR1FJcDFhbE1j?=
 =?utf-8?B?c2FhNlNzdFZPdDJjaXVkYnM0M0JqUXdzWERlanhRcitLUHJYNi9IdE5IMXI5?=
 =?utf-8?B?L1ltTlE2Q0dzNG9XS0E4NUlTREtWZDYwVGw4NHdJMG9sR01TMVF5MlVrdzVj?=
 =?utf-8?B?bU8rWHcwbWFLMTV4K1NjVW0zQ2RUYnZ2Z0dpbmJsdHNvQUxOeVFuTmlCWWhY?=
 =?utf-8?B?WjBweTlMT1B3R0p6OW1valJXMWpBRFlhcEkzZDROK3hBcGxLODBpY2pub3Vs?=
 =?utf-8?B?alh0WGF4d09mQlVRbERhVDRCeUphOE1sclc4UTQ1OXE1dnFYU1pLRG9Oc0ZX?=
 =?utf-8?B?cllNT2dHN3B2YS9Xd1VBbWdlb3M1Q1BYekdzY3Z0ZXptd2VHY1dObnpBUDVF?=
 =?utf-8?B?Y2RHUXBPME00ektySFBIL1cvRjVhN09tTHlhcFZuL2JwVUYrSFNXamlOQ2FY?=
 =?utf-8?B?OG5neTg0bEEyL0o1UjVSenR4K0w1dUJTcGJoZmNQU2EzT2tHWnpZSzNSb0Nq?=
 =?utf-8?B?R0xyNHAvWEU3cWJndVZDQ3BLMWhqSC9Vd1F5bXpXR0prUlYwT2F4ZnRQRVI2?=
 =?utf-8?B?T0YzSXNaOW5HSEhDeHBwdDlpbU1ReDU5ZDYrODFIUkdGMFhYRnVtaVNISHpJ?=
 =?utf-8?B?RzFVY0VpTGV2ay83cFV1RnZQeGUvWitwYWZSam1ueFQ4Z0UxbW55ZnpMVllr?=
 =?utf-8?B?WWQwSVdhZ2NSZmtGcUxmWk9PbXNrdGQ4emhXb1dXUkZRSjhaM2doN21KY1RO?=
 =?utf-8?B?ZmtpNmpJZWhtaVpiQWlBVEVEVDdNVE4vVDIyOC9tb3BTblFoUGRsTUpLRjJ2?=
 =?utf-8?B?ZWt5M0NxQkxOekMzdUlkd3VsL2NEQnd1NXVjZFZHWVJvZnRhcDhwTUxTdExy?=
 =?utf-8?B?dmgrbUIzYlV2SjdwSlhoaXRkVHNKWUlJREdaZE8yNThONUFCclpzSFRXMEpR?=
 =?utf-8?B?K1ZKbGlBRVZrdkd0ay9JSWZMNkU0OHZMRkJZWGh4VTd6enRvV3UxaXlUZzZ3?=
 =?utf-8?B?TEQ3QVR2b1QwQXBZZHllWDZwdUpQU2NFYm9sdUg2eXprRm9vSXNYRDJtTFZ5?=
 =?utf-8?B?VEtwRFdxNmNtenpFTU82MC9JY0ZpWFR4S2U5YTBHZnhqYnVtTDdQUTVGTm1J?=
 =?utf-8?B?cjNMQWt6Q2pLZkNiT085K3B3NTVwaGJMRFROYm1acGFtVjZDdHdpWnFvU0lj?=
 =?utf-8?B?Q29SL09sNDNCSVEyeDlRRW81STNudFdXWGl5Y1ZXeVJpSGlSTVZ5NldVdDd3?=
 =?utf-8?B?VGJtZG9ZanUzcjFDenFZSFg5VWtsSlo0UXQ1L0dTUTVvd3dXbE1oMisxclRB?=
 =?utf-8?B?cWVWSm44bVdQVDcvNktCZDlBVGQ4cE93UCs0NldLV0wxMzJDdjYxY0lsdkZj?=
 =?utf-8?B?eS96eWppL3NqN0pzMnVybUYxWngrYTJvNVJKbU03cE5zQTZWYm1aY2tVTktE?=
 =?utf-8?B?TjNTSU1Rb1hXNzcvdkp4djZRdnBSZG5XWStvZG14L2IrUEJsUFpQcVBCSmQ1?=
 =?utf-8?B?UDJCRVUwY2hpbWcxQlVsM0dDTEdPNlpkU1lIMVFmQVRYK21pWXZLNUUxT0Yx?=
 =?utf-8?B?NC9acnhHcjB4TzhZMGI4RGRnNEpQc1hRRmUyQ1dyRFRQeFo2UDhZY2xLc3pv?=
 =?utf-8?B?M2hjSk5razVLWTRzRllZb3RhWkRSM0tCVWtKZXJaQXhyMkhOdERPS2pGZXlT?=
 =?utf-8?B?UTlkeGpwVEFhOExpdmFjd2VNZ3VFdTZiMjd1SFBneDg1bUEvWmVwYkZnQVNF?=
 =?utf-8?B?a2l6U3Q4K0w3UCtuenRmZllNaEVjdUZMQStxVm8vbUJKN0NsM0RxTURzODFl?=
 =?utf-8?B?SnFybnpiK2VJUkFzdTJvU0hSKyt5dmppNGxwOHBWZFRRSkZvVVJ1b3dSWStU?=
 =?utf-8?B?eSttNEN4eTRDZ3BQOHR5TWpJc3dSSXhCQktwUGZDRmtRdGpBVTAxdWFDN2JX?=
 =?utf-8?B?UWd5NkExTzhPb0ZWK05CMzJ6bVd5NFh0bzRHZEFlYXprKzNETGc5bmYvZEkr?=
 =?utf-8?B?QlkxcHlkbVloVTQyM05FVjZOT2w5S200dHNaTFhpaXBCbjJKcDUwWUJ4RjZp?=
 =?utf-8?B?bHlEODB2NGV6emUvNWZrUHRqU0ZOYThMK0t3bk1SbElmV25XT1RXaFZ5Qkpk?=
 =?utf-8?B?ZDJlaVMzQmJVMjIxbjFIM0FlNVRCUGxxUW5ibHBjaG04Yjg3L3llejRaMzJG?=
 =?utf-8?B?QVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daeb552e-cf78-4202-0c7a-08de38b4ca63
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8505.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 12:57:07.5316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ao6AiS1toZ8jV66IiHvcLPPmrWldStqVC1xhmSoNN6A2SjK9PhoTss7w7Jbf32BHnv8MXmh/cTzWeVxw0pPB/UgZDG09ztT6HSgeo3MA3AQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4689
X-Proofpoint-ORIG-GUID: 7KCIQmW0FsDWDZ-R6pWppSUG-XqaGqL8
X-Authority-Analysis: v=2.4 cv=Cb0FJbrl c=1 sm=1 tr=0 ts=693abfa8 cx=c_pps
 a=ERW18fiFji9WgYXv9zI75g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=eZRnEHul_4LIrg9YV5QA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=0il7YRNZH48MuYptpaoA:9 a=8efX19y_EgDkR0Ez:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 7KCIQmW0FsDWDZ-R6pWppSUG-XqaGqL8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEwMSBTYWx0ZWRfX/2QIGtg8iDvU
 9VCkVuOzCRLzUUyufRDGMSG5MQqREGoGRiuLzu9aYraLXh3aDykkvg1KYmIl5e4Eb7UGpytk3/G
 /TjPRPJcE7X7u+O8NBQXz+cRt2793uXQy7gmkpjRY+UJLICsv74bjBn/7Yy6pG0EEvSqZozBjSq
 ggB1UBINMUMsZ4GX91e4kVxlMQ6vXo+6SApdtf8AzbBREkU3ZezBAZlmXfzI/HuJzoO8f6pmRuR
 dKl17YUtRa7xurZHTAR6hM7A+m2w5chEIG9u/dthL6WTPsV6Y7YC7gqJehunTZFTKq5Z8Y4b/GV
 pbMvwZp5QKbBNXW8h3j6QKo5BolBEm+Ps1Y5YxTTWTwdzeF5X02XoF8OJucp4i82ISPmkIfCGrY
 QDd7AYS1kejGz7H4ocLbfq6ww0oLAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 12:57:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227526

--------------OUVmQtiBZXHGn601s1tOti8W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BBC0vJ6174128

On 2025-12-11 3:10 a.m., Yash Shinde wrote:
>
> On 10-12-2025 23:50, Randy MacLeod wrote:
>> On 2025-12-10 5:18 a.m., Yash.Shinde@windriver.com wrote:
>>> From: Yash Shinde<Yash.Shinde@windriver.com>
>>>
>>> Remove the ignore tags for passing riscv64 tests and
>>> drop obsolete "tests/codegen-llvm/issues/issue-122805.rs"
>> Can you add the upstream commit id/shortlog that removed the test?
>> The issue is still open it seems:
>> https://github.com/llvm/llvm-project/issues/122805
>>
>> so you should explain that as well.
>>
> Actually, the issue is:
> https://github.com/rust-lang/rust/issues/122805
> https://github.com/rust-lang/rust/issues/122805#issuecomment-2012121917
>
>
> and the test-case was renamed to "dont-shuffle-bswaps.rs" which passes=20
> now:
> https://github.com/rust-lang/rust/commit/3580698996f6da6f006477809d7959=
bffcfd3bf0=20
>


Ah, wrong project.
Please include this info in your v2 commit log.

Thanks,

../Randy

>
>>
>> ../Randy
>>> from exclude test list.
>>>
>>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>>> ---
>>> =C2=A0 meta/lib/oeqa/selftest/cases/rust.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 -
>>> =C2=A0 .../rust/files/rust-oe-selftest.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 100=20
>>> ------------------
>>> =C2=A0 2 files changed, 101 deletions(-)
>>>
>>> diff --git a/meta/lib/oeqa/selftest/cases/rust.py=20
>>> b/meta/lib/oeqa/selftest/cases/rust.py
>>> index ebc9204420..3a41391101 100644
>>> --- a/meta/lib/oeqa/selftest/cases/rust.py
>>> +++ b/meta/lib/oeqa/selftest/cases/rust.py
>>> @@ -80,7 +80,6 @@ class=20
>>> RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase)=
:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'src/tools/tidy',
>>> 'tests/assembly-llvm/asm/aarch64-outline-atomics.rs',
>>> 'tests/assembly-llvm/c-variadic-arm.rs',
>>> - 'tests/codegen-llvm/issues/issue-122805.rs',
>>> 'tests/codegen-llvm/thread-local.rs',
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'tests/mir-opt/',
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'tests/run-make',
>>> diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch=20
>>> b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>>> index 7d26d75820..b39b326455 100644
>>> --- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>>> +++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>>> @@ -202,106 +202,6 @@ index a05f274136..0e69b4cb98 100644
>>> =C2=A0=C2=A0 fn sparse_inserts() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let cache: VecCache<u32, u8, u32=
> =3D VecCache::default();
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let end =3D if cfg!(target_point=
er_width =3D "64") &&=20
>>> cfg!(target_os =3D "linux") {
>>> -diff --git a/tests/assembly-llvm/dwarf-mixed-versions-lto.rs=20
>>> b/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
>>> -index 828328df843..30753c56c76 100644
>>> ---- a/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
>>> -+++ b/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
>>> -@@ -8,6 +8,7 @@
>>> - //@ compile-flags: -C lto -g -Cdwarf-version=3D5
>>> - //@ assembly-output: emit-asm
>>> - //@ no-prefer-dynamic
>>> -+//@ ignore-riscv64
>>> -
>>> - extern crate dwarf_mixed_versions_lto_aux;
>>> -
>>> -diff --git a/tests/codegen-llvm/const-vector.rs=20
>>> b/tests/codegen-llvm/const-vector.rs
>>> -index f4307492341..617e31140e9 100644
>>> ---- a/tests/codegen-llvm/const-vector.rs
>>> -+++ b/tests/codegen-llvm/const-vector.rs
>>> -@@ -3,6 +3,7 @@
>>> - //@ [OPT0_S390X] only-s390x
>>> - //@ [OPT0] compile-flags: -C no-prepopulate-passes -Copt-level=3D0
>>> - //@ [OPT0_S390X] compile-flags: -C no-prepopulate-passes=20
>>> -Copt-level=3D0 -C target-cpu=3Dz13
>>> -+//@ ignore-riscv64
>>> -
>>> - // This test checks that constants of SIMD type are passed as=20
>>> immediate vectors.
>>> - // We ensure that both vector representations (struct with fields=20
>>> and struct wrapping array) work.
>>> -diff --git a/tests/codegen-llvm/enum/enum-aggregate.rs=20
>>> b/tests/codegen-llvm/enum/enum-aggregate.rs
>>> -index 0161e5f3fa1..773a06fabb4 100644
>>> ---- a/tests/codegen-llvm/enum/enum-aggregate.rs
>>> -+++ b/tests/codegen-llvm/enum/enum-aggregate.rs
>>> -@@ -1,6 +1,7 @@
>>> - //@ compile-flags: -Copt-level=3D0 -Cno-prepopulate-passes
>>> - //@ min-llvm-version: 19
>>> - //@ only-64bit
>>> -+//@ ignore-riscv64
>>> -
>>> - #![crate_type =3D "lib"]
>>> -
>>> -diff --git a/tests/codegen-llvm/enum/enum-match.rs=20
>>> b/tests/codegen-llvm/enum/enum-match.rs
>>> -index 57db44ec74e..1e2507f7c90 100644
>>> ---- a/tests/codegen-llvm/enum/enum-match.rs
>>> -+++ b/tests/codegen-llvm/enum/enum-match.rs
>>> -@@ -1,5 +1,6 @@
>>> - //@ compile-flags: -Copt-level=3D1
>>> - //@ only-64bit
>>> -+//@ ignore-riscv64
>>> -
>>> - #![crate_type =3D "lib"]
>>> - #![feature(core_intrinsics)]
>>> -diff --git a/tests/codegen-llvm/enum/enum-transparent-extract.rs=20
>>> b/tests/codegen-llvm/enum/enum-transparent-extract.rs
>>> -index c5efb8d472b..e79b8916fc1 100644
>>> ---- a/tests/codegen-llvm/enum/enum-transparent-extract.rs
>>> -+++ b/tests/codegen-llvm/enum/enum-transparent-extract.rs
>>> -@@ -1,5 +1,6 @@
>>> - //@ compile-flags: -Copt-level=3D0
>>> - //@ only-64bit
>>> -+//@ ignore-riscv64
>>> -
>>> - #![crate_type =3D "lib"]
>>> -
>>> -diff --git a/tests/codegen-llvm/repeat-operand-zero-len.rs=20
>>> b/tests/codegen-llvm/repeat-operand-zero-len.rs
>>> -index b4cec42a07c..d450fead9a4 100644
>>> ---- a/tests/codegen-llvm/repeat-operand-zero-len.rs
>>> -+++ b/tests/codegen-llvm/repeat-operand-zero-len.rs
>>> -@@ -1,4 +1,5 @@
>>> - //@ compile-flags: -Copt-level=3D1 -Cno-prepopulate-passes
>>> -+//@ ignore-riscv64
>>> -
>>> - // This test is here to hit the `Rvalue::Repeat` case in=20
>>> `codegen_rvalue_operand`.
>>> - // It only applies when the resulting array is a ZST, so the test=20
>>> is written in
>>> -diff --git a/tests/codegen-llvm/simd/extract-insert-dyn.rs=20
>>> b/tests/codegen-llvm/simd/extract-insert-dyn.rs
>>> -index 729f0145314..2b1d1beb86a 100644
>>> ---- a/tests/codegen-llvm/simd/extract-insert-dyn.rs
>>> -+++ b/tests/codegen-llvm/simd/extract-insert-dyn.rs
>>> -@@ -1,4 +1,5 @@
>>> - //@compile-flags: -C opt-level=3D3 -C no-prepopulate-passes
>>> -+//@ ignore-riscv64
>>> -
>>> - #![feature(
>>> -=C2=A0=C2=A0=C2=A0=C2=A0 core_intrinsics,
>>> -diff --git a/tests/codegen-llvm/transmute-scalar.rs=20
>>> b/tests/codegen-llvm/transmute-scalar.rs
>>> -index ce1b0558b2e..e8fda2cd566 100644
>>> ---- a/tests/codegen-llvm/transmute-scalar.rs
>>> -+++ b/tests/codegen-llvm/transmute-scalar.rs
>>> -@@ -1,6 +1,7 @@
>>> - //@ add-core-stubs
>>> - //@ compile-flags: -C opt-level=3D0 -C no-prepopulate-passes=20
>>> --target=3Dx86_64-unknown-linux-gnu
>>> - //@ needs-llvm-components: x86
>>> -+//@ ignore-riscv64
>>> -
>>> - #![crate_type =3D "lib"]
>>> - #![feature(no_core, repr_simd)]
>>> -diff --git=20
>>> a/tests/codegen-llvm/uninhabited-transparent-return-abi.rs=20
>>> b/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
>>> -index face1577c3f..09e0846bad0 100644
>>> ---- a/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
>>> -+++ b/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
>>> -@@ -1,4 +1,5 @@
>>> - //@ compile-flags: -Copt-level=3D3
>>> -+//@ ignore-riscv64
>>> -
>>> - // Seehttps://github.com/rust-lang/rust/issues/135802
>>> -
>>> =C2=A0 diff --git a/tests/ui/abi/rust-cold-works-with-rustic-args.rs=20
>>> b/tests/ui/abi/rust-cold-works-with-rustic-args.rs
>>> =C2=A0 index 551485469d3..575db924968 100644
>>> =C2=A0 --- a/tests/ui/abi/rust-cold-works-with-rustic-args.rs
>>
>>
>> --=20
>> # Randy MacLeod
>> # Wind River Linux


--=20
# Randy MacLeod
# Wind River Linux

--------------OUVmQtiBZXHGn601s1tOti8W
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-12-11 3:10 a.m., Yash Shinde
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:32af68a4-a8f5-404c-b7cd-baab63223a9c@windriver.com">
      <br>
      On 10-12-2025 23:50, Randy MacLeod wrote:
      <br>
      <blockquote type="cite">On 2025-12-10 5:18 a.m.,
        <a class="moz-txt-link-abbreviated" href="mailto:Yash.Shinde@windriver.com">Yash.Shinde@windriver.com</a> wrote:
        <br>
        <blockquote type="cite">From: Yash
          Shinde<a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
          <br>
          <br>
          Remove the ignore tags for passing riscv64 tests and
          <br>
          drop obsolete &quot;tests/codegen-llvm/issues/issue-122805.rs&quot;
          <br>
        </blockquote>
        Can you add the upstream commit id/shortlog that removed the
        test?
        <br>
        The issue is still open it seems:
        <br>
        <a class="moz-txt-link-freetext" href="https://github.com/llvm/llvm-project/issues/122805">https://github.com/llvm/llvm-project/issues/122805</a>
        <br>
        <br>
        so you should explain that as well.
        <br>
        <br>
      </blockquote>
      Actually, the issue is:
      <br>
      <a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/issues/122805">https://github.com/rust-lang/rust/issues/122805</a>
      <br>
<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/issues/122805#issuecomment-2012121917">https://github.com/rust-lang/rust/issues/122805#issuecomment-2012121917</a>
      <br>
      <br>
      <br>
      and the test-case was renamed to &quot;dont-shuffle-bswaps.rs&quot; which
      passes now:
      <br>
<a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/commit/3580698996f6da6f006477809d7959bffcfd3bf0">https://github.com/rust-lang/rust/commit/3580698996f6da6f006477809d7959bffcfd3bf0</a>
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Ah, wrong project. <br>
      Please include this info in your v2 commit log.</p>
    <p>Thanks,</p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:32af68a4-a8f5-404c-b7cd-baab63223a9c@windriver.com">
      <br>
      <blockquote type="cite">
        <br>
        ../Randy
        <br>
        <blockquote type="cite">from exclude test list.
          <br>
          <br>
          Signed-off-by: Yash Shinde<a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
          <br>
          ---
          <br>
          &nbsp; meta/lib/oeqa/selftest/cases/rust.py&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 -
          <br>
          &nbsp; .../rust/files/rust-oe-selftest.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 100
          ------------------
          <br>
          &nbsp; 2 files changed, 101 deletions(-)
          <br>
          <br>
          diff --git a/meta/lib/oeqa/selftest/cases/rust.py
          b/meta/lib/oeqa/selftest/cases/rust.py
          <br>
          index ebc9204420..3a41391101 100644
          <br>
          --- a/meta/lib/oeqa/selftest/cases/rust.py
          <br>
          +++ b/meta/lib/oeqa/selftest/cases/rust.py
          <br>
          @@ -80,7 +80,6 @@ class
          RustSelfTestSystemEmulated(OESelftestTestCase,
          OEPTestResultTestCase):
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'src/tools/tidy',
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          'tests/assembly-llvm/asm/aarch64-outline-atomics.rs',
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          'tests/assembly-llvm/c-variadic-arm.rs',
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          'tests/codegen-llvm/issues/issue-122805.rs',
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          'tests/codegen-llvm/thread-local.rs',
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'tests/mir-opt/',
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'tests/run-make',
          <br>
          diff --git
          a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
          b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
          <br>
          index 7d26d75820..b39b326455 100644
          <br>
          --- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
          <br>
          +++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
          <br>
          @@ -202,106 +202,6 @@ index a05f274136..0e69b4cb98 100644
          <br>
          &nbsp;&nbsp; fn sparse_inserts() {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; let cache: VecCache&lt;u32, u8, u32&gt; =
          VecCache::default();
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; let end = if cfg!(target_pointer_width = &quot;64&quot;)
          &amp;&amp; cfg!(target_os = &quot;linux&quot;) {
          <br>
          -diff --git a/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
          b/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
          <br>
          -index 828328df843..30753c56c76 100644
          <br>
          ---- a/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
          <br>
          -+++ b/tests/assembly-llvm/dwarf-mixed-versions-lto.rs
          <br>
          -@@ -8,6 +8,7 @@
          <br>
          - //@ compile-flags: -C lto -g -Cdwarf-version=5
          <br>
          - //@ assembly-output: emit-asm
          <br>
          - //@ no-prefer-dynamic
          <br>
          -+//@ ignore-riscv64
          <br>
          -
          <br>
          - extern crate dwarf_mixed_versions_lto_aux;
          <br>
          -
          <br>
          -diff --git a/tests/codegen-llvm/const-vector.rs
          b/tests/codegen-llvm/const-vector.rs
          <br>
          -index f4307492341..617e31140e9 100644
          <br>
          ---- a/tests/codegen-llvm/const-vector.rs
          <br>
          -+++ b/tests/codegen-llvm/const-vector.rs
          <br>
          -@@ -3,6 +3,7 @@
          <br>
          - //@ [OPT0_S390X] only-s390x
          <br>
          - //@ [OPT0] compile-flags: -C no-prepopulate-passes
          -Copt-level=0
          <br>
          - //@ [OPT0_S390X] compile-flags: -C no-prepopulate-passes
          -Copt-level=0 -C target-cpu=z13
          <br>
          -+//@ ignore-riscv64
          <br>
          -
          <br>
          - // This test checks that constants of SIMD type are passed
          as immediate vectors.
          <br>
          - // We ensure that both vector representations (struct with
          fields and struct wrapping array) work.
          <br>
          -diff --git a/tests/codegen-llvm/enum/enum-aggregate.rs
          b/tests/codegen-llvm/enum/enum-aggregate.rs
          <br>
          -index 0161e5f3fa1..773a06fabb4 100644
          <br>
          ---- a/tests/codegen-llvm/enum/enum-aggregate.rs
          <br>
          -+++ b/tests/codegen-llvm/enum/enum-aggregate.rs
          <br>
          -@@ -1,6 +1,7 @@
          <br>
          - //@ compile-flags: -Copt-level=0 -Cno-prepopulate-passes
          <br>
          - //@ min-llvm-version: 19
          <br>
          - //@ only-64bit
          <br>
          -+//@ ignore-riscv64
          <br>
          -
          <br>
          - #![crate_type = &quot;lib&quot;]
          <br>
          -
          <br>
          -diff --git a/tests/codegen-llvm/enum/enum-match.rs
          b/tests/codegen-llvm/enum/enum-match.rs
          <br>
          -index 57db44ec74e..1e2507f7c90 100644
          <br>
          ---- a/tests/codegen-llvm/enum/enum-match.rs
          <br>
          -+++ b/tests/codegen-llvm/enum/enum-match.rs
          <br>
          -@@ -1,5 +1,6 @@
          <br>
          - //@ compile-flags: -Copt-level=1
          <br>
          - //@ only-64bit
          <br>
          -+//@ ignore-riscv64
          <br>
          -
          <br>
          - #![crate_type = &quot;lib&quot;]
          <br>
          - #![feature(core_intrinsics)]
          <br>
          -diff --git
          a/tests/codegen-llvm/enum/enum-transparent-extract.rs
          b/tests/codegen-llvm/enum/enum-transparent-extract.rs
          <br>
          -index c5efb8d472b..e79b8916fc1 100644
          <br>
          ---- a/tests/codegen-llvm/enum/enum-transparent-extract.rs
          <br>
          -+++ b/tests/codegen-llvm/enum/enum-transparent-extract.rs
          <br>
          -@@ -1,5 +1,6 @@
          <br>
          - //@ compile-flags: -Copt-level=0
          <br>
          - //@ only-64bit
          <br>
          -+//@ ignore-riscv64
          <br>
          -
          <br>
          - #![crate_type = &quot;lib&quot;]
          <br>
          -
          <br>
          -diff --git a/tests/codegen-llvm/repeat-operand-zero-len.rs
          b/tests/codegen-llvm/repeat-operand-zero-len.rs
          <br>
          -index b4cec42a07c..d450fead9a4 100644
          <br>
          ---- a/tests/codegen-llvm/repeat-operand-zero-len.rs
          <br>
          -+++ b/tests/codegen-llvm/repeat-operand-zero-len.rs
          <br>
          -@@ -1,4 +1,5 @@
          <br>
          - //@ compile-flags: -Copt-level=1 -Cno-prepopulate-passes
          <br>
          -+//@ ignore-riscv64
          <br>
          -
          <br>
          - // This test is here to hit the `Rvalue::Repeat` case in
          `codegen_rvalue_operand`.
          <br>
          - // It only applies when the resulting array is a ZST, so the
          test is written in
          <br>
          -diff --git a/tests/codegen-llvm/simd/extract-insert-dyn.rs
          b/tests/codegen-llvm/simd/extract-insert-dyn.rs
          <br>
          -index 729f0145314..2b1d1beb86a 100644
          <br>
          ---- a/tests/codegen-llvm/simd/extract-insert-dyn.rs
          <br>
          -+++ b/tests/codegen-llvm/simd/extract-insert-dyn.rs
          <br>
          -@@ -1,4 +1,5 @@
          <br>
          - //@compile-flags: -C opt-level=3 -C no-prepopulate-passes
          <br>
          -+//@ ignore-riscv64
          <br>
          -
          <br>
          - #![feature(
          <br>
          -&nbsp;&nbsp;&nbsp;&nbsp; core_intrinsics,
          <br>
          -diff --git a/tests/codegen-llvm/transmute-scalar.rs
          b/tests/codegen-llvm/transmute-scalar.rs
          <br>
          -index ce1b0558b2e..e8fda2cd566 100644
          <br>
          ---- a/tests/codegen-llvm/transmute-scalar.rs
          <br>
          -+++ b/tests/codegen-llvm/transmute-scalar.rs
          <br>
          -@@ -1,6 +1,7 @@
          <br>
          - //@ add-core-stubs
          <br>
          - //@ compile-flags: -C opt-level=0 -C no-prepopulate-passes
          --target=x86_64-unknown-linux-gnu
          <br>
          - //@ needs-llvm-components: x86
          <br>
          -+//@ ignore-riscv64
          <br>
          -
          <br>
          - #![crate_type = &quot;lib&quot;]
          <br>
          - #![feature(no_core, repr_simd)]
          <br>
          -diff --git
          a/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
          b/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
          <br>
          -index face1577c3f..09e0846bad0 100644
          <br>
          ----
          a/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
          <br>
          -+++
          b/tests/codegen-llvm/uninhabited-transparent-return-abi.rs
          <br>
          -@@ -1,4 +1,5 @@
          <br>
          - //@ compile-flags: -Copt-level=3
          <br>
          -+//@ ignore-riscv64
          <br>
          -
          <br>
          - // Seehttps://github.com/rust-lang/rust/issues/135802
          <br>
          -
          <br>
          &nbsp; diff --git
          a/tests/ui/abi/rust-cold-works-with-rustic-args.rs
          b/tests/ui/abi/rust-cold-works-with-rustic-args.rs
          <br>
          &nbsp; index 551485469d3..575db924968 100644
          <br>
          &nbsp; --- a/tests/ui/abi/rust-cold-works-with-rustic-args.rs
          <br>
        </blockquote>
        <br>
        <br>
        --&nbsp;<br>
        # Randy MacLeod
        <br>
        # Wind River Linux
        <br>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------OUVmQtiBZXHGn601s1tOti8W--

