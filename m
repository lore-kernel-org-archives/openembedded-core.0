Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E25F3093C
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:02:21 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41656.1772708533229695672
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 03:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=AdtemsbU;
 spf=pass (domain: est.tech, ip: 52.101.70.49, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1WgquJKjdQeHPXzzUHPdP2xW3ca2lYRjrU00nnR/WzK9r8JV0e8abst+PfLKALJ87stYnRjw3H4bntCRGQmg7S3/Ej2Ai6/8/4wDgL0kJ0g8H2i4QKeTKFdLdn8dbQ5MITGBgcNRKFrF499sF7pb9G3R+1lo/B5KxWPiZIwdMGxsub2TPy/U1R3g9Altdyqe38wD0olRaiKszqkwGz0XVFg52VDguAQOK/g5y1/a3gBz07Av1d17qDxO9Uw8tkYp33IYTpfZb6zsjxUMqZ0c97iUElAFPWJWs4VgGWDev1pGt5aj1nU90e3vbI4kwejwVkqVTp4StIcPBatlPkdng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2v9Isy+GgyGcJwnaCrw9k47XYjH9IDkflIu6q6YgZs=;
 b=AqmQBz3qPeKAahBm4QHV+5HHerlerKw1JNQXwqw6eSTueO7OgE4UKz/HBPIrQHNgnGSXgEqKBQF1Dxsi66rjp1mUzeb9ncGfYTsvT3rOdqBRdE8NZmcqpJ7oXxyTAasaa5Q2EpOSydGFSBi4Dh4rH0MHro+GWSsEhuNDwnZHw+z2Xh93AD7vlN3T9OdRq4saYpmk+uB2rVy0/W0oCvOPCVLuwRCtYjDfufR0dgKCtcd2TqmHbcY5rNigj5rlCyQZN4qENPT8DM77Wy8DfjNVlO404SfKQpmDkMNZmDv8dP52M99rDWC5zIpFxSDAYGMi32FTIDv7TE+ZJksA5YLM5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2v9Isy+GgyGcJwnaCrw9k47XYjH9IDkflIu6q6YgZs=;
 b=AdtemsbUtRIWtCq+SM0TTOWTex7yZ6RSDbC9xwiZcOXdjK5UAnam2bAarSD8ZZqVoWjR+uPlugafUF4E8zRXPYtljhMWRn0Oyg7xgTbH6bPas4dfrWiSdY6EIxcW6eOatGIbPuJlFujOl4pQhrCFpD3Qvjvmq+WjxoAw+Lm0V8UTjUzzuLufeY+BVLCpDhVQ3FE8jG00YuJ9MWdwn05WFPC5kF0gS6tkcgznR8k1F0YQral1XBIPU6SST2/yCr2Z0TvQmQ2bL4zVQj4MTong9qPLKT7zqjYfd9ceYHWiw4VHW7csVEwyfvLxkf9RfpWxBAxz3O2Wt617z/oOJH0UaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AS2P189MB2539.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:643::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 11:02:08 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 11:02:08 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] go: add ptest support
