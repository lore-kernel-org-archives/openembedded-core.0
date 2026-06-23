Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CF8CDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:35:48 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20964.1782221738840881784
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=FmeCP11F;
 spf=pass (domain: est.tech, ip: 40.107.162.56, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtXaxydPBenTzJa9dRM8vhLiE8oUkgBnBKA/EJRoNCJ5wIChIziU8CJZH/ItsCKaU9LeVQVxAe3dzddqQlOo2a7P+zuU/TeP+1KN+sbwKcYbZO6lY5g00B21huZaETN3UmOd9ql0KveByTjeS83qldNjBhhxDvI9OAVA7iIHx/e7trJpPBZ47drP5NxUoYd8lJ3xflWVqGSIpWQEuURpIV1jMxP9RnXDyL0pa8caA1ZGihbfMN+2xLDNO67qWFd6JnBoHQZAY6mHFNiJLIiiWW9eC7LK9cgFavRlPdCFlFj/6V4B2Nqfi/QewwVSNobM+ttTqs+tJ5PeNL9EwEMQ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liFTwExOzERe2SEGf5Ig3dMjCg4JeCQgiAlbEpo0eo0=;
 b=c5FnOMSherRNhb+uB1or76Rp28101kHZ0+OX/q2atKZY2NK3LgTiZO30CUq64uHxW/9m0Ef8MOm4OuLh0E18dOg4Vvi9feOnQHvRSPqfnLLSqhdhV/s+yXfpXbrBJ0HdmjT9WJq0dj0ZvzUoQ1AaMuI5wC//4vorpyFdpvhxpZtlgOexoq1wtJ5XNkA3BEbbCzgBLoQ6WDWroVYRwfWrJV0E0i05CPDHD5DwbqglQVQF6PzYu+PMnFQFtY3P79NVJfBksurE1E4xDuam9C/HghXaI0cS469O/PtbjUhx5u+cTf6KyuSFNBV9S/6fn7+YlGy1/a3fIpi/GsJnYocD4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liFTwExOzERe2SEGf5Ig3dMjCg4JeCQgiAlbEpo0eo0=;
 b=FmeCP11FBFrYoZz0lrQ+6/dgSRVgdQ2FqsTbztjLO4CX44frhS9YCyDzKT7UdGWMwft2QzWZjXpHV0f2kfrxkgMJjOY4yptE+eAw7rZbccbQWdzEsuLpX+2qW5oOgSJBz/gNZzgbmssLfje6LEPfs2H/LCodK9oJAx7kThscfy0h1mXAhesOAULRHlUsbSFc9n+WIgdBLlowwu8QqeOy9OCRV4qG5ucvFbncNcVo9YQGd7F4BCo0jzLGG2byqiz5ePW+7gyaTZtIDg03iwL6eND+fOAljhJBfNvizuRM8JNjJFkfY/WRXndrojkXrfk0n4zsien+9NVl5KhjNkaPkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 VI0P189MB3639.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d7::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.19; Tue, 23 Jun 2026 13:35:34 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 13:35:34 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 6/9] oeqa/oelib: test GitApplyTree patch names
