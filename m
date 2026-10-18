Return-Path: <roy@0xbadcaffe.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B6DCCA490
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 19:53:52 +0000 (UTC)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20549.1792353223968400549
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 12:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0xbadcaffe.dev header.s=fm3 header.b=NQw0RXUC;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=pUFn7Mmm;
 spf=pass (domain: 0xbadcaffe.dev, ip: 103.168.172.149, mailfrom: roy@0xbadcaffe.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id E27D7EC0070
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 15:53:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sun, 18 Oct 2026 15:53:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0xbadcaffe.dev;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1792353222; x=1792439622; bh=q231cGnBmu
	vHKavpCTKWbBS+REXmSA7gOJrR1l87uEI=; b=NQw0RXUC/p4obqoWc1FbkJQu7O
	B/uFQyEtdH7EuMu5+j6RCvXKlL8JjJxVMB1XDcMJxB0pvwzI6bmOUvH1JjD+GWDy
	XRDOU9qVcNqnx/Kubi0PxIZIJkP8qEtw+D11pQcALRksBLynYp7uX7F/PD/o9kKv
	9YcUBpLUdLzlqm8gXQlRW6gSrtipKcpV6SEYQjs5fHQ4I9ZJsCLipbqP90nJfhKE
	Kg3zdtmAy9gvqssFfDQMQ+RYHkE+koCgiGCvP8Jwb83LJxBm8LI8UxVHl5geOuwM
	+I5QxP+sJlUjIMgPmVfxep/nWWPlRuh/WT+IdmRcjqQ43NhdN6e519CmlRpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792353222; x=1792439622; bh=q231cGnBmuvHKavpCTKWbBS+REXmSA7gOJr
	R1l87uEI=; b=pUFn7MmmQH8elwWUj66bOCrTcY5WjZvFQzHQ5jRbiczamPBCJjq
	Y8S1kQSo/yhCBpDWZbGMpeB0wemgfoe+sbAy9vxuZKrqe2fBN3Q1VZZ/qcmglgAs
	I1Mhya7g9upZJU3Ryyu5uKhMPTaSAI7xa/xqAcyFjwHnfsJYCPyspf5aEPbjjajx
	ro2w9DED4KasP5SqZZ/Ltw9SkWJx1qE1ZzXiljTqI6wlrjPZbFDvbRUXnFeZKAGe
	4J7/2qzhMSAWSW6BgiKE6t4U+h5zfQHnz/4HNOEAS/my2O6pVgSBbcxvOWWY3h5O
	PZAvyna+VRBTlV3mKR3JJSw9uN3f1NphbFA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=0xbadcaffe.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792353222; d=0xbadcaffe.dev;
	mf=PHJveUAweGJhZGNhZmZlLmRldj4=;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm3:rsa-sha256:WqiBPcLvqpHkomFA9I+TpIceXgVqAmYenIU1IpM0Enfprdd
	g5YvDMbtvA6UW5Q2NwbXFfXhqrLNgbiDjS8K6/9AabLwmvIuUxGZ7EQYV9u0zWtE
	vobtf8OZSDVuRqYQG7R9j4IIGfmV6i+lCRHPLKEw/rLQuHw3bAy5yh554QFNA3z6
	OX9Bcn1TvevmKtRuwsKD0u7yLCCAVvmXQBBgxLvQ2o2Jg3BHFz0ZiR5H11vzU+U4
	ZYCxHF2A2duxKDhj8eUm1ylIx8VjUvd9LzCTiFF8YwY/u58p5SFu82LOF7MY6Y4F
	OtSHd30hIN509hJmupmGet+ArATwkS6u3GtB8WA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:ePP28pWIPRcPFITvIGDUujLWXmKRDaKZRAxxCxD2IwI=:83pfcv9d5mf/uSBVk1YsyPfE7DIb/+TEVDUK69XCA0Y=;
X-ME-Sender: <xms:xiPValZ7djq5T9a1lbGtiJcuEWFDY0LCRzeN-HZOMNfHpXQDNg32qw>
    <xme:xiPVaiZnHXesce0bKEjbl_HkExH3a7MJlt1sGuirIMhhqBYwLh8bb7rfXm5NoT98F
    E3beACJKuzxUoUtotnOW7nVVsfRiHM2KXJJD5YwCAlrbaRU7js2UdQlSA>
X-ME-Received: <xmr:xiPValkFgmHWw_5zQS9j6JZ_hexNW2IsN8Tlt45ZFF6mNeNbIz9JFfHYFHpEw3-l5EftytZaGhX3IlpdGmOY3ZyFlys>
X-ME-Proxy-Cause: dmFkZTGWNytIrSmImVRx/SbK5UHqwO+NFSYpqYPgCBhXg97HF75OLuJrBnCXyt55CmgcbV
    2s9pT9VEoq7tkvzHVeojwSpkBSM/xduWf9IS05Tnz4WdYXZEshO0qpY9+EmNHifltXqpZn
    4axR/qVe55fS/NmR+36TRuslja+TPDEGZ45dNvH+vm7FnW/Z5OXA/IDVqU+McelqAJyyLe
    94fQBa4ZSCoLQx3k7vjOfXp/+0PiA5Kvs++BeIulvnq2n63VzEAA2P2JIZwacK8V+OZanS
    AzFK82lof4CeIjfPMwnFj/vv9uZodtO3Zt+/EwhqCixRSrweQ36SLdoaXKHBwjfhxkq/sW
    s8hUihbhYIH8XQ8pU+NZy6NcWvKWTjW5F2XQHMD24YTxxtWX8qrXiMHC6FHHvhaUuIcpDo
    ptGwRbTD+UQcTRqNcyqXL+516c9FlTToSCL5KDMguUya6WshsOdxlMMPIGYNt5bE0NnYfZ
    fvdfSymMEQu/xQQWNpmomX+y2yZRt8pfwIMObpdSscMy+/vD7JuNH6TqBY73v2XzBMokhq
    E1r+Hj0E4S5vplnN7E0vNEPikxWHPf6KmwT9q7sgdrLMJTco2NveOgNtRvoJFf7eUBgnE7
    j8iRkX3n7SCJiB9q3Nu/kA1/uN1SFGlNF27HMuQTyCuYDsYp+qvX50SVfxAw
X-ME-Proxy: <xmx:xiPVauyFEJllcFka3_MedAw54Z2WDD5PENumVG_ua9xjDvaCUuvohg>
    <xmx:xiPVajOLsQs9HQ4WsQEfzWKx2vo2V5wyBl5ALEGWHm3DOINQYDQ8gA>
    <xmx:xiPVaiQCRKjWF7vsUOuOiNxR-ZBrGYCn34vttlRr6km8vBaSXZJkJg>
    <xmx:xiPVahb0pctnEDCutsCNwLQokaVY1WiOPtKQU1gK44d1G-_Tf7hELg>
    <xmx:xiPVav9opABU7sMYHkq9Eb0BTw44L4O55lFEAUzbA5Eh8kNWc972xorm>
Feedback-ID: iec764b53:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 18 Oct 2026 15:53:41 -0400 (EDT)
From: roy@0xbadcaffe.dev
To: openembedded-core@lists.openembedded.org
Cc: Roy Cohen <roy@0xbadcaffe.dev>
Subject: [PATCH] oe.patch: fix Git note identity in commitIgnored
Date: Sun, 18 Oct 2026 22:53:34 +0300
Message-ID: <20261018195334.3822636-1-roy@0xbadcaffe.dev>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 19:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248108

From: Roy Cohen <roy@0xbadcaffe.dev>

GitApplyTree.commitIgnored() passes the Git user name and email
as positional arguments to addNote(), incorrectly assigning them
to value and commituser.

Pass these as keyword arguments to ensure Git notes can be created
without relying on global Git configuration.

Add a regression test verifying the note content and Git identity.

Fixes [YOCTO #15989]

Signed-off-by: Roy Cohen <roy@0xbadcaffe.dev>
---
 meta/lib/oe/patch.py                        |  2 +-
 meta/lib/oeqa/selftest/cases/oelib/patch.py | 46 +++++++++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 2277e8835d..f8fc63ac00 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -520,7 +520,7 @@ class GitApplyTree(PatchTree):
         GitApplyTree.gitCommandUserOptions(cmd, d=d)
         cmd += ["commit", "-m", subject, "--no-verify", "--no-gpg-sign"]
         runcmd(cmd, dir)
-        GitApplyTree.addNote(dir, "HEAD", GitApplyTree.ignore_commit, d.getVar('PATCH_GIT_USER_NAME'), d.getVar('PATCH_GIT_USER_EMAIL'))
+        GitApplyTree.addNote(dir, "HEAD", GitApplyTree.ignore_commit, commituser=d.getVar('PATCH_GIT_USER_NAME'), commitemail=d.getVar('PATCH_GIT_USER_EMAIL'))
 
     @staticmethod
     def extractPatches(tree, startcommits, outdir, paths=None):
diff --git a/meta/lib/oeqa/selftest/cases/oelib/patch.py b/meta/lib/oeqa/selftest/cases/oelib/patch.py
index 8492549764..1b7d17813e 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/patch.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/patch.py
@@ -10,6 +10,7 @@ import subprocess
 import sys
 import tempfile
 from unittest.case import TestCase
+from unittest.mock import patch
 
 import oe.patch
 
@@ -280,3 +281,48 @@ class TestGitApplyTree(TestCase):
                 "2021-01-01T12:34:56Z",
             ))
             self.assert_note_and_extract(repo, patchname, "+plain diff change")
