Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E50CF3972
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:48:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11852.1763570910077239473
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 08:48:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZT3peMmb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34186f8fde=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ802lE4105773
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=SzpJLlJs7HVTWmKmcPq65nq4JyUeWCDRN+XpPHfSm3M=; b=
	ZT3peMmbtlEYPC6giLJxhjAEsfTRipz4HSadFrezv4e/4zWmeALl/P3wY62gIWzk
	uBxWS5Uagm724pOjqgb/ihcjfB2Pp2zp0yiF880Mp6euUg3vOTRCYWF7mQ2X8z9X
	zk6QdbWM8yEvcqgV0NY36cIZ8hUCt4/VKd+JkBUChydVRfBVW/Y9j1mYBYbvLf8q
	GeRfAnLLQlp+JvYZzvRRtICajLugfvTU4lifF3lnz0N4fJnys+Vi8SHuP0/zEW6H
	QmCM3YF9/ZSpDDC9Dm22yQ8FRhL1h6BjVz4y0ijhlly5i6PxCILuF8JvbEeE1fws
	eT84L7D+Nz1Gr1EtNV4Tww==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011060.outbound.protection.outlook.com [52.101.62.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeeqwncu5-7
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 16:48:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQ/NrtY0p/+cIwfSvjZk/m30C8mLeFiOKB7jsjLGxeC09Aiix1OIHI4Bba149t1ZpMWq/4fh4Baeo833Wn1pVqM7OJga7BmeQeoLeHOUaPpyEFfRDOppNU4sjENzdv3WC9e2AbsZth38/J0FnWsOXgTg0U9RfsWc16BHqeBxM9AYQcv+seyOtTsmrgr9KxI603ijS1ci/BVF+hAVLRiYx5QuRQwzqFnS/jpEHB6G5fFtvo3lIS4WqJR/FW0f9Hb48ztDry5+OPVlOb4iimYsUHlfBkBX35jDi+q3PkJUmatEKbWzh9O2F5VPb3C5ypFw3y071L06Rq+eyrJnW78j9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzpJLlJs7HVTWmKmcPq65nq4JyUeWCDRN+XpPHfSm3M=;
 b=ExqiTf6wA+D/7++Iu7/mjSNs8sh65x/7w+aYLPZQp1DGNuIpAq4QjtO9GHRx2XkMjx6NP83kQBeR+RkqTJnquj7QKGa2zgCeVDA5rm9TmG5L5ntsWaRr2CUi63RHzmgTOa4JJ8Tonn1YZM5idUH9qi35aF0wU7PUwLJwIdlfXI6MP4TsmbR2Z3RzdtnCHPptV9C8h8vVLQjoVosC5DxMRWuWmI7dsI/wcG29XXKBsV6u1K3F+MmMVBFkjV/adR92/5YEDE2HmlY4poG0CMeubYaAf08Edaoqaz6C9gSFNWJhC0AgfA6d4HlV31UNn5+gKDRIjoPTHON2N4ylJgIk0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB6122.namprd11.prod.outlook.com (2603:10b6:208:3ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:48:27 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 16:48:26 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v3 06/11] kernel-yocto: add rust support via "make rustavailable" in do_kernel_configme
Date: Wed, 19 Nov 2025 08:47:58 -0800
Message-ID: <20251119164804.256364-7-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
References: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e1c463-238b-4791-aa8c-08de278b74d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IRiZQuINWqaFYtCsvS2H1A3i3NUkCAfKYA1lEq4fm/3qqvt3vhjZdGkSta8w?=
 =?us-ascii?Q?/tAAeEMMsG7nx/CIevo6yvGkCQhs/BaE2Zm+IYiSYCrxGCtrjJ+OHBqrkJPc?=
 =?us-ascii?Q?1LVL2Ekz5bSiqqXpNned7IpY9drzv56udd7TskiC/qgu4ahYzDWPLkpq9Fgo?=
 =?us-ascii?Q?vjOjeRiAykrY69mvvX3Df/19JpPRHZ7f+ttRr9lNrQPcH6+QjIiaszlH+UMo?=
 =?us-ascii?Q?Ka5DW2qxw8OkMazI2Oiql8B2Ds7LdSIid2JOxAazd9le1BRjFilXVFEepjNA?=
 =?us-ascii?Q?89FRaQ/hBGc+hGMdcCOyS0vaDoBX1IEt89YE5kreftbB9qcqwGuUGPmwn60k?=
 =?us-ascii?Q?+Iq7YCS6kJLs0gia8cwlMbEQ/Cwquf1ysEJpYHD0lMY8psibZdq0jqqUKBWf?=
 =?us-ascii?Q?7dlJhR/UVKp+hjzFJSuP3LRrDte47jj6n9W5J7d2juWztTX20WKDZ2o4Ihv2?=
 =?us-ascii?Q?npms36izgjyUuvSyX02H9ZXrvuxew2Ptt2FNKqi54nGUiH1uNZUqMHslR2L/?=
 =?us-ascii?Q?i6r9NW0vp6L9a0fwhxdUd5LGOs1FHx5YY08uNdgZZnL9slD72NqsQOZWtjTP?=
 =?us-ascii?Q?3UeXIsKa/jBpjGFwobYmRGlWC2T+f/WqjVajVkqaV6s6nsFoG+mpW1h8g8DE?=
 =?us-ascii?Q?CDsUN5vR8X3hosJoyGOpkkTEB8BxYGhAehbaajFADu11ywchOd56D2KkQ68r?=
 =?us-ascii?Q?T34DSxSeSKVH6SEJCpAA4x9UyDze+kjsw+LCA8/+uuDlsffszD4JMKjEKZpL?=
 =?us-ascii?Q?OcRVzsYiWHdG9d5vv1vhT29SRg/CL+qWYpgA2kobpt2Jfglrewj+sYkBomXM?=
 =?us-ascii?Q?5An9zCz+H1/3WqOmWXhtxmJ2k+vXSVCIMR3ByYhi4QsooR56Jx9+yCnJvnSB?=
 =?us-ascii?Q?8DNbhdo75ba1qreBNoUYT5G4hY9XlawEMB+3wYdNC02CCt3mCuG3FGwkAnIe?=
 =?us-ascii?Q?/HYBDMOH+qtu5o6Uqbpxo+hdEugz9FuclbjT6n6K/rtj7k0lOYYO5NZLeIBz?=
 =?us-ascii?Q?2erPz+zBdzC1ZHcX9VE17U/gwrVpSh31liKfFG/uxPcbLOCXNcsT473F2RiZ?=
 =?us-ascii?Q?+OaCPyQ4ubSqOEaIGbvqynyOcnyE7lbEbukDZrVWsYVvKG9cAKfuf+pAjvIz?=
 =?us-ascii?Q?JhUZhlyHP2fXRvd7e4S21AEnNBSRqKqg0shfNgbIWasszlNEVCImJ1WUtqts?=
 =?us-ascii?Q?lBTdaZCekXDVkpzFKHes0QGES8CcAdSCN0o5r1pv4ctpuIOtzeKsgzNGMjNT?=
 =?us-ascii?Q?YlM9/VFr3PWCV9TNd/iYFuGoAcIhUs3Tb0FNMG6Vhbz5SPh3beshX0wgPQEE?=
 =?us-ascii?Q?PQIuXXcI++LcihlOU6js0iWfPiugJSLhSp1k4hW58utXJfXMSfXsXW4ayz7l?=
 =?us-ascii?Q?kb3SMPu0htJgHl3pyB8ugMUmLRolw62Lom388Jvw+9JHISCUX0I8q0gfzMvZ?=
 =?us-ascii?Q?/bOWYKxzkozsvw8jzLYI4PjeZ8O0u3kdWGkcoOEwYJT22gV9rzq3+gdHYJGm?=
 =?us-ascii?Q?Jfh+7rDuCVgVL99ts07TwWqQRUEexrQ+WTTG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3P4E9FxNPJOaiNSSl2YJ4dMIclRfeO6OHK2g0I1y3OzFU2FgkPhkzz5jGSuN?=
 =?us-ascii?Q?DQwryzOUlhhgAz/J6LOfjJPG5FdhVQFiEZBMA+J3rfj21cTqlxiYgMsJ+2Po?=
 =?us-ascii?Q?A6HTRW76COidDKF3TyZSXQ92zxr02cz1fntzJ5bxWfsf21bkOyVHpNoQRa3s?=
 =?us-ascii?Q?GfSFdw/NlNHBPycoX/sd/qgrPMa1ZdJNYyZI4B33y5pgkU4odPJoVH2+OBrA?=
 =?us-ascii?Q?u+HGUU/P0ceuFSz0KZu7svVtbG4VLWnpFRiINoqgpM4XMwcj82aerDNIEftR?=
 =?us-ascii?Q?QGZfub7wmSjvHewR0fa8d8dsirD/9x6NZYoF+ngjPqmi6h+0y7KC504mpUGk?=
 =?us-ascii?Q?McHadhWZ6l/ReIJnLF06rVXVQtu2DBMGl+0qf7KY/82ySGozZqZiC1E920P+?=
 =?us-ascii?Q?Dj8lQjKpu0MRj8JNtwGs3HC2JLCOKzTiR3vtaXV8OiGBPlAHS74BywSb6PFD?=
 =?us-ascii?Q?IC0V2tXu8AIbOFClGgEUtCPDZV6rHo46nJerN28XNVkv27DnavUxf/bTJPMP?=
 =?us-ascii?Q?pylrbx4Dpu4+rd1gzl1fJMAwSrx408uFpcoEE/Q5gXZ/EeF624tbfNbuYli/?=
 =?us-ascii?Q?/xBOyQaStJj/wCyz6JCnpy/9bfCHAaNCX0w+lMG3HSQY89HBOwrNpPKQ6JVe?=
 =?us-ascii?Q?EsVhIzC7LvDk+AIS9MJrWh7C+AiRjh41f0H7XivUlEx6tDG/6mLteVE6x0d1?=
 =?us-ascii?Q?zQnF/3x/AkThN1tXvKaX5RK+i/Mk+BBakv5hdNCFjsQ8+d8c3ZixW/CRAlju?=
 =?us-ascii?Q?sF44fJPOPNzoRMo/uu+ToFgl5WjvaH4Yz4mwXWDo0wEU7kzJOwb9qL/udt4v?=
 =?us-ascii?Q?odISCuX0GviQrDKKglvRA7XUWmdPy3vgooueKigb9FbCFdnkLU4rhas5+si5?=
 =?us-ascii?Q?lc/l+HCImQEQfADksppSEoPxRZfKOXVDTXp9eJteUN2OLtsF4ns8h17bitWR?=
 =?us-ascii?Q?rVzO1NRgH5I+xnzoEaC8Mxvq1uWCT/uHfJOgvGHm/w3XITNE767wzk43XvTe?=
 =?us-ascii?Q?E8kDPm6oljl0Qqh3NTkbjlrbGZe78MjH8azWUTY8aCxwV0IjiPYEjamaygUD?=
 =?us-ascii?Q?ooEZwYf7GTkrahwjkXnJeDvcxm8SI9IFPu2yKxJZVxzK1MIrVSNWd0Z/EL32?=
 =?us-ascii?Q?Pg/8MltKMW8BkJf0an7/R2hZ6OMOaJMkMtkYbE8T1kh3GdpOl1LavC/+mlq8?=
 =?us-ascii?Q?psVY3ZYz4OvV/ulmXG+p1QQ939HjrC5j/7Zwj7kIf/9ruQ5aMZlxAv5ZExfE?=
 =?us-ascii?Q?eIIJ+FOcoKHW/hLz9yLsRWnC/urKIXLTRJkfQn2STyHBb7czG364G6AqWatA?=
 =?us-ascii?Q?ggpx2eso+R+NrbkzLMS+nmkFOURgAW9xKaYCi2xSFmazp0G6MrbblnghdPVH?=
 =?us-ascii?Q?LWbYtRJCZP0zJugCPKiekaeTNDyacFUixo23JzIk8ohmEKkP1Z9I/FaArEjm?=
 =?us-ascii?Q?oxNWzGyNH8w+xH/xFRz6qFg27EjCqcK8PXAGB3IcKwI9Ak626qmSWKm0VqMl?=
 =?us-ascii?Q?yOr+CFujB+P6CQGzrf7KUTE9Z2vSpiHyXqzES5BB+2+KVJFzy/4tXMsMkQGE?=
 =?us-ascii?Q?NGBHQeg7D++4fXrlabUDBinuU8nphWxuBy8wZFRSlrqsMiNtplgKvYFWKpdS?=
 =?us-ascii?Q?dscSKFsDl0Mhkx2tBrLAAfY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e1c463-238b-4791-aa8c-08de278b74d2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:48:24.8172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnCgRaCWq6Jkt0iyD3YSTcpbqsPVLZ66Won4jXEwUwsy3VFVF/z6pPrp0MOcfBZ8/XiLOGUqYAqpZ4mg5KQB562gtAYmCw4edjwzE2ZIGiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEzMSBTYWx0ZWRfXylk2BNKSYNFA
 ht4AWddGwHqer+RaaIRR6/oouJ1LKpQVP8MslSfHiJHkrWQDPDGBfNsgPO5VQVxKXIDW1JGHKDz
 0gO04bLBvwCN6zYpKBz5CVdOJaloAB4nW41A7/Psg0EB2O5fPnmaYNsr5DSVnHLkWH64ThYPQ0u
 hfvWcMfn2dEP5Xf1V+PO2zqh8TWwsRQdwgiSM5Ku9evXlinK7XfniW41OZ1g1nMXAhYSR4NBaww
 MRsUPq36I3GeUwJv2IUL42OccVt8h2X1Fy8VnReaElg7NhZYVlt66+cU/Jb7345kLiXjRUGpgY7
 MapNp5nXAIyDNbBS8mOqQzSlNmZVXWMhgmGZ9SiOs408WbGAks9vDNaO5cu7PvxXNqxa8IWN68z
 dEiGBTxhI+UXpYWlOmr24poca42oHA==
X-Proofpoint-GUID: bwEBeVmBtHwhaMs-80XhKRbLx7C9qseg
X-Authority-Analysis: v=2.4 cv=OuxCCi/t c=1 sm=1 tr=0 ts=691df4dd cx=c_pps
 a=VmiGRewH7mEIsprpaxNw0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=jcMc0Nsmbg0OvNgs5mYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: IREReKL5zjyagjanefRWy0RHsMyT2GEf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226566

From: Harish Sadineni <Harish.Sadineni@windriver.com>

To enable Rust integration in the Linux kernel build, this patch:

- Adds `rust-native`, `clang-native` and `bindgen-cli-native` to `do_kernel_configme[depends]`
  to ensure required tools are available for Rust support.
- Invokes `make rustavailable` inside `do_kernel_configme()` to prepare
  the kernel for building Rust-based modules or core components.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 2584cadf0d..dda235d4d0 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -463,6 +463,11 @@ do_kernel_configme[depends] += "virtual/cross-binutils:do_populate_sysroot"
 do_kernel_configme[depends] += "virtual/cross-cc:do_populate_sysroot"
 do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_populate_sysroot"
 do_kernel_configme[depends] += "kern-tools-native:do_populate_sysroot"
+RUST_KERNEL_TASK_DEPENDS ?=  "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' \
+                                  rust-native:do_populate_sysroot \
+                                  clang-native:do_populate_sysroot \
+                                  bindgen-cli-native:do_populate_sysroot', '', d)}"
+do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
@@ -513,6 +518,10 @@ do_kernel_configme() {
 		echo "# Global settings from linux recipe" >> ${B}/.config
 		echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
 	fi
+        
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+		oe_runmake -C ${S} O=${B} rustavailable
+	fi
 }
 
 addtask kernel_configme before do_configure after do_patch
-- 
2.49.0


