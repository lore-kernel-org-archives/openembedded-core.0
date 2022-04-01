Return-Path: <simone.weiss@elektrobit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC888C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 14:46:46 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.78])
 by mx.groups.io with SMTP id smtpd.web11.11644.1648824405632361447
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 07:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@elektrobit.onmicrosoft.com
 header.s=selector2-elektrobit-onmicrosoft-com header.b=OSt4blyI;
 spf=pass (domain: elektrobit.com, ip: 40.107.100.78,
 mailfrom: simone.weiss@elektrobit.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69dW26IYl2KCTVsoHTe/ZIoMqEYFKrE6YXt8XlT39mQ=;
 b=OSt4blyIIYkgrFTetxbj5LfXT43+FOe1iQU2dgWsB2tu7lTiMDoe8h6rmBKEho1/d+uvvbdGgPu+0I91YFUBWuYq5BnAkyYHyGOSLYRBN0OJkw3JamCDKjaYG2sqV5Pn8nI7NFkZQO8cOtsrIoT1jHQ4mcX1mD+jdz/nQ18jrtQ=
Received: from BN7PR02CA0001.namprd02.prod.outlook.com (2603:10b6:408:20::14)
 by SN6PR08MB5614.namprd08.prod.outlook.com (2603:10b6:805:f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Fri, 1 Apr
 2022 14:46:43 +0000
Received: from BN8NAM12FT013.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::cb) by BN7PR02CA0001.outlook.office365.com
 (2603:10b6:408:20::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.26 via Frontend
 Transport; Fri, 1 Apr 2022 14:46:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 4.79.107.243)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.onmicrosoft.com;dmarc=none action=none
 header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 4.79.107.243 as permitted sender)
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BN8NAM12FT013.mail.protection.outlook.com (10.13.182.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.14 via Frontend Transport; Fri, 1 Apr 2022 14:46:42 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Apr 2022 07:46:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwGpqnQr+Li8Et3zObaz10pYT0RLrF0GvqYGDCZKK8N07DMWbjI1i7f00CMUe5qkyJlsJYHjFrDO07p+AvMLBA128yCrXiIZ/+4KZq7SKB3V/tNu6By7xmilUVYzOHc3BCTta8G8zC5uacAx7WiqVISaTnzu4HdUsf/Oci0QTISP5eq0eP75/noy8UNKvntZQx7kJzxbCGRVfoE40Dr/K9NV2Y+ssuSVoHjXI327GsbkcOQlC0W71cUEVOAWbQin/GzW9UyvBSm+4i4vJdqAOpo6xc2Qk9k8X0mjKzbSfuFSezu0JFinEQ+8ttVcfFpUDiXvQXxti/XKbW72ygOyOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69dW26IYl2KCTVsoHTe/ZIoMqEYFKrE6YXt8XlT39mQ=;
 b=hQ7pFte2lOiih5xMxiCbEBILsNP/RXMLSeLHYCYyGskPzXsX95/PZIOnIiRStaODL2puMnj8nYdSk6I85uSOSZW3UgUcA+5nm0prqrje95Zt1X6Za77x6gmPnwa8R3r2AEGoTnsYPuLeikQZWSemi3BrrviVezwncAH14C2+jFPrKG6ijm7XvWFocmwByob5Byn5Di3AYM8FBK0tQYr2sO5iTVMKYCfrercAHGMxTwzDkEoOsveLgDPpPfcUDSVERONTBAjdkkaQa5eVxoQMPF/C7NS0toALGLSd9tw8FhF6MytXBQDCfubjEQRrE2RxLRQqOcRkXYqwXgi3feYjPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 213.95.148.172) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=elektrobit.com; dmarc=none action=none
 header.from=elektrobit.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69dW26IYl2KCTVsoHTe/ZIoMqEYFKrE6YXt8XlT39mQ=;
 b=OSt4blyIIYkgrFTetxbj5LfXT43+FOe1iQU2dgWsB2tu7lTiMDoe8h6rmBKEho1/d+uvvbdGgPu+0I91YFUBWuYq5BnAkyYHyGOSLYRBN0OJkw3JamCDKjaYG2sqV5Pn8nI7NFkZQO8cOtsrIoT1jHQ4mcX1mD+jdz/nQ18jrtQ=
