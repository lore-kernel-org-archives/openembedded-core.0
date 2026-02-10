Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F34A7EB2705
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 19:33:41 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1697.1770752019178306231
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 11:33:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=jqk57ue4;
 spf=pass (domain: est.tech, ip: 52.101.83.47, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibrGVgCmjqXP+C32kli/hAvzCfrSrpcj0r0YdzctVUHjS+ABsDGT/sZY3CpP+DNIirxjeCJQIe1kjbLofvPBSoajP4Y1eUvJzH7gyKtZ6gvLFRd4F7kQE87Vj6Bd/qyk0kgQFpngGsk3xEMxhU3vcePdubMnAtlpCMBxHBjKM+9izMnPsE6p7rPx9RxwIJb+Mj4qMDJT76Vf7Sb72YDx7V6GJ18iLr3Y67ig6D6hikD8c2VYy1ddUAvGwj2VZVVrC4CSFfDeIhxbCByF+/n3hCxqpELuBuLDr/hNMXkG1/ajuu3TJerMi3vZ5Fnj78yBmBMMhQJ3YuouzlF66B0slQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUdIpJB8o4+ZYhJfcfsKCok/01H1gfRt5VMIaDBotRw=;
 b=NT95A2BWe5e/43qPU2LctzQ3qUBtMC3khsLI5NYyw0upB6V+Fb2eOj7Pk+LRXjOkZP28FgM+d0l0ddF1C/t8t0QehCqz2wrMIi3tPecfqExfZTkmZDi6CqkMu4jR8nPRQsdwdlkwqXNGCvDdLBkiGjI1zGp5ts1FGTWBxVfzP8dWkLGXlvRPjLkhIi7aTOBML73h4mQaO/beOqldfgl2tP40hwClS9z76OgxlNr865VCT9RHHOYHn49L3+X3sVrJ4reD+/jZSbeZCHiaoM53dluIevQJGSsaJn+b7lawbKofH329wmrZVrCQAfLjYw4Dvljn99OfQAwR+KUSynGBbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUdIpJB8o4+ZYhJfcfsKCok/01H1gfRt5VMIaDBotRw=;
 b=jqk57ue4mjXq5Au1XiThVU/jA9PD/orrC0sAccJux9JnfLiUT9L2HXvbD8AAVTRg8OiWxSX1wFcvkD/Xv1EGg0QFP8u876dnTn8KZADmAF0FY+p0rKN6Chte3KWxynnUOOMUWlh7nV/u77emybTfFnoEyz78EerLezsAgg+G3AYwF/nJBvrktpgfX5Z45hVnAe6JM/yFQE+aNBAgVYVNGhTMeQKoLBbskFXQ1ML+hVkLuWAPnBCYm/yGcqJML+Orekfwt5cj8Ta8ZTGyr5fGMhPapow/yT+JHEGWgKR/Z4/CrtqMzq50o/RZzZMkQS1KDAwrCwafr4J03a6jvgl+Yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by BESP189MB3179.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Tue, 10 Feb
 2026 19:33:34 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 19:33:33 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] libarchive: add ptest support
