Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA46E69173
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 15:49:56 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.27414.1732290588132316483
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 07:49:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m1KaFT7I;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-296c184ed6bso1380522fac.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 07:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732290587; x=1732895387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=thPXeSQwUBOWjXbRIk2902YKZ1SdNPnMMMc/Eqqg/N8=;
        b=m1KaFT7IbGnEP3Edsnnz2Vga56W7JVBt/l5LXTY1XSXzPEpkRuQbD6l6K+REPLbM91
         4US9A89qQNgcDVwFGHX6Wm88+tHTIwt/eNX2M3rYMNRwOvasdYDyssm9mKXhET27cyIG
         qWeYHC6NUDsl8O9IyCp40MqI4kAWLhBKthqqacQTg0m9k5uMdS+GFkERlmO6lPt1XoQR
         2RLJ+Rtoo7NmrsYRFJ+p4MsEWIH4wbuHVEH/5zpG+wJzonC7wf4LnsWb9gvpeiI/bGls
         yxDpKdJfoCEhzAtvlmttmmXHQRL6Fk4yP+Y4OVKZ5jGhlh2mCYnlpNhwrWP6eGRvYQYR
         8buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732290587; x=1732895387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=thPXeSQwUBOWjXbRIk2902YKZ1SdNPnMMMc/Eqqg/N8=;
        b=Bc0vWAzOxKKCmGrSnuMwX2Jx7WCG5bjJO/IOaqucq0tNW49pdelwf0ULsRbe6RWYKz
         M5dnSJXwtcsvRmFNaEalZQYJ9mes59bSi/sclbQY8+gZc4Ca87k/rlE2KOYSxf/BOfwZ
         enWG0Flea+2pGuf/aMreETTNU/8cp3UdALH3aX+/D9PtZ5iZpLWt+lKc23XuNi0Kr3e/
         0nrLB2dx+NR1ad4k+lJCLhxtbgv5VYXCBRiBzhsnp6gTs15plAlEMu82Og86h3xKk6qb
         Cr9RLkJAD/ZFb6Dc2ZEHm1mrzDMN0IoP/Y6Ee/RqFgOnF8KvGs3N9QreO+9hJzmZoGuX
         j7Cg==
X-Gm-Message-State: AOJu0YwdGADGVmoylLgiCWeCJD1dY3O0YSsMg0LzqTRB3IiQI9FtW2o9
	FRgyiOJX4GKB0sKBU/D8jmjnIAnW+NVYXck5AfYkUI7HpOomSoQQMd0c2w==
X-Gm-Gg: ASbGncsnS23KvW18riI/5L4LzHKxwgBsh9SZNVk4nq1oqro/cOu/30o7p9O68HspVtt
	JinK9eg3V7B+arIuTg0YgEWCQYeO2EVQlJNd0JxNVLXBCg8QJND6U4aJ8wd0i5HjNxpl4RMxcJ6
	t1hMvbzcL7S8F5d/XlUxUxGLTG1uqNe97CoOrCvzZzvvbvFVFK239/rDS9GpvdKy1bEdzTGsd8R
	8vMa5kWavjTj+H8pN0QvyrpXQ3nvgESi+eKuXq4BUFZvhS8
X-Google-Smtp-Source: AGHT+IEQI2cGZVqfNZhQN2/A72d25PSoCzi9q6OePKLZIWT4CIyrrbPv56ovCRpHfsjUnl9QjN/2oQ==
X-Received: by 2002:a05:6870:7013:b0:294:cac8:c780 with SMTP id 586e51a60fabf-29720b46073mr3551742fac.6.1732290586691;
        Fri, 22 Nov 2024 07:49:46 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::dc1a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2971d5e89afsm606442fac.21.2024.11.22.07.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 07:49:45 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] spdx: Fix SPDX tasks not running when code changes
Date: Fri, 22 Nov 2024 08:49:39 -0700
Message-ID: <20241122154939.2133845-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 15:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207626

