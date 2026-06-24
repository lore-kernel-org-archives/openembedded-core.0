Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175BECDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 12:44:26 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6140.1782305058372622363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 05:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=dBxcHScC;
 spf=pass (domain: est.tech, ip: 40.107.159.13, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEgf3VlyxE0ia32euVqztSJ7isbNKrXwSBnvb+AKmebd4NjUfoX25OkLoiQIdwIJJdzUN8F5cK9PMwR84vvpx2KOxnLWFY8CbB0unE+8CUugOI8q4UAWIniU0HU/6/LD4FPN+AOptAFwA/m5M7hyxmP9YKz5saLc884R6jogP31Ji9nHXeaeiHW2C/WGwe+u8kQcSRiEZMSzUUplpwIdMaqSAHMBfg8Ig++5HtdnSBYk07YCviMh/9OeMz57HdXd+L9KKwmRROYms/+3ro8MTO36WVr4AIZO3G3t85RwM9XypQ1m1Euh6E3y98AOk4u9JCK1SJnL5tHX21Gpe+eJXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liFTwExOzERe2SEGf5Ig3dMjCg4JeCQgiAlbEpo0eo0=;
 b=WWgcYX3nfwqsHJ+IPEqM8dwQ8RfRGRm4WVvPCHZST6ohzl8U7wCxQjK71G00M1fPWCe8XqODpBAPWbmC850Vmy97FI2I7gHPtMbDsOq1U7Ez7sIAZQf0YEzRRnlwnNWWtzRR2zphAaGkQpQrfwOeRXYcfps0g1lumLOq2TpNndvrpePtHW3+isWdNcBfTF16Rwkt/G8n3/I7vtRFKXK8TZbuXpkQ7GMR8dtZRVLdMClO+Ezhzv2ZNQLlEBLgfFCJ06InHu29DM6BxLTQ0u2001cR/saP01ZF/dy1jLnuJewIP4X94qvMESyA2HaDxBlApGNwioSQNhF7siZGsX3G3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liFTwExOzERe2SEGf5Ig3dMjCg4JeCQgiAlbEpo0eo0=;
 b=dBxcHScCvTlwNtVQDxNELzdrAPF33xpnDehzqGduHfZmd6pCkFALpEs/rGnlE9jdm2tI9ccKHgIqwyJ/7ZNGcxkSD4LVCVsXJGODynO/nx706ZLtufvDdurd3BpqdvgW7I5+SrwpWAH0CErCbxHa0lQgqWwH4N76Z6NacVZvhIpPhqB/lV4b6W4R6dp+dg3EufkSsnXlw103QVoeLi6tGx1+P9wFTAtbYYYLElUWHiC2wfI3Q1kZ1ldO7+HM/wTc3a36W+iJBohoHUCDvkKA6YQtXkl1gdpxme2FQQRvJIWfTOcqOQtIcPlNhfrKKKlB2Y6UGHbVk7U3t5Z7WI9yyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 GV1P189MB2739.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1c9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Wed, 24 Jun 2026 12:44:18 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 12:44:18 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 6/9] oeqa/oelib: test GitApplyTree patch names
