Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471CACCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 15:13:16 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.9])
 by mx.groups.io with SMTP id smtpd.web11.12116.1761145986273828327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 08:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=UQ2Nw8V1;
 spf=pass (domain: est.tech, ip: 52.101.65.9, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rB6sQ+8gafd9yrKBXsGJ+2FJLUADiFw//KSE/SKKCyqGGp7HJ9XucA5fLW3XMnlHBL5fueLzN0LfVh/YTkk3jiU694bEIBqf3IUGFtybT7CH6ok23vBDPodRjJMtFxCDyfQOHE01sJwgCo1XB3bTAxyV3sMDCtqOzRr2GQnFC+BQqeLbGvi9DXpXLlmhz70YhuiGEE1gjz/YISqiZVxGCGYsVkXmfNh1Npvg+Z1IANOHpukQhAoVr3C+1nKgKsBMdLOlaZKKmAei0J0dQVyOS4o3hXVFkUBUyODVvCp8SQQSV788M5TU7w8NUvioYXoy2rp0H/gAgUI4Yimd3YCQPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1pPsKyJBZGfEHNvY1FvnKlRbHVofjqMXh68/jA/r6Q=;
 b=mX9qb6mp20FzZQqUux/KTLdjfmS5V0BTltBRHEPCVNBRwhpv0TwYZgwI8jsxCEpFLPbWT8QJ2MM1OrXty3plgRe/yJR6QZb/S0qsN7vgojrpf19v8yXzHIjVANk7xgx7BKFrwlaIWq1MvkjfOZ94uCf40RnJbsXxVbZ+uvEJDGxhehIjrTT9Gjt2JvMrL8tzMfNEspBO3SGR1HLa49uLNHlkvVJwaJECf/HadVgZNhmeMMUqNoWfryrFJcbZep8RDA/9mhbZU9F729zFM2q1VX+WWQO9r/GnAZG0UZBLPBEOzprcI2gAIQAjazFWmZCIWnDUL3x1svTcyNOSUOsSgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1pPsKyJBZGfEHNvY1FvnKlRbHVofjqMXh68/jA/r6Q=;
 b=UQ2Nw8V1gVjLzx5QoBjuNSKY+c0iEB673PQf3bfebKuCevp82s8dxXPvKwQp+H6zSqA8DD2TPy3DUMv7/xpa8Vyw85PCdUAhEJbQcGK8LP2ChQHmgfHWCIV8NwH9SQpH51cH6BXPhg60cG8TEvZU8G1cgMtDWFXFOAMqFeGBh43cq1ApDcHkpm4uMqSwQi+bKMXIvBXoV1UTsd3PjzhAL94NySg1Eqep2QDw6ucfGpBYGAVXI00ezxK9EEPWCn2AXgL+15gpL7++GzjQwfFCDYjUPCn7Zp3eMRkn0DzniSF3IdQzSgdc4/pmn5Xr21pg4iakB1WYPbMB5Roe9O8dww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by GV2P189MB2959.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:265::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 15:12:58 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%6]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 15:12:58 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Pratik Farkase <pratik.farkase@est.tech>
