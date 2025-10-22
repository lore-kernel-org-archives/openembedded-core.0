Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD7FCCD1BE
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 20:41:56 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.35])
 by mx.groups.io with SMTP id smtpd.web10.5110.1761165708832651861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 13:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=e3jzUpq8;
 spf=pass (domain: est.tech, ip: 52.101.65.35, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTQDIVSONK9ParZcrGGf6gMa4vkTk7NlRywWi0Xmr4jXHe9PawBr/Tjo0BTFkZy45qk1NoohCam3zLbriGMZlJg/fIsT1y1G3hXK4+w0nH2093fzLeT8JeyeelOdXfM9Ov+M9/5aGbpuFyn94w8aFTlLU+bwDGSOk9OusQwsyeEvar+rUqKTZxeC+SEtFSO6YdKASfqJjoWfSJWE0wM6nAwGy6DXK1qK7pA5Mi+Ll6FVnK8wXHcDXx3LmtKL3lGb8xGg7vrZ6wDWj/Dwb0vfoEF4XkqJecOq7aQgCKvbacvr4RiMHYIKVnuv/P/ZYKue7NeuLFm/bjeE7nnB1eCC/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEDQ37gIkGM7DNAhRf8zhzNfJjhv8NXExtkQ1SINpy4=;
 b=XyR72wyZNlFN0dRQcsaaN61C0xxJPvQ70lFXKT4xTKv9CPWBDZiraa/tMmAwTv0KUOeVOhbjq+k59P6CYXpoS6TIHulZVMMwhfr5bucORMzG9JRp4/EVlvribCkz8Wvo4mcPib0QX4MqDxwtw8ZJkYAH2QBOY4nT1xn9eSbidTmfy3mLI7SsXfoawxns7S1dxPInYx/0OUgHKOQYGviqWhppsaATQQTGoa97tzL/sVkVoeCjBzKMv+aD6NZOY6Y+It4PP5ea4JA2YMgjyeh1+NAYeGiegiOoxRybLDpIMtt7amYEoAo5qiHpcbIs8JSmKDdDPr4XfJyB2JA+6QlKVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEDQ37gIkGM7DNAhRf8zhzNfJjhv8NXExtkQ1SINpy4=;
 b=e3jzUpq8cc/Rp6enURI041Fvf2k7hX1OOXq9CfwGC8X0wFh8Rsc7QiO0XIPnOhZKPG8jLszUiDJXgto9WYWM5pK5K1+sosJJ/VpmMxuJeP/2oBeWSD5ODr/6gWIGGfZEh88+8FYUBxd+GfGI2gAc/tf3Avt6QPkG7pcySUAq4NouZQtUJuGM0zUcHohJmxk7bzTYpnU3BiLQQmLcBehPDyav9xn7wwpYBiQdPdp+LR1DYZ7TDWNcrwrla8gq4jTKKpe5BSNGJnRRrOu7UWIKUiGQRFbzYZyFvpMQ28rtbcSFTWSJOhPizRGxuHbi13YMjFRxy4OkZG0r3q8RlmtN1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AM4P189MB3714.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ea::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 20:41:45 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%6]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 20:41:45 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Pratik Farkase <pratik.farkase@est.tech>
