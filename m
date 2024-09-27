Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5268BCDD1C2
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 15:53:05 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.72632.1727452377058655007
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 08:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C8AAuUKi;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2689e7a941fso1253268fac.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 08:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727452376; x=1728057176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EUHNiEsnq0FRcyo4xGIj4wCxrU5oWuKetqwJTf1wEs=;
        b=C8AAuUKixGTzwAoR/TDWPBrvjI590NUMc52qPblt+rF9XSn87GTCjHwKdlGcrFT1Pr
         1tVdQMDFaWVnS4eqwDY6ftjWfzqYvSYSxdjog0nGPKgtQHZBe2VgQuHF3FRHjm/poDQ4
         fYRYvc8V62E6Th0KgNOrhvNBQG8Sb8t0dLoYy9qBNuLRRErccqqTx6maEjmPUYAiB3n4
         ZfVoI1P46H+4Jgt2LgNi53vlIjxODD2aJNdhjF4Nn8m9FgOxXl8uj7PzHJ5w7S9Z3Mvu
         mKgPszq3H4NK6ecZ/95WY6Xf/Rcnq7pCZMzL0ftbEfnvjSLndTWpvLfglp2EuFrZPAfZ
         aCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727452376; x=1728057176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7EUHNiEsnq0FRcyo4xGIj4wCxrU5oWuKetqwJTf1wEs=;
        b=fsEGZaCqd+aUkBalN/GPTOOr95KzeH/88liUc9TKOLdBz5vIxxE0pS1c8hjcnMTh7r
         tbLMUyIgifVRQR/Bvj2m5bUZjWyxxsy/gb/PauWlNZBUPvRMdCuYVWTsfO0ycALbZ5qm
         h0iQyiWPyj8QqsyeeQ5EQK3WoGxSQ19EvXSMPAagVY0l/0KqxsYpEtF2T+AUR4gYq1Ap
         HCCucUpVUfYKEEioq9mA3JXwMvtviPam2tAcbR4zrTcTXJQZtn/X44e5e/XdMHrAtK8x
         GMd1NtLCaKKA/YChgTNSZ2MIjlLFe/bb4HarJj+sto55LnlpSCvOqz9F6BPC2uenuUyv
         mHcg==
X-Gm-Message-State: AOJu0YyqLPaizLG/Cm2vfteMB1Wz3ukwZnu4zMkdAV6sRVU4EaDOw1Ra
	MI/wIygj9jBPQZj5HVdlBXByptDfVZbwVNsYyAeAwJFyhb4J6O7wgOf2kA==
X-Google-Smtp-Source: AGHT+IEYCFjRPHIPZ7krXbCsIx1TophEBb2srwx3fM8cCTpyKsol9oSPuZEqTHvmAbS4b9gcadXZ1Q==
X-Received: by 2002:a05:6870:d3c7:b0:27c:52a1:f2fd with SMTP id 586e51a60fabf-28710bd282amr2941487fac.37.1727452375578;
        Fri, 27 Sep 2024 08:52:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::8a23])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2870f778f1bsm698589fac.1.2024.09.27.08.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 08:52:54 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 1/4] spdx 3.0: Find local sources when searching for debug sources
Date: Fri, 27 Sep 2024 09:51:54 -0600
Message-ID: <20240927155247.1012846-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240927155247.1012846-1-JPEWhacker@gmail.com>
References: <20240927155247.1012846-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 15:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205031

Include the local files when searching for matching debug sources

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 59 ++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 27 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 6a2858c6654..70d1bc7e8ae 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -119,7 +119,9 @@ def add_license_expression(d, objset, license_expression, license_data):
     )
     spdx_license_expression = " ".join(convert(l) for l in lic_split)
 
