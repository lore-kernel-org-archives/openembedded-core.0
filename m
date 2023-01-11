Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6124CC5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 16:22:11 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.28324.1673454125288195673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 08:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=VrQL9mIN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id m7-20020a17090a730700b00225ebb9cd01so20559890pjk.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 08:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LHTnri994q7DZ1fQt351o19xm/olaQVCeBRB1zgy/Vc=;
        b=VrQL9mINYoibdWx2WRkzX5OWpmxThPy/4hWIfVymNtkyBkA+2xpOuT5M0clmUKt8G7
         OlxEcDWm3QBFkni2gfcYvcW9Gu2lqGY5gHC302SksHQkMbPgg+nwQy8yP1NCAp5UEWiP
         6SZk5x8V9zF3S3K1xQwmGh9g//i5Q2IgeM8XBQUpd9JtGkfl2Wcgeqz9h9y2LSy7MXsC
         NerDWxjR2NKHd3bHsRfOhnm3ftsmtLzHyEDljp1ARNB/Q/16cWLw3fHZjbxWFKPQDCr4
         tML9Ho7erDyS3YfNXkq2tN66IwOxaNKoEcS51C+iNbkx4/a0N0hHVjRO6nE3UJMEDwZX
         QEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHTnri994q7DZ1fQt351o19xm/olaQVCeBRB1zgy/Vc=;
        b=WTb1HzbCq+MUT39WlcVRYdp8qhqCsD47+cUZnZFU16DkMAPBLMSyk080oSGmoF6pbO
         Q9U28l8W1MTPjm4zPPNBCl0Kyq/EzbZeq1ajtx0AyEoVglX72YzjOobRRfdtkYcqhDJc
         F5DXXYCBml4x5b1Vy/Rx6Yincljd8yoBZ+kJB2oTRNFYaB0dcge8QmSy1+acvqmK+R6c
         LejAfS4/fIyG/nLf+qUnzeLysYnS6vcG3KPMSIp27F9IeYSdoopy0k4yvBLh7LxP81hp
         ApkAUm5ZddLpoXHxORYQli9QwuxrNOdNy9ysgElRWjBAIsgHAE/qPgwke6WCAk94iifT
         8OzQ==
X-Gm-Message-State: AFqh2kqq3dr25Yuj959XwoCo/bH9k1QRUrLOmsgt39m7Sll3rGGbhaGe
	9CsxRYfiXRnertwnw5gOxHtqs6Re/rY/aGA6DXk=
X-Google-Smtp-Source: AMrXdXsJ4ikEAfI+9z55IwuTMIGd/AkGV4+hui+xL3LYj66tF/oqal+2szMogpoC2+sZkqkNJBrXLg==
X-Received: by 2002:a05:6a21:9188:b0:a3:a90f:5326 with SMTP id tp8-20020a056a21918800b000a3a90f5326mr3461247pzb.61.1673454124192;
        Wed, 11 Jan 2023 08:22:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id u14-20020a63ef0e000000b0046feca0883fsm8685384pgh.64.2023.01.11.08.22.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 08:22:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 11/11] devtool: process local files only for the main branch
Date: Wed, 11 Jan 2023 06:21:37 -1000
Message-Id: <b2dfb2fe86de887d0239078ded0a4f9e8c677d83.1673453368.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673453368.git.steve@sakoman.com>
References: <cover.1673453368.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 16:22:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175767

From: Alexander Kanavin <alex.kanavin@gmail.com>

devtool modify/upgrade are not currently equipped to handle conditional local files
in SRC_URI, and provide only the main no-override set in a workspace under
source/component/oe-local-files/ (this is done via meta/classes/devtool-source.bbclass).

On the other hand, updating the changes from workspace into a recipe
is run iteratively against all overrides; this works for patches (as they
all are directed into their own override branches in the workspace
git source tree), but breaks down when trying to match local files
in a workspace against local files in overridden SRC_URI lists, resulting in
bad recipe breakage.

(there's an additional twist here: existing code has a guard against this
but the guard relies on metadata in workspace .bbappend that is only there
in modify operations, but not upgrades. This commit replaces the guard
with a general check that will work everywhere).

Implementing multiple sets of local files is significant work; let's for now
simply not touch local files in recipes except when on the no-override variant.

