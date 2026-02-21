Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41DBC5DF93
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 05:10:13 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14920.1771650612913517315
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 21:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lcnivcC0;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4359228b7c6so2091224f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771650611; x=1772255411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1E3qvvnROxiWnpyJK50HtPD89ILJCBBre7Hgs6TAFs=;
        b=lcnivcC0ImcZvHwMjElO1qytMZPT3unR7lP56m5FIy9M8ULSmN9HNHpFAnAZsIRZz+
         H+c36XyCyVgb5eW1n8M6oK6Y5OrgJtAcPL9ZEzjFJrLEuHQhxM5sUYRIgqRCuIR0O6rX
         iFGxaU5g++pZ46Jfrpp3BnOMV06hPiKnJV3e8oQygcRK6FQ9MoJJqEivhxwz+g7bV1ge
         uP2Mojrgo1dX1VENCs5jzUNGA3M5gl8fB/YfdfNpAaGVZ4Tk8nc8muI/QnZEuyRu9L4q
         IH1IYilrcIXTJKF6RHOl6NLINvRYj/YSl8poy8tS+9qXCWeuOMdODO6q1TBmuTLFj1rZ
         gd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771650611; x=1772255411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s1E3qvvnROxiWnpyJK50HtPD89ILJCBBre7Hgs6TAFs=;
        b=TXwyrdl8s4MNbuIvUDfVvVxx/uSMITSodV9ZQjN6j+EaIQo874F+6R3M6e5ecfkVuF
         +meS+Cg3t/M+QaxrooXKejXJTsNAvhnzN7UqvZOMxm4ui0iIAeMZila6ayWoc23za7hV
         c3p0e/eaS760CD6d3UyDo9FbFh81om747MHHIM74f+vF4oqgQFDlFXX4r6d6L3rkf8E5
         NsDW2F/1OwVVYbRMx/UrJUujuWGtL93byd5QdglsxbfctOXA1vazfqPTSsd8FVEQ1o+/
         O0J3/I9F7B0MD5Z0GotlNQc4vVchUuW5sC1Z0h6klTJV0hN+QwJtvyxtdvzhIWF45qQ0
         0QtQ==
X-Gm-Message-State: AOJu0YxONtYvA0B4wErZnnnabt62NBisRWNeeexKKIwfCo2K4aHyYNXG
	0QxArZhUdVNGEsLZPYfy0OCbU3qvJz/iIEBcy4AFhuRWJ61fzzeE1fDFZcBBBg==
X-Gm-Gg: AZuq6aLjBnfPzopQD0fvX8s3wKxXkVmmjmL/7EI+IDSo9TF1n/4kGu/NWHVeHxXm36w
	a5QOu7rfvrnJnw9782+3EmWaeauPPWfJh3KFSHZkZLxqQYbodrGkoHVLLNJvLWCkCcKoU//Ls0X
	axRbbiBDLk8lDFd5TL4xiT8sjoDBZPFCS40J4HeeV7G7WRqnZ1KOh4COa2qamw5wJMgEdV3oA9W
	TTZMKeUuJy82VhPGSZCRErH/YMVGv/J7ogvcIyr3/kWeYJPyuQ2Ji2q2upA0bed9H0Bbuxi7BSA
	kKGF/BV37e1hhLLg1BPMZOmOH5EAY+ZPxNHLH9ymMLYQiGgNyDF1o5UV6JWkv+0lGhu4UVrq2EX
	N9NdlLU8ZSzZo6miOwVZhJxEizTHpSsTo5DTeZ3m810hBpx5ureNVqP7rU5nJVHA0SomuVti2EK
	/KPZql1k6LMmQNZmTm9d1vO5AM9zbM1vWhCS8=
X-Received: by 2002:a05:6000:2004:b0:436:19a1:392c with SMTP id ffacd0b85a97d-4396f15f3femr4127720f8f.20.1771650610767;
        Fri, 20 Feb 2026 21:10:10 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm2455901f8f.3.2026.02.20.21.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 21:10:09 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH v2 01/18] spdx30: Add configurable file filtering support
