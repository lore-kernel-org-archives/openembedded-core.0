Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B55DC77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 12:23:47 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.33])
 by mx.groups.io with SMTP id smtpd.web10.12356.1751027016801387780
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 05:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=Gp8yuKcg;
 spf=pass (domain: de.bosch.com, ip: 52.101.84.33, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIo/Zu1+Vs2Conko8wYNzFONpWkuh9Sy1i0McQlDWwKdhNRdEpzyRL54ITdJYTsJqJHQgjwaUYZ4oRiiPlTOixWXjvIsPAYcv3mvy9xTyeKCluIXypbj/pALuxJ/RXFbcjqtGytz5HtttxtNWLmWBPkdy5uqrm2fA6gCBF9ZtYbdshHhtFcEu9rtkAIjhsp9cXy8PR/h7PplpAbnB63IralaQGChYszL5bjacWHBRInM6DvENofs2gJJHYzMNiLfcjOIXG4q81mSatg/vojU4aebxvsjsLDRP9p2JT31QJP7EGGJVammRltTsHvUAAvTWHxzRgKy8UuxmkLWrv7K7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNZZkInDcCR0fKaIOJFT3v7BpSzxiBZMrdEjiq/giQM=;
 b=ljh4SQw2x9tBPOgmHvMLVhI7unOaw3YhVlivd5Cmb+Ehc1EREjU9pRVu/LYgtzMKWekjdzBv4FJnoyhjGaLvmigQqcm0ebGwUb+Tgv+dVqHJXH5+qzQoCY8VXnP9jVh/WKQgOu/3syLVWuxXVPLA+KSVPcPwGCyJIM1ceH6YhP3H+pOcUcTXJ41apzdSwy9ILoLi2D15CK5myElxjNKhaCG1lAdX3PQ9nUc1wehdbgTJT5PcY6oGlLuTXIDu71rsASz/JezmXNmYR4bNlSnr9i2CZSjIIehnzgAu4LrgFmXf69B+wNoV5JsmD5Sr1rwlM+KsSjpj0sAijrJ8iwUMrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNZZkInDcCR0fKaIOJFT3v7BpSzxiBZMrdEjiq/giQM=;
 b=Gp8yuKcge3mujKV/E05ogBBYcBTMLIkQX8s1JbsSIBgTVCvoCv6nOZQRTZ0VuYf0ORBchpf/DbifIKvDLFno1RK82nr0KidOcro0vYGsxzab2K9JV0GG+0KMyBLVTYeXMKMvL/D9xVQKW0En35R9EDWzihJsoU4GBjj/VN1TW+2b/aG5UHIvoqfpxJatPDJb1huy1J4DLd+kzdy+Ub/0aW+wnxp2DlocCfr1u8kqhHPWuc5un9CCizV6rzwb40O5wv3593YEdgS4Wz22QbWlkKUriOYmd+P7a43CEQTvNQgFGO8PtvUYHn3MsgGJI5WrLNmfRYIMo5nmKRvoWAjOrg==
Received: from AS4P190CA0006.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::9)
 by AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:142::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.20; Fri, 27 Jun
 2025 12:23:32 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:5de:cafe::86) by AS4P190CA0006.outlook.office365.com
 (2603:10a6:20b:5de::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.23 via Frontend Transport; Fri,
 27 Jun 2025 12:23:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Fri, 27 Jun 2025 12:23:31 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Fri, 27 Jun
 2025 14:23:14 +0200
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Fri, 27 Jun 2025 14:23:13 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.22.69.179) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 27 Jun 2025 14:23:13 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-core@lists.openembedded.org>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<jpewhacker@gmail.com>, <raj.khem@gmail.com>, <ricardo.simoes@pt.bosch.com>,
	Mark Jonas <mark.jonas@de.bosch.com>
