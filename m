Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD559CDB479
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:35:48 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20964.1782221738840881784
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=FVNhcE8D;
 spf=pass (domain: est.tech, ip: 40.107.162.56, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgV1Ppscvfyx7T0lltMnlBKn6rjEs0o3BfSsCOwtHbGHUXTvMhDGZJnkuGgk4CnVAUiImKsKOhkflKZHb3HwBnf6FcnzcJ0mg3Aa0s87HlABRNPt3IdRVS7IO0akSvxZZQJ6yRVbRpXz6jL6AJdTqIUM/Y4JAanCyQKd2FHkMkLiXRe8McUjiBcSJ5pZNvMsQfSllKlgEMn/p3tiYmx0QDoJ4dUl9Ms1+J0SxXeWSYH+JNmHcger9kRkFJZ96kslinRQmwzpd/4d26x88ghcaaTTTDUJozVo5/cE3acY/Mp1z6tpyOZX5VO+LuHETjbBV3hxteLEoJr27KLWeUDCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qPjB6ZpyAaOVpBOiEFUNSGCjK3WT6xTiskCZSX0290=;
 b=l7NyZ+T8vbtcv9pcNU2Z3PDlatavh2evbGMVMqlxinMYw77vzJ5yHeNZ8Fuxrf/PvMpT+UcmL7djqVcpKwwAP6+SObqY4L75R/CpUqQkZf12RGWDB4Su1PDrmUAF+iXm2/MTmoSzJsjG6HWekfhZy4hS4sCZKWA6/b6qfHX+MJlGcOF8Xn42qlZeeQGrlNLowD2+aQRVMD5dKEx+6AvH72UpP4IcZ0m0Zf+fP4jjWoofaUE0jdMaU2GqnbPsyIlTX9y5F9Kks6JBRshV0nkOtWDERwcyaprpErGfJAgAy5FuYfz8uABWf5r+g3hNSJ11GYvYHhxXM6fv9Qr1w50EPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qPjB6ZpyAaOVpBOiEFUNSGCjK3WT6xTiskCZSX0290=;
 b=FVNhcE8DPG0zwHRzhZDyw1++nmmRKv4vCHuNV4FiQQj40LRtIEVEKPU50f2uRe3ZPCCHF/KAqbveZpomter5p23bmt6xBy5/LQkAr6VGgNm3eQYfsLDWc6hryneCsooLFO9SQ77n/kLv13YFr+hH5egZIBUM3oUjWjsemWsLe0N/fC/oDcGFjeNIbNa51c1i8aqWG4PsKKtvMzRojwWwJnsr3uDltlnDvfCbsem2CN5Xp1r7AsGE6cbcY/e9GhjdSmhGCjahvUfQGKRCmL3AWWpc6legHJiLQ2nWeCBC8Q+W4NfKfs3R9mCsOeK4zp1nKLEsZjzpP7CB4KuQr3YuHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 VI0P189MB3639.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d7::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.19; Tue, 23 Jun 2026 13:35:38 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 13:35:38 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 9/9] oeqa/oelib: test patch command argv handling
