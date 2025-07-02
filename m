Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CFBC83F09
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 14:25:45 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.25258.1751466340046525481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 07:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dZ6m/zc8;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b34a78bb6e7so3392536a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751466339; x=1752071139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFLitUiX8TRnyEE0mFqT3Wp1j/yMzeOHIs/CIxKXlt8=;
        b=dZ6m/zc8X5/aV8DOSy2z63BvvPgB12S+ywO5BAgWq5o2e0x8LlekwoWAJuYCzpEhT0
         VwiQH1OaLr5KShge69/XO1nJDb1fxsMXFRvrxUKJjyt+ivUHpBkBKKarDgPoBYRJKLtd
         zmk5gRX5HiDmqcwjICnR/OzJiZr8ZO1Poellc8uZ21DKK9Q0vTyDmpiRx/KiljBSzsYT
         FxAz29TVDpeGuGHCcZDaL2/m1e+jJO4GpdiiLucAzKzfJAEXCDSoWFHrjlAymm9Y6ZSY
         cP00mqhRQAfrrZrxKLUopkt6P4iupvyppZC9waK/6oFeeQTmY9vw19euxTgaHPL8S29e
         dTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466339; x=1752071139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFLitUiX8TRnyEE0mFqT3Wp1j/yMzeOHIs/CIxKXlt8=;
        b=s7SfPJlWxVK4WIuzScq50TOVRZqmLnOyK3QkUHcQK620nTgtTX8R4C5haioJrjUKIK
         ybHNr5Je0MBCXVPqlsTbSd/RUYlaVgIW5ir1sebtlhCHR210X3q1owA0ZYqm5xDMHWBq
         d4JT9w05ZutNFzzPq1qqr6UOHgCPuoU74QQJhjVMb+eJP0GX2s8GIPatOm4cVV5Hz9RP
         ATrtn6SP4/cxDF9gwNGu3D1o3OF2/bTxz+MQblqERWfXpHtCegn9p+0nCIcn+a2ta8tX
         rlzU0OBDnV0Akx+2E5tt2/UJPuLYJRRgJtwHb6DKpObLRLeXPUSRmhHKWR3eaGmrSISJ
         i34Q==
X-Gm-Message-State: AOJu0YxjIktQCBOH43KzQUHloghmvAoxTKhPMp/hsL2/Toiquzg8p+5J
	ciIZgoyS6eztxv6HDGAMfi0x/QO5zIdWQVkcA0YoFhr4D2PQimkJvJVqNZlZoNcBvHTQ+oV4qbh
	Q+SqY
X-Gm-Gg: ASbGnct7fvm47uvEV66md8sQBxotpSvkyoi4n3UUxvRO3hj0hZ/QUK+58vb+W69Vxqw
	S9wFa2RIyZHy7uAeMkSEr4AnIZRu0zeKeCXuDb0qrkONt1KYugUaTE+Y0SafiysUOqtip9Jm1By
	8jcnf523Y8J+KrSfyy7ePBDCl32xpqjY/r3cHtPIx1KpV4MFIEm+repJ2wnLU1/jtvu2otsvTsb
	aSdE6G6rC+wD3M6v1jOc5oCPjHiUToNvk7n/8t8s6XuGhkSyL/ARju3aXxgNsHVv1bBj4x484L4
	FV8ViZ9Pu84Lv/jl/sOw0XTmAvUROvYmrIICAkYb7HJF5OBXrd8MbQ==
X-Google-Smtp-Source: AGHT+IHm15karWLnb7rdpPynMmTULaG6Vj5+YbtIU+7inQGsrgRE/VD59M5oeo25Fu8TuygItWjvIQ==
X-Received: by 2002:a17:90b:54d0:b0:311:fde5:c4be with SMTP id 98e67ed59e1d1-31a90c352d5mr4752233a91.35.1751466339045;
        Wed, 02 Jul 2025 07:25:39 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:acee:7642:9516:37b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c15232c9sm14871637a91.45.2025.07.02.07.25.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:25:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/9] spdx: add option to include only compiled sources
