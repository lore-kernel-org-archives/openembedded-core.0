Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DFFCA5FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 13:48:03 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13872.1790776083113127203
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 06:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=HhWh2uxF;
 spf=pass (domain: est.tech, ip: 52.101.72.41, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x23b0NroooMn6TSne33GR4E1cUopA0RGe88RoeSGssnXn8ShYRhtnYiiXaVCOnsfSjkgljm7RweGvhnQTKMjHQjgNKt7IhumVXfjbMIOnF+lmORRTmkY8tIHiDSl5jzVdOVug87E49QZ1V+z14TX72edG5LHcWHV3JQN/Sn51CwJhx23P5YmytC+xXyTkOrlK3qlFcF7qh4FsxjoLGj/5AQEpuLMjK5qhB5pXzDHn2Ycs6eLwGSPNO70KtfngAGtBA5s310K7UA3I5rCCUEv+Yt4ePWG8M+Z/WRORsr0lj2WVHWcet+qkXF4oVb0NMCysrVCGS10mPGwniDChuEW2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkHz46AQ3Fs207LP7PXpE3Iu9Dk5VexrdlsgTzZEll0=;
 b=eTRRSQv0pjknbbYochOudalVM5z9gODnOLilI1wSiDFnO3iQI+KOg0Q+k1XDn7uD4uH+n0mNwWn0EiSAcZoeOtS3OMuPADdCr0jefa03Kb/GzqiPUJEkzu4OjaRr5RtZHMGeFtTL7BJueF3J4KQjaKjxSgJfEl+KFEFdIer4csfPUrfppQ0dxD5PpN1d/vRiJNfxJWc/FYBb60UC+uwiOa/+rMxrPjbxQXEHJh3AxKh5K2IwmcxWNUD6FX28dAysQqx+r0m0DEPvjZ1aQdsBC4yXTFmEH8lXY1eoRZjQrMv6RD70nKYcPVmjj5/HtGjVzr0p33NNK+eVR4fOzdCmhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkHz46AQ3Fs207LP7PXpE3Iu9Dk5VexrdlsgTzZEll0=;
 b=HhWh2uxFrvtCsPweRx51Os/lLQAJ7pjoqKW9lJB7ycjhAeW0O4L6UnLbHi/gGp60wI8J9pJMVB2jL10rdk6FdDevRb8vZHxGI3VKAK5HEZR0CelSWj6GV3njJXEa1m/02OpU7XkajyWDVODcY+jPFdGaSsB/vhf6ZEWbmvMw4wlBRlxOEuTU6FYZ8AUE0Tt5MGYs0k4JsiEyoWE6xtDu8UiDm7Wr92xkRvjord8wkgJfpFgkbV00xzRENOniokoOyCOSqOI13HsWDyExkwPUK59B2TxEygFELoHj9x9z0cdVynoFj6Ig9bKD/lIkU/+lJIO9BsHAjX9ljnu+O8vUzg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by GV1P189MB3051.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:264::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 13:47:56 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 13:47:56 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v3] libpcap: add ptest support
