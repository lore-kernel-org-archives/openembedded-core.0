Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744D9EB48EF
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:11:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52104.1770919866514930447
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PrWXq/6D;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6503562417=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C4p4Bw2144042
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=mwjScj2EK+/RakRhzOEpDwEq3zm8izOsaHcpxQ21qp0=; b=
	PrWXq/6D16jioLVb25aAirqZvUEfCWr5gX/yYbLLnIRiVQ0/2QBulIrZ/mEvO9fV
	89wipCR4Dn+NHDIRteyyOzpItp+XvV38WXXqCSEg/B+vPix9LfYFgxquHnf5gbJT
	0DmVZNF5AHsYLH4XgVLEracETHDMonrK2CH3q31wuJYS7OTDF49ksxK40AhQPZeX
	rbQ38pXX2o+0krpX1iWHB6PwQGoHb2k4ehvBlY1AyWGuqcjE9jr+EZn+6SZj9vbd
	+D1oPxGV1n7mkKvz8rYG3rn6jpMvAdO+SKnX2HdZXugqbwOQ3nKXDuZywvxHqV1h
	F0E+l+QV81Q3Nhvk2k1zWQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012003.outbound.protection.outlook.com [40.107.209.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwphg5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 18:11:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/M3Rc5mWgocWXyzXoR2afYL0sPPnOSU8FlOvBbOOGrVsCZ3YMMlONPTnayXttQsqm5bORnm20OnQaGO2dtpbgOsTFzLgMGUYbTmXks4CcN3kDrECXji+WmZ+PlGZOlJl6j+lDX+tnkwjK4CEoQv4CqundChT9KBumi6+2YjhhHZ/XCQaHGWaDNg0rhne6YspV50unCQBKSOwBxEF8BNxW1apaPWuD6ivStOxXPj4hiX4Q2o0Fsv5mbqCZdhHaobAQ4fDg5yW41O1bKzaKCkLa0MVwcZiXHjLkViUSqrU/OkdkjF56Z+gPmY8PsrgV5g2Ie03Esl3nTFnNI6+C4v2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwjScj2EK+/RakRhzOEpDwEq3zm8izOsaHcpxQ21qp0=;
 b=WMzXTgr9x2PqmNADFqo7CqQI4MC9Rs4VQuGGOpqWJ8LpA2t69ySS2LRhsPKRTstsJiPqZxcp5gd0OGqdIQOur+fopm0NcF7N35TSdQeHFRsWPH6vKEEXdq/dLC9KA1DssgPMau3VaDcg3Tcnq93HfJhvdvRQDO+/dWbfk25xwCb7VuRgOkjBU3/agK9fRZBzY/MQb5F13v+4mltpiciX2saZ29kWiw8pp7AfwmO8FWNic2KB5NJwUcabPPJ+FD2Nvar2+g8dJJSFuTua/mKj/SrdyqcO+BFhbvATBpiagkOIqOE5ENp3PVaP2clbmi5hEEwP3IlVCiJn+cII5/utAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:11:03 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 18:11:03 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, paul@pbarker.dev, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v6 06/14] make-mod-scripts: split `HOSTCC` flag to align with to linux-yocto
