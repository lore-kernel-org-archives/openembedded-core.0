Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DA1C87FC5
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 07:59:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7184.1753171143729334583
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 00:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9298434120=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56M5INRr3476556
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 00:59:03 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqv0frg-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 00:59:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSwNvoB6Kug9PYoG6O/KtIo0O+m7WwfdUGL4Q8hDr7H/8eZ+0OGYeeRHhfMVdY36X3k01785v4z238vt1LwY80CUJIyAGPVareUXRe3tP9RCw2wdlCJwrM+rAyi6nrKAGi0U7yHys94L1ufIc+YT1RJ4cFeNOBLELG2okfprxJTrDopVPS6jBlU3HlAHe+Rkyq6F5DJXZtv4puBTZkwommY4BHCCVvk62G3pK0h87jHYDdW39Bb4neUi1DKHdf5IqHm88NtYBq47gO2swImXxBbDeY/I1U/vpslLdOe7amqFLry07Dl4bswAZnttidMrFdkpxp5HagZyKcG7MZvv3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MV4ZCZDx6mPqdpLb3hho9kf2WnCOG63seqhb7xui+8=;
 b=VsJ5jHscLCWbBTiqM+nVqYh8TyWLhM705sM1tLRB3eYn7xoAi4S4T05nYyCTIRTJ2jeCxsyqleJ7lVoG3R51CbROgr4a4bDoTnE+54Il6+MbVEjeG51tUhTaq7BK5x7VyPUQhCUWLdNwlGU1+rqMCqtOtLCjqrH41XUhvDN/b4MRrEOJh92RZTVelh3lnFbutBOeDY/NKcDFe2VwA6pC60KbXhsUB2PuFM8sLxlEEloyGV16n2ifFtonPm9IYhaIm1D0iNEdpOw4M30axQiXm5yR1+cu11UUvbPDQOcD3bHHnfqDOBeoSzVr2DLY5A5i65v+kwuWfd7ULQ3n/jND6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ5PPFD56C4208E.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::858) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Tue, 22 Jul
 2025 07:59:00 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.8922.037; Tue, 22 Jul 2025
 07:59:00 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH 2/3] toolchain-scripts.bbclass: Support target-specific environment setup scripts
