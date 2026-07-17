Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C2BC4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 14:35:06 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14995.1784298896867538265
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 07:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R7Ztto2u;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e65e18969so162085085a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 07:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784298896; x=1784903696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vcjTyBwW+oDCCsa/C1SZVReIUk5fYwgvUrgtiIqo0to=;
        b=R7Ztto2u0EyyKrwTAQ/pYh2ek3iWG8hFL1OUQnpDqOrk2czlPDI04If7puU4MLmDEf
         3Fkk03TYtqv0JEcLvPe4lx0uAHWq1XcGZg/AWg5CScRIA2lSK2pU2A7Ul1hw1G9CO7Bd
         dH/Li6wATFHrNKwcJHpeIjx1ZygD54BzugWQ3IV3Eje42Jt8VSP++hFbkKtMLdIFHGds
         8bX7CQ6bdzBdIshe84WumhMJm5AY/uUzqwFg0DhS7SACtBW+J01stB1xrAzxwDCGBIcw
         dW4w/gLSarT05xw1al9ygSl9+AeJy5958Yh4mNLRzHPHSY/8uEb0BJv/gF5Lg/9NIChY
         p1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298896; x=1784903696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vcjTyBwW+oDCCsa/C1SZVReIUk5fYwgvUrgtiIqo0to=;
        b=R9ZQAizkHFn6niEo5poXkaVEwzrjI3H4ZL9XjO92FSMOzrTbACPJSPTiCIIHBBYF35
         mvY1085d6StG/Qg6mRI6fpMMbFPuwkptqCjTyg7X7Q1VGdRYiXNeIQ+5YlxtwV4sC6Sm
         CVw7kMCwgJHW8+i5/oOgHrXPBmkb+cwN30xnwcTQM0IqFwy1aftWkSM215XwVWju8Jw9
         33N7RDLJ6tvL8Iiu0VqQwBXqWLY7GAPBFiA37/Ec3eE5wOh67CpXBDbeSXyrQmsE/csa
         pOZMGOmQpDoC31eDq+pFjo6MHYx1zwauAehTL9rtfdMu/NcMjGUKuxhse8df5f5LRYSN
         jC2A==
X-Gm-Message-State: AOJu0Ywl/G4c2yQlaXLTkV519mxtvljWAujYT6cYz7g07VthCcIHi1Kt
	ABtDqqYLf680MSGEyFaZtOZfu6Hs5OrVWK7JgxnPOwlXTgYfMWAOVnADKOgQIg==
X-Gm-Gg: AfdE7cl0rLOD7/HzqHeVxPJMO8dTJudjQtJOpq7Jn2tFHjTFYpMYyg04zuXty3ufM6o
	OhBQt95TFawAUNC0DEDAHJUvlL/E/++3DcjpomXiXE92rB2i99hD1Py6RtHl6U4uh+qtXAdPTNN
	T7i+mFAfd+y6fi/Lz/f4kf93nHaINE0n5r0vdRlfv+X//HKtiBsgY7PFWnbN6Mz6OqvIKEJwQp5
	x1GsJq11yjgjUyYFVevjLIbNlDIajy5FMuWzHndD9F/M65zSBEuWbHGx1XkKGnywAKpW7eujEGU
	jeKNLVuHlIKWa3Dr9NVyX2NMpvH2JB24Abd2ubfOJ+ExXtnDqrQtbpM+j/UXhEGhsd0ZBfPpoZM
	/MxvrQgIt6BVabfUfQadFOcSrTybojf9D6Tht3EDAcDPGSwADVFA+Fg4eEuTQmjCVHvm7zNjcIR
	KQLoFM5uCTPidgsr64cTFADUxql3FFCK5kpZe5kveuHAoK
X-Received: by 2002:a05:620a:258c:b0:915:fc16:2ae0 with SMTP id af79cd13be357-930a5ff3dd2mr791761685a.25.1784298895129;
        Fri, 17 Jul 2026 07:34:55 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b5493cb0sm165208785a.42.2026.07.17.07.34.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:34:53 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/4] oeqa/selftest/liboe: cover oe.path's own path logic
