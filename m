Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181B0C5DF82
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:24:33 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14399.1771647866492633967
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mE3YPkUN;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48371119eacso26839575e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771647864; x=1772252664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaSUqNL4IVbe+t8YM6JUyx0Ptnfnm4T8BwFhbjBI5mE=;
        b=mE3YPkUNaqNXDJbijZD7/+wNGfH8OIjswX/J9lhnnho2Q76Y7x8Lnt6mLsa4+lYbUf
         wc/j2gw57kZbttaXKW+KmzjSbLRkgaj/OiXb0f2Q6uGuZhxaQvRymsbQnxXsPxxBSu9V
         p/mtgWTqT7Vr4QXg36r8Ybh10glu2JAbszO4i/H18+7PFZTtl7BKkJFVBcwMC0S19n/K
         AUwdOoPZRqJjIrC9S2kl3JzazxMVJfAdZRhuW5l2bULqaPOGD9fZoyVm27w/eojE9Flq
         XdHmUMbSiMWWzLVy/hnPy9lqvP2VLjY9KN3dt8NRyMU7kovJDSCLiWWzDsdccNIGpj3s
         IjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771647864; x=1772252664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yaSUqNL4IVbe+t8YM6JUyx0Ptnfnm4T8BwFhbjBI5mE=;
        b=VhV4O+lmnZ3A1yXUW+aFeiiqEi6golnreI5FeY82G3xy2vFKQWgN7I3UQLq1fGmZDw
         yqcT6GzRkKuTYn1CVjLR+lzWQUrnrfUZicTHRUs8US+jsBocJLcjvIVWMD2E4Xowwg/A
         vsLPqeGYabYMOeaVgDdYojgY0GZr8/RKLMwkwlM0SBmh4lPWvfA0vTDsauwl4av6dqfZ
         KpsAy07ik7uDDUzC0fJxKxBv15cbMMVE0ur4C8Xd8SM90Ez+QDsgFkek/Scn0QcFzfp+
         F/9snPv4cGjzRZHJqzcs9YDwRgMDtEui+mQEDLQ/L7BlNwvcuc1qHcglFP7nAX/it9mx
         AxNA==
X-Gm-Message-State: AOJu0Yws3c2kjQys7kf2BycBS9i7skQ4+LoJbNrKFNOoPg93y26W5hOl
	HBTPSPoQEyA2LQp+p0SwW3K4QsWOqVODYotVVu5OjV9yij458VC2Z/qbDJMalw==
X-Gm-Gg: AZuq6aIlr+wlhWa8SyqHN2g4GJbt2vtuFajIIkjwLi2F/wjSGiteE03q+4dHLp/cs4g
	DzZI/bgOXEte8SpWx5n5VXzbDgU+z4i3MHx8ov8xTXjMcaaa7eBjQkPDc9m5SQZqlijImnSE2oW
	8JpdSs/UC8VvvaFlw5K4Fe6uNX1IYh3D38C79uBcS2BtIXAO3QqGiLh5bKv2h42dCqwTuBSR0DY
	RJpdyArxIv3LymoU1HwnhWFfLBJ1cv/QfNfJmC/762Q/NDQMyeid/32Vxix4EuNQEvGgeYjFksg
	XWUPM7LoXWXK6PclTtBjva4MDsEva7HFo9/o1ub6sQV1Y2HsBjy5ta7aXNt9HUb4iioQEpz30NN
	NPlr30GI7os7kIIeHekjGByguDc+RbnHs6n1+Hu5PK0l1li6HISrr7jGRcUtN1JBYwuTuX1dFP/
	0BDTDT9ifM/am273z2vABUZMInPUJSu84G120=
X-Received: by 2002:a05:600c:4e46:b0:483:a8e9:201b with SMTP id 5b1f17b1804b1-483a95a3851mr28404435e9.0.1771647864434;
        Fri, 20 Feb 2026 20:24:24 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31ff4d7sm117340865e9.15.2026.02.20.20.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:24:23 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH 03/14] spdx30: Add ecosystem-specific PURL generation
Date: Sat, 21 Feb 2026 05:24:07 +0100
Message-ID: <20260221042418.317535-4-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221042418.317535-1-stondo@gmail.com>
References: <20260221042418.317535-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231559

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