Date: Tue, 10 Feb 2026 20:33:28 +0100
Message-ID: <20260210193328.8955-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260208184637.14046-1-pratik.farkase@est.tech>
References: <20260208184637.14046-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P195CA0020.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::11) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|BESP189MB3179:EE_
X-MS-Office365-Filtering-Correlation-Id: 72ff9b8f-5fa7-4423-dcd8-08de68db4745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?M6tEkHb6zxH/GBCCjhaSqfPAHlKh+eW+tQhDfBEJsHKZYf9BT/RLE+ZlrBpi?=
 =?us-ascii?Q?3lWUBc/Sg1FybAKJ+kFUcaZ6xKnfpCQyA+OJZcqEGk8YF/awgGjFPYK9j40U?=
 =?us-ascii?Q?p2XV7iz4TX2m4j64p3IGO4uDvNVH59gYqj+OXcsQr/Uw9ewgg/UW0Xae9aUY?=
 =?us-ascii?Q?ij32RkhLYM+snODCLtzf9+p10YRibmC94AADHUKsorxLgTMw2QppfFA5xpIL?=
 =?us-ascii?Q?LAtzi6KjjvbUByQCZhuEBypfMe0kEA9c2FmNz6MZj9IY17jOBFJ1tEXGBNzp?=
 =?us-ascii?Q?FgOjSfcaQeyAyHB3UsKMuczm7GyPUGPqJtL1Qn7BU6ZNph+SVV+1zPADV8E1?=
 =?us-ascii?Q?SRjFNimsKi7rSabU33cg+ALlPjTd4rL9o+RdWa/zHDyjHMzpxxmDyRPkdUbk?=
 =?us-ascii?Q?0AvTIPFAMYJMiQjZREoeI/EJ4yxDy9m2eXyFIqS8UUIcgibOKJa907I6nKE9?=
 =?us-ascii?Q?7rXseTQpqOzuAzVDfxwVrVtMpOPwTrFqkWhCe/QaI+zW8bLxrRpkhKutJxKk?=
 =?us-ascii?Q?FdUpjA+P58ZR28YjwGvJI94z2w8vS75M1eMidGMF3PPT1Sx+2qU8gmj76Lsk?=
 =?us-ascii?Q?clvx96mZcholNX+QkNcR1fAQUSp4Fn2rPojnX+2ZMGcK3/MGqd7iC0fGbGOm?=
 =?us-ascii?Q?UDkISRkXUpneehKM94mJgR7END7TXEv1iyW7/p76mnFtldjJ4xmEhpZp1m6n?=
 =?us-ascii?Q?g/FQlE6vHrEMYCvR8O8oImOrADKXGC2fMdB9KQHS7TUjTLqU5TndiFOn1ymP?=
 =?us-ascii?Q?VDN9+26qACFxjWgnCHHkZ0fdzNR9Rt63Uy79lLRhVjFqtuLHO9wUOeXPyXdw?=
 =?us-ascii?Q?ZFnVTAp8vdVepmPebT5iZIigM0snVe9hFUoP/DbmO+fSGmJSzkXebUTvGcmd?=
 =?us-ascii?Q?j9uRNw+NOIZ6pAUpI6Jkk001N/3+K6Ib5RCBlQbKMHM5/r9Zw7o3a9X3HATU?=
 =?us-ascii?Q?/tqLYSW00JK/Q8/OIGV93CrshEUo5ovEaFlQFl56/8sh2R6r72u6uxBORcqr?=
 =?us-ascii?Q?vo2Bj/KpmEJj/hqe0AU9xP+KmGcD2FQj8blftq4sxGAf0nPILZBsaYdAKahp?=
 =?us-ascii?Q?8bSju61aGkC83WjKgNYBDe3fz6fJTG/1Lz7iRK8Bshwo+n+txEsXX6ylJKLN?=
 =?us-ascii?Q?xAFTyPiKn+JzYovwzgUbwcZMWTiNco4RJQZBQhFgFaaS2VUZlRmdWhrvXsJm?=
 =?us-ascii?Q?BvUx4V84zMDX4xR9J1NB3oEphvjmFRHMhOI7BkBdEYGlewmtktxH/1MDqzSt?=
 =?us-ascii?Q?d69h0FExVITUc1TZ1Zf3plFF6/Vj5bmK1ofT2R6B/BjI2Muj5BuU+hCdkZ3c?=
 =?us-ascii?Q?CXQH2ucX9lqJA5CW6CJMHKb5ad2oyBnudku8tiK+DBAAP/qNybMcGMiUaQrR?=
 =?us-ascii?Q?M+FhBzHYznkjR+X/BEC/1EhPBFp+UaI5EJbOSPFJ5GbSE1VIfo3Le4YkhFCc?=
 =?us-ascii?Q?QcIO9p9zdXYo5pgCmB0ZKgsOaX/9rqsUtlNRZfRP+/kxJjxJQ+ILjC0F70vq?=
 =?us-ascii?Q?h1uAmSAKx8q2TJ69pMHuhJAiddo61owzFKBa?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NB6/au/UrTXJKTcpX/HLQyWm9Qd5IkoX5uU5htNuuzzn/FLipTXu0Uhff0Bd?=
 =?us-ascii?Q?9B3NyBBfj/AoVV3c4icliIR5Sk0J7JgpLL2clbASIrsCUb2VNHdF7MxpKcgF?=
 =?us-ascii?Q?3XyCGZ8+J8v1mRholAX/ki62PNsXi3H/WRhoVBMbP62vepAfdOdKfDpy/xQ6?=
 =?us-ascii?Q?eWBOF87MgSjd18IOGbY7ASViiH/1AoMG8yoLMKENsh9Fq/nAhkNhh9TLuU3H?=
 =?us-ascii?Q?ccjN52O5iFQ93E16GoLL2HwTHtBlDRZIq/CDfYZ4ELiw11RMr+31gsYRvnbt?=
 =?us-ascii?Q?dYIDhN/Z6U/fcEuNKqaW3zuxtnpl9NCwme8DWMmXYnbc/64Ua76dTQbhF3Bg?=
 =?us-ascii?Q?xuPsypEP2uzAJNVcSgXwW1KreVhCZXk+ZHtiBdWzA5fhWdcKoGVjSE3Ngbq4?=
 =?us-ascii?Q?H+Z9u711TC4Re5a8pOFQp5GlpMeI7QArk0hG3GtwYZAT3nSKkV9KO/7LaVKA?=
 =?us-ascii?Q?EuMPqAO62fDYsb8acM+bF5MTROttcGXzKVxuC49p4v1M1Qf2G7SegjqXVER/?=
 =?us-ascii?Q?nTB1LM1+Ra1YEmniAcnyjpQeDMRRLbKT8I/LY4voeV93UO2Yjfe73Eoc1seu?=
 =?us-ascii?Q?LcF8zokQHHchqL8qjxo9D5pSq0ALdUke7bn/FeD3UEJyZKfnpc1Bvy6WK6lY?=
 =?us-ascii?Q?Bj/w90DW9JxOSDHAgrmYsa50lxKbIo+0WwaczCfcu6XpkLLBZIrRBLA2woSd?=
 =?us-ascii?Q?D/mxEnEfU6QLqPtB09c6hJG0VImyN9awb6ZuecpARMatVA2v4w+d6bJ3VW3H?=
 =?us-ascii?Q?qLykF4wukNzI1V4UKAoYpP28TJQnzNMp6X3Imy92doJgTg0SzFXEqXdiK/wI?=
 =?us-ascii?Q?+9qXrBtKcW6O3fHiZJd827nBYmlUGjTYda1RHxJxEhDy2KZud/EHKXBRznsA?=
 =?us-ascii?Q?0UDHYVyoWY+VlDmOpRo+uVrRicf8NmRdq+CWq11xE2n1itNUuZqdd92E2yfd?=
 =?us-ascii?Q?0Uu7QTG7uu7PyDYEKrkL62oYQAq9md6cjzhB3Nor+Wtv/9K/1g4T3zePAHwp?=
 =?us-ascii?Q?mqxDRch+JjXyg69O9reP6E3i3ddfAQ8ENaC1NK52cNEIDPDUr4yzYqCYYoSM?=
 =?us-ascii?Q?V3gQuTOHM4uoh80wZMfQZl8x6OodxjbjMTZy7Hd/Yh1NPOSJp0nGQtizG0ff?=
 =?us-ascii?Q?gKIWd0wEZbYsfgJtppbgguqrWETYvZp89fSFOVly4HczVWxBJb2DX3vk2yfa?=
 =?us-ascii?Q?RtDVEoelKyVLT1tOxECCqecd82fv0PPbchGUC/XRWkZhh9bEPLRPl+3/Rd5X?=
 =?us-ascii?Q?5c8bPKNBv1pyEya0Qouzk6PomtZCJ0dA6ZEBN729BXXGFhwkLFPRV23vPqCV?=
 =?us-ascii?Q?cv0ZdJllD0nbSHtXdNP66pPbv9bM62KSqFlVLEMUGgHFucEh77x3Vyc8oya5?=
 =?us-ascii?Q?mHP4FqckOQAhXEiSFwwoVFXQWHXYoJskWQvYSVk2N7mrqkwu59ZgwmA1gH7f?=
 =?us-ascii?Q?m0rkhx/Lf1q2DiXjHrStN6VRPSIbfPy/V1BCmUiAgXCZPvGh4ZGCqpY/8e+B?=
 =?us-ascii?Q?UpxQWh8PMf3l8MdtEK3MkpQIStqhdL8tLCYzR6+w1pBIpZZyeGhCtfO7eBA6?=
 =?us-ascii?Q?e/zwCCdsKLb5b5hXoOZmK/eP8OJa2pkriJ5ze+Y2RnQiGcspNxKewdPSVPWW?=
 =?us-ascii?Q?m45c7b0ogBDgfX4yPU5qmGcQ+9Yg0bzLenA8ZCcEvA+Am0Go2j3U/sESKktL?=
 =?us-ascii?Q?VrURu/mENmqxscZYLmh0Up1tzXjWv4izUVPjP/rlVon6wLg6CLLceDRWB9qt?=
 =?us-ascii?Q?2LBzkseclg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ff9b8f-5fa7-4423-dcd8-08de68db4745
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 19:33:33.7540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmhfSsdHtF7Yd/NDFWVR3eRb1poKfx0KLbOhxvR6aluKc61cM1dkWXJseHftaAjgEx6JkWrZos2khmIbvceuVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3179
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 19:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230930

