Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E294CC6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 08:11:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.67068.1679559099959734099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 01:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qiWMpuUQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2446a955f4=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32N8AN14030337
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 08:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=1SR8j9i5VdW6S1cSgPyZkJfqD8ZkTn2AYtM6D+lqcSs=;
 b=qiWMpuUQRsiAc6QNLXlwsVoMzas+k/fh2nujsrutPZlM+5W2qZHUyMxwRlOEGv93eSfP
 0Ni/0GHn4I0CK2fqpMohVUa+NLZrZ8MZ3n8RcUJY9irKWl02AmQwiDGRrVuj+x3YZoyC
 LsDhdBhFeYcxHzo3bDK/NMuzxw0aKRI5AYgOFQPXk79evuuoIwJDSoklXPzaiCiXY4zT
 OZWCR6QBxLM0B6lPNlGXBBh7ww3UdWCuL5GpNJZAPzMTWVB7K/NaOWNj3Ym4vRV8HBHH
 P0CEAvyJlJD1mVOswHIrLyBWHosmm7sI7cpvHYzEEK7jY6y4Wshz/WIXNqHxn1jOt1u/ qQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pfqu4hfut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 08:11:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZ1wn9TbBphdQTtkHbynkVxBgxGmmPfczAgxOP9VyKXpl+ug+dxowoYEAb54E8xj6ENL8N1BKmLP9xpCPr5ghQKgJ2OedJvlYWjdyYeCk0oc2Hx74wqfiRtWklQJ5QI4P2I90zHGaKg6WjC4gjhuV0t0iXKhcGXItF444Mo4o1818BkfwUw6hJpy5pxjxVg0/zWtyNgWFPrpjnjup8TKK47o3Z7Iw58YqiCZxpAFgY72OE7CQGY43BqxXH4MCcE33EzE+NJXlyPyVh03SPvXPRI/0qnBe0fjwAljKr2CUkNtcKsV5cG4AfNPG/I1QGMiY2bO/A1aNvxUTu9n37bLHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SR8j9i5VdW6S1cSgPyZkJfqD8ZkTn2AYtM6D+lqcSs=;
 b=dyQO+aniXM2wJzCyD1HECUxU/4xCFn6Tjw61/TdfbHitIqqSu0Y+Lfi04B6ZLlEQIcOF9zV/X4elmVrX1K3RzgGFG7BfaX8zjOABfJyUFYYP4ZjowYlQPPD90RA1hZK/3tHSkoH/paAmM+njyPg7KuV8sI1IXMRyi9SmQAK12ztuewq4ItLOHkfJMWNu/weAzyuWr2Sy+i5kLWbaD8yWuCRhWbUG1Y6kVAt4qVtgAo7wiO2dNgN+UNnEuYRx9uKeqLYVoYUoWRrm1g45MOVP5R0rCcgkCDdjMU8J5fzjTdnflcw6BRZ6+70kjNLWTjSQ8g0RpXKn8KGDsPH6nnWv2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 08:11:34 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95%6]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 08:11:34 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] debugedit: add recipe
