Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B115CD342C
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 12:43:45 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17489.1778071423025496071
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 05:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Mv/5Q9At;
 spf=pass (domain: est.tech, ip: 40.107.162.24, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cr6iJUWi1sBE7Jqs57fdLz+mxW/Wqo4ZZFRryaMjGDvFtcHAljlDWtJYguHWoBD/zAa2jvhR2i7MpHvwWabRGyzWgpIHKUH9AO5HV+yWwgcHilJ4rRttAoY9GiDiTT6zhJSN5xWmlF62HRloMSrUjoeasuQQts7LNmBTtZhdiDnMf4tyHAJekbj0GG+Jrl8BsLq5hH9tlRT6d/zkEUeyYMjvXuft9Y2dnZxkzqqo3ClVRyx6V5WPB1fFUjTGmku2L9fSlfIJ8rcRKZkbb/BBTwBgVFNa8WW1soNbKEZ1+Xy4bgS3l9G5u/ZFW7xigLXjDKKtj6OGv4L4A+l2ScnUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5rwJFN/eHT4R/PaQl6xhEY9o/MBSV7awPq5OdGNkqY=;
 b=VyYmz+Ytyr41bTsP14t176lPK86OdhfL8cCpy8PKel41+MWzXIkSUL3iNXewg5e4VGHyev6TYk+mTWATQINwBhLAntK49Fh7inJ2TmA8NwMUxthlVIm+O77FTUBqp2fOGWgORkU7BeExholvppwoeR94eCNPe3/egCOLhNtktlte1tBE9gk+C1wQRulF2wZ4v0bb+kFCxXjEYG0pmAQLG8/HgCbH03qmxX9PiHYSDKZ+ALdMPkaBqfhKGto/4qCjIVKusGVRcDbY5TMDAHrCEUzj7M6J0sIsyZAMyL2cHhnF4dcCD01A46xqTUEfxk0dd5C+GfymqS6LHhcg/ZumzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5rwJFN/eHT4R/PaQl6xhEY9o/MBSV7awPq5OdGNkqY=;
 b=Mv/5Q9AtrwvRTe9Xxgelw/w1HpogUnGIVnIm/uSOqxPbAE1RteT5e5JyAMqw6E233KVp5BMSn95mbCiV3tL8wBbsPVw4ynyXTnz/IPtB5xtqZerXj8HnQ7CQHnW+eY2qZX7qI3QjLm7IzsPHrZ3nCmw/UDI7+k2tYvM3waICwTqrGLTtP5n7oGPs/23l5UE53CAZ1F7LFyWvJzMQ9b2zEc8mkw28mPgFI3rN/94v7xdbKgUYsqEOt2jdrDr+4r1cTqnnIMmTerP2jUCRLvz5NjELhlixoeTTtvaECEnU8cz+8DE57CNew0yu5WeTpntVfmwSaCNcxpds6uGKcxqOxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AS8P189MB2247.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:571::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 12:43:38 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 12:43:38 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] go: ptest: improvements and multiple fixes in golang ptest
