Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D89C02180
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 13:52:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.49222.1737035512318580018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 05:51:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3111d49cac=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GCvoCf014124
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 05:51:52 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt75eaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 05:51:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJCE7D6q0fdHVlTFPmtRRBSn1mslEQFSYjnhWf+Zwld+iUiAJvAfd/7CCNmAoX4csS8jyk1Vfep3Dt5+uvXVeFq1bKOQ1kDMD0VQSDhps8OFWKXNtDqIo1KTK1Skkj8t3MtP+wgrUpUd9DDmOSSw42T8fs4ACo1PUD5ntwt/xsgKJbSZgETGRoycZiMS1OY7Z8V28ik2e+3DpiPXd2rikGapXUZNnIETkO3MixNwNnuafPOrFTMIiVpZKzr/6U4p1nvCYGn9WsNN61dsAdFT0N2dHECWATSlfu4Pg41297YIVmofQGnpfCKkSqWFANub+oLITzUuRjPxrpBFtEJZzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ry+6Fwm4NAyGdP6pdxbvCuOHi7ur5EZr1DBcxwMlNPs=;
 b=KKpzKSH4BBVLfibo6aDnqbRjUPJ/99heDThKdYLZglKPKeZq2AbAy0hDio+3VmqjNfYajCsqKkp9YntUvCTsHTNw67J39yegF9OR+HDsZtz37BQCDa7ZKKYP2LQkXdBFFJqZp1gA3m9Vyif6hvWktS6S/r6bSDdZKNxBJNqkjJ5jThdxdSHrRVA0hBGMZ39dwT8Yy8DnbkOxYMtRGGzlmMTXpR5w4FxG0f0zdpgqDU+TbCzBGTnOdGh6H8YE/InHpkzotCEnmVTMA781JeJiIVx81luPS2BRllWLU+0OeKK0Ci1Lppuy2sn1G4qggZGIh4pNp9XKpa7xX61awy0GJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS0PR11MB7444.namprd11.prod.outlook.com (2603:10b6:8:146::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 16 Jan
 2025 13:51:48 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 13:51:48 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] avahi: fix CVE-2024-52616
