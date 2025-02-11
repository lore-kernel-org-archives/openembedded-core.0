Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA576C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:03:35 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.1252.1739286213574015301
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:03:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HtSGXkku;
 spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-851c4ee2a37so444940439f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 07:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739286212; x=1739891012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/9jxyDun4kKdXFutc2D4kxBaW9pi7pM7XmyzrtsYIa4=;
        b=HtSGXkkuNAnaWL26sHBm1f1SyGmhSJDNsw8v4kNphxKKE9JsUJiCBhvbs3ccUKxDf4
         FhCvhjH7ubTKVWzVnzD+X2jPCAGfxslbe6XeePTS2l/jsFEVk+A4Re27myaT4ITBOpLB
         NmChK7yE4S8KuHQGXyYZE2fi2EDhLLA1FOKrYE/x/ss+R0N0VZ45iGSDU3AzWi56fjCr
         5ANQf8aeGtT0VSfIOtNuk2q5w+gho3pKDbCkYiU0UTYC22ZrA/vbzWfwYI93naO5JYNP
         bc+eknbpYU/yFyAemHJLLkNzZ0rD+/bJXW2sTH3FizRJq0pg3VYijq8rGwqXGDSOp/6q
         YmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739286212; x=1739891012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9jxyDun4kKdXFutc2D4kxBaW9pi7pM7XmyzrtsYIa4=;
        b=Z/Yxzbh0T2Zr70JYOqrbMpaVv/L2M0/WgIRcdU2neHi7fvntdYBb1Z7oMMsWem1rTY
         HPp0d/Iu66DiBgHrs/t2gCDbmbJlu5yLgGDwtV3IbIfkQi4HPP8TYiND/UUeNPBkEjhj
         UrRRArw8e4ywCEq8oeJIh2oeSuDdD+W1R0rdtHclBYuDQgyy+9Z5rMERjdgXrNrEcVqP
         C0G2sJN6keb+SXaBtxtPWfjnmU5XDfbldH36bgJF52CrRlW83gOEpkj32zD1aINkiDw9
         eoUg26OKFwjueVuesQWKcdTe6fzDiok3RRNa4bIaR/FOqwVM4/dXlB4vjrUfT6LPqEd0
         F9ow==
X-Gm-Message-State: AOJu0Yz+morBLYJ/NFAqqgA8mo2Ld1JUuzSF50D/M7kaRgJ7uuHNGOmw
	Fy4UIB+y5RBjzhuiBtxi3BO58S5QWFhh3+IkQGjyl8yAfyXva5M0w9/BDUD4
X-Gm-Gg: ASbGncuaO8ksVpB0YFyjVy4Kq1tX5W+chtUCdeLtprKtdWVhS5qwhLvc5spSgCjemf1
	r134Lv4iQtlrb4ajRd0QFaAlGvlu4IY0EcT8EYHky2iygCJbuFaRv74cQcJrEGvIhT2g5QL4xFy
	M+2CrvadWhKEBk4mK1dXD7FeHbNgH8Wv5LTmRKhJqGeJw/MLMCVDMsFdJbztCbGFjL+UqBxvhHu
	hWmUP1RDG+GRaKPprA9mMoV9EdE/c9gqR+ybfW5z9MMbMUVjodPv7nwKsK65gU5ND55lU+CU4va
	pcK5Y8po6WftbrGGmjo=
X-Google-Smtp-Source: AGHT+IFi52LKFpLZvKcbWGyjrHDZE/3a8KsWpg67v/L7Rl9Xi2Z7MC44LAK3aEQeDiH1amBA/FG5Ag==
X-Received: by 2002:a05:6602:15cd:b0:855:371a:ca6e with SMTP id ca18e2360f4ac-855371af229mr672447339f.13.1739286211852;
        Tue, 11 Feb 2025 07:03:31 -0800 (PST)
