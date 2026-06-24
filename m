Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FA0CDE009
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 12:44:37 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6115.1782305068329570639
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 05:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=XvfsrSKZ;
 spf=pass (domain: est.tech, ip: 52.101.65.1, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqksTdncu6Y8ie2o4IjmlqSA68JaFNAeQV4gJhgnrR+dJmIbgxSug4+jI0ixHQHxm9BUWcfLlTi527UXohFzInEhFAnQarqj5032MbV9bmRQ8wjDZIOguRbZItj1IwIv34FJPok299QffwSZxOrsBIE++r4RaT/xKtJ8vXtIyhbG3LpFLfOcupMc4q0g1bwro0JCGhTFAywFZq9EXoMVhLZuEKXt4CPfueYsRJySjRG3DfzW384qUOQ0h1h8w/LAE7i2gSjhTM8GHlONjLLCGoREAIu8uK/fT2xTECynGa5Tm6Ki79Xf1LkGwZYvWoNFZU05/8rqOhjV5SrEINXK+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtKKe5vEsVDsVid+Vi/ppNGVN8DQRBVEIVRQMUPZ4wM=;
 b=xbs2IxQ24YeniBz7+/1ahJ0bSRI4tBpXIg0KCtqAdx5+fja4ezfEjt2v6B9UlJxBCikpyFXe0Q3mVjmlwOIEyO1SAfllb0H/dOIse5jK2xYrjqLsB/qnk7RWdtWj31v63uIg3tLKH5aHzZVxxl6U19pvV1DBYLJHYVNZ5IFwtz1G6U6kWud2UPYjkOzc+HqxmnCV1RTLQGFdtDvfz6+FoUjqJS9lbzmQ83+qF+rWbseXwEo2IpdI3hoYB1IbZAPdTJq/mgRK8pa3BGoxiGGz0cvqj53ucp/pdQyA4vH7crikiVBr4HdiFYoGJvuK53R28keXyqKrbbric6ZpnYm/7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtKKe5vEsVDsVid+Vi/ppNGVN8DQRBVEIVRQMUPZ4wM=;
 b=XvfsrSKZtoRIl0IANtxpsL0h6rue2ktqbEGfH3C6ciUN74l1GhWKpj8ybyuzcnwgz384Wp+KXPRAbnp6Y8T5q2qgkdgorkA2xbGOHICeIsLX6zOKIC8a1BBb1HN0b9iSYFuqj3t2NapUzDiMoF7a6g6mXNTrQ65ZF7hCOYzZF0mRFXyaNacZITR99TcovrGrMfO88zvwgMWhLmcUQpvLAr2m/SN2nP6Cx8Sl5/bGp03mSgkkdiqDiGN5+AlqJMltWE7Y/s4F2h5ItAv4bEAj9nlcez6m4Y+k4vDvXzYIqvR9FhnqVl48ido8aEaW8GMgbjmKi7uaHac6vApz3LfTgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 GV1P189MB2739.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1c9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Wed, 24 Jun 2026 12:44:23 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 12:44:22 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 9/9] oeqa/oelib: test patch command argv handling