Subject: [PATCH v3] libxslt: add ptest support
Date: Wed, 22 Oct 2025 22:41:36 +0200
Message-ID: <20251022204136.8276-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022203158.7806-1-pratik.farkase@est.tech>
References: <20251022203158.7806-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0031.eurprd04.prod.outlook.com
 (2603:10a6:10:234::6) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|AM4P189MB3714:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a14531-b095-425f-adbc-08de11ab6a02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jnRfxe5i5it1eI8kxRmYwcZtZ6oMClaNnMVaKeE9WYRKGvLvWASBfB+mcpul?=
 =?us-ascii?Q?SFyU2/FIi0/q39LXDP1V/edFGbi8Hp08gZl/ZbLFBFVL3bOYiF65cFi/3u+z?=
 =?us-ascii?Q?yNfvUsLRP2NCDpCi8Mrguq4Tb2rq6EVCWWuDHfLGLTqE/wzrLh+3v3pNNba6?=
 =?us-ascii?Q?yb5PJytPddjAMo7Zyr4xeBDngYwKc6MVeneBWWCU6W5fWKDsm2ceZKwKKgxm?=
 =?us-ascii?Q?iksouJZmno8hX9KlErQAzYuLorBEMCwVmcOh/qpSKJHTJVu3pSwrpUW3sPYM?=
 =?us-ascii?Q?HGE0bMdOWbAm4HYmJRl8IeByxVPGnqhPNigGgNSW35fMNKyJCIV3SfeVi99b?=
 =?us-ascii?Q?MUMZnitxUeA5nGQJmzzxWj5jBrvSNDEl9lZ4qNm+KT3cQEInZ/cS4u3mbfn9?=
 =?us-ascii?Q?sQ447nOOFyhg9bdjmnU2CG40CrXknSZHJkvpGP3Xs2unHThVmg1WeSoE8pIN?=
 =?us-ascii?Q?NmDnilatxCuyCvcmpQ9b2GAZA4+w5+I30dhj5ENhi1I6tW/vqtP6hnyXX52L?=
 =?us-ascii?Q?RlMRt5YVRROVjGNkq4QYcP+zSbiQJviv0aa8Zur6vHWjHWNvG15XmIukvYXC?=
 =?us-ascii?Q?JH0GxuLFdMZxHwmmHR9P39mGN2q/IKTp0vPY3mCS2/QcXiW0+rbJuHwN2zea?=
 =?us-ascii?Q?YUiJ53rXwxbjbvkcVUAPSWuZi3yMG4Zq9h4JNVUGw2cYPwhlgBtDT4PT0nIs?=
 =?us-ascii?Q?kAAAraK2teL+Zcobk/oskA5SwVWFJgFvZRuatXeUbcdBhivfLgqk1DGsrOkH?=
 =?us-ascii?Q?XK1P5nt+v4WNkf5v5Zd/h4sT8dTNU5bi3cwjQfiSgDhJaily95qG043qajPR?=
 =?us-ascii?Q?5Bd3RawZhbSUGobkbNx5iaoTGP37L3uuBhzYArWniJ6BEyTDHvQRfJyajFjI?=
 =?us-ascii?Q?6krm3C/A1MGDOpLiEgvVo3obcfTqTalnR+YOlHQ6aOBqqnZACX596DvRNsdA?=
 =?us-ascii?Q?4hAQuB7eYxoZ97eMk7CxFaogibTjYcjdyCCi8GpcWA06HbE6J/hZ67FtZw4w?=
 =?us-ascii?Q?uJWFWCFtIk4pzjo3cpPLBpBvd7WDwXblVsgaFKPKLvmsl9qqKDB757aHqro6?=
 =?us-ascii?Q?fz9RoFSAbwVgj/0j+ESfKzPqtNcQiiyDAODA+jm6gz1XJ8R03N278f+LJKOh?=
 =?us-ascii?Q?/c5o05ldj5sJldIpkePuSdxZOF1Qp3l6g/6TE1bii92lTtJp1OnieSgxqN6m?=
 =?us-ascii?Q?NbzxTr4g738IabhWfZOc55KtHd3E+YgWJWHiNl2Tok03cE1SkT2Dr/jrF6ts?=
 =?us-ascii?Q?5JMbwreufAmuqkFsSR63T8EngBfZSI6TZhpRLqAUEMpSDQRLkO6aMTOVCQfi?=
 =?us-ascii?Q?Icfx4UKvHHiHkX8vU65I7QvHmMzuu/xL0NX5PptmZWuOfhJQ3OF5ZOn/EFkG?=
 =?us-ascii?Q?CozYB9Cc3EXR0iWtolOJbYhmOhqpTVnvTUfVvuQLdOp1NpSi9PDHj9C9nbOF?=
 =?us-ascii?Q?oyMNtF2HPz7P91iBSgjBqj0CWMAhoJv5eEl/fzErREkD+2oybGoYNA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2FLQ0uEWq90jGXJs8eTs5F2oy/GSN/uAVSZXcBWRPh1e8a/cgjvvnJautYt5?=
 =?us-ascii?Q?Ttry5zTF47c3ALI69ylwq/yYhyiJBLJbY6lEMRn54rNQpdxH5atqLfDOOnii?=
 =?us-ascii?Q?Z0GXmQmUy/d8b+qOwhFNzGThk2nDEkXu8YrSfuxnf8yOfe7nvkLE9usQaxRA?=
 =?us-ascii?Q?/4UZVAcrMeGGIO0uPkdDyj7jBTctjAbfu831X0KTaxaxTv8Z5HiaASirfS1g?=
 =?us-ascii?Q?QPFOAUo6Fg+eHusvibLxcKXElmXRhu+aS0jToP22d3jLD9U0q3bMYJpFxSDN?=
 =?us-ascii?Q?FsJ3YZ6Eoj8z3VuezBCB9xPcpB3rUep6q9ZQ2a53uDCmvYUrlFx9ID56Ol3U?=
 =?us-ascii?Q?fPpJC4bLw3rx+0OAtdKzoRvsb0ewCMiq8kA8kR2MUIM2iUaM3HxpJxOGnaJO?=
 =?us-ascii?Q?eXmJaS9RGCqYUqhtuxuVMtQ2K5QYIgMFNBfqh8kuZj0Q2ekrRiGvR7fyCWia?=
 =?us-ascii?Q?JoYUCH2EBx+s+SmM6dBoS5uSwwzF4vS4hKhM/b3Nb9jGyszKgjSXuDAtaMxy?=
 =?us-ascii?Q?erhBwrcNaVLQScK2LFm07WI9jK3o0r2vAA37Ew/9aZvSLgLGcbV1CtFy4yyb?=
 =?us-ascii?Q?Sl9VHhqsIULr3/bNDmOHmciWstlfBpQvLaJxn26OTqpI8D0AJJHRa/TSwNE0?=
 =?us-ascii?Q?WOQHbdvtl4j6W/Ar9kIhbMpXhwE9oHBdVHwa43+5zk6AKDjfqn2Uko4V58cq?=
 =?us-ascii?Q?7cZB5Q4HG7Ol663Qtqab8Zr+UUnGZRSxqa8zNA9reLXCr9jB+9GZ0aRzgC0h?=
 =?us-ascii?Q?HWCNMn1zom3aD610NW1JTE0A1+xZCDhduDfEKGItXZOW2jFOsQ3J/6JeQfK5?=
 =?us-ascii?Q?NMo86CQ3tWQjAmbORzgfjQaRVtgxu+mM9Fz3MyA/WY7SBDvmTvfe1yzP3+fa?=
 =?us-ascii?Q?P4d3cxxOc3aGwpZUe/ErOBr17KLLzo9SMujFPN5wJf2aecqKQPRx0d5tA1GC?=
 =?us-ascii?Q?87xAxcwS5molqsefsstWmowJp/NG8ShnxJF0FNPuNeJIzJykuF1tnncZXCUW?=
 =?us-ascii?Q?7TTCxEEYIGeOTTevXFN1gpxdQpe3Lw/mrUzsBV9xS2l1hjvEydvqWxewESM1?=
 =?us-ascii?Q?iH+xznBfVJaIBJ3YMxz5fHQY9txPGJSVA6e4rp6zuHPGLkinPfIw8HA5+hdB?=
 =?us-ascii?Q?b72lGQ/CudACQiUTaQzmH4kvYP+PsWH2yHzg3yeOqsoQfbt83CZCRcKIaAWr?=
 =?us-ascii?Q?bXmRzlJOeC2um4IZ6PqWv/un3rU+AbXhGAPQvWoT0ePWkhWzII1hj3+cSbGb?=
 =?us-ascii?Q?xNCV7p/eKP6VrL1CumcWE2UqbvTjsLFeo0bmbawup/9fN1do8Is1mACtlxZY?=
 =?us-ascii?Q?cTSlBDLBhwf1BcDAHzBQodFV8nTrkq3Rlio9V3CnqWxoE6bZ5QcThnLmEyk6?=
 =?us-ascii?Q?bKUgMQRTbgLOgdEG1GvncFfiepv6vVnmZg5rSY/TDpFQfKml6ZEyx19tmRgW?=
 =?us-ascii?Q?uvt2UdxqRuI/OgKXuMi08EZNOVuTczRD/zKshbCESF1ftSUGbUNWuJwyrRzQ?=
 =?us-ascii?Q?Mz8/cchv1T5NjhsRfAERqRTGfZDXog66AnX1c7SnMBGxqc9JSn/KsdYYD8dv?=
 =?us-ascii?Q?1jVGnq2MvZ3fcbMNA2E5dl/CNyJ/Rm96eoVNwzlXPRLN7YB2Iuh+sAAwtPg1?=
 =?us-ascii?Q?/Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a14531-b095-425f-adbc-08de11ab6a02
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 20:41:45.0489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMlk6leetHom/yPS+U92syqlD6w3PJACyA9pLbVQEXrxiEYylXIzyYTbe+xUqSxBMWfSQEWoHg2r6KKG4QK+Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3714
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 20:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225212

