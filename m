Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCF3C7EE39
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 08:22:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.34598.1751271719417207509
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 01:21:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92765c4579=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U5o9rb002391
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 01:21:59 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2041.outbound.protection.outlook.com [40.107.102.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jbp49cch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 01:21:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCRQa5swExIcCxirLL2a/KUXrHI21MBevpflzzpLkzSDQPfGOWvsuhoCSG1sZjGAnWRwnG4Eqy7yIKkL/MCkG72kzThoqSQAGh4Z+qRCa+K1uGkwI+jfuh8WOwT4Apl9uouGEn0biRiypIusOKqfWr8p1OpJKKZ00WSbRLjfaOMc34EKpcZSDlqCjjX7tTNrBq2uYucnsTwkaMl6Gyg30DmWwI/ZYhEp3JXvq5bYBKBIFjlPAtH1maeaeZhrmhX045A/UoUX+ybaI/0u8pXWC6CQKOxd4KtegK9YGm8GSF0Uz/qXPAuY38f80QfJsccknsA82SS2eCcFBLfziEATgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCeLrpm93XIXbJA58OQmQ2w6P9PlrM+p9ikRFzpu1a4=;
 b=Ih+0uS+g74H5g0TIQ0uXIaUnSXzndMHDXfL5vqynrsWhnQlmE3tb3YlYKARrufqUhJy+f7LwW622kGAYp34fOYw5pazsZWLQPlhDr9s3tYjRvo2Z60LZhWVx72k9j706YpcRoRu7M+IXFL0heZN9M7drgFUsWCfK31Vt+qyUODCN2cpK4tYO561FYRpSI+/v84yjcQNUtzCihtLZqeG37wk+5lcO5sos/mqxNTb+7LrdCcuTgUKipG27DYJss2F2LgkAe+mB15PVaNWommgH8CV9yNvSZqR7yx6Odxzvpm/tGZbNCfFtYUx/uuVjPMPUjYBPerBf/f0nFGGhFdPukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by LV1PR11MB8841.namprd11.prod.outlook.com (2603:10b6:408:2b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Mon, 30 Jun
 2025 08:21:52 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 08:21:51 +0000
From: guocai.he.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][scarthgap/walnascar][PATCH 1/1] tcf-agent: correct the SRC_URI
Date: Mon, 30 Jun 2025 16:21:29 +0800
Message-Id: <20250630082129.1432402-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0139.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c8::11) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|LV1PR11MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe11005-3a14-4f3c-3e17-08ddb7af2a4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?t76Yee8VysPoiuScfZVfZe0odWOfoeAnohTXcg3zJNCQgNwykG2kdHATp9zs?=
 =?us-ascii?Q?F3fFStEiMH7C0Wa4EsZacMnSoeUXIE33zkAW8AOm5s96gBpyPNwYNX6ziv+2?=
 =?us-ascii?Q?snTM+o62DCBzOJ3PRMb0QflL0LT+MGENjwZ4Ip3jZUQhkVpY5uorbRWmHgae?=
 =?us-ascii?Q?1MmzTKfu2nDLDBvqqY1o1g7+N+zyrv90y1jioFkJdQkxMhqfpLWqejLfwv8U?=
 =?us-ascii?Q?WCugMuJR2medJe3ubPq2Vo0z5Gz/NbMZymccVRFUZr7qObKKtSXc3U7dexPm?=
 =?us-ascii?Q?Y0gA1EKbvNH+oy2AhDIlo/xvviS6V8a3HjgwxMm1nfZ8GU+Jqy94hqd9wI5x?=
 =?us-ascii?Q?BjRF66HwvHbDappCuRPpHE1XOFJrXt/Xg94NUCh8Wb8gPDP85OBi0E2snYen?=
 =?us-ascii?Q?H9tnUyVDxVbYZmy3YfHBKtsd6Yhm1oFJ5yE49xjCES1lxVlpaT8bE1qTgOqI?=
 =?us-ascii?Q?TLOYoMbC8+c77N3NmmLbj7ywSjC31PVmP/NtzQF+5Cf74ePMfjeh06RahTSx?=
 =?us-ascii?Q?T4AOM6dMar0UHRqKbptNiIXEygTGtsK2cPspq9ul7NmWy56A4Ubtjz4+UKYM?=
 =?us-ascii?Q?EhOjN7YlAZNhoUtI4TfvZQ2lzze/+5YT3mJQwNeExifAeuCU0/fbQzRRQYhJ?=
 =?us-ascii?Q?Uy11qWHDPBLFupaWZsVjKp2guHYs/aUC2Fn+iVStM3MtdvJe68YhmHWIYZBS?=
 =?us-ascii?Q?DouiiQq8Qzs7KSya2y/pvBu7pUC2tAQkudRCI38HGySAgdHbtXWkSvqpWoUc?=
 =?us-ascii?Q?oZXIrpqJzxzZbCy6G1WSfnpjj9rnUbNDc6hhLts4Fxbq6tTL8HTY3poXwhv5?=
 =?us-ascii?Q?/9OW/I+IfTbCB2fmqGdxPSh3FbcW7AJ5YOXFEuOgV3h3be+BkOhC5o2j/q80?=
 =?us-ascii?Q?kwzR1swmFO7SWO4/9I+zRLTAhJV0+OCkG2grjM4OYCD4cPo7ZSQJhzrS2jyj?=
 =?us-ascii?Q?AoQYiNIwl0/cAr/za6j98wyMG19hk7hhlt5rbalO7yRjz6QuqkxJb0fApLkg?=
 =?us-ascii?Q?JgeQeal7hAGFHCKv+u1vlYTnvpjRoNS/tij2yeEJQFpYisBMnIbAzLEIq6M6?=
 =?us-ascii?Q?PExq4Nb8m+GgNTOgqSTqSmLdwrYmVKooHkJw5nf5T4ef9LwMQsvF5c6IuAd7?=
 =?us-ascii?Q?Hj98vSRU7vMsSCtQaZVdrobRGKD/v7pX7aXd5dqpdRvTphAtAOGadaIhG+39?=
 =?us-ascii?Q?KALnhWXWm0M3lyealdWQ6rICmcrBm2mU4a5A9HuixXGEma5NCETl1+R5ct5y?=
 =?us-ascii?Q?frMuKYvkBN+4vsnSwfE6BX7j+CZw/Fn/hPB4fLhsL3tr6fTY1/CC63op215X?=
 =?us-ascii?Q?qAX6ckHIPsxw1RVvhFOZaN7JqobHcBOA1uSnyAJxHcGE8z82F86k6cmT/zi4?=
 =?us-ascii?Q?ZwJ4QkgmPGSrPQQXIE4BiGfmNixiUyPwNE16re+Hss/01KYEi/X+ccvmdue1?=
 =?us-ascii?Q?NCzxe+bNxPI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yhg+yTvD5B0uJsdQwEvpdCD+O/dX5ml7SOTdVMLX5Pco5wjR/+wYkEl0MP1q?=
 =?us-ascii?Q?AwShD1RyNYpQ7nr3yEzTlXL4UT2iYmNSupQLFRG3X5twsACUiJcv7QDvEpZX?=
 =?us-ascii?Q?QZyEck7Iw9QUQkH0rC+ottREiYbrta25IYRoWZC5tarlwwmZ75WhuW6W0dhb?=
 =?us-ascii?Q?LLVW6yjSNZHdtyOkPSt5nbnEvkybaCUQTK6cmLKk2kMNt4fcc9svu6wKok2h?=
 =?us-ascii?Q?0OzCkvZScA9kSNJo03OtsF/HdnoQP3yXRokayDuNdnNee2BcSOE/kwp9lOCi?=
 =?us-ascii?Q?OikbOf6LItt9xEOBo/Ztc4QvLY46RjM2YPeYW83fh3xU7Kc3iuKESYvcgfZ2?=
 =?us-ascii?Q?LueF7v7NmDe4dYoTubBJ/dptc6InZ47c4PY6e9C7GWh37bJ9KaSQVP3EGpy9?=
 =?us-ascii?Q?iGTmAcixOE7FyljVm5LpBDxBv1L1hzmXrrK8nQU7uAKSmEUOkIk6trNFdn23?=
 =?us-ascii?Q?tEf98gi0JMGMildfLi8cB5uhHUX8K9aLbHKWOnsXoNtrbtcqUoeHDA/niAEi?=
 =?us-ascii?Q?4g6iBq3X3QnDLvjtrNJpnE2bpDI0GgMXNCCPov6P+fGXSZ0WYWq1KBLJEjzQ?=
 =?us-ascii?Q?VvqoNtyJw5DuB+/gXBUgriK4Rs9nNi/HXdseDQuIbEc9zO8OfpliiNoUj9qB?=
 =?us-ascii?Q?GDvr20JqDRxphKR7qtP/becq5hn28wkg/1EDJNp7zBHS3NLYkLyv26HHJtjP?=
 =?us-ascii?Q?fAEm00oVsDCUnwrPI42RRoi1L8gvp6Sbn0sm2C8OmecCikx8F7RTxBJZSPT8?=
 =?us-ascii?Q?T5mxCRGWS4qTl7r2n/6ja3pRRdKY1Tm6z9oP74eDM2z4Ffd7PQ77XEwJrM8t?=
 =?us-ascii?Q?c0/z/udkO854V55O2Kn+Ol9sk8vGSzCrn+RyfQCqWL/y15Q+5mpgbwOWD2UI?=
 =?us-ascii?Q?9Lk5iLWgDDUjGywaQ1rDr3BsjF36nUQwyHvEiOdsAALRoDqqhwgUBlV8MKdQ?=
 =?us-ascii?Q?UjClpF5C4p2zf0FX6hBuVdXzJEAQ9QrjGsk5zT/kt84AEC16rg1RzJa6eWnB?=
 =?us-ascii?Q?zkiV6d21XQv+HCyq7z7BNgf2QBv2Dalof4LOsvIQzEm8ZTgWYBoL8oQJRRi3?=
 =?us-ascii?Q?7DPtzdMFue7mrxg6azA1fUA1ESRRt/d9HMw3YQYev4H8AX+EqE1WSpKl8oSv?=
 =?us-ascii?Q?9H3MXc/wSI9tY4bbKNnX5PI8k0qpLY11QgMHGsNO6JZold8nJqNGjTrswLz/?=
 =?us-ascii?Q?FB57Rd1X/Uq1TI2cS6fLAKdy6XQmvnU9Tp/VeKp3A8r8cTHvFGCbay2pSSNy?=
 =?us-ascii?Q?8WZzuX4MOR1kRCFPheC/93EUCSAVQkbZ7gaR7phZQjZpUVx8YJglsHDId1Lo?=
 =?us-ascii?Q?v5AAELudYAa7lLyi7dSE0OVhcYEDiY6VSZnSDX19KfklFNyYmECJdBGbDuhp?=
 =?us-ascii?Q?C99OwNlPm7Pa22gGgcK6FGtJuRG+r6R4Uy/hNcpcVcWZKNh06Mik2M0RddE+?=
 =?us-ascii?Q?ag/KATly8lbDhxO8e2z+bCAB1sFgpFeviwn9dYvZVI21/IkvTyjsCo0+QBl9?=
 =?us-ascii?Q?VQrg5p2E4fb4fDpQgZGYrueRkXB6A6edPOUyBjNUyZ6GjuFRiUqPxi0fcoYu?=
 =?us-ascii?Q?1HKpRRXcw9pzcHLaoBQIM5sMq3w9FvEcKhkHsD/7tL8Ssca2IB2TWeL/rNC1?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe11005-3a14-4f3c-3e17-08ddb7af2a4d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 08:21:51.6095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VArEN48qp+tsN3Uz435VVXmgLW01Ut6uySV3SPJrf5RZJG0QMJR8kzsLNEqupBA1gXc0tdlwpAbclUXmp6gKcsAI+llxfFgq93C+qCd5YH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8841
