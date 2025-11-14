Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DFECDB46B
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 01:42:05 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8750.1763084515464485437
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 17:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=R7TK2b/y;
 spf=pass (domain: est.tech, ip: 52.101.65.68, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bl0Gtydt/d+QRo4IId70Xuhr6NqrTeeZzQPhPRlwDpatHalKWc4teAhs+fppSFzRr9wf44DwbJsCMrUeQWTUWN/4aRc/mwT39Z6nx5grWIQGE4K6tpCpOtvKJB1D3MdUx5EBXmGTOzcbV/5ZqqdcDW0ea1qGZVY3L9cjrg7tKyc1F8OJ5QwfyqxM5BoUvKFIbaD45eGxAHtzyfmtn//1rcJTF74GcP6EFasa466NilCG7MsYV1CmBgcbkRUE+rMGwae5dyz1XnA37G9UTv8XPGHK4IeJAHpoNpTEEUwySwjxMQz5GRNgwv2D8h4s8dV4tiMDl9TjpQ+nZvgTR0+XFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnKI8QRdKJVPSE+pPDjgQ281I7S4Z0ojn3eGXcVnnoI=;
 b=nMHjONfzygqHkBKIrRmP+LE39wcyPzU8FsuIx4dN2v8R/pD3XzRwCMFKiew/WOOm30aze5bjfJi2TBftozLrPkuxCc4aSh7+tuHC4B/Zew9plKN3i6BNO3b1rw6jGZJwU76/manbqG2/Q9bIiYzf7T40r0H29j1ewD+YAL2S6GTkECflq3wUTlsf5HlOb7ew0RFeQKSOHEzGo4EKwpjIbxZytbRvIBNwwlcAZXuvRb0roZ5UG3AFe58BS/FoS4vCgsKiEo4IGfkzC/43+mTFIAnKXHdCqyfoUaLdCw2yiNYV0z7pKFO5gtSBWVNIJZSTf3ZYlZljZ7kBNF5UrOnWHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnKI8QRdKJVPSE+pPDjgQ281I7S4Z0ojn3eGXcVnnoI=;
 b=R7TK2b/yZ/KUZ5xbMtDmKleQwh3HETijHttpH5ia95YqXAs5KlTDVfKpP+uo+77PgQDfaFlVlDoz+immPnQUg8J/Bg6Vnuo8g+7LTPSf2gIIiYiy3Twp5JPFfCKx0Xs+1IYZHOkTkjfGbj4+sJNdL23VWLvbTauuSsPu0Oi4kkuLRPCcCEUND7WpoUjLx9zOx3FdmVxxum2yKTsukv7XzEgaIqtCY9VsKQrOw0LOJ7cEUI54V02+1d51oc9dxwdFfzXZkV7WVQ9SLl3vYR80XhfWFtftieGLVlNkH9ZPcevC8k3lzu7BIVgFmO9awDjKuD7Vxj0x6xkvDIVtYRGOIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by PR3P189MB1116.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 01:41:52 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%5]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 01:41:51 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [PATCH] libcheck: add ptest support
