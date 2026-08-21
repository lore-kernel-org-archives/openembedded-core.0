Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A98B3C5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 06:50:11 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1996.1787295005742589968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 23:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=s6I7o55D;
 spf=pass (domain: est.tech, ip: 52.101.65.33, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDePYBzH8z00Pcr9dMrtMO4n0q8Q79q7hQOYiCoiR9YU2G7r/4gQC+bjjzJ38G7grZBmuaANT3RHJSyyFRnpUeMVLJ2kFV3XzhNeXcYinU8gS4IWB9uIazHq6wI1G9rKEFLtGtAbn/nWpzmkunLzCRuUxVMyBt8JwuMcOyq6X6KafU0kVE2054d0quO+eRwpkTsvJzd1JERvASxpXEQnSmp0+fs9hfGlKIqJtb3GD2kjkKEj5JPWLHobvkam6z28xY0SBTG75CLmZjtk9hfUKljJ3c6jm7eEm6pH8ZndESUg00RhJikgVJtLTLrR711+VVgIH1GZb2iCo3uCY3KvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1kP68AaLp3C482HT1oLAKjKTDz0cxulLE/m/akTfyA=;
 b=wX+Pdk5BmLUgZDy5o1PEt+2ip46hFcdK70SnOmmOE1BjEY2EqTp8uDt9go5BiOgmDwFHFFuAqnujWESriual+P5qNzBlSYTwNuIwHa48DhdBWVCnmTnGRxBbha1mFEuW/lKPpPAFuj5Aw/WVdYt7mjdeKKfbX7fJeyT9tW9jdXSs9Z1nkqLgTrLBxAlkC7xZSoBDpwIf0P4p2BpwoOd/XYk5Qx5HkBdihYHIZsgGHu2QjKkWmESpOSM3GMFbzGrxp/nHagn0rlNKjgOw6e+BgIAvbYW3HVKzw6RPaCxCblVsu4QSZuWFvIYr7TEDs97ji1fZnbJDVWMxyBIXUETPIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1kP68AaLp3C482HT1oLAKjKTDz0cxulLE/m/akTfyA=;
 b=s6I7o55D/ZJ5Y+v4cg0tftSmpc0rNi5JfMYOYV6sUxOi3iRPFbKT0H2q/ISUsncmt+dSuU/nR2U7llriE2/2RhXkuU/+CkEuz1FgFKMxzUW2vuygn1AySoAZMNaUVA/QrxJ8aLLtg1W5tuGD4vvjMJLmy6h1gZpfCCJW/6FMXIXN85QKStWyQuH9lSlS/xLRnjQ+TGcujkVpXodjdCFW3z/PIvrM56lmYhpgALRS/iqDWP+h5q/5oYO1u1oABUVwUJdybHFyB4/LWbNK6KEXRYbm0iT2JxSL0m1ARwqTam+BhYEuBcaI1XblLuBKd8YYz/m8cpWCz9qUzsT0rKw3Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PAWP189MB2570.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:35f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.3; Fri, 21 Aug
 2026 06:50:00 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.003; Fri, 21 Aug 2026
 06:50:00 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] elfutils: fix aarch64-native build failure