Date: Wed, 24 Jun 2026 14:44:04 +0200
Message-ID: <14738a2a62d7cf0de544fe41a10513e9b8a8947d.1782304923.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1782304923.git.anders.heimer@est.tech>
References: <cover.1782304923.git.anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0014.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::21) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|GV1P189MB2739:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d5a876-047f-433a-4c60-08ded1ee4ebc
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: A0sK9YqvCjLh12pG+cJnLtPK8Arx63MU+7ub+vNnmugadgNgX7xBgPdiaz2erzc/2KayJTf5/Bz24G6ltRcJ7cQbafSZFsi4oVFGyI+skL76v3e2hvbkT05AAWuhdE/MhJfSp9s4k/VTcEFi+lubfs+ybleI4k5QVPtGBP+MlmAOqZiVhXqcCAM9hthfDJGieYiA1JiISKmZU1+JUYDxDkLU3jnxpIDAkLMOOk5ZwOMxlN3KVla5L20gL6C5tdhO6wxolSEqmLpH/xwNNKZtLWBweRD4izyLooinnZFETzF3AYwX9FmSc/kQdxsqhty8/77c5wXhVEQN+ltkVKlezQ9prPP6zjV9D0TlAJIybUy9mDOp8/BoWwP1IwRBj6w4pmwwWQqyE7lBY6nmhamNnbTxFQXCubP9iBNiHfpqQXSrLVpvP/VqHzqLcL/3zNQB2KsZBZavR+i5JFerplN5eI6NmDbg51iGTcnVNxOigFThprXEDmkRxJB7j18ZB0SZzdu3ZiJkhYWdrt1kBO66KiGp2CAm5vJ9ThwZE57NpYSzs8YsevEOEhxO1v9NYRYDV4fT5idJcRoLS15O9JF0tZULEFbOTXrc0IXjBQx2IlNsj8A7pZvX/qiuQfN3PuU+DXyPiOTGh/LMyOBxsR7RHZyfQElORqot0oDH4s0xayY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V6eZOfIuwAJxiclSYrnd8ZQlbfE7I/QjQXSw0OUae+AsjSt74u5p9EZc3U4f?=
 =?us-ascii?Q?qpiPCVUi46b12Vl+yIyikV2Qto89XDmnTSGaTZvhFgIK6iIF+XH3+1vskj0A?=
 =?us-ascii?Q?hC+JV9PVf2r+cZJmM2//KOuUJhCRingjPvta39gil4mN0sMFAIAFGKvUgktM?=
 =?us-ascii?Q?RDu6B2p98FMFs+HXZkqIv4P1tCUokwRuqH4yojp7n34Xz78sYweL//JUwWh1?=
 =?us-ascii?Q?tx3gOhAzMxVcW02TBplUbW0aqCx91g++qRCfKC7epKFu1pRHmaHmrYZZGgY+?=
 =?us-ascii?Q?W3EVpbOtfU9Uhcm6i+l2SdValp57lidcBYSRrL1q/rLAO9mDcEXiV8xJJ32c?=
 =?us-ascii?Q?e+5gZCBzL1MzreHUSKM03U7lepWeNU2HldL1EGTGl/rO6UqZCiBvIEr2hVfl?=
 =?us-ascii?Q?JPLoB4lvPCGj46liKqSLduOaNEV6glOL5yS+ENNSUghJSC1SSuZTsRcy6zEJ?=
 =?us-ascii?Q?zRx/MtOjl5dXaizF8F3dLu8u8pbRvv9t55IrPbkXtB9vdYragKbYQurn+Liv?=
 =?us-ascii?Q?2xYSe8X4eNyOi7mwAM0QIrVwoewCFm7DY1OXBdc2+RC3/N9yJVyZQjyQNQO2?=
 =?us-ascii?Q?7r9ZtbWZr0XIMKm8Jdjk9fQLyUQINo3+0Txv738EzLbCxtmZh1o67jDlnjWx?=
 =?us-ascii?Q?/4ohQT0hV3Lv1LlNGf1uBfyzpDkRwJdMXumxRCNiFSVpD/eqxekLQZDJ86uX?=
 =?us-ascii?Q?0fbYhZp9Y+mSVIPTmi2qZ8HcBnc3aVs5hCYn9E2za9z2XVhkUjLouheJK3RB?=
 =?us-ascii?Q?kqQvZ81WolqYKTVB1qDNGUfmeWDxy2kRaa770zlN0MVfzZmcPtWn9nAP2Ch0?=
 =?us-ascii?Q?+cspyXu+waKalcm+Vx9kwwNBagph189sYXcQoEFZxjJkpD5OpwCP5woxQrTg?=
 =?us-ascii?Q?UdU3Vqn1Sf4hLz+851xPPGM1snLyp46zcfW2hFASmwQLXHhRhNm1GtPMrzpY?=
 =?us-ascii?Q?f9GEP7IRiY6C+mzD2W0j2AzkthBHb9MpkWLh31yh+CculXUvujYGQX6a0Kwr?=
 =?us-ascii?Q?V0YgwBkOs8T2fzdoIyNMXu8Q7PB7qkL4q1IkA1ugUGWdPqBjI6I5aM48Uunb?=
 =?us-ascii?Q?TzDc4NHcO+/apq0QsJ2+LQrlrRdIW6/sTVnteRsOQBmhsoCzz+l2l7fCFU5Z?=
 =?us-ascii?Q?nVIKdMRW9YTCedDMrspuluKoD3bv5yEwr54CbSNqeV1Z654yNqFNx6ZKW1Fm?=
 =?us-ascii?Q?do9XOnJbKt9BaC3xWvLZ+627qLvgnSNLsPbmNzykHeBF47IlQLB33KZxGq0e?=
 =?us-ascii?Q?UT+gI/XNNYyTOjqM8tx7pO3VkdQV0smBVy7KSQudsROavXM8hVtBoH0Q3zkI?=
 =?us-ascii?Q?w0Lqfvv/g+pwlEuI69Bt0OC1t05svHKuL/GE79SZrTcWotECoadxJv3YFjCM?=
 =?us-ascii?Q?ALV73Uxjl8VjrPnLejvdCvSQSTHHzGuIU1Vu5sR+sCCglx4/0yMHRRVPxruv?=
 =?us-ascii?Q?i5KsR9R9t4njwh5+IsPUPJH/A5cGtNIfHr1wsfFef7EHFO1ka9EvYNqhelOC?=
 =?us-ascii?Q?+Iku+pruPRpyLjohIa5zmcWnU2OJdjRus+jVoOoimGyPXZY7/apQyRe28ljn?=
 =?us-ascii?Q?0Dgnr6dTG8krz8YmZIxFCZm61fing6TquX5f7G1BvcUYjgthaXfrapJRBQV4?=
 =?us-ascii?Q?OY2UreIi4j6R+2fQ4iGawx9JhmP4rcvAgxyDyjX7IMUPoj/VbbY5YQxEwOgH?=
 =?us-ascii?Q?CBFRdb8jGsviCVCIaivhUHqtmWxE7DYwmTrSqg1oZQHqViqePLePXqS01V6k?=
 =?us-ascii?Q?6/B/r4kPlg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d5a876-047f-433a-4c60-08ded1ee4ebc
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 12:44:18.8015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJneC148cpwQruOJIlXpnR9wtpiAfI3c7VA7KP3821cKbAvpolzHnKmIsMZAef6KHBZHyOWOZQQ3A3WMhf5uGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2739
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 12:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239501

