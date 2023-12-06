Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251BEC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 19:22:40 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.58])
 by mx.groups.io with SMTP id smtpd.web10.42352.1701890558444140481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 11:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Sage0pcC;
 spf=pass (domain: axis.com, ip: 40.107.13.58, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tt43/fVYi5IPP9M+jLG2ofiZfMA6A3gQ6tGjdG1ab7Pezh5sATlkyhQsSoNor6mel/g0jxSK9GvdAFC8ZjfTupKP8Ooj836IKZRtwhMM8dfyYYqjm8f9FDx4snEui+H596Q04EPU8/NafbpkwcfKjCYv+VADohKgqNVtuteBHD3ZkN4zwFdgg5DT9qwyFY65kQZkCLJiXvTUrm7rxhSBxw66dZgrBEFoBnk6m2jUBr6Gv7KkHgKiAxVfFia09+VA6sRBb+eM4f1jhqH3iDSwwqkgZB6dAbO3DmGNLDigChXviS9z2+pS45Kd9HJcr9bksik1Lv6GrRGg6SgFHNKlaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JF8m6DKRmVN4OnX9tNhdI2h89/Bk3qPGMuFSjfKRxKQ=;
 b=ayNgZIq5Jr3zHRCAo3uY/2HQ32ZuyRip+o8u7ygdRDLCp+4VCuR9t1i2EC40iCDGYB1KkX0NjoS74d/hg7Na9DJizj5YkEsIdjZe7jmjK8Cn4N4L48A9Bhi5y1vq+nbgT/m1JYGk6DZOYg2dgOYRhbNwwsm1F0xUXsa0yyysnfzIPdIdWCJVVQozGJ5sY+cSLgshAwBiLC2045rlWbL6gokNv62nMWQy8Y2ngfdtEiMVD9d4Tj3ulSwebFpOEvkiPR0v9jEqljg3DOcZDY3wz0Uunm6EAnmFcL1bh0MjzNZuM2FSLErtiTIk27hCDm2isX3Z4h1oI2zwB443NdnAVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JF8m6DKRmVN4OnX9tNhdI2h89/Bk3qPGMuFSjfKRxKQ=;
 b=Sage0pcCgfG1rQ4UuzgBfgt3y0bXM9nI5b1Yg1/P/oQpZe5E1PLdB8ueB95qyQ5G1fXHB+otjI5HjYpV0p23BD7fXgSBc+kB4rk2rA8xAWkiOtsiBnQy9jZsobNT1ZUcsxLUE2Uj0gtiwGmpYRszmZXmQ5yumhykSs8KTx4qcZY=
Received: from DB7PR02CA0003.eurprd02.prod.outlook.com (2603:10a6:10:52::16)
 by AS2PR02MB10123.eurprd02.prod.outlook.com (2603:10a6:20b:64f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.26; Wed, 6 Dec
 2023 19:22:34 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::4b) by DB7PR02CA0003.outlook.office365.com
 (2603:10a6:10:52::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 19:22:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 19:22:34 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 20:22:32 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 20:22:32 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Dec 2023 20:22:32 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id A4A60F676
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 20:22:32 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B6JMWIa2838181
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 20:22:32 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B6JMWQp2838180
	for openembedded-core@lists.openembedded.org; Wed, 6 Dec 2023 20:22:32 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/9] oeqa/selftest/devtool: Make test_devtool_load_plugin more resilient
Date: Wed, 6 Dec 2023 20:22:01 +0100
Message-ID: <20231206192207.2838077-4-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231206192207.2838077-1-pkj@axis.com>
References: <20231206192207.2838077-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B621:EE_|AS2PR02MB10123:EE_
X-MS-Office365-Filtering-Correlation-Id: fda9c55f-9de0-4e1d-ca91-08dbf690b344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WANAwC9LKpikvxgYz5y9HugQUbwHWquoloziG0kfJYt4OlT3x8hp4t86UHazJtHx7bsyBN5vagbQpS107Ofu5v8lO7HFzZo9PJgxMZbti0/ruJa32RaNBO+BKrd9KGwcPU7+p0hleHVHMEr2u9YmmNuBqdebSW4jj0hcSoeSQARbE5VAIzq6QJBb3CyK+73H/0zcb4tghEtC1CZ/mL6T3qiU8bHer1wgGqVaNMZunK0XPNEPTqZWWLH2Dqb/NpjYumIC9GdqZp5SG87pqkh5wEPsqNMeq+nSFn6R48T42ulqK4m9spaFZFAewXM1SBuXOGFn7aug5bZVQocNZ/w32pITtvFCkIfoDlCqqtpDIpb3VoU3RlG67xx9SCJ6Z/r/sd5xrew62/J8oou0GORYKpDtAV6rkKPKxWRj1lJaO0Mg/y52V7uKbYIYyH0fNRpxcP0y7eCGz5lvTfwbvif5ZgRprtsQzwtbvIUJeaT3Iavh/Tku1mjOWCvvSU9ww6yE23yNbCG/NAxllXLSjdyD7/bI3+gR4n45QF7UoZF1oj/MR3QFdQPbvmIQgqH2CceE3M2oc5QG8h19VJJwbZNHvm/uGLS4oF4v/lWyrjSIduf8ktWhnw1EWXug7huSU1sG8vqoqjbkuujm2sYLKFRvm8bM0hV+reKhhUSBuO+/Ern50V/XMA/jnYfYDxR+VBArnjUGmMvv+moSfvMYa/dIPA1RZvMhUfZFtwAstOAdfw8XMP3dCZSSqXhmXmRltFVDhIqHRnGD5YG7ukt8he/FqA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(1800799012)(82310400011)(64100799003)(451199024)(186009)(36840700001)(46966006)(40470700004)(40480700001)(36860700001)(5660300002)(47076005)(82740400003)(6666004)(81166007)(356005)(41300700001)(36756003)(8676002)(8936002)(2906002)(40460700003)(42186006)(316002)(426003)(26005)(83380400001)(336012)(1076003)(2616005)(478600001)(6916009)(70586007)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 19:22:34.5160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fda9c55f-9de0-4e1d-ca91-08dbf690b344
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB10123
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 19:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191914

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

