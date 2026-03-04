Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86629EB363E
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 12:39:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17098.1772627986511643420
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 04:39:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=hqiB2cBb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7523672f62=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624B1OK1420005
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 12:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=xvZcqTqrCD7eSwDCvZZKV4
	sWqa4mXpebqbuElnREwh0=; b=hqiB2cBbE/eH1k4zXXir81cQK0DYMGsezspess
	DsKNAL75ehuoEAPjmjqah+M346k7ECSbwWtLhk9uZBU7jPFuL6irGcg6nsgvxnJj
	B9htMMITMrLb+awR90ZUdj5rFFXq8C12QlCx1+llc4omxJmL92bjGzLyc6MRUXvP
	E7eAVU2ZAl7dedOXGym9rBZNJp8PNoeD1Ar1a7uQm6MBr5bvv/BO878kW4IYZAL3
	F4NtO+dDN990Tf3WNKokGNQJI1nZs9WpuIuqHoMsS014G3fmnPxGNXsr9o45ZNs7
	uJadlRf0Y+Ex3tDeBeQXuOUpjX9M4r1Hqf3Oj0jPpR+RieYw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010001.outbound.protection.outlook.com [52.101.85.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4n1ry-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 12:39:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKWEqw/wiu/iL38na81bEsWd25cys5OgdfFSYptWjqVtUeQUDdclnY0OXEMirE/t/jcVbwN88rHLV74bQHjnVo3uG9p8vcIO614G99b5UH5Wa3Hzkehfj629CqRG4JWSJcEuBM0Y7uSEbq+vKirWlf0IdIOzW0nJ4XIfse3YkYU9n5+gKAUE8BQquXM6o2+hf3eSBPOUZ7xgv8jZgjURipg2Z6oA9yRZXujicDy85WcgIj84+PRaSyEhWCIKMzeSrnNCzgsWgHBbg8k/aDbgQMySrhbyWRH5aiVpeL2ocN64R46hkyGbkf0UX0yV5z9UBzGddg8QgQp3p+hMZgMwhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvZcqTqrCD7eSwDCvZZKV4sWqa4mXpebqbuElnREwh0=;
 b=OZ26hSK5C2gm7GlA+R/zB6MBOtJeKBPlXHnz3vD4wJzRojetyeFtd6rfbHsEW+787kcb4zFOa7O49T3neEqg9CXDtpCQCiSTziOi76vc651c98q8jrCxnTZCzE5yRY3y8MbBFj1C/pWPVwx3ZGOx4mAWGBIPntURvcJY2PdYebXfC4Ll0M0xN8plEKyhz51+FY25cGVMmZm6w5YP48Vxi0C0fDDgZ2EtHSp0d9o2v1MPA1zCGIa/uz4gexsG2PPPPSGe9Uans9TXEMrHXB+xU9ayIdOcXflv3QhP78V6DXtjmU+lh/MS/7kZdAFya4WaLtlJSEdutOgV8kVOLxzJJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CH3PR11MB8435.namprd11.prod.outlook.com (2603:10b6:610:169::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 12:39:42 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 12:39:41 +0000
Content-Type: multipart/alternative;
 boundary="------------8yMC2F8YHRIWxaEA7mooigmt"
Message-ID: <56f69f79-77b8-4bdc-8401-f51d3e7d3bed@windriver.com>
Date: Wed, 4 Mar 2026 18:09:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v6 09/14] selftest/cases/runtime_test: Add test
 for Linux Rust sample
To: Yoann Congal <yoann.congal@smile.fr>,
        openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
 <20260212181039.1826154-5-Harish.Sadineni@windriver.com>
 <DGFKTMA2S0AH.2FYRLKHRWQT5I@bootlin.com>
 <DGFP3A56EZTR.1TWUE93WL575C@smile.fr>
 <7d5ca94b-0062-44ae-b941-5401bbc56aae@windriver.com>
 <DGGI69KGL871.JD0YXGHLVBAH@bootlin.com>
 <DGHECF0K4Z1P.2HFBCFPWDKJQ2@bootlin.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <DGHECF0K4Z1P.2HFBCFPWDKJQ2@bootlin.com>
X-ClientProxiedBy: MA5P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::16) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CH3PR11MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e068a5e-ce32-46e1-7b3a-08de79eb1b41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|8096899003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	O1SmLkz421SzULLmOR1iX/AtXlI0QFkD3//6czNgDm4SQ23y3FyyK2KaG9BDRbY3DN0qQxDSYe5o2FgBVGWmgwBEfHuuZmGHmpPcQJU5HoBV15GzlQH/oOpFsvpdPc+XQV5XRIYJPbuh2OSlZApPjDfyP8lOfLIFwLmMuglStIRtnMRZsI6gmxzpYbJEmGgukfz2DFVMIjvz+JwUvC2kh4WqGo9ddMB/wfI/pKcH9v0z1TWFqnRKL69F6FGIbqDkWLxCRnwwlFaT2EEG+7+wnTcG+fZRZZsApYIEoV5T9vaCNa3ARZqKXtcVS8i9NX44hW5xI0ZPuJl5HsiYV2VwcMNIwiT4AEKuOvML78CbIcgzVALxCkUmAurJaJOdoeQcVquUk4d5t+DMM3DsesK/m7+QLxsMa0R2aF6DoTh6VnXnGwioM6eRVqK98PN7p8OHdgtNiMPQjo0mX2+cuOhWjY6rqpyVSmWl4IWnpcZ937lN3Sfr7xfiP/3YAWsyCpP/dpefP7FOOGlMZyO3apfQOnWs5vfqwAJ/brYHE4MDzREwlMeJII1t1RhXqfigtksNaFQENcCLOyCBaFvrjh9aeM0qp7JsK5BFQO5aV01B7aqOjwrf8o/CuKP3VNZpmTRnUAytxEo2CMn+EC6BxGfkLufp+u6Hr494EwHoksYrjVq2UUjS/by5jzqsyAGDZcKpwnSJuqqtHdktmDBgCOpFIHWhhmTxgovkSvIskV4hSho=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(8096899003)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M29LQklIcUJHcDVHanlSVElXc2paMzc3V1FnSzMxbFExeFFOTnlCcXhQUU9p?=
 =?utf-8?B?NmN4S2thSmYvdDNLd2g2ZXNMaVVzSDJWWGJjRzduTnBSazd6cmZYNWM2TW1M?=
 =?utf-8?B?dy9sSlZ2ZzA3NzNPRE1tM3BOKys5eEx4dFROWHdLa3JsNlBZaHhLU0lORnVo?=
 =?utf-8?B?RnNUR2lqNEpKUUdzSU9WeUZYQlA1QVJpS0lWSTk2NVhpenBTd0N3dEEzQzdp?=
 =?utf-8?B?aXdIb01UM0JqSFJMNm1FcExZM3ZiMGg4dXJBTUxRVTJzb1poTGdNTVBRMjNU?=
 =?utf-8?B?Y2IyeW9pa1lwQkdXSHl2Nk9taVUyQzdSZTB3Tm5sREFrN3IxVmdtcXVYTW1S?=
 =?utf-8?B?SFc5WnhDWGNEN1JsZ2Q1M2djZ2RoUTA1cG83TFBDWFU3aFYwTllVdGN4SWZ2?=
 =?utf-8?B?MlpJSnpQeWw0MWVURk5jMllpMW9tc1lvTmVuQitLdVdUejZBS3hWQWNTeUEw?=
 =?utf-8?B?ZnNaNTdZZWhJZHk4cncxWWV1bis3ZU00TWhQWUczdVd1NlhvdUl2YmhjZldk?=
 =?utf-8?B?RnNKYjNMOE5iempOeGR2dFNtcElrUnhhUXFjc1UvTkVxZCs3SmZZeUhvYXdZ?=
 =?utf-8?B?RFhyYm44ajFyTldYRm9DM3ZJSUp0QUtXc2xWVU1rU3lML2cvK2hFNHVMbVBa?=
 =?utf-8?B?MktwSWpXQjAyUUlYU2xwOFdwMTU0M2hjMUdhd1ZJeXU2eVVramFWaTI1L1BU?=
 =?utf-8?B?dnQ5TE05RmNnQmR2UzhXWVdYMVh3WEVjS2JRVk83K3dYVzRpclE5aVhsaDhW?=
 =?utf-8?B?QVFUaHQrQ2U2QVVnQUhxQ0NzRkFVNWprQ2I0ZENNU3piMDV0aWZGdzlmRmxx?=
 =?utf-8?B?NEo3dWI1SExuYS9TRDhXT211MVRLRU9aN3lsczlGNmRQdEFWaWhNL1dIZnlY?=
 =?utf-8?B?S2NLZ1k3T3VmdUt4cDVNdnMxcWIwRWdhbVdDcjhDcmtML2VFZWl4UXNVT2ZV?=
 =?utf-8?B?WURnVHNFVTlyeUxocFdzeVNIbFhOdytVSXZobjNDbkV6QWRYR3VNNVgrbUJh?=
 =?utf-8?B?Z3dheUZsdW1JWE5rcEQ0NTJTWVprYXRtNGxXN01MY2Nndlc0c3lzMzRzWnpQ?=
 =?utf-8?B?SWJ4QjRYdUg0UVNLeHJxMy9LcU9UZ1VaMy85VGNmbDhWQ2lmckx4cmJqTE10?=
 =?utf-8?B?eFJBbEZkRDBUNmsvbE52cmVkMElqeVdEVitubEtaQVV4cGVNeVdnREx6L3Bs?=
 =?utf-8?B?b0tIK0xuUnA3SC9ZalkwODZOTzlGTzBVQnl5cEJiUTN1TlBlZFdxbkdvRnhq?=
 =?utf-8?B?WUx4VENvbDBTTkdmSit4MU1ld1d4S0R6WnliUHZINzNWNjYrZDAwQkd5L0VN?=
 =?utf-8?B?aG8zSHh0U2FjTm05a0k5N2JXOHpMYzB0NDF1Ui9Fa1BMSmhTMnNFeUJCajly?=
 =?utf-8?B?NFJVdUV4eEpOSTBJY3NacHBkWmFiLzgwVFhPd0FlK3ZuY0R0T09YVG1iQVBm?=
 =?utf-8?B?Ri8rWThiNmhJcXBvNEpuQWtPWjVKbnFDQTF4bkQ2c0J4a1IvUmo5eGZBZ2ly?=
 =?utf-8?B?ZDJxUGJITVorRjBJUHgvaTJqaFVnVC8ybTNjaGdNeFpwcmZKNGFtRUV5TURh?=
 =?utf-8?B?S1AreWxFSkRlUTlOWGVKWGIwL1ZQZ2lpM2YwcFQ2bFVoTVZ5L08vbDVOckFx?=
 =?utf-8?B?UnN2UHJ6YXBDUEJPeDFyYjYxanNLQ0w1cllpcDVseEY0R1BCM1ZINUoyeDFS?=
 =?utf-8?B?MzFUWWJ1REMzLzJaZ0ZidllMSExNWUlUSmxtZFU0eWZmMmlCQjdtRUNiU3Rz?=
 =?utf-8?B?V2MxV1lvZnBCR3Z5UUtSc1Q0Szk1V1JmaFIzWVdwYjlKSDVaYmNFNHhXbEt3?=
 =?utf-8?B?eWJSdU0zSUFidWlMcVFOb3lJTEltZDVheVdQaXpvMW9wT2o2Smg4aGNBZk5p?=
 =?utf-8?B?VHo1N3hEWUNvdGpkSEIwL2JBbGdPdy9QNVhBRnhpWjl2azc3Zzkzbmw2Q0dl?=
 =?utf-8?B?SjZ0c2dQdnZWZmxSdE11Q0l3bnZtZE9sV3BQdW1xRnl1QTZ3R01Cd0UzdHBD?=
 =?utf-8?B?MXQ4cmcxa0FCZGZPemRoTmpMQkRPV2R0SXZEZ2xEUml2RXFBRG1LeGZpUjFj?=
 =?utf-8?B?ZEQwZUJDY0dxOFhRcTBQWXpQNTFIWklFU203c2srUTFFNnFZbEh5VTJXSlFV?=
 =?utf-8?B?V3QzYjFvS1poVzk1TVBmYXF6UTBndU9iZm1LOGI4ZVlrZm8rWFZsOVdoRHg1?=
 =?utf-8?B?OTRCSEgybEE5aW5sZXZObVM3dVpDaDBnMVZmam5RRTV2S08xejN3WFVVM0Y1?=
 =?utf-8?B?dTFyQUcwM29xM0VFM0E0WkErVzlwUWM0aE5qaTMxZ1NJOU1HcUZHdHVpaUN4?=
 =?utf-8?B?VHlSRVhlRW9ZN3NNVGswd0NWaks0UUQxN1ZYczFtR1J2L2lEWE9zU2Jkdytl?=
 =?utf-8?Q?esXZQTcKAH/imKpg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e068a5e-ce32-46e1-7b3a-08de79eb1b41
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 12:39:41.8893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MdKk7BpgTEs15uus1JGRjrQv0JxtkUedYpyKrYqk2NkV/weA2wp7nL/ZpMZqSSxay6afuq2n4USWkyPph0TAo0Nt15/xUg/kSOzr3tLIC0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8435
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a82811 cx=c_pps
 a=BP8zQLqIaVEyLeHVCiSdtw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=iGHA9ds3AAAA:8
 a=P-IC7800AAAA:8 a=utIjx-O-ytirQ1KrO4QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=LVVdaqqDU9W9cF4QaU8A:9 a=P1-_D6QrRnyb--dj:21 a=_W_S_7VecoQA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: tA6hMzVUoL_01b1sblpS1ee45C9xcyFI
