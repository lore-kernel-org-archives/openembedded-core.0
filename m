Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0B1EFCE5B
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 14:00:18 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69769.1772805611054141012
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 06:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U0GQIR7O;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso86601735e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 06:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772805609; x=1773410409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93LDLTM9PTRaz1/M4o61T0JICCxs5UF29MzeO68vOPo=;
        b=U0GQIR7Oi2c29AJVDyGeTF8VKm6VeoMgiiPMKFoHn/tJE8G91RRii8eOBaSi4ztWhh
         UEqlquQpRCkBE7OxdeUy6mJAHdcA/MfHBXuzpFKj/9JLBFvtxyHNl1hk6N02OVIxsTEM
         JDbAZXizCGwSBuAvfJ6d75z2FMQFlhY0nH7TC2k+FaiRLRCD2XkryBNsVYSCHhVQOSEL
         Pij75rGgWckgF+2fp/Az9lGiOCzSr4CepOerkyh0brOTrpuCPDp3ZF0XywBvoOWzTXV5
         fZs3xER92/hSzdCnil4A+I5i+cy0fSbBu8wFTr5xHniIVS2J/8ndiMOtee985jzIfN1b
         PXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805609; x=1773410409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=93LDLTM9PTRaz1/M4o61T0JICCxs5UF29MzeO68vOPo=;
        b=Ygi0SnXQY7s8mNFspmpdgu67hoRD1kbSQDDALrKzdWyV0E1IgvkNs4s5xC2QsB96zw
         aGXhSpWOCBG+M5BRR5z1KIjhb6u4+cOkgVkBTW+JLmHmTqv1j6oMcCf47U4abvbx3LPv
         RM1v9L0UFxkrYz9n1zNkYmZ6FC+EFsq2Q57ZVMN5XjBJIqh7UvoSGf/N/zEIVL1KhJK8
         4UsXkEKCyJ7OQcJBYLFtHFjeOzPg1vwIXye4RgNgQJvN5wcTU3L2fI94Zo5S+xCKYsUU
         FvoL+wRd8YkXXzmZ4ZfvgGAhnGl1zFmzyqvWh65kc3TES4wZTYx0nMOzAfPVx5E9a55V
         bdiQ==
X-Gm-Message-State: AOJu0YwWOZi5R2GtdvqlXhtPlTVgJsTnd81RHKH7koiMCeU0g8EtOH5k
	hRkN4YubhUVyZiPVgoxdflaiy8XfcSuKWstVaU9eVo8AfVZaNE+/gMVyC/SrCA==
X-Gm-Gg: ATEYQzyUMCuCnxdRxL/BvXtsIdEyeFwwainMNwO+iEgV0FS1XA6u1mEtYU7JQ6q8k8B
	ARdsF6XevQgyP698S6WXg8YESYJO2dTJkmvRGpsoMwQgnejaU0jP9sP5WfuB9xWly9rGr0W9Y3s
	UTVgPd7YCEdNHY/XFplY1vE7q6aX8p95c9v+JHKgr2G5QsG6+0zYZodTJ1GRdM49zHfM/waS9fq
	2vkOhuw3mN5qiPPAvmgQH215sJzyOeIVNMPSsyREoyJLrzu4kT9NBxgCy6aVZjcXn77IZrpbbpn
	0ZKh1RW4+MtQo91c/JLFMJ97RTlB2+UIZ/Jk/6+Y9N99ipDoxw92p3f86pTp6WUpR/fNjXVlUM/
	kcH/gJ9LuhMLNGNGp6DmC+QAOaIh/t1LXE+MciFaIlyhuiPSLRo3H26AjUo9wPG0xVqoJ/cV50I
	mfePN+J9YTyw4Bol8QyZfLwEUMVsPgV3I+AB38ZoT4QvPRe4ScDou6
X-Received: by 2002:a05:600c:4f0b:b0:480:68ed:1e70 with SMTP id 5b1f17b1804b1-4852697a114mr34421635e9.35.1772805608657;
        Fri, 06 Mar 2026 06:00:08 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb4257csm187098845e9.15.2026.03.06.06.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:00:07 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	joshua.watt@garmin.com,
	ross.burton@arm.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [OE-core][PATCH v7 03/10] spdx30: Add ecosystem-specific PURL generation
Date: Fri,  6 Mar 2026 14:59:55 +0100
Message-ID: <abdb92236f1ac104a31051d71890afeec6ba566b.1772805096.git.stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 14:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232569

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