Add ptest support to enable automated testing of libarchive
using ptest-runner.

The implementation builds and installs five test suites:
libarchive_test, bsdtar_test, bsdcpio_test, bsdcat_test, and
bsdunzip_test, along with their test data files.

Test executables for bsdtar, bsdcpio, bsdcat, and bsdunzip are
provided via symlinks to the installed binaries.

All tests on qemux86-64 pass:
  libarchive_test: 689 tests
  bsdtar_test: 76 tests
  bsdcpio_test: 49 tests
  bsdcat_test: 18 tests
  bsdunzip_test: 8 tests

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>

---
Changes in v2:
- Remove conditional checks from do_install_ptest()
  to avoid hiding test installation failures
- Remove existence checks from run-ptest
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libarchive/libarchive/run-ptest           | 11 +++++++
 .../libarchive/libarchive_3.8.5.bb            | 30 +++++++++++++++++--
 3 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-extended/libarchive/libarchive/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index b9616e9bf4..648b53a5f6 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -28,6 +28,7 @@ PTESTS_FAST =3D "\
     icu \
     json-c \
     json-glib \
+    libarchive \
     libcheck \
     libconvert-asn1-perl \
     libexif \
diff --git a/meta/recipes-extended/libarchive/libarchive/run-ptest b/meta/r=
ecipes-extended/libarchive/libarchive/run-ptest
new file mode 100755
index 0000000000..6a6eb0748b
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/run-ptest
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+for t in libarchive_test bsdtar_test bsdcpio_test bsdcat_test bsdunzip_tes=
t; do
+    ./$t
+    if [ $? -eq 0 ]; then
+        echo "PASS: $t"
+    else
+        echo "FAIL: $t"
+    fi
+done
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.8.5.bb
index fcfaf5d231..7b10823002 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
@@ -29,12 +29,14 @@ PACKAGECONFIG[zstd] =3D "--with-zstd,--without-zstd,zst=
d,"
=20
 EXTRA_OECONF +=3D "--enable-largefile --without-iconv"
