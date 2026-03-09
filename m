Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11D3F41811
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 16:54:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19569.1773075245007145826
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 09:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=dcEAv4bK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7528dde4fb=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629GfOk11025889
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 16:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Ca/bi9X0Ucg/kHrPGPVmN2
	+0EjfavL0y1RgysfmdS6k=; b=dcEAv4bKECGZcE2mPzMKXru3a+Lmj+3pK+SRgH
	33sgflkqziN2jCN/URdHNhnGxdFRc8IAF7hq/GO45se/sknsGRqdZ6KmLcSuNRxL
	SzFQlfsXNX+9GGs0dL2GWQlioZTN5hiLUZo1mAmPFTplBWbL/zV+zMO/gLM4CuVB
	BDfRvz9K9CvZyXPuxsTrJvFiwk/DlFWdV5qUrYuzHYNYhZfPgRYz6iXveKxrtkLv
	VjKS5CxHZoprQbteZTDo22MNwP5s9W9cF9oO7fYvRTbLBYXZjsszfYFNC8p5O3pA
	W/w0xN/IcJDeHZWgeBbue7dUZoKDuyM4IH2Pju9ujvi2l1SA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011039.outbound.protection.outlook.com [52.101.62.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crb082544-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 16:54:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3MB56JB8RTb3DlzZO2s8zwtQMA6zs88XPrkspNeKQRuPwRI3o/WdPXxh92k5EedgNR719eGB1P0jEcAPGrtFkqEsAPWrzIXvySki3mD+RXph7ITA87EYmONndBT9S5k5tRDzpgddFRSpezUETRKsnL/H/zHxJPg2YaTTiXgOuQ41dYcjz7jsJztFaFGIqyhQWTUcWL+0jSTimil5JqoJ1voi5VebfULIQy5OkUm3bmNBEhprO7XW7Slg2P/55gU/6BSmKjSm39QOdgVcrPmQUGjyIWoHjqHrhA7vUE5cHhNi96wUrkVKpMyfo485AIBPxOCC6oHOkcRs/HZ5YbChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ca/bi9X0Ucg/kHrPGPVmN2+0EjfavL0y1RgysfmdS6k=;
 b=N0RJR4V9N4owScdCwgjEYMYW8jNfKq7R+Y1WthEk23V/gZcWJEPnor9oM72FF51CO5K6advluvSdaLu8zVPgCKoOUfudTI8vHk9HmqQ/QWlbA3/YVHgQ9igCugkyUT1i6GacbKhSN91oeCWMR+SGvQEL/lAIqJxIxcFTXGYqfzyt3quE4OzVHVyloj94u2MCcANvPbX/+0zw6pEiPd516UNjI+UCOlF+ecxhHqthUbW7FqNoA5l0g//G1E/VVBgq2JajxNVl8aePygIDdu1Wld/g1QyxxP668rorPR5ATDmr/b2FmHnUkOHe1d9MufGTHkuUZcLGsxWNA6x4G6KxKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SA3PR11MB7654.namprd11.prod.outlook.com (2603:10b6:806:305::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 16:54:00 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 16:54:00 +0000
Content-Type: multipart/alternative;
 boundary="------------f4TZesOwfvaE8bHiuE7u08OL"
Message-ID: <2e0e0fda-248c-4018-a9d1-2c6679560e2c@windriver.com>
Date: Mon, 9 Mar 2026 22:23:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v7 01/14] linux-yocto: conditionally add
 clang/rust/bindgen-cli-native to DEPENDS
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com, paul@pbarker.dev,
        yoann.congal@smile.fr
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
 <20260304174324.1186644-2-Harish.Sadineni@windriver.com>
 <da48a9fc8556f2a54e44f7e029be64182b0e8cf9.camel@linuxfoundation.org>
 <22371edb-5575-4636-88cc-462d0b19646c@windriver.com>
 <CADkTA4P3mPN8COS=Qeqf9Rzu3-E93r4j11x9b2hX5b2etR34zg@mail.gmail.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <CADkTA4P3mPN8COS=Qeqf9Rzu3-E93r4j11x9b2hX5b2etR34zg@mail.gmail.com>
