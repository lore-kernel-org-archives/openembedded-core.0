Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF26E67495
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 09:39:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77325.1766396338102889555
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 01:38:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eJU+ikJU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4451276127=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM5cgbm641354
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 01:38:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=DQrclou62
	jUXBVIZYaddkY8FaQzYr69E7E5LEeF69Cc=; b=eJU+ikJUysN96mg+9x7NwUUZ3
	Uw7hgHgOCXtvzBbcjhZnh2b1CJSmLVeDbDJbwgyMHReDw/gnMDNXfkByNQTT/wAX
	kQsOjoUdlSn9kbyuWUIpNwDM41xTq3oP7mj9b/jBLXXV0GF0rWfasywZffu5d2H6
	yOV5EI4spKq8FBIwlVIqhQa1lPrnwwkURcgkFCj2My2EcQNyfJSD1yBPP+F/ePfU
	aZWCL17GXhG8IvsdvboESYB3kWEkOf/snyUtw66jYgFuobWuVc9rTh8vVQ1sSqGA
	JyXqkmvEt0btEsc0rqa2GfedwgjjsQbw5ulHSTTTNvSqNuo7R83/xLu6uXIBw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012036.outbound.protection.outlook.com [52.101.43.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5v6h99kj-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 01:38:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVPOBvbjbRn9V4WDKHiHF+MdF3BH86zF5Q5XiEk8PW/zmIbHoK2EkeaAltFE6YYxGFvIYXIQMpoflWCJPwtqFnyK5EmYxPQS4mYxCmT9Op8csGm0yWEETQ0STll26J1DmizU41VCJAO3swlXs37shmRmnRY3/h4cuIXBhP3Llm0CYHEsiI5VsPgFTtRpKlO2yvQghelrBJcuGOcFcLkfY6KFZp6dIBtudQCIOmz51Jdo5/xOTHArs+a3EJwqylSzzXAisWCwEzV5vLVaHRBNRnNrTx6uH5sku7J1MjJND0GPp8IZ2SJB8IwsjZIwJpcrc5JV2LeFffdouVlHXGaueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQrclou62jUXBVIZYaddkY8FaQzYr69E7E5LEeF69Cc=;
 b=qbsXTjT4ONIXexqtNP2aqA0Sxy/PcsRGreKbDJ05N1h1V5vWDK9VZ+ufMJijjjU6fGU6tx+NC26v2/djYWturHPLp2t2RM/oAB71xYypaoptbnk4m1D3IoLFdIeg6GkiCXkP5znKzRRZeLwxtQeSM6zxjrvdIgyjIGiNMol6PIfvLtmfXn9iouzYqf66IOX9kxSAdUVt1GyT4Cdz/AXIpWV0ahjj9Zz9fb87Q5383zOjLg49RbL3pyjlDqk6s7iH40WLL0SVc46BFgeplTtyDuZsWVh5G471i+HHgS4ntkADLdo/39ANAoJtrCazhRLPEXoS89Xm8AuXxSRHFkz/CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH7PR11MB6547.namprd11.prod.outlook.com (2603:10b6:510:211::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 09:38:54 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 09:38:54 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, randy.macleod@windriver.com,
        Yash.Shinde@windriver.com, SunilKumar.Dora@windriver.com,
        hemanth.250302@gmail.com
Subject: [PATCH 1/2] rust: Upgrade 1.91.1 -> 1.92.0
Date: Mon, 22 Dec 2025 01:38:29 -0800
Message-ID: <20251222093830.2658141-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0044.namprd11.prod.outlook.com
 (2603:10b6:a03:80::21) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH7PR11MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: dbca2972-fea9-4d28-053b-08de413dec4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+20NYBFcHD6IEwXpIQ08g/TXpJTpuzBOobKJpwsvcwKaoj6zySYBFtY00qrd?=
 =?us-ascii?Q?zJFfUbyTJVtpTvaCM9615mpd9IysxIROrJbc+2Zy7kjxjn8UpOH/Y0yZBOcu?=
 =?us-ascii?Q?GvsCRNp7oal8g+CfWBuv9d9NtowUhnYohAoQxcbZ07ndC76qTwNhBf+39SHd?=
 =?us-ascii?Q?2dS9ucECRNOfgX50qtdM0kUoZAweYlmMvC6Q9QvxRAMCdT8yyoQhLK960G39?=
 =?us-ascii?Q?veKIwKdj9lBjeeAjReUJbMF96xebIOjz4UtDEMjVbIMMNmcgWBDoXXWVXeFn?=
 =?us-ascii?Q?cpwKtF+sZmnyF29415Am+hjWn/OZUIVfs7zKec63CXLhxEq/1Ndx4P4YDbTX?=
 =?us-ascii?Q?eqbz8BLRcheyjkFT2hAejlduAw3M8ZK2qAQuflQ7IDV4anj0AjYUXLx1XeDe?=
 =?us-ascii?Q?s+j4uH6ZtskEALyd7dH2PyhVNhENttPxudMu0jLhRoF3upiyLvgXYQV6xmHQ?=
 =?us-ascii?Q?aMwrlWSo+27UVxtkvClHpzUjOfKjTiKZZHytAFFWehl2CSv4sgFV3YKN6TYN?=
 =?us-ascii?Q?ejvXpby7K+jLHoSOfjTuYLPqwHqaRZJUmv20Pf6jwahdJYtLCV0KpnR5XMXb?=
 =?us-ascii?Q?Bj9POuNuPodCEHRHLFP/Ti7hqUnz+yTE6miohhzVhFzJwwOwUl+jeOrjWK1W?=
 =?us-ascii?Q?NldvvcdwbKPUIeTe5bNV38W5AmRLTVay06MUpxoOB6wN1U0qmnwJnKhg5B/p?=
 =?us-ascii?Q?j+s/GduOrDZ/47CsBPwHqxvg7bA5iV+zvsNZinrTU5sdiadESbZXfKUstR3f?=
 =?us-ascii?Q?Ejfpn2SKtCUoooPBmqd/UNyXcJd3VSVXHmYgvTDvU3GUtcvULMs5lXJk57k1?=
 =?us-ascii?Q?dNYvdv6vU7Kw+Vw2D33g2+7pA7LeXkGoTmFiQD2Ixo85cWOg0nQ63vNYvA5y?=
 =?us-ascii?Q?rqiTVoBoSHgMwnBYRkmylkYlfqSGN3azPkocAogIwfZifhznoLynSnySgo7C?=
 =?us-ascii?Q?BELWbqerD60P4FTfSzWAJzQpCo8ONygodPeg5VbFaBGprxS8YTXBsQilzr/A?=
 =?us-ascii?Q?eo9zjHaf9PX1zbt15Yc05YRFH0ocknITmNY79eoTdBqAyQtGtGPf3N4gBGwk?=
 =?us-ascii?Q?2laHkOgGvd2K4/DCBkuwWy/SsME+7gmho775JJf93qGE7KLdwb5J778jFLO3?=
 =?us-ascii?Q?dZhvgDZAc8z11bqaXQsnmSuMqF9yebfWXkN5chV2ltc2Yrtbw9Idni7QT1PU?=
 =?us-ascii?Q?Crf+wNlbIykxRrYrLUtxc8l3btEXqx0OOM12NUrvedWeEfDrYDpuPpOh2z9t?=
 =?us-ascii?Q?hcRF/uuyTPenrD0dTVSt3KcGcU1L/4ysypliRS/xJhW0WxRqJ98E3Lh81txy?=
 =?us-ascii?Q?Fy5eip2W/mKEkv+Z1TmxEBTn8aWIeRYFSGEj6wXgqE8plVboTUXWbhwJf4dT?=
 =?us-ascii?Q?zUQN71rQf01hMdHQQLCQsEJ+60tvYbgKl9lnrCV+n3P31qpO6k5iFmcw6cge?=
 =?us-ascii?Q?dVz/agHQQsRmv5OsHR8qv96yh94O1+hTBBPCB4bNLRFTRE6uxeJUMw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?awwL4aDBdCsvtxuLqSNvADMd8Cjw13gsbs5UunvaEVoBiS6fp7GJrMSLRtvW?=
 =?us-ascii?Q?f/qOg9UzzutW5QxNb/EpTgtJdKJqb2b2NuFHJs4wKNqGbVwK0MqrYrDRHFBy?=
 =?us-ascii?Q?pbE1sOkzVJQxTFll4uDLTuSJigKJcvQySaLyUk1c69ziQ8Brf8YSywZQc+bE?=
 =?us-ascii?Q?C/2SwmKjvBv5eaM+zWyBPhdpoDI59Rt23vATMYpRpmuf6hQYzPuTQTz1CstT?=
 =?us-ascii?Q?/0TYiax4WSc/Cv5xkhBFH2h9/DgESv8RO1Mv2j23+HldFr6qb6wbRhTjXIKw?=
 =?us-ascii?Q?ZLUV+YUC1md9SPwdD4S4T6YWTQ/5ZOQEI7bNdlGjsLwmM6+oJp/EI4i7d2xV?=
 =?us-ascii?Q?5I8D0QiOtkS7+3aTqrAcDKZqalLkfBA4VIZgYCM9iAsa7NIaLyNE4W8c0U+5?=
 =?us-ascii?Q?Apk4SwpnvSfX2ZMszfwH51MXLNR6MTsOtS2xk0F1diex9yQOb3k7rP2yTMje?=
 =?us-ascii?Q?siy0Yd0jQT0Ik0s4ZcHl4s0oWJgCjl2Dum58sOmK7WdPFQWK0wVenaPMs711?=
 =?us-ascii?Q?aZCszoRrrFARq76Qa5YLZMon4NSNQfTxCcTLVFHOY9e7Sk3eQlMO4JyvLzeF?=
 =?us-ascii?Q?7ob+es6bMgI0N1OzCw3qAPjcd4ZTgZR2SBPdm2DSTAND/+jOQonl8FyMbIiC?=
 =?us-ascii?Q?aDfbtIqYoSmLAhhHsXntedJbeC0DAk0BTJYFydOTKME14HNxj1JAF7iDhCv4?=
 =?us-ascii?Q?ZLwHlOXl0juuicytsGN2YioZ/h4cMPnl+yrX8FJzsjqqwWMOcUslhWJ88Nv1?=
 =?us-ascii?Q?/H43No07q1VQhLT028s2Uj5jks+wce/MS7XmHIrNpko8hAMRzsmUz535CV4Y?=
 =?us-ascii?Q?SxguIpH/Z+XK827gZ8SNYWhKNet8XEELk4axbZIFagEqOH2cfyjG5+c+9Kpm?=
 =?us-ascii?Q?rXr9JqHKJuv0eEkY70mAU2eHC1gyDAM4jYnxYJhiiStHa49sIgN2zWzxNppg?=
 =?us-ascii?Q?Qh8xrOsd+ZxcaadxazTHcxyV+WNYyDgRu0PGnAyPCQsBldpsBSOJ4Jmh97K/?=
 =?us-ascii?Q?yBjuJw4auV4d4DIW3eBiYnafikOMi85MIAvhLP3+neYY4XiGaECl51fvFHEs?=
 =?us-ascii?Q?1OJNkA+sQalFAdQJXjzHNkQt8+0HeJqK0ucf72+LWRogByS6EI+3ykQd/7GW?=
 =?us-ascii?Q?Q/Zbyt8FYGadTC0WIUj+uK0uVAKLaHUs+pMXA1xdcjpq1gBQHKmDG/L5gaT+?=
 =?us-ascii?Q?pnkP5WZpBgcQRybA7lK5qad7B84vPCAZbP0LR0stEovo5HR89S/YAZdp1G6M?=
 =?us-ascii?Q?tysipEPHFciHORJbKfpiy/qbGsppeJss6DCOiO+FyG/0ZsEYintDdKTR9Qfp?=
 =?us-ascii?Q?pnklDSbb15wTbfMARJyjJdDi5MI2l4OHM3Mzqi88t7HKzi2b0Djf0FkERo4q?=
 =?us-ascii?Q?ZLzPG2gBGje5LbI4oFHWmQkfkWvcBgSXRE1RQ2R1DNMtEW0G6qOW8xxSiIxG?=
 =?us-ascii?Q?2CSu2IBDf/eO3AFYFgeCfxJNbU2vYGyvw7qocKei5oBVV/L9RyLWAvJsJMg+?=
 =?us-ascii?Q?7IbYMz4rf7m9aeAFv8KiUGak2l1bu9WZfF1BTvQAxi1Kb8ELM1O9Qr6EKwkc?=
 =?us-ascii?Q?ObM4JZC+SB7VmNc1+lZ1lABsUx+KuXQXRAU4XsE5Kiw4yMJxue4zS6KnYPye?=
 =?us-ascii?Q?bf8btmdt+SW6mPwiU/OXZWCZvraLHH3yultWHWCpj9Zno5pUOFnnLIUyhiq3?=
 =?us-ascii?Q?JMVKv6cmW1c/TJ7qIQXFe7pZyonEd6ksreHvPJaEcKDCtYVG0XDaQQF+6f4t?=
 =?us-ascii?Q?pr3spx/yDoFIsxPZrZlAx0AhuysLwDM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbca2972-fea9-4d28-053b-08de413dec4b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 09:38:54.7240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YoyxcUDQ3HSm+1MsiN/OaEnxVj9qrJcQgpkWap9QOYeg/gpcYmUZRXZC4z6njfcNzAEfDeLnCKkea4HDNxgDQMOtALIvjcPKiqOrEJY/Ecc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6547
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4NyBTYWx0ZWRfX7bN0Jf/vnudm
 aXRP7/gxcSz1V+44ynNC/hBU06fEjWFIzPH65CS5jzhjr2HKrj96FyGSHriukiCHOnBQIJKcnSY
 wKR1AyNa157CiH4FD/k+wqKJRPvxa/Zf4QrI++a4ukL5yuVl0az2Q99jT3Cv0vYLy7CzTLRYA2z
 Z4ty2FcDeVEUhqxCfUN0Q0mqT9awK7OaujLxgsVjFxBjX2MLX4vF2097h6Wsi4uWfgbZvJ6QKlo
 VdTk3aGGGzD5EvbWOrWx8/AdGJzo2gioH4FqrjuPVDh9JjyTzvG3g/BTVEquC032+jXqZ6xhQf0
 ya+TcTbAUmYhcEVrXPO2jtnk+sgsTHvy4fw1LSMwpC1cX5FRgEgZtoQaPgfRvCnulE6n+my8PGq
 8i3SVtkLIBF59qvggQDOzTJ8SqB8o5UYfyU+nYIZeCKg3lUJ3pRZpDmHQvErA/jlaxtlmB6Sfhm
 C1iGUZJLIYpgLpvS0aA==
X-Proofpoint-GUID: NVxEUMWEeZyvYZbAI65-O6D823vZ8Stx
X-Proofpoint-ORIG-GUID: -gW11N8r_AaNXTxWOpnyAXH7t3vIVWG8
X-Authority-Analysis: v=2.4 cv=KYffcAYD c=1 sm=1 tr=0 ts=694911b1 cx=c_pps
 a=0Wok1Aa8RnZXRT++mDYMDg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=n_4-LGRzcWPtD1VaMBMA:9 a=p9HOmKsSWF3qpMQX:21 a=ocp33sKsEv4A:10
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 09:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228290

From: Hemanth Kumar M D <hemanth.250302@gmail.com>

https://blog.rust-lang.org/2025/12/11/Rust-1.92.0/
Rust changes: https://github.com/rust-lang/rust/releases/tag/1.92.0
Cargo changes: https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html#cargo-192-2025-12-11

Test results summary:

rust v1.92.0

+-----------+--------+---------+
| Machine   | Passed | Ignored |
+-----------+--------+---------+
| arm-32    | 30,317 |  1,687  |
| arm-64    | 30,426 |  1,617  |
| x86-32    | 30,335 |  1,664  |
| x86-64    | 30,587 |  1,414  |
| riscv-64  | 30,426 |  1,617  |
+-----------+--------+---------+

Test results difference (1.92.0-1.91.1):

+-----------+--------+---------+
| Machine   | Passed | Ignored |
+-----------+--------+---------+
| arm-32    |  +349  |  +177   |
| arm-64    |  +516  |  +170   |
| x86-32    |  +264  |  +217   |
| x86-64    |  +358  |  +167   |
| riscv-64  |  +281  |  +145   |
+-----------+--------+---------+

Note: The increase in ignored tests is not due to any additional ignores added in OE.
These are primarily upstream-defined ignores introduced in Rust 1.92.0, likely due to
architecture-specific constraints or target configuration differences. The only OE-side
ignore added is for the no_std simple-runs test on 32-bit ARM, limited to a known upstream
issue (rust-lang/rust#146996) and can be reverted once the issue is resolved.

Signed-off-by: Hemanth Kumar M D <hemanth.250302@gmail.com>
Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../rust/{cargo_1.91.1.bb => cargo_1.92.0.bb} |  0
 ...ibstd-rs_1.91.1.bb => libstd-rs_1.92.0.bb} |  0
 ....91.1.bb => rust-cross-canadian_1.92.0.bb} |  0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 78 +++++++++----------
 meta/recipes-devtools/rust/rust-source.inc    |  2 +-
 .../rust/{rust_1.91.1.bb => rust_1.92.0.bb}   |  0
 7 files changed, 41 insertions(+), 41 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.91.1.bb => cargo_1.92.0.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.91.1.bb => libstd-rs_1.92.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.91.1.bb => rust-cross-canadian_1.92.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.91.1.bb => rust_1.92.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 20acf3524f..c6e00dea5e 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "15.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 GLIBCVERSION ?= "2.42%"
-RUSTVERSION ?= "1.91.1%"
+RUSTVERSION ?= "1.92.0%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.91.1.bb b/meta/recipes-devtools/rust/cargo_1.92.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.91.1.bb
rename to meta/recipes-devtools/rust/cargo_1.92.0.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.91.1.bb b/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.91.1.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.92.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.91.1.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.92.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.91.1.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.92.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
index c6f9031e65..4314734df4 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -4,56 +4,56 @@
 ## The exact (previous) version that has been used is specified in the source tarball.
 ## The version is replicated here.
 
-SNAPSHOT_VERSION = "1.90.0"
+SNAPSHOT_VERSION = "1.91.0"
 
-SRC_URI[rustc-snapshot-aarch64.sha256sum] = "4e1a9987a11d7d91f0d5afbf5333feb62f44172e4a31f33ce7246549003217f2"
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "4952abb7d9d3ed7cea4f7ea44dcb23dc67631fae4ac44a5f059b90a4b5e9223f"
-SRC_URI[cargo-snapshot-aarch64.sha256sum] = "bd8d1da6fe88ea7e29338f24277c22156267447adbfc47d690467ad32d02c2a7"
-SRC_URI[clippy-snapshot-aarch64.sha256sum] = "1a7f969c5712c17d960d6fba8235b33f264a9484b369dc388766a540f1ba464f"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] = "f3ea3c964b7f3b884337f2d411764032bbd1722d7f55592a547cbb29afd87c03"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "ff23dc81f796d64e34e866a44fd0bcae726e34014835369b8f9393a544167eca"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] = "003d7008219ca0d225ad1dfa301f7c079b123499430ee0780c85782e0878eeff"
+SRC_URI[clippy-snapshot-aarch64.sha256sum] = "a5f8bd961fb30962144d2f68be0bdd1014cf07110323087b0d6a68251a7a4eca"
 