Also, adjust the selftest cases to include conditional local files in sample
recipes, so the situation is covered by the tests.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3a8654b860fa98f94e80c3c3fff359ffed14bbe7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../devtool/devtool-test-local/file3          |  1 +
 .../devtool/devtool-test-local_6.03.bb        |  3 ++
 .../devtool/devtool-test-localonly.bb         |  3 ++
 .../devtool/devtool-test-localonly/file3      |  1 +
 scripts/lib/devtool/standard.py               | 38 +++++++++++--------
 5 files changed, 30 insertions(+), 16 deletions(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-local/file3
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-localonly/file3

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-local/file3 b/meta-selftest/recipes-test/devtool/devtool-test-local/file3
new file mode 100644
index 0000000000..0f30e9eec4
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-local/file3
@@ -0,0 +1 @@
+The third file.
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb b/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb
index 463cfe0a7a..d0fd697978 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-local_6.03.bb
@@ -7,9 +7,12 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/syslinux-${PV}.tar.x
            file://file1 \
            file://file2"
 
+SRC_URI:append:class-native = " file://file3"
+
 SRC_URI[md5sum] = "92a253df9211e9c20172796ecf388f13"
 SRC_URI[sha256sum] = "26d3986d2bea109d5dc0e4f8c4822a459276cf021125e8c9f23c3cca5d8c850e"
 
 S = "${WORKDIR}/syslinux-${PV}"
 
 EXCLUDE_FROM_WORLD = "1"
+BBCLASSEXTEND = "native"
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb b/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
index 3f7123cda0..e767619879 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-localonly.bb
@@ -4,4 +4,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 SRC_URI = "file://file1 \
            file://file2"
 
+SRC_URI:append:class-native = " file://file3"
+
 EXCLUDE_FROM_WORLD = "1"
+BBCLASSEXTEND = "native"
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-localonly/file3 b/meta-selftest/recipes-test/devtool/devtool-test-localonly/file3
new file mode 100644
index 0000000000..0f30e9eec4
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-localonly/file3
@@ -0,0 +1 @@
+The third file.
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index f46ce34ad1..d64e18e179 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1409,6 +1409,18 @@ def _export_local_files(srctree, rd, destdir, srctreebase):
     updated = OrderedDict()
     added = OrderedDict()
     removed = OrderedDict()
+
+    # Get current branch and return early with empty lists
+    # if on one of the override branches
+    # (local files are provided only for the main branch and processing
+    # them against lists from recipe overrides will result in mismatches
+    # and broken modifications to recipes).
+    stdout, _ = bb.process.run('git rev-parse --abbrev-ref HEAD',
+                               cwd=srctree)
+    branchname = stdout.rstrip()
+    if branchname.startswith(override_branch_prefix):
+        return (updated, added, removed)
+
     local_files_dir = os.path.join(srctreebase, 'oe-local-files')
     git_files = _git_ls_tree(srctree)
     if 'oe-local-files' in git_files:
@@ -1638,31 +1650,25 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
         local_files_dir = tempfile.mkdtemp(dir=tempdir)
-        if filter_patches:
-            upd_f = {}
-            new_f = {}
-            del_f = {}
-        else:
-            upd_f, new_f, del_f = _export_local_files(srctree, rd, local_files_dir, srctreebase)
-
-        remove_files = []
-        if not no_remove:
-            # Get all patches from source tree and check if any should be removed
-            all_patches_dir = tempfile.mkdtemp(dir=tempdir)
-            _, _, del_p = _export_patches(srctree, rd, initial_rev,
-                                          all_patches_dir)
-            # Remove deleted local files and  patches
-            remove_files = list(del_f.values()) + list(del_p.values())
+        upd_f, new_f, del_f = _export_local_files(srctree, rd, local_files_dir, srctreebase)
 
         # Get updated patches from source tree
         patches_dir = tempfile.mkdtemp(dir=tempdir)
         upd_p, new_p, _ = _export_patches(srctree, rd, update_rev,
                                           patches_dir, changed_revs)
+        # Get all patches from source tree and check if any should be removed
+        all_patches_dir = tempfile.mkdtemp(dir=tempdir)
+        _, _, del_p = _export_patches(srctree, rd, initial_rev,
+                                      all_patches_dir)
         logger.debug('Pre-filtering: update: %s, new: %s' % (dict(upd_p), dict(new_p)))
         if filter_patches:
             new_p = OrderedDict()
             upd_p = OrderedDict((k,v) for k,v in upd_p.items() if k in filter_patches)
-            remove_files = [f for f in remove_files if f in filter_patches]
+            del_p = OrderedDict((k,v) for k,v in del_p.items() if k in filter_patches)
+        remove_files = []
+        if not no_remove:
+            # Remove deleted local files and  patches
+            remove_files = list(del_f.values()) + list(del_p.values())
         updatefiles = False
         updaterecipe = False
         destpath = None
-- 
2.25.1