The SPDX code makes heavy use of python classes. While this works very
well, the bitbake dependency parser is unable to understand how to deal
with them, and thus changes to the class code do not cause rebuilds to
occur. To correct this, add the library files that include SPDX code as
file checksums for the SPDX tasks. If this method works well for SPDX,
we will look at implementing something similar in the bitbake dependency
parser that should allow correct checksums without having to explicitly
add them to each class.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/create-spdx-image-3.0.bbclass | 3 +++
 meta/classes-recipe/create-spdx-sdk-3.0.bbclass   | 2 ++
 meta/classes/create-spdx-3.0.bbclass              | 9 +++++++++
 3 files changed, 14 insertions(+)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index 18e6cf6dfa2..51446162857 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -36,6 +36,7 @@ do_create_rootfs_spdx[sstate-inputdirs] = "${SPDXROOTFSDEPLOY}"
 do_create_rootfs_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
 do_create_rootfs_spdx[recrdeptask] += "do_create_spdx do_create_package_spdx"
 do_create_rootfs_spdx[cleandirs] += "${SPDXROOTFSDEPLOY}"
+do_create_rootfs_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
 
 python do_create_rootfs_spdx_setscene() {
     sstate_setscene(d)
@@ -53,6 +54,7 @@ do_create_image_spdx[sstate-inputdirs] = "${SPDXIMAGEWORK}"
 do_create_image_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
 do_create_image_spdx[cleandirs] = "${SPDXIMAGEWORK}"
 do_create_image_spdx[dirs] = "${SPDXIMAGEWORK}"
+do_create_image_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
 
 python do_create_image_spdx_setscene() {
     sstate_setscene(d)
@@ -72,6 +74,7 @@ do_create_image_sbom_spdx[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_create_image_sbom_spdx[stamp-extra-info] = "${MACHINE_ARCH}"
 do_create_image_sbom_spdx[cleandirs] = "${SPDXIMAGEDEPLOYDIR}"
 do_create_image_sbom_spdx[recrdeptask] += "do_create_spdx do_create_package_spdx"
+do_create_image_sbom_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
 
 python do_create_image_sbom_spdx_setscene() {
     sstate_setscene(d)
diff --git a/meta/classes-recipe/create-spdx-sdk-3.0.bbclass b/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
index ea01a21cc59..855fb3d09f9 100644
--- a/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-sdk-3.0.bbclass
@@ -8,12 +8,14 @@
 do_populate_sdk[recrdeptask] += "do_create_spdx do_create_package_spdx"
 do_populate_sdk[cleandirs] += "${SPDXSDKWORK}"
 do_populate_sdk[postfuncs] += "sdk_create_sbom"
+do_populate_sdk[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
 POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk = " sdk_host_create_spdx"
 POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk = " sdk_target_create_spdx"
 
 do_populate_sdk_ext[recrdeptask] += "do_create_spdx do_create_package_spdx"
 do_populate_sdk_ext[cleandirs] += "${SPDXSDKEXTWORK}"
 do_populate_sdk_ext[postfuncs] += "sdk_ext_create_sbom"
+do_populate_sdk_ext[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
 POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk-ext = " sdk_ext_host_create_spdx"
 POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk-ext = " sdk_ext_target_create_spdx"
 
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index bc23d2d2115..640f5490bda 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -122,6 +122,13 @@ oe.spdx30_tasks.get_package_sources_from_debug[vardepsexclude] += "STAGING_KERNE
 oe.spdx30_tasks.collect_dep_objsets[vardepsexclude] = "SPDX_MULTILIB_SSTATE_ARCHS"
 
 
+# SPDX library code makes heavy use of classes, which bitbake cannot easily
+# parse out dependencies. As such, the library code files that make use of
+# classes are explicitly added as file checksum dependencies.
+SPDX3_LIB_DEP_FILES = "\
+    ${COREBASE}/meta/lib/oe/sbom30.py:True \
+    ${COREBASE}/meta/lib/oe/spdx30.py:True \
+    "
 
 python do_create_spdx() {
     import oe.spdx30_tasks
@@ -137,6 +144,7 @@ addtask do_create_spdx after \
 SSTATETASKS += "do_create_spdx"
 do_create_spdx[sstate-inputdirs] = "${SPDXDEPLOY}"
 do_create_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
+do_create_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
 
 python do_create_spdx_setscene () {
     sstate_setscene(d)
@@ -160,6 +168,7 @@ addtask do_create_package_spdx after do_create_spdx before do_build do_rm_work
 SSTATETASKS += "do_create_package_spdx"
 do_create_package_spdx[sstate-inputdirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_package_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
+do_create_package_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
 
 python do_create_package_spdx_setscene () {
     sstate_setscene(d)
-- 
2.47.0


