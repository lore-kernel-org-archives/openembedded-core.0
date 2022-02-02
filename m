Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC72C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:28 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.2225.1643826506996022779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dd6URo2j;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id p7so349545edc.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9NguQPb/bXHjyTpea2SUCMdzHAFpWfHcrUsAnjBk/Cs=;
        b=dd6URo2jCD/XWQBCWfg5Co0lGyK9Ok7G8zsnVWZNyinBF6bST1F9EHQaJnlBjqHcUJ
         zZWUeQIkjHFj7f3TvAxmgXLaNa+yqhpplOrtpJhvP6KGc+wrp8Z+bO5aLu9eN8jUD2DA
         EiE8v2ZSRx254KWUut4BRm7mNjFEW3kWTk1FXhPqWH1DDaACfUxBcrdicRfXKdjDcT7L
         fYj2fMoRYao+c7MTdJs2+Mm9M3+9OckQVTBHZ8xWGCqRT4EgNbtd48QGPkRAf2jkuxIG
         JrBUfA8TL1GQ4fU6BllBHSXqnZgpxll0+vfajx21CD+MUnkTdnahe7ERXrOtZxJc7++R
         qkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9NguQPb/bXHjyTpea2SUCMdzHAFpWfHcrUsAnjBk/Cs=;
        b=q2gPh/3iW/CC7VbwxT7b7V85hHNDVbN2ZR243AQVfTlS/pOkkheeiTyy1AofTLy3QQ
         XRkVrkfML0JtKmKtLlLY07f6XLjUF9TTMtEgxOWNV4IQbSBRIp/6hCMqjn3idyShlc7u
         Jb+YqCVZLGv04b8hoGM3xST7YADJLAyt57RMShtJwpAaGbogHYk3CzgDxLD/fpBDlMfn
         pvjP4NeiSCXLx+1mtBFIYyWafMSWosC5Y9cgwbI5tL3/B60YPL6GumRGExXRj4skFwm0
         6iXDjA4xxpcO9a3PrOP0vG9jcTYwBd5m+oEoQKaRRGOUpAZFu6t4blogZ7MVMjG4T5Bs
         k/lw==
X-Gm-Message-State: AOAM532XieTi1ifIrwz3cC8dMhyfbWKZFQi03V4MCahfQ1pPRmr0GY2r
	nuMyEL1LJ+PTtQZQ2o0+qkO/DTHJy9M=
X-Google-Smtp-Source: 
 ABdhPJzcHBVrUsGoe9AB+T/vE0SPSv1QVwPMsIQtZbGYU6E+F/nBkQt7tPETVIcmCWunDiDYozZmZQ==
X-Received: by 2002:a50:9d0d:: with SMTP id
 v13mr31751386ede.242.1643826505604;
        Wed, 02 Feb 2022 10:28:25 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 26/33] piglit: upgrade to latest revision
Date: Wed,  2 Feb 2022 19:27:51 +0100
Message-Id: <20220202182758.919991-26-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161251

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...file.py-make-test-lists-reproducible.patch | 31 -------------
 ...gen_tcs-tes_input_tests.py-do-not-ha.patch | 44 -------------------
 ...lizer.py-make-.gz-files-reproducible.patch | 30 -------------
 ...sort-the-file-list-before-working-on.patch | 28 ------------
 meta/recipes-graphics/piglit/piglit_git.bb    |  6 +--
 5 files changed, 1 insertion(+), 138 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch b/meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch
deleted file mode 100644
index c90f601cfa..0000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 9086d42df1f3134bafcfe33ff16db7bbb9d9a0fd Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 30 Nov 2020 23:08:22 +0000
-Subject: [PATCH] framework/profile.py: make test lists reproducible
-
-These are created with os.walk, which yields different
-order depending on where it's run.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/610]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- framework/profile.py | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/framework/profile.py b/framework/profile.py
-index c210e535e..9b5d51d68 100644
---- a/framework/profile.py
-+++ b/framework/profile.py
-@@ -528,7 +528,11 @@ class TestProfile(object):
-                 else:
-                     opts[n] = self.test_list[n]
-         else:
--            opts = self.test_list  # pylint: disable=redefined-variable-type
-+            opts = collections.OrderedDict()
-+            test_keys = list(self.test_list.keys())
-+            test_keys.sort()
-+            for k in test_keys:
-+                opts[k] = self.test_list[k]
- 
-         for k, v in self.filters.run(opts.items()):
-             yield k, v
diff --git a/meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch b/meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch
deleted file mode 100644
index cb675e8d99..0000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 1b23539aece156f6fe0789cb988f22e5915228f6 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 10 Nov 2020 17:12:32 +0000
-Subject: [PATCH 1/2] generated_tests/gen_tcs/tes_input_tests.py: do not
- hardcode the full binary path
-
-This helps reproducibility.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/610]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- generated_tests/gen_tcs_input_tests.py | 2 +-
- generated_tests/gen_tes_input_tests.py | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/generated_tests/gen_tcs_input_tests.py b/generated_tests/gen_tcs_input_tests.py
-index face4f19a..e36671af4 100644
---- a/generated_tests/gen_tcs_input_tests.py
-+++ b/generated_tests/gen_tcs_input_tests.py
-@@ -272,7 +272,7 @@ class Test(object):
-             relative probe rgb (0.75, 0.75) (0.0, 1.0, 0.0)
-             """)
- 
--        test = test.format(self=self, generator_command=" ".join(sys.argv))
-+        test = test.format(self=self, generator_command="generated_tests/gen_tcs_input_tests.py")
- 
-         filename = self.filename()
-         dirname = os.path.dirname(filename)
-diff --git a/generated_tests/gen_tes_input_tests.py b/generated_tests/gen_tes_input_tests.py
-index 3d847b5cc..954840b20 100644
---- a/generated_tests/gen_tes_input_tests.py
-+++ b/generated_tests/gen_tes_input_tests.py
-@@ -301,7 +301,7 @@ class Test(object):
-             relative probe rgb (0.75, 0.75) (0.0, 1.0, 0.0)
-             """)
- 
--        test = test.format(self=self, generator_command=" ".join(sys.argv))
-+        test = test.format(self=self, generator_command="generated_tests/gen_tes_input_tests.py")
- 
-         filename = self.filename()
-         dirname = os.path.dirname(filename)
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch b/meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch
deleted file mode 100644
index a1db2987ac..0000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 1919bb7f4072d73dcbb64d0e06eff5b04529c3db Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 16 Nov 2020 18:01:02 +0000
-Subject: [PATCH] serializer.py: make .gz files reproducible
-
-.gz format contains mtime of the compressed data, and
-SOURCE_DATE_EPOCH is the standard way to make it reproducuble.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/610]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tests/serializer.py | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/tests/serializer.py b/tests/serializer.py
-index bd14bc3db..bc5b45d7f 100644
---- a/tests/serializer.py
-+++ b/tests/serializer.py
-@@ -138,7 +138,10 @@ def serializer(name, profile, outfile):
-                 et.SubElement(env, 'env', name=k, value=v)
- 
-     tree = et.ElementTree(root)
--    with gzip.open(outfile, 'wb') as f:
-+    reproducible_mtime = None
-+    if 'SOURCE_DATE_EPOCH' in os.environ:
-+        reproducible_mtime=os.environ['SOURCE_DATE_EPOCH']
-+    with gzip.GzipFile(outfile, 'wb', mtime=reproducible_mtime) as f:
-         tree.write(f, encoding='utf-8', xml_declaration=True)
- 
- 
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch
deleted file mode 100644
index dee876bcbe..0000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 5bf89c6a314952313b2b762fff0d5501fe57ac53 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 2 Dec 2020 21:21:52 +0000
-Subject: [PATCH] tests/shader.py: sort the file list before working on it
-
-This allows later xml output to be reproducible.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/610]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tests/shader.py | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/tests/shader.py b/tests/shader.py
-index 849273660..e6e65d1ba 100644
---- a/tests/shader.py
-+++ b/tests/shader.py
-@@ -52,7 +52,9 @@ for basedir in [TESTS_DIR, GENERATED_TESTS_DIR]:
- for group, files in shader_tests.items():
-     assert group not in profile.test_list, 'duplicate group: {}'.format(group)
- 
--    # We'll end up with a list of tuples, split that into two lists
-+    # This makes the xml output reproducible, as os.walk() order is random
-+    files.sort()
-+    # We'll end up with a list of tuples, split that into two list
-     files, installedfiles = list(zip(*files))
-     files = list(files)
-     installedfiles = list(installedfiles)
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 08bbbac05a..807b2a2819 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -10,15 +10,11 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
            file://0001-Add-a-missing-include-for-htobe32-definition.patch \
-           file://0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch \
            file://0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
-           file://0001-serializer.py-make-.gz-files-reproducible.patch \
-           file://0001-framework-profile.py-make-test-lists-reproducible.patch \
-           file://0001-tests-shader.py-sort-the-file-list-before-working-on.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "11ee10ba04a95d4b36ef844420f0a5838002b5a8"
+SRCREV = "f328af2ddd0d1bab0f3d149373a36657b252b337"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.20.1