Subject: [PATCH 1/1] dosfstools: Use standard fsck exit codes
Date: Fri, 27 Jun 2025 14:21:58 +0200
Message-ID: <20250627122158.18544-2-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627122158.18544-1-mark.jonas@de.bosch.com>
References: <20250627122158.18544-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.69.179]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C714:EE_|AM7PR10MB3559:EE_
X-MS-Office365-Filtering-Correlation-Id: f691b0db-2f13-4d3a-e53d-08ddb5756dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?D2HsC47Ez7WrBgjrOyqVr0n8u3oNJK5Z6OACxvml5qZAji/gdWfFX6PJphyQ?=
 =?us-ascii?Q?C+dlkrPI/d1zUExxm6bOWEn9ZUjVedIbvLGbf2LGa1Ahwy9ixSF1VDHrusfW?=
 =?us-ascii?Q?OE/JYhB06Boa7eXJV4ozAcb1cXjAqBhGo7weCBiudu9z6fu6A+11YdY18nJt?=
 =?us-ascii?Q?JUP1hCOd0rD072vYh/qlJR1DtsNTicCk8cre38BvoMZF+PSsVRkUPNlHnrA9?=
 =?us-ascii?Q?fHbaBsw13CB9EhRM/3FWiazx+jJz/32G7XiYlB5y06FClYfWVSEPgG0qQsDk?=
 =?us-ascii?Q?eK+QtvOwZJObjqZkR2o0oU+qCz+rvujT4MgRTGo74V//4ATlcUVdI9OoZeCV?=
 =?us-ascii?Q?yb9WvUxtAQJUBJpiiUk2jZEgkWDtkAoEMNTPR+4bNLe0zFs8Axy5qxobx7Rb?=
 =?us-ascii?Q?kI/UbUqxNJ3R+kw+jsyOVhtdsLttVOVAebbT7x64ToS6BGp9XNOrGgvsQ2DU?=
 =?us-ascii?Q?JFPW/7uPrdD4xwgQ5kngYz8qRDIylLJi2XVQaTrLtEuX3jZLzByEU5SlgFTL?=
 =?us-ascii?Q?rUvIFlDqcqRVMzkwNihPf9CVQYBxd58t+fH3mxkFM26dm36jx16q+FzC0Nti?=
 =?us-ascii?Q?/3EdORxK/1yQhXSmtjsCdHO+mT50W9qMRtgDFidd0iSX9H8ONJQgLIDgjNuh?=
 =?us-ascii?Q?jbui/IGUDMeIU/jXqxCSEhBIDosj9H7BjdFfRuXuT3PTLJABPaoDqVNmADm4?=
 =?us-ascii?Q?bcHvCPtSJ4jf5W6Md0uIuv4MRYWYL9BkyJ+S9tRvPo3uouSV2H19CDyUoCs9?=
 =?us-ascii?Q?P0xMNGiTkXzcgb8OugkrZ67P/D6F07wjsHBmaRFQ6H7+2QDdFXY0RtK2/T7r?=
 =?us-ascii?Q?7X3dNYTK8Y+df/zsaWVp15Gz9xmHpMFnJb4AqkIHVqIKP8/RnHF0Gm+urBSx?=
 =?us-ascii?Q?9r1qZpMhXp5JKlEblAO5lCmNxSM3uZu405YxoK3t+U2JjysNXuVxHEIUfM3w?=
 =?us-ascii?Q?uRVNt5ufPlVYgLTp2B00PNuefdrODn9DikEoO6h9Fw+Zq4at7T3xjH35AsYk?=
 =?us-ascii?Q?U/16ltgNPOV4+QgvoDuY3peTg3jWgK1aGbXzEG/tZO8m/BJFbCDGoWOUtUsQ?=
 =?us-ascii?Q?IWQUsZ/djzWCQ+uASiSjM571/KtHjMkIv4xE1wkB3o4qUCKD3o/TFbg8tt3Z?=
 =?us-ascii?Q?hRcYDU1n3hAEd6R4D7Il8m0VNrq85yV41prTsj8sdhtXvAVYe62W0z4HpEnb?=
 =?us-ascii?Q?eIrFl5Ukgzp7+U4EyKVIvQiaMD77VFypHa059Yz485KVKxg2heVmaVfBL/iR?=
 =?us-ascii?Q?IxZ5v3VFHf0W1RHJ/jGl47t9dYl+trG1FTraOa/fp61TlAmk4sN7HOiwNst2?=
 =?us-ascii?Q?nMOzVEWRNMGE/ZS1wurUDp1eeoDPW6nECR8uHslQdOLk09v/j+KjxbIZunXH?=
 =?us-ascii?Q?th3OBbLRmh+SUMARiKNpbZGW9xUpvFHAh7PjErLhj/vUwNhkad0/6xQx8o+j?=
 =?us-ascii?Q?9eMOOC6CGmtHDUELgqeXjOx/2JArQN/u9SFQgZnJp2jlQRrnBbYmbw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 12:23:31.6988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f691b0db-2f13-4d3a-e53d-08ddb5756dfd
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3559
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 12:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219406

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