Date: Fri, 14 Nov 2025 02:41:45 +0100
Message-ID: <20251114014145.23826-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::27) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|PR3P189MB1116:EE_
X-MS-Office365-Filtering-Correlation-Id: 1181cb5f-1a8a-4561-8acb-08de231efbcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EYeF44FpXBkBsQQORfIfJo9kHxbumEuGe/YHV34ElUSRiybNEAkZvmhvfeR1?=
 =?us-ascii?Q?f6jY0BiPTvKkYk3+cfJ2wG9k37AgYbmBscYd8m98Evmt7mWz3PxOdiSORbOP?=
 =?us-ascii?Q?G4dsT3WDnLHOrBpXzyAkVgf/B+lYGoIsemXAoVlhMBopx/X40XfUNxHXTxfV?=
 =?us-ascii?Q?BBx4M/rhMJMTu6qTBndOCzKStMQ3XhqPdJzTrRHGlz3P3SfZeMn41+omrsR1?=
 =?us-ascii?Q?fWk6BSOB+Eg6r1cF3aVQ0PC9ZFBwoJ8jFNSGdQ60NJoVXJVSvp1DJ8HvskI4?=
 =?us-ascii?Q?JcwBC5VS8Y6aTKOJOKNx+AWyQ0baoUy1QTq1rk1n9uLghoIqC5ZyLxhwzatP?=
 =?us-ascii?Q?dE6y/1WdwfRBdrT03hCJYjMmWsqo27j/BurEE2IbXBOgGHAw7zR/5OuVI4Ea?=
 =?us-ascii?Q?+uiMhoOlaXimYMnqaJmxwvKie6exLgN+hgmON2BojB3dbi8MPZ8Bp6isEDE0?=
 =?us-ascii?Q?KXlNbUDMmrm//wpGiRGAA4Hs5odlTVvmA7vHlzi+qyiyQ1eJBIRrig/Ex98t?=
 =?us-ascii?Q?xehJubdvqrzzQIF+do7jxCojwYOsbkWDZ+fHMxZvtQl/WEdPsmL39rk/QOaX?=
 =?us-ascii?Q?g3I1BGeKritgUNOA0GAFBakPhKoM7o9MNCr/CEciIwT5AQsUZ58IV7V9bLt8?=
 =?us-ascii?Q?qrj39fAPl+LhO+7ax0diZumaGZS6bODqcoO7ycCzn655rQ9rgVoGqV005pto?=
 =?us-ascii?Q?Hhcltea40jJ3cT/EQ60rYARrWPI2jMGt2nlMDv7uQs6l/n6T82vXoU/rLimp?=
 =?us-ascii?Q?WU7EQEBeF91r+TVR/Mt0gronXvJbmIGZUjq7WW8bFfXjobzHDtG6yS0VvCPe?=
 =?us-ascii?Q?hRdSi/iBhc5R/rkZOMF/eJgekvV8UT9HB3JN8QJT2Kh0oBgcOmAluiMNMk/1?=
 =?us-ascii?Q?TNGaQ2XMGoeO3MAh+9nDFF8ZSTxTzXxh4aeRYKltVjypsP5wXcUlBGJi/u01?=
 =?us-ascii?Q?eYQTPWE/LA/9/7ICgqW+q6+Va0WhFb7gNsJmmvT4cLbmgWv2XJQvQICDGgu9?=
 =?us-ascii?Q?L1/2bh/aP2RuT1ngA9E4BgyZH3/EU2SxgyWQMQbfwxfN4hrqickgsJ5lbrnY?=
 =?us-ascii?Q?fC0oPcOa5IEvJmuDLvNtqybwZG2Hs/XN00aWH9GoRddp3/IlgBmfoGVNLhdw?=
 =?us-ascii?Q?gcAGu70h60uMogMS8Kt5INR8OxyEeiqzXmt37s7PLskPTZZnriO8EopEuYb9?=
 =?us-ascii?Q?8Y0ZQV6+TfCEO1AoycG5w+MI7NXZccSB3nb+Dj/l2SPCJcoS2QKd7tjPQZ06?=
 =?us-ascii?Q?aXNQ04rsCXa0ORctz/lPqZBOI1+EBDkxY0A8nJ+TrX4TDnPD/SMZ1CeqmNc8?=
 =?us-ascii?Q?9Bay6hcHzXn17ZKKi4CEds7hX+FRyb/tk0B+QL2ADQM1WxMr8VzTBAX7vL0X?=
 =?us-ascii?Q?uQeGcDVENCAJVCp+7gCmZ83iTFKOsLlrirouZ5CwlZ9q5U06hw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h9+kQu95EJiBClbYwRwh8V9WRqthyjSbgA/GYtZUtYilO1FjdB/lm4/XTWd7?=
 =?us-ascii?Q?6ruzJzN7hnmsUDvn6KWVMXokOKpV97wOi0yn+Wci4tPrPLFaahssw8rIJXPZ?=
 =?us-ascii?Q?bDGXrlwH/FmOAdXLR4YSWZsmGB2edFT4tXrv/upEElJXi5hpo2Nm5yO4IVCZ?=
 =?us-ascii?Q?+UvwkyD5RhaNVGTywkgpk33hSfrCVWUsx/NDIHXLsPG59ULtJ4DJPzA2Nvy3?=
 =?us-ascii?Q?TOKQKPL6ombstiTg/f7o79++ew4fnkwbcD800aGQfn7mEblzM5YzEmfxEBYa?=
 =?us-ascii?Q?oULENOtd7CbK1CJjoziBG1hzYu3Muia6NoQ2iT8FTBKftpjEf3lUolTMM5DZ?=
 =?us-ascii?Q?LZzrh5fUjGewojg32z2OrT/hnsq0hNs1ORV1mfsfDmM8qgYJ6xg0b0ELNAit?=
 =?us-ascii?Q?L1YWsb4+H+l8MIdJjFgjbXGl29DdHV+2ym85dwbuPr6ryRXtdMifKXyz4opY?=
 =?us-ascii?Q?qFeK2UuFL1YhNck+VIS+cvYDdvYIIfl47lv1sDm4pLFcHXoa/PWDAOs3S7Xk?=
 =?us-ascii?Q?5n8iraTe4ItKgp/toDq2h5KB7tHv0G0cL9qdwkSDpFv55CacwFIVkKiw/Hrc?=
 =?us-ascii?Q?DNLqQvsHoq0SCcSz1Cxe66gj1naWCM9JIRxbc/ue8qy20X2lYjtJ73eCU1sd?=
 =?us-ascii?Q?9pgSosnCGcdrnR/lzKXQgLnMFB5uS9JFzl0+v28e0GGy0YIEG0Ri6660VPaC?=
 =?us-ascii?Q?+CSPQkRnLBWmxTVDuT20YQ3KcTPbB9P5X8zLYs8mI95xRH2WHK7beA4bxj5n?=
 =?us-ascii?Q?4tAtcyix1itMjt/dynPzSjE6f7vZpyY2hi1u/a4I/3cF+Ejf+iPyCPlGt2Zq?=
 =?us-ascii?Q?hGXBw/NhS96wwKt+uoQ5QNOscS4W2wsYb80fB+Q0gFlxClkU4lMGPtRgAJkU?=
 =?us-ascii?Q?2QVoSE4q5zucT6ZVNHgSa5+xJYR8ZJ5nQqAIwXsqryyn2O0pspS0d2gcGa2h?=
 =?us-ascii?Q?ULUL3F9ODY297npR3Uj31kF7FR5WLI6S0yMmH4ochiWFSwsOzWr37a253WXR?=
 =?us-ascii?Q?g6f6SLLfm59SoDj8FJdyNHcSmOZ9jIYKaDy+HfvB3gpPIgGRbzFPlRijY+Tu?=
 =?us-ascii?Q?Xy4AMZM/Ne8RTINTRFBhZmcgeZ+9cjD7AyMJPxg2WsF0lrLS0GCkfOUzTdBn?=
 =?us-ascii?Q?/wv7Lsyky4pLNmRK2XeaIIqK9I6Gu0bvtY3BRXLi/WHTN8nU0GpHumkJlN7/?=
 =?us-ascii?Q?KGbPKvxxPiWjjB3jsDF26HM1gy9lGIyM1U93IrVnFw5q1nCIVCBP8w49i7El?=
 =?us-ascii?Q?Ru53WNPYSDNTweqgJgEnm1h2r/HFUk+jndTr4vHO9gK/zJPGeNbLLNHJnMOZ?=
 =?us-ascii?Q?qhVaQKciJg8rh2nq29HbceunrlsEq6Iv4vwm+plxNc1Cb49YIwLpx5/ihZdo?=
 =?us-ascii?Q?ERrBzaBISYsMLan0Mr7ScRUfVObfRtlO6PxhU5nlz2t6dcnr+XGC1qa0AJNK?=
 =?us-ascii?Q?z+bOHzh2JYr2cceOFj1+jX3pZCsBRPHHvAvRzlNmnH1d2YsQ6lgCSEq7dzTA?=
 =?us-ascii?Q?6OCKjmZTHKDGFYmwKyRzjMrRuxFvl+XihczBvd4keJoz+NU2y7uMHiCdUuCP?=
 =?us-ascii?Q?f/Pc+tyaFb34IjBdTF6k9kF3MOWj743GJbYxxcdxUzcuCsg79e0Pb2KQmO5z?=
 =?us-ascii?Q?tA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1181cb5f-1a8a-4561-8acb-08de231efbcd
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 01:41:51.5963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CFVaGBthwVJ/StgYtPcPZUd7Yz217HcHe/hZkDbVWfIYsLp0L1YNT1iiTvp2Gm3Y+WmxK9UjfUJlfyON2NhjDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 01:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226284