X-Proofpoint-ORIG-GUID: EiIZxmmCHdcYEz7hN2sCgBxb0k1mdAkl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA5OSBTYWx0ZWRfX2cDCZ+aD1R0Y
 CGgbclv2kBTHXLFrAx6xcQwuAWDKmJPdKgYakPKMRne4EbaK1LyhISjuLYlAmDHZS04x3bAKIjB
 2uW6Lp/Vkt86fwGBodBO79PBHjf4ZNlJaiqy+dmLbBwWxHaDwHFVHPL/F3YpD5PCWBSkKrxtrpL
 ot62Bj+OkIZjqwm2aHnJ5p6o25XLK1vcBtLeks6RLnVIXgXyWYu1VmJT/z4jkiPAVzwdOyTwbR1
 Ur4P60Ad5JNoePZuOSiJ/u+YPAFl2bK+0PxzaQjo+2untcKxPnCK3rJp0cOyOcJb764/O/cRk8G
 oeoDRxNU41fk5tCsfFWbDZNfoX9+NvQM0KVAUORcgOs90bqKmq7V7Tcka1vrx0jkQOxYr9jsejX
 zNv5HZi4jBAkK1yiC9Q4UEIRzH2xZiA6WMyTiZ7ULFi8PE++pJnwnI/4P3jW3hYGi3rN/+Hb+Fr
 tetmNT7/ElDfJNdlo4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 12:39:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232379