Subject: [PATCH] libxslt: add ptest support
Date: Wed, 22 Oct 2025 17:12:39 +0200
Message-ID: <20251022151239.87981-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::19) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|GV2P189MB2959:EE_
X-MS-Office365-Filtering-Correlation-Id: f115f9f1-eaad-4606-c9d9-08de117d7bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gi662MPQtN9Jeoez9q9ZR2xRlOKsrm8zZbo0ZSpY0dt26woDE0NFjhqzQVLS?=
 =?us-ascii?Q?ih4RVYHtcDOuIhJuJLU2iPaMFBaWjRkoV/fZMqc+qc3sLicV3Ta+qseXpvEw?=
 =?us-ascii?Q?nlI8v4d22zptf07vCRu/J6mgqMbLbOFfuoWag70Plu+hFYVSccM94F8yykvZ?=
 =?us-ascii?Q?YXFyom1u5gqab9Ab0MsO4ulVhVQE4zTCTATjRq9F+qN0f6HaPPyz3lRNjOdJ?=
 =?us-ascii?Q?jvUd0/ffTweghjdRc9I3vxlrS4T7anFeOUfCWsa7x22Ryw5a7ExC5UgqLYKv?=
 =?us-ascii?Q?LH/K82PhNkiRgdkGbfa6YTRzGLK6xr94N5UmoM2oboMoW2m3UIKQkiXQLj+j?=
 =?us-ascii?Q?bq9Z+D6E/ysUjWO2F/ageZ0CFFSQL0gaPnqBVKExiCcj+OGFHEqjQFvobTX1?=
 =?us-ascii?Q?KyetpzseivdxeRgNEJ32NpZhgIL1Du29PSsQPQwHClDU9RDrTkmQwwf2dQ+x?=
 =?us-ascii?Q?wdp096XGdOhV9Zpgc1P9Dz9BRuezcEYNgX0b4Y02x/mx384qSy/USXzT8eNr?=
 =?us-ascii?Q?07pLYuTb+QRoDiAJ+cW0FnYgQBjMCVi++uKRPPr65KbZwILu/WVRjUehluZu?=
 =?us-ascii?Q?jPCeCJvrx9kocSDABbrbgEc2ohJEvZA6DMrXOGxMxr95FlwW75ytzLiaD8ku?=
 =?us-ascii?Q?iaWNMwRNW06wlvTjWfTDh7Y2B4NHDOVd2MPvyPi//vwUGHjR0xNT/KAXBa6v?=
 =?us-ascii?Q?4ho90m2buRXuq4Xa87Es+a1Os0nM44yOqZYjaAKQDDwhVork1ABe6niJ6EMb?=
 =?us-ascii?Q?ijM6N5u7a90OKy4otn98rQcVViMW5XLgHRG5tCxMoNPobfBFi6dtYj4kAxwt?=
 =?us-ascii?Q?3H8lel1rShu39PnlrwJU0FuBUb/q/HTAYIR69fRU6PH8VRWBDW+s2S7RmCGD?=
 =?us-ascii?Q?RbuIBk6qY3/0D/9KqW23wbFOffywIfMrUS3zMJB69GZAgg7N8tzLjSh+AAWE?=
 =?us-ascii?Q?D4UgHYpRJVpddmpseTbmYl7G41ZqDvF68xL5js2Ce0yI0bkFKZmYwVAl0uW0?=
 =?us-ascii?Q?/GCcuFzBsWgt3nKkr7LRFux8NmPD6hY2EKbbfyQWXmsC6LJRW7GLvdPeZ9XF?=
 =?us-ascii?Q?Qq2goz5Ljt2ECPxT5CBADAUTDhsyvixZ7l8e3+jex0DWTIsi2driyTzeo7q3?=
 =?us-ascii?Q?lDBz52R+eHPieAi5LH9PCRSwCNrSm2ogDuE9JzmUAapVxxwuCY1DhuqxqKLc?=
 =?us-ascii?Q?jFnMnSV+eelDqE0T6cckzYQbyq70hkKeLpdjZ3/w9fqe//exmMhCmxayMQlK?=
 =?us-ascii?Q?jlL9NLjECLtoecXYNUDI6CTCxzMiQ160IMY5lPguZGQ+QC3/uByHLT9ylzYq?=
 =?us-ascii?Q?g0j9Tw6nCSqEnONeBSfzl1cNyxVrMHZLyq6xvK+4ql9vDXTCGoJkdYfbLLYr?=
 =?us-ascii?Q?kc700Aow5Y3hm6rZXMdmpNeF4B4syZV8ziGAcvDb/NzXzb1J/wSgqh7BCZJi?=
 =?us-ascii?Q?nLH8w+QPrPKlSEL2T7dQzy5bjyF84NJ44cfGMdIi9CHu0XjFryCWWw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1TKNX6bBLO3DFBqEGfaMO3K0BznqGLjvD/aZwzc7jat8SgiCg+4xeZLDHkEx?=
 =?us-ascii?Q?WqbO85+HqzMuWHKyiZ5dicSHPgub5vR25pmUb8wtpPtNUBx6SZuKb3nXquwP?=
 =?us-ascii?Q?V3BFzY2I9TcdU5iXyU4qAJn/P7SmvadRmQyn3JxW1hDrf8hx8nSZ+5vVDFaD?=
 =?us-ascii?Q?hJr7YWl3IDzE3HPTusMYbWrQAbDiXNhDw40H8gXSxhc+E0DYLhkF8CE16h3F?=
 =?us-ascii?Q?81Ufz9whn8dYUWajgURBpcpkYzT77xv0K17CmJBjF/mnta5JC8NfkqStZxQZ?=
 =?us-ascii?Q?cWb04Sq7HocHCEeRMgZa7JDprlbglWdXLOAUF3OyE940lmknI14keDVdt3mw?=
 =?us-ascii?Q?cjkahf9ZUjlEa8NPxI25iOscM5PwUCEsACqOflJPlEYzAG79IZoAb+LFN4mN?=
 =?us-ascii?Q?hgW/3RdPUgFufp3ObqwbSS4oIpdPk2Das8zhpGolTzX8uzLGMFii8pVE3KUB?=
 =?us-ascii?Q?JTEKG2CXgIzRydvHqZKLUx6lgHqGiRnGWyY4Z9xTPyGvmw2wFHkfnoqULGms?=
 =?us-ascii?Q?u65uT2MKrsGHSI8/UKFOLCaJTlj/3LyODoI2eK4sYKepaDYkCvooO5sUryDk?=
 =?us-ascii?Q?ATx8TzUvqS2/6Ir/4mBMCXislCJC9Gbh3lc2tggbB/5gEFOOgkuPKT8D6s4c?=
 =?us-ascii?Q?xprupCHDpEbNC4hwvohQ+wtVgkeT2pGoI+fBUSautDGV+P2hxQ+64TXgeB79?=
 =?us-ascii?Q?lOEUvOB8J4fdiJBga5RAgkheQWQt3S9s3LmiMsdS4jIk4Dn9sSNh72Jj/LrN?=
 =?us-ascii?Q?zsT+sCQR0q37hbnwpdQnB38ZXb+DcZh4kViC710HZfXBK1N1m8OZ4aXNuAPd?=
 =?us-ascii?Q?rE6GptYWroitX66/5e9D0Iv8cxHCPlQs7DEOtshq7A5GagLBBsxTTW2pyx36?=
 =?us-ascii?Q?bPmwNLaI28TqC5vwkFeaZrttL+JnRWd1X0/9Uwg3GR7YjcmRBHDbI7iw2oLg?=
 =?us-ascii?Q?AHRCAvFOe6geKHecUv6z/+9yh6uQ54NfrLX9uLxXK88VTf5l5nibVa4p0hLj?=
 =?us-ascii?Q?DU5eRG5XN3bFrZ3usFVUY0zubb0OLMlPL0iePMM0lfdQbD38Hls/3MfVXzSj?=
 =?us-ascii?Q?DcP8kx8bdxRiFFZFIVnfDKpTINekT9T/DvKy0GyHEC4W1g+YAvg32JFry7+j?=
 =?us-ascii?Q?m53k1NzyDHrUcQJPHqSW+CCNd44WPXRF23s2jhNUthpB4jLYqcH4XuQ+2nXN?=
 =?us-ascii?Q?IZFdFbDQghLQEHa5KRZi2/zsneRsjQAHd2Z4pZIWcf+3OWG7Q3p4+MU3CreQ?=
 =?us-ascii?Q?z00J7wOthdt2EppZMo2kEOaMdTz2GP4htuM4WAGbd2rJWHH6bnpyEGdkCg1j?=
 =?us-ascii?Q?xiRW/R7QMt43Lf8MwBZJDIxI578FEyvrxE+219YS3eoS6b3PldQsj8bpjsDI?=
 =?us-ascii?Q?iquczs4nVKElVWJ1/S0p/HRed7Cw5goRU0fRQN3NfCG52/xQdRIjguu9X0IR?=
 =?us-ascii?Q?b0L25xZ0L2YCtu8oAOvzxePe6/dOEOTwHvYkh0M+ncVPDHMQucb4hVi+OEtr?=
 =?us-ascii?Q?sKyL3f+R3PP63/0kBokoyh34VwLod8ykGnTukJqMDg+uWfOSPsHSz+HRNHUp?=
 =?us-ascii?Q?OVAwFeS7cfuOlcrmfqTK7C0ETOEePJqg7vU/f09J5yfOGe6OPnw+IYxdHqCh?=
 =?us-ascii?Q?gg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f115f9f1-eaad-4606-c9d9-08de117d7bb9
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 15:12:57.9509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPZWYwcmQ3UxC/jr7uXYrERqK7MSy9/uVr5AGaEfFGEvn0CKsLcsZlBJs32osBbTuhNoLOY6CHUmBNoqihad4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2959
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 15:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225200