X-ClientProxiedBy: MA5P287CA0108.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::16) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SA3PR11MB7654:EE_
X-MS-Office365-Filtering-Correlation-Id: b826efa5-ecd1-4b7b-8104-08de7dfc761d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|8096899003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Ow3+o3ZM4tunT/fcd1ZsHng63FDICA+2SgjacN9YzF3EJp9KC7cdJlUfFQeOVRz20S7BiuxtdY32vZ9l4c5Q1QY2zP/jQhGMHMrQp9PE5YvaHWad/py5dIrO09B8USeZMtoms3bE52RwAWCjsppPWz6ia8kT580nOq51qFYGpnx4+FzJDdWCtdB11CqoIJMqK1vEw5CkDRaBDn6hG48qrvSLBqp7nbqTsUIFDelZE3jasTd53bxmG0cxb3aPGfbyFoxmbivTlmUSDuID3qnMgnxz8bbyenLseYTNCJCS3w4dRNchyR7VjfpZe8qJUF4HPaaDWikXkJGnw/z3D6OVOJpWy3vd9lGA95HtSRAK4CR+h9S4kMnKtOey9PPTiWsk256pmxs7F7XJsNd9nG/BEehHnLIqi3HJtuzuy96nJntHBbMFCOoY4U0crcaus/ribRZbdzYXD6Alyva3iDVZrBHJfxCzujVbJLqKoAC0q6b0UQY+oFTBxQkIUhltqNQ2Kl48fQeiISlRmvCMvKbaIJNEYTgJsLJwXsHOE6ObjsTJronmlmQYy6S0Xw5peSRYxYp+8Xz079N+uXT+SLWRTN/GunXM8r3KdBvdlCCaM6QSzj+o5lxNL6N0bLtULW5zgi+IVLDkglmFfszIl1lkOjsU5W0Rp8fLHxyfV9ppv1P55cJY2UtH+sEvIfbKVt4OQofJVSIFm7rDDs/n9h8Ne5oORnoZ4pBJmFrkQrhimW8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(8096899003)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SGgxM1ZrbTRqcVJFZmpoYXpZM0VyOVhrcDRDSXJ5aWgzemlPL1Vpa1JCdTBh?=
 =?utf-8?B?VzJaMXFqRWtRUUhlRUNVSFRnbkpsVHdJTW1CRTluSGVlL3dzLzBGT3lYUWRk?=
 =?utf-8?B?YWpJVDhrWWNkZGtRd1puVk1sUkxGb28va3pFVEd3SmJ3V2NMdEN5by8vM3Za?=
 =?utf-8?B?MExTMCtrcDJHWkZHc3FOT095Q013Y0laNTZ6T1dweXFySUczazNXd0Vjci9i?=
 =?utf-8?B?VmtPZjFKdWx3MWxPTVVXRGpPeFU4WWpieVgveGdzZ0FROWduQ2t6N2dzRDMv?=
 =?utf-8?B?ZzliT0dkT3VNMWtqN3h4cXM2ZDJLUjdXYkVMZ0prdVJSOEowamFZS0xxWWY3?=
 =?utf-8?B?SWhIdG5TallSMnRzTDFMWU03YmZFMDd1dkdxKzNFV3dVOWhOUDJ6S244Q29B?=
 =?utf-8?B?OUZhcXlSRXFLRDgzL1VPczFnT0tIYUV0NElaSVA3MFZaTndKa1QrdUEwUVgr?=
 =?utf-8?B?MHlnczNHN3F0dll3eXU5cWx6eURxQ0dpRXMxWUg5bnVBeFlKdWo4b2MxMktz?=
 =?utf-8?B?UEJJK3BXQllDNGVTaWx5WVVIeUp6MEtkV0JUZkVPOWlPSEl1Q0NvQ3N2NGV6?=
 =?utf-8?B?TzJmL09ZdzZLazhBY3RVb2pEckh1RUJlOTJQSEJKamNOOEpOc0tKMEVLMUY1?=
 =?utf-8?B?WVNwZnU4azdpazVPRCt6dWRUQ3p6K3EzTzQyaHZOR3VEdXZKTVFpK3NUZmYx?=
 =?utf-8?B?OVdoSEV1OW9VMzlzOGFtaFNibWVLeUZJdUtUVElkK3lJQ1R4dkN1eHF6cFlC?=
 =?utf-8?B?ZkVVNENrV0tTRlVrbVp4cU9OQ2Uvdk9tMWZYdURSTGlUSDQ1Mm9KUkNPMWQx?=
 =?utf-8?B?MTBZS3dFVlFrUU1TMnFBS2gwWjliZDlwb2N5NDM1RC83eVMzV0FVVCtFL280?=
 =?utf-8?B?a0hhTENFVkJndmc0a1FxM0t2TzFEZzhEbGZNNmM2OE1JNXU1TTlUT3RTb0E3?=
 =?utf-8?B?SkFHUm1qZlNDNEtIOXVsU216VzM3Z3R4NGsyZ0JLb0JrSlN0eSt2alE0NVVE?=
 =?utf-8?B?V3ZVU0JOQWRhMGIxZElQNjNtS3F6d0Fpb0lVU3g1MG1LSTJ5UjRjZ3luZXZJ?=
 =?utf-8?B?eThMcHI5MjY1Z2lOd1FNa1NnblNLczJkQklRT0J2Nzc5bVpuWHM4bzk3dDJL?=
 =?utf-8?B?VkFReFZVK2xPMHlESUI0dHBEWHZreTVwOXd5MnZlY0FvWmhZWUpYd3NMaUt1?=
 =?utf-8?B?SXdoT254eXJHR2tUOUtaMVpRcWRJeWU3aHRObDJuKzZmQXFyWnd3d3Z2Mmlj?=
 =?utf-8?B?OHZNQ1ZWTnBIV3cwN2NaYkdZWkRsVDQybExxWlJiNGE5N0pDY0gzYThLSFFh?=
 =?utf-8?B?dW5yK0hjcktaQlZYOFF3VGwvdDJiU1hiRm9WWTBtYWZRQzFXSkQ2VWNueXJY?=
 =?utf-8?B?ZGNSbDdBNjYrVHBhQURxN1UvSEliZ0VVNUZrWDhuemdRNElNZjlUSjVGa3Av?=
 =?utf-8?B?blRnZWFlbnVoVCsrb3JCSkQ3cnR5YTZtT0lLc1B2UWZncW8vbGFSUGRXU3hm?=
 =?utf-8?B?M0ZXV3JIQ2h4Z29PSFFDcCtYSFI5UnJpRzZBM25yVXlkK3BtSzJZK1luYVFu?=
 =?utf-8?B?ckROeXdDekpRR3QwUndmSnBMKzd5cWNLNlpjeTMyYUp5ZEV2bnRuYlN4bG9i?=
 =?utf-8?B?aXZSczNZVE9vQWVLWVVYV004dVd1QS9MVzlpNWxTZmVTVjdoUDRycG94cSs4?=
 =?utf-8?B?elpwaDd4ZkRManZYbjkzUFB6ZTBzNkpaUEU5WUdZVXlIQ2tTbGdpQW1vbCsr?=
 =?utf-8?B?U2dDOG9lb3IyTXdvK0gwNWhBZWR4ZUlNK2t3TjVrUnlEVm5LYVYveHJpaWFx?=
 =?utf-8?B?SndDODZWOVd2QUpDOFVKMmZ6ZUkxOFpNNG51eWFIRUJ0blF5SytxWE5TbDdZ?=
 =?utf-8?B?TDRBVEJ1ZTNSS2o4ai9JNVBsdGxVN0Fxa1ZyZDJjam1xVTI3UkUwMDlOTWRn?=
 =?utf-8?B?Y1BKRXQ1RDZEc3RPQmJ3RUpISW81czAzUVJuY0E3L29aWW56QStyWVE4Rndq?=
 =?utf-8?B?d3JPNWRhdWFCSDRnbmVMUnZMeTg2TGRLRFJneS90bzhpRVhPdXJadVhOY0to?=
 =?utf-8?B?a2ZHalpvQ3FsL2dTMk11OUFVVHFGeWtQSDhwVENPUHViMDR4UndJODFMYVZ6?=
 =?utf-8?B?MG1QMUo5TGwxQUZhT0JDOWpvcjlJRmJaSGVkeS9ZL0JmWk9VVmc0NVZ6cG1F?=
 =?utf-8?B?OEx0NXUxT29McXQ4dUZRcTNTRGtpVUdXcGxaaFpZQWtRTFlmdE9zQzIwN1FX?=
 =?utf-8?B?MDJWbE1MVVdhNXdaUE5xc0RIcDZjYmxXbWN6RGpTMVV0cHJuV21xS25QdFhD?=
 =?utf-8?B?MTA5ellvblBuellaQUpDQ0pBUG9mQkVrd203UGxscHJPaXZXNGJBOWVwUHc4?=
 =?utf-8?Q?Isggdj/7BlwdfPb0OOFcxyDmMkLGKwkhchgmr?=
