Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC71EB7ED8
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:05:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23516.1772643950668811512
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:05:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gM2HOozN;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-482f454be5bso74520605e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 09:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772643949; x=1773248749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93LDLTM9PTRaz1/M4o61T0JICCxs5UF29MzeO68vOPo=;
        b=gM2HOozNlNhlJQUAOhv5GdUSpF+wKxG/IGnTv3nSqazmtxEh7PMrEO1GEl17daG+8d
         ZIgrjLBVRzPuExG8seXlNPeSvYffhAXF+aM9PdAlFpUvm5ct9s+NKyJaYQbj8+XuumPk
         b46a8QybmCPID8k/TcXv5VAJ8kKpaJN976aszQlyCpXtl2dMXYCocTLWtKwXY8J3JzH0
         IZ/SduxYfq9iOb8l1IfJeyN3C+Pkb7wKzSbmn45dRO2UGop2KI5ju0l+BbB3agox6DQE
         hV1dJiAQuz9C9SVesC72597HD7IhH08ffq2XspZ7qKz9ccCJC1CUzhGURgHida2QM/8d
         SGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643949; x=1773248749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=93LDLTM9PTRaz1/M4o61T0JICCxs5UF29MzeO68vOPo=;
        b=Izzkkgj19O5sn1W8RB0oDNA8XENQrp0EKvGaBXQ+2eOxPlisU77Cnc28opRPAN89iO
         tWNyKMDacwNX3tcyjUiCH5e8MCiqY7ot58nK3Dy2rbMJT0SOwE8mGEzIj6Y0S6WG9Xqg
         1oTdNO33Ru9k5P5V1/OBu6wpcoDcu9/VxdUar4zOVXWa78TJV9ZAwhihVB0uP8lUIhk7
         qo5T9LE3KptUoXWjUCFar08mCOFBNGC/3jiWkBL5ZWuCciVMWLd2fzTtfmLpYkpiM2w0
         FI6E24IohB7mttSrNIQ/+gMzw4g/35WE671AvSO5biTj+cE3JGHyaV3RnGVeQeRzyqeJ
         1dXg==
X-Gm-Message-State: AOJu0YzUa748H9+YYyrEbFPU5pfYp4oTicBQuuzbz/uPGtJ6tnotjdGi
	rDIyhWsimLooRQ42P49U8FISiuCnpmgG5IAZb+/flLdBP2NFTeJyP7PepjttKg==
X-Gm-Gg: ATEYQzyZK8m6D8dNLI+2w1NDACqaS3mNu1Tmc7ph+0yAxuMrL4yBd0ELFbtbBS394Ny
	DFCBhjDKK+F5wVxk9P1ziJGmgfJUPFQBi4tWCwZApo+kR8qNRFKkPRLSOx/gI/O5GjXxmOPp87h
	2vd8f1pzwPVVIqlj6sDpGj83kZ7nJdnblz1XJ9w9FxweM2n6L5yvXg0/CEtX1WPO1x/wzmBCaAj
	DFhPYRadyhNDBIdSuYlDtpIR9srbgl5dUOK1RdGk73lQd/+EJXvvfX3mW2VZoEy/WOmUUXFL4Qe
	SgyoFsG9DZegeyHG5Aw35z+ImaDNbSpkj2ZXhzuXu1o9EOvMbg2YTzvemIBKrjHXqT/S6Ba4V5C
	j81ZpljeYyTk8iMS2ZZsQ9pZCVyMjhl39XDRA14+egSUQtQADRhk+s3cRV4oRssuvsbbdoYHGXF
	cRnD3O9bIZTzNPHx07XTTVlowXUzlrpBPfFg==
X-Received: by 2002:a05:600c:81c8:b0:481:a662:b3f3 with SMTP id 5b1f17b1804b1-48519881c4amr48649875e9.7.1772643948449;
        Wed, 04 Mar 2026 09:05:48 -0800 (PST)
Received: from fedora ([165.225.94.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188914ddsm78557395e9.12.2026.03.04.09.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:05:47 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v6 03/10] spdx30: Add ecosystem-specific PURL generation
Date: Wed,  4 Mar 2026 18:05:34 +0100
Message-ID: <20260304170541.180868-4-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
 <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232406

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


