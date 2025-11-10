Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9EACCFA1E
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 17:13:45 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1842.1762794822601520908
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 09:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X0TA9Fay;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: fbberton@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so23193315e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 09:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762794820; x=1763399620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1d+1E4EBYdTscMlyH4hoFBDRV3uJMjmWi33o7vRzKfg=;
        b=X0TA9FaymUHNG8HGU4C3gaCLiCmvkmyedOxjm1sSEw7L1ST/oGOFBJjqfsxr4rv+sL
         XbBc5zRr81eCr1wsi875Fgvr8EKcAMiX70oQA/jIe0gCShnpVsYpPIz3llR2wOksXHJt
         kFvSqXrIjKHDk3hm7T+wnpflknnu44KAdH+SNDS7r4CrDFatJ0qPFDWer0GhXzLoPS45
         esvfdiyfR0nMWLTLH8n7O6B7QfLp87aeCcM6WZGLtVVmvOymAn2N6mZPqqd4n8Yd5+Db
         FgRGoQ2xgrpo46JENcNPSMtSjAsCrGjF7SsxzoZHAHxYwalYFnKYC1+Aq33+eOKWicAz
         eeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762794821; x=1763399621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1d+1E4EBYdTscMlyH4hoFBDRV3uJMjmWi33o7vRzKfg=;
        b=vmhP6Qx0EDZIahvY7mTlxO/4egRTzpjyuNhE9zskhUYVcclFqxBebopM26R9mpF7Og
         jbNI1PGb/lBL+YE+u3w3jQcMg/EOoTHsWUnT85XsWkSYoLt8nWgEEoMsf1JNJPpiupbq
         58clJaUNMbZUamJBdp6lEocegUOrF+hQJCAovhVizYUFpzcNlF9Z727ldMHgpcwGzKZL
         dNlIzDThK19+HpTcyQJPH3QP72uRni3h5iD1qvVX+vJfgb+q3tCmf8MjoQvRZgj/yptK
         E0ndvWtEyuJTI1ouKyHsG1D0KiWqoyaZhX2rltj6z1zju2uR6I33St33hclVJeS6IlGN
         mMrQ==
X-Gm-Message-State: AOJu0YxYF6WA4bweFLq/ShnKDzqWt4QxendqM1gEDC9n3P7yKwthtcCK
	iDXGVXe88UxYKa5DIyKVZPSq/lVkKEr5rnI9CWqoovHko+Zh48/DN8ecbdmMZQ==
X-Gm-Gg: ASbGnctjTKnKJukcrnwM4TqJ1nOkIyWt/mEbOmAlEnh3xFXvsdUl2CPi41g7EX6zgZK
	fDEliyZ4FseA/2skfXry8N/HZGb03btanVUMy6Msc78E3ZXy5IrX/Cbecllw7b+iYS9BjFgXeGj
	zpVGGZe2rWU03VmMDdQo+rCcNQwyIgAKFa60LQUH8ViucJcDwKC6iUaDsAfTZgce/BkIPo1Hw1k
	hV+61vSdhnI1Oh9PfovQ2Y+gi33K+tmSTvnlBlHaliESh/DDGN08NI9yYRDNzKAAnlFrOvgYC8Q
	bUFXYBrYoaATrS4U9PURFMHdHxI1SwUmpUZFZiK+WnOssPvh7g2zKf5/kidJN0Go4i/vvReGVDJ
	Tx9nvtzQ2iJZMjxCE4ISuB0B4Vb+V0rwiPZfM0SPDDmIk+DRTQyq2VhiAefZcc3K9xvlJMnv1wd
	Zpe4Y7P0FjgiOML4Hr
X-Google-Smtp-Source: AGHT+IFVogOdTHvIyqiWRax9fOdrX03kfAZ6RigSZqXlJRMs5LmoUnXXnUCtamsoPM+C2I69nB2yAw==
X-Received: by 2002:a05:600c:4753:b0:471:16b1:b824 with SMTP id 5b1f17b1804b1-4777327e8bamr74494645e9.28.1762794820142;
        Mon, 10 Nov 2025 09:13:40 -0800 (PST)
Received: from CTW01359 ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2ee2ed31sm16461518f8f.29.2025.11.10.09.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 09:13:39 -0800 (PST)
From: Fabio Berton <fbberton@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	dwagenknecht@emlix.com
Subject: [RFC PATCH 1/1] spdx: Add software file externalRef support
Date: Mon, 10 Nov 2025 17:13:37 +0000
Message-ID: <20251110171337.754568-2-fbberton@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110171337.754568-1-fbberton@gmail.com>
References: <20251110171337.754568-1-fbberton@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 17:13:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226131

