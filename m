Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC8BC61CE8
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 12:57:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.32715.1749214216264674584
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 05:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8252756182=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556Aa4qn011616
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Jun 2025 12:50:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9q5a20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 12:50:15 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 556Cjiil009416
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Jun 2025 12:50:14 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9q5a1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 12:50:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8KcDs6LpDVsAgOOfUmqcYEN+6Lwo4ZtGrwjZQi3EF8jE1wwSL2MnW3MVXokiyc9Kol6P4ug1t2ZRFuxngNK29TTvi7vWB7NRT9Pqs/4Vy2nlFyS18nm8d8LvUFHu0YNwo+7Wzww9A9KONLziZUPevLIQJvkLqJ2bGdYdgQq0TJa6LLzxFQUXjvbwbGLDvvxtYoanE0dKGe30qdya/gfiZWq+SJKChK83n7hcpmzddUO9DJGajajX5ZNWN1h6/z8ACNKXb5qk/84j3b1d1LkoNUSU1JonMXy9Aa6YbBIRECJbHMnEpaJzwkZmrwzdcZo43vXo41aNfRys4LRnNgqxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVkRk+vrxJWF8fhyQVEma8Rd2ncM1qudvRQzbP/vh2U=;
 b=hXXFJGWMN1gx+Tt4afiJ4hlLTGUjcMhuYOESIUeg5oeyftXsXCWhkEybwERewtx/uAAofFWvQ2zxP4Z6HTZU5lHpSA0pTHbGyPVxkZgkZRTSzldwDj/EXJn2kcxATINuTUojY/CFVRLzLyyMqxo3dShYRUL1zBAs5GNAct4GurrpCQt4avrZc9owikwVKYlwFzQGQWHzJhHmJCRXyI+jTy+1k58LHNtsVycPtM3WzLlCBNqpEco0QGKQ+xkJrJTBsRGUuhJwE7IhBnCmDjGSjKnZZB/vETGkoUStdc2b0vTDZ3Z8llfqtXEsPiGiKIxc/fBKyifRpCSVAyh4LQhSrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by DS4PPF691668CDD.namprd11.prod.outlook.com (2603:10b6:f:fc02::2a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.39; Fri, 6 Jun
 2025 12:50:11 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%6]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 12:50:11 +0000
Message-ID: <aef59cd9-51f8-4d6e-a43b-39b3514ee4a6@windriver.com>
Date: Fri, 06 Jun 2025 05:57:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC] rust: Upgrade 1.85.1->1.86.0
To: Randy MacLeod <randy.macleod@windriver.com>,
        Khem Raj
 <raj.khem@gmail.com>, Randy MacLeod <rwmacleod@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
References: <83e0d268-ec47-4f3a-bf05-2aee4e58e749@windriver.com>
 <CANNYZj-BmEXJVc1rdVPGu5wz87AW1RvbX+WhgicAfEby7kjUhw@mail.gmail.com>
 <47ba1f68-f67b-4c58-b788-63e06fdf4816@windriver.com>
 <CANNYZj-JtVtjk2e+Z=OmVF8RaygO5M1e+6tbQuTZYotbYetQrg@mail.gmail.com>
 <7571c07b-2225-4449-8169-08b044208072@gmail.com>
 <afaa4102-c876-437a-871d-f6f90697d5f4@windriver.com>
 <CANNYZj-Pa_jhraEz7qAHoDXLxfg-7ztH4UhdRPXirw6biZGWEA@mail.gmail.com>
 <36532bcc-c9dd-430a-a932-ec81e9270f19@windriver.com>
 <CAK6=ix4WrPGEbsfRwEsZz56BJP61OnkjqO8xvcB9BYoNJ2A6RQ@mail.gmail.com>
 <CAMKF1spgaYyyYOs633Lr_0EMq=vmixOXLDa4Q2ivb9PJy0BY8A@mail.gmail.com>
 <105472d8-aa33-4894-b23f-0a4be90367c1@windriver.com>
