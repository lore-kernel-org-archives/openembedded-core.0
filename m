Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C8CC67871
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 02:33:44 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.45245.1673490823899470590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 18:33:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=R5lG9zKh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id c6so18812629pls.4
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 18:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgziQidodPX62v+gd/dUvRcx/19+TVTD0RN4fSjFlAI=;
        b=R5lG9zKhZ1s41dQ2MGZIgdH0YbWcN82BsSJTlJApOCcNtCqpaq+avZBb0qg6XhRslE
         PXIMCUNvAgrBLzSVnSw1AAlU8HKpLq+QaVSd/SzJp7y37+5amvZv9mqyqe8WPFKVJ6PF
         9ada95RVrvrfIPM3FkNJ3d0d/H+PPjkETjv2E/wLVnBUIewX3BvGu/JXuxprN6Kgg29j
         k9NoQr/j0oP/r9ppENjJJoiPb8QAwcDcDhyo9ULDHQQVEtG/1qLexhSfTz5XeiRmiNE4
         N09hCSf/JpQtOs6dMy+rpy5h6VwXzIFT4ADmYBdvYG7o6lBLTcZauwHJcrtCj5B4QfyY
         bSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgziQidodPX62v+gd/dUvRcx/19+TVTD0RN4fSjFlAI=;
        b=4jEY7J3EzITTOO9+v/nUkCEBZ5ILuQFAkZaY4h8LorKQpP3KyFvQN+65kxddHcD3Fw
         6weju+9hsG0rNW0JS708hcz/dYJojSAnyv9Zu5DZnAPrWMks6YpYX0mhN8PIy3zvTiNV
         Da0GEjnVmRDw8pur8U8G+zywbcoDas8Ng9ahhevansKaG2z6irlLuWQspMBpqSlqXiAO
         A+JzLs6Qea5X/kcvtPxml5h9Di2VHp7tkRyiH/ieX/DPu1vsu4QGZayeWh4oaseDWsr6
         F7rGJ8CAUhjsN2qG7FJSYkI4/pN0c0B4jLtjIR/xw/Vrnm06lfrKtrcp469lUwNDTx1g
         H/fw==
X-Gm-Message-State: AFqh2kopDF1gom8HN8L6sEMX7JFpy4p3oqNsBH99Qb7Ex0yaJ9lcIUDn
	IyHiLHxtuYHEDS+8AyeN6Eg8h8wug4OakLcoX2A=
X-Google-Smtp-Source: AMrXdXv1zlVaDmc3yHANWWeOC6OPaGiHmP0AWxM+ZV1nr7BBu29d4fQhjw+n4pmSW1bsGNq07unMsA==
X-Received: by 2002:a17:902:9888:b0:192:ce7e:93b7 with SMTP id s8-20020a170902988800b00192ce7e93b7mr36880598plp.49.1673490822759;
        Wed, 11 Jan 2023 18:33:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902cecb00b00192d389db91sm11006719plg.75.2023.01.11.18.33.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 18:33:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/11] devtool: process local files only for the main branch
Date: Wed, 11 Jan 2023 16:33:12 -1000
Message-Id: <da903ae324c63fcdb5f0e4a7226e1fcf152e139a.1673490673.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673490673.git.steve@sakoman.com>
References: <cover.1673490673.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 02:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175784

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
index 4bbf9dd5a5..e2a8335a62 100644
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