Exercise both the git-am path and the fallback commit path through
GitApplyTree.Import() and Push(). Verify that refs/notes/devtool records
the original patch filename and that extractPatches() recreates patches
with that name.

AI-Generated: Claude Opus 4.6

Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/lib/oeqa/selftest/cases/oelib/patch.py | 136 ++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/oelib/patch.py b/meta/lib/oeqa/se=
lftest/cases/oelib/patch.py
index 4cbfef4ce6..69e06b5ac1 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/patch.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/patch.py
@@ -4,12 +4,28 @@
 # SPDX-License-Identifier: MIT
 #
=20
+import os
+import shutil
+import subprocess
 import sys
+import tempfile
 from unittest.case import TestCase
=20
 import oe.patch
=20
=20
+class PatchTestDataStore:
+    def __init__(self, workdir):
+        self.vars =3D {
+            "PATCH_GIT_USER_NAME": "OE Test",
+            "PATCH_GIT_USER_EMAIL": "oe-test@example.com",
+            "WORKDIR": workdir,
+        }
+
+    def getVar(self, name):
+        return self.vars.get(name, "")
+
+
 class TestRunCmd(TestCase):
     def test_runcmd_preserves_argv_elements(self):
         output =3D oe.patch.runcmd([
@@ -43,3 +59,123 @@ class TestRunCmd(TestCase):
             ])
=20
         self.assertEqual(ctx.exception.status, 127)
