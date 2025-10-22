Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDC8CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 20:32:56 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.32])
 by mx.groups.io with SMTP id smtpd.web10.4867.1761165168225227092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 13:32:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=adVDnAWe;
 spf=pass (domain: est.tech, ip: 52.101.70.32, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2AbiU5FcfyM4NQuMHk39dEBjE29bGjQT5a36+L+0exuCXMy9g5C/T0CrpGEYmFPUdHaireFwbTQZAI4I+yo7q20cAGGXKD1bT4e6OKy9IzYX6eSGfWleCeVFOOjNN5Gcaw++OTjdU3XOogdjRzWhVzSlYAtbdYNZVzmJFjMFxNrX1bYGLC/Yd3uHIr5+tQ9/l0B21HXUQsu4xeH9lWOvDkJBDe3CbU4F95mNy0UWS6pwtIM5EaIeHycOV+c51OHoPqmhvfwTI9E5SmLye++jOnxM0d6M2R6jOtn1mwl9Y2DXoRcc2Oc17TANj14eWqQDhUkw4b4yEGQmpzhz6WB2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sh0kDQd0JAP25w1AfJKDYb/vdckXdqNHyWsp2G+N3kc=;
 b=NHOS+mowpJReub143+JaFb0QeiI16mQG3O0pZni3/q3iTBsahJOsCf0AKqO2hxeZfdnOOENM+ZJDXfm9c4qpxRSJdehJkD88hCnjGqY+cchAOFoR4dOmrA7gkrd0Cw3t5TszF19YfL00eIkndYLwVa78xChnskw9OSrhYZxO5hcVL4p7X/G0xMWZRlEzn9xYOYqMMRta1hdJtsHN7b9cxfFi1S99iVS2CGAuq+2f8uXkMNnR4nRgXnnCstNMleF4TdkXX5EciCOIEAwvzJo8W9VjFYJDjCmYOVOeKq706atU5f/hy3X1pgqh8IyEYve9lW5Cgl6GyVzwZ+Es2PEfYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sh0kDQd0JAP25w1AfJKDYb/vdckXdqNHyWsp2G+N3kc=;
 b=adVDnAWeF5pJUx28XWY59KLq92wA+/nl8eIrOQGWC/YD+HOB8Hju2GurTeAxqdu1A8K7PMhesH8M43UZpJbADAG7t7f2pPK11YRCe2QJfw7O2nU2nTojpBZ03g1WKwbcu9lSEsLRxRzIOJlivP3y0/0RhqGBddBeWg0p9r1Z3MJ7wh8T03OMsexMuTikJUW/kDwPsIuyW51yIuxmDAiaTOB08zxI2M/0f6lWpbC5xMJud39svt9EdHLc8gcz6AngOHlvKvY1asWp08H72DlKAWINWw/9SPCG+hHeEjpTMPjnqMC9RroLGu9VWwYoHJW5LISoYvBX7ikMorp9PDiwzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by PA4P189MB1295.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 22 Oct
 2025 20:32:44 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%6]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 20:32:44 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Pratik Farkase <pratik.farkase@est.tech>