Date: Fri, 17 Jul 2026 10:34:25 -0400
Message-ID: <20260717143425.3521709-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717143425.3521709-1-twoerner@gmail.com>
References: <20260717143425.3521709-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 14:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241200

Add in-process coverage for oe.path's join(), is_path_parent(),
symlink(), make_relative_symlink(), canonicalize(), which_wild() and
realpath(), alongside the existing copytree tests.

The cases pin behaviour that is easy to regress: __realpath() falls back
to "not a directory" when os.path.isdir() raises; symlink(force=True)
replaces the literal destination even when its name contains glob
metacharacters, and never removes a pattern sibling; and canonicalize()
skips empty tokens so '', None, and a stray separator do not inject the
current working directory.

realpath() also gets its harder contracts covered: a self-referential
link and an A->B->A cycle both raise ELOOP rather than spinning, a
symlink several components deep still resolves under use_physdir, and a
missing trailing component raises ENOENT by default but is tolerated
with assume_dir=True. symlink() is shown to stage a dangling link whose
target does not exist yet, make_relative_symlink() is exercised several
directories below its target so the multi-level "../" loop runs, and
canonicalize() drops a run of "$" tokens and preserves a trailing slash.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- Expand PathTests from 37 to 46 cases; no source changes.
- realpath(): cover ELOOP on a self-referential link and on an A->B->A cycle, multi-component resolution under use_physdir, and the assume_dir ENOENT-vs-tolerated contract.
- symlink(): cover a dangling link whose target does not exist yet.
- make_relative_symlink(): cover a link several directories below its target (multi-level '../').
- canonicalize(): cover a run of '$' tokens all dropped, and a dropped '$' token before a trailing-slash path.
---
 meta/lib/oeqa/selftest/cases/liboe.py | 376 ++++++++++++++++++++++++++
 1 file changed, 376 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/liboe.py b/meta/lib/oeqa/selftest/cases/liboe.py
index 930354c931a3..96969da1617f 100644
--- a/meta/lib/oeqa/selftest/cases/liboe.py
+++ b/meta/lib/oeqa/selftest/cases/liboe.py
@@ -7,7 +7,10 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import get_bb_var, get_bb_vars, bitbake, runCmd
 import oe.path
+import errno
 import os
+import tempfile
+import unittest.mock
 
 class CopyTreeTests(OESelftestTestCase):
 
@@ -135,3 +138,376 @@ exit 42
         self.assertIn("exit status 42", string)
         self.assertIn("Standard Output: Via stdout", string)
         self.assertIn("Standard Error: Via stderr", string)
