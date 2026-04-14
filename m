Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F2EED7B9B
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:31:29 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15848.1776162683093729192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=SxXXVlxE;
 spf=pass (domain: est.tech, ip: 52.101.65.20, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDw0QKU/5YLfhaXJL6MStDvWTZ1COx40xYYiir5iBhl3of+QMkrXwU3LR/pm/YCMRbQe/4dagrC9Dj4JeQWsvK5g5I8enIKYswgytbyd1S86R8PpOVKl+0pE4nGASVxayGYP0I6AdB5tt39tKABlUObXl/Mb+jc7Rn8oMQsYY5YxqAtkaCwOlhFV4JumDTAi9c3GEuKAPP7m/n9Ep9OgUQNQFJplCPt8I6wbd2e4VgGAEljUPNlDMhjMRShkLL6g+0Vv287xuB7Zom/K5HpoV5OaFX2bCyQ7TVhVYpYHdVAyF+1wP5DYZROU0Sp9lSetVhWIftmvTD/KhPZZkOiLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=401vIKsWzFJS7tSXNodgR6572hso+68r0s+lQxKrukY=;
 b=oHh2di0yzYJO2Sh0Bu9kHWtwIQ7+iXKBbIuGpu2jzR3OKxqoCrso9rFxk3dKQMfc9VdUAKOj5hhSi0PJOIDnagb2e57i6h62ioqoyxbsAuREzTF7DKk8okPnPF5DSZxBeu+jo++ggxISE6X4z+bQDF7p38mt/IW37nH9SuO1MAggvX+u5XXDE6Nb66wvug1NuGWFvIYfrvO6eAgVO26zxPUj+bNpBvR13AbbMgQR8KSvP5FNlgvFE3+IhYS0B57wyCde0Z5ylS73nl77g1JR54ljzoKTwwr7l7o0XqkSPejzzhgIuU+64YykEYuge20HJAVr9fY8XhEgzff17T12fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=401vIKsWzFJS7tSXNodgR6572hso+68r0s+lQxKrukY=;
 b=SxXXVlxEi7vU0LXPdnvOtgBx0a3P1dA2phxQdLePPWl9jzHJIs/do+eHrlHuUUwwd0ALsaU42vZkSOGqcL+zaUu4gccHjsSEN9EKZoUDqYK4aT7vLqp3x/QiVh4FeVmtjHaAWHeRbHY//sTHr8zL1WuN3tG0CDq0hwidqrwFEQVasqwYcp5Kws2gQJ5BVDRcP6fEJI26TfT6/mEzTBPPrEz8yAxNn/n4Fu7PU/HWGo6KUV1xFL9t79IaaJIGvcNHH11ogdK892tT2K3aE9IGOsFBWU6EoijruXMt6ft0yQBG1MRSKpJsXPsiWYilldLI/mv6wwuEueIJif6jX9xBIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a9e)
 by VI0P189MB3591.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 10:31:14 +0000
Received: from DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
 ([fe80::48a0:eb8a:db1e:38bb]) by DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
 ([fe80::48a0:eb8a:db1e:38bb%7]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 10:31:14 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v6] go: add ptest support
Date: Tue, 14 Apr 2026 12:31:10 +0200
Message-ID: <20260414103110.22263-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305110200.17834-1-pratik.farkase@est.tech>
References: <20260305110200.17834-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0327.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::10) To DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::a9e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PPFB77F8FB19:EE_|VI0P189MB3591:EE_
X-MS-Office365-Filtering-Correlation-Id: f818b26b-888e-4d25-075e-08de9a10f489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	LV1L09tJ3PHNdbvijG60OjEDejJO7uXCUnYjqBYY3ZfVPR3n0poXfWTkwNAT0mFzTVkl+EV99YzuJQDqwKmLbuVLA3wU5RoDcfgZFwwWZRIETgatqRBqJqoopenim2bvxZg+QH3T/dKMQu9LlWsXob6GibC8gEBXwJ3osCdJQHvPjE2IvdVLn2rxdp34PYdvSNlj/tty/n+uuwffZrhGoGUx529lLRkzQOqcn8AML61++wQQB/QvWkJiuqe40/0v+yKs9vyYwJv0O6uW2o71Utea3+Jbk8z/f1gcWb8Mnn1MhMSuqJeIEIXj7gjqzwItvbhfgsWS/DAxzjU8m59pOAQwmtA29s6CqWARSE5tGwXRi8MGBD9KLb8A8fO6uFLAYTaElvfnKVrnILBoskGLtP1ubjT8a/BcixDOmzlcJBwwuiWPkJrAOWyyN87NX1J6VxAlhr9DlxBgjBqBdZOr1NkYK5IkBaQ1XKSIXnMQ4YVWnOulS/SoSGr2uLzOUDnRUS4WzshbyVrlud7nydG4hGtOvfKYkaxKbWl5TFHBLKGCkrq7pbEuENQbVgEM3B3ivQybxD42HUIjSUjaNh6EdLU8WM4+Omk9Kg6nUE4qKjKcjNMb+8it5kM0si+OYRJxl9bX+e3v7tYUfjjsPZjysmNyKEODtIxX8smfQkgtEkU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SObCRzMO5XjnjqdQXyxf5KrEP4xjRlBGO2rvcdR0cm6NLuctm3rL9gbv/mYP?=
 =?us-ascii?Q?vFE3aKEDNuQyRy74IorTvTAVThgVuubcVHFff46ksyx9tis2N5gEmHxDt/8x?=
 =?us-ascii?Q?2OPsaHkVhpfQm5ScnSkuo5e+Pe/+rMaa1+s+WxoYavANFb33ZpLRe28kfqF+?=
 =?us-ascii?Q?aE57rTl867p3K7AKiSDRbSBwwHs4MqbM0ZFZfmQmBzBG0TeYZu1cpLkCTRxL?=
 =?us-ascii?Q?HPuUYOIRmq3qML4ZyFS7/EFdJpsBqAhBmjMpeCdA3SKHp3FSpludvlShlUvi?=
 =?us-ascii?Q?AXkYtucxz9CAQ1F7LPP1KTpchAYv+AjyN3GKQ4zo2ALqm+z+AcRb6CZoO5bQ?=
 =?us-ascii?Q?fm9NNyPEz2tz6F/HnERqrg1Q0504934vWtlfDS0ZruLmjBOFO5V+50Lvy8bX?=
 =?us-ascii?Q?zI/bWhusA8+XLCesP6Dl/2q35/7XO4VkKHKCNqc+ytKeI1h1aWK1kHUREox+?=
 =?us-ascii?Q?f1g20+gBi23tMC64rgPUGHIfP29gdydhArgIlrTe+IJAG5jCKTnNX1pGnvSB?=
 =?us-ascii?Q?4YdAYKIVmlWP8f/blt7sZwLSaVMFt7yTNSe9Do/DslslG0qTuJLUMfb1szT5?=
 =?us-ascii?Q?ht0UHBs7QtaQQ1s2omef1qAJMz5X+zpNzrdI5kVoGAhQwKcQpdZ5ystEPwbC?=
 =?us-ascii?Q?LWoEkOTlUN0a9S/tQptvJilYR93qUytwdfiIDYI6Vjzzm6bD4zjEtLHXhR/M?=
 =?us-ascii?Q?qookJGbN1wpOAyoHVTz+jb5mv+kn2diqU2n3Y/mE/xn8l3ZHgFtyk81W4Q79?=
 =?us-ascii?Q?FlT6p+9Res5vUF/FV6IY51Kxllt3UtBuIbYYoojAXWf5gPevnZml5Zav0lI9?=
 =?us-ascii?Q?CSEOl/Ye0Oo+95O8qJWnDQKiP/v4QM3EMGyyc+1GSh5AyqNAJfkr5v2zOI25?=
 =?us-ascii?Q?5LCjGtrnsICVEfJctF8azGjQjmjFkBhO4J7iMwThDPXa03l2JaqYDqAa7FIb?=
 =?us-ascii?Q?dUVoPmU1mQtSkRSMeE9+EtY2qSoXXi8crMsLXCdXzzAlvyDCf5p8OuQht8uZ?=
 =?us-ascii?Q?EHORGFTiJiT6VB7TO2zMsHzEu3anS6BWtjnBZnaSwelwakAhF9TQL6pFqBe4?=
 =?us-ascii?Q?hoIH4HwWDlSZ6AAFF2s5/vkmbH2yqgx8D63pkDdo2+Q4JooLH8qQ7/VohRl7?=
 =?us-ascii?Q?Ujdtc+OfHNlbyjvXrzGDdEw+mt5pL7+FubE/MbW/0HS0iuBjrPDzLpe8EnVr?=
 =?us-ascii?Q?ke2PvzLr2vBtae3uSU0TQBpBlclGN4M9mUr2RSF2GIN5RQeAIKOyj0s6WHvr?=
 =?us-ascii?Q?dlK558alAvhbRuplKnYCZh2Gn78h98gKBu6AjCztILjOCZllFDd3OPW/XWwn?=
 =?us-ascii?Q?N3VJTn980kb+W2DWp5FbKRMvXf0fTNA2UZWhgM93DLQGS4GHjT45xLYhBKd8?=
 =?us-ascii?Q?eV3q7TKwKK8sk6hezk+DlC4SXcWw1SSNF+MMh/eUcYreQyss9aqw574LWtKe?=
 =?us-ascii?Q?ZBHqeglQmPBRxMyAj79RPdAgKp/ZVfCYk3WQKflHdpn5w0ubbhwsWky3R5gZ?=
 =?us-ascii?Q?gDSXwhX1+uCj+S2urNb1E4XOOSt1R1X3xX4O5a+hkyBQqQWS4fryaaJpXcdz?=
 =?us-ascii?Q?oo2JIlM6ZUJbqTFdQ7jheRPFriT2X5h2c6aaHCC3sD0MKdhyLjbAWwi/Us9L?=
 =?us-ascii?Q?nDMZ81JDGTVBUGGR2jvSDGdnhrFmLvKsGdnYi9e4AlmPikxZ4Y48T/PLnuYo?=
 =?us-ascii?Q?uWHTTx4i/b+1CQUwQHpuJSI+7CtJ3JWETJqXaukBm5jSaQwiPSVpOXBUSHZ0?=
 =?us-ascii?Q?pyf3gjxidQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f818b26b-888e-4d25-075e-08de9a10f489
