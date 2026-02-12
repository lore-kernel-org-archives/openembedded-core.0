Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77622EEA844
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:11:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52118.1770919903956579936
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mjY9xsr4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6503562417=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C4p4C02144042
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=TqKvS+km4s1e1cn4/sqCW/3sqkQi2dE1oqoGqRhYl/U=; b=
	mjY9xsr4JTeQJfe2SfZk3+H62nNChmr/tDMRufFz/9p9Oa4mPejHi6WRpNZe/wnT
	aieFU+YMt8v1eZaZ5oRy8nfgPiTPPt6I3sqZWMX6zKlP9iNMFKd7jy6MCH6iZ5gc
	QbijSIU7P0lHtklLIXmLkJYQqM5vu/JMxqCrFyYZKeSaneVB/F7av33dL/TczT92
	cjYQjeRJe88ROHeeOhtK6rxeOBBvuNUoIbXErbZUoNyC/UVGosR1wIGmB4/NZjlX
	/EWMg/0yOv81m0KgTJuQZN6jslphKYZeue66aM709Q1xAbdvt7/0MpZyAYcO7Pyk
	gn/h08BqwnqoE63f8fjJBQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010050.outbound.protection.outlook.com [52.101.85.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwphh8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 18:11:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kao/F+rtPLdwWNN7d9p6aXkPEBWTyvOhe/1BMNpLoHZHEtK5ZOXyrGs0Z3sDLZVUc6nAqsyNHJFbuqdMz4hVgsLj8/Mn1A2n/FRcf0ScmvUQuK2WOqYB1ard4D+D1hk5Oserms9sqkkNGQGkrB/VwuSn7YlkNw0KuBohFOxz5uOMtWNFVOyh+Tnh13Hz/fkYlbTQY+1Cpwon/N2EUNJ0rs4EhRzrpStv+EhJUsDXVuCK2yXqvB3OVuJk6X5/vcVoevPNmh3CPU+cr7pnrDPBCwgoEsS5sKQaDCPIlbVsKcuLU6PCv75SXGyzt1tbgmprLMAzjchiMIfbjhBsnaF9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqKvS+km4s1e1cn4/sqCW/3sqkQi2dE1oqoGqRhYl/U=;
 b=DhjfW7JYtGv3PWNAdLGUulFgbtY6B1OvO6MNzgeGmEPI2aqfJ63h7/Am5Ughm+I5qNNKT8KvKpCEH85bZRndcLPkvkzYs8vrrALVb48kwT9DyiqF5WwvboXBZ9/4rgQbhFZslPnmhaOe9zLnG2g/mmaL21q8wUnZpSbfFXqC5mdG1CCZMOKS7bYXfXQZcH1wBFQamZVsHHZAYn7f4PiP57t3o/WYrbulyPAWi5Zu/zEt54/BpqV7j3g564I1sVksNycD8KgLht2OAhxqcttTeQpdgfA7zXtiK03xRCV3+OdccDFSeX//OykyalElr9oDq4yUDMltTJbudDgMzM+xOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CYXPR11MB8709.namprd11.prod.outlook.com (2603:10b6:930:dd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:11:39 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 18:11:39 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, paul@pbarker.dev, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v6 14/14] runtime_test: Add rust-out-of-tree selftest
Date: Thu, 12 Feb 2026 10:10:39 -0800
Message-ID: <20260212181039.1826154-10-Harish.Sadineni@windriver.com>
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CYXPR11MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a607970-2d34-4323-4a51-08de6a622b2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nioUVtny13CXJkl3MU6m+Wd3nyTjXlzNmNrXxvYHmzEmgiIBI95x0SKzTbkp?=
 =?us-ascii?Q?tc2AxeZ53JzUoemEchTb7oHY46ykk+aeCao0lxFJS6lhZ1qU362Ro1sOIVOi?=
 =?us-ascii?Q?Z3vHzVcSgPMjQRIOhVw6fbMmNfm3+6vA1XoAq0VTK73JWMoooxkms2tB+l8g?=
 =?us-ascii?Q?/lCMXInRHGTtgpk2njUpajvkxTZVlfloU+NXb7uOleGjcF91xAF0D2R4DkDz?=
 =?us-ascii?Q?wqEpp9LcDVLCN9sa0HkwNnQI9nX2rCKbSC966fN+hv6BlrW6ydEqgN3V9H5m?=
 =?us-ascii?Q?tZ6DM1tjbPpOIhqc8UsdFdbMcPhTuVX+uY4XUJVv7d7EGp9kIeLpb/Gmsjn5?=
 =?us-ascii?Q?Ozdfzb38FnGZcdqBR571wz1icdE682QM72pPU9lSzewQgtXKYiJCBoUoCOjp?=
 =?us-ascii?Q?ydeWiFQH78UwHtcjFMVJuikJxfS4hkAcqd5Kal8z4iYfvS2moo2sPSxhXTHT?=
 =?us-ascii?Q?CYGzc5COSCgvYGmKyHZH3O+kzY7UmBCY+NmMWFUTuMJ5enX+D3pfl9EN7DTg?=
 =?us-ascii?Q?MLpnu6NpGPsb7oemG/ujQi8zICRzKj6BR5pxBWM3lk/ZYnzeW+zCFdwL10wt?=
 =?us-ascii?Q?xi3tjBVXuEFEu5by23JQlgtx33nhIEogukHWrk0D3SUfJrYruIvMTEIPxKYQ?=
 =?us-ascii?Q?Dc6tWKb/xq3+mf4ce5gWGVCsOr+Xy/mblYa1LGE54sDiDyinJ3LPKhnnKYwI?=
 =?us-ascii?Q?5jC4Mx1cSvrgR5sittQ5zzMTj84i1Q0h1/fTNhZwUImxAKDyDw+ddtF7cguP?=
 =?us-ascii?Q?ssLqa21AgZBONFq1k9KJQIIOBKwP3GG9H39aomT6t1mZO4HcY/k/s3oRYECX?=
 =?us-ascii?Q?t5CoRWeS9FVTBmYEKiIJo75/hrdPKKsnqvDtyUGe8MfmxvUDtmUz7wa76laK?=
 =?us-ascii?Q?T2+Yt7nhAQFMI6DZUdKFTrgl/hZ+buh/r28ziBX6dYOIU5cTWROUsF8MbfIh?=
 =?us-ascii?Q?ZCtb0N6y03BGdqAX0liceCZzoZec4GzeEGQR2UFNHnnGGP5VB1rRHgbXPx+5?=
 =?us-ascii?Q?lZW6fQvGN6Y8R9DDyMmBSZRfp7JMEdEprSWKkR1d7aff4DDvppvUYmjg4qQT?=
 =?us-ascii?Q?OjbC1eVjTX8Id3gqA94Ins+8NcSYfZEHkJUHMgYt2PVO5FZhy5sB3elE0BcA?=
 =?us-ascii?Q?6ig3TQP6AsmzKUzeuWrDBHnu7cPNm8WkBTXQp2Fe0wMHg+L4kZ5o48l0UP8Z?=
 =?us-ascii?Q?WVbi3PacwWngS7V0TisDdqgfuYvjxbQfdzZ5yxrX/ueDDo6CAsTD43EkF79b?=
 =?us-ascii?Q?ZKrYb2l63j2TBOewRt8kaPVjnZvO38F5OanJdaubMwwHvO/TzWgH+cFoFdA3?=
 =?us-ascii?Q?9Ir+Hsr+S+OKzDBw7nrm6QN3RRWEK8yo5UVaCltsb8JXGTg4tkH/qZRTi6GP?=
 =?us-ascii?Q?ONBdcsGnjMMnAoKpoFC8tn18qLKvnKU+fmTzW3K8AuDRclyQn9iVV91g7dD7?=
 =?us-ascii?Q?X1fHGMv/RZ/YISPbmCImUyehPb2K16ND1403o4xKCUrHuhjVal3sC/rUDOxS?=
 =?us-ascii?Q?2VdETandCACiXyLx0IVpQ5v8+mYQ4dxzs9L2Yah+MDJrgwypmbCIzH18C0Eg?=
 =?us-ascii?Q?XNly//00IwL1+WwYHhXRaeZE1DRrFAyJ7yzXLQMTSaQcgigrCuguVBOBakKS?=
 =?us-ascii?Q?9il7GG0C5IQxb7CZmWkVYIw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jTTXWjVkoEZYIWp3js8zlQbUlypsa59B8Mv0PYJUzYVCI9JuZbakvQRkPA1a?=
 =?us-ascii?Q?KQqgegm8tSMc/kkQDlwFftKXBOvIpF8w9Kk8RjAGamZP5Z2emi0VvQqcib4i?=
 =?us-ascii?Q?9Dllro/yC7mwPczk63UTFnDtah67zHTYYq99uNLNWOLyjX/VqsTjArwR7PVt?=
 =?us-ascii?Q?JMMwzlCfNwzp44rT4spEzUy23PTlOlVjfoRy9nfK16Mj/xxFu7Dk0ZAqHQxy?=
 =?us-ascii?Q?W8ARWVcEk3UhEkLnkaNgpdDIllFYgwKfhwKplXPWhSRvImvNlxZIlyfrPOPX?=
 =?us-ascii?Q?CibGAFD7JXe53TXcP60zZddDZIDZu+k/ThYizBqeTEZY/V5glLCdXZFw75Yk?=
 =?us-ascii?Q?QO2stkpgOz2hp3epiEDnvE1u/dIVWsv5hGmCI/Cy7S+7ZYH0RjzSKhJhdM2o?=
 =?us-ascii?Q?uYoNNLLJYRckG5oBI6rYptSZFnUtNNjvnr7dTi5aAOMmb56Wbwbw+5FUiOpI?=
 =?us-ascii?Q?H9sIA9uyY5sWtPQffAjwxL0zB1ml9CPzbAUSD+zl9HjQjTDDm1/6jc6k8bo5?=
 =?us-ascii?Q?3IQsiyBxrORy7RQw0OozGQ3RCgeYchAAiw6en866W7htR/mU7J34msqbhT1D?=
 =?us-ascii?Q?q1Hn0CMwdG0OrFEZnZrFi5trNRmyviv/JzcBMmdlK03lxaZ8X/sOcN9awYyS?=
 =?us-ascii?Q?PD5s0Rc6y/+BstE6AEB9dM3MgqEEuLDwXSNtL4Fb7/lOc7wpIwrQXuREn9dp?=
 =?us-ascii?Q?GMK2IEZJ1oH5vuatX5yBU4efp53OArmEaE+mLPVEZ46ZaG/Den0/nnhGGkm8?=
 =?us-ascii?Q?PajHB3EB96imXmTfrFERbSGLgKBXikbaKUuERQQpSNT6B6j2X1xbKdV3nqB0?=
 =?us-ascii?Q?7lZXdGuEjzv31pVEJPqf2dHJeGHvkBK0EpFGOyazCBe37vNU0sdV5mbP9ty5?=
 =?us-ascii?Q?QwdW15tRhe5DrtM4s1BI/sz76ZUV4RmEsnX1nckY4vio9Z+q8l5mhZ1xSS6T?=
 =?us-ascii?Q?XonKbvlqolLGvPpqyF/0PVptisUaO5BTgdTKRuF+3Lt7+Ov8S3n/iN8II+uF?=
 =?us-ascii?Q?uOuhhl9ite1Xl3jsw+NrmvXt4uya3tfyVqKwHM4iafGTXXXlR1ljrD4ktw5a?=
 =?us-ascii?Q?ZvbWLBlWasbT2FB3rUjJUfFshU7y41HiYXjS2BOe9kkD2tIyDWNwp7A9jmog?=
 =?us-ascii?Q?177yRYliSMKkBjQKJ+aZFVC88DdlXMIq4mjtkGnicVyXwiPVlth9x6/w5tIa?=
 =?us-ascii?Q?taxHftOx8BTNjh9uNTZfrH+s2UKkF7E5EzqF8V5CPooZB0NBBhDo0j9VUiiv?=
 =?us-ascii?Q?F+wHYnuFDu7uNDSu5Tq0ZTEFPk6BGi1XahikbOJYVLRcT4XpPL429K6/LZpS?=
 =?us-ascii?Q?4kTOW+/P3wQB11fzOvx01vIZGhMwpfHoVCc7EXoIFeWNF1cc1fll4/W6dpqF?=
 =?us-ascii?Q?0p7BnEf/LgfxJc6Z0q4qIvLCoi6RDkOWKiOD0QlwlC0bN6AFZ3K86L4a5l5J?=
 =?us-ascii?Q?gcm7DJQOeIVxrlNbo3UWh9ar+3eQncMJ1i8YslXumYPeN4LWFndhFaKNe9Vo?=
 =?us-ascii?Q?rmjQhc4vIuWYCJNxkBgYNiGQcOP1JbTk2L7XzDi0cSOuDv5Ll64aN28K5pZd?=
 =?us-ascii?Q?vjqbE83KyXfur0s1QRJVHAEv92D7Hk1wbRpVPCL5fkoNySc5PsgEw951oz4C?=
 =?us-ascii?Q?BNejTrO61WBDqJWCBviqSXbaQFfVsmhs4XRynEpvB3zMc66ktwXdHnBAyf9V?=
 =?us-ascii?Q?pb1qC+UG+NIj7/wWLBmg2sHYwNZUQBwbfqoHl6q6BJNCNvwDAu4Us087qxvQ?=
 =?us-ascii?Q?vb3NhJmzRXrB5irg4XNIzm9nHlrLFAs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a607970-2d34-4323-4a51-08de6a622b2a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:11:39.7672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Gb59HaHYX3uMxVYWkotDCdroer0ErhYSzAW8CaEXpdFX1Bk/U7hCuegOCcPGHs0CIigxbByv2RfhTfM4gNr1m+1jeW7c/C9J3I/elGtKGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8709
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=698e17de cx=c_pps
 a=vP1tzVmpfESUBmWdx33jDA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8
 a=H_R4aEw7j2pCQJa_tgAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: J81Aob0WBwoIVDNsnDODho_DflHTRv0u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0MCBTYWx0ZWRfXxVW5Q/DETNUB
 7leckWrhXcq4iKc7ctz0EqNElILjkZ4rYzxolyOrip1X63klKC0FnN8HqiPcOBSAAxViVVyZ+Wp
 BccmOwg2DkdlbV+e1IA3Jz4FuUru/ZfWXcKGA6CemDh+v7qsIDg6ZG7U17us8lPIfQ2jGC/nchX
 ExzVRYai8Yvk2kObJ22UamFmIa6K8TSFumAX0O4eI2M3tDmq6viGlgW1OIemEgYKUcxZvgIMTwI
 Xd1sQeoQ5upXEPu6HF2kkLItvu4VhaPnp4AJeNuzCbnozWXkKrSgEH3tLghVkFRmptPqbiiaE3C
 2xE1srBkTrLBBgaI+dPrfRs/C4bWDs3IQeLaaq7aAppqLuoMAXnqa/vsvWnFUOvhsq7ON+IcEJ9
 w5Oye247vBui7oE3+ksa8cm74xlhZXqV57tOLzdNytZPVr0rFGTnR9ZODpPo1OtqcKocWqALYav
 3uOt3378qbX0v3cA8og==
X-Proofpoint-ORIG-GUID: nFPdcgk4KU0G2Ml_XRGBGvSlqQOVnBU3
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
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231070

From: Yoann Congal <yoann.congal@smile.fr>

This new case tests that the rust-out-of-tree-module recipe compiles and
run properly: check that the dmesg output is as expected.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index fe9783e81d..1b18cf2e5e 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -493,8 +493,11 @@ class RustKernel(OESelftestTestCase):
             self.write_config(textwrap.dedent("""
                 KERNEL_RUST_SUPPORT = 'True'
                 KERNEL_EXTRA_FEATURES:append = ' features/kernel-sample/kernel-rust-sample.scc'
-                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal"
+                CORE_IMAGE_EXTRA_INSTALL += "kernel-module-rust-minimal kernel-module-rust-out-of-tree"
             """))
+
+            runCmd('bitbake-layers add-layer %s' % os.path.join(get_bb_var("COREBASE"), 'meta-skeleton'))
+            self.add_command_to_tearDown('bitbake-layers remove-layer */meta-skeleton')
             bitbake(self.image)
 
             with runqemu(self.image, runqemuparams = "nographic") as qemu:
@@ -504,3 +507,10 @@ class RustKernel(OESelftestTestCase):
                 _, output = qemu.run_serial("dmesg")
                 self.logger.debug(f"rust_minimal dmesg output:\n" + textwrap.indent(output, "  "))
                 self.assertIn("Rust minimal sample", output, "Kernel Rust sample expected output not found in dmesg")
+
+                qemu.run_serial("dmesg -c > /dev/null")
+                status, _ = qemu.run_serial("modprobe rust_out_of_tree")
+                self.assertEqual(status, 1, "Loading rust_out_of_tree module failed!")
+                _, output = qemu.run_serial("dmesg")
+                self.logger.debug(f"rust_out_of_tree dmesg output:\n" + textwrap.indent(output, "  "))
+                self.assertIn("Rust out-of-tree sample", output, "Out-of-tree Rust sample expected output not found in dmesg")
-- 
2.49.0


