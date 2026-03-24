Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8E2F54AB8
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 13:30:17 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19485.1774359013493423746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 06:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EwOjgUs6;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso45449375e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 06:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774359011; x=1774963811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiV4/un9QN6UMofI9DjH4M2mmIjT0G0QJ08PrF9lFoU=;
        b=EwOjgUs6CEZBVgjY/vFYbHIaxKZp/ZHliGv1zlGFfhJW4I70uoN+56m3b1ZR6lwDp6
         ZHVHLdyf7FFjGCTMXAh90GTcqxWdwqFNU+Twz96sB9Y7EtVRXyP3kpPuw/p7ahMd0jDE
         11uTb3PhHYbZ8cfg4IoNGFCT4dtwATaOmVaSEYF+qHqH2m1TAj4xjNQG6/oHp6UuLjiO
         mwWBLAMSBFs3aQnKzvy/HYWv4CV0JYVj5XPoAkbU42kHCbyTTC2cGRSI+g1FB2roU1Du
         PO+3s4Ra/jCTwBm5aT/g7F8GrUUy77FQqBWtdA6NXkivMe/TSSsYKDY2orl9R+sXSZSN
         tqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359011; x=1774963811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SiV4/un9QN6UMofI9DjH4M2mmIjT0G0QJ08PrF9lFoU=;
        b=cBYtB1NFqbU08TTgEa92+gb5uGvH7NTxy12822GkIqYL5KfvyLZ879ANPHWoEt1WR5
         /TKgFuAhE6hPc+TfTmqZceHR9RbvEYZf7v0bYQ0NhW9uKMt6tHu+oHj4CA6fddKwQR8T
         8XXnyB/u9NdH5PlNG8hU7TC1eVnZ9nhTGPqb5qEoiySIBIuQI5JH3H+CtRLMYeIptqoh
         ImVvmxjvLOUmFzb/FWoOD96JWLLLkY0e62UafCCbc+1D2+Ozp1N11wO29CmZ+5ps6/FU
         wpJoHL9nqHuoUiEd9I9WY8xKOFXMHQcl8oc260QNf7efAuWIJeOLFz09XkcyoUfcXyfb
         PBTg==
X-Gm-Message-State: AOJu0YxlCh8Yj88jRjYwWaLYwl4BijQuNqIclEcSrHz49I3aAxm4/EOS
	qPFAZ6SiiH1Erdoj5Ro8oaBJiXM7FwrmnyI4fmJv84kweTVFY/YrRBhgvBXsd6fs
X-Gm-Gg: ATEYQzxzd6EC/EnslWQTXOs+KZUForc/xfTveMM+BjIrFgrZmvq5Y+MkKBgzzQab2KE
	F4tgHDI38oBR1R9EhTAn7j69ZTqWJm5P8l6Df6DwJZIE6Hb5Pk5zXSZB+dZ8eMNTKLhwSH48uiO
	81grxMExvTjGh6Yh08lvdO+2+GNY1xgJr7s6VkTtlmXFuiH6XSLnsDshb/ZPQwIOmNBWqC/ksic
	Xh3zPkA+1uUmUkKllLCzcssUOtdQ1vfsz/HlGx9NgZjPOC4ZOiKNms8C3SWu0AUUXApLDNrlxOV
	9oToJYyMQZDXpdV1VMt4MgEKLJ0KGMDVt8BU0Gqk7s7ucjR08aIDls67rs5fAyT6ajaEwb2lIJj
	Tgm8a7wJNz2YxpbBimknQiJLr+4S75/Etrc9bEisP5UX/DLN7V4kKhzriTbr8xz6xRzQGFeoZ4R
	GdPBx5bOahFaKxa/YqnmT/TnGYK3bnDllvLsu9UNCCHZd9cdDHskJXhGCC2MjtwA1ouJI5KsLfz
	HA0HmZf
X-Received: by 2002:a05:600c:c083:b0:485:3f72:324d with SMTP id 5b1f17b1804b1-486fee0481amr175698435e9.14.1774359011097;
        Tue, 24 Mar 2026 06:30:11 -0700 (PDT)
