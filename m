Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA76C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 19:00:11 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.47])
 by mx.groups.io with SMTP id smtpd.web10.5206.1708110006840751735
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 11:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=FFANPXMo;
 spf=pass (domain: axis.com, ip: 40.107.21.47, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/llnQVp3CTgiPGt6AOfvPuv1eNZe7+VO2dAju8r+pBhneofRr+OtNAx1SwAJLqz237twJZmicW1zjMTgNojxffEmpk9Qsf064PqTRXl5KDD0IhTVwKgRqilQSa+SkWBkD13DsaRJGakaRNrsKWGnchnhwcerIePcnU3GYOhkum5DfH+QVHyoNrpoWD4cpCoZqixcQvXco+/qaXrRiQ0/BWBbfnW2O1KvYiMFOhntqQxImtw2Vv9IFWYPf6l0BetVdXepFFkvef+nDCI3tKUAquZjJZ/RrvEU8oUlDMkeaqGSgS8Jm32AmyzB93VoICDQbvaRyDJLoConvpSuIF9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5d8M/L8/PK9c1gtxoMLKX49i1JAdsrNeXKArR30d0w=;
 b=DQYeEpc5KGYvKbEHQ+Egdphbo36ienAQrfA0oGusb0C9rnISiq64e2G6P1ML5cvQyxmE6I6PYAGUiVqIwO2wz6/YVd7RyHZc6ATtqEfZtI/WJxm+Flrba7oBypSRN4KpkL7lqSGtD5X5b9+SNIg30Z5ilo45TTNMtZcPNJe2vuIoHyKWIqux0IHNWVqh9zPjEuWN0f+hFX1WqVPt4kfcnH2/v2vShkCdOZ6S/5mFoaST3+n7JTcIRxUUAuumLrA5nKOaDryG+e+F1xFoeeVMqm6EFLefvtpxuRInMKAm3rcDH6LThEX2ytGNKlVs+sCZPvlFCKF91Aouk83dFDzUKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5d8M/L8/PK9c1gtxoMLKX49i1JAdsrNeXKArR30d0w=;
 b=FFANPXMoCBtsxrZRlg0ktx2nsRRTYfj8uVoDuSAx7ukMdisNLtoZ/xPsY2CA4+5+uVGj7IdgrRDR7Js0niBc8o1V6ANglXeLUPdNfY4sLj8yaC+PzC0/MzGX8sqfDwwOkznvcvXXm+SEuJdI426Z1gWuj1SUGvxjeRxlA70ljgI=
Received: from AS4PR09CA0019.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::10)
 by PR3PR02MB6153.eurprd02.prod.outlook.com (2603:10a6:102:64::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Fri, 16 Feb
 2024 19:00:03 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::c6) by AS4PR09CA0019.outlook.office365.com
 (2603:10a6:20b:5d4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Fri, 16 Feb 2024 19:00:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 19:00:03 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Feb
 2024 20:00:02 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 16 Feb 2024 20:00:02 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id ADE8A1493F
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 20:00:02 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 41GJ02hG2607014
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 20:00:02 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 41GJ02lT2607013
	for openembedded-core@lists.openembedded.org; Fri, 16 Feb 2024 20:00:02 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/7] lib/oe/patch: Make extractPatches() not extract ignored commits
