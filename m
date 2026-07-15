Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3410C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 22:13:18 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.534.1784153596233389512
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 15:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KsVieEqy;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8eefd0c5f59so27425146d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 15:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784153595; x=1784758395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mbPIPjG2kHq3UehXAVCNJVKosdIgHZQiGn9FQYVfAlc=;
        b=KsVieEqyqTLwrm9oDznnvkrcgIYo7i/D4kBVoBbdqlt3fh4lsQSnuYK1Hh0falRpHd
         O0wZsIUqN+RWW+aeNIUXXbBXGXWdDaCLG0qgBIZgH42Z/D3dXl9be0cSoIeWJrDMWs2i
         9eZro9dv3gKqP3+TQO9uzREPkqpQ9DMRwI8ZB/Xox7cKQ9lKlPfi3HGh2JDPr4xSKaYM
         unVFqsb8y/PHoHouwTsG5/t6RgIov28b2VTteebqAKGCCDzKYUCOnLOe3VSjWiB0BGev
         DIoUepgXpLXRVJ3qWQbBhwXs+kCmH7NlvQh1P0GZ3arzcMWEjFA6BZ+8P/rMHlVYse6T
         iqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784153595; x=1784758395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mbPIPjG2kHq3UehXAVCNJVKosdIgHZQiGn9FQYVfAlc=;
        b=mlH6A+jOfZR2oSrEKyGvwDrbTOVJGr1I1bs6QyXGCMoyrrpAzEnTGrT9OePyVd6r4O
         rvjxMD2itbBW006IPZPEMxdidkAPWhKgARsSIuS0BdcR+GGfcEoX1O+v9yCfZYhZRZ+b
         nxMNGWwUoCoIjp155WMdPDLRuprqgbFBuEH1UgWKXf8h0gf8087nvIdH0SiO2gwW8Gk3
         ypsWsyBWQdfVUHGAaMxFIHj/4iS+hOsm6a8u46K+iS1n6+S/K9/QjByC70rsnEvvasO9
         qj/Bw24ZFGibETxq1WFgbK+E6GGO+aPglu9aDVR52DPpGgKUF0HtdSvA7uDdfv82cT2A
         RCsg==
X-Gm-Message-State: AOJu0YyZW6tg2W17bo6Ic7LPWhtSvzLHBG4wDt63IZins6j93U6aMI0W
	fFlG95jPWDI6kaEDWIP6aaZW8qpezBrvIXCbsZTDsnQ/f8LMLRib9OL/G95e0A==
X-Gm-Gg: AfdE7cnhSYjWqR8CrsWbFvRGk5NaHmPq5rwldbScW2ZcT7QSkiCwH7oFRMXLDLKYLTB
	/TQ5jnwQOgL3TA1rcLrLAJRfkRvsEkisIXPEQpJ4E6JGCrsTZNURZKUiEasgJXyM1uooP9vjqAd
	MhnC1MiOkYNnjt7pLhCdSHfySXheQEmJaktKROwsd5WjB0VqONB9WfK4CRBLGQnRff+HWeMM1FO
	j3dkU/k5mafVIhnasid3avyufM1XoDjQjwF0KDBRALp9ojmQZlTjkxm0hbc3Ey9IZG/nEjOe5n7
	NbKxbQmyaXn4OPj75Sg2eQ6yz988Mukv9FpDkjoJVMEHqZWm8gnvl/jZh8Jo7ooVkYVnsjUIydU
	pNfDPxpAiFAlTp2HhczhHZwMs9b5jGssQD3C9PYdkL0GVj7krz3Mt0PJv0zEb9ysOD96mqPSigz
	+iXFciRB3Py+Nanuq2VjnntIAlvs/pJ7s/JZ/oDKWYiLYg
X-Received: by 2002:a05:6214:23c6:b0:8e9:d24:c21f with SMTP id 6a1803df08f44-903ffc6db8cmr230334036d6.14.1784153594813;
        Wed, 15 Jul 2026 15:13:14 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e081dsm204822086d6.9.2026.07.15.15.13.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 15:13:12 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] oeqa/selftest/liboe: cover oe.path's own path logic
Date: Wed, 15 Jul 2026 18:12:52 -0400
Message-ID: <20260715221252.3369108-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260715221252.3369108-1-twoerner@gmail.com>
References: <20260715221252.3369108-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 22:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241047

Add in-process coverage for oe.path's join(), is_path_parent(),
symlink(), make_relative_symlink(), canonicalize(), which_wild() and
realpath(), alongside the existing copytree tests.

The cases pin behaviour that is easy to regress: __realpath() falls back
to "not a directory" when os.path.isdir() raises; symlink(force=True)
replaces the literal destination even when its name contains glob
metacharacters, and never removes a pattern sibling; and canonicalize()
skips empty tokens so '', None, and a stray separator do not inject the
current working directory.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/lib/oeqa/selftest/cases/liboe.py | 289 ++++++++++++++++++++++++++
 1 file changed, 289 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/liboe.py b/meta/lib/oeqa/selftest/cases/liboe.py
index 930354c931a3..fa4902610cc4 100644
--- a/meta/lib/oeqa/selftest/cases/liboe.py
+++ b/meta/lib/oeqa/selftest/cases/liboe.py
@@ -8,6 +8,8 @@ from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import get_bb_var, get_bb_vars, bitbake, runCmd
 import oe.path
 import os
+import tempfile
+import unittest.mock
 
 class CopyTreeTests(OESelftestTestCase):
 
@@ -135,3 +137,290 @@ exit 42
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


