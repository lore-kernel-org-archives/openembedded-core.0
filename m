Return-Path: <wenlin.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DD6C61D88
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 09:09:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.35668.1700557739291184926
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 01:08:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Jy3egwU3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9689ef011e=wenlin.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AL8xeU9022026
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 01:08:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=emHSz4PGlV1Psn/dCs
	Qla8FIT9ASg2B8sP2Q+WaJ7Ok=; b=Jy3egwU34bhV448WGVishD0+mJYcUme7yJ
	E73cVWqcJgxO77IDGcFLd4IVzYn9l2ImeeJJ57tK2SN+utHEAN9qYgkD+LbAtvmK
	nDiJKEXcVYS/DI/LtKzM51GFb6+xU4ucwZDBPBqbibGzUhHCLpjBlZo79WvHLw1T
	ofo4v0x6KSIxmzEth9jYprzRfKY3ZgdJrNc08flaTVFPwK4GXC0rgsYrnwoHObbA
	x9c77Rbet7wFTsUeBuAQ38B4lLanQy2XvDCM3wt+r5J0imbqTtDno3BXg8XJbaZD
	YIm8bnmQttPt+3AOEmh1QkjobUyvHnP4tzP1l8zGI+ESA1CV5uZA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uewnkt2sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 01:08:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAVBmYQJ8mO2SwPEYEFPN/nnqMFSKIgoRYhYsa4GoR3b93a3OowIZgfGYETPdTA2Jpd22LE+O7Kxb6l1FQ2wfCs405GbHB3Alb3ooMVPpRB94Pu1v7Q42NMA1lVR+snFe22Pm7pfum0XaiDtbXqQz+Sw63MA/LME/Pb79/p/MMEY65GBxzfs4VkR8swbtsOSAFNPVXCPaG1nJcuNU0cZq8lMKp/e3wwgwDnIBX4ZJ+Bp4+7qzlD4MjvPl9IW+yqa+jLLAH0GcOiEkIwiUswqIF0y+5Gd/dMrs0tQ1qlWcrl13bq4Vn4X8j6JMXRRr/VavoJ2nYpn5ynHyFW00T2KhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emHSz4PGlV1Psn/dCsQla8FIT9ASg2B8sP2Q+WaJ7Ok=;
 b=UcSsZexhs3hMcx0+PuiGaXrXbVSPjX+Lg7nKGzcMiwbbkN+OFt58DSsFfswVLYFVvCJhy25ZmXPWbfQ8W9yY2WevObWWxQCoGDK4vuY8t11lG1uuYYknW5JBdHDvRuVjJxAjvQHUoO4hSB9h4KHoushlTbIvdY7C80OUnusRBjA9cbVnecXjOkk8aMvXts38X7gQSWbPVnShcbV3OtVSvPXZ8LVq0sM8a7qPkf+bdAq3ozToIkeDS9QXV8XAmcoOBaTbzYzpkPfWOLT9lfw0xBe6qMjWP+1G0pmQTuVxqOtOEJKo1r/ZLLJEyeQ29Y8OqMJ/syjDy2HtRU5SQooIbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6325.namprd11.prod.outlook.com (2603:10b6:8:cf::11) by
 SJ0PR11MB5616.namprd11.prod.outlook.com (2603:10b6:a03:3aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 09:08:54 +0000
Received: from DS0PR11MB6325.namprd11.prod.outlook.com
 ([fe80::58c:71ab:32d4:dbfe]) by DS0PR11MB6325.namprd11.prod.outlook.com
 ([fe80::58c:71ab:32d4:dbfe%5]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 09:08:53 +0000
From: Kang Wenlin <wenlin.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] libxcrypt: fixed some build error for nativesdk with mingw
Date: Tue, 21 Nov 2023 01:08:47 -0800
Message-Id: <20231121090847.3349404-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:a03:505::18) To DS0PR11MB6325.namprd11.prod.outlook.com
 (2603:10b6:8:cf::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6325:EE_|SJ0PR11MB5616:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dab6c41-612f-4e92-4811-08dbea717bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yzUxPVFxS658LmzMFCLxwjmOSspNn44nt2u2s0sUUj8acp7LJ8CjK+6WXv+gsCoxVXc0o33TVQy91FyRxdi7jvI9ua7qxhNai3ZkGJznyN8O6CpgR2rTaD+pcTF/jaFXtuIdOjILaoipH4oG4ENhFPWwRJ/6WET7QHP9rsyktHRj4UEo8b+MAPi+iOa2Hk+gatSfakFhVJ+kXo5UTyr8qp+XHrv+MI+YJ+URjyIXVbisJcYgBWwEHWoBtQaYPM3t3KNa5djnqiIAFt/uO8hlZ9UOcwa8AJxofFOzarqhuirz8HEb2d9R3jfWt8dGwVjePLqDV2uM0x8lDQHG15t14cQhZ3OthxN4z1nIiGGGr0JaAjnLXbKJQ4hOJcB+JPVfWDryMKdOVyiKli1VRTZqCjxzBGc/lz2PkWtteAycTa7/+wubM008UP9jLeuiOxUGd4MGhv7owRn8jTSYbH67G+su+B2MYtf9k242aOJXgMjSBbiHtfTQnh5EPRO99TxwDTGNkZnedgNBN30Rz2S1pd+SIRBnvY/uDN86oRWDY4QaLxIHDTlEgUaWfsNLBRV+bOcaEJpCcaZZePG5agu65PPLkkz06RS3HXXNG5syoCY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6325.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(346002)(39850400004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6506007)(52116002)(26005)(1076003)(6666004)(2616005)(6512007)(6916009)(316002)(6486002)(478600001)(83380400001)(66946007)(66556008)(66476007)(8676002)(8936002)(86362001)(38100700002)(5660300002)(2906002)(41300700001)(36756003)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3mxoQb6WnTmbOUHCydEN9428/usm094KRbDDqfhMxhd4dmpn5e47zvyBur3V?=
 =?us-ascii?Q?wVWrUg4oSOuM7PmWj4OQhWbNHNTZOnEvHSt6uFSDWBMOHef8u3dRo1868XVC?=
 =?us-ascii?Q?kOUup0wtRlRAbHihcK5qo9gP7t7aaYyYGuWFVWbgDP5s6VbKtvigLrtNmP3p?=
 =?us-ascii?Q?6uAEojCUoI8H1VqeeOCTAD9hWY9hQVvDAWvaRs4Ywke8Q5vl4MatHS0EXtl3?=
 =?us-ascii?Q?L91mNy1OIEncnvzLcVYe4GJfDNARytB4PvWIWLJM/vA0Y3UX9I41PJ5xk0E6?=
 =?us-ascii?Q?xFajxHdu87XjYlCNlqH8Zaeqact1dIAwoEaYoVMTIZLyinZsP8XZRUmanmgC?=
 =?us-ascii?Q?PlzKwt7/3U3ma3hzKg5uRGtkD3rqJaVUIJtPOyjiJd6BzTGY+CJ3iz55P3ik?=
 =?us-ascii?Q?mDZIQvvkwqQViRCqKQSD8kbJpRi4f10t7flYiYqSv9a1K5JZWvB9Da6YBzOi?=
 =?us-ascii?Q?a3SlvNpBYHmz4kPSjwNqQ5QYq2aZjXYwBDPJPCLlJLF3ratqQdr6KjTHuCrg?=
 =?us-ascii?Q?2YFMzh39f47y7IMt1Zj+OLc9FQwAgGP4dJTIW4dx02hN6WteUZrODZoKIrUA?=
 =?us-ascii?Q?bsUSXFg6Cn145GgPXflzifvXWdQlkWPxN50h2MvbYMuHCunsBptEoo6kbZib?=
 =?us-ascii?Q?ZPcNMS/IfE8BKaWzZR/YhbbIJNcW0qbhF4Pb9dkAfyAeS2JZ3kUnLvimxKqP?=
 =?us-ascii?Q?6PMOSmR8qrpCIuXTCZ7pwbf7sa+9gDlHhKAdVX5gJDtUFytMdbPEOHgGX/sF?=
 =?us-ascii?Q?YQzGRLbRUIurx0p3ohdIsMQ71YEyrK0GjtQeEJDs/D9a2xK7FIJ3P8sXMrpO?=
 =?us-ascii?Q?2ivCek1LC/DJvvsAgwZkqpHEpV3UDuPs/6PLsKCcWv9wzCxa9cBkJ11pNd23?=
 =?us-ascii?Q?Zi/vE8duJ7aD91aIRbNmSU+Le8XQprRk/OQCSubD7taQaO4HsgRGPCGCdTly?=
 =?us-ascii?Q?04YjP3jacOyw+EjK2cYIggPn1aS8KqrjBZVw7sMubm3V6o9PZISCJTfdVjhp?=
 =?us-ascii?Q?/bmLgbR5tGoO0KE5y1c9VmqmfupWTeDBrwdUPAlDB+Vvl+ANmInsBx+En4f7?=
 =?us-ascii?Q?A3Ned035tyhZF0hGopHgMcw+GeL4Zh2AFpv+SovkcDum2S8jrj48mm0OJXoG?=
 =?us-ascii?Q?NQLTNF9d3Y0XkFc6LjrcHhzZ/P7QURwetYJ893U7dKi+nCT8msXFtTTNktjm?=
 =?us-ascii?Q?cV8VKCOba2gqmXU0/+TVYLXkMvpko+yqu2see/Vq065R4anx3S3ffW7aaPWc?=
 =?us-ascii?Q?uYyZ4p3JeLYybcAq01gtLdCOmcf5eNoD/kHTIa99EeNp7Eji7DDVNAM+ltHy?=
 =?us-ascii?Q?sEbGLCNCX/XplWTlvyP8jvt4flxPTMQPR5g2irDuK0R6RD9s7U2kC02qqUN8?=
 =?us-ascii?Q?KOCWr0oncKgLshARC/MipBhP9ApiK4sNBnQ1I4sD4+STFSuEldYKKBoR4O6t?=
 =?us-ascii?Q?S7XidWUKmhk0dyFHcLPgcv8pINJNuutnd//4+4nN5y5Y5e0OUB7YY0UbjBgL?=
 =?us-ascii?Q?pPyrM8G5xdoOCoY9okY9QgXCd2HDx98zX9Az4hSJaEm08GxNxSKMZc3SfIAI?=
 =?us-ascii?Q?F6KYU1oDnmY8wTlyGiBgyr/jQNLSvMF8qXz1+GtdpJPnLLoJmG14AJN+gbWG?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dab6c41-612f-4e92-4811-08dbea717bb8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6325.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 09:08:53.5378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUoKJC5gxE+XULrdfVZQXSVBNjyVBiSCWSeETby+PU4pfoDT0TUnpVkGTBFwAB85Z5eDHnYzXOqVdY730PhxDxS6DRVrNcqIwSI99+90el4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5616
X-Proofpoint-ORIG-GUID: Qb7Acc-pvwfdQLmWaC6cqiAvfYlLElup
X-Proofpoint-GUID: Qb7Acc-pvwfdQLmWaC6cqiAvfYlLElup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311210071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 09:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190960

From: Wenlin Kang <wenlin.kang@windriver.com>

Steps to reproduce
  1) add layer meta-mingw
  2) add line in local.conf
     SDKMACHINE = "x86_64-mingw32"
  3) bitbake nativesdk-libxcrypt

