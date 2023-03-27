Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC71C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 20:05:51 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.46698.1679947544830156633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 13:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qf6Hiw3g;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-17aaa51a911so10536258fac.5
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 13:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679947543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YK4dRn1xdOZjKQqarg6414j81Wxv9Oh9Y4jU7PdIQ4=;
        b=Qf6Hiw3gMvKWPlwDSaxLtZMqF8b38tvAWnPLrH/7RElRCGVAMBZCMXDRkqJmjNNyU3
         NLzX2D4u938xoEcYSPUjdutXxPtty9Mctki5n80RVrdSz8rq2nSnqVhZQZtjw0qsWFu8
         zYpSgbowQU7IMGACXQu/CNV2lpO0URsPmkwcAZd/KQgLYrhqCA9s24ypaLv/SSsj+kdr
         TFlYpT6Lx2WxTnoAqbzNLOhmEHH6WUhVbmxsI3PitSatSJC8EzqIjriFt8SbonKoeBpy
         N2Y+Wpbc69eVLKteFOvJsMERA2K5yw4P80dDFCDIiZcUIwhbT24TvnXDkUyj3i97r09r
         FGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679947543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/YK4dRn1xdOZjKQqarg6414j81Wxv9Oh9Y4jU7PdIQ4=;
        b=SF4hDK/58Ma+YoLFRrKTgiiiyoBdLL+XLBZRKGpf3ZMjh87Thp53wwOlmUPTWnf5gh
         iycPCP+6plZNF+mwJ8HqaPW+5e8qqyEQ6w1gUvuv70bq5OwIxN7voL/rPhqJZGVAGOc0
         4QCVv0U9cJ4BtzGzdL3HCgWO6g6m017FmjOm7eHO5tViIV9F6qp7APfbL50rEUHirae5
         unaG5VAFNYilLf0FL6L5EDuFLm8dU2ENR45AERUFBNQbgc0T+noO8RgGEDKYnjB1+0Vc
         FgU+2DXky73b9PVr6JLWn75OkNnqNs5ZNTgr6T7+fAaIxZko4/6lmc7+Oqz2RXpcADo5
         eWxQ==
X-Gm-Message-State: AAQBX9czBI+AfPQMwYPxgc3UOxHJEbUYOOJK93JLmVAQ7vjYt5T9zKWY
	YBfc9KpfAvBhicPkFM5u/RH0v4efztQ=
X-Google-Smtp-Source: AKy350YjG+wLUpLonw10ZEEOxWI+/YNlJwcIiGkFvgYKSZUx205DjYesn/7VuGeokI3NjLxXBU+RCQ==
X-Received: by 2002:a05:6870:c6a1:b0:17e:b9f6:5d76 with SMTP id cv33-20020a056870c6a100b0017eb9f65d76mr8231482oab.41.1679947543590;
        Mon, 27 Mar 2023 13:05:43 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id n16-20020a9d6f10000000b0069fa641bd25sm5942988otq.8.2023.03.27.13.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 13:05:42 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][dunfell][PATCH v2 4/5] create-spdx: Use gzip for compression
Date: Mon, 27 Mar 2023 15:05:29 -0500
Message-Id: <20230327200530.3354151-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230327200530.3354151-1-JPEWhacker@gmail.com>
References: <20230322204558.1386634-1-JPEWhacker@gmail.com>
 <20230327200530.3354151-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 20:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179180

The master version of the SPDX classes uses zstd for efficient
compression, but it relies on the zstd tool to be present on the host
system. Since dunfell supports older distros, we don't want to add this
tool as an additional requirement so switch to using gzip instead.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 13d13fe1fc..42b693d586 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -466,13 +466,11 @@ python do_create_spdx() {
     @contextmanager
     def optional_tarfile(name, guard, mode="w"):
         import tarfile
-        import bb.compress.zstd
-
-        num_threads = int(d.getVar("BB_NUMBER_THREADS"))
+        import gzip
 
         if guard:
             name.parent.mkdir(parents=True, exist_ok=True)
-            with bb.compress.zstd.open(name, mode=mode + "b", num_threads=num_threads) as f:
+            with gzip.open(name, mode=mode + "b") as f:
                 with tarfile.open(fileobj=f, mode=mode + "|") as tf:
                     yield tf
         else:
@@ -550,7 +548,7 @@ python do_create_spdx() {
     add_download_packages(d, doc, recipe)
 
     if process_sources(d) and include_sources:
-        recipe_archive = deploy_dir_spdx / "recipes" / (doc.name + ".tar.zst")
+        recipe_archive = deploy_dir_spdx / "recipes" / (doc.name + ".tar.gz")
         with optional_tarfile(recipe_archive, archive_sources) as archive:
             spdx_get_src(d)
 
@@ -618,7 +616,7 @@ python do_create_spdx() {
             package_doc.add_relationship(spdx_package, "GENERATED_FROM", "%s:%s" % (recipe_ref.externalDocumentId, recipe.SPDXID))
             package_doc.add_relationship(package_doc, "DESCRIBES", spdx_package)
 
-            package_archive = deploy_dir_spdx / "packages" / (package_doc.name + ".tar.zst")
+            package_archive = deploy_dir_spdx / "packages" / (package_doc.name + ".tar.gz")
             with optional_tarfile(package_archive, archive_packaged) as archive:
                 package_files = add_package_files(
                     d,
@@ -899,8 +897,8 @@ python image_combine_spdx() {
             if link != target_path:
                 link.symlink_to(os.path.relpath(target_path, link.parent))
 
-    spdx_tar_path = imgdeploydir / (image_name + ".spdx.tar.zst")
-    make_image_link(spdx_tar_path, ".spdx.tar.zst")
+    spdx_tar_path = imgdeploydir / (image_name + ".spdx.tar.gz")
+    make_image_link(spdx_tar_path, ".spdx.tar.gz")
 }
 
 python sdk_host_combine_spdx() {
@@ -931,7 +929,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
     from datetime import timezone, datetime
     from pathlib import Path
     import tarfile
-    import bb.compress.zstd
+    import gzip
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
@@ -1002,8 +1000,8 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
 
     index = {"documents": []}
 
-    spdx_tar_path = rootfs_deploydir / (rootfs_name + ".spdx.tar.zst")
-    with bb.compress.zstd.open(spdx_tar_path, "w", num_threads=num_threads) as f:
+    spdx_tar_path = rootfs_deploydir / (rootfs_name + ".spdx.tar.gz")
+    with gzip.open(spdx_tar_path, "w") as f:
         with tarfile.open(fileobj=f, mode="w|") as tar:
             def collect_spdx_document(path):
                 nonlocal tar
-- 
2.33.0


