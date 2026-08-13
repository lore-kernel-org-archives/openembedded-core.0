Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494E6C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 12:30:02 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17945.1786624197503600211
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 05:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=uqEIgnbP;
 spf=pass (domain: est.tech, ip: 40.107.159.64, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwA1ecKMTwwRtmKSc+whA+6jsuXEreBdcqVI8CWF2k8NsliQODNMwePyUUYThCq2iDjZWuUS4ComqzG1fPymYMTeRwZnkbbW7uc7AcR6uw9q03Yo0TdGGIFAUCTjrr3k+nbhyheMipiodg+DBqUKhlkPM8TFvQ57buI6+E5GdMQjGkeCX4h3jlIzoRBoi+EQRVaybqZRJZ7lKGCYrRnLHpguRQQUfsNXgV5RRBrqbDQJugeBegYxCITYJoG9WIIp/nNMlECu+7svHAHOWnNRzY33H2bqPmehL1wpOiQKyMmGgDxb6ZffVYaqZCIDccKP9Ka7rNN6HB1Ufbx2H4ENQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJ7QMmdrMM105bqsrZo0Yh9YQDnEApmE+zgRMyJV/0s=;
 b=fy5tTK+Wgi1HrZUkUlln0HL9+WnAN6VNg4QUq83Sy6US6aAZV+WOFrwps9yBSwFNU6vp/HQnTGbXg60bC5SwbjT6qOp19RkHoZH9P4qitZi+a5DfDKQLFXJIGRuad7+e1jzb8lIMttojqq7Prri4SmECicBafUcpIp9y0MdzHPrkVVRL4FiRF1UyktRGteVlnG81bklMBv8rwD5/k88wpIsIWFc2nJCagGjHnrfHV1uvy9WqvlG/xmVtuck0tklu6yHo4OCGQtkhMdVqy0xO8z7ELVsoLLJyTde0phqIC79uX73MSYwEjtjUJcJTDLFaDy/ueragOiroZyGJ+H5JAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJ7QMmdrMM105bqsrZo0Yh9YQDnEApmE+zgRMyJV/0s=;
 b=uqEIgnbPsFFDklKcDVcV5MYOOTlyY8wYS/68V/a/6bFv8z9w2t9GfRzKX7Oo366Hpua3ZqP8thCgGU+mD9nTs4t3vz+wVyhbbSs6/OhIYwBKjkP7V9h7oEkLjinzCaKhoWIHtsKwpxBUPecBorqEjvdORU+yL9SCBFDA0qOpBTw8SI+ZQUomS4xsGwgVNSJ4aZvnnuYx3DM13bMWB/rl/PHeYD37Q6MXjcA7YLa47EjKUyGsXgLWBmkwvhOlPqKSkXc+0NFTeJIy0wvKF6k9WAeoihWgEvFaDdsUx0FDy7to4ASUNl91X8Jd4wLi8M2UMGbBt2BPUSiHfUQuf7k83g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS8P189MB2491.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.5; Thu, 13 Aug
 2026 12:29:52 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.002; Thu, 13 Aug 2026
 12:29:52 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] procps: upgrade 4.0.6 -> 4.0.7