Date: Wed, 24 Jun 2026 14:44:07 +0200
Message-ID: <ae8b09e393b9f31de9e33c98a45493d61bd6367c.1782304923.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1782304923.git.anders.heimer@est.tech>
References: <cover.1782304923.git.anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0021.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::15) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|GV1P189MB2739:EE_
X-MS-Office365-Filtering-Correlation-Id: fd18492d-5fb7-4a15-52f1-08ded1ee50f7
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: f78UWzuPv1KeOYg5Y4f0Usq3ai6XFjYBCp32kHatzug213tBjol0TiirZXn0544C5pFaFqYZJteG9TzOo+6xEk81uYFJuR8LWPNeAWcrOaf2yFhTDfh8rFWcI68R7mh16hLmMGqnlzF8pl80kZpFvgK4UwIvh1KvR5LOd9hEh73hMy3qnkMm0MSP+hbFBUvrRJ+1+1na4XBy6kkA0UuNp3Qi+X0xWSZ5DlX3UupAlJ8oHVT8bZVHOEn8Fwtww1HeVUl8zGXsWQtG7MdgaHD/HXHM7jNSpAnYBqUgffi2CIFDlVxr4gKY1mhZ2zh8zjNtrQ4e33MIv7d71Vd4wfDxC6rnrzkNNm7kk5HWJP4KdCeqczK2y3Tm71kDE0xR3IwhAJP4kIZceajsMFZEFx89sumDjPyacPAembDCOzCcvvfLPkHaAvIj8WikOV8eMJPxq4tZhGyx33D6LF8WQ4K6wz9W3g4lxKKk64LBjRzHH+PXJ1j7AxFYJH7hsXfkQEa/Qa8SzBiYKAp+3evlOS0NTLJ9qxzWAg90Y8Qll3y1z71h4nbe56ADxZO5CqntgZAocNq48X9uy0B5P7+sSxqF1rS4Ifz/6jivt/OUv/lOe4fTIdqZfmXIUnEXpuOIBiCHa+4JuzK/qCSmxsedNM6mJOlc3RovIrF6s8JJ5mkcuFs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R6292pgRNzpzCouo+gH7p/DSW+sl60YXmOJVEPV+x3O7N7NsfGUqDnKfyLE7?=
 =?us-ascii?Q?zyN30C5nGiYICOsRYI6I8e2HDMNaglGs8r5kHpET0iKRx9ynWcIsB2dJGRd+?=
 =?us-ascii?Q?wuGwPd+9LXCdlb9BbdWYniKumslWzs3xbLCQyQ4MLfqg82G0GCnLX5vVdGkD?=
 =?us-ascii?Q?Vr39KpAPOFJWR4AaqTgy69FjLk8OsXRSPIPUCjDV4gZ5BRu7MkPjuvUqubNu?=
 =?us-ascii?Q?tdiE6A9Is1jsazJyNm1yMavcqwBXIb7jDyntMmrBoRMJeysXO/23UQkvMrxa?=
 =?us-ascii?Q?jdc/ztk3ogMgOxrJC8IE89ZFyqWagNRSdYKI7agNIDRCUn6gb0Ut+ynU3Rhu?=
 =?us-ascii?Q?XdqtHxoYw+KQG4yojf+yKMLWLbUqbb2pl4jhwTGSUkr2XZMqJWZ3+b6/mMpQ?=
 =?us-ascii?Q?3d9t8FMlkXZD9NXywL35Ri9jdlV+bhusWNmGP2bgKxnEMXOZWnJdX5tTZGvj?=
 =?us-ascii?Q?gbPoqdGZ/NQNsztH4X0eKJNHA4rP5/fr14hKpfRTaoaG/7VvTgaiIV/q343l?=
 =?us-ascii?Q?KRjsMr9M74g/O2ukHPljlLq0I4Gu62czA66SNzoR8G/z4OcTefL5ZcMW8Jnw?=
 =?us-ascii?Q?luxvmsmx6PpGbX50yh3YE3pspGtjb6BtQaqhcA2JRYct2vEE9sthFiagHSFZ?=
 =?us-ascii?Q?AKlrv8Eh5ctbgbJqfDBg56m89xCp0eqVTVvphcaATFVMYl/KO9hEUYmrYtyk?=
 =?us-ascii?Q?czc3bh90rOfwM8WEaTNRDFtKQwwmtJOTSIcGNy3OcAMxRzD/lAitVr2Vj7tJ?=
 =?us-ascii?Q?Eq1pSXFmDho225zOiLR86RR1Jn9EVGIVYGuSyBx9stZEQkpgV811uE1WpBNV?=
 =?us-ascii?Q?wsjHebOyWpRiYLdsVbgIma3ni/Vu+Clt8pzWEmFHS3tKWjKdc2aN3IQW8dQE?=
 =?us-ascii?Q?H6ZN2GE0nIV2OMr/T1UeM5fiHUrLXUqvYAGQtbobrN3c8S/NxFM7wjWbV4ki?=
 =?us-ascii?Q?HRH+qkz2W6959fO7r/9wTTDMSbMrWaaRjplG94kBjNLLrXJO7yIpE25M0Bfg?=
 =?us-ascii?Q?dHpP3pjIyyZdMprdn/sCnKjaJ6JH77yNvu0NnFMDTRo8rIoLvE73eSqtfh9N?=
 =?us-ascii?Q?HOZBBj9+tXqMr3Fh1ji3vnXyjLUOPCaZh5jPzw2p92chrL9bRuIpZWhNL8xw?=
 =?us-ascii?Q?xfmXclhfbxlNBeL6InVxOS/ikjW/7CnK6YRNkC3QE/8Ierq7fGVK47KQ2de2?=
 =?us-ascii?Q?RG3oniiCiQY947nUQabp5ps1GhzSEsT1PaCY9OlVrtKPRN9bPLUVc9vuLMUF?=
 =?us-ascii?Q?nD3GAgVkAm3ipp7Wyc4Xi074Opu8ps62nSH1khn0BNRr7Wi4VyUIKs0JC6nU?=
 =?us-ascii?Q?0izEirnPtpFnnhM1vP4W7+H1UA5k+TBIL37VNdE/iPZsLKovOTejez63/kUR?=
 =?us-ascii?Q?SjZOCg1A7yAIy8pDa/iHWuSRzxxn2f1VET6ak1XZAN5Pq4u1u7ERFgmArn+L?=
 =?us-ascii?Q?ziZZYcoL3aoodU9h2/yh1rDmq0AXqjsKWAJ0MqdcsDW2D8wtMcCvoqUtIrqX?=
 =?us-ascii?Q?+Wi0fhisCm6Kk/lTG1XgLblxRcXQOhD74DIoiXUFGfzBTmYDNe63JyBLJdb5?=
 =?us-ascii?Q?sP0EVLNXyqbYoJaDOjZ6RHgvIW44XPMdj/rFYfDntxKUDVuuvc6Nmtfhm7qk?=
 =?us-ascii?Q?lWIzgp58VgbZMMlSRbLPIGgDiGiOOqvdsQO0+6Fz2IXoaumOI0Miclm0isXI?=
 =?us-ascii?Q?MKlVZAicOT//OcMCLhz28W29xCPZ32joWO/MrwdTV57UlsTLFf7HgScO/UN5?=
 =?us-ascii?Q?KsjQXxsvcg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fd18492d-5fb7-4a15-52f1-08ded1ee50f7
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 12:44:22.4793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X6n6f2rq1ezES0EbuAHYy4tvMxDUeN3I5aaXNAd5WclB50XSr0U1DqK5MdXLAagzgSLXEAs7Pm//Aep7YLb+qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2739
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 12:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239503

