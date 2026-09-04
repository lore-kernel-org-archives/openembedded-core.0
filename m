Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5306DC61DD3
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 05:53:14 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7735.1788501187660396052
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 22:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=dadmMFYk;
 spf=pass (domain: est.tech, ip: 52.101.83.2, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tC0WzYJ5yaQ8ci+R01DyPGSCNqMZWI2cgazUjTO74c32VMPCHtsMduNQqtsPGGxifNaIqd1QuGSD8GNUsWzAgcJuM1cyXr1xoUwyX7s48b7tIzw6bTsHNkjQCmTNfLjOicN5IfqCM0HVhU+2KxEhpXa1Gbqqv1uIc37tRMwSoPfa52Iwsu2sbUTafnHozBS+m93MV0roenp1f3ls2GcHTSm3pbBtmkLbHooyeWlPvbCWS+LhkRaatX1xK2iAt9+h+wnP3wNwmACc1u9htjgqYp17knDGQfMr0fUHD4hwKI+bERu8ycy4FzDhKnSBwfBE04rUm2MvTMYk+iuV6CaB4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IA7hejW9AnYUMGrk5LfhDxmuiOxjhrwPGJSE95G4OF4=;
 b=R66tXvW2Qbx3gCOb2kBWvWxt21raowNgWsboP6v3Fk85kBRojLkJe+uN1KGQBah4lD2jwboHfvgVxfFDz/o+pFFsWJNFM6XvFKh2gCaOsJ2pfiycB6OH8c+Zpkh/wackkvjOYL43x1d3pGhQvi8TTUCFW5kl9qQAgYq6DNB9rPK4hwA+y67ws4uwwGqZ3N5LBNdUMWp1r54IWnHZ9VRyVtzvRLOI1nS7RG5nlyu0R7CmV6cDoG9XSCwRRd3sHlqi8D6SleMLgNbimnzK4G4EtpgNFcVf3zWW6HJ01RBm2E5/ubovikAqidRiOOdg7kcNE5TkMh5EOprFmm7x91jJ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IA7hejW9AnYUMGrk5LfhDxmuiOxjhrwPGJSE95G4OF4=;
 b=dadmMFYknyHK3aWl4g8VA0/udVk5EX5Uw0KM1onQ8osSevxmupnp+Iau/aHFFRy4rrxb5CgaeXVm452/m2xalci4WI88Na72mEeYOdJH219GQKg0MFiAqXLOSmLrdDsGq3IFoCre8UmbrGIHfv5eEnLniogCpSmp3z4YQan52VFEi/Mg0ZVzAOhQwTrRr1pPJY3LQhSqFQ3BfZtBZTZa7vKT0a8d8M5ZQ1wn7xGVNMi38YXcl/WUwUfeEl3EwqmkatDGNtdNMXCALl1lSHVvZCLa50OSYATDpdZtMbvF2szuI6r6L6RmBJ2fYiCiHdLucd9M0uAZk7szJYAQnh+MMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7PPFABCC8967D.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::6a1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 05:53:02 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 05:53:02 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] util-linux: upgrade 2.42.2 -> 2.42.3
