Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE635E77188
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 07:27:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.43670.1737012422341922710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 23:27:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3111d49cac=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G7DvA3000838
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 23:27:02 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt7546p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 23:27:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNJqgxid93k9Sa6BPffR5C0L2XRSXU+Vn8vS9dSJwxTSv3q5TUK7Orl5oYsLXpvLO9/h1fzYHahxNhvUFIHnTLj1q0/EnTnRe1W7HLD6SqY+g64/IVnqMY1+IioflIWP/K4xn9qoZ/iEIYo4UaX29pdEcZCpSSCZO6JqccAmCa9BFVrphxo/pXIdQ/j/Okqd5qZR6F/rgOIkFuzcBRMp5oU9cRqA4Gng+wmli816X4yrJvsUAmtyx/+jbYccJAkV3JSZGrGd7P7bWzFgvXETfwjKJ6YTrx9pTcgbobWylcL7myUjeDzpOnD5/7x8pk9hvtIBkJFxAL9cQo5/Wfq3cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6cqCcqu4VN6xVvfZrqAEjagiUI8x2b2Uu8zXbuaunk=;
 b=Db7wHzBU9KTjRWByEmsKsuicWtE+OTVvq9F8Cb7ckzZHg2Xm/LzuoaIk827S+q94sSQo71KxS9nLXTauE1SPVJ3fnhjMG2rJj5uxu+wkvJxwatsITRDznsejFfTMp3ws6Ma8ZVEZFrpjgzFJt8efPj6q6bFVrqvBeOkbgxPXGpO3PcCG0f1x4NeOcVBJ6n0r8V9N8hJ7EAcTiObpFzvDfWdrojCS5Y3zC50a0aD1hSgugFtweqKsJKgyNMeQ3MYNI3GxeWH0935Qnx0vjjNUm27cdre89F2N+Wwy4D/xf95rEtMLrjty2Ws8GiFjxcotfdTpz1CpQIMlStM0C7rJEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW3PR11MB4523.namprd11.prod.outlook.com (2603:10b6:303:5b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 07:26:58 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 07:26:58 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH 1/2] avahi: fix CVE-2024-52616