Date: Tue, 23 Jun 2026 15:35:21 +0200
Message-ID: <20260623133521.17053-10-anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623133521.17053-1-anders.heimer@est.tech>
References: <20260623133521.17053-1-anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR06CA0007.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::12) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|VI0P189MB3639:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b6eb16-ebef-43cd-a6fa-08ded12c4fcd
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 4x+3evPJSQHi9c0JW1RBj4X732jfD4dg83GXYrx4ryCRbvK3bPlSYtnJlWm95JOEKsPDTViTTEQav5MiEBzntridRZG0uqGpgvH2ewnEAVdCMWgb0I6Vh78fD2td7o87GJIHFtfvPIEkiEzqtpAI2lmXjq/X/ZZTV1w7TLr9d6CGeaYP89E59AZvPcMcLfTBQScZUoeGQlH6ehO6un5QHP2kGOrfiFUj/kCWHz7En1BU7rgsJLYZbF7ZVcuDpD6W0rW39XhJBc0pqrosA0b0Rmc/YFoMEQcaP6BgXmQXMBy90Z83z3c7YPTTAEDSPOk1KiuSsUVdfQPwgzqaFnUJeWQj96KtePn1w88prhgIXzaGyjFDWgqdwhm+KOpaIqEIuVKzPUdCvHNeXNe+KFg5zLcZA4d2TEIns5Jv44X/T0Clu3iuuf2jsxu2IYU+ptxBV2XRw54HFNpB/IRUKe2jNs8Y6xcnSnK68XKfUQCduW8e1nWoO4M8o7IaWlzs1QLNv+eegyjXIM7GB8xZMind+tF7WMhfmzgx0mu0vuUSI7Jm/NGBgeVWJrazSjwa1X6og85gM5QY+Jo8IkiRfFXaTSaDtku7g4OODZ6aHyfPM+mz1bpPRpUfjZR12LPxntMJPfQYDs3bvSCJiATpc/Ef6n+VR/NwNSoQ4FCFf4tAGCw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gvwhksudcBJ2eSKHa0rkfyVFdlzH/thS8ctOeNxf7BepUadQ+XjA2TleSPsM?=
 =?us-ascii?Q?8heJ7xjuwGv6Dz+fEvYv8r8hSCRHZOasONalXtA5i0gIKccFGebeIG91lMZl?=
 =?us-ascii?Q?7RTe7yN0+ROhWyIrb4tYg8QhIJSc/fRxDFku18FtXoBEWYybzmLEYvjAZQ0o?=
 =?us-ascii?Q?5q96ZtOowTCAL/SuC3OPSy9wmexTBOYgX2BzQPer3D5mFTaniLSTT9KUpmma?=
 =?us-ascii?Q?YxdyYGRE01D3UvyQaJ3RQFVA2lQpkTgar1CcEC4BxPp+6GzrIcYpHnLS+zqB?=
 =?us-ascii?Q?dZ3Cxa3XPGRLKzfGXQUWZ/W90O6K8/7YTWqEgtNIFkUDUL/VXcN9RdjSextQ?=
 =?us-ascii?Q?i5NJlQfi54dRat3NJiq3xefYMGwf9wGvxM6PitnTZMO/4oVQ/T3gvoqUGm4x?=
 =?us-ascii?Q?zYp4/IFCwYRkB1zFhPX7fRJ4kf1dC9x8Bd6M7Ka2FYAJ43dBtlQiUGVnn6Pd?=
 =?us-ascii?Q?c98rvmRBZzUDqEoR2//BqsXZLo9cum+Qyvd+dLlMaNq51iml1Cwel8wudZMQ?=
 =?us-ascii?Q?uOUIApUaEAZF9fscTOQKk2EyluXstnWaZf2PRobDIO+fuupCxR+hCeuP9GC+?=
 =?us-ascii?Q?CjvrJ2HXm5CFvs99ICa36QGXS5CzY6pHDKw3dddrjcr69pijM2WWvgRrMhND?=
 =?us-ascii?Q?nbHkCR37Lcx08F4OEZ/FTjMRLLIXyrPu3xv3pfyT9ccg0qyGsMLDs50uyXh6?=
 =?us-ascii?Q?8xkcOZj9FprvMdPDftMOq9hJ+eTkei3VM5sTTydE84kl3o5LIuPEBIVwG6CR?=
 =?us-ascii?Q?//23HI2vFfL8VXeQexlxkxkvhfOYbLn6XWphac4BrfG0uQxVm9vI2Bz1ekmV?=
 =?us-ascii?Q?5uclIf+n6osGXIKLBV2MdGhzuEmjTMdwcrQ2LeKrKVsFhOWOGy/pP/Iedzad?=
 =?us-ascii?Q?Tsf1ecw8HovMnKWUjdkfLn1k0OYxKpLpPNnhjoHU5zSXxIXciwBqYRWlgGil?=
 =?us-ascii?Q?hwonmhHqxg89wWEPPW9mFJ1v1VT4+8R314r8gQuheufQXAkN1RNpjYPsAhuI?=
 =?us-ascii?Q?iTULeJA15lXWEvU7hKqKg9EaOyUfNtrHEH55RFmfHSiplrACB8LEVflOeJfr?=
 =?us-ascii?Q?F4/wIV5H5YIBRQ/8B/QAHSZ7TIcDi8dbAugbWqwmKEiKP58a3zxPB6zUmPX0?=
 =?us-ascii?Q?Kh8WryXWBWBZQoTY+8IHmZU38eZD0/WmgR+CaC/gMtYr3bLtSP9mcwAuKJbw?=
 =?us-ascii?Q?XkazjIdyvm3r+/1iXvjOszEDkbJ+nG2fgLNHi1vGNUGGfmXgL+zkSzJoob1r?=
 =?us-ascii?Q?c40byso/UnIjzw6g3TFoVPnCyPv9Ku9ubz1I2O/fV0324CwF+UfB7FB2RQS2?=
 =?us-ascii?Q?eXl5FY6sdm/E91CrOwsbi6tK7wgYtyRu8olYjCK1JC8gOJMmOsDRusERfxmY?=
 =?us-ascii?Q?DuSnX7KYJ5Le7SwaMPLc7wd7Lb6qBcfoIF+HYSeJlDsDBvcaZ8mp1WSPSINJ?=
 =?us-ascii?Q?N0D/yS8n3M0DhU5u0EgzaP0kOSpc6jjFhnZaNQyPFGfSm2SvCVPzb7z4cpnR?=
 =?us-ascii?Q?xA3SmraJoG2rnK13DOmlOVYHXxbbhsSIJOvH+ZNpDnP4wFfTdFaZ2Mwp3qm1?=
 =?us-ascii?Q?QQDplfOUQYLqswISJ308rJA+yhxq+x5/NJzGv3zPa7CNvL76Y2rMlgfKMVh2?=
 =?us-ascii?Q?+/3e18iuUKDKk/iR5nXcoGIv2Ccqw4kBU1YVdBGOCH6B61LUZVG+uFLQ/Kvb?=
 =?us-ascii?Q?KYcdsEDbCBJTd+9zpREoB64ZOfUfuS9T9+I5wuOW9jrFphlY1edQ+SHqUCJD?=
 =?us-ascii?Q?206vs89RQA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b6eb16-ebef-43cd-a6fa-08ded12c4fcd
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 13:35:38.1790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDzCNQzeJPl100CelQ5yGnmg+51VGaSZ0zmYHKFKzl19ytahuhRi8kphpNhdUsVCg1R5lIwVVgU53qZw8n8g3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3639
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239402

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
 meta/lib/oeqa/selftest/cases/oelib/patch.py | 98 +++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/oelib/patch.py b/meta/lib/oeqa/se=
lftest/cases/oelib/patch.py
index 69e06b5ac1..9dc37cd0f3 100644
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
@@ -178,4 +264,16 @@ class TestGitApplyTree(TestCase):
             self.assertTrue(tree.commitpatch_called)
             with open(os.path.join(repo, "file.txt")) as f:
                 self.assertEqual(f.read(), "plain diff change\n")
+            metadata =3D oe.patch.runcmd([
+                "git", "show", "-s",
+                "--format=3D%an%n%ae%n%cn%n%ce%n%aI",
+                "HEAD",
+            ], repo).splitlines()
+            self.assertEqual(metadata, [
+                "Fallback Author",
+                "fallback.author@example.com",
+                "OE Test",
+                "oe-test@example.com",
+                "2021-01-01T12:34:56+00:00",
+            ])
             self.assert_note_and_extract(repo, patchname, "+plain diff cha=
nge")

