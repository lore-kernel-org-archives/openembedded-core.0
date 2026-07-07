Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E97E0C43602
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 08:36:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.168930.1783413367102722992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 01:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oUj+71Pn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1648a4fd34=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678I8sq1011263
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Jul 2026 08:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=4xWLNzGJS5ujY4BtBkd6Zb
	RJ7WXPgfvJTT1LKqFPmFE=; b=oUj+71Pn+1RUsEMfbb+XDlPA6q1QbcUWEr6VjD
	fTXvW48TIJ3hqOXPvlWUXlvR7amGgxKicpNbL/ldMH61iB0RFmmZoWTUwxeGq8p6
	JISz94cYVDZuzWuNLlYqF7rutn665UFe5otk4beEa3FNcys+wzw0fO5gNpKJKWEk
	H7O7VBhYWrGQ6ismTbmGuK+PTEurPSpg6wMPbpxKK5/HXd/CNna6DVYK2Q++aojr
	TVA6EPZDvL0WKmkK/YhF2QEGhAYkTLucSZyjVnfrrh+bPjMemzze9zCbt0NxVWIa
	rM2ZBtcqBt43MU8vu1bi+yHIZ9ZiXjGWYmkGDvX7Mfgw5X0w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6s58bv1y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 08:36:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVPDtsMYZ0pK4IRFxtuEy1K1tshfCIJlGhWRjOVKOW5y92/7ijUq1Xw+bd2zFrmmmNpBo3WvWIYUfLSQB25Jg91fpfIptHlBtK0S838wwN185WmPLGIbiRtD6K9ggk+D7W2CgyijkNzyoIeTERU65y9E1btsnpfCRLNkBS5JPHCpk0jVpBYxogvLpHXEnS7KKVeVQevGHfpAcRfSihZm2GGeP4DVSY7JB7q8JEI985qHJfCgIpT4ppKIZ7jmU21bp81umKoc6H/J+oVMkCQ9x6bVGuFO/N0EEJ4nEWEYHd8lDXxQNzVHB0y+1G1gcIH/iqF4Fe1v1NFiRCVhEKZfMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xWLNzGJS5ujY4BtBkd6ZbRJ7WXPgfvJTT1LKqFPmFE=;
 b=NXrCILxLg6iG5txbmbh/gX13z6NUTZThFPk/kmkfdXUubdcGNuFbyGUe8L3wcSsTKtRY0HIbPyDbigYm3zz0Oq+KFN4Q7VoQtcgahQlChAWh6auGvdm4PHnPwm3HPEHkbGL7ljDMeyGkPtQMP1KNn9Avmw2104IfrlRd99Hvg4z9xmXe8mtjlsqYuAhtZFpWvi2CqePv38WjQHf2e1nhX3aWjE573zdmsOZYZfN/qjzUdm/g6znWy0GiLzrATBv9qqbzy7o+MA/zvBWAEBRnsSe+QuMlkXruvktSuGsQ2dOL0+0xRpVuZdHOOwnv2qtKSFWqebRowBQajlU8N4kX/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SAWPR11MB9921.namprd11.prod.outlook.com (2603:10b6:806:54a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 08:36:03 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 08:36:02 +0000
Content-Type: multipart/alternative;
 boundary="------------WaYxEK9KXt78PST2Lnv0rD0i"
Message-ID: <07613951-39f2-4025-b260-17c1936d31d9@windriver.com>
Date: Tue, 7 Jul 2026 14:05:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/4] kernel-yocto-rust: use clang toolchain for
 riscv64 when Rust is enabled
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, raj.khem@gmail.com, tgamblin@baylibre.com
References: <20260706112905.41381-1-Harish.Sadineni@windriver.com>
 <20260706112905.41381-2-Harish.Sadineni@windriver.com>
 <DJS60V3OTZ8P.1G7BQBL5EUH7G@bootlin.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <DJS60V3OTZ8P.1G7BQBL5EUH7G@bootlin.com>