X-Exchange-RoutingPolicyChecked: 
	o0U8c0bi6eAaijYXLv05AYZCctO+3Oh7tRhS0xqoFC4NSLI+uHXdM364HrwNwy56hqlEtzgRv53OsjyIGuC+wgMfvhFGhznWCsx2vA8OQIIERAEl2OUq8kf6OrFZ/KbmKID+0vLjLNx5kXMSzqWEir6vT262yXpQdlym4+Ji5RJOet5RR0L9iyVo+HK/vK9bvgIJWRpcScl0WQULHdmVLijmm6zG2Cp1AKrtJDfC1VTPAs6Z/JFKe3yuaWtO1LZchAYmbusVgQTCHRvt+hw1LWSL9wuHei3CnmgXO1NbrOZfSJdJLvymZKO1QK2sqboc9XtXBc9LLekVF3KzY7uHmw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b826efa5-ecd1-4b7b-8104-08de7dfc761d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 16:54:00.3293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4SoXGBX1wW8rWL6IUDWSM+fx1fjCyehIw1b71QTLyCy2zE7aG+P71fky5zurvOIpjz7J1C4QU5LVNNJxUQY3+Hx8vzntL0T1VWS4RkboH7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7654
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: UiDW5jAGKXVS4wMMe5FqN6KLTlKp8khk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE1MiBTYWx0ZWRfXwSOtEHe3GrRa
 v9A9DTLtiwhqJUJdMAVlZWiQYh/jhiDj/MdguvbU7CLpcqe6y8OT2wgebUPSZIMKUMRpd1Y5XJB
 V0XtT2JJLwN+GCaipzh4+uJV1bkPH/tu+/8+m+e5/i0KnP0lxHtbJgGxX1Q8kuMf7T2QDUPEkkA
 /BwyMT6WfhTVgS9CkJNgxAP78QHK70Q6hRft7ldeT+u+IPFCzbj23C65JwExWA08CuMWgYXOnVb
 le9DBJVYW1cW1YbUXUfX6LXJkPJTEehJ9AfbfFGyc2HBfAphyQwH8u9OBQA7EzPWOo2kD8zbIda
 tgd+opPipPbMR92FhNO8PtZWrTMId7xT1bUlReYhkz/Peyuj+9mlnSQAu/6JOc46I0zZp4WIhXQ
 8eMCkJ9kt0zF+k4wx/PYv5vFbDB9RDOa+xcQaQyD1Qvek9YjJZlVwOPh2JA7ycdh+3pa9pC2vg0
 qkHilo7SoTUtOU+kYBQ==
