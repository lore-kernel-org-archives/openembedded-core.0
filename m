Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10144.1794406115784042054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 06:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=PVa7CXOz;
 spf=pass (domain: est.tech, ip: 52.101.84.25, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlQLoVnkf7zDEFsMIPp7h6n05bggY/0f0NQaoN87xGEYXpf7JNvR7x1XcbHX5bcyPrfwBVTYbEuJ8cr7qpf8ZGQWAfQd6SQv3TcEn+Z208FmK66fm5NlwPf7bf9WtPL5wUaNLV4mtsDK8z+0tZHBjQVgR/79bBBOH/5yG+6fPw26BTBdslIoqRcJCLawXjMOm4pRBqZAEDDVegNF8xTDrazJAf96Eya1xcURfSy4iArVEtKcXUYwTu6+msMo6oXctUlvbTVvPxM7ezzRBuadIi37REYlKq0/Hnuns5FQ93feLY9NKt8NTpg6JR3HMAQwmAhrHRvg4z0o1Jx1JhGSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yH7YGnU+gXhx5EzN49NxJaskk+mDGEmhfao9UsfEE0=;
 b=E93cEzs/2t5PUaGywXslBjd0SoRhs6ykexHKOkld8fmPrHEUcbGtxkpw+trybjvWSND/la0YJm2Zsei7fu+/oLqoYnD9gGADby+0kC/DufTVBjkqB2JMamOQfIhPYdi298dS4iOAtJZDgS38XzkLU7K1P6hFHsO9//mIL8PHqUmF07uB4s7b5ZG2MhbYBRU8l70kjO2/ItwAOrDvPBwFDLf/eIUkomJZ3TyGfWzqAKqzhhj5zofo0syK9JUohc28U8C38XuhweAKSa4EwsDUj6YB3tI5pXRwl86miCeX8SA0vdJ0LQ8W3jRtDZoC54Vefa6FVmNBb/Lx144u9QXOFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yH7YGnU+gXhx5EzN49NxJaskk+mDGEmhfao9UsfEE0=;
 b=PVa7CXOzZtMwe3KG3cqeJ8hCBs2bWat4SztbPaJHo3G9quyyHx6VspGSCH5wxT83wlVPOahweg9Xy0IQI2u3toQLWAQ2FNr/TIp3AamkaVD+aEIcsqppbNZn1mYzNzshMnC/IRfC9kcRY++C674sWO7W3wMTn+iRQFtYsFQFAKLe2UxM5VtvmzaZV45QWKheBMJnwFRELUqm39OBdFxMcLAQJjA6lRK5t17f3JKE4ZdCdDkSrQozkweRkL8cgPhTgly6M2wpKcFN0rohJ2A3Y0G+9tfc3QGUJVKXKSHMhdG08nAGtMHojsCby/Hy7Bn2X33DPsPsEeHS1K2Y/xSIGQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DB8P189MB0887.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:169::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 14:08:30 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0592.012; Wed, 11 Nov 2026
 14:08:30 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v3] log4cplus: add ptest support
