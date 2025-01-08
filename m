Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB655E7719A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 16:49:32 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.24578.1736354965196728237
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 08:49:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iDo9+gFm;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-386329da1d9so8036767f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736354963; x=1736959763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5Zg9v5iAvtyfTGqp4HBkpjyGnfMuZ9z0UIUKrrbQxI=;
        b=iDo9+gFmoe/FWcpw/db8Sj23HUSGh7fYNAg7DI6W1pe2KmsuQtSmFajadnfVtycF2W
         A31CHPTYdmxdsiwx+4JES6mqzqqIPhATqHSVgq8kV/texSu7SoVZdmmdl/CMCK3Jp0oW
         +Ui3zOi/CaIce2MAgACmIL0Me+ECWYJb8VMi6YTwMAG1pOIv7V7TJkSKUn9YGU6WQU8f
         EWyA0k22/luvs5iGytcv4cZyIUN+ioa2KN6yCbXC2fLnXUafxvtniYqc7G+BOla9taDs
         7ldn/Oo3bqfekY7xovQwdBX8tOGUajMmJ+7JPssTE/BvA9QP7zrXyMzO4wFrG9RB+q7a
         o5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736354963; x=1736959763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5Zg9v5iAvtyfTGqp4HBkpjyGnfMuZ9z0UIUKrrbQxI=;
        b=vk3uzNF/rq3/J1R0RZfwjKgi/BDl7YhqpkXyDCY5neRmOErC184h6R/on1OVujEQN8
         CgUEBIWL5Z41Eij91GfNqVWq6KUyW70ltzmOlIBY3qKgMm4OOYCpV9pitgyPO9IM9fhh
         tZoJzhMWGdVcCnd3ORO1zgaAEw7MfsdnbTf5ZNFeyhp/BCSYpr1yOV0l3i7zR2SWPGLi
         rMkOSFt797UDNtY9f3BPsRXMwbkLLNUVYyZstrgmIJ39F4r8NM2KTTdjHz9JW1rdp0eR
         v3qCtfXqdzVjwHwnrOrpBmgI8RYLYW9kraUbnvxlC/fh4mWltl5gxnKrn6NkjU9uQFyW
         aq2Q==
X-Gm-Message-State: AOJu0YxUV88w22DHIdhPvwC6CUTPxUbi3lDlNUhzw+Cd3Oi3VZwF6tBu
	eVzFCrFicSg1ATJQiLISbtrlVU6EL05Bs3TStuHDvt1B6BeNHzqy15C4Bg==
X-Gm-Gg: ASbGnctoQghgdMShTYlcut1AJc6F8sX+QAZ2RHjKk0Rt1Mze//JGYYP3Z0hwEoo/CLt
	p1XjGRLO9+kx5WKsuaTm/RtFbjlcHb09txzNnnSLo+v6zmqKgyxGGS0PDSWLS0HVu53LAH544Aj
	tegi5ttU3ONVUHQ0TH1LgD6q1g6CeNPxW7paR4d0RMGSUQQFcsZS8dJTeBWqaUVSGcOZGO+lHwi
	yxB57U+BSr9XWjpprJ0VQSxWzwJlhYb7rkndJI8r9Nxha+h5TD0LRrPRndvxzNx6uCoa7Ai925d
	9UN2GjpCN2ENppffSQ==
X-Google-Smtp-Source: AGHT+IGIsIm66dGGUIx6Hcq4+N+uWrhBO9o+soBcWymRhxudPTYk5yy1oWcisI2QedI17CwLpGp/gw==
X-Received: by 2002:a05:6000:1fa1:b0:388:caf4:e909 with SMTP id ffacd0b85a97d-38a872e8bc4mr3134604f8f.25.1736354963285;
        Wed, 08 Jan 2025 08:49:23 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2dc12dasm26649075e9.10.2025.01.08.08.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:49:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 2/2] python3-jinja2: upgrade 3.1.4 -> 3.1.5
Date: Wed,  8 Jan 2025 17:49:16 +0100
Message-Id: <20250108164916.2671907-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108164916.2671907-1-alex.kanavin@gmail.com>
References: <20250108164916.2671907-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 16:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209583

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-jinja2/fix-3.13.patch      | 87 -------------------
 ...inja2_3.1.4.bb => python3-jinja2_3.1.5.bb} |  9 +-
 2 files changed, 5 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.4.bb => python3-jinja2_3.1.5.bb} (74%)

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
diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.5.bb
index 84c40796c63..b9ef57f5991 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122a993f0ac800cb369"
+SRC_URI[sha256sum] = "8fefff8dc3034e27bb80d67c671eb8a9bc424c0ef4c0826edbff304cceff43bb"
 
 PYPI_PACKAGE = "jinja2"
 
@@ -14,9 +14,10 @@ CLEANBROKEN = "1"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-SRC_URI += " \
-	file://fix-3.13.patch \
-"
+do_install_ptest:append() {
+    # test_async items require trio module
+    rm -f ${D}${PTEST_PATH}/tests/test_async.py ${D}${PTEST_PATH}/tests/test_async_filters.py
+}
 
 RDEPENDS:${PN}-ptest += " \
     python3-unixadmin \
-- 
2.39.5