Date: Wed, 30 Sep 2026 15:47:52 +0200
Message-ID: <20260930134752.19730-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928130950.49433-1-pratik.farkase@est.tech>
References: <20260928130950.49433-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::16) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|GV1P189MB3051:EE_
X-MS-Office365-Filtering-Correlation-Id: 11795a2e-a682-4c11-ab19-08df1ef96eb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|13003099007|3023799007|6133799003|10067099003|260925021911599003|260925022911599003|260925021311599003|11063799006|56012099006|12006099003;
X-Microsoft-Antispam-Message-Info: 
	IIp4Davm/0qfDDZaokKngvvJeSvMasvkZMCbzLL4T+tQEBSDI43/T6UONAj08ziUqMiw1fCWQY1AynUHi8uSAyXVU8z17nw+5uFRcanQxirDTDcVLOhXn0x8ImZ1K4Dn6EyaXfd3UA9FYcmUQQvw2O39gQ9cssy0kvkV/OJr9HTt8K5u3nQP3ztPrabFdF0+WO8jYXJqMf7ytlmKlMaq9Xs4tkS6QC+hndSrF157jKOzLX1F3BbLRSkNoYifIGIiKsOSRAwLdaQggXnfV1KVvmFfbx/y9UjRk89RhGmmPjehwBI0tLYTZjr7qagDLCGtd/FF1d55kENaRjSICZU59I5H176zYKFSuqdRPNqlMKyJT3f4uGlNEgqRUMEZDM19nZ5z3x+SV4/8YfyFUwTqTXocdsNFPCPI285LGgUWEWAQSWrKzil3X2DoCZhijCqll1E1cvspxB8cNvSGu6Kg1iGt3ntIZI8+dcDPFiAr8Tkym8zPQrv9o3xdNU8Ps5iriIds0GrtHJtoOKbkcXh79kG5XwBLY9dk/EpniMisS0X1EW55b535BUYbTsOKf7mDjYhvPrbjImFbbF0vkux6jV9qlAtRWff2pQqxzNMyMMyr5yvIjU9iG45ERTqZ00bK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(13003099007)(3023799007)(6133799003)(10067099003)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(56012099006)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kSqAtjqIpklERqS/AwU+IQYUczC5tltrnt+1hf/J7RFXhiPQB8U5Rl/GOkvC?=
 =?us-ascii?Q?Nb8VH+rKYHp6KN1ONmGKzaHv5ASUq2q0Ok6GgI8I3iTy1gSILXpzXpjM2RJS?=
 =?us-ascii?Q?vwWys5tTY4y18Su9BtcJBJ4lhkCPlFyGtnUEj2QrrS6f5dlBs1X8KhdTJ7P5?=
 =?us-ascii?Q?23LHbjPwosF8+xWdhxlrTvms1cLxUMluPAkcY4is6f2GIday/nmmw7Cxo/Ba?=
 =?us-ascii?Q?k+C8bseahPPG//4Tv+p5jdODWbc+VHfLcoZGg8C5LHckDZXMtVjVa+F66bHm?=
 =?us-ascii?Q?EAiJ7BdG4vDGEsfJWPZVK9jmmxqdWXXiphnAr4Yv7M/MkQA4vMjvW/2/mTzN?=
 =?us-ascii?Q?5I72BaFprYOCBxCLOxaaxy5RCS2JdBK6f2DkWDeBtG6Yx9E7ayPVGyXvmUC1?=
 =?us-ascii?Q?ot90Sv1yKNK2WiDM2CgbbUImw1b9e6/EaUMNi8BFURoEUFyS7H4/aa507VLE?=
 =?us-ascii?Q?DO43DknrYbs/n52PpehrcaKgCUf4H91U7LzbHhz0sdPZmRQNPBpYhiUIsDUH?=
 =?us-ascii?Q?pOaEeHJ0/BIjcKyFKnDDjMm/QDKhu+v5ipA4mKI18MC3pKR/WiQ2bJ9MlmzH?=
 =?us-ascii?Q?riaFpblHe7RrPQtdvR47t9y7nfFiLg59C2SU8yIPSwpk8pEtHwMijljXhfOj?=
 =?us-ascii?Q?Bi+eWNUTB5W11VSPLHcyK3c67ZIlXHiiqE0MpB08lKGWDLTQTRzTOm1u6dnC?=
 =?us-ascii?Q?T8jNBPg92C7sNAFzmCd3kX1QsJjZO8sxNkh2Tjih9DqobtQkUBp5i8b/4R5h?=
 =?us-ascii?Q?VGEYT+IRJn6mkOLD2SphgQbZfSzS6O1+ykgmS0p5lPpGqJksbjELNWc2oMe5?=
 =?us-ascii?Q?RYcNr0TEWn1uQhfGxyGK6VB71wIGEjs+RF7P4fuB6OQFQtUnFKwinR69p6gF?=
 =?us-ascii?Q?r4ESkK1d3RC0ZKeeRHXQxNAAB9K3foctkCWSPlK9TARB+ZN277Wq9XC04MOA?=
 =?us-ascii?Q?E4rXypC5nuUygBPpQnu3WA0xReTEHOVeZX43hPIDKYABUIpxReM0hVdBp/Xd?=
 =?us-ascii?Q?oz+T45AzV3cCDuRN5CmrobUxIJu9f8Tf5XlS4bRWTZ3AW/eCKTBLGd3qzKWW?=
 =?us-ascii?Q?yhS5qk/ieloxjl8x3uUG2Ss/5cbHXZDPSglBoZu0rqa+74vRQMWbTQv2lnsS?=
 =?us-ascii?Q?KTaWE/d26+Nsz3shY8AcCa0EG6FeM/8dHLaVMF1VXNKf6HDvnc6qlZPjeGyx?=
 =?us-ascii?Q?Aotj2x0wmhaR6f2kVoe46vKk5zx1ggyaJkufiBUF2kjUt7nLWZezyrtlQNjs?=
 =?us-ascii?Q?Kz6C5cAXyaYabppMGro60MkhgW6kF6KlN4rx2WGQxtL6hwYN0YM4oFTKjx24?=
 =?us-ascii?Q?1hGqQxYP+PPxPELQPsX/jA1xN8OIKQJXWwjNdkJSjiOhcqSRPWwbrwOVD3xj?=
 =?us-ascii?Q?++YTiMTNB4BqlyZa85lHcDjSGHMj+Q23gEF8okqpVG+S8vesgwKritwXuwu2?=
 =?us-ascii?Q?km/RhUnkrwBthLP+Mo/6LFGXEIHb58NS0znJhWdBQAILziIXoKCWiqSNuA2K?=
 =?us-ascii?Q?IgLdtEJ2+XkoiMH6akcWhmC7hc9fJz7V87oMxZzVSyAPIk1jxafdpap+CI2J?=
 =?us-ascii?Q?L+YsA0t8/RocGPFuJK0bK2pVIMfv78UzSa9X4teHx6jw04SaXJZUG2fIHOyd?=
 =?us-ascii?Q?0HCrMf1LDb/fOeOfy0uL/39p1hTL8P4AHC660TSgionKpw78B3LIymmgb8rX?=
 =?us-ascii?Q?7GtFIpMSswPZLea7d8tCXuKe+CwtMFv7RlWhKt3x1cqsHuGpIKE7C76piGv+?=
 =?us-ascii?Q?WCqMe/XyFA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 11795a2e-a682-4c11-ab19-08df1ef96eb8
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 13:47:56.4388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkvP1xg9jMZzChCXF06ioJtFkaETdHdShKRDS59QBknALkM3AS3brZ4YBvbjLVqtaWMRh26e/HTRAQiBwjzpbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB3051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 13:48:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246971

