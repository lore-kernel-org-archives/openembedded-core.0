Return-Path: <nikhil.r@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E267C3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 09:39:43 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.75])
 by mx.groups.io with SMTP id smtpd.web11.42576.1723455582185828732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 02:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=vEpNetty;
 spf=pass (domain: kpit.com, ip: 40.107.57.75, mailfrom: nikhil.r@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=siTrdomW9aIVeB9Pejo7bXn7J56vEi6Go/LGMcqzLuZvO9DsXV97RVht0HEiRgtZg4zlkIW49wei9kY3aAOlSYKd7L/LTIlnk0khZro9QqrA9epbdTjKhAXWCquToYK2fRH5uVWTD5y803uMHTwWCG2mGjvZbpTiMW2jy3EPR9pyIJ7iRCzkGzsluhUnlcSFKX2UEWSvbCCvKix6vm59HOxUJAy+omtMuDhCXpkwvOwJo8gz3Z8Mg5kN2Q1H+bApv/68+lbMnwD0pH9ICT9FDUbuNPogEs9BVnGq5/i73ucEiXtX5L9aBB1tT8zRe198K68gOfKhIVcif9oorH4Adg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B33fDu/tfvJeR9eqYX95VknpuNDZJBWPKgI2dhgtX3Q=;
 b=kjzouqPyl6Wevf7yLk+d3MHGnydnM8froXhyPUOURsTdHkgwblHPcd3fq+JA/K0l4GfkHo9ys38wnU2aGr546+0UXkAKtwPTrKYOUmv0ddOH5xEEtoYY+XZfKOFZZrK/KnmaDkHrTjsUfRp6wi0a4fTn/BeJDYe7OA3L5NPKqBGk9Bm4Uoopqi5QfmPBXRa5MaDMgI5cQHZtDUfL+dMVSQxMGDTuTp5FEDB1E+H/yYvmP3AqXWXfK//sS65nnirNWxrAsX6Dy21Yz5JFTek05pFWOsvkrpVHry6GWPUShUe3sR5n9bL8SpyopqtqqrQ9NLbrKzdszTV8e/iURYu/FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 103.243.227.16) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=kpit.com; dmarc=fail (p=reject sp=none pct=100) action=oreject
 header.from=kpit.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B33fDu/tfvJeR9eqYX95VknpuNDZJBWPKgI2dhgtX3Q=;
 b=vEpNettyMMd5aFEEvsIbAEkOW2xcRPQ+QSkqj8uWvaS/SZDGWltETdqpDOROrqzTlZIc3M8j9/R72iEHFgv7K7ccrBV3wUvTzL/cCrt9JAriUEH9jIVmqarDFZiRZ3vDqR5YsWax0h1iL/mjGPSutWEY4adj4xYh/ZMEueWot+c=
Received: from SI2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::9) by
 PN2PR01MB9800.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:12a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.8; Mon, 12 Aug
 2024 09:39:31 +0000
Received: from HK2PEPF00006FB0.apcprd02.prod.outlook.com
 (2603:1096:4:190:cafe::37) by SI2P153CA0028.outlook.office365.com
 (2603:1096:4:190::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.5 via Frontend
 Transport; Mon, 12 Aug 2024 09:39:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 103.243.227.16)
 smtp.mailfrom=kpit.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=kpit.com;
Received-SPF: Fail (protection.outlook.com: domain of kpit.com does not
 designate 103.243.227.16 as permitted sender)
 receiver=protection.outlook.com; client-ip=103.243.227.16;
 helo=mail.kpit.com;
Received: from mail.kpit.com (103.243.227.16) by
 HK2PEPF00006FB0.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.8 via Frontend Transport; Mon, 12 Aug 2024 09:39:30 +0000
Received: from L-17494.kpit.com (10.30.140.23) by PH3EXCH01.kpit.com
 (10.52.16.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 12 Aug
 2024 15:09:25 +0530
From: Nikhil R <nikhilr5@kpit.com>
To: <openembedded-core@lists.openembedded.org>, <bindudaniel1996@gmail.com>
CC: Bindu Bhabu <bhabu.bindu@kpit.com>
Subject: [OE-core][kirkstone][PATCH] expat: fix CVE-2023-52425
Date: Mon, 12 Aug 2024 15:09:11 +0530
Message-ID: <20240812093911.89595-1-nikhilr5@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="no"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.30.140.23]
X-ClientProxiedBy: PH3ExchFE01.kpit.com (10.52.16.111) To PH3EXCH01.kpit.com
 (10.52.16.25)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB0:EE_|PN2PR01MB9800:EE_