Date: Tue, 22 Jul 2025 00:58:38 -0700
Message-ID: <20250722075840.664002-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250722075840.664002-1-Harish.Sadineni@windriver.com>
References: <20250722075840.664002-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0026.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::39) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ5PPFD56C4208E:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e79049b-200e-4bc7-f448-08ddc8f59dc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0fgx57czbEtpwSKPYhFoE8uufr9Q7FYfopgZgyMLqRaQ2I+LzxKcr/AE8dOd?=
 =?us-ascii?Q?RxWMmiinJz/C8rtkNTNJkXKRI521KJqlVub7DmQhDHY4+tFxPgYCWM3lfyo0?=
 =?us-ascii?Q?BOSbEB5rHgXhDHY/lW0pugVbvMXgoW/FnE/izq0vfB/zLf5RxgfbBjZFUbQB?=
 =?us-ascii?Q?HN7x5LU5vQkkha22/x3SnV1Zwe9e2OPIz7ZKBPEeN+RckBbA/ZWyJ0Gd+dBl?=
 =?us-ascii?Q?CRg0Y3h3Lhlvq+40S/Xo5+1G+HcKPpIsTTqsF7wL0qSOQTyLUdaGBM6xu2gf?=
 =?us-ascii?Q?Yp+ycKZPuNoUlAJ7EoexHuqzMihTplxVEnxCDRlbqcXtGhMbqB5FZhJ7hoG9?=
 =?us-ascii?Q?3l39kX4MOeU92S2H1C4aD+f7lLIF3K1YEx6AxI0DEBBoMXq0jfOUI0YwaV8H?=
 =?us-ascii?Q?HEQrSPfZPLRTvkMdpBOLsMVEvZgW40DpGv49/fzV1PXxOqjw1q2MLg57d5V8?=
 =?us-ascii?Q?TrsZKdcpAgSXg1q2tmHvVau+Pp0pu00DkPnG9XowHPu9wQpN5HU6qHPcDgAs?=
 =?us-ascii?Q?J6YWJWYuUi3iur8RGl/c/If9dFs8HfJ507wK7yiewbU668i3Q6IWhuwtBkga?=
 =?us-ascii?Q?AZ20Jh+PiRrL25qilZoM3U8vv6/N/Fd7HKCJpl1E5EHcVRmy9DPDun4rsGJz?=
 =?us-ascii?Q?sYCLtjNF6p+S1uym2AZ01LR3mAWarltWJltc7tNH8lvBVMuGpOYGjEpwoD4S?=
 =?us-ascii?Q?P5EkBcswSpNTS5BSZfjqe3uyjQER+QYx1Hei+DbhMT34wKuBUXTzq5XbxSi/?=
 =?us-ascii?Q?YrLqwTzbOFZcKatjnlT3h2GAZs3cbgbFeakpWWQXUnoODTuPH3BuAnFyVYhM?=
 =?us-ascii?Q?NNSiY2DPuxwdJB07gqQGnPgAgPRqJG/qJ+AwS3sObNf/kZuXDoeZ3jJ1S731?=
 =?us-ascii?Q?fSF97Id7bmcFl787/O/2WPizcN9xJyUfXh3rPlUYev0SJEvfDiql1pqB+Tq0?=
 =?us-ascii?Q?Ov/wRwyVj8GMMAeDHi15VyFiAjPuAaKoIaahbUZke/gwyScr6yf359Dzls0p?=
 =?us-ascii?Q?N8p1tagXpU0OX7+ZKnJkRaLvuUAheErwuEiXGRmaAMlrP9jopFdcjFK/3yy3?=
 =?us-ascii?Q?jRkWPgMY+gxv9Z0r/fVpw79jekFS2EspRFZ68VPpVTWNPa18DSxHHXFfjv/4?=
 =?us-ascii?Q?G564FXxnsXuBSrnFHDNrQ3JYN6zZw7ZWmfxaON89fV06NXVBs62kPC/CIXD/?=
 =?us-ascii?Q?WfBwBzEqihPfsREs1wE1ttR1mPnmtxjJCmqIhd+AGl2T+q3gpz28sCKAgQLx?=
 =?us-ascii?Q?/ZMYi88cLDtboZEBsV1czLSMG9m1Os+8FzVbu6Kg/GCh8+xeYON9zotTo3XY?=
 =?us-ascii?Q?XW30dGa2wrFLQGWCJ2plqMVrc1OMVoMSsZV+Gwr6isXoyRT7hvu6VAYQ11rj?=
 =?us-ascii?Q?CNVCpfVM83LRSiBwgHi8LBe5c+tejWvVyx1bTjgtIRyOLXVEPljOnE3aMNQl?=
 =?us-ascii?Q?WZWFKFiUdZvbipSU7yeXp/dg01YW/zg9bqtIViOZYhJrcAj4QhH2tw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/jZZgII4xKkJDYvwnnMh+zNXkKdL9+SJgHXeN6qfO/KkMMRwqPmID3ZsRUWK?=
 =?us-ascii?Q?0z41tTH14hi/Kyz5z2DiM7w6vjys3yQ4mY+8zgo5nQHh/CCVu/bltaXJeovm?=
 =?us-ascii?Q?6lMWXN2AhNJw0lWvWCWODtzzSZZjxvM6SaGL3G+rPc5Nvb4ZDqrw+s3AO5EM?=
 =?us-ascii?Q?39Zs6WZbvEqLHe7m/fcO5ENBKgyTBv0na9/8ndV8BSOGj7qw5vvM5Nq5tkMd?=
 =?us-ascii?Q?GLpAzMmXnhtJr6npkyZ7UPFq3T50FhoODuOsPhjQ+W14bJ/3/jwUb6ky7h2D?=
 =?us-ascii?Q?uk6GOhnkhwXJDZ3b6UjC/Oqk2nOvt8qeiozLqR2tfgw/+NMgqA010cbTFpzw?=
 =?us-ascii?Q?dUs9G03lHQ1XArLMDqTY0pSv5k2DmgIUjC5doAqgypscWD27dMqIwyG+pex6?=
 =?us-ascii?Q?CFHyYeWIiz4el/xSn+zjOiZy/q2hAiUcj8Sua3wY4Hc7/sNiH1ItZL831l2y?=
 =?us-ascii?Q?EhvU+4LnyHEmQOkXhw1Evu2f8DmTKWRqz8aU9fv07ZRnptcTw5otnJiQY3Og?=
 =?us-ascii?Q?TctTi8q7Bmkj7vwUKu2Lw8lTpmFpOlddIgm3whOXopQNQzbd1V67tnDNvrmE?=
 =?us-ascii?Q?eLrGAE2pXqUzf8dgw6o2/E5N0y2qJk9eUk1cr998QhF9DuawgWVB1my6xmK+?=
 =?us-ascii?Q?gScZl6JdZpme8gx39PKMJiAWaM+VV9c+733F+VK3hGvm70nUVzOwJgTBiBT1?=
 =?us-ascii?Q?u4xCZyhz5d+eMJPgOHxcM1DqqssvQ39qAVOAlooPBJ1hVHaO+2uue/2VpERQ?=
 =?us-ascii?Q?X1/TGi9MMpFd6JJ0iHpaURPollTIawS3q+sJDmoWsTMKAuMmCWgjBWEYWH48?=
 =?us-ascii?Q?n0ZZJotg4Y3Pn3tH88HIIejPcWWyCozQqtdoe+2IOQ4qb0tqrH+wIzNnIGye?=
 =?us-ascii?Q?6Tgx8qPxBNZabX+3un4e6Qx6sVp2VCwapcxii1vtvTP4/I7n1bSVTc2XGEkE?=
 =?us-ascii?Q?VZIZKURVUMIhFKgFEq8w2JWZUTCjiizKPeuo2Uk1htvs+e9L+NuKcTWvoTDc?=
 =?us-ascii?Q?ihvPcwTRB9dNqfMrVWBrOnwRQKl9jFEtd/+h7AUx36eFoSWTmUbpcI7ne2hb?=
 =?us-ascii?Q?+jOIxh3HVtxh7LWIRyBXV409bvD6SyYLUpm+JRTQesKFlSfYpdORpPE7jdO/?=
 =?us-ascii?Q?C9QN1XqDK10jIzWr4z7dI2RY9YEIRkDEnK8zV7mPljfDHEJRCJ+Fu6uSBtLu?=
 =?us-ascii?Q?aiup2EfFqou/u5TBBAxPMw7JQg5qeoggmM55FckdEn7QedxLlfnjWZNkHgq4?=
 =?us-ascii?Q?GfbYy9JDIRqckniKtHu17MYm8Oj3wR9joGZVK8axTbCE1h7MhEqzrHAxIRHx?=
 =?us-ascii?Q?iqVxzCETeM0rx68YEmSbnpCQR/Yml4Yp7mffoCAWa9NH0E5bujKGYY5nmTsk?=
 =?us-ascii?Q?Pv+MwE+rm3VA7J8J4XFzmndCOPzF8bwV0Bg1K+SO4f2UUN6kwleh3D36BKJt?=
 =?us-ascii?Q?VkJ/q5av7qdNJY3tU6gmhxm8NX+1jv+oBVhdUd2TPIlJNjlk8zzVJFvJeWQI?=
 =?us-ascii?Q?B3TU4mH49J0pakYHffyH6o8aZB+cI1WgLO+HVG+awsLvY0flz+rV4RSYTSPK?=
 =?us-ascii?Q?byr0o0Z+TtByiJpBL0VkR5lw9DLhUcwKJNMXqCRjL72ARxwwtemeLmFGyJ1r?=
 =?us-ascii?Q?iw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e79049b-200e-4bc7-f448-08ddc8f59dc0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 07:58:59.7255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ua1+AhcZKYala0N4UmomLboLNYwwLOj0XspFa4r2coby/tOnvQJW1mPI/h9e69S7zkRG4IB7inX/o0adqdrNV096Clk5vG5V7da30eBLScE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD56C4208E
