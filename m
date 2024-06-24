Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29AEC41513
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 15:22:52 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.143786.1719242566545701265
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 08:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UP61Ddkt;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-25ce4902cbfso1351359fac.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 08:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719242564; x=1719847364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K13WodvyVwjJ2bsnV0neBTB8Pqxx5meYMdpMLrHAEjA=;
        b=UP61DdktBD4pxN8joy0qQxNC3oJlHDCu75BNvKvAFFgeJTDdqq1zuIeP8Xl8Dv9nGs
         iPpFCWAh1wHl37NCqflvG0iSNpUhrVzZ/0Ht7ksCCMrfP3fBmEm4g7W1mDvPSXekUL68
         7s0WpQYasKuM4gH6775F7xqt+ZFWc8jh7sqaF7VxoFH+Dqgglpbkf/4x3oImlc/o+dbz
         xMtRPKDA4SK+Rmk2D5v6njEkRsmKgoqEMaQRAErIebxBnkKOmfpOUU0dJ+86zvKKc5pR
         p7+QtrqOkKGmUTpICVdfm0XOJPQlJcdVtN+njhsZu5zR15foulek/RN+R6W9YLcd5b7d
         2img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719242564; x=1719847364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K13WodvyVwjJ2bsnV0neBTB8Pqxx5meYMdpMLrHAEjA=;
        b=wfXy2NqwfN1plY+fZXEkJDUtYZlOQhDHM45Hkb72EPxb/9baA9uxwZjFq4oDJvwgOL
         6wADT2+QdFS4epHsEaFuO7ZI6cotmoQoJ05YtIwXL7fbiimhzEQWO65hJMt/H42tz+CE
         HT2XUeSsyI1dvA0i0Epn4U27LtxT7EgarEwZOI+vpH48gSXNyyA643DPtXi140/WN+T2
         IGg0G/kgeZuHliImOSHO0/zpJzpKpe6HmG12QBpx634VMw8KgS3yP6H/ugRp2NMBO0zG
         9LUX3+Dy8iPokuTaOPYcDRa24IJrCsnqziQUoZhkb4WZ+2jNPCAOEUAGGDz8Ky2EPZxt
         Gjfg==
X-Gm-Message-State: AOJu0YzhaJ/k7U+s+jFF0aGQMn+ccgktMkvtUpRM5i9neA4cNWEKQu43
	8ZZsiuzp6IR+0oOAiM7jVcqpPpu6i1JbeKaxUbPapc8LnkNSuDcqTxgyfw==
X-Google-Smtp-Source: AGHT+IHXoM5V0H1BZdGip0db5CN7VsYy8bMfbF3XzTTBupr09hX65vCTByLCtKC4pmaghFzSDeds3A==
X-Received: by 2002:a05:6870:1f85:b0:254:6f6c:5262 with SMTP id 586e51a60fabf-25d32b1d03cmr284105fac.14.1719242564478;
        Mon, 24 Jun 2024 08:22:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd4b80c47sm1890279fac.39.2024.06.24.08.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:22:43 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 02/10] classes-recipe/baremetal-image: Add image file manifest
Date: Mon, 24 Jun 2024 09:20:31 -0600
Message-ID: <20240624152236.1019980-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240624152236.1019980-1-JPEWhacker@gmail.com>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
 <20240624152236.1019980-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 15:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201092

Downstream tasks may want to know what image files were written so write
out a manifest in do_image_complete. The format of the manifest is the
same as the one in image.bbclass

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/baremetal-image.bbclass | 30 +++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-recipe/baremetal-image.bbclass
index 4e7d413626e..d7f53803e2a 100644
--- a/meta/classes-recipe/baremetal-image.bbclass
+++ b/meta/classes-recipe/baremetal-image.bbclass
@@ -30,6 +30,9 @@ BAREMETAL_BINNAME ?= "hello_baremetal_${MACHINE}"
 IMAGE_LINK_NAME ?= "baremetal-helloworld-image-${MACHINE}"
 IMAGE_NAME_SUFFIX ?= ""
 
+IMAGE_FILE_MANIFEST_DIR = "${WORKDIR}/deploy-image-file-manifest"
+IMAGE_FILE_MANIFEST = "${IMAGE_FILE_MANIFEST_DIR}/manifest.json"
+
 do_rootfs[dirs] = "${IMGDEPLOYDIR} ${DEPLOY_DIR_IMAGE}"
 
 do_image(){
@@ -37,8 +40,28 @@ do_image(){
     install ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf ${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.elf
 }
 
-do_image_complete(){
-    :
+python do_image_complete(){
+    from pathlib import Path
+    import json
+
+    data = {
+        "taskname": "do_image",
+        "imagetype": "baremetal-image",
+        "images": []
+    }
+
+    img_deploy_dir = Path(d.getVar("IMGDEPLOYDIR"))
+
+    for child in img_deploy_dir.iterdir():
+        if not child.is_file() or child.is_symlink():
+            continue
+
+        data["images"].append({
+            "filename": child.name,
+        })
+
+    with open(d.getVar("IMAGE_FILE_MANIFEST"), "w") as f:
+        json.dump([data], f)
 }
 
 python do_rootfs(){
@@ -62,6 +85,7 @@ python do_rootfs(){
     bb.utils.mkdirhier(sysconfdir)
 
     execute_pre_post_process(d, d.getVar('ROOTFS_POSTPROCESS_COMMAND'))
+    execute_pre_post_process(d, d.getVar("ROOTFS_POSTUNINSTALL_COMMAND"))
 }
 
 
@@ -72,6 +96,8 @@ SSTATE_SKIP_CREATION:task-image-complete = '1'
 do_image_complete[sstate-inputdirs] = "${IMGDEPLOYDIR}"
 do_image_complete[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_image_complete[stamp-extra-info] = "${MACHINE_ARCH}"
+do_image_complete[sstate-plaindirs] += "${IMAGE_FILE_MANIFEST_DIR}"
+do_image_complete[dirs] += "${IMAGE_FILE_MANIFEST_DIR}"
 addtask do_image_complete after do_image before do_build
 
 python do_image_complete_setscene () {
-- 
2.43.2


