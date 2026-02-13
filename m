Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C733EDF14D
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 10:14:42 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68620.1770977680367381325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 02:14:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=EAfa4uAH;
 spf=pass (domain: est.tech, ip: 52.101.69.27, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkYkt5J4eFz1rt8wYX+IZqrmZbsLnM/Hu3hqeZK034eficKArFL9G2OxZ6Z8LG6TfnqPWleocClbQmtOz1Qgc/rV2lEkdN7hM/Jrok7qT3ecKwLk9bTv5aZxnZTItgw30DHe1wnHGRF5vZGs71mAkZWzkkPuV6bC9laTWwSolyFkLQAw/mYgX2/ZAsJPRvJxWmi+kvVMmcHJVuHXuPKrmeOGFThvzpC1dNDkucZk7y/UBYq15/CbgF8xof8j3pZndCftm1twfHWosHV8BWjG3djZgWKIksQi4QeF0woNn7NMdzG9gk0pAC/bJ4jvONZaiX5lFcNeL997cQ5rFTKy9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1F1pSbdL+rEo9mO8QRv4CE/k0h8N2f01GFGLzsSFWg=;
 b=HCs4LCT6yGo1TJJxOC+zxf5NReuDOrDnZr7am8mUiDf6DJPW36vmgkBcvaY+p7GlgybpgzGTFmhoRmR+iJm52fPXPKcmune90XUYDP3fzlpzJStYQffgmEOIB/Ul4fdgGuq+8LlXb0R4aaAncXxdZ//Y6uBMr4/iX6Ji8V3VGmuAiZ1can8YQaOYA0PKrCocveTtOU1zBPgGJjMfQnG728L8RTmJi7kqHHicPJwjMWzeeQo8d7iYjRBK8NTlVtQUvn7xOuLDFnRuRn+iCUhmCwq9Ua8E4Pi40ADhV/EIuhkX8CRBnCwuV+TB9oK2uB0SzPxD53g/lcdo3RhM8EutlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1F1pSbdL+rEo9mO8QRv4CE/k0h8N2f01GFGLzsSFWg=;
 b=EAfa4uAHH58dFlpF0oMRd+bgF3yuGvOll/QmHFzWAYTp0g6loS0TBrGB1/bCOtXQYSOoJ2WFHy1CHSqDbzgAq+hAT00FAjGGCPQnVI7uTC/o5iQ5xAoxpFw6lyvXyxD/lBpNM2nrD9ij0xkz1Y3MK7sFTvyTEeurM+z2+G+7bU6Q3DqitxIEskCDDsCMM+wHxMfiBFTnGWB1LqOjMLdCloQXeQKq1KHJhm/q1TqXHfZ2WvFGZBuX0lqzDC8q4JFRLiAN8RFREwDfbjrJKwJk9taHydMYUxHp4vlapnv/yXxJFchBSFTPWJjFiUdP7pVGWqRjk4N7gGZXM59TWtYVzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DU0P189MB2473.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:421::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 10:14:34 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 10:14:34 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] libksba: add ptest support
