Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AFAFCC04D
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 17:24:29 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32.1772817865771262257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 09:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=UJS5lP0S;
 spf=pass (domain: est.tech, ip: 52.101.83.36, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=peKXreBt4ks6rjKgxe7QAEShhhZ0Pb2gQGwhoh0HvtVjmEXc7qIQiwI7A81x6jQbsRP8yZDU1NjetVocUhybAUDbquzinIyh+sAwMx9hWiSWEkC/CWbUnxdTVcoqOG8v72V6u2Bah/XgGZFgzRw5wMiflB939KAgEejMSFEtVt6LYIJqvymgzZFLPGzAQzGdb6qEMhbhrjVKGqqBJeGN55hPxptIQXloqb5tCSIqFK0hpqqvxsJtxHnW5+ZnDr7WmmHV7i/h8DBQhoPXpGV+5Aji3piE1LwJIOAG68QeyEEa9NAAlpLe8FdwWP12+LmQvK8e+Z3QZqYDnXeHWZoVlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFsftzFUzoalBqv6AROqzo1Oj+aBIgAIfnMR9Qw6mYk=;
 b=SdLBtGfwJwjlZMen/yXreyRkjD8lfHT473INAgqPxe8k8iKPqFgflOvU5I6TkWJOHLlSfIjdNdiLredCQ/vRgdOQ5LHWxslznwKJ2Rxgnxsx1R6AB8WMghTX55uZrNXuW/RCq4NX3563It/nOcom9LgA4iQAY1oTGlOpSprDYXJezqvA3uPPsfxmOiLA9fbzuNzwqUk/Cu0fmxaVeuHsQUQmn3VS6oFo95DiV0a0jAgVLwnCoYq8s06S785dQjxU2qioeurenqA5qqn1Jr6DxARQ6J/Sq6BMAfYGHYoLQtXlOmhzoQE1l9bi8FfSVbzzUlkq1pDWMpYQYA8u1Zil/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFsftzFUzoalBqv6AROqzo1Oj+aBIgAIfnMR9Qw6mYk=;
 b=UJS5lP0SxboU3PPePQUint+lhMmhJbIMNPUCA0dkuYwNeYlxbfNXiod1QsIKfk+/Ecp0aGMWMaBVj3MzdNwuTB+7B6jMZfj+Izn4G9sIu74mm35M4wGWQNtfRD6cGa/Vvy6gzpezMXkscKzLt18vmko374STCH/wlqV2Le5TwyD4qy6GABj8y4Ps3PVfevEjxRg3ySOVI+FIZVVx2tt7U0EoMv3jhxH6rk7D/hfnf9qF5nx9Kr+LluJp80wiAIpKPH8hPyQAzr+eZ2JmD3/fYOXvP7PeDuq/h3icEsEGGoH7SXEFMJA3mvuNTZsqSLqkSTwPrX7Z7PuqjruT1ZqeNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by PA2P189MB2691.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:424::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 17:24:21 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9678.016; Fri, 6 Mar 2026
 17:24:21 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] go: add ptest support
