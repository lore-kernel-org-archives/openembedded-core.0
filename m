Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7197510987B9
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 16:50:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17790.1774025395840007923
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 09:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BBShmPWw;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fb14227cso21146835e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 09:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774025394; x=1774630194; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnHu1dogLqpbSXYIDWE5Sv/OgVTOq5twkElAyshUXjc=;
        b=BBShmPWwtQlxeapoqk1LKMYVx3QeWGXiNvjk8/ZcQ7lOihmqq67+9GCboWXAW3bwS5
         iJm8fLLG+9M9fOAMFSUswxF5qgANAf1/pC2K4uPeUajV8y80Xpq3LDWSi1/zkJxQo3y/
         Nf7iOy9C0Yq4gFbhsmzqoYE4EN7EAg6ObpsCPYsEZhegT+BawpVa6RsGpCRz3dfyAmx/
         zsO4MsEDO6ncf3QWX4pFyZ/7HMPaNmwvt/pxi8eSpolySWTfCOELm2I/DOw+Ic8rl+2P
         hykUaPSrMRY7Dl+H9udM7F16kf8CNxcuc+XTp1QXM+TV2hT0tRqkS+LXcLe9SxcK6Rgb
         MhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774025394; x=1774630194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LnHu1dogLqpbSXYIDWE5Sv/OgVTOq5twkElAyshUXjc=;
        b=baXpLvTeaIFmi7zRUukjOM6RMKyG711OGiCFFgyZHNnfMuqYI/lGkS80Jbh2IFhxAA
         6T2RL6MgVWIAM0N1TblZxu1rgd0Rfbb+DxbwQoMPu6C67mH6KgLmD3OEL2z0j68aAGsg
         5TZQOkV162U/+btDwkT/n5Qohc5JkddPxqFsl/GU/SHcCYpTNyupCUrKlzr0Exjxnw7m
         kLauLXk10UAlgC7062NiT5lYS4c0mTwOe3Vq1PwrNyQp1II8NH7L4E92PIAPExWq5XK4
         0rbGWQdhXRnFok+EqWDy9xu7rubQYOf1FW/4RqUEgF37739k2CCRaiKQVo61fdIO22ik
         /bkA==
X-Gm-Message-State: AOJu0Yzj4yTOYRfcbVob61phaWVPHQ8KK446HU8GA0h8F7OWJiowO8ne
	/hzeX4/PiHsqUuzl6hdN1s01dOB5utrkT8rdG3e1w5bE9WXAXTgFkabqJ6aHtSG2
X-Gm-Gg: ATEYQzzN125++sYlRj5TYMkRSczzbAYVgKArBLxcYsuychG3xL5KlBzdRFGzepx0gim
	Y1EobK0ZbJKHHGrjeIIKptSTFHOsq1OxTieHkOgSPcDHX6obZolik4VCGx5rk5VBSm+9TjMkIJ/
	TlvYO1Yu00JDmpG2sSYlzlBkulYFG7Vjhqu5rtC7Kmzm3BgmAqchtKnMWvoEe7AF2YhBa7u2BDd
	aOlQji7+MPPAT9dSar5Ze5ZWp3lBEL1dhmNJtEkw3kmZVr0oWbOyWbjL2FZMVVSICUgVBm+R/wV
	Vk6VFET0cJ6hr9oNv2ZpLzHdU0GgqjM7qYXU9qTtwpMgCHSIR1vpdFFSf+z78IH4v0jDVUs+YCB
	GuU+DABBQPJjU+TvtMv37wENCodTOAj28Lyl+p22MmAnLZPjCf14gXqXLT0rM8trSYMpyMpvpBV
	quIydTJFCq34dhiVET552TPWBzmJ8Nq7T6FbY=
X-Received: by 2002:a05:600c:3b07:b0:485:3aa1:a7f1 with SMTP id 5b1f17b1804b1-486fedab4bdmr56341075e9.7.1774025393692;
        Fri, 20 Mar 2026 09:49:53 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d91fbsm73018905e9.3.2026.03.20.09.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:49:53 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	richard.purdie@linuxfoundation.org,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [OE-core][PATCH v10 1/7] spdx30: Add configurable file exclusion pattern support
Date: Fri, 20 Mar 2026 17:49:45 +0100
Message-ID: <20260320164951.128572-2-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320164951.128572-1-stondo@gmail.com>
References: <20260312153845.164369-1-stondo@gmail.com>
 <20260320164951.128572-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 16:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233621

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


