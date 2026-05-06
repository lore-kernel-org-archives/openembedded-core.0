Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB13CD342C
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 07:46:47 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13274.1778053591121716617
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 00:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=M/4yb8bz;
 spf=pass (domain: est.tech, ip: 52.101.72.36, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yPK6RF4ja7HEU+OAHJ8rsT6GCzFiUgXLllWrOFGAtzlvPg/YokUZDPBI/mmLXyi3qQ8Pw+CuMY8iLNgrhNGXTdkUaXCLgAFiAeyLTz5M+kquSrz9apWdZGVc4ry2weiHW4xPd5Dts8/AQj+jqJ8GTRsgyUWjdTcAzlxI/Wpyi5hK9rbFNY5na+c55UURRwRXdKuu2W7gCYJ7IYG0cl0wFKe4HiYi/DddKppWIzcatP9x+JpVHq4WracKZus+cdbXqDdWln0PkXCHbM4Eu/zyT2x7F/JCYkoz91DXpgipz8F2XfaPGlN1YgQI9xq0K3SlN60w7SMRO4F+onGtmYCFpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/aXzTJytNEsVXPiqkBGis9A2sgdQbCEifJCJ7pTEGg=;
 b=EljEtQyWNnVcxzp8/CGDH3BmUp49C/6/AxmWIl1la2NS/AiF4v3gowh5RDa61y0L8f49BTvjtG9AKXqwJuqsvGAgoaSdEG4Cva3AJcbXK0mGOz+D62jVwFUfBTw77aqf8iX1K9zodIqhgKLW58+nY3avsWSVWqH8+21gYKzrpH0jXz17ft+NX9FT2vYvgx8UsJg6rPrrJdFpT9pZXoPw/JrWSFlg87u4bj+6Xxlf37Eg0yXQCZPT+PM3I6NhYHz7sFFzPYPSBBcV6eVgVSFNM5cJ23NNLU5wsag3X38pei/mPzU820z7s/ZQ7jHQFADZ7SwRAxjOZZ/lPuVDJupWeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/aXzTJytNEsVXPiqkBGis9A2sgdQbCEifJCJ7pTEGg=;
 b=M/4yb8bzs2No61b7w/ru3ESAolxgqvhYHgPIUqROWpAKprL3mRQz4E6HpQktGakEAULpGEwYJgHLAZAdcMBO7kuyOuIAI1DeOFI+sf8mPxPHaXPsdYSFfKqlZnCaG/OdJHOY2VY/b0tPpFeUDFYGR8BMGVH83V5bogvOv518ZuKZur02AZjpgKbnxaS8R17KEl0tokhtJOqmhH3o38x1SlGO1cHWRUeWbytx2+VwvCSMHTD/VMd8SqJd2bP9HFYZ/OUUFscLUTsnp4voDEekN23Msyk9zkb52VerF8NVQj2+FVqPdSouca72saSe71APSzcu3hAsvKKr8QAGLcrM/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DU0P189MB2450.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:41d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 07:46:26 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 07:46:26 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] gmp: add ptest support
