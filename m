Return-Path: <Quan.Sun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8ECCCD5BB1
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 19:20:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4054.1779823199174542796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 12:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Om+H/9Fb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9606e6094f=quan.sun@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QG7snQ1027712
	for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 12:19:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=+ybz5PNf3kovfuD9Oikz
	/k0aCff9nU2kzTUEEYyTfNc=; b=Om+H/9FbgPyDOBaaNMGKZsTNb+q6o10iaGJk
	bwhIuREfyMrzpVaogvouMlKGAcybEhV2+ougX/SvvL9/2Z5AqvhQkZZdUSwU6GIX
	cgpe4bZdrJ9V/ijQE9aHL+JKTSb7n7m0PzXdQWDxoHGZhuY5F0C/ZJfgc4b1K4tZ
	TTIAoP4mLGwe3eUkL/uoyRDkVWszg1pELXaLhud2alZQ6bq81lTgA/nW+FzDUeDU
	hjLlUgvdR+PNo4zmTtinCz9FY8+RzFzxz0nDEisMhZe2/AtLGhPs9KI1x8FNj5yp
	n+fY43FxDDE4fFHii/PDsLpsrVWR/PyOLJcC5Pcoz1vi+nYJIg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010035.outbound.protection.outlook.com [52.101.201.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ebbrem53h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 12:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=De7g2IN17fLM9jOWQ9CsR7yTvubDcYCACnV8/aafGyCfPTzyBkLDETBfS12160jWjGptpzliWUwkLPSOf9DJt5UjgcXT3hwdKcihEbNZUY3SXEUpKllurfqiPyu+iNfZqNHSdZvjOni65sIEdC1sVFA3gFcAXGYm8bgd8V6+Lnp6c0riGEaDo5MadUYJhekjOC4SuI93pA5yxOlfK+2V9s84RuJ0/b/GUHE6uGuIUC7AggCUANqM7gkTp8KOgjy07xnQCzmJbGqxJjI+LKbWDv2Jp42rr8MlWh7S6fj8yA2eIkrACyNLbsDSCFHh9c//EbBMDtAl+ORiHEo9urtyrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ybz5PNf3kovfuD9Oikz/k0aCff9nU2kzTUEEYyTfNc=;
 b=EM/3ROtSS+0zG/Lo7p8c8ntNE6Tjo99/788aU3Y/TvEq2Asj/ttvhDaPyWwCwPXwpesghplR6KqsJf4xXHP4T8bEzJCzg4vPKp0tUcuuM38JZ463YuETNvffMEUG7lOj1JqtpXCgjl5yOXfIGdR+olDx0onJYaF9I8RbhBtLOzkw6os7EG7lB+a0M3cF5rQwddc+Iog4qzXCIKqlePwrNaoIjyTXZ3lIibxnTuM5W0B/1hRudPgDO2hkZFziQPu6vYY3Be5fMi1aIUH8wzGmIp7Kugy6HM2Vrcvx6AQVuEr8RJ7gqF9bZvaFXGq+K5F9kxABcNuegbQ8Y/DJw7XizA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 by SA1PR11MB8253.namprd11.prod.outlook.com (2603:10b6:806:250::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 19:19:54 +0000
Received: from IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8]) by IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8%3]) with mapi id 15.21.0048.016; Tue, 26 May 2026
 19:19:54 +0000