From: "Yash Shinde" <Yash.Shinde@windriver.com>
In-Reply-To: <105472d8-aa33-4894-b23f-0a4be90367c1@windriver.com>
X-ClientProxiedBy: MN0PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:208:52d::9) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|DS4PPF691668CDD:EE_
X-MS-Office365-Filtering-Correlation-Id: ca385989-a9cb-452f-8783-08dda4f8acc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VVFDK3ZPbXl5ZWJRcExObEZxTEEwZjRNR25PRjBUR3A3c1FXUXJhdFFFTmRv?=
 =?utf-8?B?d29JdENoNmpUV2Jjckw5eVpKeitUWHRzK25sUjFtRzNTM2JOU2FoS0RSMGo4?=
 =?utf-8?B?UmsybmVlRzVYK2psQ0VVOFJjWFJDZ2dqWGx2T3pTY1pVbS9ZMzFUdnNlZjdr?=
 =?utf-8?B?eXNIS0lsd3JqUU52KzlvT1dKZnk2Nm9nSk82bmljTlkvcnA1YXNVK2V6aVZ5?=
 =?utf-8?B?TG1scmMwT0RGZnZqaDczMVMyMXkzQkVPdXd1SFNlbGIycWpJWGZuNjgvdDN6?=
 =?utf-8?B?V0ZJUHFRbmVVRURGVWZxTkUwdUFDNXZDQksyTXJxUWV2cHMvN3VBSG1sZFZZ?=
 =?utf-8?B?NHhXMklETmROaXRXVzdrOEVsdVlhQ1JoZ0x4VUhRLzZ0NElCRms1U0RuR0cy?=
 =?utf-8?B?NkJsVFZoYWVOT2Y1MXBORktnbUlZM0svL2IvNUN6c2RtM1EyazcyY3IyUTNv?=
 =?utf-8?B?Zys5cGNucUtvR3BQSkpTQVdTWEYvVng3bmRZczZGcFFpKy9SR1FjeWtDYkpi?=
 =?utf-8?B?bUNyUWNoMVIxTzVQVnovaU11MjBwMktHbmRHNlZqTGhUMzlVTlBXM0dDQ3d6?=
 =?utf-8?B?NkpKWHY5UjNHZTl5em83SXhieUc2QU84cjRWRW9uMnNjUTI5SmV0ekVaZWhW?=
 =?utf-8?B?bUF5c3ZzNUVQR1NLWXd4cTBzWDVsTTlRYjhZMUd5V0Zkc1NWNXdsY0s4RnJZ?=
 =?utf-8?B?bW4xSTFlSGg0aXloL29UdXgxbHdobE8wdVFSMUcyWVhLYWx4U0t6S2Yxd1Zq?=
 =?utf-8?B?UkR0ZEJhZ1dQeTBmWmUwVTRJQVlNV010NVl6S3JQVDFFOWlpRHVPeGQ2V0tv?=
 =?utf-8?B?Y052QU96Qm5VY3NESzluSDRzUGxTSThTdytMMjdqR29EbEswMFA1aEpVeGZm?=
 =?utf-8?B?eUNlbEVuZDJ3K1pTZEhvQVdicnN5OWJkZGhyeWZpQk0wSFRiQjVDV0NNSGFy?=
 =?utf-8?B?QW93NjBLWnQrcGF3NzRMeDVlc05LdElqN3IwWDNsRXh5S1BGanZ3a0RDRzE1?=
 =?utf-8?B?VmdGRDIrcDV1VVc2ZEhSaVQ5Z2VBT3BHeDVaTUZ2QndDbjZMejllaW1MVXFV?=
 =?utf-8?B?dzkwNnJyOU1LeGc0RTZZOWkzeHRxWFYzeFZwei95UkRXN0grM3B5SFBYTUtL?=
 =?utf-8?B?NW04dE1IV1dZWUxHQTdGVkI3c0FMWDhKY3J2N29wak5OZGhrcTBsdzFhOUZQ?=
 =?utf-8?B?alJ3SUFPSGU5cDNhN0pub1ZZWXNRa0hRVlNZYmxDZEZkOGhJemhLZzhLYUNH?=
 =?utf-8?B?eXdnK0lTaWQwYXJWRWJEcncxQUt0ME9KajJNUkhBK0FtWHllQVNXYkdBNlFr?=
 =?utf-8?B?QjFCS0pENjJaT3lhUDFscEJTeHpFcDMxUU51ZHhwUSt5SjVuQ01vRmJjQXdQ?=
 =?utf-8?B?WHNrR29MSFViZVB5ZmxOZzhIeTJ3czIrNnJIRzVpQ2JheVV3eENsVGtYZUVw?=
 =?utf-8?B?ZkVjbDlib2FoWnBTYXRZMHFFSnljZVdHbVhaUHVJWFJVajluTFdKS1h5R1VP?=
 =?utf-8?B?b28vOFQzbi9BMlYzbGczTDlOYStmcDFSTVlxdWc4OW1KMUVYM1pKWVpsS2J3?=
 =?utf-8?B?MXg5cnhWR2d6ZWlUSmRsYXZZWUhha2V3eVdvM2htVERtSGZmMlozSWI4bW5v?=
 =?utf-8?B?UHp0NlJGMEJERmRYSTVPTnJwVzNJV1dyZUo4eDZYbzdxWmUrZ2tQTXF0SWVC?=
 =?utf-8?B?ellTV3czU3V4cVVhTytpcHYzL28rZEFyUHBCeHFmS3JWNWsxSXBZdTRNOUpD?=
 =?utf-8?B?NmxZVzlPNWxIQjdGMTM3UmZYaVBxR05hREFLSmJSelNkQW10b0dyajBWemNW?=
 =?utf-8?Q?vhWsTOHBmtatVdJjPljlCtL9ccto8toP4W5RU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TGhhcm8vNDBuL0ZuQjMwZjQ4a0pwbllkVG5rK3E5QTVaU3kvR0lZL3A4eU5C?=
 =?utf-8?B?aVM5MVViM0dydktvMjFlV1dtd3hLSjlMdWFyc0Q5QzJpajdSeXhnRnRJTGJ0?=
 =?utf-8?B?eE1Mb1ZZTjdpUy82eGRERVVOaTA1NUkvaW5uNSt0S0hHSTB3UEtTeGlWNG5o?=
 =?utf-8?B?bm5oclh2ZjJMeXRZNXhENE1nbnN3YWJrVjlTWEhDYmJERTNTSXp1NksxY3NR?=
 =?utf-8?B?Qmk2M3lYZTBjWnZNcXdHWVl3a2ltN0lmUmpoeDlLOEhkR3dJbGxkdWZMcHhz?=
 =?utf-8?B?YytYd3RCOEtGS2x5OFp1Y2JqRkxwbVk2YXBLRU5WUCtJL09HS0toRzY3aUMr?=
 =?utf-8?B?SmFldzdESGhONmd5dmVzN2J1RFJoMC9FM3ZrYUhQNktrQ1JuekVQOWdvYXc2?=
 =?utf-8?B?S25oYWF4ek11cGVMOWs3ZHVseUdHSGpuS0lMMjBydXArQ1AwL1YxY1dHOXM2?=
 =?utf-8?B?a0t0T2hJTXA5a21UREVJdjFETmRoNmdXSC9iRHJvQmNKb1h2Rm1WeW5PenBU?=
 =?utf-8?B?U0hmSGdZd1plOEVCWXlKZEtuTzlvWnlKUzhXTm1RY0duVVVCRzBpNEJFeUN2?=
 =?utf-8?B?bmRsWlE2aVBvNk1aSXFGRWZwb0hmNEJ1bFVnaVV5ZnBQNWdTR3V5VjNyVTNh?=
 =?utf-8?B?YktlTU9KRktISmd3S2UyV25BOCtsclRvL0xadWNxZC85WVZGREtyVldKYmg5?=
 =?utf-8?B?MGZWbEhGT3NvMFg2aUh0UmFzcSs5VlZpQzZTOEI1cGxodTlNRmhsMXBHYmhE?=
 =?utf-8?B?YXRYSW9TOHd5bjJIT2s5TFR6MlJwNzRXS3h3emRkOUNSSlpKeFluT0tnN2JM?=
 =?utf-8?B?SHJ1YllNY24yNUdtU2ppcll2bXBwbUIxaUQ5RW11alIxWkhsTWJWUHhzL0E5?=
 =?utf-8?B?U2NUOFdoVWYwTHQzTHcvWnJadXkrd0ZqWS8yZGJYYm9BeWRValFZKzVCTkZr?=
 =?utf-8?B?aTIyOUNaczZFaW4zS0ZFOFl0bUUveXhDOVltRFJ4VjZ2S3I1dGcrQzNEMFBQ?=
 =?utf-8?B?WUI5My81Y3pLVmIzejZsWGR6Z21KK09GVFlXTnVHKzVkd0EraUw4YUhLREdN?=
 =?utf-8?B?TGo5WlVNc3JIcU0vVEoyanhoVThzOU9sbEZlQTF0SkdSVW5JSFdhakJMN3B1?=
 =?utf-8?B?UjZYM1JZVmM1b0JaZlg0bkw5OUxvY0pHQXlaT3U4UDA4SldocmRFVFhnTnlk?=
 =?utf-8?B?MlRWN0pkZXl0TWtRK3hieWV0Vm9YV0lCVUVKQzN6S3hsejNzZDlZZ09DMVV3?=
 =?utf-8?B?RFo3cWJldy9IRHFSSitDYUROZDRBbzkrZjdJaUpUbDFCVi93V0lrRG43UG03?=
 =?utf-8?B?MDlRd1hvUUlieEtXMXl3UjJSSk1Nei9mVFdiMEdodnNISWhyQ3RleDRGbmxE?=
 =?utf-8?B?anNEdG1FV0I0WUNad2JzS1NsZnozSlJZRmRXckQ1dURLQUhvK0pIeVBWMWtH?=
 =?utf-8?B?dTlMZEt6UlNPbkxjWG5CUTc2REFqZXB6c1RuRmxKakI4VDZLUzN0akk1amha?=
 =?utf-8?B?QzM3NU5mbysrSWJrOFl4amtzc0pGcGFDRmVkaG1oOXVpOEx0aVErRmZHTkVu?=
 =?utf-8?B?UURDcVJQaHdBTTZEQ1g0bDFxWjlxNTgvUkpKUkkrTjdHNnB1aitxSmhOOFVt?=
 =?utf-8?B?RkRhcHRNV3JaYWtFcEJrajhkTmRvY2FiM1pxTWRnRE1iQVl0Q2lnUUI2RStL?=
 =?utf-8?B?QUh6TlViQ3cwSGhtVlpaYnFLd0djZTRzQldqQmtNMFNxaHQvSnZ6dFBjNC9l?=
 =?utf-8?B?ZjFQTlpicENnTWdIR0xSNjdTK2U3TnNaMTBvNWwzTUwzZUNoRnBjWUh3V2Q2?=
 =?utf-8?B?bXFOMmszTlBOcmRTc05qczdoMnhKUFdCcHFnTytLY1g2NHVSOFRBOHJISWJm?=
 =?utf-8?B?TUNNeDJQM0NLK3czZFlOQ0xKZHY3dk1Sb3p2YTcwQ2RBamkrQ2tPSEVXRUQ4?=
 =?utf-8?B?L1dPTE84L2laY09zTTZnQ3Z1NkxSTmJycStPa2k1UFA3TG41M1Zja05rM1Ni?=
 =?utf-8?B?eTBYQ2VrS0lMRVNET1lzVzdFMituMmRiK0Y0dGgxVDN0ZDJyOE1LdkVKWGZZ?=
 =?utf-8?B?YXBmWk1hN0cvUFUxWVhoYTRYZTh1c0RXYmdKMmlRcmJxZmxPZkxVZEdGOHZB?=
 =?utf-8?B?YlpFWmVKZnN0VlVyaURvMFNOT2laRkZIQUk1NHhjaEpudldIc01EWUpXdGMy?=
 =?utf-8?B?L0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca385989-a9cb-452f-8783-08dda4f8acc7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 12:50:11.6110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0Fin5Y8Q2uW6anpWqCMHNmQ64jEact/iNOy+wUWaIB/H+vHtNvttIM+SGjqPldC2gUZo15twTOJ4Lxjdhld7lwRRN6b/F4vreOK0F4fExs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF691668CDD