-SRC_URI[rustc-snapshot-i686.sha256sum] = "3b33cef77f9a57d592beb5117d933134bc76258006e6d4f9aed2969d20c75742"
-SRC_URI[rust-std-snapshot-i686.sha256sum] = "dc4bffa768326e0cc47d6b129bcb891af6e7b7bf09ec92bca45e49420b9837bd"
-SRC_URI[cargo-snapshot-i686.sha256sum] = "c1e9b24bbfa95550b5dba9de2045a4c906bea108625781758692b2a407428391"
-SRC_URI[clippy-snapshot-i686.sha256sum] = "3e902971ef6b44ccb804af73aba5dc8c6199ed09a76f178b0eed6f53f7f56eab"
+SRC_URI[rustc-snapshot-i686.sha256sum] = "bf718b184d6ace8fab0012835d129130a6dd6a8d78f4f742ae9308a86b96dfc5"
+SRC_URI[rust-std-snapshot-i686.sha256sum] = "059fe4b9802c3cb64b539cc501ff5e64f8d750573009c3004fd0b583b3f50d39"
+SRC_URI[cargo-snapshot-i686.sha256sum] = "92486e31c070667681328ad57dd3bd4ca1e3d37958540d622b2afda9b67fbe3d"
+SRC_URI[clippy-snapshot-i686.sha256sum] = "14cae2980accb8536ae700bb7ec6a3b540a06d84e7a4c71db1c7f05a17b1edbd"
 