Date: Wed,  6 May 2026 14:43:29 +0200
Message-ID: <20260506124329.40785-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0069.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::12) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|AS8P189MB2247:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ed5db4c-0898-4afe-dba6-08deab6d182d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	aU4MgSH2YQDljGpiiqlZ2582qviGKkYdwkuvvoMB3pYPVX8q+iJ3STz9P0U3dum3Y8d/zB7sAOZivU+NfahWm3J48dqp6HK/swj5Ous2HCSo3io3cWH7hbwX7/h+0qeaj7h/Zcy4Kzek1XzgjtzKnMm2/xWHwE1mamEyNC9NSt+YfQxcEjeCVrIBLT7Nvxvb7t2YqrY+dWR282fp2Vestvj7/R6Jdo1CE5dDvWpec67DiZWiCPZpshbfiZA+37oSw7yQXM/Ly0hsTYib64hgsDkaWK7Vqy9XA5zkUaADy8ksl6ZhS+ZXBpQjAtrhAYuk0ysSQsqWyvNYMX3HRJHCpMJk2qCm9WUoS222OcuRa/T4Z572nJrqjOyUX/v2nimIfcFvtI5lrFxm+mxuSnKEOv6uQmeWZn+ZF5ifOkhIiZDTWUgOf0WaEeCOHECUxkndQzPyecwgrQswjjAwg+4r0N8UerfKU16ly3G5vybK5sPLSa/SAW0JKSkRn3gRLmvaXigRg9HuYsaLE23fdvVlJGLY4KSVaVuYh5XtbJohCSKrTf4E+f4wDFzy/SkXHDHn0Vi1WkhwpeEHKTH8EKKjrKGZKoP2EJER5W7prom1R7vMVpSo5GCWVJelnetldCvtahgwShdhpWwT7W3yF+aAzu6kKkYV1cKfvBHGfy93jUY6v2HJz0by3dCz2/tk67T0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1N3pR4Fu04SY1uKw1CrtCTEwsAVmdSp3bNdZxgPJ/rc0gkO6OWH1UQfCO/p3?=
 =?us-ascii?Q?RBwGD2qDRipQThRZ5G12oZv7rWjpBBG4aQPAmTd8Rh7i0jB1PiFVAY+PKS+G?=
 =?us-ascii?Q?UY6iNcIDDMvBxWWbidy/9JJ5BuSSLa49z2sxPYB6O2h6D2k2NXMu6bENGHn2?=
 =?us-ascii?Q?gh/owM8pK6uVvJFPURNGOczs6VvEkM1nbxOVFyp/7QEKAjak0pQUVJWw+iap?=
 =?us-ascii?Q?6bwDDp+49r9Mfwi5L2o2/gibDsP8TgwDjzZ+sn7i6aQgty3iHJe/aIi3IrhW?=
 =?us-ascii?Q?a8m1NTwebWRsDfneUT+w83vgcLcUlc0pUnsnRvz0l5ix3oKDrQui1cIsMvCW?=
 =?us-ascii?Q?w//rY5ZpVYwJ4GkoHLLAVz5oBffVTgi0jKTF8WdrzzZeAgHdH+ExTfisqxX6?=
 =?us-ascii?Q?iItC58APgM23MzLJ5Es0q4MaiTeXkrdLv1xcaiIx3eHJhkhD4bql2isQmmCt?=
 =?us-ascii?Q?WtAjhdvUmmR1VL3iGWqrayO+auZX+lvMM5X4iG5DikuSxdgr9eNvMqb4mE4E?=
 =?us-ascii?Q?ExPiYRJGsvE1fhtdMfJ7ZV5gM7PypxAnHA5ZD+Em7ufGbXfSRl1/Rp527cbN?=
 =?us-ascii?Q?5XXYvx205byIIo80uelOHXVdMAGUtckviHfjcxEdoPnS6fuIgdlGk5WCj6Xy?=
 =?us-ascii?Q?xXRjWtpLPXn2looqCwF6ogOPL5V9yhIJjrNPSwpcYeGrVeCpJMjssXzgn+5g?=
 =?us-ascii?Q?7oSukSAa2XR9hVNEtVotkkzNpllCOvoaB1zaPrPSWtEarh9atpGiFymmr6hI?=
 =?us-ascii?Q?cJ/p7pDo0NsIvXWAtKHy+zyzmnIrRSPi60a8NRCXxMmiTFJrKZoXQL0IDeVW?=
 =?us-ascii?Q?6BeVV6V45LbjJa+X1zN4sfXbxsH+fNPyDYEw8K4k5vfEOkb0LfWoUziqd20p?=
 =?us-ascii?Q?Di7Qeb9r97nDh1lAN5SczqYD/Alafatik/p4IA6Z9FJWPKrHTnDwbpBSjMRj?=
 =?us-ascii?Q?ythTsyo0afLnys/IwoAS25tJ5ew74CEQlYBD/rWPFgtiPmwD3a88jvfaJrnJ?=
 =?us-ascii?Q?bv0viJCfw8a68kl1ZRCJ7u58jkWGOkW8nQrhgi1Isdp/nBwypZh3wlarCXC1?=
 =?us-ascii?Q?S49X7heNjKymz4BrfUBz5rDrgzACJynP0sea0mOXFiPzlgZDkru8oK9ZvGk0?=
 =?us-ascii?Q?SV5YAxuK5OgH6qfj71UOpwcLgIFbVCquIpbHDvNdV6l524iUj6XznCvkg5pd?=
 =?us-ascii?Q?o6WEhWJ11GgMpoUfA5036YvTJ0uDvA+A4JCb5Q7Vu9aGUT+Tk7KLGUMwsIvf?=
 =?us-ascii?Q?JVwFkNd02Qob8ALNfBsV8vzG0RXVvRLR6uZiIFBHJC+8EwVTTYw7CZuCa547?=
 =?us-ascii?Q?fdvJU4p7oh50zNQL1SbFRHvDNlzkQ4/zLBAtUarK8eEAxswyRKSwXcyDUo69?=
 =?us-ascii?Q?UQOVdB1ewYdbEQI7c+K3+R1NIImsUOQ5YJqqB6WTkKt5htRfp//7qw8+jctT?=
 =?us-ascii?Q?EWG2ZSoiIyzz5BtQ6mljSraaXeHtU2YYjqbI9sgKnsXAinbZjrj84t2hgyC8?=
 =?us-ascii?Q?CuF83oM7HupHXPi8UBScNdLSwV3jnxCq+I6cAcC6xk+K8c0ViIkSUpcRa5o+?=
 =?us-ascii?Q?KfQ61MkD939LXdurUJgOvI5ucfuPbi7txPQdLDme1bP3sqdqlmlxRHzR6HnB?=
 =?us-ascii?Q?MDPBhBB6zbubi91lnuSgEshHVPhr2FmhLtMmJy+uR+lMirDTyIEkjyckFpP0?=
 =?us-ascii?Q?2bxkTIxsXFVaeRlSy2F5y7w4MfIEJ4WV4Kkx7nEGyOLFKtz6pk4Q5KgHILrX?=
 =?us-ascii?Q?Fp9M5+kLsw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed5db4c-0898-4afe-dba6-08deab6d182d
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 12:43:38.0743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INgDAXTydv8U6bwJjtdEUHFocezdbdOmSlecZiql0vnrSxu+rSKdFzFRpuhevVD/lKbKfVNoU1zBIkjG2Hdk1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2247
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 12:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236540

