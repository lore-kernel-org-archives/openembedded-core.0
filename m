Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639D3CD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 12:27:00 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7217.1779107211856269505
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 05:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=lGuzMgc3;
 spf=pass (domain: est.tech, ip: 52.101.83.15, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kU+MS5NLxnV0Zc3iJzdpyUVevoKvgWXIek0sZjw4+kZ2gxgmo1fm/O043fiOtKjTANIXMKN6WvDQ8ktftCSgBP9e79aJ8/AVLZNksha3smiCec2umtpHjdipxrraJ+NgSbBjFbBF7RKmuMDLxQZ3gP1w6sT1IQzr5Nty/XSTWKamPWAUGSNjW/39Uy580vP0QxJnKlzsGBgwE/x1lCoQ3IqmXSINH3KEL194cDow+K1yedYEe+aOqltN735OfwVqJ7X00g3Kd+qd1zjyxrIgCZ1dsHn18kVKd3KiLtBJ3SyCNJ4wwhjqwJiJPzVN11hDRZXHvUOEHrzOhp1aItqkoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M4+pSSPE9JcG5WHu1Jr6FU3Rhn9tVTLuh7Dmu0a7XW0=;
 b=JArnpaiiHUwoqvmsnVoqYP8fgH3W256sUuGFOV461PIztfw3fQq0Ceb4lBguEW8j4tJ+V3TzibYFWgsrbLzJtLg2VrtsT2WXWNrWqC6nCgALlN1UchFwOcJM9vmO8/67HdfU8f9myvOTs0NFYV0ze58jkM33Ap+tMmdW4SZkZ2ovYq4y292kUXwhRvWnI5XVR5czzEMNUk4rVSFXHnSTDY45kJ4pI+eMXh6q6YYDyLKRgeoBMt4COJ2FHcdGrXw07/eAUapeE0O5KokkNBh9CPWfEa7a4i3Q9Tje0/hOUJhUCz8DgfelXODujFkebgNM1oMYLjIasF0wHTxrvJfY+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4+pSSPE9JcG5WHu1Jr6FU3Rhn9tVTLuh7Dmu0a7XW0=;
 b=lGuzMgc3IiB5Dlc47+2s1+FYpDWRpbzKtQpp0pCdAtpKQDo3F4q+iPtD6lsAuggWA5YVJ/r8kv1e8XkHb7T646eK0e2pnKyDLvgTxmr56pd+vfAUolwdQw7v+jZwDuYyOL7uYULzhe1JMVYLQJ8Di4WQriuc51ylszF64+T+FDX8ij3zXxmdZ5CWMoFpICsWfoigQTmjfmF8aOw5zVXNxwF/fIQRQSahjvHL1Qj4xKv/M2FkJDz4uskRV4p9Yw3ZkJrS8j/XK3cwG3oRJhQ87Jf/CJAcP+rHfn81DqcqxxnsrfFhrFDSDZYwAXlZO47W5WXigkwh28zDHcWY5i+LiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AM4P189MB3641.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.15; Mon, 18 May
 2026 12:26:47 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 12:26:47 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] libxslt: add ptest support