Date: Fri,  6 Mar 2026 18:24:16 +0100
Message-ID: <20260306172416.23307-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305110200.17834-1-pratik.farkase@est.tech>
References: <20260305110200.17834-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0134.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::9) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|PA2P189MB2691:EE_
X-MS-Office365-Filtering-Correlation-Id: d87748d1-71a7-4ad9-5c5f-08de7ba5343b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	FhKPHAeOrCUl3FvZI52YP+RNOfPcpSY0d9v/vq4CQH3EnDtq3s7MotRabLirc2wB94YvC1vmnpABMbvpatR4ipP7DgHTEIqs7pSwf0lLcUzJTS9Fzr/laY6BDyJsg3SQK++xI5BvVFrItT4rbVlY3HtZDVPrI/IJvM6IW3BU3S8VsKwvejLsZfhJhzIQaMrs6lSG4Eh1BRn0sQMf8pbxXqgpFAPXY35LChPPgr/lIuBMXM0PcfPTdxK/z3I/SDJcNhG/ILexBiB2MTH/1TdOMXYVonwOQ8Yg5mofqp8Ayc8eTs/Q7gHb9bx3anZ4AN9+yQrNAXvmD2cEZ9hhy6eb4RuhdZOx7PMB9k4Z/EQMOLtMg4h3IpWKO+A2CfprvtplXYnuKfzqSnnaHPeMh0v41ZmxOVOcTngJdTKzFSdzCn347eK4H11p/MUqiepp96MoNrBtAik5vOStihSEqXdfm6gUSTrqKKxkqtpak+FwLZYcK8fBDVun4aQjXFsAfASi5RmkcYNLe/U+JdMiO3TCyXAsx0allP2/+RgD7PynN0Va1lBYMDqW4xMnAuxQsPMZnz2KSLPgss6vrJYBtgRW+pB1ZNufAZdz66YORfQwgUKod0GQwjnHuCsJSA6vv3GvprjZ28GI2CzqIu3evEmVp3iMpt0yBdZ8FRlkehOFHXw4RFSL+11prgYEmlmFwZ3NmqeXdq+gagVICOOeoIAIh6jUealhr5sSh+ugZdiM5+s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wmCwMGUPZrX4BfffocGZPyUWjzwU1sXH19zxc1O24gy4aGSZYiQFsbUeElAF?=
 =?us-ascii?Q?mR8fLVk7TVxJWFZm+pTB4+1XRdua7zoeLTmeKh0PFyYxmyBxO6DUjRHE/mfE?=
 =?us-ascii?Q?0CRtUUGRpOY2QRlsnh8UA46VJ79xy7lh+5/06b3JiRVSzlZhd5ntTir/A1RH?=
 =?us-ascii?Q?LRUustZuMlAH6Imo86wyMJ7qJ5zwO59xSfihaZJ2YVyjeK4Nh+EYdDeyp3T1?=
 =?us-ascii?Q?vtw8GShKjDkGaicT52FQLALtCJDFlwzVVZ2wmyYw4hvowQehdj/pF3haHKbE?=
 =?us-ascii?Q?2bQhkEWt+MfOdQ8n4HPcRPuJYi8oy0xxBIUDVD4N4iF+rcqCTI5HNiMVdNCm?=
 =?us-ascii?Q?fp1ZMjMSjhHqIQSxDGbujiUDd5YBOJw6ZB/o/FVyMCWVu4voO+8e56YJGEpB?=
 =?us-ascii?Q?NiZ9N3PbcFbn5h0GXcjsJ0Rxw+Hlb/QmMoSpk8owwGBGQ5H0PqBnX87R/GLj?=
 =?us-ascii?Q?7eTCamu2c9Z/BNXXYmGFhemfAOYvgCxuXoSYPNNZ9mUXfc0Twzo1XIxUsRyF?=
 =?us-ascii?Q?QERKrIwDS6E4qjmpZCWS2at6y0WCNcxacUF5lyJQ3xlXqGxg12anyEUXFJ0b?=
 =?us-ascii?Q?QEm/OMzg9e/TcZSuvWs5qxGBSWIl36I7T9Ga+CKJDTeycOHcrvvCBBw6XXiU?=
 =?us-ascii?Q?n0SGaxLlLeL2vukpA5hCUY+ZCOAUxz0i7wWwCj66usJDl65OcKs8aMboVQ1E?=
 =?us-ascii?Q?k5Tdzldsrhf88WE9Zxsma0G7XExVzgFX3i050K11WrdnqYtfHm57J+n0J/SH?=
 =?us-ascii?Q?xjyGmdfgLsNtNh0I1APxFlLVLJJsfrnB2Ix/7ONGnwy4fT0cXRqAxUJP5xDU?=
 =?us-ascii?Q?dSnAI7INsEM3b279WWpeWrqRBbJi3pPDqsJk7gDFE8/L9bdrnnr+PKb4deBq?=
 =?us-ascii?Q?Wzn/C99Uu2b2VJ03hSKpBJiSx+/CYqFtem/3Uwy2iKVQle0E3WmMOGAYWK4J?=
 =?us-ascii?Q?IuM7Xk9jYUqdaHcfBuY+bqJl/2FW1CBMRsT0OOOUUZPZvecdzX9f6xE3l0M+?=
 =?us-ascii?Q?19aOupuTYq5iTCnYEhHZg39TrHlKjRjugJ/L9uJohtFWp1ZFg5nip/Nx5ado?=
 =?us-ascii?Q?nYc3wcZxLyFWvVCjr6H6qmCzrCWA4w70tGfGQyXUPWLttTYFu57RNK1GCw0k?=
 =?us-ascii?Q?GLd2xIfQ8WC0gBWS0d5fFABOZgz5ayyzaaTsBfEEq6Qbof+asnkL8VBly7m8?=
 =?us-ascii?Q?bcjltT2MCPfdcG9LWdjJcj0sJ4bPsLUetty4W/adcAJzKQaX9vzToaN3r1ZU?=
 =?us-ascii?Q?cbyj+kO6VdQ7br0nly4OcThzvzCRx/N0mF6CYxGSNfcFCJ1N1Jzcv6WSiIWL?=
 =?us-ascii?Q?E+bt0qtA+wLnjjlh828eNkKITWcP/4qEtkgBZLkejZnJk/cfZpgnojC46+aS?=
 =?us-ascii?Q?jc2pCx7A/slC3seVKG30Y3ZEYyPqA2RA9af2siHAR/BF+dvt1Lvoh+FO/n4f?=
 =?us-ascii?Q?RC4CK4jZ/b0IzYWV++PjNjKYDD9m5e+EyofGD+6P1luDnVBN3jpY4hgiOnuR?=
 =?us-ascii?Q?geIOmyFLImKmJksEk6NNhM0cGBGclJir5kLvm1caIZ5DSqR958+PXlJ/FItH?=
 =?us-ascii?Q?Vy+SKZG2IpKElza1uFBzuIr7r/6OsTHkyc1XYE+DKstuF+UveEe3+bWbnKal?=
 =?us-ascii?Q?5qMbQMbgHYhx5Yxkd8UXn9CA+Xdd7tdplaRZ5jD4tIFGW4z9w5U6nK/Z4t6d?=
 =?us-ascii?Q?J4PCGXamlLNr9hR7E2VukK4gqBm3Gk9rRTgQFMl5nMlvCcW183kZ1EMdZomw?=
 =?us-ascii?Q?PWVApB1dlg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d87748d1-71a7-4ad9-5c5f-08de7ba5343b
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 17:24:21.1485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pozyiVj4PUkgJO5YXGhHTkZdHeCQnt88xJ5kPa9r6eOdO+FLV9hz8aYMTqOyafsoY17lV0qfeyFBunXGL19GvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P189MB2691
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 17:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232583

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
Changes in v2:
- Exclude .elf* files to fix QA arch errors on all architectures
- Exclude *-x86-64* files to fix additional arch-specific test binaries
- Tested on x86-64, x86, aarch64, and arm builds
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-devtools/go/go-1.26.0.inc        |  1 +
 meta/recipes-devtools/go/go/run-ptest         | 23 ++++++++++++++++
 meta/recipes-devtools/go/go_1.26.0.bb         | 27 ++++++++++++++++++-
 4 files changed, 51 insertions(+), 1 deletion(-)
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