From: Quan.Sun@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
Date: Tue, 26 May 2026 12:19:05 -0700
Message-ID: <20260526191937.3144814-1-Quan.Sun@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR13CA0119.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::34) To IA0PR11MB7283.namprd11.prod.outlook.com
 (2603:10b6:208:439::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7283:EE_|SA1PR11MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: baf87d2a-2427-471d-929c-08debb5bc419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|6133799003|38350700014|11063799006|5023799004|29003799003|3023799007|56012099006|18002099003|25016099003|12006099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	VgazHy2hIHt3AEYF7j0JtkQ4ZeMMWHQiEgE9pKVLZJoA9gsyMHCdK5xJtrCuINd//J8y6dLlg9YJr5NVISXS1aN6+h7h+Mz53yNxnZ4adBhUqByN81s8YHPQTVJskdPcV/gCLD1m1IWyYhQFMJ7ICawkBoIkfJc5WFhDa5f68EQlyrqNP4NTpwz7DCXtxGW4IN95zLKKtMbXeYuLIqLx6OfcDc/doyHKBTcw3qG64UrCvTsGjCm5ok8NX/toNqBWZESXGuU0Vbd7EZNcNDUfRXRDUsEtOD9yJYFkO42wxBoI7ws2CcK9MauswfiBCabBnSq3LvnaO97xYbg5BQVEFgTBmA1dwN1Eyi5O0KmCJPR5ranZuHzmMdT+9xCwMuEzIcc8qgdYO9ECJO2vmJXhBmuSIBS/ItCAGDIXaSUSk5NBsoFyKJYLMdeiKKXhACXjUhmo5nwufnYLmhB2yB5YwYmCeh3rhjj1Xkfz6kico/xfY7Yfz+ikvU1lj8MkarfgkGcrRYQ60A7+qYlrYcWqvGV19ggUBHflyyrhC0QpcUfGs4WuCmoJ1gXrq9w7mCCPzsSwPMAG0FdffzfyCnCvo+JxIScUZhqYMOdPf6Wb90fvQfdvSVpcYPUeQkH1hAwXss4xX01zlZgy80KWQBiQ+i/av1R3OjwceqT8nfxNosDEoKu43r1RWUYYmY0dnqxD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(6133799003)(38350700014)(11063799006)(5023799004)(29003799003)(3023799007)(56012099006)(18002099003)(25016099003)(12006099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R0o2bGlNS0lVOUtZaWZHVTROMTJPOVkvaEY2UnV4NTkvYWxhRFJCWjRhdGNQ?=
 =?utf-8?B?RjdmWldXQ1JNVTZCVGsxVnl4R0tuM0ZpMEtTem1qNmVncktiY0FtR1c4S09s?=
 =?utf-8?B?cnNnOVR4UkVJQzVtc1lxQWIrNXhHWmgyc3JvYUovQmU5a0JUci83QmxCUTgz?=
 =?utf-8?B?TEJpWDk4WTl4Y2I4WUFVaFBFUWI2WDVtR2YxR2FoT0NmQXB0L2tDZ2FZOUI2?=
 =?utf-8?B?NVVFb3VwMWJUcmcxRG1DQXNYMDVDemRyR29YYys1M3lEUFF6ektJaXFCL1Rm?=
 =?utf-8?B?MWpKNHQzRmkyU2cxK0VjbllQUlpVNEJtRFBTR1Uzc0RtNFlZWmViT2hOQUxj?=
 =?utf-8?B?dVExNjgzdWxnZHNtdHZRSDdLbE1DdW5pdGl1b3ArM1pjN3ppK3hwSGoraGp6?=
 =?utf-8?B?ZUVERkxNcVB3TmRxNDArTGNiOGthMmQrTkFJVlZuNmI1N0NCcHBNZk5MWXpI?=
 =?utf-8?B?aVN4QlVGWjBRcFV6M1kyZEl6MTlFR0RhNjVkSjk0WU9SMlRuSG8waGNCNjNp?=
 =?utf-8?B?U2oyZ0haLzVlV2VDWnpFVi9QQlhGRFJERVdpL0NjRUQ2dis1ZmNvbHZqbmNG?=
 =?utf-8?B?ak1YbWNJcSt2NXhkOXo2Q29adldGSm5sNCtOQVF4S0JmNG1GMmZKSFM2MVo0?=
 =?utf-8?B?L2I0ZG5IRTd5NG9rZDkrbTdhaGllRHU2bnNYWDFRbSsrVjlYaWVzd045ZkNB?=
 =?utf-8?B?NHdlRG9FRlRFZXVlR0Y1K0FVb29CdHJ2eDFxNzBTN2hHOUJOS2pGYVMzNlJw?=
 =?utf-8?B?SFhkbHJTZnFZTDdZWVlGRmVReG1MdEsrR09DWE5XbytNT1Z0cHZXTzk3Szl0?=
 =?utf-8?B?eUZRTXhLR3Q0djdaS2VuMEhsK0Y3bXZPWlZLRHBuci9CNlUyajZvWi95ZUdC?=
 =?utf-8?B?Tlp0Nkl1M3BwVStNbGVCMmlzcS96Rm5vL1k5YkJnQ2FvSWxCbXA0YUl4TjJy?=
 =?utf-8?B?R1lyZmNjMmZ4NmlqeTFvaDhhZjZDL01neWVBWnIrcUZvU0diNzBqRitVQnNt?=
 =?utf-8?B?ZkU3SEVaeFpheEpnZmw2OFlDNERtTlllbFhQNWRzSERaQUtIQVNldnFWYzM3?=
 =?utf-8?B?bCsyWjRQaVRxNXkvZ1FaUDM2NXJRK0hXMFNmQUdZSVBOVG9lT1B6aGpSNmpi?=
 =?utf-8?B?eWE2YlBrVHdURUZIcmd0QlMvNWtxd3BSalQwaWFWckJ4SlltUllGYXE2b1hy?=
 =?utf-8?B?Yng4eEh5NDFQUXhLenVrL0FuVEh4KzF6MHM5WFdZeEpweG9mYnoyUlNqOUVI?=
 =?utf-8?B?OFVwM0RjWmpFbTNORjZrYS9sL3R0Yng2RGNyREIvUTVZM0ZTYmRFa0tCMmgz?=
 =?utf-8?B?L3JJWmVZOWhFTkVabk9zSkl0ZjZkSlN1cmNEaE1pTllpdWtuRVpKUTdXV0ZM?=
 =?utf-8?B?ZDVhREtWOUU4OHIyWVBBOXJwU2dSeGZkYzZMczVqOW1sMGljbE9VWHdjZWRj?=
 =?utf-8?B?OWY5VE5XRnc4Z1pmN2FjN1Fkc0ZXRW0wck1tV1VlOCtHWlFxNFF6alR2eTVT?=
 =?utf-8?B?ZWxmczFoU0lsTWFibng2dDlUSWxHYzNBcHhNb3lBQ2xEeHhkNE1jZm5jcG15?=
 =?utf-8?B?eGJrTjArVTJwU3BEeStVbzA0S3BDeU5KTFZ4WjdBUitHeFFFS2ZaY0dKM1cv?=
 =?utf-8?B?bVRjOTBBdXJNNFIwemRYQkwzcDNidXE2dkRIVlQ3MVpEemQyMGtsaXlabFl4?=
 =?utf-8?B?aFB6b3ZHbUF5NzlxV2VyRWlkaTA0cDEwSEV0QXJ3RmNrUjhtQmRNb0QzeWcz?=
 =?utf-8?B?V3JVSjBKQm1USTBYNGZVY2EwVWRNMTBqd29BOXpMMW5zZ05Mcll4UkJyZWQ4?=
 =?utf-8?B?QzVXWHdRTVd6dk1CSHRxcFlZYWVJNnZ5YkdmTVBhYVpxTWNUZ09hRlI0VjhM?=
 =?utf-8?B?VlFTbGppelFTbUkzdFBnTXI2ajJKRUZMclJLd1N0SzlaZWhNWFBDNDJiMnlL?=
 =?utf-8?B?L1RtSWtHSFRBQzhqWWtoZkxKL1Z2bXNPblNFOHpBVFJCQkgwNVM3ZmViQ0dU?=
 =?utf-8?B?UDUxRWZoY0swWHRsNjhZUGdFRjduVThDYm11VERkejRSUVhnZms5SkZ5YTBC?=
 =?utf-8?B?V0ZKUndJYjAvVXBVSjFpZG9MT2dwWi9mZU1GRC9kZXE1bmxzQ1VSa2k0ZERx?=
 =?utf-8?B?SUUrTjIzbHE0bEx4alFsM0I2UUpCdS9oNjFJdmp0THd4cndEV2YwYzFpVGdU?=
 =?utf-8?B?ZDMxMDhwMks3dE1QbGtEN3htMUorTEFVMkVOSENhQ21hZDN2MSswWFdyaHRy?=
 =?utf-8?B?UDRSYnNpZUUraEkyWEN5YUxyYk9QSGJNandlRjlaM3dRTzVCRTFGcVZVVUYr?=
 =?utf-8?B?Uit0WkR3TUp5bk1uTzJOc3NEUTZyazYrR2FlWGhEMDBLUmtmSndWZz09?=
X-Exchange-RoutingPolicyChecked: 
	TurwC4fpJ45NmJbGnfUo2Kgq9deWyv9Jb/7nNuXyiDmvR4XAhKtFVY2MQSRMILqn4HRAVwI1mrV9/RMFQeIRkoHVLhltKBkKHFAa3Nm3FEdStfaceADMtPtKuKVxaign9hm2YLzYOeX1uTzFsncVTsFojuTkyjTQlb8wsRfapzXxsZqC3lka/OFm2cHYMe2B3svzifZSRP/HlxVe+CYiEkjMSAwzzGh8bw5+Me/lax1KEqVZpUKXZOwm119F/5r3zysPwrMIhdI2gp26V8OwuBvCy/IE4C2qvGyYypfiqODwThnUlanRKmjFawRlFdIGcrIHHi+gR5zenef8G25N5Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf87d2a-2427-471d-929c-08debb5bc419
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 19:19:54.2939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuLlWecvsp8UaAhzztbPozQUvOrNCNjGzXbq4w2yvPLqZlo+5ue41+i5kB09qX4dh3fBOELXRLSAmxOB6ChbYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8253
X-Proofpoint-GUID: zM7Dx1PGZpaMUsCM1VCIic4KeLMWwFO1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE3MCBTYWx0ZWRfXyC9h5vJFCdvF
 x1VhvelnJLt5GxxwEpMmNSljA4wT4hxsU7GmvEf9IgNAaiBpKo3d2IfYqgJp5pryENbiW0ZdoCF
 EAfWsgMUKIYW+2vt/iud5jIFQLXSzA8rjkaR713ne+WhoZBkGlhg2p5XZbGGoTVL3lgd8tMt4af
 I3t3lSD7wVfbkkLEghyTOVkY8hZI0NzoLEq1MkALp1k3bohXPUA4F0R9V5f085iojZWbLxfo+sD
 xbVqMIc2h85BBW/yaVntbaT2rW0MzcJVBGRiyWIJND1z5Tz9on4I98cJjfRTY55xNYN4TPuCJXw
 cKtzRh4GN5/p4PBu8367xFgt+SyL1+dtMDHpdkTPp+tFtSd0S4YphWa8URisV+l/uRLnkgvWDW0
 wJHoda7OegC+9kngknEPePqcuLljOoGxENHowQF/pJnllKKAWEgjuo+GxPzGkHofE5FVvcZH2/H
 /O7twT5ufyzdNeZaihw==
X-Authority-Analysis: v=2.4 cv=IMUyzAvG c=1 sm=1 tr=0 ts=6a15f25e cx=c_pps
 a=gTn3qzDU66SAkKtIq75K5w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=p0WdMEafAAAA:8 a=ID6ng7r3AAAA:8 a=69wJf7TsAAAA:8 a=mDV3o1hIAAAA:8
 a=D2nq_zG4AAAA:20 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=kmYkUENqAAAA:8
 a=IpJZQVW2AAAA:8 a=k-42gJp3AAAA:8 a=ag1SF4gXAAAA:8 a=omOdbC7AAAAA:8
 a=pFyQfRViAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=AUd_NHdVAAAA:8
 a=pGLkceISAAAA:8 a=ilKATfAMAAAA:8 a=zmn1wAeFutqTNI2BmLkA:9
 a=LXiDdo3XvMTTykAY:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=AkheI1RvQwOzcTXhi5f4:22 a=Fg1AiH1G6rFz08G2ETeA:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=p9kz6gysRiz6SGr9lVkz:22 a=IawgGOuG5U0WyFbmm1f5:22 a=uCSXFHLys93vLW5PjgO_:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=oJz5jJLG1JtSoe7EL652:22 a=cvBusfyB2V15izCimMoJ:22
 a=73awMTU50e6eLoBjGbzZ:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: zM7Dx1PGZpaMUsCM1VCIic4KeLMWwFO1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260170
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64QG7snQ1027712
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 19:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237617

From: Quan Sun <Quan.Sun@windriver.com>

Upgrade QEMU to version 11.0.0.

Main changes:

- Add python3-qemu-qmp recipe (0.0.6) as a separate package. The QMP
  Python library was removed from the QEMU source tree in 11.0.0 and
  split into its own upstream project. This is needed by
  qemu-system-native for testimage integration.
  Add an entry for this recipe in maintainers.inc.

- QEMU 11.0.0 has officially dropped all support for 32-bit host systems.
  This includes the ability to build the system emulator (softmmu) on
  any 32-bit host architecture. Add COMPATIBLE_HOST for class-target and
  class-nativesdk to restrict builds to 64-bit architectures.
  Note: QEMU 11.0.0 still supports emulating 32-bit guest architectures
  (such as qemu-system-i386 or qemu-system-arm) as long as they are
  running on a 64-bit host.

- qemu-targets.inc: skip linux-user targets when HOST_ARCH is not in the
  set of architectures supported by QEMU 11.0.0's linux-user mode
  (64-bit only: aarch64, loongarch64, mips64, ppc64, riscv64, s390x,
  sparc64, x86_64).

- Add --cpu=3D${TUNE_ARCH} to EXTRA_OECONF for class-target, and add
  --cpu=3D${SDK_ARCH} to nativesdk configure options to fix build
  failure. QEMU 11's configure script falls back to 'uname -m' (x86_64)
  when it cannot detect the host CPU.

- Add 0012-meson-fix-close_range-detection-on-older-glibc.patch:
  the meson has_function('close_range') check succeeds at link time on
  hosts with kernel >=3D 5.9 even when glibc < 2.34 does not declare the
  function, causing implicit declaration errors. Add a prefix include
  so the check only succeeds when the header declares close_range().

- Add 0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-s=
tructs.patch:
  on build hosts with kernel headers < 6.0, vhost-scsi.c fails to
  compile due to missing struct vhost_vring_worker/vhost_worker_state.
  Include QEMU's bundled standard-headers before the system header,
  matching the pattern already used in hw/virtio/vhost-backend.c.

- Drop fix-strerrorname_np.patch (fixed upstream).
  Drop 0001-linux-user-elfload.c-Correction-to-HWCAP2-accessor.patch
  (fixed upstream).
  Drop 0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch
  (fixed upstream).

AI-Generated: kiro-cli

Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |   1 +
 .../qemu/python3-qemu-qmp_0.0.6.bb            |  28 ++
 ...native_10.2.0.bb =3D> qemu-native_11.0.0.bb} |   1 -
 ...10.2.0.bb =3D> qemu-system-native_11.0.0.bb} |   7 +-
 meta/recipes-devtools/qemu/qemu-targets.inc   |   4 +
 meta/recipes-devtools/qemu/qemu.inc           |  26 +-
 ...tlb_to_section-for-different-Address.patch | 274 ------------------
 ...load.c-Correction-to-HWCAP2-accessor.patch |  42 ---
 ...n-environment-space-to-boot-loader-q.patch |   8 +-
 .../0002-apic-fixup-fallthrough-to-PIC.patch  |   6 +-
 ...mu-Do-not-include-file-if-not-exists.patch |   6 +-
 ...er-space-mmap-tweaks-to-address-musl.patch |  24 +-
 .../qemu/0006-qemu-Determinism-fixes.patch    |   4 +-
 ...d-use-relative-path-to-refer-to-file.patch |   6 +-
 ...and-MAP_SHARED_VALIDATE-on-needed-li.patch |   2 +-
 ...gure-lookup-meson-exutable-from-PATH.patch |  10 +-
 ...and-the-python-venv-aren-t-used-for-.patch |  10 +-
 ...close_range-detection-on-older-glibc.patch |  36 +++
 ...ard-headers-for-vhost-worker-structs.patch |  35 +++
 .../qemu/qemu/fix-strerrorname_np.patch       |  35 ---
 .../qemu/{qemu_10.2.0.bb =3D> qemu_11.0.0.bb}   |   0
 21 files changed, 154 insertions(+), 411 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb
 rename meta/recipes-devtools/qemu/{qemu-native_10.2.0.bb =3D> qemu-nativ=
e_11.0.0.bb} (99%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_10.2.0.bb =3D> qem=
u-system-native_11.0.0.bb} (85%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-io=
tlb_to_section-for-different-Address.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-elflo=
ad.c-Correction-to-HWCAP2-accessor.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_=
range-detection-on-older-glibc.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-sc=
si-include-standard-headers-for-vhost-worker-structs.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.p=
atch
 rename meta/recipes-devtools/qemu/{qemu_10.2.0.bb =3D> qemu_11.0.0.bb} (=
100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 24c5a9d712..9e6bf3a911 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -705,6 +705,7 @@ RECIPE_MAINTAINER:pn-python3-pytest =3D "Trevor Gambl=
in <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-pytest-subtests =3D "Tim Orling <tim.orling=
@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pytz =3D "Tim Orling <tim.orling@konsulko.c=
om>"
 RECIPE_MAINTAINER:pn-python3-pyyaml =3D "Tim Orling <tim.orling@konsulko=
.com>"
+RECIPE_MAINTAINER:pn-python3-qemu-qmp =3D "Richard Purdie <richard.purdi=
e@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-python3-rdflib =3D "Wang Mingyu <wangmy@fujitsu.com=
>"
 RECIPE_MAINTAINER:pn-python3-referencing =3D "Trevor Gamblin <tgamblin@b=
aylibre.com>"
 RECIPE_MAINTAINER:pn-python3-requests =3D "Tim Orling <tim.orling@konsul=
ko.com>"
diff --git a/meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb b/meta/=
recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb
new file mode 100644
index 0000000000..4b3bbe6670
--- /dev/null
+++ b/meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb
@@ -0,0 +1,28 @@
+SUMMARY =3D "QEMU Monitor Protocol Python library"
+DESCRIPTION =3D "An asyncio library for communicating with QEMU Monitor =
Protocol (QMP). \
+This library was split out of the QEMU source tree to provide a referenc=
e QMP \
+implementation usable both within and outside of the QEMU source tree."
+HOMEPAGE =3D "https://gitlab.com/qemu-project/python-qemu-qmp"
+LICENSE =3D "LGPL-2.0-only & GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cf66a4984120007c9881cc871cf4=
9db"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE =3D "qemu_qmp"
+
+SRC_URI[sha256sum] =3D "a3c25d871fab549122b2340810de1f99481002c942a21324=
76b062aacdbf6e92"
+
+DEPENDS +=3D "python3-setuptools-scm-native"
+
+RDEPENDS:${PN} +=3D "python3-core python3-asyncio"
+
+# Install to the custom path expected by oeqa/utils/qemurunner.py
+# which imports "qmp.legacy" from ${libdir}/qemu-python/
+do_install:append:class-native() {
+    install -d ${D}${libdir}/qemu-python/qmp/
+    cp -R --no-dereference --preserve=3Dmode,links ${S}/qemu/qmp/* ${D}$=
{libdir}/qemu-python/qmp/
+}
+
+FILES:${PN}:append:class-native =3D " ${libdir}/qemu-python"
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb b/meta/reci=
pes-devtools/qemu/qemu-native_11.0.0.bb
similarity index 99%
rename from meta/recipes-devtools/qemu/qemu-native_10.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_11.0.0.bb
index 26fa84c180..a77953529b 100644
--- a/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-native_11.0.0.bb
@@ -7,4 +7,3 @@ require qemu-native.inc
 EXTRA_OECONF:append =3D " --target-list=3D${@get_qemu_usermode_target_li=
st(d)} --disable-tools --disable-install-blobs --disable-guest-agent"
=20
 PACKAGECONFIG ??=3D "pie"
-
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb b/me=
ta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
similarity index 85%
rename from meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
index 2e4f7328ad..7947499c5f 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
@@ -5,7 +5,7 @@ require qemu-native.inc
 # As some of the files installed by qemu-native and qemu-system-native
 # are the same, we depend on qemu-native to get the full installation se=
t
 # and avoid file clashes
-DEPENDS +=3D "glib-2.0-native zlib-native pixman-native qemu-native"
+DEPENDS +=3D "glib-2.0-native zlib-native pixman-native qemu-native pyth=
on3-qemu-qmp-native"
=20
 EXTRA_OECONF:append =3D " --target-list=3D${@get_qemu_system_target_list=
(d)}"
=20
@@ -25,9 +25,4 @@ do_install:append() {
     rm -rf ${D}${datadir}/qemu/dtb
     rm -rf ${D}${datadir}/icons/
     rm -rf ${D}${includedir}/qemu-plugin.h
-
-    # Install qmp.py to be used with testimage
-    install -d ${D}${libdir}/qemu-python/qmp/
-    install -D ${S}/python/qemu/qmp/* ${D}${libdir}/qemu-python/qmp/
 }
-
diff --git a/meta/recipes-devtools/qemu/qemu-targets.inc b/meta/recipes-d=
evtools/qemu/qemu-targets.inc
index 50e5eb6796..937ef1a911 100644
--- a/meta/recipes-devtools/qemu/qemu-targets.inc
+++ b/meta/recipes-devtools/qemu/qemu-targets.inc
@@ -25,6 +25,10 @@ def get_qemu_target_list(d):
             archs.remove(arch)
     if 'linux' not in tos:
         return softmmuonly + ''.join([arch + "-softmmu" + "," for arch i=
n archs]).rstrip(',')
+    # QEMU 11.0.0+ only supports linux-user on 64-bit host architectures
+    linux_user_hosts =3D ['aarch64', 'loongarch64', 'mips64', 'ppc64', '=
riscv64', 's390x', 'sparc64', 'x86_64']
+    if tarch not in linux_user_hosts:
+        return softmmuonly + ''.join([arch + "-softmmu" + "," for arch i=
n archs]).rstrip(',')
     return softmmuonly + linuxuseronly + ''.join([arch + "-linux-user" +=
 "," + arch + "-softmmu" + "," for arch in archs]).rstrip(',')
=20
 def get_qemu_usermode_target_list(d):
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 5f30416a48..f61f43de4b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -4,6 +4,7 @@ machine's processor through dynamic binary translation an=
d provides a set \
 of different hardware and device models for the machine, enabling it to =
run \
 a variety of guest operating systems"
 HOMEPAGE =3D "http://qemu.org"
+BUGTRACKER =3D "https://gitlab.com/qemu-project/qemu/-/issues"
 LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
=20
 DEPENDS +=3D "bison-native meson-native ninja-native"
@@ -22,7 +23,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da3b50d8b88dc=
c0eb3d7d39b760b9e821 \
 SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://powerpc_rom.bin \
            file://run-ptest \
-           file://fix-strerrorname_np.patch \
            file://0001-qemu-Add-addition-environment-space-to-boot-loade=
r-q.patch \
            file://0002-apic-fixup-fallthrough-to-PIC.patch \
            file://0004-qemu-Do-not-include-file-if-not-exists.patch \
@@ -32,8 +32,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed=
-li.patch \
            file://0010-configure-lookup-meson-exutable-from-PATH.patch \
            file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-f=
or-.patch \
-           file://0001-linux-user-elfload.c-Correction-to-HWCAP2-accesso=
r.patch \
-           file://0001-accel-tcg-Fix-iotlb_to_section-for-different-Addr=
ess.patch \
+           file://0012-meson-fix-close_range-detection-on-older-glibc.pa=
tch \
+           file://0013-hw-scsi-vhost-scsi-include-standard-headers-for-v=
host-worker-structs.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
@@ -41,7 +41,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
 UPSTREAM_CHECK_URI =3D "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
-SRC_URI[sha256sum] =3D "9e30ad1b8b9f7b4463001582d1ab297f39cfccea5d08540c=
0ca6d6672785883a"
+SRC_URI[sha256sum] =3D "c04ca36012653f32d11c674d370cf52a710e7d3f18c2d8b6=
3e4932052a4854d6"
=20
 CVE_STATUS[CVE-2007-0998] =3D "not-applicable-config: The VNC server can=
 expose host files uder some circumstances. We don't enable it by default=
."
=20
@@ -61,6 +61,10 @@ COMPATIBLE_HOST:mipsarchn32 =3D "null"
 COMPATIBLE_HOST:mipsarchn64 =3D "null"
 COMPATIBLE_HOST:riscv32 =3D "null"
=20
+# QEMU 11.0.0+ requires a 64-bit host architecture for emulator builds
+COMPATIBLE_HOST:class-target =3D "(aarch64|x86_64|ppc64|riscv64|loongarc=
h64|mips64|s390x|sparc64).*-linux"
+COMPATIBLE_HOST:class-nativesdk =3D "(aarch64|x86_64|ppc64|riscv64|loong=
arch64|mips64|s390x|sparc64).*-linux"
+
 # Per https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.=
html
 # upstream states qemu doesn't work without optimization
 DEBUG_BUILD =3D "0"
@@ -75,7 +79,7 @@ do_install_ptest() {
 	find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcodp]" | xargs -i rm =
-rf {}
=20
 	# Don't check the file genreated by configure
-	sed -i -e "1s,#!/usr/bin/bash,#!${base_bindir}/bash," ${D}${PTEST_PATH}=
/tests/data/acpi/disassemle-aml.sh
+	sed -i -e "1s,#!/usr/bin/bash,#!${base_bindir}/bash," ${D}${PTEST_PATH}=
/tests/data/acpi/disassemble-aml.sh
=20
 	# Strip the paths from the QEMU variable, we can use PATH
 	makfiles=3D$(find ${D}${PTEST_PATH} -name "*.mak")
@@ -119,19 +123,17 @@ EXTRA_OECONF =3D " \
     ${PACKAGECONFIG_CONFARGS} \
     "
=20
-EXTRA_OECONF:append:class-target =3D " --cross-prefix=3D${HOST_PREFIX}"
-EXTRA_OECONF:append:class-nativesdk =3D " --cross-prefix=3D${HOST_PREFIX=
}"
+EXTRA_OECONF:append:class-target =3D " --cross-prefix=3D${HOST_PREFIX} -=
-cpu=3D${TUNE_ARCH}"
+EXTRA_OECONF:append:class-nativesdk =3D " --cross-prefix=3D${HOST_PREFIX=
} --cpu=3D${@d.getVar('SDK_ARCH').replace('i686', 'i386')}"
=20
 B =3D "${WORKDIR}/build"
=20
 #EXTRA_OECONF:append =3D " --python=3D${HOSTTOOLS_DIR}/python3"
=20
 do_configure:prepend:class-native() {
-	# Append build host pkg-config paths for native target since the host m=
ay provide sdl
-	BHOST_PKGCONFIG_PATH=3D$(PATH=3D/usr/bin:/bin pkg-config --variable pc_=
path pkg-config || echo "")
-	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
-		export PKG_CONFIG_LIBDIR=3D$PKG_CONFIG_LIBDIR:$BHOST_PKGCONFIG_PATH
-	fi
+	# Avoid leaking host pkg-config paths which may find incompatible
+	# old system libraries (e.g. glib-2.0, fixesproto, gtk+-3.0)
+	export PKG_CONFIG_PATH=3D"${STAGING_LIBDIR_NATIVE}/pkgconfig:${STAGING_=
DATADIR_NATIVE}/pkgconfig"
 }
=20
 do_configure() {
diff --git a/meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-iotlb_to_=
section-for-different-Address.patch b/meta/recipes-devtools/qemu/qemu/000=
1-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch
deleted file mode 100644
index d19f872fc3..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-iotlb_to_section=
-for-different-Address.patch
+++ /dev/null
@@ -1,274 +0,0 @@
-From 858e6bb252e075e09cca6e78299151d3af0bf5fb Mon Sep 17 00:00:00 2001
-From: Quan Sun <Quan.Sun@windriver.com>
-Date: Tue, 28 Apr 2026 14:56:36 -0400
-Subject: [PATCH] accel/tcg: Fix iotlb_to_section() for different Address=
Space
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-'CPUTLBEntryFull.xlat_section' stores section_index in last 12 bits to
-find the correct section when CPU access the IO region over the IOTLB.
-However, section_index is only unique inside single AddressSpace. If
-address space translation is over IOMMUMemoryRegion, it could return
-section from other AddressSpace. 'iotlb_to_section()' API only finds the
-sections from CPU's AddressSpace so that it couldn't find section in
-other AddressSpace. Thus, using 'iotlb_to_section()' API will find the
-wrong section and QEMU will have wrong load/store access.
-
-To fix this bug of iotlb_to_section(), store complete MemoryRegionSectio=
n
-pointer in CPUTLBEntryFull to replace the section_index in xlat_section.
-Rename 'xlat_section' to 'xlat_offset' as we remove last 12 bits
-section_index inside. Also, since we directly use section pointer in the
-CPUTLBEntryFull (full->section), we can remove the unused functions:
-iotlb_to_section(), memory_region_section_get_iotlb().
-
-This bug occurs only when
-(1) IOMMUMemoryRegion is in the path of CPU access.
-(2) IOMMUMemoryRegion returns different target_as and the section is in
-the IO region.
-
-This patch incorporates prerequisite changes from upstream commit
-94c6e9cf0440 ("accel/tcg: Send the CPUTLBEntryFull struct into
-io_prepare()") needed for the fix to apply cleanly.
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/854cd16e318eed12de2995014b28d9f374c64bf7]
-
-Signed-off-by: Jim Shu <jim.shu@sifive.com>
-Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
-Tested-by: Mark Burton <mburton@qti.qualcomm.com>
-Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
-Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
-Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
----
- accel/tcg/cputlb.c        | 32 +++++++++++++++-----------------
- include/accel/tcg/iommu.h | 15 ---------------
- include/exec/cputlb.h     |  4 ++--
- include/hw/core/cpu.h     | 17 +++++++++--------
- system/physmem.c          | 25 -------------------------
- 5 files changed, 26 insertions(+), 67 deletions(-)
-
-diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
-index fd1606c85..fa0f4d8b3 100644
---- a/accel/tcg/cputlb.c
-+++ b/accel/tcg/cputlb.c
-@@ -1089,7 +1089,7 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
-         }
-     } else {
-         /* I/O or ROMD */
--        iotlb =3D memory_region_section_get_iotlb(cpu, section) + xlat;
-+        iotlb =3D xlat;
-         /*
-          * Writes to romd devices must go through MMIO to enable write.
-          * Reads to romd devices go through the ram_ptr found above,
-@@ -1140,10 +1140,9 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx=
,
-     /*
-      * When memory region is ram, iotlb contains a TARGET_PAGE_BITS
-      * aligned ram_addr_t of the page base of the target RAM.
--     * Otherwise, iotlb contains
--     *  - a physical section number in the lower TARGET_PAGE_BITS
--     *  - the offset within section->mr of the page base (I/O, ROMD) wi=
th the
--     *    TARGET_PAGE_BITS masked off.
-+     * Otherwise, iotlb contains a TARGET_PAGE_BITS aligned
-+     * offset within section->mr of the page base (I/O, ROMD)
-+     *
-      * We subtract addr_page (which is page aligned and thus won't
-      * disturb the low bits) to give an offset which can be added to th=
e
-      * (non-page-aligned) vaddr of the eventual memory access to get
-@@ -1153,7 +1152,8 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
-      */
-     desc->fulltlb[index] =3D *full;
-     full =3D &desc->fulltlb[index];
--    full->xlat_section =3D iotlb - addr_page;
-+    full->xlat_offset =3D iotlb - addr_page;
-+    full->section =3D section;
-     full->phys_addr =3D paddr_page;
-
-     /* Now calculate the new entry */
-@@ -1269,14 +1269,14 @@ static inline void cpu_unaligned_access(CPUState=
 *cpu, vaddr addr,
- }
-
- static MemoryRegionSection *
--io_prepare(hwaddr *out_offset, CPUState *cpu, hwaddr xlat,
-+io_prepare(hwaddr *out_offset, CPUState *cpu, CPUTLBEntryFull *full,
-            MemTxAttrs attrs, vaddr addr, uintptr_t retaddr)
- {
-     MemoryRegionSection *section;
-     hwaddr mr_offset;
-
--    section =3D iotlb_to_section(cpu, xlat, attrs);
--    mr_offset =3D (xlat & TARGET_PAGE_MASK) + addr;
-+    section =3D full->section;
-+    mr_offset =3D full->xlat_offset + addr;
-     cpu->mem_io_pc =3D retaddr;
-     if (!cpu->neg.can_do_io) {
-         cpu_io_recompile(cpu, retaddr);
-@@ -1335,7 +1335,7 @@ static bool victim_tlb_hit(CPUState *cpu, size_t m=
mu_idx, size_t index,
- static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned siz=
e,
-                            CPUTLBEntryFull *full, uintptr_t retaddr)
- {
--    ram_addr_t ram_addr =3D mem_vaddr + full->xlat_section;
-+    ram_addr_t ram_addr =3D mem_vaddr + full->xlat_offset;
-
-     trace_memory_notdirty_write_access(mem_vaddr, ram_addr, size);
-
-@@ -1592,9 +1592,7 @@ bool tlb_plugin_lookup(CPUState *cpu, vaddr addr, =
int mmu_idx,
-
-     /* We must have an iotlb entry for MMIO */
-     if (tlb_addr & TLB_MMIO) {
--        MemoryRegionSection *section =3D
--            iotlb_to_section(cpu, full->xlat_section & ~TARGET_PAGE_MAS=
K,
--                             full->attrs);
-+        MemoryRegionSection *section =3D full->section;
-         data->is_io =3D true;
-         data->mr =3D section->mr;
-     } else {
-@@ -1980,7 +1978,7 @@ static uint64_t do_ld_mmio_beN(CPUState *cpu, CPUT=
LBEntryFull *full,
-     tcg_debug_assert(size > 0 && size <=3D 8);
-
-     attrs =3D full->attrs;
--    section =3D io_prepare(&mr_offset, cpu, full->xlat_section, attrs, =
addr, ra);
-+    section =3D io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
-     mr =3D section->mr;
-
-     BQL_LOCK_GUARD();
-@@ -2001,7 +1999,7 @@ static Int128 do_ld16_mmio_beN(CPUState *cpu, CPUT=
LBEntryFull *full,
-     tcg_debug_assert(size > 8 && size <=3D 16);
-
-     attrs =3D full->attrs;
--    section =3D io_prepare(&mr_offset, cpu, full->xlat_section, attrs, =
addr, ra);
-+    section =3D io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
-     mr =3D section->mr;
-
-     BQL_LOCK_GUARD();
-@@ -2521,7 +2519,7 @@ static uint64_t do_st_mmio_leN(CPUState *cpu, CPUT=
LBEntryFull *full,
-     tcg_debug_assert(size > 0 && size <=3D 8);
-
-     attrs =3D full->attrs;
--    section =3D io_prepare(&mr_offset, cpu, full->xlat_section, attrs, =
addr, ra);
-+    section =3D io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
-     mr =3D section->mr;
-
-     BQL_LOCK_GUARD();
-@@ -2541,7 +2539,7 @@ static uint64_t do_st16_mmio_leN(CPUState *cpu, CP=
UTLBEntryFull *full,
-     tcg_debug_assert(size > 8 && size <=3D 16);
-
-     attrs =3D full->attrs;
--    section =3D io_prepare(&mr_offset, cpu, full->xlat_section, attrs, =
addr, ra);
-+    section =3D io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
-     mr =3D section->mr;
-
-     BQL_LOCK_GUARD();
-diff --git a/include/accel/tcg/iommu.h b/include/accel/tcg/iommu.h
-index 90cfd6c0e..547f8ea0e 100644
---- a/include/accel/tcg/iommu.h
-+++ b/include/accel/tcg/iommu.h
-@@ -14,18 +14,6 @@
- #include "exec/hwaddr.h"
- #include "exec/memattrs.h"
-
--/**
-- * iotlb_to_section:
-- * @cpu: CPU performing the access
-- * @index: TCG CPU IOTLB entry
-- *
-- * Given a TCG CPU IOTLB entry, return the MemoryRegionSection that
-- * it refers to. @index will have been initially created and returned
-- * by memory_region_section_get_iotlb().
-- */
--MemoryRegionSection *iotlb_to_section(CPUState *cpu,
--                                      hwaddr index, MemTxAttrs attrs);
--
- MemoryRegionSection *address_space_translate_for_iotlb(CPUState *cpu,
-                                                        int asidx,
-                                                        hwaddr addr,
-@@ -34,8 +22,5 @@ MemoryRegionSection *address_space_translate_for_iotlb=
(CPUState *cpu,
-                                                        MemTxAttrs attrs=
,
-                                                        int *prot);
-
--hwaddr memory_region_section_get_iotlb(CPUState *cpu,
--                                       MemoryRegionSection *section);
--
- #endif
-
-diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
-index 9bec0e789..16f866990 100644
---- a/include/exec/cputlb.h
-+++ b/include/exec/cputlb.h
-@@ -43,8 +43,8 @@ void tlb_reset_dirty_range_all(ram_addr_t start, ram_a=
ddr_t length);
-  * @full: the details of the tlb entry
-  *
-  * Add an entry to @cpu tlb index @mmu_idx.  All of the fields of
-- * @full must be filled, except for xlat_section, and constitute
-- * the complete description of the translated page.
-+ * @full must be filled, except for xlat_offset & section, and
-+ * constitute the complete description of the translated page.
-  *
-  * This is generally called by the target tlb_fill function after
-  * having performed a successful page table walk to find the physical
-diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
-index 961505177..a3db3f66f 100644
---- a/include/hw/core/cpu.h
-+++ b/include/hw/core/cpu.h
-@@ -214,15 +214,16 @@ typedef uint32_t MMUIdxMap;
-  */
- struct CPUTLBEntryFull {
-     /*
--     * @xlat_section contains:
--     *  - in the lower TARGET_PAGE_BITS, a physical section number
--     *  - with the lower TARGET_PAGE_BITS masked off, an offset which
--     *    must be added to the virtual address to obtain:
--     *     + the ram_addr_t of the target RAM (if the physical section
--     *       number is PHYS_SECTION_NOTDIRTY or PHYS_SECTION_ROM)
--     *     + the offset within the target MemoryRegion (otherwise)
-+     * @xlat_offset: TARGET_PAGE_BITS aligned offset which must be adde=
d to
-+     * the virtual address to obtain:
-+     *   + the ram_addr_t of the target RAM (if the physical section
-+     *     number is PHYS_SECTION_NOTDIRTY or PHYS_SECTION_ROM)
-+     *   + the offset within the target MemoryRegion (otherwise)
-      */
--    hwaddr xlat_section;
-+    hwaddr xlat_offset;
-+
-+    /* @section contains physical section. */
-+    MemoryRegionSection *section;
-
-     /*
-      * @phys_addr contains the physical address in the address space
-diff --git a/system/physmem.c b/system/physmem.c
-index c9869e404..a21e7ca64 100644
---- a/system/physmem.c
-+++ b/system/physmem.c
-@@ -748,31 +748,6 @@ translate_fail:
-     return &d->map.sections[PHYS_SECTION_UNASSIGNED];
- }
-
--MemoryRegionSection *iotlb_to_section(CPUState *cpu,
--                                      hwaddr index, MemTxAttrs attrs)
--{
--    int asidx =3D cpu_asidx_from_attrs(cpu, attrs);
--    CPUAddressSpace *cpuas =3D &cpu->cpu_ases[asidx];
--    AddressSpaceDispatch *d =3D address_space_to_dispatch(cpuas->as);
--    int section_index =3D index & ~TARGET_PAGE_MASK;
--    MemoryRegionSection *ret;
--
--    assert(section_index < d->map.sections_nb);
--    ret =3D d->map.sections + section_index;
--    assert(ret->mr);
--    assert(ret->mr->ops);
--
--    return ret;
--}
--
--/* Called from RCU critical section */
--hwaddr memory_region_section_get_iotlb(CPUState *cpu,
--                                       MemoryRegionSection *section)
--{
--    AddressSpaceDispatch *d =3D flatview_to_dispatch(section->fv);
--    return section - d->map.sections;
--}
--
- #endif /* CONFIG_TCG */
-
- void cpu_address_space_init(CPUState *cpu, int asidx,
---
-2.43.0
diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-elfload.c-Co=
rrection-to-HWCAP2-accessor.patch b/meta/recipes-devtools/qemu/qemu/0001-=
linux-user-elfload.c-Correction-to-HWCAP2-accessor.patch
deleted file mode 100644
index 47d6f41385..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-linux-user-elfload.c-Correctio=
n-to-HWCAP2-accessor.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From c333f9c4ee212297f3b9a8a6ef62396a63c48e61 Mon Sep 17 00:00:00 2001
-From: Jim MacArthur <jim.macarthur@linaro.org>
-Date: Tue, 6 Jan 2026 15:40:48 +0000
-Subject: [PATCH] linux-user/elfload.c: Correction to HWCAP2 accessor
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-get_elf_hwcap was used when get_elf_hwcap2 should have been.
-
-Cc: qemu-stable@nongnu.org
-Fixes: fcac98d0ba8b ("linux-user: Remove ELF_HWCAP2")
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3259
-Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
-Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
-Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
-Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
-Message-ID: <20260106-fix-hwcap2-sve2-v1-1-1d70dff63370@linaro.org>
-
-Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/c333f9c4ee212297f3b9a8a6ef62396a63c48e61]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- linux-user/elfload.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/linux-user/elfload.c b/linux-user/elfload.c
-index 0002d5be2f..35471c0c9a 100644
---- a/linux-user/elfload.c
-+++ b/linux-user/elfload.c
-@@ -708,7 +708,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int =
argc, int envc,
-     NEW_AUX_ENT(AT_EXECFN, info->file_string);
-=20
-     if (HAVE_ELF_HWCAP2) {
--        NEW_AUX_ENT(AT_HWCAP2, get_elf_hwcap(thread_cpu));
-+        NEW_AUX_ENT(AT_HWCAP2, get_elf_hwcap2(thread_cpu));
-     }
-     if (u_base_platform) {
-         NEW_AUX_ENT(AT_BASE_PLATFORM, u_base_platform);
---=20
-2.34.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-envir=
onment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/000=
1-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index bc8dace013..40b08cd247 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-=
space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-=
space-to-boot-loader-q.patch
@@ -1,10 +1,10 @@
-From f2d9bc614f7edf66412209aba78aa086e65dc75e Mon Sep 17 00:00:00 2001
+From a84184c98cf296954e0c757604e969b8565eb474 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
  qemu-system-mips
=20
-Upstream-Status: Inappropriate - OE uses deep paths
+Upstream-Status: Inappropriate [OE uses deep paths]
=20
 If you create a project with very long directory names like 128 characte=
rs
 deep and use NFS, the kernel arguments will be truncated. The kernel wil=
l
@@ -18,10 +18,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/hw/mips/malta.c b/hw/mips/malta.c
-index cbdbb2105..62681fdae 100644
+index 812ff64d8..daf929943 100644
 --- a/hw/mips/malta.c
 +++ b/hw/mips/malta.c
-@@ -65,7 +65,7 @@
+@@ -66,7 +66,7 @@
  #define ENVP_PADDR          0x2000
  #define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
  #define ENVP_NB_ENTRIES     16
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-=
to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthroug=
h-to-PIC.patch
index bfc85f4842..ad00f24482 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.=
patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.=
patch
@@ -1,4 +1,4 @@
-From 945af9ecc80653955cbdbb7d3e28dce61795b251 Mon Sep 17 00:00:00 2001
+From 0a688e763d91c2e0e11cbe960f405442a9f35417 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
@@ -33,10 +33,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index aad253a..212b01f 100644
+index 8766ed00b..581fc6deb 100644
 --- a/hw/intc/apic.c
 +++ b/hw/intc/apic.c
-@@ -740,7 +740,7 @@ int apic_accept_pic_intr(APICCommonState *s)
+@@ -741,7 +741,7 @@ int apic_accept_pic_intr(APICCommonState *s)
  {
      uint32_t lvt0;
 =20
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-fil=
e-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-=
include-file-if-not-exists.patch
index 2e738abaa3..4b6ac54445 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-no=
t-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-no=
t-exists.patch
@@ -1,4 +1,4 @@
-From f8c1614b204c1d64af906dc70dbf4a1534eb6b38 Mon Sep 17 00:00:00 2001
+From b38315a5a6f9fc033c72bb94ff258bb4b1ac8dd3 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
 Subject: [PATCH] qemu: Do not include file if not exists
@@ -16,10 +16,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com=
>
  1 file changed, 2 insertions(+)
=20
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index c236b2834..2a3527a87 100644
+index f4b74ad35..3da51ea83 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
-@@ -119,7 +119,9 @@
+@@ -117,7 +117,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
  #include <linux/netlink.h>
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-spac=
e-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/000=
5-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index ffbbb1ab32..59236999f9 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-=
tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-=
tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From 3621615790270449bf9c8a0777e8ef28eb762bf9 Mon Sep 17 00:00:00 2001
+From e4abb937ba5a6a476d31886e71e67006df22a664 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 3=
2 bit
@@ -16,32 +16,24 @@ A better return value for the other cases of invalid =
addresses is EINVAL
 rather than ENOMEM so adjust the other part of the test to this.
=20
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-deve=
l/2021-01/msg01355.html]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 ---
- linux-user/mmap.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
+ linux-user/mmap.c | 5 +++++
+ 1 file changed, 5 insertions(+)
=20
 diff --git a/linux-user/mmap.c b/linux-user/mmap.c
-index 002e1e668..912839dec 100644
+index b635b6a21..a5a617516 100644
 --- a/linux-user/mmap.c
 +++ b/linux-user/mmap.c
-@@ -1109,12 +1109,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_u=
long old_size,
+@@ -1113,6 +1113,11 @@ abi_long target_mremap(abi_ulong old_addr, abi_ul=
ong old_size,
      int prot;
      void *host_addr;
 =20
--    if (!guest_range_valid_untagged(old_addr, old_size) ||
--        ((flags & MREMAP_FIXED) &&
 +    if (!guest_range_valid_untagged(old_addr, old_size)) {
 +        errno =3D EFAULT;
 +        return -1;
 +    }
-+   =20
-+    if (((flags & MREMAP_FIXED) &&
++
+     if (((flags & MREMAP_FIXED) &&
           !guest_range_valid_untagged(new_addr, new_size)) ||
          ((flags & MREMAP_MAYMOVE) =3D=3D 0 &&
-          !guest_range_valid_untagged(old_addr, new_size))) {
--        errno =3D ENOMEM;
-+        errno =3D EINVAL;
-         return -1;
-     }
-=20
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.=
patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 5b24c18916..0d7974fcdc 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From 8b28a9376074067bc2d84d4f77d5c7a42433b31b Mon Sep 17 00:00:00 2001
+From e891928d2248e186c65979cf5a2ba0cff9d00824 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
@@ -11,6 +11,8 @@ meson to pass relative paths but we can fix that in the=
 script.
=20
 Upstream-Status: Pending [some version of all/part of this may be accept=
ed]
 RP 2021/3/1
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 ---
  scripts/decodetree.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-r=
elative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/000=
7-tests-meson.build-use-relative-path-to-refer-to-file.patch
index a58c936d06..275c500894 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative=
-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative=
-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From 097b75ad8310143decab92f6d1744144e7a4809f Mon Sep 17 00:00:00 2001
+From ac9a866ac807cb1542f26df07b4aad3a06342a99 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
@@ -17,10 +17,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.c=
om>
  1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/tests/unit/meson.build b/tests/unit/meson.build
-index d5248ae51..2c581f055 100644
+index 41e8b06c3..ce5df4957 100644
 --- a/tests/unit/meson.build
 +++ b/tests/unit/meson.build
-@@ -127,17 +127,17 @@ endif
+@@ -124,17 +124,17 @@ endif
 =20
  if have_system
    tests +=3D {
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP=
_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/000=
8-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index af0eafb65f..f6e563ad80 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED=
_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED=
_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 9d5deb767523ea0d1aeecb9960244c702530acad Mon Sep 17 00:00:00 2001
+From c0bfd2c5556afcf4413c81b3fda54a62f2bdd8c8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-=
exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure=
-lookup-meson-exutable-from-PATH.patch
index db88766cf6..430b1aa509 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutabl=
e-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutabl=
e-from-PATH.patch
@@ -1,4 +1,4 @@
-From aaec67c133dddda7204d23964732b4b788cbc9ce Mon Sep 17 00:00:00 2001
+From e357ac91b04f733148defe8c133ae8b2085a9a23 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Martin=3D20Hundeb=3DC3=3DB8ll?=3D <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
@@ -13,10 +13,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
=20
 diff --git a/configure b/configure
-index 82cace1..83bbda9 100755
+index eea903067..217af781f 100755
 --- a/configure
 +++ b/configure
-@@ -993,10 +993,7 @@ get_pwd() {
+@@ -981,10 +981,7 @@ get_pwd() {
      fi
  }
 =20
@@ -26,5 +26,5 @@ index 82cace1..83bbda9 100755
 -fi
 +meson=3D`which meson`
 =20
- # Conditionally ensure Sphinx is installed.
-=20
+ # On Haiku, meson might show up in a "non-packaged" subfolder instead, =
see
+ # https://github.com/haiku/haiku/blob/r1beta5/docs/user/storage/storage=
intro.dox
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the=
-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/001=
1-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index d04596d313..040931a941 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python=
-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python=
-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From c9f174b2f7b43e59e91f88c75c8b3e2ee30bfcdd Mon Sep 17 00:00:00 2001
+From 70fa360e5bf72b28960747da47d9b85e650ad312 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for me=
son
@@ -29,10 +29,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfo=
undation.org>
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/configure b/configure
-index 84e429409..1a9585e8e 100755
+index 217af781f..cf8666337 100755
 --- a/configure
 +++ b/configure
-@@ -981,14 +981,14 @@ python=3D"$(command -v "$python")"
+@@ -951,14 +951,14 @@ python=3D"$(command -v "$python")"
  echo "python determined to be '$python'"
  echo "python version: $($python --version)"
 =20
@@ -47,5 +47,5 @@ index 84e429409..1a9585e8e 100755
 -mkvenv=3D"$python ${source_path}/python/scripts/mkvenv.py"
 +mkvenv=3Dtrue
 =20
- # Finish preparing the virtual environment using vendored .whl files
-=20
+ # Finish preparing the virtual environment using vendored .whl files.
+ # Even if PyPI is allowed, we disallow it here to force installation
diff --git a/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-d=
etection-on-older-glibc.patch b/meta/recipes-devtools/qemu/qemu/0012-meso=
n-fix-close_range-detection-on-older-glibc.patch
new file mode 100644
index 0000000000..3dfc70dad6
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detectio=
n-on-older-glibc.patch
@@ -0,0 +1,36 @@
+From: Quan Sun <Quan.Sun@windriver.com>
+Subject: [PATCH] meson: fix close_range detection on older glibc
+
+The has_function('close_range') check succeeds at link time on hosts
+with kernel >=3D 5.9 even when glibc does not declare the function
+(glibc < 2.34, e.g. AlmaLinux 8 / CentOS 8 with glibc 2.28). This
+causes CONFIG_CLOSE_RANGE to be set, but compilation then fails with:
+
+  error: implicit declaration of function 'close_range' [-Wimplicit-func=
tion-declaration]
+
+Fix by adding a prefix that includes <unistd.h>, so the meson check
+only succeeds when the C library actually declares close_range() in
+its headers. When the check fails, the existing fallback path in
+oslib-posix.c (which returns false and falls through to the /proc
+based fd closing) is used instead.
+
+Upstream-Status: Submitted [https://lore.kernel.org/qemu-devel/202605222=
01850.1342167-1-Quan.Sun@windriver.com/]
+
+Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
+---
+ meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index cf634dfcd8..a1b2c3d4e5 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2632,6 +2632,7 @@ endif
+
+ # has_function
+-config_host_data.set('CONFIG_CLOSE_RANGE', cc.has_function('close_range=
'))
++config_host_data.set('CONFIG_CLOSE_RANGE',
++                     cc.has_function('close_range', prefix: '#include <=
unistd.h>'))
+ config_host_data.set('CONFIG_ACCEPT4', cc.has_function('accept4'))
+ config_host_data.set('CONFIG_CLOCK_ADJTIME', cc.has_function('clock_adj=
time'))
+ config_host_data.set('CONFIG_DUP3', cc.has_function('dup3'))
diff --git a/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-incl=
ude-standard-headers-for-vhost-worker-structs.patch b/meta/recipes-devtoo=
ls/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-w=
orker-structs.patch
new file mode 100644
index 0000000000..ea37d20d87
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-sta=
ndard-headers-for-vhost-worker-structs.patch
@@ -0,0 +1,35 @@
+From: Quan Sun <Quan.Sun@windriver.com>
+Subject: [PATCH] hw/scsi/vhost-scsi: fix build with older kernel headers
+
+On build hosts with kernel headers older than 6.0, the system's
+<linux/vhost_types.h> does not define struct vhost_vring_worker or
+struct vhost_worker_state, causing compilation of vhost-scsi.c to
+fail:
+
+  error: storage size of 'vq_worker' isn't known
+
+Fix by including standard-headers/linux/vhost_types.h before the
+system's <linux/vhost.h>, matching the existing pattern used in
+hw/virtio/vhost-backend.c. QEMU's bundled header provides the
+struct definitions, and its include guard prevents redefinition
+when the system header pulls in its own vhost_types.h.
+
+Upstream-Status: Submitted [https://lore.kernel.org/qemu-devel/202605251=
82730.4098543-1-Quan.Sun@windriver.com/]
+
+Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
+---
+ hw/scsi/vhost-scsi.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
+index 699863cc10..10e8fbe503 100644
+--- a/hw/scsi/vhost-scsi.c
++++ b/hw/scsi/vhost-scsi.c
+@@ -15,6 +15,7 @@
+  */
+
+ #include "qemu/osdep.h"
++#include "standard-headers/linux/vhost_types.h"
+ #include <linux/vhost.h>
+ #include <sys/ioctl.h>
+ #include "qapi/error.h"
diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/=
meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
deleted file mode 100644
index 524e20a3dd..0000000000
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 475dbdbee7ff878d113f45a1a623e9abbf0e55f3 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Wed, 18 Sep 2024 16:19:37 -0700
-Subject: [PATCH] target/riscv/kvm: do not use non-portable strerrorname_=
np()
-
-strerrorname_np is non-portable and breaks building with musl libc.
-
-Use strerror(errno) instead, like we do other places.
-
-Upstream-Status: Submitted [https://mail.gnu.org/archive/html/qemu-stabl=
e/2023-12/msg00069.html]
-
-Cc: qemu-stable@nongnu.org
-Fixes: commit 082e9e4a58ba (target/riscv/kvm: improve 'init_multiext_cfg=
' error
-msg)
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2041
-Buglink: https://gitlab.alpinelinux.org/alpine/aports/-/issues/15541
-Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
----
- target/riscv/kvm/kvm-cpu.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
-index e06d2126b..e1cc02fba 100644
---- a/target/riscv/kvm/kvm-cpu.c
-+++ b/target/riscv/kvm/kvm-cpu.c
-@@ -1994,8 +1994,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **=
errp)
-     if (riscv_has_ext(&cpu->env, RVV)) {
-         ret =3D prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON=
);
-         if (ret) {
--            error_setg(errp, "Error in prctl PR_RISCV_V_SET_CONTROL, co=
de: %s",
--                       strerrorname_np(errno));
-+            error_setg(errp, "Error in prctl PR_RISCV_V_SET_CONTROL, er=
ror %d", errno);
-             return false;
-         }
-     }
diff --git a/meta/recipes-devtools/qemu/qemu_10.2.0.bb b/meta/recipes-dev=
tools/qemu/qemu_11.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_10.2.0.bb
rename to meta/recipes-devtools/qemu/qemu_11.0.0.bb
--=20
2.49.0


