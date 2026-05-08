Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D217DCD3447
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 13:16:29 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13378.1778246188000648554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 06:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=pf72KUBb;
 spf=pass (domain: est.tech, ip: 52.101.70.71, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvvXTcYWTWYxesi6YC0X2yYPjFsg1BzB6V06PBmPhUn9GVg3mtyTSQoiQPeoFFH7yzZgpxyxBxh+zxfxU+cLfVYgRTVEsuHW1T5veF2evx9csHtnqK5YHipkO5+24DSrj47H927hnpBJppsVAK8UA66rUT7f7Mz8t3mWokyA5of5SLKVWtsU4gg0aKlTK+W0dl9WyWsxMSG5X/Nn8aN0Km7IdKEjkrpY9BR1IAzCyTygWyPFwq4j4GUaMerfVIIITObsdC0l8pFgIX/CkiYdxXGPM8cxftE9KrQ4jM4Byry3Ot+0JpStpcchuAuQyf3ozbz+VbNuCeH+AFKaxkcHEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AZJtVtBvuV/HklkaIKQw42LTewkzKRINWi4MneaWIo=;
 b=QjZBQpQXsp1gK5o9nQ1RrMh0mUdcmBDoIu5kZuhmlg3VOZPPBCKnEnFjvzeP7HrhhN/vjZLkVSzcBr40WM2U+4gy5LssTHmx7KuMTT2RY5cX9SyUXeNzBUjgmBDDuADurU2E7kXdb4DYxvLErccgdU7OQqt16Sd8PZiSZVlFPFHijXcLDard6vfkaHMnXmfB8/iDHxWjuF6miTZwyqaiVYH4hRulLcDB4Qa1hFmeC77IjSRvufIChcTr3CtkAc5ZPkvsKlwPp6QLfzt7g7UhnOJ242fulHVMbpERNjVKiz0vDiNzjrQu0rbj202ArUil3W7W7X78zdDI5hf2uvTkqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AZJtVtBvuV/HklkaIKQw42LTewkzKRINWi4MneaWIo=;
 b=pf72KUBbR8o/W4Ya0E+XE87eGDootbM09FSuUAlgy7hHcOp+YnULYftba7PEKlbnL/XVQ3CVB90N4gQK2C9aqSH8QOfC9CoQP+V8DZoINjDvfFga/SlJmQkujD0kerzOOg4E1XlESA94JpGYnryLHkdGd2pGeGgtbtKEw7StSg1ZRKwc2Se6AMKC9Ub1ybR4GkwzVPWOhlQDS3dajlb964HO9yiP+0bypJQWDnDEiLpAkO+UuRSdMzcm0Ht71cqAaISNcEyK3XxHKCauD8dpKA78rQ1tL1bprMmHnWP5Txc2ccHYAMLaR1Cr2c520LBi9GA0xELIZtGBrrHUG3q1ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by GV4P189MB3584.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 13:16:21 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 13:16:20 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] liburcu: ptest: add regression test suite
Date: Fri,  8 May 2026 15:16:15 +0200
Message-ID: <20260508131615.25076-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0047.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::16) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|GV4P189MB3584:EE_
X-MS-Office365-Filtering-Correlation-Id: 76fdf45c-f08d-41a1-1431-08dead03fedf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	+qhkoGKXHGK/f/8V5S/sAMmKZRijbNIqpUKBjIoqSA7k0tmegLCgBGIX9ydjFWNtgpBjbJolTKZK/yYIODQWAm8o9lHBmKMU/kmMjjUJA7qLUwDxrKwrKimifV2l1q0IBYZv/wvv/2Bpoc3UcAJf0N/rMe1IBTWg4zclUV7bzX4vjiEXVJT0I0NjH/Ggk4LsDzhOWVweZ81TulLADLRg0ML0n3JfQ9XMLyF3uvRQEZR6PRlfDNtqIxMxaW1cjHG+1KHY2k9Fsj7YbG9T8WegxgIKCMnZ5OJD/wsFBdADsUR1yxPqClWcZ4dCrSFW4FgswGcu/EiDSPMf3m4Bbl5+pT7X6rXH0lo82xk8Tb3Xzk6YSBAp9mcBObzgQRFZ0tCixM1NrJ2lUmOOn+ia1KiafVoO/pvLMPZoU/OnJrxTu1R21uaejBs64Uz2jwx4oyTN24cpU0KgqNWjR0klhSUT/qqChVh6M8N0Pz2TBPEa9Ql0G0jbIBL0DeccdM6WlJYEvXP8TYnXDKUOKLGK48yO0sHukItBSqi56uE651B5YRJr8G5Yx4I6v6T1p6Y5WS4h4SEuWvzczlzJl4Op1cwxBptYvOfBm+OpcrqE89Aq5sgDMRndR3LaDY1ptnwh/MktSpKTPRZ0haxeAjNkw/ZyW462f1ymQL5h7QHA86KaYqZT/m636OiBwgJT7LOGBH58
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b5gOqFwr/hQRvN2t7nUAKCcB9Rchvwvte9MlQr3z1lRskqDOuuIumPHMXvah?=
 =?us-ascii?Q?HSpaBrGXNVhvdRiyT7pKxy95JxlAGULtP1eu42ZpRtbovOxL0J3lA1ZclZzV?=
 =?us-ascii?Q?qqfQ2Alb5PqsZ0bdtePQjpVVBtV97HuvhiJDUKFMoHHtk8JSI9EpfPUx7fJK?=
 =?us-ascii?Q?a5g9rFlzF+W/pGpTlxpU4srUD9OfP44ZZ0iOQ5AOiab1qY/gx6dogj2nxpvz?=
 =?us-ascii?Q?aT0sBGpNHLGmc/rwsvPh4tqkOq3BvlxNZahPCXHFhmUS9MfFlHxpEPOq4DYx?=
 =?us-ascii?Q?Tjz6cXz7xVjwb+LgxEz023j3nmUV3Oubh3fqmbZuNCoSwuc4ot9sxoaVbO8z?=
 =?us-ascii?Q?rV27MUE32uQCB8E25FrP39j0haN+WukbJdx8YMhjpBI/l77lln+icOdALT4/?=
 =?us-ascii?Q?GCva6zSu8xbwKx/D1JTF/sPyPmCCheIveJowITuxtPyPitL+AQS9VOf4sP0Y?=
 =?us-ascii?Q?eJtTMNzJ1Ctom7l6iA3vteh3WrgtV1v9q0zG8Ye3rqGLun6Yr+kBWQZlyxhq?=
 =?us-ascii?Q?vC9UzzYVdn/FsalCNPqCAGAkl7P/0uX8MoagFYTFGHUXu6wBwo6xUVcwqj6P?=
 =?us-ascii?Q?m4u7dztenf7Us02Xf9Np6gr+5FpqWLjDksp1AKqBuwqu/oGGQLtbCE3HO12y?=
 =?us-ascii?Q?8xUQJiYxohUzUQ8FF9qVBV5UuhxT3tYITiBzM2xQb8kYcEcVpaf+1598YYkg?=
 =?us-ascii?Q?LV4NvHWON9d6fYuITGsUhOhrxC8OqGM0c3m+GgUzTENB/amofwtf16iOioj5?=
 =?us-ascii?Q?wxv7BzoD/L9ZTUtiXt2kz9xPt8nHcTCh0aC2VvUbuza4HPExxBZJVlt4GWMj?=
 =?us-ascii?Q?4dGsplan8BfR+mnpedEbqEzqkn0aDsLIKqoouTBRVGfu/M8+USoe5PNhcEGX?=
 =?us-ascii?Q?jU4PdktjbyZiBBAZdfPPTgRkdLTZ13Pf95WiW2C7N4Qrl2xZ+vBdys7Jv0DF?=
 =?us-ascii?Q?lL4d510N8ae9Gqi/qkGEf8Ql8Yu+VDrzOgPAyLWt0hbhafqpBqIEP95Tq8LA?=
 =?us-ascii?Q?ERUgsLzOHxCkyFdYSiKUbT4h0StKkQENn1mQGumFZO1cLZqlNLSHM40AEdPA?=
 =?us-ascii?Q?waSHfrXl71BhxpALfYWGriGq8p9DFicrTPkPVG7ys8X6DShduDoTNZgW1GtK?=
 =?us-ascii?Q?KkaUl/VN7HC+mV9UnMeNH64se0m9NRxZ6vgUz0ORCmz/g7Qwrk6smF16xMZA?=
 =?us-ascii?Q?x7MRYBPg9Ox9Zr2efTp2IoGKnAyaP7k9DYUlIbfHiB/GyWHCXaAfz2vitCAo?=
 =?us-ascii?Q?KTfm4Rya5PKoneFebL8dgTiWDT7mvr7HBiqtON7TJEAXKQIqTcNE38CX0tI3?=
 =?us-ascii?Q?SdiUiGEH093BR4zAdHmVvyJ17S/PFZd9KCCxlVLP4ApETDz3qMZrk9NSsero?=
 =?us-ascii?Q?XqX6pdSqADsPeDpggFbtzJlbiBU3YzlcXtUgJu+1aAZzoZtOX6BuocgqZTjq?=
 =?us-ascii?Q?mR0Q7nYWD/4tLg95Z2QvW9txNzGBel5eKtnY8xx7iyuXV1Av5izgq3IYeuzV?=
 =?us-ascii?Q?2EbeQOgzvj2TndkNoCw2jESznHa/aS71dk6C4ZkCpuY40umUGzW4BYpjcHO8?=
 =?us-ascii?Q?2VFHfdAiU1xS1Al3P18tqaldYmZtMnoNigp54lv2MgaYZOYGOkFyGldcoI6u?=
 =?us-ascii?Q?h8oJTayGvSvAVsIiTutItI2P6wihFBdhiwUH8U+LsV6x7jaSdubOMQQ7KSrv?=
 =?us-ascii?Q?y3ibb6WUZmB1gU5omz6qBnI+pgR9HGhagmnAiAvV3i5+BEPw+WL4EG3dVDem?=
 =?us-ascii?Q?0zYgxyQLnQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 76fdf45c-f08d-41a1-1431-08dead03fedf
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 13:16:20.7709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxjpehSY1AtHC3+Lx/obSTsnmG2wZwTdb1tnuID1ueSo6HqeIM3Djftew5hDpMhMEfLRaj0YBG/b1yW7IsHlgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3584
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 13:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236711