Date: Thu, 12 Feb 2026 10:10:31 -0800
Message-ID: <20260212181039.1826154-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
References: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH8PR11MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: b245b660-f558-47bd-77d4-08de6a621587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?69LnN+eaNKch1gThuA0A6JkcbvsQwSgLI/UFbbpUvD4G7zFdIt8PwaStB8fQ?=
 =?us-ascii?Q?+k9xHebXopgr5E3vA3/Kpw+iHZU+ZvTqG9YMOu0gxdQuMez9BhZyxNNEoICx?=
 =?us-ascii?Q?tePx2nHEwxmLS3iShChOEANdHu105kCqAxadI3pFcEk8Wjr25bk2rglrNlw8?=
 =?us-ascii?Q?rGmmyySKR+C96tuGWz1OScUE/KJM5GP2QRlPxAeKF985n7Dw+GbbS+ETS/ar?=
 =?us-ascii?Q?MFNcwrSWR3ApkFib8RrFMerGRCbo88djhLS0v4oZjhQp2hdXVZu1Wh1ImNXf?=
 =?us-ascii?Q?+kt2SLYvemHZRpkxp1L6KyDMT+3/OQ4iBAujzvRmfZb/ZRuIYh1eukNKXlsT?=
 =?us-ascii?Q?SWDeoftwLioNn973TRdB0DBpDUwIu2xRByGi2ljom2ENzX7TA7g3vFXZUC+1?=
 =?us-ascii?Q?pSUfcgIul2jx4lKeuCY+YmuTspgWwyQrPnQcRdd1XFbc+LL5HUdPcoT7ljaQ?=
 =?us-ascii?Q?xA394xj+Hv8X4HNNJ0h8k+UPoDZiBtGtHYQSDhY9h/vEAo7HYEYPatQcottz?=
 =?us-ascii?Q?urwFfcKRFXkkU1vzT+JkHcqrgkWDNN9ZpUDJfZSNdG7o9WNPScjNVVXcJgPZ?=
 =?us-ascii?Q?nFJc33HpnFdEgPkjGlt1g4jZwhuUCljDnBVHHIj3g8n+TNgWhDAuHWG/m70j?=
 =?us-ascii?Q?RnflKKtVpcfy7wb1sv8CcBFLVfN8CgvKVtqrBFA09Bh+Zr+63+StQ9GeLl7K?=
 =?us-ascii?Q?om+cQW/y0evq+g8IygwEYkq/OP86jAfBoezShbcMbdCv/5TpLcRH7AEdp7l0?=
 =?us-ascii?Q?xDOX01V24l6PwtAG8fl5ViLA/neJ0X9XPLjwYd5s+/q4BbFpzDXEBrQdyEAd?=
 =?us-ascii?Q?7XDtXumi83Xib5DSeLGD/qJuSwp1nXA3hEQtU06IeNJLaoxQX2zOMlgD4XMF?=
 =?us-ascii?Q?yLpUavSznXUJOhT/E2meZBe8epjONSlmwq1Is0uzLSmHlav+hzPW8uDXowNl?=
 =?us-ascii?Q?7+nKfBG/UlQycZoqxLUBBY4bvp5bDe+WM9/nWoIhyaPIBfW1zuW5RTrOp8wv?=
 =?us-ascii?Q?bGEU6yeeLXiEHqCz0Pp0F+cO72KUUTCzCvkiaPIMqPtHZ9nMt2g4ShZ2Q1KZ?=
 =?us-ascii?Q?oPdWnIr729AklflZY9TqiGeczrUW+pBu5NKCWUUQzGSRHTZ0u2548RU2f94k?=
 =?us-ascii?Q?DnzRjzjF24hoCb2FVCwJ4zqKtEunsqSU3E93o8/52NLe3aw/n66d989CKN3G?=
 =?us-ascii?Q?HZOwS91q5FoiNjTyEvVw7WAYgDzKPRnkxVQTpMPPftT4SccWjp0ZPwRRpiJ0?=
 =?us-ascii?Q?NPThAPxVCdsXcv41BlBkZJBolOjN9IVAXEG+Vt1OgK/GNKpma1y0Df4Zh3P3?=
 =?us-ascii?Q?8sV9IhXZEc0MYKpPC0q5du3/rX+3BYpYRrN0Vro2VRyHl54qYxYCfJpYW94m?=
 =?us-ascii?Q?SzKD67zg1wSHi0Ajsg9FMbLwWHTR8MpvNNPjM1sxxu0+SS/YT3FXrTO/2Shf?=
 =?us-ascii?Q?ucEkD3WaCNCQ1/BVtixrVOBYfZqKSPisA2Ywhh9co+gH29muKfdSxX+W7MQv?=
 =?us-ascii?Q?/lkZmRrqqBlXMpMWqgNmnWRIO3AFPjEd6Cz8GETGdSZj7Wi9507L4glkm4bp?=
 =?us-ascii?Q?PI97nKXrZB019voz3XXdc7g3dbPoRDaeje7vk6R2EU/2A8k9J1Xy4qa4tTYy?=
 =?us-ascii?Q?mIe8X9Bj8G3gcIEF+iNfJpE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CDz87UfpzdF5+myOSo9+sf8XDBEJmrHFn9lg8AfFp2TUmpEzy2+B+Oor3hyl?=
 =?us-ascii?Q?IZ8h8qXqut8+zecg8p/pdvO7nwFZTkDZpEcEq/UszzQN6ZnIcvgWnn8ahH9+?=
 =?us-ascii?Q?2CLwpHv6X0YsmaxRAMXDIlbunalqrDYYFHPA2AtknMWBNjcocNJXxeuceEyZ?=
 =?us-ascii?Q?T8w9FCRJUCccRDca3YbEZCKsG4fYVqLV7Gmtl/j3bulOypG5hOvyQZyPSpm+?=
 =?us-ascii?Q?QO+SIgG1R+LaIvqOLzEWQj1v7PU61LjeehVRew2el2lAW8I5Vrr+KobQo2fv?=
 =?us-ascii?Q?HSGc+I5fIYrQpyJXLQZr9Sc/RWlWSJWLpbrTiSx9Dw0bbT/5TNGwz9/GovHq?=
 =?us-ascii?Q?fQ4T/tLKNo8if+UYUZTQQF9kOkduflV/NuSF+YYW2jPimym0PMPh2MxpR1Kd?=
 =?us-ascii?Q?1vYl9XP+Z9kR7g+aKBMnefvUJG4MlMUyZ21CWI4vTK6GFE4c6TY2oOdkKT6G?=
 =?us-ascii?Q?5roOMNDZe510h+YJVD2c9UoScPOQtO9+xAiOZBe0zQBMRCDWcC1mUxLFc1Ro?=
 =?us-ascii?Q?5iQMOfMQw10ittRSRTA2Z7Mll8EWH/w4FAcPiTJzzXiImW6YloGtpsetpSkO?=
 =?us-ascii?Q?ji94wNsZNhyfS8tL8QMXWq5s1uZ/obWv07uXXFtxqqDEGvboWJXF5M8WZnMC?=
 =?us-ascii?Q?Csv7oBTa+iAESHvdgtyDEqf1pG0qk+1Bx3NTNyVQruefI4PQ2ps2gp+C+wpn?=
 =?us-ascii?Q?Df5/YStHcP50RAqyl9iH/gHN42c/6PltQc2wGcQk8gTG1Pt0MS44L0gURVjR?=
 =?us-ascii?Q?e9iypJR1UC64w2Qh7ytp4qJXpkYdHgo4JUgBR12/buiI2DgfhjryjxrjKJLg?=
 =?us-ascii?Q?VJRKw7zmL0WVH/ROLIWrpTbmsDcJ+b07ngAl4R5QPRfs4hziSw2gciy32YAR?=
 =?us-ascii?Q?R1jKMjJsdvWIJIlCCjGQHKpotoXJR6AwxywimGGPHGAsu/CgZyoYnvB9CjGD?=
 =?us-ascii?Q?3nmP5qL3M0i8jGS26pEqwmTmVoS8/Jak0l5nhykMq6NriiSVaB8xtfSFM5eE?=
 =?us-ascii?Q?6X090bPTLIol6B9eWjk2WAUkX09Ng8Ji8zloyzR+wwfQ29FZnleTHbwhAz1K?=
 =?us-ascii?Q?Eefc5riZx83dRDPQryS4EAqK6PkuVXqCLKP4EZb4ExDYBAuooKBftEfbkr/3?=
 =?us-ascii?Q?T0Wwmqq60cj2B11WZn4/QnF6riIdihQGrIGG7ET/CqatAXD7ai0VY0oOP2xs?=
 =?us-ascii?Q?Ehv7TDDFsQMAO1gP+Kzbo/y88J1PTu1woGHjXdsfVJgowb5YODbvZFbusC1q?=
 =?us-ascii?Q?m6mKUs3L5IUcqwBCmF0usp8Q7VOEAlG6eKaIsHgwg1DQabsLXQ2L57POiNS8?=
 =?us-ascii?Q?pZj2YK4Zoi4GUTgZmamHZzPctiYDa+3yv4p9Z5fV8QILpQnzOlMXLxtAb+Ij?=
 =?us-ascii?Q?x9/sxdh7WbfopLxxsDmiwyEGZ3xuihRAP1IExOYyG/uO9lBj8VXp/5NEVz44?=
 =?us-ascii?Q?p+6g5Y22QBoiHGu4NkzvmDS4ZiMEjWU5lCukLf+yF8M1FZAhEiyQwVOVsKtg?=
 =?us-ascii?Q?zao6znMvFxCjVI1nrp3Ei/kc8Ievs+j9i091xvsofEwXQ8gN2Kh84p8c0uWD?=
 =?us-ascii?Q?aVs2zrT4WSnj1mmCvAn+XEjv76XuukmhlpfSxkJjjNK0/Eh9jYwbiU3MmqVF?=
 =?us-ascii?Q?/YV54rkUN1XiwweABmgHjVPPn+Y3RCZ5WA6Pgz3ujK57fB11pnL1u2Z3LXZX?=
 =?us-ascii?Q?SzUb1afeJrdFXLK3m9kYbcQnXCUu7zRwLWo0AecMngBHMOEQDgyLH7HHYkmW?=
 =?us-ascii?Q?p7hRXgEoSsORz5BTBawCtRAbDH/ZAe0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b245b660-f558-47bd-77d4-08de6a621587
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:11:03.4678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUfDfufAdbq7vIKUrS1VKE1RfRv74XmrRHVWB1f5fUHVr0a7AVfJxLx3UzNHuV+H37pckaRdZ+3pQevrlcry/kzrLDzMhwerlkFYHLdEnGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=698e17b9 cx=c_pps
 a=9H9ADJ10uJ0pYmVeXPB43g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8
 a=KVLK08duqDOLNOE2CNUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: VehUUq9QHwRuS2mLiLOpF5Al4vLq07YN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0MCBTYWx0ZWRfXyXf/3afaguve
 T45R0XmWhOYkk6mBwdo+mHj1alGBRtOrpqqBW0bRXPp08iOrUGgk9DzvfZjZqKz/38/7S4JTdkc
 niQbNAcU0UtcMJw9CpHGxVFLNY0mEX1neuCw3ieNPOWCuWsv2STX/8jLeR8WXaaqWxmfsINC46U
 2MjLkmmqtwSy3WRHU27HuD1TPrSes//NmZtlSez9hEnUd7DbVBKZ/z/Gi8GSFKdQBfHNAmXyig+
 v1xBAuWGlbq+FZqD82k8tLpQ35Cj3ak9ok2wNv6rmNJGsUcYvgShPnF0FAO0cvGpR66mzjqK5nq
 5XrupyN4MRI6FDsc0iwVIX1W2hOkqACHu6zyeOgscJmzRz1tsGfYh4Vfu03TH2w4rQ3vXGF6qMA
 lBjt0DcM4MvChHrA3FQxAffPDCpgtowcGZUEVHCt03srdZ2oAaa82XZvELGS62n4TUhwwWF9SwB
 M3PPN9vyViUyVtsm23g==
X-Proofpoint-ORIG-GUID: dsp0KaRaSsK8NAZt0SDClOcGE0bIojcu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:11:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231062

From: Harish Sadineni <Harish.Sadineni@windriver.com>

when compiling rust-out-of-tree module recipe 'make-mod-scripts' failing
with the following error:

HOSTRUSTC scripts/generate_rust_target
error: Unrecognized option: 'i'

This issue occurs because CFLAGS are being passed to HOSTRUSTC.
Updated the flags in the make-mod-scripts recipe to align with
the flags used by linux-yocto.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 8fcb5e6eb3..874e16e642 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -18,7 +18,7 @@ DEV_PKG_DEPENDENCY = ""
 DEPENDS += "bc-native bison-native"
 DEPENDS += "gmp-native"
 
-EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
+EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
 
 KERNEL_LOCALVERSION = "${@get_kernellocalversion_file("${STAGING_KERNEL_BUILDDIR}")}"
-- 
2.49.0