Date: Thu, 13 Aug 2026 14:29:48 +0200
Message-ID: <20260813122948.31734-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0447.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::20) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS8P189MB2491:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b29aee0-d802-48dc-7d10-08def93692ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|5023799004|11063799006|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	CGa5Pwg7ouXudLxM7OnbLKT3JK2KgpdNLq3SDEHR8dG2m6aomaYKD5DE12nhnXgjN3asJgbb32/u/OIF1w/lHK7urxIGoCvJ2nMm9EI9TPiqc1NF8mGQHVd4JBIGphpOPmO6z2qwSSOXnXHRYaqDBOq14khoGkKNkOH7bYrcTzgpkt6Hwfh+y7jfB38SQTFJat3JYLpQp3wYZqHOyE1sG3GeEIIwxc2/JbCT0hWeCT5i260mTzrSWhtKFSZwUk4+FuIntf8190DORgamB2EABvziS9QQwtjWssSsicb1B8+5VrwozPIz2izJKsjAVZ28xF0ZyEo4ll24wHTLkQJXF9CRc//zINQk9+IF59asyEi8WC08zHYz801TLWWNsXYo30eNk1Mhym2lu2QkO6kvi+IEDzquNPsFIaN9lsKfUoBEb/HLRyJ113jdhcbfsZlm3I8MCP+I85X+ZNxL5pxdeayVpILqpQY+Pzrq+iPsekjeKFdpUnuKteyni0Zo7TYSDsoehflJaUvDP8jq5FPpXLuU+14MtzgqifeJ1oOI0sClhBOJzEwx4fpwQuM9zc4tCmYNQrLwVC67lUh0F30gIok+uMOVisYOvOmkYo3joPFpZKUbZxz6h0dAhPOCYedH4EZpRV6DgamExDfAFiFF/LgAtRlmDqhMWX8KTjHFEeE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(5023799004)(11063799006)(56012099006)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2ILbbFHDGZ+jA4B8J2qw2TW+QBBcNJp0DCwbOS9HbP9aw+uq7NGFXyg8KsGX?=
 =?us-ascii?Q?yMS0qfy7GH89JqXXE4bXpAi4f2qREQhL8VVkYVFSUSKhGT2sYNYylwMJS+Kl?=
 =?us-ascii?Q?2yx/zuSJgRO2TERCA+g4FCVSHVnOpaZN1FDvOBo0NKSTGDM7ErQr2jAcBP9F?=
 =?us-ascii?Q?BrTPLOji1MRJ9ocCYI8oKmK7SdSfNNi+SZhGkX/+KEjRDcWtAQHGDqKQC8zZ?=
 =?us-ascii?Q?FXqyeN/Vquqr174jJhpiS3liYi0C2pnc1wcFT/CVbMc/G58+x2RvLfnVi52v?=
 =?us-ascii?Q?Niay+bSgvzKIUhiKRjLO4gOYmH6w/3B0UscRs4I4GY+RU/V4aESAZsTVAAe6?=
 =?us-ascii?Q?GoibajyXLMV7+ruX6BbIfc+KKnOVZzbA3QzoA7m3F3oc68eacoDgPEao8Pnv?=
 =?us-ascii?Q?+uS6d9L0HvD3ulQVtPtwY36mlC7sfbleSQQKYUv79U9fhB2L6+JmXGo5f0ze?=
 =?us-ascii?Q?hltVwwBEGgyQ2ttJRHuuM9NLvmQkgxB6V3FaDyMEwgHFHnkNuxIPk5MyjKpb?=
 =?us-ascii?Q?3GFRmwamhKbC/fgHdjR1RyGErMen8Qzdpb4zxgyTyRNNb2XVypsqKxynPkT4?=
 =?us-ascii?Q?2nD3nGvU2AiFxC1NHQ3BPVOdcsS/cwi0CfX769RkbLMnZOxWzWhoSpIiZup4?=
 =?us-ascii?Q?fvXR/4BYvfSb+imq1NGKnnjUBapi6fHqA4w+zB++b8wOShiATc+s2FnQp2gB?=
 =?us-ascii?Q?zgcDCMc+n1ZNaDzPGwPQaPG0HMNo+B/A4MSG+X2x5+6bqsK3iS0zTUimkkJO?=
 =?us-ascii?Q?Ii34PKobbphFCPqspTH4kdfV/SI3nIqVrxF/1tHBNoXoo/6A3YW90urb1TsB?=
 =?us-ascii?Q?lbJx0rSvNyoSuBuPK/scLRK5jLPodYloJXYNgMl/SFcdrT0QNfkVT/txz4hC?=
 =?us-ascii?Q?fiqq3qy6ND56xE+2PerGj12WYLGKQgeP4+Vg/GLFTbesTJ562GOaxBfZWSrt?=
 =?us-ascii?Q?JDSJ0/SAQOhX4TH1dgY3PPwgVOXSb+LfEj0wynMBDe1rplTY7rq8GrcMcd1O?=
 =?us-ascii?Q?ajtfLzDiytYl+yf8i3hClFeuFiYb37+aksyyv11hhtdXgHQ2GvKeoL6JjMRa?=
 =?us-ascii?Q?wy5j2O/D1T2wOskpcF+lv+EpdFWKRnsU86CdPSy8cy2q1yYsu7+QLF+yU6L5?=
 =?us-ascii?Q?Kfik8t+FMOZMfRCsO6yjuzsdQVwuBYhi58TGZKd63BnFXXMifOF14X7s6LoA?=
 =?us-ascii?Q?JLA9xDCfF5xlMOz0zjgSOn4Zsfj3xy+p+38x6oWJNNaWNVxZ8F11sIVVqDBU?=
 =?us-ascii?Q?hRue7GBkz8bQXZPrAPDwMyP97nFkLOJa1NinWfdVXiNmZTvHBcDNlPVmnfea?=
 =?us-ascii?Q?PsEJkKXNDpUtuPj0DbaAM0jJVS3pznl1tB52PEkiV2VOadB7r8KETJG6kUlW?=
 =?us-ascii?Q?gqaNU78cBWiCi2dCK4qRnXM56c5uHFuamYhMeyzWpMwxwvrtqt8g35SDVS12?=
 =?us-ascii?Q?wASe5zgTZUr46Z2rwp1kpMfwKZbAXRpiJt4fmo0C1Wh3lczIrzI+bHfngbeD?=
 =?us-ascii?Q?5vnTjRaGP33wXyxv+4R0g7uPflcBphwJoEDF6oqedv9iYdWjZxUMFz6jHNWL?=
 =?us-ascii?Q?Dhi736iZde7W6Gpj1kOvijyxazrfFSYlHRfXMM+qaDeAy53XU5yzCDqjgqXu?=
 =?us-ascii?Q?illEPfCqVFKbTgSbS2xv4PLabLQ8qsa5WsISYyqkoxrY2bkCSbGndCuctNJN?=
 =?us-ascii?Q?891nMHjNPS7r+Y9Dy1rRPJbmAsrEr/nLuBHMtZ1gc4hbuRe5nlGGTWi6uQT+?=
 =?us-ascii?Q?UCHjkVatIeCUyHBgWbqGJJ1EaJCiHpo=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b29aee0-d802-48dc-7d10-08def93692ca
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 12:29:52.0594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LxbljxLWK+kND5A9wCqK361SkgLTEjOiqBkuzIC+Rkai/o/SIBkzm2NfIvKtelL9Wfu04f0cqdDV+iGU57gTrXn347KHWopjFfV53Yk6knE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2491
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 12:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243351