X-Proofpoint-ORIG-GUID: xd-YYOK-lfcb2f5BYGZhW63wE5IQUeD3
X-Authority-Analysis: v=2.4 cv=UahciaSN c=1 sm=1 tr=0 ts=69aefb2b cx=c_pps
 a=p2N+vRIgjjfURKXzpqLMRQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=1H9S5zupAAAA:8 a=1fTMbyE-6YB2nWN-jTIA:9 a=lqcHg5cX4UMA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=52mdeZd8sWgJSgSe30wA:9
 a=74SklGZWBWWmlVKL:21 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=KJqDGGnLsJCYSyNEcnDM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 16:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232730

--------------f4TZesOwfvaE8bHiuE7u08OL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 629GfOk11025889


On 3/9/2026 9:59 PM, Bruce Ashfield wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Mon, Mar 9, 2026 at 12:10=E2=80=AFPM Harish Sadineni=20
> <Harish.Sadineni@windriver.com> wrote:
>
>
>     On 3/9/2026 4:56 PM, Richard Purdie wrote:
>>     CAUTION: This email comes from a non Wind River email account!
>>     Do not click links or open attachments unless you recognize the se=
nder and know the content is safe.
>>
>>     On Wed, 2026-03-04 at 09:43 -0800, Sadineni, Harish vialists.opene=
mbedded.org  <https://urldefense.com/v3/__http://lists.openembedded.org__=
;!!AjveYdw8EvQ!cWPq0za66UhcuPm1JB9FSYJ5JMWWpL_480vZLcrK0BTZbuoPaFvjdJly1r=
2bF4S-jo8X5LrrrXkmL3xU90Zr5Er_U2VxaLk$>  wrote:
>>>     From: Harish Sadineni<Harish.Sadineni@windriver.com>  <mailto:Har=
ish.Sadineni@windriver.com>
>>>
>>>     Conditionally add 'clang-native', 'rust-native' and 'bindgen-cli-=
native' to 'DEPENDS'
>>>     when Kernel Rust Support is enabled.
>>>
>>>     These tools are required for building Rust-enabled kernels and fo=
r
>>>     generating Rust FFI bindings via bindgen during the kernel build.
>>>
>>>     This ensures the additional dependencies are only pulled in when
>>>     Rust support is explicitly enabled, avoiding unnecessary native
>>>     dependencies for non-Rust kernel builds.
>>>
>>>     Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>  <m=
ailto:Harish.Sadineni@windriver.com>
>>>     ---
>>>       meta/recipes-kernel/linux/linux-yocto.inc  <https://urldefense.=
com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!cWPq0za66UhcuPm1JB9FSYJ5J=
MWWpL_480vZLcrK0BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr5Er_ybuc9RA$> =
 | 3 +++