Date: Tue, 23 Jun 2026 15:35:18 +0200
Message-ID: <20260623133521.17053-7-anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623133521.17053-1-anders.heimer@est.tech>
References: <20260623133521.17053-1-anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0001.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::10) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|VI0P189MB3639:EE_
X-MS-Office365-Filtering-Correlation-Id: b005464d-ca7f-4869-2723-08ded12c4da3
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|11063799006|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: kSyuWY6CPXUhbbQpQ3aZCGots1qQ5Ed9FsMXpJOyFxyeNcUvpdB8vo3HS9+aENRFF0PWbo3Ln6PMnt9SWqYR5zHdl2TW7y9oz6QcT+guEk9u08RzEZWfuwbmeyTsePxKHZPWMYG//MF4AtAC4/pTy46r1taVQcAjXeOi2pkwjQryHjZHLp+KVUWaq7whzZ3f856029V138QPhpl5ySLPK7zqvsCCysamIGnGkkfZVOC/x4O0Km+iYw6kWavDzNKEiBlwwra5gYZD4+7zCP+c6PisY6db4Vm7Tky6PIiUSAESSnXzro3oYltIO6RwuL7q5DJz7k+RF+DjK974XapqYBz1zIvBr02zhsTZ3KZMmmoANUjS6cYJWsBIdBjXCTq8DKbl0wO/d2Un50gPt+Fot6qGyIJEWlZailbQC1/MyEgzoJ/qJjIjLGjewD6+G5L7+WJ6r0Kg9J/y8Gp2fk9XJZ1wW9BO2QVbE2z03ESOQOiAn9/sHjHgEEKZRDui+CCrT8OZO0XuwRd4HdojRaGcEsVicKwwekhLAlUrJoUV/eQn3L1OgIHoOF2jaywHy0qItVYSirRL/CYX/yb4gThYE3Exmw+3uXjTeiu5oI1o38r27hf8qeQ5akazkV7Uz53SMCTFe7+8QutMl4OSvFiGZ3CwBawPxEHZESOpG/MEte4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(11063799006)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EF5CFO9geP0toEWJgg+GTyiqBrLW+Dve3cvLrTn108WSAueb9FCe4Ygch0lJ?=
 =?us-ascii?Q?EOyxGHZk2PmMV4kG0GvONliT5c4WE+ZeYcaivKdwLCHrRWgW2oXRH0+cj0so?=
 =?us-ascii?Q?truypLkWGXLeNECw7VAPIx9Z4D53CJEe+vnR09II1kkPic1amEniYpwd+n+X?=
 =?us-ascii?Q?8l5BIDQaP32ooIWcWs7UEFSEMBMjLUpYKlP2mXYwTkeBenbSmUYSMBMHFqN0?=
 =?us-ascii?Q?NHBfdhpgy+m3WSdNMqZyu8wZ1q9f2K2VRh/70Hg4nngwIwIysbeWMqD6Lojx?=
 =?us-ascii?Q?EFRUd0/p5xMxmcrtjUS310fQ25GMMSXkBFYl9MSiD1Tbel7bgJvRRUFLphEz?=
 =?us-ascii?Q?eTPYVfm68khkoSryDJ1/Kz68yFPJeHlWexJKSD3huGqIFJovCY3jtSHL5eIY?=
 =?us-ascii?Q?RZwzZZE2PAY6e5BHVbBnE1wrwK+CQ+sEbFTgHgXkcJQ3LdtVHPkGH+D5lU3o?=
 =?us-ascii?Q?oOa0dXr87A0/ZBv8Ms4lnUpo6FopmwwjAYEgjvW89uou0RXBEKlbn+Icxkyx?=
 =?us-ascii?Q?3t4BaHkhhXzKemioHOfIjjy9vB5HpVWiQGe2SVS3/iCIru6bbky6H+4ieAk4?=
 =?us-ascii?Q?4cKxEXkaWkAtUvn5lq5SU4IrvLjPZJAN/VBbAqaJnjRZt3R2m7uj1Qm0EywE?=
 =?us-ascii?Q?Bkh9Tmu6wOew1vGq3V2dYRuhpPydB77dHocXNJtAuJY0DbN7b9wrsfFzaFmu?=
 =?us-ascii?Q?oHtjXBv34iSbRVxPj4cOybvfaghVNFin5TUuC6SJR0PUcUI25RySA+d/bYPG?=
 =?us-ascii?Q?AB8lTmxr36yES6uFc20ku+2gM1V04kKSHvn3l1rXxNV+cyk//P7MCaMDE0qJ?=
 =?us-ascii?Q?MD3wdFYumUDOgz0OOWn230hQkzPrk+aAS4hFPxDLIT+EOFZ9P6ER5OMFb9Qz?=
 =?us-ascii?Q?x3DJdwjKJJeLVRZzsnKfLVXfs7XmA3h2A8QkG2zcazAYxZ0wBKU9xaSvFaJj?=
 =?us-ascii?Q?QOoeLZW8/hbzbQBHKOvenw9yY65bbC03vsCRrxc3WHd8DEfWca7nwLsQEsoU?=
 =?us-ascii?Q?BCN2rBf6ayiQHZeZA9wF4reh6c7Bp/X8K9LL/8VndGxo4ZFMN2ACtG35wRM5?=
 =?us-ascii?Q?/ds50qLvZxTwhNwzq4WWaBRibU31emd+NUy3WF6pNLFdx4XvYAFz+i3QW9rI?=
 =?us-ascii?Q?tOtxWWzFfzg6llDMZ6yim+UBnvrstH2i+4N+nC9lRotRE/DzWLOJYheno5Wr?=
 =?us-ascii?Q?ce/41ETsBWs05BNBXwqBaJaLpU/+ixM120mWbWS3ooApFBqLEuewg9SLTIw4?=
 =?us-ascii?Q?nP+RJn8L0wgmPClcjmTfFT1i3p/6K5+hUBCH16/FQMK0XCwNIvmR2wqcZimT?=
 =?us-ascii?Q?3UUmQa8v1qMo2tT1Q+Zo96fm24Yq/FX+iz4jy9Lu8Gg8Bdz8e26Coy8hHmN0?=
 =?us-ascii?Q?YWCtmS/bUmLBdlFcxILxfNaDqqA6yi9IzCcuvsWFUyWNGyb68T6CA1sMs4ZH?=
 =?us-ascii?Q?3q249tH8NvA/PA/ciSNN/k+SAcApIH4uiU7cg8G8U156YJQGDE1BEMNQxLai?=
 =?us-ascii?Q?YiUPFiyZYP950d7DI2OUV6QQneA9N8rizR+mkkfBArf+JKxbTLXftFCEWoTU?=
 =?us-ascii?Q?RR3Y5NvWedYUqBMWc0TOlCGaeFKM9Xa3L5z1EaKmn/6wsoHW8Np6zDcej0jf?=
 =?us-ascii?Q?sxoe6/CKoB8X+Lzbb9pBp/8BEoGndw4XpmOmawFq34Xwn4/uJvnXqWoXCmgt?=
 =?us-ascii?Q?+OqR+uutZd4sr0/PjFn+TXtRDE9YUveoL+wWx7YSwom7HdxB+N0VH14VhZHM?=
 =?us-ascii?Q?w9xAJ+gTVA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b005464d-ca7f-4869-2723-08ded12c4da3
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 13:35:34.5166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /nd05GdlLXA2YGF6y7JUfOPirQqU8UsZfpyOCq8z4+EbcmUuhDmDcDrlbTHm6tv4eOlNN4EEFFEtZC+BYKyLyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3639
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239399

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