Source: NEWS
Release: https://gitlab.com/procps-ng/procps/-/tags/v4.0.7

procps-ng-4.0.7
---------------
  * library
    version: inc revision to 2 now 1:2:0
    internal: procps_pids_length off by one                issue #412
    external: fix slabinfo header extern 'C' declaration   issue #415
    internal: fix file descriptor leaks in <pids> api      issue #421
    internal: strv items are now escaped in <pids> api     issue #429
    internal: fix output if on seconds edge values         merge !246 RHEL-=
60825
  * pidof: Add -d aliased option                           issue #418
  * pgrep: Don't treat empty list as 0                     issue #427
  * pmap: Fix testsuite for Alpha                          Debian #1141465
  * ps: correct 'environ' output when file unavailable
  * ps: minimize potential EACCES with 'environ' files     issue #431
  * top: avoid batch mode segfault with maximum width      issue #422
  * w: Correctly check for end of tty using utmp           issue #430
  * watch: Dont remove 2 lines when using -t option        issue #413
  * watch: Handle resizing better                          issue #417
  * watch: Restore LINES and COLUMNS env variables         issue #432

Remove 0001-tests-Disable-twice-total-pmap-X-tests.patch as the fix
(upstream commit bbe21e141b77) is already included in the 4.0.7 source.

Verified ptest on qemux86-64:
  PASS: test_escape
  PASS: test_pids
  PASS: test_uptime
  PASS: test_sysinfo
  PASS: test_version
  PASS: test_namespace
  PASS: test_fileutils
  PASS: test_strtod_nol
  TOTAL: 1 FAIL: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...sts-Disable-twice-total-pmap-X-tests.patch | 55 -------------------
 .../{procps_4.0.6.bb =3D> procps_4.0.7.bb}      |  3 +-
 2 files changed, 1 insertion(+), 57 deletions(-)
 delete mode 100644 meta/recipes-extended/procps/procps/0001-tests-Disable-=