Date: Fri,  4 Sep 2026 07:53:00 +0200
Message-ID: <20260904055300.53907-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0303.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::27) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7PPFABCC8967D:EE_
X-MS-Office365-Filtering-Correlation-Id: 21bd2ce3-a6dc-462e-8bf0-08df0a48c7ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|23010399003|376014|366016|11063799006|3023799007|10067099003|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	isyR2DLO1NfdWksz7q9l+pG5uSUnkOaDs/btxvs4zX4z3wJJ/Bz4hBpkzd0BrD96sSRLpu1mJOEoJhHHr4s8tys7hbLzGgqXYkK/l1AGYKy0pU19K2+V18Eu56GQWlu6w7pI+2okA4aNagaLhjdBDAc5u95cXmxWqyKcMJtLOd0pLzbGeXwWb/DBCZ1oiYOrxzLRq1nRpisBFuhkvS49R01G3mntOlXGsT2OEso1lKv2DaC8w90evVvbGjdB27lrCwUlJVx9r3eFo36GR8CFYPw+5LhAGr4bnehDkE/ObJMtWnqqVuJRfGRTZSSump4u0W9KGpU1BXCIsz7I1W7Lp6TJ3dUmmGRJzfJ64wDCZRl8QBF6YMLagzp3bArN4d5yIr8FJtbqeN3zZokIBuoLIK0jzoaJapGomTsPqTtEzKCIGluOIwC3MEtUrlwV7Ts4UjGM/tE9Z4QL9wipsONMRRe/zJYIqaWal+BjlVUzlUZWN9PdiFDg0BmFlUI1tQkZVTXdMKtV6teMqTpN2JfxVQObOT4gYRO7ZDFZCIe438nbTTuqA2vkLLIV/G6HdwQgpyRmXWBiUM5moqmRqsVJizr9uR7Vmv/vKKZ0UUbus7U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(23010399003)(376014)(366016)(11063799006)(3023799007)(10067099003)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MGWk3fZdpVjiqKEwDD0vw3kK5VME2RKkmoI1d3lKdQPRoVL4SRZPUL2JVdr+?=
 =?us-ascii?Q?YiqTkgWgqzz3PK2gP5veGfpoI6E03Yba8pMbKS0HR4bK4AsuerP3dOD0S0xE?=
 =?us-ascii?Q?ykCN5SwWO3vlLoQOyw6REDej2fTNfo2fbGTBXWYAaKvZ+Szn+tSKIqnGNYto?=
 =?us-ascii?Q?/SNp+4s/hVgZAm6fQhg1ZRO644F5Xstt4R7Hy7N4rSiPK0utyk52oC9kpCep?=
 =?us-ascii?Q?HW94qK2wPE9sNespZQLwVyyD+iqfQ+OLsstjIiMRAoBiULF6QQlqXTg0q6ng?=
 =?us-ascii?Q?JsL9yhpUBNgeSHOvkkMIsfFQ8xli0FPD2NeBdZC9Ij9q/0PELsUoNoxxuOVQ?=
 =?us-ascii?Q?0Y05mhEHOfSPHTl/En2dajpvII0YEoso3SxMryq4uXEoUEzn+0M0cvGrYi17?=
 =?us-ascii?Q?FXVCFl+uWsrd2PFkWQ1NcOoEBPNZaCKSDKPfpkq9pLlCCDrGrAzf7WLQJi9a?=
 =?us-ascii?Q?O1J+SCMROhXhh/sS/RawWBe8PfOy0duZfjjD/SGI64+rGTC5VfdGX8XuyzI0?=
 =?us-ascii?Q?9VXdCEM8yf3TjFATSLIUxODak2GGyl7GCAr4HaFx3+6jmq5TNr0v3vojBfds?=
 =?us-ascii?Q?ayICUdmF1hivvtjYS2qX7YENID7NgO30zSMzZ41WbTsqZwNRz/wfwrLmk1Xt?=
 =?us-ascii?Q?Gr1KH2ioeZ0AaTZDOAoGgCOabN1BPaiJgqmfqtx5mbcW+3nXhYtbIzYP6P3S?=
 =?us-ascii?Q?Zwce46Y6dWjvPzB573JFwmKUG2KHyCnyKffedNlN+ZoOalyASv3weWoM7uid?=
 =?us-ascii?Q?0HG3GpCJdhkXbD/s3RiHUnAY4S/m526OKi2HL3Cifp/cj8tVtc/RagNT4j6w?=
 =?us-ascii?Q?r1FgmA1Pk/k8EWnqthbdt/dQJX09aQotjP7URBXOopawleTRQYnI14xxQCQV?=
 =?us-ascii?Q?CbB5aO615OwzqVqYMypbv5rEZxnbbEKZoau09KRqrUGNmAJxbpPhOOrwflqn?=
 =?us-ascii?Q?sF540ZzVb6duoq9V2V0br3/+hxRetd/AF+gwYC52GUxaLe/iP/lonzza6nj9?=
 =?us-ascii?Q?vN/hZkT0IB2zH2jHjLjvTHRTd7IrNXQebiFu/WOxnMULXy0x6ypef3f5oDx3?=
 =?us-ascii?Q?UaUHsIEhE7zSEL0elodrvFehNmW2V5kd+uoL2/Nj9Zx7lcVQVdgAL4CKckXi?=
 =?us-ascii?Q?XfP6wXYHrYIeujNc+O9LAaH9dt6YwwZ/g/AD4tCCzvU3kOEDEkcSvWMUQ6iL?=
 =?us-ascii?Q?1z7j8aG1m7DNdI45+nqopXUvvhv7L8JTglnSLxbGRrdZF8kb900089SCGzhD?=
 =?us-ascii?Q?2jYLiyeeqvWzudbKGlZhavaVOLHB+jFTcfsIWMa5uRl6v2DzoCGhHPvKQZCE?=
 =?us-ascii?Q?rRCUFsAs7Bc6ldQ/ThUEZuYpTON7nCWsKfnqgiqHYPS1Wbh67J0esZbMXWi8?=
 =?us-ascii?Q?99eNUa9oCRfYKtb9E7rYNEq8SFpmfgNwpsFnLUVWQCSq5CU/2RVDN2fEGodf?=
 =?us-ascii?Q?GeKxtt78Roe6pEqDcHCZm+gX7J6YSxMTynY3pMllDCGcC9namGCP20igoExA?=
 =?us-ascii?Q?Ar0dvzcOGZMvXOcA30DKdeXu56H5tTk3iBoH4qk//msT2W+IStBp2W89wcqp?=
 =?us-ascii?Q?CKIbiVV8BlWB9oKeS0GtwGLJX5lgcb5c8mDKpwc6oWVWKmKZ8w8hknpUWuAx?=
 =?us-ascii?Q?sxjMVC3RRWcwZL9qhXdBx+7QColzz+dMS/Li0j1dRdBUkg8qzr318plLbaSR?=
 =?us-ascii?Q?wJe1ta4zDew8VCk+D+ACgMO3Lxexjl1ilkFr+ad0euRVSwt2NEf6+A+N7MIq?=
 =?us-ascii?Q?f7fxGEb1dxAiYS4lTqNb8hA1fT+/nhRXxn05mvIo1xGOu9TDNqv0OGKvxknU?=