Date: Thu, 16 Jan 2025 15:26:47 +0800
Message-Id: <20250116072648.2645833-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0111.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::16) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW3PR11MB4523:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d3f29ea-6d2d-4217-3809-08dd35ff2963
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mhRmVXmY/5vM3s0BU74xVxF8Gh6HZoW6qpbN2mEf/yqIxZ1668rEbhETpigf?=
 =?us-ascii?Q?te35Wz4jVrylbR2zQelEEeQWego9JdLAgl9AA9Cuufo/9KWsUztDnhJgDPNa?=
 =?us-ascii?Q?pOFms+rcsQajJUR9d67w+nczXjJ9sxSL6xqS7rnmMGskZVNr85+MoLb6poHc?=
 =?us-ascii?Q?Wy7Bs9T6JpNQp2CqHhQAWyRWHDLSYNMOSPCevKb+DSrlU4Mb4fG02c4sNy6z?=
 =?us-ascii?Q?hoGSJLToNeT6e+gfmJRi3YoF+d59hslvCUtUL/6zSTm71las7gU8csRsdjZh?=
 =?us-ascii?Q?DUnT2445BVxxwfOyTlqUmd9eNnGHumqAtwOtYKYt54HrKyacDJ/scg+GsqmH?=
 =?us-ascii?Q?xUofE/xbYqmeetQqW13UTzrcfOUY3K7l6B0OQx4cUb44JgUBNqk8jHkmHCOo?=
 =?us-ascii?Q?Gz9nCYLSsuGau/seWYT6Xqsu0B0S/Dqa9nS7ndaSXY+vpcroKtoYIGvr3xeg?=
 =?us-ascii?Q?h1T/RtnmS+7mzY1//eAF/PB3+NDxLowY5/iKrmNclb31tbJ2BQjxvHIq5e/b?=
 =?us-ascii?Q?n+NZWHU+fMzDBoKIIUX8NJjcXpy7CUDJTXeL/rj3lGb3wqNpGq6YAC1Gi1Ft?=
 =?us-ascii?Q?I1RGf+2EAvPQCINzPT2F1FwhC0IbxbIEu3odC5mg+cmpGhhRKmH1A6MaM7cI?=
 =?us-ascii?Q?+rFomKfaieagCA3vK8fLzD9oSq4k2k16S25qFHBxB6q3QJmGcw07RqUFzBK1?=
 =?us-ascii?Q?cwSkY6lS7KYOTSWSDsMJwv6yXNwQ5NpREag3Ye+Tupdr7Ck1VzeIWJoZvkr7?=
 =?us-ascii?Q?TvSki2gPRB0WXBzpKOnbssRmcB8QgJ3h6iOg91BCnqAxCAIbjrfTSmTk9KMa?=
 =?us-ascii?Q?rAL4eoNYNdOGAN94et3jY7VITHXFCpkmNwF8VTENIr3lhGVR7oJzB3yEv8ib?=
 =?us-ascii?Q?E5gxsNvNmxQBRuFhGx3CUHhjSz7gxuXSeTSqBjVSpfrc+HVYCZ6Fp9Wh/3Wj?=
 =?us-ascii?Q?OCidsw8iTvV291TU0TvK5UJVl4IuddNqcD+FqK5JuJmXHvTwg7kcg5XXvNi9?=
 =?us-ascii?Q?JhD96b82z0MheyJ1I1KcIoS64D0yYJduuqcthzG6pjIhcfx5cB0O+46m9VTz?=
 =?us-ascii?Q?ymsUVwEneXGQS11t/+Dej5na22h7N2ctOV1RUKrEK7lTVESsxhiR7KSG+7Rw?=
 =?us-ascii?Q?O7OJH8w8CGf3jVomZmi3f0KQYRjSbJZN/6/S7BTdwxnVu5AC75YxcFpWgNwR?=
 =?us-ascii?Q?T/22XkKepV2EqOx7SgiVOmCyJuJ2Eg4TPpWCp9AfYrZCydK5WyvGd96ZydDq?=
 =?us-ascii?Q?W8WqRle4LQPXKsuZlUqa3LVjq0RhwSRpvlpHyAOwJiroYj+2eAu5EWQKsCxc?=
 =?us-ascii?Q?8RbBFYuKCRmgyNjoyv9MSNn70sEWVrJWhzMU+FDkuteCkPWExq4xZZm/KZYY?=
 =?us-ascii?Q?NGlkfutrKN076ixh20AVIG6qB3qYbSuEOK71xEagMDtt0i2PNg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aq08PosUeWMY6irc2w/TTjW5dK9pzT6DheaoMvOPCCoOtLM5ZUJVMWHA3P0S?=
 =?us-ascii?Q?j1azFk9N/4flvACpzKK2POXWX7xgA45HqZcRLkcHrf/693seKqmkXNl1c9QC?=
 =?us-ascii?Q?Fn0sUlzsBi5Ei34Uay2YrYnQ03Lmk/wKbExPrsgURHxGkXfTYaS3H5gvgSnI?=
 =?us-ascii?Q?1fHOQs233UFygX4j01SfW8hc6EFbKDCLYAtwHDpEuLR8T/oQNXdNqosLt9LC?=
 =?us-ascii?Q?epiK2Ev5O2n3FhcCrG3TBVDDK9FzVYO/BLRvMpP8gN3LFiELHxiOTe+CDUKT?=
 =?us-ascii?Q?uGie4gmN3ga0v/j0vZzfFj57oihbvW90OWdLhRt6iFLPFv8mM0Iv3jNmGCan?=
 =?us-ascii?Q?+zptTpgWnkXWSG2PKa/RQ/9iAdbnuwqYoKjkN4yXwT6CbozK3q14alaVnCuI?=
 =?us-ascii?Q?IWDt85urgozwBqyTEomXU+cMvX6m3dUwq+AkxX0HYrFvBOJ26i/h6A2h2MXO?=
 =?us-ascii?Q?Z073MVqJpKoQbZg6bFQ4En9R5YajAwsRaeZHgfQ+QKZz7Zwzb+iqSZ/30Yws?=
 =?us-ascii?Q?l4tUCUZdTjyh2EPdMqrw2YZu9x+pxK+7smRPuro/09FNdRd5Yb1q/pmzglL0?=
 =?us-ascii?Q?X7+Q7IHb///3PvHSxwhy6o+MHd9FmCbn8vrpmgWM8oEA8zGdbvc9TADtqOCs?=
 =?us-ascii?Q?ieK9MbxxrKNuU/n9ItN4+rz2x9b5li/IVMItsf9KMqvbl49NROrjJgI+oAw0?=
 =?us-ascii?Q?Xnmxevr567a+MZJypcxk2HcW16CdtoZQtbyzEoXb62QOjp477VrpJJZUAMQm?=
 =?us-ascii?Q?oKPOK0assScbwE76k6gbX7pRq0wVjwyYSXujjKK86C36ETMPewtPEFkTZWFu?=
 =?us-ascii?Q?Tk66L40meWwIEXnsl/08oK+GkGsjPSrb0Z7Hz3gt30RnkkS2Jsrs5lso0OXj?=
 =?us-ascii?Q?A66FeyX7xDYeU7FZLTz+VvhN9Sfmgg2PEvi90m2+CAYQfoNOauUa0wwUh640?=
 =?us-ascii?Q?P8SNnv4XVrCRT1yZIyX3mumuU+fSUyRSCy7naJ9yKPykhS9VE7qqNrXsfMzN?=
 =?us-ascii?Q?mLHnOi2w/UuOTYyHIDHx8kEdP3pmWP8g7CUYH04//0uady2nhZZnb2/UvgWY?=
 =?us-ascii?Q?9YmoUs9JrGOEJOZ5yEpiBAG2UeMJTfa61uxBEOpHJxuKC2bWxKWELV6hphoF?=
 =?us-ascii?Q?oUOo54VYz1uAfLlnxEKMDFxNfyeluCtLz5DrsG6LDYsW96wTyw/6XyuMxRTW?=
 =?us-ascii?Q?CXG5gdu/NSchGfgYToGvcSp0tPk0jXJdY9SypwMRxlLgwMDMSvnQ44/YRqFB?=
 =?us-ascii?Q?ZnqAFK0VKdrg8fp0I6N8vbm9xGTSFezZecczAFgBnAQGVUns/iqRwhIX+6iM?=
 =?us-ascii?Q?2DgjpnqaD16C30RLIJieV5JSKoP6bwyIi2n//cJMqJWZxWYSWr9pZne17PCu?=
 =?us-ascii?Q?PJo49AeQBCMPTL7vdQADFU9Y80xhs1BKWZAcEH0EV5E8/Iok3Oz3wgfb4w/h?=
 =?us-ascii?Q?t7E/SNkYWvZgqJPkYhGOOhSox/q+iUNBia91dvDJDol35wwuVKXCeDCx9kDb?=
 =?us-ascii?Q?0X4qeYfLy8PzBZXTQ6hUbZlikq3ciLoH8Zx3oV6MZJ3tNDpQVoUYKUMIAw6w?=
 =?us-ascii?Q?L8X0Qjmb0vPHooCCvmovs8eXL1izPiF25wL4t9BnKV0LgMCd8eZVd7Yi+dTS?=
 =?us-ascii?Q?hg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3f29ea-6d2d-4217-3809-08dd35ff2963
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 07:26:58.5528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Hw4EvjRFsJUiuwnW5dT0prvJFWNVqhD8dXN+JZUSOhZmvTFYzgGaTjQ95+RTNSwUOxti2E8XXYB3NvbqLPwF9u+IKs/XCnZu6sZ8Iktlx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4523
X-Proofpoint-ORIG-GUID: dCWV6gJG-kwUY671URUFuElbjS5wvAFD
X-Authority-Analysis: v=2.4 cv=SeoNduRu c=1 sm=1 tr=0 ts=6788b4c5 cx=c_pps a=AHWEOuZXH7ukEk4XErmcRg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=z2BOVTbumQ4ULxXF9BsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: dCWV6gJG-kwUY671URUFuElbjS5wvAFD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_03,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 mlxlogscore=999 mlxscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501160052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 07:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209936

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
index 5d1c86978a..b3739ad2c0 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -35,6 +35,7 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://CVE-2023-38471-2.patch \
            file://CVE-2023-38472.patch \
            file://CVE-2023-38473.patch \
+           file://CVE-2024-52616.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
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


