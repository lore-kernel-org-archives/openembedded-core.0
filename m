Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD053CCD1BF
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 13:21:35 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.1])
 by mx.groups.io with SMTP id smtpd.web11.5415.1761398484994054767
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Oct 2025 06:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=LDo4np++;
 spf=pass (domain: est.tech, ip: 52.101.83.1, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9XZAOvzPWOzSLMM7NOSo4xG8bRkq3Tgni/MlQZmzkovObOBUXsZ4Ar82H6FngGoXJ7Dud78Sc/yGCyfHw3LqtoBlK5XuG8fdcSyC6cJx7tbGmU2jDEi5FPUyxniMhIrLVncH1bck27nl4bixBAxGrn1AJQFajLDrrpC8+3L4SnPtaTDb1VWwEVUNtaHPtkUVMkG69gclEk90X3HncerUbdyg3rscyh8shfnd4NM9xKDBXUhJIf7HZTmQdA070f7nOmbweRJygA5biMUlECDs19J/UnMGrcxHL3zaeSFfheWastfRugH6ZPIV9tzXHJ9toeFo+N2h6MUBsk7bzuxXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfOdCMTAlXrTuF2f1cgETJOi1uscHgh88bssBDfHgYM=;
 b=u5w4T2ngwDYmJ4wZUeXFUbbZ6HdkWFpNiwtxlySGVAtRPLR5xmG2O0bORC8OJPuStKf8hhe2JClmRJTBEL3gf1+WG07d/u4Jh2AkTxORAATOil4Q+NCnqzU/aXNJj3Jlcphw7TZ9kU5RJ2b1Ot6Em6e3NLgysSp5/KFHo5MTX0n/BuTt3wB4yrbHZ3Hkj4LWuT6VbV4t95LWC24xDTq7VGZDJLm7LIE6wJlR7Y2RUYWYsPTWjfF+jCsN0a7b3egAhk/DSCkn3CpO8jkuEm538BMi1P5xJ/P4mv9sWZomQsnm1Hi6sazfgVCV00C7+YTmui5CqVoZlo8dNPCMn5rMFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfOdCMTAlXrTuF2f1cgETJOi1uscHgh88bssBDfHgYM=;
 b=LDo4np++blnbuAYQFdI/tvcypAruIliudEUqT5uGCZ7FvRkoVmgnw85yGGIslLEERY2AzNrjArscub25bHv0+B6rqAOhXQNwyTyCMAMyaNZIO/VgVgVKox4l+1V1vLgpT87glXMgwgCD3blRuLi/7fS5GL6vNHR94wQhpcCFEm3RWztxx/qhpW6X3/1CKluYal5mtm9OCMTIRr2/JjHQkYgRXIRfMzACj4XAk+fY8B8IE9b1+64GkS4FrEpAUnICrrzianxYrNyiQfW7Rx6XIzYT22CS1XBIx+/FLnqXkiaPeasmND2vRe38qPIqlEuhT9mPQsZZgbDKmE54A6MkuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AS8P189MB2047.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:524::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Sat, 25 Oct
 2025 13:21:20 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%6]) with mapi id 15.20.9253.011; Sat, 25 Oct 2025
 13:21:20 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Pratik Farkase <pratik.farkase@est.tech>
