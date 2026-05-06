Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1670CCD342C
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 09:21:23 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14481.1778059273558713044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 02:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ZmSM8bvj;
 spf=pass (domain: est.tech, ip: 40.107.130.9, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCh2iAfLSSdcncp10h6RWZ9jX0LnG0psBUi+ecKXojIVgUe8dAhJ7fhY/G2D8uJ+WAk4IwMJ0CFlhmPvl1s47sczUwe12FBIlGOAcf1pMYeuvQ7crCIEyJjfytBLYYfsVGXLIGlZM0WdrwQ4A5WaOX9dPmiUYI8f4GcZjB3h8e2/YJGvWSrSssamQmXEBTMhXLTeHXIAs+ALFmuc/L1v0mZXOWLYlq9sQ9NIEpxcrMv4gIE4RsMngyFYA2bek1ijuBN/B6RocdhefoTZmyRVx9ea9N+mzP4m0Z6o19SdotgQ88TAimbNXMEtxrm8dQtmVaQV2R4Dk5e9wGBThNcDhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ywnj4Go32YcqlucxMwS9Dj+Xyp2DotIxS8038QSL/Oc=;
 b=nBcU7fm/lVNIvds6C7pwwdfjrziuipOGbghpU5TBNE0zmO3mnd3GN3JAt1u5L3Uv/H0dlLlTEP8NbIVPUODcO1TIg1eALcr25f+tRhPIgQ4dGrSN4RlRkuwAXqv4WkktiY67ANI7QKYk1sXsPDoZN0jmnMTDkEi06NhxxrNZuiorxXqUSIHydzVf91meLQ0zBbsou3gx1DRKzkppYVvtFi+9RDzUo8Yy8/ftEINAxwjFusiZKtEGwsiRqs23F0NAuA/vaMWHRWTkKiwQ0vvxR+QE5fThSirphWJh0YObFdWhO3u1QTiGm9emC/YEWUEgvfhKO6NM4F305lwK4xHMCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ywnj4Go32YcqlucxMwS9Dj+Xyp2DotIxS8038QSL/Oc=;
 b=ZmSM8bvjVFBamkBjRpIx2HAueBcUDk++GhLRKpP73NYanPGxHZX3b3AXZL0EDYbIevKffN6964P9LyO/JSG6ntFmg8XcbLX55yzkSIpQsY4MpsFU2SGR5kB0w3DXPBh9cekpYA9wqNCIH8jFnUtzaWkKhkmtLvQDPgIMUAM44UIyfw7NIvhaA78ItP/1jbwH9kw76BWSmSPTB2PUrp2wghk/QlIZcPsLoLiFyEPeKk5gQnVmDpSaeX5VSIj+JdjpcRFa6nq2FliZBFYmlIpsIzMmgy9IpiY+CKfO67bFR15Plzj1ONUuULJMZTf3VdqyXWPXAQaBvmJ/tuhRz20FPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by PA2P189MB2672.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:40e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 09:21:02 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 09:21:01 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] libxslt: add ptest support
