Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 118D0EC01DF
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 21:07:53 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5648.1774300071756604032
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 14:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UZEO199r;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so30942215e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774300070; x=1774904870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0c1szvNRo9lFldeYmk8o9OdqLCa+Mjx5/i6grLv/h6s=;
        b=UZEO199rLg2h9S8BgZbnZSnmCl4t7+qZNfxyydugb5/ajGrY4A+vhTfWVA8oQUKo1l
         B9IK6giezdhvk4fKVWFrwHe4sB3lDgm7cnrgvGQYKTQ616ef2HiVGNeRWUyycaUM4mP3
         ydQevuGgrsOeNc39bkk7GoSHyWmx7UY7BotFhAioV0YIYKms7SnkyJBcJ5x3g0Jo9Sz6
         3QnyQC1fjh6Rj3T1RTQCeODdHVbjhdtt/Msnps17Z59W5RfFzhY0467qU1HjJtyfovkm
         w0g+US8tA0KZCxM3l74E+P1lSOjvr6bozHGr04EgEDU1cll4XEkO1ciR0FeiinM8Bwrl
         sudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774300070; x=1774904870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0c1szvNRo9lFldeYmk8o9OdqLCa+Mjx5/i6grLv/h6s=;
        b=NyUePqjFJaoMttualoSvt+XiaCox4eAKd4xE6o2+pUBGttN1rgWOT88C2O5az/lacB
         /tsJExaOQ9n8AM/RHO7XC2+wTPFYcaardM8Uk/LIhqM3EQBa8d8TeQ/bkGyEKxGHbwwo
         JQKP0aQO553y/NN+HsZ/nQeWwt780UyDcGo61QPgNN7SCKBB53K8b2LVNIWFEMRmYqDw
         Ev7aSCFNeF5zdehrhNdW1X8OdJ8c/Rd3xj0brbO8hnDOY2YNYhqVLMAGhhjjC0qC7OXA
         oxymgVCI3mEcl4Kfgpxc0eHtUZ4N2QwmvNDnmV/HON5aG+xDjMjPmOuIwIr+XpXXdLpr
         Rp0Q==
X-Gm-Message-State: AOJu0YyKCDj7xhYvI3fDLEruYhcEWnH5Oef+lPL0n84WNWsZFdYzFiXQ
	kgpCt57pmrFjdViFgXsQViPvFhZjuTa6+b8cK8vffeQKvUMhOnNwHSniHKYHTUUp
X-Gm-Gg: ATEYQzxaCNalq9T8tE2UPiAbFjsLUeEGPPUmiQR9ULM5H3gh5a7B/3CDxfofPw/TzIi
	WHj/u4930n/hWM3cTgyNgmsWub4lffJF7uLSGgEkAmx09Vf21WQmg+XtLFh0ZNifLok5a4RqRKM
	1hrp5gUuS7L5ah4A7Xa1vNM+da6w+rVgDENCJcNJratqNOzl4nY2lhLHnIjYQNrw6StXDyjgREl
	SbbDNsqzR/zQ7Dj9ekAmcvKLAt73FlP6rM8p8voV2G0/yD6J22nDoibURlmm/K1H6W8DTHbvOH2
	Ykzuqpw5MYYF1AIzEuhpCwMnkL5wS4kYdsIiEPuFhjj66SooNvGB+ycUOMenlyqhz+oC44PmGH4
	yIXgq6jnr7USy0tWVTxQjzlqkbmFxuEroawUvrKD3sXLJPKbZVy7MLNxrT9bdaLpok5A7E11NP0
	WWIWAC0zAroxJm1x4PFWD547TyHDwbZt8SzUd05G/+PjFzlbQmyXNC
X-Received: by 2002:a05:600c:698e:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-486fee1af00mr161320385e9.24.1774300069076;
        Mon, 23 Mar 2026 14:07:49 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487113c4eb3sm853495e9.0.2026.03.23.14.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 14:07:48 -0700 (PDT)
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
Subject: [PATCH v13 1/4] spdx30: Add configurable file exclusion pattern support
Date: Mon, 23 Mar 2026 22:07:42 +0100
Message-ID: <20260323210745.1337169-2-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323210745.1337169-1-stefano.tondo.ext@siemens.com>
References: <20260323210745.1337169-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 21:07:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233764

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


