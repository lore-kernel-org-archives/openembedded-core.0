Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23A2D58CC9
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 17:14:53 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2648.1774372485993724487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 10:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rpO31ayY;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so44760565e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774372484; x=1774977284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0c1szvNRo9lFldeYmk8o9OdqLCa+Mjx5/i6grLv/h6s=;
        b=rpO31ayYB/rhU2eAC07iK0F2zLeh5LbJg0za7BCOCjL7ZUbIzBUazptDcE9jfg/pEb
         tdPudlhpE5ldn069A++ZVEg+aqn1Ct75hClk3b/gWdFtbL4EpVOwTlkmlRpwz5C4amMi
         Y9QUAZXoyttRV2jKQp+b45Ct9TVbr/2afYX7Nf8UvffSEzARdo8JQujV3iq/hMFrkxQC
         fZ2QnlrnQ64tBjPGxJtwnIYrcdpxfAKnNppXtUNKkSGlHc9NAphduGYmC9w7k0aeYhOm
         KNnjXC8kwWYjAvQobqmwhNnHDlTS9AP3uWnJMKKmQoQeyV4Sv4jymAM8FNQm03SfHDV7
         BnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774372484; x=1774977284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0c1szvNRo9lFldeYmk8o9OdqLCa+Mjx5/i6grLv/h6s=;
        b=beFt3M19ny5AmcUCzRasaPDqAe2E3UTbiahgV1yYH3rLR6DENeTY6RNjYaeHHsC17q
         IeEiFrDTzyqZlBpL9oZWICl6UUIX9ARoNol07ev6J/LW6IWZGIKMTMtEenrvhv9tb5wi
         Y5DQAoAt5AaklWG6gMLBDLDaWegSZERSNNix3MLbWkzR6imWUOdA2NPLPEOPYmp626Me
         2yswY5Cahca2M/8jeHjZMpQ7TcGOTX6ZN5rnhwXH+e7DSW7hPSuTpdzuNrovH3IoEHqY
         apUgay4j2BuUC0gUcP5OE5GadhXCOo+WzZ24kJv77oNwWnonafmq90Xhd5H2Snl40ebY
         QIXg==
X-Gm-Message-State: AOJu0YzrT/N3d0IeDen6VHE4FnQ5NuNBnI4dTsNZznRCpvrsP8MGxPAr
	SOe9e48OM1eBZpwK2rChlBE8ZKNXR1RznnUBZ+YXpd8k8MYd0uAXMbzQOKpE4rnD
X-Gm-Gg: ATEYQzyp16mHuwCo1X59po8ec9tw2PZX3r6jJGxoAo3E0mHlsG/Yz9nIWctrBr/94E+
	dhC7/kaxTo2SbL/TtI+nAeVw+2AYA/tKAjgFXkOx0ZU1jL4SsQpmt5jnx7A3Qbe8S5oB/oH8iOX
	+AW2wgF3E2KWLtzNmRIjOD9yozyRy/pyx3XadqaZDnjG7zdc10VQwVmbF5iT94SGi0KeGlFSU0D
	Ipj3dtdJTzmbKqQbDLtO9bEuANRRXkIKZLi4m81/5PC6RDCpiw378Bw7z1PR8dcasQ68UW5Ixca
	kmNcLne3HmfXEBZRdLs2RMTlW+jXjeOZXC0WuXM8oA2u0c1Zduhc61Ijpt0pi8XCO7hxEvE/Z/4
	OtjbVFcg0vf94q1AuxLw6mX1/7RhHI0QJm8y23khRPCJLC9LEdfmja0P2m/Itt4S7S94K4Lkxyz
	j8luiI46mJtnUxUkMY9jyFZb8WKPkXF7wO7qHBR2g/QNpGspMEecuZOZoLZDwHcQrc801Hlq5oG
	AmTZKl5CWB950yvLdNoQbrr2LdXE7f4vA9A
X-Received: by 2002:a05:600c:1e8f:b0:485:4526:ee06 with SMTP id 5b1f17b1804b1-48715fe707amr8527695e9.11.1774372483825;
        Tue, 24 Mar 2026 10:14:43 -0700 (PDT)
Received: from fedora (mob-194-230-148-205.cgn.sunrise.net. [194.230.148.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165e8e0csm1089275e9.1.2026.03.24.10.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 10:14:43 -0700 (PDT)
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
Date: Tue, 24 Mar 2026 18:12:42 +0100
Message-ID: <20260324171246.686862-2-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324132958.2316491-1-stondo@gmail.com>
References: <20260324132958.2316491-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 17:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233809

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


