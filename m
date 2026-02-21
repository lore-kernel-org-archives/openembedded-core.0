Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B862C5DF95
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 05:10:23 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14921.1771650616642842637
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 21:10:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ivg0v1G8;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-435f177a8f7so2632196f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771650615; x=1772255415; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaSUqNL4IVbe+t8YM6JUyx0Ptnfnm4T8BwFhbjBI5mE=;
        b=Ivg0v1G8QwZV60cSyVmB+uE0JSBcPvoTicZiusbeBi363No2/Jc2pwnGwaFC/x19gA
         rCtoRWEo9quTs7+NPpQePOsgFccz7/LyCoaMVsC9sPxio6Vv5xisX4LfC45+HuW8s09z
         YNd33vz+sTmYpIomK9Aa5j5ApB98pzFTzrwML5Ef6W7Kj3X10wJ/lpKd6H1P/qLJK0oP
         QjMd7Ci+EEEmBDXcQVlsQmEzs5cq9SpM5vqb/C3tISICeprfeLDaJuEdY7N4WmglybWT
         tiCm8DsaCkGCuJEpXN5pH7V8oWCRoSzzXNVo7FNC2EIiiDA8ssSs+YwmaX7nPvkA8ALL
         88MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771650615; x=1772255415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yaSUqNL4IVbe+t8YM6JUyx0Ptnfnm4T8BwFhbjBI5mE=;
        b=Wi6Q8LPuhgxUV4emKlccUbmvdU5rixo3/2bB9L6E0tj8Mq1myS3bHErocV0zRTUOgQ
         PpLb6cKKWv/JgIQLFzOUeCPKF6eeyPiT77Mm8lDXbCFS+iHRg+9kpDudxSWN+y8XBJfI
         Os7xQcqIs5XEWT65VHXrljkgpxWw4jfQupt2uwZr0nlgIwHz4i78V9T03ZBtwYd7GCtI
         cqRLGLrsdsLakaIG77+e/b+vFX/yTCSNM70uJlfo28q5NJN5Mv2zw9tGfAnyIGdoWEu+
         6biheliGHhXgUs30sKC5dtHFltF9Qz6f6Z/Kqfbiq0FBoovFaSNNZ8MZDrUUwrTlxJx6
         j0Fg==
X-Gm-Message-State: AOJu0YyPh02WS1lPGJnJ1W3go8EhprlC+nevCkG7SRg28Pv7HyoHNbYQ
	WIYIwhQRIuCFY1nVkiyEQNtlauB7ypfVuw+yV3cjIVz4oP9ulPtSUJ1N3zxa/A==
X-Gm-Gg: AZuq6aJKpU2oK3H6mFM8v1k9NPr+RLB7Z4PCZ2ChJMcngdRq7qr2OJDnhc0a/ZpN3sW
	xbe03GmTX/w2EKtYliCba9y/Uerq/3pngFjb5iflwhsnuwTWRORJq4Q/vpqnnHGpTs/VhbGA6aG
	svyhT08mRUhJcMUdmf4jxYq4vU8H8syJpJG2aPJ43pr3GPtjejv+s91XsFUQciUatreM+iSSnHX
	P+6X1Afk7QjOBFD+cfNl+1EZ6SwB/FYonzMSdh5g+pbFJnceCdvcR7xYLTz1buMzdkZcokLtP2V
	ut3lM0NOC8CKx+JNOU7CRPGiuA3z1aFAwmw5+9ZQts+HnV5+gGfgSCNXgydzlvwsJwKid7vpSFj
	d6Sn9pw1UwtkHt0Y+nX+2Ae0ouI3axfmhs+3mGk52lCLMRdRX2xl3kHUDW0aT/CKvf3tkntukcp
	4IcEyzbAeSx4LsR8Bb6CTLxdyY7okWOlxbIG4=
X-Received: by 2002:a05:6000:3111:b0:437:6f15:29f0 with SMTP id ffacd0b85a97d-4396f17f44dmr3966862f8f.45.1771650614499;
        Fri, 20 Feb 2026 21:10:14 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm2455901f8f.3.2026.02.20.21.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 21:10:13 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH v2 03/18] spdx30: Add ecosystem-specific PURL generation
Date: Sat, 21 Feb 2026 06:09:51 +0100
Message-ID: <20260221051006.335141-4-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221051006.335141-1-stondo@gmail.com>
References: <20260221051006.335141-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 05:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231583

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
index 789b39bd93..0ee39ffcd5 100644
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