Exercise fallback patch metadata with an author, date and committer name
containing spaces so direct argv execution passes those values to Git
without shell quoting.

Also cover the GitApplyTree and PatchTree run=3DFalse paths so
manual-resolution command generation continues to return argv lists
without applying the patch. Use patch filenames with spaces to verify
the paths remain single argv elements.

AI-Generated: Claude Opus 4.6

Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/lib/oeqa/selftest/cases/oelib/patch.py | 101 ++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/oelib/patch.py b/meta/lib/oeqa/se=
lftest/cases/oelib/patch.py
index 69e06b5ac1..8492549764 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/patch.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/patch.py
@@ -61,6 +61,37 @@ class TestRunCmd(TestCase):
         self.assertEqual(ctx.exception.status, 127)
=20
=20
+class TestPatchTree(TestCase):
+    def test_push_run_false_returns_argv(self):
+        with tempfile.TemporaryDirectory(prefix=3D"oe-patchtree-run-false-=
") as tmpdir:
+            srcdir =3D os.path.join(tmpdir, "source")
+            os.mkdir(srcdir)
+            with open(os.path.join(srcdir, "file.txt"), "w") as f:
+                f.write("base\n")
+
+            patch =3D os.path.join(tmpdir, "patch with spaces.patch")
+            with open(patch, "w") as f:
+                f.write(
+                    "--- a/file.txt\n"
+                    "+++ b/file.txt\n"
+                    "@@ -1 +1 @@\n"
+                    "-base\n"
+                    "+changed\n"
+                )
+
+            tree =3D oe.patch.PatchTree(srcdir, PatchTestDataStore(tmpdir)=
)
+            tree.Import({"file": patch, "strippath": "1"}, False)
+
+            cmd =3D tree.Push(False, run=3DFalse)
+
+            self.assertEqual(cmd[:5], [
+                "patch", "--no-backup-if-mismatch", "-p", "1", "-i",
+            ])
+            self.assertEqual(cmd[-1], patch)
+            self.assertIsNone(tree.current())
+            with open(os.path.join(srcdir, "file.txt")) as f:
+                self.assertEqual(f.read(), "base\n")
+
 class RecordingGitApplyTree(oe.patch.GitApplyTree):
     def __init__(self, *args, **kwargs):
         self.commitpatch_called =3D False
@@ -120,6 +151,8 @@ class TestGitApplyTree(TestCase):
         patch =3D os.path.join(tmpdir, basename)
         with open(patch, "w") as f:
             f.write(
+                "Author: Fallback Author <fallback.author@example.com>\n"
+                "Date: Fri, 01 Jan 2021 12:34:56 +0000\n"
                 "Subject: [PATCH] plain diff change\n"
                 "\n"
                 "--- a/file.txt\n"
@@ -152,6 +185,14 @@ class TestGitApplyTree(TestCase):
             with open(patches[0]) as f:
                 self.assertIn(expected, f.read())
=20
+    def assert_no_note(self, repo):
+        with self.assertRaises(oe.patch.CmdError):
+            oe.patch.runcmd(
+                ["git", "notes", "--ref", oe.patch.GitApplyTree.notes_ref,
+                 "show", "HEAD"],
+                repo,
+            )
+
     def test_git_am_preserves_original_patch_name(self):
         with tempfile.TemporaryDirectory(prefix=3D"oe-gitapply-am-") as tm=
pdir:
             patchname =3D "0001-distinct-original-name.patch"
@@ -166,6 +207,51 @@ class TestGitApplyTree(TestCase):
                 self.assertEqual(f.read(), "git am change\n")
             self.assert_note_and_extract(repo, patchname, "+git am change"=
)
=20
+    def test_push_run_false_returns_argv(self):
+        with tempfile.TemporaryDirectory(prefix=3D"oe-gitapply-run-false-"=
) as tmpdir:
+            patchname =3D "0001-distinct original name.patch"
+            patch =3D self.make_git_am_patch(tmpdir, patchname)
+            repo =3D self.make_repo(tmpdir, "target")
+            tree =3D RecordingGitApplyTree(repo, PatchTestDataStore(tmpdir=
))
+            tree._need_dirty_check =3D lambda: False
+            tree.Import({"file": patch, "strippath": "1"}, False)
+
+            cmd =3D tree.Push(False, run=3DFalse)
+
+            self.assertIsInstance(cmd, list)
+            self.assertEqual(cmd[0], "git")
+            self.assertIn("am", cmd)
+            self.assertEqual(cmd[-1], patch)
+            self.assertFalse(tree.commitpatch_called)
+            self.assertIsNone(tree.current())
+            self.assert_no_note(repo)
+            with open(os.path.join(repo, "file.txt")) as f:
+                self.assertEqual(f.read(), "base\n")
+
+    def test_dirty_push_run_false_returns_argv(self):
+        with tempfile.TemporaryDirectory(prefix=3D"oe-gitapply-run-false-"=
) as tmpdir:
+            patchname =3D "plain-diff original name.patch"
+            patch =3D self.make_plain_diff_patch(tmpdir, patchname)
+            repo =3D self.make_repo(tmpdir, "target")
+            with open(os.path.join(repo, "file.txt"), "a") as f:
+                f.write("dirty\n")
+
+            tree =3D RecordingGitApplyTree(repo, PatchTestDataStore(tmpdir=
))
+            tree._need_dirty_check =3D lambda: True
+            tree.Import({"file": patch, "strippath": "1"}, False)
+
+            cmd =3D tree.Push(False, run=3DFalse)
+
+            self.assertEqual(cmd[:5], [
+                "patch", "--no-backup-if-mismatch", "-p", "1", "-i",
+            ])
+            self.assertEqual(cmd[-1], patch)
+            self.assertFalse(tree.commitpatch_called)
+            self.assertIsNone(tree.current())
+            self.assert_no_note(repo)
+            with open(os.path.join(repo, "file.txt")) as f:
+                self.assertEqual(f.read(), "base\ndirty\n")
+
     def test_fallback_preserves_original_patch_name(self):
         with tempfile.TemporaryDirectory(prefix=3D"oe-gitapply-fallback-")=
 as tmpdir:
             patchname =3D "plain-diff-original-name.patch"
@@ -178,4 +264,19 @@ class TestGitApplyTree(TestCase):
             self.assertTrue(tree.commitpatch_called)
             with open(os.path.join(repo, "file.txt")) as f:
                 self.assertEqual(f.read(), "plain diff change\n")
+            metadata =3D oe.patch.runcmd([
+                "git", "show", "-s",
+                "--format=3D%an%n%ae%n%cn%n%ce%n%aI",
+                "HEAD",
+            ], repo).splitlines()
+            self.assertEqual(metadata[:4], [
+                "Fallback Author",
+                "fallback.author@example.com",
+                "OE Test",
+                "oe-test@example.com",
+            ])
+            self.assertIn(metadata[4], (
+                "2021-01-01T12:34:56+00:00",
+                "2021-01-01T12:34:56Z",
+            ))
             self.assert_note_and_extract(repo, patchname, "+plain diff cha=
nge")