Date: Thu,  5 Mar 2026 12:02:00 +0100
Message-ID: <20260305110200.17834-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0212.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::18) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|AS2P189MB2539:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf81783-ae45-4c7c-cda9-08de7aa6a327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	TSYm45Iv6Mzqbnt4y7OQybFvEk0jcsYZ8RACG+uMJJwK9DeprkqL6H10S8uMnUha8YHnjkrjighDS6KdduDesGeSyIFILSDYS/2kgl9+QtCWpqilDNvyQuDaBLNwahRl0d4P4ZvCoWRNr+zKfnHU3jLx/oaCibm4yRqRp1B31cSBeSFh+6u2RkbweryZcVNYzTZdDJ9GsXmipEq8kXxYf/b9isxKP2hbqkM4b8SN4MLilDnERCyIgnLplztlE1tbazwRV6qXOsBbDE66gnmPa4C6v0P1aBL7e4EACWNGUKWUm2Vzo+wHPqlG/VxdFAJXaiBNThAZO9H2HJg+5puz9NuT6XTP+hwk2F/m7kw2kZFVpmRougkDmkKCvcUE4t9e0d1qkRndByJ3in9U/2F24VmGFpTQVETpTY9+I9nkhnH+Ng7PGyYuKMIrIgkcPsyFGDuPQw3PB78ppL6R7hBNrKaHj6+bvPuPl9upNzbNzCkPbBSmbUPOdT3mnd+GOdqRiBJ41CQHgglJkZgGcyXCHTy6o99VMKKMV4X+mIsHFEyfwYjzwFJ5JKg69kZphqcC0Jl1k5KiRfGx/c2K6tDY16m6fvqRVeCA/J7VQVyTtmBhirZn+XiApwKGNtx5Bhh58HPc6J5Lx/uUpiLIh+Zakzpb4g+m5zisHycgzBdkv4slXEF8BraxzcQLpVW6p019JVi5pdEg6zidpa74kQgZys1Em2NfKueB5UmN6xDjToM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dINbzhfeyVRNwE2sEWekrCcWvLoGT8SesfUgpL+NEF/6ASV6PAtRVPn94+kH?=
 =?us-ascii?Q?k3UGvx+OdTXWSphmpyRexk7VHgVIQUl76aEPIHHt3LDdlQdu6GMaE1l5aaH/?=
 =?us-ascii?Q?r7RH8c/2V2msRZSbee+WURpD6E1GDqF3OIzF4SkJrb5vk4VUhwNVF9NxW6/K?=
 =?us-ascii?Q?YrSC1tlfuh2305FIuKt11JR37nPbw4EqI/7y6PxL7LOk9w35riSm6j1OPtob?=
 =?us-ascii?Q?auOv+y/+eXde10OkYxGJeY4VcUpa+FBZRKai+JTaFDtvkxy+Lf+4aCc5KAzT?=
 =?us-ascii?Q?gZsHswtlRkTI5vutzlsRnUYkkO6VS5m8VHa13E5q4HmQYIIeK66KSNMsrEbW?=
 =?us-ascii?Q?AiP8jcheYdLUFGrvLvPLjkxAfanb50g/2rDuAarBegTm8ShzNkQrEBsRHvSI?=
 =?us-ascii?Q?9B8bbOWU+7WFWPMcwcZr1u1jDsQ9nsaj27WTOlY9VSYHRNq3GdC5g2Mvc+nu?=
 =?us-ascii?Q?F+3XJMp5pQ9fGG7xcdtLE5dY5NDA4illzji3RBx3EYpUDHv6SZuOZ8czvV5T?=
 =?us-ascii?Q?Fd4oRicNCOnoHigrGCgvM+LfkeTYhhLMqkr/DGexdjF6Zo5hWm3qi4pojmi5?=
 =?us-ascii?Q?HwvYQ8uDV36J7sjHje2d6HKP6tWhvdBF9iGc7eC3fWc4uPt7zranDEjLBzYz?=
 =?us-ascii?Q?s4PDyndP0OimJFwCY6ADwmZ8OTbo919XjeRzD7o+qhGDAYkowt1w9PyNEgAS?=
 =?us-ascii?Q?4CnjYRc3QaE7Jf8z8CfW1WVGGJySPXgBDMiLtWdY7MBZ1N8PDpeMQ+ohu+G1?=
 =?us-ascii?Q?/i3e5233CS03Gj5bSmCpVllksND741+O18r9n7d5NNnG+sK4GWnGgc/jvK/K?=
 =?us-ascii?Q?/IUd3BKca5fzGRnc2MCvAJatT+G93OuAj6e3g9O/hpQUQVf2vRhNxc9CgGKV?=
 =?us-ascii?Q?8pVhMOh+xlVaPeMxpnwvMyyuR1/TKudRTGDNBwj0WiqMvqcawVBpfYsel0S3?=
 =?us-ascii?Q?esJBiRfx28F6KKuUTNYcqiTcgvycXxhuhDo8+KoSO83BnLRrjqGILEAWwuSx?=
 =?us-ascii?Q?tjcFAjQ2hV3K9FVzv2HrWxG1wLn0Bg8ZkDYtzxOwnmSQ5FP71BCPxb2O/pWi?=
 =?us-ascii?Q?GMF8e77+d9IDaZbKhBSVc0SGamil2WRYJGl84AryTQxe55t0qiqQSFG6Qgd4?=
 =?us-ascii?Q?pNLN+YzemQwmrhFCDXb47RpW/w2Vqn62WSG/Z/1/K1h2x21rtSl8JTowFkPC?=
 =?us-ascii?Q?DbuzeyoxbTYImOemPqaKtxZVZU280/ZlUdhjA1ZU5rwWcansd9qeylJwIPLy?=
 =?us-ascii?Q?RL+N2FLQ+oKakwx0kTKMop49GmYWqrXh/dyeNnk0eoTBHr+XOgPQLTEHj0cK?=
 =?us-ascii?Q?bQ2uIOPaWqeE5e2cWn62M1lv12ixmWrV8obIzTneDw1wX30xxwnarcrq0t52?=
 =?us-ascii?Q?KM6typMj1JTCOjDwDvUVC1yF5dw8a7tdZBhIYIs3UQ6BUWyyKrMouz563a/n?=
 =?us-ascii?Q?xI6scVnvGiMPSJ5Wv2L1ejpkQqKugqI6UZpicWa7n/b831blgqfDQL15fo7+?=
 =?us-ascii?Q?geDQA9QTC3oXsVAwhGTySy9jPvn6TUuNP2OJLQ+zrUxZRoJ01SPJ7Hb1bGuR?=
 =?us-ascii?Q?nVtaUYDp/kigB7Hfd9mC4CSdbuXi/sED7Iotuu3BXvFPkdBT1LjQitg4X1Sz?=
 =?us-ascii?Q?HS0Bv/m19fUOpy5dftvORmeJ3UUlAucqZm2VU+dDGaIOuW7a4cvKijOAOS7w?=
 =?us-ascii?Q?uyvvC1cWIP0qyRLzbYNN6nngUEv0R3zQjD9cRhhM4MYqULZaxJSqoZM9cYRq?=
 =?us-ascii?Q?67BSOIU0Pw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf81783-ae45-4c7c-cda9-08de7aa6a327
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 11:02:08.0641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6rIq228HHZBC/6K3YVby6vyVvcKUPQtRi/B2SBMwpmrCgIhCqEOsFpYg33OVnwFEpX6NrD6NhFnhOz4bb3P5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2539
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 11:02:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232479

