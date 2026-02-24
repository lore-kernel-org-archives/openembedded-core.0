Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C33BF3C9B9
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:30:14 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24299.1771950608060245879
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 08:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F0yiuNm4;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4837907f535so51334305e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 08:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771950606; x=1772555406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr3tBCMRedbRAAB7SLF8wFLFU8YidxfCGxe08zmH32U=;
        b=F0yiuNm4+xQddsFY6xippNcdpT8bEUuZEHigVER2W5q3H+3LQRUlST0yPnlnsrByhX
         207D2fMBID9kM8NjBaBmh1R3+Rotd8N6eoks27oQGkSddSXzmweQWtsE1wseTFJ1wDLp
         QyyvqMA7RhCiVVe2AqxkrqWvZZMYd2cyEgWONKH1Zu5vwmvKO/kaJYMC8YOGXzvU1ECp
         X3rNtYNH1onv16bkVkZFIY1F4PZxH7fRCL23eBg352GHLGMJD6S3SpszQV0W/VLR9oKF
         mOi3VtDbC9Z5tTXeFxNWx1Q8Qwz/CxZFwP/vKGxj2hSplKum00soCBzagADaqcKSl/e9
         Ig/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771950606; x=1772555406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gr3tBCMRedbRAAB7SLF8wFLFU8YidxfCGxe08zmH32U=;
        b=QnlBXYvSST8CqOFLJOQt9R8UwDl8shopx6pKE2TspXRp0C5qe8yYPuh3dJ3qWrUwtz
         eV4bs8o3QCY+6AquLlVfYsB/XwQ7FQM3z6M/tXFosW3vaLbA7l0AaMX1bNmPRe+zyvTr
         PvhWIo9JuBxmSt+Imr6GRoD5B9trkFZDQ2cZNBB0yGFZhOEHBrgl1Pgw5flzIN4FMxwO
         GFh/4k22SifhekMmNv53nETfJF0ITFLkqExf0KcUZFnnNOoDl8cs5Igqi1X245DBcVJE
         xkuCNagv+kdGxrRvqA6VPo1fkVfx0Uxz3MW6YAcwK9KtvMRm8XG9M7r8BGQ77dwF/U1+
         LC0Q==
X-Gm-Message-State: AOJu0YwnwZaD2muZrvCADSt1ftdJ+Z4Avv6szp8fQwVLoay4aOvkBRnv
	JbadN1KdjOGEz7z6zlamb/0CMyuyBjGPEMByu7ZNJEXd6ELD8EB2YGZdswxsOg==
X-Gm-Gg: AZuq6aLr9q+zxCQQKAZ/OfuxllAbMcs9nyhtbZvS+vgPyJ+64wMVzdeRBNrgjZce3Qq
	xhE+1NMLBVf2BmOg5v+VLBu9GBNJxKNFQqjOaC6W3V1VV07MOiPCW2OYeLTE7kuUd7tiRasYrmx
	Svv95O0IL8d1cH1JTuZo/272JipisvxX/07A/xPo92iDTeRx4xMyLCiW5DrIrDK/sDcGedaJ3Xt
	2NyUuI2W4YDVhtma/hlCOYsLACRcYKDvPnaC39Wcl7uqnOMpQgioL79tJAFeOyJYkgqMLf0FLzf
	7RjsjHgBUGJwROwL5GNNFE2xkfSTu74YT4X53KhmMlQ2WhTjxifHrSvdcPb9XZ9lhVJ6o0IF83r
	Eq3f/vdegGAqG6rzMLVwTQRsvEn/saUJStm9owu2qh4PpF8JXSTK81M3vSAyMQufd8HWegA0JPC
	egULCxXUKzWwf2eblJGjPlagn2j4KinlItTg7e07h19CAYSWHoAMzz/YWRRRxMZNrNyyoGOFvdE
	bNFSXYq
X-Received: by 2002:a05:600c:45ce:b0:483:7813:90d8 with SMTP id 5b1f17b1804b1-483a95bd80fmr222029725e9.1.1771950605442;
        Tue, 24 Feb 2026 08:30:05 -0800 (PST)
Received: from fedora (mob-194-230-144-218.cgn.sunrise.net. [194.230.144.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f3124sm9716355e9.1.2026.02.24.08.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:30:04 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v3 03/11] spdx30: Add ecosystem-specific PURL generation
Date: Tue, 24 Feb 2026 17:29:38 +0100
Message-ID: <20260224162946.4000445-4-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224162946.4000445-1-stondo@gmail.com>
References: <20260224162946.4000445-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 16:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231880

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