X-MS-Exchange-AntiSpam-MessageData-1: 9rPN6bv+O+IpdZFnkraAv1PKrSgzmbMftLA=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 21bd2ce3-a6dc-462e-8bf0-08df0a48c7ff
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 05:53:02.1456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCoLify+xj8uctJ8++jRM3/m0gSES6bIGfs7fnQgZlOZ9UXeRvFFAjOXCCPJcBeVUNK27EI3P+jiOI5UXvnaRj7LUC1GescYMW8VXuzxU8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFABCC8967D
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 05:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245061

- util-linux-libuuid: upgrade 2.42.2 -> 2.42.3

- ReleaseNotes: https://github.com/util-linux/util-linux/blob/v2.42.3/Docum=
entation/releases/v2.42.3-ReleaseNotes

- Security fixes:

  CVE-2026-76642 - mount(8) post-mount hooks execute after helper failure.
    When an external mount.<type> helper exits nonzero, post-mount hooks
    (X-mount.idmap, X-mount.owner/group/mode) still execute as if the
    mount had succeeded, allowing privileged operations on the
    pre-existing target filesystem.

  CVE-2026-78410 - mount(8) TOCTOU race on source path.
    In restricted (SUID, non-root) mode, the source path is
    canonicalized with realpath() as euid=3D0, following symlinks through
    user-writable directories.  Additionally, open_tree() follows
    symlinks in intermediate path components.  A local attacker can
    redirect a privileged mount or post-mount ownership change to an
    arbitrary path.

  CVE-2026-78409 - mount(8) X-mount.subdir symlink escape.
    The open_tree() call used to open a subdirectory on a detached mount
    follows symlinks in intermediate path components, allowing escape
    from the detached tree.

  CVE-2026-78408 - nsenter(1), unshare(1) file descriptor leak.
    File descriptors in nsenter and unshare were not created with
    O_CLOEXEC, potentially leaking them across exec.  Added O_CLOEXEC
    as defense in depth.

  wall(1), write(1) - hostname escape sequence injection.
    The CVE-2024-28085 fix sanitized only message bodies; the banner
    headers still interpolated the system hostname without sanitization.
    An unprivileged user can inject terminal escape sequences via a user
    namespace hostname.
    Additional fix for CVE-2024-28085.
    Reported-by: Skyler Ferrante

- Additional changes:

  - Refresh existning patches context
  - The 2.42.3 release ships the CVE-2026-78410 fix, but that fix introduce=
d
    a build regression.
      hook_idmap.c:335:33: error: 'RESOLVE_NO_SYMLINKS' undeclared
  - Master branch have fixes for this and added those patches along with
    relevent other patches

        0001 7e2e010  libmount: add missing fileutils.h include to hook_idm=
ap.c
                      fixes the RESOLVE_NO_SYMLINKS error above
        0002 a471b62  lib/fileutils: fix unused parameter warnings without
                      SYS_openat2 (avoids -Werror failure on older kernels)
        0003 b38324a  mount: fix grammar and typo in X-mount.idmap docs
                      doc-only, needed so 0004 applies to the same lines
        0004 e06799a  libmount: use USE_LIBMOUNT_MOUNTFD_SUPPORT for idmap =
