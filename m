Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B15D2A55A
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:36:19 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.32601.1729107374052419812
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 12:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A1uhwCff;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d47eff9acso67905f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 12:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729107372; x=1729712172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBVt/Cgr+UkE72Zafmp+z4tYaGOTE2E9nRtXxbpKQKk=;
        b=A1uhwCffmFPnoyBHcISJEwpQdFnBNfssP4CjDn3ygfZp1cPmsSdKYV8j+btSAo5GCF
         5sleWhq1Y6bxo9aMfJuHI9bMLWQ7z2ap2TZOfA0oyh9/rT814r23pDqlWtiqNM8oTb6n
         r1N8BiGz84xuVIMOZm6WKQzT09ugM4+/wwxb9HHf0YmHk8IgeI5Iwx5gbC5P9RP/KJYa
         8Y+xgDbmWMudXIGtlunE07SLIayk2Ln2aHIFnmmeHSaa4TgHpwNsRJedfYMknvG/D9KJ
         bND1Kn7iJg2Y1+OgYCfnkTDlXJ8MSRDpioY1V8ZMmMTuSKu2iVZDwtvzb9QSLYS8g4Ue
         247w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107372; x=1729712172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBVt/Cgr+UkE72Zafmp+z4tYaGOTE2E9nRtXxbpKQKk=;
        b=jz3UdwgYF3bEvikQBnfBR6U/kxt1jHo78ah4fuAWPohNyZtx+4mjkAGJE5r4/C4tUI
         PUtu4Y/l80+kQ0LN4G81c4cBpcEHv8qx/6sHKE/eSddXQVnYvZ+2i1dBrgMaf8lx4gDX
         vJ44gvqIEb16MFIZ6RkZmpjOqoDOytQY6pVtls0AgGisxsAviJ+PBvr8BuylGE0mjzfG
         MYCqBfzU0unuTpIwsv5K5h2tErkFyKPXUHsMasrAimpybi98LQipRgLF+GNV/PWt9OUp
         REK1pP+6Siy6r5+/myY3cNqKWsQuEdw6a1aVpYwWRg8xzJcyKHFg+YOmK1T4pGoCiNnx
         Om8w==
X-Gm-Message-State: AOJu0YyvhRJVOhdFHgFrr1wiJU5BDK4Y1n1CLS32jHi+K5ZIyzPSurMG
	/oCfdu/W/TTilpp4TE8gAupNw6fn3Ft4nLdcKjxIzJs0MTbtHp805EFZRA==
X-Google-Smtp-Source: AGHT+IHeH+QQK3nwVsGKfoDa8nHKy3uUx/kWZPqkMC0vyJofUFvfd/rkUwrVum5WkeaBNuL+JQhS9A==
X-Received: by 2002:a5d:56c3:0:b0:37d:5113:cdff with SMTP id ffacd0b85a97d-37d5ff6ce21mr10736427f8f.37.1729107372288;
        Wed, 16 Oct 2024 12:36:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43158c359casm3159265e9.8.2024.10.16.12.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:36:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/5] python3-jinja2: backport a patch to address python 3.13 ptest fails
Date: Wed, 16 Oct 2024 21:36:05 +0200
Message-Id: <20241016193606.3459951-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016193606.3459951-1-alex.kanavin@gmail.com>
References: <20241016193606.3459951-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 19:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205975

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-jinja2/fix-3.13.patch      | 87 +++++++++++++++++++
 .../python/python3-jinja2_3.1.4.bb            |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch

diff --git a/meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch b/meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch
new file mode 100644
index 00000000000..34ecd15176c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch
@@ -0,0 +1,87 @@
+From cf6ba7732b49ab4637aa747186cf1d1572688584 Mon Sep 17 00:00:00 2001
+From: Thomas Grainger <tagrain@gmail.com>
+Date: Mon, 13 May 2024 18:02:35 +0100
+Subject: [PATCH] fix test_package_zip_list on 3.13
+
+Upstream-Status: Backport [https://github.com/pallets/jinja/pull/1979]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/jinja2/loaders.py | 32 ++++++++++++++++++++++++++------
+ tests/test_loader.py  |  4 ++--
+ 2 files changed, 28 insertions(+), 8 deletions(-)
+
+diff --git a/src/jinja2/loaders.py b/src/jinja2/loaders.py
+index 9eaf647..8c2c86c 100644
+--- a/src/jinja2/loaders.py
++++ b/src/jinja2/loaders.py
+@@ -238,6 +238,30 @@ class FileSystemLoader(BaseLoader):
+         return sorted(found)
+ 
+ 
++if sys.version_info >= (3, 13):
++
++    def _get_zipimporter_files(z: t.Any) -> t.Dict[str, object]:
++        try:
++            get_files = z._get_files
++        except AttributeError as e:
++            raise TypeError(
++                "This zip import does not have the required"
++                " metadata to list templates."
++            ) from e
++        return get_files()
++else:
++
++    def _get_zipimporter_files(z: t.Any) -> t.Dict[str, object]:
++        try:
++            files = z._files
++        except AttributeError as e:
++            raise TypeError(
++                "This zip import does not have the required"
++                " metadata to list templates."
++            ) from e
++        return files  # type: ignore[no-any-return]
++
++
+ class PackageLoader(BaseLoader):
+     """Load templates from a directory in a Python package.
+ 
+@@ -382,11 +406,7 @@ class PackageLoader(BaseLoader):
+                     for name in filenames
+                 )
+         else:
+-            if not hasattr(self._loader, "_files"):
+-                raise TypeError(
+-                    "This zip import does not have the required"
+-                    " metadata to list templates."
+-                )
++            files = _get_zipimporter_files(self._loader)
+ 
+             # Package is a zip file.
+             prefix = (
+@@ -395,7 +415,7 @@ class PackageLoader(BaseLoader):
+             )
+             offset = len(prefix)
+ 
+-            for name in self._loader._files.keys():
++            for name in files:
+                 # Find names under the templates directory that aren't directories.
+                 if name.startswith(prefix) and name[-1] != os.path.sep:
+                     results.append(name[offset:].replace(os.path.sep, "/"))
+diff --git a/tests/test_loader.py b/tests/test_loader.py
+index 77d686e..e0683e4 100644
+--- a/tests/test_loader.py
++++ b/tests/test_loader.py
+@@ -364,8 +364,8 @@ def test_package_zip_source(package_zip_loader, template, expect):
+ 
+ 
+ @pytest.mark.xfail(
+-    platform.python_implementation() == "PyPy",
+-    reason="PyPy's zipimporter doesn't have a '_files' attribute.",
++    sys.implementation.name == "pypy",
++    reason="zipimporter doesn't have a '_files' attribute",
+     raises=TypeError,
+ )
+ def test_package_zip_list(package_zip_loader):
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
index f2de1983ced..a11878496c6 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
@@ -17,6 +17,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "Jinja2"
 
 SRC_URI += " \
 	file://run-ptest \
+	file://fix-3.13.patch \
 "
 
 do_install_ptest() {
-- 
2.39.5