+
+
+class RecordingGitApplyTree(oe.patch.GitApplyTree):
+    def __init__(self, *args, **kwargs):
+        self.commitpatch_called =3D False
+        super().__init__(*args, **kwargs)
+
+    def _commitpatch(self, patch, *args):
+        self.commitpatch_called =3D True
+        return super()._commitpatch(patch, *args)
+
+
+class TestGitApplyTree(TestCase):
+    def setUp(self):
+        if shutil.which("git") is None:
+            self.skipTest("git not found")
+        if shutil.which("patch") is None:
+            self.skipTest("patch not found")
+
+    def git(self, cwd, *args):
+        subprocess.check_call(
+            ["git"] + list(args),
+            cwd=3Dcwd,
+            stdout=3Dsubprocess.DEVNULL,
+            stderr=3Dsubprocess.DEVNULL,
+        )
+
+    def make_repo(self, tmpdir, name, text=3D"base\n"):
+        repo =3D os.path.join(tmpdir, name)
+        os.mkdir(repo)
+        self.git(repo, "init")
+        self.git(repo, "config", "user.name", "OE Test")
+        self.git(repo, "config", "user.email", "oe-test@example.com")
+        with open(os.path.join(repo, "file.txt"), "w") as f:
+            f.write(text)
+        self.git(repo, "add", "file.txt")
+        self.git(repo, "commit", "-m", "base")
+        return repo
+
+    def make_git_am_patch(self, tmpdir, basename):
+        repo =3D self.make_repo(tmpdir, "source")
+        with open(os.path.join(repo, "file.txt"), "w") as f:
+            f.write("git am change\n")
+        self.git(repo, "commit", "-am", "git am change")
+        patchdir =3D os.path.join(tmpdir, "patches")
+        os.mkdir(patchdir)
+        subprocess.check_call(
+            ["git", "format-patch", "-1", "HEAD", "-o", patchdir],
+            cwd=3Drepo,
+            stdout=3Dsubprocess.DEVNULL,
+            stderr=3Dsubprocess.DEVNULL,
+        )
+        patch =3D os.path.join(patchdir, os.listdir(patchdir)[0])
+        renamed =3D os.path.join(patchdir, basename)
+        os.rename(patch, renamed)
+        return renamed
+
+    def make_plain_diff_patch(self, tmpdir, basename):
+        patch =3D os.path.join(tmpdir, basename)
+        with open(patch, "w") as f:
+            f.write(
+                "Subject: [PATCH] plain diff change\n"
+                "\n"
+                "--- a/file.txt\n"
+                "+++ b/file.txt\n"
+                "@@ -1 +1 @@\n"
+                "-base\n"
+                "+plain diff change\n"
+            )
+        return patch
+
+    def apply_patch(self, tree, patch):
+        tree._need_dirty_check =3D lambda: False
+        tree.Import({"file": patch, "strippath": "1"}, False)
+        tree.Push(False)
+
+    def assert_note_and_extract(self, repo, patchname, expected):
+        note =3D oe.patch.runcmd(
+            ["git", "notes", "--ref", oe.patch.GitApplyTree.notes_ref,
+             "show", "HEAD"],
+            repo,
+        )
+        self.assertIn("%s: %s" % (oe.patch.GitApplyTree.original_patch,
+                                  patchname), note)
+
+        with tempfile.TemporaryDirectory(prefix=3D"oe-patch-extract-") as =
outdir:
+            patches =3D oe.patch.GitApplyTree.extractPatches(
+                repo, {"": "HEAD~1"}, outdir
+            )
+            self.assertEqual([os.path.basename(p) for p in patches], [patc=
hname])
+            with open(patches[0]) as f:
+                self.assertIn(expected, f.read())
+
+    def test_git_am_preserves_original_patch_name(self):
+        with tempfile.TemporaryDirectory(prefix=3D"oe-gitapply-am-") as tm=
pdir:
+            patchname =3D "0001-distinct-original-name.patch"
+            patch =3D self.make_git_am_patch(tmpdir, patchname)
+            repo =3D self.make_repo(tmpdir, "target")
+            tree =3D RecordingGitApplyTree(repo, PatchTestDataStore(tmpdir=
))
+
+            self.apply_patch(tree, patch)
+
+            self.assertFalse(tree.commitpatch_called)
+            with open(os.path.join(repo, "file.txt")) as f:
+                self.assertEqual(f.read(), "git am change\n")
+            self.assert_note_and_extract(repo, patchname, "+git am change"=
)
+
+    def test_fallback_preserves_original_patch_name(self):
+        with tempfile.TemporaryDirectory(prefix=3D"oe-gitapply-fallback-")=
 as tmpdir:
+            patchname =3D "plain-diff-original-name.patch"
+            patch =3D self.make_plain_diff_patch(tmpdir, patchname)
+            repo =3D self.make_repo(tmpdir, "target")
+            tree =3D RecordingGitApplyTree(repo, PatchTestDataStore(tmpdir=
))
+
+            self.apply_patch(tree, patch)
+
+            self.assertTrue(tree.commitpatch_called)
+            with open(os.path.join(repo, "file.txt")) as f:
+                self.assertEqual(f.read(), "plain diff change\n")
+            self.assert_note_and_extract(repo, patchname, "+plain diff cha=
nge")

