Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 705DBCD4F3C
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 07:49:23 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31774.1779349758627305305
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 00:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=RsYnK819;
 spf=pass (domain: est.tech, ip: 52.101.65.5, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Al5wTycEfgkZy3KylI6Qdii4BDwqFxPL4KKlrp5M36c4hcDAMakyBo07tjwJY0V6s9ZXd7LSDFSbTog4wD8jpw7zCki6CsZruRmu2Zum211Wjg2jcZHyD1r+Wm4YBhHvWd6D2Txns9hW2PfQpoGwYM5p3FdJgsf8Hrj+AE55N0vHRS7UX4LTq20SeaggaRKJKHcBItX6bXzhCxylHD0CnHKmPM9FEIybBdwVOZbfKNLXih59d53zkwRhmhGy1kvsjZpNa9Vou/7sJo+HbJUaGCBhC4FOxeXAGRNN70vojt+EpvPFSWqLf2mvQZOHkA7kXdTX2CjkRd0CjT1Z1g9hAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnu3TidEfBL1yFegtssr4eaVg0rYoGwP3QaKErBqBqo=;
 b=CCS4N8y9DxCuwO9CCEf+iqwKbzz8N0NQStO1HVFh+TQUFRg1HDee+qaZGmtX8YPNjDVO7G8lvwrFZfN7YDG46fN12N9VaXAQ0VtmK+YvamHcCBJk/Tnzgv5RpCid+DteiHNZog1vpv2SqwpXwhxLKHPSm8q72AR9eLeIDIOtK/0NaoWXGxXSFuatGM0cnvgnWwWCiASF1W1BlhLJi2xPVzDYa+i4MDpaCtkTUZI1lTuEd4ccWFxAM6NaY1SDvqpg7ArzV+4N4/k/r7hXVTFAP2aWcA+Iz6biRoAgudETPF0Kv/D6jFbK6v7Od+6LkfYfeEQNNqjBGb2xB2WlXigL5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnu3TidEfBL1yFegtssr4eaVg0rYoGwP3QaKErBqBqo=;
 b=RsYnK819D1419hswZ5SVznQz427fP5cQFhnxpWUyKIeus3jmUgxw3KI7a8XPTJRfQJsXmT6hpWzuL2HnI3tfM97dVb8FNINjkXloA8Bygubmx3Fa6Zb4T7S4evNoq3RaBO45zBhY+jGArUuDG0B8nRCyKeTTTjLupD0uBIz5O6tdpZRPJHcuc6DvZYMNuIxGsLHUaEaBj2qQxXJvKz8TScvwk2rctQhYeTYxHyRoFLhYwICR0Gio31AhCYT5R94a0uhoClnEe5I1njbYfJuFxD33dMf0nh1euCHXClpsno25v6D3SyTiPGNurrwvAherGlvMBwtvJYbeQYEWPMTQHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AM7P189MB0712.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:120::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 07:49:14 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 07:49:14 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [PATCH v3] libxslt: add ptest support
Date: Thu, 21 May 2026 09:49:10 +0200
Message-ID: <20260521074910.9175-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506092057.27057-1-pratik.farkase@est.tech>
References: <20260506092057.27057-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0063.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::7) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AM7P189MB0712:EE_
X-MS-Office365-Filtering-Correlation-Id: 5543367e-86bb-4440-159c-08deb70d7455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|22082099003|56012099003|18002099003|12006099003|3023799007|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	bpZ4QNuy8uQHTosWyL1wM3NBNa5ioXv1yQLGtuokRnV2k4WQdWf4mrgxcmLtwpWhDIisSm8huXR4sagA7g4L1hlC7LJYapgl0YLpLQmvsJtpm6IfVONe0EOaIjv6wcjnJyChQvIgktKWTB05EUb4JzdBo+HbGWRV14TIDue+4He6tKt8WM9FxOH1MomrMs+7vkF3FKmnYGccU5GcHxWYlxa0nlnDJk9IbYc9t2SCUjtew/jfv/7hH8Am+SGo2FeUxHncyTefRPe4+0xaNfeWvoZ3Ml859iMKk7+Hnw7nbluWFAshz+jzhMGqSJi5PfhXjVDljILCkYcHgbXV3vFy0Ra/kn9knDa1z+3hBIFH0W43+91vqViijRQfDCeVpL3/IPv8JvLap7uJe8H+sV+m9TO/c/OAisuVtqnEip2QOxAN9chj6DOCuEd3m0t0hRrwqdmREwINJaRr3dgSQaidxKzRvz4jpp8er3VNh4eQV+71vBiPEVjGYklbN2HEzsmGY8AmFtwMNZuXgBn75XShf5Ii9u4K9w0zqLDbKumkkaotRbns7jvZn3nmJECcoxgYgD6rk+FfqNHp3Jrtc9tJmTcFPqpR5xZe7vmftu5qtoj46+Vi1V9gorKotJe6ZBGpzLS7vS+VzbR3fU/tPUJA1B7GBYlYISup6/ROx8kNisxzZ20PhG50lJb/KDPjDDOjILXs7w/t4SmE2+yGaIcNuQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(22082099003)(56012099003)(18002099003)(12006099003)(3023799007)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PKK+bFrw7DujBe170TW8y3Q2ccrOc74gSrMHHQEaERAUGbK1GCq/8XmzwzDM?=
 =?us-ascii?Q?Yqvy/DMYBG4129/6ffZnsS3+qZnULbedSXQnsLM2+yE83/ZW+vpeq8SqItwc?=
 =?us-ascii?Q?LboScznkd9bbdMAKmlSD2iggrW6zY2spWK+gz7E/VGaELW6dI+ZCktUmSUH3?=
 =?us-ascii?Q?DP+kppMZp+7knxlxn8I0s2n3M4HG62ZUXbYI3zapuujZiuElo23mvHNp9JAG?=
 =?us-ascii?Q?atZZSeTvjrrY6o/8kEamt0KWx1uqDL4XcHplvnZ8pGf8Hyp/e+yQv2dhBjDv?=
 =?us-ascii?Q?Q0zAysdBPOZ7i7jiXS/UdkPaxLEeHqfmLAWZoYB9kvdxt56K+mE8iAnegghQ?=
 =?us-ascii?Q?/ICYYQVpXYSfaC6GP4bGi9LP1YMrngOGKzCMV2+EGgvuo701AJTONdB+ML1X?=
 =?us-ascii?Q?VfhkCnHsypr1Lwafb3G0L3Xa3h3YLUPdQD0zop/vIgc6I+zdZmdEBBgcyQfs?=
 =?us-ascii?Q?vQZpEhittWv7ir//QpG3j6FmrDSRLhbKRzL/PlxdGOr4yt3SBd37R5vSPtYv?=
 =?us-ascii?Q?x1Sosyxo9O13pAEmmvc96svQ3lBPw4SfMsNz0b/P5fxF1ZVDmCgZKpp6q7wl?=
 =?us-ascii?Q?gS1STVNdLk+dtOKtDFMGVSuhl37N6846lTCIlS0Vyg2Y5voKptXC7jQjDDlK?=
 =?us-ascii?Q?5u33Iohkicfyu2441PYIJ08RlgAv2lerdkbUOueI6qUbhgA3m4euNI2O6Pve?=
 =?us-ascii?Q?kNBd1WfXd+xoe4grgeTDqFwm0chWAQMk6hy1UxDdHnXxrYMgKTSf3YClXbFG?=
 =?us-ascii?Q?GoXkKzOLpouCZz5NcbR5obqW67Fj8WFRJs9JV50K5aaRNfOg+v8h1EGFRdYt?=
 =?us-ascii?Q?Mqm92xbAQfjKiS2rhl4WE6wuO23WvS/nKnK5HyDpUDt9/jTqNReRKsY24ELd?=
 =?us-ascii?Q?ZsGs4pyBg7hD9iXMs3qwKY8IeK4F76Ct7hYOx+4KI8zDnBPvmZtO5Xfurelk?=
 =?us-ascii?Q?CYgW6KzUiBkY71CgQMR8EKmMaBa4qj11y9yoeeiWFMRq+PixltS3IC1e7u5H?=
 =?us-ascii?Q?DoYT0orP7+URzn8raN8jWSUBuVUJL8Y2F89nOzN6pJEfG4kapZuSW+MTOM97?=
 =?us-ascii?Q?66lElskIow0i39b0yhCaP5GmFXyE7uWWla7OgK22LMDIMPQH20IIiJnJr+uC?=
 =?us-ascii?Q?YY3lwrsLMlGgyf+++XcnYT5NrXUCOY9cC68yaSWGWaP42PTrabW5zetqs/tC?=
 =?us-ascii?Q?LXgVCzVcFS4K4NjqALSN+1Q59+e5QKwZkojcQxM3/Bp9PuFAdkWu0y/iVPv9?=
 =?us-ascii?Q?IxE7ggC0GpQuLxsig2GzZ8dG/O9wSFrmM6KWAfzjtgokyLgeJE/ZwKcTZc92?=
 =?us-ascii?Q?qZYv4jcbkMPIKgStQtShUfkpELLZl9sV4HuOb0DIUZF5LXnrV1zvyWpj+YMq?=
 =?us-ascii?Q?/IYUGnnfPQFwd2jePJ0fJ+gQ9HjsiBFOBhZdQ8ESyoHne7KBNyG5CUT9w9qo?=
 =?us-ascii?Q?hOqYTGaT9OyFI9ihqhBwbE9EujMLw8ntlfBsm0R+S+rksIReOMPHexcu3vO5?=
 =?us-ascii?Q?89Sy5eOz6Inu5qoYTnEI+phPaJCH1p3Rq3lMPs0YU9WpUHdYbuEPBlHILE6D?=
 =?us-ascii?Q?I0S0wlW7ByYnY2oGk9Z28WG+x4WvLOtq/mqBGf3IwaPY0epAct5RjKv64Iin?=
 =?us-ascii?Q?OhImKBAuWYOI7/ivjQH9SxOtXZ8DSG6djLhb8Y1bykM0cHwuFSNt3qSmEl9R?=
 =?us-ascii?Q?7Ej1qq7nlnBVKWs73Bv7N0gktjvtdsWowkQbRdxL0iajGIDWbb5vHSrhWN/8?=
 =?us-ascii?Q?ff/XGzuaFQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5543367e-86bb-4440-159c-08deb70d7455
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 07:49:14.8724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QaWJIdqRiGtlDvCicFIb0pLWw8kGWBICGIZldnNx7K2+UVsUMVIapoQMHHktZYKU8qxEGvZVaBQYnKNqr+5Z4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0712
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 07:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237475

Add ptest support for libxslt, running the upstream runtest binary which
validates XSLT transformations across REC conformance, general, encoding,
documents, numbers, keys, namespaces, extensions, reports, and EXSLT
function tests.

Tested on qemux86-64 with ptest-runner: 748 tests, 0 errors (9s).

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
Changes in v3:
- Add glibc-gconv-cp1251 RDEPENDS (conditional on glibc) to support
  encoding/bug-146 test instead of excluding it
- Remove directory existence check to catch upstream changes early

Changes in v2:
- Simplify run-ptest: run test binary directly instead of capturing
  and re-printing output

 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-support/libxslt/libxslt/run-ptest | 11 +++++++++
 .../recipes-support/libxslt/libxslt_1.1.45.bb | 23 +++++++++++++++++--
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-support/libxslt/libxslt/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 50b6a8a41e..58ec00e283 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -57,6 +57,7 @@ PTESTS_FAST =3D "\
     libxml-simple-perl \
     libxml2 \
     libxmlb \
+    libxslt \
     libyaml \
     logrotate \
     lua \
diff --git a/meta/recipes-support/libxslt/libxslt/run-ptest b/meta/recipes-=
support/libxslt/libxslt/run-ptest
new file mode 100755
index 0000000000..c321fdc606
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/run-ptest
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: MIT
+
+cd "$(dirname "$0")/tests" || exit 1
+
+./runtest 2>&1
+if [ $? -eq 0 ]; then
+    echo "PASS: runtest"
+else
+    echo "FAIL: runtest"
+fi
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.45.bb b/meta/recipes-=
support/libxslt/libxslt_1.1.45.bb
index 449ea2dd24..bdfd8f1737 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.45.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.45.bb
@@ -13,7 +13,9 @@ LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D0cd9a07afbeb=
24026c9b03aecfeba458"
 SECTION =3D "libs"
 DEPENDS =3D "libxml2"