Add ptest infrastructure to test the Go standard library.

- Run 'go test -short std' via run-ptest script
- Install source tree and pkg/include headers
- Create VERSION file for architecture detection
- Exclude multi-arch binary testdata to avoid QA errors

Test results: 237/253 pass (93.7%) on qemux86-64.

Known issues:
- debug/elf, debug/pe, debug/plan9obj, internal/xcoff: missing binary testd=
ata
- time: requires embedded timezone data
- net/http: requires unstripped go binary
- testing, go/types: minor edge cases

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-devtools/go/go-1.26.0.inc        |  1 +
 meta/recipes-devtools/go/go/run-ptest         | 23 +++++++++++++++++
 meta/recipes-devtools/go/go_1.26.0.bb         | 25 ++++++++++++++++++-
 4 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-devtools/go/go/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 1bb7458fc9..432f3965de 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -24,6 +24,7 @@ PTESTS_FAST =3D "\
     gdbm \
     gdk-pixbuf \
     glib-networking \
+    go \
     gzip \
     icu \
     json-c \
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
index 0000000000..86ff1bd1ae
--- /dev/null
+++ b/meta/recipes-devtools/go/go/run-ptest
@@ -0,0 +1,23 @@
+#!/bin/sh
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
+go test -short std 2>&1 | while IFS=3D read -r line; do
+    case "$line" in
+        ok*) echo "PASS: $(echo "$line" | awk '{print $2}')" ;;
+        FAIL*) echo "FAIL: $(echo "$line" | awk '{print $2}')" ;;
+        \?*) ;;
+        *) echo "$line" ;;
+    esac
+done
diff --git a/meta/recipes-devtools/go/go_1.26.0.bb b/meta/recipes-devtools/=
go/go_1.26.0.bb
index 46f5fbc6be..a2827b9d33 100644
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
@@ -16,3 +16,26 @@ python() {
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


