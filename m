Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F81C46CA7
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 19:22:40 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.81])
 by mx.groups.io with SMTP id smtpd.web11.41993.1701890557580937168
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 11:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=rMJg5T0c;
 spf=pass (domain: axis.com, ip: 40.107.7.81, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VL2LGUJjqjzarPjflxjL/jaTilUtpFeNVRtRCszlNuHoZ3qMKM0VjsuQc8zi8HgXow2k/h60fQREE4/i/G4iU2VWkIYsYJrFjW7Us9WfhSPe0fJyiBMmUdqIslY99j7B+EM2Vj80EUx/CD11/pk9pb9CIbH8cB00fFzqyU5ZQAsTRmZeJW/0aBKeJl/IqxM5e6Vs5U8Ew1sNfJHmrkawCD4A/0KrE/jMbDGztSxnPS900VQPXc9VPJz4q2QGXhdqeJWz8utCWaPtxRAtsSmbNoRQrvLoVUt7qsNGKf+FJ8UJp7P6YGC7+a96aiuplB0MUaDJy48G0M00PuMGaLdLjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2OnWcBxh3olzslySUW58TaI2XWrQx0dnh0ToS3CdtI=;
 b=L/n2dN+rbBDtauSQbU4un3VgqiDeki91JSLTsfgj8nz+4Xl83hYE8zzmj92UZ9eSvAKLqD0kA8ncHJ9GbtFon9s0gUmQaOgDBDBUHGdGjCWoG6+CIr3TiCF7boFYxbeFnMX/IVsim0b2byaE0CNeoIRflvRX6dllnIXscM3rA3f6K87tqF8so5lUewFh3PJ9+vOkbgqLAdL2Aq/Sjt9104uh/UgcKEW3wxqvlFeWZmz8zN2A+5yYqEeP5WnA+hTKa4fhQJOdR4CdfRX8CGwkWY+ziVBbQ+X129zxrZg1Bu+c6FiNrsy/0ixmQZy+1UBbs+31Nvf+fMdXiklazVa/JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2OnWcBxh3olzslySUW58TaI2XWrQx0dnh0ToS3CdtI=;
 b=rMJg5T0cd/yYa6cXBeSnF3r91Dq9i3ZlnhEbBMI/XNXUImqbV1B5jhht1fGis3unHBpTEnNjUhLP64fSuPgMx/wIdjoc8yPDPeQs8ZTvACZ+ShrFBexzQh6ut/OhO+TatLXht0miXNFqz/Ph1ROWjDZGAf4O7GI5l81h+25VuB4=
Received: from DB7PR02CA0014.eurprd02.prod.outlook.com (2603:10a6:10:52::27)
 by DB9PR02MB7083.eurprd02.prod.outlook.com (2603:10a6:10:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.26; Wed, 6 Dec
 2023 19:22:34 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::f3) by DB7PR02CA0014.outlook.office365.com
 (2603:10a6:10:52::27) with Microsoft SMTP Server (version=TLS1_2,
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
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 20:22:32 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Dec 2023 20:22:32 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id C41C6F5C4
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 20:22:32 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B6JMW7w2838185
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 20:22:32 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B6JMWGM2838184
	for openembedded-core@lists.openembedded.org; Wed, 6 Dec 2023 20:22:32 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/9] oeqa/selftest/recipetool: Make test_recipetool_load_plugin more resilient
Date: Wed, 6 Dec 2023 20:22:02 +0100
Message-ID: <20231206192207.2838077-5-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231206192207.2838077-1-pkj@axis.com>
References: <20231206192207.2838077-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B621:EE_|DB9PR02MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: 869791c0-77c1-442e-08ab-08dbf690b302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5pTERGaL9gKGNJPruVZz1UuBsgo8x4YwZ4OfJO5KDM/gkZhbdDBmlm3jxw3CSSwImi4i7gKZKCZW48Jb/nnDG0C3Hr5ZaaO0ls1NcIeCL2Js/VaiVALKqCmNa9G1ScAprwIRKg2g7yXvgz2b4rcHdFDEiHuH1jOeOKpS7XNueXiHTOOTclzFesmBi5uZet38Qc9AjWK0Lza8mnORZ3imSSv9Zo+Td+29pmu4xuURpzoDxyhuOgxlwqFriABCj35bmxIdCZxf22QGrfeVHABzAIx44dvGedza3u2MroAMm4haAT/EfBjWeRenM+gS2E7gDMjr0p78TsVhMVBnk+F/kYmUX24cHkiTh+GhAI3NIHZ2hzDMz9I7qWoEGj7nFBCKG2urS+mSECsFV1UeOgfEME9QRlr7dWaqlQOy9aU81HajrcLLjMTF9Yd6g4xsxEINY1uRjkwr51b7NwCxHhwAeagkX0hQloPZT+SqCBISbRdSmBeea3I7g1dIlKLvP2jqCgUAUBIWLwF9MWZK6Al14jsEigFZQIRDSfF3f9mw7uJWe5tN6ztGK8Ob+GE7n4TRydSqcsDyzFD0tJu7Pwm02IGiQNvSMYN4W6VwsgwXmIkz7wgR/0MqgNt5LgyFKiWHOIFKFTIFzwdv2PJjEeCYgm57/GKmTZCbDSUxlg/9y9IG9hAGhKF7RrZXOxj2qjgTCCmyqfwz4/N5y8zJJ4LEFaEols+H1bKv4v41qOrpuXPOnQCiXpmtGW+RkNMzYdSosycd+SU9FeMy6sVyXCEJ+A==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(82310400011)(1800799012)(36840700001)(46966006)(40470700004)(478600001)(40460700003)(426003)(2616005)(336012)(1076003)(26005)(81166007)(356005)(82740400003)(83380400001)(47076005)(36756003)(36860700001)(6666004)(2906002)(40480700001)(5660300002)(41300700001)(42186006)(6916009)(316002)(70586007)(70206006)(8936002)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 19:22:34.1410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 869791c0-77c1-442e-08ab-08dbf690b302
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 19:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191910

* Avoid trying to write to read-only directories and file systems.
* Support symbolic links in BBPATH.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 25 +++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/sel=
ftest/cases/recipetool.py
index 55cbba9ca7..3a05343210 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
+import errno
 import os
 import shutil
 import tempfile
@@ -860,7 +861,15 @@ class RecipetoolTests(RecipetoolBase):
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
@@ -868,8 +877,12 @@ class RecipetoolTests(RecipetoolBase):
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
     def test_recipetool_load_plugin(self):
         """Test that recipetool loads only the first found plugin in BBPAT=
H."""
@@ -883,15 +896,17 @@ class RecipetoolTests(RecipetoolBase):
             plugincontent =3D fh.readlines()
         try:
             self.assertIn('meta-selftest', srcfile, 'wrong bbpath plugin f=
ound')
-            for path in searchpath:
-                self._copy_file_with_cleanup(srcfile, path, 'lib', 'recipe=
tool')
+            searchpath =3D [
+                path for path in searchpath
+                if self._copy_file_with_cleanup(srcfile, path, 'lib', 'rec=
ipetool')
+            ]
             result =3D runCmd("recipetool --quiet count")
             self.assertEqual(result.output, '1')
             result =3D runCmd("recipetool --quiet multiloaded")
             self.assertEqual(result.output, "no")
             for path in searchpath:
                 result =3D runCmd("recipetool --quiet bbdir")
-                self.assertEqual(result.output, path)
+                self.assertEqual(os.path.realpath(result.output), os.path.=
realpath(path))
                 os.unlink(os.path.join(result.output, 'lib', 'recipetool',=
 'bbpath.py'))
         finally:
             with open(srcfile, 'w') as fh:

