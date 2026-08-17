Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CA9C5CFC1
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 08:28:19 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25684.1786955294901132124
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 01:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=gkqA29bS;
 spf=pass (domain: est.tech, ip: 52.101.72.64, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksHZ3Sh54YwrLhT9HCI6OsGGWGkTXmtbXO8B4PpX/5TixWY5NpOAR6vVoDMlQW+gjBzdea/23dsGzcJodcr8EL6tAaBM3yswseaH3/F+kNT3MLWjStwMDs1W0YDh77GBPAAsXiyEwnsOMfokDw8weythQiKnX8UeAIQ9AQtNBzZQsAC4OAa5ARb8gKXOZ8y1ZlY8tpaR/BkqJjJPwfzQ/i7d5x0YrelczxcZOAzWnu0hNVi2FF/JO8aNGyvoiWlOxQQmN79IShRjy/7IiUmInFUBlbmegimzPC8YZHvxqjjpiQ03IBakL8c5sGDlM8wgzUrOYdwAgTtLllwQveFTNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNlGT8E8aA3yDOInn68tjjOctQlzCvQo9jes3G42pXM=;
 b=bYv/QIiZdBsr2CDEeWJkYhz/V0wcl8xPYIRJX4rwHJc1u+EHSBzzO7xfcHFa7LGkzTDv+hQEuuflQBEhjsf1LcABqvnTdLNpy9aEVSSa9FVFAsGqDyXtBx1lKLM31Ofsf8DOlwe5edUtDPnEKvoQW57JXyOeVxfUoIlnikd5ihJzamPjKkc85isur/sDNv/FBLFuJKvRMdmcF6jpJ9gITj2VfEKKvlGSarHnOVZAL+4X7c1629ne4s2/FVMiX41228lh57sKVEDnXtFUatLdZqpK3lXjkduICrNKc+oBLSubl1vfbhAQLIPQnaVhqhElUVW/gY5hLKQNd1avx2Fi1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNlGT8E8aA3yDOInn68tjjOctQlzCvQo9jes3G42pXM=;
 b=gkqA29bSYflwOZ2RxoqjbvsyUOcy24dK5JRIccjO+5XvwCQBTK+CJzvBrPbv+HMxG+onW0gIe/kJ8PJWySd+zr9KcU58apAGkcwjPi0kp0Odg+rxP0FtK7DTz93IWdZfo06S+5+lFLu4AbhVq1KKAfHKZviRbpVY6IcZ1HKAgZ/7HMMR5XOxK3rWKCfo5JTZXg1Rt50YZafWGkakNDxgzcrAY2AcTnnyLTQFCCbCL86D0B2YBmnoYgw2Sk2QC58cLwh2e8fbJ13u6uv7LfAcU6RVhKOvfjLLoMW8cmVpQbvRcclzV7QzXT+5Lo7y0EGA9CX6LAYq3tXN1Yceo4rKFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by BESP189MB3312.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:ee::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Mon, 17 Aug
 2026 08:28:09 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0339.007; Mon, 17 Aug 2026
 08:28:09 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] procps: ptest: skip signal-based kill tests due to race condition