Date: Fri, 16 Feb 2024 19:59:52 +0100
Message-ID: <20240216185956.2606978-3-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240216185956.2606978-1-pkj@axis.com>
References: <20240216185956.2606978-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA2:EE_|PR3PR02MB6153:EE_
X-MS-Office365-Filtering-Correlation-Id: 5675c64a-4596-4f1c-6228-08dc2f217ba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WIxUA0bXT+rxOYtY7ahCvkc/qvP1xeval9lvPSqQs066x2Q/8rNATU9SwKqYXS66YdO7AloLY6cWoFdkmtl0xYBYZZ5owsGBG5knKIc9t+bcSEYIJdBZ2tq9aLfneJpjiVGKcH625/qsX7tOFvAishth55l3GT/0rtfR0N02H577qeppbtMJaL8q165G7Wz46OTucJT3uEhXfS5ZNrYuqhLzXSt518RMWbL14SOIXjir6ZcO7Yfe+SB/Es3ti16DiQpBEeL6z6GJmSxnuc8eoa0mEOTHA2zCZOJ8Kndu0WreyMlbB+b0wUcgxRJafeZ6jIX34DGoOdkAW2pR9ldH8gjfFUlWrFd8myeFTvMZpGD12JR2xTOO7dqMBaK1kmT37a69PIw8MMg3O1pCfztR6fgcEFtdsMCdE61+DwCJc2QOzvjqfoCTXsPW5f1QkXZKQ05kZkqaYZABYTtBYr3QjGBR2zbKDpEo7OHJdFKCPxo/5gPPd89R8GSIqMeMi5UXRvVThfSq91ioysl55c5NwzOQC2dPAAYzjXbBGF/iDkIMCaLLnDqQc5XnC3fEJNaruJ1qafNs9Vm4ONFcDjye/7WqPxOqePA+N7EVuF9zggPYR2Hf8O/u/GYUSfJkrLQO6CP+FZPuE24F6XEdTe/ooA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799012)(186009)(64100799003)(82310400011)(36860700004)(451199024)(40470700004)(46966006)(6666004)(356005)(81166007)(82740400003)(41300700001)(30864003)(2906002)(26005)(70206006)(42186006)(478600001)(966005)(6916009)(316002)(70586007)(336012)(2616005)(1076003)(83380400001)(426003)(5660300002)(36756003)(8676002)(8936002)(19627235002);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 19:00:03.4226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5675c64a-4596-4f1c-6228-08dc2f217ba6
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 19:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195796

If a commit is marked with "%% ignore" it means it is used by devtool to
keep track of changes to the source code that are not the result of
running do_patch(). These changes need to actually be ignored when
extracting the patches as they typically make no sense as actual patches
in a recipe.

This also adds a new test for oe-selftest that verifies that there are
no patches generated from ignored commits.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../0055-Add-cstdint-for-uintXX_t-types.patch | 38 +++++++++++
 ...099-cmake-Pass-PROBE_NAME-via-CFLAGS.patch | 29 +++++++++
 .../sysdig/sysdig-selftest_0.28.0.bb          | 64 +++++++++++++++++++
 meta/lib/oe/patch.py                          | 16 ++---
 meta/lib/oeqa/selftest/cases/devtool.py       | 46 +++++++++++++
 5 files changed, 185 insertions(+), 8 deletions(-)
 create mode 100644 meta-selftest/recipes-extended/sysdig/sysdig-selftest/0=
055-Add-cstdint-for-uintXX_t-types.patch
 create mode 100644 meta-selftest/recipes-extended/sysdig/sysdig-selftest/0=
099-cmake-Pass-PROBE_NAME-via-CFLAGS.patch
 create mode 100644 meta-selftest/recipes-extended/sysdig/sysdig-selftest_0=
.28.0.bb

