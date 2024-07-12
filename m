Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53424C3DA4D
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 16:03:13 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.11588.1720800191783117006
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 09:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GrXAtzbR;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-703d5b29e06so1039764a34.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 09:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720800190; x=1721404990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAPW56oVcSidcfVF6Ske72luKN0hEzBf10jZJ7PBYUQ=;
        b=GrXAtzbR2eGmr71pdv5xzVAoGITDwW/T7D63/7R+z/PQZPdIZiSA6NncpLEDCWw7WQ
         WAIdXZLbi52GzdGHSdKOFAbJT98BRjDgYJ3koRHmbOjqVsgS++pgGtk/ntEzDKTAV9ox
         MzFTVG/bY64VbTB/9NmD+neVN/owe6EK9ed3wHc/rvHQAZz5fEh6V3gKmQveWYMg3kR/
         0Fqpj9N0r2IdTi9nUAcwu+uNmtfnyV0tRjEMc4Fx55MnLw1szcop3+NQzQeg6v8ynGBn
         KWXbk1is+m/L/3Be9wjsATXpQ23nCtUc4ixYr6EKZqEhbOjTn+Sj3MZ0mXJncuaK2c5s
         nmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720800190; x=1721404990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAPW56oVcSidcfVF6Ske72luKN0hEzBf10jZJ7PBYUQ=;
        b=HgUfXx2prWKYxumiDlsfNnAXv6wsYHuPj+8II0rQhhq9+fN33RegssHoWfBNb5AJyP
         VDqIRQT9u7bmFarm2TVeOYJReJA3K/+73eepygjbx0lczR1eDkGaN/LEx4cx4hElTQpw
         gZZcEBTXjnzu9GtLyTViNeHmDkdqVM4bxmNhqxRX9uSOIV7ctT84NMZ0L/oy1w7z18lc
         X/0kK7lsdWHyx6L3wfq+bV/5VtHioTyMMKHHEbx5bbTW2e/O4ASFtoIS4JhaEWj19FMH
         3irroQ6rguUPjb3xrU37rJXmpIG42JqfMPghIQ2Jg3CE+3QHpisONlX+nJMsOMJDDV8S
         0Gzw==
X-Gm-Message-State: AOJu0YxLap3xnY8CNNhIJEpX9fpNG+JZp1lXGP/Z88TM4061U3W/Zr3X
	8yJXs0e4ku+BbLTDUMnZBtda1cVTjeeZQIBEEVLgwe3OvZtzwmviUrCO7A==
X-Google-Smtp-Source: AGHT+IHqnZalOsTIhXKTC/TGy94mD95woPaLtJFJAbc6F7UrEoL01gQs/aauEC2Ssy5hin4PLO6lyg==
X-Received: by 2002:a05:6871:b23:b0:25e:2b26:e05e with SMTP id 586e51a60fabf-25eae83c5demr8743914fac.23.1720800190048;
        Fri, 12 Jul 2024 09:03:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4a71])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25eaa29d16dsm2267694fac.53.2024.07.12.09.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 09:03:09 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 02/12] classes-recipe/baremetal-image: Add image file manifest
Date: Fri, 12 Jul 2024 09:58:12 -0600
Message-ID: <20240712160304.3514496-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712160304.3514496-1-JPEWhacker@gmail.com>
References: <20240703140059.4096394-1-JPEWhacker@gmail.com>
 <20240712160304.3514496-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 16:03:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201836

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