Add package test (ptest) support to libcheck recipe to enable
running the test suite on target devices.

The implementation installs:
- Test binaries (check_check, check_check_export)
- Test helper binaries and scripts
- Shell script tests that validate various output formats
- Test configuration files

All 9 upstream tests pass successfully:
START: ptest-runner
BEGIN: /usr/lib/libcheck/ptest
PASS: check_check_export
PASS: check_check
PASS: test_output.sh
PASS: test_check_nofork.sh
PASS: test_check_nofork_teardown.sh
PASS: test_xml_output.sh
PASS: test_log_output.sh
PASS: test_set_max_msg_size.sh
PASS: test_tap_output.sh
END: /usr/lib/libcheck/ptest
STOP: ptest-runner

Note: The test_vars SRCDIR path is set to /usr/src/debug/libcheck/0.15.2/te=
sts
to match the debug source paths embedded in compiled binaries.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libcheck/libcheck/run-ptest               | 36 ++++++++++++++++++
 .../libcheck/libcheck_0.15.2.bb               | 37 ++++++++++++++++++-
 3 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libcheck/libcheck/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 06d113e264..3cd5f244be 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -28,6 +28,7 @@ PTESTS_FAST =3D "\
     icu \
     json-c \
     json-glib \
+    libcheck \
     libconvert-asn1-perl \
     libexif \
     libgpg-error\
diff --git a/meta/recipes-support/libcheck/libcheck/run-ptest b/meta/recipe=
s-support/libcheck/libcheck/run-ptest
new file mode 100644
index 0000000000..fe252bc33d
--- /dev/null
+++ b/meta/recipes-support/libcheck/libcheck/run-ptest
@@ -0,0 +1,36 @@
+#!/bin/sh
+
+# run-ptest script for libcheck
+# Runs the libcheck test suite and outputs results in ptest format
+
+cd tests || exit 1
+
+for test in check_check_export check_check; do
+    if [ -x ./$test ]; then
+        ./$test > /dev/null 2>&1
+        if [ $? -eq 0 ]; then
+            echo "PASS: $test"
+        else
+            echo "FAIL: $test"
+        fi
+    else
+        echo "SKIP: $test"
+    fi
+done
+
+for test in test_output.sh test_check_nofork.sh test_check_nofork_teardown=
.sh \
+            test_xml_output.sh test_log_output.sh test_set_max_msg_size.sh=
 \