Add ptest support for libxslt 1.1.43 including:
- do_compile_ptest and do_install_ptest
- test data installation
- cleanup of buildpath references
- added run-ptest installation

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-support/libxslt/files/run-ptest  | 25 +++++++++++
 .../recipes-support/libxslt/libxslt_1.1.43.bb | 45 +++++++++++++++++--
 3 files changed, 67 insertions(+), 4 deletions(-)
 create mode 100755 meta/recipes-support/libxslt/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 9950e46776..b295e0049f 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -47,6 +47,7 @@ PTESTS_FAST =3D "\
     libxml-simple-perl \
     libxml2 \
     libxmlb \
+    libxslt \
     logrotate \
     lua \
     lzo \
diff --git a/meta/recipes-support/libxslt/files/run-ptest b/meta/recipes-su=
pport/libxslt/files/run-ptest
new file mode 100755
index 0000000000..a2b28e6a75
--- /dev/null
+++ b/meta/recipes-support/libxslt/files/run-ptest
@@ -0,0 +1,25 @@
+#!/bin/sh
+set -eu
+PT_DIR=3D"$(dirname "$0")"
+cd "$PT_DIR/tests"
+
+echo "=3D=3D=3D Running libxslt ptests (verbose) =3D=3D=3D"
+
+if [ -x .libs/runtest ]; then
+    echo "Running .libs/runtest --verbose --timing"
+    ./.libs/runtest --verbose --timing 2>&1 | tee runtest.log
+elif [ -x ./runtest ]; then
+    echo "Running runtest --verbose --timing"
+    ./runtest --verbose --timing 2>&1 | tee runtest.log
+else
+    echo "ERROR: runtest not found"
+    exit 1
+fi
+
+if [ -x .libs/run-threads ]; then
+    echo "Running .libs/run-threads --verbose"
+    ./.libs/run-threads --verbose 2>&1 | tee -a runtest.log
+fi
+
+echo "=3D=3D=3D Finished libxslt ptests =3D=3D=3D"
+
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.43.bb b/meta/recipes-=
support/libxslt/libxslt_1.1.43.bb
index e08e92085d..0f6ec4ba02 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.43.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
@@ -11,10 +11,11 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D0cd9a07afbeb24026c9b03aecfeba=
458"
=20
 SECTION =3D "libs"