X-ClientProxiedBy: YQ1P288CA0007.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::12) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SAWPR11MB9921:EE_
X-MS-Office365-Filtering-Correlation-Id: 635fb563-8a87-4073-6420-08dedc02c033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|11063799006|4143699003|56012099006|18002099003|5023799004|22082099003|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	M34DeAwqGWd+1TogoGfACo1HuImcyhsxY+oN62iaLMMn8rMHF1gUQbD8QsF1sy3047Oxe28zdv+3Fm/4BX2W/rb6w3Mkh/AkWuJcxnkK8BKHlMewmf1MmBMnHpnOjL9fQdLXncD0h3InjAWtpm9qHBrXgFL/UxUqK/o6bBQytcYRwRP+HswS7Jd7XOsvH4jqrKo4Q8QTyUSYD48iAtdaaXMMN/pTMiiLfQdGERogxVeYHzncY5DTJ1F7wJInRlcAiM5Wgnb9V4tfsBeSxFEcdflQhjp2LNppmt2XhAmyfQgADV0DtO0rxUru+6Hgfhupe3TmXh1SX+HLSlasjXIHLOLQDZtLI012QB0uggPkVa/63jlcxWTkfBCJo8Q87wTYRdpHD3ctRDj3arwDRvMFWkUcAT9/BvmY/894nDJ1RZ/u54Tn65SJPxSPxiPsKjeoeDHJAeIK7MadSrIe47mHLh6K31VAxazC2sJ4bzvEKJQXTCOCD37SBB7s1njVrwjinyQI4KUMjIhlArHt7uEgOsgq650AyPIjr1lH5eVqF3o2mWEIwLFe4hqRZCvcl/Mexys12mVZmlGNMH8zAHrB5p0mMvraF0nhyK+/kG2NFyE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(4143699003)(56012099006)(18002099003)(5023799004)(22082099003)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?THNqSXliNWpsdnU5eHgvNGFZemNRejVDV0xscnE0dVlYd1JHM0NJbzUwWThF?=
 =?utf-8?B?c2hnekxLdkprUlk5RTNyU0lVUzRhVVFnU2RKMi8yc1V0eGY2MDZHNHFjNzlo?=
 =?utf-8?B?aDhHU09peXhSenNyb1pmNTBleFg5V2xxVkhobFJaZ0N4dm0yQzl1RWtYMlpa?=
 =?utf-8?B?V2pnNVhlYk5kdzNtdFVXZW52N1dzMEhyRXVKdlF0aU9tSVUreFAzcjhuTTdW?=
 =?utf-8?B?YkFJRjJ0dzlFaUFOSTFzSWRWOWM2YXdJSmFpUkdQdXFNT1psb2V0alJad2Jt?=
 =?utf-8?B?aGh0R2NjY1RqKzRXUTNWWEc2WWVwdW9yM2NsVkF1YXVWWHNwTGhJRmxRZDlY?=
 =?utf-8?B?ZG1WMVM0Qi9YdHQzRFo1QlpFc0pTNXUzQ0o0TTJPUTh2VStuaGduREg2ZHg2?=
 =?utf-8?B?UGlqd3pNNCtQd0VnbzVtRzFSZmlrdDZlZWVMNmZyaGN5b0FYM1hZSU5nb1lH?=
 =?utf-8?B?MER6WjFtOFYyaEQ5TjBmbzNqY05IUlNsaDdiMDRHK2ZoVlhxSzVJdVIxK0Fr?=
 =?utf-8?B?aTZCVTl6dVBZa2lQblo5RFJQUTBWL0RNZHNFb2pXYlg0OTVtRElBbURDQ1I2?=
 =?utf-8?B?OVhob3ZvK0t6U0hFVlNBajhINFdnZ0FQT3QwYTlobTdFL1ZCcVpMV2tUUDhT?=
 =?utf-8?B?MnBjakg2OVVXcUphTHl1b1YzVS9aS1V5K0Z3eGNtdWJXWVFnSUdwVEt0ZlBX?=
 =?utf-8?B?T3JOMk1IVzY2TGNsSHowUHdoclZJQ0lEZVVtbDlraWxJYWhoWFA2L2xEaFFy?=
 =?utf-8?B?d0tOUE81Y2s3d0FwM0tlTTVrYjJEcHNxLzlLbFJJK2hjRWlPbklWWW9hck5T?=
 =?utf-8?B?Vk83QVovK0RyU2tlRVN0ZHkyaE93ZjdPdU9ER0xwd21FRzZVeWs3RTVxRHZv?=
 =?utf-8?B?TmRQY1E0dk5KTjE1QnJ6enlFL1lvQ0VmaEYyaWtOdi9DY3JzMVhVTmxmY0Fa?=
 =?utf-8?B?aGJoQXdGU2lCWlVXQ0lBM0k1RlI0NHlYbHdPUDRpNFBjNmF3M3FEbnAyMG9H?=
 =?utf-8?B?MjZpRURtc01KUzZhWHZGYUcwOTVGRzFvMmxVeFBnR01zVXc3c21yNG5PYkVp?=
 =?utf-8?B?QVhoREE2eTlrYktBN2p3RTFnM1VNdlZ4R3ZBVWw3K0hxRS9lYUpWb1pVcVN4?=
 =?utf-8?B?cU9xVFovY2NMQ3gwS25SQjJiUkhKQUp5a09DZDBLVGgyc2M0T0ljTzZGQngr?=
 =?utf-8?B?Q0ZqTHZOVHFzU0VCeTN0OVovakF0Z2p3WTdVRjlDZzdsQ0lrQzNjRlBSemdi?=
 =?utf-8?B?UDU4YXdrb3R6eFBIME1VRXcycWJjemlLYzBURURndW9LUWc1R1BpZXJyQ2o2?=
 =?utf-8?B?SzFQRDE0Y0NySkplekFrYUhLUVNlbGs3RUlrV0xpSUwwK2Ntb2RCVU9yWXJh?=
 =?utf-8?B?LzZvK1h3VmNQTzJPR093UjNzZTZqWStNOUJkRTRHV3pJMC9RUzVKdTRFbEhs?=
 =?utf-8?B?djhSdnduZnE4M0p1cmRiazlQZFYycVVQVGNmcVlYTE1rOHEvWG41Y2grY0gy?=
 =?utf-8?B?WFZDc0lPY1NXN0JkblZoTWJpUHlKWExYOEtOWG5nZklGRDk3aFV2VXQ0UURx?=
 =?utf-8?B?bXlzTHpMTk5DQTNHOWpBWk40c1Rna1dHYW9XcFcwYnNrU1lyV2wxVWQyU1Jw?=
 =?utf-8?B?cXdJWE5OL0M0aWgzNmRDeE52UTZmV1MzdHBRVjNxaGdWQUcweStJb2MwNTho?=
 =?utf-8?B?aHB0K3QvU1BEQzhOZDNJYmRkMTNxRzJscHRQWk0rcmFjNkJQTjFkc1ZlUTRL?=
 =?utf-8?B?dWhwUHVhbFVKTHo4eU1iS1BOUjhQOUttOVMxRVJNMDdwTUM1ZEhFR05WMTFx?=
 =?utf-8?B?UndBeE5YZjh0QWRXTjFuRXZWdTJmWFVHRFJzZmxLQWFwcUl4ZHdlK0JoTHFR?=
 =?utf-8?B?RHE4WmV3dUU3R2VnbG1yR2c1RFF2SmhQU0VmUkpqTlBBcDdDeUlvQTQvOVI0?=
 =?utf-8?B?Y3NoNGpjcDVYVW1vSzIvaVVvRzQzazlzVEJIbGhtU0c0VFJwSDR4NjJNM3hG?=
 =?utf-8?B?MFhueDdkOGVzZmlUS3ZyV0dtdU43QThVTW1LTWZ2SVAwWmljdUo3M2FVUTNv?=
 =?utf-8?B?Y1hCZ2d0YzBaZzV6V1lRRXFwMFhCMENXbFI2MFkwdk1ZMnJ1QjRLREMwZlFh?=
 =?utf-8?B?N2k1cnJrdHladW1xNDdLeXo1MkRncW55Q1RUbFVtdWg5NHcyU0lZdTE5SWcx?=
 =?utf-8?B?dk8vMWVERVdaRElIWEVqRGdraDlaNjNvSTlxeWk1K3JkZXhLOEo0NzVFdXNz?=
 =?utf-8?B?UXl3cTljeE1wb3VsU1oxNzFzcjloVWdwYVpjdVBNbXFKVW12THliY2xzeG9r?=
 =?utf-8?B?MG43Z2xuTnhsZmJZdGFCNUN0VmlNZWtYV0RBd3B2UC9CWWlrNmp2czNUSVBZ?=
 =?utf-8?Q?wHpdhaKH53YYLw38=3D?=