Received: from fedora (mob-194-230-148-205.cgn.sunrise.net. [194.230.148.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48710fa0e35sm47494875e9.3.2026.03.24.06.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:30:10 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [OE-core][PATCH v14 1/4] spdx30: Add configurable file exclusion pattern support
Date: Tue, 24 Mar 2026 14:29:55 +0100
Message-ID: <20260324132958.2316491-2-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324132958.2316491-1-stondo@gmail.com>
References: <20260323210745.1337169-1-stefano.tondo.ext@siemens.com>
 <20260324132958.2316491-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 13:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233798

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
 meta/classes/spdx-common.bbclass |  7 +++
 meta/lib/oe/spdx30_tasks.py      | 80 +++++++++++++++++++++-----------
 2 files changed, 60 insertions(+), 27 deletions(-)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 83f05579b6..40701730a6 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -82,6 +82,13 @@ SPDX_MULTILIB_SSTATE_ARCHS[doc] = "The list of sstate architectures to consider
     when collecting SPDX dependencies. This includes multilib architectures when \
     multilib is enabled. Defaults to SSTATE_ARCHS."
 
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
index 353d783fa2..68ed821a8c 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -13,6 +13,7 @@ import oe.spdx30
 import oe.spdx_common
 import oe.sdk
 import os
+import re
 
 from contextlib import contextmanager
 from datetime import datetime, timezone
@@ -157,17 +158,27 @@ def add_package_files(
     file_counter = 1
     if not os.path.exists(topdir):
         bb.note(f"Skip {topdir}")
-        return spdx_files
+        return spdx_files, set()
 
     check_compiled_sources = d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") == "1"
     if check_compiled_sources:
         compiled_sources, types = oe.spdx_common.get_compiled_sources(d)
         bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
 
+    exclude_patterns = [
+        re.compile(pattern)
+        for pattern in (d.getVar("SPDX_FILE_EXCLUDE_PATTERNS") or "").split()
+    ]
+    excluded_files = set()
+
     for subdir, dirs, files in os.walk(topdir, onerror=walk_error):
-        dirs[:] = [d for d in dirs if d not in ignore_dirs]
+        dirs[:] = [directory for directory in dirs if directory not in ignore_dirs]
         if subdir == str(topdir):
-            dirs[:] = [d for d in dirs if d not in ignore_top_level_dirs]
+            dirs[:] = [
+                directory
+                for directory in dirs
+                if directory not in ignore_top_level_dirs
+            ]
 
         dirs.sort()
         files.sort()
@@ -177,14 +188,19 @@ def add_package_files(
                 continue
 
             filename = str(filepath.relative_to(topdir))
+
+            if exclude_patterns and any(
+                pattern.search(filename) for pattern in exclude_patterns
+            ):
+                excluded_files.add(filename)
+                continue
+
             file_purposes = get_purposes(filepath)
 
-            # Check if file is compiled
-            if check_compiled_sources:
-                if not oe.spdx_common.is_compiled_source(
-                    filename, compiled_sources, types
-                ):
-                    continue
+            if check_compiled_sources and not oe.spdx_common.is_compiled_source(
+                filename, compiled_sources, types
+            ):
+                continue
 
             spdx_file = objset.new_file(
                 get_spdxid(file_counter),
@@ -218,12 +234,15 @@ def add_package_files(
 
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
@@ -256,6 +275,12 @@ def get_package_sources_from_debug(
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
@@ -737,7 +762,7 @@ def create_spdx(d):
         bb.debug(1, "Adding source files to SPDX")
         oe.spdx_common.get_patched_src(d)
 
-        files = add_package_files(
+        files, _ = add_package_files(
             d,
             build_objset,
             spdx_workdir,
@@ -909,7 +934,7 @@ def create_spdx(d):
                 )
 
             bb.debug(1, "Adding package files to SPDX for package %s" % pkg_name)
-            package_files = add_package_files(
+            package_files, excluded_files = add_package_files(
                 d,
                 pkg_objset,
                 pkgdest / package,
@@ -932,7 +957,8 @@ def create_spdx(d):
 
             if include_sources:
                 debug_sources = get_package_sources_from_debug(
-                    d, package, package_files, dep_sources, source_hash_cache
+                    d, package, package_files, dep_sources, source_hash_cache,
+                    excluded_files=excluded_files,
                 )
                 debug_source_ids |= set(
                     oe.sbom30.get_element_link_id(d) for d in debug_sources
@@ -944,7 +970,7 @@ def create_spdx(d):
 
     if include_sources:
         bb.debug(1, "Adding sysroot files to SPDX")
-        sysroot_files = add_package_files(
+        sysroot_files, _ = add_package_files(
             d,
             build_objset,
             d.expand("${COMPONENTS_DIR}/${PACKAGE_ARCH}/${PN}"),
@@ -1326,18 +1352,18 @@ def create_image_spdx(d):
             image_filename = image["filename"]
             image_path = image_deploy_dir / image_filename
             if os.path.isdir(image_path):
-                a = add_package_files(
-                    d,
-                    objset,
-                    image_path,
-                    lambda file_counter: objset.new_spdxid(
-                        "imagefile", str(file_counter)
-                    ),
-                    lambda filepath: [],
-                    license_data=None,
-                    ignore_dirs=[],
-                    ignore_top_level_dirs=[],
-                    archive=None,
+                a, _ = add_package_files(
+                        d,
+                        objset,
+                        image_path,
+                        lambda file_counter: objset.new_spdxid(
+                            "imagefile", str(file_counter)
+                        ),
+                        lambda filepath: [],
+                        license_data=None,
+                        ignore_dirs=[],
+                        ignore_top_level_dirs=[],
+                        archive=None,
                 )
                 artifacts.extend(a)
             else:
-- 
2.53.0