-DEPENDS =3D "libxml2"
+DEPENDS =3D "libxml2 libxslt-native"
=20
 SRC_URI =3D "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.=
tar.xz \
-           file://gnome-libxslt-bug-139-apple-fix.diff"
+           file://gnome-libxslt-bug-139-apple-fix.diff \
+	    file://run-ptest"
=20
 SRC_URI[sha256sum] =3D "5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea33030652=
31a6d403f0183a"
=20
@@ -26,7 +27,43 @@ S =3D "${WORKDIR}/libxslt-${PV}"
=20
 BINCONFIG =3D "${bindir}/xslt-config"
=20
-inherit autotools pkgconfig binconfig-disabled lib_package multilib_header
+inherit autotools pkgconfig binconfig-disabled lib_package multilib_header=
 ptest
+
+RDEPENDS:${PN}-ptest +=3D "${PN}-bin make libxslt-utils libxml2-utils xmlt=
o coreutils sed grep diffutils bash libxml2-utils perl"
+
+do_compile_ptest() {
+    cp -r ${S}/tests ${B}/
+    oe_runmake -C ${B}/tests runtest || true
+    if grep -q "run-threads" ${B}/tests/Makefile; then
+        oe_runmake -C ${B}/tests run-threads || true
+    fi
+}
+
+addtask compile_ptest after do_compile before do_install
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    if [ -d ${B}/tests/.libs ]; then
+        cp -a ${B}/tests/.libs ${D}${PTEST_PATH}/tests/
+    fi
+
+    for f in runtest run-threads; do
+        if [ -f ${B}/tests/$f ]; then
+            install -m 0755 ${B}/tests/$f ${D}${PTEST_PATH}/tests/
+            sed -i -e "s#${TMPDIR}##g" \
+                   -e "s#${B}##g" \
+                   -e "s#${S}##g" \
+                   ${D}${PTEST_PATH}/tests/$f || true
+        fi
+    done
+
+    cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/ || true
+    find ${D}${PTEST_PATH}/tests -name 'Makefile*' -delete || true
+    find ${D}${PTEST_PATH}/tests -name '.deps' -type d -exec rm -rf {} + |=
| true
+}
+
+FILES:${PN}-ptest +=3D "${PTEST_PATH}/*"
=20
 do_configure:prepend () {
 	# We don't DEPEND on binutils for ansidecl.h so ensure we don't use the h=
eader.
@@ -38,7 +75,7 @@ do_configure:prepend () {
 	touch ${S}/doc/xsltproc.1
 }
=20
-EXTRA_OECONF =3D "--without-python --without-debug --without-crypto"
+EXTRA_OECONF =3D "--without-python --without-debug --without-crypto --with=
-plugins"
 # older versions of this recipe had ${PN}-utils
 RPROVIDES:${PN}-bin +=3D "${PN}-utils"
 RCONFLICTS:${PN}-bin +=3D "${PN}-utils"
--=20
2.43.0