Received: from MW4PR04CA0301.namprd04.prod.outlook.com (2603:10b6:303:82::6)
 by SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.27; Fri, 1 Apr
 2022 14:46:40 +0000
Received: from MW2NAM12FT056.eop-nam12.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::9d) by MW4PR04CA0301.outlook.office365.com
 (2603:10b6:303:82::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.29 via Frontend
 Transport; Fri, 1 Apr 2022 14:46:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 213.95.148.172) smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 213.95.148.172 as permitted sender)
Received: from denue6es010.ebgroup.elektrobit.com (213.95.148.172) by
 MW2NAM12FT056.mail.protection.outlook.com (10.13.181.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.14 via Frontend Transport; Fri, 1 Apr 2022 14:46:39 +0000
Received: from denue6es010.ebgroup.elektrobit.com (10.243.160.100) by
 denue6es010.ebgroup.elektrobit.com (10.243.160.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 1 Apr 2022 16:46:37 +0200
Received: from del01461.ebgroup.elektrobit.com (10.243.54.27) by
 denue6es010.ebgroup.elektrobit.com (10.243.160.100) with Microsoft SMTP
 Server id 15.1.2308.20 via Frontend Transport; Fri, 1 Apr 2022 16:46:36 +0200
From: Simone Weiss <simone.weiss@elektrobit.com>
To: <openembedded-core@lists.openembedded.org>
CC: Simone Weiss <simone.weiss@elektrobit.com>, David Niederpruem
	<david.niederpruem@elektrobit.com>
Subject: [PATCH] popt: add ptest
Date: Fri, 1 Apr 2022 16:46:29 +0200
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: 
 <0bdd8781-1174-4002-a3b6-4b3de641d2d3@denue6es010.ebgroup.elektrobit.com>
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 03f08e39-8824-47e3-ac1c-08da13ee702b
X-MS-TrafficTypeDiagnostic: 
	SN6PR08MB5517:EE_|BN8NAM12FT013:EE_|SN6PR08MB5614:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR08MB56145707B8E6A3F004B6241DE2E09@SN6PR08MB5614.namprd08.prod.outlook.com>
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 XLTMVy9JZuwEmDeB/+RoOKnSGHwF7LS1luqxyP+rXTEHUNdLxQ8ewyf1+7xqySujWdgUVFJfV0ewec9sE8OaKGjHPbC9m7E0j8RB9Dnh/JSO5+T6+/AGW6DL+8W3o8uC/j73hI2uBbkPb0IEM1v7KokCoQ7sOue/ir1pVJZ80VN4rLfncsuNv5A+6hOyTAK0jCItlfWguHLSrtKF2nO8e+Q7unCVp88AoyAk76nZmMjHjC60sRXR4YtvHU2yWN9ZML/EPW/8oEfAD7ytHDMFsRMp/AIDDQJVEXraxKHcYbE0wGHZ/m7OsnpTBI9FhMlDuPzCgk7DHfrWlJTgC2RL2+b79KyYvKhuZf8WXeP1FXueTydtdWzvMN7vhPa6Z5duHLFbPOO3Jk0NVlvvnpvpAUn+IkIcjSJbFzFy7U2aq3vTJ/hzXH8vJ8LgGhwDGVD6K9sBhbqfE+DpFrXugNUr4TONT6cTam/yk3tinUNot4EqIe8JFXmErg+jGQP7U8PKWkJwWMI68de04LyMtAwJFjBPXJXUY4ik/l6oikGP09lCtD1UYtxkHuPZMKzyxcgsl5bfs2aS70jgJKA5ZwQJxhNC9PmhpkDYo7NSxq5ael6aduSeA887jabwxZPb2SDg5r+f4ePlvQJgYYaOWLCpaUmcEY5LrirdDIG+v1S/DKUkm6ua3e5SIkIWT01VghhhqPSPxbkP95Tn95vMUHKNhUE/sEwYuhS81dwNOiZ/w7AWw4x69XxzWWNKzerlPIyU6UEOcMlLpV1Pr5fEyQ3qDw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es010.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(54906003)(44832011)(6916009)(107886003)(316002)(26005)(186003)(508600001)(336012)(83380400001)(8676002)(4326008)(8936002)(40460700003)(426003)(70586007)(31696002)(31686004)(86362001)(70206006)(356005)(81166007)(5660300002)(36860700001)(47076005)(82310400004)(2906002)(966005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5517
X-SM-smarthost: [elektrobit-com.mail.protection.outlook.com]
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 BN8NAM12FT013.eop-nam12.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fbc424f7-df02-4613-2368-08da13ee6e25
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZjFVCLtbeC0yWwgQSWosgSu8W/PWbr5mrIesKV59bmeQwglkOLCWBR2iQjc2y/YcZm8rxkuXF0tDjkhJVwtttcJlYq9pQlBEUMXr8BR7RPAecQWXfXHWjVghZnyR57xRb8DnEkEzLVGYOIJ3+K5TdkEvX92qDSTr8okDyLv2376omb1HupAr4j6wkEMwT8U6SOsjD1ZDExIEyn9do+Nj6JWfMAZUPPgKdqrOvE58ZlYt+GuJhrNg7c6XyK2ISeAWeD4Bs4md4jvIkt99G6R1GysFsC9s3xPSbAHZXc7LkrsR854+jjbQ1+9qk3q8lPnOA7aCb36nSjSJcUeNLMJ8G0HN2d5qqMrJcn9vHRKnVrt8EjobBwaixiuIqndxu01YU8zNWdDuyg3UHL5FEDrDK+8ewms+Gk5+NfCmSfdXZyR1DmGyPn+66GSwp/DrV7ofKqaq8y8oMyZ1YCRxWo+hQWjDyAiTYGiNPGyls12+TMo9S01SWpL3HpbEd+wPp3Fm0Hck2LswVehEFA5I04hCx2rLXhIo175DMR7NleaRzrZMsD4YOFeXVU0GwiEtCqfi6XzDGUJPYPAlIjuuJoTcY27FSYWErWr/gba2MINGBavPozZpRpAVY1yV4bt2HgcK9E3CZTF60HJxpXQr4dFbxiqv9SWcKFi9j+ymB0BNvLmHyHTpBL1BVo+Dx5L73uzOp6AOk725r/LL6Ndj2tvs0dSI8IR1hPksEXGrRxkfkBEMmXv00MVyVzD9xsZ91oMJop3+2R3eF4g5ENJP3gE0ZJbGhvXz0lm8B9uO19hZdpI=
X-Forefront-Antispam-Report: 
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:usbth1es003.ebgroup.elektrobit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(86362001)(186003)(26005)(508600001)(47076005)(36860700001)(2906002)(31696002)(6666004)(31686004)(966005)(426003)(107886003)(83380400001)(336012)(70586007)(70206006)(4326008)(8676002)(5660300002)(54906003)(81166007)(40460700003)(44832011)(82310400004)(6916009)(8936002)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 14:46:42.7182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 03f08e39-8824-47e3-ac1c-08da13ee702b
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM12FT013.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5614
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 14:46:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163940

Add a ptest for popt to core-image-ptest-all. Provide a patch to popt to
adopt the test format to "simple test" and a script for running the test.
All tests passed on a trial run.

Signed-off-by: Simone Weiss <simone.weiss@elektrobit.com>
Signed-off-by: David Niederpruem <david.niederpruem@elektrobit.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 ...01-popt-test-output-format-for-ptest.patch | 68 +++++++++++++++++++
 meta/recipes-support/popt/popt/run-ptest      |  3 +
 meta/recipes-support/popt/popt_1.18.bb        | 21 +++++-
 4 files changed, 91 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/popt/popt/0001-popt-test-output-format-for-ptest.patch
 create mode 100644 meta/recipes-support/popt/popt/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index ac3295d1aa..b51cce4d9e 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -48,6 +48,7 @@ PTESTS_FAST = "\
     opkg-ptest \
     pango-ptest \
     parted-ptest \
+    popt-ptest \
     python3-atomicwrites-ptest \
     python3-bcrypt-ptest \
     python3-hypothesis-ptest \
diff --git a/meta/recipes-support/popt/popt/0001-popt-test-output-format-for-ptest.patch b/meta/recipes-support/popt/popt/0001-popt-test-output-format-for-ptest.patch
new file mode 100644
index 0000000000..020949cc34
--- /dev/null
+++ b/meta/recipes-support/popt/popt/0001-popt-test-output-format-for-ptest.patch
@@ -0,0 +1,68 @@
+From 330b77081c3a4c7ae76cb08602db385b40fa7ff7 Mon Sep 17 00:00:00 2001
+From: Simone Weiss <simone.weiss@elektrobit.com>
+Date: Mon, 13 Dec 2021 09:29:53 +0000
+Subject: [PATCH] popt test output format for ptest
+
+patch test output format to match simple-test as it is used in ptests.
+
+Upstream-Status: Pending
+    
+Signed-off-by: Simone Weiss <simone.weiss@elektrobit.com>
+Signed-off-by: David Niederpruem <david.niederpruem@elektrobit.com>
+---
+ tests/testit.sh | 20 ++++++++------------
+ 1 file changed, 8 insertions(+), 12 deletions(-)
+
+diff --git a/tests/testit.sh b/tests/testit.sh
+index 2a7b4aa..50b42e2 100755
+--- a/tests/testit.sh
++++ b/tests/testit.sh
+@@ -5,12 +5,11 @@ run() {
+     name=$1; shift
+     answer=$1; shift
+ 
+-    echo Running test $name.
+-
+     result=`HOME=$builddir $builddir/$prog $*`
+     if [ "$answer" != "$result" ]; then
+-	echo "Test \"$prog $*\" failed with: \"$result\" != \"$answer\" "
+-	exit 2
++        echo "FAIL: $name"
++    else
++        echo "PASS: $name"
+     fi
+ }
+ 
+@@ -23,17 +22,17 @@ run_diff() {
+     out=$builddir/tmp.out
+     diff_file=$builddir/tmp.diff
+ 
+-    echo Running test $name.
+-
+     $builddir/$prog $in_file > $out
+     ret=$?
+     diff $out $answer_file > $diff_file
+     diff_ret=$?
+ 
+     if [ "$diff_ret" != "0" ]; then
+-       echo "Test \"$name\" failed output is in $out, diff is:"
+-       cat $diff_file
+-       exit 2
++        echo "FAIL: $name"
++        echo "diff is:"
++        cat $diff_file
++    else
++        echo "PASS: $name"
+     fi
+     rm $out $diff_file
+ }
+@@ -174,6 +173,3 @@ Help options:
+ #run_diff test3 "test3 - 51" test3-data/01.input test3-data/01.answer
+ #run_diff test3 "test3 - 52" test3-data/02.input test3-data/02.answer
+ #run_diff test3 "test3 - 53" test3-data/03.input test3-data/03.answer
+-
+-echo ""
+-echo "Passed."
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/popt/popt/run-ptest b/meta/recipes-support/popt/popt/run-ptest
new file mode 100644
index 0000000000..85754035d0
--- /dev/null
+++ b/meta/recipes-support/popt/popt/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+./testit.sh
diff --git a/meta/recipes-support/popt/popt_1.18.bb b/meta/recipes-support/popt/popt_1.18.bb
index 057c44f223..af8add4ad6 100644
--- a/meta/recipes-support/popt/popt_1.18.bb
+++ b/meta/recipes-support/popt/popt_1.18.bb
@@ -8,9 +8,26 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cb0613c30af2a8249b8dcc67d3edb06d"
 
 DEPENDS = "virtual/libiconv"
 
-SRC_URI = "http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz"
+SRC_URI = "\
+    http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
+    file://0001-popt-test-output-format-for-ptest.patch \
+    file://run-ptest \
+"
 SRC_URI[sha256sum] = "5159bc03a20b28ce363aa96765f37df99ea4d8850b1ece17d1e6ad5c24fdc5d1"
 
-inherit autotools gettext
+inherit autotools gettext ptest
+
+RDEPENDS_${PN}-ptest += "bash"
+
+do_compile_ptest() {
+    sed 's#lt-test1#test1#g' ${S}/tests/testit.sh > ${B}/tests/testit.sh
+}
+
+do_install_ptest() {
+    install ${B}/tests/.libs/test* ${D}/${PTEST_PATH}
+    install ${B}/tests/.libs/tdict ${D}/${PTEST_PATH}
+    install ${B}/tests/testit.sh ${D}/${PTEST_PATH}
+    install ${B}/tests/test-poptrc ${D}/${PTEST_PATH}
+}
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


