Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206A11067056
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 15:38:53 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24658.1773329931843881812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 08:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WPi7J1In;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852f73d0a3so10914255e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773329930; x=1773934730; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnHu1dogLqpbSXYIDWE5Sv/OgVTOq5twkElAyshUXjc=;
        b=WPi7J1In7jJEl4QPR/Ypcc2mh+YrOT1tcJjs69ac413xGAkaJIEvOM4dtvi45PcecZ
         GiN/8yRV3hZrpR707VzpyO+pSqE1kWynBQSHw1OGu0oHMxvmYTz/lofb0yvh7JkNjExU
         CBkkm/smi6WvGhi+yPFcrDqTAWi0nyPBG+TZaH/zXho+Xr8t8M+gTr7w59Gwqj1jUZ9Z
         K1aJSGedIrronSj2jaiSY7YCFb2Zj3rthfSIG+L4hUgXSwsecBwknxzoMOUg5aCtd3kp
         Vkvvn/y0z4mBo+5N0pbEu9EIDF4IGL5parPfDGOaJP++jvz1t285V1qV89dKMvEbiRvM
         kvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773329930; x=1773934730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LnHu1dogLqpbSXYIDWE5Sv/OgVTOq5twkElAyshUXjc=;
        b=vqAgskM7YTMx2D78aAjgVB9Gssf/I9uU7dnCR2xU/aC1lT8CCviKSsT1uj2E+mtA6J
         dE/uVod7gAxy5r8h1crEAptKLpo8pyvXm8keuokeVkpeZzS8+I4W3xKnsFa/922LNJFn
         HERKz6b+Q4a99ym8pPDsbvs/rN+snuDOMmasHJnTfJVD+Nc2XVqKqWsE0BNX6w2C0JwJ
         hciVJ242u0Wtvs5pUNl0bflAUyDczpzVlVs+OfbHq1MDl4NnXxh6XW4JRKkz/dUudiYb
         rFLNUMjPN5u0HcRYgHUrco9l6/atx33S9cOcMbza0EMoHCwQK7VYVkVBnpykzm7F4iIG
         yBxg==
X-Gm-Message-State: AOJu0YwASPJqLjlUwyvjlbMbRLw25NupmbA12wFCFN02sghkazc+gmjb
	nV5HIchpn72441U+O1QVXhaRKi0skP8cAb2SbnY5ZqYcZEGvKO8+Uf9bWhFEtA==
X-Gm-Gg: ATEYQzzF5PhVbAgY9TeKVwKtXPyDqi3ZKAakk3ZGDlKCM4T8BmxThbfGt062JSj5qN4
	foha5FYRv5UxHwpHLwhPYCc2a+Yy+Cz9wdl4AT4JEhgnmoiwYAm6pM+nJIASbm5+kUgN3gAShJ+
	hYOvk9pNJTiztJUEW64igkablu5K1LOZ3xV+rJic/JZpNJbcrw57iWvhgDie50+DDR48BWZTbnQ
	xHKVhe25FH1XoKDfQOZ/5qsFJAFLAAmnAFKNtZsCHaE0i6eY/T7TR5jWGnc4cmXvnjL3ZDvU7AW
	PC2rUR/sij0ZYE+JB5x7CSEfNc9rsN6Ip6FW3IwXFmMFLb3QBtmPz6toLp6NSC8jlkRMOVvfDCx
	+SI9nBfS7F7sVkAnWFQswsyGnm5HJQTt9590GxiSCL7loJ5HRMoHJXuMYUeIfBrM/0QjwrHWimT
	7ua5RG6YOkE3dT4/K8Ya1szC/BvwogmaCCe+AlIAp1Hscjbw==
X-Received: by 2002:a05:600c:1f10:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-4854b0ae55amr127051135e9.6.1773329929670;
        Thu, 12 Mar 2026 08:38:49 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0dcf2asm74857385e9.8.2026.03.12.08.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:38:48 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [OE-core][PATCH v9 1/7] spdx30: Add configurable file exclusion pattern support
Date: Thu, 12 Mar 2026 16:38:39 +0100
Message-ID: <20260312153845.164369-2-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312153845.164369-1-stondo@gmail.com>
References: <20260309132854.128375-1-stondo@gmail.com>
 <20260312153845.164369-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 15:38:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232974

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add SPDX_FILE_EXCLUDE_PATTERNS variable that allows filtering files from
SPDX output by regex matching. The variable accepts a space-separated
list of Python regular expressions; files whose paths match any pattern
(via re.search) are excluded.

When empty (the default), no filtering is applied and all files are
included, preserving existing behavior.

This enables users to reduce SBOM size by excluding files that are not
relevant for compliance (e.g., test files, object files, patches).

Excluded files are tracked in a set returned from add_package_files()
and passed to get_package_sources_from_debug(), which uses the set for
precise cross-checking rather than re-evaluating patterns.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/spdx-common.bbclass |  7 ++++++
 meta/lib/oe/spdx30_tasks.py      | 38 +++++++++++++++++++++++++-------
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 3110230c9e..5cba52eedc 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -54,6 +54,13 @@ SPDX_CONCLUDED_LICENSE[doc] = "The license concluded by manual or external \
 
 SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
 
