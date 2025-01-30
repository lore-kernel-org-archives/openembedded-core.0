Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323A2C0218F
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 13:37:40 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.15385.1738244253942872685
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 05:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cvBS6D6T;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so1421627a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 05:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738244252; x=1738849052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DyBNdUW9YjvkkuQLe3CntpEg2vNEL8JWWYJQjZcsCTw=;
        b=cvBS6D6T7d6oPqMN145QMT9J9MjxnK1NUZyHDWVY/Zgcjjb2yVZ6BOh9JZ7F/pIoRG
         WUDdYCJFm1sFXcXfLrgWI4NcVZErEQ2aNFvenzCsuuwnolAXprm08RWYf3sMKBt98ftZ
         1jpCXUSA12MGa+6mSqtMvillgIs4ZSup6PN4PXM+nsShbpT10ldLP/RWmVaBFKc9LGty
         ry9v2Wm+CWWdwt+R1krVAYJVekJwjvuv3cgk1a3EkmgR7YQ4CxXwdp0EFLGo8AeHfkSf
         rAZqWNQnaY5nCcCQHQhLuKth7QoFNbJSuPh/jsRCCpjdZox0gH/7FsuzReqiASW2HpzP
         eD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738244252; x=1738849052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyBNdUW9YjvkkuQLe3CntpEg2vNEL8JWWYJQjZcsCTw=;
        b=bsbqa9p2eLwKRN0c2cHwojtIfC11+X9JEh7ES8K7nDMo+p4vmFrOd1fbjc3F6ByjTa
         f2Ag7kEw6jsSZPMUaLVN0jkEhadvqqZWQrgJvKmdJHi5PVYLrJ1HmLKJeh6bLb2eoOy/
         GECmHkpQyonRnQjCyW7Mvv79ivydEfE2OiNTUGQ4QRGypQkjWtnJjMh5WCoFEuh8Wi9Q
         +zWBf9FAtgzU77nO9I1ggNpW4Mp31wK0qMI0OQyhLAOgsIqjDNnpPAYDZc/QrHPgckuR
         XVYPQkBts55rsJBthHOweqcSoJJOmXbva5y7I0y3BeVgg0+4aKEtfLG7uEmoHq1Fpy1i
         Puog==
X-Gm-Message-State: AOJu0YzcYqsewpqrKXjMLSbKT6bHymb6r7eBZhw1T4GaYQKKY+hbTD7K
	+4BZ7xowXTurErTfaoa9U4SXIGs+88RaXLTWrA2e2lnwVJxChzHYSUZdnEam
X-Gm-Gg: ASbGncsd5fh02WCqToGI/yq0YMpKbUdrC8Hu/Ev3KpRWAcukI5KMKaIvwqTOz7OAFxr
	rji1H6FXj53DFn+46YFLIuwhJPpai3DZGeSjfu0NgHzrxN4Y5SnhffU9echXqL5dBTlunhYlGXM
	ImnfNRqV9ibtUqNh+a1sNae9f+71qs/9ju4e+2tSKKqs4JNYFI2SsxUXx3F678/S3+7+Crfxb9r
	O3bRqj6eEShBA8Mvijtxq5rMzuLB13ZC+1vexEgmfrkPVqwnGlnkjjnCG+N9AIMrPXqLxaSVaYu
	MDuTdPIbkzC0CfYHTugFnICJFA==
X-Google-Smtp-Source: AGHT+IEN7ztU99fwyLOAJiFkZUVeZpOVdc8FZt01OQSQC35KdZLuzB9tjMS45E51JNvOAtKmKVzj3w==
X-Received: by 2002:a05:6402:5251:b0:5d9:cde9:29c6 with SMTP id 4fb4d7f45d1cf-5dc5effb151mr6387125a12.27.1738244251638;
        Thu, 30 Jan 2025 05:37:31 -0800 (PST)
Received: from talyn.guest.local ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723ea1d0sm1079063a12.29.2025.01.30.05.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 05:37:31 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] spdx30: Include files in rootfs
Date: Thu, 30 Jan 2025 06:37:27 -0700
Message-ID: <20250130133727.988405-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 13:37:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210445

Adds a "contains" relationship that relates the root file system package
to the files contained in it. If a package provides a file with a
matching hash and path, it will be linked, otherwise a new File element
will be created

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 46 ++++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 658e533d758..6a39246fe1c 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -964,7 +964,7 @@ def write_bitbake_spdx(d):
     oe.sbom30.write_jsonld_doc(d, objset, deploy_dir_spdx / "bitbake.spdx.json")
 
 
-def collect_build_package_inputs(d, objset, build, packages):
+def collect_build_package_inputs(d, objset, build, packages, files_by_hash=None):
     import oe.sbom30
 
     providers = oe.spdx_common.collect_package_providers(d)
@@ -980,7 +980,7 @@ def collect_build_package_inputs(d, objset, build, packages):
         pkg_name, pkg_hashfn = providers[name]
 
         # Copy all of the package SPDX files into the Sbom elements
-        pkg_spdx, _ = oe.sbom30.find_root_obj_in_jsonld(
+        pkg_spdx, pkg_objset = oe.sbom30.find_root_obj_in_jsonld(
             d,
             "packages",
             "package-" + pkg_name,
@@ -989,6 +989,10 @@ def collect_build_package_inputs(d, objset, build, packages):
         )
         build_deps.add(oe.sbom30.get_element_link_id(pkg_spdx))
 
+        if files_by_hash is not None:
+            for h, f in pkg_objset.by_sha256_hash.items():
+                files_by_hash.setdefault(h, set()).update(f)
+
     if missing_providers:
         bb.fatal(
             f"Unable to find SPDX provider(s) for: {', '.join(sorted(missing_providers))}"
@@ -1008,6 +1012,7 @@ def create_rootfs_spdx(d):
     deploydir = Path(d.getVar("SPDXROOTFSDEPLOY"))
     root_packages_file = Path(d.getVar("SPDX_ROOTFS_PACKAGES"))
     image_basename = d.getVar("IMAGE_BASENAME")
+    image_rootfs = d.getVar("IMAGE_ROOTFS")
     machine = d.getVar("MACHINE")
 
     with root_packages_file.open("r") as f:
@@ -1037,7 +1042,42 @@ def create_rootfs_spdx(d):
         [rootfs],
     )
 
-    collect_build_package_inputs(d, objset, rootfs_build, packages)
+    files_by_hash = {}
+    collect_build_package_inputs(d, objset, rootfs_build, packages, files_by_hash)
+
+    files = set()
+    for dirpath, dirnames, filenames in os.walk(image_rootfs):
+        for fn in filenames:
+            fpath = Path(dirpath) / fn
+            if not fpath.is_file() or fpath.is_symlink():
+                continue
+
+            relpath = str(fpath.relative_to(image_rootfs))
+            h = bb.utils.sha256_file(fpath)
+
+            found = False
+            if h in files_by_hash:
+                for f in files_by_hash[h]:
+                    if isinstance(f, oe.spdx30.software_File) and f.name == relpath:
+                        files.add(oe.sbom30.get_element_link_id(f))
+                        found = True
+                        break
+
+            if not found:
+                files.add(
+                    objset.new_file(
+                        objset.new_spdxid("rootfs-file", relpath),
+                        relpath,
+                        fpath,
+                    )
+                )
+
+    if files:
+        objset.new_relationship(
+            [rootfs],
+            oe.spdx30.RelationshipType.contains,
+            sorted(list(files)),
+        )
 
     oe.sbom30.write_recipe_jsonld_doc(d, objset, "rootfs", deploydir)
 
-- 
2.48.1