hook
                      fixes implicit mnt_open_tree() in the native build
                      (--disable-libmount-mountfd-support)
        0005 b815940  tools: add non-newmount.conf config-gen profile
                      completes upstream PR #4600

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...2.42.2.bb =3D> util-linux-libuuid_2.42.3.bb} |   0
 meta/recipes-core/util-linux/util-linux.inc   |   7 +-
 ...ing-fileutils.h-include-to-hook_idma.patch |  36 ++++++
 ...ests-script-Disable-size-option-test.patch |   2 +-
 ...x-unused-parameter-warnings-without-.patch |  66 +++++++++++
 ...r-and-typo-in-X-mount.idmap-document.patch |  48 ++++++++
 ...LIBMOUNT_MOUNTFD_SUPPORT-for-idmap-h.patch | 112 ++++++++++++++++++
 ...non-newmount.conf-config-gen-profile.patch |  26 ++++
 .../util-linux/avoid_parallel_tests.patch     |   4 +-
 .../util-linux/configure-sbindir.patch        |   4 +-
 .../display_testname_for_subtest.patch        |   2 +-
 .../util-linux/util-linux/ptest.patch         |   2 +-
 ...l-linux_2.42.2.bb =3D> util-linux_2.42.3.bb} |   0
 13 files changed, 301 insertions(+), 8 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.42.2.bb =3D> uti=
