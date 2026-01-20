Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77B7D26284
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:31:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13356.1768933899616829873
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:31:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jAPp4frx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K5Rq1P3673695
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 10:31:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=aP3o11PQx6ZniR2FJ5U/IO/w6RahnFHYk61cZ8mU8T0=; b=
	jAPp4frxbm4rImXNFEx13ZL5t1id58F6JyDqP1mZAIM5iSYLauQTbhmew+djPbp0
	rHRQCWP5jg6wNBnmzHy+a9aQO8wafF7Or/9uqHXKYpik/bSvN5GZtvBPD7R1f4Iq
	GIve0tRp5m+0BwSeM1nEkdh2ON7qqWyS9oEOSVMDf7+qvjmddgYEiUX+4FbM2JbK
	np74eGq3PahMDcB6QkcywQXL4fBUC4twpTt7eyBnH61HS0VS5qoiN+5gGf7tyVj6
	fbmgvEL/BkcsZvEM+TIziwMupPrMXiNXtAeUzMyenEuBqEHU5pDcEhlEm+nuM0zb
	gDsaeXA5z9KzdB+TMTts6w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010051.outbound.protection.outlook.com [52.101.56.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bratgu4k7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 10:31:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hInqS0W1zYzKgpkSd1sAWRdgYYkskCFXkIHtLjaFWUQWzxqEtWFFh7suTcmo2hXV+XI7fdZGzqwN1v43JpfnROJFJGamN6+XgKtTcS94OSJJc2zi8lIhP1CwIE1e3mEWK1zoUpzmcZFZEx5q5RgrLgFKvDmHoAH52oIaXlY4HgDTvkQcBqI73iXWcvfQxEMsysUGevoQjl0Dz/Km96c3cmwsAr5m+LHhW4tc9j5SQa35w5wVSEGtG8X+oXzZ96GC+je2Ct86otNpJyB2/q2TVG97l7XcHUZ77bvktLHzceYSmgOBKyV4/2ByWEUy5DNkhBJukCJWjWaiFm5V1D2Nsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aP3o11PQx6ZniR2FJ5U/IO/w6RahnFHYk61cZ8mU8T0=;
 b=vEFmSa0EvDHUymiIxHVQSWSc8nYy+RTe5jCKHOTedy2kZuEwzUa+dAcf8ocaGM9chwP6cKASRwLOwlIMwHg8RejP6FFPAhIe79oSqvGSnGy1IPdiDZJBdUM+fYKUuabKAa97l2rVUaNe/33JNwp4EFNveO9Q7IWmQk3eFAi/SJO8el7ALH4I8RPcMtfMPvhj65ZhrRs6nLmiyL3RJRnlYQRuqFwqy1BJrVeT5j9YUM24HDuKTjXH1k134SdodMHput4zBMCWC2wRxhap8i+1cNWXaZfOYQVkUcnPTY4QESLO9r4gOoYd9JNcsBQpzuCo4oJuArBo3MyXT7AvsfquYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 18:31:35 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 18:31:35 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v4 11/16] kernel.bbclass: Copy include/config/auto.conf in STAGING_KERNEL_BUILDDIR
