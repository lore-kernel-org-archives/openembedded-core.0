Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2D0C9833F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 13:10:12 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57070.1790601004545245775
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 06:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=syiktZI7;
 spf=pass (domain: est.tech, ip: 52.101.83.58, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbE/Z1pwjyWGXRQUZTTLm1voXCZYmJxMboPS3W54Ej23E+yNI0Svcbjb9TfqvMOfZikZBkk1xamxs91JzgUHdXmN0+4wbhu3F5VXoxUugP7GYl1p+5W6HuXPi1wtFHXtF8U6TWo1UYVoYN5BPnXmRCo99luYKbtusacrC9n/fgMN8hk9MspMJjM+4MAV1Q1SPs0hSVzsq25m2NQRP9V5vlyoNRJ6u/OUTJ5BIgUvCwvv5cpTgp0djBZB0zbR2c2pX6hG7mXKTWQfkYWDVeElp7HKsSkM5yhbREF433qfH5pZpd5Q4YyfOyEmhki6nrgl8F0Exs0oJ/jBvfDXX8PBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MlMYynlPkb2HxbRPN82Iu6qYdqrz5BM1yekV5AKAYc=;
 b=RD9kz7tXxjMLFWeMLm6mfAE2IGZVFWxyBMXO0293/4pV/bFeaOKqH8MTqUXpdKnlPhgA6pvCM+gmOIOV3lRA7MzX4OYyDL/xSnyGH5ZChCNem2+5GW/8menHJ3zIyFy2vm7wI55FII5KOCo/Yk5XInYlkHu+fzh7C9+sVoreA8zwBg6IyxCCbrRXLTwKxxbbawHKO7tBlMaiRMFS7NONXRwP2rtDFtDEtt56E1ztCLEvoSr049SqiEnAYE7SUgmzM6F5vKmsu2Ow5oIfU507X4ZrLDmQy3X7fQXbByIOeYw+O7cH40Kb3t6DNU/nUwLSlDFwuHWF8wcxRFNv9YF0lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MlMYynlPkb2HxbRPN82Iu6qYdqrz5BM1yekV5AKAYc=;
 b=syiktZI7ihFPpAuZ28fjYxW4OQQ27J4AzXHcTWDpNIYoQAyodmQgh3zQef3xkOvFbi1ougIVKHwbFHTiiwH63BTkN1kKgLbHAgwO7rx12avT/1hBm/EDLlfx1ENXqzkpa+wGQ6EIHhgx3FH7j5gjzEuP1Ud3/ZJyT1YakXiRzStomWKGN5oBMd2uVpOsNtWpOC3dkudpzzXyqf9WoubobtMKFnKMG8v27VgCn6CoToPbarSQBYt+hVxGMtiGkJ0jxjP+M+NgGGuFsIC+yl/qDLS3cBFiudLN5PxjLJPrJg46f8lOQtemvuyPThTRkffz/Hdlnc1OIzOpJia375q68Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AM8P189MB3142.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 13:09:58 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 13:09:58 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH] libpcap: add ptest support