Date: Mon, 17 Aug 2026 10:28:04 +0200
Message-ID: <20260817082804.10609-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817075327.8764-1-pratik.farkase@est.tech>
References: <20260817075327.8764-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0203.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::28) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|BESP189MB3312:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c02764d-8434-47a8-b68f-08defc397820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|13003099007|6133799003|18002099003|22082099003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	Gg7N/6LhnvQKq2K9mHtdp1WippkHmE/CpprHA+NiCwcTrz6yu+NPVUxI2TAJcPHuozgiDLa/eEK28+RjhfgcWEQPQSTKBnDEhH8naDKfLyLs9sEnFr1cBGdr5OcsPaYJOOqr5WWu/vLWw4BQNlnQHYbQs3dkHkDrixVGLjsK9K/E27p2GoZ5tg8va2dJ36S0A83uPwKF8FFNPYi0doRuXlGyxFVAdsuGBcOjb8/cVpyTFm2iAZirBgmXo6yR2NzoMYJ1mBZyFKsrUKSJwPNn878K0cmRkl3Dv/dqU0o3BJKREwkBH3DeXpQB610lghqB944AHWur+J8FI4glwTi6/MEN3gsH7Vevhtb3jL7jsoPJCq5SxtyjRwDwEiOiv1ELi6vAwnXhMmy4L40oFSrIE7BhuH2G5ZVTOLTs6MFifqXojbylArc0zZjylZY8Y/XxKq2uk/+K+AYjyLq+q/6Xn4oQK0AIk+vhNmsvAEul0bQfT9g5h1Cp4zMwCiYvalP/WO9+GQ/TMw3ZNxtD4Mvy9ezAX9V0OezQOpSrPVlMD53iVLeCO3NsypBjjy0XetlkmOsEWfv/omcHfsBI9wBuog5UQSnlUXQd1jB+tdwyITuL9ZKpRZvqSQgIJ39R0aNeGre1I9zlgUfE6102/TksFsB/H6sbBbiiL9PGDxy2UkM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(13003099007)(6133799003)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hGr7viuvmb8ymsfYwznSuiwpyKyA6zrjm9gcmsOA4ku+FGnaEqF47yoFEk3Y?=
 =?us-ascii?Q?7wLoIYvO1B7w+e95tonkQPJ+Zj95KAHA6FIniTV72ZZKcbWGhOI7DiGIhxLR?=
 =?us-ascii?Q?lwnrn0OuOaUxytukJjrvl4YR4S2Xr7AJBWm5dTyL3EA9L9+yMZ7JZI8fpme6?=
 =?us-ascii?Q?ID94j1o4N2Nvxdu+6Qa7TSpjjF+bnXBo525ps/9oy27dlitNyDv9oL/Hy8N/?=
 =?us-ascii?Q?nxSu5LaXvKpvjdhqm47PczzSOjQijJDrK0bFXxUo0Ri39oIo6eCjsBMIvVEd?=
 =?us-ascii?Q?9U9UUPYU6kRRJypfxKGlNjakYuaNQ19eizG1wCZx6RLODYIYrMagPmX4QOZ6?=
 =?us-ascii?Q?t9MW3drNeu90rAYIhVgjhW0qv7QDOlcu95oNkF923fAqeaUTbOw2la2rB95Y?=
 =?us-ascii?Q?0QrBD4C+2R2q9M50ZEZUqOrauwCtOv79TTrkI0QDR/Y0r53qoruTsiMHifTU?=
 =?us-ascii?Q?9tbgXCUNR9c4RDiB2jSQTHLIEkw9t9PgYtbAqUncSi3DhiSbwPLEiXo7qZAW?=
 =?us-ascii?Q?9mZTMG2EJa0+TFUrlmF/5mvEwytJBcKCVx/OmnS157QyvVTu9khQrHbS23R5?=
 =?us-ascii?Q?cBIVO3Ah4HmdmePdWhuIsiLE3wFFVNP0CpwOraGyG9x3ulwNxSOoR7KKw4nW?=
 =?us-ascii?Q?oTav0WBHaHWsCxnYTX7PbzYU1OASjz5OiVSLPZBqRyBwt1hia+5vTVDAsgE4?=
 =?us-ascii?Q?9UbgqTDpId46YiVlTYlFU9KGXmVPtVjNqTPRfFOs8gRY4a3+dUBqekt2GN01?=
 =?us-ascii?Q?pmOK3W9gDHU8wd3wEOm4Y4lBlnDH9dW3OhR0xMehMr3xm5/dKw66FR3FGtjE?=
 =?us-ascii?Q?X/6M1MfyDlicGBFyoDDZ+B2aA6dcty9pWAGqsymiDqlnyvOMHXooYydW+Mir?=
 =?us-ascii?Q?t86oXohGgbW5mwpdrLTGPgk3426zyDbjV12jXYda7gFjlnpulIilu/LKMJAv?=
 =?us-ascii?Q?/SlK47ViOYKLTi0cw828OvlD/lS0KF7J4D4ArwehjMH6MV38Hl5/b6okBKs3?=
 =?us-ascii?Q?SdEputZaYu6gP49RDH/V7CdRcZmKRxPg7/ImZZHYxUsDawoX6pUei94Vcfjz?=
 =?us-ascii?Q?8rFuB1hAo6kfX19AP94KQwWGFcsH5NNG8z0wyVmyBS5TsJ1XCodsebkVBxh0?=
 =?us-ascii?Q?DJLDWQZ156PLsftJZWLsmBlOvqNlORLIrb6eMDZKZvEESEWQ2MTt6Shyw8Of?=
 =?us-ascii?Q?5vgtS6aPzUlLft/7D6k9BGR7v7GyYVVnEAx55aJDwqvcB8cTB24b07xosqL2?=
 =?us-ascii?Q?mTeJBl7meYW2KcNjT1mD0uCd/bfSPQx7zMZvsItOUlfkCecSvNbjcvl0IKce?=
 =?us-ascii?Q?Gou9Co/T9tNed4wKBrRg8u3tU+qm5RRLeIWg2HgLekJOhn+vEx0xEFAXM9jc?=
 =?us-ascii?Q?ZfmQn6JAKT1AaVTliE3joBgMKrRKMtn98Cr8D3QKz5fGJHUx3cz8vgirKMtq?=
 =?us-ascii?Q?nXfyPuTqYeeeHJjjtnf9M5wCbJLsHC7GsBxCHA09TtsUHGyTii0eL5lT1Zd+?=
 =?us-ascii?Q?yAT7sNJrEyauTig6rIAviQ71ZplyIszCXsqukHdEAD0GbzKNZgMffXiX1sC/?=
 =?us-ascii?Q?Wvz/0h6U1HKMAfgHnOqchtj1ETImuKgofQEIeTJPcital7ttPgds+x2s+RWg?=
 =?us-ascii?Q?Wd22ElWkGXgg+dTQG6SWojQguO6n03kOPnG73kErrxEJsKsQaCda40DAPhhb?=
 =?us-ascii?Q?aJiTeJa4/jipdjSKGiFjeAAd5czDS5ShlxCcG3z81sGuI+PhHGJNGJ+TLvLG?=
 =?us-ascii?Q?FP3znul6Kw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c02764d-8434-47a8-b68f-08defc397820
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 08:28:09.3084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNFtmlkX9XK6xffIwNzw3w6Y4CluWeBVDtnVuhCVhSPMI3PjURl+4lMpIOCIdJiudU26pdS7aIDmbidCVCLNfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3312
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 08:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243599