Date: Fri, 13 Feb 2026 11:14:25 +0100
Message-ID: <20260213101425.8492-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0202.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::9) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|DU0P189MB2473:EE_
X-MS-Office365-Filtering-Correlation-Id: 052806c5-237e-45d3-fd5d-08de6ae8af73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xyvvvnm7fQHzA9aFTfm1dMNHaT5QUqmKw4h8W5TDjed71h/DEqvg/etJ7qqa?=
 =?us-ascii?Q?XDl23Rts9q7tb7tCQlS8FqLrwUZsW+9Z4woQSGZ3W/ZHaHRz5efPwHhwDovm?=
 =?us-ascii?Q?5smo1aVvB+kxTG3Hr0PBO8PQghlDmA/XFIv7OSgljm/nnt1y6SJR9+UqwgfJ?=
 =?us-ascii?Q?7Cpsby1k0sZLgu7roMzviIr0ADJ1NmPUpkhUYcIqFPjsrW9+jaDUC+/nh/WL?=
 =?us-ascii?Q?t0nZ56nmEyG4eZH1QmnWtFe4qfhI1r2PqyDpvkZ2j+6JL1uNSLojM7ZJ+jCx?=
 =?us-ascii?Q?sBhfLN/zbdjTyJifbRri9gixikq+6eawe9ZXfONWmc5CPjNKgiNx5g2vvtYL?=
 =?us-ascii?Q?kkJwf6HBArD6jnASoUzfI5/HKDHbTzrlMXKZ/cLQxWb12oFwDH86D6ZbaCME?=
 =?us-ascii?Q?TDXy1mxmo+FW0+7DqjXgwyL6c0PnmJUL9piukSiXIVlvqoIGyGrW/Epq9J0f?=
 =?us-ascii?Q?VI5z7MwSsE5AWefYHsua3Lig/s8b1wucSRXnpNbKGYhjQ2kqkvPLmGDHasL9?=
 =?us-ascii?Q?VChiDKrtrKe0PCDbVgNlUkSo3Tb0UM6Yc5keNJg9Wm2ykgnNwluOrznGAj8q?=
 =?us-ascii?Q?omXnGfpg5v41swB8YyV9kNQAWa1NbyWwIy40Nf/FSI8mgg+M7v8bQnJYLyQm?=
 =?us-ascii?Q?TMv9rkAR0FNsteo93Kl5sQXWBcobZoIi/9UOwUjp9bQWMMjrVkkdTRPO8lfh?=
 =?us-ascii?Q?NL16+aa10Qmlrb+SS6lzycdrqNla9/Xt6fpTvTNZM0oH6ZTiWEe+EtCHV30N?=
 =?us-ascii?Q?/70gFPDJ6o0az2honLoyRVyWmYGklGVhQ4yw11pdwqfR5EDh9/FzBiQY2032?=
 =?us-ascii?Q?WJgdngYWjIUwUnNW+kErEKmV2XvYwh7luvL4C4ncz349uQXWC118aDGrq3G0?=
 =?us-ascii?Q?DZsm3CyjCtTGtoUaq6iaC1n1y7ov4cD4JqkjrOJVYHrMVXqOmmnAXHGX3Fo5?=
 =?us-ascii?Q?Rq7k6EimG5J2f1LrffEik+RlBAVs8a3WfA7N8ZLptL7XL+haJT2c/hnAftKd?=
 =?us-ascii?Q?55HGIg7wUNj2XVHdYpiZJqA6S84iZn2/F9Q03YfNAuMcNTVgPipAZHhWnogZ?=
 =?us-ascii?Q?oRGlK9xnNRA6xHHx8VfdjeSx9pN87QXvoI+GrmvlXoodiQq6Qsqej8M0JuoQ?=
 =?us-ascii?Q?I/WVYJMniYmlcwinzjW0de+EDRVxgZOj0E4kQEYbcohvKSYcd/fnjmhBOUjc?=
 =?us-ascii?Q?TbkWZ5kcee/g4cb9gxyDhIljxpMXFJuhXBoAer9uulOixWdJ3RzKgTEx20Xw?=
 =?us-ascii?Q?O2n6n2FtBLa3p3X6lg19YK5xrA35nZ75jdQc1hD6JdcL+md5aZCAHt1cE0W+?=
 =?us-ascii?Q?xhASZsKbvgU4bkVg8WqSDNADxA0xSXF/b4s9N7c6uXhoCucvqBuJbD4H2Lwm?=
 =?us-ascii?Q?1/0UsUsQ1mxtLaNlS2vFc5FUeS9xE/JoCpMsd1lXN1Oq1QcK7aQ55WG6RMgA?=
 =?us-ascii?Q?do1waIOl2cZKS/6XY1pOjIrt/dm9cRlOvpTJt8SOjCdme+kHo8WTaN7R46AX?=
 =?us-ascii?Q?lbLKlyJQqy8TCbvc/B0gt5B4WxWzd2ho1luZlA1P0tQn7fWiUyTMgRnFqhol?=
 =?us-ascii?Q?Naf9/Z9JQjtnC4tcwfo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2h8YRaYw55jj/Euslu0x78TXqBQ2WvRd/Hu8/HDBtBk/KUl6cqgfBWC86uDR?=
 =?us-ascii?Q?O01s9UPEc9yvTaa4xgna0e59L3nMl8BPSKxHlanWEL64/YPgHvIMfdwWHiit?=
 =?us-ascii?Q?++vZFD7je1CRnex2hbxsdQmyAMMXjkhp+SPN9KGNLQ+j7XxdNrY9Zc+4xAcE?=
 =?us-ascii?Q?Vfgzs7E4vcTF+gkEXuXZjOXhl1JFY2vZWpV4bJrhGzzh5dCInJn8xeChZVeb?=
 =?us-ascii?Q?iyvDrnChDrxe5r9YYfOE0XiPjCSiuebUWgmMdOX7VCBNGG4oawUzIn47lX7V?=
 =?us-ascii?Q?k6vg0vD7RUBQmkVu0nkYTW4UJy7xTbRDgnl9qbGGe96z3vvt0cKPERj9qZZN?=
 =?us-ascii?Q?I1TPcSvAyObJhXgoYrIThe+amONbtFH1enIsDzk31dAovrtO2Y+EpzaAGP/O?=
 =?us-ascii?Q?DSp4aW1dZoygw9Ms5T4PnOxnHnDbbiQcjd76DkZI9cwgOOG2gfntvhbwLUBY?=
 =?us-ascii?Q?su/8RpHUj3+xJdmJRePrHbU8JsltPabW3BwiSdlezdPyy+yhScdLSOVNnJBp?=
 =?us-ascii?Q?JLpt8q79C8TBYOnVFy0JGpcI3eENCYiwMHWGDE8npNpU5RMXjlm7S3dBy7Me?=
 =?us-ascii?Q?8Ky6uenpwwRSRXsc3To3bAAE+MCyC12kvbxkcfzivrmf0iRJVjLziGQ8SsN5?=
 =?us-ascii?Q?1qcVw9PYxxc6AD/uYkJaftUSdOsm+eT8KZ494JVGuxo807R9ViaYEEHDZrcw?=
 =?us-ascii?Q?Nxz9BAmVEjYKc2SLKg7cTOt8UfvgIfZXQzvlyC5i8jsHnvj7X/CfzmDX4QEq?=
 =?us-ascii?Q?9VjyXjB1EG6K3I7Q/QQLQCcSym2LgTlajheL+daa61sUc6+LIgPWO0J+ppT4?=
 =?us-ascii?Q?hcYlZpvcXJacRIPP4mRwVDff2dBZqqL/8Gz0d0TEALYDPvTZ4+LB3TQs8peL?=
 =?us-ascii?Q?i96EtUH1qYPCYijWnG0h6tQTzcX7S4AEXOcDVg01dPe9mbzumoy1pIZyYXzE?=
 =?us-ascii?Q?sANINMikRcBc1hnDJeKktK2iiq7YEtKiGuGxYnNGAQ7WqMTXlVw04LT3ntWB?=
 =?us-ascii?Q?wb5gjLC8wPc1RSAa6mxZD3BWYbkMdedFjeWNIMPi9yvdWaLFagJVgdSqFOj7?=
 =?us-ascii?Q?XlqmQYsYbWNG7UcQs04arl+2RtTDGo+PaFsKx5EDEaC5Iu5drr197sV/1mVb?=
 =?us-ascii?Q?Vr1YuQVmYN1o7+Gv8tyRzjEGY6/vKlOHHSTRvQUPsvyETWpfH58GZYjicgvk?=
 =?us-ascii?Q?3X47KwHQnQJzws6utII6r2rj+q4VzlbZiSZaAGdM4cTrZqYT7M1wrpqLzFxd?=
 =?us-ascii?Q?V12gJv7zWxxO/SEFml5eimc5z1o/ZNwOqFq//Gi5jk6TUUtpk+TU/dzHW2Uu?=
 =?us-ascii?Q?IYJSrycr1z+EVfCiMLfCoSt+vJmzye/5qvvOB/CKGt6EyEiFRCImzq9tcFXI?=
 =?us-ascii?Q?VvDoH9+2/wzZAbjMksfy350AQEjDAvw7yfErOD+zQlzORNBLYqCAvk9U80un?=
 =?us-ascii?Q?ZBkQYjPkHfW8hO1twca1N9YogHmljdLHeK0OahHf02WHsXrhfPuvtIk/AWIT?=
 =?us-ascii?Q?dVRudLOb8aEw1af4j5FLOjNRw5JCNrPqIGfcTR4QYBEEbkyJLpnbxigHrENM?=
 =?us-ascii?Q?4JHHcgNsbBPwkZ98I8mt3erdr0DSVAnJ7BRSKE6b7gsq3wndyGVfs6yaK7NI?=
 =?us-ascii?Q?7tyA5Qh8d8vi0a/g6J4Z/tmsFQgIink+py5iZAE3JDZdrrTyubUam7xKr1HX?=
 =?us-ascii?Q?VaoVTkWqw+/xOTdDmgptPPa9R8X6xgFjx6tTiOAXpNzmacV5ucaI6XJ/Ic54?=
 =?us-ascii?Q?2TVaeIRX3w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 052806c5-237e-45d3-fd5d-08de6ae8af73
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 10:14:34.3384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJETN72aBd/Zie+V5ZEOFmLSVQXJVNgrtdYTca3mnrmtgDb89XOb2ylrtsrWvoYIRYYQKj1Lg//K0iq/K/1t5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2473
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 10:14:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231110