diff --git a/meta-selftest/recipes-extended/sysdig/sysdig-selftest/0055-Add=
-cstdint-for-uintXX_t-types.patch b/meta-selftest/recipes-extended/sysdig/s=
ysdig-selftest/0055-Add-cstdint-for-uintXX_t-types.patch
new file mode 100644
index 0000000000..e564958dad
--- /dev/null
+++ b/meta-selftest/recipes-extended/sysdig/sysdig-selftest/0055-Add-cstdin=
t-for-uintXX_t-types.patch
@@ -0,0 +1,38 @@
+From 3d076ea588eb3c7f334133b4c31172a14beadf5b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 2 Feb 2023 20:18:27 -0800
+Subject: [PATCH] Add <cstdint> for uintXX_t types
+
+gcc 13 moved some includes around and as a result <cstdint> is no
+longer transitively included [1]. Explicitly include it
+for uintXX_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Submitted [https://github.com/falcosecurity/libs/pull/862=
]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ userspace/libsinsp/filter/parser.h | 1 +
+ userspace/libsinsp/filter_value.h  | 1 +
+ 2 files changed, 2 insertions(+)
+
+--- a/userspace/libsinsp/filter/parser.h
++++ b/userspace/libsinsp/filter/parser.h
+@@ -18,6 +18,7 @@ limitations under the License.
+ #pragma once
+=20
+ #include "ast.h"
++#include <cstdint>
+=20
+ //
+ // Context-free Grammar for Sinsp Filters
+--- a/userspace/libsinsp/filter_value.h
++++ b/userspace/libsinsp/filter_value.h
+@@ -18,6 +18,7 @@ limitations under the License.
+ #pragma once
+=20
+ #include <string.h>
++#include <cstdint>
+ #include <utility>
+=20
+ // Used for CO_IN/CO_PMATCH filterchecks using PT_CHARBUFs to allow
diff --git a/meta-selftest/recipes-extended/sysdig/sysdig-selftest/0099-cma=
ke-Pass-PROBE_NAME-via-CFLAGS.patch b/meta-selftest/recipes-extended/sysdig=
/sysdig-selftest/0099-cmake-Pass-PROBE_NAME-via-CFLAGS.patch
new file mode 100644
index 0000000000..903ccdf36a
--- /dev/null
+++ b/meta-selftest/recipes-extended/sysdig/sysdig-selftest/0099-cmake-Pass=
-PROBE_NAME-via-CFLAGS.patch
@@ -0,0 +1,29 @@
+From ed8969a233adb6bf701de96d0fd0570e5ddcc787 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 21 Mar 2022 19:35:48 -0700
+Subject: [PATCH] cmake: Pass PROBE_NAME via CFLAGS
+
+This helps compliation of driver code where its calling modprobe on the
+given kernel module via system() API
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7dceb7ae..e156c36f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -149,6 +149,7 @@ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
+ 	if(NOT DEFINED PROBE_NAME)
+ 		set(PROBE_NAME "scap")
+ 	endif()
++	add_definitions(-DPROBE_NAME=3D"${PROBE_NAME}")
+=20
+ 	set(DRIVERS_REPO "https://download.sysdig.com/scap-drivers")
+ =09
+--=20
+2.35.1
+
diff --git a/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.b=
b b/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb
new file mode 100644
index 0000000000..e114f465a0
--- /dev/null
+++ b/meta-selftest/recipes-extended/sysdig/sysdig-selftest_0.28.0.bb
@@ -0,0 +1,64 @@
+SUMMARY =3D "A New System Troubleshooting Tool Built for the Way You Work"
+DESCRIPTION =3D "Sysdig is open source, system-level exploration: capture =
\
+system state and activity from a running Linux instance, then save, \
+filter and analyze."
+HOMEPAGE =3D "http://www.sysdig.org/"
+LICENSE =3D "Apache-2.0 & (MIT | GPL-2.0-only)"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df8fee3d59797546cffab04f3b88b2d4=
4"
+
+inherit cmake pkgconfig
+
+#OECMAKE_GENERATOR =3D "Unix Makefiles"
+JIT ?=3D "jit"
+JIT:mipsarchn32 =3D ""
+JIT:mipsarchn64 =3D ""
+JIT:riscv64 =3D ""
+JIT:riscv32 =3D ""
+JIT:powerpc =3D ""
+JIT:powerpc64le =3D ""
+JIT:powerpc64 =3D ""
+
+#DEPENDS +=3D "libb64 lua${JIT} zlib c-ares grpc-native grpc curl ncurses =
jsoncpp \
+#            tbb jq openssl elfutils protobuf protobuf-native jq-native va=
lijson"
+RDEPENDS:${PN} =3D "bash"
+
+SRC_URI =3D "git://github.com/draios/sysdig.git;branch=3Ddev;protocol=3Dht=
tps;name=3Dsysdig \
+           git://github.com/falcosecurity/libs;protocol=3Dhttps;branch=3Dm=
aster;name=3Dfalco;subdir=3Dgit/falcosecurity-libs \
+           file://0055-Add-cstdint-for-uintXX_t-types.patch;patchdir=3D./f=
alcosecurity-libs \
+           file://0099-cmake-Pass-PROBE_NAME-via-CFLAGS.patch \
+           "
+SRCREV_sysdig =3D "4fb6288275f567f63515df0ff0a6518043ecfa9b"
+SRCREV_falco=3D "caa0e4d0044fdaaebab086592a97f0c7f32aeaa9"
+
+SRCREV_FORMAT =3D "sysdig_falco"
+
+S =3D "${WORKDIR}/git"
+
+EXTRA_OECMAKE =3D "\
+                -DBUILD_DRIVER=3DOFF \
+                -DMINIMAL_BUILD=3DON \
+                -DUSE_BUNDLED_DEPS=3DOFF \
+                -DCREATE_TEST_TARGETS=3DOFF \
+                -DDIR_ETC=3D${sysconfdir} \
+                -DLUA_INCLUDE_DIR=3D${STAGING_INCDIR}/luajit-2.1 \
+                -DFALCOSECURITY_LIBS_SOURCE_DIR=3D${S}/falcosecurity-libs =
\
+                -DVALIJSON_INCLUDE=3D${STAGING_INCDIR}/valijson \
+"
+
+#CMAKE_VERBOSE =3D "VERBOSE=3D1"
+
+FILES:${PN} +=3D " \
+    ${DIR_ETC}/* \
+    ${datadir}/zsh/* \
+    ${prefix}/src/*  \
+"
+# Use getaddrinfo_a is a GNU extension in libsinsp
+# It should be fixed in sysdig, until then disable
+# on musl
+# Something like this https://code.videolan.org/ePirat/vlc/-/commit/01fd9f=
e4c7f6c5558f7345f38abf0152e17853ab  is needed to fix it
+COMPATIBLE_HOST:libc-musl =3D "null"
+COMPATIBLE_HOST:mips =3D "null"
+COMPATIBLE_HOST:riscv64 =3D "null"
+COMPATIBLE_HOST:riscv32 =3D "null"
+COMPATIBLE_HOST:powerpc =3D "null"
+COMPATIBLE_HOST:powerpc64le =3D "null"
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index d5ad4f3dc1..70cdb1d9c0 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -474,9 +474,9 @@ class GitApplyTree(PatchTree):
                 out =3D runcmd(["sh", "-c", " ".join(shellcmd)], os.path.j=
oin(tree, name))
                 if out:
                     for srcfile in out.split():