The kill dejagnu tests that send signals to a pipeproc helper (SIGUSR1,
SIGUSR2, and queued signal) have a race condition where test_process can
exit or become unavailable before the expect script reads its output,
resulting in 'spawn id not open' errors. This causes intermittent
'kill with SIGUSR1' failures on the autobuilder, particularly on
qemuarm64.

Skip only the three signal-based test cases while keeping the nine
reliable argument-parsing tests (signal name/number conversion, etc.).

This is tracked upstream at https://gitlab.com/procps-ng/procps/-/issues/42=
3

[YOCTO #16263]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
Changes in v2:
- Skip only the 3 flaky signal-based test cases via a source patch
  instead of skipping the entire kill dejagnu tool in run-ptest
- Keeps the 9 reliable argument-parsing tests running

 ...stsuite-skip-signal-based-kill-tests.patch | 54 +++++++++++++++++++
 meta/recipes-extended/procps/procps_4.0.6.bb  |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/0001-testsuite-skip=
-signal-based-kill-tests.patch

diff --git a/meta/recipes-extended/procps/procps/0001-testsuite-skip-signal=
-based-kill-tests.patch b/meta/recipes-extended/procps/procps/0001-testsuit=
e-skip-signal-based-kill-tests.patch
new file mode 100644
index 0000000000..6d28f5c36a
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/0001-testsuite-skip-signal-based-=
kill-tests.patch
@@ -0,0 +1,54 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Pratik Farkase <pratik.farkase@est.tech>
+Date: Mon, 17 Aug 2026 08:00:00 +0000
+Subject: [PATCH] testsuite: skip signal-based kill tests
+
+The kill tests that send signals to a pipeproc helper (SIGUSR1, SIGUSR2,
+and queued signal) have a race condition where test_process can exit or
+become unavailable before the expect script reads its output, resulting
+in "spawn id not open" errors. This causes intermittent failures on
+loaded systems, particularly under QEMU emulation.
+
+Skip these tests with 'untested' while keeping the non-signal kill tests
+(argument parsing, signal name/number conversion) which are reliable.
+
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16263
+
+Upstream-Status: Inappropriate [upstream ticket: https://gitlab.com/procps=
-ng/procps/-/issues/423]
+Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
+---
+ testsuite/kill.test/kill.exp | 21 +++++++--------------
+ 1 file changed, 7 insertions(+), 14 deletions(-)
+
+diff --git a/testsuite/kill.test/kill.exp b/testsuite/kill.test/kill.exp
+index 49bac96..30a602f 100644
+--- a/testsuite/kill.test/kill.exp
++++ b/testsuite/kill.test/kill.exp
+@@ -45,21 +45,9 @@ set test "kill convert signal number to name with space=
"
+ spawn  $kill -l 1
+ expect_pass "$test" "^HUP\\s*"
+=20
+-make_pipeproc
+-
+-set test "kill with SIGUSR1"
+-spawn $kill -USR1 $pipeproc_pid
+-expect_blank_continue "$test"
+-expect_pipeproc_pass "$test" "SIG SIGUSR1"
+-
+-set test "kill with long SIGUSR2"
+-spawn $kill -s SIGUSR2 $pipeproc_pid
+-expect_blank_continue "$test"
+-expect_pipeproc_pass "$test" "SIG SIGUSR2"
+-
+-set test "kill with queued int"
+-spawn $kill -USR1 -q 42 $pipeproc_pid
+-expect_blank_continue "$test"
+-expect_pipeproc_pass "$test" "SIG SIGUSR1 value=3D42"
+-
+-kill_pipeproc
++# Skip signal-based tests: they have a race condition where test_process
++# can become unavailable before expect reads its output, causing
++# "spawn id not open" errors under load (upstream issue #423)
++untested "kill with SIGUSR1"
++untested "kill with long SIGUSR2"
++untested "kill with queued int"
diff --git a/meta/recipes-extended/procps/procps_4.0.6.bb b/meta/recipes-ex=
tended/procps/procps_4.0.6.bb
index 2437be1c3a..5cb5a2831d 100644
--- a/meta/recipes-extended/procps/procps_4.0.6.bb
+++ b/meta/recipes-extended/procps/procps_4.0.6.bb
@@ -15,6 +15,7 @@ inherit autotools gettext pkgconfig update-alternatives p=
test
 SRC_URI =3D "git://gitlab.com/procps-ng/procps.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3Dv${PV} \
            file://sysctl.conf \
            file://0001-tests-Disable-twice-total-pmap-X-tests.patch \
+           file://0001-testsuite-skip-signal-based-kill-tests.patch \
            file://run-ptest \
            "
 SRCREV =3D "4dafddf4c3f4646caa517f039a2307e92657ec93"
--=20
2.43.0


