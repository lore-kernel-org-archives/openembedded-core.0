Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57579C3271E
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 14:01:16 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.51785.1720015268112778989
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 07:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AE+jBRix;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7eb895539e3so216764039f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 07:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720015267; x=1720620067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAPW56oVcSidcfVF6Ske72luKN0hEzBf10jZJ7PBYUQ=;
        b=AE+jBRixP8lYU7Ui5EVq9bpkOsz7QnszICA6cX5hImTNh98MDl7wxU4xa27OUfDVYZ
         hGEJ3wPNuaqu73GuPYUGe0ykRzoc2yT5kfeURqGpVfW5i9C74e2rR2NqZb9xLjRh2PS4
         Q14aAJTC4N4QW3drzzcOJHE/oHgS0VT/YTpb708SiwnPkfUacylLZ5JSvKEZ5pfSkoFa
         Sw3pfJ4ahDG1inbWtplPX0t9IKTKQcUaK8Sq1i4YHQKkM9pCDluAOkJTNDaqjTdWu4wS
         tZ2U5JGyWGAHT8OqCYwKKLlUZdbE+t9NHSi5dbzJL70VsbJtqLGFEPBk5PL9tA3ZdLMm
         tskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720015267; x=1720620067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAPW56oVcSidcfVF6Ske72luKN0hEzBf10jZJ7PBYUQ=;
        b=W9Emjvy2Dal4/sIGal1Sa6o6hYHMbADyV42BeA5nozmyg/17Q2ylEQr4EMNTjUiWIQ
         4eioJNJ0iaa4ndGs5qMBqUiD2m3177ReeHN+GXkRFSGHyZgIDplhI9ZAr3BJ4HAKTyHE
         AIbWxWT0DHZzmyv7xNyhnyhI18VNH9Hynrbq9O61PJVo3xrXW7FShm/2VXcAjmYlbYJg
         VTK4PCF9yMsYLo6RKnqkHJPygeA5w3dkh1edNwXanNGiloIBzQsrs6mwM1nsY+4cgxsi
         LviktWwbhBLUHPE1d7BfhDz6htjhn/8O01T8feJBM4AmGjpUylxxVi3SnzXB1hpPrIhE
         fprA==
X-Gm-Message-State: AOJu0YywMSFazjIfiwZ6opjLhkIy6EaCHlaErrS9o2hAD+cXhm15KAe9
	s4lUuxGXsFSt02ed7eIZ7xnGoeVPQpsTtIAiAaTzR7gZ0pbCqw9Q5yAQfg==
X-Google-Smtp-Source: AGHT+IG4JJYKQGY9UUV9n/4LZU8Ch+nccSo8w44RWDU4BGLuuNCKhR7vpSZDvYbX4ncLHafI9YmvcA==
X-Received: by 2002:a6b:6b15:0:b0:7f6:663f:95a8 with SMTP id ca18e2360f4ac-7f6663f95f2mr111500339f.16.1720015266691;
        Wed, 03 Jul 2024 07:01:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::f949])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4bb742f1e77sm3407500173.179.2024.07.03.07.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 07:01:05 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 2/8] classes-recipe/baremetal-image: Add image file manifest
Date: Wed,  3 Jul 2024 07:59:17 -0600
Message-ID: <20240703140059.4096394-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703140059.4096394-1-JPEWhacker@gmail.com>
References: <20240624193151.1645802-1-JPEWhacker@gmail.com>
 <20240703140059.4096394-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 14:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201482

Downstream tasks may want to know what image files were written so write
out a manifest in do_image_complete. The format of the manifest is the
same as the one in image.bbclass

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/baremetal-image.bbclass | 32 +++++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-recipe/baremetal-image.bbclass
index 4e7d413626e..7938c0a83f1 100644
--- a/meta/classes-recipe/baremetal-image.bbclass
+++ b/meta/classes-recipe/baremetal-image.bbclass
@@ -30,6 +30,9 @@ BAREMETAL_BINNAME ?= "hello_baremetal_${MACHINE}"
 IMAGE_LINK_NAME ?= "baremetal-helloworld-image-${MACHINE}"
 IMAGE_NAME_SUFFIX ?= ""
 
+IMAGE_OUTPUT_MANIFEST_DIR = "${WORKDIR}/deploy-image-output-manifest"
+IMAGE_OUTPUT_MANIFEST = "${IMAGE_OUTPUT_MANIFEST_DIR}/manifest.json"
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
+    with open(d.getVar("IMAGE_OUTPUT_MANIFEST"), "w") as f:
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
+do_image_complete[sstate-plaindirs] += "${IMAGE_OUTPUT_MANIFEST_DIR}"
+do_image_complete[dirs] += "${IMAGE_OUTPUT_MANIFEST_DIR}"
 addtask do_image_complete after do_image before do_build
 
 python do_image_complete_setscene () {
@@ -140,5 +166,5 @@ python(){
                 else:
                     deps += " %s:%s" % (dep, task)
         return deps
-    d.appendVarFlag('do_image', 'depends', extraimage_getdepends('do_populate_sysroot')) 
+    d.appendVarFlag('do_image', 'depends', extraimage_getdepends('do_populate_sysroot'))
 }
-- 
2.45.2