Date: Tue, 20 Jan 2026 10:29:42 -0800
Message-ID: <20260120182947.857242-12-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
References: <20260120182947.857242-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0146.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN2PR11MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ad131a-2443-48b2-c267-08de58522436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7142099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3pMkS6/vxseDj7HbQitu/2DWBsmkCdK3JZatIwvux5fXswwRX3BPitkATPgR?=
 =?us-ascii?Q?50SHk93CCcL9tSCmyxI8/tbIXl/hEgEuNY/3rTSOo64Z2XFPJO6rM89Ib4nr?=
 =?us-ascii?Q?lvGvJqRnwQU9f/vfqGL8eNVqZ9ecwJXqccsLvsS65iuMuOIy+A8Wqc7tACKN?=
 =?us-ascii?Q?k2JjRW0S26FklUELNlFh8OmBgBeDyu1D5zYzWNr7vYd9B3OTktot9iraIe9Z?=
 =?us-ascii?Q?A/LARJLZoj+YbMaXz0p/pYSGdL+DJsTRVO6f2cDe1dV+D9oBOFpyH8uiXLPA?=
 =?us-ascii?Q?r1Q+ZsGEJ470W/M2asMZlG9IUJSsXpXUvIdYqFsJKtG+YHxiiKIYER1rjvbj?=
 =?us-ascii?Q?T+eL+hblSCJBCmOpWRE8GN3P49p+/z6oLCX+xzWcd/lLYTA7vwtyzEVNeEY4?=
 =?us-ascii?Q?/Jp2nuTJWqyh8Xj0762xc699p0ohv/tIgWmCaIfwCM4aUUyO277VNPFJWhpk?=
 =?us-ascii?Q?RMsnX9fYoOhZCmImuBAD83rimMN02DV31wrANnaO5Nn620fQYQix43QeB8F8?=
 =?us-ascii?Q?//BIN3Hc/CJRuqnyLZTKPThdNt+hjyh2LL5qfF4zpeU6FFVGsof5ujRQlO5A?=
 =?us-ascii?Q?cqv6gieTgxqFT9IS7k7NQOF0Vj25Ozq1ELn/F8xeuakEtRXnxPFRuQGjsm60?=
 =?us-ascii?Q?jyJsHI3+aTn5ez4NK4uYDDgF82WRjKexehhj3X7siyEufjG/oyIf7+nRhTX3?=
 =?us-ascii?Q?p2VnGDKVWqTyU4dBrhuW/eMO7D7PsnlEUhINw3GIx0YMFROh9Roa+lscN/kF?=
 =?us-ascii?Q?93dX6hL+DiAYBbHGAzPLtpJQ0vIbn11eBVLUVT35+9fZSzJIt7iYjTwmuYae?=
 =?us-ascii?Q?leHy4jWVx/V9OVL9Iba1rjaMC36NUrtXEZ0bJRCs4iMQHN+YmekDPV024bnp?=
 =?us-ascii?Q?nWweE737/J4lDhAnA5Ypz7emOIrhw0FbuBrZWfAL4pi2PwokG4PLopX87G9J?=
 =?us-ascii?Q?v1z6z0q/X2knruAwgk1xUUUuTiYanYG0KiXrLU97DSNApZ2TPUZZw73NO0/W?=
 =?us-ascii?Q?Kuv/HLE6HY1oM8p9Rtozi3XT1u1DhzjiWVk6c65qUwz7xJTz5dUIxyKdrdRO?=
 =?us-ascii?Q?6oPQ98ojOyeBgYPOJOUkyRwTjNspwG9Eifkxcy/ExedT7quWBBalUIswvYp7?=
 =?us-ascii?Q?YjX4Wztgt/oeVLvbG8wJvduuCJ4U/6aYiGLcUFWdo+ZVben38Ctaaop2x78Z?=
 =?us-ascii?Q?QHxDBw82z52+RcOvRILMP/8Br5TraBsx2iphLYuwtfZBWZF07evqt47m9Xzy?=
 =?us-ascii?Q?+2cKyhHVExPc+Ads3UB2tgL5nMuBWxOwlq/3tX/66FHPoJmjfDZtd/0aGcLS?=
 =?us-ascii?Q?jolKo0CPEDuHj/Uz3ldKb6WDV3soGDvUPfABdfCyVBvZxZSvETPmFFFXeq1C?=
 =?us-ascii?Q?s7wcFLsDcT1jNW9GhDLXQ0GMEQzh2Hm8eeJaVmTvj8wGrcLU3EshI9CeEZjI?=
 =?us-ascii?Q?wRr2VKec/aXJsyqDckqEZeU25CLG/GMONPBcG1BMJqC+8xpmsD/OBKWLGnxS?=
 =?us-ascii?Q?B4A2sIwquwRYpiZfenvkzIXHhB5OhggUNYhnwKNtcjFrtjQFY57P04CwPaVz?=
 =?us-ascii?Q?dDcGseCqwVaYjoLHxdqG5bzL4BDO/F1jltqpJ/KrYWSlQTnDYXOkfxf6n72p?=
 =?us-ascii?Q?X31+10rUaKkUVwRZpwGYdpc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7142099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nGEd5xYw7KQ/FmmRqy315N/8pbygC8YiKp/QzB76x2VqJ+p6QtOKZ9PTZlH0?=
 =?us-ascii?Q?JCwdRJKcR7d1HSJpFoG2Vkxxo/QLO/B94iIn+HnTjWv/HWlmzeSIbd5LxCKa?=
 =?us-ascii?Q?nLKBT20xnlnUKzWiQpv9vCOEyxKYcIKfVPHtEtjLTPBKzQinAjGd1l7RMw0K?=
 =?us-ascii?Q?e4VcfztOOIMmDzeLeJz4Qb/YSowumKfyu+Tq2yHJ9LssqFNSfXUlR32NyACS?=
 =?us-ascii?Q?CebUYzEwx8t885+2BzZl4kR6wbnyDSe42vXLE2k6ycRKGJ+dx0ire+Icu4cj?=
 =?us-ascii?Q?T3BZliKu9F1teiSKd2lZjTMs+Uq7uxY4mk4yatrCqBsJ+wtrwC1zeziujZZ/?=
 =?us-ascii?Q?5k8JSiS/I6/d4pJ3hl4SminbyQ/hpTVUdf+wA87cBp92I6H2eBpTa2jrr4sg?=
 =?us-ascii?Q?sCe4kMq1t1GGt2W9IA/ZEFOvfaYu0cFR39aSpVnzVss+4nbH1Z5akphmqAnH?=
 =?us-ascii?Q?86Qbn+pg42fSdY52KA451aDJE22EsienFwFxiRoUmAEVRyuXb+RAVIDIzT3O?=
 =?us-ascii?Q?rYAbVGGpCNLCqcapq8/a/XiuelivE1MhxPBkU5vdtCyYSQZhLb1r3WCQkzA2?=
 =?us-ascii?Q?OKN5lgSsx0e1a7a/t63OfEADHtS8i4p7RXBqSwIOUX4rqH3BG9XpWiyJxNjQ?=
 =?us-ascii?Q?MjWts7BvPHQYtdR6fvAuOwdTzOaT0Aafx2L9GT//m5nuvmzVchtc7RqBZOcz?=
 =?us-ascii?Q?cbifJ/8tNBYXewVeeb7fSPiyXYswCjyNEKgTeKP864l6FvFMyy/Brb69FRdc?=
 =?us-ascii?Q?AIGIvnfIj8SVvkp7CD0GU/0snhhDCmPSTx8LzSSFXGpt8v6jvOV2jx40sgRs?=
 =?us-ascii?Q?1FOtlOdckXRkcjEVMIZQAd7gRmOG5IVGHG9yxyc3lEm6yuqrUons/TawelfL?=
 =?us-ascii?Q?ixoloJUInjalPMeHW4oTuv7rcPm7jDnE+9Pt7ahXc1QKFvxAkhCpUcWdPYdV?=
 =?us-ascii?Q?NVyv2v+mb60LLLpNm3cyA7ZvN0adRWsZg20DXomUtwG9aokZuQmxSklHtzd7?=
 =?us-ascii?Q?edyYwO3Bqj/HapewERsnlHMeJLnxLomJisZ8TpzIUJzH7I36LIwsGmlaSoKL?=
 =?us-ascii?Q?ZdEUDBcgr/jA0PCcuPqK5mjD3A8jpy05QPXMVi6BMbqaxYA5pFgtk6qqAeHs?=
 =?us-ascii?Q?TXkN7CsuFURIUGWaNmPNMOYtuz4iQvRyV28aJAbrW9LEINqN0LK7v6MrRjvE?=
 =?us-ascii?Q?yGX5V04Ek3ECdmwXlxQ7KPG8FMn4/E+10Vw24UKseJoYyBlF/0AQPRQ9gFdo?=
 =?us-ascii?Q?aFWzbrpVt8UgZ9882Vq02Pjsg7mTzDCDtGHapvLKDl69/K/DmAWPiP5K8+8y?=
 =?us-ascii?Q?s49gNbllYOiom8PHYZfC6y2kzBsmJB39apK5gl3z7QO7jbukCK+3jYmuuKp3?=
 =?us-ascii?Q?jelN118rD/KbabJxHtjVCEh2Hp3dNLvcLfVpOScnaO+HmY/qEDsct6S8S6hq?=
 =?us-ascii?Q?9qfBo4CECTSSQk6aVKMHKfrLRBA63lXjFA0zuG4qgwGf3nt7bE+kmqfHaW0v?=
 =?us-ascii?Q?rBpUHmpQkyjU1Vaqh7iyrdFSLAgS6ZBNVVIetLKswSktbvuY5pDFvetJYPL8?=
 =?us-ascii?Q?WpJjShOG4uc07WD6IpWyK/OPTvFPHiNVRfmsevSrcOqiYJeCnZktbjk1fIcz?=
 =?us-ascii?Q?RnIrQfMdCv2K9clcEiW+VdgGT8wjfsaQutu0Mvu03FQjd+0HBTgJwjluBbgx?=
 =?us-ascii?Q?5iikGiJDD1zhg9QScqI9so1JEKAgEFP99oNGsR07Q96liJ06uTz/epksIquJ?=
 =?us-ascii?Q?rYKknmoh5GKuYi3UvdJrnOX7X1hwzPY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ad131a-2443-48b2-c267-08de58522436
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 18:31:35.3122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uW1MqXN7RFPAwjy7jkerwf/W7i186pAIvLemlK1Hrd2SnfaPUABwVQ8YnLaAvsNU1qXaBCEec/kd+dbiitQxN+raQTeXLY4tf4ife+dHMeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: qYmZOddczUmRjSztkqBEHHBlGeu1gCAu
X-Proofpoint-ORIG-GUID: UawsLG2b5RVSMjIsVLA9StZqrgmv0gOE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE1NSBTYWx0ZWRfX/YnZTddXGQK7
 ogTpyh1pxXRsgPX/VpPbY6fmkaL03lRYIe4OnHhAHR1K61pqRLqzjcNSuV7182wp4z9rbGkfwcL
 1/o/bD7oMr/lyGiV6RmasFQfYHlFnchIsq2q53Tjyjp8VVPC55pZrrQfK7vOWqYECL3abP91lDs
 inZw7DUGJwSKYouRXAmE0X/x6HJ1cN1kd7moWVtdotcgTmx8ITizx4673BDVjg83Kb1jMR/YFpO
 T8Ry8Z5dTD78zLq0ewFi/a1Y8GatHWRIoXAKc4PHz58lZFzwF61+b40erBAt3YDy2vGZtRZFNi0
 hA9yx4f6/jtZ5vz1ABiA/12yuTCsgk9pRyWZYmZdgbUkxHJDdsOhs2PsL95zgLgfR5Mgg/ZzIrj
 sYzrYtp790hfcTIwYc/9C/4mHFi/058/ilA/HGNee/ehQrvvMLVo6pQzIJXQtz6HbnQR+XHCDcW
 TUHRgXZ7EJtS78DIKug==