--------------8yMC2F8YHRIWxaEA7mooigmt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 624B1OK1420005


On 2/17/2026 10:31 PM, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Mon Feb 16, 2026 at 4:48 PM CET, Mathieu Dubois-Briand wrote:
>> On Mon Feb 16, 2026 at 2:09 PM CET, Harish Sadineni wrote:
>>> Hi Yoann, Mathieu,
>>>
>>> I tried few builds locally, but not able to reproduce this.
>>>
>>> On the autobuilder, We ran following builds which were completed
>>> successfully on ubuntu2504-vk-arm1:
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/33=
26
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/33=
31
>>>
>>> Additionally, One of Mathieu's build also ran successfully on
>>> oe-selftest-armhost ubuntu2504-vk-arm1:
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/33=
23
>>> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3=
323>
>>>   From what I can see, build 3319
>>> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3=
319>was
>>> triggered from a-full/3219
>>> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3=
219>:
>>> However, when checking a-full/3219, it triggered build 3317
>>> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3=
317>,
>>> where the rust kernel selftest passed.
>>>
>>> I can see few other builds were successful on oe-selftest-armhost wit=
h
>>> this patch series. I=E2=80=99m not sure why the failure occurred in t=
his case.
>>> Mathieu, could you please try running a few additional builds to see =
if
>>> it reproduces?
>>>
>>> Thanks,
>>> Harish
>> Sure, I will launch a few builds and see how it goes.
>>
>> AB maintenance will begin soon, so I will start either later today or
>> tomorrow morning.
> I believe I got one:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3346
Hi Yoann,