-SRC_URI[rustc-snapshot-loongarch64.sha256sum] = "aca7ee7f0d98e34dafa367cef9c35626d37cf8334f356498aa2bda2fc02206b3"
-SRC_URI[rust-std-snapshot-loongarch64.sha256sum] = "cb779575cec151223c3c144bc9ca957530fa510e36b32bc9f35bbb1b7dde9e2f"
-SRC_URI[cargo-snapshot-loongarch64.sha256sum] = "6ae37dc8eb3ff4655053a39d5f973613a82a8a8e2fff42c423ca33d8cf19e6c1"
-SRC_URI[clippy-snapshot-loongarch64.sha256sum] = "847b3d4bd3d2be23bafbb90cd2ed5e1bf1aacb2e7152e7d2f99bee1078aa0eaa"
+SRC_URI[rustc-snapshot-loongarch64.sha256sum] = "04bdbb954f48fcd0b125fbddbf3e59841ec81c58ff858471f7977c8343d9a73c"
+SRC_URI[rust-std-snapshot-loongarch64.sha256sum] = "cb0c3c2704add4d1271713ff87e1b7a8a4f756b4dc9f580b62953532efd0f7b9"
+SRC_URI[cargo-snapshot-loongarch64.sha256sum] = "9437727091d30d73a987e2c56463a2de4f01fb69cfd229617e2f8a7d8de5c05a"
+SRC_URI[clippy-snapshot-loongarch64.sha256sum] = "060a0eb3ee236e8a3bfb2cad9495165d755ea60d32e62ce85f12ad17c26afedf"
 
