Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA367C5AD4E
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 05:06:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23183.1786338358239791311
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 22:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=qqktLd7/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=26829886ce=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A47doI1046466
	for <openembedded-core@lists.openembedded.org>; Sun, 9 Aug 2026 21:34:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=0yN1DqVq9G9pSsbsObzV7pLbcC2gzZRDWjACzeDMOIE=; b=
	qqktLd7/tW5De17OdshEblytPjQu6oFJO/+7gzshB+Ci2IyyNj99cg7xWVUnkzGp
	CG7yZEX699v5UWOGPHNbeqb5P1gVJ19xQcC64Q23jEycGqoOaaRek78J5sYljUZE
	4KUCavtIptf6DATZwUJ5PAloh6y4nCWGOiMHJ7TEeYVGdZwaIEKqjzQjFNhdRknm
	IhbwGUJQkzAm3yV+lwj8yP6c4lsbNtzlXrsfqJveMOCdSYehrFE2o41tGh6vYFY5
	zRGA23OkChcATZzn9KudujrCHowcvAwHutofnLTHIKKid2m4zgd5Geb72sggyXNE
	Koq9ENUAYAoCgg3d7rHcHA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011051.outbound.protection.outlook.com [52.101.62.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fx3yeherg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 09 Aug 2026 21:34:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1m+peaOQYEP24H4TgL98mnqHJrhjnWbN2NcyWnz9DXBdiFVluDwY4qvv+ve+VhPb4Stas71EA3Ow945XyPJhUy8/j/8h2UA+xH5aC6b54Gv96BmEyY1q/zJh1UByVDceWCHdX46tPuWfoEg6FuLsIe0N433T8vElQSZ8mOPiacmPz8IA+EaKqLmoiJlwpAkSmNAMePqtRNrZmmmaJky3EcHsdYOGN5sjIU8Ns7BidZopSWAsVCW2BbUqTkNVul2aUS8jXQQk4itOshw0TNVXLg6bKUgxbZpQ+aDH4nFePEDUItKyy8ozdrkgiorK+yIOnB+FFLqjyiyq21922MhhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yN1DqVq9G9pSsbsObzV7pLbcC2gzZRDWjACzeDMOIE=;
 b=spI32mXxZOK9XPyRFFm1PLEMH24wEVkOyO44PNGY51YmBFSEXQkbVMmxMY+4LaHd/8XXo1k/3gxLoGPRCUQexX5dMQqsnDcczN22n6RQorwuSVSWSc/F9sVVryAGE2/W/FCRBG1SrZLLzbCHQOcUBbm6AWh4uA0Kz2JN/YWWf2h9G28mua4EHiiw697uNsylb+gWTIsxG2e8vM8+NtZe8cgOB3Tv+XsGioK/16zxP0N4tHxjV1Um+fwTeiWcqF7fSzc86BVLMFOgIyBMlearwLON5S4ZroCaNPAJlPFNBzdDMkzcIfN/442yB0OF0Tm7LyldIsrJCXHhQrHEEaVlaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by LV4PR11MB9513.namprd11.prod.outlook.com (2603:10b6:408:2e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 04:34:51 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 04:34:50 +0000
Message-ID: <53372501-b641-4a31-9317-7df8a8675c1c@windriver.com>
Date: Mon, 10 Aug 2026 10:04:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/3] oeqa/selftest/clang: Add oe-selftests for
 Clang/LLVM/LLD test suites
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>,
        Randy MacLeod <randy.macleod@windriver.com>
References: <20260803041741.790019-1-Deepesh.Varatharajan@windriver.com>
 <20260803041741.790019-4-Deepesh.Varatharajan@windriver.com>
 <04519601-5714-4D12-99A1-2BF15C49B652@arm.com>
Content-Language: en-US
From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
In-Reply-To: <04519601-5714-4D12-99A1-2BF15C49B652@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PN2PR01CA0175.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::30) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|LV4PR11MB9513:EE_
X-MS-Office365-Filtering-Correlation-Id: f1036d3b-b233-4e23-bf54-08def698b752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	I8jlQpZ4Kj6wNwvivepDv98FMKURba5VDXzmtdBa0AroBXpBxgtgoNByzKor9jYHVr9nbJfh589R7LZYn9WjiVNhuoizhQMKFFQmht9tt01C27Glpvx/pIO19hdrfkDQcnV5iW/jpZiVD+DlWP4KOidAA4lbN9GS+D4zft+wHUtU7cDJGVEN1O8kmZ0KUBlj6BQJQ0zomGNahjHgw0vgHbVaI823kdlU9Fn3FG/5dSIBzRnrRMgdHaZGD0LXhFXH75MSf7TGYRPF0fhSWBD9EAq1/u+fkAzUPCt2w6MwJcqX1o/CzI3Cg6fFRsmaMFZ9p0bhA/vt3WkxRpOvDbS9CnNMSv1kCAFis6cIrivIl4TTtQdLoTNQuPpdak5e/ah/5JC5VL1KeIKQiI2vT2z9Vcjsbonrl+jC9CyMDl/pA5wyHFhgtjQmXm2lIUY08knUMpq0msR1thZn+x+83b9uuNpauXJvIAYVDdCzAv/vm/uhqjn6o3ERfWhO3RXGd1B6XMjHPP3CDsxOxSogVmKWtNJQMvjQ9yYnlYzAgXCsFucm26pRMqpq0VBtSZxM1Y+ZL33l0eXbHGXhLYG8GNV+TKx9gh11FIWev7fslD29UHWCjSm+OU0QxxN8KBWgJ9onmJg/vQLNqVN+qwZalgw2U5y93bSTTL4fKF2i5sY6tp4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dFNzdVdPK0NoWGEreWR4RkpiL1N4MFcvQW5nWFlPRkdIeFFVSWhxNDRqOW0y?=
 =?utf-8?B?LzhkMjZVOHBNZVpRSzN5bm9Eek4zL2QxcFpkYUJvM3Y3UVkxMTExemNtcHVR?=
 =?utf-8?B?dVJMR2kzSUNCaE1CSENNZ25DUEhGWlFycVNHR3k2SzJYVHBrZFFXTFZLSWMz?=
 =?utf-8?B?dVZ3a0RvYmYySmxNc29oQit2dmhKQWZOZ1VVRjJlV3pYNDRac3Y1dVFxSzU2?=
 =?utf-8?B?YkIzWUNPM094VmdwSEhGZVBXVGEvNVdFZ1ZqWHd6OUxpaCtVcEtmL2dqTSt6?=
 =?utf-8?B?MHk0Y2t4Z2J1cXRzUmh1Vm5GUTdGZE0raUxydldHazNDZGxLUEtqelNEczlF?=
 =?utf-8?B?WXhLMStmSUFRcEZnSG9jRnYwVkpTbjJzODBqYzNuMWQrTW43TkRVSlNIMXpt?=
 =?utf-8?B?WXZQNEVGNWwvUlJmL2FpK0U0OU9rTTFGWkRFMzhSd1hLYXQzdlhCay9lWHRY?=
 =?utf-8?B?Ri9VUnpFTkR0TmtvMFlEYWRoc2dLNXdnODRHaDJEOVBiYmRBL2dxODZSdk5B?=
 =?utf-8?B?MXU4ekgzVU90NjV2SWZBdW50TUtuVi9EcFdkWVVxUEFQcFJ5bnRNbS9WTzhR?=
 =?utf-8?B?bkpIcnFsMnZ3ci9aekwzNXpKeVk4dnp1eXBtbVlrMmxob1ZPWExYSDh5anFG?=
 =?utf-8?B?K2ZtUHJMaDJ5ZGJUUXVnK2FPemNqamxwMDZGR004TEFOb3doVlZFcGw3SnR0?=
 =?utf-8?B?UUluNXpYRlJpaVJGUkhhTlJwbGVSOExBdHFSVzhjVU1aYUl5NU5NUGcwUWw0?=
 =?utf-8?B?TWlyTFRyTlZqWlFScjdleVhlNnVKdlRhSWdmVFpqMjl1Qi9sTTlDL2ZVNHR3?=
 =?utf-8?B?VU1UNU1kczNmdW9HV3l4bzlqUFlWejhvQ2xVS05SYkFLSTJoL2pxSk5SRnBs?=
 =?utf-8?B?YXFHR3l3TVp4OENoVDZDUko3U3FidVYraHdzOXRFOGtjWno3TzQ0N1NlOVhE?=
 =?utf-8?B?K2pMc2FRMmNmNTd2ZmErWFMvekY3ZDF2VWl3RjZoaUpKUEZjbkkrelcrN0Ri?=
 =?utf-8?B?UEpTa1ZaK3NscE53aVo1YTFGbTdnOGVGRlV0NEhUL0xCakdPaXFQazhIbko1?=
 =?utf-8?B?NXRoWitNOFJHRm8rR1JPWC90ZXIzZS9OL2tXaG9XM1F5TDA1dEo1MnhaekJV?=
 =?utf-8?B?UTRNY1Y4REthVXBFVkJoRHpjQlFLb01QcmhMTGE0ODd1R1FXeENqdEJrRmlN?=
 =?utf-8?B?bkprbm10dFdWRGdYdzNSRTZ6NDBCWVhTVmY2dEI2WFJSL3VzWWNVQW54cVQ5?=
 =?utf-8?B?V2M3SXI2c3N5V3h3QUkvcFIvanFZTmRRbFhrOTYzSjBMWjBOOGsxd2Q1OFIz?=
 =?utf-8?B?NHoraHFHM2Rjd0xsbUlKeTZFMWwzMmF0L080UG15QzRSYUc3VE9IM0RITXdM?=
 =?utf-8?B?REdqdEgweUpUMjlMUXR0ZUZINlFSaTdELzE0akdlYkZoUWRMTHJOczRERi9o?=
 =?utf-8?B?KzdDYSthZ3FLRVlxQjc0YnlQK0VXNklYdC81dnFNUloycGFzY1QxTmNER0VD?=
 =?utf-8?B?ZHJja0hReUhtVEc0NGJLeTQxcmN6aTdZZUN2ZGZNWVpDckZldjB5cXlqVDlk?=
 =?utf-8?B?TVJpVG1CYVdFRTloQkpVUHdRQ0FEMmZzWkt6WVZZdDN4anR5dEZCMllDcEZu?=
 =?utf-8?B?NEQzUFhrVWdHVExBZ3N3MlRZc3NlRzh6ME5hMUhHb2taVjFrb003YXNsa1dL?=
 =?utf-8?B?NVZrMlBiSE9ML0NyVWRSbmtDckl6UENMc21jb0VST2cyWDhKYjFTRmFiTlhz?=
 =?utf-8?B?UkdxMzlHSmRESzRTOXhlZE9UU21wTU1LU0NQT2RlelZUSWJ6UHRLWDYvNUNm?=
 =?utf-8?B?MG44aXRIQ3NEU3ovYWlSN1lhZ1hnNjQvTE1haWVPOHFoYWxFWHZTc2dhdzYx?=
 =?utf-8?B?UW1PU1dPQnROYjF1Z2ZndHRTL1Q4NGFnMHRsbmJ2ZnAzeUpsVm44S0dRS0Y4?=
 =?utf-8?B?d1N4dHNwYi9OTy9zZTBvMkR1dmJLdS9NeDJYWVMwTGdlWWppSFBXN0NlUjBl?=
 =?utf-8?B?MStaODRPRUd3cEt5NHRUMVB0c1hXTmU5M0RkQjRsTVBpazIrVDVTT2I4aExw?=
 =?utf-8?B?WW1ETEhBQmNyYzQ3ZE1RdkRqMG9RLzM4ZzlyeHBwdmlaeFczeStKQk1wWTFM?=
 =?utf-8?B?dlNjZkxGSExPYStnOGtnSFNlbFZGdGlsZlRGYVBNQWd1UDZNMlBjUUN6QXFQ?=
 =?utf-8?B?NkZLaTRWN0dNZXhhTG9SWk0yVFZwZi9oSEliVkQxUXdNcW56ZjlSSUJncDRX?=
 =?utf-8?B?U0YxNFhUZjRSdGtBbjNRekI3Vml0WVlmc3VXMTVLaTF6dG93Y1cyZDBzNmxa?=
 =?utf-8?B?UUJ1M2VvZ0hvbDNSYWNNR3crU2NzRnRoVFNUSVFMNEFvS2ZraEhLN1dEZE0w?=
 =?utf-8?Q?iDviQP0rV5nikKVZiNgodzADW4OlD0qb8DC63?=
