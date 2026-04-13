Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902B0F34C4A
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 12:02:30 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.269983.1776081741805034676
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 05:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=kH/avBsE;
 spf=pass (domain: est.tech, ip: 52.101.84.12, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+GQrtIvEvJPAMf3RQd2Z/PfGRec/QmUg7JZEsKrim3IEdQWsCQMCSKmokRdYnuC/Ts4fQC74SbTqctSLUjEC1GGoL45wWw15IaGsJjVMQFq8eQL56yGGKVk/mGfInmHYsS5DBs857Vy0DCi6K358VABspKfLJK7nsXkKKGUjQaRhfnjYmaUuuiPU1LkOFnwyT7Q1cUfSJbxFvaFbmGA2JcJOnOZXhKJbJ7I98h3Ipds83ruKdlkfV0/JQPKtzcinm8FVwsntn+RpqJ/A5Jyp+XJTAtqeOxatnyKul7QVEUV4fgBtwQjqUP6dBwcoufuCGzlPCKHq1p5r1r/UfMxiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hj6EdS2zO9Bzclusao0ZSYeAcJXxUgpoZElcD6882FM=;
 b=vw12VfSDqWgw1TRk5ZUskXtYu6u6+HNhEKY5pZv6ixOtQ48f7gpTh0YwoUk3WOuX83hsb4IBfOHrR/TdRvMJ66V+EjFw2kADZJ4Gj9WQd7GWGSxJya22haYECYKZCGp6vudGRzGwFnOPMxiKAZY+AypXoqYEkK4RNxqsUNQL3MzkT+7S1L68I8BO6G5ezAOKTj/dx+Y0yJFWkROJ6QYVcD/69lvEqjxwHNaNfsrBYvOcpEHoNsHrSb3VcWP079ItJ6OJMtVN4pqxla4dY/VEd9bFCHAin6xoYFka6g9JteWfIaK8uf6SgEL6ja+tqqyuX3DzJCwa/A8l2PgNPzuvYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hj6EdS2zO9Bzclusao0ZSYeAcJXxUgpoZElcD6882FM=;
 b=kH/avBsENApGUII/LLCW6JKal37s/pNRHexpHcx0Y/Fp0m4eD1AFJErvJdbzO9zC6Y/h+IDGYjEy5f1B9sHRM4ZZ2+bkK/K7X2ifwglZuncL6gbRy/bfVQw2z5SEAKOsSKA3QEYx+vG4yz5Q7r3f1kES7cRqHzBBzasm8Z7ymnrK/IMBMASVDsEIJPTkZRcm15dqTynjShRsRGGF4cMMP53PKzRmHOhdxLZhHEsYJUMtX7mh8bzTrKFD0bxbqHyEtvsMuI0rjzR3g9bOSqYtlxo1stEOU4Cn/gsRs6T0kwR/cJyARblJzMKViag+dgF3/du+3FNGp5pMZyCCdDoMeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from VI6PPF734FBAD1F.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::19c)
 by DB8P189MB0887.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:169::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 12:02:18 +0000
Received: from VI6PPF734FBAD1F.EURP189.PROD.OUTLOOK.COM
 ([fe80::2f95:4230:768f:ed9a]) by VI6PPF734FBAD1F.EURP189.PROD.OUTLOOK.COM
 ([fe80::2f95:4230:768f:ed9a%8]) with mapi id 15.20.9769.016; Mon, 13 Apr 2026
 12:02:18 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v4] go: add ptest support