X-Exchange-RoutingPolicyChecked: 
	RCU4CAu6p7VaFA/Vl6nHXhIeTaesLRDc2Wrs/QmmEaM454oDghcIgHlgx3zXjujhvj4FSelogs5aqU1G43dPFOIffB+jbyhcfF5M3xvut8LNNJAaqV3c9l9ix3wNMpsMC/ojw71Va3/pZQxyNRd6LWo3w/bZtFE1UJXpmPBYJfId4Vz+HX1uYsEvkiKpZ/lN5hh9Wcu76gydaQexYQB427qqOMUJNS8Y6Rq4dT2nctgZqds5FZ4lqFykIvsflBilQcy7JKGtdONiV/WekytnVM77zaqAQ0Py8z9+7qMSEPQBWWj2SLEjIqweMxXs2Q18v5yRTrlASTtg8zrSpZNYpg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 635fb563-8a87-4073-6420-08dedc02c033
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 08:36:02.7154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KY/MobBCw9ls+tSo6SuJuVkPqeaeaB9VJ5YV40qjrzOAjTvIVOReiTlRBwcmuzGfZn1Rrp8zCOyakkQC4OV2RpAdYAmMEvPQcnDBYnlQL5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9921
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4MiBTYWx0ZWRfX+XQ1IKBBhDIU
 ZLsKn9RDm7UCmbJAr+HHByBcQwZBe5ZmtC40JSMtf549T7og84PZN9GBmS4RZU/J44smIRRkDSw
 3gAsa2O3m3LPGcqv9Kxul6hLwaKBqm5tzZw1LzGYlCVJWpcDnZnu