+            test_tap_output.sh; do
+    if [ -x ./$test ]; then
+        ./$test > /dev/null 2>&1
+        if [ $? -eq 0 ]; then
+            echo "PASS: $test"
+        else
+            echo "FAIL: $test"
+        fi
+    else
+        echo "SKIP: $test"
+    fi
+done
+
+exit 0
diff --git a/meta/recipes-support/libcheck/libcheck_0.15.2.bb b/meta/recipe=
s-support/libcheck/libcheck_0.15.2.bb
index adf95f5040..52df7c22bb 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.2.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/check-${PV=
}.tar.gz \
            file://automake-output.patch \
            file://subunit.patch \
            file://0001-Fix-texinfo-errors-and-warnings.patch \
+           file://run-ptest \
 "
=20
 SRC_URI[sha256sum] =3D "a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d8835=
eb1a52932fa20a"
@@ -21,17 +22,51 @@ GITHUB_BASE_URI =3D "https://github.com/libcheck/check/=
releases/"
=20
 S =3D "${UNPACKDIR}/check-${PV}"
=20
-inherit cmake pkgconfig texinfo github-releases
+inherit cmake pkgconfig texinfo github-releases ptest
=20
 RREPLACES:${PN} =3D "check (<=3D 0.9.5)"
=20
 EXTRA_OECMAKE:append:class-target =3D " -DAWK_PATH=3D${bindir}/awk"
 EXTRA_OECMAKE =3D "-DENABLE_SUBUNIT_EXT=3DOFF"
=20
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    install -m 0755 ${B}/tests/check_check ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/tests/check_check_export ${D}${PTEST_PATH}/tests/
+
+    for binary in ${B}/tests/*; do
+        if [ -f "$binary" ] && [ -x "$binary" ]; then
+            case "$binary" in
+                *.sh) ;;
+                *) install -m 0755 "$binary" ${D}${PTEST_PATH}/tests/ || t=
rue ;;
+            esac
+        fi
+    done
+
+    for script in test_output.sh test_check_nofork.sh test_check_nofork_te=
ardown.sh \
+                  test_xml_output.sh test_log_output.sh test_set_max_msg_s=
ize.sh \
+                  test_tap_output.sh; do
+        install -m 0755 ${S}/tests/$script ${D}${PTEST_PATH}/tests/
+    done
+
+    install -m 0755 ${S}/tests/test_output_strings ${D}${PTEST_PATH}/tests=
/
+
+    if [ -f ${B}/tests/test_vars ]; then
+        install -m 0644 ${B}/tests/test_vars ${D}${PTEST_PATH}/tests/
+        sed -i \
+            -e 's|if \[ x"[^"]*" !=3D x"\." \];|if \[ x"/usr/src/debug/lib=
check/0.15.2/tests" !=3D x"." \];|g' \
+            -e 's|SRCDIR=3D"[^"]*"|SRCDIR=3D"/usr/src/debug/libcheck/0.15.=
2/tests/"|g' \
+            ${D}${PTEST_PATH}/tests/test_vars
+    fi
+}
+
 do_install:append:class-native() {
     create_cmdline_shebang_wrapper ${D}${bindir}/checkmk
 }
=20
+RDEPENDS:${PN}-ptest +=3D "bash libcheck"
+
 BBCLASSEXTEND =3D "native nativesdk"
=20
 PACKAGES =3D+ "checkmk"
--=20
2.43.0