We performed few build with additional debug logging on autobuilder to=20
investigate why the test case was failing.

 From the analysis, we observed that the failure occurs because=20
*qemu.run_serial("modprobe rust_minimal") *intermittently returns status=20
as *0*.
This causes the assertion to fail, even though the module is actually=20
loading successfully via modprobe.

To address this instability, we are removing**the assertion that depends=20
on the return status of*qemu.run_serial("modprobe rust_minimal")*.
Instead, we will rely on on the existing*dmesg *validation to confirm=20
whether the module has been successfully loaded.

The build with debug logging can be found at the following link:=20
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3432/s=
teps/15/logs/stdio
The relevant debug information is visible around lines 1202=E2=80=931204.

Thanks,
Harish
>
> I backed up the build folder, it should stay there until next Monday.
> (/srv/pokybuild/yocto-worker/oe-selftest-armhost-3346-mathieu-2026-02-1=
7
> on ubuntu2404-vk-arm1)
>
> Please tell me if you need me to extract any build artifact.
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
--------------8yMC2F8YHRIWxaEA7mooigmt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 624B1OK1420005

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2/17/2026 10:31 PM, Mathieu
      Dubois-Briand wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:DGHECF0K4Z1P.2HFBCFPWDKJQ2@boot=
lin.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Mon Feb 16, 2026 at 4:48 PM CET, Mathieu Dubois-Briand wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Mon Feb 16, 2026 at 2:0=
9 PM CET, Harish Sadineni wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">Hi Yoann, Mathieu,