Subject: [PATCH v5] libxslt: add ptest support
Date: Sat, 25 Oct 2025 15:21:07 +0200
Message-ID: <20251025132107.9296-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023153459.49699-1-pratik.farkase@est.tech>
References: <20251023153459.49699-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0094.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::9) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|AS8P189MB2047:EE_
X-MS-Office365-Filtering-Correlation-Id: 002bba3c-3218-46b6-5aa0-08de13c962aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?E2xgT2ES0qN1zrHipthLtuS/5jQRPWKy1y457/VExVnEJtWJqTuX3uAPvao4?=
 =?us-ascii?Q?H2ya+WhX9apsebu68RPux35J5P5u37TVJUj1rExGCbOok5t6KzZq7u3bNGqB?=
 =?us-ascii?Q?9BbZVcnFAMEZ9fpXBt3VwRT6yXqoFSw24cbnGywxo2tkBYJICBJyRMvEZ2y5?=
 =?us-ascii?Q?6d6Enq5XytSA+5wSZB2opnDDcHIjUZy+6apxgcpt+fHRLz30dLmyBSH47sYb?=
 =?us-ascii?Q?8XwmqQuC2sWADTlofstehayvpA+NifuarCw0j+zrxvtf3xyyOBhm+sFP7yxP?=
 =?us-ascii?Q?tXCwaGUhzo765Ck3gqHavmNuBCc2amgcxJFfGMgkoD4h/imWai6ptm5XYBjY?=
 =?us-ascii?Q?LW4/2g6i4TyMvgWO76c73HJlcjYUYTInSvup64BnQeVFhJpTZmr36VCzN5VM?=
 =?us-ascii?Q?hYns1ORNuYpojSDbbi4xuediyeyniH05p2mJDZqmKxzdDThqh4UNnRBBBG5M?=
 =?us-ascii?Q?x4GNR+s+IJhFXFxiwsv/bDVQ1iVsr31odocA6Osui9lidmrELkuNR0budD8N?=
 =?us-ascii?Q?9JJ2ys0iAbIoQ03u5n2r0VWMduzOE/DJbZ4CpjtCUHEyJ6lhRirc23pWM2xa?=
 =?us-ascii?Q?dDnEonJAyRJSqHSc2Mdafm2NmGHbDUD7+WxmpJbhWIf/CYyZtmOpKauHCwf7?=
 =?us-ascii?Q?Wb0D+wGYa8Bi3T+ASxJa4Ytu3+XznGeomuZajRCfu8t9e9+Jg9GAk/gD0dVT?=
 =?us-ascii?Q?bjMpXGM6PBkp7fwz8OHSqB0rTz238/q4quyQfhmzAhJqeq+BEnSigFd8eicv?=
 =?us-ascii?Q?BUecY1bmf74NP3ENXi6Qq8J2HchVv03faaWKA9eeEkJpN01Oe3vc+1l7Bc11?=
 =?us-ascii?Q?GTGmZG+ZTEmFfHel8FIWDtc8A1HhUjRIxHWILHUfEB/qYg7I2wDXnfOrK8c6?=
 =?us-ascii?Q?iiYrkFyzPGcGRgkMO5TF7bTE+JKzfgwNgjFyOCSwK4cdOHSnmUyIvd0FWxTv?=
 =?us-ascii?Q?3p346ycJxdBmmeGX91X10AbLoZFO/CFmLHDf7pgP4qo0Jjj/gBK89HqSEUPH?=
 =?us-ascii?Q?8ZA1awqXuWrDJy+xtBtUlv1cM29F1KN+ILadZqLkV9extcfCQV8009xPFiyC?=
 =?us-ascii?Q?BZTpiuEpG9jfa9GRbXgcWDVzUkOqgLAQd/ORHvS9SA5pdXYor0Vf/wQTCrpI?=
 =?us-ascii?Q?MKLI7rLlTrCib1F/1u7O6kvGCQtSWPFNeRFFC6e3Mzr5zxBj1Va9oiWhwoIa?=
 =?us-ascii?Q?3q7/DbGyLlib+iY4yIL7goFfOTqPPPPxnd6lDr9yLroFh2oawdO+Hx01I1A2?=
 =?us-ascii?Q?HlD4jJAWy9b9uDItIR8UZNiqmt8NeNZ85OmNsc5MbnkSl/jWY6LEmFzc5Afh?=
 =?us-ascii?Q?+jqZ1THgB2XX4toY6sl45ct8eh4+PlS7E09grImc4yBrnt94ri5u+vC3AOSn?=
 =?us-ascii?Q?FnwAwzMkK0qRspjc8nBs1kVqdIAMOA/QOSb4CL5McbEl4oRmOfT3RcQoK9fM?=
 =?us-ascii?Q?TWFRZeb8QtdBh4agoyKOc4qzGRBQgUxUzSt9GQPQQcOU99ImYQOYrQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y6YjhGlmKu2gflSVs6noDe5x5MlOFx1VcnINVU6dMs5dZRpAoa/aFxSmJyNP?=
 =?us-ascii?Q?YtKCNvw4ORlXl78DK5DjxMJdEBDlJewkdbuY9UddfQ6peQv8uGNjTHqFhS1r?=
 =?us-ascii?Q?LQrkbE1IVHdTq6J30xylPaZR7lJPirQUEHZCAFazOMTuozi1NLTay/Olkmha?=
 =?us-ascii?Q?AzJ2+I3NHIjyzHFxLWA6SuVMBjsU6uG/bzBo8k/QSpIWOn87DP0ARNpmzQP6?=
 =?us-ascii?Q?GAx2QQuDHwFUkeiXedtbNSbNBs+fiU7mL1jj+4zLAPVmRtTIb083V1h7LJw2?=
 =?us-ascii?Q?4Ve0Rb5apOhI03NvdjW6F+4TFDLwl7O2cuhdvyq6/I60NF9n+dWAR9lp2HJ4?=
 =?us-ascii?Q?ZLuknFTTDbFdt952EhLo0aswQnvk/8G/humBH71iyJtoRJ5YUu7GjJetou/q?=
 =?us-ascii?Q?6Q62wbmhoXtaNd2UUP77rR0QgA3nZVqk9vI7xoCErNLTvAhYkdgUNCRBHq7w?=
 =?us-ascii?Q?sJxc5eKWowWPpzw4QKa3bDKzV4QQKmtWzNOZ1RxdQ9WYFc1pF7FQCrLP1ThS?=
 =?us-ascii?Q?i6IvwE6p/pZ42zLW1ugritqjRd5LY7f9djJRgoDea89i27ABPLVsv/zqELrV?=
 =?us-ascii?Q?NMdVRVyAmDpXCRP1gkXr9OfLxoGR3LIdOYrNxm5EoNtSeaBFIrancrjSB8Pn?=
 =?us-ascii?Q?tn4YHdcYBE2/zxzlDzBAZLNcFMPRygdQseVRrFczYW3nb4HdgHWPk6gqhIN2?=
 =?us-ascii?Q?UTP8qufBgtbEKJYPPAIC0Ju+p5OXFjzIonkfxH0exvSyDHb6RinDQyfOwF1v?=
 =?us-ascii?Q?SKxt9rMidFQt10VEWjrO7AmBU2Lm/SYsSepLGY25VF0LVlzEDRFeBgmDLF+t?=
 =?us-ascii?Q?EsO0TPUJ9Gp3+erQLh+IrEBkXrAfFhxvu9MeDAP9Jt9uPTROGWTAGYaSaB44?=
 =?us-ascii?Q?421r2vq9kCwpUeLRYcpaoJ5YEBcxmxkVZHMpGbwL4QpihiWbS8ZP9z9zKmGg?=
 =?us-ascii?Q?bWGPp2fWJ8Ttz0VkX92wES5Gj8TdbYnneDRmsNrNWFCbVmZ9U4AgKvwma2JJ?=
 =?us-ascii?Q?G9OkwtlPbz/kJUoOnroRKMonVn4XxPTnuaCnpadEVTwWVF05QIS9e7VriU1x?=
 =?us-ascii?Q?z457RyEmk8tmdwNjWVr8tcmn/i2tV2Kz3dXo+KzCXmvKHVyr4JChCnzF9LSN?=
 =?us-ascii?Q?Tdg09/VLbkuCO8UH7yhWsuEmtZ0+zbbiHpIWq3Om8ePikY6l860qg0KmHts5?=
 =?us-ascii?Q?x1aQFIYrjwtmBDO0hE9qT/TSRSlq71x31IjjMJxJNkQDvm1NVKm6xeYO503z?=
 =?us-ascii?Q?Cz43vjiPD3AvAUTa9RkCk8lpvTWzNLNG3tDJ+JDBTtwM7BXohmIX1qWoDuwy?=
 =?us-ascii?Q?4IY1EIHMwpUVP4cMrZnYvvBA+YB64rrRROAzg+GaWQZw/VOhQeGiEKD4R0ve?=
 =?us-ascii?Q?sOCABShjgN7Ft5WwJRvHmsUBzKxkW4K0kgSlZHFZ5euDadf9G5G2wEu5zByh?=
 =?us-ascii?Q?2fZCC8yvXgIiaIZgc77gjNlnPNaG8t2+T/HmeKyrLrmY3QCHWUtvTaYciG3X?=
 =?us-ascii?Q?lPBOVq9CEhNT11GTF22k8rATU1Snxyr520zSjQbKOFOiQbAGeZD3aQDepGpi?=
 =?us-ascii?Q?NQUMNgXM4S23bDPaGhIgpKQfefGATlZ6FVoxLhik5sKkkL9JZardZnvSF9KE?=
 =?us-ascii?Q?Jw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 002bba3c-3218-46b6-5aa0-08de13c962aa
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 13:21:20.1026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCJ2WwxmNe/XO1u5xxEObe7Qy8UIYE8gY2eSJghBtAMSSRSNIYdymJ5NsybEdS+49sfmRmw2PFlpc2MbdJa8ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Oct 2025 13:21:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225307