Add ptest support to enable automated testing of libksba
using ptest-runner.

The implementation builds and installs test executables from
the tests/ directory along with the required test data files
from the samples/ directory.

Test results on qemux86-64:
        PASS: cert-basic
	PASS: t-cms-parser
	PASS: t-crl-parser
	PASS: t-der-builder
	PASS: t-dnparser
	PASS: t-ocsp
	PASS: t-oid
	PASS: t-reader

All 8 tests pass.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-support/libksba/libksba/run-ptest | 12 ++++++++++
 meta/recipes-support/libksba/libksba_1.6.7.bb | 22 +++++++++++++++++--
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-support/libksba/libksba/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index fbbd118255..d11caa745d 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -32,6 +32,7 @@ PTESTS_FAST =3D "\
     libconvert-asn1-perl \
     libexif \
     libgpg-error\
+    libksba \
     libmd \
     libnl \
     libpcre \
diff --git a/meta/recipes-support/libksba/libksba/run-ptest b/meta/recipes-=
support/libksba/libksba/run-ptest
new file mode 100755
index 0000000000..d09bbb0cdf
--- /dev/null
+++ b/meta/recipes-support/libksba/libksba/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+cd tests
+
+for t in cert-basic t-cms-parser t-crl-parser t-der-builder t-dnparser t-o=
csp t-oid t-reader; do
+    ./$t
+    if [ $? -eq 0 ]; then
+        echo "PASS: $t"
+    else
+        echo "FAIL: $t"
+    fi
+done
diff --git a/meta/recipes-support/libksba/libksba_1.6.7.bb b/meta/recipes-s=
upport/libksba/libksba_1.6.7.bb
index d97fa84977..f4d076e72e 100644
--- a/meta/recipes-support/libksba/libksba_1.6.7.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.7.bb
@@ -18,13 +18,15 @@ DEPENDS =3D "libgpg-error"
=20
 BINCONFIG =3D "${bindir}/ksba-config"