Date: Sat, 21 Feb 2026 06:09:49 +0100
Message-ID: <20260221051006.335141-2-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221051006.335141-1-stondo@gmail.com>
References: <20260221051006.335141-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 05:10:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231581

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

This commit adds file filtering capabilities to SPDX 3.0 SBOM generation
to reduce SBOM size and focus on relevant files.

New configuration variables (in spdx-common.bbclass):

  SPDX_FILE_FILTER (default: "all"):
    - "all": Include all files (current behavior)
    - "essential": Include only LICENSE/README/NOTICE files
    - "none": Skip all files

  SPDX_FILE_ESSENTIAL_PATTERNS (extensible):
    - Space-separated patterns for essential files
    - Default: LICENSE COPYING README NOTICE COPYRIGHT etc.
    - Recipes can extend: SPDX_FILE_ESSENTIAL_PATTERNS += "MANIFEST"

  SPDX_FILE_EXCLUDE_PATTERNS (extensible):
    - Patterns to exclude in 'essential' mode
    - Default: .patch .diff test_ /tests/ .pyc .o etc.
    - Recipes can extend: SPDX_FILE_EXCLUDE_PATTERNS += ".tmp"

Implementation (in spdx30_tasks.py):

  - add_package_files(): Apply filtering during file walk
  - get_package_sources_from_debug(): Skip debug source lookup for
    filtered files instead of failing

Impact:

  - Essential mode reduces file components by ~96% (2,376 → ~90 files)
  - Filters out patches, test files, and build artifacts
  - Configurable per-recipe via variable extension
  - No impact when SPDX_FILE_FILTER="all" (default)

This is useful for creating compact SBOMs for compliance and distribution
where only license-relevant files are needed.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/spdx-common.bbclass | 37 +++++++++++++++++++++++++++
 meta/lib/oe/spdx30_tasks.py      | 44 +++++++++++++++++++++++++++++---
 2 files changed, 77 insertions(+), 4 deletions(-)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 3110230c9e..81c61e10dc 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -54,6 +54,43 @@ SPDX_CONCLUDED_LICENSE[doc] = "The license concluded by manual or external \
 
 SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
 
