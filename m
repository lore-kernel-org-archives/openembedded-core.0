Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86297F3C259
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:29:16 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14153.1773062951218477930
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 06:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q/ClX782;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: stondo@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7982c3b7dfcso116513717b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 06:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773062950; x=1773667750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsaWMu3Oduo4+4VMiqWAmX+9Nd2zMtlvUNRCVbb+pOc=;
        b=Q/ClX782cVHp2r+Gc/4cqUypndMP80alPjqq+Dwa+9seh+xh5KwcCqVQYtlaAdgGF1
         pvN+sD/2SupVsLRHWx5GGQ/EL4DMP+6LBccLjq5ji97uSm0w3pOL0LGl4LoARZEVe/0g
         Os0aXzDXwhZpHSZbI78tshQftZL+h2Z4B3O8zQ2V+qBuvK+DC51IP91KWX95A+X6L34Z
         BFKHik+eg7PvweyGiMNwsz2Lyqkta8+2Xo6qadcYwYq2qb11h6Mslq628TZPbiu6Iivn
         ugWBBZ/CS5hP4J0HuYjBb4QKw0aLu81+/FnoPHYD4hTPvDdj3tBqi+ZBY2TZbBFhhc3q
         yk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773062950; x=1773667750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IsaWMu3Oduo4+4VMiqWAmX+9Nd2zMtlvUNRCVbb+pOc=;
        b=F2i7xJzb+8AC4XqODI7FBM/teSEgJ7dGqUX5YeDjBAkukluK/gtiIpfT9NPr1HSHDq
         JLepbE1Q+aQcqn74EbfI5Ycz9CUzXbuMyNjQNVGTdc7wpTLxs6ySY5HQnibyAJ0zaZkp
         Kveb1dnvWu/nspexqjuyYfUCPJo9IqTAHoMtSV4zIQZHDKec7/Yno5U2P+ST8rAm+PF5
         HdSbrz0Rw7yNe4jNeP20EkyO9QAq89hVvNGZpGwZQ3sy/gTsTZv908WiLCJgIY0A8Ih+
         A0yNZdMIMVsv0myucIFw/uMg9X/kOclL0OwgpjgLe4yBgJJQ9cBQEg7BEAUMEnRCwC7b
         LLzQ==
X-Gm-Message-State: AOJu0Ywb1vXHPtC77J5PBP4k+dk9+XZ0e20MHaxQ/ORw7RPpth3f3PXD
	pQD7/HWCSBEHVoW/EuCUqbRY1pgcEsAmaAITb2ileOUXFWUXnuvkUjVloYdZnw==
X-Gm-Gg: ATEYQzxxs27ziJa7uAEwkJ2NwWvymdU/I5lIxPnZxseZvNW/cF/iYMjDfjAlrHA5k0x
	CSUTEyi682jpcgJWatUMUD2Py+FF7dGl7WzsFp0LmSf0Wdxhl8UO/1ldXJ1XmqttwWQLC7Jw1yg
	f8G7aMX0T4V2z3pCe73cJb4Nno4yHaBFGKjz4tgm/dXLPPZqLAk89P+9TF2VWLwgqiRhXvzXuNq
	RBcIdDKmwo4k6xoFJ4RSHqgjBtr+JFlxfkOgw5Kk10uA0aaZVW+KOERLAQPxomMa7a3GDgT4v5L
	Yh6pqDIe+uytJ9TYPTgn+Ah+IzX1hWhROHgX+5OV4qxQMT3d4S71wn2UYeGS/LqxVMdOEJNtCvR
	b6aOZiJ9L5gxjwbjh4yHtqCRODH61VXKKlkQ+ljcrVCKLhodj8UaGe91FlSl4cYKJUykSamxmcv
	1XpsRUsKURbTC6iB8vzo+K9dAtYBmJkVnU/OCk8Tt9ba4/m9+vt9Ei+iqu9GA4Q7fR7D2oFFPqm
	W+RrQP0