>>>       1 file changed, 3 insertions(+)
>>>
>>>     diff --git a/meta/recipes-kernel/linux/linux-yocto.inc  <https://=
urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!cWPq0za66UhcuP=
m1JB9FSYJ5JMWWpL_480vZLcrK0BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr5Er=
_ybuc9RA$>  b/meta/recipes-kernel/linux/linux-yocto.inc  <https://urldefe=
nse.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!cWPq0za66UhcuPm1JB9FS=
YJ5JMWWpL_480vZLcrK0BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr5Er_ybuc9R=
A$>
>>>     index 4d0a726bb6..b7961bbcdf 100644
>>>     --- a/meta/recipes-kernel/linux/linux-yocto.inc  <https://urldefe=
nse.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!cWPq0za66UhcuPm1JB9FS=
YJ5JMWWpL_480vZLcrK0BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr5Er_ybuc9R=
A$>
>>>     +++ b/meta/recipes-kernel/linux/linux-yocto.inc  <https://urldefe=
nse.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!cWPq0za66UhcuPm1JB9FS=
YJ5JMWWpL_480vZLcrK0BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr5Er_ybuc9R=
A$>
>>>     @@ -76,11 +76,14 @@ do_install:append(){
>>>       KERNEL_FEATURES:append:qemuall =3D " features/kernel-sample/ker=
nel-sample.scc"
>>>
>>>       KERNEL_DEBUG ?=3D ""
>>>     +KERNEL_RUST_SUPPORT ?=3D ""
>>>       # These used to be version specific, but are now common depende=
ncies.  New
>>>       # tools / dependencies will continue to be added in version spe=
cific recipes.
>>>       DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86", "arm64"=
, "powerpc" ], "elfutils-native", "", d)}'
>>>       DEPENDS +=3D "openssl-native util-linux-native"
>>>       DEPENDS +=3D "gmp-native libmpc-native"
>>>     +RUST_KERNEL_DEPENDS ?=3D"${@bb.utils.contains('KERNEL_RUST_SUPPO=
RT', 'True',
>>>     'clang-native rust-native bindgen-cli-native', '', d)}"  <mailto:=
$%7B@bb.utils.contains('KERNEL_RUST_SUPPORT','True','clang-nativerust-nat=
ivebindgen-cli-native','',d)%7D>
>>>     +DEPENDS +=3D "${RUST_KERNEL_DEPENDS}"
>>>
>>>       # Some options depend on CONFIG_PAHOLE_VERSION, so need to make=
 pahole-native available before do_kernel_configme
>>>       do_kernel_configme[depends] +=3D '${@bb.utils.contains("KERNEL_=
DEBUG", "True", "pahole-native:do_populate_sysroot", "", d)}'
>>     I thought we were going to try and use KERNEL_FEATURES for this?
>     Hi Richard,
>
>     I have tried this but i got circular dependency error with
>     KERNEL_FEATURES. So, I opted using variable KERNEL_RUST_SUPPORT.
>
>
> I'm curious about that. Can you share the details ? (diff and the=20
> bitbake error)

