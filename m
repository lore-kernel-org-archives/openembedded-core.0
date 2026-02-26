Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334D4FD461F
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:18:50 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68799.1772108322776305533
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:18:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M2ukZ7q+;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48375f1defeso5842525e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 04:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772108320; x=1772713120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr3tBCMRedbRAAB7SLF8wFLFU8YidxfCGxe08zmH32U=;
        b=M2ukZ7q+GszC0P8cNAVJ7AgIWpwLMHnHDQOUfam/Rh1vyMSkcHA2lY7pWCp03Z1kdq
         HKXSVtQNUV7vx5MEILFSDz35K9TVhRBgxb0KgC3vWeqXypUlcw8XReE6LzHAhuKZocUI
         iGd2JuO1QrRg9BmvyTHHTeLqcMXATugddEre+pUnR9gin1pwsBD99D8bHMv2Prbl4mAE
         yyHgJgWvImEEDZ+ujK+/ra0EosTgialElg04i2/bESKURnTFuchK1bHFz+AzbkikvVgs
         DWSHQUimtNH4D4w0GCBKMSkccZkI/Mt+RC38TLUy1HfTXqeMNV9wnB20Ryqbr7Oywg7L
         m7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772108320; x=1772713120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gr3tBCMRedbRAAB7SLF8wFLFU8YidxfCGxe08zmH32U=;
        b=PEkjbFY43yvh/iWB5/dj7ztvxj5q3DwzTboqnq0JHDx5VG6MPPNzexekRl2SJAB4rj
         aSqrfsnJp7dKfPC5ZiPISBzsUddq/jkG6jyXsC9w7GZmNAvbexykGyfAgaJqgS2nVtri
         BVJPXxvUjOsnBxqBhhnRURkaQJ2JMUXSVyMJAD9+cgHjLgxf+tudPmTkoJwcd3qhMbW+
         LtxhUF9DWSrBUFv8gi09cQHOTP039+zMIKLtQXkr9SACewxrgszVkupEykXzaPcmm7kf
         BOZAJtoqSF/z97PJTyLs/YnfeSSjXdHDJdjZiK9yubvvPGJ5GKhEiwprHNbosNJazB06
         pVoQ==
X-Gm-Message-State: AOJu0Yw76Q2fE/UH6QyME4QqGhHGpA/+IhBrisyCpNqorqIdfX6JD5fP
	SJKgG8ijx/Uy5J6kZmlSOBkA7nVnts48IWYj3L+5nj0bV0bi36N+VzPMp9jGjg==
X-Gm-Gg: ATEYQzwLQeLCw2BJKU+i0bGg3/VtGpKk/0ymYNg2/e5Pce5hQHWKf7G1nE9kUrDzvZ+
	gbO8PdbFQ3qvM976qLsP22vmJc+/4eb9GjaMTOA0+klMkdpaQ/PVr83OOcofDMlBCzFaGUijGn6
	KZYlE1bWwwVz+v+VRpychbVwIFximawhU0s0wAto18HF9MqG9mKlBojNdSlKdQ6+jH0SsAy6GGt
	yiT9RQ3g68An4UuLobWTsZ/qgmEOneBKeoDHvrgmxxACl7q5G9P8y5j1rctZQZfmccI7bdjtcat
	V/f4tZRjDaxEOhdx/x+T4NGGVXCFlgMuECTAJLAGRZtl8llcCq8Mq79auwpmUUA7tCi6R4Bi6EQ
	nUX0+HuOzPgBkW2I/hAnZPfVRYxPwWXZF1lA/2EQ7Bq9KU7tqFu4wOzJrIz3Sc76tp9+69YVjFZ
	/AlF/uww==
X-Received: by 2002:a05:600c:a009:b0:47e:e712:aa88 with SMTP id 5b1f17b1804b1-483c3df50c4mr38942425e9.31.1772108320170;
        Thu, 26 Feb 2026 04:18:40 -0800 (PST)