This commit brings in `dosfstools` patches to make `fsck.vfat` exit
codes adhere to the standard exit codes defined by `fsck`. See [1].

These will fix the interaction of `fsck.vfat` with other tools like
`systemd-fsck` which expect the exit codes to be in line with the
standard [2].

However, as of today the dosfstools maintainer(s) are invisible for over
a year [3]. Thus, if upstream ever becomes active again, these patches
should be reassessed.

[1] https://github.com/dosfstools/dosfstools/issues/89

[2] https://man7.org/linux/man-pages/man8/systemd-fsck@.service.8.html

[3] https://github.com/dosfstools/dosfstools/issues/210

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 ...ck.fat-Adhere-to-the-fsck-exit-codes.patch | 214 ++++++++++++++++++
 ...ges-Document-fsck.fat-new-exit-codes.patch |  46 ++++
 .../dosfstools/dosfstools_4.2.bb              |   7 +-
 3 files changed, 264 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/dosfstools/dosfstools/0001-fsck.f=
at-Adhere-to-the-fsck-exit-codes.patch
 create mode 100644 meta/recipes-devtools/dosfstools/dosfstools/0002-manpag=
es-Document-fsck.fat-new-exit-codes.patch

diff --git a/meta/recipes-devtools/dosfstools/dosfstools/0001-fsck.fat-Adhe=
re-to-the-fsck-exit-codes.patch b/meta/recipes-devtools/dosfstools/dosfstoo=
ls/0001-fsck.fat-Adhere-to-the-fsck-exit-codes.patch
new file mode 100644
index 0000000000..3d2ce48723
--- /dev/null
+++ b/meta/recipes-devtools/dosfstools/dosfstools/0001-fsck.fat-Adhere-to-t=
he-fsck-exit-codes.patch
@@ -0,0 +1,214 @@
+From 9d165145b9f9c20a56e111360fbc2003c2b28cba Mon Sep 17 00:00:00 2001
+From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
+Date: Thu, 26 Jun 2025 08:14:29 +0100
+Subject: [PATCH] fsck.fat: Adhere to the fsck exit codes
+
+fsck.fat is used as a filesystem-specific checker for the `fsck`. This
+also causes `fsck` to return the same exit-codes given by `fsck.fat`.
+
+In most cases this is already the case. One exception to that comes when
+checking a read-only filesystem. In that case `fsck.fat` will return 6,
+which for `fsck` means "Fiesystem errors left uncorrected" and "System
+should reboot". When a more proper response would be to return 8,
+"Operational Error".
+
+This commit solves that problem by introducing a new header file which
+standardizes the exit codes used by `fsck.fat`.
+
+Signed-off-by: Ricardo Ungerer <ungerer.ricardo@gmail.com>
+
+Upstream-Status: Inactive-Upstream [lastcommit: 2023, lastrelease: 2021]
+Upstream-Status: Submitted [https://github.com/dosfstools/dosfstools/pull/=
217]
+---
+ src/Makefile.am  |  4 ++--
+ src/common.c     |  8 ++++----
+ src/exit_codes.h | 15 +++++++++++++++
+ src/fsck.fat.c   | 23 ++++++++++++-----------
+ src/io.c         |  3 ++-
+ 5 files changed, 35 insertions(+), 18 deletions(-)
+ create mode 100644 src/exit_codes.h
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index a389046..48f00dd 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -23,7 +23,7 @@ EXTRA_DIST =3D blkdev/README
+
+ charconv_common_sources =3D charconv.c charconv.h
+ charconv_common_ldadd =3D $(LIBICONV)
+-fscklabel_common_sources =3D boot.c boot.h common.c common.h \
++fscklabel_common_sources =3D boot.c boot.h common.c common.h exit_codes.h=
 \