Date: Thu, 16 Jan 2025 21:51:38 +0800
Message-Id: <20250116135138.359950-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0327.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::20) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS0PR11MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: f3dd5926-d435-4564-89fb-08dd3634ec12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JhG79az7WwL0l7IQt6fe1dsYAOiryN0dJVsyGtvOmA6aMTqvnvUa2JSivYUR?=
 =?us-ascii?Q?Owf/pbIhiI9IFx0ze6j2Q/WVFYOGWpyDJdxbLbzeGRt5mSaWAy6O2siuPetP?=
 =?us-ascii?Q?F740eF/R9aIQE7BTw32MpHhEc+BC3ePyITYhEd7M/kytsYVGt1Kj9yz0xt1U?=
 =?us-ascii?Q?AOeEujsOUHI7d3iJ0tf2J5oE9QZnK3GEZw9WqUngMq4CNOA6bO2MP+/vCvvu?=
 =?us-ascii?Q?5I8W97qhdCn3GGNvwUQUxpqm9nSXYJh+S9URl6aCCsbTQRviJfJrHi9ZtELe?=
 =?us-ascii?Q?aTIn+2EAGN/c8DsVWCN1buxiXPDtn2AiT7kpOlXJjxAbQGa7d0Pguk+9X38c?=
 =?us-ascii?Q?Miz7H3cqc+Nbz2/abq3V+CCpIW4A34swedWtF20zlBTqNRPR/E5zpKgr6T0w?=
 =?us-ascii?Q?hXHX6GrjR6/GImig6CwDULscg5LXa06vw6kPiDV9vz39GYDLfBbOtuv7tBz7?=
 =?us-ascii?Q?HQAnGJsH1ZI2fDfVVwtA+4z38PpIHO7AwvnEoOCFEo7CYW/eElSRF76ugWth?=
 =?us-ascii?Q?PVvyBxYyMWSNiKY8eCy0g+VNC7le49gsB3X5hPpRSgomZV9KKyAxbofLJ/SB?=
 =?us-ascii?Q?avJn+c9s2IRDP6YzV98PqIfI967Ne1+C1PEIDiwDHqZ9BN7/Dlvwc4tNieyN?=
 =?us-ascii?Q?i1vqcsfHTHY4pfHN+eeXpQwC1uX3S6FQJGDkQIK/uCi5vp9ZCvPjDxkpAE2Y?=
 =?us-ascii?Q?G2PsSHDE7bPy0wsxP9Ixi1l4y443Ayx4Tmrqf1QPWKVY7iRHyBbmn+L+OgkT?=
 =?us-ascii?Q?U/Fcop3JM1gbKY4E2ivsUTvGxK+hu91PTXFPvg8+7eq2OeLzjDEok1ZU07ef?=
 =?us-ascii?Q?a8sGxBPRyWnLWQT7ssfXNC1CqJJZK84/Z96i9n8zKYmv1cBTyNWUoNov974E?=
 =?us-ascii?Q?G7H0pLMKcy2FVmEoxGVkKq2RPGRyncOW8lQQSVRy1n4exDdTd0IRCiDDar20?=
 =?us-ascii?Q?PTf01M2lhdW5hnOIx8Us3HyNIreOfjeAI0LrfOjJ4tm48ugDfB5Twpr5Ht/A?=
 =?us-ascii?Q?EYzBqGIvQmmv07UBeQNhh92KOAlVuTdKmqT9cEDP1jHVgy84sFQxCfKxkyeZ?=
 =?us-ascii?Q?eyLbeu91cGrqauStGDojfjxnYUDO2LNvXhyK27XQGFMiUD5o+WTvtKTxgPf+?=
 =?us-ascii?Q?7k5XXE0xvxOkbo7jS+CO8fCXbjb9QBr9RcHEme8gMhbxDqWbAtetsPoev3AU?=
 =?us-ascii?Q?ww52F0vg0Q2YyS5E40bIXMjOQhR4IX0Hdp+W42YQlWMZ2eL1ZtNkgs4J2QoD?=
 =?us-ascii?Q?dK2Mpn2oUjZJ+UDbXoYzPaCyhDw+oB/oCkUMxvttmpsarqWn4r+3QLlx7+x3?=
 =?us-ascii?Q?KEjfhaNvHkH9SjwfK3QYgxMB8OywZ3kmXz/a3zddNONHkfCRlL4UHO4B7V5g?=
 =?us-ascii?Q?zZSjoRaH9qYWnjymsCerSDdJeTFHLjWxyf3MsdiRcP7lHLVj2A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BUtvTVmoT87BseNVbnyv1v3ikoeXEr/apUtTDX9lkOl7tttl4EUIsa+iePiL?=
 =?us-ascii?Q?DjhQCoKZ6JbhZ7UkSiexGfHCriUGVnelFHarXxuFYCbUPfTRhNgFZxxxq8Rf?=
 =?us-ascii?Q?Sb3ROipS3FMeI2zL1aDOA2uV/80YKbPcPvOEtJGurygVBQkbR/4QHuVGNyF5?=
 =?us-ascii?Q?zV5Qmw6bc+AB6mwSiadOt77R7rVmb3g7bMQHQB3gwjq8kyj8WSAMcwMD+lvz?=
 =?us-ascii?Q?71hZush4UwXPcWHGRjPOz8z8LAeqUeDEsST3UpySXn9/n/NZV2yUT086NFrL?=
 =?us-ascii?Q?fVVfDCy52V6tv+nUB5qhPISSWhAiMYrMyDVtsTonKzv5rDo17WOSE7M0Pim8?=
 =?us-ascii?Q?W/fW8VR3pc2VJwH2MtyejBDYVoa7ejHe4etKjipiRz+zX+KmIwNBj/sPxnOC?=
 =?us-ascii?Q?ffkGUHBFGBLHcQWRrUx3X3PGPdrpUyvcg4TuFvoQHMtiHsgpHu0aKHRM302g?=
 =?us-ascii?Q?UpVapsCMddEKmRZqfhCbc9DAr8BOoHZANk4u/vgl+1p56NjszyAcZPfosAby?=
 =?us-ascii?Q?VnXNJFrXUCrd6wLnoe2jFFUg/4hMZit1h6Uu029n25CeQi8KpCN+s1ansz0v?=
 =?us-ascii?Q?SshupbGSQzOsW1ogz9nVkVueuj2yjhFvidQWzywxVSiikf7gvCJyPzWQw69a?=
 =?us-ascii?Q?ANpsJF9/XwmkN3E2qiPjQaEmidEcpDIa3rJdsb4OxR7oebKIepZpu1wNALJy?=
 =?us-ascii?Q?9PRGQ7PIvTyh8MdmpG6kCkhidUwAZ58wsV6taBm2Mgq9LY3/vXBZFG41VYmz?=
 =?us-ascii?Q?K85GK8qjg/IXDpyuLlMndvKBJnPBaXcAZiW2OflLOzjWsZ2Qe3g7dYS7rZOn?=
 =?us-ascii?Q?Ip91BP7LNbk15Z3y8mV0hjorAh7e1l8JSqaAsVkFmTIb2xR8YTWZShIAZ27P?=
 =?us-ascii?Q?9g3RrFnPsMXA0/dYbnEzx/RmB1MYvOLu4gvZMw31FbeqcECQGN89n+JZWKwP?=
 =?us-ascii?Q?RSqBYSwQBFWBzTzLlD1eUCRbYVHx7NQKFR61esG/rKuwc+zm+S5GA0bBB5we?=
 =?us-ascii?Q?HTcEMN/HgUZG1avSiJeiwjZSr2tzyiV5cAdjcqB584sZim+6PPcIVfRGV9T0?=
 =?us-ascii?Q?+4m4wuN3RRKhEIm1hKcv/DXzUban3nNAx7DTZic3cbfzSbU8is098sg3NGME?=
 =?us-ascii?Q?68IsvzQ3JqpwAP/nO5/dOscGmxWZdvng3A5YZrU1b8sDP7O4/FwW4wy9tC3y?=
 =?us-ascii?Q?wfFYbjAUROT158SEzzMdGxb8ggvQXx45rzuCPpewbRAkqrLKx9aELDSS6No/?=
 =?us-ascii?Q?gLvPV5AIKZJjDYXJ9Io4YcdfWLOCv3rJP49TALfg+jnXdguuRzGVHHtV2rsa?=
 =?us-ascii?Q?MTWrTHk06ve+yOz32cdPhj29E7l6sdzpUAC069/V4P8+/t8PKhAvA+7Zs4hs?=
 =?us-ascii?Q?U2p//lE9CGqV+Wr1vpMJEs0NEKN7kTJG+tnqKvuFH4qTgcL6wfXvFgMxFsRe?=
 =?us-ascii?Q?6HFWt7SWBOkIanu1ni/DzqIQkoU3idvhD0rQugoXOSYhZH+ki78oOO9TrPwf?=
 =?us-ascii?Q?6tXkm9RPSlGjSVXzrU/PUWo5PbLs52IkYoaEU6tOhNsbul3NspbNVWPOao5I?=
 =?us-ascii?Q?KWmXnec8zbLWtFBsvd8ibUCsgmX3l6++MAEE5vn8VF6Pn7eH05QKZUgPpZzV?=
 =?us-ascii?Q?Fw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3dd5926-d435-4564-89fb-08dd3634ec12
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 13:51:48.5112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TcQ/l31rRbpZ3/M6Gu/ysRA+1Rq1f8IJvRKnVCEfxq1B/hInKtrfOYATMiXJ6I2Lr40QLravf02vn8s/GIm4zy0UdEe1P0U9vZGkYejVCEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7444
X-Proofpoint-ORIG-GUID: juIyb1Jo9HyJt6kbZBXPmBxdeGgPAHfi
X-Authority-Analysis: v=2.4 cv=SeoNduRu c=1 sm=1 tr=0 ts=67890ef7 cx=c_pps a=OGaRt8TyNAR4X2Yz4FfAAw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=z2BOVTbumQ4ULxXF9BsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: juIyb1Jo9HyJt6kbZBXPmBxdeGgPAHfi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_05,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501160104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 13:52:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209949

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-52616:
A flaw was found in the Avahi-daemon, where it initializes DNS transaction IDs
randomly only once at startup, incrementing them sequentially after that. This
predictable behavior facilitates DNS spoofing attacks, allowing attackers to
guess transaction IDs.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-52616]
[https://github.com/avahi/avahi/security/advisories/GHSA-r9j3-vjjh-p8vm]

Upstream patches:
[https://github.com/avahi/avahi/commit/f8710bdc8b29ee1176fe3bfaeabebbda1b7a79f7]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/CVE-2024-52616.patch          | 104 ++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 1f18d4491d..1163c17e20 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -35,6 +35,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
            file://CVE-2023-38471-2.patch \
            file://CVE-2023-38472.patch \
            file://CVE-2023-38473.patch \
+           file://CVE-2024-52616.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch b/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch
new file mode 100644
index 0000000000..a156f98728
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch
@@ -0,0 +1,104 @@
+From f8710bdc8b29ee1176fe3bfaeabebbda1b7a79f7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20Men=C5=A1=C3=ADk?= <pemensik@redhat.com>
+Date: Mon, 11 Nov 2024 00:56:09 +0100
+Subject: [PATCH] Properly randomize query id of DNS packets
+
+CVE: CVE-2024-52616
+Upstream-Status: Backport [https://github.com/avahi/avahi/commit/f8710bdc8b29ee1176fe3bfaeabebbda1b7a79f7]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ avahi-core/wide-area.c | 36 ++++++++++++++++++++++++++++--------
+ configure.ac           |  3 ++-
+ 2 files changed, 30 insertions(+), 9 deletions(-)
+
+diff --git a/avahi-core/wide-area.c b/avahi-core/wide-area.c
+index 971f5e714..00a15056e 100644
+--- a/avahi-core/wide-area.c
++++ b/avahi-core/wide-area.c
+@@ -40,6 +40,13 @@
+ #include "addr-util.h"
+ #include "rr-util.h"
+ 
++#ifdef HAVE_SYS_RANDOM_H
++#include <sys/random.h>
++#endif
++#ifndef HAVE_GETRANDOM
++#  define getrandom(d, len, flags) (-1)
++#endif
++
+ #define CACHE_ENTRIES_MAX 500
+ 
+ typedef struct AvahiWideAreaCacheEntry AvahiWideAreaCacheEntry;
+@@ -84,8 +91,6 @@ struct AvahiWideAreaLookupEngine {
+     int fd_ipv4, fd_ipv6;
+     AvahiWatch *watch_ipv4, *watch_ipv6;
+ 
+-    uint16_t next_id;
+-
+     /* Cache */
+     AVAHI_LLIST_HEAD(AvahiWideAreaCacheEntry, cache);
+     AvahiHashmap *cache_by_key;
+@@ -201,6 +206,26 @@ static void sender_timeout_callback(AvahiTimeEvent *e, void *userdata) {
+     avahi_time_event_update(e, avahi_elapse_time(&tv, 1000, 0));
+ }
+ 
++static uint16_t get_random_uint16(void) {
++    uint16_t next_id;
++
++    if (getrandom(&next_id, sizeof(next_id), 0) == -1)
++        next_id = (uint16_t) rand();
++    return next_id;
++}
++
++static uint16_t avahi_wide_area_next_id(AvahiWideAreaLookupEngine *e) {
++    uint16_t next_id;
++
++    next_id = get_random_uint16();
++    while (find_lookup(e, next_id)) {
++        /* This ID is already used, get new. */
++        next_id = get_random_uint16();
++    }
++    return next_id;
++}
++
++
+ AvahiWideAreaLookup *avahi_wide_area_lookup_new(
+     AvahiWideAreaLookupEngine *e,
+     AvahiKey *key,
+@@ -227,11 +252,7 @@ AvahiWideAreaLookup *avahi_wide_area_lookup_new(
+     /* If more than 65K wide area quries are issued simultaneously,
+      * this will break. This should be limited by some higher level */
+ 
+-    for (;; e->next_id++)
+-        if (!find_lookup(e, e->next_id))
+-            break; /* This ID is not yet used. */
+-
+-    l->id = e->next_id++;
++    l->id = avahi_wide_area_next_id(e);
+ 
+     /* We keep the packet around in case we need to repeat our query */
+     l->packet = avahi_dns_packet_new(0);
+@@ -604,7 +625,6 @@ AvahiWideAreaLookupEngine *avahi_wide_area_engine_new(AvahiServer *s) {
+         e->watch_ipv6 = s->poll_api->watch_new(e->server->poll_api, e->fd_ipv6, AVAHI_WATCH_IN, socket_event, e);
+ 
+     e->n_dns_servers = e->current_dns_server = 0;
+-    e->next_id = (uint16_t) rand();
+ 
+     /* Initialize cache */
+     AVAHI_LLIST_HEAD_INIT(AvahiWideAreaCacheEntry, e->cache);
+diff --git a/configure.ac b/configure.ac
+index a3211b80e..31bce3d76 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -367,7 +367,8 @@ AC_FUNC_SELECT_ARGTYPES
+ # whether libc's malloc does too. (Same for realloc.)
+ #AC_FUNC_MALLOC
+ #AC_FUNC_REALLOC
+-AC_CHECK_FUNCS([gethostname memchr memmove memset mkdir select socket strchr strcspn strdup strerror strrchr strspn strstr uname setresuid setreuid setresgid setregid strcasecmp gettimeofday putenv strncasecmp strlcpy gethostbyname seteuid setegid setproctitle getprogname])
++AC_CHECK_FUNCS([gethostname memchr memmove memset mkdir select socket strchr strcspn strdup strerror strrchr strspn strstr uname setresuid setreuid setresgid setregid strcasecmp gettimeofday putenv strncasecmp strlcpy gethostbyname seteuid setegid setproctitle getprogname getrandom])
++AC_CHECK_HEADERS([sys/random.h])
+ 
+ AC_FUNC_CHOWN
+ AC_FUNC_STAT
+
-- 
2.34.1