l-linux-libuuid_2.42.3.bb} (100%)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-libmount-a=
dd-missing-fileutils.h-include-to-hook_idma.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0002-lib-fileut=
ils-fix-unused-parameter-warnings-without-.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0003-mount-fix-=
grammar-and-typo-in-X-mount.idmap-document.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0004-libmount-u=
se-USE_LIBMOUNT_MOUNTFD_SUPPORT-for-idmap-h.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0005-tools-add-=
non-newmount.conf-config-gen-profile.patch
 rename meta/recipes-core/util-linux/{util-linux_2.42.2.bb =3D> util-linux_=
2.42.3.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb b/me=
ta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.42.2.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc
index ee9291fb4f..20b0c37e8c 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -17,9 +17,14 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux/=
v${MAJOR_VERSION}/util-lin
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            file://0001-tests-script-Disable-size-option-test.patch \
+           file://0001-libmount-add-missing-fileutils.h-include-to-hook_id=
ma.patch \
+           file://0002-lib-fileutils-fix-unused-parameter-warnings-without=
-.patch \
+           file://0003-mount-fix-grammar-and-typo-in-X-mount.idmap-documen=
t.patch \
+           file://0004-libmount-use-USE_LIBMOUNT_MOUNTFD_SUPPORT-for-idmap=
-h.patch \
+           file://0005-tools-add-non-newmount.conf-config-gen-profile.patc=
h \
            "
=20
-SRC_URI[sha256sum] =3D "03a05d3adf9602ef128f2da05b84b3205ce60c351e5737c037=
0f74000679ce8a"
+SRC_URI[sha256sum] =3D "66ac7c0e725278eb2b039e3104f2c91119341d941b41bac7a2=
85c695f940bd57"
=20
 CVE_PRODUCT =3D "util-linux"
=20
diff --git a/meta/recipes-core/util-linux/util-linux/0001-libmount-add-miss=
ing-fileutils.h-include-to-hook_idma.patch b/meta/recipes-core/util-linux/u=
til-linux/0001-libmount-add-missing-fileutils.h-include-to-hook_idma.patch
new file mode 100644
index 0000000000..cb20c60c9d
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-libmount-add-missing-fil=
eutils.h-include-to-hook_idma.patch
@@ -0,0 +1,36 @@
+From 92369ef3fe1bcc48548441b68fb17786500c2bc3 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 2 Sep 2026 13:32:27 +0200
+Subject: [PATCH] libmount: add missing fileutils.h include to hook_idmap.c
+
+The hook_idmap.c uses RESOLVE_NO_SYMLINKS (added by commit fb8e26535)
+but does not include fileutils.h, which provides the fallback #define
+for this constant.
+
+On Fedora (glibc 2.40+), this is masked because glibc's
+<bits/fcntl-linux.h> transitively includes <linux/openat2.h>, which
+defines RESOLVE_NO_SYMLINKS. On Ubuntu (and other distros with older
+glibc), <fcntl.h> does not pull in openat2.h, so the build fails:
+
+  hook_idmap.c:335:33: error: 'RESOLVE_NO_SYMLINKS' undeclared
+
+Fixes: fb8e26535 ("libmount: pin source path with openat2() for restricted=
 users")
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit=
/7e2e010874b10b3aabdc3c4c844c9ffc46a4a374]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ libmount/src/hook_idmap.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libmount/src/hook_idmap.c b/libmount/src/hook_idmap.c
+index 77494e2..2c697b1 100644
+--- a/libmount/src/hook_idmap.c
++++ b/libmount/src/hook_idmap.c
+@@ -23,6 +23,7 @@
+=20
+ #include "strutils.h"
+ #include "all-io.h"
++#include "fileutils.h"
+ #include "namespace.h"
+=20
+ #include "mountP.h"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-script-Disa=
ble-size-option-test.patch b/meta/recipes-core/util-linux/util-linux/0001-t=
ests-script-Disable-size-option-test.patch
index 924c8c6827..a70d038cee 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-tests-script-Disable-siz=
e-option-test.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-tests-script-Disable-siz=
e-option-test.patch
@@ -1,4 +1,4 @@
-From 078231e4ecb5fa12107cd463f42e4c63ef3ff15c Mon Sep 17 00:00:00 2001
+From c83f9dbfd7d9b96e4969ab16d5db69e064c67c50 Mon Sep 17 00:00:00 2001
 From: Paul Barker <paul@pbarker.dev>
 Date: Mon, 5 Jan 2026 09:56:41 +0000
 Subject: [PATCH] tests: script: Disable size option test
diff --git a/meta/recipes-core/util-linux/util-linux/0002-lib-fileutils-fix=
-unused-parameter-warnings-without-.patch b/meta/recipes-core/util-linux/ut=
il-linux/0002-lib-fileutils-fix-unused-parameter-warnings-without-.patch
new file mode 100644
index 0000000000..ff6577e7e8
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0002-lib-fileutils-fix-unused=
-parameter-warnings-without-.patch
@@ -0,0 +1,66 @@
+From 95eb4a92ab0bd10e890783b8bc0794b2fb1cf438 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 3 Sep 2026 09:45:29 +0200
+Subject: [PATCH] lib/fileutils: fix unused parameter warnings without
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+ SYS_openat2
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+On systems without SYS_openat2 (older kernels), ul_openat_resolve()
+is a stub that returns -ENOSYS, making all parameters unused. With
+-Werror=3Dunused-parameter this breaks the build.
+
+Move the #ifdef around the whole function so each branch has its own
+declaration =E2=80=94 the SYS_openat2 branch uses all parameters normally,
+the fallback branch marks them __unused__.
+
+Fixes: fb8e26535 ("libmount: pin source path with openat2() for restricted=
 users")
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit=
/a471b62e732a491f1abe42450352fb0f9b5b43ea]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ lib/fileutils.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/lib/fileutils.c b/lib/fileutils.c
+index 89f1e21..80b69ee 100644
+--- a/lib/fileutils.c
++++ b/lib/fileutils.c
+@@ -440,10 +440,10 @@ char *ul_basename(char *path)
+ 	return p;
+ }
+=20
++#if defined(SYS_openat2)
+ int ul_openat_resolve(int dirfd, const char *path, int flags,
+ 		      mode_t mode, unsigned long long resolve)
+ {
+-#if defined(SYS_openat2)
+ 	struct open_how how =3D {
+ 		.flags =3D (__u64) flags,
+ 		.mode =3D (__u64) mode,
+@@ -451,11 +451,19 @@ int ul_openat_resolve(int dirfd, const char *path, i=
nt flags,
+ 	};
+=20
+ 	return syscall(SYS_openat2, dirfd, path, &how, sizeof(how));
++}
+ #else
++int ul_openat_resolve(
++		int dirfd __attribute__((__unused__)),
++		const char *path __attribute__((__unused__)),
++		int flags __attribute__((__unused__)),
++		mode_t mode __attribute__((__unused__)),
++		unsigned long long resolve __attribute__((__unused__)))
++{
+ 	errno =3D ENOSYS;
+ 	return -1;
+-#endif
+ }
++#endif
+=20
+ int ul_open_no_symlinks(const char *path, int flags, mode_t mode)
+ {
diff --git a/meta/recipes-core/util-linux/util-linux/0003-mount-fix-grammar=
-and-typo-in-X-mount.idmap-document.patch b/meta/recipes-core/util-linux/ut=
il-linux/0003-mount-fix-grammar-and-typo-in-X-mount.idmap-document.patch
new file mode 100644
index 0000000000..db4fca57b6
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0003-mount-fix-grammar-and-ty=
po-in-X-mount.idmap-document.patch
@@ -0,0 +1,48 @@
+From 410c4db19325ed9b1aa7aacbc34f657de9f906d3 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 8 Jul 2026 14:03:43 +0200
+Subject: [PATCH] mount: fix grammar and typo in X-mount.idmap documentatio=
n
+
+Apply grammar improvements from PR #4400 (field order change
+intentionally omitted as the current order matches the code).
+Also fix a GUID -> GID typo in the example.
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit=
/b38324a9a4020123e8972079de51a2aed7e44c69]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ sys-utils/mount.8.adoc | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/sys-utils/mount.8.adoc b/sys-utils/mount.8.adoc
+index 8a6e09f..71daf92 100644
+--- a/sys-utils/mount.8.adoc
++++ b/sys-utils/mount.8.adoc
+@@ -826,8 +826,8 @@ Set _mountpoint_'s mode after mounting.
+=20
+ *X-mount.idmap*=3D__id-type__:__id-mount__:__id-host__:__id-range__ [__id=
-type__:__id-mount__:__id-host__:__id-range__], *X-mount.idmap*=3D__file__:=
:
+ Use this option to create an idmapped mount.
+-An idmapped mount allows to change ownership of all files located under a=
 mount according to the ID-mapping associated with a user namespace.
