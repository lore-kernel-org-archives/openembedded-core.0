Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88226C30658
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 19:32:00 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.151208.1719257519081164506
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 12:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h62+fzuI;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3d24a231342so2373465b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 12:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719257517; x=1719862317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K13WodvyVwjJ2bsnV0neBTB8Pqxx5meYMdpMLrHAEjA=;
        b=h62+fzuIDG85kgxEelKCzVnFoSyQYv2wkbMWwPpzr+9N2TPQC1oDPLe6WzfyH3JStY
         TJhltWaDoAMDwKVfoyz1CdcAzIG1vO7IftG7SvPVLaiibavwqFczhCeqJ+D9QMbSRWEB
         PgagN2yieus+j2OPM07cXjjWQ1KCN05Gr/xasu1fm4p72Y7nkv9iG5qcZUGo+d7tutat
         kLmIM5Ly+mKcQXF3x0uJEwG8oqYPZfPz5FC6dU82/MmLbs2OENKIfuv0hMGnJrqHBipK
         7S5jwb37C+3z6Yy5yoCXXASShB1LRD9m/u9sWBAQIzWwTMlZEnxoU0o0NxTrdUqS5N6V
         jANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719257517; x=1719862317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K13WodvyVwjJ2bsnV0neBTB8Pqxx5meYMdpMLrHAEjA=;
        b=HVET2pxBlr0sIrj1sEkvtvqMhu8+edamyqwqeNDmv9v+DtZ3nKwsZGjgTF6hD0cYnS
         IZQqmQfNcPnXan6mVSEe76woePauYapY1l/ey+9HzjPCiKCDegEiR6RFTdJJGoP+5XzC
         5d6F8ewuOPVfm2y2bbHNjcBsk4M8PJS/yohtxtyHX/ehzQ6ogTmkqBE/Q4Q9cenD9Gsq
         rnKmmk5n9oJNBiSU0SZFPpN5UBlBnvBYemDq4XB/Zgw9KpfAEfPZfV4yFbPqLOkjgj9A
         PUh7nCDYnWOk+wCu8vSAgAo3h/PVGzp0IFhPtLxGepK4Whaio1I/1nq8o5SN2f/+Tk3P
         oYFg==
X-Gm-Message-State: AOJu0YwwNCvZ60jWuXlSHUREThGNLToSSXBB/26NEDhj+q9B2gqDTQBV
	hO5hBgMtOyvrIEh/AdTqE0n/aYOie3Om/RuWWdLgpHJTVW8eW3Ws7EQelA==
X-Google-Smtp-Source: AGHT+IFHOAhELswmWjYv+ZazeJcf813ftcg1SuvLzTDW5rZYx+XISkI6LPS2pBSZVHq6MvlB4OOjRQ==
X-Received: by 2002:a05:6808:13ca:b0:3d2:1e7c:c3f3 with SMTP id 5614622812f47-3d543aab186mr7109406b6e.20.1719257517221;
        Mon, 24 Jun 2024 12:31:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d5344fa91csm1586711b6e.19.2024.06.24.12.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 12:31:56 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 02/10] classes-recipe/baremetal-image: Add image file manifest
Date: Mon, 24 Jun 2024 13:10:52 -0600
Message-ID: <20240624193151.1645802-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240624193151.1645802-1-JPEWhacker@gmail.com>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
 <20240624193151.1645802-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 19:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201104

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