Date: Mon, 18 May 2026 14:26:42 +0200
Message-ID: <20260518122642.31494-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506092057.27057-1-pratik.farkase@est.tech>
References: <20260506092057.27057-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0028.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::33) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|AM4P189MB3641:EE_
X-MS-Office365-Filtering-Correlation-Id: 379c22a7-7db4-4e12-e0df-08deb4d8ba8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|13003099007|56012099003|18002099003|12006099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	+v+Z8QhHzT0nXSbEpgpvWRDSamy0xaJQo2fILOxAf7ZVBNX6wk35TZtzLYDVkbDUo7qIt/0IkKgLBq6OSE+QBkRgFm5yQxJ4r/Js3cLwFix20w5k58ay6BI0fIxtUKB1bEMd0+Fns/Sqruya2t61PQf87bDlEAJx7J5HmQ8H/wt7bbxCmhChpDw+mXpRQkKYcOUKRiAqYJtywPTaVS8KL5EAdVzEmegtcn7cOpfPiyoQfJhdpJ3i3P/0tER95XE2ulw81IDskWr7vVPkunkaOJGGk4rYZ64UCvgxKid6nog+QKJHYQv3E5oo169PwQYm4jRC5xVd4FwnaLXJ1Cuw5olWli9acJgLZL+9RYYZJdfmT+plmof7dBFi8lOjnI5vbm8/ZU8Izm39+t7sUOr+9gddWs2cU20ZT96tgBWMsbRjKIhGYlTOguegnnE3a7kFoESFaPVInzX2jbDY9GcFadt0vUcJNPEp6EaIfqqGri9dAJp42cYO6Dzz08umf2wMFj66GW16X2FUvVIyOyPEzyImiFsiLZZ68PsSthS3GzE3Ejo41x3De5qmH2RjpXtU3y6X/L4U4z+Ho5sJkXx3FoQV4Hb8wmKaN0PV8x4r7fjyxjxWxU9a2XJUW2oiOA5Bgn666ArsvWYy4HnbZmqF6ODn2FkGtl7TyBMHVkiWCb946ZEFFv+XSCBELDc4JEByJFxpIAD7KMQ5AN3Vf29RVg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(13003099007)(56012099003)(18002099003)(12006099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GvH/TF/WtQWY6SV5aASW11mtHtaBZcUF+xzfGgHyro7wlDTMY4DX5rZQX6bz?=
 =?us-ascii?Q?fQ0u6b930xUE7quzPuOLdWjGKbTJAJgRaiQnAV0K/2kHQ4kGlo10BM4DvkbE?=
 =?us-ascii?Q?9z0XMncCptgYey6wPaWjDp1G6QYN6ClUMZzBS9xG9W6FEGJ5X0tgD6549vt7?=
 =?us-ascii?Q?SbLhhjjbgFlmqWKpFd5JhlNnN1IUha/5PEVZ2V6ARqFtvbKZNilHn2vZPOq1?=
 =?us-ascii?Q?Zca83iHxeb6Y+PA5gkvTHD6PeWhNTLfJo31Jo9Ruso8VLjO/PqxCalwoe7Cf?=
 =?us-ascii?Q?zq88yFu9GD62rP+GcOeQI4ld2Ha5+j0V1KMms5FKp+t5Cc3hN6fxBImagYhB?=
 =?us-ascii?Q?ULnJuBK/Xv2W6ZuOqvdsqKfnkyZHpINQpnFkd2SFGTEmVJmA5WCqzy2x1miN?=
 =?us-ascii?Q?kLOzT3YMGMidbcAZN4dLgE/u4SHqTkXZegl++FzOSvXzcCMK2TEXD5BoGCjU?=
 =?us-ascii?Q?PltKmFPAzxbCeI6AdH97K5IaQ/iyBTda5fTh7JP/Uec5fjDgyvKTIZGYG2ki?=
 =?us-ascii?Q?4cxN/NJHzI+5bwWF7NS6D+hFB/76HU3SWHgvS3iOTY4ujSs59bvRAXdAJTB5?=
 =?us-ascii?Q?eAej1NFYUK+ROP3lzbJIdAysemOwaLaWJFKWD1p2cd7JrD1aPzrFLEqsiWlb?=
 =?us-ascii?Q?dR0e1q5jAm2uI7L4XslMSCbfJzyecdG193A5jpkHyTxaaO4ZGRks5kZ/4bJQ?=
 =?us-ascii?Q?WzDcZh3puMjjjzEJzeFaCkEKecIqLa980a4872btXPicm00tzkjZd6qM7Rsi?=
 =?us-ascii?Q?kQfhIb1DSm4VawY1r2UpgfboiUVlvjZxuNVUIZu8mQjicjIGVvH8gqEM/4iM?=
 =?us-ascii?Q?1juoXGs37RxIC81wbZczeoEv2BF0V2Lw4Zi2aeMygk7Q0DK+s+CGVaoLwHWq?=
 =?us-ascii?Q?H2s87Zfc9yLRfcuolRFK6orNen7uOd+zSjfTcvVpZtRFvFg6cS3dHQ+zMxmq?=
 =?us-ascii?Q?eFMrVMtFfgHxabdVsjyjM13dhz1qVtSRCuvBhWNCTpuiX1fZKBffCBkrsrBm?=
 =?us-ascii?Q?F69J+NBOCSWeXz0tO/CgprbYXiGIY3XnUMb0REdG5BGGz9ijyh9dESEMbdCY?=
 =?us-ascii?Q?MECQuwFMnevq50a8baa47FbRSmIOOGe8hn8hNFixT7CZ3o35PBXAOjBcWmMh?=
 =?us-ascii?Q?djEtHw9g6mWLTXLyaBmD1PvAvxpjF8xyYkzn101PsTvKk5secorWu1F6DGUi?=
 =?us-ascii?Q?7XriIVHg/t6ckZGurxdIEyzif/p6DssML/plVjFt0qmRvQ5NjLZaoRmWZwdY?=
 =?us-ascii?Q?K34kfwuifMkTqIB2w58CiEalik+95eCayYMFRyEG719ytMaVHzOVtwjaWJO3?=
 =?us-ascii?Q?JY9tzblHVx91+fwHd36pk9PIs+L7EkKvJyZarFGutUP0V2gtl412FLgbeCp2?=
 =?us-ascii?Q?7UULuJbIL9KOufweEwk2bO4lS3js3p3Nye9/GPF/dkPPwkDTLf3KzkAE/FrY?=
 =?us-ascii?Q?EsR+keRcAeisppqazp4NuFf63Fs76bewRfpL4QUDjf92XkcVAtLHYWsG8PHl?=
 =?us-ascii?Q?PSRs+YyjZTGdYf4jngrjOGiA59bmexztxVYYB+c57SzU9jihk2M2ayo1SCm1?=
 =?us-ascii?Q?Fi6WNyda9jukyv5BsYB3Vj06emv+Zzr12PLrUVAmKHcJz+hVjzzEfotLlZ1E?=
 =?us-ascii?Q?jumypyFckqXPEL8Io7MnDCNYsOPyL3S1tfCgskoaZZvEutppYBuEsNOfYH7u?=
 =?us-ascii?Q?SwtsE1Z5H+sGpoM4Vj9rt3B+bXBC0vZAIGXPX02hJ8ShbaBWGhWWjCQmnX5r?=
 =?us-ascii?Q?WLCf7j1UKw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 379c22a7-7db4-4e12-e0df-08deb4d8ba8a
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 12:26:47.0691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxuV/HSzOYY4uUN7khbsfn642F4+uMN/NlmGs2q02AKKgEL6TmAf28eamtBcauKrEBZ4cp7Pd7+9BHskTfbQ2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3641
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 12:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237237

Add ptest support for libxslt, running the upstream runtest binary which
validates XSLT transformations across REC conformance, general, encoding,
documents, numbers, keys, namespaces, extensions, reports, and EXSLT
function tests.

NOTE: The encoding/bug-146 test is excluded as it requires windows-1251 ico=
nv
support not available in minimal images.

Tested on qemux86-64 with ptest-runner: 747 tests, 0 errors.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
Changes in v2:
- Simplify run-ptest: run test binary directly instead of capturing
  and re-printing output
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-support/libxslt/libxslt/run-ptest | 11 ++++++++
 .../recipes-support/libxslt/libxslt_1.1.45.bb | 26 +++++++++++++++++--
 3 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-support/libxslt/libxslt/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 68189ec2a3..8b01284b2a 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -57,6 +57,7 @@ PTESTS_FAST =3D "\
     libxml-simple-perl \
     libxml2 \
     libxmlb \
+    libxslt \
     libyaml \
     logrotate \
     lua \
diff --git a/meta/recipes-support/libxslt/libxslt/run-ptest b/meta/recipes-=
support/libxslt/libxslt/run-ptest
new file mode 100755
index 0000000000..c321fdc606
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/run-ptest
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: MIT
+
+cd "$(dirname "$0")/tests" || exit 1
+
+./runtest 2>&1
+if [ $? -eq 0 ]; then
+    echo "PASS: runtest"
+else
+    echo "FAIL: runtest"
+fi
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.45.bb b/meta/recipes-=
support/libxslt/libxslt_1.1.45.bb
index 449ea2dd24..028fa0e5bf 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.45.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.45.bb
@@ -13,7 +13,9 @@ LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D0cd9a07afbeb=
24026c9b03aecfeba458"
 SECTION =3D "libs"
 DEPENDS =3D "libxml2"
=20
-SRC_URI =3D "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.=
tar.xz"
+SRC_URI =3D "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.=
tar.xz \
+           file://run-ptest \
+           "
=20
 SRC_URI[sha256sum] =3D "9acfe68419c4d06a45c550321b3212762d92f41465062ca4ea=
19e632ee5d216e"
=20
@@ -25,7 +27,7 @@ S =3D "${UNPACKDIR}/libxslt-${PV}"
=20
 BINCONFIG =3D "${bindir}/xslt-config"
=20
-inherit autotools pkgconfig binconfig-disabled lib_package multilib_header
+inherit autotools pkgconfig binconfig-disabled lib_package multilib_header=
 ptest
=20
 do_configure:prepend () {
 	# We don't DEPEND on binutils for ansidecl.h so ensure we don't use the h=
eader.
@@ -56,3 +58,23 @@ FILES:${PN} +=3D "${libdir}/libxslt-plugins"
 FILES:${PN}-dev +=3D "${libdir}/xsltConf.sh"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/tests runtest
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/tests/runtest ${D}$=
{PTEST_PATH}/tests/
+
+    for d in general REC REC2 documents encoding exslt extensions \
+             keys namespaces numbers plugins reports; do
+        if [ -d ${S}/tests/$d ]; then
+            cp -r ${S}/tests/$d ${D}${PTEST_PATH}/tests/
+        fi
+    done
+
+    # Remove encoding test that requires windows-1251 iconv support
+    rm -f ${D}${PTEST_PATH}/tests/encoding/bug-146.*
+}
--=20
2.43.0


