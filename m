Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52D5F531DC
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 22:29:58 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5087.1776119392778725856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 15:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NE7FlEWl;
 spf=pass (domain: est.tech, ip: 52.101.70.6, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJQYtGyAI8NF3SVsCuzdQxOrUp11CAnn7HzBF+Y3xpeOIvXBJQ8mPmJW9sE5tPoMyxOWWdwvbGQGRSTrp7RH9ZMrsNKmhRlFd1rcsB4jXjgiiMQtFWEjs6AXGPwtAwd0fg6E7/SEKrM54pBO6WuCoxMz18ZBzeWdcWafn660VLD1k/H416yfMTPZ6+NIgBWNqt5j6YkxwyNK51KpDU3avkB/tKRJ25kVisX3HpFY9HqW+emSUnTf96gcJ+HwV9GQ6dc9td0j2LHg7+9zpP+ciAOV9fdQfP3mZnZfoDFLMFbO7nrhcA4xFlIiOQKFcDL7GOeFPi7m2fCQE/r3Fdvu2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLNEkcMolUrw6eLWBJmSyRECzfa0hsAb9tu7Fk+1nFk=;
 b=PQT/PeygKb7VfHIEXiF83NCBd1iKiowPvgFYmQAdCh3yO42eaoAh/gbHqQgStDPauOZpyzpLG4CAgetrhItNR8Ls3Mk2G5K0k2bRRHAmq0s/fxoVeSN8BUJJ6aj5kD0gvQ2G6rkSjW8c5gOXa0AhgzOPdNohwSLmXpFcjz6vFaxVlseaiz/ruQFAORL7XOnnAjQR+Nfskorvh2wt+SmkaA8Byi2SfXIkwyOlY0WW9DfAD0oRSrX4bJPcBR/CT/9nTPFydmMYUyd/f0PdR7pjl6ItuL0Isgzn1rgrbCntkdXShrxHh58vdPjBktVG5BR3f3vAbgjvwxS2zqwQNT5eRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLNEkcMolUrw6eLWBJmSyRECzfa0hsAb9tu7Fk+1nFk=;
 b=NE7FlEWlud2rVHocd8dKm3N+slmosRp5473KPjz/IBHA+e93pZ8WhxKYFxq5Tva66xFbi2O3gsNNByzVu2ETl4ZI7JKycmWZfSkso7LeyFrtzCWSUhGu6/XmkBbPBk9WYcXoomoj0S69iz2UaYqWwG6ElEKOlYPl8bS+0bHHkt3XtnUhbBzBcYQa+ad5zRTcTPVKAW0gI/Vwu+zdTHqWBbLCcSfl+JcqEhXH3KBL2KjA7aBmB/SzaGyWi02aJ2otGdcNqEhh/ANdAnIBJ7cZ9WqfHhGRg8VuER2PvGHo7AS4HMm4c+TiJs/N0i7f/gTlRJluVoPzSAe+OJDNBW+YaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a9e)
 by GVXP189MB1983.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 22:29:47 +0000
Received: from DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
 ([fe80::48a0:eb8a:db1e:38bb]) by DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
 ([fe80::48a0:eb8a:db1e:38bb%7]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 22:29:47 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v5] go: add ptest support
