Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DDEEF9018
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:05:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23387.1772643947858991002
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:05:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IB0qrHk1;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-482f454be5bso74520055e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 09:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772643946; x=1773248746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ro/7wLFd2o+gTqRswo9jRZjGihaOdjP7jIE64/gXJhI=;
        b=IB0qrHk12RffEyi+5mcDRu6L17vT6GP5THzb43Awn2O50H6cq/Dbl8qu1ZWhCtB8r9
         IEycV45tvBQshLdluU4Dp4kJ+8/ZaBQ5rgijSNcHOx4Ovq3rV0jEqc6Ql5k2lv/PsaxN
         eGtsnZrnvAL4yAK1pBFx2ZFdRqDs5MvYXeL6Ycc/lB+HuRBrR24rB7vPVZ4t6PbPU7cN
         zHw0ActHL5KcDrSsoCtXfV1ol3F4g0noK25HC6cF16xBfobAOH/8w4UnPsS0YIALulNc
         Xn8PhFp4cwnKs7L6lhmZ4chfWdSRhnexgTajj4TCPWL2gPdWraxMzUIJJAy3Y7AKps03
         aZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643946; x=1773248746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ro/7wLFd2o+gTqRswo9jRZjGihaOdjP7jIE64/gXJhI=;
        b=RfuZXvT/WQFcSI5Kb6ZjoxGoCc9dvXUwn/DqSatjlTa1CsAnXdXf9dNpvpFPglZNOR
         2LFNnBdXRxTZycaSYhp44Vk8+5feIBUQGqhCx1Hv2d/qLg8a94iGdXj4n7/DbLRprzRc
         VjN42cxRfGuXDaFGL2TfazYF5ihqBhGh9D1h/Iz8U3vwMz8jQEP7RVzzfSWbYJHHARs+
         fkJdZH7BmtCpjjE+cySu+OcG5f/7P0jrGXsBicUG/CimfUNgHECE8Sq6nN/cj/UH0WPX
         bRkxiU8xTvEYOJuC/MHS3rBDDtlTPF9O8kputH2e7cFUCFATeQmxTvL2+g943vDQ9zWB
         h7UA==
X-Gm-Message-State: AOJu0YyUH9C1oWxiYSNYCVPqoxLkRfEETyqfVhF5b26V2I4BDcQu8RUr
	34iylxDIrKlK30g24Bu1/Np/T5xphLEE8VZbP3ZdnlCu3IJtHEL0mP2QEOL4Gw==
X-Gm-Gg: ATEYQzwWQ1KfYGwLoO75vWvcKec0lTXd8ItObC/BXB7D0cKhjciKoa497PWllxJd2g1
	KxG/lDGPw+Xp0MxiszpxaoAwNQ1ElIq/c5xuUvUydYHJeQcR2+65z0D1YfgHPkRMz5tvaQOe3Hg
	UYXL4F66U0NWhupMb9VD39ECzTXbBaCQPFJpZFKOEwqLL77p638ewhhqi5/F/AdZHqw5sXYHRC0
	wVciBAACbst385SO/gOqn1tsMraK+ol3ewnmKHvzWWIicA0xz4roeGHo+GMle+FMqbSWsOMTlfU
	LvWgTss+6kvUh5074fkGhtiHoknjLt4mBanbasxHkyGUKV8mdUSGHn09H91PsuJ7qta6cNEvrrz
	Vsx/sWpDgGTBiDgDs0ZbJh+YGkH2SxW0MmQ2JwlRyEpBCtTxId1fnbKc9IHxtzh9cPTPF7XyOK5
	al/45bjx/x2GXc9jSRm7/ulpo=
X-Received: by 2002:a05:600c:34c4:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-485198d1184mr44227265e9.13.1772643945580;
        Wed, 04 Mar 2026 09:05:45 -0800 (PST)
Received: from fedora ([165.225.94.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188914ddsm78557395e9.12.2026.03.04.09.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:05:44 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v6 01/10] spdx30: Add configurable file filtering support
Date: Wed,  4 Mar 2026 18:05:32 +0100
Message-ID: <20260304170541.180868-2-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
 <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232404

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