-SRC_URI[rustc-snapshot-powerpc.sha256sum] = "c5d898ca92063d634011525557f2acabc65d4ea268022e7005f99b6ba917357b"
-SRC_URI[rust-std-snapshot-powerpc.sha256sum] = "756d1bbd66ebb0d4d575b650a8a94d52546f6892bd2f864410411f6027ed879f"
-SRC_URI[cargo-snapshot-powerpc.sha256sum] = "5b160a2bf0e6f470b83c5988db5b6f02b6d65d3d97a9b965acbfe940b4143b34"
-SRC_URI[clippy-snapshot-powerpc.sha256sum] = "42ac7480dcac12a843803f5ee398d2a42389359178774cab20c66eda4f6927a5"
+SRC_URI[rustc-snapshot-powerpc.sha256sum] = "c625de10cbfd21031f71fa6fdd50ccaffd449744614ef1f57ee3cefe80c57792"
+SRC_URI[rust-std-snapshot-powerpc.sha256sum] = "d5ecd84b78eefaf30fb65ec169af1806bd06d0b5bbe166bf010b058c9c59d27f"
+SRC_URI[cargo-snapshot-powerpc.sha256sum] = "1f8f0ac1b05acb7cc50592ca39ec78e374093a0701405e8ea1894bb64a7422cd"
+SRC_URI[clippy-snapshot-powerpc.sha256sum] = "425e5a1a72cc20c476416682cb5df4222c0b9c28fbb9818d4d8f505ccea578e3"
 