As discussed previously, I attempted to use the following in=20
meta/recipes-kernel/linux/linux-yocto_6.18.bb:

KERNEL_FEATURES:append =3D " ${@bb.utils.contains('KERNEL_FEATURES',=20
'rust-kernel', ' features/kernel-rust/kernel-rust.scc', '', d)}"

This resulted in a BitBake variable dependency chain failure. The issue=20
occurs because the expression is trying to read KERNEL_FEATURES
while simultaneously modifying KERNEL_FEATURES, which creates a circular=20
dependency.

example:
 =C2=A0The variable dependency chain for the failure is: KERNEL_FEATURES =
->=20
KERNEL_FEATURES -> KERNEL_FEATURES -> KERNEL_FEATURES...

Thanks,
Harish
>
> Bruce
>
>>     The implementation of KERNEL_RUST_SUPPORT is problematic as it onl=
y
>>     works for the value of "True", not "true", or "1" or 1 or any othe=
r
>>     thing people might dream up. "Contains" isn't really an appropriat=
e
>>     mechanism for a boolean either.
>>
>>     You can use bb.utils.to_boolean() as a way to better obtain a bool=
ean
>>     value from a random variable.
>     Understood, Earlier i took reference from the code that already
>     present in that file.
>     I have updated the code we will send v8.
>
>     Thanks,
>     Harish
>>     Cheers,
>>
>>     Richard
>>
>>
>>
>>
>>
>
>
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await=20
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
--------------f4TZesOwfvaE8bHiuE7u08OL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 629GfOk11025889

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 3/9/2026 9:59 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4P3mPN8COS=3DQeqf9Rzu3-E9=
3r4j11x9b2hX5b2etR34zg@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
          </div>
          <br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 9, 2026 at
              12:10=E2=80=AFPM Harish Sadineni &lt;<a href=3D"mailto:Hari=
sh.Sadineni@windriver.com" moz-do-not-send=3D"true" class=3D"moz-txt-link=
-freetext">Harish.Sadineni@windriver.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <div>
                <p><br>
                </p>
                <div>On 3/9/2026 4:56 PM, Richard Purdie wrote:<br>
                </div>
                <blockquote type=3D"cite">
                  <pre>CAUTION: This email comes from a non Wind River em=
