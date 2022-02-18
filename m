Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75EEFC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 17:49:48 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.117])
 by mx.groups.io with SMTP id smtpd.web09.345.1645206581294651029
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 09:49:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=ZBh6MiD6;
 spf=pass (domain: arri.de, ip: 40.107.7.117, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiMRwCHk38aHQ23LS9I0YiNU8XAKnYikv2NwQLOZwsLgRXHeL4PL2b7ZUbGg4URT50SedVESe8CguIre/0Thkua4L3u0sJVkZX9fdpKCkCTK0ccLJ4eMcaqlaaQj+VAL40ScyowFZ45Z4ayqM7r4+luh1nYRRxjoSQ8HhqIkftoZGnL1FkbOoWH8+4YcKRCJXJbC0ziRGDQmJpT53KwJplM+bk+KPcxoQ3a4gj22+kyn1jNLxS2IrWm8+QA7xholFY7RF4lQJUK5iakwaeX0wZb+WCQ+mnyd9SYc+llsMOHNbtDFyvjiolIQkjfEz4pLFcvzNmyItqvHQYQSDMAasg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8LLnU+a6oXLw4/9/OzDXXs2m9/2+XEpyowY2G4d1Y8=;
 b=jzsuPp6c+0HyWFE0qVuEbroGhXouuQ1aykWTKN65kzVpBc9YvR//+JDTqh5AZ+vVyBLDsbgmnWjg9m7UuapP3xlH+nWOkdTSd+QGq2Z2b1vtUsaWoYfLu5ymkaUQdJyBqWp6fgbNVpF7iKug0SiXDN18Si4LJIB5zaKFZd4SONFUpxxvecB+62BoXyqrIe91v5E/F8hbXmX6+nKiHQjbe+aRXLdygurMhre8FLuWPCiOj2Um25ZA1UbTI6ifQTBZbmXtnxjr0adlZ0iqzdfRLH2sU0Iv3Jobw3inGNjbALVOYtEwh/NQKRFKqahfirU+x1lyqR20/cWxXxlmzkf7lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=huawei.com smtp.mailfrom=arri.de; dmarc=none
 action=none header.from=arri.de; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8LLnU+a6oXLw4/9/OzDXXs2m9/2+XEpyowY2G4d1Y8=;
 b=ZBh6MiD6QIOzOp1mstsAyMSyb7MGvgdcB2zQ5GpNBrI1QXTAJjy7NpXKj0hcQ8e4ebawKT2UAwQKco5xawmScLx3TXwUdzvZ3qLfFEZKSGvVauY2Ef8ZqThqYxpJu38eohFaXjMWY/I7ok6evN25IU26ZWY0CSNjh973j9si8Rg=
Received: from AS8PR07CA0033.eurprd07.prod.outlook.com (2603:10a6:20b:459::21)
 by AM0PR07MB5953.eurprd07.prod.outlook.com (2603:10a6:208:108::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 18 Feb
 2022 17:49:37 +0000
Received: from VE1EUR02FT037.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:459:cafe::ff) by AS8PR07CA0033.outlook.office365.com
 (2603:10a6:20b:459::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.10 via Frontend
 Transport; Fri, 18 Feb 2022 17:49:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT037.mail.protection.outlook.com (10.152.12.195) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 18 Feb 2022 17:49:36 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 18 Feb
 2022 18:49:35 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Fri, 18 Feb 2022 18:49:35 +0100
Received: from localhost.de (192.168.54.90) by mta.arri.de (192.168.100.104)
 with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 18 Feb 2022 18:49:35
 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Pavel Zhukov <pavel.zhukov@huawei.com>, Christian Eggers <ceggers@arri.de>
Subject: [PATCH] Revert "patch.py: Initialize git repo before patching"
Date: Fri, 18 Feb 2022 18:49:22 +0100
Message-ID: <20220218174922.20464-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.90]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da9add81-ce90-43e8-48bc-08d9f30707b0
X-MS-TrafficTypeDiagnostic: AM0PR07MB5953:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR07MB5953C3603A4224F65F0CAF60BF379@AM0PR07MB5953.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U7JSZdbNz0wyA/hz0ufjoNlL3XSd1f/uRsJ8pYdp6M1JOoAktPPeiqmG7ntrUyBbANK8HNXXyBBtB6NldoTt+pzBbo+gE/rJLh/7sAf+inWlq6zcMNbhfdEa9ttTtEeT76RUB8KY47H7r3aIFN7PlMliNcduQPJfVGIXLzzml//VGiM6JIrLHxPbnEKQEf2Ydn6YDIu717BS7miHAEm7ZnOhLHtw7R5cnJPQSPQvRjTtyzrBwMpG4V3QdnBbygUcn70c5SitOo7ZkFOcoMJvW8Kgj1/24Q8iUgjckqoHDmZ9reJhw10de5AmupUw+JVAsAnwA5XbehDsaWfwILJf95ohtGOk2pTDyfwPk5ZtjpyvFE5DtsDX2UROLAZyIJ4aljcD3TczZGu0hP8hsnCfvmf0UGj7sMjE/usR28FRsc5W2/SxASj756plWSqrXjliJmqPzwWX/MW1bvbyEAwCrR6zvIiHpwFrPaVVUiLBfre87hG+Dv2TVuc+ADKR2P/Bf+re5Z5VurZYUw4fWHqo+I6dE/a9K5TV8Yb8NwzNcZvx+YqqaoUlJ7fQEof/R1kpemfvtQc76BvRWm+LkRk63ZaKMuGL4Zp0TkGDBT95H+MTtE2N2IzfZFTnGxV4OrwNo0WqstpKmaotBzjAmQdtBBcRbPtNPXTFHNSKwQ0m74MdQO/jTztnzA02bi+kkxPVC/CtFgzFhVUvrw3XuGcLRZAtHhvfPt3MHKLdh1mS0lIzZghjyoKzyytApWizAe59kO0xw+UFpaETiybob0cfAw==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2616005)(107886003)(316002)(70586007)(82310400004)(70206006)(5660300002)(8936002)(86362001)(8676002)(47076005)(36860700001)(1076003)(336012)(356005)(4326008)(83380400001)(16526019)(26005)(186003)(40460700003)(81166007)(6666004)(2906002)(508600001)(6916009)(54906003)(426003)(36756003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 17:49:36.8481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 da9add81-ce90-43e8-48bc-08d9f30707b0
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT037.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB5953
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 17:49:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161948

This reverts commit 6184b56a7a0fc6f5d19fdfb81e7453667f7da940.

The above commit breaks building of recipes where sources are checked out f=
rom=20
Git and PATCHTOOL =3D "git". The do_patch tasks fails before applying the
first patch without any helpful error messages.

GitApplyTree::_isInitialized():
+         cmd =3D "git rev-parse --show-toplevel"
+         (status, output) =3D subprocess.getstatusoutput(cmd.split())
The cmd.split() expression effectively runs GIT without any arguments.
Using `subprocess.getstatusoutput(cmd)` seems to work.

+         ## Make sure repo is in builddir to not break top-level git repos
+         return status =3D=3D 0 and os.path.samedir(output, self.dir)
Exception: AttributeError: module 'posixpath' has no attribute 'samedir'

GitApplyTree::_initRepo():
+         runcmd("git init".split(), self.dir)
+         runcmd("git add .".split(), self.dir)
+         runcmd("git commit -a --allow-empty -m Patching_started".split(),=
 self.dir)
If _isInitialized() returned false although there is actually an initialize=
d
GIT repo, the last command fails with 128.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
The "git commit" command fails only on my CI machine but not on my dev syst=
em
(couldn't figure out why). This means that on both systems the existing GIT
respository is erroneously reinitialized, but on the CI this breaks the bui=
ld
while on the dev machine the error is not noticeable.

 meta/lib/oe/patch.py                    | 16 +---------------
 meta/lib/oeqa/selftest/cases/bbtests.py | 15 ---------------
 2 files changed, 1 insertion(+), 30 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 950fe723dcfd..fccbedb519d7 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -4,7 +4,6 @@
=20
 import oe.path
 import oe.types
-import subprocess
=20
 class NotFoundError(bb.BBHandledException):
     def __init__(self, path):
@@ -26,6 +25,7 @@ class CmdError(bb.BBHandledException):
=20
 def runcmd(args, dir =3D None):
     import pipes
+    import subprocess
=20
     if dir:
         olddir =3D os.path.abspath(os.curdir)
@@ -56,7 +56,6 @@ def runcmd(args, dir =3D None):
         if dir:
             os.chdir(olddir)
=20
-
 class PatchError(Exception):
     def __init__(self, msg):
         self.msg =3D msg
@@ -299,19 +298,6 @@ class GitApplyTree(PatchTree):
         PatchTree.__init__(self, dir, d)
         self.commituser =3D d.getVar('PATCH_GIT_USER_NAME')
         self.commitemail =3D d.getVar('PATCH_GIT_USER_EMAIL')
-        if not self._isInitialized():
-            self._initRepo()
-
-    def _isInitialized(self):
-        cmd =3D "git rev-parse --show-toplevel"
-        (status, output) =3D subprocess.getstatusoutput(cmd.split())
-        ## Make sure repo is in builddir to not break top-level git repos
-        return status =3D=3D 0 and os.path.samedir(output, self.dir)
-
-    def _initRepo(self):
-        runcmd("git init".split(), self.dir)
-        runcmd("git add .".split(), self.dir)
-        runcmd("git commit -a --allow-empty -m Patching_started".split(), =
self.dir)
=20
     @staticmethod
     def extractPatchHeader(patchfile):
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selfte=
st/cases/bbtests.py
index e2b9290200ac..487568c907e5 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -298,21 +298,6 @@ INHERIT:remove =3D \"report-error\"
         test_recipe_summary_after =3D get_bb_var('SUMMARY', test_recipe)
         self.assertEqual(expected_recipe_summary, test_recipe_summary_afte=
r)
=20
-    def test_git_patchtool(self):
-        """ PATCHTOOL=3Dgit should work with non-git sources like tarballs
-            test recipe for the test must NOT containt git:// repository i=
n SRC_URI
-        """
-        test_recipe =3D "man-db"
-        self.write_recipeinc(test_recipe, 'PATCHTOOL=3D\"git\"')
-        src =3D get_bb_var("SRC_URI",test_recipe)
-        gitscm =3D re.search("git://", src)
-        self.assertFalse(gitscm, "test_git_patchtool pre-condition failed:=
 {} test recipe contains git repo!".format(test_recipe))
-        result =3D bitbake('man-db -c patch', ignore_status=3DFalse)
-        fatal =3D re.search("fatal: not a git repository (or any of the pa=
rent directories)", result.output)
-        self.assertFalse(fatal, "Failed to patch using PATCHTOOL=3D\"git\"=
")
-        self.delete_recipeinc(test_recipe)
-        bitbake('-cclean man-db')
-
     def test_git_unpack_nonetwork(self):
         """
         Test that a recipe with a floating tag that needs to be resolved u=
pstream doesn't
--=20
2.34.1


