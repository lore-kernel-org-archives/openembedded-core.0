Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A33EDF151
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 10:31:22 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68933.1770978678408094316
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 02:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=eYfySjT6;
 spf=pass (domain: est.tech, ip: 40.107.162.41, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNQr+KKRwHn0Vk+CZSBX/knZUnN7x6FQa5lnd0qjm3Q4CBpdAsCIeeNa/dOMLAbfQFm9DN16Ko11XZagP+oqPuJRsaUMDfrDEs1oCKjC8bKUJIDJHBO5c1koVkVQlG7AXHhqrk4DLNGVKZVwwzruzhHybTr+0TbL3oSmoYfVXhYiezoPfEZzOqnFl/yzD0PFUQX24wMDMGkPHuD3Y9AHmrqHhlin09cL6gYTqOjJgjiqOfvQj+qYolhYL7xEYh8niDvERIr6kLBkOONuyAa+FkLEz3bk1PJ6HOzqF0upoO+F4rxBneVp6YIjPP3zHccDTBL3xqS6cI+AXimCNN7RHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfvWQW3pURJ9ktD9+861r/83TVSNILsBCCYYwRaxaEw=;
 b=pawEWqXolUZEtfF3cIN4JmeY43oblX22tGVj/ktJ1uvVW2wO59gS++LW/AxvoaQgUz4GAFXflRI8ufdPF+emZvTrUcSiN0xWIl8bHsugLDRGyjHpDuz8VhS9t+HuXO/sAtoKhfFYpQdAY4q8X4Y9wdfSzKcr+2qx6Evv6eDNXkzh7pJwbHdFQOl2GZCs3wMn5mrElFyrBrgldCSkkfegxJgsRFo6gosP76xNYl2BxLP8EnnEwuvGvL+X2UuWvxdlfm0CHWgVmZtGGPH568sdQw6D5gL62t63WHa+vVURX2k09uYmr3LGMbl9qJwdIBmkVD1OsQ7XZ8A+H6tx7rg2Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfvWQW3pURJ9ktD9+861r/83TVSNILsBCCYYwRaxaEw=;
 b=eYfySjT6nB751iENHXEIGdQIGt0+Zdzg2OGSEe6bDp3uh0tgOy23lJlu5pzGqlPxmM8PDMccU4cFcy0HgnA+szvXHAdel1EKAAQUatbpaSay4xS8jZYKkRfCZxw3Nc6cVKyRJ/9c1HHmISNnsI/bUX1Wk7Gb+Cb5/kAaIaGLaS7aiXGMTtURv1dgrhvjnf2BCq5OSOU6vqj68zi2NEbxRIGF6Tu/y3uSpS3r7CVWRWVbIwNu5YqgWofB/o6L1iTw+uBfyS147EoIbLJNBkqBCtIorXz+Vj+4MPrbjp2LqSug66S2Wrb3w9BoA25XsksmNniJQ8OClJXgydI9E4SAhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by GV4P189MB3727.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 10:31:12 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 10:31:12 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] libksba: add ptest support
Date: Fri, 13 Feb 2026 11:31:07 +0100
Message-ID: <20260213103107.19853-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213101425.8492-1-pratik.farkase@est.tech>
References: <20260213101425.8492-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0635.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::12) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|GV4P189MB3727:EE_
X-MS-Office365-Filtering-Correlation-Id: eafb6cd6-0fe4-4c7c-077d-08de6aeb01f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0Vy6a1zSqcRW24Ppl49gP8VIgn+VU2ByLo/sDJFznj2lA0usG83MS7P11hPf?=
 =?us-ascii?Q?KufUKJjl8s0qjC8W5qRivBcw9Vq6XUziSF4Ov6Pnmv4U68gn1Em348Rck2Gl?=
 =?us-ascii?Q?UmuOKhxgaHkP2liouE/Q3gfVokY3rJpAzseFyFFZhxiMsaLXjpqAv7VNGMlW?=
 =?us-ascii?Q?mJ2MlNseTx++Ad+Hw7Pj4p+tXvmgy6+P7wkwEKdcmOafyHHYfh73u5Fiij6s?=
 =?us-ascii?Q?LjGkdk1aDReR1sLer0aBb5Imf/LDiwfn6jROVfqfj2VnfIoZN6qYloiIDc32?=
 =?us-ascii?Q?TL9c66GKYgNMd9VXwhmxTclJx4ic0DbWk7yy4Q2wb8ucXh2a/tJ7Vnjmjn5r?=
 =?us-ascii?Q?8vOe55Ewmuq6oAVLcVLGHRTt1k6MHHkZG2P3ERVBJOASNj7bK44j9y5o08i1?=
 =?us-ascii?Q?Y8W3x0PCZEITeLfd90wJ2DxX2+ctitULBo92Fq1OlwnzZv/E1dQzyD6+fJVp?=
 =?us-ascii?Q?BUPIFlLOKKr94WBMp7uw72nobKvzLeX2hlfsTSiINk0ZsHYP0sTFcIFj2Z8E?=
 =?us-ascii?Q?yjscqqqB/O9ZF9ISyVHyiLEA4/ZTymCkD00FaKyW8KeJfWzz1YYrRr6nhvkC?=
 =?us-ascii?Q?iaVQO9CRRWbqeUb2IZZFAQqxOmXnYhlS80f3kiEmCnrwslriA9rP4F7CBio6?=
 =?us-ascii?Q?tresiKKFJLr9LUzkGpN9R76GjhV351TOAZwtzfExj18+q2q5oSorc3+FIALv?=
 =?us-ascii?Q?skEEf4q4Htx80Y8no93lXC3fNTh0XhXgRWkCwOgnJWcUbun9DcLw5jd8YxNK?=
 =?us-ascii?Q?e80ZBXwNB4dvIE1huuXplKUYzTrx5KDkbFsBZqn5qTjRuofTGFkxT0w7/zxk?=
 =?us-ascii?Q?cBJYg5wiH/L5NrT0s0G0tvrohg/GFm7Vi6EHh+2r58+b+8FhEKrxGWkCskos?=
 =?us-ascii?Q?D1qCbyxYtjXP+DLXgXwxjzbdV923IeEMCMV/w6jlJfg3Y+Nyv4+uy1Y3Cdqj?=
 =?us-ascii?Q?g/40PGcPfPdcjzJhNBov5F71tR0aCgM8MYlErn79gLJeCf1Yz0onudB/r7nI?=
 =?us-ascii?Q?WASRwvUCobeOLSQ4h6VB9mwDHBqtQ0qeXYa0LkYQ0tROPvY1yGhCTJuYILW4?=
 =?us-ascii?Q?SkaoD35JI3HwZ9BZOYtLjp1MQjF9LGMzwH+iJRBBNu/EyPzUjo1NjHU1RC6p?=
 =?us-ascii?Q?lk1wGnKUyBaPKi8Z2WIxRJ+XPkJA/gCaJFer7opVmJ3FEeJSdQN2Dgb8b0SG?=
 =?us-ascii?Q?GEdOYrRKjMfNVlE8XI5seClIWltwYMunHPHayxmvS7Z/ZRYGUR0RNXZ8hImJ?=
 =?us-ascii?Q?rjSmC3ZWxND+enG6XVASQd/d4gUdBs+aanAZilGRd3Efu9YIL22SxdArqSvK?=
 =?us-ascii?Q?fPhTaWH1NzwdXc2bpdv8wtl9dHsYXCvH+foF2mr81fHFBiswnIPsGo6HDaBh?=
 =?us-ascii?Q?oTUW4UE8fV1h202qizxEr2i6RKrQrn+p2ioLtu2UmS6BBiMUopadLd7ndHtW?=
 =?us-ascii?Q?1kwczXleb8sTCBBHz/RpmTCqbsv+GAPpYrfrX/JqYvav6U52LUZ1XCLwzlFT?=
 =?us-ascii?Q?skHi+1ZEkWIq96ygCNpTCewoW+GTKV9aBMgi4KMEiERZZe7Y7l8krPIs4EL3?=
 =?us-ascii?Q?c3l21EtadyyyaoGm17Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+5YnmIEv0yn231qVIKhSboDYSUGnaiS3TSli+xv1MxalPIxpBrMWyL/MdEfO?=
 =?us-ascii?Q?LrZBe8jv/DeAl9GtWiOKS7dErWcFbEjt0HjuujTRB/IHIJFNTDPlUNb2agaI?=
 =?us-ascii?Q?fHmtV1a1wUxMXAgCozf3UVUNcdLCwLzoJs7ObWTIju1zvHoB1Ne1s5NWGSAB?=
 =?us-ascii?Q?xQolGXORAAPcanL2MZdbmsBrQ4Al0e/rKcPhW9n/nslaczy2zyBrIS/UkXcD?=
 =?us-ascii?Q?UMuu3ciQQ077G9GDugmoeR/kll7oR5HuUtRYyGobaeNyA7yICN2m4e5V9LHm?=
 =?us-ascii?Q?6lqNmLmM9Q1NF+6Wt5IODic0lkH94ShGf+RcURPAUg4PZFEVfwJMz0xEkQED?=
 =?us-ascii?Q?ibDmuVB98Rqiutu9w+8LOT6eoaRe7ngCTkSdeYHV1B2XSlQPWNtEmAuZuwka?=
 =?us-ascii?Q?pAJvlvAubfg/hs/zshD84aBfc0mX75L7JDxEtrBJ6GD0tYTepeBPJ1HUgZMV?=
 =?us-ascii?Q?npfjgJPEy8nOhncLZrHn7W689aW/nf/C1pwX3RDJI6fJz9QsLAonPz0rJ6i4?=
 =?us-ascii?Q?xcxH95RLN6jK2e6qDwXX/VWkARdLiYZzRZZ3OHZuSsqQs27NUoFhzgt2HYi6?=
 =?us-ascii?Q?YbPtKS8PscjKJ9ctL/+Xrs2Lmx9CwI1YPRWvrYecs2gjHcEihg5OOo80J78d?=
 =?us-ascii?Q?lnxw8iHO5jzZKmtpUaiDPnFGN7qV45jqfWcV6h4s9J9peFSSOu5k/YUQ/t8C?=
 =?us-ascii?Q?rrRjd/t+UwVQdj0Th4HmIOJ8Y68VuPO0PyPeX1KtEHyAOgzW3+NwXaU+k+Or?=
 =?us-ascii?Q?YziUISevi7LfLj7nmIigNvqHSUCShQm/dhyn87gKYtpSotNx8PKW4sieBtt5?=
 =?us-ascii?Q?7p/CHTpk5tjnagvQLa9c9edjEsW53SfEk/jTx3821MkjTAUPWJ3iUnSwGLxP?=
 =?us-ascii?Q?GBl5avOIJQGBRWF7Bx7ix9cOIbmxv4ClZAbehNuQRuvrGysDvuIiwLzBWUSy?=
 =?us-ascii?Q?62GkuXAORnsUWt9/pw4/6ub6eDzNZAP2a2fKkEd5frspTXDxNV1EPL2NlGQc?=
 =?us-ascii?Q?hmJyvcRr0mhjRkQ/ctNPdLzIDmK/vyf1Ltw4WmNgMiTHS4gb/5/1XQ1fyEvX?=
 =?us-ascii?Q?p6NPuS2QidK8cpgFELaMPi9xsd57zcgtw2e5mZyoSS5kR3iTJntT8Bp0ylbW?=
 =?us-ascii?Q?5GaUQjJeqkNLFrWSrtCUpaFnD2fYApRhcGrWiJkfFY0JQz6mglFm3OZeDPgr?=
 =?us-ascii?Q?4AcyjMzfg5jpVlRpSSTiRcvKrP9bwCTatbp9762iVm7d6fLd41InlWlL5Oft?=
 =?us-ascii?Q?NfshGCJnhk2NNV7Rf16vKD3dDR/i1VFqWhS9ARLT2jBURRFUMCwZ0PLNJbZZ?=
 =?us-ascii?Q?NJ8KSdHEpAiebNbBTtP80SI1BEbBi7pcrNhgh2JfDZFT7Tt9i/3ZoA6xQJhi?=
 =?us-ascii?Q?Tv5TWmRMQlkI+v4gjoN6tmT64pRlGjL/s6KJFuyP4kJ12bsJ8EsTL5M6VYFq?=
 =?us-ascii?Q?AgD/Yhk0xa/h1QSVxYf4BffRDRD9Mun/jyME1Pi70mYV8glZEOC1irayMv99?=
 =?us-ascii?Q?fDKb0ckHEsUb/5nz8HcPqELsgqz5xiWGZZFMAOMwwgvavMDlkUGsQl/N9FQ6?=
 =?us-ascii?Q?vBCjmejg24n4sPrtdlJlsWa0vFKiH2YeK6CF4AgQ7tTXk+rPP5zP/WiSEic3?=
 =?us-ascii?Q?psg0KaX9TFoWhcCy7h1DYlQ5X/tB6zBCPArDuceiUIBelqVmpdtHKi3t4jy6?=
 =?us-ascii?Q?/hkRvNAZkF8Yv/6GcWBtmVMNdNzjnAlACdUxM41mDU2GuKJeMiefELmMVQQm?=
 =?us-ascii?Q?evqf/qybog=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: eafb6cd6-0fe4-4c7c-077d-08de6aeb01f1
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 10:31:11.8221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJ2kfVo7eqr7UGgM1EDHkJVxpS3TouCDMc1q5f4K2HedVKF8/bOMSuUDNoUlmbrY63O+HxKrub7gcGsGnh6cEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3727
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 10:31:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231112

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
Changes in v2:
- Fix SRC_URI syntax: add missing backslash after
  ksba-add-pkgconfig-support.patch
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
index d97fa84977..4b9e22538c 100644
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
+           file://ksba-add-pkgconfig-support.patch \
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


