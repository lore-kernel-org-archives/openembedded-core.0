Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D428C55175
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:42:08 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38994.1785746521752005798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=HgOXDPs2;
 spf=pass (domain: est.tech, ip: 40.107.162.66, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kd8wdahNDa1qV/YQSAM9e00Mx0iZOTIT9+rzUYjEia9IuqbZutW8kEYwHrH/w8XI/6Y2RrH+sYKORaKfTEXN4GyJDZcgUD2WqO/GCm7gvZ+yHMrRRZQRUePcZ3SdbJvgFDTym4w0Cjl2povjGaLoNDib8w8WI6I4FAeJbouGREtZYjFtgJH9N93BGHtddt4acYE0TowwqBD/RTU0pIJDGNDVTXAwkRvVcQH4mUoFDWX4rw1vHwr2OWZ5Gl/X0FTWKF7ZChUFWYgDlfM7U2UkIqO5IEjPXnrFvWG7RCcutRGOkO1e+gf9q1saUhVGGGcHLEBx1eJo9aDV99MRLzaNXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFkAVILRPZQAydFaxUNERHxFLKpCZIeVxQCiMRhCvCU=;
 b=m2xfE7ZKLFfOvL/vGp9+oBNHfSYq4n1LcL5CTymN39bQsjCPSTn4TnAuolxPjSQaZ4fNPm5w69MytgyCQRrVbpkRZJiJJ+APvNlW7SnF4rb5l5Ko/ZAKvgJdU2miFpT07wubnrLCRpJ5vvJy7WL9B3bcp2MDZjSSOwXfJ2eOW8NoSE0oXc6DEIP/pNeIpzcZ4C/LL/FmDdVHDzKStDmsQe6Ly4sYCe9DZIUGNtfuv3iSEdocqkpsRMUD0oSGKZwGh+4v/ioqSijfjAKFuXigdG/pZOSbUIqeRI8jNvaQOYcoXpneWtlu0CjMDKgaahmgeJmuZTkVfwK1w7ylGaAUFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFkAVILRPZQAydFaxUNERHxFLKpCZIeVxQCiMRhCvCU=;
 b=HgOXDPs2QAFg6cDS+7tlDgrs7KGHryOX1Sq4+FcP0kF1AcGtUHtdoptAQGvh/JNjJnMaDlnp9rRTlrhNeNx/Bvfl1CA3FfZElnSVeGN+z6kbEjx1Mw9dsxeFSlq7fKyBrUc9RD1y0c42XqfFOnk92vbia17ykF1X0kx63aGRNkXonsKDPoY7z8MyLUqF3X9GvwWrxkzfyrpt4w7fHnrUeHZBTTLHWlxhfcsgd/e/xfG48H8TI9d2q4k80gd3mwVRkZcvRf1d6kRI9U2lvPYQIsDGtNbKasggVfZzdvPBqQA3X+S0yi0YjJtLRdb/BlXqXn/cbd/Z4zgUSdzuKnG+qA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB4P189MB2215.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:380::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 08:41:57 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 08:41:57 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH 2/3] libssh2: fix CVE-2026-66034