Date: Tue, 14 Apr 2026 00:29:43 +0200
Message-ID: <20260413222943.26238-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305110200.17834-1-pratik.farkase@est.tech>
References: <20260305110200.17834-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P195CA0015.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::33) To DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::a9e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PPFB77F8FB19:EE_|GVXP189MB1983:EE_
X-MS-Office365-Filtering-Correlation-Id: cb241bd2-8b70-40d2-7190-08de99ac2b1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	EbS5sp9K5eUSi/fmLKqaXdFAlXeJXxnWWWP1YYB6ErZ5ZI2mYELkOGPLSRrYUQaMeqxj5BKZiwispIR2HLsKseGdy767OeDyXQVw+tWPfGuQDcbX6ccM453XxiQd33rN/Jg1RX5v1SKj/EvAZnv6+zvdOP6znTEl51zjOy6KRHcdAEY1f4cwsbhmT923ywiwunjEE1ZvrwrUC8K9nuEEhH/+sRw1kfwhSXntnMCCmapMlZaGxtiuS6nIcl1icJKIECu+O1Io+YS+jZlgu+djoP7+g7RZbfN5UCAlufvdwr83iQclxqVgOOZkrR570boIS7GCLYKrX+kJySSYaly+yW50HHiXI/Cmjhf0Re9G0NvgBHslPi1Ngd/HYruauB4IF9TCv2wXnZxg5PRixWIdKw5shwlUi5ytE1VJMMI0fFS0coWgxQP7z2KHIi0AsV1izTrH9XPVIi3xUFORe7GdhiITKFVVmO2rvYPVWajIc58pqB/PHqdvIm0QStK78rGF7ltx5ZBCNGHDSJrhZucHy/2k4RmrWaMkaLJ5o2wTotcR6eKGMI5EB1c3JIYtGBHtpXPXE/5KiNK63fqUobT0IlA7wVmuA7m+ZlZkYGvjKYlSKx6PI2LIqlyckMhkB+rEBnHJ+DVyzxMXCLBiWpi4L0d2gQ2qJwJpO2ce8I833KQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hAKucmtqkJMqpkHSfM8/cNYxh66NM/u6OjOc9smZQL5Mi+1Z9r2t14isd9N1?=
 =?us-ascii?Q?Fs1eNPdwFNBhS6KbByyeMHbDkzbDRes+hkjWpVycSlIRjoauyWZ+4sFz5hJ1?=
 =?us-ascii?Q?jcyzgBgULeVYzebck4z3wp46D4twB0ANEbGxYU/6yooFN69vIkQ9UItRE+U6?=
 =?us-ascii?Q?2ezeDQbUsF9o3FZyuUmHGWfNfemnpoPnGYPjvjqOsIfw9kh+VcIxYD07bQCD?=
 =?us-ascii?Q?KRImsFaQetj4ThRRGOLqgZ4UGM/FCsctFwCT+6oNqTYHxZkVxwWglNhV8cps?=
 =?us-ascii?Q?i/KVoJBk02V2TTC4VnAznKMy+3pznjA+thOKhAMUyPl0rNkX/nYBaHMe3YsQ?=
 =?us-ascii?Q?Drwk9lpP77nKdCiM8xViKovowbA8RSdWHU5kZCE035n8a/3R17NUrryaEBtI?=
 =?us-ascii?Q?0z4FGFFlnRTkgItv7h52xtCjWbUAVeJHEJpjO2Un4pDvOkXUStB1JWzuvSHW?=
 =?us-ascii?Q?dK7gdqh2QDuWeFl0JlFR+xHAWO4Lkd/pOO2BED3hSSnfiTFwm20RAQLmJpJe?=
 =?us-ascii?Q?fQtcSB5tvv45gE+SVCmiUNVq2hQD0keACoAf+mre88hSKwWjrDkzPav2sUor?=
 =?us-ascii?Q?D/FN6xN3pZnUeG8HTivIJVZmFCjKdBsczCcTJnOPguxeHj24sj/R054oJxqN?=
 =?us-ascii?Q?MUWlLgPwOFtE7YpYQ95jDwHz1HU3ubPanb6ednoWrqoI6MPDWEZ5bSaXASA6?=
 =?us-ascii?Q?vpWuvjy71dbF07ZdiDTX2J8NG8wlvVE4CmqYP3a4OevlBLw8ODBJzvQBXPwy?=
 =?us-ascii?Q?BHdzNzsWxR9xB0r1JI9mOB0ZvhhpnWTJ0GsqX4MR+1MuqHHe5FJW/SwYc8TK?=
 =?us-ascii?Q?N+JiPC+dD2273uMoFXiewrF3ypvZdwdLX5cbM24TCy1qZnayblABPgT3dRKt?=
 =?us-ascii?Q?yg12L5JW8b7HusN7aDv98hPBaf4ItuwDl6ck3XMXm+27k/ui6TL12swqHjTA?=
 =?us-ascii?Q?WWW/zh6BMHvQ9MOErfMEOIyx5lMCBS8ipS8Tir3FL23/gB/KXDr4IzcIysV1?=
 =?us-ascii?Q?RSeEBlCmmBQKvI/Fuu/omUKs52qQL14HOYZBzuW8KQ/aDNWWcjspTcfEmz/G?=
 =?us-ascii?Q?a6+OlEyfSRDiFcUnAIOVXItNxR+jcF5jL5X5DFt4RHQu7tuKQP1+Jb3+vL/7?=
 =?us-ascii?Q?rvaSsvEuvPsA0eu85wilxJjwp19a4c9RrVyf9xfjnnt8FwAJEDTomrSvBBmL?=
 =?us-ascii?Q?Fx18K0rZz6/227+VjrztOiqc9OqvM4/Nrzy8h3xkHPa8p7GNkgXHCGIoMyHA?=
 =?us-ascii?Q?namVFY1NKCrgmlDJ+DzT2tqo0V3DG6QegLwFgIoCwc7pCJZSgbd7BESYf4lJ?=
 =?us-ascii?Q?nG5JyEhIa2SXBKqd8BRX4jjyOVIawC0agTa8ec+yqDa2OeVcQpv1AnLLn85p?=
 =?us-ascii?Q?KXDgxMZPiynSXcKV+zfakM1a8t7eykLac0mt9XLTAGI/mJ2SoPmPIQvrOSvy?=
 =?us-ascii?Q?PIXGkXpJj4hurTlRFjqAY09pQItoCGuBsi6ajWKHnnSSLZcYt5baMlwh6nqO?=
 =?us-ascii?Q?eNhZMon88HMwl+tT0wn+4tNloaKpmqvBP6MDC4tUrHyHxtf5YmgDYDoltgcC?=
 =?us-ascii?Q?NoURMjhBjtWLCkVuRslMqem30NTDvIhkQ3ON7UFrbBCvt+GT1Tj79nhXxyUC?=
 =?us-ascii?Q?Nq0ecwR8M2yd2CEbK1DNqksz3aEQGv32SnuYgd3QUVPYKnodcLcdSdC061cT?=
 =?us-ascii?Q?0NKrre1vUWQmX1J2F4rA2rYTnmA2Rt5tMR29X8E9wnAP2OSiGqvEs6HzBbaq?=
 =?us-ascii?Q?UPpTesQXng=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: cb241bd2-8b70-40d2-7190-08de99ac2b1f