X-Proofpoint-GUID: FRLAIPAOjamKs-Ff0CoQ60Kh8gZmWC4H
X-Authority-Analysis: v=2.4 cv=X8RSKHTe c=1 sm=1 tr=0 ts=6842e407 cx=c_pps a=ik8UMrPuXLsbptq6o2EzMw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=Duxp80g_E9-18oXrvwoA:9 a=QEXdDO2ut3YA:10 a=nUKBEAeqg7myOELsCX4A:9 a=lWcXMkK1tcHqL8eI:21 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDExNiBTYWx0ZWRfXxCgnrD8n+bNh UnFe41k9YSlWiIwiCllrAieQUsbiiJgHLawJncgxk5RapoXBtdt3zMrzq7YRraTAjtXQXp2sQgS Gk/k0MFqtFBPTAMfMEhAqeRWLhoH5iyVbats3HgkGY4n3Y0HQZI6rIKzpPbsn9PhnPbOCR1MKTR
 BRDndzDjSN5jae228ul6HRIldALIjHkfvHlCmDaZPMBkMQ7Cy9eotwuSd1ot6Y1iJqedxNmz3Xv OnPwbs/dna5wUYQCIKYZ5Su7fbqrEQoGz/yHxeKzE1/DpoQikfKHpXjYZWYxzCfq5bDnn8lu45O +2z2ouWl+zlKgBiszNePrNIbNcbn/CkFqPqeZhnTX4eiXJ1EKJcKRkEbrf0jMim1/wW6XN3I76y
 HpeJD2cdYfn4VpNbZwERpc0S9cy/OhF2bDXREDvF8gFDhy/ScJSiymTrgp1LqC67rmwmtDMA
