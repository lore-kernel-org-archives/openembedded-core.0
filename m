Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612ABC47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 13:57:52 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.47])
 by mx.groups.io with SMTP id smtpd.web10.16516.1706277471137107284
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 05:57:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=lXY3NPBm;
 spf=pass (domain: axis.com, ip: 40.107.241.47, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzmFeADor9yGwailjtxxPOrqbMpf22Qh/GQDheVzRALK3ErGGb20paOcRM5w9QXh3Eco4+K8toesuyoaUmblsDrM4WbmpyOzDL5FgzPLfxXVHu6VNFLZ9gX9kbnq8i/amJViC9CdQ7onufnSyCmjgHcdynkvnH5iRpebpHisXB7fGSEIYe6qa4r6G2xKtZzj2OORPF+fPcYC8xiXjxzMZYgqwBF0mX8cZFxLDTa6i5YAICUHCM14jEqJ7JkXPYNAsIk4FnGagQSbX0iMjro4fz6hJ6qn3L3o3nY21yZDBM/qASZvIOs/yyIbVehwYrDL+ZGKgv314YFL+IUSAW7O/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cr0fpDZVqslT8VgikTIlSHGB3C2thXeFKJzV3WVjRco=;
 b=HQKR6D9ibIe4BcEK6lmt0DtcV98CgPkjsrP+XkoadFBNixMji5Qih7KWyIKjY5oUXmkgNn3QnTJRNjSOVhsc2XQDpoiK9RfLsIylXnSeewjn7GnDl5gx2emR4uxu0BaEZQ9kVFZisQlkk87Yzg6zqWMf8EKOoj0HF8EyMSv5w4efr7635aKzrKA5Zo9k5IRsyNyKT+ZVcvltsGGMS7dIdvnLNuq9wWBYDRFHB2mo6CDUL3K1s/4qk7kUPiU3UOJl7H6FAU1eI8QgFzd3q+nJlJNbfUSjR3mfiG4HK4E5h+ec3AwBfJhE8/C4sdsZe2bNmSgKiklCkg8vvOzL5gyeQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cr0fpDZVqslT8VgikTIlSHGB3C2thXeFKJzV3WVjRco=;
 b=lXY3NPBm/+jQ2yipLYk0qA6oIXQMKIOAneX8ESqDqmU4Kp1S6AKgM3CgDtbmey55TQMyn7j1ZO28sZScMLcMXWKsVa+hgR32Nw/0HfKCu1fwDRHVMZGBuujWREumjDHbgQFOwhM7QNMjcugSjT7bMg0E3DaTkuXkFz0xuhP3otA=
Received: from DU6P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::14)
 by DBAPR02MB6104.eurprd02.prod.outlook.com (2603:10a6:10:183::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 13:57:47 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com (2603:10a6:10:53f::4)
 by DU6P191CA0028.outlook.office365.com (2603:10a6:10:53f::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.27 via Frontend Transport; Fri, 26 Jan 2024 13:57:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7228.16 via Frontend Transport; Fri, 26 Jan 2024 13:57:47 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 26 Jan
 2024 14:57:47 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 26 Jan
 2024 14:57:47 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 26 Jan 2024 14:57:46 +0100
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.125.119])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id D876F12F27
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 14:57:46 +0100 (CET)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id DD5A095A10; Fri, 26 Jan 2024 14:57:46 +0100 (CET)
From: Ola x Nilsson <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] python3-numpy: Use Large File Support version of fallocate
Date: Fri, 26 Jan 2024 14:57:46 +0100
Message-ID: <20240126135746.356410-1-olani@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8D:EE_|DBAPR02MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: 42037e7d-0774-4eea-680a-08dc1e76c735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KtGiaMrWoJVAFlhMyo2rTrMy9Dtz3TNN0YxJu3oWQXInqC3u+s4jFbCWm8u9rv0VrFJok6SwUhKlAYrLIRHSaFhYumSir1L1koGjK02VB+sBKKlLg5RStm23KTkld/WbVB1u4Q7fqcmRKDnBCs0h4lhriu61QeDdGAUu20LZTlx3ZebBGCGLzF1bnw4Pi8HkZNmhAXs2p3JeQv+++5Q1JTQagea5OV52Rkm4dHQlUmu8M1it+Wjs6cuody699EV+bnrvhlQrc2GN2zgVV8mr2oIAmtXRlE2velSZHErAPYhMQMUW123yTzibcZVdONYyKh5UXGTy/uMDEtRDWE1ZHv1oa+IpEcMv34VVBhsWVXYhtaubQhNC+ZObixXBbJQnF/4bfsgvn467U01t9G0LhBlJabv6qEAMXOlQTCDT6+MpsEg2+AlrHDXVRT4FJA85xx4lap1MFxcUUkmtFRcskZsacT0bmxcu3Hh1gzw6CC065glwmJ5Bkrt+tOthjG221qf+kVuR4AuD3oi2M8/7Y6nul1yv2zQzdKFANrbjorcOYFOH+v2HXagNTIycL/mh/z/6gZ5iYGjJgN9atBl6XDFXo++8Qm7fgPemID5M+ClbX3I8UTbDpvX2E4n2pTRL7TdxYTS+Zr1S472XT5XHxBsIw8PiDDkDY0M42bptPa/SqysapwLqvVGmt+IXJa9LG0+v7tdTbXBGmlOGzoX/RgfFEUdwLzHFNnp/PqhyeUqAHlDN7jeaZLJ5YWD/MS76IQdzP3x+7MpNPEjyJDtAFA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39850400004)(346002)(396003)(376002)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799012)(46966006)(36840700001)(40470700004)(2906002)(41300700001)(36756003)(26005)(70586007)(70206006)(2616005)(42186006)(6916009)(316002)(356005)(478600001)(82740400003)(81166007)(40480700001)(40460700003)(1076003)(47076005)(336012)(426003)(6266002)(36860700001)(83380400001)(8936002)(8676002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 13:57:47.6282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42037e7d-0774-4eea-680a-08dc1e76c735
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 13:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194369

This was supposed to always be the case from upstream but was exposed
by the 64-bit-time QA checker when file function scanning was enabled.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 ...le-fallocate-on-32-bit-linux-platfor.patch | 51 +++++++++++++++++++
 .../python/python3-numpy_1.26.3.bb            |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-numpy/0001-BUG-Use=
-large-file-fallocate-on-32-bit-linux-platfor.patch

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-BUG-Use-large-=
file-fallocate-on-32-bit-linux-platfor.patch b/meta/recipes-devtools/python=
/python3-numpy/0001-BUG-Use-large-file-fallocate-on-32-bit-linux-platfor.pa=
tch
new file mode 100644
index 0000000000..0702b8499a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-numpy/0001-BUG-Use-large-file-fa=
llocate-on-32-bit-linux-platfor.patch
@@ -0,0 +1,51 @@
+From 43b9b2626a59e8764f3bfb1d6b0d73b2d665584e Mon Sep 17 00:00:00 2001
+From: Ola x Nilsson <olani@axis.com>
+Date: Fri, 19 Jan 2024 10:26:41 +0100
+Subject: [PATCH] BUG: Use large file fallocate on 32 bit linux platforms
+
+Using a local prototype for fallocate instead of the fcntl.h header
+meant that the redirect triggered by -D_FILE_OFFSET_BITS=3D64 was not
+triggered.
+
+The prototypes in feature_detection_stdio.h should only be used by
+functions in setup_common.py. If they are used by the feature
+discovery code they might trigger false positives.
+
+Upstream-Status: Backport [https://github.com/numpy/numpy/commit/f49c6f9ea=
735cd7f718e74f8d637ffbbd3a7a03b]
+Signed-off-by: Ola x Nilsson <olani@axis.com>
+
+---
+ numpy/core/feature_detection_stdio.h | 3 +++
+ numpy/core/src/multiarray/convert.c  | 5 +++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/numpy/core/feature_detection_stdio.h b/numpy/core/feature_det=
ection_stdio.h
+index bc14d16..d8bbfbd 100644
+--- a/numpy/core/feature_detection_stdio.h
++++ b/numpy/core/feature_detection_stdio.h
+@@ -1,6 +1,9 @@
++#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <fcntl.h>
+=20
++#if 0 /* Only for setup_common.py, not the C compiler */
+ off_t ftello(FILE *stream);
+ int fseeko(FILE *stream, off_t offset, int whence);
+ int fallocate(int, int, off_t, off_t);
++#endif
+diff --git a/numpy/core/src/multiarray/convert.c b/numpy/core/src/multiarr=
ay/convert.c
+index 60c1a1b..8ec0aee 100644
+--- a/numpy/core/src/multiarray/convert.c
++++ b/numpy/core/src/multiarray/convert.c
+@@ -23,8 +23,9 @@
+ #include "array_coercion.h"
+ #include "refcount.h"
+=20
+-int
+-fallocate(int fd, int mode, off_t offset, off_t len);
++#if defined(HAVE_FALLOCATE) && defined(__linux__)
++#include <fcntl.h>
++#endif
+=20
+ /*
+  * allocate nbytes of diskspace for file fp
diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.3.bb b/meta/re=
cipes-devtools/python/python3-numpy_1.26.3.bb
index 023d40a9b2..326e2c3591 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.3.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME=
}-${PV}.tar.gz \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://fix_reproducibility.patch \
            file://run-ptest \
+           file://0001-BUG-Use-large-file-fallocate-on-32-bit-linux-platfo=
r.patch \
            "
 SRC_URI[sha256sum] =3D "697df43e2b6310ecc9d95f05d5ef20eacc09c7c4ecc9da3f23=
5d39e71b7da1e4"
=20
--=20
2.39.2