Subject: [PATCH v2] libxslt: add ptest support
Date: Wed, 22 Oct 2025 22:31:58 +0200
Message-ID: <20251022203158.7806-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0533.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::18) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|PA4P189MB1295:EE_
X-MS-Office365-Filtering-Correlation-Id: 6764a15c-1900-472f-a74d-08de11aa25f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5bGpw/KqlQHbO+FB4y2gX9sYaA4DSOiK83sRACu6Xi/TlBGYlZqMwRX8Fug5?=
 =?us-ascii?Q?JEirIGte0cCbTE19TYB/0HKzjeOblZuF3w8a8zukC3JnB9lNIm+uLgtzH2C6?=
 =?us-ascii?Q?mx+8E1cq3//XdeT2WDJyr3v2aT2TloHD8o2Kjf0Fg+91Z6Pug8GUKlbMtoJl?=
 =?us-ascii?Q?/tCSHJBSwTaD7VsW9eLmexc8GCLz6UkslseOh3QZoIm4cegtnitY9sBv/S7L?=
 =?us-ascii?Q?WkAdh8Qm198uQ+nEWyD8jbpKkPkKbcRwsI6K8CTYsSQNNt6iLA+2ZpCyyR+I?=
 =?us-ascii?Q?UtRlqFkZjSg/SiQEESjFtbnk/mJfOpqwOHAYE8LJHV7qS1cnTz2bWmrWJWaB?=
 =?us-ascii?Q?Fj2lZ0MaKcTPN39gs0asJE2UsQWoH+t7DLoPT3Q4OG/RjshZxj3DmJqpv/Xf?=
 =?us-ascii?Q?Vya5YhMA9RQ8N61yn/x7X3333FCkN+dXn2zA4Q+xAbtUkuqRW/aI2NgTzb+N?=
 =?us-ascii?Q?ZKHKyuc6GLR32ljtxzDrb3fs+4aLoEHzbevG8h5Iv3UGuSMfkP1qXykwlqGJ?=
 =?us-ascii?Q?jAC6jHSRE0hqSJynVOkxokfQMvBxkEypSurjhGTiVuHqG+Og3JpEkOi11kS8?=
 =?us-ascii?Q?upowIMdqWw3bepFlrlmDwyPh09jFGj47jAonhKkz3sE0CJ4iYNvyI08YZ7o+?=
 =?us-ascii?Q?xN7T+JP5HjV7JLaQf3RK2UHGu10Ewk1vJaUZ3gNKqZ11jzygdCE097nW9mEE?=
 =?us-ascii?Q?VLVU44NslHZLOwSP6I2nqKi9VMQqU/Bt5Y3R/EbGVAzV91WE7YknuiaR8tsM?=
 =?us-ascii?Q?0FGPh/BZit90K/vOfdwH6TsFHzqkDgz3jiHEMjbwtsY2603ci/SmDaCuJVL/?=
 =?us-ascii?Q?sfSoMG/T8b+lcKAXO8scz5m4B2gZLxehlHOn1JkgQFPky9czsGPhPxRCguPG?=
 =?us-ascii?Q?ebgT67AjtKmaxPz9iGSv0/epcr+6mt/KfMLOKpJca+Egrx1BL2nx+i+FYcWt?=
 =?us-ascii?Q?kenIiv2M7DndgksUt1mjJrLGERaYpwUtE11FjETrhg9yH90gNc2e12P6apiM?=
 =?us-ascii?Q?fStMDi9dJ+fjp3wvNLeDTX7lxsNB/H6Ixh4VqhlXt/85eXDO7O8AuGjDDvFH?=
 =?us-ascii?Q?ZVVxsMHcc+7N0ZSsV/Mjzjl3kBSKyjFl2/oKuarrvteWHzbK7Coo2Vmb5OF5?=
 =?us-ascii?Q?WT4xALgW91DX0Cd997hSixFqGrR3x1AmM3WhS1ZmPzwn8rtZV1LYvxDQt7yt?=
 =?us-ascii?Q?Us+k19HDY0CPX4fbwdUXeBN6sRdxFtGVN52JB84a//Zqr/mATLyPS8sCWaTg?=
 =?us-ascii?Q?bSBIXjTVyP3ek9BzVa68IN6Ty05FeprVVCfmtPddU9nAnoZD4dTNoaxARphH?=
 =?us-ascii?Q?Gtvz+/PfE2lWH/Jo1FjkttcdGOf5/87apNobfXc+bilTJM0+Z10UNSjfAJAQ?=
 =?us-ascii?Q?iOmJ7cskz79GrtYUoEZAIgxbmTtRSGjGVUxcMeskOlouaqEGv9pMkC4c1+St?=
 =?us-ascii?Q?UCiK6zbMhKz+D/Z/Tkb06UDYqhkXY5jSCEnIab25rw0WFyGkDiPRcQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kKm0ZohLLa3E7+3eHOsiqkK43h4eoZee8wuxwwgL3gMuzqnEyoKa+NYB4XmU?=
 =?us-ascii?Q?We0A961lZrnHwrQrbghDwCx3kwNOUBooqQOUHkLxXYQWWLTWw/EalK0s+3CQ?=
 =?us-ascii?Q?0QkIoqUb8Ospr8ryi5Vt6HdVeNmdk/R7q5+BTh7HWBdn5kUPR+IwGf8l3I3N?=
 =?us-ascii?Q?4CubHo3tbwjN/i60MW8nQ/LGuy+rGxKDLZnou+1A+QqNuGJ/8ouwXGyUywY1?=
 =?us-ascii?Q?4fFYVU+KUAXoapCfcfpvyaftdz7aKDI1sZeGgYQKaQPwbb32UjfMNhlpyolW?=
 =?us-ascii?Q?9qWUkKC/vKUkW3zchW1THevg736/F0zwIEX+7iIXff4TTMke4wtzUXw1/E+g?=
 =?us-ascii?Q?ZHiJbAoATz7hFulgZTkEHSb992E74058S18ToVMY+t9KSCAu8xqfdHUfLyNp?=
 =?us-ascii?Q?s8CJt5gM5K0N7isQpRdvnj/8v2bLUuVxxYkAw0MIDxbT1E6Km/k+5hebDwrl?=
 =?us-ascii?Q?Teb9J+MiJC3QoxCXQk7cGDEkrU+r4jqS8Uz5WluwFwzQB2R/Sr9xxIKtLAUJ?=
 =?us-ascii?Q?Bs6SFio8T3ucU9/7/LR6hgnv7LzCIgGwU6UESE4dZBT/soyRV07QRxW3P6Wt?=
 =?us-ascii?Q?QR6y/kiTXJwlfql4OGeqp3omd1DAdSYZlCLRvpqF37vTFubine+Z3DBU2m+0?=
 =?us-ascii?Q?MRlQfVcR2PE9yhf3WOAYTGg2dTQ8zfIaBl4pjAe88N2PgCt8zH10HSzWGvC1?=
 =?us-ascii?Q?W0MCAWnBmXD7c2etNBYMhOeUZO91/oZsKXnpFHhiyKy9TMt2EOXki0p9lTOZ?=
 =?us-ascii?Q?iH9GqVkif4Q6QKZ/Kbv+/ydEjD4R5hrm6LFxnNFUAbX2ljWsNFOhkK+f2VCD?=
 =?us-ascii?Q?Bf9XUfGBOvOfyQ/Qxat/hYm/YIF8zamTPycO25w2bvPnmx65gQsm28U8XtfT?=
 =?us-ascii?Q?22DP1ycTNzI3Q4GesuzWoxpV5eHjQggN9ghkJuV3cVH7Fg04FgJujOZXuC4h?=
 =?us-ascii?Q?xxuyYyXUJbdwXJqq3e/Xj37pq1RH/HgWnLSrjiCVwBZ+SG3jcolaUj1ISWC2?=
 =?us-ascii?Q?l6RP6o3ZfJWODpxTxD5lRm9OfxzgMyRlI+oI6Hiqp9q3kywgPAHbzAVTCSRy?=
 =?us-ascii?Q?HHavioxrb6eEXrP4Ep4qOzzrAUTwHGakNGXfv/DbVGzxkvqTmP5GImj2XUWI?=
 =?us-ascii?Q?m3hlMrRkAwubcsyFMycqnQMaJCNJIS594uHJGM+evcAoffU4DiET8nnhjEI5?=
 =?us-ascii?Q?6KJb946MdWMXg8yIcUylnjOlTMVrVBhJIWLbPU413I9KlpGwCUf7n81O+Md2?=
 =?us-ascii?Q?B5lQ/Kd3xwiEfV6wQCmjU+/CXuU+E4dmXnoLA1s8F5/VRGkgldS5NY33BIvy?=
 =?us-ascii?Q?ZyuGEdJGi9DurBvtjwhnuIrHzxbZCwvOzur67xHK5UhQu+IScU1QA2eLjSB8?=
 =?us-ascii?Q?0aE8T68+hrh4mCU/YOHTKgXsY+vOFrfloG3P2PcA5O1X6J48bAJpNa4RhhQ3?=
 =?us-ascii?Q?Pe7rQ/JPDgVWea4rGHM0E8OlmnKOcyEUQqs/OKjcVzIiMow1doxA/H6JS8bA?=
 =?us-ascii?Q?+lCsUo9KdTxnH009WLEnGQAb3Ka96xw2j04JswJhw48IMgPprD4o/iXrOU2o?=
 =?us-ascii?Q?N9FRkYe+iW8ZcCUA3fd1w62ANr0K/3n30lqEEuk0uqp1GCMZNcovrGfI0VrZ?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6764a15c-1900-472f-a74d-08de11aa25f7
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 20:32:41.4082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXB10v+UD4OFH34kAsRGdkpZNem9ekQd65FDwYdDKkhi2WX9ZMr8x076BVjsSRTP3n4xOLOOPf5sAvMympAQOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 20:32:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225210

Add ptest support for libxslt 1.1.43 including:
- do_compile_ptest and do_install_ptest
- test data installation
- cleanup of buildpath references
- added run-ptest installation

Enable --with-plugins only when ptest is enabled, per review feedback.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-support/libxslt/files/run-ptest  | 25 +++++++++++
 .../recipes-support/libxslt/libxslt_1.1.43.bb | 42 +++++++++++++++++--
 3 files changed, 64 insertions(+), 4 deletions(-)
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
index e08e92085d..e3bc0c4aff 100644
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
@@ -38,7 +71,8 @@ do_configure:prepend () {
 	touch ${S}/doc/xsltproc.1
 }
=20
-EXTRA_OECONF =3D "--without-python --without-debug --without-crypto"
+EXTRA_OECONF =3D "--without-python --without-debug --without-crypto --with=
-plugins"
+EXTRA_OECONF:append:ptest =3D " --with-plugins"
 # older versions of this recipe had ${PN}-utils
 RPROVIDES:${PN}-bin +=3D "${PN}-utils"
 RCONFLICTS:${PN}-bin +=3D "${PN}-utils"
--=20
2.43.0