Received: from talyn.hsd1.co.comcast.net ([2601:282:4300:19e0::977a])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ece2a1f3ecsm2060848173.50.2025.02.11.07.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:03:30 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] scripts/contrib: Add oe-image-files-spdx script
Date: Tue, 11 Feb 2025 08:03:25 -0700
Message-ID: <20250211150325.256258-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211157

Adds a template for a python project that processes the SPDX 3.0.1
output from a build and lists all the files on the root file system with
their checksums

This is intended to be an example to show how to deal with the SPDX data
to do common tasks.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../contrib/oe-image-files-spdx/.gitignore    |  8 ++
 scripts/contrib/oe-image-files-spdx/README.md | 24 ++++++
 .../oe-image-files-spdx/pyproject.toml        | 23 +++++
 .../src/oe_image_files/__init__.py            |  1 +
 .../src/oe_image_files/main.py                | 86 +++++++++++++++++++
 .../src/oe_image_files/version.py             |  1 +
 6 files changed, 143 insertions(+)
 create mode 100644 scripts/contrib/oe-image-files-spdx/.gitignore
 create mode 100644 scripts/contrib/oe-image-files-spdx/README.md
 create mode 100644 scripts/contrib/oe-image-files-spdx/pyproject.toml
 create mode 100644 scripts/contrib/oe-image-files-spdx/src/oe_image_files/__init__.py
 create mode 100644 scripts/contrib/oe-image-files-spdx/src/oe_image_files/main.py
 create mode 100644 scripts/contrib/oe-image-files-spdx/src/oe_image_files/version.py