Received: from fedora ([165.225.94.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77466sm48483955e9.5.2026.02.26.04.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:18:38 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu@bootlin.com,
	Ross.Burton@arm.com
Subject: [PATCH v4 03/11] spdx30: Add ecosystem-specific PURL generation
Date: Thu, 26 Feb 2026 13:18:15 +0100
Message-ID: <20260226121823.149327-4-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226121823.149327-1-stondo@gmail.com>
References: <20260226121823.149327-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 12:18:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232008

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add a function that identifies ecosystem-specific PURLs (cargo, golang,
pypi, npm, cpan, nuget, maven) for dependency packages, working alongside
oe.purl.get_base_purl() which provides pkg:yocto PURLs.

Key design decision: Does NOT return pkg:generic fallback. This ensures:
- No overlap with the base pkg:yocto generation
- Packages get BOTH purls: pkg:yocto/layer/pkg@ver AND pkg:cargo/pkg@ver
- Maximum traceability for compliance tools

Detects ecosystems via:
- Unambiguous file extensions (.crate for Rust)
- Recipe inheritance (pypi, npm, cpan, nuget, maven classes)
- BitBake variables (GO_IMPORT, PYPI_PACKAGE, MAVEN_GROUP_ID)

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 113 ++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 0888d9d7e4..11945a622d 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -13,12 +13,125 @@ import oe.spdx30
 import oe.spdx_common
 import oe.sdk
 import os
+import re
 
 from contextlib import contextmanager
 from datetime import datetime, timezone
 from pathlib import Path
 
 
+
+def extract_dependency_metadata(d, file_name):
+    """Extract ecosystem-specific PURL for dependency packages.
+
+    Uses recipe metadata to identify ecosystem PURLs (cargo, golang, pypi,
+    npm, cpan, nuget, maven). Returns (version, purl) or (None, None).
+    Does NOT return pkg:generic; base pkg:yocto is handled by get_base_purl().
+    """
+
+    pv = d.getVar("PV")
+    version = pv if pv else None
+    purl = None
+
+    # Rust crate (.crate extension is unambiguous)
+    if file_name.endswith('.crate'):
+        crate_match = re.match(r'^(.+?)-(\d+\.\d+\.\d+(?:\.\d+)?(?:[-+][\w.]+)?)\.crate$', file_name)
+        if crate_match:
+            name = crate_match.group(1)
+            version = crate_match.group(2)
+            purl = f"pkg:cargo/{name}@{version}"
+            return (version, purl)
+
+    # Go module via GO_IMPORT variable
+    go_import = d.getVar("GO_IMPORT")
+    if go_import and version:
+        purl = f"pkg:golang/{go_import}@{version}"
+        return (version, purl)
+
+    # Go module from filename with explicit hosting domain
+    go_match = re.match(
+        r'^((?:github|gitlab|gopkg|golang|go\.googlesource)\.com\.[\w.]+(?:\.[\w-]+)*?)-(v?\d+\.\d+\.\d+(?:[-+][\w.]+)?)\.',
+        file_name
+    )
+    if go_match:
+        module_path = go_match.group(1).replace('.', '/', 1)
+        parts = module_path.split('/', 1)
+        if len(parts) == 2:
+            domain = parts[0]
+            path = parts[1].replace('.', '/')
+            module_path = f"{domain}/{path}"
+
+        version = go_match.group(2)
+        purl = f"pkg:golang/{module_path}@{version}"
+        return (version, purl)
+
+    # PyPI package
+    if bb.data.inherits_class("pypi", d) and version:
+        pypi_package = d.getVar("PYPI_PACKAGE")
+        if pypi_package:
+            # Normalize per PEP 503
+            name = re.sub(r"[-_.]+", "-", pypi_package).lower()
+            purl = f"pkg:pypi/{name}@{version}"
+            return (version, purl)
+
+    # NPM package
+    if bb.data.inherits_class("npm", d) and version:
+        bpn = d.getVar("BPN")
+        if bpn:
+            name = bpn[4:] if bpn.startswith('npm-') else bpn
+            purl = f"pkg:npm/{name}@{version}"
+            return (version, purl)
+
+    # CPAN package
+    if bb.data.inherits_class("cpan", d) and version:
+        bpn = d.getVar("BPN")
+        if bpn:
+            if bpn.startswith('perl-'):
+                name = bpn[5:]
+            elif bpn.startswith('libperl-'):
+                name = bpn[8:]
+            else:
+                name = bpn
+            purl = f"pkg:cpan/{name}@{version}"
+            return (version, purl)
+
+    # NuGet package
+    if (bb.data.inherits_class("nuget", d) or bb.data.inherits_class("dotnet", d)) and version:
+        bpn = d.getVar("BPN")
+        if bpn:
+            if bpn.startswith('dotnet-'):
+                name = bpn[7:]
+            elif bpn.startswith('nuget-'):
+                name = bpn[6:]
+            else:
+                name = bpn
+            purl = f"pkg:nuget/{name}@{version}"
+            return (version, purl)
+
+    # Maven package
+    if bb.data.inherits_class("maven", d) and version:
+        group_id = d.getVar("MAVEN_GROUP_ID")
+        artifact_id = d.getVar("MAVEN_ARTIFACT_ID")
+
+        if group_id and artifact_id:
+            purl = f"pkg:maven/{group_id}/{artifact_id}@{version}"
+            return (version, purl)
+        else:
+            bpn = d.getVar("BPN")
+            if bpn:
+                if bpn.startswith('maven-'):
+                    name = bpn[6:]
+                elif bpn.startswith('java-'):
+                    name = bpn[5:]
+                else:
+                    name = bpn
+                purl = f"pkg:maven/{name}@{version}"
+                return (version, purl)
+
+    # Base pkg:yocto PURL is handled by oe.purl.get_base_purl()
+    return (version, None)
+
+
 def walk_error(err):
     bb.error(f"ERROR walking {err.filename}: {err}")
 
-- 
2.53.0


