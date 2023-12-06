Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6B2C10F09
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 20:55:51 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.52])
 by mx.groups.io with SMTP id smtpd.web11.44678.1701896149839993140
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 12:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=VpraMSn0;
 spf=pass (domain: axis.com, ip: 40.107.22.52, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVkS8OLWZ0+wyFF7vbhtbb3obq5bQHM4FU92AXOxW560BLFc5aMhaPMrgB+s37tODNIltLpEGmik2bWzxv9SJbnUZ1mYDtGZE+RKvKIL25Y2Hy+FwnBqHtVPiyprTqPc2U9ySfkeaYc+gGWgi3nyzjwznpvHqn72XCSaeR1/mu8nITAaIWrhdGr3CXtL4iteL2KgNyKAuvAivRQG9voWrQTsG9gXj4/q9/tltMjzXWX8z09QL0nNsz5WIW9buI7ULuCp/vltGF/Of1O6qG3a+RbYIh9/od1CZd1hcppw2ZrU8FPmJluzmYSeehJSPMKPTXThcXqUgJJxV0qtqCaufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JF8m6DKRmVN4OnX9tNhdI2h89/Bk3qPGMuFSjfKRxKQ=;
 b=d/S3DtOVKDiDXYlMaeaIlVcujsbe5khV4ooLdRvRsIiPRt/kTPLqRC3Spn0b4zqdMsEAX8UYSjt+0SR4kHq8ho8AX+51JljbN78weqdF3t7Rt4U7W7tfhsyS9B0FSPZ8koGOF2cAIjGSMpG9qfwuA6Y4uipVO+O/XQe5CnUC2z5JKLpOs6ov90DA7MFdP2QnuKja/xYrrsFxPxT0ZNKU0yXfuTRvOoMaYWFcvUGpYA/zpKvMHNNGzPbh+xJzAu6A0ltxNKBvgnjEMLio3y2Jzy3UOsz4JiX4WnUXmcisMVmErgZDWptnMznfXYWx7r0pYruOtwQjKsMoCDbD24UrZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JF8m6DKRmVN4OnX9tNhdI2h89/Bk3qPGMuFSjfKRxKQ=;
 b=VpraMSn0Y4vP6a1i7mRuUnRIZZv+Ra45Lgg3BC41PL9ddCyy++qZNo8T+QUTMKr/JX9QKmPbFPclHKTlbqzXjpRwim8M8dnuUioRd3rz44hK7bY4Doig1jP4/dSowCpzjHtxMBsSvE6xv2mXzjSlbIUD1qAtwydI8Vgvb2/w5D4=
Received: from AM0PR02CA0124.eurprd02.prod.outlook.com (2603:10a6:20b:28c::21)
 by VI1PR02MB5902.eurprd02.prod.outlook.com (2603:10a6:803:12e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 20:55:46 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::d4) by AM0PR02CA0124.outlook.office365.com
 (2603:10a6:20b:28c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25 via Frontend
 Transport; Wed, 6 Dec 2023 20:55:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 20:55:46 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 21:55:44 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 21:55:44 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Dec 2023 21:55:44 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 3D2D0F689
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 21:55:44 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B6Kti6I4037597
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 21:55:44 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B6KtiGv4037596
	for openembedded-core@lists.openembedded.org; Wed, 6 Dec 2023 21:55:44 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 3/9] oeqa/selftest/devtool: Make test_devtool_load_plugin more resilient
Date: Wed, 6 Dec 2023 21:55:25 +0100
Message-ID: <20231206205531.4037549-4-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231206205531.4037549-1-pkj@axis.com>
References: <20231206205531.4037549-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000041:EE_|VI1PR02MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: 02db9c98-36b7-42f4-88cd-08dbf69db837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JBzGH3WyAFq4K007dCArUbRxhLiisQiclE8KlPSGiyGKlEeFYKzpvbYEOyjCgXTu++T5bG78/zj/LyPNUt4LGG9mRgOGXsRWc0EXLf21pzdhoIWxo+6Iwf9/H+Z26FcuFxaPybzssbNarJwq03OM+o2MizCeQJ4QrbsHOJYO/YkpydzHViumcY5Rr2SU1soXvmK7U0rDEDaNEL+h7Tb3PcB8kxjI5kNkI45jydW6SJeQb4aXyJL2meOuKQmfCCDAEjAqNPZmMBxEcMXdVDawNUcXpy6wpFuRI/FSWfzC95OyD2/coF4AM+1CKLMpSXT5MNAqwpjUaHbxC00QMv9tQXXERFe3ZA/OHRuI1+QWiRxIUQnYU2xonh1TSTCV8PgHaZULusdYiekQiBAg25XJMGs91Dw7+Xy6tS79ysQL/0rY9/0f1cgwUhMhNNHDtDYobxgJvefoYFvBzWhBsebCpiSQmnTErNGVImWx40RmN7MsK1XwFWZxHrHTd+fEjpC29klwgFLbdnX/q+Vud983+4Bw83USD0Fu/n1lX8dw0Terk4j3ckF5TbgAu0E4bSmbSkYWVetzZ4ZurnIDWZvRFL5NHhiS4OfrgHfif+H/o0IbXNECW2KV3FfsmE0+Om9yo+nuw0xoLE4gj82mJF3++2V+2bB33ZAbk3pxrhpO5e/HdRO14l5aG3P4UCHPvDgngh4rLaOiJCnL/67aBBqwRAnDPqN6GxR8bN2Mk3oUcXURnmVtfgqm+hmFIF97DB00CB6zrh0rQOD62RrHj6MJLA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(39850400004)(136003)(230922051799003)(186009)(82310400011)(1800799012)(451199024)(64100799003)(40470700004)(46966006)(36840700001)(40460700003)(8676002)(8936002)(426003)(6916009)(42186006)(336012)(83380400001)(316002)(70206006)(70586007)(1076003)(5660300002)(2906002)(47076005)(36860700001)(6666004)(478600001)(26005)(2616005)(356005)(41300700001)(40480700001)(81166007)(82740400003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 20:55:46.3690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02db9c98-36b7-42f4-88cd-08dbf69db837
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5902
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 20:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191927

* Avoid trying to write to read-only directories and file systems.
* Support symbolic links in BBPATH.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selfte=
st/cases/devtool.py
index 03d57cc30a..e01ab01869 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
+import errno
 import os
 import re
 import shutil
@@ -1900,7 +1901,15 @@ class DevtoolUpgradeTests(DevtoolBase):
         for p in paths:
             dstdir =3D os.path.join(dstdir, p)
             if not os.path.exists(dstdir):
-                os.makedirs(dstdir)
+                try:
+                    os.makedirs(dstdir)
+                except PermissionError:
+                    return False
+                except OSError as e:
+                    if e.errno =3D=3D errno.EROFS:
+                        return False
+                    else:
+                        raise e
                 if p =3D=3D "lib":
                     # Can race with other tests
                     self.add_command_to_tearDown('rmdir --ignore-fail-on-n=
on-empty %s' % dstdir)
@@ -1908,8 +1917,12 @@ class DevtoolUpgradeTests(DevtoolBase):
                     self.track_for_cleanup(dstdir)
         dstfile =3D os.path.join(dstdir, os.path.basename(srcfile))
         if srcfile !=3D dstfile:
-            shutil.copy(srcfile, dstfile)
+            try:
+                shutil.copy(srcfile, dstfile)
+            except PermissionError:
+                return False
             self.track_for_cleanup(dstfile)
+        return True
=20
     def test_devtool_load_plugin(self):
         """Test that devtool loads only the first found plugin in BBPATH."=
""
@@ -1927,15 +1940,17 @@ class DevtoolUpgradeTests(DevtoolBase):
             plugincontent =3D fh.readlines()
         try:
             self.assertIn('meta-selftest', srcfile, 'wrong bbpath plugin f=
ound')
-            for path in searchpath:
-                self._copy_file_with_cleanup(srcfile, path, 'lib', 'devtoo=
l')
+            searchpath =3D [
+                path for path in searchpath
+                if self._copy_file_with_cleanup(srcfile, path, 'lib', 'dev=
tool')
+            ]
             result =3D runCmd("devtool --quiet count")
             self.assertEqual(result.output, '1')
             result =3D runCmd("devtool --quiet multiloaded")
             self.assertEqual(result.output, "no")
             for path in searchpath:
                 result =3D runCmd("devtool --quiet bbdir")
-                self.assertEqual(result.output, path)
+                self.assertEqual(os.path.realpath(result.output), os.path.=
realpath(path))
                 os.unlink(os.path.join(result.output, 'lib', 'devtool', 'b=
bpath.py'))
         finally:
             with open(srcfile, 'w') as fh:

