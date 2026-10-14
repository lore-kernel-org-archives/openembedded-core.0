Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319B2CC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 08:51:00 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8851.1791967854780735774
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 01:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=aJBE38X1;
 spf=pass (domain: est.tech, ip: 52.101.66.30, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBiXMuZhyv17ISFPExXDEnifS0j26xFE6uU6Twn+XyRqjUbw+DWfntuh7EUrWFz7TwFplXjJsDPDCJZm51uWTX3L2xQcnzbquIyFgFKijW3DewKMLK2ixMBEYs1kzsG63Rm6YvlKt0Jo2Jt5HE9akDzzA5/OCk/3H4xphAPi2VHUESlASqunicbbBzAXe66V/ZRW0SueMa8Tur9nLhL7ubGbTXnUkVrfR1ddo1DDJ3Fwg4aUHcNexjQsMghPKaR6nWndT2SJaYhdrCPE69CwMfLpjorDpufLXaRZ3XlI8CeCF5jHt6isHxDHIRFQLEukNuKM3s/GQTC3xVXiGl4QEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yrAZlQRsHgDZyZE52pikb8/TQVQeVRfsq5+lzOg7FA=;
 b=n6bl45dk8BLoGx+M2gtsj5FWkvtYuatck4XNPh65ZqRHSZl8n/Wlij7ThSVkK14Xn2kWMeUrEgYN9WHqeC7FxQ/Ksv5oxeiL2YZk7d6U4skiPIIteaWLmUrZxjPZUftFjAsYor8OIeTz8/nulcFWIWY3grcXFmU1vwIoK9+OnlveKjM50K51ezoieREcKQguCY2ToFgdInOmdT7K78PHAbUUrM9dty+jDK5YFfA9i2j4i578XR6FTTgmhR5A3UtG2ccgZGVCYJiZZlZCYnPlhXXdq/Y92UI3JdKaJTZ3pnfch0MyJ/9pp5efcV6trK9iP2frRyEGYpHXJhR14PlkLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yrAZlQRsHgDZyZE52pikb8/TQVQeVRfsq5+lzOg7FA=;
 b=aJBE38X1g54fgmUk4uj/XvOthPHpV74lGqppxowwbZeMXMbAbUUcQuHAOVz3eefTvOp3j/yNUHdZnpiW0xQI9ntSypvv5nCl1adBSEw5AuqRheytzo6MmttI4uXCjQaA2qySkzlMnJhnSZHX3ez9+btG6TapzEniqu26PT91QFlmMZuruyP9JE/lpuSF7xdGhI5O9sIwLuDMlCTS321iQthUk2wSv1snSS4lu08XZcaT9aUHFxZS4D295lSe/QIzS4PinwpVM614Gq1rHkkQJFARp8q0sFMEkoVx6RXZnuAqDiPK415xBIArpnu51cfy0yuZaS6ViiBfRLbI6YOjSw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AS8P189MB2048.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:508::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 14 Oct
 2026 08:50:50 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 08:50:50 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] libsoup: add ptest support
