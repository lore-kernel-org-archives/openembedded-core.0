Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EE1CDE003
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 14:17:18 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8327.1782310635416988955
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 07:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=njxEoGbw;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-69d7cdd3b8eso492680eaf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 07:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782310634; x=1782915434; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1rDxp64fdPgbXM5Zf3bNxtr08INlnOQhd4YktZ+4OA=;
        b=njxEoGbwNmIJ/Rx2E2ZQ9c8Z4VJ7KIKzt/gRXnM2JrXDwV5Nzewcj4BWocs7EbVa0Z
         MF0fzaw5mpIzRKFIYW6n1ukXbJkPiXFVwYVVpWcX0Ds1Du17/aHTP8Ym+pWpNDvHMSe+
         TMmxixX/aWDMPNvly07m9U1XYzwMijqK788fjZ3H9tr8bw5teVbbyEAAutYoTeYTp6+L
         cSgP4ekBh7usMc9vCGfvbvh9CgjfyVWybUlpGQu0ozlgwyHk2EkyLRzqfDt3SCS1Z1z0
         GOtiZHDRNCb/UyfU8ymMr4AuB/emlVvGjIW6+q+yJCqGJeS/BTysFYhC/u82g7LG3I43
         orRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782310634; x=1782915434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+1rDxp64fdPgbXM5Zf3bNxtr08INlnOQhd4YktZ+4OA=;
        b=njM8Lm+uZgoMp3iz98EhH2y5oKZzqD0d8oPi4uk5CBfkCLrI6uRFRKmxtrnI/Twlr+
         NQPU+rx3SSTEgIDvoMRLzZS7o8rBe++fMBKCE5k9V/Jz9rX5pRpWIy4yjma8RNu6fT0K
         gRgRDKOesePZ1aofUsn0c9E0+95ZGFryRh5+WwTvTdh7oGYQgI1KPDrMBAQTmIf/XHH2
         RI+jctFkpFhYWxINgJtjQip3y82CjSTBijPDSWXRSZPp6Z3lfrFdIwxxW7ECaoVHkQdd
         X89fMC+qAZBO8WVU8hkij6EHjPralnqgrwRcgQtnqhDJG8FEscGQNN/ET4dRTGL4Bm8v
         /uKw==
X-Gm-Message-State: AOJu0YxARy0QZTjCh9LOXr00b36URznkuKjH8l189QrvlRXSvT8GzQoC
	fREvsKpI9x7Qe8rrbOyC//UsomkR/YUmjfnX+FFCnnFx4w22Dck7EbAn1RlOEw==
X-Gm-Gg: AfdE7cnt1GiJcPSq5wPdGB7VSXBdlkOBpOsdXGh0XDLuBCT/13dwaJoktF8P94x0Pzd
	hTlKYXYT5inGZuVZubUc6ur9y9m1mHIFMUBXlPBn0fVN74YgFQaWJSCwMI+fU4pPnRBOt2OyFVq
	LS9D18d13qd/1b0PCL7B8WK49F9JwTxd9ydi5EYMXUjn5ApgYauPd+7V60xqmKcdBC7BYXU6vsQ
	KJB/zxU4oEbofsWfaBofDU4dfp/Oo1GI9Q68jolI7fgglPwgCaxExaa5yUXrJsdVxkKMkzEd3aq
	Sw3dRC+2u+y+WdLvs9UqYg3k4WGrDcHnGbxyTENVUCutYyJR1ycYWv6zlWe0RQlcr18DhvYjeb6
	DQyBS67Lx2bG0oljDrv9s+dUnm1eWdioW1SD1IcP53mjf52nGAPJ0JIZGzZGk4yrQKKeF4nMstd
	5TzC2JHTPxtA==
X-Received: by 2002:a05:6820:2211:b0:6a1:1a19:3f9c with SMTP id 006d021491bc7-6a123029614mr2309389eaf.54.1782310634492;
        Wed, 24 Jun 2026 07:17:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::87cd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a0e9f2a4e9sm8946149eaf.2.2026.06.24.07.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:17:13 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 6/8] spdx: Replace do_create_image_spdx with deploy task
