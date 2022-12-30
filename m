Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E45C4708E
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 18:39:15 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.25155.1672425548361412716
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 10:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AFKrwHmD;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id g10so1872154wmo.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 10:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+6m3Bz5KVtMvuuucC63mr/y9Jz8h93Jb+kiqDZHwLs=;
        b=AFKrwHmDBnpoMOqc1jhfmVaZC/nLI7nL4zAuqywAVxjp38NqfSBgQ/M1lzRLgj+C76
         XBCVxLlZeprQf7INP6W3x5I/hUjIR7dSCYf1Y2bVCbGTmyVP+0wEVQQfNOEMYxSob/Ss
         Wm2arPS1S1hs5yvxpWxX6MP/Osnk7YpyP/u6orPXYZokKbZOmsbwSaSfHULvoUWZj2n9
         ri9JEURCfih3ONoo81MhGjWgYiGvizK8ZolhS4cchbK4ePTO1OKmn0NbnDzbXhI876X8
         MlD18hF++WVQLiQsrcOC+oZafcWBe2S6B/+wtoLtFE0I7iJ8Wlx6GWw9EW6gAulUmiEd
         J1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+6m3Bz5KVtMvuuucC63mr/y9Jz8h93Jb+kiqDZHwLs=;
        b=b7eTrKSZRFSUCsWTnJSxIYwoOFq8r/5QCZK9GStTUivsZgEkY2d+K/03OveNkmO3a3
         EsL8UOBObIBDmOB0kxC0xmtj69SCk/CDsftGTGlOpYmR/Y88RGtXHczNBWBCa3Vzgat9
         hYKI6hM0IFlWGmBtJeXwYWHOo+bVqRcyZR6uPaL+Dak/P24o+piXWSXSHxnO493rDND1
         jM8SAiYPqzklr82NMKioVduOwMqnnGW55eh+73EQ4OiQlVCcyfmx6BKGmyz6uuFnjdzb
         XxHofwk0JMQ17TygZcIWbTYiwkwdRRwuholP7d9uaoZ/iFHZHa4WuKfLyQc5cHc/EqH2
         0S3Q==
X-Gm-Message-State: AFqh2kpdblwWJD9Sq27R3b1S32gT+dQYbECHKtKwW7AKYHmPZjbwSpEy
	s+8Wvjnwq0NFAQ9YwZkKERC2H9j6A9w=
X-Google-Smtp-Source: AMrXdXs5Vbw7js3ShQxLhS/7gp8h5l0fGgEHBepMQCcBfEIG0CnyJ3zZxt+6yGFit/A3S1opycpdLA==
X-Received: by 2002:a05:600c:3d10:b0:3c6:e63e:89c6 with SMTP id bh16-20020a05600c3d1000b003c6e63e89c6mr22999215wmb.34.1672425546903;
        Fri, 30 Dec 2022 10:39:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n1-20020a05600c4f8100b003d96b8e9bcasm31426682wmq.32.2022.12.30.10.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 10:39:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/11] devtool: process local files only for the main branch
Date: Fri, 30 Dec 2022 19:38:50 +0100
Message-Id: <20221230183850.3089510-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221230183850.3089510-1-alex@linutronix.de>
References: <20221230183850.3089510-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 18:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175174

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
2.30.2