=20
-SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
+SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
+           file://run-ptest \
+          "
 UPSTREAM_CHECK_URI =3D "https://www.libarchive.org/"
=20
 SRC_URI[sha256sum] =3D "8a60f3a7bfd59c54ce82ae805a93dba65defd04148c3333b7e=
aa2102f03b7ffd"
=20
-inherit autotools update-alternatives pkgconfig
+inherit autotools update-alternatives pkgconfig ptest
=20
 CPPFLAGS +=3D "-I${WORKDIR}/extra-includes"
=20
@@ -62,3 +64,27 @@ ALTERNATIVE_LINK_NAME[cpio] =3D "${base_bindir}/cpio"
 ALTERNATIVE_TARGET[cpio] =3D "${bindir}/bsdcpio"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+do_compile_ptest() {
+    oe_runmake check TESTS=3D
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+
+    for test in libarchive_test bsdtar_test bsdcpio_test bsdcat_test bsdun=
zip_test; do
+            ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/$test ${D}$=
{PTEST_PATH}/$test
+    done
+
+    for dir in libarchive tar cpio cat unzip; do
+            install -d ${D}${PTEST_PATH}/$dir/test
+            cp -r ${S}/$dir/test/* ${D}${PTEST_PATH}/$dir/test/
+    done
+
+    ln -sf ${bindir}/bsdtar ${D}${PTEST_PATH}/bsdtar
+    ln -sf ${bindir}/bsdcpio ${D}${PTEST_PATH}/bsdcpio
+    ln -sf ${bindir}/bsdcat ${D}${PTEST_PATH}/bsdcat
+    ln -sf ${bindir}/bsdunzip ${D}${PTEST_PATH}/bsdunzip
+}
+
+RDEPENDS:${PN}-ptest +=3D "bsdtar bsdcpio"
--=20
2.43.0