-    return objset.new_license_expression(spdx_license_expression, license_data, license_text_map)
+    return objset.new_license_expression(
+        spdx_license_expression, license_data, license_text_map
+    )
 
 
 def add_package_files(
@@ -202,6 +204,7 @@ def get_package_sources_from_debug(
         return False
 
     debug_search_paths = [
+        Path(d.getVar("SPDXWORK")),
         Path(d.getVar("PKGD")),
         Path(d.getVar("STAGING_DIR_TARGET")),
         Path(d.getVar("STAGING_DIR_NATIVE")),
@@ -286,8 +289,24 @@ def collect_dep_objsets(d, build):
     return dep_objsets, dep_builds
 
 
-def collect_dep_sources(dep_objsets):
-    sources = {}
+def index_sources_by_hash(sources, dest):
+    for s in sources:
+        if not isinstance(s, oe.spdx30.software_File):
+            continue
+
+        if s.software_primaryPurpose != oe.spdx30.software_SoftwarePurpose.source:
+            continue
+
+        for v in s.verifiedUsing:
+            if v.algorithm == oe.spdx30.HashAlgorithm.sha256:
+                if not v.hashValue in dest:
+                    dest[v.hashValue] = s
+                break
+        else:
+            bb.fatal(f"No SHA256 found for {s.name}")
+
+
+def collect_dep_sources(dep_objsets, dest):
     for objset in dep_objsets:
         # Don't collect sources from native recipes as they
         # match non-native sources also.
@@ -307,26 +326,7 @@ def collect_dep_sources(dep_objsets):
             if e.relationshipType != oe.spdx30.RelationshipType.hasInputs:
                 continue
 
-            for to in e.to:
-                if not isinstance(to, oe.spdx30.software_File):
-                    continue
-
-                if (
-                    to.software_primaryPurpose
-                    != oe.spdx30.software_SoftwarePurpose.source
-                ):
-                    continue
-
-                for v in to.verifiedUsing:
-                    if v.algorithm == oe.spdx30.HashAlgorithm.sha256:
-                        sources[v.hashValue] = to
-                        break
-                else:
-                    bb.fatal(
-                        "No SHA256 found for %s in %s" % (to.name, objset.doc.name)
-                    )
-
-    return sources
+            index_sources_by_hash(e.to, dest)
 
 
 def add_download_files(d, objset):
@@ -511,18 +511,21 @@ def create_spdx(d):
     source_files = add_download_files(d, build_objset)
     build_inputs |= source_files
 
-    recipe_spdx_license = add_license_expression(d, build_objset, d.getVar("LICENSE"), license_data)
+    recipe_spdx_license = add_license_expression(
+        d, build_objset, d.getVar("LICENSE"), license_data
+    )
     build_objset.new_relationship(
         source_files,
         oe.spdx30.RelationshipType.hasConcludedLicense,
         [recipe_spdx_license],
     )
 
+    dep_sources = {}
     if oe.spdx_common.process_sources(d) and include_sources:
         bb.debug(1, "Adding source files to SPDX")
         oe.spdx_common.get_patched_src(d)
 
-        build_inputs |= add_package_files(
+        files = add_package_files(
             d,
             build_objset,
             spdx_workdir,
@@ -535,6 +538,8 @@ def create_spdx(d):
             ignore_top_level_dirs=["temp"],
             archive=None,
         )
+        build_inputs |= files
+        index_sources_by_hash(files, dep_sources)
 
     dep_objsets, dep_builds = collect_dep_objsets(d, build)
     if dep_builds:
@@ -555,7 +560,7 @@ def create_spdx(d):
     # TODO: Handle native recipe output
     if not is_native:
         bb.debug(1, "Collecting Dependency sources files")
-        sources = collect_dep_sources(dep_objsets)
+        collect_dep_sources(dep_objsets, dep_sources)
 
         bb.build.exec_func("read_subpackage_metadata", d)
 
@@ -726,7 +731,7 @@ def create_spdx(d):
 
             if include_sources:
                 debug_sources = get_package_sources_from_debug(
-                    d, package, package_files, sources, source_hash_cache
+                    d, package, package_files, dep_sources, source_hash_cache
                 )
                 debug_source_ids |= set(
                     oe.sbom30.get_element_link_id(d) for d in debug_sources
-- 
2.46.0