From: Fabio Berton <fabio.berton@criticaltechworks.com>

Add support for including external references in SPDX 3.0 file elements,
allowing files fetched via file:// protocol to reference their source
location via absolute path or git URL with commit hash.

Change add the following variables:

- SPDX_FILE_LOCATION variable with three options:
  * 'none' (default) - disables external references
  * 'path' - adds absolute file path as external reference
  * 'git' - generates git URL with commit hash in format
    git+https://host/repo@commit#path/to/file

- SPDX_FILE_LOCATION_REF_TYPE control the external reference type
  (defaults to 'sourceArtifact')

- SPDX_FILE_LOCATION_GIT_REMOTE to specify which git remote to use
  when constructing git URLs (defaults to 'origin')

The git URL generation requires files to be in a git repository with a
configured remote.

Signed-off-by: Fabio Berton <fabio.berton@criticaltechworks.com>
---
 meta/classes/create-spdx-3.0.bbclass | 24 +++++++
 meta/lib/oe/sbom30.py                | 14 ++++-
 meta/lib/oe/spdx30_tasks.py          | 93 ++++++++++++++++++++++++++++
 3 files changed, 130 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index a6d2d44e34..efdd1feb59 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -122,6 +122,30 @@ SPDX_PACKAGE_URL[doc] = "Provides a place for the SPDX data creator to record \
 the package URL string (in accordance with the Package URL specification) for \
 a software Package."
 
+SPDX_FILE_LOCATION ?= "none"
+SPDX_FILE_LOCATION[type] = "choice"
+SPDX_FILE_LOCATION[choices] = "none path git"
+# TODO: Type validation only works when inheriting typecheck bbclass
+
+# Available options are listed here:
+# https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Vocabularies/ExternalRefType
+SPDX_FILE_LOCATION_REF_TYPE ?= "sourceArtifact"
+
+# Use 'origin' remote as default, this option is only valid when
+# SPDX_FILE_LOCATION is set to 'git'
+SPDX_FILE_LOCATION_GIT_REMOTE ?= "origin"
+
+SPDX_FILE_LOCATION[doc] = "Controls whether and how to add external references \
+    to source files in the SPDX SBOM. Valid options are: \
+    'none' (default) - disables external references \
+    'path' - adds the absolute file path as an external reference \
+    'git' - generates Git URLs with commit hash in the format \
+    'git+https://host/repo@commit#path/to/file' using the configured remote \
+    (see SPDX_FILE_LOCATION_GIT_REMOTE). When using 'git', files must be in a \
+    git repository with a configured remote. The external reference type is \
+    controlled by SPDX_FILE_LOCATION_REF_TYPE (default 'sourceArtifact'). \
+    NOTE: Using 'path' may result in non-reproducible SPDX output."
+
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
 
diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 227ac51877..276661b81b 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+from collections import namedtuple
 from pathlib import Path
 
 import oe.spdx30
@@ -15,6 +16,9 @@ import os
 import oe.spdx_common
 from datetime import datetime, timezone
 
+# Named tuple for external reference information
+ExternalRef = namedtuple("ExternalRef", ["ref_type", "locator"])
+
 OE_SPDX_BASE = "https://rdf.openembedded.org/spdx/3.0/"
 
 VEX_VERSION = "1.0.0"
@@ -600,7 +604,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         )
         spdx_file.extension.append(OELicenseScannedExtension())
 
-    def new_file(self, _id, name, path, *, purposes=[]):
+    def new_file(self, _id, name, path, *, purposes=[], external_ref=None):
         sha256_hash = bb.utils.sha256_file(path)
 
         for f in self.by_sha256_hash.get(sha256_hash, []):
@@ -641,6 +645,14 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             spdx_file.software_primaryPurpose = purposes[0]
             spdx_file.software_additionalPurpose = purposes[1:]
 