Build libpcap's upstream testprogs and run the TESTrun harness under
ptest. The harness drives filtertest, translatetest and enumeratetest to
compile and translate BPF filter expressions against bundled savefiles and
compares the results with the embedded expected output. These tests are
offline and deterministic and need no capture privileges or network.

Tested on qemux86-64 with ptest-runner: 14801 passed, 0 failed.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---

Changes in v3:
- Disable the ptest on riscv64: the TESTrun harness is too slow under
  qemuriscv64 (TCG) and exceeds the ptest-runner timeout.

Changes in v2:
- run-ptest now reports one PASS/SKIP/FAIL line per test case instead of a
  single result for the whole harness.

 .../distro/include/ptest-packagelists.inc     |  5 +--
 .../libpcap/files/run-ptest                   | 25 +++++++++++++
 .../libpcap/libpcap_1.11.0.bb                 | 35 +++++++++++++++++--
 3 files changed, 61 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/libpcap/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 7d0a9148bc..dba231d249 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -136,6 +136,7 @@ PTESTS_SLOW =3D "\
     libevent \
     libgcrypt \
     libmodule-build-perl \
+    libpcap \
     libpng \
     ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'libseccomp', '',d)=
} \
     lttng-tools \
@@ -166,8 +167,8 @@ PTESTS_PROBLEMS:append:riscv32 =3D " lttng-tools strace=
"
 PTESTS_SLOW:append:libc-musl =3D " libc-test"
=20
 # These tests don't yet pass for riscv64
-PTESTS_SLOW:remove:riscv64 =3D "tcl tcl8 python3-cffi strace lttng-tools p=
ython3-numpy perl glib-2.0 zstd"
-PTESTS_PROBLEMS:append:riscv64 =3D " tcl tcl8 python3-cffi strace lttng-to=
ols python3-numpy perl glib-2.0 zstd"
+PTESTS_SLOW:remove:riscv64 =3D "tcl tcl8 python3-cffi strace lttng-tools p=
ython3-numpy perl glib-2.0 zstd libpcap"
+PTESTS_PROBLEMS:append:riscv64 =3D " tcl tcl8 python3-cffi strace lttng-to=
ols python3-numpy perl glib-2.0 zstd libpcap"
=20
 # These tests don't yet pass for musl qemuarm64
 PTESTS_SLOW:remove:libc-musl:qemuarm64 =3D "strace perl gnutls glib-2.0"
