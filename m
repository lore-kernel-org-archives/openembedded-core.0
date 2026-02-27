Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C081FEFB4F
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 13:34:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.95895.1772199246276564143
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 05:34:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=hqw/hSza;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65188b8ccf=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R7xa7S2872362
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 05:34:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=wzikrjc9OydDrpzbfhKSdqsluAaitKkZMr1zBGWly2Y=; b=
	hqw/hSzawz5m2ufK7RprbcSzuK7mOr1Sb2IDYkBZW7EQVMnlCtx59u+JZgmyLcNC
	PK/fOg49nOajzMblWSrFurcnasSlihRSSae7mow+thJBAyPuZ3U3ZiR+V723weE7
	XfXAqRllKI5RizlW+wghzf+8muulFhdClKkDAxtMExhfkhpSTU7B82wzQEr+tFOr
	w/CfBy0HQ72McAkJRyYP3BAqcYdlHxb+a2gk9BnbyJSU0Ph8eRQhW857KKaBGe0n
	v3cGFmsn6BDKSdaHkFQ0Rvggco/CcV2u3DtOOkZEPlvk2YUZ/bbmQ6wTlv0WjVt5
	Jb928xDTXd9SJ4i8NbBh+g==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011051.outbound.protection.outlook.com [40.107.208.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdu2syhj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 05:34:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVjRR9I6+sFCu8m51MY4riHBq/1NJZ3Q6Xj6diQcgh++0R2RhjqA+mCtF1MIS8j0bheAjtESRCTeGbRr3HH//o4SX67LCLJYk1uIuBikvQolAVEi1t2zlqZ+FwNAIDZ4ZlXlUPzV1tmNC1dhh+YVyS2fKeR5/RfRlAxvnBOU3bq9WVE+0rijZjmBNtMZ0KbBwDvJ88JbmjWapj99juPpGDV1iFDMqC1ybpmv80oYer+GWlOD9UQXaIZWg6ymhesmM1qrYnD006j5Yn8ScFp7e60BRlNMMwx8JPBTr/RRJPOSOkN6XHyM28qfmpfDyS4GxRuVhx9ZjcU238lnjweVGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzikrjc9OydDrpzbfhKSdqsluAaitKkZMr1zBGWly2Y=;
 b=Oc1LW03A36pv1U7V1zOmQTQwcxVPiQMGfqD7ndHWSF7nEa7PO/+fArYBrJYiHm6ReU7pKJtmNfVoUxRCqKhFBfDVKxsSGAbL+l0rI4VwLodQ7i6d0r+LxDdygoQ2dGZoTVrdM6Di3hmc/PgkSM1r9UjcFLxgdaU/8aZA+mEsww4KtDeJfordZZznp+jIOzSZuZgyZdEYFJ+8GyRQpFzqcif1RdkdenCGFYj7uuWL3gXFWZ6HygMQrr0DCW20Jgvt04+PpV7/6JuiWhGDdlVD2PPHCbwoiZGK80m8vsWRDcDneqwbbmYmBJy697ZkoEu/QV28xM0XOlEhotnPXBD3Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MW4PR11MB6981.namprd11.prod.outlook.com (2603:10b6:303:229::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 13:34:01 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9654.015; Fri, 27 Feb 2026
 13:34:00 +0000
Message-ID: <854a8f39-4921-4b50-bcef-b46ac5d89089@windriver.com>
Date: Fri, 27 Feb 2026 19:03:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v6 09/14] selftest/cases/runtime_test: Add test
 for Linux Rust sample
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, paul@pbarker.dev, elmehdi.younes@smile.fr,
        Yoann Congal <yoann.congal@smile.fr>
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
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BL1PR13CA0272.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::7) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MW4PR11MB6981:EE_
X-MS-Office365-Filtering-Correlation-Id: 678247e3-1861-49c9-020b-08de7604dd45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	i9IM34FOMhyOuUxCy7zIbOUOsyRg5MBN6mt9VaaBPvaJcSsSOpu/1Q+IlzV6iop7tiMD/9s0S0ElVe6sNMUFLukopCvHmsLMs/fMIR3M7ueK+ZhNWdBOSGsuvn0wJv1vIVDGyE4zvxY1Ffrt2Ztvj6tEIVSmvHyCdHEudcClxmYf0SJ69UYzqDbW8RuTLfdDPes3FU9ypqZRwnjcLYbMDVPf9pYDoENJQj4TpdLumHbpFopFOkFDXGoU/I3YhoLcV8efl4wRwrQ7YN+To3GnXkLlMhCwUEosqq7UyetbrAKBUpkF9r1ps4N4xsr9OtZz3x6+woat5XmGyVZ85BF/lN/jXTbEQAg4S28PHwDrHbX2yPZ4Hcvqtc3mutaZoH44QPmrQ8atPp0g2aktYLLDAxo6G5Y+9n9bv71EzECN47MAE5gVPgpFB+LDIwfbXsUIM+fHUn8sG3cvwZS+3F1NQHfTU6IByNEapgJpWLgcOxrkZHaTfPok69x+LftiucZ/YPmFgVwXwGa77rdJNEKRIkSt+phqoHO/3fYcHKhcBvYUXg+bpFnY2zr8bWEDImU0lr5qxdkQ6OVmIk/bpRq+IkGI/JB5QDSgXklPKO2PNjX/JctBh3NyLi2yZmG77yD1/KEeKqwvsed8XrvDfJXeV/NXLHReX9c4U0ln/kjizSsIGrAW9xjudNxkDml0Xd+X1hURpLP74aIFUjcNQ6uJWluGpU5IpLgltOGqRXe9G8ikef/IRqDKSbHIlXSD2PQr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VXZNbG80Tk84eG9KdWVuOUF3bzIraFNtcmxTUUhoajhvTy9WK1hjM0FWM2No?=
 =?utf-8?B?TW1HN0VRRGhlVlhqOGE2eTh1NlZRTnY1VjNiajdSS25xL2srMmMyM3NiSUZz?=
 =?utf-8?B?My9WZWZOZVBvOUJ6bW9Ha2pDMWErSGExUDVTMEZBWU1Felo4OExacE5tOTU0?=
 =?utf-8?B?aWg5U1krWWZBZkZqR2ZnNjFBczdTeXdjalhWMzMvSit6Rk9XTEJFUURVTkxZ?=
 =?utf-8?B?NjllMEtnQmRyeklyeXRpcEVHV0c3NDVFRS9TeWhveFArYmZsdGhpVE8vQys3?=
 =?utf-8?B?SjlnS1pTSjYycVZFSzVYWCtLT2h1MXpQK3BGTEpyTTZQSVlITHBiaWJIYVM0?=
 =?utf-8?B?NnBSS1hLeTlUVEw5cXhyemc4bVZYWjRxcFhzKzdpOXBtcWhXZzJaakpiRDVR?=
 =?utf-8?B?MGtPQlNLN2c4b2Z0akg2SWJXT1ptMEVJTklDbGplbzdSeklPVVdYNFNHOVdo?=
 =?utf-8?B?ek1TaEhSVStPVVhOTVhTZmJxNVc5S0VDcU1Ib0xsNTlvaC81NncvcXVMMGVh?=
 =?utf-8?B?aUJEdkJ3SjBzaGZCeTVURkl5WWcyZzlUSmNBVUhkL050TkVrOTdaaVNZK012?=
 =?utf-8?B?N3Z3S3oxZE1TQ2tzcmlsVmMrOWZLNkEvRUxrRzdXUDl2Rm1YWFpHYzI2Vk83?=
 =?utf-8?B?d0dycDdVUmYvNHRuMGhLR3JaM0ozdHY5N3BsVHF6MERwT2JLZ3hENWJWbGFY?=
 =?utf-8?B?M3FSSmhQdmtUdS9LT29KdHNXQU5LYUxyNmVTUjhaQnNaN1A2K3d2clF0QnVj?=
 =?utf-8?B?Q0VuTnJuZ2U5UkpEK2tMY1BFWjJUdE1YNlhrWFZvSDgvS1Uzbm1HeXpBSFVW?=
 =?utf-8?B?dUxKRzBMb3ZzUFdOZkdCZmZjbDFONG1FY2NoS2NYVFU3RTlnSzVSM2d2VzVy?=
 =?utf-8?B?S29zOGxpSDlTNkNWVlNxc1lhU0hWYXdnZHRyVWx0Q2xUWEJQTXJFVFVhWHc5?=
 =?utf-8?B?Q1hsWnpMMFFta3FMcTdzZnlPSGIwbURCVU13dWNPVWtEMTNLTkR0MVhidmhY?=
 =?utf-8?B?UjVjR0VpeklJak0vbkh0dDNpOGxjUmdRVkFQZ1JuUXlFc0luR29qbzRWamNF?=
 =?utf-8?B?QnhITTJQVDFkQUE5MkZHeGkxN0xabm1TbytrRjRqN1FMVXNJR2RLdWFnUVEx?=
 =?utf-8?B?ckFnOHJObWpCdkNKV3pXRE5TZ2l4dENIZDlGNTVQbTBDNmNTam1Md01VZy9k?=
 =?utf-8?B?alJZQ0RnbWs3MmFrRXNlRXFOZ2ZxaHJ0ZSt5ZWt3M2xjRENUdG96VEtaVTNj?=
 =?utf-8?B?UHpUMTlnY3NoUDVUb2d6ZmhERmV3VGFiWFRIWmhNWnRuR3ZZUWRKRmRzTVc4?=
 =?utf-8?B?VzR6Wnp0K3VHenNNSWtWaHZ1WDloVENiV3YzTWRCWXJ2WmhEbFphUXFiVGkv?=
 =?utf-8?B?em1lam84RXN0NjRJSHRQbGFQa1FOQVY4bHRhU3NaR1FBKzc1eHR4eXJzTlRm?=
 =?utf-8?B?SmYxU0Y4a2dOUlZZd0pmSkhrRTNkeTQwUGNFSituTWxOay9GYVlrMEMvZjVx?=
 =?utf-8?B?bEJsemsvQnlUeWU1T2VhQmRYNGZHeWorZEpxQ2V6K1hLcE5MT3pMY3ZuUEtB?=
 =?utf-8?B?bDBoT2ZPY1JxWU9ZUG5mM0Z6MzNpOGQ1cDM3ZHJ2anN1WjNBVmM0Z1lTMU9W?=
 =?utf-8?B?YlJRS2hWbnZqVnJiWjlndlVva1ROTEdPODJ4K1JsbUo1MmZwT2VheHVvbmlS?=
 =?utf-8?B?MmxTcmdjd09KcnRtVjBjSEUvZ1dsZjQyOEFlemZRejR5WUhLNTl3ZEhPcDM5?=
 =?utf-8?B?NTZGUm5aL1A3T1BiVWhOa01sSFlLbWdwNTZQeVprTzl2NytrSXc0cUhDbGhS?=
 =?utf-8?B?akI5aVpraDNxakkwelNwU1BNTEdHUnlmemlTeHZPTjQ2WTFCTUtuQ0U1ZExO?=
 =?utf-8?B?azNsVklOUkJLWlpQK25TTGdHOEdJQjV5R2NRMkhHM0dKSEVLSDh0MGdwM2gy?=
 =?utf-8?B?TDJoVVBlYWcyb0JnMVpiRCtDMENMUkJvdU1mYnp4QjNhUzBlZS9xbTZJTG1H?=
 =?utf-8?B?OTJxdXFIWE1GN21RdmZ1bWhxajNLc1FVWXFkSHZvVFE2Z1VhYXdPLzkxL3JK?=
 =?utf-8?B?WWZUbk40Z0tiRTBkd0dqZXBxY1ZIYU1qR0k3ZFI1MGJjbk9iQ2RmWklFKzVO?=
 =?utf-8?B?WCtpZmlGUnRLQVFhZ0F5c0UvZzNSZmhrYjEwaWxXZkwySXZCOUx3QUtOd29L?=
 =?utf-8?B?VlkvUDdMbDhnYXA0cmd2R1RGK2QrMTFaTDQvLzE3TmNpU3ZOUHhJZVpoL3VL?=
 =?utf-8?B?amM5NWRYL2kzc29jSnB5MFA3eDVjdlZQSUg4a095UW84RmkrSVZQdGdCV2xL?=
 =?utf-8?B?TlFYMTJmUjkzdC9sUXF3VXdicVdOVEtPSmZGZXdOWkN6ZjZ1ajZFOEpSV1Mv?=
 =?utf-8?Q?OT9Ojy+2P998Qf3Y=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 678247e3-1861-49c9-020b-08de7604dd45
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 13:34:00.0168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N9YzLabYAut4r6W98szlV5HiNRhRQj4GwCqzcxGbi/PhQv1tFmVd3T1/wdOabmLnRnBRdqxKeyxVDd99LurIxmqirwkD3oweO1aPH2RSJ9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6981
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEyMCBTYWx0ZWRfXzjIgsKA7QWek
 /NtU9ArzV7GYt9GrkM3/BDYIkq5yMa9h2KS1Ng/OpozMjQWyVL9KV5y41g8H9lk580rm7u7AjVv
 tmLrFC8slyKvDUrdjAJT/c+lNlyFJfLe0nMfo7VQTwe4nWIHPQBKF0hoKL0j5AYLYLSBvTkH9f9
 WRT7GSm4J18A7kPAzdxJPEu417uh2odPuxZQKS84hc5VOg26qstOCqH8jMPjSrKCXvV+mGSD4MN
 wV96kSrJrrDrjnxttdmf3r4z2q0J635uf86jnU4zqpe71Trx9FVQEhfdAHZKWT/PJi7eJ7zrsDG
 T9+HnMmq+YHRyBCx8HMTfT7fl28GaSn2MJ499x/AR0jwLogaACoGtyP935axjOOXMa1Xg7D1Gh9
 rncp9D8sFCHyedDppIuvKGXwoJMOj0fdSpiqVre81XvwwD7OvDygsjNPP9M5RNxdJfdmJDxzK/c
 FyrcToOSdWPBWmoUGlg==
