Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA30D0D159
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 18:10:08 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12692.1767809401767432782
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 10:10:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qtp9uI9Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso21143405e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767809400; x=1768414200; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQkjGoVaOVegTpdD54wFwNhXih6q8WqkrYH2UHz1RXk=;
        b=Qtp9uI9QcRVf7gBUrUyru1+q+kXvd0HDwWIDZp551YRR2/geD3eKjat1GQnfFKcqIN
         D0cn2Dmb3Lxb2uUr2sBPjXH/+2nBZOxJc1GPEEltnW3C6Mrnt+d2ZptF1mkkn/M5t1rf
         iTK7Vm+ZtpOZBAIM1bzjfVKNX0sYr3Aee98Z3DE3o3sCyuvmcgW2DYmWLAqLDDhXyqUU
         BhL6raHnvwMzP0NuK5n4PyKX6KzbcF+fICwRQjJRqo18GcVgu0B84zf6kO4GFz/hCqFT
         1/+3HnDGLxAz5oqcYerBfE1IYZ/nbQrUCFry1S7hxA0TR+MoAMlnojWUR+nwLNUuyDfB
         LUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809400; x=1768414200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JQkjGoVaOVegTpdD54wFwNhXih6q8WqkrYH2UHz1RXk=;
        b=mvSGgLCophGsDOCV6AAej2beRB65ueOMNxu2t0xSsfNYfF5I1K3Kd16VlYYqywo6+K
         Wf1FONQQl752csnG1HXi+E/d1KjaS67FEPOfmOduTMfW3IXTly3z6oQgkPlY3pfwyH2s
         ACkbHENDobYBWHdLtySw21BpvtmZ7C6PLCpO8AYIk2pMLJWVUhmvGiFnDhOqnxPdLPNF
         N+2FrAzheaiVjbNJ+Jxo4fympEwA7jYnvcT+h41Ewb0jp+0A3TkZT0hGxW3IBLrah/3O
         UTz3JZsnu9yaiBSX7DHNTTmg71p3/50YdKJif+aIzVtn3GB2YpYK0afWiUzuJZXknFXJ
         3OUA==
X-Gm-Message-State: AOJu0YxWCDI3a3/cwmf2eRNA1bjUILVfc77sLeXDP63LbCfmyOtSoiEA
	a1e6szFk92KfIKfMTl+k3KDtVFyyW69LQzMDAvLnBvcRrNkAmYOv6ivhN0tAZQ==
X-Gm-Gg: AY/fxX7Jucr5elLcM+SZ5rBUe0/fi9tKOPU/l0NLzi6xGTKGzU3F8q1ko046QEEXDwX
	BjW9BVqoeEqxtHRjkdWit2qyhltQvaZvEFZ3jlaNw78jqHZnshK6YuXyyANy3r152Vfe4aiI2aI
	BHw35HSnXBXJTnPpsbWOiPrBo4IAFSxmWn0BW04hTslTnskHD+MgySlxzbfTw5DdbvZ/b5wpYXh
	jdybUqJMNb7fegu6s6DZJMy4xlo+1zczF8DuwHSzcBDFCSeFAwKubEfrW7OKzTwOHHdGpZlTcVf
	ZytsYomsuShbqJyYXzNFRkYLjzmnauWFAyr8Q565HzxUBjM5nN5rycARtcXHHR+oYSqLfGS/tI4
	MpSBGYpcCQPzH62wzCLz23zni2fre2/bPIcOIVbd1sv/4IREdf9EMSOJIP4w9Zp7e+KVfkvBdTE
	Kj+mnhRLOAWma4vyqkzh/O4Dk=
X-Google-Smtp-Source: AGHT+IHZeqjPZiOppOcchGL3LMavyg6/7czdlkiYFCG/tmKo837R+qUJN22dQogJD5oD00CEb/fsgA==
X-Received: by 2002:a05:600c:4f53:b0:479:1a09:1c4a with SMTP id 5b1f17b1804b1-47d84b3b389mr44332065e9.31.1767809399742;
        Wed, 07 Jan 2026 10:09:59 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-432bd5df9c5sm11895630f8f.22.2026.01.07.10.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:09:59 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stondo@gmail.com,
	stefano.tondo.ext@siemens.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [PATCH 3/4] spdx30_tasks: Use recipe metadata for dependency PURL generation
