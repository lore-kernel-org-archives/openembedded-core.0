Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.74])
 by mx.groups.io with SMTP id smtpd.web12.3617.1615519363063085112
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 19:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cPgefixK;
 spf=pass (domain: windriver.com, ip: 40.107.244.74, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1dWVw0Ol5kkaPkbeq078+bRZmNHqx0A4b6IU8C7DB+bVCut/ohEmF0/ZtYTEcJeukhUN1L1M3/KBEMnlPCLKk0G/mOJZ0fK7QxsBvqsJ9a10GyidLMU+j4ti0gnlI3WBNPaVKO/V1dNgOr2qDxjgJWLWCo1kySofP8+6UNDiVg64BgvY/r8cH8Ezvo9dvrpG6Kc69uX78XdaOHBzuF8v/LAemoTXzxZxADoI5jtR7OmODmyX2+T8QWL8nGb9UOLiZ6Dwxp8TZAGCbWlQ7GBRjwh3j76G2sB/13QCu0w4UkNt8unswSaHZMbgZ+219ppMM1DfyKm7Mpi/EZOPY9JrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFiR26vBcu849RDqE89K5/DEtxbYADyG8Bv9VXEO7uQ=;
 b=PlEHtKU+YShT0nIKiY0szZUaPSaNmTt+JuQBi+GNKb1vjPX+d9zbvEspToHX2sRtHX+bdcvr7cDSVn8wO7PeFY63xBxB7+/tPtjWyi0DB1aNB7XknfvGqKp3n3ZOIeCLYEtosl0RsNinMoWMVcnggZ9vpEPWVWdTBh1J45CnKGdE5DO1rDwcaNHLO7Ol2+C2zI5d72VHS1pKCRU2dAGnwa9BTWMoOEcjtVKDJjkI2vnDf8SY68PlKdg15VWnaYN4q8DFATImtZvtPaN2QMkzwkkAlg55yS/LohViZFWqQTUu11L5/IGa9wzabMJo7aeGxYZrx10wc9EsQxhKogbrVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFiR26vBcu849RDqE89K5/DEtxbYADyG8Bv9VXEO7uQ=;
 b=cPgefixK57gwV/rOWF838xXVmSvbEBkJ9XqJP2ouz9/0hJd0CYtRPG1kuTGtV/Wyt+sbFym03qDvDk9SAAUPRKiRgDr3BTXQUWf+yG3okytuU9yGppaPNCNakjcRgNMo37AupjMMlwNSkHK3K4H7Gf7iaUXMcBdk8eBE9B/dAe8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB3448.namprd11.prod.outlook.com (2603:10b6:a03:76::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 12 Mar
 2021 03:22:41 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4%6]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 03:22:41 +0000
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] glibc: fix pthread_cond_destroy hang with process-shared mutex
Date: Fri, 12 Mar 2021 11:22:27 +0800
Message-ID: <20210312032227.563402-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0106.apcprd03.prod.outlook.com
 (2603:1096:203:b0::22) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HK0PR03CA0106.apcprd03.prod.outlook.com (2603:1096:203:b0::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Fri, 12 Mar 2021 03:22:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02eb7102-bfff-482f-1aeb-08d8e50617fd
X-MS-TrafficTypeDiagnostic: BYAPR11MB3448:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB344818D78BD55210F0EED89EE46F9@BYAPR11MB3448.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:16;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T7ZTw8Gj+RgC8gn6xhCQL1n+wIuXJmZ3TwazuBQX48HMeRyqW9BF/zB+a3cW+KAKWcg7kDHDcWUhjOEt8TBltismrvPgkGKm2og9UcYHbsFNInM2MVl9SQXMcMAP5rdn+jnU+Ov4l10R0+Btj2nj+nrefPP3j2dRoW9x0zyhW6FQdrwDz2UQVFhCXetywuLUU6dmPmTZ0r/XWuzASbd2qPW1E/93mnt8pRraIoK6KTYAxvV+LojUwb4BLrC0LZO8WRIaeQTuZz+caJLKinJ1vUQtilUjiWA3r0p7LMSIJ8b/2B0eS4mOBFa3oPdg70CBNBFBpKwJstZA21QLUmObw7iMkh0mOp6WBFa+aR9SYcUuM9Lbbmc9HYMArhlbkJ8vWDqu4hsb8yvePbun/U8rnMXum9FOUGSD25nSXCmNJcITPs6yMBDqpTjziTzzPL/Xp89LrHPGvNdYli3+N74t6fKHUic9BIlN531IhScrazK38fhDSaaozbMmWJ+z/8H4um6o2MnNtx4ToI2Lg5sIVB8Qx+DoDWgyvhM+yO9J+akuuriSqfzhIQ0VEYU0cd5VptqKqDAOQ62iMCR/376h5YrzvqOO3LEOzrtLFBIO4IY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(346002)(376002)(136003)(6916009)(16526019)(66476007)(52116002)(8936002)(186003)(86362001)(6486002)(36756003)(6666004)(316002)(83380400001)(2906002)(5660300002)(66556008)(26005)(8676002)(66946007)(2616005)(1076003)(6506007)(956004)(6512007)(9686003)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?69syH9t4gbHGH5Fdyb1/ylwrGoTT8SLNrp3H0S49xNX2oRzd0fDH01BF2n/+?=
 =?us-ascii?Q?O06GJJGb1dvjNJmZBvFDLU0fxaxX9L+nSRSQQqllZMEKNvMo3/8dxyij7PMX?=
 =?us-ascii?Q?0PqfPRVV2ct7uNO5EiwFKa+f/ay1LcINdOAD2kNrPGUn9yvksa2ZrurOqY9w?=
 =?us-ascii?Q?Tu+etj6c9xiOLvDqVU5Z6A2UXp3eyW4J+VAVPjOpBNC3WHYo+Lg8qKYqlT43?=
 =?us-ascii?Q?NDatKtIA33z7qi/fS0fZZ2+CvKSPNRA/q5kRTLcnc+dAcziKSp34Mew8Ebuh?=
 =?us-ascii?Q?Hy9A7es54+4KJzmZs8e9Z96ubqkySD6LY9uynKgTjUoJljrPc6RY7bLjVJew?=
 =?us-ascii?Q?Vr+auQOpli81z9pssVn8CzVyL3+bDtQ/xD3wQ4k21ZvA8iQHuX7dnjQt+tEW?=
 =?us-ascii?Q?sOx2yA5VDtUlJr8pz9j7ZXWfpuWNFkyjdSnR+TkV9MKhRtuF8JtyrevqCbDI?=
 =?us-ascii?Q?FJqAjlF7Cbkb+5fQABeIj6PQGypkrXLdsrta02Hq6h8/hMBX2j/z2hudX8mU?=
 =?us-ascii?Q?OsAnj1f/WoR8OIVZqg9kaVbm4RLJyDk7NVpcjL30mbHN8z0yecetgBL5mIsa?=
 =?us-ascii?Q?6u6LJnJjzIb5jIxDE+O1YJPY97cc5i1WtzwrsCUeXk9H9lZlLEdaZ/Hz48Ro?=
 =?us-ascii?Q?TLAkHFDqvAaSj3aNVug6EtyBIfytK/m7Y4cLm+chXWmLPaWBe0Sm+vZClrGd?=
 =?us-ascii?Q?YnD3ipN+5zJNhk7Uc1Fat6gWMQi0CFGJO/m/7O7GQcYJUH2hNKp7f2k7cOCy?=
 =?us-ascii?Q?NwAxNExgBkJn3gojYXoNz5AP76lIoUWagd5w93L3NQe2AeXArFw8VO8GdSvz?=
 =?us-ascii?Q?dOESyoOu0QpyIzacyhFJPquMB1Q8gYFNTlZEZWE0ROygAn1xek/tb7Ayn6Qj?=
 =?us-ascii?Q?U5RnRZFilPHMKFC69N5UQ2wlPzDIPbGLUhwF1K7FBHQufo91+wRWuW4Hs/p5?=
 =?us-ascii?Q?FqKIWe+so80sugzQ3b9Q5dd+57aBN3jdD/rn22J57aeHXu7G1Mt8eLL8vTcQ?=
 =?us-ascii?Q?+aRR7oKUzV1F7jIVDaShQkgQ/9vbC/9YbsuIec+LjEwdCtAB1b45ZO12WU2a?=
 =?us-ascii?Q?yLXiTXYZ3x+8uh5L4t31Jt38GQ4vfqUl9AGpU9YaXHOHZt1Gv+UnuQhaRSBi?=
 =?us-ascii?Q?9ggeJuD1o9Bg07l+tlNtCJO6/xdytmJWg9/VeNfga3TUz16+3nGZ7BveRbZI?=
 =?us-ascii?Q?XFlptZASv1nt/Qd2VvLA/InZvo+1AlhcXliylND0RKHGC0llKK3JJ9USVIy3?=
 =?us-ascii?Q?5HhFtNI3tWoyazFPn2PStxCsECgXWB4bObBP02PJVBM0MRY3mtRXBQoXH1LM?=
 =?us-ascii?Q?zGQC4tZwoLQ0H//F7ek5ShxR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02eb7102-bfff-482f-1aeb-08d8e50617fd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 03:22:41.0831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7hYcCeFRkKcwk9sIo0U2t35ygZtpRjbeTQaaAEQKu7XZlFL29KrGCSCOhIxFw4amXVX01k2I6Cc3SnEewsP0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3448
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

This bug can cause pthread_cond_destroy hang with process-shared
mutex. And it is since glibc-2.32, will be fixed in glibc-2.34.

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 ...-private-futex-optimization-BZ-27304.patch | 49 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.33.bb         |  3 ++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-=
futex-optimization-BZ-27304.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-o=
ptimization-BZ-27304.patch b/meta/recipes-core/glibc/glibc/0001-nptl-Remove=
-private-futex-optimization-BZ-27304.patch
new file mode 100644
index 0000000000..19f391cc84
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-optimiza=
tion-BZ-27304.patch
@@ -0,0 +1,49 @@
+From c4ad832276f4dadfa40904109b26a521468f66bc Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Thu, 4 Feb 2021 15:00:20 +0100
+Subject: [PATCH] nptl: Remove private futex optimization [BZ #27304]
+
+It is effectively used, unexcept for pthread_cond_destroy, where we do
+not want it; see bug 27304.  The internal locks do not support a
+process-shared mode.
+
+This fixes commit dc6cfdc934db9997c33728082d63552b9eee4563 ("nptl:
+Move pthread_cond_destroy implementation into libc").
+
+Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+
+Upstream-Status: Accepted [https://sourceware.org/bugzilla/show_bug.cgi?id=
=3D27304]
+Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
+---
+ sysdeps/nptl/lowlevellock-futex.h | 14 +-------------
+ 1 file changed, 1 insertion(+), 13 deletions(-)
+
+diff --git a/sysdeps/nptl/lowlevellock-futex.h b/sysdeps/nptl/lowlevellock=
-futex.h
+index ecb729da6b..ca96397a4a 100644
+--- a/sysdeps/nptl/lowlevellock-futex.h
++++ b/sysdeps/nptl/lowlevellock-futex.h
+@@ -50,20 +50,8 @@
+ #define LLL_SHARED	FUTEX_PRIVATE_FLAG
+=20
+ #ifndef __ASSEMBLER__
+-
+-# if IS_IN (libc) || IS_IN (rtld)
+-/* In libc.so or ld.so all futexes are private.  */
+-#  define __lll_private_flag(fl, private)			\
+-  ({								\
+-    /* Prevent warnings in callers of this macro.  */		\
+-    int __lll_private_flag_priv __attribute__ ((unused));	\
+-    __lll_private_flag_priv =3D (private);			\
+-    ((fl) | FUTEX_PRIVATE_FLAG);				\
+-  })
+-# else
+-#  define __lll_private_flag(fl, private) \
++# define __lll_private_flag(fl, private) \
+   (((fl) | FUTEX_PRIVATE_FLAG) ^ (private))
+-# endif
+=20
+ # define lll_futex_syscall(nargs, futexp, op, ...)                      \
+   ({                                                                    \
+--=20
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glib=
c/glibc_2.33.bb
index c47826a51e..6ba8cd9b71 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -45,6 +45,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=
=3Dglibc \
            file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch =
\
            file://0031-x86-Require-full-ISA-support-for-x86-64-level-marke=
r.patch \
            file://0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch =
\
+           file://0001-nptl-Remove-private-futex-optimization-BZ-27304.pat=
ch \
            "
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build-${TARGET_SYS}"
@@ -55,6 +56,8 @@ PACKAGES_DYNAMIC =3D ""
 BUILD_CPPFLAGS =3D "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS =3D "-I${STAGING_DIR_TARGET}${includedir}"
=20
+TARGET_CFLAGS +=3D " ${PROFILING_OPTIMIZATION} "
+
 GLIBC_BROKEN_LOCALES =3D ""
=20
 GLIBCPIE ??=3D ""
--=20
2.27.0

