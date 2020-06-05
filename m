Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.1969.1591320960663248181
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 18:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XFhoDiQ0;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bkylerussell@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d27so7236121qtg.4
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 18:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Be6pH1VmghgxSmHxa374NkIq+D3y92Y34sM3e5UWCrA=;
        b=XFhoDiQ0SxmTGVhyLCX8ahKO6y21xazjanZROJNMqVmm78EK2HdoiUhwvXYtIe7na+
         x9uF4eHGo/w8GcBL7HeCqx2Gctb4PV2ryOfS5J4YZ4s0z2n1WBMXcujT7K/gxatHIJS5
         kmw+hC8znKtaM0kqUdXnVkmi7JFVJKDZCvSz7Oho8XXcAy+rMpdEU2/SqJLRZSR5t1b+
         RbnrbMBcPZuYnXCPYfoo5JiUh6AmLPeUyECHHrVXXbZNMbgrW7YP43+YD1i7nFZ3OlOu
         Xc4fmI9Nkv9pnbZohReILnrW+8Lj3NtgDOVh4jVtgPX4zkoN/J7Qoa31qb/7VsIR7J3S
         iknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Be6pH1VmghgxSmHxa374NkIq+D3y92Y34sM3e5UWCrA=;
        b=YRJhGVk1RjgMnzFNDxTBJnBqrGT6fN+WouxlUyBnUlBc5ot/ZH7DiJOolmZXxxY5ET
         dcnOVPNMhQ8Al93Y0UYBFBOHdy2aKCM3fBQ68ksXznZiAKrIwe6JpNKZh6rSY7EM2jo9
         kERuoyFzzZakZ21vXeEEIChxII/qqoqeRicW9BlP8T4NpSatvOFMqTlfw2SbS8MRB2x2
         C4qkqYvhXeAqVp/En7AFnwzITFqSr5muPBXOcF5oj0s2EBbTitQVuBCT2+rUj+jRNUQJ
         Cvx2emjaxk0V3NoGFdAui7nF4DHvYeXbxR960Lo3cMZVyI5vK+E1qVUc6wKZPOWYQVhA
         ie9w==
X-Gm-Message-State: AOAM530zhWLpb3eAqimm8uRk6FDjlKuP/aCGQ4ODNMnQXO5GDDfvqHri
	z4QMQRfEm8K3+ILa1040E+Lm9535
X-Google-Smtp-Source: ABdhPJxyyQ+VuvS8QvTWZZoq2IVcXaMZ9+7FO/+oElcPdu01BuJ4iS5ESCSGp2P66xVRFWC5Jz2SgQ==
X-Received: by 2002:ac8:1109:: with SMTP id c9mr7252570qtj.314.1591320959577;
        Thu, 04 Jun 2020 18:35:59 -0700 (PDT)
Return-Path: <bkylerussell@gmail.com>
Received: from poirot.lexmark.ds ([2605:a000:160c:8196:bca8:8efa:5506:d38a])
        by smtp.gmail.com with ESMTPSA id o66sm5959327qka.60.2020.06.04.18.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 18:35:59 -0700 (PDT)
From: bkylerussell@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: wesley.lindauer@gmail.com,
	Kyle Russell <bkylerussell@gmail.com>
Subject: [PATCH v2 1/1] patch.py: don't apply striplevel to git am command
Date: Thu,  4 Jun 2020 21:35:40 -0400
Message-Id: <20200605013540.18777-2-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200605013540.18777-1-bkylerussell@gmail.com>
References: <20200605013540.18777-1-bkylerussell@gmail.com>

Don't pass a path removal parameter to git am since it always applies
patches from the root of the git repo, not from each individual patchdir
(like quilt).

GitApplyTree uses `git rev-parse --show-toplevel` to find the root of
the repo no matter which patchdir is passed into the GitApplyTree instance.
But for recipes who set S to a subdirectory within their repo, patches
may be added to SRC_URI using a striplevel parameter to match the depth of S.

Currently when these patches are applied with git am in GitApplyTree instead
of quilt, the striplevel still takes effect even though git applies the
patch itself from the repo root, not from within S.

In most cases when a patch modifies existing files within a repo, git am
works fine and the desired outcome is still achieved because the three-way
merge figures out which file the patch was intended to modify based on the
repo history.

An exception to this occurs if the patch adds a new file to the repo.

For example, consider a patch that adds a new file src/foo to a repo.
Additionally, assume the recipe for this repo sets S = "${WORKDIR}/git/src",
and the patch is added to SRC_URI using "striplevel=2" since the default
patch tool, quilt, applies each patch at its patchdir, ${S}.

  --- /dev/null
  +++ b/src/foo
  @@ -0,0 +1 @@
  +new file test