ail account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Wed, 2026-03-04 at 09:43 -0800, Sadineni, Harish via <a href=3D"https:=
//urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!cWPq0=
za66UhcuPm1JB9FSYJ5JMWWpL_480vZLcrK0BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3=
xU90Zr5Er_U2VxaLk$" target=3D"_blank" moz-do-not-send=3D"true">lists.open=
embedded.org</a> wrote:
</pre>
                  <blockquote type=3D"cite">
                    <pre>From: Harish Sadineni <a href=3D"mailto:Harish.S=
adineni@windriver.com" target=3D"_blank" moz-do-not-send=3D"true">&lt;Har=
ish.Sadineni@windriver.com&gt;</a>

Conditionally add 'clang-native', 'rust-native' and 'bindgen-cli-native' =
to 'DEPENDS'
when Kernel Rust Support is enabled.

These tools are required for building Rust-enabled kernels and for
generating Rust FFI bindings via bindgen during the kernel build.

This ensures the additional dependencies are only pulled in when
Rust support is explicitly enabled, avoiding unnecessary native
dependencies for non-Rust kernel builds.

Signed-off-by: Harish Sadineni <a href=3D"mailto:Harish.Sadineni@windrive=
r.com" target=3D"_blank" moz-do-not-send=3D"true">&lt;Harish.Sadineni@win=
driver.com&gt;</a>
---
 meta/recipes-kernel/linux/<a href=3D"https://urldefense.com/v3/__http://=
linux-yocto.inc__;!!AjveYdw8EvQ!cWPq0za66UhcuPm1JB9FSYJ5JMWWpL_480vZLcrK0=
BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr5Er_ybuc9RA$" moz-do-not-send=3D=
"true">linux-yocto.inc</a> | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/<a href=3D"https://urldefense.com/=
v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ!cWPq0za66UhcuPm1JB9FSYJ5JMWWp=
L_480vZLcrK0BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr5Er_ybuc9RA$" moz-=
do-not-send=3D"true">linux-yocto.inc</a> b/meta/recipes-kernel/linux/<a h=
ref=3D"https://urldefense.com/v3/__http://linux-yocto.inc__;!!AjveYdw8EvQ=
!cWPq0za66UhcuPm1JB9FSYJ5JMWWpL_480vZLcrK0BTZbuoPaFvjdJly1r2bF4S-jo8X5Lrr=
rXkmL3xU90Zr5Er_ybuc9RA$" moz-do-not-send=3D"true">linux-yocto.inc</a>
index 4d0a726bb6..b7961bbcdf 100644
--- a/meta/recipes-kernel/linux/<a href=3D"https://urldefense.com/v3/__ht=
tp://linux-yocto.inc__;!!AjveYdw8EvQ!cWPq0za66UhcuPm1JB9FSYJ5JMWWpL_480vZ=
LcrK0BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr5Er_ybuc9RA$" moz-do-not-=
send=3D"true">linux-yocto.inc</a>
+++ b/meta/recipes-kernel/linux/<a href=3D"https://urldefense.com/v3/__ht=
tp://linux-yocto.inc__;!!AjveYdw8EvQ!cWPq0za66UhcuPm1JB9FSYJ5JMWWpL_480vZ=
LcrK0BTZbuoPaFvjdJly1r2bF4S-jo8X5LrrrXkmL3xU90Zr5Er_ybuc9RA$" moz-do-not-=
send=3D"true">linux-yocto.inc</a>
@@ -76,11 +76,14 @@ do_install:append(){
 KERNEL_FEATURES:append:qemuall =3D &quot; features/kernel-sample/kernel-=
sample.scc&quot;

 KERNEL_DEBUG ?=3D &quot;&quot;
+KERNEL_RUST_SUPPORT ?=3D &quot;&quot;
 # These used to be version specific, but are now common dependencies.  N=
ew
 # tools / dependencies will continue to be added in version specific rec=
ipes.
 DEPENDS +=3D '${@bb.utils.contains_any(&quot;ARCH&quot;, [ &quot;x86&quo=
t;, &quot;arm64&quot;, &quot;powerpc&quot; ], &quot;elfutils-native&quot;=
, &quot;&quot;, d)}'
 DEPENDS +=3D &quot;openssl-native util-linux-native&quot;
 DEPENDS +=3D &quot;gmp-native libmpc-native&quot;