Date: Mon, 13 Apr 2026 14:02:08 +0200
Message-ID: <20260413120208.33075-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305110200.17834-1-pratik.farkase@est.tech>
References: <20260305110200.17834-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0151.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::13) To VI6PPF734FBAD1F.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:808:1::19c)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI6PPF734FBAD1F:EE_|DB8P189MB0887:EE_
X-MS-Office365-Filtering-Correlation-Id: eea14731-007d-45eb-1afb-08de995482b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	FY0eYRzFPSPhtAgjQLAqvhaIgoNldGa38M+srpqdJsDYFvCjiXytDqvFJ//gmf2viyZaFfARkLZKe52OY64ZNQ0azZEtDzS42gmtgDQFEjhke0OTsY0NgMn2atEys5v/CN8qDM4iF3izsPCGBVOrWQqGmg16NlN1rL4xNbHKqJjIwUwZlEv4sb2aBESa98MnBhdTYLJ8tRaHPfEho+hYbByrRwNosgPxaDZKsLYvV4Ua5yF960dhRPkp1JQKsxB61OmFD9avW4fNTbBEb/AG5IDKjY6IQRE6ju5NbCViyONvQltaTq8EeIKakOcO+wloT6jxOdXpZDbLZ8TeNcUrip0xlOoRjGXur8vWMlXty7t69qrpaGt0HHPpYCKu+SXJcFvvZVCUcu5NafyivACbT0gdm63wsdjkNwkUSGyn2lT+wywUuYZU1SZH5s3HAvM3tWz8oKT/siq29MauIIhW8oCIHXDBzuNyjy+SGgSDoHmTB/6GF3q+JXbcu4dn0o3oroCYxNQxDGchQJgULn/l4AYW2BKKPdjVV72r8b0abL7N2EwDH7cu7sp4+RU4r+rpBITzUZVcrB1ILcwnrXHLqxdTkYfBa9kmXdw6XbwBeuYDsAJYr0imh0C141THgntcw6hLY/GUFnS4EVrdJ7zd4r6u1XO9sanf/9tuUMkQH+b+2kXjumsPM+M5dyeRcdwWGs/N9sDRUigRNB7twNDb4TYA49XDgE1bXV+fZDuT0tI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI6PPF734FBAD1F.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PuPHNA3v9EnFedqQdozcbd85EXAQ2JdLEv+QrNVQ+RtYEn1J5BmzcJav7A7n?=
 =?us-ascii?Q?WMkWkfuHZnFAHvb76FDXeqLqXEm6pk7tRQmo7VZHGN2KrgSfaW1QW3DnubBt?=
 =?us-ascii?Q?5qST0M6IsAjvI9CW3Z55h5Gbh7+28dN2DbwXWOwxISq+cgHA9jtbmz4lxOT+?=
 =?us-ascii?Q?hI+iGz2mh2bzQIkIA7fXOxOBe56eL6iKEAfl2Sf8XKsZHz8helrlvjhYZJ6f?=
 =?us-ascii?Q?WKbvU/cxUENWTW0dANIh5yfe4a46sqoD+qeHGzdgBQA62dns6FmnBBjBD1DE?=
 =?us-ascii?Q?IARGSWfvo+y59dvMfx+t01hY1xUId59nEJTSO8resywzlZ5R1iV0Rz0IkAfS?=
 =?us-ascii?Q?ToMxYirQ2457A/0F9BN1ov6Equ3RvcLtdLwfLRpPUYOAa50ZhEn9mY8vxhoA?=
 =?us-ascii?Q?l3MF1Cn2uy+HskgCaoxt7BUyDE14CwSB0EztoAUP73sZu57+A8fe0UctMSps?=
 =?us-ascii?Q?o7qR0g3zddF9lbQjgIMeUbugDrWY19B0QhWEUh9PSn7L9ZxolzwNqWHCxw3/?=
 =?us-ascii?Q?40Bn9DoInNaTKYDkJJxmwkdpISKYN3ZViqrOGGyFrCh6gS7gZncNsxy0wibD?=
 =?us-ascii?Q?qA0g+SxF6dzuO6i2j/9I62uF7wqz+ZjV8GLMkkoFtBuAKnqwd+iz9Jy6tnAk?=
 =?us-ascii?Q?b0wobwpb23qIdkc8/Hz0BN24zehaDjDhMiFZOTTMtd0KsDRDwMXDJqUEafVu?=
 =?us-ascii?Q?vke9cV+RNyQpzAQLt1FyNccwgwXjxJ4uwxNGCluJI0iJJ42YoyLEchNHo7to?=
 =?us-ascii?Q?szQf9hcj5meEkdbRSlJfq4Rvj00uZXGxiVVQkXGPrwS+GHD6hHEYmctRGEzh?=
 =?us-ascii?Q?5Ur+lLAIidjyVuQKCbhQFLScdNndh/lFdzlYgQPMpdpqrI/mloYc/l1eC2ec?=
 =?us-ascii?Q?ELxstsvcRNasH31QHoZPHFtqD2wFVhkTtfBE2N9tpabb918Ru/j9ByZuZhDk?=
 =?us-ascii?Q?Yg3ZydIPMS+NMrxEf95ojXtOvTE0eUmf6YFSUoR366iFfT4LFCTrrxZoBVt1?=
 =?us-ascii?Q?BObcsuZHkk1g45YUAaSnvVzBUCvSzofqMoFjscVFuga3RWYDoPEWXKAwa70k?=
 =?us-ascii?Q?hG16WGIC2PueiStY6drT5Q1djzHoTgIPOG5Ral67S/QLBDuzkDTqI6nzoX+i?=
 =?us-ascii?Q?Kp5+au0+jBZnVOwYMqGVGmqba90NB+y351bg6k/wrQIPmBG7JJF1vgt9RBbs?=
 =?us-ascii?Q?CdvYsG8Phfy3AsaTlf+p52OrAP1tNFKIDOMb0QqbOvAMuaFyTlqo2y4E23Wv?=
 =?us-ascii?Q?hTdF7dUEdA3DJMsNnDTmySr4j1Y+YOoCQAW9IVf53Il7iyC+NsaQ5eUhuxF2?=
 =?us-ascii?Q?lVqH557B8CCn6r+097vd0yrKPUAI2iQD13dKqqAPKGJQHQ7Nj3Ojr5Km8Si+?=
 =?us-ascii?Q?KYr4ahPleJA2sxc7WeAHBBv/C20FHIzlN0KmzJxQsQyeywSANavjYNrj1urS?=
 =?us-ascii?Q?fwBF8cwYbYU3GanAOfnnVmHzWwMUW3XbLkY8oGieuiPq/jh66nFvk8fSO+ST?=
 =?us-ascii?Q?WtaYQnu8uPpIyAC5ICk9N2O3S+9z636kgY6Ym3Mdi43qNJcGrPbAnFkueEGC?=
 =?us-ascii?Q?NuYUcMgmWk9ptCJAB5Lqg6k7tDjF+NSq7TBM5mf8IO4c6g6OwUyszf0KST3l?=
 =?us-ascii?Q?uBv8jjEZRu7LTWKx2+lxWzT+qQ7NQZSaKR6jTHia9zslJWwKdf+j42Tf8Ydw?=
 =?us-ascii?Q?Y/LARpS2wCQo+GPeN2MvvSFgvZqowNvu8761yqw82VVSwoOO0kBwm35wVKMT?=
 =?us-ascii?Q?2Jf+9Io91w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: eea14731-007d-45eb-1afb-08de995482b3