Date: Wed,  6 May 2026 09:46:18 +0200
Message-ID: <20260506074618.15882-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0411.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::20) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|DU0P189MB2450:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb7fa2e-1b5b-4bec-e955-08deab439369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	+bh9HWhkx83kuFMrn2chJ9yRTgX1/ffCKGd+7bwYLnYxty7ilC1aNDwmLvhNUnI2sr2iBn7p8uz0RKw5E7RsUvZBOfL6n9Z71d67EKOs2tebUF1fOYXHnAs3+Gnq/2NBkPLcAQB2REfeyOcjl+j1/wvuKtinPScZCdjxiCo2mQNpb4k1sYr4axkF3CrpzPc9C9knQl3iuy1mxqRnWJQsUTh5zy9TM5xmdazjXs4g2PwxhXccRFFi2V0jQvfWRAMBOjzLwnC1RaIMazwmTI/wwXCWYMckMVApTXUH1+H8lWy7Wv4al2IXRTB8GqozH/aXI91ey/2NQC4CdT5jWN7Ue1MJwgM78mKRHnZALnYWk3HPTYC1MeB6g9setMFhq88DuDscbOzRf9txkS9lZ6ze6YaW7j6eb86hZTTmRBPKjmbB92qRnxr8YbroF7SXqHlM39JJ52expvsbddZWwLCgie5nHQI7RWok0xzk2GIVZU/wYJ48C/sZm3IHZ4TLwPxOf3qqWlAqGCLO6A/R4gHegntGrw44AsUsVvErnRW32fkI6mw9hB26Vwy3UxBP+LGuxHrEDRex4fJ80zJud7CO0r+8n4HwVLwfzlKO6zDukQxgIaEFfNSSjI/vuizLcIDI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RHYCtRLMjKeKuTcOmByuzsGyM2n3dixuahAjotGq691U7rk+cCgAjCkXxvoO?=
 =?us-ascii?Q?FG2GRLrn8BKHguX//00Ro/7rZfMByYJ/4E0KiO5RaUHfiFFITWhH1UFgf3ew?=
 =?us-ascii?Q?nwl1SxSnrfJm0EZvsELjfcEhETeh8y6sTGNTAFk0s+XYOazLE+KlJ2T9ZnpC?=
 =?us-ascii?Q?8ZOmKIvjL56SgweTN2SujguSnFZN4iykJRG4NVujdwcKeZW7daXFwKTRh6zX?=
 =?us-ascii?Q?Pi0tvWyH9syFOuxIGFO2FjhsKt2Pe5q+zPNWGsjBeG7ISQHfTHc6HqwEz2pO?=
 =?us-ascii?Q?SQwF+DzYAb9lUjSpMXXg/+a4t+XcUSXX2OidY1WfYZ0TdSnB7xBVsZzmDNKU?=
 =?us-ascii?Q?WZbJjDnLWM9rYfcCWaXyYg6BD26sTf1oM1N3FfdQb5l91zUyiuqoBvyQ3gSd?=
 =?us-ascii?Q?GzfmZZP3pxs/kbUwVb6gCaeTjEtO/70wL3EgO/8F0uQpOYeFgLrlHEKF5Eeo?=
 =?us-ascii?Q?mL7Szq60zEVX2jMQU0OMBRQ6l1CPv3gNKwMilYLsnhR22JPcLC5OqAIZOpIK?=
 =?us-ascii?Q?xAXHKT6v2QIALQO+oI5Q3FuxAWzj/mUDcyC2L1QRSW9v354qtV0uwZMJRY0j?=
 =?us-ascii?Q?S8OUNOB+39bKV1xrjX9wQxSQmgioXL8M3sPW+v+1NAR6npJSA1qlnO1fYlOb?=
 =?us-ascii?Q?QtDBUI2LnI4jFHnC4wVTlDiLOShzxdLQG2ew+B6Gq+WR/WF+uXDVW5hopKe/?=
 =?us-ascii?Q?d7j9jILO/02SMihlzpnu7TFJGFjuuCnZDGDbh25d3fATGHEFbycNO/pmtuI4?=
 =?us-ascii?Q?/whdmb/PoQditP0CpFwSjkP1Lx7hEAbAm1uxhHXXPpHliFnBdC2rswn0KjgF?=
 =?us-ascii?Q?s99SaEr1W2T+bpe3GxzSAHM3E1NOXONS8wVgXEgKtpjypauWKIq0eZ0D2r5o?=
 =?us-ascii?Q?dkjRujU12BcBwfapiWQpxvv1QcilL0FdWJlPGymMbWxGoyqLGHxHPGgNarCM?=
 =?us-ascii?Q?HTf0yUPpdTfWNxLj3UFzLe94AaIpR1hBCGD93enCoL457vMnUbZ/MGLREFUp?=
 =?us-ascii?Q?Y/4XCXXlaXBOhjCNF1r8jwxBkEyQgfrXWk/Y7s5X44GWSzZlDrH6a4GTje3h?=
 =?us-ascii?Q?pkUXMwaHK/Yakdew+ZSdMhnedhfUGvxon4hkRLfBgQEhGiEQpWyYdJ/c6DaW?=
 =?us-ascii?Q?sbsDOn3RmvQpavKUMt/1p+C+Vc9prjNe48OGQL0RnbRO+LDIDkRxBYrrdchp?=
 =?us-ascii?Q?7wQVAhIYkLsWlATUGGy+nrz2aN9E7YXmHbZlywCrsP4a1apxO9PJuUcu44iK?=
 =?us-ascii?Q?cVDQJRf5GBSLFHQIIQRfjF7cOqCtZyFZaCz2geVAw7nEkYZt6jVBRSFxRSWm?=
 =?us-ascii?Q?5DeMMvfQnaZk50qPO7kUb2bN1bmcju4QmuK/YlHfKavp/8MNobz2PaYbBN3s?=
 =?us-ascii?Q?3pn5o9OvoGF/BdPVxclnBm0FG828rai+nJtKPckE+L4MG/4ee40e/NIoByJL?=
 =?us-ascii?Q?iSu85CGV45QVT1DdvNtybraH1PktPeO0XyOdpfasm+ktawuU9YkDd6lAyunl?=
 =?us-ascii?Q?b2IyxuuJ14JIoOfoVwLf5COGf9ETC1n/aARqvrsR6BNTO8x6thDOaHwFE6Az?=
 =?us-ascii?Q?6A8b3zfBhHw8a6X6Mg8Mo4ptsxwwvPvkWJGg6tAPxPrUPxmH6OBkYPtgBNa2?=
 =?us-ascii?Q?iwVQRXuRm2Dzs//p84pNZTFed1rMgC71doHEPloDBoVkcq/VepX9xL4vhtmo?=
 =?us-ascii?Q?vSzY/NWmvjQtH1ykBRPPQASbRbEJzxxRta0V6CEM12VIvrgjTj1cg8fCeU58?=
 =?us-ascii?Q?7bL3SkcAsQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb7fa2e-1b5b-4bec-e955-08deab439369
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 07:46:26.0826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/TtsDTcddvzxGaNkpTjPG3R12JCY8YF53kUexyMTTha4vFlSkSAfFYMw1Dj02gyH32Cw4YeRxHPHiGtPP9QJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2450
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 07:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236531