Date: Mon,  3 Aug 2026 10:41:40 +0200
Message-ID: <20260803084141.46902-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260803084141.46902-1-jaipaul.cheernam@est.tech>
References: <20260803084141.46902-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::34) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB4P189MB2215:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ea690d-9d5f-4e3f-362e-08def13b1424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|13003099007|56012099006|10067099003|11063799006|12006099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	awI7CRbll0jRMfvE3Itxi6gBctLk66HZw8aNB/hSRyWz50B53HiFtNcP9ttB8u0cyUCFqy2sszWKZh8L9j0jEGSpHnqQfYoz1uMRET/tP3HwGtw/nZaK4nT0w16F17ro/PgNJjiNcb1J+UDXBZlkY8L28Ngq3+X1uvTYrQUAhlnxz1lSpTnkxQcq4/zYa0/JYx69+jVXRUIAFqPXtWHsN/Sp2dT/aKoib4zBc334lLUOlvrdvXoJQjD55kvApt2xq41dS0sLBy+rnbMNTXE1P3li81L8XsHHrz4b86WiEWrk83Q11c69mZCIUZsJVCz/vhNJZ2314gvokt6pX9KPuIBae5dJ/xn0T8LO/dzqN1dy70aqt8bOad9Y9gUxTt4rLEzxnDN4vGMrNt70/xE1AvwUNL5/2TBoAyJ0YFN2nAFSzl1MNGMRMoFJwHKAB2wbEdqE8gRCpFUVEQ6+zd9wNrd9IXLKNpq0z0IYK42+TXjR29QL8okTAcQg70XqVoaAb1AzYe4SoWgyf+/U3ylmmDtacIjqZIOO16BnCd+/UeS1mvVRlh0Viq40JdFenIY7mDBRdGZlXuYrVoUiiHEieaMEYlYxZVKCFauVfO0ktISek4vBHkO5RFnmHsV52MqP2vE6OiGLAfhpMMwKCFHaw21NeTZTTkhxZReJ2iea7EI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(13003099007)(56012099006)(10067099003)(11063799006)(12006099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vSIrDGCHoPDSCpPkzOsQWB2pEipxr6AiVAn+cYzirqtDVS5nS15OmV2P5JqL?=
 =?us-ascii?Q?egiAT0cobRElW79av97WRpkfqwrxu0nJKOnd0xk2Nkpmgav7PXTIiE78FGMR?=
 =?us-ascii?Q?afYec4fqqljddL5U+hMXyNqdJgNCAdbCGf6glr0haQZwQSUY+QGMnsRBiFgw?=
 =?us-ascii?Q?oMb4pB47sXLNuJ0cO7yGmCYT1Lvm2M3kjJ3OZClVrGxxUYjxmutXCnODJoq8?=
 =?us-ascii?Q?z4yo0PKPpFY2Oba61sd+sKqTFbaOsAHyX8iFjMUndOFckdRwvoWcSYL3jxhT?=
 =?us-ascii?Q?7qpQVQWq7zN717B4V9SDEeJP67H91xlckL4wWG3hv6P02Hs7nF81jLcylRKB?=
 =?us-ascii?Q?eFHF6+57W8jyydvJorjkdzQ6uS1B3DqYulurnY6SlOkW6sQ5v0fmxhfJPinp?=
 =?us-ascii?Q?Z5uNFvnzRAi2zxnoWlGf7l83+q4FI7PmPJMkUNFNxp0NJXm1WFtVFxzkRUDW?=
 =?us-ascii?Q?ovS+6wFiqh2qO2CB1Fu6nVCjTrDG7yh5u80/puHhCR2g4wfb0IlMWA+8p6Co?=
 =?us-ascii?Q?QQAHnpnkHiXo1F9cIWVeQg+odNepn7m5COUTwecJQ4nX44V1lnBrHJf6fJGC?=
 =?us-ascii?Q?SxxJnbM/xElJmcdXnPLXCWc2oNmoZzD9iVIkYvjCZijBsPQEF4SIcSvRvGM9?=
 =?us-ascii?Q?D6eo+9sR5IX67Tjb1pdWqElcKcEz76cNFBVlb1x1V9lgSI44YliRUe+FyRoF?=
 =?us-ascii?Q?z5UJu/NcPDV5qmz0Prl4lsOjCTjZFWAZDVk39GaOr8OYQrkQi+1WdwXlytI8?=
 =?us-ascii?Q?nXYo76bWDtkxA+MwhKDTJ/E+j3zQ/sboZcr96hunlpEL2117CaX/BiP/YMIU?=
 =?us-ascii?Q?muelO19Qg/Yjc6xtTjw1jkooeplKSXxdm2uahXERiPZwHF8P/P9el/61AAK2?=
 =?us-ascii?Q?XFhnvBzJU0zilesfBMGgSQjUlGZoqzEZQJfnpTE16wJYs9mvaAMUJ+j2qjmP?=
 =?us-ascii?Q?cpi07kMkYrSC6lHzqd/RZ/971MeF6ueVTt4pkZbs3xlObNj8tLeX/wXWGfiQ?=
 =?us-ascii?Q?cFamgiuVisnLnAkYbOMLuMQo+tCJ9De2cIk0+h+7NjHF3mQg2/s6BybGexuG?=
 =?us-ascii?Q?f+xiOfYaHMee4L2g5wuDLVySfFyKb11+0cSJePozW8RHV1Pxrzp+4xEZrsdS?=
 =?us-ascii?Q?ATJfFuD+84Sc6StMv8OFfh1irPBAgwfClDg97YdfvqkRLQLgVdD0W20P8Rh+?=
 =?us-ascii?Q?mUHs5HYUvq3E3z+oo6ir7Wx7qt4FaMXFICqm9myVLlWwIt09K4bTswp60kpR?=
 =?us-ascii?Q?+tpWmq3psIjBCcCocuAgrp4RvKLWtd5tUMwGM90NZ1Xxl3U2H8n9wcBF+mF4?=
 =?us-ascii?Q?ElVIDlYEUrcB3YnC1KLH9W2ZgLH9bzZDnxEpVaPJWN4nR9z73Dej+O/AtAAI?=
 =?us-ascii?Q?2dAfJsAtg+Sz78vPeFZ89R4JQcVb1dlTlqGMhY89P2VurtSpORWsIuI2qbVW?=
 =?us-ascii?Q?bmZ9J+NXnVBiJ6z11/tRjWOT3gY7yZ9Ud1/uHCO1JDzibLQtHdvmI/7BZ20+?=
 =?us-ascii?Q?P83Ay+svYpukm+uXzLG6duFa4WOrS/UyLXrLZlcXUdm0/voVfm/jCI7W7iv0?=
 =?us-ascii?Q?yShnYxWW/CMhgzlURXDJStntI29R0DzV5oR880vMx6q6f4aqqMklCkhKM/CE?=
 =?us-ascii?Q?+bJv6gqXufB+uk7ZeTpcunT6j2y3eY0GBfhpg/ylIk0ZNxZ2dqs2JpovOyy7?=
 =?us-ascii?Q?M5Kn3O22jlflqoMukF3VHPB/kh2WfDADPh8KS7O8BchfllREAmlcpybQULPq?=
 =?us-ascii?Q?8BEhlU62zdG8Uv36RvgxmT4fstqAtEw=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ea690d-9d5f-4e3f-362e-08def13b1424
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 08:41:57.7518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPfbuii+fGiQBxPET8tjcMFiyV6NXp2GbkLUe5+awN+lBJBPC+9Qx7hJtKALzrN8sV6xj5+YWGC9FjAt+iT/5/B1S/0zjRFX/tCPQiYAKVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2215
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242624

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-66034
https://github.com/libssh2/libssh2/commit/a13bb6c773f0d55ad1628cede57e99804=
cd898d9

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libssh2/libssh2/CVE-2026-66034.patch      | 40 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66034.pat=
ch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch
new file mode 100644
index 0000000000..906356baf2
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch
@@ -0,0 +1,40 @@
+From 16720054e0b3f02e36f31dd04add534d73d4a18d Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Sat, 4 Jul 2026 11:19:49 +0200
+Subject: [PATCH] publickey: fix potential OOB read in
+ `libssh2_publickey_list_fetch()`
+
+Reported-by: Vladimir Eli Tokarev
+Fixes GHSA-w6g9-cpfp-22gc
+
+Closes #2202
+
+Backport adaptations:
+- The upstream fix uses ssh2_err() which is not available in libssh2
+  1.11.1. Replace with the equivalent _libssh2_error() call.
+
+CVE: CVE-2026-66034
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/a13bb=
6c773f0d55ad1628cede57e99804cd898d9]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/publickey.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/publickey.c b/src/publickey.c
+index 9c9fa618..f3776d2d 100644
+--- a/src/publickey.c
++++ b/src/publickey.c
+@@ -988,6 +988,13 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pkey=
, unsigned long *num_keys,
+                 }
+=20
+                 if(comment_len) {
++                    if(pkey->listFetch_s + comment_len >
++                       pkey->listFetch_data + pkey->listFetch_data_len) {
++                        _libssh2_error(session, LIBSSH2_ERROR_BUFFER_TOO_=
SMALL,
++                                       "ListFetch data too short");
++                        goto err_exit;
++                    }
++
+                     list[keys].num_attrs =3D 1;
+                     list[keys].attrs =3D
+                         LIBSSH2_ALLOC(session,
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index 7e320ed0f8..54022aa879 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2025-15661-2.patch \
            file://CVE-2025-15661-3.patch \
            file://CVE-2026-66033.patch \
+           file://CVE-2026-66034.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"