Date: Wed,  7 Jan 2026 19:09:49 +0100
Message-ID: <20260107180951.140895-3-stondo@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107180951.140895-1-stondo@gmail.com>
References: <20260107180951.140895-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 18:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229022

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Use recipe metadata (PV, inherited classes) to determine package ecosystem
and version instead of unreliable filename parsing.

Previous implementation used greedy regex patterns matching any
name-version.tar.gz file, causing false positives:
  zlib-1.3.1.tar.gz → pkg:pypi/zlib (WRONG - zlib is not from PyPI)

Changes:
- Always use d.getVar("PV") for version (addresses review feedback)
- Determine ecosystem via inherits_class() checks (pypi, npm, cpan, etc.)
- Only parse filenames for unambiguous cases (.crate extension)
- Support all major ecosystems: Rust, Go, PyPI, NPM, CPAN, NuGet, Maven
- Use pkg:generic for C/C++ libraries and other non-ecosystem sources

Example results:
- zlib source: pkg:generic/zlib@1.3.1
- zlib built package: pkg:yocto/core/zlib@1.3.1
- Python with pypi class: pkg:pypi/requests@2.31.0
- Rust crate: pkg:cargo/serde@1.0.0

This approach aligns with Yocto's metadata system and ensures every
source download gets a PURL for supply chain tracking.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 160 ++++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 86430c7008..c685b649b3 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -357,6 +357,155 @@ def collect_dep_sources(dep_objsets, dest):
             index_sources_by_hash(e.to, dest)
 
 