X-MS-Exchange-CrossTenant-AuthSource: DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 22:29:47.1538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOm2/xsAhN+YKQmRmZ7AiEa0ahcxQWsZYtddKRoYdh6Z9vvKEYdVqn/c9mmDa24HwAmmUPBDB4LaTirpUm0Ing==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB1983
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 22:29:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235131

Add ptest infrastructure to test the Go standard library.

- Run 'go test -short std' via run-ptest script
- Install source tree and pkg/include headers
- Create VERSION file for architecture detection
- Exclude multi-arch binary testdata to avoid QA errors

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
Changes in v5:
- Add QB_MEM:virtclass-mcextend-go =3D "-m 4096" in core-image-ptest.bb
- Add PTEST_RUNNER_TIMEOUT:virtclass-mcextend-go =3D "4800" for ~66min runt=
ime
- Run full test suite (go list std) with skip list for problematic
  packages in run-ptest

Changes in v4:
- Run only 17 curated packages that work within 1GB RAM constraint
- Test runtime reduced to ~6-7 minutes

Changes in v3:
- Move go from PTESTS_FAST to PTESTS_SLOW (~45min runtime)
  inside ptest-packagelists.inc

Changes in v2:
- Exclude .elf* files to fix QA arch errors on all architectures
- Exclude *-x86-64* files to fix additional arch-specific test binaries
- Tested on x86-64, x86, aarch64, and arm builds
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-core/images/core-image-ptest.bb  |  5 +++
 meta/recipes-devtools/go/go-1.26.0.inc        |  1 +
 meta/recipes-devtools/go/go/run-ptest         | 32 +++++++++++++++++++
 meta/recipes-devtools/go/go_1.26.0.bb         | 27 +++++++++++++++-
 5 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-devtools/go/go/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 1bb7458fc9..c7f79e96b5 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -118,6 +118,7 @@ PTESTS_SLOW =3D "\
     gettext \
     glib-2.0 \
     gnutls \
+    go \
     gstreamer1.0 \
     less \
     libevent \
diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-co=
re/images/core-image-ptest.bb
index c08561296f..166b4ded63 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -10,6 +10,7 @@ HOMEPAGE =3D "https://www.yoctoproject.org/"
=20
 PTESTS =3D "${PTESTS_SLOW} ${PTESTS_FAST}"
 PTEST_RUNNER_TIMEOUT:virtclass-mcextend-python3-cffi =3D "600"
+PTEST_RUNNER_TIMEOUT:virtclass-mcextend-go =3D "4800"
=20
 IMAGE_INSTALL:append =3D " ${MCNAME}-ptest openssh"
=20
@@ -32,6 +33,9 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-tar =3D "1524=
288"
 # python3-numpy-ptest requires a lot of extra space
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-python3-numpy =3D "3048576"
=20
+# golang go-ptest requires extra space
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-go =3D "1524288"
+
 # ptests need more memory than standard to avoid the OOM killer
 QB_MEM =3D "-m 1024"
 QB_MEM:virtclass-mcextend-lttng-tools =3D "-m 4096"