+
+class PathTests(OESelftestTestCase):
+    """
+    In-process coverage for oe.path's own path logic: join, is_path_parent,
+    symlink, make_relative_symlink, canonicalize, which_wild and realpath.
+    Thin standard-library wrappers (relative -> os.path.relpath,
+    find -> os.walk) are left to the standard library.
+    """
+
+    def setUp(self):
+        super().setUp()
+        self._tmp = tempfile.TemporaryDirectory(prefix="oeqa-oepath-")
+        self.addCleanup(self._tmp.cleanup)
+        self.tmp_path = self._tmp.name
+
+    # --- join --------------------------------------------------------------
+    # join() is os.path.normpath("/".join(paths)); unlike os.path.join it
+    # does not treat an absolute right-hand component specially.
+
+    def test_join_two_paths(self):
+        self.assertEqual(oe.path.join("a", "b"), "a/b")
+
+    def test_join_absolute_rhs_is_not_special(self):
+        # os.path.join("a", "/b") == "/b"; oe.path.join() keeps it relative.
+        self.assertEqual(oe.path.join("a", "/b"), "a/b")
+
+    def test_join_redundant_separators_normalised(self):
+        self.assertEqual(oe.path.join("a//", "b"), "a/b")
+
+    def test_join_pardir_normalised(self):
+        self.assertEqual(oe.path.join("a", "..", "b"), "b")
+
+    def test_join_empty_leading_component_is_absolute(self):
+        # "/".join(["", "b"]) is "/b", which normpath leaves absolute.
+        self.assertEqual(oe.path.join("", "b"), "/b")
+
+    # --- is_path_parent ----------------------------------------------------
+
+    def test_is_path_parent_direct_child(self):
+        self.assertTrue(oe.path.is_path_parent("/usr", "/usr/bin"))
+
+    def test_is_path_parent_unrelated_path(self):
+        self.assertFalse(oe.path.is_path_parent("/usr", "/tmp"))
+
+    def test_is_path_parent_child_is_not_parent_of_its_parent(self):
+        self.assertFalse(oe.path.is_path_parent("/usr/bin", "/usr"))
+
+    def test_is_path_parent_prefix_string_is_not_a_path_parent(self):
+        # "/usrlocal" shares a string prefix with "/usr" but is not below it;
+        # the trailing-separator handling must reject it.
+        self.assertFalse(oe.path.is_path_parent("/usr", "/usrlocal"))
+
+    def test_is_path_parent_no_paths_returns_false(self):
+        self.assertFalse(oe.path.is_path_parent("/usr"))
+
+    def test_is_path_parent_all_paths_must_be_below(self):
+        self.assertTrue(oe.path.is_path_parent("/usr", "/usr/bin", "/usr/lib"))
+
+    def test_is_path_parent_one_path_outside_fails(self):
+        self.assertFalse(oe.path.is_path_parent("/usr", "/usr/bin", "/tmp"))
+
+    # --- symlink -----------------------------------------------------------
+
+    def test_symlink_creates_symlink(self):
+        src = os.path.join(self.tmp_path, "target.txt")
+        with open(src, "w") as f:
+            f.write("content")
+        dst = os.path.join(self.tmp_path, "link")
+        oe.path.symlink(src, dst)
+        self.assertTrue(os.path.islink(dst))
+        self.assertEqual(os.readlink(dst), src)
+
+    def test_symlink_matching_existing_is_idempotent(self):
+        src = os.path.join(self.tmp_path, "target.txt")
+        with open(src, "w") as f:
+            f.write("content")
+        dst = os.path.join(self.tmp_path, "link")
+        oe.path.symlink(src, dst)
+        oe.path.symlink(src, dst)
+        self.assertEqual(os.readlink(dst), src)
+
+    def test_symlink_conflicting_existing_raises(self):
+        src1 = os.path.join(self.tmp_path, "t1.txt")
+        src2 = os.path.join(self.tmp_path, "t2.txt")
+        for p in (src1, src2):
+            with open(p, "w") as f:
+                f.write(p)
+        dst = os.path.join(self.tmp_path, "link")
+        oe.path.symlink(src1, dst)
+        with self.assertRaises(OSError):
+            oe.path.symlink(src2, dst)
+
+    def test_symlink_force_overwrites_existing_symlink(self):
+        src1 = os.path.join(self.tmp_path, "t1")
+        src2 = os.path.join(self.tmp_path, "t2")
+        for p in (src1, src2):
+            with open(p, "w") as f:
+                f.write(p)
+        dst = os.path.join(self.tmp_path, "link")
+        oe.path.symlink(src1, dst)
+        oe.path.symlink(src2, dst, force=True)
+        self.assertEqual(os.readlink(dst), src2)
+
+    def test_symlink_force_replaces_destination_with_glob_metacharacters(self):
+        # A destination whose name contains glob metacharacters must still be
+        # replaced. Routing the removal through remove() (which globs) fails
+        # to match "link[1]" against itself, leaving the stale entry in place.
+        src = os.path.join(self.tmp_path, "target")
+        with open(src, "w") as f:
+            f.write("content")
+        dst = os.path.join(self.tmp_path, "link[1]")
+        with open(dst, "w") as f:
+            f.write("stale regular file")
+        oe.path.symlink(src, dst, force=True)
+        self.assertTrue(os.path.islink(dst))
+        self.assertEqual(os.readlink(dst), src)
+
+    def test_symlink_force_does_not_delete_glob_siblings(self):
+        # The destination "keep?.txt" does not exist, but a sibling
+        # "keepX.txt" matches it as a glob pattern. force=True must remove
+        # only the literal destination, never a pattern sibling.
+        sibling = os.path.join(self.tmp_path, "keepX.txt")
+        with open(sibling, "w") as f:
+            f.write("do not delete me")
+        src = os.path.join(self.tmp_path, "target")
+        with open(src, "w") as f:
+            f.write("content")
+        dst = os.path.join(self.tmp_path, "keep?.txt")
+        oe.path.symlink(src, dst, force=True)
+        self.assertTrue(os.path.exists(sibling))
+        self.assertEqual(os.readlink(dst), src)
+
+    def test_symlink_force_replaces_existing_directory(self):
+        # An existing directory at the destination is torn down (EISDIR ->
+        # rmtree) before the link is created.
+        src = os.path.join(self.tmp_path, "target")
+        with open(src, "w") as f:
+            f.write("content")
+        dst = os.path.join(self.tmp_path, "dir")
+        os.mkdir(dst)
+        with open(os.path.join(dst, "child"), "w") as f:
+            f.write("x")
+        oe.path.symlink(src, dst, force=True)
+        self.assertTrue(os.path.islink(dst))
+        self.assertEqual(os.readlink(dst), src)
+
+    def test_symlink_creates_dangling_symlink(self):
+        # symlink() does not require the source to exist; callers rely on
+        # being able to stage a link before its target is populated.
+        src = os.path.join(self.tmp_path, "not_created_yet")
+        dst = os.path.join(self.tmp_path, "link")
+        oe.path.symlink(src, dst)
+        self.assertTrue(os.path.islink(dst))
+        self.assertEqual(os.readlink(dst), src)
+        self.assertFalse(os.path.exists(dst))  # dangling: target is absent
+
+    # --- make_relative_symlink ---------------------------------------------
+
+    def test_make_relative_symlink_non_symlink_is_ignored(self):
+        regular = os.path.join(self.tmp_path, "file.txt")
+        with open(regular, "w") as f:
+            f.write("content")
+        oe.path.make_relative_symlink(regular)
+        self.assertTrue(os.path.isfile(regular))
+
+    def test_make_relative_symlink_already_relative_unchanged(self):
+        target = os.path.join(self.tmp_path, "target.txt")
+        with open(target, "w") as f:
+            f.write("content")
+        link = os.path.join(self.tmp_path, "link")
+        os.symlink("target.txt", link)
+        oe.path.make_relative_symlink(link)
+        self.assertEqual(os.readlink(link), "target.txt")
+
+    def test_make_relative_symlink_absolute_becomes_relative_and_resolves(self):
+        target = os.path.join(self.tmp_path, "target.txt")
+        with open(target, "w") as f:
+            f.write("content")
+        link = os.path.join(self.tmp_path, "link")
+        os.symlink(target, link)
+        self.assertTrue(os.path.isabs(os.readlink(link)))
+        oe.path.make_relative_symlink(link)
+        result = os.readlink(link)
+        self.assertFalse(os.path.isabs(result))
+        self.assertTrue(os.path.exists(link))
+        with open(link) as f:
+            self.assertEqual(f.read(), "content")
+
+    def test_make_relative_symlink_several_levels_deep_becomes_relative(self):
+        # The link sits several directories below the target, so the depth
+        # loop has to prepend more than one '../' segment. A single-level
+        # case never exercises that loop body.
+        target = os.path.join(self.tmp_path, "target.txt")
+        with open(target, "w") as f:
+            f.write("content")
+        deep = os.path.join(self.tmp_path, "a", "b", "c")
+        os.makedirs(deep)
+        link = os.path.join(deep, "link")
+        os.symlink(target, link)
+        oe.path.make_relative_symlink(link)
+        result = os.readlink(link)
+        self.assertFalse(os.path.isabs(result))
+        self.assertEqual(result, "../../../target.txt")
+        with open(link) as f:
+            self.assertEqual(f.read(), "content")
+
+    # --- canonicalize ------------------------------------------------------
+
+    def test_canonicalize_real_path_returned(self):
+        self.assertEqual(oe.path.canonicalize(self.tmp_path),
+                         os.path.realpath(self.tmp_path))
+
+    def test_canonicalize_unexpanded_variable_is_skipped(self):
+        self.assertEqual(oe.path.canonicalize("$SOME_VAR"), "")
+
+    def test_canonicalize_variable_token_dropped_leaving_real_path(self):
+        result = oe.path.canonicalize("$VAR," + self.tmp_path)
+        # The "$VAR" token is dropped entirely: no empty placeholder, no
+        # leading separator, just the canonical real path.
+        self.assertEqual(result, os.path.realpath(self.tmp_path))
+
+    def test_canonicalize_empty_string_returns_empty_string(self):
+        # os.path.realpath("") is the cwd; canonicalize("") must not leak it.
+        self.assertEqual(oe.path.canonicalize(""), "")
+
+    def test_canonicalize_none_returns_empty_string(self):
+        self.assertEqual(oe.path.canonicalize(None), "")
+
+    def test_canonicalize_empty_token_between_paths_is_dropped(self):
+        p1 = os.path.join(self.tmp_path, "a")
+        p2 = os.path.join(self.tmp_path, "b")
+        os.mkdir(p1)
+        os.mkdir(p2)
+        # The stray separator in "a,,b" must not inject a cwd entry.
+        result = oe.path.canonicalize("%s,,%s" % (p1, p2))
+        self.assertEqual(result, "%s,%s" % (os.path.realpath(p1),
+                                            os.path.realpath(p2)))
+
+    def test_canonicalize_trailing_slash_preserved(self):
+        result = oe.path.canonicalize(self.tmp_path + "/")
+        self.assertEqual(result, os.path.realpath(self.tmp_path) + "/")
+
+    def test_canonicalize_multiple_variable_tokens_all_skipped(self):
+        # Every "$"-bearing token is dropped, so a list made only of them
+        # canonicalizes to the empty string (no separators, no cwd).
+        self.assertEqual(oe.path.canonicalize("$A,$B,$C"), "")
+
+    def test_canonicalize_variable_and_trailing_slash_path(self):
+        # A dropped "$" token followed by a real path with a trailing slash:
+        # the slash is preserved and no phantom leading separator appears.
+        result = oe.path.canonicalize("$VAR,%s/" % self.tmp_path)
+        self.assertEqual(result, os.path.realpath(self.tmp_path) + "/")
+
+    # --- which_wild --------------------------------------------------------
+
+    def test_which_wild_missing_tool_returns_empty(self):
+        self.assertEqual(oe.path.which_wild("totally_nonexistent_tool_xyz"), [])
+
+    def test_which_wild_explicit_search_path(self):
+        tool = os.path.join(self.tmp_path, "mytool")
+        with open(tool, "w") as f:
+            f.write("#!/bin/sh\n")
+        os.chmod(tool, 0o755)
+        self.assertEqual(oe.path.which_wild("mytool", path=self.tmp_path),
+                         [tool])
+
+    def test_which_wild_wildcard_pattern(self):
+        for name in ("foo-a", "foo-b", "bar"):
+            with open(os.path.join(self.tmp_path, name), "w") as f:
+                f.write("")
+        results = oe.path.which_wild("foo-*", path=self.tmp_path)
+        self.assertEqual(sorted(os.path.basename(p) for p in results),
+                         ["foo-a", "foo-b"])
+
+    def test_which_wild_first_match_per_name_wins(self):
+        # A name found in an earlier PATH element shadows the same name later;
+        # reverse=True walks PATH the other way, so the other copy wins.
+        first = os.path.join(self.tmp_path, "first")
+        second = os.path.join(self.tmp_path, "second")
+        os.mkdir(first)
+        os.mkdir(second)
+        for d in (first, second):
+            with open(os.path.join(d, "tool"), "w") as f:
+                f.write("")
+        search = "%s:%s" % (first, second)
+        self.assertEqual(oe.path.which_wild("tool", path=search),
+                         [os.path.join(first, "tool")])
+        self.assertEqual(oe.path.which_wild("tool", path=search, reverse=True),
+                         [os.path.join(second, "tool")])
+
+    # --- realpath ----------------------------------------------------------
+
+    def test_realpath_resolves_symlink_below_root(self):
+        target = os.path.join(self.tmp_path, "real")
+        os.mkdir(target)
+        link = os.path.join(self.tmp_path, "lnk")
+        os.symlink("real", link)
+        self.assertEqual(oe.path.realpath(link, self.tmp_path), target)
+
+    def test_realpath_plain_path_is_returned(self):
+        sub = os.path.join(self.tmp_path, "d")
+        os.mkdir(sub)
+        self.assertEqual(oe.path.realpath(sub, self.tmp_path), sub)
+
+    def test_realpath_path_outside_root_raises(self):
+        root = os.path.join(self.tmp_path, "root")
+        outside = os.path.join(self.tmp_path, "outside")
+        os.mkdir(root)
+        os.mkdir(outside)
+        with self.assertRaises(OSError):
+            oe.path.realpath(outside, root)
+
+    def test_realpath_resolves_symlink_several_components_deep(self):
+        # With use_physdir=True realpath resolves each intermediate
+        # component, so a link buried under real subdirectories must still
+        # resolve to its final target.
+        os.makedirs(os.path.join(self.tmp_path, "a", "b", "c"))
+        link = os.path.join(self.tmp_path, "link_to_c")
+        os.symlink("a/b/c", link)
+        result = oe.path.realpath(os.path.join(link, "file"),
+                                  self.tmp_path, assume_dir=True)
+        self.assertEqual(result,
+                         os.path.join(self.tmp_path, "a", "b", "c", "file"))
+
+    def test_realpath_self_referential_symlink_raises_eloop(self):
+        # A link that points at itself must be reported as ELOOP rather than
+        # spinning until the recursion limit or the stack blows.
+        link = os.path.join(self.tmp_path, "loop")
+        os.symlink("loop", link)
+        with self.assertRaises(OSError) as cm:
+            oe.path.realpath(link, self.tmp_path)
+        self.assertEqual(cm.exception.errno, errno.ELOOP)
+
+    def test_realpath_mutual_symlink_cycle_raises_eloop(self):
+        # An A -> B -> A cycle is the same contract as the self-loop.
+        a = os.path.join(self.tmp_path, "a")
+        b = os.path.join(self.tmp_path, "b")
+        os.symlink("b", a)
+        os.symlink("a", b)
+        with self.assertRaises(OSError) as cm:
+            oe.path.realpath(a, self.tmp_path)
+        self.assertEqual(cm.exception.errno, errno.ELOOP)
+
+    def test_realpath_missing_component_raises_enoent_without_assume_dir(self):
+        # By default a missing path component is an error.
+        with self.assertRaises(OSError) as cm:
+            oe.path.realpath(os.path.join(self.tmp_path, "nope", "missing"),
+                             self.tmp_path)
+        self.assertEqual(cm.exception.errno, errno.ENOENT)
+
+    def test_realpath_missing_component_tolerated_with_assume_dir(self):
+        # assume_dir=True lets realpath resolve a path whose trailing
+        # components do not exist yet, returning the composed path.
+        result = oe.path.realpath(
+            os.path.join(self.tmp_path, "nope", "missing"),
+            self.tmp_path, assume_dir=True)
+        self.assertEqual(result,
+                         os.path.join(self.tmp_path, "nope", "missing"))
+
+    def test_realpath_isdir_failure_falls_back_without_nameerror(self):
+        # The final stanza of __realpath tolerates any failure from
+        # os.path.isdir by treating the path as not-a-directory. Force isdir
+        # to raise and confirm the fallback returns the resolved path rather
+        # than raising NameError from an undefined fallback value.
+        sub = os.path.join(self.tmp_path, "d")
+        os.mkdir(sub)
+
+        def boom(_path):
+            raise OSError("synthetic stat failure")
+
+        with unittest.mock.patch("os.path.isdir", boom):
+            self.assertEqual(
+                oe.path.realpath(sub, self.tmp_path, use_physdir=False), sub)
-- 
2.50.0.173.g8b6f19ccfc3a