Add the upstream regression tests to the existing ptest for full
coverage of both unit and regression suites:

- rcutorture stress/perf tests across all RCU flavors (membarrier,
mb, bp, qsbr) with global, per-cpu, and per-thread configurations
- test_urcu_fork and test_urcu_fork_cxx for fork+RCU interaction

Move liburcu from PTESTS_FAST to PTESTS_SLOW as the regression tests
add ~6 minutes of runtime (total 379s).

Tested on qemux86-64 with ptest-runner: 122 PASS, 0 FAIL (379s).

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  2 +-
 .../recipes-support/liburcu/liburcu/run-ptest | 21 ++++++++++++++-----
 .../recipes-support/liburcu/liburcu_0.15.6.bb | 12 ++++++++++-
 3 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index ccac8e3bb3..66b7f10acf 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -51,7 +51,6 @@ PTESTS_FAST =3D "\
     libtest-warnings-perl \
     libtimedate-perl \
     libtry-tiny-perl \
-    liburcu \
     libusb1 \
     libxml-namespacesupport-perl \
     libxml-parser-perl \
@@ -134,6 +133,7 @@ PTESTS_SLOW =3D "\
     libmodule-build-perl \
     libpng \
     ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'libseccomp', '',d)=
} \
+    liburcu \
     lttng-tools \
     lz4 \
     openssh \