twice-total-pmap-X-tests.patch
 rename meta/recipes-extended/procps/{procps_4.0.6.bb =3D> procps_4.0.7.bb}=
 (97%)

diff --git a/meta/recipes-extended/procps/procps/0001-tests-Disable-twice-t=
otal-pmap-X-tests.patch b/meta/recipes-extended/procps/procps/0001-tests-Di=
sable-twice-total-pmap-X-tests.patch
deleted file mode 100644
index ec26af92fe..0000000000
--- a/meta/recipes-extended/procps/procps/0001-tests-Disable-twice-total-pm=
ap-X-tests.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 56505e2ac9b703aac979f0849814ab7c83af57e2 Mon Sep 17 00:00:00 2001
-From: Craig Small <csmall@dropbear.xyz>
-Date: Mon, 9 Feb 2026 18:19:35 +1100
-Subject: [PATCH] tests: Disable twice total pmap -X tests
-
-Sometimes the memory count can be just a little different
-but the test is equal, i.e. must be the exact number.
-This means sometimes the test fails.
-
-This removes the pmap -XX pid pid and pmap -X pid pid tests
-for checking the result is the same.
-
-Debian buildds this test never works and has been removed
-for a while.
-
-References:
- #409
-
-Signed-off-by: Craig Small <csmall@dropbear.xyz>
-
-Upstream-Status: Backport [https://gitlab.com/procps-ng/procps/-/commit/bb=
e21e141b77398586c90884a43ff75996b83843]
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- testsuite/pmap.test/pmap.exp | 15 ++++++++-------
- 1 file changed, 8 insertions(+), 7 deletions(-)
-
-diff --git a/testsuite/pmap.test/pmap.exp b/testsuite/pmap.test/pmap.exp
-index d37b55e5..6fb6fa1e 100644
---- a/testsuite/pmap.test/pmap.exp
-+++ b/testsuite/pmap.test/pmap.exp
-@@ -93,13 +93,14 @@ proc expect_twice_total { test } {
-     }
- }
-=20
--set test "pmap X pid pid has same total"
--spawn $pmap -X $mypid $mypid
--expect_twice_total "$test"
--
--set test "pmap XX pid pid has same total"
--spawn $pmap -XX $mypid $mypid
--expect_twice_total "$test"
-+# Disabled twice total as there can be a small change issue #409
-+#set test "pmap X pid pid has same total"
-+#spawn $pmap -X $mypid $mypid
-+#expect_twice_total "$test"
-+
-+#set test "pmap XX pid pid has same total"
-+#spawn $pmap -XX $mypid $mypid
-+#expect_twice_total "$test"
-=20
- set test "pmap finding shm"
- make_testshm_proc
---=20
-2.34.1
-
diff --git a/meta/recipes-extended/procps/procps_4.0.6.bb b/meta/recipes-ex=
tended/procps/procps_4.0.7.bb
similarity index 97%
rename from meta/recipes-extended/procps/procps_4.0.6.bb
rename to meta/recipes-extended/procps/procps_4.0.7.bb
index 2437be1c3a..37a27e960d 100644
--- a/meta/recipes-extended/procps/procps_4.0.6.bb
+++ b/meta/recipes-extended/procps/procps_4.0.7.bb
@@ -14,10 +14,9 @@ inherit autotools gettext pkgconfig update-alternatives =
ptest
=20
 SRC_URI =3D "git://gitlab.com/procps-ng/procps.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3Dv${PV} \
            file://sysctl.conf \
-           file://0001-tests-Disable-twice-total-pmap-X-tests.patch \
            file://run-ptest \
            "
-SRCREV =3D "4dafddf4c3f4646caa517f039a2307e92657ec93"
+SRCREV =3D "66b48a3720d46f304f0fa76f720ca925fa48d97e"
=20
 # Upstream has a custom autogen.sh which invokes po/update-potfiles as the=
y
 # don't ship a po/POTFILES.in (which is silly).  Without that file gettext