X-Authority-Analysis: v=2.4 cv=WpMm8Nfv c=1 sm=1 tr=0 ts=69a19d4d cx=c_pps
 a=4ayr6ClP8xx6lw6zA/3NoQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=ZhAAFwQyoLSLilFf24wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: kSTYDq2tQQMJRjj_3UDsYhr7nJr-bFCK
X-Proofpoint-GUID: DqiAhSENuO88Xqz5AVoaEcxXtptx6N_0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270120
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61R7xa7S2872362
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 13:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232098


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
>
> I backed up the build folder, it should stay there until next Monday.
> (/srv/pokybuild/yocto-worker/oe-selftest-armhost-3346-mathieu-2026-02-1=
7
> on ubuntu2404-vk-arm1)

Hi Mathieu,

I reviewed the build logs and observed that the generated rootfs does=20
not contain the lib/modules directory,
which should normally be created when kernel modules are installed into=20
the image.
Unfortunately, I was not able to find sufficient information in the logs=20
to explain why this is happening.

I attempted to reproduce the issue multiple times locally on an ARM host=20
and x86_64 host, but i am not able to reproduce the failure.

So far this intermittent failure seen only on arm host. So, we are=20
planning to run a few more tests on ab with some debug info added to the=20
test case.
If the issue still cannot be reproduced, we will temporarily skip this=20
test on arm64 for this release.

Will keep you posted by beginning of next week.

Thanks,
Harish

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