Add ptest support for libxslt 1.1.43 including:
- do_compile_ptest and do_install_ptest
- test data installation
- cleanup of buildpath references
- added run-ptest installation

Enable --with-plugins only when ptest is enabled, per review feedback.

v3:
- Remove unconditional --with-plugins (leftover from v2)

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-support/libxslt/files/run-ptest  | 25 ++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.43.bb | 40 +++++++++++++++++--
 3 files changed, 63 insertions(+), 3 deletions(-)
 create mode 100755 meta/recipes-support/libxslt/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 9950e46776..b295e0049f 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -47,6 +47,7 @@ PTESTS_FAST =3D "\
     libxml-simple-perl \
     libxml2 \
     libxmlb \
+    libxslt \
     logrotate \
     lua \
     lzo \
diff --git a/meta/recipes-support/libxslt/files/run-ptest b/meta/recipes-su=
pport/libxslt/files/run-ptest
new file mode 100755
index 0000000000..a2b28e6a75
--- /dev/null
+++ b/meta/recipes-support/libxslt/files/run-ptest
@@ -0,0 +1,25 @@
+#!/bin/sh
+set -eu
+PT_DIR=3D"$(dirname "$0")"
+cd "$PT_DIR/tests"
+
+echo "=3D=3D=3D Running libxslt ptests (verbose) =3D=3D=3D"
+
+if [ -x .libs/runtest ]; then
+    echo "Running .libs/runtest --verbose --timing"
+    ./.libs/runtest --verbose --timing 2>&1 | tee runtest.log
+elif [ -x ./runtest ]; then
+    echo "Running runtest --verbose --timing"
+    ./runtest --verbose --timing 2>&1 | tee runtest.log
+else
+    echo "ERROR: runtest not found"
+    exit 1
+fi
+
+if [ -x .libs/run-threads ]; then
+    echo "Running .libs/run-threads --verbose"
+    ./.libs/run-threads --verbose 2>&1 | tee -a runtest.log
+fi
+
+echo "=3D=3D=3D Finished libxslt ptests =3D=3D=3D"
+
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.43.bb b/meta/recipes-=
support/libxslt/libxslt_1.1.43.bb
index e08e92085d..c1793710e5 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.43.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
@@ -11,10 +11,11 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D0cd9a07afbeb24026c9b03aecfeba=
458"
=20
 SECTION =3D "libs"