X-MS-Office365-Filtering-Correlation-Id: f9fe3cd7-e5f6-420a-fa04-08dcbab2aa50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Zhh7X0v5irQJSZNf4Dvml8r92gpJ7c9xKKmCqvn/N9/6ke+H43FtUndp2xfy?=
 =?us-ascii?Q?XyYLmA/jBjhVy+zxPGRWuiJTIQxQYwngBhUCU9sLOslrt+sMzMsrhEytB4bQ?=
 =?us-ascii?Q?g9MGYSTL7qW3VVDIKPId0gp0Vg7jTlGXV59P41JLuagaYf9hM3Ty81RGZQZ/?=
 =?us-ascii?Q?A5q2ONE8vwNL0xxBMILtGnSND7GeTyfoUJFCmIgh+DFpLsNdFTKQz+NJa4ia?=
 =?us-ascii?Q?qXs4MqwT3oxbFaECDKKegH9QAU3bhvUBn/SEsRjcR2d1ZVhd6KCqbyC+/aSv?=
 =?us-ascii?Q?twy5Ne0qIcgzr9z/r/c858B0YJus1j4lWorG6rgMu7R6rIdbA8ve2M2MVaDr?=
 =?us-ascii?Q?dUa3HAwS2LWtgEruQVbn2gMwsOvi/HN8rvwId2//yAx8ySQ3NeFzU9XzkREF?=
 =?us-ascii?Q?Eft0MJTWGp8KTZ8E8R5HBECmqf9u60aV780UjWS8aWnvsx1S+kqlKm02OPSB?=
 =?us-ascii?Q?hb386vLkzJxRTZTqmqOEXdz01FnYDVGam/xLiRJUM8KTzKenphrTr4E2W90l?=
 =?us-ascii?Q?1XJkKP1BI2yLmMxSmsZpQ6m/9tZVr25BY8L0KxyTzzC2Aiva91PpmNoRYtVv?=
 =?us-ascii?Q?9DtNjx6By1dsrZ+0EXD4Pz38xQ14BIxtz5+Ilp1hf4OXFLp+mKOiwzSLTuVj?=
 =?us-ascii?Q?0Pd8FRUxDqKl8KacAJYR9kSN3nC4hTYsM+5zbGeqUwM7Cu2LwW4CWwNYhh9h?=
 =?us-ascii?Q?1O7mT+yRYLM9sRadIh75COBvfhyMyd9SXYczyYuMDtQFukCukXgIVGiayggz?=
 =?us-ascii?Q?adrvHz2RJVUfVJmv4tJ45UMVZ8dyPqVXNeih3Vddw+UpkPlpYo1mH14vUEG0?=
 =?us-ascii?Q?PCpYvuVHLsuunutzJOY9eU+aGzRIYCRi5tTdu7QkSLIXzTDewN6hYVbZdQa2?=
 =?us-ascii?Q?9CvLZfJUapMJxcfWRMXljxkvrANlzTwXgsZnMpCIQLuJrFa1wRz2VgYLdV+w?=
 =?us-ascii?Q?Ojv1EmAK5yovGJ9K4FPL//6PfK6RXatzRK/jFrmXiHzSRrC5vqN34WMAftvP?=
 =?us-ascii?Q?QuwNBIBNngzM3KHHRitHfJMYgTZdJPn8kqahTZD0zGvtrAvSN2y6WV6s33jU?=
 =?us-ascii?Q?IIpTf7HoH9+sAjhSOWa31yfaeE7M7m7gF60Vm9B1xVCnfxIwCuKMm4DX34Ja?=
 =?us-ascii?Q?rwH1iQt0dYjm0cq2l1UMmAzNpjEfJ32zQPaH0flXfCgz8dYPh0ExRVoerOwT?=
 =?us-ascii?Q?SQegOb3ujEIxN4/USHWnqbl4lDRJlkIBt3bwXQlFYVD9u8QqL3fR8KyYkkam?=
 =?us-ascii?Q?oXe1fpdhmF3ujH97ElIH4zUitPrU8BqqqepEAwaQG5d1q95+S7wTScPpAuH/?=
 =?us-ascii?Q?H4BKO0TBC9rfQTqMYxJGEIDgdrABKM4Ldg7yIokxU1s9Svn7VNGmMnqiNhmc?=
 =?us-ascii?Q?Qcw9RiPiz+u0aVi9KV4YKGdhuZQj/HylJFI5/N4HRJyUFl8VDg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:103.243.227.16;CTRY:IN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.kpit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 09:39:30.2271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9fe3cd7-e5f6-420a-fa04-08dcbab2aa50
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3539451e-b46e-4a26-a242-ff61502855c7;Ip=[103.243.227.16];Helo=[mail.kpit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK2PEPF00006FB0.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9800
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 09:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203212

libexpat through 2.5.0 allows a denial of service
(resource consumption) because many full reparsings
are required in the case of a large token for which
multiple buffer fills are needed.

References:
https://security-tracker.debian.org/tracker/CVE-2023-52425
https://ubuntu.com/security/CVE-2023-52425
https://packages.ubuntu.com/mantic/expat
https://github.com/libexpat/libexpat/pull/789
http://archive.ubuntu.com/ubuntu/pool/main/e/expat/expat_2.5.0-2ubuntu0.1.d=
ebian.tar.xz
https://launchpad.net/ubuntu/+source/expat/2.5.0-2ubuntu0.1

Signed-off-by: Bindu Bhabu <bhabu.bindu@kpit.com>
---
 .../expat/expat/CVE-2023-52425.patch          | 581 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.5.0.bb        |   1 +
 2 files changed, 582 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2023-52425.patch b/meta/reci=
pes-core/expat/expat/CVE-2023-52425.patch
new file mode 100644
index 0000000000..4d3c8c52bb
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52425.patch
@@ -0,0 +1,581 @@
+Backport of https://github.com/libexpat/libexpat/pull/789
+
+From 9cdf9b8d77d5c2c2a27d15fb68dd3f83cafb45a1 Mon Sep 17 00:00:00 2001
+From: Snild Dolkow <snild@sony.com>
+Date: Thu, 17 Aug 2023 16:25:26 +0200
+Subject: [PATCH] Skip parsing after repeated partials on the same token
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+When the parse buffer contains the starting bytes of a token but not
+all of them, we cannot parse the token to completion. We call this a
+partial token.  When this happens, the parse position is reset to the
+start of the token, and the parse() call returns. The client is then
+expected to provide more data and call parse() again.
+
+In extreme cases, this means that the bytes of a token may be parsed
+many times: once for every buffer refill required before the full token
+is present in the buffer.
+
+Math:
+  Assume there's a token of T bytes
+  Assume the client fills the buffer in chunks of X bytes
+  We'll try to parse X, 2X, 3X, 4X ... until mX =3D=3D T (technically >=3D=
)
+  That's (m=C2=B2+m)X/2 =3D (T=C2=B2/X+T)/2 bytes parsed (arithmetic progr=
ession)
+  While it is alleviated by larger refills, this amounts to O(T=C2=B2)
+
+Expat grows its internal buffer by doubling it when necessary, but has
+no way to inform the client about how much space is available. Instead,
+we add a heuristic that skips parsing when we've repeatedly stopped on
+an incomplete token. Specifically:
+
+ * Only try to parse if we have a certain amount of data buffered
+ * Every time we stop on an incomplete token, double the threshold
+ * As soon as any token completes, the threshold is reset
+
+This means that when we get stuck on an incomplete token, the threshold
+grows exponentially, effectively making the client perform larger buffer
+fills, limiting how many times we can end up re-parsing the same bytes.
+
+Math:
+  Assume there's a token of T bytes
+  Assume the client fills the buffer in chunks of X bytes
+  We'll try to parse X, 2X, 4X, 8X ... until (2^k)X =3D=3D T (or larger)
+  That's (2^(k+1)-1)X bytes parsed -- e.g. 15X if T =3D 8X
+  This is equal to 2T-X, which amounts to O(T)
+
+We could've chosen a faster growth rate, e.g. 4 or 8. Those seem to
+increase performance further, at the cost of further increasing the
+risk of growing the buffer more than necessary. This can easily be
+adjusted in the future, if desired.
+
+This is all completely transparent to the client, except for:
+1. possible delay of some callbacks (when our heuristic overshoots)
+2. apps that never do isFinal=3DXML_TRUE could miss data at the end
+
+For the affected testdata, this change shows a 100-400x speedup.
+The recset.xml benchmark shows no clear change either way.
+
+Before:
+benchmark -n ../testdata/largefiles/recset.xml 65535 3
+  3 loops, with buffer size 65535. Average time per loop: 0.270223
+benchmark -n ../testdata/largefiles/aaaaaa_attr.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 15.033048
+benchmark -n ../testdata/largefiles/aaaaaa_cdata.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 0.018027
+benchmark -n ../testdata/largefiles/aaaaaa_comment.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 11.775362
+benchmark -n ../testdata/largefiles/aaaaaa_tag.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 11.711414
+benchmark -n ../testdata/largefiles/aaaaaa_text.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 0.019362
+
+After:
+./run.sh benchmark -n ../testdata/largefiles/recset.xml 65535 3
+  3 loops, with buffer size 65535. Average time per loop: 0.269030
+./run.sh benchmark -n ../testdata/largefiles/aaaaaa_attr.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 0.044794
+./run.sh benchmark -n ../testdata/largefiles/aaaaaa_cdata.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 0.016377
+./run.sh benchmark -n ../testdata/largefiles/aaaaaa_comment.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 0.027022
+./run.sh benchmark -n ../testdata/largefiles/aaaaaa_tag.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 0.099360
+./run.sh benchmark -n ../testdata/largefiles/aaaaaa_text.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 0.017956
+
+CVE: CVE-2023-52425
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/789]
+Comments: Hunks refreshed.
+          Patch difference/summary has also been modified.
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+
+---
+ lib/expat.h            | 5   +++++
+ lib/libexpat.def.cmake | 2   ++
+ lib/xmlparse.c         | 228 ++++++++++++++++++++++++++++++++++++++++++--=
--------------------------------
+ xmlwf/xmlwf.c          | 20  ++++++++++++++++++++
+ xmlwf/xmlwf_helpgen.py | 4   ++++
+ 5 files changed, 156 insertions(+), 103 deletions(-)
+
+--- a/lib/expat.h
++++ b/lib/expat.h
+@@ -16,6 +16,7 @@
+    Copyright (c) 2016      Thomas Beutlich <tc@tbeu.de>
+    Copyright (c) 2017      Rhodri James <rhodri@wildebeest.org.uk>
+    Copyright (c) 2022      Thijs Schreijer <thijs@thijsschreijer.nl>
++   Copyright (c) 2023      Sony Corporation / Snild Dolkow <snild@sony.co=
m>
+    Licensed under the MIT license:
+
+    Permission is  hereby granted,  free of charge,  to any  person obtain=
ing
+@@ -1050,6 +1051,10 @@ XML_SetBillionLaughsAttackProtectionActi
+     XML_Parser parser, unsigned long long activationThresholdBytes);
+ #endif
+
++/* Added in Expat 2.6.0. */
++XMLPARSEAPI(XML_Bool)
++XML_SetReparseDeferralEnabled(XML_Parser parser, XML_Bool enabled);
++
+ /* Expat follows the semantic versioning convention.
+    See http://semver.org.
+ */
+--- a/lib/libexpat.def.cmake
++++ b/lib/libexpat.def.cmake
+@@ -77,3 +77,5 @@ EXPORTS
+ ; added with version 2.4.0
+ @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetBillionLaughsAttackProtectionActivation=
Threshold @69
+ @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetBillionLaughsAttackProtectionMaximumAmp=
lification @70
++; added with version 2.6.0
++  XML_SetReparseDeferralEnabled @71
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -36,6 +36,7 @@
+    Copyright (c) 2022      Samanta Navarro <ferivoz@riseup.net>
+    Copyright (c) 2022      Jeffrey Walton <noloader@gmail.com>
+    Copyright (c) 2022      Jann Horn <jannh@google.com>
++   Copyright (c) 2023      Sony Corporation / Snild Dolkow <snild@sony.co=
m>
+    Licensed under the MIT license:
+
+    Permission is  hereby granted,  free of charge,  to any  person obtain=
ing
+@@ -73,6 +74,7 @@
+ #  endif
+ #endif
+
++#include <stdbool.h>
+ #include <stddef.h>
+ #include <string.h> /* memset(), memcpy() */
+ #include <assert.h>
+@@ -196,6 +198,8 @@ typedef char ICHAR;
+ /* Do safe (NULL-aware) pointer arithmetic */
+ #define EXPAT_SAFE_PTR_DIFF(p, q) (((p) && (q)) ? ((p) - (q)) : 0)
+
++#define EXPAT_MIN(a, b) (((a) < (b)) ? (a) : (b))
++
+ #include "internal.h"
+ #include "xmltok.h"
+ #include "xmlrole.h"
+@@ -617,6 +621,9 @@ struct XML_ParserStruct {
+   const char *m_bufferLim;
+   XML_Index m_parseEndByteIndex;
+   const char *m_parseEndPtr;
++  size_t m_partialTokenBytesBefore; /* used in heuristic to avoid O(n^2) =
*/
++  XML_Bool m_reparseDeferralEnabled;
++  int m_lastBufferRequestSize;
+   XML_Char *m_dataBuf;
+   XML_Char *m_dataBufEnd;
+   XML_StartElementHandler m_startElementHandler;
+@@ -948,6 +955,46 @@ get_hash_secret_salt(XML_Parser parser)
+   return parser->m_hash_secret_salt;
+ }
+
++static enum XML_Error
++callProcessor(XML_Parser parser, const char *start, const char *end,
++              const char **endPtr) {
++  const size_t have_now =3D EXPAT_SAFE_PTR_DIFF(end, start);
++
++  if (parser->m_reparseDeferralEnabled
++      && ! parser->m_parsingStatus.finalBuffer) {
++    // Heuristic: don't try to parse a partial token again until the amou=
nt of
++    // available data has increased significantly.
++    const size_t had_before =3D parser->m_partialTokenBytesBefore;
++    // ...but *do* try anyway if we're close to causing a reallocation.
++    size_t available_buffer
++        =3D EXPAT_SAFE_PTR_DIFF(parser->m_bufferPtr, parser->m_buffer);
++#if XML_CONTEXT_BYTES > 0
++    available_buffer -=3D EXPAT_MIN(available_buffer, XML_CONTEXT_BYTES);
++#endif
++    available_buffer
++        +=3D EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_bufferEnd=
);
++    // m_lastBufferRequestSize is never assigned a value < 0, so the cast=
 is ok
++    const bool enough
++        =3D (have_now >=3D 2 * had_before)
++          || ((size_t)parser->m_lastBufferRequestSize > available_buffer)=
;
++
++    if (! enough) {
++      *endPtr =3D start; // callers may expect this to be set
++      return XML_ERROR_NONE;
++    }
++  }
++  const enum XML_Error ret =3D parser->m_processor(parser, start, end, en=
dPtr);
++  if (ret =3D=3D XML_ERROR_NONE) {
++    // if we consumed nothing, remember what we had on this parse attempt=
.
++    if (*endPtr =3D=3D start) {
++      parser->m_partialTokenBytesBefore =3D have_now;
++    } else {
++      parser->m_partialTokenBytesBefore =3D 0;
++    }
++  }
++  return ret;
++}
++
+ static XML_Bool /* only valid for root parser */
+ startParsing(XML_Parser parser) {
+   /* hash functions must be initialized before setContext() is called */
+@@ -1129,6 +1176,9 @@ parserInit(XML_Parser parser, const XML_
+   parser->m_bufferEnd =3D parser->m_buffer;
+   parser->m_parseEndByteIndex =3D 0;
+   parser->m_parseEndPtr =3D NULL;
++  parser->m_partialTokenBytesBefore =3D 0;
++  parser->m_reparseDeferralEnabled =3D XML_TRUE;
++  parser->m_lastBufferRequestSize =3D 0;
+   parser->m_declElementType =3D NULL;
+   parser->m_declAttributeId =3D NULL;
+   parser->m_declEntity =3D NULL;
+@@ -1298,6 +1348,7 @@ XML_ExternalEntityParserCreate(XML_Parse
+      to worry which hash secrets each table has.
+   */
+   unsigned long oldhash_secret_salt;
++  XML_Bool oldReparseDeferralEnabled;
+
+   /* Validate the oldParser parameter before we pull everything out of it=
 */
+   if (oldParser =3D=3D NULL)
+@@ -1342,6 +1393,7 @@ XML_ExternalEntityParserCreate(XML_Parse
+      to worry which hash secrets each table has.
+   */
+   oldhash_secret_salt =3D parser->m_hash_secret_salt;
++  oldReparseDeferralEnabled =3D parser->m_reparseDeferralEnabled;
+
+ #ifdef XML_DTD
+   if (! context)
+@@ -1394,6 +1446,7 @@ XML_ExternalEntityParserCreate(XML_Parse
+   parser->m_defaultExpandInternalEntities =3D oldDefaultExpandInternalEnt=
ities;
+   parser->m_ns_triplets =3D oldns_triplets;
+   parser->m_hash_secret_salt =3D oldhash_secret_salt;
++  parser->m_reparseDeferralEnabled =3D oldReparseDeferralEnabled;
+   parser->m_parentParser =3D oldParser;
+ #ifdef XML_DTD
+   parser->m_paramEntityParsing =3D oldParamEntityParsing;
+@@ -1848,55 +1901,8 @@ XML_Parse(XML_Parser parser, const char
+     parser->m_parsingStatus.parsing =3D XML_PARSING;
+   }
+
+-  if (len =3D=3D 0) {
+-    parser->m_parsingStatus.finalBuffer =3D (XML_Bool)isFinal;
+-    if (! isFinal)
+-      return XML_STATUS_OK;
+-    parser->m_positionPtr =3D parser->m_bufferPtr;
+-    parser->m_parseEndPtr =3D parser->m_bufferEnd;
+-
+-    /* If data are left over from last buffer, and we now know that these
+-       data are the final chunk of input, then we have to check them agai=
n
+-       to detect errors based on that fact.
+-    */
+-    parser->m_errorCode
+-        =3D parser->m_processor(parser, parser->m_bufferPtr,
+-                              parser->m_parseEndPtr, &parser->m_bufferPtr=
);
+-
+-    if (parser->m_errorCode =3D=3D XML_ERROR_NONE) {
+-      switch (parser->m_parsingStatus.parsing) {
+-      case XML_SUSPENDED:
+-        /* It is hard to be certain, but it seems that this case
+-         * cannot occur.  This code is cleaning up a previous parse
+-         * with no new data (since len =3D=3D 0).  Changing the parsing
+-         * state requires getting to execute a handler function, and
+-         * there doesn't seem to be an opportunity for that while in
+-         * this circumstance.
+-         *
+-         * Given the uncertainty, we retain the code but exclude it
+-         * from coverage tests.
+-         *
+-         * LCOV_EXCL_START
+-         */
+-        XmlUpdatePosition(parser->m_encoding, parser->m_positionPtr,
+-                          parser->m_bufferPtr, &parser->m_position);
+-        parser->m_positionPtr =3D parser->m_bufferPtr;
+-        return XML_STATUS_SUSPENDED;
+-        /* LCOV_EXCL_STOP */
+-      case XML_INITIALIZED:
+-      case XML_PARSING:
+-        parser->m_parsingStatus.parsing =3D XML_FINISHED;
+-        /* fall through */
+-      default:
+-        return XML_STATUS_OK;
+-      }
+-    }
+-    parser->m_eventEndPtr =3D parser->m_eventPtr;
+-    parser->m_processor =3D errorProcessor;
+-    return XML_STATUS_ERROR;
+-  }
+-#ifndef XML_CONTEXT_BYTES
+-  else if (parser->m_bufferPtr =3D=3D parser->m_bufferEnd) {
++#if XML_CONTEXT_BYTES =3D=3D 0
++  if (parser->m_bufferPtr =3D=3D parser->m_bufferEnd) {
+     const char *end;
+     int nLeftOver;
+     enum XML_Status result;
+@@ -1907,12 +1913,15 @@ XML_Parse(XML_Parser parser, const char
+       parser->m_processor =3D errorProcessor;
+       return XML_STATUS_ERROR;
+     }
++    // though this isn't a buffer request, we assume that `len` is the ap=
p's
++    // preferred buffer fill size, and therefore save it here.
++    parser->m_lastBufferRequestSize =3D len;
+     parser->m_parseEndByteIndex +=3D len;
+     parser->m_positionPtr =3D s;
+     parser->m_parsingStatus.finalBuffer =3D (XML_Bool)isFinal;
+
+     parser->m_errorCode
+-        =3D parser->m_processor(parser, s, parser->m_parseEndPtr =3D s + =
len, &end);
++        =3D callProcessor(parser, s, parser->m_parseEndPtr =3D s + len, &=
end);
+
+     if (parser->m_errorCode !=3D XML_ERROR_NONE) {
+       parser->m_eventEndPtr =3D parser->m_eventPtr;
+@@ -1939,23 +1948,25 @@ XML_Parse(XML_Parser parser, const char
+                       &parser->m_position);
+     nLeftOver =3D s + len - end;
+     if (nLeftOver) {
+-      if (parser->m_buffer =3D=3D NULL
+-          || nLeftOver > parser->m_bufferLim - parser->m_buffer) {
+-        /* avoid _signed_ integer overflow */
+-        char *temp =3D NULL;
+-        const int bytesToAllocate =3D (int)((unsigned)len * 2U);
+-        if (bytesToAllocate > 0) {
+-          temp =3D (char *)REALLOC(parser, parser->m_buffer, bytesToAlloc=
ate);
+-        }
+-        if (temp =3D=3D NULL) {
+-          parser->m_errorCode =3D XML_ERROR_NO_MEMORY;
+-          parser->m_eventPtr =3D parser->m_eventEndPtr =3D NULL;
+-          parser->m_processor =3D errorProcessor;
+-          return XML_STATUS_ERROR;
+-        }
+-        parser->m_buffer =3D temp;
+-        parser->m_bufferLim =3D parser->m_buffer + bytesToAllocate;
++      // Back up and restore the parsing status to avoid XML_ERROR_SUSPEN=
DED
++      // (and XML_ERROR_FINISHED) from XML_GetBuffer.
++      const enum XML_Parsing originalStatus =3D parser->m_parsingStatus.p=
arsing;
++      parser->m_parsingStatus.parsing =3D XML_PARSING;
++      void *const temp =3D XML_GetBuffer(parser, nLeftOver);
++      parser->m_parsingStatus.parsing =3D originalStatus;
++      // GetBuffer may have overwritten this, but we want to remember wha=
t the
++      // app requested, not how many bytes were left over after parsing.
++      parser->m_lastBufferRequestSize =3D len;
++      if (temp =3D=3D NULL) {
++        // NOTE: parser->m_errorCode has already been set by XML_GetBuffe=
r().
++        parser->m_eventPtr =3D parser->m_eventEndPtr =3D NULL;
++        parser->m_processor =3D errorProcessor;
++        return XML_STATUS_ERROR;
+       }
++      // Since we know that the buffer was empty and XML_CONTEXT_BYTES is=
 0, we
++      // don't have any data to preserve, and can copy straight into the =
start
++      // of the buffer rather than the GetBuffer return pointer (which ma=
y be
++      // pointing further into the allocated buffer).
+       memcpy(parser->m_buffer, end, nLeftOver);
+     }
+     parser->m_bufferPtr =3D parser->m_buffer;
+@@ -1966,16 +1977,15 @@ XML_Parse(XML_Parser parser, const char
+     parser->m_eventEndPtr =3D parser->m_bufferPtr;
+     return result;
+   }
+-#endif /* not defined XML_CONTEXT_BYTES */
+-  else {
+-    void *buff =3D XML_GetBuffer(parser, len);
+-    if (buff =3D=3D NULL)
+-      return XML_STATUS_ERROR;
+-    else {
+-      memcpy(buff, s, len);
+-      return XML_ParseBuffer(parser, len, isFinal);
+-    }
++#endif /* XML_CONTEXT_BYTES =3D=3D 0 */
++  void *buff =3D XML_GetBuffer(parser, len);
++  if (buff =3D=3D NULL)
++    return XML_STATUS_ERROR;
++  if (len > 0) {
++    assert(s !=3D NULL); // make sure s=3D=3DNULL && len!=3D0 was rejecte=
d above
++    memcpy(buff, s, len);
+   }
++  return XML_ParseBuffer(parser, len, isFinal);
+ }
+
+ enum XML_Status XMLCALL
+@@ -2015,8 +2025,8 @@ XML_ParseBuffer(XML_Parser parser, int l
+   parser->m_parseEndByteIndex +=3D len;
+   parser->m_parsingStatus.finalBuffer =3D (XML_Bool)isFinal;
+
+-  parser->m_errorCode =3D parser->m_processor(
+-      parser, start, parser->m_parseEndPtr, &parser->m_bufferPtr);
++  parser->m_errorCode =3D callProcessor(parser, start, parser->m_parseEnd=
Ptr,
++                                      &parser->m_bufferPtr);
+
+   if (parser->m_errorCode !=3D XML_ERROR_NONE) {
+     parser->m_eventEndPtr =3D parser->m_eventPtr;
+@@ -2061,8 +2071,12 @@ XML_GetBuffer(XML_Parser parser, int len
+   default:;
+   }
+
+-  if (len > EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_bufferEnd)=
) {
+-#ifdef XML_CONTEXT_BYTES
++  // whether or not the request succeeds, `len` seems to be the app's pre=
ferred
++  // buffer fill size; remember it.
++  parser->m_lastBufferRequestSize =3D len;
++  if (len > EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_bufferEnd)
++      || parser->m_buffer =3D=3D NULL) {
++#if XML_CONTEXT_BYTES > 0
+     int keep;
+ #endif /* defined XML_CONTEXT_BYTES */
+     /* Do not invoke signed arithmetic overflow: */
+@@ -2083,10 +2097,11 @@ XML_GetBuffer(XML_Parser parser, int len
+       return NULL;
+     }
+     neededSize +=3D keep;
+-#endif /* defined XML_CONTEXT_BYTES */
+-    if (neededSize
+-        <=3D EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_buffer)) =
{
+-#ifdef XML_CONTEXT_BYTES
++#endif /* XML_CONTEXT_BYTES > 0 */
++    if (parser->m_buffer && parser->m_bufferPtr
++        && neededSize
++               <=3D EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_bu=
ffer)) {
++#if XML_CONTEXT_BYTES > 0
+       if (keep < EXPAT_SAFE_PTR_DIFF(parser->m_bufferPtr, parser->m_buffe=
r)) {
+         int offset
+             =3D (int)EXPAT_SAFE_PTR_DIFF(parser->m_bufferPtr, parser->m_b=
uffer)
+@@ -2099,19 +2114,17 @@ XML_GetBuffer(XML_Parser parser, int len
+         parser->m_bufferPtr -=3D offset;
+       }
+ #else
+-      if (parser->m_buffer && parser->m_bufferPtr) {
+-        memmove(parser->m_buffer, parser->m_bufferPtr,
+-                EXPAT_SAFE_PTR_DIFF(parser->m_bufferEnd, parser->m_buffer=
Ptr));
+-        parser->m_bufferEnd
+-            =3D parser->m_buffer
+-              + EXPAT_SAFE_PTR_DIFF(parser->m_bufferEnd, parser->m_buffer=
Ptr);
+-        parser->m_bufferPtr =3D parser->m_buffer;
+-      }
+-#endif /* not defined XML_CONTEXT_BYTES */
++      memmove(parser->m_buffer, parser->m_bufferPtr,
++              EXPAT_SAFE_PTR_DIFF(parser->m_bufferEnd, parser->m_bufferPt=
r));
++      parser->m_bufferEnd
++          =3D parser->m_buffer
++            + EXPAT_SAFE_PTR_DIFF(parser->m_bufferEnd, parser->m_bufferPt=
r);
++      parser->m_bufferPtr =3D parser->m_buffer;
++#endif /* XML_CONTEXT_BYTES > 0 */
+     } else {
+       char *newBuf;
+       int bufferSize
+-          =3D (int)EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_buf=
ferPtr);
++          =3D (int)EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_buf=
fer);
+       if (bufferSize =3D=3D 0)
+         bufferSize =3D INIT_BUFFER_SIZE;
+       do {
+@@ -2208,7 +2221,7 @@ XML_ResumeParser(XML_Parser parser) {
+   }
+   parser->m_parsingStatus.parsing =3D XML_PARSING;
+
+-  parser->m_errorCode =3D parser->m_processor(
++  parser->m_errorCode =3D callProcessor(
+       parser, parser->m_bufferPtr, parser->m_parseEndPtr, &parser->m_buff=
erPtr);
+
+   if (parser->m_errorCode !=3D XML_ERROR_NONE) {
+@@ -2576,6 +2576,15 @@ XML_SetBillionLaughsAttackProtectionActi
+ }
+ #endif /* XML_GE =3D=3D 1 */
+
++XML_Bool XMLCALL
++XML_SetReparseDeferralEnabled(XML_Parser parser, XML_Bool enabled) {
++  if (parser !=3D NULL && (enabled =3D=3D XML_TRUE || enabled =3D=3D XML_=
FALSE)) {
++    parser->m_reparseDeferralEnabled =3D enabled;
++    return XML_TRUE;
++  }
++  return XML_FALSE;
++}
++
+ /* Initially tag->rawName always points into the parse buffer;
+    for those TAG instances opened while the current parse buffer was
+    processed, and not yet closed, we need to store tag->rawName in a more
+@@ -4497,15 +4506,15 @@ entityValueInitProcessor(XML_Parser pars
+       parser->m_processor =3D entityValueProcessor;
+       return entityValueProcessor(parser, next, end, nextPtr);
+     }
+-    /* If we are at the end of the buffer, this would cause XmlPrologTok =
to
+-       return XML_TOK_NONE on the next call, which would then cause the
+-       function to exit with *nextPtr set to s - that is what we want for=
 other
+-       tokens, but not for the BOM - we would rather like to skip it;
+-       then, when this routine is entered the next time, XmlPrologTok wil=
l
+-       return XML_TOK_INVALID, since the BOM is still in the buffer
++    /* XmlPrologTok has now set the encoding based on the BOM it found, a=
nd we
++       must move s and nextPtr forward to consume the BOM.
++
++       If we didn't, and got XML_TOK_NONE from the next XmlPrologTok call=
, we
++       would leave the BOM in the buffer and return. On the next call to =
this
++       function, our XmlPrologTok call would return XML_TOK_INVALID, sinc=
e it
++       is not valid to have multiple BOMs.
+     */
+-    else if (tok =3D=3D XML_TOK_BOM && next =3D=3D end
+-             && ! parser->m_parsingStatus.finalBuffer) {
++    else if (tok =3D=3D XML_TOK_BOM) {
+ #  if XML_GE =3D=3D 1
+       if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
+                                     XML_ACCOUNT_DIRECT)) {
+@@ -4500,7 +4522,7 @@ entityValueInitProcessor(XML_Parser pars
+ #  endif
+
+       *nextPtr =3D next;
+-      return XML_ERROR_NONE;
++      s =3D next;
+     }
+     /* If we get this token, we have the start of what might be a
+        normal tag, but not a declaration (i.e. it doesn't begin with
+--- a/xmlwf/xmlwf.c
++++ b/xmlwf/xmlwf.c
+@@ -914,6 +914,9 @@ usage(const XML_Char *prog, int rc) {
+       T("  -a FACTOR     set maximum tolerated [a]mplification factor (de=
fault: 100.0)\n")
+       T("  -b BYTES      set number of output [b]ytes needed to activate =
(default: 8 MiB)\n")
+       T("\n")
++      T("reparse deferral:\n")
++      T("  -q             disable reparse deferral, and allow [q]uadratic=
 parse runtime with large tokens\n")
++      T("\n")
+       T("info arguments:\n")
+       T("  -h            show this [h]elp message and exit\n")
+       T("  -v            show program's [v]ersion number and exit\n")
+@@ -967,6 +970,8 @@ tmain(int argc, XML_Char **argv) {
+   unsigned long long attackThresholdBytes;
+   XML_Bool attackThresholdGiven =3D XML_FALSE;
+
++  XML_Bool disableDeferral =3D XML_FALSE;
++
+   int exitCode =3D XMLWF_EXIT_SUCCESS;
+   enum XML_ParamEntityParsing paramEntityParsing
+       =3D XML_PARAM_ENTITY_PARSING_NEVER;
+@@ -1089,6 +1094,11 @@ tmain(int argc, XML_Char **argv) {
+ #endif
+       break;
+     }
++    case T('q'): {
++      disableDeferral =3D XML_TRUE;
++      j++;
++      break;
++    }
+     case T('\0'):
+       if (j > 1) {
+         i++;
+@@ -1134,6 +1144,16 @@ tmain(int argc, XML_Char **argv) {
+ #endif
+     }
+
++    if (disableDeferral) {
++      const XML_Bool success =3D XML_SetReparseDeferralEnabled(parser, XM=
L_FALSE);
++      if (! success) {
++        // This prevents tperror(..) from reporting misleading "[..]: Suc=
cess"
++        errno =3D EINVAL;
++        tperror(T("Failed to disable reparse deferral"));
++        exit(XMLWF_EXIT_INTERNAL_ERROR);
++      }
++    }
++
+     if (requireStandalone)
+       XML_SetNotStandaloneHandler(parser, notStandalone);
+     XML_SetParamEntityParsing(parser, paramEntityParsing);
+--- a/xmlwf/xmlwf_helpgen.py
++++ b/xmlwf/xmlwf_helpgen.py
+@@ -81,6 +81,10 @@ billion_laughs.add_argument('-a', metava
+                             help=3D'set maximum tolerated [a]mplification=
 factor (default: 100.0)')
+ billion_laughs.add_argument('-b', metavar=3D'BYTES', help=3D'set number o=
f output [b]ytes needed to activate (default: 8 MiB)')
+
++reparse_deferral =3D parser.add_argument_group('reparse deferral')
++reparse_deferral.add_argument('-q', metavar=3D'FACTOR',
++                            help=3D'disable reparse deferral, and allow [=
q]uadratic parse runtime with large tokens')
++
+ parser.add_argument('files', metavar=3D'FILE', nargs=3D'*', help=3D'file =
to process (default: STDIN)')
+
+ info =3D parser.add_argument_group('info arguments')
diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-core/exp=
at/expat_2.5.0.bb
index 31e989cfe2..09bc7a0a0b 100644
--- a/meta/recipes-core/expat/expat_2.5.0.bb
+++ b/meta/recipes-core/expat/expat_2.5.0.bb
@@ -22,6 +22,7 @@ SRC_URI =3D "https://github.com/libexpat/libexpat/release=
s/download/R_${VERSION_TA
           file://CVE-2023-52426-009.patch \
           file://CVE-2023-52426-010.patch \
           file://CVE-2023-52426-011.patch \
+           file://CVE-2023-52425.patch \
            "

 UPSTREAM_CHECK_URI =3D "https://github.com/libexpat/libexpat/releases/"
--
2.25.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