-SRC_URI[rustc-snapshot-powerpc64.sha256sum] = "7adbc3c317a73b7d504e171d65a2b0e93953e3e572dab99acabe91140101f81d"
-SRC_URI[rust-std-snapshot-powerpc64.sha256sum] = "16daac5dc6994c03ab3b8c4e6e5e52c41f5fc5846acea08f4fdf0759cc273aa2"
-SRC_URI[cargo-snapshot-powerpc64.sha256sum] = "fdf90d22476c88d5b9cf8a3ac0937d0b9c6b7dafbf6b3afde369c2f5b8faec88"
-SRC_URI[clippy-snapshot-powerpc64.sha256sum] = "071e06a50d5b2975905bb2d6211f2d2372ab0dbd50b7b0097168cb64e77a4bb0"
+SRC_URI[rustc-snapshot-powerpc64.sha256sum] = "139a077f72197ce73031dae7cd2156fb6718b09fe9a3f4008266d34fb8d09ae6"
+SRC_URI[rust-std-snapshot-powerpc64.sha256sum] = "ac046a72a957bf9fd1213e95d46d7ca431a6704f63e99c759ccdd9ae7c07f7d9"
+SRC_URI[cargo-snapshot-powerpc64.sha256sum] = "abc14cced999e0d5f0ec75f10af33998dcaef39fab27b8e2c63b93ca0b79f2ab"
+SRC_URI[clippy-snapshot-powerpc64.sha256sum] = "b8129667c5b30963698466b7edeef4c5a1c869e78b5f9218fcf1426defa5cea9"
 
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "e87b8eb926a65211a99f6712ff376c5950b4b11c67ed7f92019da27a34ae7085"
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "eac29f92ccd335c51553c362c7a6d3de2eb7071b5ae3839470e351a6a3ebdb77"
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "f029151dfeed6570b8b347e04a5bb7dcb9c59d8e5454c535c05bb5069c216354"
-SRC_URI[clippy-snapshot-powerpc64le.sha256sum] = "12d19dbec34c5a35cd285fe74dcd0226563c0b25be5d041479744060e9374c98"
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "c526302dcf4f1627525b0eef3ef4181bea801f119c4a0963c3675b390cba164f"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "c79c071fd14ef094c1a2e750f19795e7e162f4237bf92299885c0d56fa6017fe"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "704bfa80ffeeafacb8f13043873e20e1b9c4a5e785ee6c5e7d0e5828fc1f0c8b"
+SRC_URI[clippy-snapshot-powerpc64le.sha256sum] = "1571b18b39f97d808b9f10ed2697b9d87bc3959abf858bfcd3baf9eaf8d5d548"
 