X-Authority-Analysis: v=2.4 cv=DY4aa/tW c=1 sm=1 tr=0 ts=696fca0b cx=c_pps
 a=oox2QBUX2gBgMMQWkhdftA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=TeJiQh7uZb9NdfcNB-sA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 18:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229778

From: Yoann Congal <yoann.congal@smile.fr>

Linux commit aaed5c7739be ("kbuild: slim down package for building
external modules")[0] states that include/config/auto.conf is also a
file needed for out-of-tree build.

This avoids this error when building an out-of-tree Rust kernel module:
| make -C .../tmp/work-shared/qemux86-64/kernel-source M=$PWD
| make[1]: Entering directory '.../tmp/work-shared/qemux86-64/kernel-source'
| make[2]: Entering directory '.../tmp/work/qemux86_64-poky-linux/rust-out-of-tree-module/git/sources/rust-out-of-tree-module-git'
| .../tmp/work-shared/qemux86-64/kernel-source/Makefile:779: .../tmp/work-shared/qemux86-64/kernel-build-artifacts/include/config/auto.conf: No such file or directory

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aaed5c7739be81ebdd6008aedc8befd98c88e67a

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index f989b31c47..30a10b0801 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -570,6 +570,7 @@ do_shared_workdir () {
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
+	cp include/config/auto.conf      $kerneldir/include/config/auto.conf
 	if [ -e certs/signing_key.x509 ]; then
 		# The signing_key.* files are stored in the certs/ dir in
 		# newer Linux kernels
-- 
2.49.0