X-Proofpoint-ORIG-GUID: KEuh7pInYqCfG9SSWxcfp5N2zNKlhYpQ
X-Authority-Analysis: v=2.4 cv=coubk04i c=1 sm=1 tr=0 ts=687f44c7 cx=c_pps
 a=QIZECQNxG9OrthprMUZrHA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=k3yipUoe5h4FhPZAmqYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: KEuh7pInYqCfG9SSWxcfp5N2zNKlhYpQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA2NCBTYWx0ZWRfX0zniI7Hmwztz
 cv33pVK8sIburFAPVUzHUIrGO35c1CxHN/o1DeyMDgEX3V5Luw8pQRoltWjvGvJ8IP4xWzGRcrq
 74CnNSlY47MY+j7j8tkYqQDU9VRYlMAOZJRZrMFWg253E0W5HDos7VmJgOgbV9kzFTgXGZjuOkS
 lIuAt/U9IXuYaNlieKtQCaIWy46mqVY7h9kfExW8sUq0pkFT2sr1LFuwdkmwWE3wldeHlv9Y5g6
 gXwh4XRABk8ojJPNdfOKdSC6ox2j3EBQHHcuKiuSu4vYESWVPbVkGlw6Htl12zjOsaW/IA74JYN
 IXEQe+YyQzlYdgB2ybvdVR81Z5Kr5tHHmU7Js5hXevNBeaXQ27isKtbOl6GIveKyXYPMPBDrj3u
 p7dLA5iS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 07:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220723

From: Harish Sadineni <Harish.Sadineni@windriver.com>

YOCTO [#15061]
Extending the SDK environment setup logic to also source scripts from a
target-specific directory `${TARGET_SYS}_environment-setup.d`, if it exists.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index 5874a48af8..765f2d8b22 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -171,6 +171,11 @@ if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
 	    . \$envfile
     done
 fi
+if [ -d "\$OECORE_NATIVE_SYSROOT/${TARGET_SYS}_environment-setup.d" ]; then
+    for envfile in \$OECORE_NATIVE_SYSROOT/${TARGET_SYS}_environment-setup.d/*.sh; do
+            . \$envfile
+    done
+fi
 EOF
 }
 
-- 
2.49.0