diff --git a/scripts/contrib/oe-image-files-spdx/.gitignore b/scripts/contrib/oe-image-files-spdx/.gitignore
new file mode 100644
index 00000000000..285851c9848
--- /dev/null
+++ b/scripts/contrib/oe-image-files-spdx/.gitignore
@@ -0,0 +1,8 @@
+*.spdx.json
+*.pyc
+*.bak
+*.swp
+*.swo
+*.swn
+venv/*
+.venv/*
diff --git a/scripts/contrib/oe-image-files-spdx/README.md b/scripts/contrib/oe-image-files-spdx/README.md
new file mode 100644
index 00000000000..44f76eacd8e
--- /dev/null
+++ b/scripts/contrib/oe-image-files-spdx/README.md
@@ -0,0 +1,24 @@
+# OE Image Files from SBoM
+
+This is an example python script that will list the packaged files with their
+checksums based on the SPDX 3.0.1 SBoM.
+
+It can be used as a template for other programs to investigate output based on
+OE SPDX SBoMs
+
+## Installation
+
+This project can be installed using an virtual environment:
+```
+python3 -m venv .venv
+.venv/bin/activate
+python3 -m pip install -e '.[dev]'
+```
+
+## Usage
+
+After installing, the `oe-image-files` program can be used to show the files, e.g.:
+
+```
+oe-image-files core-image-minimal-qemux86-64.rootfs.spdx.json
+```
diff --git a/scripts/contrib/oe-image-files-spdx/pyproject.toml b/scripts/contrib/oe-image-files-spdx/pyproject.toml
new file mode 100644
index 00000000000..3fab5dd605d
--- /dev/null
+++ b/scripts/contrib/oe-image-files-spdx/pyproject.toml
@@ -0,0 +1,23 @@
+[project]
+name = "oe-image-files"
+description = "Displays all packaged files on the root file system"
+dynamic = ["version"]
+requires-python = ">= 3.8"
+readme = "README.md"
+
+dependencies = [
+    "spdx_python_model @ git+https://github.com/spdx/spdx-python-model.git@aa40861f11d1b5d20edba7101835341a70d91179",
+]
+
+[project.scripts]
+oe-image-files = "oe_image_files:main"
+
+[build-system]
+requires = ["hatchling"]
+build-backend = "hatchling.build"
+
+[tool.hatch.version]
+path = "src/oe_image_files/version.py"
+
+[tool.hatch.metadata]
+allow-direct-references = true
diff --git a/scripts/contrib/oe-image-files-spdx/src/oe_image_files/__init__.py b/scripts/contrib/oe-image-files-spdx/src/oe_image_files/__init__.py
new file mode 100644
index 00000000000..c28a133f2dd
--- /dev/null
+++ b/scripts/contrib/oe-image-files-spdx/src/oe_image_files/__init__.py
@@ -0,0 +1 @@
+from .main import main
diff --git a/scripts/contrib/oe-image-files-spdx/src/oe_image_files/main.py b/scripts/contrib/oe-image-files-spdx/src/oe_image_files/main.py
new file mode 100644
index 00000000000..8476bf63696
--- /dev/null
+++ b/scripts/contrib/oe-image-files-spdx/src/oe_image_files/main.py
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: MIT
+
+import argparse
+from pathlib import Path
+
+
+from spdx_python_model import v3_0_1 as spdx_3_0_1
+from .version import VERSION
+
+
+def main():
+    parser = argparse.ArgumentParser(
+        description="Show the packaged files and checksums in an OE image from the SPDX SBoM"
+    )
+    parser.add_argument("file", help="SPDX 3 input file", type=Path)
+    parser.add_argument("--version", "-V", action="version", version=VERSION)
+
+    args = parser.parse_args()
+
+    # Load SPDX data from file into a new object set
+    objset = spdx_3_0_1.SHACLObjectSet()
+    with args.file.open("r") as f:
+        d = spdx_3_0_1.JSONLDDeserializer()
+        d.read(f, objset)
+
+    # Find the top level SPDX Document object
+    for o in objset.foreach_type(spdx_3_0_1.SpdxDocument):
+        doc = o
+        break
+    else:
+        print("ERROR: No SPDX Document found!")
+        return 1
+
+    # Find the root SBoM in the document
+    for o in doc.rootElement:
+        if isinstance(o, spdx_3_0_1.software_Sbom):
+            sbom = o
+            break
+    else:
+        print("ERROR: SBoM not found in document")
+        return 1
+
+    # Find the root file system package in the SBoM
+    for o in sbom.rootElement:
+        if (
+            isinstance(o, spdx_3_0_1.software_Package)
+            and o.software_primaryPurpose == spdx_3_0_1.software_SoftwarePurpose.archive
+        ):
+            root_package = o
+            break
+    else:
+        print("ERROR: Package not found in document")
+        return 1
+
+    # Find all relationships of type "contains" that go FROM the root file
+    # system
+    files = []
+    for rel in objset.foreach_type(spdx_3_0_1.Relationship):
+        if not rel.relationshipType == spdx_3_0_1.RelationshipType.contains:
+            continue
+
+        if not rel.from_ is root_package:
+            continue
+
+        # Iterate over all files in the TO of the relationship
+        for o in rel.to:
+            if not isinstance(o, spdx_3_0_1.software_File):
+                continue
+
+            # Find the SHA 256 hash of the file (if any)
+            for h in o.verifiedUsing:
+                if (
+                    isinstance(h, spdx_3_0_1.Hash)
+                    and h.algorithm == spdx_3_0_1.HashAlgorithm.sha256
+                ):
+                    files.append((o.name, h.hashValue))
+                    break
+            else:
+                files.append((o.name, ""))
+
+    # Print files
+    files.sort(key=lambda x: x[0])
+    for name, hash_val in files:
+        print(f"{name} - {hash_val}")
+
+    return 0
diff --git a/scripts/contrib/oe-image-files-spdx/src/oe_image_files/version.py b/scripts/contrib/oe-image-files-spdx/src/oe_image_files/version.py
new file mode 100644
index 00000000000..901e5110b2e
--- /dev/null
+++ b/scripts/contrib/oe-image-files-spdx/src/oe_image_files/version.py
@@ -0,0 +1 @@
+VERSION = "0.0.1"
-- 
2.48.1