-SRC_URI[rustc-snapshot-riscv64gc.sha256sum] = "11ae522969c6b18ad4b5a1ae229473de59406af7ab2e831acb43ee247a16b58d"
-SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] = "675dc5556d9d879101d2401b693fcf79edac8f00a49249e2e0f19cecd172ce51"
-SRC_URI[cargo-snapshot-riscv64gc.sha256sum] = "8a09de014f7cec749b338c6636d190a1b73fd377bab6a223eb715d3c76c49e79"
-SRC_URI[clippy-snapshot-riscv64gc.sha256sum] = "02338e25b3d2b61d9dbee7bee4c9ed148f18e2d010c6297ffd36df98042f41a2"
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] = "7c3d4ceaa630ddb45bcd538c687637a349b2c3e18634a2b944178a7b4b42a4cc"
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] = "7486237c83844d48ac96b67241ef0c1f4f702ceb74c44721f6f8660c3068dede"
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] = "8946ea952e5a516e8bb6fd859d9798902877e01bd4508b717f8b9fd915019ad5"
+SRC_URI[clippy-snapshot-riscv64gc.sha256sum] = "97feb6d6b2158b410a83c40d7eeba1e97220e505eae6666aa09d112665cc8dc1"
 
-SRC_URI[rustc-snapshot-s390x.sha256sum] = "274daef5a69c8812411248a4afea4f58a096c978dffba6b1198da8e3b5a02de7"
-SRC_URI[rust-std-snapshot-s390x.sha256sum] = "e3e7e3dbc65616eebc69e642d9042363ec38d7f50393ef816cc5238ec475f3f5"
-SRC_URI[cargo-snapshot-s390x.sha256sum] = "468ace270ee4edac0a10185ea876ea555e41bacc0137ff08985d2155fe8cc777"
-SRC_URI[clippy-snapshot-s390x.sha256sum] = "bb0a9483a36fdbdab08b433613b374c036779d247a8d508e31265193c3759a8d"
+SRC_URI[rustc-snapshot-s390x.sha256sum] = "073c3817f91ff425ffa141a6db215d54b50db5a8abe08fed593b7597687bdf94"
+SRC_URI[rust-std-snapshot-s390x.sha256sum] = "454ecc9a53dda63762f3d1d92b7e4f4459c58c89d39a4178cce1fd9fd0ce09b5"
+SRC_URI[cargo-snapshot-s390x.sha256sum] = "3af10597a739402d6ecb3db85abaf62e12f7b298d2df6377c3c80e09a54f91b6"
+SRC_URI[clippy-snapshot-s390x.sha256sum] = "8d3bb8aa79abcfe5c24a37651d09dd356f994663699e65e7dd9978514a5ebf31"
 