X-Received: by 2002:a05:690c:730a:b0:798:6d21:be0f with SMTP id 00721157ae682-798dd756e16mr106215617b3.41.1773062950084;
        Mon, 09 Mar 2026 06:29:10 -0700 (PDT)
Received: from fedora (mob-194-230-161-149.cgn.sunrise.net. [194.230.161.149])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798dee6afd5sm44299437b3.45.2026.03.09.06.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:29:09 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [OE-core][PATCH v8 1/7] spdx30: Add configurable file exclusion pattern support
Date: Mon,  9 Mar 2026 14:28:48 +0100
Message-ID: <20260309132854.128375-2-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309132854.128375-1-stondo@gmail.com>
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
 <20260309132854.128375-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 13:29:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232710

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add SPDX_FILE_EXCLUDE_PATTERNS variable that allows filtering files from
SPDX output by pattern matching. The variable accepts a space-separated
list of patterns; files whose paths contain any pattern are excluded.

When empty (the default), no filtering is applied and all files are
included, preserving existing behavior.

This enables users to reduce SBOM size by excluding files that are not
relevant for compliance (e.g., test files, object files, patches).

When file exclusion is active, debug source lookups that reference
filtered files are gracefully skipped instead of causing fatal errors.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/spdx-common.bbclass |  6 ++++++
 meta/lib/oe/spdx30_tasks.py      | 28 ++++++++++++++++++++++++----
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 3110230c9e..f54459d3b4 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -54,6 +54,12 @@ SPDX_CONCLUDED_LICENSE[doc] = "The license concluded by manual or external \
 
 SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
 
+SPDX_FILE_EXCLUDE_PATTERNS ??= ""
+SPDX_FILE_EXCLUDE_PATTERNS[doc] = "Space-separated list of patterns to exclude \
+    from SPDX file output. Files whose paths contain any of these patterns will \
+    be filtered out. Defaults to empty (no filtering). Example: \
+    SPDX_FILE_EXCLUDE_PATTERNS = '.patch .diff /test/ .pyc .o'"
+
 python () {
     from oe.cve_check import extend_cve_status
     extend_cve_status(d)
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 99f2892dfb..5ced792d71 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -161,6 +161,9 @@ def add_package_files(
         compiled_sources, types = oe.spdx_common.get_compiled_sources(d)
         bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
 
+    # File exclusion filtering
+    exclude_patterns = (d.getVar("SPDX_FILE_EXCLUDE_PATTERNS") or "").split()
+
     for subdir, dirs, files in os.walk(topdir, onerror=walk_error):
         dirs[:] = [d for d in dirs if d not in ignore_dirs]
         if subdir == str(topdir):
@@ -174,6 +177,13 @@ def add_package_files(
                 continue
 
             filename = str(filepath.relative_to(topdir))
+
+            # Apply file exclusion filtering
+            if exclude_patterns:
+                filename_lower = filename.lower()
+                if any(pattern in filename_lower for pattern in exclude_patterns):
+                    continue
+
             file_purposes = get_purposes(filepath)
 
             # Check if file is compiled
@@ -219,6 +229,8 @@ def add_package_files(
 def get_package_sources_from_debug(
     d, package, package_files, sources, source_hash_cache
 ):
+    exclude_patterns = (d.getVar("SPDX_FILE_EXCLUDE_PATTERNS") or "").split()
+
     def file_path_match(file_path, pkg_file):
         if file_path.lstrip("/") == pkg_file.name.lstrip("/"):
             return True
@@ -251,10 +263,18 @@ def get_package_sources_from_debug(
             continue
 
         if not any(file_path_match(file_path, pkg_file) for pkg_file in package_files):
-            bb.fatal(
-                "No package file found for %s in %s; SPDX found: %s"
-                % (str(file_path), package, " ".join(p.name for p in package_files))
-            )
+            # When file exclusion patterns are active, some files may be filtered out
+            if exclude_patterns:
+                bb.debug(
+                    1,
+                    f"Skipping debug source lookup for {file_path} in {package} (file exclusion active)",
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