X-Proofpoint-ORIG-GUID: _zyloY34PpsEGX2eA9mt7RtwzaROYbBB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxlogscore=656 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060116
X-Old-Date: Fri, 6 Jun 2025 18:20:03 +0530
Content-Type: multipart/alternative;
 boundary="------------6030tESbMcEF0hLL8zRWUQo6"
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 12:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218137
Message-ID: <20250606125741.LR_VWyaNylMCefOzk6fHg9sLUZ-RmEc2GI7itcsv4FI@z>

--------------6030tESbMcEF0hLL8zRWUQo6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

I cleaned the previously built sources and re-triggered the rust builds.
The earlier data was based on testing with the older builds.
After cleaning and re-building, the build time and FS usage are now compara=
ble
to rust v1.85.1.

Here is the new data:

rust version Build time(rust-native) Build time (rust target) FS usage
(build/tmp/work/core2-64-poky-linux/rust/1.86.0/rustc-1.86.0-src/build) v 1=
.85.1 20 mins 33 mins 6.3 G v 1.86 25 mins 35 mins 6.6 G

I have sent the rust v1.86.0 upgrade here:
https://lists.openembedded.org/g/openembedded-core/message/218138

Regards,
Yash

--------------6030tESbMcEF0hLL8zRWUQo6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div>Hi,<br /><br />I cleaned the previously built sources and re-triggered=
 the rust builds.<br />The earlier data was based on testing with the older=
 builds.<br />After cleaning and re-building, the build time and FS usage a=