+RUST_KERNEL_DEPENDS ?=3D <a href=3D"mailto:$%7B@bb.utils.contains('KERNE=
L_RUST_SUPPORT','True','clang-nativerust-nativebindgen-cli-native','',d)%=
7D" target=3D"_blank" moz-do-not-send=3D"true">&quot;${@bb.utils.contains=
('KERNEL_RUST_SUPPORT', 'True', 'clang-native rust-native bindgen-cli-nat=
ive', '', d)}&quot;</a>
+DEPENDS +=3D &quot;${RUST_KERNEL_DEPENDS}&quot;

 # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-n=
ative available before do_kernel_configme
 do_kernel_configme[depends] +=3D '${@bb.utils.contains(&quot;KERNEL_DEBU=
G&quot;, &quot;True&quot;, &quot;pahole-native:do_populate_sysroot&quot;,=
 &quot;&quot;, d)}'
</pre>
                  </blockquote>
                  <pre>I thought we were going to try and use KERNEL_FEAT=
URES for this?</pre>
                </blockquote>
                Hi Richard,<br>
                <br>
                I have tried this but i got circular dependency error
                with KERNEL_FEATURES. So, I opted using variable
                KERNEL_RUST_SUPPORT.</div>
            </blockquote>
            <div><br>
            </div>
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small">I'm
                curious about that. Can you share the details ? (diff
                and the bitbake error)<br>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    As discussed previously, I attempted to use the following in
    meta/recipes-kernel/linux/linux-yocto_6.18.bb:<br>
    <br>
    KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains('KERNEL_FEATUR=
ES',
    'rust-kernel', ' features/kernel-rust/kernel-rust.scc', '', d)}&quot;=
<br>
    <br>
    This resulted in a BitBake variable dependency chain failure. The
    issue occurs because the expression is trying to read
    KERNEL_FEATURES <br>
    while simultaneously modifying KERNEL_FEATURES, which creates a
    circular dependency.<br>
    <br>
    example:<br>
    &nbsp;The variable dependency chain for the failure is: KERNEL_FEATUR=
ES
    -&gt; KERNEL_FEATURES -&gt; KERNEL_FEATURES -&gt; KERNEL_FEATURES...<=
br>
    <br>
    Thanks,<br>
    Harish<br>
    <blockquote type=3D"cite" cite=3D"mid:CADkTA4P3mPN8COS=3DQeqf9Rzu3-E9=
3r4j11x9b2hX5b2etR34zg@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <div>
              <div class=3D"gmail_default" style=3D"font-size:small"><br>
              </div>
              <div class=3D"gmail_default" style=3D"font-size:small">Bruc=
e</div>
              <br>
            </div>
            <div>&nbsp;</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <div><span style=3D"white-space:pre-wrap"></span>
                <blockquote type=3D"cite">
                  <pre>The implementation of KERNEL_RUST_SUPPORT is probl=
ematic as it only
works for the value of &quot;True&quot;, not &quot;true&quot;, or &quot;1=
&quot; or 1 or any other
thing people might dream up. &quot;Contains&quot; isn't really an appropr=
iate
mechanism for a boolean either.

You can use bb.utils.to_boolean() as a way to better obtain a boolean
value from a random variable.</pre>
                </blockquote>
                Understood, Earlier i took reference from the code that
                already present in that file.
                <br>
                I have updated the code we will send v8.<br>
                <br>
                Thanks,<br>
                Harish<br>
                <blockquote type=3D"cite">
                  <pre>Cheers,

Richard





</pre>
                </blockquote>
              </div>
            </blockquote>
          </div>
          <div><br clear=3D"all">
          </div>
          <div><br>
          </div>
          <span class=3D"gmail_signature_prefix">-- </span><br>
          <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not fol=
low
            the NULL pointer, for chaos and madness await thee at its
            end<br>
            - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------f4TZesOwfvaE8bHiuE7u08OL--