Date: Wed, 24 Jun 2026 08:15:23 -0600
Message-ID: <20260624141706.2164567-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624141706.2164567-1-JPEWhacker@gmail.com>
References: <20260618165032.347436-1-JPEWhacker@gmail.com>
 <20260624141706.2164567-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 14:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239515

Replaces the dedicated do_create_image_spdx task with a deploy task tied
to do_image_complete (which is task that deploys images).

This has the advantage that images recipe SPDX dependencies are now
completely automatically detected in the task graph, and the SPDX
documents are merged in automatically when dependencies on
do_image_complete are detected

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../create-spdx-image-3.0.bbclass             | 32 +++++++------------
 meta/classes-recipe/nospdx.bbclass            |  1 -
 meta/classes/create-spdx-3.0.bbclass          |  3 --
 meta/classes/spdx-common.bbclass              |  1 -
 meta/lib/oe/spdx30_tasks.py                   | 21 ++++++++----
 5 files changed, 26 insertions(+), 32 deletions(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index a96cfb25ed..838a82c802 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -30,7 +30,7 @@ python do_create_rootfs_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_rootfs_spdx(d)
 }
-addtask do_create_rootfs_spdx after do_rootfs do_create_recipe_spdx before do_image
+addtask do_create_rootfs_spdx after do_rootfs do_create_recipe_spdx before do_image do_image_complete
 SSTATETASKS += "do_create_rootfs_spdx"
 do_create_rootfs_spdx[sstate-inputdirs] = "${SPDXROOTFSDEPLOY}"
 do_create_rootfs_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
@@ -43,33 +43,25 @@ python do_create_rootfs_spdx_setscene() {
 }
 addtask do_create_rootfs_spdx_setscene
 
-python do_create_image_spdx() {
+python create_image_spdx() {
     import oe.spdx30_tasks
-    oe.spdx30_tasks.create_image_spdx(d)
-}
-addtask do_create_image_spdx after do_image_complete do_create_rootfs_spdx do_create_recipe_spdx before do_build
-SSTATETASKS += "do_create_image_spdx"
-SSTATE_SKIP_CREATION:task-create-image-spdx = "1"
-do_create_image_spdx[sstate-inputdirs] = "${SPDXIMAGEWORK}"
-do_create_image_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
-do_create_image_spdx[cleandirs] = "${SPDXIMAGEWORK}"
-do_create_image_spdx[dirs] = "${SPDXIMAGEWORK}"
-do_create_image_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
-do_create_image_spdx[vardeps] += "\
-    SPDX_IMAGE_PURPOSE \
-    "
+    from pathlib import Path
+    current_task = "do_" + d.getVar("BB_CURRENTTASK")
 
-python do_create_image_spdx_setscene() {
-    sstate_setscene(d)
-}
-addtask do_create_image_spdx_setscene
+    spdxdeploydir = Path(d.getVar("SPDXDIR") + "/deploy-" + current_task)
 
+    oe.spdx30_tasks.create_image_spdx(d, spdxdeploydir)
+}
+oe.spdx30_tasks.create_image_spdx[vardeps] += "SPDX_IMAGE_PURPOSE"
+SPDX_DEPLOY_TASKS += "do_image_complete:create_image_spdx"
+# No deploy sbom is needed since do_create_image_sbom_spdx() is used instead
+SPDX_DEPLOY_SBOM = "0"
 
 python do_create_image_sbom_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_image_sbom_spdx(d)
 }
-addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build
+addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_image_complete before do_build
 SSTATETASKS += "do_create_image_sbom_spdx"
 SSTATE_SKIP_CREATION:task-create-image-sbom = "1"
 do_create_image_sbom_spdx[sstate-inputdirs] = "${SPDXIMAGEDEPLOYDIR}"
diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-recipe/nospdx.bbclass
index b405f57d11..9c30c4d2c0 100644
--- a/meta/classes-recipe/nospdx.bbclass
+++ b/meta/classes-recipe/nospdx.bbclass
@@ -9,6 +9,5 @@ deltask do_create_spdx
 deltask do_create_spdx_runtime
 deltask do_create_package_spdx
 deltask do_create_rootfs_spdx
-deltask do_create_image_spdx
 deltask do_create_image_sbom
 deltask do_create_deploy_sbom
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 13d1de2774..919de094f8 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -373,9 +373,6 @@ python () {
         # for the recipe, at least until it's possible for do_populate_sysroot
         # to describe it's own output.
         "do_populate_sysroot": "do_create_spdx",
-        # If an image is needed, also depend on the task to create the SBoM for
-        # the image
-        "do_image_complete": "do_create_image_spdx",
     }
 
     def map_task_deps(task, flag):
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index bca169670d..13839aac3a 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -15,7 +15,6 @@ CVE_VERSION ??= "${PV}"
 SPDXDIR ??= "${WORKDIR}/spdx/${SPDX_VERSION}"
 SPDXDEPLOY = "${SPDXDIR}/deploy"
 SPDXWORK = "${SPDXDIR}/work"
-SPDXIMAGEWORK = "${SPDXDIR}/image-work"
 SPDXSDKWORK = "${SPDXDIR}/sdk-work"
 SPDXSDKEXTWORK = "${SPDXDIR}/sdk-ext-work"
 SPDXDEPS = "${SPDXDIR}/deps.json"
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index c58c8c30e1..79c608d8e5 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1540,19 +1540,19 @@ def create_rootfs_spdx(d):
     )
 
 
-def create_image_spdx(d):
+def create_image_spdx(d, spdx_deploy_dir):
     import oe.sbom30
 
+    pn = d.getVar("PN")
+    current_task = "do_" + d.getVar("BB_CURRENTTASK")
+
     image_deploy_dir = Path(d.getVar("IMGDEPLOYDIR"))
     manifest_path = Path(d.getVar("IMAGE_OUTPUT_MANIFEST"))
-    spdx_work_dir = Path(d.getVar("SPDXIMAGEWORK"))
 
     image_basename = d.getVar("IMAGE_BASENAME")
     machine = d.getVar("MACHINE")
 
-    objset = oe.sbom30.ObjectSet.new_objset(
-        d, "%s-%s-image" % (image_basename, machine)
-    )
+    objset = oe.sbom30.ObjectSet.new_objset(d, f"{pn}-{current_task}-deploy")
 
     with manifest_path.open("r") as f:
         manifest = json.load(f)
@@ -1645,13 +1645,18 @@ def create_image_spdx(d):
     objset.add_aliases()
     objset.link()
     oe.sbom30.write_recipe_jsonld_doc(
-        d, objset, "image", spdx_work_dir, create_task_link=True
+        d,
+        objset,
+        "deploy",
+        spdx_deploy_dir,
+        create_task_link=True,
     )
 
 
 def create_image_sbom_spdx(d):
     import oe.sbom30
 
+    pn = d.getVar("PN")
     image_name = d.getVar("IMAGE_NAME")
     image_basename = d.getVar("IMAGE_BASENAME")
     image_link_name = d.getVar("IMAGE_LINK_NAME")
@@ -1673,7 +1678,9 @@ def create_image_sbom_spdx(d):
     root_elements.append(oe.sbom30.get_element_link_id(rootfs_image))
 
     image_objset, _ = oe.sbom30.find_jsonld(
-        d, "image", "%s-%s-image" % (image_basename, machine), required=True
+        d,
+        "deploy",
+        f"{pn}-do_image_complete-deploy",
     )
     for o in image_objset.foreach_root(oe.spdx30.software_File):
         root_elements.append(oe.sbom30.get_element_link_id(o))
-- 
2.54.0