+
+    def test_commit_ignored_uses_explicit_identity(self):
+        with tempfile.TemporaryDirectory(prefix="oe-gitapply-note-") as tmpdir:
+            repo = self.make_repo(tmpdir, "source")
+
+            self.git(repo, "config", "--local", "--unset", "user.name")
+            self.git(repo, "config", "--local", "--unset", "user.email")
+
+            with open(os.path.join(repo, "file.txt"), "a") as f:
+                f.write("generated change\n")
+
+            env = {
+                "PATH": os.environ.get("PATH", os.defpath),
+                "HOME": tmpdir,
+                "GIT_CONFIG_GLOBAL": os.devnull,
+                "GIT_CONFIG_NOSYSTEM": "1",
+            }
+
+            with patch.dict(os.environ, env, clear=True):
+                oe.patch.GitApplyTree.commitIgnored(
+                    "Add generated changes",
+                    dir=repo,
+                    files=["file.txt"],
+                    d=PatchTestDataStore(tmpdir),
+                )
+
+                note = oe.patch.runcmd([
+                    "git", "notes", "--ref",
+                    oe.patch.GitApplyTree.notes_ref,
+                    "show", "HEAD",
+                ], repo)
+
+                identity = oe.patch.runcmd([
+                    "git", "log", "-1",
+                    "--format=%an%n%ae%n%cn%n%ce",
+                    oe.patch.GitApplyTree.notes_ref,
+                ], repo).splitlines()
+
+            self.assertEqual(note.strip(), oe.patch.GitApplyTree.ignore_commit)
+            self.assertEqual(identity, [
+                "OE Test",
+                "oe-test@example.com",
+                "OE Test",
+                "oe-test@example.com",
+            ])

