Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DEEE98FD8
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 09:29:59 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128078.1775726989906597452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 02:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=jScyZr+S;
 spf=pass (domain: ericsson.com, ip: 52.101.83.62, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUeCUH7Ke4zpwwwf0zP1ByoPwGekKXP4XNwXEgELPNH5LZp1z/E/B/xdj2UNzunTrfw+fwYMUZcK5tYZ8WE0OKPIPGJIE53f+qFrPu371pmD54cAGvsTIWgQgrHcszPidviCSMDSP7Aj9rWLRnBajPvPK+/yL5WMbhQ9e7RsHUv+z15ztBKf//4bp33q0DRolkcoN3OLNWDSysGx89ydMHCD9mqZUgePDmo+uZDAJ90r7FL4XRSNI4AYPjOTUMNP3sX6cUqteY17wgane6eqcJNvnc/WgkLBRjNaeXgfYQ03kluhgAbXB7kK3a3V/PKUa6RTjSIPceuF6ASDwrM8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7nQU97z7LbYO3xYiBMMNtARYBoORUnwKqJepnzFnXAA=;
 b=k8Mc0tXccjgUPukDGUpcISKCHYIPIXbJfBuZkfj1KmnFixF9L2kW0HWcXZQZUffiPfSbBE7GCKLa1+1ixlkuyX+bsjsFhz+Xrut+aF3EB4IAwf6ZkSInVHUPO7vxrueNYpFxeNvfQh5ChchClxYZP9erNyE/i+Ls0dD6eHJVmdcplgTyzDYK66JcOQZSMJ2U+3f2X9oAarm3P2aqdp26z17ffal9BpTu7x2uhVjrPiaiE4VVwLvmO8abyV0Waas3C3cluuH+n/RDSjiZEegZCP4+w0NYE9FLaXI4K21JpDi1XNs19oOkFtXM6C+tkNrRke7+E2mxsdom72Vo6kIxcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nQU97z7LbYO3xYiBMMNtARYBoORUnwKqJepnzFnXAA=;
 b=jScyZr+SdiqwAnZRaiBsN3NnLPNSt2yViRMhcVjUyDZQ/NT6c8A8wt0G5WnZoTkIke2LX8B5PsABCwPoXIxf+mDHQ0/sQXBk+WIcUS1TiDhFQrJdqH0mbuN5+pw1dCEK+wyWXmg5j3wY/t/ne2T8e9gwmAaGtCvY28q542tdMc9390f3VyrWHvRCwQaErPZ9g1DPysFDDU9tqTmvMRlatycI5Ac21qhsERWR33e1amqD2UeipFinmq0LufYTePe7r0sHCXipZBK1czz0HxtfOvLH+am2AYhxoGkCAgtkesNPHhEB98Pt25N/I5w3ktsABeBN4V9QT6G+acSSPB/u1g==
Received: from CWLP265CA0447.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b7::18)
 by AM0PR07MB11605.eurprd07.prod.outlook.com (2603:10a6:20b:6f8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 09:29:42 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:400:1b7:cafe::d3) by CWLP265CA0447.outlook.office365.com
 (2603:10a6:400:1b7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 09:29:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 09:29:41 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Apr 2026 11:29:41 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id EEF469569E;
	Thu,  9 Apr 2026 11:29:40 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id DBCBA700DB95; Thu,  9 Apr 2026 11:29:40 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [scarthgap][PATCH 4/9] bash: upgrade 5.2.21 -> 5.2.37
Date: Thu, 9 Apr 2026 11:29:31 +0200
Message-ID: <20260409092936.1740143-5-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409092936.1740143-1-daniel.turull@ericsson.com>
References: <20260409092936.1740143-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AB:EE_|AM0PR07MB11605:EE_
X-MS-Office365-Filtering-Correlation-Id: b749aef4-3d02-4d82-77f7-08de961a873e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|13003099007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	mVI2OtYuAvN2E+iV8W6dfoWswQpJ1H8xeeeWm1lCJ7z0Z3cNVRd5HZi5dlCgpO4yJw817xa7wGNOtw9g0tCpTlIJeht6kXiilmv3nkKtI/ddNhPpnq46txCTB8OJ90oBgqDHi42UVqxJfuWKtiFhf4LCbse2zcZP7gvrU0KWBFmnRlLmgZThw1Pex6N/HAeV+vxzRWlIKR2GEupDL4ixD7RSWIGOYxA7g8bl20B8a8SMdUdLXZQRKVSkLGPl9vSZ8OIyh0nTzloHI1UzWyeiEAOEDhZUuSDISW9i8cn1vt9DvIjevZeRV/DM7BiFRP8ylZTzQxLIOQuVLqe69dBLiIG1ax8WH2xQwEnN1KxA9f5HtFausD45IQAQIMA6W2d8CL/F/UNhrDflet77f4IfPigJhZCK9zG5n95s4i7z0Oc/9mexdmbszLpJFzWgUCWGp7QVhMaqqoDElEUQpW5i0tHziip2XYq21PBpENZQgrgEpPAzXX37FKc3mTqhCtYu2VgnpN01HyW4UXW0CkJA2yuhfEkWzumWuohqKtuFRE2Xbn9DoJ6cxTf9dJP5Jzj+AhDO5nP932OQuHW5shwCnF04xW/HCre0jJYxUDQqfKjMX96a+QhFUEWBnaMDV0rs1eZbYUX+BLNg4ViMwYTVNmLkk5JjJmHztuvfTHsIGuDygJrCZmWy/iKsGaNO2wqp74C057XJgwvC9trhLOR02IDj4xVlYLzG/7r1o1aFQEA=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(13003099007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	t7AJCHX9fPLnjkRy8Dq+4vm+hqksebwZjkm0RhV2Km889XMqSJ311mDVd5Sr5WboWtUsAYFz+J47AKD14kBanr7vYvmAUYhC+LUrO/Tzf+fbIcLx0v0aF5S1B7YPXauSB1s2CxgsL7rzg9LsXTnKDCImPZR4WfHGbIhzzfVmdKp70JvJbcy/gkq2Ml2HKHHeDevXbPyNkFgU8mIoqHckB9X5UPsIRbGekUiFDgqO8iNlNM+DIe0jMKDdumnNpCE4CacfcusPHY62DkqjqUABuBAB5B2sC5peaXFTx0nSQPQ6LpLHGDRzL4sGa4x0rvfLHpzUnPVuApjPMN0w7a3ZzX52lU0HVzgEyRySvboFeYA18qxei8iR4u/GyNqdaIyzEJBzjSYa1QloGqTRu9ajqfBFkAp4Rs0pl8kZdhjMxwVYRFzbDArNWf4WnY3vCiRj
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 09:29:41.4888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b749aef4-3d02-4d82-77f7-08de961a873e
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB11605
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 09:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234905

From: Daniel Turull <daniel.turull@ericsson.com>

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 ...T-handler-while-waiting-for-a-child-.patch | 21 ++++++++-----------
 .../bash/bash/0001-fix-c99.patch              | 20 +++---------------
 .../bash/bash/build-tests.patch               |  7 +++----
 .../bash/bash/fix-filesubst-errexit.patch     |  7 ++-----
 .../bash/bash/fix-run-builtins.patch          |  9 +++-----
 .../bash/bash/mkbuiltins_have_stringize.patch | 18 ++++++++++++----
 .../bash/bash/test-output.patch               | 11 ++++------
 .../bash/bash/use_aclocal.patch               |  5 ++---
 .../bash/{bash_5.2.21.bb =3D> bash_5.2.37.bb}   |  2 +-
 9 files changed, 41 insertions(+), 59 deletions(-)
 rename meta/recipes-extended/bash/{bash_5.2.21.bb =3D> bash_5.2.37.bb} (92=
%)

diff --git a/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler=
-while-waiting-for-a-child-.patch b/meta/recipes-extended/bash/bash/0001-ch=
anges-to-SIGINT-handler-while-waiting-for-a-child-.patch
index 77d770b364..fae56ce2f2 100644
--- a/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-=
waiting-for-a-child-.patch
+++ b/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-=
waiting-for-a-child-.patch
@@ -1,4 +1,4 @@
-From 721d5be99eb37d31e48bd66d61808a66a4c5ab84 Mon Sep 17 00:00:00 2001
+From 37f1f4ea73a737c23b239cc9e8b09587ccf61963 Mon Sep 17 00:00:00 2001
 From: Chet Ramey <chet.ramey@case.edu>
 Date: Mon, 30 Oct 2023 12:16:07 -0400
 Subject: [PATCH] changes to SIGINT handler while waiting for a child; skip
@@ -20,10 +20,10 @@ Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com=
>
  6 files changed, 43 insertions(+), 32 deletions(-)
=20
 diff --git a/general.c b/general.c
-index 85c5a8b6..65e2ee06 100644
+index bda39f4..94a5339 100644
 --- a/general.c
 +++ b/general.c
-@@ -262,8 +262,9 @@ legal_number (string, result)
+@@ -264,8 +264,9 @@ legal_number (string, result)
    if (errno || ep =3D=3D string)
      return 0;	/* errno is set on overflow or underflow */
 =20
@@ -36,7 +36,7 @@ index 85c5a8b6..65e2ee06 100644
 =20
    /* If *string is not '\0' but *ep is '\0' on return, the entire string
 diff --git a/jobs.c b/jobs.c
-index 6b986ed7..262d78de 100644
+index d3e4ab0..903cf9c 100644
 --- a/jobs.c
 +++ b/jobs.c
 @@ -2718,6 +2718,10 @@ wait_for_background_pids (ps)
@@ -96,7 +96,7 @@ index 6b986ed7..262d78de 100644
        waiting_for_child =3D 0;
        if (old_sigint_handler =3D=3D SIG_IGN)
  	set_signal_handler (SIGINT, old_sigint_handler);
-@@ -4136,7 +4144,7 @@ set_job_status_and_cleanup (job)
+@@ -4141,7 +4149,7 @@ set_job_status_and_cleanup (job)
  		 SIGINT (if we reset the sighandler to the default).
  		 In this case, we have to fix things up.  What a crock. */
  	      if (temp_handler =3D=3D trap_handler && signal_is_trapped (SIGINT)=
 =3D=3D 0)
@@ -106,7 +106,7 @@ index 6b986ed7..262d78de 100644
  	      if (temp_handler =3D=3D SIG_DFL)
  		termsig_handler (SIGINT);	/* XXX */
 diff --git a/tests/redir.right b/tests/redir.right
-index 8db10414..9e1403c8 100644
+index 8db1041..9e1403c 100644
 --- a/tests/redir.right
 +++ b/tests/redir.right
 @@ -154,10 +154,10 @@ foo
@@ -123,7 +123,7 @@ index 8db10414..9e1403c8 100644
 +./redir11.sub: line 77: 42: No such file or directory
  42
 diff --git a/tests/redir11.sub b/tests/redir11.sub
-index d417cdb6..ca9854cd 100644
+index d417cdb..ca9854c 100644
 --- a/tests/redir11.sub
 +++ b/tests/redir11.sub
 @@ -34,6 +34,8 @@ a=3D4 b=3D7 ss=3D4 declare -i ss
@@ -136,7 +136,7 @@ index d417cdb6..ca9854cd 100644
  a=3D4 echo foo 2>&1 >&$(foo) | { grep -q 'Bad file' || echo 'redir11 bad =
3'; }
  a=3D1 echo foo 2>&1 >&$(foo) | { grep -q 'Bad file' || echo 'redir11 bad =
4'; }
 diff --git a/tests/type.right b/tests/type.right
-index bbc228e8..e0a66745 100644
+index bbc228e..c0c1c8b 100644
 --- a/tests/type.right
 +++ b/tests/type.right
 @@ -24,15 +24,15 @@ func ()
@@ -164,7 +164,7 @@ index bbc228e8..e0a66745 100644
  builtin is a shell builtin
  /bin/sh
 diff --git a/tests/type.tests b/tests/type.tests
-index fd39c18a..ddc15407 100644
+index fd39c18..ddc1540 100644
 --- a/tests/type.tests
 +++ b/tests/type.tests
 @@ -25,8 +25,6 @@ type -r ${THIS_SH}
@@ -221,6 +221,3 @@ index fd39c18a..ddc15407 100644
  type m
 =20
  hash -r
---=20
-2.35.5
-
diff --git a/meta/recipes-extended/bash/bash/0001-fix-c99.patch b/meta/reci=
pes-extended/bash/bash/0001-fix-c99.patch
index aa810f7d4e..e210e988a4 100644
--- a/meta/recipes-extended/bash/bash/0001-fix-c99.patch
+++ b/meta/recipes-extended/bash/bash/0001-fix-c99.patch
@@ -1,4 +1,4 @@
-From e9ed388e760ec33dcf9e72c639946c0d0abeec26 Mon Sep 17 00:00:00 2001
+From 055a7560ef7301ff4c76a5ff2de277633ced0c28 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 19 Jun 2024 12:57:39 +0000
 Subject: [PATCH] Fix C99 problems
@@ -8,9 +8,8 @@ Backport some fixes from upstream to fix configure checks t=
hat fail with GCC 14.
 Upstream-Status: Backport [devel branch]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
- aclocal.m4   | 3 +++
- configure.ac | 2 +-
- 2 files changed, 4 insertions(+), 1 deletion(-)
+ aclocal.m4 | 3 +++
+ 1 file changed, 3 insertions(+)
=20
 diff --git a/aclocal.m4 b/aclocal.m4
 index cc97bd4..7423b99 100644
@@ -26,16 +25,3 @@ index cc97bd4..7423b99 100644
  int
  main()
  {
-diff --git a/configure.ac b/configure.ac
-index a3b5bd7..2a38c6b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -842,7 +842,7 @@ AC_CHECK_DECLS([strtold], [
- 	[AC_COMPILE_IFELSE(
- 		[AC_LANG_PROGRAM(
- 		[[#include <stdlib.h>]],
--		[[long double r; char *foo, bar; r =3D strtold(foo, &bar);]]
-+		[[long double r; char *foo, *bar; r =3D strtold(foo, &bar);]]
- 	)],
- 	[bash_cv_strtold_broken=3Dno],[bash_cv_strtold_broken=3Dyes])
-         ]
diff --git a/meta/recipes-extended/bash/bash/build-tests.patch b/meta/recip=
es-extended/bash/bash/build-tests.patch
index c1b9b8261f..bb0f11ceab 100644
--- a/meta/recipes-extended/bash/bash/build-tests.patch
+++ b/meta/recipes-extended/bash/bash/build-tests.patch
@@ -1,4 +1,4 @@
-From 318b762837c2ad25319caeaf0320eff613b64daf Mon Sep 17 00:00:00 2001
+From 920861d8018cdad96f49b320f6f4eb49ae606738 Mon Sep 17 00:00:00 2001
 From: Anders Roxell <anders.roxell@enea.com>
 Date: Wed, 19 Dec 2012 17:18:31 +0100
 Subject: [PATCH] Add 'ptest' target to Makefile, to run tests without chec=
king
@@ -9,16 +9,15 @@ Signed-off-by: Anders Roxell <anders.roxell@enea.com>
=20
 Rebase to 5.0
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  Makefile.in | 24 +++++++++++++++++++-----
  1 file changed, 19 insertions(+), 5 deletions(-)
=20
 diff --git a/Makefile.in b/Makefile.in
-index bc97049..937ce39 100644
+index 0b4df73..7e2a34e 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -943,20 +943,34 @@ maybe-clean:
+@@ -958,20 +958,34 @@ maybe-clean:
  	fi
 =20
  recho$(EXEEXT):		$(SUPPORT_SRC)recho.c
diff --git a/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch b/=
meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
index 60f1852316..f80ae37656 100644
--- a/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
+++ b/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
@@ -1,4 +1,4 @@
-From 59ddfda14e3c9aa6286bb4c4c0748f7c1324a65a Mon Sep 17 00:00:00 2001
+From 157de966e6b8a11bf75beab60776fafe757687f1 Mon Sep 17 00:00:00 2001
 From: Chet Ramey <chet.ramey@case.edu>
 Date: Fri, 7 Apr 2023 00:28:46 -0700
 Subject: [PATCH] $(<nosuchfile) is no longer a fatal error with errexit
@@ -17,7 +17,7 @@ Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/builtins/evalstring.c b/builtins/evalstring.c
-index df3dd68e2a7e..6612081cd646 100644
+index 53a7c0b..c5075cc 100644
 --- a/builtins/evalstring.c
 +++ b/builtins/evalstring.c
 @@ -753,7 +753,7 @@ open_redir_file (r, fnp)
@@ -29,6 +29,3 @@ index df3dd68e2a7e..6612081cd646 100644
        free (fn);
        if (fnp)
  	*fnp =3D 0;
---=20
-2.40.0
-
diff --git a/meta/recipes-extended/bash/bash/fix-run-builtins.patch b/meta/=
recipes-extended/bash/bash/fix-run-builtins.patch
index 2fa388302e..e567416d5d 100644
--- a/meta/recipes-extended/bash/bash/fix-run-builtins.patch
+++ b/meta/recipes-extended/bash/bash/fix-run-builtins.patch
@@ -1,4 +1,4 @@
-From 0c4cab9594c96c2dc435a8d9724605824bcbf917 Mon Sep 17 00:00:00 2001
+From cad8a7b1f355fb677503384adb885e7ef2e96d70 Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Tue, 19 Apr 2016 02:57:45 -0400
 Subject: [PATCH] fix run-builtins failed
@@ -16,10 +16,10 @@ Signed-off-by: Dengke Du <dengke.du@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/tests/builtins.tests b/tests/builtins.tests
-index 9d77520..63f3af8 100644
+index 8eee43e..71c9eee 100644
 --- a/tests/builtins.tests
 +++ b/tests/builtins.tests
-@@ -109,7 +109,7 @@ esac
+@@ -124,7 +124,7 @@ esac
 =20
  # test options to exec
  (exec -a specialname ${THIS_SH} -c 'echo $0' )
@@ -28,6 +28,3 @@ index 9d77520..63f3af8 100644
  # test `clean' environment.  if /bin/sh is bash, and the script version o=
f
  # printenv is run, there will be variables in the environment that bash
  # sets on startup.  Also test code that prefixes argv[0] with a dash.
---=20
-2.8.1
-
diff --git a/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patc=
h b/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
index a9391d6cac..93dc6a5035 100644
--- a/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
+++ b/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
@@ -1,3 +1,8 @@
+From c1a2395ebc4473714533a9cebe9197789addedae Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Wed, 14 Nov 2012 07:55:09 -0700
+Subject: [PATCH] bash: fix mkbuiltins build failure
+
 On hosts with FORTIFY_SOURCES, stringize support is required, as it's used=
 by
 the macros to wrap functions (e.g. read and open in unistd.h). Those wrapp=
ers
 use the STRING() macro from unistd.h. A header in the bash sources overrid=
es
@@ -13,14 +18,19 @@ stringize support, or to not define STRING() at all whe=
n FORTIFY_SOURCES is
 defined, letting the unistd.h one be used, instead.
=20
 Upstream-Status: Pending
+---
+ builtins/mkbuiltins.c | 1 +
+ 1 file changed, 1 insertion(+)
=20
---- bash-4.2.orig/builtins/mkbuiltins.c
-+++ bash-4.2/builtins/mkbuiltins.c
+diff --git a/builtins/mkbuiltins.c b/builtins/mkbuiltins.c
+index f505ebd..b5b2eed 100644
+--- a/builtins/mkbuiltins.c
++++ b/builtins/mkbuiltins.c
 @@ -28,6 +28,7 @@
  #  define HAVE_STDLIB_H
-
+=20
  #  define HAVE_RENAME
 +#  define HAVE_STRINGIZE
  #endif /* CROSS_COMPILING */
-
+=20
  #if defined (HAVE_UNISTD_H)
diff --git a/meta/recipes-extended/bash/bash/test-output.patch b/meta/recip=
es-extended/bash/bash/test-output.patch
index 0ffcc24587..f16477587b 100644
--- a/meta/recipes-extended/bash/bash/test-output.patch
+++ b/meta/recipes-extended/bash/bash/test-output.patch
@@ -1,7 +1,7 @@
-From 28eb06047ebd2deaa8c7cd2bf6655ef6a469dc14 Mon Sep 17 00:00:00 2001
+From b0d0e91d2bc9b8d0b3b7fb500c324b7a318fddff Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 10:01:56 +0800
-Subject: [PATCH 1/2] Add FAIL/PASS output to test output.
+Subject: [PATCH] Add FAIL/PASS output to test output.
 MIME-Version: 1.0
 Content-Type: text/plain; charset=3DUTF-8
 Content-Transfer-Encoding: 8bit
@@ -16,10 +16,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 10 insertions(+), 1 deletion(-)
=20
 diff --git a/tests/run-all b/tests/run-all
-index 2882fe0..e21d026 100644
+index 1f74923..ba36a1f 100644
 --- a/tests/run-all
 +++ b/tests/run-all
-@@ -33,7 +33,16 @@ do
+@@ -57,7 +57,16 @@ do
  	case $x in
  	$0|run-minimal|run-gprof)	;;
  	*.orig|*~) ;;
@@ -37,6 +37,3 @@ index 2882fe0..e21d026 100644
  	esac
  done
 =20
---=20
-1.8.3.1
-
diff --git a/meta/recipes-extended/bash/bash/use_aclocal.patch b/meta/recip=
es-extended/bash/bash/use_aclocal.patch
index bd6870b386..302bd0d82d 100644
--- a/meta/recipes-extended/bash/bash/use_aclocal.patch
+++ b/meta/recipes-extended/bash/bash/use_aclocal.patch
@@ -1,4 +1,4 @@
-From d1bf23817afffd5917b74da6946e0c3b7e63e336 Mon Sep 17 00:00:00 2001
+From f803b05a8d06f3df10aea47ccf9f5eb2fd438630 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 28 Dec 2020 21:04:27 +0100
 Subject: [PATCH] bash: update 5.0 -> 5.1
@@ -9,13 +9,12 @@ as needed instead making it work like other autotools bas=
ed projects.
=20
 Upstream-Status: Inappropriate [OE configuration specific]
 RP 2021/1/20
-
 ---
  configure.ac | 43 -------------------------------------------
  1 file changed, 43 deletions(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 50a6e20..a3b5bd7 100644
+index 52d4029..2a38c6b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -710,49 +710,6 @@ if test x$SIZE =3D x; then
diff --git a/meta/recipes-extended/bash/bash_5.2.21.bb b/meta/recipes-exten=
ded/bash/bash_5.2.37.bb
similarity index 92%
rename from meta/recipes-extended/bash/bash_5.2.21.bb
rename to meta/recipes-extended/bash/bash_5.2.37.bb
index 7652e7d87a..8262cea740 100644
--- a/meta/recipes-extended/bash/bash_5.2.21.bb
+++ b/meta/recipes-extended/bash/bash_5.2.37.bb
@@ -17,7 +17,7 @@ SRC_URI =3D "${GNU_MIRROR}/bash/${BP}.tar.gz;name=3Dtarba=
ll \
            file://0001-fix-c99.patch \
            "
=20
-SRC_URI[tarball.sha256sum] =3D "c8e31bdc59b69aaffc5b36509905ba3e5cbb127470=
91d27b4b977f078560d5b8"
+SRC_URI[tarball.sha256sum] =3D "9599b22ecd1d5787ad7d3b7bf0c59f312b3396d1e2=
81175dd1f8a4014da621ff"
=20
 DEBUG_OPTIMIZATION:append:armv4 =3D " ${@bb.utils.contains('TUNE_CCARGS', =
'-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 =3D " ${@bb.utils.contains('TUNE_CCARGS', =
'-mthumb', '-fomit-frame-pointer', '', d)}"