Date: Fri, 21 Aug 2026 08:49:59 +0200
Message-ID: <20260821064959.64772-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7PR01CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::18) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PAWP189MB2570:EE_
X-MS-Office365-Filtering-Correlation-Id: b05e6d2b-d94d-4291-3025-08deff506be8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|10070799003|366016|1800799024|376014|3023799007|56012099006|6133799003|10067099003|11063799006|12006099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	BnKjdsqkiP6upW2pdMZKo8aNjpkZ0NPl/9jKrk83HKuVmUq7PjqHsFMOYRLI36FaUuKccdskDNR821CQPpzgRjXzNYuB7wrv8vmzznfwuC6IYJPO7xBOx26mLtTItkvxxc/ldXrQ1Rgu4iSq/XwwLTkrMKjkC9D8MMKoNgCXsgik9i97fd8fTpk4YtWsCnNrXneXc1WEkIYSX9GLdpSsRszm2WmwNDEutPwFbhSTO9iVw1lB5OazBkdGZ5OVocDzcNFOHfguiScHvOLc8iP4bnC38PUceoL+Gf2gqqwqQQBK2KLalX/A0ph93NHGcd8lBcmlCI45nJbgwGdgTvq+9HkWa6xJ8sPGHi02yI9xxsZuimNUqV2tHkIyb7WjvRFOkZ8S9J4rjWKDIkzc9eVKupotk0HMimZUFyC43Apdak5zNI2YxgnJAqZd9PfVDuOR3bnrlAAmNfD0FNreMqYqRd2MRC0cl+obGkeTrKoq+Uj0h7LQNwElnwR2lh2awlbfam1vbIcYQAFbFFKkEjenMDpTMWJAtvbqy7tOXOVCXDAAiCvOMAtb4Od77NWEQdmdsPGgbNReftwMKzBRl0HmOE1wgdWWH/gzSpyBrLkEaLo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(1800799024)(376014)(3023799007)(56012099006)(6133799003)(10067099003)(11063799006)(12006099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lOrYR5ZpxOT7Cb7UOjIje2WUkc7ajsn1dUTv+yUZxn8HLAuwghS4BLqYh3gg?=
 =?us-ascii?Q?UIyn4GPlTrynrrvnhvflb271PLwWlqEao5p7HihSwmAHTRr0n0Qvj/NFrk3p?=
 =?us-ascii?Q?QXQ1dqBX6yAYpsc+gd6vShZwQAWGgvrHxdM8JSzbjLnFQJ1VqIDeqg1I/IAG?=
 =?us-ascii?Q?TY8j6bGx8FIp1LEi/A8wOL7HxW6WG3ZkWw14NLPOtaqB4n+/a3hs3x0cRrtl?=
 =?us-ascii?Q?6/1eN4ePazHb5dZVBp79VGblQuoevLaWAQRDoEBvG+mrRJUeg+mv350DvcQp?=
 =?us-ascii?Q?2nlBFWuDfK2bRCEJ9iWUUk/TFvKx4r8ZybmgMhrc+/SsqgudafsRAfEdsSnV?=
 =?us-ascii?Q?HMh9VPtk7xA/w9rw6XBSLyCqJ7/tMXYNNKKeb1IkoaCEFJ3xG35hmdDI1BY0?=
 =?us-ascii?Q?lhonp6RtiZMmT26V9rRlD12emDPOom310//W9/b2Q08rQXGqL7CYfF94Feso?=
 =?us-ascii?Q?43J+C3etKyryAb+KDRB6gmqiwfgVT4gldGlVpL8Op1dHNIOFsetBFz0VPbD2?=
 =?us-ascii?Q?s/R+ZY158NW5HTLfq0elc8NXSPrGO2X+kqc2KmhoO9WMipgUcNEdCbQVJfed?=
 =?us-ascii?Q?HOuUFGgbwHp4qdFWv/Gk/DFvPd9AP6cTD7gNd9s5lKXlya7Km4CkZR6vVTjP?=
 =?us-ascii?Q?Z8Q0/wWbYy06lM20oO1Rg9JFhsazcABCGXDIJCYfutDmtjtEKVmxTdnf07r1?=
 =?us-ascii?Q?oGDZYG41nN68Lur2MLCa4FhtMpwnTGLiVWPhZAdYnUb7NPh3Sb56v7TMf92Y?=
 =?us-ascii?Q?C21Lda7UgStBKv6GuhDZEnwHJ4wfhuZZ/lVNalX5f1I+1rV18fVfiwwFZCIG?=
 =?us-ascii?Q?V/2DPnTNgtmDgOWhOlIkepvn96N9T7NbhXxzdjdgvawNZRxwd2B+vl+4L+mu?=
 =?us-ascii?Q?4tZecAwYzbmv1zTmXR69JbykGj/1yskJxW94YdSv93S2v4gR6TKNvsSgRORy?=
 =?us-ascii?Q?3DF23Id7ri6oraY3bbmPUC/J4JQIX6x/fg51zW8GHEvd0Z4q3KeK0LJmZBBF?=
 =?us-ascii?Q?VcklUN8rvw1qbKR/4itTbeyhL6FD1Wtm6adNTSvhznzK/psPsZn+tc0M4iwT?=
 =?us-ascii?Q?ihw0kuI8n8zpwckfTHddfgL6DnaX5JuyQ8mCuEHpGEd5W5ai7+IRbi1sQwVk?=
 =?us-ascii?Q?AlXt7cqliT6XuumTptx8c8eyBpe9zXZM1zGsGR0jw3cf7Mn45A/JwySrZlDN?=
 =?us-ascii?Q?82duZUhRo9OuhQR105+z1E+ow40oEy71XtDQ8dDmy4uamHMgzN73de5ogWkB?=
 =?us-ascii?Q?Nj9DrKQO1n4KPny1Oqc0r3pDR6fBfRDyHd0IrAQQ0xt92+VzdHPTwQ9UAWVL?=
 =?us-ascii?Q?aDyrNEQpsTMuSkE/wsjqruTq2JyEMlcWI49tG6EClZYrCG+iwCQnUhbvSUio?=
 =?us-ascii?Q?U3VNy3QABCkEyiII+ueZLzLy/eLxIAuI68bi6GwdrIYm1W2OqkkZPm35Swg9?=
 =?us-ascii?Q?FeEQCUXyvW6Z9GEyQe+E+3tFk4BAJJLCd3mK8FiuC0BFVAPg28Grr+HdN1+8?=
 =?us-ascii?Q?p1r6oIBkJ3OrP4yCGKBd0hVNkHVAyoEvHbzqIVrrWvG8cT4lyrpX/kLSAbhF?=
 =?us-ascii?Q?u5R9wv0e1D7yalKFP6hNLaP6PUpPQ18lGXcaGe2Iyga8g4/H/4CtXJ7D0nKU?=
 =?us-ascii?Q?WRUrDY6EUui5ZFkgj12CVVcP/5FijVjTYzX9iMGP/5UUhRL5mUNG0k8PVUeW?=
 =?us-ascii?Q?qs3Q4Ovb+bB/rmED6YnWEXwrb9myX0+XtG3ZFSBobUdLToZ/Gu+wuiPGaAWh?=
 =?us-ascii?Q?1SZq8u6lxd2sgb0XdEQKOnlgBgsCcl2Jru9nwikSS3KeovQLuIUni+ujfw8B?=
X-MS-Exchange-AntiSpam-MessageData-1: YfBZr8NJkO9D0qWJV8V4mV0uTVXh61YO3tE=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b05e6d2b-d94d-4291-3025-08deff506be8
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 06:50:00.7631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R99hO8WKOjMdHYSKISKo3cEyTxHtWr4vWgLXd1HgLWcorCrmkoevuzg0Atsgx8imLWqzxh0CU870YScHwDYdSl81s/2BaRIrm41Gzxan+qs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2570
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 06:50:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243895

Backport upstream fix for struct iovec redefinition error when building
elfutils-native on aarch64 hosts. Since commit 0e8b57a3 added <fcntl.h>
to lib/system.h, glibc's <fcntl.h> pulls in struct iovec via
<bits/types/struct_iovec.h>, conflicting with <linux/uio.h> which
defines it unconditionally.

The fix switches to <sys/uio.h> which guards the definition with
__iovec_defined.

Issue seen on https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/b=
uilds/4668

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../elfutils/elfutils_0.196.bb                |  1 +
 ...s-uio.h-instead-of-linux-uio.h-for-s.patch | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-backends-use-=
sys-uio.h-instead-of-linux-uio.h-for-s.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.196.bb b/meta/recipe=
s-devtools/elfutils/elfutils_0.196.bb
index e0b188ce8e..c2466134cd 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.196.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.196.bb
@@ -19,6 +19,7 @@ SRC_URI =3D "https://sourceware.org/elfutils/ftp/${PV}/${=
BP}.tar.bz2 \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-=
C.patch \
            file://0001-config-eu.am-do-not-force-Werror.patch \