X-Proofpoint-ORIG-GUID: SESIg4iq4RILf-G1WtnxoXXSmtZF9Xs8
X-Proofpoint-GUID: TOAvheZd641IILTC4g3uirAT6QDLYyXU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4MiBTYWx0ZWRfXyGvYiR32LTnG
 XK5MQgMX+NU+PrR3oExKnCUtRZh41bMK1ZflgfY1lSZGnWVXI8PkLst5sR1pIVYYfZQrvfZrRlm
 w6NksXi2/c0YkFTL86VqOCv62bChaT95cMrUsWXfLbHEqovEABmVf3W+qowmL48pca5E0v7jElP
 Z9lp/nkLnSnnbfxC1uOHgyBCwmh22M85bjqzELqLfIqi3VWUpmQOPK5hYaI/iBoBjoLr1g6iPZU
 cZHQd8sJoTTkaJwo0PfLxi/U2SJwIfBXijUFo0KsioltkYbCLBzaL4kjeK9rhbLIp7UTbbbWduT
 coeQb0oJAJb+xMeZpfeGJ/7JUDveR0U5By/MrywBnXiKDaKabA8jlVkyNpVSmqB0q95OLp0BEdh
 bY+XtKR4UKpIsDxboJUtilMqgSRkLUsUKX+j5HX/XfDMo0UhHS7KYuKEqI3jwGhDWzo4XzKRUrU
 Hwzj8eQNqmUijjxFt6g==
X-Authority-Analysis: v=2.4 cv=H5frBeYi c=1 sm=1 tr=0 ts=6a4cba75 cx=c_pps
 a=+KlkUUL6BOGgxGViHu3/Fg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=VwQbUJbxAAAA:8
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=NSLVPOaNHC3vjR67bJoA:9 a=QEXdDO2ut3YA:10 a=yj-aMKAYKbz0kkd27lYA:9
 a=AJkUTW_G0EWBiW7X:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 08:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240367