Date: Wed,  2 Jul 2025 07:25:21 -0700
Message-ID: <5396e9b81e88ac2b1141c7f5dd7a7e6ba4fc73f9.1751466215.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751466215.git.steve@sakoman.com>
References: <cover.1751466215.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 14:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219840

From: Daniel Turull <daniel.turull@ericsson.com>

When SPDX_INCLUDE_COMPILED_SOURCES is enabled, only include the
source code files that are used during compilation.

It uses debugsource information generated during do_package.

This enables an external tool to use the SPDX information to disregard
vulnerabilities that are not compiled.

As example, when used with the default config with linux-yocto, the spdx size is
reduced from 156MB to 61MB.

Tested with bitbake world on oe-core.

(From OE-Core rev: c6a2f1fca76fae4c3ea471a0c63d0b453beea968)
Adapted to existing files for create-spdx-2.2

CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/create-spdx-2.2.bbclass | 12 ++++++++
 meta/lib/oe/spdx.py                  | 42 ++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index ade1a04be3..1fc11ad7ac 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -100,6 +100,9 @@ python() {
         # Transform the license array to a dictionary
         data["licenses"] = {l["licenseId"]: l for l in data["licenses"]}
         d.setVar("SPDX_LICENSE_DATA", data)
+
+    if d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") == "1":
+        d.setVar("SPDX_INCLUDE_SOURCES", "1")
 }
 
 def convert_license_to_spdx(lic, document, d, existing={}):
@@ -215,6 +218,11 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
     spdx_files = []
 
     file_counter = 1
+
+    check_compiled_sources = d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") == "1"
+    if check_compiled_sources:
+        compiled_sources, types = oe.spdx.get_compiled_sources(d)
+        bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
     for subdir, dirs, files in os.walk(topdir):
         dirs[:] = [d for d in dirs if d not in ignore_dirs]
         if subdir == str(topdir):
@@ -225,6 +233,10 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
             filename = str(filepath.relative_to(topdir))
 
             if not filepath.is_symlink() and filepath.is_file():
+                # Check if file is compiled
+                if check_compiled_sources:
+                     if not oe.spdx.is_compiled_source(filename, compiled_sources, types):
+                          continue
                 spdx_file = oe.spdx.SPDXFile()
                 spdx_file.SPDXID = get_spdxid(file_counter)
                 for t in get_types(filepath):
diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
index 7aaf2af5ed..92dcd2da05 100644
--- a/meta/lib/oe/spdx.py
+++ b/meta/lib/oe/spdx.py
@@ -355,3 +355,45 @@ class SPDXDocument(SPDXObject):
             if r.spdxDocument == namespace:
                 return r
         return None
+
+def is_compiled_source (filename, compiled_sources, types):
+    """
+    Check if the file is a compiled file
+    """
+    import os
+    # If we don't have compiled source, we assume all are compiled.
+    if not compiled_sources:
+        return True
+
+    # We return always true if the file type is not in the list of compiled files.
+    # Some files in the source directory are not compiled, for example, Makefiles,
+    # but also python .py file. We need to include them in the SPDX.
+    basename = os.path.basename(filename)
+    ext = basename.partition(".")[2]
+    if ext not in types:
+        return True
+    # Check that the file is in the list
+    return filename in compiled_sources
+
+def get_compiled_sources(d):
+    """
+    Get list of compiled sources from debug information and normalize the paths
+    """
+    import itertools
+    import oe.package
+    source_info = oe.package.read_debugsources_info(d)
+    if not source_info:
+        bb.debug(1, "Do not have debugsources.list. Skipping")
+        return [], []
+
+    # Sources are not split now in SPDX, so we aggregate them
+    sources = set(itertools.chain.from_iterable(source_info.values()))
+    # Check extensions of files
+    types = set()
+    for src in sources:
+        basename = os.path.basename(src)
+        ext = basename.partition(".")[2]
+        if ext not in types and ext:
+            types.add(ext)
+    bb.debug(1, f"Num of sources: {len(sources)} and types: {len(types)} {str(types)}")
+    return sources, types
-- 
2.43.0