-SRC_URI[rustc-snapshot-x86_64.sha256sum] = "48c2a42de9e92fcae8c24568f5fe40d5734696a6f80e83cc6d46eef1a78f13c9"
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "663f4ab7945b392d5e5294dec1b050a66820a20e86f084ec37eeb0f2f7ff5569"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] = "9853db03d68578a30972e2755c89c66aec035fec641cf8f3a7117c81eec2578d"
-SRC_URI[clippy-snapshot-x86_64.sha256sum] = "5b6466419693a05365827378145014a37ae74fb2948fab390d5210a524792ed8"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] = "a7169e8cb6174af2f45717703370363d8de82ce55f6ccba185893045b9370874"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "89e6520b16c12b43526440298d2da0dcb70747c5cc2d0b8e47d39b5da9aeef49"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] = "7103c03fb8abe85b23307005a9dfe4f01c826a89945d84b96fa2d03fd4d2d138"
+SRC_URI[clippy-snapshot-x86_64.sha256sum] = "0087c3d58d2fdeafa89830c299b1026c9f981b49835db89c922b3c6a299b3225"
 
-SRC_URI[rust-std-snapshot-i586.sha256sum] = "46eab5c41bf9160a31a53560ff5fc43308c0998cde952533e76fadef66799553"
+SRC_URI[rust-std-snapshot-i586.sha256sum] = "47e91cba208b1f87348e7b6a49274ebb4364651a4191fa67e6850e7813e26ad5"
 
-SRC_URI[rust-std-snapshot-sparc64.sha256sum] = "c204ecb424090cc6c0100cef3013f8636d29f288db99c037578aee7d2672a711"
+SRC_URI[rust-std-snapshot-sparc64.sha256sum] = "4f7bffb09cf5a0c25dda9b51811c60996eb1ae06a277c1e836980c21b3a44766"
 
 SRC_URI += " \
     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index f714487428..d7d44510e4 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -9,7 +9,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "66401bb815e236cc6b2aacbbe23b61b286c1fe27a67902e7c0222cfe77b3dbab"
+SRC_URI[rust.sha256sum] = "ebee170bfe4c4dfc59521a101de651e5534f4dae889756a5c97ca9ea40d0c307"
 
 RUSTSRC = "${UNPACKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.91.1.bb b/meta/recipes-devtools/rust/rust_1.92.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.91.1.bb
rename to meta/recipes-devtools/rust/rust_1.92.0.bb
-- 
2.49.0