Summary of Changelog:

- run-ptest permanently modified the installed GOROOT by symlinking src/
    and copying files without cleanup, corrupting the Go installation
  - Sub-package skip regex used exact match (^pkg$) so subpackages like
    net/http/httptest and runtime/debug were not skipped and would fail
  - Test output was completely suppressed (>/dev/null 2>&1), making
    failures impossible to diagnose
  - go was missing from RDEPENDS, allowing ptest to be installed without
    the toolchain it needs
  - bash was in RDEPENDS despite the script using #!/bin/sh with no
    bash-isms
  - file://run-ptest was in the shared .inc, affecting go-cross and
    go-native which don't inherit ptest
  - cp pkg/include/* would fail if the directory was empty

Fix by saving/restoring GOROOT/src, using (/|$) in the skip regex,
printing output on failure, correcting RDEPENDS, moving run-ptest to
the target .bb, and guarding the glob.

Tested on qemux86-64: all tests pass, 0 failures (~63 min).

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-devtools/go/go-1.26.2.inc |  1 -
 meta/recipes-devtools/go/go/run-ptest  | 51 +++++++++++++++++++++-----
 meta/recipes-devtools/go/go_1.26.2.bb  |  8 +++-
 3 files changed, 47 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.26.2.inc b/meta/recipes-devtools=
/go/go-1.26.2.inc
index c53e8284a6..8bb10bc89f 100644
--- a/meta/recipes-devtools/go/go-1.26.2.inc
+++ b/meta/recipes-devtools/go/go-1.26.2.inc
@@ -16,6 +16,5 @@ SRC_URI +=3D "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch=
 \
     file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch=
 \
-    file://run-ptest \
 "
 SRC_URI[main.sha256sum] =3D "2e91ebb6947a96e9436fb2b3926a8802efe63a6d375df=
fec4f82aa9dbd6fd43b"
diff --git a/meta/recipes-devtools/go/go/run-ptest b/meta/recipes-devtools/=
go/go/run-ptest
index ac020de025..b8a080526d 100755
--- a/meta/recipes-devtools/go/go/run-ptest
+++ b/meta/recipes-devtools/go/go/run-ptest
@@ -1,32 +1,63 @@
 #!/bin/sh
+# SPDX-License-Identifier: MIT
=20
-PTEST_DIR=3D/usr/lib/go/ptest
+PTEST_DIR=3D$(cd "$(dirname "$0")" && pwd)
 GOROOT=3D/usr/lib/go
=20
 export GOROOT
 export PATH=3D$GOROOT/bin:$PATH
+export GOCACHE=3D$(mktemp -d)
 export ZONEINFO=3D/usr/share/zoneinfo
=20
-ln -sf $PTEST_DIR/src $GOROOT/src
-mkdir -p $GOROOT/pkg/include
-cp $PTEST_DIR/pkg/include/* $GOROOT/pkg/include/
-cp $PTEST_DIR/VERSION $GOROOT/VERSION
-
-cd $GOROOT
-
+# Link ptest source tree into GOROOT for testing.
+# Save and restore any existing src directory.
+if [ -d "$GOROOT/src" ] && [ ! -L "$GOROOT/src" ]; then
+    mv "$GOROOT/src" "$GOROOT/src.orig"
+fi
+ln -sf "$PTEST_DIR/src" "$GOROOT/src"
+
+if [ -f "$PTEST_DIR/VERSION" ]; then
+    cp "$PTEST_DIR/VERSION" "$GOROOT/VERSION"
+fi
+if ls "$PTEST_DIR/pkg/include/"* >/dev/null 2>&1; then
+    mkdir -p "$GOROOT/pkg/include"
+    cp "$PTEST_DIR/pkg/include/"* "$GOROOT/pkg/include/"
+fi
+
+cd "$GOROOT" || exit 1
+
+# Packages skipped due to known issues in the ptest environment:
+#   debug/dwarf, debug/elf, debug/pe, debug/plan9obj, internal/xcoff:
+#       require binary testdata files excluded to avoid QA errors
+#   go/types: extremely slow, exceeds ptest timeout
+#   net/http: requires network access unavailable in qemu
+#   runtime: requires cgo rebuild and race detector setup
+#   testing: circular dependency when testing the test framework
+#   time: requires writable GOROOT for timezone data
 SKIP_PKGS=3D"debug/dwarf debug/elf debug/pe debug/plan9obj go/types intern=
al/xcoff net/http runtime testing time"
=20
 SKIP_REGEX=3D$(echo "$SKIP_PKGS" | sed 's/ /|/g')
=20
 for pkg in $(go list std); do
-    if echo "$pkg" | grep -qE "^($SKIP_REGEX)$"; then
+    # Skip package and all its subpackages
+    if echo "$pkg" | grep -qE "^($SKIP_REGEX)(/|$)"; then
         echo "SKIP: $pkg"
         continue
     fi
=20
-    if go test -short "$pkg" >/dev/null 2>&1; then
+    output=3D$(go test -short "$pkg" 2>&1)
+    ret=3D$?
+    if [ $ret -eq 0 ]; then
         echo "PASS: $pkg"
     else
         echo "FAIL: $pkg"
+        echo "$output"
     fi
 done
+
+# Cleanup: restore original src directory
+rm -f "$GOROOT/src"
+if [ -d "$GOROOT/src.orig" ]; then
+    mv "$GOROOT/src.orig" "$GOROOT/src"
+fi
+rm -rf "$GOCACHE"
diff --git a/meta/recipes-devtools/go/go_1.26.2.bb b/meta/recipes-devtools/=
go/go_1.26.2.bb
index 35a14b8e8b..2e18ce05a8 100644
--- a/meta/recipes-devtools/go/go_1.26.2.bb
+++ b/meta/recipes-devtools/go/go_1.26.2.bb
@@ -3,6 +3,8 @@ require go-target.inc
=20
 inherit linuxloader ptest
=20
+SRC_URI +=3D "file://run-ptest"
+
 CGO_LDFLAGS:append =3D " -no-pie"
=20
 export GO_LDSO =3D "${@get_linuxloader(d)}"
@@ -20,7 +22,9 @@ do_install_ptest() {
     install -d ${D}${PTEST_PATH}/src
     install -d ${D}${PTEST_PATH}/pkg/include
=20
-    cp ${S}/pkg/include/* ${D}${PTEST_PATH}/pkg/include/
+    if ls ${S}/pkg/include/* >/dev/null 2>&1; then
+        cp ${S}/pkg/include/* ${D}${PTEST_PATH}/pkg/include/
+    fi
     echo "go${PV}" > ${D}${PTEST_PATH}/VERSION
=20
     cd ${S}/src
@@ -40,4 +44,4 @@ do_install_ptest() {
         -exec install -m 0644 {} ${D}${PTEST_PATH}/src/{} \;
 }
=20
-RDEPENDS:${PN}-ptest +=3D "bash tzdata git packagegroup-core-buildessentia=
l"
+RDEPENDS:${PN}-ptest +=3D "go tzdata git packagegroup-core-buildessential"
--=20
2.34.1