Add ptest support for libxslt 1.1.43 including:
- do_compile_ptest and do_install_ptest
- test data installation
- cleanup of buildpath references
- added run-ptest installation

Enable --with-plugins only when ptest is enabled, per review feedback.

v3:
- Remove unconditional --with-plugins (leftover from v2)

v4:
- adapt run-ptest to emit PASS: or FAIL: lines for each test
- run-ptest installation with proper permissions

v5:
- Added FILESEXTRAPATHS using ${BPN} for multilib-safe lookup of run-ptest
- Guarded run-ptest install in do_install_ptest() to avoid autobuilder fail=
ures.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-support/libxslt/files/run-ptest  | 38 +++++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.43.bb | 46 +++++++++++++++++--
 3 files changed, 82 insertions(+), 3 deletions(-)
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
index 0000000000..1673f933e5
--- /dev/null
+++ b/meta/recipes-support/libxslt/files/run-ptest
@@ -0,0 +1,38 @@
+#!/bin/sh
+set -eu
+
+PT_DIR=3D"$(dirname "$0")"
+cd "$PT_DIR/tests"
+
+echo "=3D=3D=3D Running libxslt ptests =3D=3D=3D"
+
+RESULT=3D0
+
+if [ -x .libs/runtest ]; then
+    echo "Running .libs/runtest"
+    ./.libs/runtest --verbose --timing 2>&1 | tee runtest.log
+    RT_RET=3D${PIPESTATUS[0]:-0} || RT_RET=3D$?
+elif [ -x ./runtest ]; then
+    echo "Running runtest"
+    ./runtest --verbose --timing 2>&1 | tee runtest.log
+    RT_RET=3D${PIPESTATUS[0]:-0} || RT_RET=3D$?
+else
+    echo "FAIL: runtest binary not found"
+    exit 1
+fi
+
+if [ "$RT_RET" -ne 0 ]; then
+    echo "FAIL: runtest returned $RT_RET"
+    RESULT=3D1
+else
+    echo "PASS: runtest"
+fi
+
+if [ "$RESULT" -eq 0 ]; then
+    echo "PASS: all libxslt tests passed"
+else
+    echo "FAIL: some libxslt tests failed"
+fi
+
+echo "Finished libxslt ptests"
+exit "$RESULT"
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.43.bb b/meta/recipes-=
support/libxslt/libxslt_1.1.43.bb
index e08e92085d..e82db99f83 100644
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
@@ -26,7 +27,45 @@ S =3D "${WORKDIR}/libxslt-${PV}"
=20
 BINCONFIG =3D "${bindir}/xslt-config"
=20
-inherit autotools pkgconfig binconfig-disabled lib_package multilib_header
+inherit autotools pkgconfig binconfig-disabled lib_package multilib_header=
 ptest
+
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${BPN}:"
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
+
+    if [ -f ${WORKDIR}/run-ptest ]; then
+        install -m 0755 ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/
+    fi
+}
=20
 do_configure:prepend () {
 	# We don't DEPEND on binutils for ansidecl.h so ensure we don't use the h=
eader.
@@ -39,6 +78,7 @@ do_configure:prepend () {
 }
=20
 EXTRA_OECONF =3D "--without-python --without-debug --without-crypto"
+EXTRA_OECONF:append:ptest =3D " --with-plugins"
 # older versions of this recipe had ${PN}-utils
 RPROVIDES:${PN}-bin +=3D "${PN}-utils"
 RCONFLICTS:${PN}-bin +=3D "${PN}-utils"
--=20
2.43.0


