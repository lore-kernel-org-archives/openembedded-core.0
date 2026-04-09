Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5098EE98FC2
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 09:29:59 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128077.1775726989038259259
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 02:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=ZPYm6KxT;
 spf=pass (domain: ericsson.com, ip: 52.101.65.11, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fp+m5XvjR9esxYQz+MGjAj3m+cscVpQ6Qg2g8HfXYir180scNk36xfCTX+nMFfpGOqM7zTjMfsy3Haf+KJ3u/Ct4SVO2EWUuqpnBz0a45CW09mzuKYqkBs14H8vf+xSKO+bw2g/x+TuQ52EIx51/ewuGdNR4Q/UO+A/GWMnDyJDH43gOafTQkv77XrbllSQ71QJ/9aWaEem1KkOJulviWxRn90swMn8mKAlrMtHh4mIgltCxCARdqx/kxwZNF2SL9/kgqebN0JppCVsnvcn2hXMxumroYvpWD+NUEHKZyorTIx0BbO1WW/hOWDkWDErG1BGsmWz+0u3Lz6Hvwx/Obg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjUnBfYo8UBssVdm362ZNEi+9SB25PI1zYHWS1beE6c=;
 b=XDcsIXSIAlRi7/+XCMI21oXMnBwkd2rW4bbCSh6xW8c36Ms6xUwjHO32ccVq2V5ip/NxJlRMBTKFJiIqi2vq4OHbGUIpzhPsCuexD7+e5bB+vTMuW1Qlm6oZO17lf52jEu6GjMS+1L4UKdhNZg14J8yJAYd41bIMNo+7jMuokC17ZoH14axhopQjni+m0QYbxRdnuQ7+XKcsjugnXl/+czhbqFVpTk6zgy33lh6XinGMkYHMjn051IL67Yvq1w1gbFlrCaxUIBi2hTDfy/Uqu2ZPwWP6pg08C3UkRZgJxyLRKxG8wQtMCTxYoOYIQ4Ng9kTP7c7814hdql1BkzTM7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjUnBfYo8UBssVdm362ZNEi+9SB25PI1zYHWS1beE6c=;
 b=ZPYm6KxT6KN6qzE2X8FlvMN3BJz/elUG2kbR7jFBQSjpZQQKJbIT/X6fWWhHVolmsv1HrHrS+Y+aYkIvcXJfb2IDCi4FKTZZWXqoTf0SJLa0B/wG7CLrw4do8DaqiLWW6n/J0eDdDGVhE7IBttI4Yal6sPiD7FCDb39NHPqDdPE6aaPSKYfSgnn5zoWlIwhdOZ1OozRAkyKCw1aLbU34yOVqRd64nvRjPjqLorYdYhtZHaobgBPbPxbcTMkTPNMJ+9hBCz2CDRDfUzXTJwb7CSbGKwoisCdmdriI4Yn/As2BMpzQQgChqxOODjYLIM+glCNc7+R434iYBaMsxnkRdg==
Received: from DU2PR04CA0353.eurprd04.prod.outlook.com (2603:10a6:10:2b4::13)
 by DB9PR07MB10994.eurprd07.prod.outlook.com (2603:10a6:10:5fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 09:29:42 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::41) by DU2PR04CA0353.outlook.office365.com
 (2603:10a6:10:2b4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Thu,
 9 Apr 2026 09:29:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 09:29:41 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Apr 2026 11:29:41 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 1AB754020675;
	Thu,  9 Apr 2026 11:29:41 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id EF21D700DF4A; Thu,  9 Apr 2026 11:29:40 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [scarthgap][PATCH 9/9] numactl: upgrade 2.0.18 -> 2.0.19
Date: Thu, 9 Apr 2026 11:29:36 +0200
Message-ID: <20260409092936.1740143-10-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409092936.1740143-1-daniel.turull@ericsson.com>
References: <20260409092936.1740143-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9F:EE_|DB9PR07MB10994:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ffa2aa-ca6c-46a9-53d6-08de961a876f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	ON8lNa+F0GDy2yELroeuZHjm1oq7+R7Ahroq/+PyZQOSCjctjenThpGwfOh64dILE0sMsndBQWXNkHvHgvzS797/xUfQkcT0mw6mcVeGalIA01gAHZXRs/36xgsWw3KxbBUt/oZ1GftBU9+jgfEdXDx/IHEAlfkFa0YjQTRzJFkzGtBC6hTAqcqQnkjLoCz3TNYW+Lo6x4upUIqSlGGScEhIki1NuWV2zGDhmQBEqKyqVjwwPzghpxSqz6hE5VzIfHXNn3NSkNKE5oyLrL0X8rUg1bsHoOVng/DnXRTtC04oIWqX0N4N0F4exdqYHKBT5ejemK6a0TlDy761j0cd1ZAxF29NKgJTHdJU9ov/MHvqhIsdYIHapFhPlg9cHRvslMnVfbuYVOvkHkrx2wMvT/BTpnRe0CtvuI4tXAXtwtbY7AmuypO5DnzL2aEh5HzZU8ATXxoIZmLpAlCk08J0wq+q0o/oSirn8I9ZqDwQBY+IDuWEcMHl05TYveMXBNaFhPbrhmfpGb/b9PRLft3R4WD0cYegK/7ldXJhVCyF3rNjuaEo72GWv8DX2kb6OBndtRHQtEHRDRuyO0KKMQy/Zvewqs3QfrOqch9Qzsijrly3nXU/IRAK42+28SJUI+rpAQqsafqILLvFNtLSz8JmhYrshkOPAbnrhn+uUO3I8Z0aKVm7KqA4kXazIsx2apu0NsgjTdzpRiCQx+UeTIt92lgWA9rXQWrx37PlxnBlfglSd3FgQXpYFCpih3bIlTfD0aPj0M4L1vsaw/O99wc0mw==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KBtYvbPT/5RvPRQgcNpOsPWjpCTG4pyaGwA0lAeYxdxHtU32NhyjnAfKdzw39gUib86g0JK8oiT9gWYo0myUT+28E4ggTlZTOf/Ka1rXqgrNjce6efdCayfArdrTF5w4/6MDLy/qv63XufxZ5jgUSdzPGF5E0ttBpfb/eo/kYOEQsHLUaM9xLXFSJj23L/qk984aGFYdSB2oVEDDh7tquDu6k+xdvIPFcnjSBoxnVLgM/V5WMmdM6/UyMuAwqoEffCbGsafuaCly9tkapboWE3yF5rDa0ZizPUQbHRkN2mAm32bZ2Eizxr9b0P09EpvZVw5XCLJvATctHnzOreDrRWG584snSFrHWqmXm4XnzAMr5SzKnrWOQWfDe5NAJv2L4cTIk+sxFU9ainyz5zHcloATnKNy540uD8HrZkdJISZgDc0xc1qDJN+Gm709AT1m
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 09:29:41.7882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ffa2aa-ca6c-46a9-53d6-08de961a876f
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB10994
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 09:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234904

From: Daniel Turull <daniel.turull@ericsson.com>

Changelog for numactl: 2.0.18 -> 2.0.19
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

3bc85e3 Regenerate configure for new version
ce049c0 Increase version number to 2.0.19
5f77ffa Set version number back again
9d767e8 Replace fgrep with grep -F to fix warning
3361a63 more unitialized variables
3a281e1 Fix unitialized variables
0ab9c7a Make numa_available respect EPERM
6c14bd5 Save and restore errno when probing for SET_PREFERRED_MANY
f9deba0 libnuma: fix nodemask allocation size for get_mempolicy
81c9a37 Update numactl.c
8c454ec numastat: eliminate hard-coded tables
87342c3 Don't fail build when set_mempolicy_home_node syscall is unknown
4bfdcc6 numactl: Add documentation for weighted interleave
ece7e22 numactl: Fix RESOURCE_LEAK in show()
119eb59 numademo: Fix the using of the uninitialized value
b67fb88 Add -w and --weighted-interleave for weighted interleave mode
a7552a1 Fix fallback for set_mempolicy_home_node syscall

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../numactl/numactl/0001-define-run-test-target.patch        | 3 +--
 .../numactl/numactl/Fix-the-test-output-format.patch         | 5 ++---
 meta/recipes-support/numactl/numactl_git.bb                  | 4 ++--
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-support/numactl/numactl/0001-define-run-test-targ=
et.patch b/meta/recipes-support/numactl/numactl/0001-define-run-test-target=
.patch
index 68b3e2491f..26026d5dba 100644
--- a/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patc=
h
+++ b/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patc=
h
@@ -1,4 +1,4 @@
-From a5e1fa272f294e739d6caaf629968478796ca53a Mon Sep 17 00:00:00 2001
+From 90bcc37f12dbf7917b5edca24683a08d483d7bfe Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Mon, 19 Oct 2020 14:42:11 -0700
 Subject: [PATCH] rename test target as run-test
@@ -11,7 +11,6 @@ not suitable for cross-compile environment, so rename it =
as run-test.
 and define test target to compile the test files.
=20
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
-
 ---
  Makefile.am | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-support/numactl/numactl/Fix-the-test-output-forma=
t.patch b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.p=
atch
index 8345f71d72..ad90528669 100644
--- a/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
+++ b/meta/recipes-support/numactl/numactl/Fix-the-test-output-format.patch
@@ -1,4 +1,4 @@
-From 29f811d9d381f2ab54b3c8cef77334e32970ef09 Mon Sep 17 00:00:00 2001
+From 0ac2863bc3d7e576ef948ec729e13b8db68b7e36 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Tue, 21 Jul 2015 02:01:22 +0900
 Subject: [PATCH] Fix the test output format
@@ -8,14 +8,13 @@ Upstream-Status: Pending
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
-
 ---
  test/regress  |  6 +++---
  test/regress2 | 11 +++++------
  2 files changed, 8 insertions(+), 9 deletions(-)
=20
 diff --git a/test/regress b/test/regress
-index f06b22f..2fdfacb 100755
+index 1da7784..b0f06ea 100755
 --- a/test/regress
 +++ b/test/regress
 @@ -78,6 +78,7 @@ probe_hardware()
diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-sup=
port/numactl/numactl_git.bb
index bd16df91ec..172e6e964a 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -10,8 +10,8 @@ inherit autotools-brokensep ptest
=20
 LIC_FILES_CHKSUM =3D "file://README.md;beginline=3D19;endline=3D32;md5=3D9=
f34c3af4ed6f3f5df0da5f3c0835a43"
=20
-SRCREV =3D "3871b1c42fc71bceadafd745d2eff5dddfc2d67e"
-PV =3D "2.0.18"
+SRCREV =3D "3bc85e37d5a30da6790cb7e8bb488bb8f679170f"
+PV =3D "2.0.19"
=20
 SRC_URI =3D "git://github.com/numactl/numactl;branch=3Dmaster;protocol=3Dh=
ttps \
            file://Fix-the-test-output-format.patch \

