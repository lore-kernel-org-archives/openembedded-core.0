Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F88F46104
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:04:14 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16840.1774271044187818353
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 06:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I3vp98wI;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso850325e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774271042; x=1774875842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zqHH8vZC+UY7iVZ2JLHsatSm5jkiN9aqeCJFnQoOmY=;
        b=I3vp98wI+/ond2b5QjYfAjLIrni/6U3YeplkzkSHSQ8lbHImGbLWloz1NLaAMr7Jv1
         U3ASpPC2t0s688GklUV2wXb77X/pllNc1buWUV1biKfRWKkylcdtSUJJu4vTwmjMosqH
         QaC+IHBJ4RZLF+yTmCHivdtcXBUVcr7KYZH9t5gFbB1PC9nUdloVmjjP7bfjHFNDnfVm
         oh/9OWYqHgYeoOnNSMI7Bg205V3yxIyrvTuqET4rsT3NTtGm9nQnIREJfqHrgY38t+Jr
         osNIaJ9eXPqNUeY+tSywqrMWEyLR3TcAXZxOz1msCW+3Yog9Uk6aXz/XGhA0qxYoinzh
         8zow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271042; x=1774875842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+zqHH8vZC+UY7iVZ2JLHsatSm5jkiN9aqeCJFnQoOmY=;
        b=qyoM+RUe3mvgqufTqc3wl6jWfVPxqnO4BwMx3PPajnABOTW1MOa0sxQ2S527cLoFTL
         VzaFVqLpPER8hu8l27bAkaEIpa6A6Wtq7zAy7goIkMMD9QmYFM3+tiMJaNxyDtfsoGfS
         53Tn+bzAC1Hw665Qe29LhGub/GRRwTAkbukHoIqplCsnUEEfTSZ6qI/Rj+dtGq2ayAGT
         jPEadutuP8pftVu3i4sTnOoMJadVnw0gXUnLvcTQIBCxHXqXuQvyNHum/Qv8KwQLzG37
         1bb2rgQmPPLzzsqZqrbpzjNI6oRa/6h9raErHCvW/9un49dw/dI0NoEgEc3WEtbPsFjR
         SXHQ==
X-Gm-Message-State: AOJu0Yw+Kn4qz0lY9b1cM4R8Dr5iPw/8dYv7pR3ZYOoKZLxS5vYl8Ohx
	Wk3AEJ00TF+Yy4vy1wCjl3SQwhTWzAms1Juh1rAGIZMJPcapVmLDmT5ZB00RPWxB
X-Gm-Gg: ATEYQzzKS99JzqEKv888tvJYtXaUYiPIp83VYX1G9dcLwH7h1mqrbzmP0SQWXeatQIk
	0uq93urfbCKAnNunHkyA1N1qb4zkdPrultYXrTHsclAsGTFXgu6/DcdtuTS+tjAmHa/ZS10RzVX
	0JVmTM8Nm7RETzp1BK5x5UhxXXt2WY44I6JsAUP/CZD+plkCJu9DiNwyPhF4NUNCtRT+4L8jETo
	KHmDm6CUdUxuIpLzYC2DixIw0JnIu+6id/fmOEIe5XvpWEiQBIvGyez+FC1Qckn1dztbmV2I7hL
	ZINch9q2aYj3WH+H25TBBb/WrcZ9J9r6lZxt6C2daeOPaHkRPlIiEa0LH2V6CFE99OzSbzdyTZB
	Qg9SiJWXSZ99y2OvmWxanmEDyggsE9K0puaUsz5J/fTb8TUDQbkrU6VkhT6DyGm8JbHxp57fYvc
	/OvGnkk7X2ALLWCRNIUnF4EDLrGOOkhISeSxDVE9EVs7c70zZ58ti/
X-Received: by 2002:a05:600c:4707:b0:485:3c66:e230 with SMTP id 5b1f17b1804b1-486ff039929mr165232675e9.29.1774271041047;
        Mon, 23 Mar 2026 06:04:01 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe7e2665sm324609665e9.6.2026.03.23.06.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:03:57 -0700 (PDT)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v12 1/4] spdx30: Add configurable file exclusion pattern support
