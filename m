Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C0DCA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 13:45:42 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57791.1790603134127327314
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 06:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=f7+rFykG;
 spf=pass (domain: est.tech, ip: 52.101.83.21, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQnepkpYU+JpCeB1pL+/VmhwqicaZ67SdLNeHBkGQqvGPcPNUNmE9rXNxai4dXaf3Mp5sCGXt2aLhUyhuowk7ztd51prwLeGgCQdNFPqLbyxl1/xguTAo6rN3uOPBOcNhxXQCVmQhnP/WgIymGMGUWnGz48dF/87qLLJETuqUpKMlYndLfnMI4c4ykSy2TqSFM7oLDl/A4j5XXrU1v5T9Qg/AovGo/gQ5aM0fG0brFa7qxD+y35JRyAneFzXZxsrRht3K9Ag/BCxW0FA1dVSZN8jVBFHrabWZJ1lU0uUOREtvGEWKBzzl7mdnlsyJFlW7jHQCiSHkXszYP/zXM3W6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8QYvmcYmp/GcO4/+MiaSIWFF7UXofPpmmebMy1EpZA=;
 b=aUXkGpwhRgtEAdWOeR7KTJGDIz7UU/H2/jVdQtdDcgDA9oNGKXiO9rbEFOaDW0SQZu9cyJIXRdSkHkEp3h9wl3L5HE5NyX8EeqSF/uHxTT9iQbiiTBpO1jtRMa3gczwohIWfVmsbq5i4FlMHy/ce3T/BuOvG+FRm7/DxUANGJFWDDll/oS0iy5Da3fnB2ltHrulbP8oEB7rgYWvbYRZ7+I3pWlI48g5d/uZbYrTYFsnrAKlDiQJd/oKcCftQ1Sb+nXSL8igTL0Ky1mCu3f+vtWEhlBxlFem41xDAkvYg6aOjWRwHH7NBdQ7cRv6AW6QotfggQQYeowjidlJ9s2vWlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8QYvmcYmp/GcO4/+MiaSIWFF7UXofPpmmebMy1EpZA=;
 b=f7+rFykGYXkrmdfXR6c0wb/V07pPp1CDphx0Xda/eDpInesCEznw3CHBOZLlJKKeqFgxKZB2hU0oTq3n9BJzpaFf5+8GYsYSZGlmUffxeg+ZxcASOvGoyvyZWEFuwIUqPX3KjbJ24RnLP7Api1hT5NyeZOlIQrdi7U12wk2309uSptHJrZgeAH9Yb6B7CtEcTMb3xsGMFS5Byk5Cy1cwWUN3DsAFpyF2Por9j57fRwRFLgZI3jlm3TSgfSvsl060ahneF5k13pA81qVwq/ZZAZTPDceo4NfYkm68CcAxNw7ZfJppKoUAV31w6A+KuRZ8wRjlegHnrBkLlvcE5OBiYA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by VI0P189MB3358.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2b7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 13:45:28 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 13:45:28 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] libpcap: add ptest support