Date: Thu, 23 Mar 2023 16:11:15 +0800
Message-Id: <20230323081115.28531-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: f8470fee-5068-4d91-d680-08db2b7637a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f6ZJapsBhEcPgeWBC79uYurVrKWcqnGOA+eW+ZZgfOtPiQhHvkCnaKQYt9hIbGuBoweMK6aBTX4NJxwk7puFFbrFkNgDSWjTAKFN/UXFpDkGC2LYqhRmkYs02ogtDzQjVqPVekl+sDFgnKb20ufAGomARGyxxgPaP5cye9J6oVuF9XrVU5ntlSEOwyLQSgv1+YYmokDIQ23fuWE5xSCmD8iEQLd3MYOG+TxVeyQKU4vG6HIy236ANprGx5qLHgQDhMQ3B9pqZ7Xojs+9uFyl3XdXtR1w5RbVgy+D1+zOJqhx0t73qRQfwNAUluSQaTDQ/lDyaQQhcavRT3PwJio+43nj7mcTUvsY+NEluVp0oC00taLu4Cet0g9nGRrAeWeCdEd3wpvFJuUbaxPKkoCL5jYFDAsWQC298ongvt+LiUb9Cye3TmWS4xzUn8G4225s7pFp6nsW5ALmFG+1aZlkagrJzegjOwHDsJjq8eak/LZp2W1egMO56m8zuv9N6PFzOoXs8k6Qw+dyM6AkK+ZCblRki5CIbg8ACpvFetQOp1mwuZ13gHh4phdO/o91MSvb4jpp3KeqFsI0vd26ZAdmNVTZgLTl9JdgIvqP37VufAVwzsar2itQjTXa2mNaYMtlq3wdlDNCBZ/TzTrFhbVCkv30bj/vR/ZWU439mjBAowigXXkkg1G9JSE7HyHTWX7dXjnhQgyCyIFCI2y53LvoUgyaD66Bzzt/JA1PtcWLpNM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(366004)(39850400004)(346002)(136003)(451199018)(41300700001)(66476007)(5660300002)(8676002)(6916009)(2906002)(86362001)(36756003)(38350700002)(38100700002)(8936002)(52116002)(26005)(6666004)(6486002)(966005)(478600001)(316002)(66946007)(30864003)(66556008)(2616005)(83380400001)(6506007)(1076003)(6512007)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0qNm/AMdqXRnWprz70nbE27Ot57NxypoIPZhBohz1kFEMKryFrgp+9HKoq5J?=
 =?us-ascii?Q?WW2MElxiJ8OXrEymA2ppv7OJia/lmz91ukjH5Jbtfks4HRsHuP6Lw49OIxNT?=
 =?us-ascii?Q?CE4YLeLYjMIMx3/36ju9T5bkk6ropfp+KrutcvP6rjOP3V24/w6q3cRNUY2g?=
 =?us-ascii?Q?wWRma4Uas7MaujgHKnkK1ZQO7tMr3CG7Knhsr55d1d8cZTeMBYW1oNXBNFN9?=
 =?us-ascii?Q?8YuyCkVsv3snFH82Wm2Tdvs2WVtPlbVw5JsBUXCQwxnFFw2IhkBtKJgitZ+I?=
 =?us-ascii?Q?gZnt7c8htnPLw7XhNDJzbUFfluAO2jvNCkPK/fIG6q2t3JMg06JNy7bTfxcf?=
 =?us-ascii?Q?RO4wOHirvtzW9lZ9haw2C3LNb4oyJn+eOjYw65PT6Zgxt59KHjMBOG+wfisR?=
 =?us-ascii?Q?JOXLbxgPKbzcn7EWX0sE/nu/dxFKqfmEm6BDR+Gn3StiZeKv542EnD+rXC83?=
 =?us-ascii?Q?R0+bRSHg9rina722Gk8rcOVl/YtmFEKXzyj8ZT5ZMIKFnuibYCPqxO6QlYrc?=
 =?us-ascii?Q?WWRfGbJyGwy2FTyTHmjCQXxywMvVt0P6hIK/AgL+lGdBd4gD+yT5XM75Hmb8?=
 =?us-ascii?Q?PdCD+oqg41PmQjRZnaVhRQNT2LBoRc6jV8/RfH3VpJbUSp9ACSnKQUU7a2xi?=
 =?us-ascii?Q?EU/xwSYZgHDFvoXbRl8xjCrG43DuaFeHN5ii2sFIkss/bSJUfH3/kQ/+8AiM?=
 =?us-ascii?Q?HbyAipI2sgBXozQmoDNnTP798OuZkmWNeHFFrEW4It1KwgzRVxix9MonDWai?=
 =?us-ascii?Q?+VWH2GnQMFG5T+SEx0NzFKrVTtz84mZZCwAoxMZmVO/iSkDf4T+zjyAE4thn?=
 =?us-ascii?Q?KTLSDCKJCiTiQx0EeHLsevaEeBLsAeHPGyB3ogEt8TmxAlFmHtOwaGv2DXf/?=
 =?us-ascii?Q?PnFduHkUOFcJjclDLujElly5s4bkIps+XNWrM1Xn1Z5ZfzKEv9LOikqzdYyt?=
 =?us-ascii?Q?da7WLHvx2amBNNDGgfiHxtwhfFbd96dgS61D7Fx4xF+quw793DczcmxEp0Wd?=
 =?us-ascii?Q?wpzuwXQkv0+sHnEKcY/s3eHQef+q3sV66QxTIAicgPUiABqtITOZheQeEl2L?=
 =?us-ascii?Q?OIly0FRU3CwVYSmNuv05LzIGcLOBnqKypUTl7MhxFizATo/MX/asC3Pgy5Ar?=
 =?us-ascii?Q?zXbpGZ3qVnZ27AWnN+FiKLFH8ISE9iwp7fpPU8OZdULLiiDlh+Idb9b4AEeV?=
 =?us-ascii?Q?hY+rNdnNjvR4fVfBHo0d47RNUJ0KMiAO5teUtTCvlfaoEDmnPiKWQ+o4mLyh?=
 =?us-ascii?Q?TGdT1uHKOV5Ey+uLgybk+iqobByhHqqeQ3NTGNW6QOw61nBIP2c7isWe6uys?=
 =?us-ascii?Q?MJLavNcwXJbCOXotz5ta9gs/8FIXD32F46fPZBDnCJz3dAd5FE3lacdJrU2I?=
 =?us-ascii?Q?DZutaFITf+e1+ujVsLmNE6qG1xC/qKWVrEv+1yI35Y+hmgI2xO2jKV8JfH20?=
 =?us-ascii?Q?wsj4zRMxEv7dmXwdM4ikVYm125rbEh4gRc3wSD69SOlhP/ypM3FYQZ5oOw29?=
 =?us-ascii?Q?h7QySfntMl+fegq8VO7Z5zYZ0SZZf82RVee7hCPC9b8c2D9i1aSS9TX3oY/w?=
 =?us-ascii?Q?BA+jzb9TD4C+VfkDSbG6ZRM2Soc88svW0J1ShkDp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8470fee-5068-4d91-d680-08db2b7637a1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 08:11:34.7088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjfEII5Cb8jBaOM4hG8sQm1f7xVL9AzEfYn1oVn0XGJmHtyWTEp7RX2V9Pl+AURD1m8QUNGyMnAkssP8hw7yOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5068