X-MS-Exchange-CrossTenant-AuthSource: VI6PPF734FBAD1F.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 12:02:18.4297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEPJ5YmL4WbVLVLA1yAP7yo+391D3p+eCn0QVS40/BUdLZVAYjWVfsoW1zdHAde9RDybos5QuR87laNHQD2Aog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0887
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 12:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235108

Add ptest infrastructure to test the Go standard library.

- Run 'go test -short std' via run-ptest script
- Install source tree and pkg/include headers
- Create VERSION file for architecture detection
- Exclude multi-arch binary testdata to avoid QA errors

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
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
 meta/recipes-devtools/go/go-1.26.0.inc        |  1 +
 meta/recipes-devtools/go/go/run-ptest         | 42 +++++++++++++++++++
 meta/recipes-devtools/go/go_1.26.0.bb         | 27 +++++++++++-
 4 files changed, 70 insertions(+), 1 deletion(-)
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
index 0000000000..032aa56978
--- /dev/null
+++ b/meta/recipes-devtools/go/go/run-ptest
@@ -0,0 +1,42 @@
+#!/bin/sh
+
+PTEST_DIR=3D/usr/lib/go/ptest
+GOROOT=3D/usr/lib/go
+
+export GOROOT
+export PATH=3D$GOROOT/bin:$PATH
+export ZONEINFO=3D/usr/share/zoneinfo
+
+# Set up Go environment
+ln -sf $PTEST_DIR/src $GOROOT/src
+mkdir -p $GOROOT/pkg/include
+cp $PTEST_DIR/pkg/include/* $GOROOT/pkg/include/
+cp $PTEST_DIR/VERSION $GOROOT/VERSION
+
+cd $GOROOT
+
+for pkg in \
+    bytes \
+    cmp \
+    container/heap \
+    container/list \
+    container/ring \
+    errors \
+    fmt \
+    math \
+    math/bits \
+    math/rand \
+    path \
+    strings \
+    sync/atomic \
+    text/tabwriter \
+    unicode \
+    unicode/utf8 \
+    unicode/utf16
+do
+    if go test -short "$pkg" >/dev/null 2>&1; then
+        echo "PASS: $pkg"
+    else
+        echo "FAIL: $pkg"
+    fi
+done
diff --git a/meta/recipes-devtools/go/go_1.26.0.bb b/meta/recipes-devtools/=
go/go_1.26.0.bb
index 46f5fbc6be..e5141544b4 100644
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
+RDEPENDS:${PN}-ptest +=3D "bash tzdata gcc"
--=20
2.43.0