re now comparable <br />to rust v1.85.1.<br /><br />Here is the new data:<b=
r /><br /></div>
<table width=3D"1089">
<tbody>
<tr>
<td valign=3D"top">rust version</td>
<td valign=3D"top">Build time(rust-native)</td>
<td valign=3D"top">Build time (rust target)</td>
<td valign=3D"top">FS usage <br />(build/tmp/work/core2-64-poky-linux/rust/=
1.86.0/rustc-1.86.0-src/build)</td>
</tr>
<tr>
<td valign=3D"top">v 1.85.1</td>
<td valign=3D"top">20 mins</td>
<td valign=3D"top">33 mins</td>
<td valign=3D"top">6.3 G</td>
</tr>
<tr>
<td valign=3D"top">v 1.86</td>
<td valign=3D"top">25 mins</td>
<td valign=3D"top">35 mins</td>
<td valign=3D"top">6.6 G</td>
</tr>
</tbody>
</table>
<div><br />I have sent the rust v1.86.0 upgrade here:<br /><a href=3D"https=
://lists.openembedded.org/g/openembedded-core/message/218138" target=3D"_bl=
ank" rel=3D"noopener">https://lists.openembedded.org/g/openembedded-core/me=
ssage/218138</a>&nbsp;<br /><br /><br />Regards,<br />Yash</div>

--------------6030tESbMcEF0hLL8zRWUQo6--