+ 			   fat.c fat.h io.c io.h msdos_fs.h \
+ 			   $(charconv_common_sources) \
+ 			   fsck.fat.h endian_compat.h
+@@ -38,7 +38,7 @@ devinfo_common_sources =3D device_info.c device_info.h \
+ 			 blkdev/blkdev.c blkdev/blkdev.h \
+ 			 blkdev/linux_version.c blkdev/linux_version.h
+ mkfs_fat_SOURCES  =3D mkfs.fat.c msdos_fs.h common.c common.h endian_comp=
at.h \
+-		    $(charconv_common_sources) $(devinfo_common_sources)
++		    exit_codes.h $(charconv_common_sources) $(devinfo_common_sources)
+ mkfs_fat_CPPFLAGS =3D -I$(srcdir)/blkdev
+ mkfs_fat_CFLAGS   =3D $(AM_CFLAGS)
+ mkfs_fat_LDADD    =3D $(charconv_common_ldadd)
+diff --git a/src/common.c b/src/common.c
+index 4f1afcb..089d4b3 100644
+--- a/src/common.c
++++ b/src/common.c
+@@ -38,7 +38,7 @@
+
+ #include "common.h"
+ #include "charconv.h"
+-
++#include "exit_codes.h"
+
+ int interactive;
+ int write_immed;
+@@ -62,7 +62,7 @@ void die(const char *msg, ...)
+     vfprintf(stderr, msg, args);
+     va_end(args);
+     fprintf(stderr, "\n");
+-    exit(1);
++    exit(OPERATIONAL_ERROR);
+ }
+
+ void pdie(const char *msg, ...)
+@@ -205,7 +205,7 @@ int get_choice(int noninteractive_result, const char *=
noninteractive_msg,
+ 	} while (choice =3D=3D '\n');  /* filter out enter presses */
+
+ 	if (choice =3D=3D EOF)
+-	    exit(1);
++	    exit(USAGE_OR_SYNTAX_ERROR);
+
+ 	printf("%c\n", choice);
+
+@@ -235,7 +235,7 @@ int get_choice(int noninteractive_result, const char *=
noninteractive_msg,
+ 	    inhibit_quit_choice =3D 0;
+
+ 	    if (quit_choice =3D=3D 1)
+-		exit(0);
++		exit(NO_ERRORS);
+ 	}
+     }
+
+diff --git a/src/exit_codes.h b/src/exit_codes.h
+new file mode 100644
+index 0000000..f67d22e
+--- /dev/null
++++ b/src/exit_codes.h
+@@ -0,0 +1,15 @@
++#ifndef _EXIT_CODES_H
++#define _EXIT_CODES_H
++
++/* Codes as defined by fsck.
++   For more information, see fsck manpage. */
++#define NO_ERRORS                   0
++#define FS_ERRORS_CORRECTED         1
++#define SYSTEM_SHOULD_BE_REBOOTED   2
++#define FS_ERRORS_LEFT_UNCORRECTED  4
++#define OPERATIONAL_ERROR           8
++#define USAGE_OR_SYNTAX_ERROR       16
++#define CHECKING_CANCELED_BY_USER   32
++#define SHARED_LIB_ERROR            128
++
++#endif
+diff --git a/src/fsck.fat.c b/src/fsck.fat.c
+index 8b02b57..42e3ab4 100644
+--- a/src/fsck.fat.c
++++ b/src/fsck.fat.c
+@@ -46,6 +46,7 @@
+ #include "file.h"
+ #include "check.h"
+ #include "charconv.h"
++#include "exit_codes.h"
+
+ int rw =3D 0, list =3D 0, test =3D 0, verbose =3D 0;
+ long fat_table =3D 0;
+@@ -147,10 +148,10 @@ int main(int argc, char **argv)
+ 	    codepage =3D strtol(optarg, &tmp, 10);
+ 	    if (!*optarg || isspace(*optarg) || *tmp || errno || codepage < 0 ||=
 codepage > INT_MAX) {
+ 		fprintf(stderr, "Invalid codepage : %s\n", optarg);
+-		usage(argv[0], 2);
++		usage(argv[0], USAGE_OR_SYNTAX_ERROR);
+ 	    }
+ 	    if (!set_dos_codepage(codepage))
+-		usage(argv[0], 2);
++		usage(argv[0], USAGE_OR_SYNTAX_ERROR);
+ 	    break;
+ 	case 'd':
+ 	    file_add(optarg, fdt_drop);
+@@ -163,7 +164,7 @@ int main(int argc, char **argv)
+ 	    fat_table =3D strtol(optarg, &tmp, 10);
+ 	    if (!*optarg || isspace(*optarg) || *tmp || errno || fat_table < 0 |=
| fat_table > 255) {
+ 		fprintf(stderr, "Invalid FAT table : %s\n", optarg);
+-		usage(argv[0], 2);
++		usage(argv[0], USAGE_OR_SYNTAX_ERROR);
+ 	    }
+ 	    break;
+ 	case 'l':
+@@ -202,31 +203,31 @@ int main(int argc, char **argv)
+ 		    atari_format =3D 1;
+ 	    } else {
+ 		    fprintf(stderr, "Unknown variant: %s\n", optarg);
+-		    usage(argv[0], 2);
++		    usage(argv[0], USAGE_OR_SYNTAX_ERROR);
+ 	    }
+ 	    break;
+ 	case 'w':
+ 	    write_immed =3D 1;
+ 	    break;
+ 	case OPT_HELP:
+-	    usage(argv[0], 0);
++	    usage(argv[0], EXIT_SUCCESS);
+ 	    break;
+ 	case '?':
+-	    usage(argv[0], 2);
++	    usage(argv[0], USAGE_OR_SYNTAX_ERROR);
+ 	    break;
+ 	default:
+ 	    fprintf(stderr,
+ 		    "Internal error: getopt_long() returned unexpected value %d\n", c);
+-	    exit(3);
++	    exit(OPERATIONAL_ERROR);
+ 	}
+     if (!set_dos_codepage(-1))	/* set default codepage if none was given =
in command line */
+-        exit(2);
++        exit(OPERATIONAL_ERROR);
+     if ((test || write_immed) && !rw) {
+ 	fprintf(stderr, "-t and -w can not be used in read only mode\n");
+-	exit(2);
++	exit(USAGE_OR_SYNTAX_ERROR);
+     }
+     if (optind !=3D argc - 1)
+-	usage(argv[0], 2);
++	usage(argv[0], USAGE_OR_SYNTAX_ERROR);
+
+     printf("fsck.fat " VERSION " (" VERSION_DATE ")\n");
+     fs_open(argv[optind], rw);
+@@ -285,5 +286,5 @@ exit:
+ 	       n_files, (unsigned long)fs.data_clusters - free_clusters,
+ 	       (unsigned long)fs.data_clusters);
+
+-    return fs_close(rw) ? 1 : 0;
++    return fs_close(rw) ? FS_ERRORS_CORRECTED : NO_ERRORS;
+ }
+diff --git a/src/io.c b/src/io.c
+index 8c0c3b2..8bd1ae5 100644
+--- a/src/io.c
++++ b/src/io.c
+@@ -44,6 +44,7 @@
+ #include "fsck.fat.h"
+ #include "common.h"
+ #include "io.h"
++#include "exit_codes.h"
+
+ typedef struct _change {
+     void *data;
+@@ -60,7 +61,7 @@ void fs_open(const char *path, int rw)
+ {
+     if ((fd =3D open(path, rw ? O_RDWR : O_RDONLY)) < 0) {
+ 	perror("open");
+-	exit(6);
++	exit(OPERATIONAL_ERROR);
+     }
+     changes =3D last =3D NULL;
+     did_change =3D 0;
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/0002-manpages-Docu=
ment-fsck.fat-new-exit-codes.patch b/meta/recipes-devtools/dosfstools/dosfs=
tools/0002-manpages-Document-fsck.fat-new-exit-codes.patch
new file mode 100644
index 0000000000..29bba7b093
--- /dev/null
+++ b/meta/recipes-devtools/dosfstools/dosfstools/0002-manpages-Document-fs=
ck.fat-new-exit-codes.patch
@@ -0,0 +1,46 @@
+From 8d703216d2ea3247092a08adb0c37b38eb77ccc7 Mon Sep 17 00:00:00 2001
+From: Ricardo Ungerer <ungerer.ricardo@gmail.com>
+Date: Wed, 21 May 2025 07:18:15 +0100
+Subject: [PATCH 2/3] manpages: Document fsck.fat new exit codes
+
+Signed-off-by: Ricardo Ungerer <ungerer.ricardo@gmail.com>
+
+Upstream-Status: Inactive-Upstream [lastcommit: 2023, lastrelease: 2021]
+Upstream-Status: Submitted [https://github.com/dosfstools/dosfstools/pull/=
217]
+---
+ manpages/fsck.fat.8.in | 18 +++++++++++++-----
+ 1 file changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/manpages/fsck.fat.8.in b/manpages/fsck.fat.8.in
+index 824a83d..557aa4c 100644
+--- a/manpages/fsck.fat.8.in
++++ b/manpages/fsck.fat.8.in
+@@ -222,13 +222,21 @@ Display help message describing usage and options th=
en exit.
+ .\" ---------------------------------------------------------------------=
-------
+ .SH "EXIT STATUS"
+ .IP "0" 4
+-No recoverable errors have been detected.
++No errors
+ .IP "1" 4
+-Recoverable errors have been detected or \fBfsck.fat\fP has discovered an
+-internal inconsistency.
++Filesystem errors corrected
+ .IP "2" 4
+-Usage error.
+-\fBfsck.fat\fP did not access the filesystem.
++System should be rebooted
++.IP "4" 4
++Filesystem errors left uncorrected
++.IP "8" 4
++Operational error
++.IP "16" 4
++Usage or syntax error
++.IP "32" 4
++Checking canceled by user request
++.IP "128" 4
++Shared-library error
+ .\" ---------------------------------------------------------------------=
-------
+ .SH FILES
+ .IP "\fIfsck0000.rec\fP, \fIfsck0001.rec\fP, ..." 4
+--
+2.25.1
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb b/meta/reci=
pes-devtools/dosfstools/dosfstools_4.2.bb
index 175fa265ef..86fb68f664 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.2.bb
@@ -10,11 +10,12 @@ LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae50=
4"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
-          "
+           file://source-date-epoch.patch \
+           file://0001-fsck.fat-Adhere-to-the-fsck-exit-codes.patch \
+           file://0002-manpages-Document-fsck.fat-new-exit-codes.patch \
+           "
 SRC_URI[sha256sum] =3D "64926eebf90092dca21b14259a5301b7b98e7b1943e8a201c7=
d726084809b527"
=20
-SRC_URI +=3D "file://source-date-epoch.patch"
-
 inherit autotools gettext pkgconfig update-alternatives github-releases
=20
 EXTRA_OECONF =3D "--enable-compat-symlinks --without-iconv"
--=20
2.34.1


