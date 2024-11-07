Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC1ED5AE49
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 02:43:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.63613.1730947420396327899
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 18:43:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1041d9134c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A72PjVY012489
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Nov 2024 02:43:39 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42nb28daq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 02:43:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNZ+308TZGB+J4SfFPqt97xczo0H9o6eFF/j37fad44FVu0ywmOlGtJbeqH6umybEKCESxErJqchuCSzQkmJFWKu6joKWfugdn5mhXpM5+StNknGclIiDNxUWIP0OCBmZ24daxkh155q0zA+iNLxMgB/BTOHvLA99EftHYNkkLPG4c9/WAspxMt582O85zK8PE3zV/ah0QixsV32UYIZtHSeWBNkakSvIv4Xgd7WjkBq9VzzLkDRAbM5IYEV7KcuA+tFbIoH7UMXAj1dtaNtGSai9u3YetaDquWIZT9280qIe8Ub/jfqYvo0JtirsmI9t9qyNjJAITjs6vwZlUQHdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISnTn4fp7GL7mGhQJkqAtU+WwkrH+Y/XUOCIcrv4Vhw=;
 b=T5RTuXzOD5L9qieiODfxpjPj+Q18XLegmq3frj/B/UZIrJJJREm/FDQ9CYxKuDrB8UuG8zwB6m6HwSKIi6SHT4ZKssbcQmYb6U1Vbl5iUimK5AzTkZWkrzZng3bcs0KzWofsOf1LUmvwwgbJ0hs+MSzL1ktaMpJHzwBzOaU5DfWwH3qZgVifai1enYsHZ0p8ByxkrM0fMIzOthIo230ggVXN4B3qBRr5EoHN7AGVDSK9Mxpy0cy1eM0JC8yina90DqAoe9k060AXmGL13t5HTsqYvyTbpyqTiBFSKXt5yR09LedxYdI5SRwUyDI4bfVwo4k8ZcXsXBRP9gAvvJ0b6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA2PR11MB5097.namprd11.prod.outlook.com (2603:10b6:806:11a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 02:43:37 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 02:43:37 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libbsd: fix header conflict for multilib
Date: Thu,  7 Nov 2024 10:43:27 +0800
Message-Id: <20241107024327.1354616-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0081.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA2PR11MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: a96e7c74-7ede-48fd-e75f-08dcfed5fadd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?a68CUFLZo3QClzwcyOvaS2yqe/gO9LM0PbWV5rfM9Z3b6voMiccH63gVk6UM?=
 =?us-ascii?Q?nj47cDmNmNUQP/9g5SQrG4B9eg+uElbAJhEgjkQS/19CXvzWpbe4h724Y1oO?=
 =?us-ascii?Q?8ygwnwWBaXlyRkcTcJeVUkLdWYcQh8Tkrjb9cHd+Q5OyGk9DkfOPPft05hJx?=
 =?us-ascii?Q?IdOSBZ033SXDVCiSlzrGeuhE0WhuRXkeZavzjVeUVdueYqBC+w47LAn5RW3a?=
 =?us-ascii?Q?gpogksLZWZO4VIXyHgChyvWOv55+H/GeQ9RyErmweDF/8b/DuOPXch2Q/m6K?=
 =?us-ascii?Q?bL0RQIxL1HfujmBg9VGnRlL8CDaLEZsdbTUcmX8zwnG4e4iwsyIKz8kjZ01y?=
 =?us-ascii?Q?hAkkFaewuk4huedwzQUHgiFtKlst4kS6v95JUvHwyBgVeTnP9lesQ+6E/1ZG?=
 =?us-ascii?Q?KExUp3z/QKz/ZGnAEHjZXUzvyCRB8ZLm9ADOwj0EDhUHTkX6AjE8MmJk1KmU?=
 =?us-ascii?Q?voijbT9fUrqYQxcCpumx2uC3CMsrlVL51/AMWm9fFmFv7/dvVb0FO8jyW1MW?=
 =?us-ascii?Q?ov9srLQISNwf18TNZLlaJsu6mvJRXRfjxzJzjwT7JWeagQreiQtFO1b/9+tG?=
 =?us-ascii?Q?g20XWA2dEf5qxHdFGZeTT9pSn5o8KrBY0chkgl10qIoCgK7CHSH1munoFMUB?=
 =?us-ascii?Q?1r7JtJIB69SOcBiQwYehMc1lsOd7yANXsa6ZHrbN/2fDwROwudsdW0+JZJlO?=
 =?us-ascii?Q?RUZswlrlH9K2rpoqTsfV8sKgSxXqp2/vRNHNFjyt0mZU3/2QP1vZ9em4qlDt?=
 =?us-ascii?Q?OQFgvaMjyQJCNqUZAOGgrryw4b3N/L+pASLmVI2fvfynnqi4mCngVZ/NTFHL?=
 =?us-ascii?Q?k8fH4JnGX2fX8aeYFymlIR/O8kdBRODaSWqlS5qWrMgHDIv6A0gxno4XA+Z3?=
 =?us-ascii?Q?EJbx+Z4E4rreqBoyMeHgZAbv5Ssje9WD032EVb1RvCx15gU62oS0lQ6azSW7?=
 =?us-ascii?Q?YVYd6lM71089Yls1s0ei5fdTv9BUE2MnHyUax7RUbG+dUfvx8bIIpWKjZWhO?=
 =?us-ascii?Q?VIUIDfpYqoN0/NvxXnMSYUptkQNCDbf7dhUTC/4vPHz6uxt2Xsly0HA0dle4?=
 =?us-ascii?Q?n2uAEn5tb+SihxkA45fhnEZgmymEApIsXJ8XmV4MovNdWysbJfsQQvxRp0Nr?=
 =?us-ascii?Q?g6t/voungYGzd1GQCDMyFRZwwkfjcLCmT1Dgad9pdhMEO8xm8hLDnz7X7DAO?=
 =?us-ascii?Q?5Yjs4IXRZewuaM9wHdSxXWm7+ypOyGUHTRmDIwtlPPAv7Oj6dZn9jEa4AS4C?=
 =?us-ascii?Q?hpECDZ6LT6tb9/1j2lDM8tJlrCGQ+AhU9Nqw7+4nIZ3Xk1z/tbKfI3TGARir?=
 =?us-ascii?Q?LrHzmkhi7X9Pg6vNhBw/AHph?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eI+4MyxYEZbalL6mdNnDg3pg8fuQPZLfb0AextfTiRIf2WippPmdG47yTKe5?=
 =?us-ascii?Q?lW8vnIbe8Nto5zBsGQrJl69J2Vl9+s1+cpkSWtCPSz+nLl4p0I1Dpb3kWs6I?=
 =?us-ascii?Q?vIubIxDlxUIbv9gJUu5UOX3ZTpPr8PSTsj3t7+Zm1mx+YDqaPsYozOxEENbw?=
 =?us-ascii?Q?dpOx6YTnnYFA4Dad89nDl3HYU+Wc3SQ4nUA8NzNpf5qmQiwKmYQXr9QQhpKi?=
 =?us-ascii?Q?itdsbu90ESEEzNmovFjvxtJLLbeGWZyoH/iug+/GQRtXPsUTLfJEEWzSblSg?=
 =?us-ascii?Q?3uZvdqyhED4lsLjEOBblsfh7V+5g3T2WhZsJ0Bvp23ixEBtIBmZFzs95OfOU?=
 =?us-ascii?Q?MAajAfH77NuUUmnG1rONH+VZlGTVFdilHmg9yIR5PotgUPW7M/uvNhHlG3E+?=
 =?us-ascii?Q?02nUs7PNKQTIbdbQO0lxZ9aeX0y8mb9S+co8azE5noIZusFaOkD1J9TXi+TL?=
 =?us-ascii?Q?UhfVFwBqGGDuVfrY1ufbnAL/M2HmlXaEtUWQDvYtchM6jetiX0/zTNn4aIaX?=
 =?us-ascii?Q?Zm+8nWMq3EIFuE+SpU8mTb7kyALVd+Rpobm1TkjyGbIYRbhvRmg/OIOH3N6K?=
 =?us-ascii?Q?ABgub5f2MOAMqPfPd2FTge+G6hQcLynSfOT8uVPqt1+v3ybjxRNS8GYVMnZR?=
 =?us-ascii?Q?A52NmZYe5Wd4REEhMfXMyDbNZL7YE7SSyyDAcHw3VX/DdHSHbCeQBocAM79V?=
 =?us-ascii?Q?S/s1LvQH1ny+gI6XMNV+izanQXYGJhcjl5vWVpOrEWhVUD0pw8u20n5PIfks?=
 =?us-ascii?Q?Lv4+Mju8hqnpfIp14Dp+R4QM5MTHNzFjt688i5CdjmGmYmHf1pSImSEL6iYY?=
 =?us-ascii?Q?GRnHpkfp14H7JLhXQyQkv6DSH288mMbFtegDrGETJsgslaKAU0Q0CE764Elq?=
 =?us-ascii?Q?znsTlK5zwh77NQi0Q44xFITyNZfv6+5KREzbxO1sLbxRFkLO5mocu1+ZFwcd?=
 =?us-ascii?Q?t8A3vm1rr/p+ROuHbHbpsvQqdMfY7A0c8KBaEqRP2I+bp8CVkSKom8X7vDT9?=
 =?us-ascii?Q?NLdGrtfQjpYrV9zqIkqxTY+8iHlUM+zdj0rOrlYJL/lyAVszIiOAOQFsbH6h?=
 =?us-ascii?Q?/p1KVQF3q5b2lgwhOpIT+djfANoZoHbJL+AeEEVO9PPSVSvcNM9N9wGfTqnk?=
 =?us-ascii?Q?a2WXO/vUITyt6dS/kTK9iW7EKxAtivMrSzdtK+N+wQuiZwdNHTra//yQ57Hx?=
 =?us-ascii?Q?5q/M7bf5P5cA+01RAt82kFZlfH1pqqdj12ux7HntL/3UwZapbjC/qyFWHR/y?=
 =?us-ascii?Q?NFBjyO91KSdaEiSrCr/pFJ0z3qP5heOP2ug17Kqa8swKLHqZkNSrI8IQ211p?=
 =?us-ascii?Q?KqmCqPg9frkyAd9d/Ay1IPlq/q55BNQPFolXH6NPqNUQLfmhHpjRBy5ntWFa?=
 =?us-ascii?Q?vO4NQltoNTM7ka7ixOGjKOsSkuEqClCreYeA13qO6TlHBPMCbzYItyn0+uA5?=
 =?us-ascii?Q?d1ciHJ8lJTYdaMENksEV/pdaiH1ETGu89hOgHNaXqKQM7TFQ9EA4KaJjZyNd?=
 =?us-ascii?Q?m2YXtsv5pBDb4/S88iMHiWdhrVQv0Gbt9EyHOnGZfQX/LSqXrfCPjeChWyOv?=
 =?us-ascii?Q?FkZMO85JOsPMvd+AXyytiH8UFyqNz3Xftw59/IOR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a96e7c74-7ede-48fd-e75f-08dcfed5fadd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 02:43:37.2707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aO7xK0DeKfn2tEakUWUyLh8zMeX1Pe9QNta6rfyYIy97bQPFS5stvq7sp1+cyUMsLiyJ23WoMzAt4cO8KQghyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
X-Authority-Analysis: v=2.4 cv=CfNa56rl c=1 sm=1 tr=0 ts=672c295b cx=c_pps a=ztkV8ooph0rfw1Th5QLTnw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=mFzw5mWcgqoaI668KyMA:9
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: wCcQsuIyAY4yqePO3s880pLLRY_JXRVB
X-Proofpoint-GUID: wCcQsuIyAY4yqePO3s880pLLRY_JXRVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-06_20,2024-11-06_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=660
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411070019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 02:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206817

The cdefs.h was modify for time32 and time64 respectively in 0.12.2[1].

Fix:
Error: Transaction test error:
  file /usr/include/bsd/sys/cdefs.h conflicts between attempted installs
  of libbsd-dev-0.12.2-r0.core2_64 and lib32-libbsd-dev-0.12.2-r0.x86

[1] https://gitlab.freedesktop.org/libbsd/libbsd/-/commit/32d18dcf47a8ac9f0e21b787bc154f8ca72dbdd8

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/libbsd/libbsd_0.12.2.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libbsd/libbsd_0.12.2.bb b/meta/recipes-support/libbsd/libbsd_0.12.2.bb
index 7d5e88f293..0a71653cfb 100644
--- a/meta/recipes-support/libbsd/libbsd_0.12.2.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.12.2.bb
@@ -40,8 +40,12 @@ SRC_URI = "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 
 SRC_URI[sha256sum] = "b88cc9163d0c652aaf39a99991d974ddba1c3a9711db8f1b5838af2a14731014"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig multilib_header
 
 DEPENDS += "libmd"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install:append() {
+    oe_multilib_header bsd/sys/cdefs.h
+}
-- 
2.25.1