@@ -39,6 +43,7 @@ QB_MEM:virtclass-mcextend-python3 =3D "-m 2048"
 QB_MEM:virtclass-mcextend-python3-cryptography =3D "-m 5100"
 QB_MEM:virtclass-mcextend-python3-numpy =3D "-m 4096"
 QB_MEM:virtclass-mcextend-tcl =3D "-m 5100"
+QB_MEM:virtclass-mcextend-go =3D "-m 4096"
=20
 TEST_SUITES =3D "ping ssh parselogs ptest"
=20
diff --git a/meta/recipes-devtools/go/go-1.26.0.inc b/meta/recipes-devtools=
/go/go-1.26.0.inc
index 7d8a68e3b2..611f00aaab 100644
--- a/meta/recipes-devtools/go/go-1.26.0.inc
+++ b/meta/recipes-devtools/go/go-1.26.0.inc
@@ -16,5 +16,6 @@ SRC_URI +=3D "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch=
 \
     file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch=
 \
+    file://run-ptest \
 "
 SRC_URI[main.sha256sum] =3D "c9132a8a1f6bd2aa4aad1d74b8231d95274950483a495=
0657ee6c56e6e817790"
diff --git a/meta/recipes-devtools/go/go/run-ptest b/meta/recipes-devtools/=
go/go/run-ptest
new file mode 100755
index 0000000000..ac020de025
--- /dev/null
+++ b/meta/recipes-devtools/go/go/run-ptest
@@ -0,0 +1,32 @@
+#!/bin/sh
+
+PTEST_DIR=3D/usr/lib/go/ptest
+GOROOT=3D/usr/lib/go
+
+export GOROOT
+export PATH=3D$GOROOT/bin:$PATH
+export ZONEINFO=3D/usr/share/zoneinfo
+
+ln -sf $PTEST_DIR/src $GOROOT/src
+mkdir -p $GOROOT/pkg/include
+cp $PTEST_DIR/pkg/include/* $GOROOT/pkg/include/
+cp $PTEST_DIR/VERSION $GOROOT/VERSION
+
+cd $GOROOT
+
+SKIP_PKGS=3D"debug/dwarf debug/elf debug/pe debug/plan9obj go/types intern=
al/xcoff net/http runtime testing time"
+
+SKIP_REGEX=3D$(echo "$SKIP_PKGS" | sed 's/ /|/g')
+
+for pkg in $(go list std); do
+    if echo "$pkg" | grep -qE "^($SKIP_REGEX)$"; then
+        echo "SKIP: $pkg"
+        continue
+    fi
+
+    if go test -short "$pkg" >/dev/null 2>&1; then
+        echo "PASS: $pkg"
+    else
+        echo "FAIL: $pkg"
+    fi
+done
diff --git a/meta/recipes-devtools/go/go_1.26.0.bb b/meta/recipes-devtools/=
go/go_1.26.0.bb
index 46f5fbc6be..35a14b8e8b 100644
--- a/meta/recipes-devtools/go/go_1.26.0.bb
+++ b/meta/recipes-devtools/go/go_1.26.0.bb
@@ -1,7 +1,7 @@
 require go-${PV}.inc
 require go-target.inc
=20
-inherit linuxloader
+inherit linuxloader ptest
=20
 CGO_LDFLAGS:append =3D " -no-pie"
=20
@@ -16,3 +16,28 @@ python() {
         d.appendVar('INSANE_SKIP:%s' % d.getVar('PN'), " textrel")
 }
=20
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/src
+    install -d ${D}${PTEST_PATH}/pkg/include
+
+    cp ${S}/pkg/include/* ${D}${PTEST_PATH}/pkg/include/
+    echo "go${PV}" > ${D}${PTEST_PATH}/VERSION
+
+    cd ${S}/src
+    find . -type d -exec install -d ${D}${PTEST_PATH}/src/{} \;
+    find . -type f \
+        ! -path "*/testdata/*.elf*" \
+        ! -path "*/testdata/*-x86-64*" \
+        ! -path "*/testdata/*.obj" \
+        ! -path "*/testdata/*.syso" \
+        ! -path "*/testdata/*.so" \
+        ! -path "*/testdata/*.so_" \
+        ! -path "*/testdata/*-exec" \
+        ! -path "*/testdata/test32*" \
+        ! -path "*/testdata/test64*" \
+        ! -path "*/race/*.syso" \
+        ! -path "*/boring/syso/*.syso" \
+        -exec install -m 0644 {} ${D}${PTEST_PATH}/src/{} \;
+}
+
+RDEPENDS:${PN}-ptest +=3D "bash tzdata git packagegroup-core-buildessentia=
l"
--=20
2.43.0