+           file://0001-backends-use-sys-uio.h-instead-of-linux-uio.h-for-s=
.patch \
            "
 SRC_URI:append:libc-musl =3D " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0001-backends-use-sys-uio=
.h-instead-of-linux-uio.h-for-s.patch b/meta/recipes-devtools/elfutils/file=
s/0001-backends-use-sys-uio.h-instead-of-linux-uio.h-for-s.patch
new file mode 100644
index 0000000000..0461172fcf
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-backends-use-sys-uio.h-inst=
ead-of-linux-uio.h-for-s.patch
@@ -0,0 +1,74 @@
+From 64e89606ff4967a647525524aec00dd33765ba2a Mon Sep 17 00:00:00 2001
+From: Daeho Ro <email@daeho.ro>
+Date: Sun, 16 Aug 2026 16:27:56 +0900
+Subject: [PATCH] backends: use <sys/uio.h> instead of <linux/uio.h> for
+ struct iovec
+
+Since commit 0e8b57a3 ("elfcompress: Handle existing output files
+(symlinks)") lib/system.h includes <fcntl.h>.  When _GNU_SOURCE is
+defined, glibc's <fcntl.h> pulls in <bits/types/struct_iovec.h> (via
+bits/fcntl-linux.h), which defines struct iovec.  The kernel UAPI header
+<linux/uio.h> defines struct iovec unconditionally, so including it
+after "system.h" now breaks the aarch64 backend build:
+
+  In file included from aarch64_initreg.c:36:
+  /usr/include/linux/uio.h:17:8: error: redefinition of 'struct iovec'
+     17 | struct iovec
+        |        ^~~~~
+  In file included from /usr/include/aarch64-linux-gnu/bits/fcntl-linux.h:=
38,
+                   from /usr/include/aarch64-linux-gnu/bits/fcntl.h:61,
+                   from /usr/include/fcntl.h:35,
+                   from ../lib/system.h:42,
+                   from aarch64_initreg.c:33:
+  /usr/include/aarch64-linux-gnu/bits/types/struct_iovec.h:26:8: note: ori=
ginally defined here
+
+Seen building 0.196 on aarch64 with glibc 2.39 and gcc 13.3.0.
+
+Both files only need struct iovec to call ptrace (PTRACE_GETREGSET),
+which glibc provides in <sys/uio.h>; that header guards the definition
+with __iovec_defined, so it composes with the rest of system.h.
+arm_initreg.c does not currently include "system.h" and so still builds,
+but it has the same latent conflict.
+
+* backends/aarch64_initreg.c: Include <sys/uio.h> instead of
+  <linux/uio.h>.
+* backends/arm_initreg.c: Likewise.
+
+Signed-off-by: Daeho Ro <email@daeho.ro>
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Delfutils.git;a=
=3Dpatch;h=3D64e89606ff4967a647525524aec00dd33765ba2a]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ backends/aarch64_initreg.c | 2 +-
+ backends/arm_initreg.c     | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/backends/aarch64_initreg.c b/backends/aarch64_initreg.c
+index a6badbb4..539a6366 100644
+--- a/backends/aarch64_initreg.c
++++ b/backends/aarch64_initreg.c
+@@ -33,7 +33,7 @@
+ #include "system.h"
+ #include <assert.h>
+ #if defined(__aarch64__) && defined(__linux__)
+-# include <linux/uio.h>
++# include <sys/uio.h>
+ # include <sys/user.h>
+ # include <sys/ptrace.h>
+ # include <asm/ptrace.h>
+diff --git a/backends/arm_initreg.c b/backends/arm_initreg.c
+index efcabaf6..062bb9e0 100644
+--- a/backends/arm_initreg.c
++++ b/backends/arm_initreg.c
+@@ -38,7 +38,7 @@
+ #endif
+=20
+ #ifdef __aarch64__
+-# include <linux/uio.h>
++# include <sys/uio.h>
+ # include <sys/user.h>
+ # include <sys/ptrace.h>
+ /* Deal with old glibc defining user_pt_regs instead of user_regs_struct.=
  */
+--=20
+2.43.7
+