+        if external_ref:
+            spdx_file.externalRef.append(
+                oe.spdx30.ExternalRef(
+                    externalRefType=external_ref.ref_type,
+                    locator=[external_ref.locator],
+                )
+            )
+
         spdx_file.verifiedUsing.append(
             oe.spdx30.Hash(
                 algorithm=oe.spdx30.HashAlgorithm.sha256,
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index f2f133005d..022308d235 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -357,6 +357,93 @@ def collect_dep_sources(dep_objsets, dest):
             index_sources_by_hash(e.to, dest)
 
 
+def get_git_source_url(filepath, d):
+    """
+    Constructs a git URL with commit hash for a file.
+    Returns URL in format: git+https://host/repo@commit#path/to/file
+    Uses SPDX_FILE_LOCATION_GIT_REMOTE to determine which remote to use.
+    """
+    import oe.buildcfg
+
+    filepath = os.path.abspath(filepath)
+    file_dir = os.path.dirname(filepath)
+
+    repo_root = oe.buildcfg.get_metadata_git_toplevel(file_dir)
+    if not repo_root:
+        bb.fatal(
+            f"SPDX_FILE_LOCATION is set to 'git' but file {filepath} is not in a git repository. "
+            f"Please ensure source files are in a git repository or use SPDX_FILE_LOCATION='path'."
+        )
+
+    commit_hash = oe.buildcfg.get_metadata_git_revision(repo_root)
+    if commit_hash == "<unknown>":
+        bb.fatal(
+            f"Could not determine git revision for {filepath} in repository {repo_root}."
+        )
+
+    remote = d.getVar("SPDX_FILE_LOCATION_GIT_REMOTE")
+    if not remote:
+        bb.fatal(
+            "SPDX_FILE_LOCATION_GIT_REMOTE is not set. "
+            "Please set it to a valid git remote name (e.g., 'origin', 'upstream')."
+        )
+
+    remote_url = oe.buildcfg.get_metadata_git_remote_url(repo_root, remote)
+    if not remote_url:
+        bb.fatal(
+            f"Could not determine git URL for {filepath}. No remote '{remote}' found in git repository {repo_root}. "
+            f"Please ensure the file is in a git repository with a configured remote."
+        )
+
+    rel_path = os.path.relpath(filepath, repo_root)
+
+    # Construct git URL: git+https://host/repo@commit#path/to/file
+    git_url = f"git+{remote_url}@{commit_hash}#{rel_path}"
+
+    return git_url
+
+
+def get_file_external_ref(file_path, d):
+    """
+    Creates a File External Reference based on SPDX_FILE_LOCATION setting.
+    Options are 'path' (absolute file path) or 'git' (git URL with commit hash).
+    Reference type is controlled by SPDX_FILE_LOCATION_REF_TYPE.
+    """
+    spdx_file_location = d.getVar("SPDX_FILE_LOCATION")
+
+    # If 'none', external references are disabled
+    if spdx_file_location == "none":
+        return None
+
+    # TODO: Clarify this point:
+    # This is already checked by typecheck.bbcclass. Do we need to support the
+    # use case without inheriting that class?
+    valid_choices = (d.getVarFlag("SPDX_FILE_LOCATION", "choices") or "").split()
+    if spdx_file_location not in valid_choices:
+        bb.fatal(
+            f"Invalid SPDX_FILE_LOCATION='{spdx_file_location}'. "
+            f"Must be one of: {', '.join(valid_choices)}"
+        )
+
+    ref_type = d.getVar("SPDX_FILE_LOCATION_REF_TYPE")
+    if not hasattr(oe.spdx30.ExternalRefType, ref_type):
+        bb.fatal(
+            f"Invalid SPDX_FILE_LOCATION_REF_TYPE = '{ref_type}'. "
+            f"Must be a valid ExternalRefType from SPDX 3.0 spec."
+        )
+
+    ref_type_obj = getattr(oe.spdx30.ExternalRefType, ref_type)
+
+    if spdx_file_location == "path":
+        return oe.sbom30.ExternalRef(ref_type=ref_type_obj, locator=f"{file_path}")
+    elif spdx_file_location == "git":
+        return oe.sbom30.ExternalRef(
+            ref_type=ref_type_obj, locator=get_git_source_url(file_path, d)
+        )
+
+    return None
+
+
 def add_download_files(d, objset):
     inputs = set()
 
@@ -384,6 +471,8 @@ def add_download_files(d, objset):
                             # TODO: SPDX doesn't support symlinks yet
                             continue
 
+                        external_ref = get_file_external_ref(f_path, d)
+
                         file = objset.new_file(
                             objset.new_spdxid(
                                 "source", str(download_idx + 1), str(walk_idx)
@@ -393,17 +482,21 @@ def add_download_files(d, objset):
                             ),
                             f_path,
                             purposes=[primary_purpose],
+                            external_ref=external_ref,
                         )
 
                         inputs.add(file)
                         walk_idx += 1
 
             else:
+                external_ref = get_file_external_ref(fd.localpath, d)
+
                 file = objset.new_file(
                     objset.new_spdxid("source", str(download_idx + 1)),
                     file_name,
                     fd.localpath,
                     purposes=[primary_purpose],
+                    external_ref=external_ref,
                 )
                 inputs.add(file)
 
-- 
2.51.1