Date: Mon, 28 Sep 2026 15:45:22 +0200
Message-ID: <20260928134522.51765-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928130950.49433-1-pratik.farkase@est.tech>
References: <20260928130950.49433-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0276.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::25) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|VI0P189MB3358:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a6acdba-1f82-49a6-e281-08df1d66c1e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|13003099007|260925021911599003|260925022911599003|3023799007|6133799003|10067099003|260925021311599003|11063799006|56012099006|18002099003|12006099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	WjT5w6QzQeu5nyjp/YgkVHMf/YYcR7Lf1E5GKnjgv8FRw32TaFGB8QhiSsPjteB6dziIr9hCJS7Lk1Fx5jJMlQ82kBHu61mGP1GrE3r29Gi2c8fo++TeloS4Vd+t+ccTCoosy7EIp8zJJUkkEZcXfKK4cxoNkz8TAB4lr6GrHBGtmCAfus/yeC6tk2ccjgRVDG49YzTmXGN1Dfk9WYnViooy0ge6aslNhHHab5p2LqO0KVIk3GS2O1cHbD6IunBbTIsi2k24dfAsIoF/8QPDItlKCUUFxeBodPWNwQZGuE/ddjzlf+DCelP0sNnuUoTcBoaHEldB4dQax2XZVmDG+tdMAg6A/Tx/kgMwxD9OgIvaDFnxs2ZA4dEgew/3E/4nbqPKAElgwmMvBFktvCJQysbu51Jkhqmi6nm/cBEoWUpRSuTPQJGDm4W4ttoxK3eoRDQrUDBS49gonnXDHGNZjfsnT0uPFMPjqaQRf/mcovDYCf75cRqKxOYvdMQFDjzwGpZR5QP2YkiBkp/cOtT0axdu8q5+oNPHPLsrwvCRVtLL/fp/AEL7ouyykrXzX6okZSW2r9OJyNCBdNPxZfvOaTlUgra01cuFcSgKMW9mkl0A/nQyg3/Lrjp+elkJGnQv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(13003099007)(260925021911599003)(260925022911599003)(3023799007)(6133799003)(10067099003)(260925021311599003)(11063799006)(56012099006)(18002099003)(12006099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q+c+81ORhKZ+t0tYhGCqf+modbANL0OXyDc6ZCUJuNu1RIUJAH4rgxh1iHW0?=
 =?us-ascii?Q?tOSv3Z0pW2qJM8cfehXygojU7s4YF4KgVrxiqpmXDcesvfs08jxqwqqo6bek?=
 =?us-ascii?Q?aqZTUmhauLADfAbXn+0pCbCObSTr2cogHkPzESOPYiv1XWoEYN2736nZeRZx?=
 =?us-ascii?Q?aGcaWE8AgXWp4kA7MTygERup3fHqkNS5yOBOeNFpfwk4CZk/Nf+moCZSfCNp?=
 =?us-ascii?Q?6YvdCutePmAIy32ssoM0NkFoNmsqVIgtTuL6BoVacwOAaGZCUMFBq3KPnrmw?=
 =?us-ascii?Q?hQ0aRTNBi0GoP/mz6QkFdxDHcY18fJauR+XV4IPKRbUV62MsI6QZVy0S+nBf?=
 =?us-ascii?Q?wwSsONlLfQ3e8TUM6dLMTOaQ51GMkiI79aAuCk1tI3Py4KsiyZuZa8vWr1bX?=
 =?us-ascii?Q?ikY3MRtKXs5hc1x7fTxd+ChZgrPxJAhWGjatPe/gSLSXdcMZsiXeiAua1KEI?=
 =?us-ascii?Q?wD5VgIzIiuZKX5Lx1G0Owh5li8tgj8VGMz35amJ0GvP7duFbYp8/WUsB8eef?=
 =?us-ascii?Q?4Wxo+lFccQ3fxe2qYFo5sajxC85Bq4X9QVvFi/1hEFgn9D9F3VX6IfNoY1df?=
 =?us-ascii?Q?zWegmY/8fmcqWw0QkVxLXhYu4a/5cHGfwEOvNZMOcuW99Y5fq1KgY483rk89?=
 =?us-ascii?Q?ElEPlarizBnKnEMJyALUHb1bY65iKEDVmaDEp82nkCpK+0F1UhgN/trDVZjP?=
 =?us-ascii?Q?Sli7I19tkZB5yXZTaphRby0P25EfgiVvRcSNB4s9IjRupTC9Hk44euh54zf7?=
 =?us-ascii?Q?b9YkldSNUTr5w+rSgIr6F+IdH6fras9Nyq+IefttIfHAvWw17RQ39HE/Grt5?=
 =?us-ascii?Q?MS4d1McjH0LZYXDnDK1QVqyoQymBshwS/ppd4PCNpRLBTQkPUyzI/LEvxcJs?=
 =?us-ascii?Q?8LilLvVIZYZI48BGvHznSqdpzhARQsHSpqG28BfpeKpwE36XpyeMAu8iJBEH?=
 =?us-ascii?Q?cifxK37/x1Le+EGWoIounpgVci6lPRIikGGXBf5EtZOxejUuX92dTWu5atyQ?=
 =?us-ascii?Q?XHLtfhZwYnMd7iw36tw9tobiTjBH+DNb0XiUWy+spZ3tlvMTHY9fGiSRVkfX?=
 =?us-ascii?Q?CDgy0Q0cIPRl7rF20eDJddKzVuYjfR6suM9fHFYjlSRLju59l0dReADXVA72?=
 =?us-ascii?Q?9VrsoGBgZ6CVB21P1EYSDDwC+OvNhu2XEwJadxfMIWyfom/Uj4mhI3D7L/Y6?=
 =?us-ascii?Q?DB+4/XivukKZGNLUgZNyfGyHGboI7WHz9iZG6d7TTflq7pc5TOQh7p5e7+b4?=
 =?us-ascii?Q?NVSh2jeIMtJaJKbOlfNHZurSmyaEm/v769cZ9UjOeq5dZ1W8kWL/bYl1kmj3?=
 =?us-ascii?Q?d+4FmxbyNsWvpsJq+zXaI1eibBFrFx9ALP1nyNvBGtnl2sliALHHg+RK9e+q?=
 =?us-ascii?Q?FcsfEH+BH06ofWjVmIOcS7CUuFagqsWbM40VBeF06scAm/MKrSUo74PqrGAT?=
 =?us-ascii?Q?xli/GRGoW8VKDZb1kuBAwQ86gQxLzfiG4eAIYlNQhghxhM+7k1fyuk16mioQ?=
 =?us-ascii?Q?ZxTSkZG+nPzqyGC3ZOkDF4003JdCr/I4lYIm9ZC+e2iB+IKRvM9sXBOoULk9?=
 =?us-ascii?Q?kViuaiQuDCjbfFEVZflTZqlb0/xcTIeShOSLKbBwhCgvZjlcKQg+8JWbDF8+?=
 =?us-ascii?Q?G2LFqJPtp50KoKg0SXYNESX0arz9ur2qNKwv4WLJeN3t89ET9DRpy1/iyMtL?=
 =?us-ascii?Q?/alZPpBdVoXGEKXplGxHgJiAv9cJT6lWvApE0B9olRDtCrajoMQzXLmPF/I2?=
 =?us-ascii?Q?gkChYV0wlQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6acdba-1f82-49a6-e281-08df1d66c1e8
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 13:45:28.8221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isgLj4oKRTqEZL4iQPYLPBRyaGHSwT9ubATrwWEXdflg1PUOBbU6VMmheS20kjufh0fPEWCbxO6b1G50+C0eIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3358
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 13:45:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246766

Build libpcap's upstream testprogs and run the TESTrun harness under
ptest. The harness drives filtertest, translatetest and enumeratetest to
compile and translate BPF filter expressions against bundled savefiles and
compares the results with the embedded expected output. These tests are
offline and deterministic and need no capture privileges or network.

Tested on qemux86-64 with ptest-runner: 14801 passed, 0 failed.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---

Changes in v2:
- run-ptest now reports one PASS/SKIP/FAIL line per test case instead of a
  single result for the whole harness.

 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libpcap/files/run-ptest                   | 25 +++++++++++++
 .../libpcap/libpcap_1.11.0.bb                 | 35 +++++++++++++++++--
 3 files changed, 59 insertions(+), 2 deletions(-)
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