Date: Wed, 14 Oct 2026 10:50:44 +0200
Message-ID: <20261014085044.14497-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012095602.19261-1-pratik.farkase@est.tech>
References: <20261012095602.19261-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0176.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:236::23) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AS8P189MB2048:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eeeaff4-07e4-4f23-ee3e-08df29d03f64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|260925022911599003|260925021911599003|260925021311599003|10067099003|56012099006|261009223327099003|11063799006|261009221227099003|261009221727099003|6133799003|18002099003|22082099003|261009220027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 
	LWYA7WGd1A3mM97S4sv4NGmMuQxTY5ijJy5A1t5A2ibRlBHyDAf1fQM7n6vdmUs1dtI2tsrFV7LBBsEZxriAZLs7PcnOXGz5XZlxUSZvBgCpWGwlKGcXaXWTucSp968hF7hAUE3g3f6mzs8UIjPVosnyqZcGRrtKNvZXKthXxa0+lJEooKKZK1VrFuwUaoCmRPtTE71cokuW59rDjKheGjo1e0t+lmg/ay34J+aqWKJJPPvTs+mfD4HseRyFme5ocpYB82aMQBjeNtEMVnUKo+aIxSI+OfO/2SBBb34/HfjbO7KsSAV0Toxx+8dOX4Mo0Iuz63Y7SMgIgbtbRdGyVsFxdt/ZcoZOe6OfaPzBIH4PLY1FV1mdmsHHpAY3ZE3Dnen3MGQX08M8hfVBdETFOWfuk+ihp2TUK9OlK+KBO9dfqqPC360Q1lAPjBeclm5NXbRF9+3DBBodxxNf3FkyscF9BafwXrhW56uW32vgdF/d6MUihx+U8+VRPNsy1gazOIXZ3oLpBu0U1m8MPSSoDuuPJH4o+ETT7S5O7/quzEyB5q47LnQPBpZEd2YK5eEM38KphnsGnCr1NFpamGPydzqhqXhOL/WUytbY5yaENpCG0fDoKBcCa6O2BrltVSPN8kOe9HEfhZTR4aEinQQTLiWKujSZbzjUrgRdGSQBmbs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(56012099006)(261009223327099003)(11063799006)(261009221227099003)(261009221727099003)(6133799003)(18002099003)(22082099003)(261009220027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1FQToRbBeEAa1oqiaIyjXc0oUIsrWsW3udBhIpyWOOHsXPdifGMt1Hu5lt0i?=
 =?us-ascii?Q?EWViGJSvjwpOk6cMO2MqqFrRt09UUOVbmn3nhOf7x1AWuSRHPR35THzTX04X?=
 =?us-ascii?Q?x8SCK+2ritqwkfrikIg0uE5wuvhL+Dtv4hn81xW1hRKIRac28MNNAJo1A4Vi?=
 =?us-ascii?Q?9iaxzFn7x6g/UH7ZQtNYglGQoDQ7hkbmEIWWS51qw0gZVCFpkUQxKAWaBZZI?=
 =?us-ascii?Q?4KI2nwb+zgOY06cLxjbsmpn+1WMJZzr4bZyJo9zOWYzcN+2ttSuM5BfgYpwY?=
 =?us-ascii?Q?qlkdZOWYPYjWNzkDamaXEMlqFs/m6fATpV7VbT+TZtGHY5dXQ4m7R77rFw5Z?=
 =?us-ascii?Q?p4gWPCvbC3AUuZEzaMVhrnDuKrLzEd26ow63XGTBsdTn3rqJRJKaSQvUhR49?=
 =?us-ascii?Q?cdd54jrWMKa1AhhiQIKUSE2MjTBE9bjBhEkcGJhleRL2Qn+W8YamJ4boI86z?=
 =?us-ascii?Q?H0qMeRuF6rSv1N7NSw9L34tG1qVPjmxfn+bueEsWoKn50y6VIn1di3ivxn/T?=
 =?us-ascii?Q?F6rw+5NUC4dHvv52KLyJQpZTxeQV8aZiVkLL3J9v7jO0QaOjBUJuj0FofEEg?=
 =?us-ascii?Q?s+qVUzu6bR7YB7pz4BdDQBcllB3S2DjkUn/zxRWcLqGQMyAiD71FFhKFMCTE?=
 =?us-ascii?Q?Q5IfjwaUEgn8jMhU9yjR9zly1D0iIPlmwgR1LJXJxKp5gFJvw1aem2dCugtu?=
 =?us-ascii?Q?t3LL1nZORGLqxN0KPrkYdpvAcDN5lskyWbBdCAxLBDsab23Zo1OD0yUU8HBe?=
 =?us-ascii?Q?iwLPsZ2YnZRp8G2YM2kFclJryIzBpgDDtPoFI4Ye66qA8tNRxCnUQxEzdgZ6?=
 =?us-ascii?Q?GdZU/955abZHOV/h0o6Jusc5XPfRtJN75YwiXNZqqNIGeq/E4aNdRKji4DoD?=
 =?us-ascii?Q?4BRM+q/M9iF5+5Xb96A51RJlAdqJ39pUlfnRJCwH1X9MMeM1AAOCXLhJYvlk?=
 =?us-ascii?Q?rh2cWosSDbQsJNJbXv4/5JD/uR5zxNZ9lwX8lrfl0ky8pZKe9t/Iqck92tGc?=
 =?us-ascii?Q?bniXsBYOl6+FAJAW5nhkrNN7mxV2QfmCfl+8NvFeDdS0wV5txPjePhBlsXV2?=
 =?us-ascii?Q?kpKq5DdTP5dGWE2bPHlEW2Xz/eEvWG2Q0M1P8ODhpCY/jnxJyZsAlPdl9V4Y?=
 =?us-ascii?Q?zgNAGMnH4T8/gdZp3knDi5JLI0ESDzVOfR1zZYbAcOrLdaj96IX7TEPN022H?=
 =?us-ascii?Q?ojNLwJZ5zSt0WDURqz/EEdriWPVuCcFTEMV5z6ty2osnFGqEYmOOGUm3bvlK?=
 =?us-ascii?Q?fgx/B63fnNTYntT+LIdaIiRmvKc3D4mDedwWABhLb9H6iDzHXq1eB2BbZEXT?=
 =?us-ascii?Q?MWwcj5gurxeaV1dZyadDd14HBC70yoCWmGXU9mWS7jY6nQSlgd4i04X6P3Wy?=
 =?us-ascii?Q?Aorj1Wzip/ChStxEdafOYSiwLVNWCM2Z5dIhdapCtxi68S4ZEAQGyxiUlm4R?=
 =?us-ascii?Q?w8fHeFMN/b7wOTkUa8vue+jVtrLyP/llYGMCnMJX0RwYlT/YyO+nywz8JqqC?=
 =?us-ascii?Q?KSsezl7AMexIBcTEIraUb/TYkZnmaofN42ez7XnMdWJ6ikcLml4LcjqQWxAY?=
 =?us-ascii?Q?Te4iYtosIHX4xG3fN0RammekEU8kgrbQmd8LoAfS/612Zz93gYLmRCTOXEtg?=
 =?us-ascii?Q?ZmF7pFxY9gbRf8RRlcW7airmZ9xRn6hICnnTkp52BAfc7i5ATLuMQqh1glEV?=
 =?us-ascii?Q?WvyFtvvnfxbcryePlRAFgq8Iy/2myDGgg3m5atZZ693WBRQNR/DrQZEmYaGG?=
 =?us-ascii?Q?YAVDtoMENg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eeeaff4-07e4-4f23-ee3e-08df29d03f64
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 08:50:50.4400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yqFqq7LJ8jEBxEyUFe1QOCykFespMirDQJVArcDA7o3PAxjJfrIZq3TVDRhYfFGBpVUe1rtFXNqM2Dgmga6/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 08:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247748

Build the installed-tests via the meson tests/installed_tests options
(enabled through a new 'tests' PACKAGECONFIG when ptest is in
DISTRO_FEATURES) and run them under ptest with
gnome-desktop-testing-runner.

Tested on qemux86-64 with ptest-runner: 36 tests, all pass.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---

Notes:
    Changes in v2:
    - Rebased onto master after the libsoup 3.6.6 -> 3.8.0 upgrade.
    - Keep logger-test and http2-body-stream-test; instead of excluding the=
m,
      raise QB_MEM for libsoup in core-image-ptest.bb so the large-allocati=
on
      cases do not hit the OOM killer. Only header-parsing-test remains
      excluded (a glib parameter-list parsing assertion failure).

 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-core/images/core-image-ptest.bb  |  1 +
 .../recipes-support/libsoup/libsoup/run-ptest |  3 +++
 meta/recipes-support/libsoup/libsoup_3.8.0.bb | 24 +++++++++++++++----
 4 files changed, 25 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 2bd11b1706..992d3666b9 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -138,6 +138,7 @@ PTESTS_SLOW =3D "\
     libmodule-build-perl \
     libpcap \
     libpng \
+    libsoup \
     ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'libseccomp', '',d)=
} \
     lttng-tools \
     lz4 \
diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-co=
re/images/core-image-ptest.bb
index 22bb23c0e7..35ffb933bb 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -49,6 +49,7 @@ QB_MEM:virtclass-mcextend-tcl =3D "-m 5100"
 QB_MEM:virtclass-mcextend-go =3D "-m 4096"
 QB_MEM:virtclass-mcextend-gnutls =3D "-m 1536"
 QB_MEM:virtclass-mcextend-zstd =3D "-m 4096"
+QB_MEM:virtclass-mcextend-libsoup =3D "-m 4096"
=20
 TEST_SUITES =3D "ping ssh parselogs ptest"
=20
diff --git a/meta/recipes-support/libsoup/libsoup/run-ptest b/meta/recipes-=
support/libsoup/libsoup/run-ptest
new file mode 100644
index 0000000000..efe975cf3f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/run-ptest
@@ -0,0 +1,3 @@
+#! /bin/sh
+
+gnome-desktop-testing-runner libsoup-3.0
diff --git a/meta/recipes-support/libsoup/libsoup_3.8.0.bb b/meta/recipes-s=
upport/libsoup/libsoup_3.8.0.bb
index 2a40eecaea..277023881f 100644
--- a/meta/recipes-support/libsoup/libsoup_3.8.0.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.8.0.bb
@@ -9,20 +9,23 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0=
d91eb439ebec522ec2"
=20
 DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