Date: Wed,  6 May 2026 11:20:57 +0200
Message-ID: <20260506092057.27057-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0165.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::6) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|PA2P189MB2672:EE_
X-MS-Office365-Filtering-Correlation-Id: 10a83185-7a02-4f74-f06f-08deab50ca5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|12006099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	i4Ww9Y5X/acEKPeieJKlkUL9/MTtNdYRupZCkTQFPf2QqFpJrM3ZhD+DqbGC4/HR8wjKfc0SUJ1g6ESp+xvp4E0zEF35NapxilQrMAhClRteqlTahM2ETnL2HQh7QU8I24ucFNN6CGOe0MWFYPRrWHPxoFU4IWK+LmcBCgT9UbmU2fveiRuLU9zNLMWQsbRt9W9C6euipsEwXlwLPU+0HQfOAVDN4LxsO0Fxu2gcbGasl2g28K/c50CaGi4jkdv5lRuvWRONWwCZI9qzxi0twxcQXQ9bQhZSOfrI0BLZ9RgDrw/aDn1dDE79aMKI6Vww0gq66QV/FnluTWg0sLrkmdJ+J+gh+qNfN0IhaCyo6mdsd/IkTEkL0kNKLaqyPHws3135nQ8Bx3/3H1jm5D8WxpfpjLER2zHnSmBBi2rlGrfVMVZv8g3M/BuMc0DxaOjVGqOFrwOgVrEshDc2+TAshWJEqte/+3jq2Mf11Nt6RLnWiKjsHZOg6sJJcso/EjIA3iIMoPMvW0sHz038F7csMrhcP84zY9Vo16RnEJqDMSXoMwd2t+IRQ04cOKsXf6qE1d0Q9zQc14WVRd+gQsjd45xcEOxhgN6E7gfWTpZzdzw3zRoCB14tPu28QtBY1CDmknbkw7SJvceNnFYykNF3FZO/gaxmPvBgcHIAMN+rmiRQoIvWh1kDajRGmKw2kRNL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(12006099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BzcEHH/im4TmpQWyZi7qnWQzoJzg78yeiJ+BQONlYYPs33ZuGf6DZpjtPfCq?=
 =?us-ascii?Q?NRYL6GDquTuIeoEboHW+U3lyDt3xGaOpGpdTpVHbWa/9XbsSChnUe9oYTLGM?=
 =?us-ascii?Q?cQR9C0HyB6apnBk6xfbCoNcTTxOMnnHI2Cft0NHfZIwHFPVZ43nffMVD18Oz?=
 =?us-ascii?Q?h/wBVqP7yonmn+xnbJQE86Uv+WmAwQtcQfmSZa1MCiw9WqvLCjkiYYXshHh9?=
 =?us-ascii?Q?3JWrVvT/PN/XPtujcUYiVMhqMkSVWDfau3SWmvs1Xqkr2mezyEldXEsX9WIg?=
 =?us-ascii?Q?vQWKiYFq/WLtEWdoiN9DICZxZW93d7IwKU9NSeX3I13niaDcTkLjZU3DK51q?=
 =?us-ascii?Q?bsWuSCyHaOqbl4JhqGtVqyduCFCHMY7+1DowxTkZywzcFjxkpkstxGw2HDTr?=
 =?us-ascii?Q?TYk5amCpyFKFMsqcDe/xDOP1EBKx6hr0SHOeuyirM+rbBDeR7orIphIyLxIT?=
 =?us-ascii?Q?SpmWYQ1T9SgkxYy+Q06TwdNujNOttKmW8otDPNTq6mkJ7FiymIMxWxv76eD+?=
 =?us-ascii?Q?/2we++f7s6GslzIrY4CCIBvZKSWMjkR+NMwvj7Bwr04sJ0zpcvFSPAf9GzGa?=
 =?us-ascii?Q?USFgCzOmnxqCZIIdmTIrb4goDf6/QEB5pd9bs4Sy6uWcStuf9oiNSqzZQOlK?=
 =?us-ascii?Q?xJ8sSIYkJxksb6P4iCZEiQ8xWsqP02TSgBKpWF19o63iowF98T3yBiq4+r92?=
 =?us-ascii?Q?8ut45stb2XNkxTPPubHTLgmRVHE2YrQKbwwcnoTze6tyB3TKa7bFsyP5Bv6I?=
 =?us-ascii?Q?rDYWU8fKGBEkj+r4sslVbDufPHnHCqjDOPqhinY9iPqI6ZAIfy4E1MME8z8c?=
 =?us-ascii?Q?qI6meHvzyX9lsPDG1tHGfhTVhDrWHordhc6ToWthcsZFARvfPfMJhD0nQ/kA?=
 =?us-ascii?Q?wBORA3yyKTDm+lOtiuVYUCTv44bFwp8vvWdHkHvN3EZ1uwEXaWhtCebbt412?=
 =?us-ascii?Q?mIflwQqv0F67JVG0mqnVLHA5+li3Hnvk+kKKi5qbU49+xhPAzUUMbnGGh+sh?=
 =?us-ascii?Q?znCk0zGtnabzbvGt+ME3kgmc3Mh+E4ueyU71a7AGwYhtcY7+EewbAkp/eNDc?=
 =?us-ascii?Q?eF3LsZacDU3a4096tSQAxx+gWbiCwmTUtvwKN7+TjrsFfJ1r1VhbvfMBw2xi?=
 =?us-ascii?Q?isrNVL/rxlIM48BeUYZeJPs9FiELrn9fm96TcaHblDBq7C3aQTpQGIQF+1BR?=
 =?us-ascii?Q?mm87IDddqvPYn7qeXtFKZE95SpWWWtvfkHzv/PbBbMEXicBzErBqoqEafTud?=
 =?us-ascii?Q?fKd3tngUo7SULHmNXbZyw6uywTmYop3YA/lxvCgY2P2Il8ioGfJILTyfHzKX?=
 =?us-ascii?Q?mUoao0GKnQTrzcE/DkSRsl/hw7xmZbZ61f3sJnAdQ5l6ihVi9XL6mtkDYGMm?=
 =?us-ascii?Q?FNZJSssTRhCTDowi4scwE0swoE0ypLrulwsuRHO8Cgi/zrvntgva6VLb96gl?=
 =?us-ascii?Q?1UfsWn7O9GdsQkxVkk9iILMTglC4OIWZvvxVds3g7Fy53XALgISQF+4Pe/Uo?=
 =?us-ascii?Q?+7q1NNY8AgQRgmNpeZ9Y4w8pGnotB9jicCQ1Rdm7RG4yVfXwi0R7SvUtd03d?=
 =?us-ascii?Q?HacyWbZzoQUtcrzNFied9phJZk0hC7zy3z5Y1D0gwY25Bg8WGagnxZLKzGdX?=
 =?us-ascii?Q?8CF76ucPhCV5PizheIor/SsH+xGRxcciXtgrf5hXLHqu47/HLnbt4eISSDdc?=
 =?us-ascii?Q?E1egmKZEjTmaP3s8huVDRpA4g7flwzXdnukRRW8ichaO/kEB/qwDCyHDYp2g?=
 =?us-ascii?Q?urvmzWteGA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a83185-7a02-4f74-f06f-08deab50ca5a
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:21:01.6713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9y8HPhaNRuLJamEiukjnfgMu7HHoyuKQBQ1trFUVTzEcQ624+doQgiXCqiebCWhZaF5APd1znmu1OASYViuahQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P189MB2672
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 09:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236538

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
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-support/libxslt/libxslt/run-ptest | 17 ++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.45.bb | 26 +++++++++++++++++--
 3 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-support/libxslt/libxslt/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 1ce8eda46d..566445187d 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -60,6 +60,7 @@ PTESTS_FAST =3D "\
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
index 0000000000..b82725295c
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+# SPDX-License-Identifier: MIT
+
+cd "$(dirname "$0")/tests" || exit 1
+
+output=3D$(./runtest 2>&1)
+ret=3D$?
+
+echo "$output" | while IFS=3D read -r line; do
+    echo "$line"
+done
+
+if [ $ret -eq 0 ]; then
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
2.34.1