--------------WaYxEK9KXt78PST2Lnv0rD0i
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 07-07-2026 01:07 pm, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Mon Jul 6, 2026 at 1:29 PM CEST, Harish via lists.openembedded.org Sadineni wrote:
>> From: Harish Sadineni<Harish.Sadineni@windriver.com>
>>
>> Enable LLVM/Clang toolchain for riscv64 kernel builds when Rust support
>> is enabled, as Rust is only supported with LLVM toolchains for this
>> architecture.
>>
>> This aligns with upstream kernel Rust architecture requirements as
>> documented in:
>> https://docs.kernel.org/rust/arch-support.html
>>
>> Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
>> ---
> Hi Harish,
>
> Thanks for your patch.
>
>>   meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
>> index 4e230d405a..ee0d5abaeb 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> @@ -91,3 +91,7 @@ do_devshell:prepend() {
>>       d.setVar("HOSTPKG_CONFIG", "pkg-config-native")
>>       d.appendVar("OE_TERMINAL_EXPORTS", " HOSTPKG_CONFIG")
>>   }
>> +
>> +# For riscv64, Rust support in kernel only works with LLVM/Clang only.
>> +#https://docs.kernel.org/rust/arch-support.html
>> +TOOLCHAIN:riscv64 ="${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'clang', '', d)}"
> So I believe this is wrong, as you are setting TOOLCHAIN to nothing if
> rust is not in KERNEL_FEATURES.
>
> This is failing on the autobuilder with:
> Parsing recipes...ERROR: ParseError at /srv/pokybuild/yocto-worker/qemuriscv64/build/layers/openembedded-core/meta/classes-global/base.bbclass:36: Could not inherit file classes/toolchain/.bbclass
> ERROR: Parsing halted due to errors, see error messages above
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/1836
>
> Can you have a look at the issue?
Hi Mathieu,

Thanks for catching this and for sharing the autobuilder failure.

I will send a new version shortly.

Thanks,
Harish


>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
--------------WaYxEK9KXt78PST2Lnv0rD0i
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 07-07-2026 01:07 pm, Mathieu
      Dubois-Briand wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DJS60V3OTZ8P.1G7BQBL5EUH7G@bootlin.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Mon Jul 6, 2026 at 1:29 PM CEST, Harish via lists.openembedded.org Sadineni wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>

Enable LLVM/Clang toolchain for riscv64 kernel builds when Rust support
is enabled, as Rust is only supported with LLVM toolchains for this
architecture.

This aligns with upstream kernel Rust architecture requirements as
documented in:
<a class="moz-txt-link-freetext" href="https://docs.kernel.org/rust/arch-support.html">https://docs.kernel.org/rust/arch-support.html</a>

Signed-off-by: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
---
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hi Harish,

Thanks for your patch.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4e230d405a..ee0d5abaeb 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -91,3 +91,7 @@ do_devshell:prepend() {
     d.setVar(&quot;HOSTPKG_CONFIG&quot;, &quot;pkg-config-native&quot;)
     d.appendVar(&quot;OE_TERMINAL_EXPORTS&quot;, &quot; HOSTPKG_CONFIG&quot;)
 }
+
+# For riscv64, Rust support in kernel only works with LLVM/Clang only.
+# <a class="moz-txt-link-freetext" href="https://docs.kernel.org/rust/arch-support.html">https://docs.kernel.org/rust/arch-support.html</a>
+TOOLCHAIN:riscv64 = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('KERNEL_FEATURES','rust','clang','',d)}">&quot;${@bb.utils.contains('KERNEL_FEATURES', 'rust', 'clang', '', d)}&quot;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
So I believe this is wrong, as you are setting TOOLCHAIN to nothing if
rust is not in KERNEL_FEATURES.

This is failing on the autobuilder with:
Parsing recipes...ERROR: ParseError at /srv/pokybuild/yocto-worker/qemuriscv64/build/layers/openembedded-core/meta/classes-global/base.bbclass:36: Could not inherit file classes/toolchain/.bbclass
ERROR: Parsing halted due to errors, see error messages above

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/1836">https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/1836</a>

Can you have a look at the issue?</pre>
    </blockquote>
    Hi Mathieu,<br>
    <p class="isSelectedEnd"><span>Thanks for catching this and for
        sharing the autobuilder failure.<br>
        <br>
        I will send a new version shortly.<br>
        <br>
        Thanks,<br>
        Harish</span></p>
    <br>
    <blockquote type="cite" cite="mid:DJS60V3OTZ8P.1G7BQBL5EUH7G@bootlin.com">
      <pre wrap="" class="moz-quote-pre">

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
<a class="moz-txt-link-freetext" href="https://bootlin.com">https://bootlin.com</a>

</pre>
    </blockquote>
  </body>
</html>

--------------WaYxEK9KXt78PST2Lnv0rD0i--