X-Proofpoint-GUID: n1J1mr8xA2KEjLwcygBI070gy-iW16ff
X-Proofpoint-ORIG-GUID: n1J1mr8xA2KEjLwcygBI070gy-iW16ff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA2OCBTYWx0ZWRfX1F6nfL0vYkx1 +lcSHt65qqwZwB9QUCNmDaRrGaQXzLcOsBxbQIdrdLPt0KX8lZVMJw0ALSUxuWcn4aC5AaPOstX 4v6HXdHj5Yx82Hx3b0aZHG4+d+T9oXVFb0JnlMAYyh+w60ozml3OthyfzkIBXIpW2sn6KBfgrsw
 97nb7q9+vGJNE5TZlx2g4duXrnq9HMkQljq84kIQvFd1UsAN/PmbE8u6RqeU7TJXQx6UCQfJbP+ 5Q8GIiVwcC+kqBx/PYKhmcM6XbKx86VuzKEiQrzcBpE7bQsC0m/2I1wFipHpC5nuFeG4t4tUgXc 52f4tfPUYAeGHNfKcRCBzXsQ12dF3xfAWrgspE+2x+gLXbL+Zcfb8GIheHgp2qr34xZic2JWtit
 FlDUI+HyRNayz4N1mthODPB5rIUewKBwZX8XOtpaFkFe8RY3z35o8MGYa+8sjIuoRccu7T7S