I tried few builds locally, but not able to reproduce this.

On the autobuilder, We ran following builds which were completed
successfully on ubuntu2504-vk-arm1:
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/23/builds/3326">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/23/builds/3326</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/23/builds/3331">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/23/builds/3331</a>

Additionally, One of Mathieu's build also ran successfully on
oe-selftest-armhost ubuntu2504-vk-arm1:
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/23/builds/3323">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/23/builds/3323</a>
<a class=3D"moz-txt-link-rfc2396E" href=3D"https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/23/builds/3323">&lt;https://autobuilder.yoctop=
roject.org/valkyrie/#/builders/23/builds/3323&gt;</a>
 From what I can see, build 3319
<a class=3D"moz-txt-link-rfc2396E" href=3D"https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/23/builds/3319">&lt;https://autobuilder.yoctop=
roject.org/valkyrie/#/builders/23/builds/3319&gt;</a>was
triggered from a-full/3219
<a class=3D"moz-txt-link-rfc2396E" href=3D"https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/29/builds/3219">&lt;https://autobuilder.yoctop=
roject.org/valkyrie/#/builders/29/builds/3219&gt;</a>:
However, when checking a-full/3219, it triggered build 3317
<a class=3D"moz-txt-link-rfc2396E" href=3D"https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/23/builds/3317">&lt;https://autobuilder.yoctop=
roject.org/valkyrie/#/builders/23/builds/3317&gt;</a>,
where the rust kernel selftest passed.

I can see few other builds were successful on oe-selftest-armhost with
this patch series. I=E2=80=99m not sure why the failure occurred in this =
case.
Mathieu, could you please try running a few additional builds to see if
it reproduces?

Thanks,
Harish
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
Sure, I will launch a few builds and see how it goes.

AB maintenance will begin soon, so I will start either later today or
tomorrow morning.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I believe I got one:

<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/23/builds/3346">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/23/builds/3346</a></pre>
    </blockquote>
    Hi Yoann,<br>
    <br>
    We performed few build with additional debug logging on autobuilder
    to investigate why the test case was failing.<br>
    <br>
    From the analysis, we observed that the failure occurs because <b>qem=
u.run_serial(&quot;modprobe
      rust_minimal&quot;) </b>intermittently returns status as <b>0</b>.<=
br>
    This causes the assertion to fail, even though the module is
    actually loading successfully via modprobe.<br>
    <br>
    To address this instability, we are removing<b> </b>the assertion
    that depends on the return status of<b> qemu.run_serial(&quot;modprob=
e
      rust_minimal&quot;)</b>. <br>
    Instead, we will rely on on the existing<b> dmesg </b>validation to
    confirm whether the module has been successfully loaded.<br>
    <br>
    The build with debug logging can be found at the following link: <a h=
ref=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds=
/3432/steps/15/logs/stdio" class=3D"moz-txt-link-freetext">https://autobu=
ilder.yoctoproject.org/valkyrie/#/builders/23/builds/3432/steps/15/logs/s=
tdio</a><br>
    The relevant debug information is visible around lines 1202=E2=80=931=
204.<br>
    <br>
    Thanks,<br>
    Harish<br>
    <blockquote type=3D"cite" cite=3D"mid:DGHECF0K4Z1P.2HFBCFPWDKJQ2@boot=
lin.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

I backed up the build folder, it should stay there until next Monday.
(/srv/pokybuild/yocto-worker/oe-selftest-armhost-3346-mathieu-2026-02-17
on ubuntu2404-vk-arm1)

Please tell me if you need me to extract any build artifact.

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
<a class=3D"moz-txt-link-freetext" href=3D"https://bootlin.com">https://b=
ootlin.com</a>

</pre>
    </blockquote>
  </body>
</html>

--------------8yMC2F8YHRIWxaEA7mooigmt--

