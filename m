Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50302E67A6C
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 05:24:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11791.1772515460972820490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 21:24:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=agN+/YhN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7522a5c2d2=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234gXS63921016
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 21:23:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=t/WXsmhUbV1owArgcPE4
	Hh5EA6d/mcqZl2xKHfJN2cE=; b=agN+/YhNs84SlBc1cZIqeT1qLVevd9D5o97g
	ownH6iqbIbNbJvF67YrLiyGtd6Ecil+x3XxrObiquh14Ws6doAj4wSG2GmBW5sQ9
	m7ARO4mi9PCjEK/n3VSH5aLQza58FYro2DPWsJojef+tBCa3VAljeOVtZIIs0Ob4
	sP2sjzejYne+B9pHfhx+IVaZrRwGDci8t2I3RBhc9h/1wJcs9SdUIrMXU7pplB3D
	zilHnxhh8iO/KMX+keeoolrOMGvz+d2rqMlBqoRb7wYbPqqDoiaLwPMsan7Zl6VG
	fOWRNUZdp97fh2dmjd46Z09l3iyihUejIdbyE3evlZRbgk+MQQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010042.outbound.protection.outlook.com [52.101.193.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rgjs68-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 21:23:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gL9hMVCBmRxSH2gsoKGuPsUeG2HNh4X1CdrUdFqjyHC0mL0GiBk+wdBnJX6yZ0GOJZv6axpMboad4esQh3AeePZ5Rq8qHi0wh0Ws2xIYYV9qWYBCmJ9e82RSjNeRbPpaAFZKh/02aKJpaZQn26VdOtj0qhI4kd10yyPzvpCzE28R+2JHLvYRUf5KnNjBT4IzLQzytKetNNoCstz6Cia5bIOJkRclZ3Mfh1abKcnlKh+rRfR5Rg4EL711D7LUD27hrAt52XXs6TZxENAZJzwFS++iYHh9/KnPqqCKmh4sAAp9AiInZq7SAJseeJOePXHbMAdyt9+WDHp7gyIpxbnOmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/WXsmhUbV1owArgcPE4Hh5EA6d/mcqZl2xKHfJN2cE=;
 b=s/5QoBYygUzRDK1h0rykfeSOqZ8luiDdhXoaYESFHpnqru5jhc8HSDveGlPk7hvfOh03tgyooaiZ2yj4rSk31GGFeATW+7TEFPc3Uuhi+hmwNwGnQY+/G3f0U0mjbGkJVNzSe5kEpy5YtnQQDLydrsQbzWUN0SR64e3mShGAeGOoRUrEDBW5/oJo8HJ2Q+Upiq1gWMK0vW8KHqMjZGOwJsOwxOiKd8kbuDfoRx7FqOFGUAHhLlJNBSGzUhU7zBZlW2do1aPpFvA46vRNIHhaojVfTNS5hAKLPBmzv05jBgYiwmKJqI4i91lGYqLwZVKjP1sTnQEAjykUnBcyPOpPaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA4PR11MB9204.namprd11.prod.outlook.com (2603:10b6:208:56d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Tue, 3 Mar
 2026 05:23:17 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 05:23:17 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/runtime/parselogs: Ignore warning message for dbus-daemon
Date: Tue,  3 Mar 2026 13:21:18 +0800
Message-Id: <20260303052118.2767604-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0136.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::6) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA4PR11MB9204:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d3f64ab-f007-42a0-894e-08de78e4f996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	eDLcJDOkRhLNV/zv9LqSsAhQyW6Di8ifjvFVS4cJTZu71z7ZPctUaiOI3MYZ5R8khtXkw5mLm9fSNTBvIFLnhR19OLyYzMBGdR0GmsS+vzAI9C7uhy/Ci/QBcqy+uFEaha8z8mrYgrXnNOqRlrC9LJIjz9oYQGH5gMWOHdqz3HM6wmFaYhnsqGg9QG5Gn7IpLTFGJ7YHqAy4BXa68w3ox/BPZXaTPpojeUogufuPHovw+0VwI3+qiGDQTq/uupGPXB9hSI/f0agkXETqKZnM67Pm5yAWXm5xrNm1BXAsk7UekWc29I9fH4G3SLl7IiGFBdGjB7PuZ0a3ESO5HgT9YiAd1qzIBkWuajIcQ37tXJwroOOAasoO7Y7CT9VinEh2xwTxFUsJvVKvlbXZZiWKV3KkzHQIvmynSpCCMkQS3qcC5FCxgifDCXv5nZRjD7yxhD38i1ukTfi3x+3N3vI7J1GeTynw0VwuGxQpKlwyWfnyklEc0lD4XqhKRl3aDPwmrTEe9ErrKS6sjQqBh/9POuvTn0sqYVmnUs8EXbISsiz5ra2yfZgTtLUQ2wrWHdIYqiklJWNkZj9620DMUVE94Lm4DyadNFK84UfXnbILJwS1Xqe0kGoZP7sv0P00/7mi46zGhehrtxdtBz4pqk1Hf9WtxGBLb1poFfWQz2b856fOxuteqXn2yWdOrqmCgJT4YJEzrYU8ZjsMENLfrBuWgnqL1KM8cmx/eu6E56XH0M0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BIpxUju5osryRpRGRNEHFP7SN/5VKuhaM/bRMMTwib5FTogmTSk9XGqe5mRC?=
 =?us-ascii?Q?NrdrF3zG2dkM22xLdD+bLu0erF0//kCwxFYN/t+QvKozRdJY/0ZsIpNXIi1X?=
 =?us-ascii?Q?+98/kqxgtzGCpVYrr7NY20B1gT1l4LkqHSc9HKsN7Qv+/bzQnVc1DpTzytpS?=
 =?us-ascii?Q?wYi17pcW6gPkXJxUpfZQ7O+adu8R1rAx3CONkcYoVsG/0ddpse/sjc8UqMut?=
 =?us-ascii?Q?KAjJxicGCxbgTHCT8lPcXoKaabBI7F7OzLKSmg4/nl/zlgJsA1qjwZzIbB7c?=
 =?us-ascii?Q?grFb+dQgHRjaE2IquPUeyB/RBcbyTfAoQaqx/vxudSBtBuoDmy2ap+7efekW?=
 =?us-ascii?Q?vP5aG98D+LDeRh8vEuLK29k2TSX6RIkmznZeWAy79gkBY04b0MyuUlbmfBWe?=
 =?us-ascii?Q?sXom6Jdaljs+T2nIBmpIwEFN0fkUYxwbp+iyB9H7WKwDu4oqeezfRB2GdFJx?=
 =?us-ascii?Q?mWjDSXbuPXrz+qM308baeEnhqN17du2SMR1KYvPxifdZArFoGLHzRUCo/7Jf?=
 =?us-ascii?Q?ydwiDa+eI/sOfpURYaTh0+D9AvVWXK+OxpmBfwIV2XgM/qMaxVZYr+begh1k?=
 =?us-ascii?Q?/gEtEijti5dGOthDeBLB4CLjOdNPt4XI0oyHCcGLeeqvmLfLyXgLL1aXaSkY?=
 =?us-ascii?Q?JHh4Oqb1UKlBMA2/m0/8qaoYsgcUkYPKt9FTeMNudtoQwO5S5iRELbuwCcjF?=
 =?us-ascii?Q?Jx07V/IZa8zS9Jbnu7TlZXisjyaclVws7qHpO0oL4RQsBjH4tnJzmZrKtbp6?=
 =?us-ascii?Q?OtgN3Pmv+co0jkmxI4sFCPud+Cq4XXU61B2HMsmD4HtT8/TieWplg4L9RpSD?=
 =?us-ascii?Q?FaM2ExA6YkOtOpVpgAFpVgqJJ6UAJdW2elkgD5XMAF+O2TgkEIBKzm7linbo?=
 =?us-ascii?Q?wva/bU2+D/dwuV0LBEzeUL6EwhZFfFV6nnaC0AvHfuDnpIrpbDZBvsKk4UIk?=
 =?us-ascii?Q?TKkg4w9AxvviXo+HvS7M3RlKe/OPN3sFPZ5DkVSho161QZfk4bWJmcUX4bGr?=
 =?us-ascii?Q?+900wITcn7dMzU5CKGRJ5/PBJJfN9/Wd6PFvfq31nZXk5d83i3XT98Ge6VbV?=
 =?us-ascii?Q?QTzIeZcfA+i1LG6iA/aGkHlbEx23e1KDrip5aTac/DywPEjrQQlmq0udE5Y0?=
 =?us-ascii?Q?ID96ikCVaqJr2k6HUJZTdTZXpG+6bmJtvx7EFIGzl+ehKEslvzNWK5ong3s/?=
 =?us-ascii?Q?NWDBxnOQOhYBLCZ1fSowmdihPdm6eC4QlQMbF06dQ88uf5cR4H/KB9qOHxFZ?=
 =?us-ascii?Q?cnraRrkENBU/AjxO9VG11iB17YUzox5SrDhJtoW9IXEJDxHh0tAcPriC3vZA?=
 =?us-ascii?Q?L1BwGKLWKqxim1U8RJfmq5tcoxKMJBi4iNArQEkEjk+be8xOQPkF+3bc9ydN?=
 =?us-ascii?Q?Vp69BPZihsacTFx3mk/LhDaehR8Eg5AzKgEBE7K+S+tCdLGf9sadHnOGZs11?=
 =?us-ascii?Q?7+trAZ3WTDx6zzobArrzaZfbHykNqFlA8XYrYa8Wl3XUdxiboGA7fGQu8d4g?=
 =?us-ascii?Q?lfDS489AO4j+XZdVMQ4Zqpkp5oFIkFKdGPKv+OI/og7ZquGKPEv0d3cS2JlW?=
 =?us-ascii?Q?wmUwiIzd5dy5PXoBPu3hhd8n52B9jz6eYcDKvI3LhF4GqC6XeUrKHEEJNbh9?=
 =?us-ascii?Q?9p0nPf34MndEcxpvcf9DfRAbfWTeNE/g80SdLgXS3IQZf4PUNfuLvnmYSQ84?=
 =?us-ascii?Q?xrrTPetofLY5VpiOBbFWuovjpxX29WY/rppzBIW8GmD4xiM+38rsaE3D49Kb?=
 =?us-ascii?Q?3EC3w+dtnHDCxfqFsLH2mFoHzpbcT64=3D?=
X-Exchange-RoutingPolicyChecked: 
	GquYY4cnMoYe1VB1LkaFG040bXS7+vv0Gk05i9HLb16bvwkewunn32lTLYbRVG3IHnsM2UILyu4H84yYvV2EfdWDJ6OBjfOGTb7xlfxqHf5kOq92PebJ8HuCXJ1mMS50u2VM5GDLXL5NE2h82B8SIiZtqb8j51ZHwwziPBwMT2RYZ7ge4TaFLL+DcTJqjWQXstExrBEIWmMNc7Uc0tAj2XBPdgq8xCLnQPFTStl7eCtRbEpqVM6Ojw0NqhNR+DedqdOC8Ovozama9V9Rrj0ZjHcflmzD4nO2jCfnjhZ+msv2rq9+2FxkiPQsj52g5ocTBFLtn6AcGRSW94w+F/VdOQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d3f64ab-f007-42a0-894e-08de78e4f996
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 05:23:17.1659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TExYdB7O1yIIIJR+2Yl8QPI2Dr5k4d+oTQZ7e/EYB9ex/xfDnFFMmGhMY3+o3Ioi1ww4CM2kR8la+uANl5vIm4vfUxI1JJ6SXwFisEU2iwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9204
X-Proofpoint-GUID: ATpyhyMc9OedeYnunrlRejfGMvUrSBkQ
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69a67048 cx=c_pps
 a=qId4hgiKfVM5Ptks7FQs9w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=e5mUnYsNAAAA:8
 a=LHPHIH39AAAA:8 a=t7CeM3EgAAAA:8 a=t8kVYU-aZCF5SDhOwhUA:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=ni9NkqzTpj_P7rk-pjFO:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ATpyhyMc9OedeYnunrlRejfGMvUrSBkQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAzMyBTYWx0ZWRfXwfpdeIuJHrYF
 KOB120l7CMkR2SFWgi4l56Euo83Nj/ZIZGEhvUfh+7GmeSmK3e3pmVsOHhUL5mbXieXnO3nIgtk
 Mk/2BiU9CroJQFw3fLY7Nr9+nq1TlUdb7XQpXUhkHT6nth6kfBKBAaK8KtgQ7xuStthUBKRbMFa
 3hOmuF/TaLYoasOEe7+OzJjfIhsqLBo42gkyCstVN0K2XjjVCCnPCtCmV7ZjrCrEMGb06rqwI8p
 fLsH3QYvA+qv+KOn5P2BLoy+AfzS/t/U4gyW/1lc5RodkNGWHTi639VTtmGYVop9eEQyDEPmjT7
 RlB7hknC7ijIgvMnMvqJb0yu0HTluEb05bpRlazVYFtF6GJi6xqpS1hPqk8ZDi0rWsBocun3PYp
 LfFdDqeFJW4EVVu6KK8w0hQKUHE8OaFr+2gpnmAoRi6286KJGPKqj0PbxN/9ABWKn+mPdvJM5Eb
 C4dUvV5f/pSvCYCHImg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 05:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232238

"dbus-daemon[306]: Failed to drop supplementary groups: Operation not permitted"
is reported after commit [1] is merged.  And this is a warning  message,
and it is expected when calling process is not a privileged process,
refer [2].

[1] https://gitlab.freedesktop.org/dbus/dbus/-/commit/760cb1e418f9749ac942d8435a3f7273a1679345
[2] https://gitlab.freedesktop.org/dbus/dbus/-/blob/main/dbus/dbus-sysdeps-util-unix.c?ref_type=heads#L350

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt b/meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt
index f91abbc941..08759cf082 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt
@@ -14,6 +14,9 @@ Failed to find URL:http://ipv6.connman.net/online/status.html
 # x86 on 6.6+ outputs this message, it is informational, not an error
 ACPI: _OSC evaluation for CPUs failed, trying _PDC
 
+# This is a warning since dbus-daemon is not a privileged process
+Failed to drop supplementary groups: Operation not permitted
+
 # These should be reviewed to see if they are still needed
 dma timeout
 can\'t add hid device:
-- 
2.34.1


