Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F144DCCF9F8
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 03:25:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39345.1762745138745316825
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Nov 2025 19:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TYuCzsEQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3409abb8af=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA1pcvU2594317
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 03:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=V4iwNmTnOJ6gXazd/gaxnWLz+4+dzKJ7NB2JNbQS7fc=; b=TYuCzsEQ9rdZ
	R0Fk5jJZufrwLTpuemFTnhxnU0K6AXCaIGDdPUCojExIM3vkhYXWiJmfAtqwZ8Wg
	aIRTIK9mcr8jlki5fJ2l8oEwBrHA+KSJVRken711HbeoXlwiS+qqCHnDGB2MrMiR
	DEAqktfu1XC2ocJJ5kRl12hjlIOxS+E013a71vi8uqUliBXVtdqPm2x3zBdkG896
	5oFtP5O2QklWaL5gb5eYs08TnWa3juIunIHSdQP0Gq3VlH4u9p7PTP3KudlPBNY1
	LYwg4D98s4bN8NEhcLLFZUZ7iFbMyF4ffAcnkqUm7ZrQ2CWcN1wAzzOAhG956zgC
	mMBlbfRMHw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011005.outbound.protection.outlook.com [52.101.52.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x1h3s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 03:25:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WM9OiGsSguc0d+hjuCiAVuH/GiU5zkGk1i3l9lz56S116zkAlNoqyOUMpJG4Tg2npP9lIgYhcWedtfw72BeEorOak9pAaAlu3F3kszKWkRVUEn5lveVBVdvTJ5MYI+53xPVLhL2VDIourOrCBT0Fj6VD69THNogEWrn8keJDbQUjtR4hO+1vWcn6BAz82uZWr279THtJj1hDzxvhs4IB4Y3nrpbjC4pDeTOUEEL2tvb7wBifgDx/ldsfnHWtDi88yu5XamBG+mwj6QYJyGZhzOJYkuEInZg2MQ5vAELyK14pDq0eL2QQTx/nDmIeDuZ8pDRXhuolcL2C5v6tF/6Mkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4iwNmTnOJ6gXazd/gaxnWLz+4+dzKJ7NB2JNbQS7fc=;
 b=iI03igtSfyfxZAbUZ6SkPUPxqCpQXYMSOQDuNI/XkDdOtqEttCB8yn0O4/MbGiV/nQl5kSpanwpetRvt91CUPyLbYCIsn6FH8LXe1IioJYXI+hTapOMAhoYJuXpXebXP0nvmd8PLn1jG+etzau5Z1oG4pL61bBCT8iQ/BKwegfOX7K9uUiecfwOEOsb8bQPC9rlI4Fq+CBcHZJJrmzvie82MLr55360mZpZAlvBHNCAgMy+OHBu8jdC7aCzIbbgGtUCz5/Vrwve+LUON0IgN4Oh2vC2335pr4gp9qh99E2seuapEy3X8ovjagJs9VqPJ9gyb+DiK0i8vtHSUUfLbTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by CH3PR11MB8237.namprd11.prod.outlook.com (2603:10b6:610:154::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 03:25:32 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 03:25:32 +0000
Message-ID: <56464405-a02f-4bd5-9b1a-3d5c27f4c31b@windriver.com>
Date: Mon, 10 Nov 2025 11:25:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] libxml2: upgrade 2.14.6 -> 2.15.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org, skandigraun@gmail.com
References: <20251105023236.310076-1-hongxu.jia@windriver.com>
 <DE2A8WAMFQ8I.33H1IHF8RV2DJ@bootlin.com>
 <8a42aa34-7ba5-400e-92d3-3765eeaccedf@windriver.com>
 <DE3KIA2656K1.2UE9T6FAQSG2Q@bootlin.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <DE3KIA2656K1.2UE9T6FAQSG2Q@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0074.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::18) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|CH3PR11MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: 3682165d-e51a-4a5d-7f91-08de2008cdf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bnpvSnRLMnFZeVJ4SjN3THN3UmZheWRjcDdKbFhEOVp1RjBQdGJTSXVxR1Qr?=
 =?utf-8?B?TS9yQ0NoWHlFWVdLUFRZc0IrbFhJdjF6VzJXYkJ1ZnR0QzlTK1NGMW1kUUxJ?=
 =?utf-8?B?ZTBER2R6YnFTSEQwK3k2OFJLOU9lMlhMSCtac2FFa3NaWEd5OGFjYzArQUQx?=
 =?utf-8?B?UTdQSXFneU9ETWdZZG1UMlEreVFrbC84ZGRaeGEyb0VTbnRzRVl1NkFxcVor?=
 =?utf-8?B?VzVXc0JEaUk4N0hoQzI3NkhxT2RSMnYwRjJERHc1MHJhZWVEdVpxVEFPK2xF?=
 =?utf-8?B?bkRxc0NUUi9qVS9nTS92RnhVUkpHeGlYUThobzFkUE9Pb3FjWEdoVmFPSGc3?=
 =?utf-8?B?bzBTY2VZckJ1MERNTXgwcm8xZnllZGIyV2pwUnFXWnlQYW4vODRRdmh3NVkv?=
 =?utf-8?B?WnBDZGNmVFZ5UWU4K1o2amgrMEJ2YzhPaVF6WklHTXBYRXNQRnBkWXBaZkgw?=
 =?utf-8?B?Zks5UitoOTAyUkVoS2pDZDY1WmZRallpb243TmQ4Q3RNQi8vL1Z4a2Juc2pj?=
 =?utf-8?B?Wlc2bnlwVVVVVktEU2FEY0FOWVhFQ3RlY3Rvb3pVSDZuK2o2SktudTN0ZXYr?=
 =?utf-8?B?SzJDN3JrdHkvZ1RtQkprdm90bitmNFJHNngycWI4c044NlVlQk5jVG5LZ0Fq?=
 =?utf-8?B?V0Q1NURmTC9UeXhESHhNdXVaQ01SUVM4RkIxL25VYnM4eXVCc0huQmhXY3By?=
 =?utf-8?B?ZUxEclVpVnRvZ3NaY2V6VTc3NnRjekM1Y1hFdmpjMU45TWxzYVE4djIzUFZ1?=
 =?utf-8?B?dGJHVXIvR2o1NW56am1WMVdTUndaVnR6R2dodDdtdTRqS0ZKTm5kc2FXbDRS?=
 =?utf-8?B?aFgyR2xTdENaL3U0a0xGc1BjR3NWRUVPeG9TeVVrS2pheE93bU9pRXl2N0xr?=
 =?utf-8?B?WGJla05zdGlEeXAzcjNpbWozNk12TzRINVdsVXF3L0pERGZWOHhQUlJuYmpo?=
 =?utf-8?B?Z21pZlovN29TcTlQZVlJY1ZHTjg2ZzdNRXpPNFpJSnRMWHo2UGxJMWcrdEVa?=
 =?utf-8?B?ZWVRcjhwRVQ5dHRlai9VV3F2MitkMmN6dy9Zd1lyejBSVWRiSHpXMXRNNEln?=
 =?utf-8?B?WkVJQkhBdVNLSCtvb3RuN1AyMlptKzgwNStPMkU1d2VZeHprRGdoQ3p6Y3l5?=
 =?utf-8?B?RmNLeTdBNVIybFBjK3NlOGV4ODhGMlJRRG1rK2dHZEVLSnk3VVJpbEs5RERx?=
 =?utf-8?B?a09LL1d0c296Y2d3VmdiNGRJL0xGZUQyVGVYOUdBZzlkMmgxR2s1QkhiRzY2?=
 =?utf-8?B?eHE5VEVzWmcyVngxV1BNd0I3dC8wYk9BM0VOMTk2aEw0YVVqNndBbUJlK2dB?=
 =?utf-8?B?dm5VTFFFdHZEOVg5dUN2ZlZFRDRxQ3huOVlXQnFncEltNEVzaG1KUExwY3Zw?=
 =?utf-8?B?N2dBOTI1K1pXcXVSa1lnVTNPUGRjdTVJdEtGNTE5S1JtS0FDazFSTDczWkl6?=
 =?utf-8?B?cGhpaWNxa014MklDL1RnRVhoRFgweWFjWlc4Y21na1FNNWZEOENqay9HMFZv?=
 =?utf-8?B?YW4wMXhZZVV4QkR4UEx3VldvUGFIMGg4cUhrYjk1M1pSZnhjalVReGZuaHdq?=
 =?utf-8?B?MWhiT3BLS2c5Rlc3dVh1WEpucUZXcU9uYmlabTBHRlJvSHgwNVVXeWxGdXdw?=
 =?utf-8?B?RVFhQWthQ3RRNmNPdmRKZHVtYjROL3V6cGo1bnlxUzdIclk5UmJRQjEwdGlY?=
 =?utf-8?B?MzJEWVNCQWlUNEZMUk9jSTV1a3dYZlM1NFJZWFpURkFWSHNxTjVRWFp0cGw0?=
 =?utf-8?B?UmxDYit6NEVYSnd4VERZKzh2a3Y0Mmw2cWcxem82d1g2aHk3bG9hdkNkUmtJ?=
 =?utf-8?B?TFRVRjZkQ0V1WjlpZWw4UlQ1VVpRUmx6RDNobzI0cVEzbzJHV2lFdzhPOGJF?=
 =?utf-8?B?dGQ4dndzc1BVakJueENEWFRxYTVUVyswM0pvS2JXd0ZNNmc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VnlXQzkxOTFqQkptMEJCMlFXRTVjVVRjS1FqZVRoTzV5S010UXUxVFZBR1Vv?=
 =?utf-8?B?TUp3ZzdNQ0UvSURBb1BEbGg0cjEwelBnMzM2MlA4NXp4VGZDM1hXSld0Nm80?=
 =?utf-8?B?WXpZNmFNYk9jKzVmT0Q3YkgxQ1Q1RndSWVRFUWNMZ21OZFdrRjNrTEFvNDFM?=
 =?utf-8?B?aEtOdllpOE1SbE5hWGcySUNBTy8xQ0JGSlNvUS9Bci84RHRVWEZOWVY3ei9Z?=
 =?utf-8?B?QnE5QzlqN0FlWkYxNHFyd2JpcW5ib1h3S0ZNT0NvRUVURnB2Z2VuVHBuT1dy?=
 =?utf-8?B?VHBJaGhuNHBGZU1RazZhdFE3Nm5TOXYxaDlhVWdTNkFjbGFlcmg4WENuU2VQ?=
 =?utf-8?B?UXZWRnJYZ0h5Yk5nNnIzMi9kSFlhSU1YeTUyWi9CQy9Gc3E0RmZUQlArMXZo?=
 =?utf-8?B?cTlpcnh5OTlJS21yVFFRQWl0YzVmL2xTd3U4TjJseUFsNDcvdEY0OHNMVGx5?=
 =?utf-8?B?OEdIMEVCc3ZmQjB2WXFiRkZ3RXNKdm1zemwwQndETXM5K2xvcHJzNnRLR3ZG?=
 =?utf-8?B?VnBxUHdrUEozQTN5b3R2a2VKcnZ0RlFSYWtTV2N6TmpheG9xTGFlc3JqUzNW?=
 =?utf-8?B?djNCaEJjcmNEVmZZWG02ditaRndvSkhtcUI4N3UvNnpFQjkwMFUrY3Q2dHBi?=
 =?utf-8?B?aXlteVIwSDlVam03YVphVFluNDc0R05lbU1ob1lUek43ck00bWIxeWM5cXAx?=
 =?utf-8?B?bG9NWVN5Y2h2QTV4MHZ3WEV0aVVxUDVhNytoMVZiWkR1RTlrSkZMZkNaNXY4?=
 =?utf-8?B?N3BKdWpUUnhnUnZINzNRQnUyVDRyMEsrOHcyOUpEQ0xjNW5qVDkrbE9jMHU0?=
 =?utf-8?B?R0JPUXAxYkRZODFzc0JrRXVycHUxNGI0b0FCdS9BVnFGR1VKeGJUREVibHpF?=
 =?utf-8?B?UzJOK3AzUGx5a3BidjR6aDZvN1ZIOGkvbHdicm4rS1N2ZFQxa2w4dHBWa0xn?=
 =?utf-8?B?NFFTdUwxcERzNmZpN0x1TEpKSmdYOFlEMEVhYnZPWm1VOHcyNWkxMHFmY2ZO?=
 =?utf-8?B?eTYxZjJKZk1GVnd6cGMvcWJiSGxsVkJiL1FUdWlaWlA3RHNsR0Fpc21UZlJB?=
 =?utf-8?B?WVgxTGs4Yi9UcWJXNUVNankvRFdWenNlZVhLMEo0NjFGaDRNTlRhMkdpZTB0?=
 =?utf-8?B?VTYrWXZZSzJqZUZVZjY1MHZFVjQ2amlqb0EzZE1PaU5nakpscnlvUzNsVWVG?=
 =?utf-8?B?ZUNKazBmSlRZSDBTVlFKQ3dvVVU3TWJCSWxuL2hPVmY3aGJGNXBRR1VHM1JU?=
 =?utf-8?B?TTZTUEc4RGxQdkpGQk1Tb1h3clgzTzkwSjNYd1RQNmdvWVRXV0JSaGNiTmM0?=
 =?utf-8?B?aGovSURzVXU5VHZLemtZTGxGVWt2OE5DL2xDSHNkSm9KNjdRNmRMNnhEVDVB?=
 =?utf-8?B?eEtSYTNVY3dkc3Q0dnRCMjRZallkODExRWgvK0g1ZnVRbHRWZDdpMDIvUjZo?=
 =?utf-8?B?Nk5SeUxsYVdST2c4Q3o2WHpRK0dSVTZrM0dUK1JVczY5QkVYeWhrSlVES1pE?=
 =?utf-8?B?Z2pua3NzVlQ5SHRuMitsR1RENGpDZnBOQU5yOFdxa25sU3NhVGJ1djhjamVQ?=
 =?utf-8?B?UnlTY2ZxV0tGdTRIMWlRTncrQ1U4dmYxMkNENnlvdERTVDAyOXVXTWN2T0tl?=
 =?utf-8?B?WEhNNWplbGZBSmVPbmdDTG5lMTBZTUkxM0duSExmMGExamovSkVDVzlMakZZ?=
 =?utf-8?B?MjUzL01LTmIzNU1mSUhRamoxZE53bmg0aDFkM3BFSHdjU0V5VEUxbGV5UTZL?=
 =?utf-8?B?MXJBaFBUc3pjT1lZL1NEWVZrYm5odDkxanh3VUpNRHlneWY2cm5teVZKRWNu?=
 =?utf-8?B?eFpzOUhhZDdEODVQR1daRFNlQWVCdk1RSldMOGxyWjlmZ3c0MXZJMWdMUWZS?=
 =?utf-8?B?VjFkWE52anVRNyt2bHg0MXJLK3NuTVFPMWtuaC8wV2RsSkMwaFNQc1doaTA1?=
 =?utf-8?B?eGJ3MHd5d1hYeXFTVkVWVFVhTXA3QlZUY2ZFeGs2UjkyQnJVNnJocEJMUmNQ?=
 =?utf-8?B?NFMxL0tjMXVCODZoZ1VudExvbTRhbUd0Um93dnRFK2x0Szd3MHlxMThxQWxk?=
 =?utf-8?B?WGxiaG5aYWtDYyt0Y2NaVHJSd0hWdW5xVTY3TWZsdFZ0U1BRRnlLdStwRlFh?=
 =?utf-8?B?SDJHRkhWNG9FL3UzVFY4MWdvVjkxRnJiRFdLeEtTbXZNSHZVbGVaOW5LSFRJ?=
 =?utf-8?B?Q3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3682165d-e51a-4a5d-7f91-08de2008cdf1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 03:25:32.3471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRJ1FpZGdTyi+CusxecWJPnHNkKjr/K8gIJ7tsL0Ri9XODBumejWLdOlVZY31QhArv1sPzMkvR0DoXbHMoKTzl9AThv+JbAO+yKZgZPy6HI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8237
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDAyNyBTYWx0ZWRfXzklo4WCSq+Nm
 RXGVB3LMEy4Y3aSnq8jB3jU4zZN1B6w873XShO8KYBuEXGQ+Jv6YXo2A/G8agsd7zzmufOGL2ct
 cduDuFQ+LcZ/3xm1Cq33xddaK1EdBLNecXHcLdM/WfXj468PD1ytJJJ6S4PZ9Pn8dIqDNJqm+zy
 OePKiivL44WukSxkZGZUHXpjRCibrk1bGst9oWqbrP8Y/bXMHrMy/OBrjV57tdJuXgm9Ik/d6QC
 qjGaD09FxSjhWWXeQQ1Ays+RB3UxgjkMwRxyiv1kDwjEHugs7YC1ERciu3thdkzV/+SY+3wljaR
 wkTHiGn0FggsIgABxQ3peOWgK1nxVcHmLOaNQlpPM7GRPr9tOOYXLQH3MiWjveZ2li8hukRfKNr
 Ai2Wywgh6v/KAnX9NnNc89i6qY4MBg==