X-Authority-Analysis: v=2.4 cv=JMg7s9Kb c=1 sm=1 tr=0 ts=68624926 cx=c_pps a=TVq6N9vEzvcMmlHwv1BkoQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=sm-PleN79lQA:10 a=6IFa9wvqVegA:10 a=JIVOxcAaAAAA:8 a=t7CeM3EgAAAA:8 a=t6SoBD8iNH_9Iw9vUf0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=982 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506300068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 08:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219457

From: Guocai He <guocai.he.cn@windriver.com>

The SRC_URI is changed to git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 59b9d7de78..f930500de6 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Target Communication Framework for the Eclipse IDE"
-HOMEPAGE = "http://wiki.eclipse.org/TCF"
+HOMEPAGE = "https://gitlab.eclipse.org/eclipse/tcf/"
 DESCRIPTION = "TCF is a vendor-neutral, lightweight, extensible network protocol mainly for communicating with embedded systems (targets)."
 BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 
@@ -10,7 +10,7 @@ SRCREV = "1f11747e83ebf4f53e8d17f430136f92ec378709"
 PV = "1.8.0+git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-SRC_URI = "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=https;branch=master \
+SRC_URI = "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=https;branch=master \
            file://ldflags.patch \
            file://tcf-agent.init \
            file://tcf-agent.service \
-- 
2.34.1


