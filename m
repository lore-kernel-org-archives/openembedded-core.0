Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0ED7C27C4F
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 21:45:03 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.31919.1718055903027707974
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 14:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iH91aJAk;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6f9611fc320so1531041a34.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 14:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718055901; x=1718660701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sarnxPf3xnCeeLDZhCJbapgrJ/BkJP/YXRZ6S0naXrQ=;
        b=iH91aJAkNFueUEcKKeSfjJKw0D/y5Sbxi1nKGSozgthqww6lShMIVa/H5UTQ9iTPQV
         ecWYlK6xnlcWYBYI6r/3WqKR+dbfQpNW62gKjjN1J4+VHEozX5Ox2jS2eIrBwjn1Iw6r
         V3H12Z2FD/zeDNOENv5SzaXJiyfq5htktjK4nIr4TUrt8P6vPuB4o4A6gCj4WL6vvBGq
         +JKDpBmu3aw1XbMkLZw8EfAAyFXCL1O/KVioQ1LCEg//KHaOVV43sbv+D8oRvtMTAnkd
         75cycPoW0szT1RoNAPR2poGaJVRUkkwIVr/WAq5no5JP+Uid/2NxqJL5k/OSmx5AtUEc
         W3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718055901; x=1718660701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sarnxPf3xnCeeLDZhCJbapgrJ/BkJP/YXRZ6S0naXrQ=;
        b=U0xFWX8t2wHBN8EBqrUmA+5deaXD+wMFsdXzQNqVEdHmgexjjuU6lfZYu1J6+e/HeR
         CiSoNEHKW9dxxqf5uCOvnVkF6cRBivPs5A5TKQLWQfZGIDpvOBf5bRSeKuiHfj6PWS3z
         BdWfWWjYOQgX6ZcRd7s9OTv3kCOC7cdiXhi4lOq+j59SkA0tdrv+bo54MQcXFZk1DPs0
         7QV8V9Yb+azkK/LqPIf89pSGs5fqCAbxyZf+QqjbSboX7y8ePwqcI1etU236vmbsTU/1
         cS8Dtk6GwmHoMEf0js5aaH1ii6voT2Uj9XhfCcFnLZ8mj5Gi1azSmUKsus55+1Krdpy7
         XjYA==
X-Gm-Message-State: AOJu0YwpMJpKKD7KO50FB2SDGUjQOnPWf1aaF3x7wgLDGb07cPBmjuwC
	E1/rqd7DYx7WTea1ce+FQhEsswVK4XokDhnC3A5AfAUvjO/2CTr1NV7z8w==
X-Google-Smtp-Source: AGHT+IHiFRKw/8XwFeheGW0haUdXvmgxQr2uYxKUu0jgZMWiD40qWlwH7HomQOexocHpKlEoqS/TrA==
X-Received: by 2002:a9d:6e03:0:b0:6f9:87a9:ec7c with SMTP id 46e09a7af769-6f987a9f4d5mr6599219a34.12.1718055901072;
        Mon, 10 Jun 2024 14:45:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::2cec])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f94dc70d48sm1888631a34.5.2024.06.10.14.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 14:45:00 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 1/6] classes-recipe/image: Add image file manifest
Date: Mon, 10 Jun 2024 15:41:47 -0600
Message-ID: <20240610214456.2757397-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610214456.2757397-1-JPEWhacker@gmail.com>
References: <20240610214456.2757397-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 21:45:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200485

Downstream tasks may want to know what image files were written by the
do_image family of tasks (e.g. SPDX) so have each task write out a
manifest file that describes the files it produced, then aggregate them
in do_image_complete

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/image.bbclass | 61 +++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 28be6c63623..122af2b0328 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -88,6 +88,11 @@ PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
 
 IMGDEPLOYDIR = "${WORKDIR}/deploy-${PN}-image-complete"
 
+IMGMANIFESTDIR = "${WORKDIR}/image-task-manifest"
+
+IMAGE_FILE_MANIFEST_DIR = "${WORKDIR}/deploy-image-file-manifest"
+IMAGE_FILE_MANIFEST = "${IMAGE_FILE_MANIFEST_DIR}/manifest.json"
+
 # Images are generally built explicitly, do not need to be part of world.
 EXCLUDE_FROM_WORLD = "1"
 