When the GitApplyTree patch class is used (through either devtool or
PATCHTOOL = "git"), the root of the repo is passed to git as the work tree,
in addition to the path removal paramter.  In the case above, GitApplyTree
creates ${WORKDIR}/git/foo instead of ${WORKDIR}/git/src/foo.

This is demonstrated with the included selftest.  By not passing the striplevel
parameter to git am, the patch creates the new file at the intended depth in
the repo.
---
 .../llvm/files/0001-Test-new-file.patch        | 17 +++++++++++++++++
 .../recipes-test/llvm/llvm_%.bbappend          |  2 ++
 meta/lib/oe/patch.py                           |  2 +-
 meta/lib/oeqa/selftest/cases/bbtests.py        | 18 ++++++++++++++++++
 4 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-selftest/recipes-test/llvm/files/0001-Test-new-file.patch
 create mode 100644 meta-selftest/recipes-test/llvm/llvm_%.bbappend

diff --git a/meta-selftest/recipes-test/llvm/files/0001-Test-new-file.patch b/meta-selftest/recipes-test/llvm/files/0001-Test-new-file.patch
new file mode 100644
index 0000000000..8af0afeb12
--- /dev/null
+++ b/meta-selftest/recipes-test/llvm/files/0001-Test-new-file.patch
@@ -0,0 +1,17 @@
+From 057c3da44affb47c154ec1ef67bd11646a6429fa Mon Sep 17 00:00:00 2001
+From: Kyle Russell <bkylerussell@gmail.com>
+Date: Tue, 28 Apr 2020 15:18:43 -0400
+Subject: [PATCH] Test new file
+
+---
+ llvm/README.new | 1 +
+ 1 file changed, 1 insertion(+)
+ create mode 100644 llvm/README.new
+
+diff --git a/llvm/README.new b/llvm/README.new
+new file mode 100644
+index 00000000000..0527e6bd2d7
+--- /dev/null
++++ b/llvm/README.new
+@@ -0,0 +1 @@
++This is a test
diff --git a/meta-selftest/recipes-test/llvm/llvm_%.bbappend b/meta-selftest/recipes-test/llvm/llvm_%.bbappend
new file mode 100644
index 0000000000..205720982c
--- /dev/null
+++ b/meta-selftest/recipes-test/llvm/llvm_%.bbappend
@@ -0,0 +1,2 @@
+# This bbappend is used to alter the recipe using the test_recipe.inc file created by tests.
+include test_recipe.inc
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 7ca2e28b1f..870d183e8b 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -512,7 +512,7 @@ class GitApplyTree(PatchTree):
             try:
                 shellcmd = [patchfilevar, "git", "--work-tree=%s" % reporoot]
                 self.gitCommandUserOptions(shellcmd, self.commituser, self.commitemail)
-                shellcmd += ["am", "-3", "--keep-cr", "-p%s" % patch['strippath']]
+                shellcmd += ["am", "-3", "--keep-cr"]
                 return _applypatchhelper(shellcmd, patch, force, reverse, run)
             except CmdError:
                 # Need to abort the git am, or we'll still be within it at the end
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index dc423ec439..6d863b425a 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -4,6 +4,7 @@
 
 import os
 import re
+import tempfile
 
 import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
@@ -81,6 +82,23 @@ class BitbakeTests(OESelftestTestCase):
                 found = l
         self.assertTrue(found and found.startswith("ERROR:"), msg = "Incorrectly formed patch application didn't fail. bitbake output: %s" % result.output)
 
+    def test_patchtool_git(self):
+        test_recipe = 'llvm'
+        tmpdir = tempfile.mkdtemp(prefix='bitbakeqa')
+        bb_vars = get_bb_vars(['S'], test_recipe)
+        src_dir = bb_vars['S']
+
+        self.write_recipeinc('llvm', 'FILESEXTRAPATHS_prepend := "${THISDIR}/files:"\nSRC_URI += "file://0001-Test-new-file.patch;striplevel=2"')
+        bitbake('llvm -c patch')
+        self.assertExists('%s/README.new' % src_dir)
+
+        bitbake('%s -c clean' % test_recipe)
+        self.append_recipeinc('llvm', 'PATCHTOOL = "git"')
+        bitbake('llvm -c patch')
+        self.assertExists('%s/README.new' % src_dir)
+
+        self.delete_recipeinc('llvm')
+
     def test_force_task_1(self):
         # test 1 from bug 5875
         test_recipe = 'zlib'
-- 
2.17.1