=20
-SRC_URI =3D "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.=
tar.xz"
+SRC_URI =3D "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.=
tar.xz \
+           file://run-ptest \
+           "
=20
 SRC_URI[sha256sum] =3D "9acfe68419c4d06a45c550321b3212762d92f41465062ca4ea=
19e632ee5d216e"
=20
@@ -25,7 +27,7 @@ S =3D "${UNPACKDIR}/libxslt-${PV}"
=20
 BINCONFIG =3D "${bindir}/xslt-config"
=20
-inherit autotools pkgconfig binconfig-disabled lib_package multilib_header
+inherit autotools pkgconfig binconfig-disabled lib_package multilib_header=
 ptest
=20
 do_configure:prepend () {
 	# We don't DEPEND on binutils for ansidecl.h so ensure we don't use the h=
eader.
@@ -56,3 +58,20 @@ FILES:${PN} +=3D "${libdir}/libxslt-plugins"
 FILES:${PN}-dev +=3D "${libdir}/xsltConf.sh"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+RDEPENDS:${PN}-ptest:append:libc-glibc =3D " glibc-gconv-cp1251"
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/tests runtest
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    ${B}/libtool --mode=3Dinstall install -m 0755 ${B}/tests/runtest ${D}$=
{PTEST_PATH}/tests/
+
+    for d in general REC REC2 documents encoding exslt extensions \
+             keys namespaces numbers plugins reports; do
+        cp -r ${S}/tests/$d ${D}${PTEST_PATH}/tests/
+    done
+}
--=20
2.34.1


