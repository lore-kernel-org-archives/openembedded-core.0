Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.43])
 by mx.groups.io with SMTP id smtpd.web11.4329.1615524866196372655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 20:54:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pORXrCyE;
 spf=pass (domain: windriver.com, ip: 40.107.220.43, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRt+1VQ37mmm64XybYjTvH9srNJL9HQpR9JyHW3+4MnyshbK1y9YGU6ucEen85fxcFVOWAKZo84emQEiGPE0D/tJUBxJ97/KSvG6WZOl3jHkliIMKGmN/DBIQg3PCRH1U/wo4xmt4koWu3PtzXrfaMAKHUHhCy7lwbPw70EeYRNCKJJYocuOLX/Gfs29+84IOioqNp4kEiJxRNAMrs3Up/xc30HzzLCMXveroWoRxu9nuyZ8lM6J75iJnHudSOtHXc7gT3OVI+wlAcfs8UJ4tLu75N14bBEF9VWZYuIo3Jb9SdRdPA21fDhvBAOTnrKkA67oWfcJkmbEEzSO16QtdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHANtZCaZfqaQNYpdI/jKdK76NkTalk0CvB38X3mSYc=;
 b=ZzSttNpY3aKev7RH5TPW0P8zv+tjsEkSxWvkzThrC0KrOK0ule1P5wu2BBMQxq0eyj7jA7VoJfgU/EReTcrA3g/d5okmvjajla10gnDoXREcgG2x9wYqz/V4laanraA3/PsLdv8eZH4yjtpD3om3njqmnII2yqf/sNK/mzGwYiqBmVX2zWLl02QGPfGbkocsCQOrJKpCyOxVcIpHDSxsDukypgSjZP+7wTkfy62en0r4iAGjruKFlOExVr8jLMm5XBfYhIakkmxTCfYAptCFaBIRg9BZn2K6cbfuOS1VpaNg+4qNcK8Ujv4WAdCAB5VWiT2H8z2nU5Sephk/NQU2Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHANtZCaZfqaQNYpdI/jKdK76NkTalk0CvB38X3mSYc=;
 b=pORXrCyEZaqDoWUbAIfbbzopbqI1YNDocFFIY6yG01QNGVrXqOOdm7tLE8v69xabOr9Okx9bIabui+QRNW0dWTbFfqTP1QlElHe2hCdKjUomtlg32PK2/3/H/I14IB1gYWLkUttWq+Bbe5v06mA+EyfeLPrHXkguZWmERA9cURE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 12 Mar
 2021 04:54:23 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4%6]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 04:54:23 +0000
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: raj.khem@gmail.com
CC: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] glibc: fix pthread_cond_destroy hangs with process-shared mutex
Date: Fri, 12 Mar 2021 12:54:08 +0800
Message-ID: <20210312045408.567646-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0019.apcprd03.prod.outlook.com
 (2603:1096:203:c9::6) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HKAPR03CA0019.apcprd03.prod.outlook.com (2603:1096:203:c9::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.9 via Frontend Transport; Fri, 12 Mar 2021 04:54:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca234430-1225-40c3-efaa-08d8e512e778
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB484508B7478BB6BD87EB6E05E46F9@SJ0PR11MB4845.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:234;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7KtSo4ns2a75qeL89dxcz3Ril389ZQAlypUnhPjuPGFvEo41HBAWrBOA6FmM4TQdzahU6AannLMs7emBHXZKahJ1Em0i/8LLdP/HyA2oAr6gw8LsxCZW8nRzPtJyiraHbuR6i2DE/Zh0acn+/+NA3YIM+QzS1eZi1YvkVhCM23zU/nSiRs8nf4McIdJwcxL3050tN69Hjgj+QsCltyhOSN/oHKPkxuWxh8BMjak7o/zLAUJ+U8q+6ngit4Z2cbM2pI70FaI2k/TfpFApv6zlbkoeYsn6AFhmVrD+8PUuDluDgZ8IM5X1yn4eY4czS7uJyiclPRssoUoTnJc9Rc6IByyBXkDNGCorcVcVkcKInbMWkDLcF4Ijps2uulzkB0w9McotIMoCd09EIe3lq9e52q+K9jwpZbhUYjC/jvjq0yF5Sh0w732MKAio/zQ3lfi79we7Hu2/A/xyFwoj8Jdi2MVrzl+y5rOUlvQdO7l63yzKgNBvXBfgphRlRZHDGhzw5dPuIdL5RUhehtLy+2AeXTDOlD4yMENc+c0xlHJS5TO57YyRIAtK/37nRQVi0O/RGhPtpS0SOGhLNKviXAynurX4yHRiuzkX7+5NxJPTAqw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(366004)(396003)(136003)(83380400001)(2906002)(6512007)(6666004)(478600001)(16526019)(9686003)(52116002)(186003)(316002)(6506007)(4326008)(36756003)(8676002)(5660300002)(26005)(6486002)(66946007)(86362001)(1076003)(6916009)(956004)(2616005)(66556008)(66476007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?fjNgoqXyJbudqJBqrqmxYnKSpjmRsBBbDf6E8oXnIBGlYMzgpVUaL/GcYTpf?=
 =?us-ascii?Q?1dRx4Lqsa+kvie0Aku2DaUnqTiyQ5hAJ1DY6oXaRh75vXrFypTasNNk007q8?=
 =?us-ascii?Q?Mg9V30Z/AgvBawWFfc7sjquJSZgF11m4MOwvKXhSsg3akQAEvoW4GO0r66jN?=
 =?us-ascii?Q?fyJWi6vd51vha1DZ+mL3i2u+l+3+moGBJWkZFhC5cuVkpZM5CG7DRBvmvJIG?=
 =?us-ascii?Q?4j2AlhnGFQ6IWfpRSCfVBkoyrEr+tdgFtw9wBTRDTjmyuYDsh+nesPyHdXXr?=
 =?us-ascii?Q?7gDldUq3m1qrDvc6r+RCTF9XrVRn03O4byXtCxXj6/w1/YVUWAc/HPBQc4TP?=
 =?us-ascii?Q?yblSsYD/C9eFAN9KXbVW5PEeurJD1zYDSP9EwiONFjThXXnXBkbyavS+xbE+?=
 =?us-ascii?Q?tzB3h8w47AU4U3Ezg4bTnP5ZlZWbC+zjWjToSTOnNh+XjXWQk3wr4fsCsdUJ?=
 =?us-ascii?Q?YZDgUXzu/1CihGXwWVYEAi1uX8T/Pm8waJ0NUiGyh1EevPpxAUOi0tKLVO2S?=
 =?us-ascii?Q?sVnPK5r0guxyy8E4ecABRNkhF0lavZzwNYyevq2/ZFETtuuDdjIknd3sLrOz?=
 =?us-ascii?Q?geQo1N4WpeKa2bZYGemHEkdOsqgoSAHLiQf+Svjr5dRZNmHNsJWnVTFU5Itu?=
 =?us-ascii?Q?pVuhIs7x4kDV61pIuugJxrvYeug49T58xwyONkW+IVe0Bh5S2Mdu/aEV1ky7?=
 =?us-ascii?Q?NNVlnnRc9AyWgCkGxP139XyGEgZGjKbT7xfz0pYqVC9K8UcAivKLFfDxL+zj?=
 =?us-ascii?Q?lV72d4yaSnFC+sJRTW34ilz5TuuZgKu5Uf2ScVrbFR/cExQ1YRYmN5K9ueYF?=
 =?us-ascii?Q?iuHJXFvNgYWhyeNbT5oMZtSKqDVRXAh433D4wnWLMgmo2owc+ZLaChXuUOOB?=
 =?us-ascii?Q?XMJFFmqDMVDwA78ty54FvWBz1CMTa3xvszdxyTMn6ZNY4IQZVUVccy4c4/lV?=
 =?us-ascii?Q?TsiV/9y5Dx7c9jMRL/ds+qW6zDHf5lU/2xMzAr1MPtryD2bYqyGoDK2twtZ1?=
 =?us-ascii?Q?ZrP4epuvMUbe+hhCtDxkaGuJDXzNBMuXLIrmdvp8nKYmeAoS5yaW5/URCBiU?=
 =?us-ascii?Q?DrxaI9ctDhFayLxOooNg2lJFX1VF/OwNDjM5qXF/cEUlxzuGCbQQcyQ202s0?=
 =?us-ascii?Q?kU/nV7Q6XRKGHT643FtfYP78R/pxKp3mUp7mT5xOr6bhnOnjllREp//j6oVu?=
 =?us-ascii?Q?wc+wrfL4FCxIyFv1DYi/Pdhm9I/JdHEBzVckfg8bSmzbUH6YBeRI/6m5ZuGY?=
 =?us-ascii?Q?i/fjPIHZrEI1jOxdbEO6Qup4rIIGszQrHGTIeiilVpcdPq9OyvSq4tJfHaUv?=
 =?us-ascii?Q?+SRMjdeogJSBrhm3LC/PXsp2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca234430-1225-40c3-efaa-08d8e512e778
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 04:54:23.4636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ad7OY96QJVxLQn2Nhd2UBB8qAXdeoQDcpDlEKyY2TiSprDvMhOTzy8e3fRxBqfTJ6DnjaTTlBX98oe5UBPR6GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4845
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

This bug can cause pthread_cond_destroy hang with process-shared
mutex. And it is since glibc-2.32, will be fixed in glibc-2.34.

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 v2:
 1. remove an unused debug adding in glibc_2.33.bb
 2. correct the patch status from accepted to backport.

 ...-private-futex-optimization-BZ-27304.patch | 49 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.33.bb         |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-=
futex-optimization-BZ-27304.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-o=
ptimization-BZ-27304.patch b/meta/recipes-core/glibc/glibc/0001-nptl-Remove=
-private-futex-optimization-BZ-27304.patch
new file mode 100644
index 0000000000..39fde5b785
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
+Upstream-Status: Backport [https://sourceware.org/bugzilla/show_bug.cgi?id=
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
index c47826a51e..9feb6615ed 100644
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
--=20
2.27.0