+-The ownership change is tied to the lifetime and localized to the relevan=
t mount.
++An idmapped mount allows the ownership of all files located under a mount=
 to be changed according to the ID-mapping associated with a user namespace=
.
++The ownership change is tied to the lifetime of, and localized to, the re=
levant mount.
+ The relevant ID-mapping can be specified in two ways:
+ +
+ * A user can specify the ID-mapping directly.
+@@ -842,13 +842,13 @@ It is possible to specify multiple ID-mappings.
+ The individual ID mappings must be separated by spaces. Please note that =
in the __/etc/fstab__ file, spaces are interpreted as separators between fi=
elds. To avoid this, you must escape them using \040. For example, X-mount.=
idmap=3D0:0:1\040500:1000:1.
+ +
+ For example, the ID-mapping *X-mount.idmap=3Du:1000:0:1 g:1001:1:2 5000:1=
000:2* creates an idmapped mount where
+-UID 0 is mapped to UID 1000, GID 1 is mapped to GUID 1001, GID 2 is mappe=
d to GID 1002, UID and GID 1000 are mapped to 5000, and UID and GID 1001 ar=
e mapped to 5001 in the mount.
++UID 0 is mapped to UID 1000, GID 1 is mapped to GID 1001, GID 2 is mapped=
 to GID 1002, UID and GID 1000 are mapped to 5000, and UID and GID 1001 are=
 mapped to 5001 in the mount.
+ +
+-When an ID-mapping is specified directly a new user namespace will be all=
ocated with the requested ID-mapping.
++When an ID-mapping is specified directly, a new user namespace will be al=
located with the requested ID-mapping.
+ The newly created user namespace will be attached to the mount.
+ * A user can specify a user namespace file.
+ +
+-The user namespace will then be attached to the mount and the ID-mapping =
of the user namespace will become the ID-mapping of the mount.
++The user namespace will then be attached to the mount, and the ID-mapping=
 of the user namespace will become the ID-mapping of the mount.