-DEPENDS =3D "libxml2"
+DEPENDS =3D "libxml2 libxslt-native"
=20
 SRC_URI =3D "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.=
tar.xz \
-           file://gnome-libxslt-bug-139-apple-fix.diff"
+           file://gnome-libxslt-bug-139-apple-fix.diff \
+	    file://run-ptest"
=20
 SRC_URI[sha256sum] =3D "5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea33030652=
31a6d403f0183a"
=20
@@ -26,7 +27,39 @@ S =3D "${WORKDIR}/libxslt-${PV}"
=20
 BINCONFIG =3D "${bindir}/xslt-config"
=20
-inherit autotools pkgconfig binconfig-disabled lib_package multilib_header
+inherit autotools pkgconfig binconfig-disabled lib_package multilib_header=
 ptest
+
+RDEPENDS:${PN}-ptest +=3D "${PN}-bin make libxslt-utils libxml2-utils xmlt=
o coreutils sed grep diffutils bash libxml2-utils perl"
+
+do_compile_ptest() {
+    cp -r ${S}/tests ${B}/
+    oe_runmake -C ${B}/tests runtest || true
+    if grep -q "run-threads" ${B}/tests/Makefile; then
+        oe_runmake -C ${B}/tests run-threads || true
+    fi
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    if [ -d ${B}/tests/.libs ]; then
+        cp -a ${B}/tests/.libs ${D}${PTEST_PATH}/tests/
+    fi
+
+    for f in runtest run-threads; do
+        if [ -f ${B}/tests/$f ]; then
+            install -m 0755 ${B}/tests/$f ${D}${PTEST_PATH}/tests/
+            sed -i -e "s#${TMPDIR}##g" \
+                   -e "s#${B}##g" \
+                   -e "s#${S}##g" \
+                   ${D}${PTEST_PATH}/tests/$f || true
+        fi
+    done
+
+    cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/ || true
+    find ${D}${PTEST_PATH}/tests -name 'Makefile*' -delete || true
+    find ${D}${PTEST_PATH}/tests -name '.deps' -type d -exec rm -rf {} + |=
| true
+}
=20
 do_configure:prepend () {
 	# We don't DEPEND on binutils for ansidecl.h so ensure we don't use the h=
eader.
@@ -39,6 +72,7 @@ do_configure:prepend () {
 }
=20
 EXTRA_OECONF =3D "--without-python --without-debug --without-crypto"
+EXTRA_OECONF:append:ptest =3D " --with-plugins"
 # older versions of this recipe had ${PN}-utils
 RPROVIDES:${PN}-bin +=3D "${PN}-utils"
 RCONFLICTS:${PN}-bin +=3D "${PN}-utils"
--=20
2.43.0