X-Exchange-RoutingPolicyChecked: 
	Pdz1kpZk0gHIGd3W3BJD/usfcQ3vU0yp076s3BbfkE17ti5k9EECSC3bRgtmDrxI4Xejs9TLT2WfYV4aNQHSz6FRhOWo4oliCeC3LKmPRRHINmo3o2oZmnUnSG2abktcRhw/hYaE1tF7iyMWpKdtrpAStuxVi5H/D8ADrsRSE9cPNqOaxRLp5ClGfFfPbcPST2pJ3tY0qKCYiu7eyk4g2tWa3LzJ9s5JoSBKXMn0h94unuxxemN50RnnvqyTQUlVl7k461t3V10rdyETNZQI0yhlhz7lI/meSnzWsoqbbWMEU5ddGTLfRJesDLdOxw7r9st6mYlREvw1GvXeFl4rug==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1036d3b-b233-4e23-bf54-08def698b752
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 04:34:50.8344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUOpgIr/1BNv84Lz33HL+AP44sCaQ/5cnTweA8jOI3V+NjoR21/uoye/RDZ/gG1JJOz3mnyMT/Pispf290JZxQHzPAEhB7Iit4eTOgkA7BlPC7UlkGNB5GLZgVs0VbMd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9513
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAzNSBTYWx0ZWRfX8MT/A/l8Knwh
 TdPJGtdtO5RgfsYv6b1ovjZRK0ZxqibxDhecznVtDsYvGX3ulzaWJFR12MCyZKRmRz25+SCQMXC
 N53GalnF5fQFTJqHTwp2rlPjOw/0ABBL2lQbgJAFVHfFs4qm6VorgO4kfNDXdhy6udJ4gkcAN87
 Rk4gR72DLcZzsv77HyLwA7x0pz4FeO7MKRmvvj1rY2RqCotLvXqK0BjsyZzNgbihcgg1e0NQACS
 R/PpzMa/Wd5EJBGbTEOCygEXYnO+xpxtRU0oH9ZBm2WHOoKlgjTwMLlFpwzsLRKAi7BQtUSaOtu
 8NYLql9WJe17K21BRMDIj12PYXvkVYMCARjzrF4VmqKfCPTvMyVpmMnbtj9ovCHNrXJ0I+9PfrE
 M0KCw3weY7Y50mz0wNxObRGAbboPCHjQVHA6kMtbimwu0YPi1+XDcqOJtmjyjK5zkBzznOKYJI6
 F4mbemi/vkZIzgJBF2g==