X-Proofpoint-GUID: aUq1v2X9T8bYSWhj2U63-yj8ifhrVn6c
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69115b31 cx=c_pps
 a=IFr6uxAXmWssV7p2N+XdEg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=GHR8O2WEAAAA:20 a=Z5getJ8MAAAA:20
 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8
 a=EG0CQW_dTfqF8Qm6tdkA:9 a=QEXdDO2ut3YA:10 a=m9p5bXcFLgAA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=CTwFTDRtctY-zZ8oRDn3:22 a=yULaImgL6KKpOYXvFmjq:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22
 a=UDnyf2zBuKT2w-IlGP_r:22
X-Proofpoint-ORIG-GUID: 0Wii3ml1KFmmDayjRfWnw-PgXrwUrYkd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 03:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226099

On 11/9/25 03:41, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri Nov 7, 2025 at 9:27 AM CET, Hongxu Jia wrote:
>> On 11/7/25 15:26, Mathieu Dubois-Briand wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>
>>> On Wed Nov 5, 2025 at 3:32 AM CET, Hongxu Jia wrote:
>>>> Due to upstream [Remove LZMA support][1], drop option --without-lzma
>>>>
>>>> Due to upstream [disable python bindings by default][2] and are
>>>> planned to be removed in the 2.16 release[3][4]. If we still enable
>>>> python bindings by --with-python=yes, due to upstream [doc: Build docs
>>>> with Doxygen and xsltproc][5], build python binding requires doxygen
>>>> otherwise build will fail, and we do not provide doxygen in oe-core,
>>>> so remove python package directly.
>>>>
>>>> Refresh install-tests.patch and run-ptest to not install python test
>>>> cases
>>>>
>>>> Drop CVE-2025-6021.patch which is obsolete
>>>>
>>>> [1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/1763281cd65ded4067ddf123eb7358690c214b0b
>>>> [2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/fa931566d2f541d3162c7b98c8a12e6b2a6ae542
>>>> [3] https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.0.news
>>>> [4] https://gitlab.gnome.org/GNOME/libxml2/-/issues/891
>>>> [5] https://gitlab.gnome.org/GNOME/libxml2/-/commit/bbe5827c94cc9b0e393ff3e6eef6dec2376317e2
>>>>
>>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>>> ---
>>> Hi Hongxu,
>>>
>>> Thanks for the new version.
>>>
>>> It's not clear to me how, but it looks like this update is breaking rust
>>> build:
>>>
>>> ERROR: rust-1.90.0-r0 do_test_compile: Execution of '/srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3876356/tmp/work/cortexa57-poky-linux/rust/1.90.0/temp/run.do_test_compile.3947248' failed with exit code 1
>>> ...
>>>
>>> alues("optimized-c"))' --check-cfg 'cfg(__aarch64_swp8_rel, values("optimized-c"))' --check-cfg 'cfg(__aarch64_swp8_acq_rel, values("optimized-c"))' --check-cfg 'cfg(target_feature, values("vis3"))' --check-cfg 'cfg(feature, values("checked"))' --check-cfg 'cfg(assert_no_panic)' --check-cfg 'cfg(thumb)' --check-cfg 'cfg(thumb_1)' --check-cfg 'cfg(f16_enabled)' --check-cfg 'cfg(f128_enabled)' --check-cfg 'cfg(intrinsics_enabled)' --check-cfg 'cfg(arch_enabled)' --check-cfg 'cfg(optimizations_enabled)' --check-cfg 'cfg(feature, values("unstable-public-internals"))' --check-cfg 'cfg(optimizations_enabled)' --check-cfg 'cfg(x86_no_sse)' --check-cfg 'cfg(kernel_user_helpers)' --check-cfg 'cfg(feature, values("mem-unaligned"))'`
>>> | error: rustc interrupted by SIGSEGV, printing backtrace
>>> |
>>> | /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3876356/tmp/work/cortexa57-poky-linux/rust/1.90.0/sources/rustc-1.90.0-src/build/x86_64-unknown-linux-gnu/stage1/lib/librustc_driver-d18035d17505fd2b.so(+0xd2ab55) [0x7f3ae2d2ab55]
>>> | /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3876356/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6(+0x3bba0) [0x7f3ae1e4aba0]
>>> | /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3876356/tmp/work/cortexa57-poky-linux/rust/1.90.0/sources/rustc-1.90.0-src/build/x86_64-unknown-linux-gnu/stage1/lib/librustc_driver-d18035d17505fd2b.so(+0x8527820) [0x7f3aea527820]
>>> |
>>> | note: we would appreciate a report at https://github.com/rust-lang/rust
>>> | help: you can increase rustc's stack size by setting RUST_MIN_STACK=16777216
>>> | rustc exited with signal: 11 (SIGSEGV)
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/2610
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/672
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/2613
>>>
>>> Can you have a look at these?
>> Seems no direct relationship with libxml2, but I will still have a look
>> and try to reproduce the rust build failure
>>
>> //Hongxu
> I tried to pick again your patches, and I'm not seeing the same issue
> this time. Some tests are still pending, but I'm highly confident they
> will succeed.
>
> In addition, the same error also appeared while testing other patches,
> completely unrelated with your. So it's more likely that we have some
> bad intermittent issue with rust.

Got, I will try to fix the issue

//Hongxu

> Thanks for your time,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


