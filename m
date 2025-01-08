Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A50E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:49 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.14687.1736325765638898872
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ArB4Ugz8;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso2732483366b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325764; x=1736930564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBUCeohYynlPOKJA3nn/xKC6wKTeSKDk3z/fDLFLheo=;
        b=ArB4Ugz8dAf0nXWG+IwHM58O/2uJNbEfi0tGzn8jqbnx2rTldygi3uAe2aaoBIPdjT
         tRgrpo0PXLdZaIMPYR7gUsUW1O2pe20fWnFEoCQ9Gp9Xu0GsGJJsIuWWZyxlB50Zf6Xs
         NGXeJx/IOU49iOWXBV9g3+LEefIaMdKDD+/SzTWnMuwBO8liX/IBj2HOsPaPfxlkzHrG
         9Bn6R8Kr5xQVgQNlueMzkY0sDkNTXRbweFDGlIbXb1fHIzfHDdZTZkZ9O2xOiWGiykfS
         IUQq1T2WdTps0eiLXfw59fwCAKC27EUfw/JeOtmNmgVrlonHynRRpr1U4dhVLiKSG+JN
         IWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325764; x=1736930564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBUCeohYynlPOKJA3nn/xKC6wKTeSKDk3z/fDLFLheo=;
        b=AvIOYT4HpqFEbOI+MjnL1sfzgVFBkTw8PuPkplERwxp99tzBEd5k+5lxJHYBFhgEXJ
         rOvrAmy8/TVjMlaS2OtOx3FuiSUIZPPRXoYbdmOHSpKszNaqkvWgz3iLcX/gCOMQbXoR
         20De4VzNxFRAHcaudfEAJIgGH245+JGK/oMCZPj4AS/jU06/Uik5rJtI8pAEnWLKyKz/
         i0CRgFWNvH/QOiyhOmC3hLrDxIr95WkZ8Yt6cfoc9INnNPoiAB9e0eQja1Mmp/Kz1YAr
         bJ1cVsRS/TKe/T3JA++cerPz3Vj8JgEnJyuN1T9mSu7AMMCgqTVm8uGYrTtHoSsGIbA2
         0n/g==
X-Gm-Message-State: AOJu0YyBkvs+zVrAGHbTmIQacvmalVZbMkBD7ZovIgp90DbuBTTf+TLK
	ffaMPzSRKxMx7v3PhzfAYAcyf8j0WwbnFuTS1dHhAzXUB4MuB5XFo0ikaw==
X-Gm-Gg: ASbGncuU94j1Fn2KxydRYjer+co3TetSp62xpYkYEOLV/AGc/fev/z2sl2wFHfmkKgR
	bmCJp6mdPSWc2PJmOwddqBCkYd9gl1hH0ul9zV432LjMvDsb7AtMh7+C1ChcSFrrRMzBCQN1bX6
	I7m8Vg2Qw4u+or+P8Ba6laNdzPzhvlUdfki2WREdWD+IzutBbaiGhNSqjd9LYhJDA54ccqGIwfE
	i4d2EXG8vXb1AD1y4FLdXnTC5TcKrteRlbpE3b1Vzd/H8KST1geWWK8t4/P2fQoRpTxsMvX5cUa
	CBLWl/j39BeHIzSzVg==
X-Google-Smtp-Source: AGHT+IFKbhm7uNXds7BjhoSkoAQmD046lmLPWgfC2qWHzhrjoLfs35J/r/P7BKdQBACCqi2fuzQYYA==
X-Received: by 2002:a17:907:1b97:b0:ab2:b610:35fb with SMTP id a640c23a62f3a-ab2b6103692mr70511666b.3.1736325763777;
        Wed, 08 Jan 2025 00:42:43 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/20] python3-jinja2: upgrade 3.1.4 -> 3.1.5
Date: Wed,  8 Jan 2025 09:42:26 +0100
Message-Id: <20250108084226.117178-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108084226.117178-1-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209542

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-jinja2/fix-3.13.patch      | 87 -------------------
 .../python/python3-jinja2/run-ptest           |  3 +-
 ...inja2_3.1.4.bb => python3-jinja2_3.1.5.bb} |  7 +-
 3 files changed, 4 insertions(+), 93 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.4.bb => python3-jinja2_3.1.5.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch b/meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch
deleted file mode 100644
index 34ecd15176c..00000000000
--- a/meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From cf6ba7732b49ab4637aa747186cf1d1572688584 Mon Sep 17 00:00:00 2001
-From: Thomas Grainger <tagrain@gmail.com>
-Date: Mon, 13 May 2024 18:02:35 +0100
-Subject: [PATCH] fix test_package_zip_list on 3.13
-
-Upstream-Status: Backport [https://github.com/pallets/jinja/pull/1979]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/jinja2/loaders.py | 32 ++++++++++++++++++++++++++------
- tests/test_loader.py  |  4 ++--
- 2 files changed, 28 insertions(+), 8 deletions(-)
-
-diff --git a/src/jinja2/loaders.py b/src/jinja2/loaders.py
-index 9eaf647..8c2c86c 100644
---- a/src/jinja2/loaders.py
-+++ b/src/jinja2/loaders.py
-@@ -238,6 +238,30 @@ class FileSystemLoader(BaseLoader):
-         return sorted(found)
- 
- 
-+if sys.version_info >= (3, 13):
-+
-+    def _get_zipimporter_files(z: t.Any) -> t.Dict[str, object]:
-+        try:
-+            get_files = z._get_files
-+        except AttributeError as e:
-+            raise TypeError(
-+                "This zip import does not have the required"
-+                " metadata to list templates."
-+            ) from e
-+        return get_files()
-+else:
-+
-+    def _get_zipimporter_files(z: t.Any) -> t.Dict[str, object]:
-+        try:
-+            files = z._files
-+        except AttributeError as e:
-+            raise TypeError(
-+                "This zip import does not have the required"
-+                " metadata to list templates."
-+            ) from e
-+        return files  # type: ignore[no-any-return]
-+
-+
- class PackageLoader(BaseLoader):
-     """Load templates from a directory in a Python package.
- 
-@@ -382,11 +406,7 @@ class PackageLoader(BaseLoader):
-                     for name in filenames
-                 )
-         else:
--            if not hasattr(self._loader, "_files"):
--                raise TypeError(
--                    "This zip import does not have the required"
--                    " metadata to list templates."
--                )
-+            files = _get_zipimporter_files(self._loader)
- 
-             # Package is a zip file.
-             prefix = (
-@@ -395,7 +415,7 @@ class PackageLoader(BaseLoader):
-             )
-             offset = len(prefix)
- 
--            for name in self._loader._files.keys():
-+            for name in files:
-                 # Find names under the templates directory that aren't directories.
-                 if name.startswith(prefix) and name[-1] != os.path.sep:
-                     results.append(name[offset:].replace(os.path.sep, "/"))
-diff --git a/tests/test_loader.py b/tests/test_loader.py
-index 77d686e..e0683e4 100644
---- a/tests/test_loader.py
-+++ b/tests/test_loader.py
-@@ -364,8 +364,8 @@ def test_package_zip_source(package_zip_loader, template, expect):
- 
- 
- @pytest.mark.xfail(
--    platform.python_implementation() == "PyPy",
--    reason="PyPy's zipimporter doesn't have a '_files' attribute.",
-+    sys.implementation.name == "pypy",
-+    reason="zipimporter doesn't have a '_files' attribute",
-     raises=TypeError,
- )
- def test_package_zip_list(package_zip_loader):
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/python/python3-jinja2/run-ptest b/meta/recipes-devtools/python/python3-jinja2/run-ptest
index 8d2017d39ce..4c351af5e71 100644
--- a/meta/recipes-devtools/python/python3-jinja2/run-ptest
+++ b/meta/recipes-devtools/python/python3-jinja2/run-ptest
@@ -1,3 +1,4 @@
 #!/bin/sh
 
-pytest --automake
+# test_async items require trio module
+pytest --automake --ignore=./tests/test_async.py --ignore=./tests/test_async_filters.py
diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.5.bb
index fd0afc1cb14..e5212e7ffc0 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122a993f0ac800cb369"
+SRC_URI[sha256sum] = "8fefff8dc3034e27bb80d67c671eb8a9bc424c0ef4c0826edbff304cceff43bb"
 
 PYPI_PACKAGE = "jinja2"
 
@@ -14,10 +14,7 @@ CLEANBROKEN = "1"
 
 inherit pypi python_flit_core ptest
 
-SRC_URI += " \
-	file://run-ptest \
-	file://fix-3.13.patch \
-"
+SRC_URI += "file://run-ptest"
 
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
-- 
2.39.5