Date: Mon, 28 Sep 2026 15:09:50 +0200
Message-ID: <20260928130950.49433-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0044.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::7) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AM8P189MB3142:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f66dd3-2625-4365-ff6a-08df1d61cbe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|260925021311599003|260925021911599003|3023799007|6133799003|260925022911599003|12006099003|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	9Lnb2bV32ZK12wwhOmZE2XKQJNsq2NoOdC8RtdHLrXNlGRZUXigJzHSW31BZ3qLgojjwE+tR9MgALaYkKDNCQSIpahzTTLsFv+c6mmNmfCkn6TsadRW+yQ2CVf0xFY98SecRa9ROpILESLvAWuoPfKqo4h/53vA+xpQbWx/Z5jEauJzQ2anMVs0p6N6MYe690K2DHH38QCMMDXvxwdUbOsvBQLXMkbnqOgyovcnk5xl1ptuDOHaEbwGq3GHdXFMSEOjPM1IwGJl+RkAglhW7ko7PnIXdzhe99VjbzOxpcWHUUwTiyRCyU5o6zwXyt6+4kzXpg2Fw7Ux99+g2wswh62Oq4ujnqDQYLG5iGkVoZOZEky/YW6d8xP4RjjTALysyaJozFm9uGlA4aTJzk/Ow3/reEJGQLZvzAAfQ+YBC1TcGppGnILjpOR0EYbGUJCB6p4Hk5WXkpJ3vwGxoUkVDS3t8UsHiU5O6VVr/rIHr8sHoUMUFxQK7IBxFYPuQIhAr4fxFJ8J9lZt9Zw2IogBJnygu9C2Tra8WFMj3E2LxDxp7ecYkLuAz5KRS79ljzjKpnCRq8zsnmRzXdw7SbaGDim2LE8PzFsAJoNsMQ4mOeG6PBKkI+fd3vP48G2dyLwp0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(260925021311599003)(260925021911599003)(3023799007)(6133799003)(260925022911599003)(12006099003)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZHT+u91uo1wVUIxJbgt2RSlF+yjjx4NCEY7r56lyW3a39603ORWByGjP/I6u?=
 =?us-ascii?Q?YoaDUWK7/5OrBfw2NEr/DaB6uJ37Q+bR2VjxL3SiOXApd691zB0wpGKSFv2q?=
 =?us-ascii?Q?Xq2vtEQ3pdiu5VTDFv6jQwkQqszSVvq7FDd4uMBUBxOJfUZXq8IbOIO4XFnd?=
 =?us-ascii?Q?KzN0VCT04aPjQ68fYcK4chUAx79Am9a65PEtRYx2gMZJhu16lWDiudge9/lJ?=
 =?us-ascii?Q?QycOIgpigugj3CH3UpsXzJX0n3TDTCi3kt5LnBcElZoCWKzDwLNVptV6ZwYn?=
 =?us-ascii?Q?43+0bIh81+B2KO+FqlJkua/zERqEeztBeP7gO+RbyjWjCTY8tXVbHZkdqPVH?=
 =?us-ascii?Q?JnSnDLIhC11JDo1yNfnSDAO4BZNG9nAVsiplIO8C7jlVcrpF4YG3PHlmYfdc?=
 =?us-ascii?Q?I5l9PUM2DYUu+Y/uI9aWlePppXVp1XXUg6tJVT7SScIZAybLtqvf1Gimvb5V?=
 =?us-ascii?Q?MW2NYoNNJDDQBBB5AZ9t51melUoOb7NyrtY7s7mPbzthsl46WKevPWER0AXl?=
 =?us-ascii?Q?tOsEFkI51DPmn9DYbpipw+JD+OUj42kgJICambzWbtovQC1m0+hYqP/sxPfn?=
 =?us-ascii?Q?2LiAP0zbxYFlMwwKPvvgzwAx/RPQRCf1DYuM+83kh+iPUitXc/FTQ847bK9g?=
 =?us-ascii?Q?GJoYKRF+OTaBieUzymHZeMuPbwiBsxt2goV90ACd29LsYleJulAr4uNN24VS?=
 =?us-ascii?Q?cFLa8Ig5yOMB90/flj+EQzbRvLyZAriFasWbijkwQ94edrEedviCSRjjuw4M?=
 =?us-ascii?Q?zIRjj2PMycuc8ruLSZa1oOHiL8DkG1T+P30HkDnxUNdVWTJrMlXSECb1YNZM?=
 =?us-ascii?Q?aEnNBLw9ImYkSFyRDhLfNCzBTQ+QuvknkYwNDWF90aPJNtcKqhlHuNpvda2D?=
 =?us-ascii?Q?brWDYgaXIxgV6msldDrFWMidasDWIJAf22Jkqqzu/XMXenQeWtR6mAI4GYEt?=
 =?us-ascii?Q?gyYrGohv1gR0jpARLXl0Kb60CXijJnAFgXFzm82EPsRyDykMfoQQ8+MzaUx5?=
 =?us-ascii?Q?ZgqpSLZs3afVDikeJM79UEKGoIMrIqhqFI4fWoDCLWRnUEM8wrmLy94SJM+B?=
 =?us-ascii?Q?Z+05bveiSQWjlDJwt7ascF4X5Ersjj8cCjTdqnrNEPb3p0Cubnjv3naxYCsK?=
 =?us-ascii?Q?1Pmkiq8A2vxoX2RcKzk4AOrtZ1jWWT1Hb/xwr+MZ6K5u3cdWKeiv3FpEgWNw?=
 =?us-ascii?Q?P8be4d7eVErv6tEt320kikfEULExNM3UPKHUUU2x05tiBz2s4xiChlKg48jz?=
 =?us-ascii?Q?1abR0DX0UdtdX+K2DPfYnO3N20mKbU+G0niySzU4LygQSoX/QDDGq/o4cDns?=
 =?us-ascii?Q?B0StEqVkd6ZYqhCxzh/1ZI6/pg1SqrhpSHTpsKP8zkk1gKpelidR3rQu2Gko?=
 =?us-ascii?Q?1V6M++oRnlpgxqjeH+elnd30aROUpItamBGw7vHd2tfor26M5YfTM/pCoyKv?=
 =?us-ascii?Q?OV7/XiDhW2OC1W8aw542xxXw+o2Ed670zBcLjmZWePqVhCSwVf04PkZaFek7?=
 =?us-ascii?Q?Esmcq479iGvFwX0z/A2xcYlymOS9VjxKDPUxBKKioXTQSL3+wQAn8iz9zBm4?=
 =?us-ascii?Q?80q2PPuf0mFgfjYZx7cM2uRu8gYtb3lXTIcvax3/30ZN1LdLunaIfmh6wEff?=
 =?us-ascii?Q?HaKGcxnNBiMfToedkHZ9c8KVjGDNFAXeMEOxTP3LtqnRAAZG/5bvkwrYUqwJ?=
 =?us-ascii?Q?8B5N1HrQj6FCIQn57h/XOnY0vO10U2VTamVurhB5wkXPNwFXfysEATviuVyP?=
 =?us-ascii?Q?u7QFuhmkdA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f66dd3-2625-4365-ff6a-08df1d61cbe2
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 13:09:58.0409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1T74qVmqU1sWtL01EuYjTTyZXQYYj2TjR5RdofPeHkvOBb4lWl3jLcZp1/uOsuwMcWnhEn1GcdRIkgv31/W0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB3142
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 13:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246764

Build libpcap's upstream testprogs and run the TESTrun harness under
ptest. The harness drives filtertest, translatetest and enumeratetest to
compile and translate BPF filter expressions against bundled savefiles and
compares the results with the embedded expected output. These tests are
offline and deterministic and need no capture privileges or network.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libpcap/files/run-ptest                   | 30 ++++++++++++++
 .../libpcap/libpcap_1.11.0.bb                 | 39 ++++++++++++++++++-
 3 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/libpcap/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 7d0a9148bc..3ba103de06 100644
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
diff --git a/meta/recipes-connectivity/libpcap/files/run-ptest b/meta/recip=
es-connectivity/libpcap/files/run-ptest
new file mode 100644
index 0000000000..cc0e1862ac
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
index df63ab68b8..ad4e64861d 100644
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


