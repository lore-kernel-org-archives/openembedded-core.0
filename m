Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8393C3ABCB
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 14:44:05 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.52015.1747061035713594857
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 07:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=uFQI9chH;
 spf=pass (domain: baylibre.com, ip: 209.85.160.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-476b89782c3so51367871cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 07:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747061034; x=1747665834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5MlW3n3xcyq3XtHi2JfDflEU0qEKFZEAzvbilgaS9CM=;
        b=uFQI9chHUNMIlqiaJhVmUyMG1G+fR0lAITHSOx9BzI+puGYFo/wgOai4cF4AHB2Tdo
         jCs/6HOebGoyHp3+IYRt7d19+pBs0KS3NAlkHo52KbzqEG4Xk7NZfusahKRUpDgnrPVK
         jSJEBje7EupFT/G1LIiWOWJp7x8zFV6pPNOfXOPslGzZM/RStayy1ZpNzr3fg1dQ8lMH
         0Ahd4YY+rVHBYvfDFh3A36B+me1+8YcAmkTHFWXvk0d2A2NmBICi34TBLQCelaVerCTa
         OAf3zZxMNYmrPCFLqV+VX4Ubhycs+A/V/ZjH/56GF8TqRiH2EPkGoTje0de7WieIRIya
         E1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061034; x=1747665834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5MlW3n3xcyq3XtHi2JfDflEU0qEKFZEAzvbilgaS9CM=;
        b=lyYOEMCGFsWfJ+ZYOUr5pi3UBezhLeOboPWrKf9gpalcc4lrkR+Had2ImTVv0hAqXv
         p+z3CYZYXTbk1MfH+JuW0DMXiez2VppsE30aKy3KZCHU3Lr10y6Z56Glr3D361iqvsk1
         4ZFCGNh1QJoRyTwTg/tVOZh51mHQ6kodRIhoMxIS73DR9aP6X3fghXpzKAeQJgQpXp6/
         B03bu9i8SNImR08dvgTJjrEjiOeLZTMhV6rRSMB7Is6Lqi9nMIJzRHIVuGTI/fBbqeYq
         aDvjnGqrkL4ZysuvbdK2fIWBnsx6dwkQo6dNdjJGClghY3FBWgIxrIi0ol09fwoK/BCQ
         SRmw==
X-Gm-Message-State: AOJu0Ywtw49yXLU9Nuz+S/zNB0lnEpprPZlyAINkCU3Bm5Xaabfg8oSb
	ifxT3JNqBwKMvE8l0UIxZCi3csWUcuh/Z99PJgq0ifMA+eJAF+rG90fWoEfEiGRbjL134XHBuFZ
	c7cs=
X-Gm-Gg: ASbGncuL3jfM13BmlqIgarovWUyHS1bildBclF7Y/p8OgtHfSO9UnxbSJgrPPnRlMqI
	9cqv7z/ojTcHh3DovTpbY4iXqUXS2m5C7CP6NrDyOHQ7VyGi5SwQratZfbXxiF2mPTItIrdbSXj
	sxyqsQF+SreQt4TVeRkxX+iKefCJpsubaaoRporag/86TqWIa5j42Kp15gvWXfB58wctEIpaXHQ
	nWMziJXMGiOtfN8w4WcqAunIhjf2+BtNhL6UuRLDc+8W98TlxfKBjHKIUqdBUVrKSXLoxA8P05v
	8JfRFlt2z6vEWJlc5BODouOrppM4lPbMjdaSu8GGM7nc3PYWg/mv1CRkEuFE3LQ7sDBbM8mnDnH
	lMLwI2TH1PvAs8VADvm2YkA==
X-Google-Smtp-Source: AGHT+IGWCXQb7mNAQEb7/qsg0Q/EHATVyhH3nM1sOCRFWSdxesBzMEskw5BWO+eYGog65TMeXXj4lg==
X-Received: by 2002:ac8:7f55:0:b0:48e:170c:cc63 with SMTP id d75a77b69052e-4945273ae03mr204342571cf.18.1747061033669;
        Mon, 12 May 2025 07:43:53 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4945246b483sm51457521cf.11.2025.05.12.07.43.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:43:53 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-cython: upgrade 3.0.12 -> 3.1.0
Date: Mon, 12 May 2025 10:43:51 -0400
Message-Id: <20250512144351.1143277-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 14:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216371

Many changes are included with this release, including support for
freethreading builds of CPython 3.13, cleanup of legacy code, and many
other features and bug fixes.

Changelog: https://github.com/cython/cython/blob/master/CHANGES.rst

Patch '0001-Output-import-relative-paths-in-generated-C-code.-GH.patch'
is included in 3.1.0, so we no longer need the backport:

|tgamblin@megalith ~/workspace/git/pythonsrc/cython (master)$ git tag --contains 20bceea6b19ffc2f65b9fba2e4f737f09e5a2b20
|3.1.0
|3.1.0-1
|3.1.0a1
|3.1.0b1
|3.1.0rc1
|3.1.0rc2

Reproducibility looks OK.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...lative-paths-in-generated-C-code.-GH.patch | 73 -------------------
 ...thon_3.0.12.bb => python3-cython_3.1.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 75 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-cython/0001-Output-import-relative-paths-in-generated-C-code.-GH.patch
 rename meta/recipes-devtools/python/{python3-cython_3.0.12.bb => python3-cython_3.1.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-Output-import-relative-paths-in-generated-C-code.-GH.patch b/meta/recipes-devtools/python/python3-cython/0001-Output-import-relative-paths-in-generated-C-code.-GH.patch
deleted file mode 100644
index bbafc294163..00000000000
--- a/meta/recipes-devtools/python/python3-cython/0001-Output-import-relative-paths-in-generated-C-code.-GH.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 9b5f3b09f76899eba510c2d8f3ed2b0f752a4d1b Mon Sep 17 00:00:00 2001
-From: Oscar Benjamin <oscar.j.benjamin@gmail.com>
-Date: Sat, 24 Aug 2024 08:30:31 +0100
-Subject: [PATCH] Output import-relative paths in generated C code. (GH-6341)
-
-When cython is run on a file that is not in the current working directory,
-it outputs filepaths that are either absolute or are basenames.
-It is not good to output absolute paths in the generated C code and
-basenames mess up coverage measurement.
-
-Upstream-Status: Backport [20bceea6b19ffc2f65b9fba2e4f737f09e5a2b20]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- Cython/Compiler/ExprNodes.py  | 8 +++++++-
- Cython/Compiler/ModuleNode.py | 9 ++++++---
- 2 files changed, 13 insertions(+), 4 deletions(-)
-
-diff --git a/Cython/Compiler/ExprNodes.py b/Cython/Compiler/ExprNodes.py
-index a6bb1688e..0fbb15368 100644
---- a/Cython/Compiler/ExprNodes.py
-+++ b/Cython/Compiler/ExprNodes.py
-@@ -21,6 +21,7 @@ import re
- import sys
- import copy
- import os.path
-+import pathlib
- import operator
- 
- from .Errors import (
-@@ -10072,7 +10073,12 @@ class CodeObjectNode(ExprNode):
-         func_name = code.get_py_string_const(
-             func.name, identifier=True, is_str=False, unicode_value=func.name)
-         # FIXME: better way to get the module file path at module init time? Encoding to use?
--        file_path = StringEncoding.bytes_literal(func.pos[0].get_filenametable_entry().encode('utf8'), 'utf8')
-+        file_path = func.pos[0].get_filenametable_entry()
-+        if os.path.isabs(file_path):
-+            file_path = func.pos[0].get_description()
-+        # Always use / as separator
-+        file_path = pathlib.Path(file_path).as_posix()
-+        file_path = StringEncoding.bytes_literal(file_path.encode('utf-8'), 'utf8')
-         file_path_const = code.get_py_string_const(file_path, identifier=False, is_str=True)
- 
-         # This combination makes CPython create a new dict for "frame.f_locals" (see GH #1836).
-diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.py
-index 43c6b5f07..8c29d6db7 100644
---- a/Cython/Compiler/ModuleNode.py
-+++ b/Cython/Compiler/ModuleNode.py
-@@ -13,6 +13,7 @@ from collections import defaultdict
- import json
- import operator
- import os
-+import pathlib
- import re
- import sys
- 
-@@ -944,9 +945,11 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
-             for source_desc in code.globalstate.filename_list:
-                 file_path = source_desc.get_filenametable_entry()
-                 if isabs(file_path):
--                    file_path = basename(file_path)  # never include absolute paths
--                escaped_filename = file_path.replace("\\", "\\\\").replace('"', r'\"')
--                escaped_filename = as_encoded_filename(escaped_filename)
-+                    # never include absolute paths
-+                    file_path = source_desc.get_description()
-+                # Always use / as separator
-+                file_path = pathlib.Path(file_path).as_posix()
-+                escaped_filename = as_encoded_filename(file_path)
-                 code.putln('%s,' % escaped_filename.as_c_string_literal())
-         else:
-             # Some C compilers don't like an empty array
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/python/python3-cython_3.0.12.bb b/meta/recipes-devtools/python/python3-cython_3.1.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-cython_3.0.12.bb
rename to meta/recipes-devtools/python/python3-cython_3.1.0.bb
index f1951e3ae67..f93135b94bc 100644
--- a/meta/recipes-devtools/python/python3-cython_3.0.12.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.1.0.bb
@@ -7,8 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI += "file://0001-Output-import-relative-paths-in-generated-C-code.-GH.patch"
-SRC_URI[sha256sum] = "b988bb297ce76c671e28c97d017b95411010f7c77fa6623dd0bb47eed1aee1bc"
+SRC_URI[sha256sum] = "1097dd60d43ad0fff614a57524bfd531b35c13a907d13bee2cc2ec152e6bf4a1"
 
 inherit pypi setuptools3 cython
 
-- 
2.39.5