diff --git a/meta/recipes-connectivity/libpcap/files/run-ptest b/meta/recip=
es-connectivity/libpcap/files/run-ptest
new file mode 100644
index 0000000000..c4b869d541
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/files/run-ptest
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+cd "$(dirname "$0")/testprogs" || exit 1
+
+FILTERTEST_BIN=3D"./filtertest"
+TRANSLATETEST_BIN=3D"./translatetest"
+ENUMERATETEST_BIN=3D"./enumeratetest"
+CONFIG_H=3D"../config.h"
+export FILTERTEST_BIN TRANSLATETEST_BIN ENUMERATETEST_BIN CONFIG_H
+
+./TESTrun --passed --skipped 2>&1 | awk '
+    /^Passed tests:/  { section =3D "PASS"; next }
+    /^Skipped tests:/ { section =3D "SKIP"; next }
+    /^Failed tests:/  { section =3D "FAIL"; next }
+    /^-+$/            { section =3D ""; next }
+    section !=3D "" && /^    / {
+        c =3D index($0, ": ")
+        if (c >=3D 45) {
+            label =3D substr($0, 5, c - 5)
+            sub(/[[:space:]]+$/, "", label)
+            if (label !=3D "")
+                print section ": " label
+        }
+    }
+'
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.11.0.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.11.0.bb
index df63ab68b8..ef1ff0fff8 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.11.0.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.11.0.bb
@@ -10,10 +10,12 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5eb289217c16=
0e2920d2e35bddc36453 \
                     file://pcap.h;beginline=3D1;endline=3D32;md5=3D39af351=
0e011f34b8872f120b1dc31d2"
 DEPENDS =3D "flex-native bison-native"
=20
-SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz"
+SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz \
+           file://run-ptest \
+           "
 SRC_URI[sha256sum] =3D "9237f5bae9dcf3a91823d9963ec43b7c0e2e3374ef2ad57d92=
c8cd39530f4723"
=20
-inherit autotools binconfig-disabled pkgconfig
+inherit autotools binconfig-disabled pkgconfig ptest
=20
 BINCONFIG =3D "${bindir}/pcap-config"
=20
@@ -36,4 +38,33 @@ do_configure:prepend () {
     sed 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/|g' -i ${S}/c=
onfigure.ac
 }
=20
+do_compile_ptest() {
+    oe_runmake -C ${B}/testprogs CFLAGS=3D"${CFLAGS} ${LDFLAGS}" \
+        filtertest translatetest enumeratetest
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/testprogs
+    install -d ${D}${PTEST_PATH}/tests
+
+    # Perl harness and its helper modules.
+    install -m 0755 ${S}/testprogs/TESTrun ${D}${PTEST_PATH}/testprogs/
+    install -m 0644 ${S}/testprogs/TESTlib.pm ${D}${PTEST_PATH}/testprogs/
+    install -m 0644 ${S}/testprogs/TESTst.pm ${D}${PTEST_PATH}/testprogs/
+    install -m 0644 ${S}/testprogs/TESTmt.pm ${D}${PTEST_PATH}/testprogs/
+
+    # Offline test programs driven by the harness.
+    install -m 0755 ${B}/testprogs/filtertest ${D}${PTEST_PATH}/testprogs/
+    install -m 0755 ${B}/testprogs/translatetest ${D}${PTEST_PATH}/testpro=
gs/
+    install -m 0755 ${B}/testprogs/enumeratetest ${D}${PTEST_PATH}/testpro=
gs/
+
+    # Savefiles used by the filter tests (SAVEFILE_DIR is testprogs/../tes=
ts).
+    cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/
+
+    # config.h is read by TESTrun for feature-based test skipping.
+    install -m 0644 ${B}/config.h ${D}${PTEST_PATH}/config.h
+}
+
+RDEPENDS:${PN}-ptest +=3D "perl perl-modules coreutils diffutils"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