=20
-inherit gettext gnomebase upstream-version-is-even gobject-introspection g=
i-docgen vala
+inherit gettext gnomebase upstream-version-is-even gobject-introspection g=
i-docgen vala ptest-gnome
=20
 SRC_URI[archive.sha256sum] =3D "bbf08fa3e03a88c31a3d27a0d87cb422e9490f2d08=
e149211103df6d638a2238"
=20
+SRC_URI +=3D "file://run-ptest"
+
 PROVIDES =3D "libsoup-3.0"
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '=
', d)}"
 PACKAGECONFIG[brotli] =3D "-Dbrotli=3Denabled,-Dbrotli=3Ddisabled,brotli"
 PACKAGECONFIG[gssapi] =3D "-Dgssapi=3Denabled,-Dgssapi=3Ddisabled,krb5"
 PACKAGECONFIG[ntlm] =3D "-Dntlm=3Denabled,-Dntlm=3Ddisabled"
 PACKAGECONFIG[sysprof] =3D "-Dsysprof=3Denabled,-Dsysprof=3Ddisabled,syspr=
of"
+PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue -Dinstalled_tests=3Dtrue,-Dtests=
=3Dfalse -Dinstalled_tests=3Dfalse"
=20
 # Tell libsoup where the target ntlm_auth is installed
 do_write_config:append:class-target() {
@@ -34,13 +37,22 @@ EOF
 EXTRA_OEMESON:append:class-target =3D " --cross-file ${WORKDIR}/soup.cross=
"
=20
 EXTRA_OEMESON +=3D "-Dtls_check=3Dfalse"
-# Disable the test suites
-EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dautobahn=3Ddisabled -Dpkcs11_tests=
=3Ddisabled"
+# tests are controlled via the 'tests' PACKAGECONFIG (enabled for ptest)
+EXTRA_OEMESON +=3D "-Dautobahn=3Ddisabled -Dpkcs11_tests=3Ddisabled"
=20
 GIDOCGEN_MESON_OPTION =3D 'docs'
 GIDOCGEN_MESON_ENABLE_FLAG =3D 'enabled'
 GIDOCGEN_MESON_DISABLE_FLAG =3D 'disabled'
=20
+# header-parsing-test aborts in do_param_list_tests(): a g_hash_table_size=
()
+# assertion on a parsed parameter list does not hold (returns one entry
+# instead of three) with the current glib. The memory-hungry logger and
+# http2-body-stream tests are handled by raising QB_MEM for libsoup in
+# core-image-ptest.bb.
+do_install_ptest:append() {
+    rm -f ${D}${datadir}/installed-tests/libsoup-3.0/header-parsing-test.t=
est
+}
+
 # When built without gnome support, libsoup will contain only one shared l=
ib
 # and will therefore become subject to renaming by debian.bbclass. Prevent
 # renaming in order to keep the package name consistent regardless of whet=
her
@@ -50,6 +62,10 @@ DEBIAN_NOAUTONAME:${PN} =3D "1"
 # glib-networking is needed for SSL, proxies, etc.
 RRECOMMENDS:${PN} =3D "glib-networking"
=20
+# The TLS-based tests (ssl, server-auth, websocket, hsts) need a glib TLS
+# backend at runtime.
+RDEPENDS:${PN}-ptest +=3D "glib-networking"
+
 BBCLASSEXTEND =3D "native nativesdk"
=20
 CVE_STATUS[CVE-2026-1467] =3D "fixed-version: fixed in 3.6.6"
--=20
2.43.0


