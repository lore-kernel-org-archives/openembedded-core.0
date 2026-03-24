Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110FBFEC0E4
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 17:15:25 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2745.1774372515950713567
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 10:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mLEJi+ji;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso13989565e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774372514; x=1774977314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0c1szvNRo9lFldeYmk8o9OdqLCa+Mjx5/i6grLv/h6s=;
        b=mLEJi+jiLHo4G6SUZ0iOx/eju21Y0IXQo8nk2TDa2dFTQ3ayJbdngZ9FnZjIF3J1MW
         xIcSaFr8AWhVSvczeSbR3IYaJ3GsIcuH0Vm6/2Uc/jdc13TPPg+hAONh9tqrZkuoSI9J
         reQtYL1U+jMMDj9RaQ9sXdF6NRZhBlyqVYxI7MvU7Z19WI9Dk2wYVNg/AudxFXHN0tG+
         99vdy1mrKIo3Bmi2c34cU2PEd33g0wAy3CyGzhHrbjhkTJxPutBnJTEulnAGOmdhSXe6
         YG6T5n94pZus4MXD9LjybujwAvKGV+TGT+E2LHoGJVISaZUrVFkWZ5Kx6/LlinnxuzxP
         e3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372514; x=1774977314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0c1szvNRo9lFldeYmk8o9OdqLCa+Mjx5/i6grLv/h6s=;
        b=FeUZkJmTnVMz5DUxofyn8K+EI3hn9A5XCXfbZRZJ66Eo+DmVeEpEHtxqmr2z7rNk3+
         0worlDBzj9JeVhPa8VJdNIuDePCxJGmE6ZzdqV0KK+l8I0Stmw06SrjIoSRKQ+satJSg
         6TSQr1OW0/03G/ORzR1oSlSm8Qpj1a2rZHSFJCZSpeonQ0c1rfCt+1bLG1KuYclPwaW4
         xAHKsnFZb28r7QOzJs9M1clkYB3wUBdr//61FeOa8wY6u2tZPZWOZGv9bzbaYBBREWDn
         Ob/AElb/vf4VNZ4MghztobJAsqTx7DjlNqlxOqm7nmzAPZHw6QoQlTnyysZtrAjy/+lx
         04FQ==
X-Gm-Message-State: AOJu0Yz1D1yAr0sKIaQm9qlhzkAchiLzGpQOCug+OP+Y7OvGrn6UefO0
	3cQnYTNcwwLKbHk4KkhbR/UurKlBfr74shavcp+dBqRZ8hSa7FWZeXBggYmoUcob
X-Gm-Gg: ATEYQzzMVcFLWopcLUK65+mnlLHG9RFbBUeHHaVZmuxjhx4p3sxj2hRBLDOwSaHMgy/
	ZGhEH7AjjrjGpbjpswNswnHll9oW5TTL2wKRjvMozzHACmMSi4HynHmO8wLDTITYuFxT7DNLz+j
	YDZ/XduN/QL3x6Fk+sFkTwBgiq4AzTOX+Ho81bBYMJ/S4SsYozNaGyB+Qe/pK4W740LrHMq7nDP
	t5gkhfAqTWuhkBMQ2lgszOFycPrXIOlNy3bqMjNu1zwpmcio1D0PRoiiKdAB/RoDCR9PzIolBSE
	zC6EN7oGtMqCGMPtSigBXt8vTMl/rXxm/jdxvpNhSTVn/FEzbuckevOeUuNhgzsiiebpUS6yqUv
	jBUBmQ/p6YTmUwh8i0erVPfVio2l7lWzqPV4fVx3l/SXR+h3MYnaKUgSaDZHLXDoKf1mw51fqKx
	SrXVCfaqztTDS5Dmie93HTMuIiyWqOYNeUGBr5uvNhSXw5bsp2GtOmcbgKEwVuvMOR7/26R+9lY
	t6KBHcZAZjgKmDWZftVn3sf1w==
X-Received: by 2002:a05:600c:1d0e:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-48715fef7bbmr8494925e9.10.1774372513671;
        Tue, 24 Mar 2026 10:15:13 -0700 (PDT)
Received: from fedora (mob-194-230-148-205.cgn.sunrise.net. [194.230.148.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165bea11sm2168665e9.1.2026.03.24.10.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 10:15:13 -0700 (PDT)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v16 1/5] spdx30: Add configurable file exclusion pattern support
Date: Tue, 24 Mar 2026 18:14:58 +0100
Message-ID: <20260324171502.689012-2-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324132958.2316491-1-stondo@gmail.com>
References: <20260324132958.2316491-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 17:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233815

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