+SPDX_FILE_EXCLUDE_PATTERNS ??= ""
+SPDX_FILE_EXCLUDE_PATTERNS[doc] = "Space-separated list of Python regular \
+    expressions to exclude files from SPDX output. Files whose paths match \
+    any pattern (via re.search) will be filtered out. Defaults to empty \
+    (no filtering). Example: \
+    SPDX_FILE_EXCLUDE_PATTERNS = '\\.patch$ \\.diff$ /test/ \\.pyc$ \\.o$'"
+
 python () {
     from oe.cve_check import extend_cve_status
     extend_cve_status(d)
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 99f2892dfb..bc02b319c8 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -13,6 +13,7 @@ import oe.spdx30
 import oe.spdx_common
 import oe.sdk
 import os
+import re
 
 from contextlib import contextmanager
 from datetime import datetime, timezone
@@ -154,13 +155,17 @@ def add_package_files(
     file_counter = 1
     if not os.path.exists(topdir):
         bb.note(f"Skip {topdir}")
-        return spdx_files
+        return spdx_files, set()
 
     check_compiled_sources = d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") == "1"
     if check_compiled_sources:
         compiled_sources, types = oe.spdx_common.get_compiled_sources(d)
         bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
 
+    # File exclusion filtering
+    exclude_patterns = [re.compile(p) for p in (d.getVar("SPDX_FILE_EXCLUDE_PATTERNS") or "").split()]
+    excluded_files = set()
+
     for subdir, dirs, files in os.walk(topdir, onerror=walk_error):
         dirs[:] = [d for d in dirs if d not in ignore_dirs]
         if subdir == str(topdir):
@@ -174,6 +179,13 @@ def add_package_files(
                 continue
 
             filename = str(filepath.relative_to(topdir))
+
+            # Apply file exclusion filtering
+            if exclude_patterns:
+                if any(p.search(filename) for p in exclude_patterns):
+                    excluded_files.add(filename)
+                    continue
+
             file_purposes = get_purposes(filepath)
 
             # Check if file is compiled
@@ -213,12 +225,15 @@ def add_package_files(
 
     bb.debug(1, "Added %d files to %s" % (len(spdx_files), objset.doc._id))
 
-    return spdx_files
+    return spdx_files, excluded_files
 
 
 def get_package_sources_from_debug(
-    d, package, package_files, sources, source_hash_cache
+    d, package, package_files, sources, source_hash_cache, excluded_files=None
 ):
+    if excluded_files is None:
+        excluded_files = set()
+
     def file_path_match(file_path, pkg_file):
         if file_path.lstrip("/") == pkg_file.name.lstrip("/"):
             return True
@@ -251,6 +266,12 @@ def get_package_sources_from_debug(
             continue
 
         if not any(file_path_match(file_path, pkg_file) for pkg_file in package_files):
+            if file_path.lstrip("/") in excluded_files:
+                bb.debug(
+                    1,
+                    f"Skipping debug source lookup for excluded file {file_path} in {package}",
+                )
+                continue
             bb.fatal(
                 "No package file found for %s in %s; SPDX found: %s"
                 % (str(file_path), package, " ".join(p.name for p in package_files))
@@ -559,7 +580,7 @@ def create_spdx(d):
         bb.debug(1, "Adding source files to SPDX")
         oe.spdx_common.get_patched_src(d)
 
-        files = add_package_files(
+        files, _ = add_package_files(
             d,
             build_objset,
             spdx_workdir,
@@ -775,7 +796,7 @@ def create_spdx(d):
                 )
 
             bb.debug(1, "Adding package files to SPDX for package %s" % pkg_name)
-            package_files = add_package_files(
+            package_files, excluded_files = add_package_files(
                 d,
                 pkg_objset,
                 pkgdest / package,
@@ -798,7 +819,8 @@ def create_spdx(d):
 
             if include_sources:
                 debug_sources = get_package_sources_from_debug(
-                    d, package, package_files, dep_sources, source_hash_cache
+                    d, package, package_files, dep_sources, source_hash_cache,
+                    excluded_files=excluded_files,
                 )
                 debug_source_ids |= set(
                     oe.sbom30.get_element_link_id(d) for d in debug_sources
@@ -810,7 +832,7 @@ def create_spdx(d):
 
     if include_sources:
         bb.debug(1, "Adding sysroot files to SPDX")
-        sysroot_files = add_package_files(
+        sysroot_files, _ = add_package_files(
             d,
             build_objset,
             d.expand("${COMPONENTS_DIR}/${PACKAGE_ARCH}/${PN}"),
@@ -1196,7 +1218,7 @@ def create_image_spdx(d):
             image_filename = image["filename"]
             image_path = image_deploy_dir / image_filename
             if os.path.isdir(image_path):
-                a = add_package_files(
+                a, _ = add_package_files(
                         d,
                         objset,
                         image_path,
-- 
2.53.0


