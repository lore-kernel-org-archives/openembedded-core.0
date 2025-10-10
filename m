Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFEDCCD18E
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 14:47:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10488.1760107674042386162
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 07:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=HX7TxFnC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2378ef0ff0=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59A6pdjT2827041
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 14:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=I6xxxWt9VPsQYwVeuMydHhCM5FOmSnTjl/PEn/H6K2c=; b=
	HX7TxFnCSdk8qN58BpefxaE1EFRxjHIFEjnYStr9qiSVm9JBOCeoW/AllsSCrd0P
	yY+QYQN1X9VuqStr2Q3f98AMybw0v95k/CJwNcknyRorkB9Bh4lE1UzQ8Kw2fZ1z
	FoRpltaKovglZIg+15PLY+f1rQwOyREmDNY5rrLI7iFFtc26jrv+Wea2ycHVa6Mn
	pcxyOOv/tRiXvzQOU+KgdGZaLMhUNknWBrknrb+g5RS9SrTGHvMh372t1yPm2GzS
	X937cfVHosDjMxlU/QjI6KH4ZyBWdRS+0fdEhEF8aypQ5mOyalQ/mcwI020Vinoe
	AEbTy1QoiHLNVZJrD1InoQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010042.outbound.protection.outlook.com [52.101.56.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49nx2yt8kp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 14:47:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zV5dBX3R6J/neCRX558R0d0iLfeDm9qK/N9W8u4cAWFMC7Favmw1dBR8Y3z6yLbNrJBHaIY8GaZBFVdpXjALOI/fH2n7CA8cGFBq6awCkEQc724oihD1HxuU0yJIQlkGdiRL9KI2xETZnANTJ0nO2oVQPmPd1pRj4cLy7SCEVZBuQudQyUJUT1S0N4xKHQrUQ+hzlcXupsXuIS8ZZjW7Ne/bfxiBPsy8HYtKiEHv5zjNZf6xoFSlVDhsRyUKrutS/oCHSz5U4FJO0hj+jjtedPmVeRsGJVyb/+FQBhgkkrvrxT0LrAUpBSNTIzK1yNJTNmiyAau4Bwzkxz+LqUFunQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6xxxWt9VPsQYwVeuMydHhCM5FOmSnTjl/PEn/H6K2c=;
 b=SNMyqhBwDqw5yi91723xHv4gMO8SlSm2/+SI5y12LXLLPs2Z984mHxFFCLzYF5wxeY8V5M51IqJCM7CTlaX5YBdWfi7Vc3VGTXVlqzHnI/3E4gMqR6YjoumV9+kIuUPi1bYNSlqXlc2ZfPtkg4My9nNTRivNkgHcQOXHeBgabfPDubVYzFnSSkO/sWoLNIH07dxjq4K/eVWJYf64JL1p4sqdFQhqUAvorSgGJR9WV0BZWXZT7KZloO5bE75/zo6YOMpOem7D5wnWN5UKL8CjfaYi2NxqzmPqBt+8TRP0hcKvmCyBRXFH3DFgO0fl/VjfKSGw2h3kQRfKJw17qqu5VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by BL1PR11MB5317.namprd11.prod.outlook.com (2603:10b6:208:309::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 14:47:51 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9182.017; Fri, 10 Oct 2025
 14:47:51 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH V4 2/2] rust: Drop rust-llvm
Date: Fri, 10 Oct 2025 07:47:33 -0700
Message-ID: <20251010144735.862149-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251010144735.862149-1-Deepesh.Varatharajan@windriver.com>
References: <20251010144735.862149-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|BL1PR11MB5317:EE_
X-MS-Office365-Filtering-Correlation-Id: bb5627f8-5b40-4d05-9481-08de080bfd0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ckhCNGExTHJSWlk5VDQ5WkJ6dTlSc2ZWVTdWaGpFNUNqNUMyUm10bFFhWDVR?=
 =?utf-8?B?VUFkM0plSHk2UE9NWFJWYXVtQ2xZenUzQkFzbTRuNkszcWlXdUM3WGVPamFL?=
 =?utf-8?B?akMyR052WlRvcURaS3REQWtKYWN0cnU0eE9GQWNhSS9PaVVrVG84ZndoTDQr?=
 =?utf-8?B?WUdYalpRb053bTBZMEhOVGJ3UFp5R2pXME1RNWFJcGtMOTBCOE9uWDlwRnNl?=
 =?utf-8?B?VWJhYnlwRVAwbHRSM0luSm1QbzBQd0ZNNFF0T0h2Sm83WDJMdE5nM0VaM1k3?=
 =?utf-8?B?NGdhS1pnR0tQNUc2VFhJc0I0UXRrQXR1amkyVFdkOEhSU1FvVGxKNlFkeHNo?=
 =?utf-8?B?aUZmSlNibG02NHF0VGZZQUtrMENGTy9KamVVQlZ3ZmVMcU85aGtoRWhnQmlP?=
 =?utf-8?B?dndHZTRwV2hKZ2QyL05Ba3oyT1gyUTZTRGRNNVZkTEYySG5qalNnRkRMalBp?=
 =?utf-8?B?amJ2WFBsdkx5dlBRV1BuTnYvenlvdWlsK2RGZVZhdXk4cHg1SFZ6NG9VWkQ5?=
 =?utf-8?B?QTU0eEZMRndnR24yYzhQdlF4aE5ISXNJM3pUSWlVSFJiM0NEdW9UL0xGWEJz?=
 =?utf-8?B?SmIybnVKQ3QrUnVLclBwMkFXdlJmRnRLWWUxN2h0TGtEMFlvTytIL1QySG1B?=
 =?utf-8?B?V01PRFQwTEZjcU80dzJsRVdkY01kM2lyRi9uQTRqVEc3dDVLcFBaSlJDQjZP?=
 =?utf-8?B?UzFNUHFjVkN3VVF1U1JQdkNUMXFheVFVUzdERkJCQlgwM24xbTJOZEJjRWZW?=
 =?utf-8?B?R3pjTUpWbmtlSXVXa2RMWXNpVmJiODl1V0VMTW1SZG8wRFl3ckovWUJtNlpU?=
 =?utf-8?B?V2J2bmhtQ0xuTXFyaHpsZmZFODVYcm1ZRDF0Q0pFNUtWeVBYN3l1SG9pVlJP?=
 =?utf-8?B?RDM2U0tLQXZHcUtuRTBFZUw3ZU0vcWFFT2w5SjgzWG5CdG0wSFlyczFuQlZ5?=
 =?utf-8?B?cW0rc0JUOE01bFE1Z3ZoS2VlbzNKSndlblJWbnZRczVVbEsrVWkwbGhNYXdR?=
 =?utf-8?B?c3RseUlUSCtWcVNSenB2SDhKOFNQcmZOb1JQclFzajFCRTFEU25vWGZIbHor?=
 =?utf-8?B?STZHNzVJUkZyNldJaERYZ2NnK3VrVkVWMXFFaU1EcHZKVWFhTjZibi8wTlZw?=
 =?utf-8?B?SUc4NDdrSkxIMkM3NWJMR2lrODFQZksxeGxMbDUrMjFWbkhFREpSengxenlj?=
 =?utf-8?B?bzRKRHRPV2QzNmROZGVKV2cvV2lNZm9WcGRra3NGMEg2VWU2YUJTanQ1MkFT?=
 =?utf-8?B?Qk0zVlNudElXSlZNQWlrcG42NUNVWjI3QjdHSUVlQU9mQ25kaFlwQXY0SlJk?=
 =?utf-8?B?Tm1nWk5NMXB6c3E0NXJWMEhSV0plMkVHWGt0bkVuekcvU1hFREV1UHI2SVVL?=
 =?utf-8?B?bEpHYXR3elV1LzVoRnVMZENraURORUhVYXBKZm1tTUxJcjc5VDd1RzhLbndI?=
 =?utf-8?B?RGVXTWVMelNGa0NZYVRLYnpJTDF5VUFza3NlUEFLSzBHZW5UQzltc1dYN0pP?=
 =?utf-8?B?a1c2SUlwbUwzVkR4emtCSmlWcEI3Z2lqRy81QTNkV1pVUFB2VlpFellXNzcw?=
 =?utf-8?B?blRpbU1PN2FjZGxhemQyOER3aHF1cEZIRk51T2wvUWlybGt6UkRGMzhZbzhw?=
 =?utf-8?B?ZTFHSkhkZmtUcUh1QUhidktqZ0tKOUFsVFdkZlluRnExdXBiOU9LNEs5d0Rr?=
 =?utf-8?B?ejdMZ1F4WEdLdXFKdlFyZ2dqUE5BWUN6Z2JwVlNMUi9kcC81S2d3eWN1UE1a?=
 =?utf-8?B?Z0VudlMyY1pGTEwwREpkdm03eENyQnRiQ2JsRmNja3I3WmsvZzRUY0RWcGpB?=
 =?utf-8?B?K2sySnNDVHZCY25VNDFtaDhDZ1c5ZjRwU2l2VHhyWUIyTzdjRGhjMFh5YzBu?=
 =?utf-8?B?MkU0VDEzNFhjVk03Y3NjNE1MMWpKVUx4M0NpcjFFU213bDdXWnJhWjg1UkNW?=
 =?utf-8?B?RFhDelBmMDZDRjFxT2pxVXR3SHhUUjExa0tIKzZRNXIzN0k0WlF4dmJkNGR3?=
 =?utf-8?B?NmNnU3BkVG1BPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VWo0Z21WRko3aFRvbWNIdmJxaWxabmt2TjVOZHg1WTNGNTBIb3c3T3FlNlRu?=
 =?utf-8?B?SVhXZ2ZKcVkzc2pLM0NESmphcTRTc3JKbVNITXNuS3haU1NPcVBzTVl3aVN1?=
 =?utf-8?B?TzNtcUEyeXNWbHFZcWIvK2d6K3RrOXEvU2NySHZzUDJUTEUzMzhQZnM2SDFR?=
 =?utf-8?B?cW1OYzh4UTNWWGEvUWd0WmhtWDdXM01sRng0QWlKNW1ra3NqdGRlUXpxeVpE?=
 =?utf-8?B?TEU4Y2JHNkorYVlTWENJcTFYb2pJSzZxdllGY0lSbW0xSnFtbXl5MWc3bU5E?=
 =?utf-8?B?bWxGc21UcGNZR3pLZmErMDZOUGV0UkRnd2xMdWtBODJnRHN2OTdZVVk2Sk5X?=
 =?utf-8?B?NUNnaTZsTmY0U0Fpam9CWkdoa2Uva2ZML0wvbXJUd0dMTmxHRXZUQzZzOExT?=
 =?utf-8?B?amZaTUtoZjVtTVVJQkkxSjl5ZW5yNXBGalkvN3pqdXppWEZBd0ZZMVFCMGV5?=
 =?utf-8?B?R1RCUy9TeXcwdnltQXpwUDVvSHRGUWpPQlZyYTJJQkZrQ3pxZUlZZ3U4Rkwv?=
 =?utf-8?B?Q0o0MnVVZzltR2xTRVU1dVpVOVpSRWJZdko1bDdZazFmaEJjMERiSXJxNUR6?=
 =?utf-8?B?Y0gwK1VMWFM4UXZGcVVuVWEzSlN5Z3F3UWhlUWJrMno4MzUrQlM5RkplOEh3?=
 =?utf-8?B?UDMwcHF1Qy9TTWx2UEpKUCtUcFp6bFFMMEQzZ09jS1NFNS82VzNRcHgxb2xo?=
 =?utf-8?B?T3g0aDJTK0tJNzdZRDlMa2NmczkxVjBUVEJGWWljcXh5K1IwQ3h3cEdDb2tu?=
 =?utf-8?B?QlVpNkRDU2g1OVJBT2hzMVY3dkhaSzZKNVZWN2dxYVR2WVdZQzdpRWRxdHJ6?=
 =?utf-8?B?VmlzKzRiUFU3MXJ5aVBUa3plVy96cDJJWlpMdCtSZVBiMUIvSjgzaUEzYVJa?=
 =?utf-8?B?Z01LelFxV0s0VjY2TTB3cVd5R0EyWFNlMWhnWUN6ZVRVc3RrQU5wVktSUzcy?=
 =?utf-8?B?Um94T29tUE92QXFtTnZNT1MxZVhZSTZQOXlQRlZ5ZEVTTFMxTE1PN0FOQzNX?=
 =?utf-8?B?bTlaeTg0czVXZ1VvS2twSUJ6eVRsZnk4V0lLM1BWWE9kYU0xcFpNSnVNOFRQ?=
 =?utf-8?B?S0NvK3RnVy9Jc2pqMFM5RUsyS053NEtURlpmNXdSRGxsaldnSmlDa2RaNmc2?=
 =?utf-8?B?V3NHUE56bzVnTG9CSnZhekFTOENYOW9XcFRuUWtZMjBNcGRhVHJ6K2N5NUNn?=
 =?utf-8?B?NGpUdmk5cGhWRlZDRkdBRDB3Q0VaR3ZWaVNNN2pkaUQ4WXhCQ0kyc0c1S1pz?=
 =?utf-8?B?UWFCN1ZFenQ3b0lNam9lMURHdlNYaFVPTW10TnZQc09Ca250RTVCcGczTG1L?=
 =?utf-8?B?ZFFNNkM0ZU1mYnd1NjBoaUs2Vm1XZ2Q0WE9kVzlpa3ZHcTgvRWVyb21RR0Uw?=
 =?utf-8?B?Uk5uVTMwVVdrSnpvTUdKL0pwaER0eWhvTlVvbnd0NG41YkdlbWk4ZTFqcXpM?=
 =?utf-8?B?aDY4UFhmYXhpWTFQYXYvbWFHMkdOQ2xFWjBHeGp4QVJZVWpjNE1mckl5d1I5?=
 =?utf-8?B?bWZIdU5VamExR09pMHJiQllVdXpxaU9ybVFHeTJmK3E1aHhna3U4QzZhWklN?=
 =?utf-8?B?ZmRITzVnQUs1Z1h4c3hFQ1RYS1hmbkRsKzF2VGVsOFQrSk1DcWt3Z2ZrbENN?=
 =?utf-8?B?WFg2TnNoVk1vUzZndTYwNUg2QlhabGllM0FxM1hmWHdqT0FNS2dnTzVkS010?=
 =?utf-8?B?N2dSVlhKUmduVDdCRHZEWGU0WjB3ajhubXo1Q2grV1llem96aXZZT1BlVkYx?=
 =?utf-8?B?cXRQNHdoOWFDWHRsemxsNkpLL05vU1NIUVdTbWd6SWlIbkRvaXdTdlE1aDNw?=
 =?utf-8?B?S0t6bCt2Unh0OWVBTGtrMWxwSnlPUHVDblFDZko0c0NQNldCS25hZmFqa0VC?=
 =?utf-8?B?bi9OK29PZzFsRjdLTnhqUHI1V1kwRWVia2RCL0dTcHBSeW15c2hYUVNqNzRB?=
 =?utf-8?B?RG45K1c1RFFsZEg0UEt6eFF3ekU1YWxtZFE0ZkJNN0RtWXRCVnI5K1dtdUQ1?=
 =?utf-8?B?OS9TbEZQVmJQQnNHYnlxdmYzR0RJV3JaQUJmaFZlcU9NcUlvcWdaczhFdnFa?=
 =?utf-8?B?dmFheHI4MWQvS08wTTV0ZWxxZzFrNzg0SERKNm4yNkpsS3MvWll4TS9GRGVY?=
 =?utf-8?B?MEFXakJSUFl0cG16c0lVUzNtMkkyQ0dLSjVCMGx5Y1JkMXFKU0dBaHJFNWk4?=
 =?utf-8?Q?W1BG9OR5wx9N9xo26A+AtHQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5627f8-5b40-4d05-9481-08de080bfd0f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 14:47:51.7714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgNZpfkhO28DfDJfgoyiPkMWDa1uv4CEGtECyxNzYUUVrtJ5RniQgNwv+Qwfq0VBdy02QIMVb+wV24XruXpuX04qV8fjymTYFHiVqcHCec7h2ByfkP+jgYezag+ud7Ai
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5317
X-Authority-Analysis: v=2.4 cv=Wd8BqkhX c=1 sm=1 tr=0 ts=68e91c99 cx=c_pps
 a=cLTib2BoJD1e+Gs0wkBYAA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=Twlkf-z8AAAA:8
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8
 a=8wEic9LhAAAA:8 a=pGLkceISAAAA:8 a=IvTj1HvjAAAA:8 a=KWC9iU3rWuwbSrfLZx8A:9
 a=El4dKC3-_JfgT4nS:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-74SuR6ZdpOK_LpdRCUo:22 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=M9VCcFR7d36vLOFuqMn8:22
 a=kmyLcwvAnC_t3PsnBtKb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA4NSBTYWx0ZWRfX9Hon3JbSTyLb
 pNqFeFDe0ME/CTJ5xEXMqjmZknj5ZNFREBFgJist+RizJdnu7ye47EgOp/s1M8igNsuvyL9MZkp
 uFSj8mNT7U61qOw4OiOxJCR9PETOfUDtWJeZan6RzpVZj6yQMAOj3FVMySdQDmMehAkT7VYcSCW
 J7I+zruUo6ml+ny/IlsQudO0+wJnfc9Wz1jssr1Lo/lTQ9W6Ubgq+aJzmO9CjBGj01qrswAh8VQ
 b+iFt9Oc8Y5MqeNZw+wTObclkJ7OOdcER5Urs+if7LXevGcv5gJ1ClZn/NhhjZqlds+HWv7xb7C
 1JCk64gnUbo9/PpB9Tl6frrzzob9XYVEO2uf0S1xe4UI9qGgG28ubmalMhT7nD41I1eN65y4Wk+
 Pk6F64eILOBKXTdai9vlipILuaARIg==
X-Proofpoint-GUID: 8MFJnBD7KHAAF_jxuUNbxhJ0kfnmZJx4
X-Proofpoint-ORIG-GUID: 8MFJnBD7KHAAF_jxuUNbxhJ0kfnmZJx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510100085
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59A6pdjT2827041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 14:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224688

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Dropping rust-llvm because now rust depends on llvm.

0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
0002-llvm-allow-env-override-of-exe-path.patch
(We have the above two patches in llvm)

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../distro/include/rust_security_flags.inc    |  1 -
 meta/conf/distro/include/tcmode-default.inc   |  2 -
 ...r-sort-ClassInfo-lists-by-name-as-we.patch | 31 ------
 ...-llvm-allow-env-override-of-exe-path.patch | 33 -------
 .../recipes-devtools/rust/rust-llvm_1.90.0.bb | 98 -------------------
 6 files changed, 166 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm/0001-AsmMatcherE=
mitter-sort-ClassInfo-lists-by-name-as-we.patch
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-=
env-override-of-exe-path.patch
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm_1.90.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index d2c613b8e9..6e15c6f3d0 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -774,7 +774,6 @@ RECIPE_MAINTAINER:pn-ruby =3D "Ross Burton <ross.burt=
on@arm.com>"
 RECIPE_MAINTAINER:pn-run-postinsts =3D "Ross Burton <ross.burton@arm.com=
>"
 RECIPE_MAINTAINER:pn-rust =3D "Randy MacLeod <Randy.MacLeod@windriver.co=
m>"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "=
Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-rust-llvm =3D "Randy MacLeod <Randy.MacLeod@windriv=
er.com>"
 RECIPE_MAINTAINER:pn-rxvt-unicode =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
 RECIPE_MAINTAINER:pn-sassc =3D "Simone Wei=C3=9F <simone.p.weiss@posteo.=
com>"
 RECIPE_MAINTAINER:pn-sato-screenshot =3D "Ross Burton <ross.burton@arm.c=
om>"
diff --git a/meta/conf/distro/include/rust_security_flags.inc b/meta/conf=
/distro/include/rust_security_flags.inc
index 590bef17a0..f77c851197 100644
--- a/meta/conf/distro/include/rust_security_flags.inc
+++ b/meta/conf/distro/include/rust_security_flags.inc
@@ -2,6 +2,5 @@
 SECURITY_CFLAGS:pn-rust-native =3D "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS:pn-rust-cross-${TARGET_ARCH} =3D "${SECURITY_NO_PIE_CFLA=
GS}"
 SECURITY_CFLAGS:pn-rust =3D "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS:pn-rust-llvm =3D "${SECURITY_NO_PIE_CFLAGS}"
=20
 SECURITY_LDFLAGS:pn-rust-cross-arm =3D " -lssp_nonshared -lssp"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
index 133608a6e7..ff10f14a6b 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -43,7 +43,5 @@ PREFERRED_VERSION_cargo-native ?=3D "${RUSTVERSION}"
 PREFERRED_VERSION_libstd-rs ?=3D "${RUSTVERSION}"
 PREFERRED_VERSION_rust ?=3D "${RUSTVERSION}"
 PREFERRED_VERSION_rust-cross-${TARGET_ARCH} ?=3D "${RUSTVERSION}"
-PREFERRED_VERSION_rust-llvm ?=3D "${RUSTVERSION}"
-PREFERRED_VERSION_rust-llvm-native ?=3D "${RUSTVERSION}"
 PREFERRED_VERSION_rust-native ?=3D "${RUSTVERSION}"
=20
diff --git a/meta/recipes-devtools/rust/rust-llvm/0001-AsmMatcherEmitter-=
sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/rust/rus=
t-llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
deleted file mode 100644
index 48af6fc283..0000000000
--- a/meta/recipes-devtools/rust/rust-llvm/0001-AsmMatcherEmitter-sort-Cl=
assInfo-lists-by-name-as-we.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 86940d87026432683fb6741cd8a34d3b9b18e40d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 27 Nov 2020 10:11:08 +0000
-Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
-
-Otherwise, there are instances which are identical in
-every other field and therefore sort non-reproducibly
-(which breaks binary and source reproducibiliy).
-
-Upstream-Status: Submitted [https://reviews.llvm.org/D97477]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- llvm/utils/TableGen/AsmMatcherEmitter.cpp | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/Tabl=
eGen/AsmMatcherEmitter.cpp
-index ccf0959389b..1f801e83b7d 100644
---- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-+++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-@@ -359,7 +359,10 @@ public:
-     // name of a class shouldn't be significant. However, some of the b=
ackends
-     // accidentally rely on this behaviour, so it will have to stay lik=
e this
-     // until they are fixed.
--    return ValueName < RHS.ValueName;
-+    if (ValueName !=3D RHS.ValueName)
-+        return ValueName < RHS.ValueName;
-+    // All else being equal, we should sort by name, for source and bin=
ary reproducibility
-+    return Name < RHS.Name;
-   }
- };
-=20
diff --git a/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-ove=
rride-of-exe-path.patch b/meta/recipes-devtools/rust/rust-llvm/0002-llvm-=
allow-env-override-of-exe-path.patch
deleted file mode 100644
index 9be26677a9..0000000000
--- a/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-override-o=
f-exe-path.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7111770e8290082530d920e120995bf81431b0aa Mon Sep 17 00:00:00 2001
-From: Martin Kelly <mkelly@xevo.com>
-Date: Fri, 19 May 2017 00:22:57 -0700
-Subject: [PATCH 12/18] llvm: allow env override of exe path
-
-When using a native llvm-config from inside a sysroot, we need llvm-conf=
ig to
-return the libraries, include directories, etc. from inside the sysroot =
rather
-than from the native sysroot. Thus provide an env override for calling
-llvm-config from a target sysroot.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Martin Kelly <mkelly@xevo.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
- 1 file changed, 7 insertions(+)
-
---- a/llvm/tools/llvm-config/llvm-config.cpp
-+++ b/llvm/tools/llvm-config/llvm-config.cpp
-@@ -226,6 +226,13 @@ Typical components:\n\
-=20
- /// Compute the path to the main executable.
- std::string GetExecutablePath(const char *Argv0) {
-+  // Hack for Yocto: we need to override the root path when we are usin=
g
-+  // llvm-config from within a target sysroot.
-+  const char *Sysroot =3D std::getenv("YOCTO_ALTERNATE_EXE_PATH");
-+  if (Sysroot !=3D nullptr) {
-+    return Sysroot;
-+  }
-+
-   // This just needs to be some symbol in the binary; C++ doesn't
-   // allow taking the address of ::main however.
-   void *P =3D (void *)(intptr_t)GetExecutablePath;
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.90.0.bb b/meta/recipe=
s-devtools/rust/rust-llvm_1.90.0.bb
deleted file mode 100644
index 42d4031da1..0000000000
--- a/meta/recipes-devtools/rust/rust-llvm_1.90.0.bb
+++ /dev/null
@@ -1,98 +0,0 @@
-SUMMARY =3D "LLVM compiler framework (packaged with rust)"
-LICENSE ?=3D "Apache-2.0-with-LLVM-exception"
-HOMEPAGE =3D "http://www.rust-lang.org"
-
-# check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
-#
-LLVM_RELEASE =3D "20.1.8"
-
-require rust-source.inc
-
-SRC_URI +=3D "file://0002-llvm-allow-env-override-of-exe-path.patch;stri=
plevel=3D2 \
-            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-a=
s-we.patch;striplevel=3D2 \
-           "
-
-S =3D "${RUSTSRC}/src/llvm-project/llvm"
-
-LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D8a15a0759ef07f2682d2ba4b8=
93c9afe"
-
-inherit cmake
-
-DEPENDS +=3D "ninja-native rust-llvm-native"
-
-ARM_INSTRUCTION_SET:armv5 =3D "arm"
-ARM_INSTRUCTION_SET:armv4t =3D "arm"
-
-# rustc_llvm with debug info is not recognized as a valid crate that's
-# generated by rust-llvm-native.
-CFLAGS:remove =3D "-g"
-CXXFLAGS:remove =3D "-g"
-
-LLVM_DIR =3D "llvm${LLVM_RELEASE}"
-
-RUST_LLVM_TARGETS ?=3D "ARM;AArch64;Mips;PowerPC;RISCV;X86"
-
-EXTRA_OECMAKE =3D " \
-    -DCMAKE_BUILD_TYPE=3DRelease \
-    -DLLVM_TARGETS_TO_BUILD=3D'${RUST_LLVM_TARGETS}' \
-    -DLLVM_BUILD_DOCS=3DOFF \
-    -DLLVM_ENABLE_TERMINFO=3DOFF \
-    -DLLVM_ENABLE_ZLIB=3DOFF \
-    -DLLVM_ENABLE_ZSTD=3DOFF \
-    -DLLVM_ENABLE_LIBXML2=3DOFF \
-    -DLLVM_ENABLE_FFI=3DOFF \
-    -DLLVM_ENABLE_LIBEDIT=3DOFF \
-    -DLLVM_INSTALL_UTILS=3DON \
-    -DLLVM_BUILD_EXAMPLES=3DOFF \
-    -DLLVM_BUILD_LLVM_DYLIB=3DON \
-    -DLLVM_LINK_LLVM_DYLIB=3DON \
-    -DLLVM_INCLUDE_EXAMPLES=3DOFF \
-    -DLLVM_BUILD_TESTS=3DOFF \
-    -DLLVM_INCLUDE_TESTS=3DOFF \
-    -DLLVM_INCLUDE_BENCHMARKS=3DOFF \
-    -DLLVM_TARGET_ARCH=3D${TARGET_ARCH} \
-    -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust \
-"
-
-# Forcibly disable the detection of these packages as otherwise
-# it will look at the host Python install
-EXTRA_OECMAKE +=3D "\
-    -DPY_PYGMENTS_FOUND=3DOFF \
-    -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=3DOFF \
-    -DPY_YAML_FOUND=3DOFF \
-"
-
-EXTRA_OECMAKE:append:class-target =3D "\
-    -DLLVM_BUILD_TOOLS=3DOFF \
-    -DLLVM_TABLEGEN=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen=
 \
-    -DLLVM_CONFIG_PATH=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-con=
fig \
-"
-
-EXTRA_OECMAKE:append:class-nativesdk =3D "\
-    -DLLVM_BUILD_TOOLS=3DOFF \
-    -DLLVM_TABLEGEN=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen=
 \
-    -DLLVM_CONFIG_PATH=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-con=
fig \
-"
-
-# The debug symbols are huge here (>2GB) so suppress them since they
-# provide almost no value. If you really need them then override this
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-
-export YOCTO_ALTERNATE_EXE_PATH =3D "${STAGING_LIBDIR}/llvm-rust/bin/llv=
m-config"
-
-do_install:append () {
-    # we don't need any of this stuff to build Rust
-    rm -rf "${D}/usr/lib/cmake"
-}
-
-PACKAGES =3D+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liblto"
-
-# Add the extra locations to avoid the complaints about unpackaged files
-FILES:${PN}-bugpointpasses =3D "${libdir}/llvm-rust/lib/BugpointPasses.s=
o"
-FILES:${PN}-llvmhello =3D "${libdir}/llvm-rust/lib/LLVMHello.so"
-FILES:${PN}-liblto =3D "${libdir}/llvm-rust/lib/libLTO.so.*"
-FILES:${PN}-staticdev =3D+ "${libdir}/llvm-rust/*/*.a"
-FILES:${PN} +=3D "${libdir}/libLLVM*.so.* ${libdir}/llvm-rust/lib/*.so.*=
 ${libdir}/llvm-rust/bin"
-FILES:${PN}-dev +=3D "${datadir}/llvm ${libdir}/llvm-rust/lib/*.so ${lib=
dir}/llvm-rust/include ${libdir}/llvm-rust/share ${libdir}/llvm-rust/lib/=
cmake"
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.49.0