+                        outfile =3D os.path.basename(srcfile)
                         for encoding in ['utf-8', 'latin-1']:
                             patchlines =3D []
-                            outfile =3D None
                             try:
                                 with open(srcfile, 'r', encoding=3Dencodin=
g, newline=3D'') as f:
                                     for line in f:
@@ -484,7 +484,8 @@ class GitApplyTree(PatchTree):
                                             outfile =3D line.split()[-1].s=
trip()
                                             continue
                                         if line.startswith(GitApplyTree.ig=
nore_commit_prefix):
-                                            continue
+                                            outfile =3D None
+                                            break
                                         patchlines.append(line)
                             except UnicodeDecodeError:
                                 continue
@@ -492,12 +493,11 @@ class GitApplyTree(PatchTree):
                         else:
                             raise PatchError('Unable to find a character e=
ncoding to decode %s' % srcfile)
=20
-                        if not outfile:
-                            outfile =3D os.path.basename(srcfile)
-                        bb.utils.mkdirhier(os.path.join(outdir, name))
-                        with open(os.path.join(outdir, name, outfile), 'w'=
) as of:
-                            for line in patchlines:
-                                of.write(line)
+                        if outfile:
+                            bb.utils.mkdirhier(os.path.join(outdir, name))
+                            with open(os.path.join(outdir, name, outfile),=
 'w') as of:
+                                for line in patchlines:
+                                    of.write(line)
         finally:
             shutil.rmtree(tempdir)
=20
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index dd3a5e9b5c..abc85c90a7 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2227,6 +2227,52 @@ class DevtoolUpgradeTests(DevtoolBase):
         if files:
             self.fail('Unexpected file(s) copied next to bbappend: %s' % '=
, '.join(files))
=20
+    def test_devtool_finish_update_patch(self):
+        # This test uses a modified version of the sysdig recipe from meta=
-oe.
+        # - The patches have been renamed.
+        # - The dependencies are commented out since the recipe is not bei=
ng
+        #   built.
+        #
+        # The sysdig recipe is interesting in that it fetches two differen=
t Git
+        # repositories, and there are patches for both. This leads to that
+        # devtool will create ignore commits as it uses Git submodules to =
keep
+        # track of the second repository.
+        #
+        # This test will verify that the ignored commits actually are igno=
red
+        # when a commit in between is modified. It will also verify that t=
he
+        # updated patch keeps its original name.
+
+        # Check preconditions
+        self.assertTrue(not os.path.exists(self.workspacedir), 'This test =
cannot be run with a workspace directory under the build directory')
+        # Try modifying a recipe
+        self.track_for_cleanup(self.workspacedir)
+        recipe =3D 'sysdig-selftest'
+        recipefile =3D get_bb_var('FILE', recipe)
+        recipedir =3D os.path.dirname(recipefile)
+        result =3D runCmd('git status --porcelain .', cwd=3Drecipedir)
+        if result.output.strip():
+            self.fail('Recipe directory for %s contains uncommitted change=
s' % recipe)
+        tempdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */worksp=
ace')
+        result =3D runCmd('devtool modify %s %s' % (recipe, tempdir))
+        self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' =
% (recipedir, recipe, recipe, os.path.basename(recipefile)))
+        self.assertExists(os.path.join(tempdir, 'CMakeLists.txt'), 'Extrac=
ted source could not be found')
+        # Make a change to one of the existing commits
+        result =3D runCmd('echo "# A comment " >> CMakeLists.txt', cwd=3Dt=
empdir)
+        result =3D runCmd('git status --porcelain', cwd=3Dtempdir)
+        self.assertIn('M CMakeLists.txt', result.output)
+        result =3D runCmd('git commit --fixup HEAD^ CMakeLists.txt', cwd=
=3Dtempdir)
+        result =3D runCmd('git show -s --format=3D%s', cwd=3Dtempdir)
+        self.assertIn('fixup! cmake: Pass PROBE_NAME via CFLAGS', result.o=
utput)
+        result =3D runCmd('GIT_SEQUENCE_EDITOR=3Dtrue git rebase -i --auto=
squash devtool-base', cwd=3Dtempdir)
+        result =3D runCmd('devtool finish %s meta-selftest' % recipe)
+        result =3D runCmd('devtool status')
+        self.assertNotIn(recipe, result.output, 'Recipe should have been r=
eset by finish but wasn\'t')
+        self.assertNotExists(os.path.join(self.workspacedir, 'recipes', re=
cipe), 'Recipe directory should not exist after finish')
+        expected_status =3D [(' M', '.*/0099-cmake-Pass-PROBE_NAME-via-CFL=
AGS.patch$')]
+        self._check_repo_status(recipedir, expected_status)
+
     def test_devtool_rename(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test =
cannot be run with a workspace directory under the build directory')

