Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9AFC44503
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 18:58:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16047.1783537078969523025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 11:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Le2EKYmQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1649b348d9=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GIJIK184269
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jul 2026 11:57:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ug4RCMhycYzw4SqBp07RJV9yWWU8T+AIE/EEIYKe9hg=; b=
	Le2EKYmQZFUnjLftEfa26pLfDDaNDBY84hUjj6g6etoRcmbZkPI9USop8SRnH8mR
	RS0bgOrDgxnD9DVgXR6w9Eq1idq6AIzonUZ9qTEgWFcx96701+/Uruj8/0U40Ul5
	x/mRlbL7zWBE25es8OrHuMq7F68tqj56chhFZhltsCDmuWr3PR6gKd/FO9V1nJEq
	zTflMQ+qzC+Y1Y1KmIpuITCQeMsre78AN3j34pFjPk6lZnQ9ThhG7Mrk84J3cvmE
	NEayNxm6xEcKrPGacvvqSHl49m2TtfFpfIPbgf0qpgaLDS1AfY47uvhTC0y2sDmM
	eT4UzHCp0nZ9O1ADuuca/g==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012047.outbound.protection.outlook.com [40.107.209.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6wf1enqh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 11:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLzM8+htbz3I0zKibUo+BbYOcz9Sj7mDXNtRsqcpI3jsQyJ3r7ZLJ6LudqCRK/CgafBMoLqkK9rkAo+h3Tf5ldGyqj7XZU4Nst2FmVelQqF1BjSddUfRxmz7u8jEyKWOxkZVowBSP1uMBhwiKQ46ro6QCkZ85+4BuYBhWwAzgXi8ECNL5gzCHEUbTefuMhAFPTdfT1b+PNNL/QvQ+2scxA2fagyO/fRbEJo37bRYBPgVnOjGR5W4q05QU+9IKtfdOulxszkkzxlS5QGZCzMMqedwnBV1mWGc2nWH2xEk7OcJgIhI/vgTZIglI6BMztrHALFBLynHoUwOTPFxsIuVaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ug4RCMhycYzw4SqBp07RJV9yWWU8T+AIE/EEIYKe9hg=;
 b=qxl/evXOGxzcQOGJiXi7/cA3KkOjshwWo042CgTj1KbyK/NUJ6cjXJvT1rtj1ZlGtzoWkznHpYKXSqevOImEkS+t/9usBFKtK3DekUubnbA4ynB5t9BhsqRVFtS9l/2lx4yvCFnBVtDSCbt8EUmuttNC2NoWy8y4NLmqrTNDLkztqZGWAVG8uHFMAixeEjj2jNjZ4rXsuyPcVH8ay6M4dS0hSlfU4ZaND8QDcUofDulGKDhWdl8neixzavXjwcNpPc3/87g1mZYN739zdIe06P7FR2LQtUDixI8u7pCeCltjVFClmdhZHt76xw32UITbnzbzDamZr7eK+R9H+G6IKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH7PR11MB6697.namprd11.prod.outlook.com (2603:10b6:510:1ab::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 18:57:55 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 18:57:55 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        raj.khem@gmail.com
Subject: [PATCH v3 1/4] kernel-arch: Add clang toolchain support
Date: Wed,  8 Jul 2026 11:57:21 -0700
Message-ID: <20260708185724.2183159-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260708185724.2183159-1-Harish.Sadineni@windriver.com>
References: <20260708185724.2183159-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LV3P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::23) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH7PR11MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd727f6-8a32-4a0d-2900-08dedd22d1ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|22082099003|18002099003|11063799006|3023799007|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	OhKVZxd7rO02CBPst2gV1P5DvzrbYcqcHRmHH+ALKKXV2p3AvaBDXuAixkUIgKhOXp4NnAr4PeXo2ewZhXdOrOeMKQSpP8csLu+W7RWQG6a80ELdOCb09r4kpF0kLJdgN8DoaSLfg2dwKHlShmXnzl9r0WdVqmGt6j8jd1croVsPBZw1456P8f+26iGLefI1yp3yQv585EF2r7q0aLlXqwDzkE37PwoQnk2VXSSSJy02JbuxWhAAR+UXd042JP18p0zH3xJxQje1IjOVDmYAFOGwXf2o34KWyu5pwSyfOvkh+M15/Y2RfzOTq0Y76LbvbWYFZ0g647YzteMHSvoDig89E2eoW/Mqb4SAbTAINCA2zlrRLUE0zdYOlK/2L/M5EWDAdysuchRdPJ2pMcT+4jG11EAvQwJRFVCdgei8ZpaoHhYM2uAgkjJbgQpw/hlJvmVzq+B5nQeAUeFyRe4ojOkytFRXtEH2nV6B5ZZP7BcbJzQqFHsX5jkUWYX8PDnwwvFGM/rAJtviGLHx4CopDXJdGwynu3EXxvMIdv2M7pq4rMaY2xG/tY6+ezK11z76Qc1qwk8c8fwVleBtFDHZHtDOLEUnFCvAMODrDhS0ZjtrFTeldPDC/Xwlyzqc3gmk6uFEYOTGX/4cN7v4WzefTP+Ut8+OW7IiiDpGuHRLh0v+eCSGCUwahOjEJ/g8V8CSFSKihusN/nFWBs3TighJH7X1JbItYnw4nEx0Z+7hW8A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(22082099003)(18002099003)(11063799006)(3023799007)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i+Mo90IaPgJIVq23bV4n1jLEYvluDcx7ka0w8HQZP4kATPnisFI0r1bzAKea?=
 =?us-ascii?Q?PNSIQHnfG2VblE/izFM3VGyUqt1FZw5d9vPUuM3rPzqMAGA2k0Ay/dwKypy5?=
 =?us-ascii?Q?V+3smzlB1irikN3/llmaA1/pMv2ZsrxEi+VUu7DsupFWufpIKyWbI9Hq2cwa?=
 =?us-ascii?Q?wc4NWyMIBIKJz3cvodebGh3xTZpPr2xo4+j46oAfiXelPTT9lQrHtFQvCLn7?=
 =?us-ascii?Q?XI4cOJtaJvpYPFsaXgIQbhxyHHXsFOed5IQ2Qr0R0es2gxEcoYzCICsyL/7/?=
 =?us-ascii?Q?+YoL5/xszLG4u5vAiQn9bfH6e0euym63TUZCTmUjboXzth+50PPmcuVMG8Zf?=
 =?us-ascii?Q?JB0ZFlm9NHek5Lf5CxAJgX/pca4cY9VkOqWqUb2e9CDwkKWwflaCiIhTUacT?=
 =?us-ascii?Q?iOEq671ofDa/ZwvYXSVJZIzlIfHC5qnLGLQiAsjGvhXufbdk6n4LJYu0hGP7?=
 =?us-ascii?Q?+I5NCnb6CVE0146WWsDOJftPmBzD+uwJubSCWolwvwfZfFXj9bHGOfcQ9j93?=
 =?us-ascii?Q?NPa/IcJooiSEOlqnGND6TbMsqXC3vS8alJvZiuzbb57P1oVkkA4pOoBK0gCX?=
 =?us-ascii?Q?nXZitMrnJ/auCBR7ts99t7JaiomIC+ztMvbU3d+PCm4sByueLmhuarWP487u?=
 =?us-ascii?Q?LILW4+G1cxNfpDJ76OspuZ+3eJC59XbBq2H/Tfv3HOsrxgzuyG6nhAQXlRat?=
 =?us-ascii?Q?KlYeTqIVKfZmQBeQfb51aRlTzjp2MWvL5pN2gvQU00z5EFo4vbGL6ABbv70V?=
 =?us-ascii?Q?Vc9dxf50kliGlqhDhZsvloIDxKhYCgxyd/+hA3wRYrUSYYI/ayWv8MRj6ZQQ?=
 =?us-ascii?Q?e55cofuiITWZZQ3+4Z29+tWlkFDzR63mhBXAaP/5/yzDHlJlwF57bw7GGNGs?=
 =?us-ascii?Q?JFWwmQcxPKi7wqGXMt2+5XHWMEwcz+DLT1Prua8O03pBuq9x2L0VDjzD2cI4?=
 =?us-ascii?Q?yAJa95mCzwUK1h3Gp45PM2m7WaZgZPxcAbhw5xqNFuBQf85XcO6/q1kNNQ3m?=
 =?us-ascii?Q?1U2xG0c3gkbxem+tTmWjTdCPOjWGhk72jPm+KwhRyIfZE0BEhWFbPW6QszHE?=
 =?us-ascii?Q?gOiMI8+dXmcRDQHJZhznFGF4TcnzRV0jTPRL3gmakR63dQ44HiY3Jm45UewZ?=
 =?us-ascii?Q?ko7fLS1kratKm552G9TSdLryKIZBc6/0VQ3wtLJEatsT28fHx66FX1Hj/Ms6?=
 =?us-ascii?Q?t4a1WBY7XDY1nzY+GeTEIMihWv04TvE8A4bE45Brbgw2OcxQ5KTuENQu4q2C?=
 =?us-ascii?Q?eBr1NBef1/Pxk8XF9UWoO6sZON3Vy9cbRnn6mE62ZivJpAGK4WseZupRIyfo?=
 =?us-ascii?Q?Cc/5QzDUoJ3dk1g335rAiGc8ntZAwZZPaOxBqE6ywFtEnc0Vp0zInVohB2m1?=
 =?us-ascii?Q?lRSSh8/RlGHE1fyh5ag2EQnlNnyPajzxXca7mnB/eRSuagJaaUqKNq7rxa7j?=
 =?us-ascii?Q?QXdpGZ7BG76WMZfM1gVkjbJwBKtaAn0NZWXiODQrxzkYwV1nLCdimV6sD8eJ?=
 =?us-ascii?Q?ijJ5kXBUJrYwpk3methEgvflFsCiMBlNHn8duJJaDPeJTFDZCKQnmj0Z6d8s?=
 =?us-ascii?Q?2T5kr5cqJuObgFDG261io7i3QEO/VpFxXIH8NiX16kTIL0wWZcCrAySCp+jQ?=
 =?us-ascii?Q?fhPA4d216N5Q6U6NY0nAIEUe3KZiZkjixaSK4gzLQTnQ7ujeQX5mXVdd83bU?=
 =?us-ascii?Q?o6EWy2nNCB54mbHahsyQjxutBbq1hqgrYsPXpevMYaYoMqelim5hmyCAv6qn?=
 =?us-ascii?Q?FoNVIQAH7jZ9ryxTHsVm5+36Hac/ZYE=3D?=
X-Exchange-RoutingPolicyChecked: 
	dHx0U8/hKJYeD5584RaYDmHjM3FaHmw+rRtP+l1Xo6140MTaVlEMWZOYNjUtnRYsmLj5Y83/FK0vwFb3dIj1R2Igb9PPVU3n4FrRZUQsYHasuR/qbXs4IDKUHAwKfXj6PkWmRLhTKgGXel7pkwKKz2EMykm4puEUt3UL19KSq99x2lqwF7ukK+Ca9SOf23anouFrDv2AcIpSHCpRhbCmNUyyjZ8bsWYtc/cy/F+akB9nRvOFQ4/DjY/vDD9XgODXLAYNRXiEdMYLwZOUnvE8TPuTzZ+6z9rRosozqK/ovdl4wVSVD5lXUS6seSMOaW6BOCmAU4hRby0nTtFgrw0rZQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd727f6-8a32-4a0d-2900-08dedd22d1ac
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 18:57:55.0979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53TorouZyBK7CHqOOp7MXerd3CaR+Qyte7yJ2Gbdtq8SEakcvrjLtWxcdR7ssc8osmZlX4I1rY9Hx6h++NFOE39NhPLdMvNRGeyPWEkS++k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6697
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4NSBTYWx0ZWRfX4nRDsGnn/Vp0
 xfHhIfJaCiSSct+qQQm/j97WkVTXSWievVxvka8z45ERoAOQBLlI2vggi/5vxp26vQCjokeLLNu
 rVJWDoXKz/W7ff8yYlUsyid/kB2QD8HOR6hFnT4yEO9TqQlrQN++6VZLgB+CHWhk3Ug8o7bSg3C
 PbGn1yxKjnSS8x7XaSwRtjqXyvUs8QeuvGgdcr0PHV+5bEOBvP46UvPyKZXyGNKVy9ug1iaRLV3
 nptyqbk9dBnn0QofVC/MgJl/k0TH+uZta+28POXNGBnaUF670MuD+2Ui8aEOvZMQAlFq58/qONn
 8emPuga3ajDC/pAmGZry13R345Tpq9npGHEACPCuEJB6b5JP0yAMx1dqzcgarnW7n6EMtEQvlAD
 OixpQNX6PZbLn7KXWE13GY1CNHmz9JR+wuyQwiSL2RKjJ+r7Ia9q+wW/dvzWefZxmcijMCFU2YS
 seSjhB/xuib/Z+otX+A==
X-Proofpoint-ORIG-GUID: k7t7xI87u6QPFXbXqEZDAgp6l1YZPhel
X-Proofpoint-GUID: uGOkb3REWi0Pt81nmLuEcixpZQxNFRy3
X-Authority-Analysis: v=2.4 cv=cuarVV4i c=1 sm=1 tr=0 ts=6a4e9db6 cx=c_pps
 a=AG4d6nCg1awo7HAtkzPOig==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=kWAUPiode8oiIj8Mea4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4NSBTYWx0ZWRfX7wnUUTkRPmn5
 MgBihxODU9iKmsF0iOO3vmqxJvREJ3KQE+swE0lVDytH5leRrWYRQm71LnkMz7TOuwmFHK0sPpe
 qNyNUhR0OOfEBBdyD/pMjZfYualQZqcyPV0+wS/oA1nTmmFESnd+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080185
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 18:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240511

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Convert the existing GCC tool definitions to use the `:toolchain-gcc`
override so they only apply when `TOOLCHAIN = "gcc"` (the default).

Introduce new definitions for `:toolchain-clang` that use clang,
ld.lld, llvm-ar, llvm-objcopy, and llvm-strip, allowing the kernel
to be built with the LLVM/Clang toolchain.

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-arch.bbclass | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 7aea9cd3e8..6ebc0f13ea 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -71,14 +71,25 @@ HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
 TARGET_OBJCOPY_KERNEL_ARCH ?= ""
 HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
 
-KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
+KERNEL_CC:toolchain-gcc = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
  -fuse-ld=bfd ${DEBUG_PREFIX_MAP} \
  -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
  -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
 "
-KERNEL_LD = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
-KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
-KERNEL_OBJCOPY = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
+KERNEL_LD:toolchain-gcc = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
+KERNEL_AR:toolchain-gcc = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
+KERNEL_OBJCOPY:toolchain-gcc = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 # Code in package.py can't handle options on KERNEL_STRIP
-KERNEL_STRIP = "${HOST_PREFIX}strip"
+KERNEL_STRIP:toolchain-gcc = "${HOST_PREFIX}strip"
+
+
+KERNEL_CC:toolchain-clang = "${CCACHE}clang ${HOST_CC_KERNEL_ARCH} \
+ ${DEBUG_PREFIX_MAP} \
+ -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
+ -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
+"
+KERNEL_LD:toolchain-clang = "ld.lld ${HOST_LD_KERNEL_ARCH}"
+KERNEL_AR:toolchain-clang = "llvm-ar ${HOST_AR_KERNEL_ARCH}"
+KERNEL_OBJCOPY:toolchain-clang = "llvm-objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
+KERNEL_STRIP:toolchain-clang = "llvm-strip"
 TOOLCHAIN = "gcc"
-- 
2.49.0


