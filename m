Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D57EA4E30
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 16:01:46 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.164100.1772467297064063492
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 08:01:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VS1HFeW7;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4807068eacbso38454475e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 08:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772467295; x=1773072095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93LDLTM9PTRaz1/M4o61T0JICCxs5UF29MzeO68vOPo=;
        b=VS1HFeW74McVw7RQhWHcaYYuFgCm4TNDU2Sq04klx81o9DMj0HRTemVPl2vXPqlSnR
         3S9kwqH0FKnMpqVNwKjDY986j9z3czR4iP+sFqoP4M8RtgKWjejtS856cfUtC0em6KFZ
         uacDXut/KgrnNy+1qI9KhkLivpCSa9AIB6fqvRAqSaPJ1fD58BHNHPlG7/Q4CthAxaGF
         9VFPd7JyA7050xsvmcMB+BaqOKge2aHoWDITn0Ors62SswGES2d2xE6F5DbpUMkJQi3Q
         sB2Iu41PXagyokf49IRnFJeilQbSv4isZSOTVh+cW5zADKWaoFEEnimBjeUpdUD7V+lI
         zhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467295; x=1773072095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=93LDLTM9PTRaz1/M4o61T0JICCxs5UF29MzeO68vOPo=;
        b=tS7zUQmrfnrUJnsCmv0QAUb/z6KgMXweQ8yIqc7vhv0ZMYUN2sDeFmbPiyFkdio0BT
         k2vEpZJc8xRxW/y0c8zeRO+mUuGYv4UAXOvWjXmpaST/mH6P55cKiCeqO91joC2b1DNa
         yZt6tt3TYH/n151pNqUxCjGa99/Qwsr0N3tCz2ku+Lbv80LsKSJm136C3+IJHb3/UeW3
         dAAC93NKSabFpSR9txn9H+yL1ovI6k8+PTAGleEI02So0ehHTirxqebM0n5qs7JO2N9l
         6w31mAGEgTzkHZiZwPfyABiV7BScypxX+2YHtBNSnORIiJui//dyAxzpTGCqNqpmBsf3
         shgw==
X-Gm-Message-State: AOJu0YyJ1nitIzU/oKoGAyEEqXsHIfpQaDxcvNUKlpbAjCW/iIadlX0V
	tJQNOM5isyOEkMUGJefNSZqWzN56oZ5JjLkRWPD3efbhugYR52bKd6+9yYKeTQ==
X-Gm-Gg: ATEYQzywHRniX4SZlU2HDOwB9P/3IiIo59L6MpfLNTRKknOOX6xSP18Ik6I/9ybfvqq
	3fVR5P1T+cmUyIKKOngz6eHypA68qitld/snETYhS5WANzQaQwfGZ7AJHmdlzTwFLIft4j7sb6M
	gzmSSqEQvAdi0Ll9/lU7/D7mXlRtukoFrTuM/roZ5z6EfrB4+7seocjfTvwYkoHS+g59Bg+afsE
	w1/pykxVXrqAhc055kuxJHOM8hlcqVxB7/qZtKKkM/o9dL/EK+OysbpVxoT0c5NN/uU9fNqChvG
	CpUOLhgIAKS/4saeWnPHJHLdjzMnTnsPbZR2ClMtrLd9oOJfN7kcHFUTqGXukSVQR1RxnbWseDs
	4Ppm31DBeHonoqI1zrhcNX5ocuHX/h9x1W42qcUjJrdZJRgQIoHaLkow8MuA0HSfAsHfvX26jQm
	c4NqaTV9ymWejTS/w/MvlgDYgWMQ/WeQF9ftgyzATuCOWLlguRq0qLIcUfBW6wRLadYlnBzZo9V
	P8LcEeZRycG6/mvp6S2
X-Received: by 2002:a05:6000:2903:b0:439:8f6f:1b29 with SMTP id ffacd0b85a97d-4399ddd8509mr23497601f8f.12.1772467291960;
        Mon, 02 Mar 2026 08:01:31 -0800 (PST)
Received: from fedora (mob-194-230-144-8.cgn.sunrise.net. [194.230.144.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e40fsm28390097f8f.7.2026.03.02.08.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 08:01:30 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [PATCH v5 03/10] spdx30: Add ecosystem-specific PURL generation
Date: Mon,  2 Mar 2026 17:01:07 +0100
Message-ID: <20260302160114.46884-4-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 16:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232213

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