Add ptest support for gmp, running the full upstream unit test suite
(200 tests) covering mpz, mpn, mpf, mpq, rand, misc, and C++ bindings.

Tests are compiled with 'make check TESTS=3D' to build without executing,
then installed via libtool to the ptest directory preserving the upstream
subdirectory structure.

Tested on qemux86-64 with ptest-runner: 200 PASS, 0 FAIL (268s).

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/conf/distro/include/ptest-packagelists.inc |  1 +
 meta/recipes-support/gmp/gmp.inc                |  2 +-
 meta/recipes-support/gmp/gmp/run-ptest          | 15 +++++++++++++++
 meta/recipes-support/gmp/gmp_6.3.0.bb           | 17 +++++++++++++++++
 4 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-support/gmp/gmp/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index ed89f9dc76..920e63e4b4 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -24,6 +24,7 @@ PTESTS_FAST =3D "\
     gdbm \
     gdk-pixbuf \
     glib-networking \
+    gmp \
     gzip \
     icu \
     json-c \
diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gm=
p.inc
index 1872226616..106521954d 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -3,7 +3,7 @@ DESCRIPTION =3D "GMP is a free library for arbitrary precis=
ion arithmetic, operati
 HOMEPAGE =3D "http://gmplib.org/"
 SECTION =3D "devel"
=20
-inherit autotools texinfo multilib_header
+inherit autotools texinfo multilib_header ptest
=20
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[readline] =3D "--with-readline=3Dyes,--with-readline=3Dno,re=
adline"
diff --git a/meta/recipes-support/gmp/gmp/run-ptest b/meta/recipes-support/=
gmp/gmp/run-ptest
new file mode 100755
index 0000000000..c84e9ee856
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp/run-ptest
@@ -0,0 +1,15 @@
+#!/bin/sh
+
+cd "$(dirname "$0")/tests" || exit 1
+
+for d in . mpz mpn mpf mpq rand misc cxx; do
+    [ -d "$d" ] || continue
+    for test in $(find "$d" -maxdepth 1 -type f -executable | sort); do
+        testname=3D$(echo "$test" | sed 's|^\./||')
+        if ./"$test"; then
+            echo "PASS: $testname"
+        else
+            echo "FAIL: $testname"
+        fi
+    done
+done
diff --git a/meta/recipes-support/gmp/gmp_6.3.0.bb b/meta/recipes-support/g=
mp/gmp_6.3.0.bb
index 8f18bdca1b..ffdd3e4397 100644
--- a/meta/recipes-support/gmp/gmp_6.3.0.bb
+++ b/meta/recipes-support/gmp/gmp_6.3.0.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "https://gmplib.org/download/${BPN}/${BP}${RE=
VISION}.tar.bz2 \
            file://0001-confiure.ac-Believe-the-cflags-from-environment.pat=
ch \
            file://0001-Complete-function-prototype-in-acinclude.m4-for-C23=
-.patch \
            file://0001-acinclude.m4-Add-parameter-names-in-prototype-for-g=
.patch \
+           file://run-ptest \
            "
 SRC_URI[sha256sum] =3D "ac28211a7cfb609bae2e2c8d6058d66c8fe96434f740cf6fe2=
e47b000d1c20cb"
=20
@@ -51,3 +52,19 @@ SSTATE_SCAN_FILES +=3D "gmp.h"
 MIPS_INSTRUCTION_SET =3D "mips"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/tests check TESTS=3D
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    for d in . mpz mpn mpf mpq rand misc cxx; do
+        install -d ${D}${PTEST_PATH}/tests/$d
+        find ${B}/tests/$d -maxdepth 1 -type f -executable \
+            ! -name "*.la" | while read -r t; do
+            ${B}/libtool --mode=3Dinstall install -m 0755 "$t" ${D}${PTEST=
_PATH}/tests/$d/
+        done
+    done
+}
--=20
2.34.1


