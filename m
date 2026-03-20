Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75F4108B91C
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 16:50:05 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17793.1774025399248973155
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 09:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UnGQZhlj;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso6675635e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 09:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774025397; x=1774630197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iw9KMhneNLxFC5Oi4hbEI3PniGR7wgbL42SCaPNNwIk=;
        b=UnGQZhljmKWfV8DCZCghHZPlTORv/aAHWTZAYcBm9VHcBGOxhXe6l3LBX49GywYv0G
         mBg1on0T/0OdCJgX0NG3X8pQtm3ddK/bbgTWjyNp8YRgFMqaY540VOo0KHQYAXnh/hiT
         /SQEObMItXGLthCC0JYIYO4DghKyZcCpZI0aJIjTbC84vKlNm/3D3ng6ydp7WAoFeHt3
         iFDG+1Jh1RxCA5buwJy45ywVfk9+SF2rfGDYbnDytoEBIGIkrdSf/XlOAM54hoFHqZA8
         wva4AgtSKuG1TVS4owBytPzmjSPp1le2/2aPTZDJ3qB6VqgfbQiVOcAf8ZjH3MThHanM
         29+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774025397; x=1774630197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iw9KMhneNLxFC5Oi4hbEI3PniGR7wgbL42SCaPNNwIk=;
        b=Ir2siG1K/9z3OKRIDurmDR5fjmwIShmQfh2whZMinAe4B4Y5JAZBbleCryjcSYjb++
         qsuO3AhUBKCLNQBa0e15ee9tw3EjM65bpqFJ0f2g4JBCyqYa1oIhDZIK054vNHIZp7bX
         Qt5ezgs1C9pGrZbVA1Z1IEIU+8E4tmwBGnR3b5346wwHQXeAkopEfdOieq6edvzPhM7d
         nEhTLVsT2zj8ZUO7DcDKyf/JtPRfE1XWR1kx9Th78Pct1Yz+u/INJPJGVKeHwFrK8zgt
         2uG6XIaOKSKdhZV0VvncTmVkn/bteASZmQnKCCYNh/miP+O2Uxl9i+O6DLrLzvMD297e
         d8qA==
X-Gm-Message-State: AOJu0YxfJDtgRsa92x7PAb47E7YdB2jC//TEyQIUdroBgbeAkwKv59jh
	l6ClJUA0XQY/luBz0GFFmMsx6lGrj+umBO2QBeWxwnOvW2DjN8ir6VnQKMw8ZoJs
X-Gm-Gg: ATEYQzzvJ1bhZZc7xYrpzUlhfF0LVQ3kpYV/GZALdE3daY8pIf8jABRBHF11OPrl993
	6j6tuAvntFLzG2klMTfIef/XaC+1K2lBNKTgSYjWqTNd95aZaMB3IEROSneDEbDiDBUoszD0DYB
	Gq47mF9oZPnhTimCotAFcxr34PYQmhusr+wmQv3MI1cTZUbjwIfgqH50ivxtAASs7xFGGYk2BpB
	J+bX+h9SWGce9BkTES8BUSnDZKJ2E+tEiPLPO7GfjRaasl9DfsRAH5Fra/KbEy1LenZFOMVQA+g
	SdwsgbXXZnHo4StGWJuf1Iq4S4TBCL9WLYjIXI24jiPg5rxvyCXglUUMOZMISjQ69JjTo4vfU8x
	BlITCd9C4T+HUPQO+1tMJW0RyR7pUjNk8yPLqDbxnpOIEaPC/JHhieMzqA+3LubGMaomKwB6NkD
	nlKuqC5+diAmnHkSEiwWV50EiGed+pKRfcNmc=
X-Received: by 2002:a05:600c:c84:b0:485:39d1:b500 with SMTP id 5b1f17b1804b1-486fee0d859mr54370205e9.16.1774025397192;
        Fri, 20 Mar 2026 09:49:57 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d91fbsm73018905e9.3.2026.03.20.09.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:49:56 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	richard.purdie@linuxfoundation.org,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [OE-core][PATCH v10 4/7] spdx30: Enrich source downloads with version and PURL
Date: Fri, 20 Mar 2026 17:49:48 +0100
Message-ID: <20260320164951.128572-5-stondo@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233624

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add version extraction, PURL generation, and external references
to source download packages in SPDX 3.0 SBOMs:

- Extract version from SRCREV for Git sources (full SHA-1)
- Generate PURLs for Git sources on github.com by default
- Support custom mappings via SPDX_GIT_PURL_MAPPINGS variable
  (format: "domain:purl_type", split(':', 1) for parsing)
- Use ecosystem PURLs from SPDX_PACKAGE_URLS for non-Git
- Add VCS external references for Git downloads
- Add distribution external references for tarball downloads
- Parse Git URLs using urllib.parse
- Extract logic into _generate_git_purl() and
  _enrich_source_package() helpers

For non-Git sources, version is not set from PV since the recipe
version does not necessarily reflect the version of individual
downloaded files. Ecosystem PURLs (which include version) from
SPDX_PACKAGE_URLS are still used when available.

The SPDX_GIT_PURL_MAPPINGS variable allows configuring PURL
generation for self-hosted Git services (e.g., GitLab).
github.com is always mapped to pkg:github by default.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/create-spdx-3.0.bbclass |   7 ++
 meta/lib/oe/spdx30_tasks.py          | 117 +++++++++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index def2dacbc3..9e912b34e1 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -152,6 +152,13 @@ SPDX_PACKAGE_URLS[doc] = "A space separated list of Package URLs (purls) for \
     Override this variable to replace the default, otherwise append or prepend \
     to add additional purls."
 
+SPDX_GIT_PURL_MAPPINGS ??= ""
+SPDX_GIT_PURL_MAPPINGS[doc] = "A space separated list of domain:purl_type \
+    mappings to configure PURL generation for Git source downloads. \
+    For example, "gitlab.example.com:pkg:gitlab" maps repositories hosted \
+    on gitlab.example.com to the pkg:gitlab PURL type. \
+    github.com is always mapped to pkg:github by default."
+
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 8aaafea616..5639137520 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -14,6 +14,7 @@ import oe.spdx_common
 import oe.sdk
 import os
 import re
+import urllib.parse
 
 from contextlib import contextmanager
 from datetime import datetime, timezone
@@ -378,6 +379,120 @@ def collect_dep_sources(dep_objsets, dest):
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
 
@@ -441,6 +556,8 @@ def add_download_files(d, objset):
                 )
             )
 
+            _enrich_source_package(d, dl, fd, file_name, primary_purpose)
+
             if fd.method.supports_checksum(fd):
                 # TODO Need something better than hard coding this
                 for checksum_id in ["sha256", "sha1"]:
-- 
2.53.0