diff --git a/meta/recipes-support/liburcu/liburcu/run-ptest b/meta/recipes-=
support/liburcu/liburcu/run-ptest
index 5f8fb4fcfe..7dd1ee45e2 100755
--- a/meta/recipes-support/liburcu/liburcu/run-ptest
+++ b/meta/recipes-support/liburcu/liburcu/run-ptest
@@ -1,17 +1,28 @@
 #!/bin/sh
=20
 PTEST_PATH=3D$(dirname "$0")
-cd "$PTEST_PATH/tests/unit" || exit 1
+cd "$PTEST_PATH" || exit 1
=20
 export URCU_TESTS_SRCDIR=3D"$PTEST_PATH/tests"
 export URCU_TESTS_BUILDDIR=3D"$PTEST_PATH/tests"
 export URCU_TESTS_OS_TYPE=3D"linux"
=20
-for test in $(find . -maxdepth 1 -type f -executable -name "test_*" | sort=
); do
+# Unit tests
+for test in $(find tests/unit -maxdepth 1 -type f -executable -name "test_=
*" | sort); do
     testname=3D$(basename "$test")
-    if ./"$test"; then
-        echo "PASS: $testname"
+    if ./"$test" 2>&1; then
+        echo "PASS: unit/$testname"
     else
-        echo "FAIL: $testname"
+        echo "FAIL: unit/$testname"
+    fi
+done
+
+# Regression tests
+for test in $(find tests/regression -maxdepth 1 -type f -name "*.tap" -exe=
cutable | sort); do
+    testname=3D$(basename "$test" .tap)
+    if ./"$test" 2>&1; then
+        echo "PASS: regression/$testname"
+    else
+        echo "FAIL: regression/$testname"
     fi
 done
diff --git a/meta/recipes-support/liburcu/liburcu_0.15.6.bb b/meta/recipes-=
support/liburcu/liburcu_0.15.6.bb
index e02f797041..0883c6d031 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.6.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.6.bb
@@ -22,7 +22,7 @@ inherit autotools multilib_header ptest
=20
 CPPFLAGS:append:riscv64  =3D " -pthread -D_REENTRANT"
=20
-RDEPENDS:${PN}-ptest +=3D "bash"
+RDEPENDS:${PN}-ptest +=3D "bash coreutils"
=20
 do_install:append() {
     oe_multilib_header urcu/config.h
@@ -30,6 +30,7 @@ do_install:append() {
=20
 do_compile_ptest() {
     oe_runmake -C ${B}/tests/unit check TESTS=3D
+    oe_runmake -C ${B}/tests/regression check TESTS=3D
 }
=20
 do_install_ptest() {
@@ -45,6 +46,15 @@ do_install_ptest() {
     install -m 0755 ${S}/tests/unit/test_get_max_cpuid_from_sysfs ${D}${PT=
EST_PATH}/tests/unit/
     install -m 0755 ${S}/tests/unit/test_get_max_cpuid_from_sysfs_cxx ${D}=
${PTEST_PATH}/tests/unit/
=20
+    install -d ${D}${PTEST_PATH}/tests/regression
+
+    find ${B}/tests/regression -maxdepth 1 -type f -executable \
+        ! -name "*.la" | while read -r t; do
+        ${B}/libtool --mode=3Dinstall install -m 0755 "$t" ${D}${PTEST_PAT=
H}/tests/regression/
+    done
+
+    install -m 0755 ${S}/tests/regression/*.tap ${D}${PTEST_PATH}/tests/re=
gression/
+
     install -d ${D}${PTEST_PATH}/tests/utils
     install -m 0644 ${S}/tests/utils/tap.sh ${D}${PTEST_PATH}/tests/utils/
     install -m 0644 ${S}/tests/utils/utils.sh ${D}${PTEST_PATH}/tests/util=
s/
--=20
2.34.1