+ +
+ For example, *X-mount.idmap=3D/proc/PID/ns/user* will attach the user nam=
espace of the process PID to the mount.
+=20
diff --git a/meta/recipes-core/util-linux/util-linux/0004-libmount-use-USE_=
LIBMOUNT_MOUNTFD_SUPPORT-for-idmap-h.patch b/meta/recipes-core/util-linux/u=
til-linux/0004-libmount-use-USE_LIBMOUNT_MOUNTFD_SUPPORT-for-idmap-h.patch
new file mode 100644
index 0000000000..623783b35c
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0004-libmount-use-USE_LIBMOUN=
T_MOUNTFD_SUPPORT-for-idmap-h.patch
@@ -0,0 +1,112 @@
+From cd5780da58af24a07b033da1ebbb53005fb14fc8 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 3 Sep 2026 10:01:29 +0200
+Subject: [PATCH] libmount: use USE_LIBMOUNT_MOUNTFD_SUPPORT for idmap hook
+
+The idmap hookset was originally guarded by HAVE_MOUNTFD_API (kernel
+headers have the new mount syscalls) rather than
+USE_LIBMOUNT_MOUNTFD_SUPPORT (libmount is built with mountfd support).
+
+This was intentional (commit 9040c0900, 2022) -- the idea was to keep
+idmap working even with --disable-libmount-mountfd-support by calling
+the raw open_tree() syscall directly, while using an inner #ifdef
+USE_LIBMOUNT_MOUNTFD_SUPPORT to optionally reuse the sysapi fd_tree.
+
+This fine-grained approach broke when the CVE-2026-78410 fix replaced
+the raw open_tree() call with mnt_open_tree(), which is only available
+under USE_LIBMOUNT_MOUNTFD_SUPPORT. The build fails with
+--disable-libmount-mountfd-support because mnt_open_tree() is
+undeclared.
+
+Rather than maintaining two code paths for a feature that fundamentally
+depends on the new mount API, gate the entire idmap hookset on
+USE_LIBMOUNT_MOUNTFD_SUPPORT -- consistent with how hookset_mount is
+guarded. Remove the now-redundant inner #ifdef.
+
+Also add a note to mount.8 that X-mount.idmap requires the new
+fd-based mount API.
+
+Addresses: https://github.com/util-linux/util-linux/issues/4598
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit=
/e06799ac325a881a297d2ffd6fe568cacdcd00ab]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ libmount/src/hook_idmap.c | 6 ++----
+ libmount/src/hooks.c      | 2 +-
+ libmount/src/version.c    | 2 +-
+ sys-utils/mount.8.adoc    | 1 +
+ 4 files changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/libmount/src/hook_idmap.c b/libmount/src/hook_idmap.c
+index 2c697b1..b1477ac 100644
+--- a/libmount/src/hook_idmap.c
++++ b/libmount/src/hook_idmap.c
+@@ -32,7 +32,7 @@
+ # include <linux/nsfs.h>
+ #endif
+=20
+-#if defined(HAVE_MOUNTFD_API) && defined(HAVE_LINUX_MOUNT_H)
++#ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
+=20
+ typedef enum idmap_type_t {
+ 	ID_TYPE_UID,	/* uidmap entry */
+@@ -317,7 +317,6 @@ static int hook_mount_post(
+ 	 * Once a mount has been attached to the filesystem it can't be
+ 	 * idmapped anymore. So create a new detached mount.
+ 	 */
+-#ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
+ 	{
+ 		struct libmnt_sysapi *api =3D mnt_context_get_sysapi(cxt);
+=20
+@@ -327,7 +326,6 @@ static int hook_mount_post(
+ 			DBG(HOOK, ul_debugobj(hs, " reuse tree FD"));
+ 		}
+ 	}
+-#endif
+ 	if (fd_tree < 0)
+ 		fd_tree =3D mnt_open_tree(AT_FDCWD, target,
+ 			    OPEN_TREE_CLONE | OPEN_TREE_CLOEXEC |
+@@ -544,4 +542,4 @@ const struct libmnt_hookset hookset_idmap =3D
+ 	.deinit =3D hookset_deinit
+ };
+=20
+-#endif /* HAVE_MOUNTFD_API && HAVE_LINUX_MOUNT_H */
++#endif /* USE_LIBMOUNT_MOUNTFD_SUPPORT */
+diff --git a/libmount/src/hooks.c b/libmount/src/hooks.c
+index 23eca4e..5ae91ed 100644
+--- a/libmount/src/hooks.c
++++ b/libmount/src/hooks.c
+@@ -45,7 +45,7 @@ static const struct libmnt_hookset *const hooksets[] =3D
+ 	&hookset_mount,
+ #endif
+ 	&hookset_mount_legacy,
+-#if defined(HAVE_MOUNTFD_API) && defined(HAVE_LINUX_MOUNT_H)
++#ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
+ 	&hookset_idmap,
+ #endif
+ 	&hookset_owner
+diff --git a/libmount/src/version.c b/libmount/src/version.c
+index 5ec0d49..30cb340 100644
+--- a/libmount/src/version.c
++++ b/libmount/src/version.c
+@@ -37,7 +37,7 @@ static const char *lib_features[] =3D {
+ #ifdef USE_LIBMOUNT_SUPPORT_NAMESPACES
+ 	"namespaces",
+ #endif
+-#if defined(HAVE_MOUNTFD_API) && defined(HAVE_LINUX_MOUNT_H)
++#ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
+ 	"idmapping",
+ #endif
+ #ifdef USE_LIBMOUNT_MOUNTFD_SUPPORT
+diff --git a/sys-utils/mount.8.adoc b/sys-utils/mount.8.adoc
+index 71daf92..c2b095a 100644
+--- a/sys-utils/mount.8.adoc
++++ b/sys-utils/mount.8.adoc
+@@ -826,6 +826,7 @@ Set _mountpoint_'s mode after mounting.
+=20
+ *X-mount.idmap*=3D__id-type__:__id-mount__:__id-host__:__id-range__ [__id=
-type__:__id-mount__:__id-host__:__id-range__], *X-mount.idmap*=3D__file__:=
:
+ Use this option to create an idmapped mount.
++This feature requires the new file-descriptor-based mount API (available =
since Linux 5.2).
+ An idmapped mount allows the ownership of all files located under a mount=
 to be changed according to the ID-mapping associated with a user namespace=
.
+ The ownership change is tied to the lifetime of, and localized to, the re=
levant mount.
+ The relevant ID-mapping can be specified in two ways:
diff --git a/meta/recipes-core/util-linux/util-linux/0005-tools-add-non-new=
mount.conf-config-gen-profile.patch b/meta/recipes-core/util-linux/util-lin=
ux/0005-tools-add-non-newmount.conf-config-gen-profile.patch
new file mode 100644
index 0000000000..4a957489b1
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0005-tools-add-non-newmount.c=
onf-config-gen-profile.patch
@@ -0,0 +1,26 @@
+From 19b732395c1c7dc849823a3aa0d8a66122483f54 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 3 Sep 2026 10:15:43 +0200
+Subject: [PATCH] tools: add non-newmount.conf config-gen profile
+
+Add a configuration profile to test builds with
+--disable-libmount-mountfd-support, useful for verifying that libmount
+compiles without the new fd-based mount API.
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit=
/b8159405b99af7af2054f9f8222cf23901368a01]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ tools/config-gen.d/non-newmount.conf | 3 +++
+ 1 file changed, 3 insertions(+)
+ create mode 100644 tools/config-gen.d/non-newmount.conf
+
+diff --git a/tools/config-gen.d/non-newmount.conf b/tools/config-gen.d/non=
-newmount.conf
+new file mode 100644
+index 0000000..303b6cb
+--- /dev/null
++++ b/tools/config-gen.d/non-newmount.conf
+@@ -0,0 +1,3 @@
++include:core.conf
++
++--disable-libmount-mountfd-support
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.p=
atch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index 44a8d768d2..9b94cbf1c1 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 4303ca5212f78fa276be750e077303f5090b7e33 Mon Sep 17 00:00:00 2001
+From dde7b7ff56ed406ef96b975b88b6ab663fd10386 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Mon, 14 Jun 2021 14:00:31 +0200
 Subject: [PATCH] util-linux: Add ptest
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index e2061e7..f816656 100644
+index ea3875e..9e0377e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patc=
h b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index 6d50cfd2c0..1c338126bf 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From d91f680b43b0c70ee7c4f3b74996c342ca15129e Mon Sep 17 00:00:00 2001
+From 5981a174707a384d6970c7ce7d8d68322985a6fa Mon Sep 17 00:00:00 2001
 From: Phil Blundell <pb@pbcl.net>
 Date: Mon, 24 Sep 2012 07:24:51 +0100
 Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 4 insertions(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 13bed69..e2061e7 100644
+index 50ed64d..ea3875e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -110,7 +110,10 @@ AC_SUBST([runstatedir])
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_s=
ubtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for=
_subtest.patch
index 1382e10c30..6ffcf46295 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.=
patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.=
patch
@@ -1,4 +1,4 @@
-From 42cfda0aa633f3a6786be1e490202cc9fe89e4e5 Mon Sep 17 00:00:00 2001
+From caadbbf29cfeeaac301d02185e717a5587a9cdf8 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/rec=
ipes-core/util-linux/util-linux/ptest.patch
index 3c529f2ea5..1fec138c3a 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From 238020ed859acb41f1f43352afc28db14cecb34e Mon Sep 17 00:00:00 2001
+From 368d04b58ce8b52e93d33be1321e78a9c6bf80ae Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
diff --git a/meta/recipes-core/util-linux/util-linux_2.42.2.bb b/meta/recip=
es-core/util-linux/util-linux_2.42.3.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.42.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.42.3.bb