=20
-inherit autotools binconfig-disabled pkgconfig texinfo
+inherit autotools binconfig-disabled pkgconfig texinfo ptest
=20
 require recipes-support/gnupg/drop-unknown-suffix.inc
=20
 UPSTREAM_CHECK_URI =3D "https://gnupg.org/download/index.html"
 SRC_URI =3D "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://ksba-add-pkgconfig-support.patch"
+           file://ksba-add-pkgconfig-support.patch
+           file://run-ptest \
+           "
=20
 SRC_URI[sha256sum] =3D "cf72510b8ebb4eb6693eef765749d83677a03c79291a311040=
a5bfd79baab763"
=20
@@ -33,4 +35,20 @@ do_configure:prepend () {
 	rm -f ${S}/m4/gpg-error.m4
 }
=20
+do_compile_ptest() {
+    oe_runmake -C tests check TESTS=3D
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    for test in ${B}/tests/cert-basic ${B}/tests/t-cms-parser ${B}/tests/t=
-crl-parser \
+                ${B}/tests/t-der-builder ${B}/tests/t-dnparser ${B}/tests/=
t-ocsp \
+                ${B}/tests/t-oid ${B}/tests/t-reader; do
+        ${B}/libtool --mode=3Dinstall install -m 0755 $test ${D}${PTEST_PA=
TH}/tests/
+    done
+
+    cp -r ${S}/tests/samples ${D}${PTEST_PATH}/tests/
+}
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