X-MS-Exchange-CrossTenant-AuthSource: DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 10:31:14.7611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sa/nJE0MRqJL+ckiHHUG9rMULptrTKf0dgzT6qJ0cfWzamywnsMCMN1uWqa639pL+fnWPk3jA/1KTYHllw/zUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3591
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 10:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235151

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
 meta/recipes-devtools/go/go-1.26.2.inc        |  1 +
 meta/recipes-devtools/go/go/run-ptest         | 32 +++++++++++++++++++
 meta/recipes-devtools/go/go_1.26.2.bb         | 27 +++++++++++++++-
 5 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-devtools/go/go/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 11a894accf..254ab5311a 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -120,6 +120,7 @@ PTESTS_SLOW =3D "\
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
diff --git a/meta/recipes-devtools/go/go-1.26.2.inc b/meta/recipes-devtools=
/go/go-1.26.2.inc
index 8bb10bc89f..c53e8284a6 100644
--- a/meta/recipes-devtools/go/go-1.26.2.inc
+++ b/meta/recipes-devtools/go/go-1.26.2.inc
@@ -16,5 +16,6 @@ SRC_URI +=3D "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch=
 \
     file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch=
 \
+    file://run-ptest \
 "
 SRC_URI[main.sha256sum] =3D "2e91ebb6947a96e9436fb2b3926a8802efe63a6d375df=
fec4f82aa9dbd6fd43b"
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
diff --git a/meta/recipes-devtools/go/go_1.26.2.bb b/meta/recipes-devtools/=
go/go_1.26.2.bb
index 46f5fbc6be..35a14b8e8b 100644
--- a/meta/recipes-devtools/go/go_1.26.2.bb
+++ b/meta/recipes-devtools/go/go_1.26.2.bb
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