Fixed:
1. .symver error
  | {standard input}: Assembler messages:
  | {standard input}:4: Error: unknown pseudo-op: `.symver'

2. pedantic error
  | ../git/lib/crypt.c:316:24: error: ISO C does not allow extra ';' outside of a function [-Werror=pedantic]
  |   316 | SYMVER_crypt_gensalt_rn;
  |       |

3. conversion error
  | ../git/lib/util-get-random-bytes.c: In function '_crypt_get_random_bytes':
  | ../git/lib/util-get-random-bytes.c:140:42: error: conversion from 'size_t' {aka 'long long unsigned int'} to 'unsigned int' may change value [-Werror=conversion]
  |   140 |           ssize_t nread = read (fd, buf, buflen);

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 .../0001-Fix-for-compilation-on-Windows.patch | 37 +++++++++++++++
 ...dom-bytes.c-fixed-conversion-error-w.patch | 47 +++++++++++++++++++
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  4 ++
 3 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-core/libxcrypt/files/0001-Fix-for-compilation-on-Windows.patch
 create mode 100644 meta/recipes-core/libxcrypt/files/0001-lib-util-get-random-bytes.c-fixed-conversion-error-w.patch

diff --git a/meta/recipes-core/libxcrypt/files/0001-Fix-for-compilation-on-Windows.patch b/meta/recipes-core/libxcrypt/files/0001-Fix-for-compilation-on-Windows.patch
new file mode 100644
index 0000000000..5760ee09cc
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/files/0001-Fix-for-compilation-on-Windows.patch
@@ -0,0 +1,37 @@
+From a507b628a5a5d4e4f1cf0f0a9a72967470ee7624 Mon Sep 17 00:00:00 2001
+From: Brecht Sanders <brecht@sanders.org>
+Date: Fri, 3 Feb 2023 08:44:49 +0100
+Subject: [PATCH] Fix for compilation on Windows
+
+This fix allows the library to build on Windows (at least with MinGW-w64).
+
+`.symver` is only supported for ELF format but Windows uses COFF/PE.
+
+Workaround dummy define of `symver_set()`
+
+Upstream-Status: Backport [https://github.com/besser82/libxcrypt/commit/a507b628a5a5d4e4f1cf0f0a9a72967470ee7624]
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ lib/crypt-port.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/crypt-port.h b/lib/crypt-port.h
+index f06ca24..a707939 100644
+--- a/lib/crypt-port.h
++++ b/lib/crypt-port.h
+@@ -201,6 +201,11 @@ extern size_t strcpy_or_abort (void *dst, size_t d_size, const void *src);
+   __asm__(".globl _" extstr);                           \
+   __asm__(".set _" extstr ", _" #intname)
+ 
++#elif defined _WIN32
++
++/* .symver is only supported for ELF format, Windows uses COFF/PE */
++# define symver_set(extstr, intname, version, mode)
++
+ #elif defined __GNUC__ && __GNUC__ >= 3
+ 
+ # define _strong_alias(name, aliasname) \
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/libxcrypt/files/0001-lib-util-get-random-bytes.c-fixed-conversion-error-w.patch b/meta/recipes-core/libxcrypt/files/0001-lib-util-get-random-bytes.c-fixed-conversion-error-w.patch
new file mode 100644
index 0000000000..3846f76674
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/files/0001-lib-util-get-random-bytes.c-fixed-conversion-error-w.patch
@@ -0,0 +1,47 @@
+From ff99091eb8a6b9e6edc567f6d2552183fbaacec3 Mon Sep 17 00:00:00 2001
+From: Wenlin Kang <wenlin.kang@windriver.com>
+Date: Mon, 6 Nov 2023 14:43:28 +0800
+Subject: [PATCH] lib/util-get-random-bytes.c: fixed conversion error with
+ mingw
+
+With x86_64-w64-mingw32-gcc. get below error:
+| ../git/lib/util-get-random-bytes.c: In function '_crypt_get_random_bytes':
+| ../git/lib/util-get-random-bytes.c:140:42: error: conversion from 'size_t' {aka 'long long unsigned int'} to 'unsigned int' may change value [-Werror=conversion]
+|   140 |           ssize_t nread = read (fd, buf, buflen);
+|       |                                          ^~~~~~
+
+In util-get-random-bytes.c, has get_random_bytes(void *buf, size_t buflen),
+but in mingw-w64-mingw-w64/mingw-w64-headers/crt/io.h, read() has "unsigned int"
+read(int _FileHandle,void *_DstBuf,unsigned int _MaxCharCount), and has:
+ #ifdef _WIN64
+   __MINGW_EXTENSION typedef unsigned __int64 size_t;
+ #else
+   typedef unsigned int size_t;
+ #endif /* _WIN64 */
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ lib/util-get-random-bytes.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/util-get-random-bytes.c b/lib/util-get-random-bytes.c
+index 79816db..68cd378 100644
+--- a/lib/util-get-random-bytes.c
++++ b/lib/util-get-random-bytes.c
+@@ -137,7 +137,11 @@ get_random_bytes(void *buf, size_t buflen)
+         dev_urandom_doesnt_work = true;
+       else
+         {
++#ifdef _WIN64
++          ssize_t nread = read (fd, buf, (unsigned int)buflen);
++#else
+           ssize_t nread = read (fd, buf, buflen);
++#endif
+           if (nread < 0 || (size_t)nread < buflen)
+             dev_urandom_doesnt_work = true;
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 342cbd0d06..2b3cd31c2a 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -16,6 +16,8 @@ SRCBRANCH ?= "master"
 SRC_URI += "file://fix_cflags_handling.patch \
     file://0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch \
     file://0002-Remove-smartmatch-usage-from-gen-crypt-h.patch \
+    file://0001-Fix-for-compilation-on-Windows.patch \
+    file://0001-lib-util-get-random-bytes.c-fixed-conversion-error-w.patch \
 "
 
 PROVIDES = "virtual/crypt"
@@ -29,4 +31,6 @@ CPPFLAGS:append:class-nativesdk = " -Wno-error"
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"
 
+CFLAGS:append:class-nativesdk = " -Wno-pedantic"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.0