@@ -277,14 +282,31 @@ fakeroot python do_image () {
     execute_pre_post_process(d, pre_process_cmds)
 }
 do_image[dirs] = "${TOPDIR}"
+do_image[cleandirs] = "${IMGMANIFESTDIR}"
 addtask do_image after do_rootfs
 
 fakeroot python do_image_complete () {
     from oe.utils import execute_pre_post_process
+    from pathlib import Path
+    import json
 
     post_process_cmds = d.getVar("IMAGE_POSTPROCESS_COMMAND")
 
     execute_pre_post_process(d, post_process_cmds)
+
+    image_manifest_dir = Path(d.getVar('IMGMANIFESTDIR'))
+
+    data = []
+
+    for taskname in bb.build.preceedtask("do_image_complete", False, d):
+        manifest_path = image_manifest_dir / (taskname + ".json")
+        if not manifest_path.exists():
+            continue
+        with manifest_path.open("r") as f:
+            data.extend(json.load(f))
+
+    with open(d.getVar("IMAGE_FILE_MANIFEST"), "w") as f:
+        json.dump(data, f)
 }
 do_image_complete[dirs] = "${TOPDIR}"
 SSTATETASKS += "do_image_complete"
@@ -292,6 +314,8 @@ SSTATE_SKIP_CREATION:task-image-complete = '1'
 do_image_complete[sstate-inputdirs] = "${IMGDEPLOYDIR}"
 do_image_complete[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_image_complete[stamp-extra-info] = "${MACHINE_ARCH}"
+do_image_complete[sstate-plaindirs] =  "${IMAGE_FILE_MANIFEST_DIR}"
+do_image_complete[dirs] = "${IMAGE_FILE_MANIFEST_DIR}"
 addtask do_image_complete after do_image before do_build
 python do_image_complete_setscene () {
     sstate_setscene(d)
@@ -513,6 +537,8 @@ python () {
         d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
         d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
         d.appendVarFlag(task, 'vardepsexclude', ' DATETIME DATE ' + ' '.join(vardepsexclude))
+        d.appendVarFlag(task, 'postfuncs', ' write_image_file_manifest')
+        d.appendVarFlag(task, 'dirs', ' ' + d.getVar('IMGMANIFESTDIR'))
 
         bb.debug(2, "Adding task %s before %s, after %s" % (task, 'do_image_complete', after))
         bb.build.addtask(task, 'do_image_complete', after, d)
@@ -610,6 +636,41 @@ python create_symlinks() {
             bb.note("Skipping symlink, source does not exist: %s -> %s" % (dst, src))
 }
 
+python write_image_file_manifest() {
+    import json
+    from pathlib import Path
+
+    taskname = d.getVar("BB_CURRENTTASK")
+    image_deploy_dir = Path(d.getVar('IMGDEPLOYDIR'))
+    image_manifest_dir = Path(d.getVar('IMGMANIFESTDIR'))
+    manifest_path = image_manifest_dir / ("do_" + d.getVar("BB_CURRENTTASK") + ".json")
+
+    image_name = d.getVar("IMAGE_NAME")
+    image_basename = d.getVar("IMAGE_BASENAME")
+    machine = d.getVar("MACHINE")
+
+    subimages = (d.getVarFlag("do_" + taskname, 'subimages', False) or "").split()
+    imagetype = d.getVarFlag("do_" + taskname, 'imagetype', False)
+
+    data = {
+        "taskname": taskname,
+        "imagetype": imagetype,
+        "images": []
+    }
+
+    for type in subimages:
+        image_filename = image_name + "." + type
+        image_path = image_deploy_dir / image_filename
+        if not image_path.exists():
+            continue
+        data["images"].append({
+            "filename": image_filename,
+        })
+
+    with manifest_path.open("w") as f:
+        json.dump([data], f)
+}
+
 MULTILIBRE_ALLOW_REP += "${base_bindir} ${base_sbindir} ${bindir} ${sbindir} ${libexecdir} ${sysconfdir} ${nonarch_base_libdir}/udev /lib/modules/[^/]*/modules.*"
 MULTILIB_CHECK_FILE = "${WORKDIR}/multilib_check.py"
 MULTILIB_TEMP_ROOTFS = "${WORKDIR}/multilib"
-- 
2.43.2