+def extract_dependency_metadata(d, file_name):
+    """
+    Extract version and generate PURL for dependency packages.
+
+    Uses recipe metadata (PV, inherited classes) to determine package ecosystem
+    rather than guessing from filenames. Only parses filenames for unambiguous
+    cases where the file extension definitively identifies the ecosystem.
+
+    Supported ecosystems:
+    - Rust crates (.crate extension is unambiguous)
+    - Go modules (when GO_IMPORT is set or domain pattern is explicit)
+    - PyPI packages (when recipe inherits pypi class)
+    - NPM packages (when recipe inherits npm class)
+    - CPAN packages (when recipe inherits cpan class)
+    - NuGet packages (when recipe inherits nuget/dotnet class)
+    - Maven packages (when recipe inherits maven class)
+
+    Returns: (version, purl) tuple, or (None, None) if cannot determine
+    """
+    import re
+
+    # Get version from recipe PV (always prefer recipe metadata over filename parsing)
+    pv = d.getVar("PV")
+    version = pv if pv else None
+    purl = None
+
+    # Case 1: Rust crate - .crate extension is unambiguous
+    if file_name.endswith('.crate'):
+        crate_match = re.match(r'^(.+?)-(\d+\.\d+\.\d+(?:\.\d+)?(?:[-+][\w.]+)?)\.crate$', file_name)
+        if crate_match:
+            name = crate_match.group(1)
+            # Use filename version for crates (they embed version in filename)
+            version = crate_match.group(2)
+            purl = f"pkg:cargo/{name}@{version}"
+            return (version, purl)
+
+    # Case 2: Go module - check if GO_IMPORT is set (most reliable)
+    go_import = d.getVar("GO_IMPORT")
+    if go_import and version:
+        # GO_IMPORT contains the module path (e.g., github.com/containers/storage)
+        purl = f"pkg:golang/{go_import}@{version}"
+        return (version, purl)
+
+    # Case 3: Go module from filename - only for explicit hosting domains with version in filename
+    # Patterns like github.com.user.repo-v1.2.3.tar.gz where the domain is explicit
+    go_match = re.match(
+        r'^((?:github|gitlab|gopkg|golang|go\.googlesource)\.com\.[\w.]+(?:\.[\w-]+)*?)-(v?\d+\.\d+\.\d+(?:[-+][\w.]+)?)\.',
+        file_name
+    )
+    if go_match:
+        # Convert dots to slashes for proper Go module path
+        # github.com.containers.storage → github.com/containers/storage
+        module_path = go_match.group(1).replace('.', '/', 1)  # First dot only
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
+    # Case 4: PyPI package - check if recipe inherits pypi class
+    if bb.data.inherits_class("pypi", d) and version:
+        # Get the PyPI package name from PYPI_PACKAGE variable (handles python3- prefix removal)
+        pypi_package = d.getVar("PYPI_PACKAGE")
+        if pypi_package:
+            # Normalize package name per PEP 503
+            name = re.sub(r"[-_.]+", "-", pypi_package).lower()
+            purl = f"pkg:pypi/{name}@{version}"
+            return (version, purl)
+
+    # Case 5: NPM package - check if recipe inherits npm class
+    if bb.data.inherits_class("npm", d) and version:
+        # Get package name from recipe
+        bpn = d.getVar("BPN")
+        if bpn:
+            # Remove npm- prefix if present
+            name = bpn[4:] if bpn.startswith('npm-') else bpn
+            purl = f"pkg:npm/{name}@{version}"
+            return (version, purl)
+
+    # Case 6: CPAN package - check if recipe inherits cpan class
+    if bb.data.inherits_class("cpan", d) and version:
+        # Get package name from recipe
+        bpn = d.getVar("BPN")
+        if bpn:
+            # Remove perl- or libperl- prefixes if present
+            if bpn.startswith('perl-'):
+                name = bpn[5:]
+            elif bpn.startswith('libperl-'):
+                name = bpn[8:]
+            else:
+                name = bpn
+            purl = f"pkg:cpan/{name}@{version}"
+            return (version, purl)
+
+    # Case 7: NuGet package - check if recipe inherits nuget/dotnet class
+    if (bb.data.inherits_class("nuget", d) or bb.data.inherits_class("dotnet", d)) and version:
+        bpn = d.getVar("BPN")
+        if bpn:
+            # Remove dotnet- or nuget- prefix if present
+            if bpn.startswith('dotnet-'):
+                name = bpn[7:]
+            elif bpn.startswith('nuget-'):
+                name = bpn[6:]
+            else:
+                name = bpn
+            purl = f"pkg:nuget/{name}@{version}"
+            return (version, purl)
+
+    # Case 8: Maven package - check if recipe inherits maven class
+    if bb.data.inherits_class("maven", d) and version:
+        # Maven PURLs require group:artifact format
+        # Check for MAVEN_GROUP_ID and MAVEN_ARTIFACT_ID variables
+        group_id = d.getVar("MAVEN_GROUP_ID")
+        artifact_id = d.getVar("MAVEN_ARTIFACT_ID")
+
+        if group_id and artifact_id:
+            # Proper Maven PURL: pkg:maven/group.id/artifact@version
+            purl = f"pkg:maven/{group_id}/{artifact_id}@{version}"
+            return (version, purl)
+        else:
+            # Fallback: use BPN as artifact name without group
+            bpn = d.getVar("BPN")
+            if bpn:
+                # Remove maven- or java- prefix if present
+                if bpn.startswith('maven-'):
+                    name = bpn[6:]
+                elif bpn.startswith('java-'):
+                    name = bpn[5:]
+                else:
+                    name = bpn
+                purl = f"pkg:maven/{name}@{version}"
+                return (version, purl)
+
+    # Fallback: use pkg:generic for source downloads without specific ecosystem
+    # This covers C/C++ libraries and other non-ecosystem packages
+    bpn = d.getVar("BPN")
+    if version and bpn:
+        # Generic PURL for source tarballs (e.g., zlib, openssl, curl)
+        # The built package will have pkg:yocto/... PURL
+        purl = f"pkg:generic/{bpn}@{version}"
+        return (version, purl)
+
+    return (version, None)
+
+
 def add_download_files(d, objset):
     inputs = set()
 
@@ -408,6 +557,9 @@ def add_download_files(d, objset):
                 inputs.add(file)
 
         else:
+            # Extract version and PURL for dependency packages using recipe metadata
+            dep_version, dep_purl = extract_dependency_metadata(d, file_name)
+
             dl = objset.add(
                 oe.spdx30.software_Package(
                     _id=objset.new_spdxid("source", str(download_idx + 1)),
@@ -420,6 +572,14 @@ def add_download_files(d, objset):
                 )
             )
 
+            # Add version if extracted
+            if dep_version:
+                dl.software_packageVersion = dep_version
+
+            # Add PURL if generated
+            if dep_purl:
+                dl.software_packageUrl = dep_purl
+
             if fd.method.supports_checksum(fd):
                 # TODO Need something better than hard coding this
                 for checksum_id in ["sha256", "sha1"]:
-- 
2.52.0