Date: Mon, 23 Mar 2026 14:03:47 +0100
Message-ID: <20260323130350.1177721-2-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323130350.1177721-1-stefano.tondo.ext@siemens.com>
References: <20260321131826.1401671-1-stondo@gmail.com>
 <20260323130350.1177721-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233714

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
 meta/classes-recipe/cargo_common.bbclass |   3 +
 meta/classes-recipe/cpan.bbclass         |  11 +
 meta/classes-recipe/go-mod.bbclass       |   6 +
 meta/classes-recipe/npm.bbclass          |   7 +
 meta/classes-recipe/pypi.bbclass         |   6 +-
 meta/classes/spdx-common.bbclass         |   7 +
 meta/lib/oe/spdx30_tasks.py              | 666 ++++++++++++-----------
 7 files changed, 375 insertions(+), 331 deletions(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index bc44ad7918..0d3edfe4a7 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -240,3 +240,6 @@ EXPORT_FUNCTIONS do_configure
 # https://github.com/rust-lang/libc/issues/3223
 # https://github.com/rust-lang/libc/pull/3175
 INSANE_SKIP:append = " 32bit-time"
+
+# Generate ecosystem-specific Package URL for SPDX
+SPDX_PACKAGE_URLS =+ "pkg:cargo/${BPN}@${PV} "
diff --git a/meta/classes-recipe/cpan.bbclass b/meta/classes-recipe/cpan.bbclass
index bb76a5b326..dbf44da9d2 100644
--- a/meta/classes-recipe/cpan.bbclass
+++ b/meta/classes-recipe/cpan.bbclass
@@ -68,4 +68,15 @@ cpan_do_install () {
 	done
 }
 
+# Generate ecosystem-specific Package URL for SPDX
+def cpan_spdx_name(d):
+    bpn = d.getVar('BPN')
+    if bpn.startswith('perl-'):
+        return bpn[5:]
+    elif bpn.startswith('libperl-'):
+        return bpn[8:]
+    return bpn
+
+SPDX_PACKAGE_URLS =+ "pkg:cpan/${@cpan_spdx_name(d)}@${PV} "
+
 EXPORT_FUNCTIONS do_configure do_compile do_install
diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-mod.bbclass
index a15dda8f0e..5b3cb2d8b9 100644
--- a/meta/classes-recipe/go-mod.bbclass
+++ b/meta/classes-recipe/go-mod.bbclass
@@ -32,3 +32,9 @@ do_compile[dirs] += "${B}/src/${GO_WORKDIR}"
 # Make go install unpack the module zip files in the module cache directory
 # before the license directory is polulated with license files.
 addtask do_compile before do_populate_lic
+
+# Generate ecosystem-specific Package URL for SPDX
+SPDX_PACKAGE_URLS =+ "pkg:golang/${GO_IMPORT}@${PV} "
+
+# Generate ecosystem-specific Package URL for SPDX
+SPDX_PACKAGE_URLS =+ "pkg:golang/${GO_IMPORT}@${PV} "
diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bbclass
index 344e8b4bec..7bb791d543 100644
--- a/meta/classes-recipe/npm.bbclass
+++ b/meta/classes-recipe/npm.bbclass
@@ -354,4 +354,11 @@ FILES:${PN} += " \
     ${nonarch_libdir} \
 "
 
+# Generate ecosystem-specific Package URL for SPDX
+def npm_spdx_name(d):
+    bpn = d.getVar('BPN')
+    return bpn[5:] if bpn.startswith('node-') else bpn
+
+SPDX_PACKAGE_URLS =+ "pkg:npm/${@npm_spdx_name(d)}@${PV} "
+
 EXPORT_FUNCTIONS do_configure do_compile do_install
diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.bbclass
index 9d46c035f6..e2d054af6d 100644
--- a/meta/classes-recipe/pypi.bbclass
+++ b/meta/classes-recipe/pypi.bbclass
@@ -43,7 +43,8 @@ SECTION = "devel/python"
 SRC_URI:prepend = "${PYPI_SRC_URI} "
 S = "${UNPACKDIR}/${PYPI_PACKAGE}-${PV}"
 
-UPSTREAM_CHECK_PYPI_PACKAGE ?= "${PYPI_PACKAGE}"
+# Replace any '_' characters in the pypi URI with '-'s to follow the PyPi website naming conventions
+UPSTREAM_CHECK_PYPI_PACKAGE ?= "${@pypi_normalize(d)}"
 
 # Use the simple repository API rather than the potentially unstable project URL
 # More information on the pypi API specification is avaialble here:
@@ -54,3 +55,6 @@ UPSTREAM_CHECK_URI ?= "https://pypi.org/simple/${@pypi_normalize(d)}/"
 UPSTREAM_CHECK_REGEX ?= "${UPSTREAM_CHECK_PYPI_PACKAGE}-(?P<pver>(\d+[\.\-_]*)+).(tar\.gz|tgz|zip|tar\.bz2)"
 
 CVE_PRODUCT ?= "python:${PYPI_PACKAGE}"
+
+# Generate ecosystem-specific Package URL for SPDX
+SPDX_PACKAGE_URLS =+ "pkg:pypi/${@pypi_normalize(d)}@${PV} "
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
index 353d783fa2..bb814bbd57 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -13,6 +13,8 @@ import oe.spdx30
 import oe.spdx_common
 import oe.sdk
 import os
+import re
+import urllib.parse
 
 from contextlib import contextmanager
 from datetime import datetime, timezone
@@ -32,9 +34,7 @@ def set_timestamp_now(d, o, prop):
         delattr(o, prop)
 
 
-def add_license_expression(
-    d, objset, license_expression, license_data, search_objsets=[]
-):
+def add_license_expression(d, objset, license_expression, license_data):
     simple_license_text = {}
     license_text_map = {}
     license_ref_idx = 0
@@ -46,15 +46,14 @@ def add_license_expression(
         if name in simple_license_text:
             return simple_license_text[name]
 
-        for o in [objset] + search_objsets:
-            lic = o.find_filter(
-                oe.spdx30.simplelicensing_SimpleLicensingText,
-                name=name,
-            )
+        lic = objset.find_filter(
+            oe.spdx30.simplelicensing_SimpleLicensingText,
+            name=name,
+        )
 
-            if lic is not None:
-                simple_license_text[name] = lic
-                return lic
+        if lic is not None:
+            simple_license_text[name] = lic
+            return lic
 
         lic = objset.add(
             oe.spdx30.simplelicensing_SimpleLicensingText(
@@ -148,42 +147,36 @@ def add_package_files(
     ignore_dirs=[],
     ignore_top_level_dirs=[],
 ):
-    source_date_epoch = d.getVar("SOURCE_DATE_EPOCH")
-    if source_date_epoch:
-        source_date_epoch = int(source_date_epoch)
-
-    spdx_files = set()
-
-    file_counter = 1
-    if not os.path.exists(topdir):
-        bb.note(f"Skip {topdir}")
-        return spdx_files
-
-    check_compiled_sources = d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") == "1"
-    if check_compiled_sources:
-        compiled_sources, types = oe.spdx_common.get_compiled_sources(d)
-        bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
-
-    for subdir, dirs, files in os.walk(topdir, onerror=walk_error):
-        dirs[:] = [d for d in dirs if d not in ignore_dirs]
-        if subdir == str(topdir):
-            dirs[:] = [d for d in dirs if d not in ignore_top_level_dirs]
-
-        dirs.sort()
-        files.sort()
-        for file in files:
-            filepath = Path(subdir) / file
+            if os.path.isdir(image_path):
+                a, _ = add_package_files(
+                    d,
+                    objset,
+                    image_path,
+                    lambda file_counter: objset.new_spdxid(
+                        "imagefile", str(file_counter)
+                    ),
+                    lambda filepath: [],
+                    license_data=None,
+                    ignore_dirs=[],
+                    ignore_top_level_dirs=[],
+                    archive=None,
+                )
             if filepath.is_symlink() or not filepath.is_file():
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
             if check_compiled_sources:
-                if not oe.spdx_common.is_compiled_source(
-                    filename, compiled_sources, types
-                ):
+                if not oe.spdx_common.is_compiled_source(filename, compiled_sources, types):
                     continue
 
             spdx_file = objset.new_file(
@@ -218,12 +211,15 @@ def add_package_files(
 
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
@@ -256,6 +252,12 @@ def get_package_sources_from_debug(
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
@@ -298,14 +300,17 @@ def get_package_sources_from_debug(
     return dep_source_files
 
 
-def collect_dep_objsets(d, direct_deps, subdir, fn_prefix, obj_type, **attr_filter):
+def collect_dep_objsets(d, build):
+    deps = oe.spdx_common.get_spdx_deps(d)
+
     dep_objsets = []
-    dep_objs = set()
+    dep_builds = set()
 
-    for dep in direct_deps:
+    dep_build_spdxids = set()
+    for dep in deps:
         bb.debug(1, "Fetching SPDX for dependency %s" % (dep.pn))
-        dep_obj, dep_objset = oe.sbom30.find_root_obj_in_jsonld(
-            d, subdir, fn_prefix + dep.pn, obj_type, **attr_filter
+        dep_build, dep_objset = oe.sbom30.find_root_obj_in_jsonld(
+            d, "recipes", "recipe-" + dep.pn, oe.spdx30.build_Build
         )
         # If the dependency is part of the taskhash, return it to be linked
         # against. Otherwise, it cannot be linked against because this recipe
@@ -313,10 +318,10 @@ def collect_dep_objsets(d, direct_deps, subdir, fn_prefix, obj_type, **attr_filt
         if dep.in_taskhash:
             dep_objsets.append(dep_objset)
 
-        # The object _can_ be linked against (by alias)
-        dep_objs.add(dep_obj)
+        # The build _can_ be linked against (by alias)
+        dep_builds.add(dep_build)
 
-    return dep_objsets, dep_objs
+    return dep_objsets, dep_builds
 
 
 def index_sources_by_hash(sources, dest):
@@ -359,6 +364,120 @@ def collect_dep_sources(dep_objsets, dest):
             index_sources_by_hash(e.to, dest)
 
 
+def _generate_git_purl(d, download_location, srcrev):
+    """Generate a Package URL for a Git source from its download location.
+
+    Parses the Git URL to identify the hosting service and generates the
+    appropriate PURL type. Supports github.com by default and custom
+    mappings via SPDX_GIT_PURL_MAPPINGS.
+
+    Returns the PURL string or None if no mapping matches.
+    """
+    if not download_location or not download_location.startswith('git+'):
+        return None
+
+    git_url = download_location[4:]  # Remove 'git+' prefix
+
+    # Default handler: github.com
+    git_purl_handlers = {
+        'github.com': 'pkg:github',
+    }
+
+    # Custom PURL mappings from SPDX_GIT_PURL_MAPPINGS
+    # Format: "domain1:purl_type1 domain2:purl_type2"
+    custom_mappings = d.getVar('SPDX_GIT_PURL_MAPPINGS')
+    if custom_mappings:
+        for mapping in custom_mappings.split():
+            parts = mapping.split(':', 1)
+            if len(parts) == 2:
+                git_purl_handlers[parts[0]] = parts[1]
+                bb.debug(2, f"Added custom Git PURL mapping: {parts[0]} -> {parts[1]}")
+            else:
+                bb.warn(f"Invalid SPDX_GIT_PURL_MAPPINGS entry: {mapping} (expected format: domain:purl_type)")
+
+    try:
+        parsed = urllib.parse.urlparse(git_url)
+    except Exception:
+        return None
+
+    hostname = parsed.hostname
+    if not hostname:
+        return None
+
+    for domain, purl_type in git_purl_handlers.items():
+        if hostname == domain:
+            path = parsed.path.strip('/')
+            path_parts = path.split('/')
+            if len(path_parts) >= 2:
+                owner = path_parts[0]
+                repo = path_parts[1].replace('.git', '')
+                return f"{purl_type}/{owner}/{repo}@{srcrev}"
+            break
+
+    return None
+
+
+def _enrich_source_package(d, dl, fd, file_name, primary_purpose):
+    """Enrich a source download package with version, PURL, and external refs.
+
+    Extracts version from SRCREV for Git sources, generates PURLs for
+    known hosting services, and adds external references for VCS,
+    distribution URLs, and homepage.
+    """
+    version = None
+    purl = None
+
+    if fd.type == "git":
+        # Use full SHA-1 from fd.revision
+        srcrev = getattr(fd, 'revision', None)
+        if srcrev and srcrev not in {'${AUTOREV}', 'AUTOINC', 'INVALID'}:
+            version = srcrev
+
+        # Generate PURL for Git hosting services
+        download_location = getattr(dl, 'software_downloadLocation', None)
+        if version and download_location:
+            purl = _generate_git_purl(d, download_location, version)
+    else:
+        # Use ecosystem PURL from SPDX_PACKAGE_URLS if available
+        package_urls = (d.getVar('SPDX_PACKAGE_URLS') or '').split()
+        for url in package_urls:
+            if not url.startswith('pkg:yocto'):
+                purl = url
+                break
+
+    if version:
+        dl.software_packageVersion = version
+
+    if purl:
+        dl.software_packageUrl = purl
+
+    # Add external references
+    download_location = getattr(dl, 'software_downloadLocation', None)
+    if download_location and isinstance(download_location, str):
+        dl.externalRef = dl.externalRef or []
+
+        if download_location.startswith('git+'):
+            # VCS reference for Git repositories
+            git_url = download_location[4:]
+            if '@' in git_url:
+                git_url = git_url.split('@')[0]
+
+            dl.externalRef.append(
+                oe.spdx30.ExternalRef(
+                    externalRefType=oe.spdx30.ExternalRefType.vcs,
+                    locator=[git_url],
+                )
+            )
+        elif download_location.startswith(('http://', 'https://', 'ftp://')):
+            # Distribution reference for tarball/archive downloads
+            dl.externalRef.append(
+                oe.spdx30.ExternalRef(
+                    externalRefType=oe.spdx30.ExternalRefType.altDownloadLocation,
+                    locator=[download_location],
+                )
+            )
+
+
 def add_download_files(d, objset):
     inputs = set()
 
@@ -422,10 +541,14 @@ def add_download_files(d, objset):
                 )
             )
 
+            _enrich_source_package(d, dl, fd, file_name, primary_purpose)
+
             if fd.method.supports_checksum(fd):
                 # TODO Need something better than hard coding this
                 for checksum_id in ["sha256", "sha1"]:
-                    expected_checksum = getattr(fd, "%s_expected" % checksum_id, None)
+                    expected_checksum = getattr(
+                        fd, "%s_expected" % checksum_id, None
+                    )
                     if expected_checksum is None:
                         continue
 
@@ -462,220 +585,6 @@ def set_purposes(d, element, *var_names, force_purposes=[]):
     ]
 
 
-def set_purls(spdx_package, purls):
-    if purls:
-        spdx_package.software_packageUrl = purls[0]
-
-    for p in sorted(set(purls)):
-        spdx_package.externalIdentifier.append(
-            oe.spdx30.ExternalIdentifier(
-                externalIdentifierType=oe.spdx30.ExternalIdentifierType.packageUrl,
-                identifier=p,
-            )
-        )
-
-
-def get_is_native(d):
-    return bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d)
-
-
-def create_recipe_spdx(d):
-    deploydir = Path(d.getVar("SPDXRECIPEDEPLOY"))
-    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
-    pn = d.getVar("PN")
-
-    license_data = oe.spdx_common.load_spdx_license_data(d)
-
-    include_vex = d.getVar("SPDX_INCLUDE_VEX")
-    if not include_vex in ("none", "current", "all"):
-        bb.fatal("SPDX_INCLUDE_VEX must be one of 'none', 'current', 'all'")
-
-    recipe_objset = oe.sbom30.ObjectSet.new_objset(d, "static-" + pn)
-
-    recipe = recipe_objset.add_root(
-        oe.spdx30.software_Package(
-            _id=recipe_objset.new_spdxid("recipe", pn),
-            creationInfo=recipe_objset.doc.creationInfo,
-            name=d.getVar("PN"),
-            software_packageVersion=d.getVar("PV"),
-            software_primaryPurpose=oe.spdx30.software_SoftwarePurpose.specification,
-            software_sourceInfo=json.dumps(
-                {
-                    "FILENAME": os.path.basename(d.getVar("FILE")),
-                    "FILE_LAYERNAME": d.getVar("FILE_LAYERNAME"),
-                },
-                separators=(",", ":"),
-            ),
-        )
-    )
-
-    if get_is_native(d):
-        ext = oe.sbom30.OERecipeExtension()
-        ext.is_native = True
-        recipe.extension.append(ext)
-
-    set_purls(recipe, (d.getVar("SPDX_PACKAGE_URLS") or "").split())
-
-    # TODO: This doesn't work before do_unpack because the license text has to
-    # be available for recipes with NO_GENERIC_LICENSE
-    # recipe_spdx_license = add_license_expression(
-    #    d,
-    #    recipe_objset,
-    #    d.getVar("LICENSE"),
-    #    license_data,
-    # )
-    # recipe_objset.new_relationship(
-    #    [recipe],
-    #    oe.spdx30.RelationshipType.hasDeclaredLicense,
-    #    [oe.sbom30.get_element_link_id(recipe_spdx_license)],
-    # )
-
-    if val := d.getVar("HOMEPAGE"):
-        recipe.software_homePage = val
-
-    if val := d.getVar("SUMMARY"):
-        recipe.summary = val
-
-    if val := d.getVar("DESCRIPTION"):
-        recipe.description = val
-
-    for cpe_id in oe.cve_check.get_cpe_ids(
-        d.getVar("CVE_PRODUCT"), d.getVar("CVE_VERSION")
-    ):
-        recipe.externalIdentifier.append(
-            oe.spdx30.ExternalIdentifier(
-                externalIdentifierType=oe.spdx30.ExternalIdentifierType.cpe23,
-                identifier=cpe_id,
-            )
-        )
-
-    direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_recipe_spdx")
-
-    dep_objsets, dep_recipes = collect_dep_objsets(
-        d, direct_deps, "static", "static-", oe.spdx30.software_Package
-    )
-
-    if dep_recipes:
-        recipe_objset.new_scoped_relationship(
-            [recipe],
-            oe.spdx30.RelationshipType.dependsOn,
-            oe.spdx30.LifecycleScopeType.build,
-            sorted(oe.sbom30.get_element_link_id(dep) for dep in dep_recipes),
-        )
-
-    # Add CVEs
-    cve_by_status = {}
-    if include_vex != "none":
-        patched_cves = oe.cve_check.get_patched_cves(d)
-        for cve, patched_cve in patched_cves.items():
-            mapping = patched_cve["abbrev-status"]
-            detail = patched_cve["status"]
-            description = patched_cve.get("justification", None)
-            resources = patched_cve.get("resource", [])
-
-            # If this CVE is fixed upstream, skip it unless all CVEs are
-            # specified.
-            if include_vex != "all" and detail in (
-                "fixed-version",
-                "cpe-stable-backport",
-            ):
-                bb.debug(1, "Skipping %s since it is already fixed upstream" % cve)
-                continue
-
-            spdx_cve = recipe_objset.new_cve_vuln(cve)
-
-            cve_by_status.setdefault(mapping, {})[cve] = (
-                spdx_cve,
-                detail,
-                description,
-                resources,
-            )
-
-    all_cves = set()
-    for status, cves in cve_by_status.items():
-        for cve, items in cves.items():
-            spdx_cve, detail, description, resources = items
-            spdx_cve_id = oe.sbom30.get_element_link_id(spdx_cve)
-
-            all_cves.add(spdx_cve)
-
-            if status == "Patched":
-                spdx_vex = recipe_objset.new_vex_patched_relationship(
-                    [spdx_cve_id], [recipe]
-                )
-                patches = []
-                for idx, filepath in enumerate(resources):
-                    patches.append(
-                        recipe_objset.new_file(
-                            recipe_objset.new_spdxid(
-                                "patch", str(idx), os.path.basename(filepath)
-                            ),
-                            os.path.basename(filepath),
-                            filepath,
-                            purposes=[oe.spdx30.software_SoftwarePurpose.patch],
-                            hashfile=os.path.isfile(filepath),
-                        )
-                    )
-
-                if patches:
-                    recipe_objset.new_scoped_relationship(
-                        spdx_vex,
-                        oe.spdx30.RelationshipType.patchedBy,
-                        oe.spdx30.LifecycleScopeType.build,
-                        patches,
-                    )
-
-            elif status == "Unpatched":
-                recipe_objset.new_vex_unpatched_relationship([spdx_cve_id], [recipe])
-            elif status == "Ignored":
-                spdx_vex = recipe_objset.new_vex_ignored_relationship(
-                    [spdx_cve_id],
-                    [recipe],
-                    impact_statement=description,
-                )
-
-                vex_just_type = d.getVarFlag("CVE_CHECK_VEX_JUSTIFICATION", detail)
-                if vex_just_type:
-                    if (
-                        vex_just_type
-                        not in oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS
-                    ):
-                        bb.fatal(
-                            f"Unknown vex justification '{vex_just_type}', detail '{detail}', for ignored {cve}"
-                        )
-
-                    for v in spdx_vex:
-                        v.security_justificationType = (
-                            oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS[
-                                vex_just_type
-                            ]
-                        )
-
-            elif status == "Unknown":
-                bb.note(f"Skipping {cve} with status 'Unknown'")
-            else:
-                bb.fatal(f"Unknown {cve} status '{status}'")
-
-    if all_cves:
-        recipe_objset.new_relationship(
-            [recipe],
-            oe.spdx30.RelationshipType.hasAssociatedVulnerability,
-            sorted(list(all_cves)),
-        )
-
-    oe.sbom30.write_recipe_jsonld_doc(d, recipe_objset, "static", deploydir)
-
-
-def load_recipe_spdx(d):
-
-    return oe.sbom30.find_root_obj_in_jsonld(
-        d,
-        "static",
-        "static-" + d.getVar("PN"),
-        oe.spdx30.software_Package,
-    )
-
-
 def create_spdx(d):
     def set_var_field(var, obj, name, package=None):
         val = None
@@ -690,17 +599,19 @@ def create_spdx(d):
 
     license_data = oe.spdx_common.load_spdx_license_data(d)
 
-    pn = d.getVar("PN")
     deploydir = Path(d.getVar("SPDXDEPLOY"))
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_workdir = Path(d.getVar("SPDXWORK"))
     include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
     pkg_arch = d.getVar("SSTATE_PKGARCH")
-    is_native = get_is_native(d)
-
-    recipe, recipe_objset = load_recipe_spdx(d)
+    is_native = bb.data.inherits_class("native", d) or bb.data.inherits_class(
+        "cross", d
+    )
+    include_vex = d.getVar("SPDX_INCLUDE_VEX")
+    if not include_vex in ("none", "current", "all"):
+        bb.fatal("SPDX_INCLUDE_VEX must be one of 'none', 'current', 'all'")
 
-    build_objset = oe.sbom30.ObjectSet.new_objset(d, "build-" + pn)
+    build_objset = oe.sbom30.ObjectSet.new_objset(d, "recipe-" + d.getVar("PN"))
 
     build = build_objset.new_task_build("recipe", "recipe")
     build_objset.set_element_alias(build)
@@ -718,13 +629,47 @@ def create_spdx(d):
 
     build_inputs = set()
 
+    # Add CVEs
+    cve_by_status = {}
+    if include_vex != "none":
+        patched_cves = oe.cve_check.get_patched_cves(d)
+        for cve, patched_cve in patched_cves.items():
+            decoded_status = {
+                "mapping": patched_cve["abbrev-status"],
+                "detail": patched_cve["status"],
+                "description": patched_cve.get("justification", None)
+            }
+
+            # If this CVE is fixed upstream, skip it unless all CVEs are
+            # specified.
+            if (
+                include_vex != "all"
+                and "detail" in decoded_status
+                and decoded_status["detail"]
+                in (
+                    "fixed-version",
+                    "cpe-stable-backport",
+                )
+            ):
+                bb.debug(1, "Skipping %s since it is already fixed upstream" % cve)
+                continue
+
+            spdx_cve = build_objset.new_cve_vuln(cve)
+            build_objset.set_element_alias(spdx_cve)
+
+            cve_by_status.setdefault(decoded_status["mapping"], {})[cve] = (
+                spdx_cve,
+                decoded_status["detail"],
+                decoded_status["description"],
+            )
+
     cpe_ids = oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getVar("CVE_VERSION"))
 
     source_files = add_download_files(d, build_objset)
     build_inputs |= source_files
 
     recipe_spdx_license = add_license_expression(
-        d, build_objset, d.getVar("LICENSE"), license_data, [recipe_objset]
+        d, build_objset, d.getVar("LICENSE"), license_data
     )
     build_objset.new_relationship(
         source_files,
@@ -737,7 +682,7 @@ def create_spdx(d):
         bb.debug(1, "Adding source files to SPDX")
         oe.spdx_common.get_patched_src(d)
 
-        files = add_package_files(
+        files, _ = add_package_files(
             d,
             build_objset,
             spdx_workdir,
@@ -753,12 +698,7 @@ def create_spdx(d):
         build_inputs |= files
         index_sources_by_hash(files, dep_sources)
 
-    direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_spdx")
-
-    dep_objsets, dep_builds = collect_dep_objsets(
-        d, direct_deps, "builds", "build-", oe.spdx30.build_Build
-    )
-
+    dep_objsets, dep_builds = collect_dep_objsets(d, build)
     if dep_builds:
         build_objset.new_scoped_relationship(
             [build],
@@ -828,7 +768,16 @@ def create_spdx(d):
                 or ""
             ).split()
 
-            set_purls(spdx_package, purls)
+            if purls:
+                spdx_package.software_packageUrl = purls[0]
+
+            for p in sorted(set(purls)):
+                spdx_package.externalIdentifier.append(
+                    oe.spdx30.ExternalIdentifier(
+                        externalIdentifierType=oe.spdx30.ExternalIdentifierType.packageUrl,
+                        identifier=p,
+                    )
+                )
 
             pkg_objset.new_scoped_relationship(
                 [oe.sbom30.get_element_link_id(build)],
@@ -837,13 +786,6 @@ def create_spdx(d):
                 [spdx_package],
             )
 
-            pkg_objset.new_scoped_relationship(
-                [oe.sbom30.get_element_link_id(recipe)],
-                oe.spdx30.RelationshipType.generates,
-                oe.spdx30.LifecycleScopeType.build,
-                [spdx_package],
-            )
-
             for cpe_id in cpe_ids:
                 spdx_package.externalIdentifier.append(
                     oe.spdx30.ExternalIdentifier(
@@ -877,11 +819,7 @@ def create_spdx(d):
             package_license = d.getVar("LICENSE:%s" % package)
             if package_license and package_license != d.getVar("LICENSE"):
                 package_spdx_license = add_license_expression(
-                    d,
-                    build_objset,
-                    package_license,
-                    license_data,
-                    [recipe_objset],
+                    d, build_objset, package_license, license_data
                 )
             else:
                 package_spdx_license = recipe_spdx_license
@@ -894,9 +832,7 @@ def create_spdx(d):
 
             # Add concluded license relationship if manually set
             # Only add when license analysis has been explicitly performed
-            concluded_license_str = d.getVar(
-                "SPDX_CONCLUDED_LICENSE:%s" % package
-            ) or d.getVar("SPDX_CONCLUDED_LICENSE")
+            concluded_license_str = d.getVar("SPDX_CONCLUDED_LICENSE:%s" % package) or d.getVar("SPDX_CONCLUDED_LICENSE")
             if concluded_license_str:
                 concluded_spdx_license = add_license_expression(
                     d, build_objset, concluded_license_str, license_data
@@ -908,8 +844,61 @@ def create_spdx(d):
                     [oe.sbom30.get_element_link_id(concluded_spdx_license)],
                 )
 
+            # NOTE: CVE Elements live in the recipe collection
+            all_cves = set()
+            for status, cves in cve_by_status.items():
+                for cve, items in cves.items():
+                    spdx_cve, detail, description = items
+                    spdx_cve_id = oe.sbom30.get_element_link_id(spdx_cve)
+
+                    all_cves.add(spdx_cve_id)
+
+                    if status == "Patched":
+                        pkg_objset.new_vex_patched_relationship(
+                            [spdx_cve_id], [spdx_package]
+                        )
+                    elif status == "Unpatched":
+                        pkg_objset.new_vex_unpatched_relationship(
+                            [spdx_cve_id], [spdx_package]
+                        )
+                    elif status == "Ignored":
+                        spdx_vex = pkg_objset.new_vex_ignored_relationship(
+                            [spdx_cve_id],
+                            [spdx_package],
+                            impact_statement=description,
+                        )
+
+                        vex_just_type = d.getVarFlag(
+                            "CVE_CHECK_VEX_JUSTIFICATION", detail
+                        )
+                        if vex_just_type:
+                            if (
+                                vex_just_type
+                                not in oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS
+                            ):
+                                bb.fatal(
+                                    f"Unknown vex justification '{vex_just_type}', detail '{detail}', for ignored {cve}"
+                                )
+
+                            for v in spdx_vex:
+                                v.security_justificationType = oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS[
+                                    vex_just_type
+                                ]
+
+                    elif status == "Unknown":
+                        bb.note(f"Skipping {cve} with status 'Unknown'")
+                    else:
+                        bb.fatal(f"Unknown {cve} status '{status}'")
+
+            if all_cves:
+                pkg_objset.new_relationship(
+                    [spdx_package],
+                    oe.spdx30.RelationshipType.hasAssociatedVulnerability,
+                    sorted(list(all_cves)),
+                )
+
             bb.debug(1, "Adding package files to SPDX for package %s" % pkg_name)
-            package_files = add_package_files(
+            package_files, excluded_files = add_package_files(
                 d,
                 pkg_objset,
                 pkgdest / package,
@@ -932,7 +921,8 @@ def create_spdx(d):
 
             if include_sources:
                 debug_sources = get_package_sources_from_debug(
-                    d, package, package_files, dep_sources, source_hash_cache
+                    d, package, package_files, dep_sources, source_hash_cache,
+                    excluded_files=excluded_files,
                 )
                 debug_source_ids |= set(
                     oe.sbom30.get_element_link_id(d) for d in debug_sources
@@ -944,7 +934,7 @@ def create_spdx(d):
 
     if include_sources:
         bb.debug(1, "Adding sysroot files to SPDX")
-        sysroot_files = add_package_files(
+        sysroot_files, _ = add_package_files(
             d,
             build_objset,
             d.expand("${COMPONENTS_DIR}/${PACKAGE_ARCH}/${PN}"),
@@ -985,27 +975,27 @@ def create_spdx(d):
                 status = "enabled" if feature in enabled else "disabled"
                 build.build_parameter.append(
                     oe.spdx30.DictionaryEntry(
-                        key=f"PACKAGECONFIG:{feature}", value=status
+                        key=f"PACKAGECONFIG:{feature}",
+                        value=status
                     )
                 )
 
-            bb.note(
-                f"Added PACKAGECONFIG entries: {len(enabled)} enabled, {len(disabled)} disabled"
-            )
+            bb.note(f"Added PACKAGECONFIG entries: {len(enabled)} enabled, {len(disabled)} disabled")
 
-    oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "builds", deploydir)
+    oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "recipes", deploydir)
 
 
 def create_package_spdx(d):
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     deploydir = Path(d.getVar("SPDXRUNTIMEDEPLOY"))
+    is_native = bb.data.inherits_class("native", d) or bb.data.inherits_class(
+        "cross", d
+    )
 
-    direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_spdx")
-
-    providers = oe.spdx_common.collect_package_providers(d, direct_deps)
+    providers = oe.spdx_common.collect_package_providers(d)
     pkg_arch = d.getVar("SSTATE_PKGARCH")
 
-    if get_is_native(d):
+    if is_native:
         return
 
     bb.build.exec_func("read_subpackage_metadata", d)
@@ -1179,15 +1169,15 @@ def write_bitbake_spdx(d):
 def collect_build_package_inputs(d, objset, build, packages, files_by_hash=None):
     import oe.sbom30
 
-    direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_spdx")
-
+    direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_package_spdx")
     providers = oe.spdx_common.collect_package_providers(d, direct_deps)
 
     build_deps = set()
+    missing_providers = set()
 
     for name in sorted(packages.keys()):
         if name not in providers:
-            bb.note(f"Unable to find SPDX provider for '{name}'")
+            missing_providers.add(name)
             continue
 
         pkg_name, pkg_hashfn = providers[name]
@@ -1206,6 +1196,11 @@ def collect_build_package_inputs(d, objset, build, packages, files_by_hash=None)
             for h, f in pkg_objset.by_sha256_hash.items():
                 files_by_hash.setdefault(h, set()).update(f)
 
+    if missing_providers:
+        bb.fatal(
+            f"Unable to find SPDX provider(s) for: {', '.join(sorted(missing_providers))}"
+        )
+
     if build_deps:
         objset.new_scoped_relationship(
             [build],
@@ -1326,18 +1321,18 @@ def create_image_spdx(d):
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
@@ -1364,6 +1359,7 @@ def create_image_spdx(d):
 
                 set_timestamp_now(d, a, "builtTime")
 
+
         if artifacts:
             objset.new_scoped_relationship(
                 [image_build],
@@ -1423,6 +1419,16 @@ def create_image_sbom_spdx(d):
 
     objset, sbom = oe.sbom30.create_sbom(d, image_name, root_elements)
 
+    # Set supplier on root elements if SPDX_IMAGE_SUPPLIER is defined
+    supplier = objset.new_agent("SPDX_IMAGE_SUPPLIER", add=False)
+    if supplier is not None:
+        supplier_id = supplier if isinstance(supplier, str) else supplier._id
+        if not isinstance(supplier, str):
+            objset.add(supplier)
+        for elem in sbom.rootElement:
+            if hasattr(elem, "suppliedBy"):
+                elem.suppliedBy = supplier_id
+
     oe.sbom30.write_jsonld_doc(d, objset, spdx_path)
 
     def make_image_link(target_path, suffix):
@@ -1534,16 +1540,16 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
         d, toolchain_outputname, sorted(list(files)), [rootfs_objset]
     )
 
+    # Set supplier on root elements if SPDX_SDK_SUPPLIER is defined
+    supplier = objset.new_agent("SPDX_SDK_SUPPLIER", add=False)
+    if supplier is not None:
+        supplier_id = supplier if isinstance(supplier, str) else supplier._id
+        if not isinstance(supplier, str):
+            objset.add(supplier)
+        for elem in sbom.rootElement:
+            if hasattr(elem, "suppliedBy"):
+                elem.suppliedBy = supplier_id
+
     oe.sbom30.write_jsonld_doc(
         d, objset, sdk_deploydir / (toolchain_outputname + ".spdx.json")
     )
-
-
-def create_recipe_sbom(d, deploydir):
-    sbom_name = d.getVar("SPDX_RECIPE_SBOM_NAME")
-
-    recipe, recipe_objset = load_recipe_spdx(d)
-
-    objset, sbom = oe.sbom30.create_sbom(d, sbom_name, [recipe], [recipe_objset])
-
-    oe.sbom30.write_jsonld_doc(d, objset, deploydir / (sbom_name + ".spdx.json"))
-- 
2.53.0