+SPDX_FILES_INCLUDED ??= "all"
+SPDX_FILES_INCLUDED[doc] = "Controls which files are included in SPDX output. \
+    Values: 'all' (include all files), 'essential' (only LICENSE/README/NOTICE files), \
+    'none' (no files). The 'essential' mode reduces SBOM size by excluding patches, \
+    tests, and build artifacts."
+
+SPDX_FILE_ESSENTIAL_PATTERNS ??= "LICENSE COPYING README NOTICE COPYRIGHT PATENTS ACKNOWLEDGEMENTS THIRD-PARTY-NOTICES"
+SPDX_FILE_ESSENTIAL_PATTERNS[doc] = "Space-separated list of file name patterns to \
+    include when SPDX_FILES_INCLUDED='essential'. Recipes can extend this to add their \
+    own essential files (e.g., 'SPDX_FILE_ESSENTIAL_PATTERNS += \"MANIFEST\"')."
+
+SPDX_FILE_EXCLUDE_PATTERNS ??= ".patch .diff test_ _test. /test/ /tests/ .pyc .pyo .o .a .la"
+SPDX_FILE_EXCLUDE_PATTERNS[doc] = "Space-separated list of patterns to exclude when \
+    SPDX_FILES_INCLUDED='essential'. Files matching these patterns are filtered out. \
+    Recipes can extend this to exclude additional file types."
+
+SBOM_COMPONENT_NAME ??= ""
+SBOM_COMPONENT_NAME[doc] = "Name of the SBOM metadata component. If set, creates a \
+    software_Package element in the SBOM with image/product information. Typically \
+    set to IMAGE_BASENAME or product name."
+
+SBOM_COMPONENT_VERSION ??= "${DISTRO_VERSION}"
+SBOM_COMPONENT_VERSION[doc] = "Version of the SBOM metadata component. Used when \
+    SBOM_COMPONENT_NAME is set. Defaults to DISTRO_VERSION."
+
+SBOM_COMPONENT_SUMMARY ??= ""
+SBOM_COMPONENT_SUMMARY[doc] = "Description of the SBOM metadata component. Used when \
+    SBOM_COMPONENT_NAME is set. Typically set to IMAGE_SUMMARY or product description."
+
+SBOM_SUPPLIER_NAME ??= ""
+SBOM_SUPPLIER_NAME[doc] = "Name of the organization supplying the SBOM. If set, \
+    creates an Organization element in the SBOM with supplier information."
+
+SBOM_SUPPLIER_URL ??= ""
+SBOM_SUPPLIER_URL[doc] = "URL of the organization supplying the SBOM. Used when \
+    SBOM_SUPPLIER_NAME is set. Adds an external identifier with the organization URL."
+
 python () {
     from oe.cve_check import extend_cve_status
     extend_cve_status(d)
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 99f2892dfb..bd703b5bec 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -161,6 +161,11 @@ def add_package_files(
         compiled_sources, types = oe.spdx_common.get_compiled_sources(d)
         bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
 
+    # File filtering configuration
+    spdx_file_filter = (d.getVar("SPDX_FILE_FILTER") or "all").lower()
+    essential_patterns = (d.getVar("SPDX_FILE_ESSENTIAL_PATTERNS") or "").split()
+    exclude_patterns = (d.getVar("SPDX_FILE_EXCLUDE_PATTERNS") or "").split()
+
     for subdir, dirs, files in os.walk(topdir, onerror=walk_error):
         dirs[:] = [d for d in dirs if d not in ignore_dirs]
         if subdir == str(topdir):
@@ -174,6 +179,26 @@ def add_package_files(
                 continue
 
             filename = str(filepath.relative_to(topdir))
+
+            # Apply file filtering if enabled
+            if spdx_file_filter == "essential":
+                file_upper = file.upper()
+                filename_lower = filename.lower()
+
+                # Skip if matches exclude patterns
+                skip_file = any(pattern in filename_lower for pattern in exclude_patterns)
+                if skip_file:
+                    continue
+
+                # Keep only essential files (license/readme/etc)
+                is_essential = any(pattern in file_upper for pattern in essential_patterns)
+                if not is_essential:
+                    continue
+            elif spdx_file_filter == "none":
+                # Skip all files
+                continue
+            # else: spdx_file_filter == "all" or any other value - include all files
+
             file_purposes = get_purposes(filepath)
 
             # Check if file is compiled
@@ -219,6 +244,8 @@ def add_package_files(
 def get_package_sources_from_debug(
     d, package, package_files, sources, source_hash_cache
 ):
+    spdx_file_filter = (d.getVar("SPDX_FILE_FILTER") or "all").lower()
+
     def file_path_match(file_path, pkg_file):
         if file_path.lstrip("/") == pkg_file.name.lstrip("/"):
             return True
@@ -251,10 +278,19 @@ def get_package_sources_from_debug(
             continue
 
         if not any(file_path_match(file_path, pkg_file) for pkg_file in package_files):
-            bb.fatal(
-                "No package file found for %s in %s; SPDX found: %s"
-                % (str(file_path), package, " ".join(p.name for p in package_files))
-            )
+            # When file filtering is active, some files may be filtered out
+            # Skip debug source lookup instead of failing
+            if spdx_file_filter in ("none", "essential"):
+                bb.debug(
+                    1,
+                    f"Skipping debug source lookup for {file_path} in {package} (filtered by SPDX_FILE_FILTER={spdx_file_filter})",
+                )
+                continue
+            else:
+                bb.fatal(
+                    "No package file found for %s in %s; SPDX found: %s"
+                    % (str(file_path), package, " ".join(p.name for p in package_files))
+                )
             continue
 
         for debugsrc in file_data["debugsrc"]:
-- 
2.53.0