X-Proofpoint-GUID: X8yKQSVhRltBOxhYGWQSSOQuUBZlBPUU
X-Proofpoint-ORIG-GUID: X8yKQSVhRltBOxhYGWQSSOQuUBZlBPUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 08:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178967

This recipe provides find-debuginfo which is used by rpm, more
specifically rpmbuild.

RPM upstream removed find-debuginfo and switched to use debugedit
in the following commit.

  https://github.com/rpm-software-management/rpm/commit/04b0805a756cdd9466fb9dc717846f5bf15518cc

Without debugedit, rpmbuild fails to generate debuginfo package when
%debug_package is added to spec file.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../debugedit/debugedit_5.0.bb                |  28 +++++
 ...tools-Add-error.h-for-non-glibc-case.patch | 102 ++++++++++++++++++
 ...ugcrcfix.c-do-not-use-64bit-variants.patch |  56 ++++++++++
 ...003-Makefile.am-do-not-update-manual.patch |  65 +++++++++++
 4 files changed, 251 insertions(+)
 create mode 100644 meta/recipes-devtools/debugedit/debugedit_5.0.bb
 create mode 100644 meta/recipes-devtools/debugedit/files/0001-tools-Add-error.h-for-non-glibc-case.patch
 create mode 100644 meta/recipes-devtools/debugedit/files/0002-sepdebugcrcfix.c-do-not-use-64bit-variants.patch
 create mode 100644 meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch

diff --git a/meta/recipes-devtools/debugedit/debugedit_5.0.bb b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
new file mode 100644
index 0000000000..257238fa24
--- /dev/null
+++ b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Tools for creating debuginfo and source file distributions"
+DESCRIPTION = "debugedit provides programs and scripts for creating \
+debuginfo and source file distributions, collect build-ids and rewrite \
+source paths in DWARF data for debugging, tracing and profiling."
+HOMEPAGE = "https://sourceware.org/debugedit/"
+
+LICENSE = "GPL-2.0-only & GPL-3.0-only & LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+                    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+                    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz"
+
+SRC_URI:append:libc-musl = " \
+           file://0001-tools-Add-error.h-for-non-glibc-case.patch \
+           file://0002-sepdebugcrcfix.c-do-not-use-64bit-variants.patch \
+           file://0003-Makefile.am-do-not-update-manual.patch \
+           "
+
+SRC_URI[sha256sum] = "e9ecd7d350bebae1f178ce6776ca19a648b6fe8fa22f5b3044b38d7899aa553e"
+
+DEPENDS = "elfutils"
+
+inherit pkgconfig autotools
+
+RDEPENDS:${PN} += "bash elfutils-binutils"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/debugedit/files/0001-tools-Add-error.h-for-non-glibc-case.patch b/meta/recipes-devtools/debugedit/files/0001-tools-Add-error.h-for-non-glibc-case.patch
new file mode 100644
index 0000000000..f6d64cb4e7
--- /dev/null
+++ b/meta/recipes-devtools/debugedit/files/0001-tools-Add-error.h-for-non-glibc-case.patch
@@ -0,0 +1,102 @@
+From 4c797d3b559ba51bd9ccd9a2036245819acce843 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 23 Mar 2023 10:54:21 +0800
+Subject: [PATCH] tools: Add error.h for non-glibc case
+
+error is glibc specific API, so this patch will mostly not accepted
+upstream given that elfutils has been closely tied to glibc
+
+This is a OE specific workaround for musl.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ tools/debugedit.c      |  7 ++++++-
+ tools/error.h          | 27 +++++++++++++++++++++++++++
+ tools/sepdebugcrcfix.c |  7 ++++++-
+ 3 files changed, 39 insertions(+), 2 deletions(-)
+ create mode 100644 tools/error.h
+
+diff --git a/tools/debugedit.c b/tools/debugedit.c
+index 668777a..a72c3c0 100644
+--- a/tools/debugedit.c
++++ b/tools/debugedit.c
+@@ -25,7 +25,6 @@
+ #include <byteswap.h>
+ #include <endian.h>
+ #include <errno.h>
+-#include <error.h>
+ #include <limits.h>
+ #include <string.h>
+ #include <stdlib.h>
+@@ -40,6 +39,12 @@
+ #include <gelf.h>
+ #include <dwarf.h>
+ 
++#ifdef __GLIBC__
++#include <error.h>
++#else
++#include "error.h"
++#endif
++
+ #ifndef MAX
+ #define MAX(m, n) ((m) < (n) ? (n) : (m))
+ #endif
+diff --git a/tools/error.h b/tools/error.h
+new file mode 100644
+index 0000000..9b24418
+--- /dev/null
++++ b/tools/error.h
+@@ -0,0 +1,27 @@
++#ifndef _ERROR_H_
++#define _ERROR_H_
++
++#include <stdarg.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <errno.h>
++
++static unsigned int error_message_count = 0;
++
++static inline void error(int status, int errnum, const char* format, ...)
++{
++	va_list ap;
++	fprintf(stderr, "%s: ", program_invocation_name);
++	va_start(ap, format);
++	vfprintf(stderr, format, ap);
++	va_end(ap);
++	if (errnum)
++		fprintf(stderr, ": %s", strerror(errnum));
++	fprintf(stderr, "\n");
++	error_message_count++;
++	if (status)
++		exit(status);
++}
++
++#endif        /* _ERROR_H_ */
+diff --git a/tools/sepdebugcrcfix.c b/tools/sepdebugcrcfix.c
+index da50e6c..c4a9d56 100644
+--- a/tools/sepdebugcrcfix.c
++++ b/tools/sepdebugcrcfix.c
+@@ -29,10 +29,15 @@
+ #include <endian.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-#include <error.h>
+ #include <libelf.h>
+ #include <gelf.h>
+ 
++#ifdef __GLIBC__
++#include <error.h>
++#else
++#include "error.h"
++#endif
++
+ #ifndef _
+ #define _(x) x
+ #endif
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/debugedit/files/0002-sepdebugcrcfix.c-do-not-use-64bit-variants.patch b/meta/recipes-devtools/debugedit/files/0002-sepdebugcrcfix.c-do-not-use-64bit-variants.patch
new file mode 100644
index 0000000000..4463bd2324
--- /dev/null
+++ b/meta/recipes-devtools/debugedit/files/0002-sepdebugcrcfix.c-do-not-use-64bit-variants.patch
@@ -0,0 +1,56 @@
+From 3e05bbc1f7909ab6f529e66f0d0f70fb1e60583a Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 23 Mar 2023 11:55:53 +0800
+Subject: [PATCH 2/2] sepdebugcrcfix.c: do not use 64bit variants
+
+configure.ac checks for largefile support via AC_SYS_LARGEFILE
+already, therefore use off_t, open and lseek instead of 64bit
+variants. Musl e.g. does not define them without _LARGEFILE64_SOURCE
+and error is not seen on glibc because _GNU_SOURCE defines
+_LARGEFILE64_SOURCE.
+
+This patch is marked as inappropriate as debugedit obviously only
+wants to support glibc or some glibc compatible libcs. We can see
+this from the error() usage. And this patch is only for musl.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ tools/sepdebugcrcfix.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tools/sepdebugcrcfix.c b/tools/sepdebugcrcfix.c
+index c4a9d56..882e5f5 100644
+--- a/tools/sepdebugcrcfix.c
++++ b/tools/sepdebugcrcfix.c
+@@ -144,7 +144,7 @@ crc32 (const char *fname, const char *base_fname, uint32_t *crcp)
+       error (0, errno, _("cannot open \"%s\""), debugname);
+       return false;
+     }
+-  off64_t size = lseek64 (fd, 0, SEEK_END);
++  off_t size = lseek (fd, 0, SEEK_END);
+   if (size == -1)
+     {
+       error (0, errno, _("cannot get size of \"%s\""), debugname);
+@@ -289,7 +289,7 @@ process (Elf *elf, int fd, const char *fname)
+ 	  return true;
+ 	}
+       updated_count++;
+-      off64_t seekto = (shdr->sh_offset + data->d_off
++      off_t seekto = (shdr->sh_offset + data->d_off
+ 			+ (crcp - (const uint8_t *) data->d_buf));
+       uint32_t crc_targetendian = (ehdr->e_ident[EI_DATA] == ELFDATA2LSB
+ 				   ? htole32 (crc) : htobe32 (crc));
+@@ -361,7 +361,7 @@ main (int argc, char **argv)
+ 	error (0, errno, _("cannot chmod \"%s\" to make sure we can read and write"), fname);
+ 
+       bool failed = false;
+-      int fd = open64 (fname, O_RDWR);
++      int fd = open (fname, O_RDWR);
+       if (fd == -1)
+ 	{
+ 	  error (0, errno, _("cannot open \"%s\""), fname);
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch b/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
new file mode 100644
index 0000000000..de467f5365
--- /dev/null
+++ b/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
@@ -0,0 +1,65 @@
+From 4f0d7d2f4900ce8555e09854dc681278b7a3d9a9 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 23 Mar 2023 13:09:23 +0800
+Subject: [PATCH 3/3] Makefile.am: do not update manual
+
+The tarball ships these manuals, no need to re-generate them.
+We have local patches for debugedit.c and sepdebugcrcfix.c,
+this will triger re-generation of the manuals, which causes
+error of missing help2man.
+
+This is an OE specific patch. If we don't have local patches
+patching debugedit.c and sepdebugcrcfix.c, this patch is also
+not needed.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile.am | 30 ------------------------------
+ 1 file changed, 30 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 98b2f20..f91deea 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -52,36 +52,6 @@ sepdebugcrcfix_LDADD = @LIBELF_LIBS@
+ # Manual pages are generated for dist
+ dist_man_MANS = debugedit.1 sepdebugcrcfix.1 find-debuginfo.1
+ 
+-# The 'case' ensures the man pages are only generated if the corresponding
+-# source script (the first prerequisite) or configure.ac (for the version)
+-# has been changed.  The executable prerequisite is solely meant to force
+-# these docs to be made only after the executable has been compiled.
+-# This makes sure help2man is not normally necessary (since the generated
+-# man pages are distributed).
+-debugedit.1: tools/debugedit.c configure.ac debugedit$(EXEEXT)
+-	@case '$?' in \
+-	  *$<* | *configure.ac* ) $(HELP2MAN) -N --output=$@ \
+-		--name='debug source path manipulation tool' \
+-		./debugedit$(EXEEXT) ;; \
+-	  * ) : ;; \
+-	esac
+-
+-sepdebugcrcfix.1: tools/sepdebugcrcfix.c configure.ac sepdebugcrcfix$(EXEEXT)
+-	@case '$?' in \
+-	  *$<* | *configure.ac* ) $(HELP2MAN) -N --output=$@ \
+-		--name='fixes CRC for separate .debug files' \
+-		./sepdebugcrcfix$(EXEEXT) ;;\
+-	  * ) : ;; \
+-	esac
+-
+-find-debuginfo.1: $(top_srcdir)/scripts/find-debuginfo.in configure.ac find-debuginfo
+-	@case '$?' in \
+-	  *$<* | *configure.ac* ) $(HELP2MAN) -N --output=$@ \
+-		--name='finds debuginfo and processes it' \
+-		./find-debuginfo ;;\
+-	  * ) : ;; \
+-	esac
+-
+ noinst_HEADERS= tools/ansidecl.h \
+ 		tools/hashtab.h \
+ 		tools/md5.h \
+-- 
+2.17.1
+
-- 
2.17.1