X-Authority-Analysis: v=2.4 cv=NbHWEWD4 c=1 sm=1 tr=0 ts=6a7954ee cx=c_pps
 a=qX5DP9EEIf1faxnBSU0rOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=Q4-j1AaZAAAA:8 a=-eKswTagvRWU0HmS93MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: qiSk1YUhONHmrp45H4mX3IR-BjFFJ1yG
X-Proofpoint-ORIG-GUID: HlPkDDZKTQmoBERin6h_6eFeDMxLAkOe
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAzNSBTYWx0ZWRfX/AMxg9yKp6oR
 tZTC1VnsZJQzQrrdOOBoYoLnsOWGJLY3enwZ1EGX9e2ZI5NV+7gcbtqKmlFktuOra9ws9wG/bPC
 up1HaIiiTFQn67l6gqe3SJy00Sa79vCtFshTjBaEjNRMK7U1gn1x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100035
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 67A47doI1046466
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 05:06:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243103


On 06-08-2026 17:10, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 3 Aug 2026, at 05:17, Varatharajan, Deepesh via lists.openembedded.o=
rg <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>>   - Excludes known-failing tests specific to each component
> I spoke to our LLVM team and they confirmed that the expectation is tha=
t the LLVM test suite passes reliably.  They have builbots that run it co=
nstantly and it passes fully.
>
> So _something_ is happening to cause these intermittent failures.  I th=
ink we should investigate as a matter of urgency some of the failures to =
understand what the problem is: my concern is that there=E2=80=99s a few =
underlying problems that are unrelated to specific tests that is causing =
the failures, and we=E2=80=99re just excluding tests randomly.
Sure Ross. We=E2=80=99ll look into the intermittent failures and investig=
ate=20
whether there are any underlying issues causing them.

Regards,
Deepesh
>
> Ross