Date: Wed, 11 Nov 2026 15:08:26 +0100
Message-ID: <20261111140826.12238-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104083458.12316-1-pratik.farkase@est.tech>
References: <20261104083458.12316-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0478.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::15) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
Return-Path: pratik.farkase@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DB8P189MB0887:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d4a432-9fe4-4217-f3de-08df3ffd4374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|260925022911599003|260925021311599003|260925021911599003|11063799006|10067099003|261022075727099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|56012099006|261026121527099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: ob/xYs/v8N3qwGCHw66vk8s3obf7xUfWeC432oOlPVlcc+DuDvZYvpRdOjvywsbrREzjSinAusX+QDsQJEN5IBYiJ0pWa3Z47ZbafvaBK0i0FWtEYKVgT508PkE9H+ZnBSFNHDfGdFn2/01eCSdMDX0LqDAzgs+MRvMg9RFsqVClv7JguPSaotqiALO/rDfjfnRj/LGc0tvnjJl+lnGwmAhAcOUS79d7pldACo/3W9iYI1wTukRZrl8mPDnlgi83X9lIJspXYIesUbmS+S2lYtgbDJP4uFxhKXbdfjfhUURMkfwPBUqLhDmjbz/Buz03VWn4tX4GLyb57XdTDq/LTPx2fLb9uW2tjBBZ0Ke1HyRdFnxdfKg+Hhy053Uatgi4UyhCoqQfe8CcosAQeQ0zc7kT+bC49yHWI4v33gZOj74NU8b8g7fQkM+3Z+DFxhcrtNX792SUUc0TTEgZSG3IMd0KJqKMZ5vW5PxZaVLaPBxfF2kA8oodxFm+X6hrrIzRei9yKjToE0vCv4p6Hb24jGxMQuhTidhkR3lhrw3nXr+X9AU2wiVtbOsnCHLzXleJFD+XFVFianInzAxmFaQOrv9mfNvS4xd1Qof7gIxPtLpTr7z/VKs7HhlNZGF9pnhTVMOc/QYrKtUp/z2MnXMQUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(10067099003)(261022075727099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(56012099006)(261026121527099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?emHUcK2VltdAaYn1hxRxF8gz81n3zwFRKdaOHI3qx5wyHNLD3RnFkLthbYnX?=
 =?us-ascii?Q?OuKa5xvmXf30FO4HXe/pINCLVy19xY9kLLhMShnKhB2EgyjlH2ZakbIkuCEk?=
 =?us-ascii?Q?/WUTJgzKyq2pngFbbMLXTDooepvltN5hrHDTIWkQtWWYknhEctkuDgeSQmiD?=
 =?us-ascii?Q?QoVg2KUrIJU8Unx1yCUQ36SgxmtFqL7yTL38rnhYU02FcSeB//K5gHdbRDgL?=
 =?us-ascii?Q?1pij6bHRd/3C7xdDOfo06b5TruDS4WPWAddAIIORttbKUUOGK0Ikwok5JHkm?=
 =?us-ascii?Q?dNAnbxqx1gp/V5eAbvl7y5j3ZV/BLBBgIJyvBBaB/sFOXDIIM3Kv5AScPQ2E?=
 =?us-ascii?Q?cSxeRlEdAx18rlM9uQfVDrA+gObcCAQfrYgMp9ZnSkUq85wQI0HjSgOofaxL?=
 =?us-ascii?Q?A5tRdAM4JiXVndlAtNMZxUWrIW1u3V0e2qp9ons4Cr5QG9MB8MexTUyWi6PY?=
 =?us-ascii?Q?joVdxIP5xaryu8mEe/UxJ9sdivoSrDhUiWiwtHmP3gawDXDE/RTjGwlv1pmv?=
 =?us-ascii?Q?Bara/1vHa3dsa5cncg13phX0a500oVetbwTEB5Q96Dx/oCkt/EjtRCJIOh16?=
 =?us-ascii?Q?1LMNr2BxqKPza9oeE0RN8DDRFiWPYURFEFtkAaG9RtKvswZ6htBqzdzOPxpT?=
 =?us-ascii?Q?6kyil7HM5uhcAQOYi3c6ZwQkr9TuLkdObRwg1w+eAit7HpMZ74CVEduvwFlZ?=
 =?us-ascii?Q?WJlDOxQ6+MBYe0yxnyICETf3TyavxMVi1RySaQHbZNaZFyhItSERZ69oxM1z?=
 =?us-ascii?Q?/4goADvmBOFGu1LlrNdvGav4l5gO2IzcZWF1+Vef4RdEVXD91QtsQ0ATvqt1?=
 =?us-ascii?Q?xmOG7p+omArQQgMplFyYGgUjdKkGcjeXcf891oIKlchZ4riMfoiJ9igjiK58?=
 =?us-ascii?Q?0Ak+ePIRhgg8qYX4zSBz0JF512jKL+e0TEywigHD95tw9FKXkhIe3DsHSvEm?=
 =?us-ascii?Q?7s1HpbqAbI5jcE9iEslC7FRrIZInOBiDJxZEun/IAq3Hvcu6ZLMjA3aemXBH?=
 =?us-ascii?Q?2Gj+XZBsHSCZYQwcpFWgVLXbKF64ErcytheQ8t3GRElGPCvFDqeOi7l0Kq07?=
 =?us-ascii?Q?/Zm4XaaATlMuRetnHkzwsGTgXtpzv/iwBxoLXjfrHXqPFUDI33wmEcDWB5GN?=
 =?us-ascii?Q?/ukFqeIAejw39jsYap2gJ+YC6xHd/xNFnbDqGNGgESRkD3opVUl9dzlQZB5u?=
 =?us-ascii?Q?DbmMoGASGPMppP5FIeMzhfJa2Rl4DdcLVPcoRzyk2oH5XOnqMJy7uTwikePo?=
 =?us-ascii?Q?ZU0EJ4Je34WetiSXaPKfT4XyDG1JRm/0FhMzmPIPvVc+jT85eyTOkDWOZvHX?=
 =?us-ascii?Q?/fLKwYq2knZTlv0kj/Zer0d4xFuKtDOFK2681KryRVtgp2l74Pi6aXT87+PF?=
 =?us-ascii?Q?PWoZL61zEdWl3Q3D+6VhcaW4c4zQcDZqLLaoEN+bMqxHM7Ax/NuNDpg58LUu?=
 =?us-ascii?Q?e99XYkVWA2qXQGWpMo+ae/OYi/AuT0VnDpGkMmvIq+rPJ+2ez3Vfu7bkqy4D?=
 =?us-ascii?Q?R1i/l/xnM/a5llrpglhmzHmcwfN5zuXmQXgfIylcUTOXWfD+mwoRn6HBCRvq?=
 =?us-ascii?Q?wcUBkVrqHqifTJGK7wJTVDgncBfp2kJ9NfWgJ2gUybB214/3G/fHXuJy4HvM?=
 =?us-ascii?Q?hvf5MkLw85vy7pzJ0gN+S/zikToeSK+OgsOpKBskXl9al+NwOBuM3VGX+1yf?=
 =?us-ascii?Q?H1OZZGccQoTTDFgKO/CNlk7P+4KLf8GEEBklKG469yCsnd/Idg4ObSlT9q67?=
 =?us-ascii?Q?wmsAd9hLdg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d4a432-9fe4-4217-f3de-08df3ffd4374
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 14:08:30.1981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8ldmZYlQ+HyG3WKpqMDtH1tP7N6cFaor9MTgn0dEriX+YOwe7Q71knCPXoKNV83uNPLdMb23uP5MQrw49tc5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0887
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 14:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250028
Content-Type: text/plain; charset="utf-8"

Build the GNU Autotest based test suite and run it under ptest, following
the tar ptest pattern: the generated testsuite is shipped together with
atconfig/atlocal, whose build-host paths and tool locations are rewritten
to the on-target ptest directory. The test programs use libtool -no-install=
,
so the real binaries are installed with libtool.

Tested on qemuriscv64 with ptest-runner.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---

Notes:
    v3: Drop the buildpaths INSANE_SKIP; no longer needed now that atlocal =
does
        not embed build paths. Also derive the test list
        dynamically from the autotools TESTSUITE_AT and noinst_PROGRAMS var=
iables
        (makefile-getvar) instead of hardcoding it, per review on the lttng=
-ust
        ptest series.
    v2: Trim atlocal to the variables the on-target tests need; the dropped
        compiler/flags variables embedded build paths and broke reproducibi=
lity.

 .../distro/include/ptest-packagelists.inc     |  1 +
 .../log4cplus/log4cplus/run-ptest             |  5 ++
 .../log4cplus/log4cplus_2.2.0.1.bb            | 63 ++++++++++++++++++-
 3 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/log4cplus/log4cplus/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index d5357d8732..f8d2cb25b0 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -63,6 +63,7 @@ PTESTS_FAST =3D "\
     libxmlb \
     libxslt \
     libyaml \
+    log4cplus \
     logrotate \
     lttng-ust \
     lua \
diff --git a/meta/recipes-devtools/log4cplus/log4cplus/run-ptest b/meta/rec=
ipes-devtools/log4cplus/log4cplus/run-ptest
new file mode 100644
index 0000000000..1f346cc8b1
--- /dev/null
+++ b/meta/recipes-devtools/log4cplus/log4cplus/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+cd @PTEST_PATH@/tests/
+
+./testsuite --am-fmt -k '!headers-compilation'
diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb b/meta/re=
cipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
index a10dd175a2..0d0198d46c 100644
--- a/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
@@ -16,6 +16,67 @@ SRC_URI[sha256sum] =3D "374175c22fabe752eb1c20138e732b69=
ae191e641f92d32c9432985cd8
 UPSTREAM_CHECK_URI =3D "https://github.com/log4cplus/log4cplus/releases"
 UPSTREAM_CHECK_REGEX =3D "log4cplus-(?P<pver>\d+(\.\d+)+)\.tar"
=20
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
+
+SRC_URI +=3D "file://run-ptest"
+
+RDEPENDS:${PN}-ptest +=3D "bash diffutils gawk grep sed ${PN}"
+
+log4cplus_ptest_tests() {
+    progs=3D$(makefile-getvar ${B}/Makefile noinst_PROGRAMS)
+    for at in $(makefile-getvar ${B}/Makefile TESTSUITE_AT); do
+        name=3D$(basename $at .at)
+        for p in $progs; do
+            [ "$p" =3D "$name" ] && echo "$name"
+        done
+    done
+}
+
+do_compile_ptest() {
+    rm -f ${S}/tests/testsuite
+    oe_runmake -C ${B} tests/testsuite
+    for t in $(log4cplus_ptest_tests); do
+        oe_runmake -C ${B} $t ${t}U
+    done
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    install -m 0755 ${S}/tests/testsuite ${D}${PTEST_PATH}/tests/
+
+    install -m 0644 ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
+    sed -i "/^abs_/d" ${D}${PTEST_PATH}/tests/atconfig
+    cat >> ${D}${PTEST_PATH}/tests/atconfig <<EOF
+abs_builddir=3D'${PTEST_PATH}/tests'
+abs_srcdir=3D'${PTEST_PATH}/tests'
+abs_top_builddir=3D'${PTEST_PATH}'
+abs_top_srcdir=3D'${PTEST_PATH}'
+EOF
+
+    enable_threads=3D$(sed -n "s|^: \${ENABLE_THREADS=3D'\(.*\)'}|\1|p" ${=
B}/tests/atlocal)
+    wchar_support=3D$(sed -n "s|^: \${BUILD_WITH_WCHAR_T_SUPPORT=3D'\(.*\)=
'}|\1|p" ${B}/tests/atlocal)
+    cat > ${D}${PTEST_PATH}/tests/atlocal <<EOF
+: \${GREP=3D'grep'}
+: \${AWK=3D'gawk'}
+: \${SED=3D'sed'}
+: \${ENABLE_THREADS=3D'$enable_threads'}
+: \${BUILD_WITH_WCHAR_T_SUPPORT=3D'$wchar_support'}
+EOF
+
+    for t in $(log4cplus_ptest_tests); do
+        ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/$t ${D}${PTEST_=
PATH}/
+        [ -e ${B}/${t}U ] && ${B}/libtool --mode=3Dinstall install -m 0755=
 ${B}/${t}U ${D}${PTEST_PATH}/
+        install -d ${D}${PTEST_PATH}/tests/$t
+        for f in expout experr log4cplus.properties.1 log4cplus.properties=
.2; do
+            [ -e ${S}/tests/$t/$f ] && install -m 0644 ${S}/tests/$t/$f ${=
D}${PTEST_PATH}/tests/$t/
+        done
+        for f in ${B}/tests/$t/*.properties; do
+            [ -e $f ] && install -m 0644 $f ${D}${PTEST_PATH}/tests/$t/
+        done
+    done
+
+    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
+}
=20
 BBCLASSEXTEND =3D "native"
--=20
2.43.0

