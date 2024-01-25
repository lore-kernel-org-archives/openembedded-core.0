Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DF4C47DDF
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 14:36:15 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.86])
 by mx.groups.io with SMTP id smtpd.web11.19129.1706193369967755975
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 06:36:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=cKiqrOSj;
 spf=pass (domain: axis.com, ip: 40.107.6.86, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIPsaBrtWbPJj75JA7INxP7j7SFPB3PZzMLsAD5fSNdR9czIy36dNHLRohuDcniIEJlUgwfbm7ocJIIuJgbXmqlflLRyY+I8qN2A1Kk6Sosr0De5W/g6g1eWyW7wH5KKJS9s7JhtT0KokSEGhGi17SkiLjeZPNejUI8FtMrckDpyILKlUV7sxnmNpeG2P7Y+8lL/AKoSSsfNKLM5xQPN5fho8c/FOBy+ZB68y2FLBo6N3d/ROQZrz3eQ3HhcUsMQk89KL6eYhSA/SXJb+z7Dh/DbSieqNvSaenpc0Qcdaf9MN5d9EdbL70n1TfjhJCrUio4CGIGYEpTLfLEEUxrv5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agUwtCHJzd9Ibaa35nvkvGnpuhIlmPMplzbk+4FYfxI=;
 b=kQna5+SVb71d6siXwdCTrACLZa6xR94Tlqxs5U0ALrdXl2W+9qZbKEBEyTJzajXpIUXtRyL92RKKypPRImRJ/5z0afQaBHe0gDJWdTOn4FBfY48AFAUt+f6THJvRwP4ezpLqRn7xpBP8CWnQYIwD2jLXQGJFH4hIaX387yzyoAzJ3WX+fLtsSQbrwNBUZkiQJvlDb6APujowwgcGz2tjACweeAr1hpBAqHQMa0hXgsm3u3z4/u6bVslz48AV3Azh4u+6Apg9yla90HqYNA9KAxG2TtCPkpb/DGMqp/KC4iIFPRh/sQeCBwXdTYbYquUe/Svn+pd9j9yXrMHRU1PHPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agUwtCHJzd9Ibaa35nvkvGnpuhIlmPMplzbk+4FYfxI=;
 b=cKiqrOSjKC9xKuQPz2PnNt6kidx33lQS3x2WLiez6Cc40iDJq4Y1lQsVwSc1I7wqMUPzvSL0pZz1CEhZZAmZzWN8KpvuW2+cXkOYl9irjOhlGJmvD4zthi3xMH30JE428dFas43ldf2pz1DlybqAI0bPevxjM6/r2XThNyL862g=
Received: from DB8PR03CA0003.eurprd03.prod.outlook.com (2603:10a6:10:be::16)
 by DB8PR02MB5899.eurprd02.prod.outlook.com (2603:10a6:10:118::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 14:36:07 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:be:cafe::f0) by DB8PR03CA0003.outlook.office365.com
 (2603:10a6:10:be::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26 via Frontend
 Transport; Thu, 25 Jan 2024 14:36:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Thu, 25 Jan 2024 14:36:07 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 Jan
 2024 15:36:06 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 Jan
 2024 15:36:06 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 25 Jan 2024 15:36:06 +0100
Received: from lnxolani1.se.axis.com (lnxolani1.se.axis.com [10.88.125.119])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 6565112E31
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 15:36:06 +0100 (CET)
Received: by lnxolani1.se.axis.com (Postfix, from userid 20853)
	id 634179631D; Thu, 25 Jan 2024 15:36:06 +0100 (CET)
From: Ola x Nilsson <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-numpy: Use Large File Support version of fallocate
Date: Thu, 25 Jan 2024 15:36:06 +0100
Message-ID: <20240125143606.4128407-1-olani@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9E:EE_|DB8PR02MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: dbfef215-0e6f-4c77-7eb3-08dc1db2f760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9WUrTlbmixrdSfHq7JMrLh706dvA0KQoJkuU4OutSf3Ao9mUCtLmtv/5jRQZ1yRnFNdTltns7DuTUh1Chd2MaqYeXob+BP+XYue3fuUFx2S+lt1RZJh88h3B42K1p7t/dWdg4WoXcHvZRwVZrR8SnUecNiq6XF5LgfXAZt/SafA+jLOxyd9G3vBQGTimjJ6kpoOEc/icHTZgK+fEPYRG5hsZZwzgsv45Ev1tuyvHcv4b48PcrI+YuHHVPqjZtdWYStwqlS331rQgn1fj31xb5xhOn6QPTTKgJ79dwRD536y2XL79imC5y9uOe5UOqYN4/a+eLHJuPxeXo7fHomadMCOCpSId3O4CbtNlr0F/59xgUKKt0xWUek9qjddzxAMMI9L5dwPHc36auIr36InfJEKvxTzyECa58mMz1j4YL0gqbb5CON7WzXf36EISNbowDttvZI3fBMXdW+s8nyAlg9upSFSxJSCwgIDRoB4kC3k/pA+Mmp8RF/kVOYZIVmS4DUdWNNjY3h8MDXLNhVzuzfeOihLM5WvH6vZ5iese63WindZWk0MYgEnzzwRdYwIGW7l13ReaBJy6rREe/qbb8wU50mMGk5Ole2xgCj4M6ReZ0oLim4luabFLQjT4LxqfQBB2VusBY0ZlAxlWbxkNcYEC2e5+fz/r5J+k5tPcfjUmCEYL7xC8Y3oOcNqSIg7PMyVSWJ2/vKmyHz3cTAJzh/5Z7FeG3HMY7IeBuxvsxgFLYEl+gpIgaOd/yYHyTul9rMHEdpusLqVzuDjEpkHaCg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(396003)(376002)(230922051799003)(451199024)(1800799012)(82310400011)(186009)(64100799003)(36840700001)(46966006)(40470700004)(41300700001)(83380400001)(47076005)(1076003)(426003)(6266002)(26005)(2616005)(336012)(82740400003)(356005)(81166007)(36860700001)(8676002)(8936002)(5660300002)(2906002)(478600001)(42186006)(6916009)(70586007)(316002)(70206006)(36756003)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 14:36:07.0823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbfef215-0e6f-4c77-7eb3-08dc1db2f760
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5899
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 14:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194327

This was supposed to always be the case from upstream but was exposed
by the 64-bit-time QA checker when file function scanning was enabled.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 ...le-fallocate-on-32-bit-linux-platfor.patch | 49 +++++++++++++++++++
 .../python/python3-numpy_1.26.2.bb            |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-numpy/0001-BUG-Use=
-large-file-fallocate-on-32-bit-linux-platfor.patch

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-BUG-Use-large-=
file-fallocate-on-32-bit-linux-platfor.patch b/meta/recipes-devtools/python=
/python3-numpy/0001-BUG-Use-large-file-fallocate-on-32-bit-linux-platfor.pa=
tch
new file mode 100644
index 0000000000..6972431192
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-numpy/0001-BUG-Use-large-file-fa=
llocate-on-32-bit-linux-platfor.patch
@@ -0,0 +1,49 @@
+From a67561c3c015589e26d156f82de8624533e3e6d7 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.2.bb b/meta/re=
cipes-devtools/python/python3-numpy_1.26.2.bb
index 253b334367..b28a6c0305 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.2.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME=
}-${PV}.tar.gz \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://fix_reproducibility.patch \
            file://run-ptest \
+           file://0001-BUG-Use-large-file-fallocate-on-32-bit-linux-platfo=
r.patch \
            "
 SRC_URI[sha256sum] =3D "f65738447676ab5777f11e6bbbdb8ce11b785e105f690bc459=
66574816b6d3ea"
=20
--=20
2.39.2


