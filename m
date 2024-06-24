Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC44C3064D
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 15:22:52 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.143610.1719242564287935211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 08:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RzxIAwVX;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3d23db75f5cso2563413b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 08:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719242563; x=1719847363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uExL2fvliM/gTLXTEn1yUKmNWRbKtDEVrO7npNYO2eI=;
        b=RzxIAwVXmuvBLjPApBn1Diz0zjgYO0DQcHZAV3488w04msYAaOAj3XC2CnCYDMlirm
         dqiapC3WbvKmnWA/FkowKHFEG+EzWyGpiKVEVIKE7KhHCKq24jxLQDLWCTJldAVyOdqP
         mbmzPNdpuKvdScYB+3HVnhB8G4LEMBboFqOjqNibEJ5zU/+PFGwM20Vwfnkg0f6hl/aG
         mmQtB672Aukkqk4ZBYnEAFNMGCP/Ipl3ibJlFLk2G1i5GVc5ST2blih2nYJDNl3GrbqI
         e4ndcysDA6zgN0EgIvls4DNZaIu+nU+TVJCMTkqrvaXpZcd0lPIhJJMMeAym5t3n3O+g
         5pFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719242563; x=1719847363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uExL2fvliM/gTLXTEn1yUKmNWRbKtDEVrO7npNYO2eI=;
        b=DMhpHaQcFw6xsBCZXgTRgo4svekC1YYmoEknmzWNobr0bROVZ89IOLE2wkEpl7Ymns
         naxW/O0ZiS1wut6i82WbBgq39GvKEYkaMomyH7DWjwP47JznjQochV9xMmRNh9G0lkXF
         7UshhGYaKNnYC4DbRMSsrnuD52lvvkHI9doFz/ZCt93gNWtkNn5Beb1EOsmx9evm6C/e
         2nQoNJvHrk9Hl4K776WwCw9tHekjvqAN9tcG0Y6P876L7XSJHIxbVb8v9wRlXdSL3GLO
         k0RQv8N684l20BWFTtQYqqmPdW1NztLuIyGgREaKplTyxhaQ6HV+5KgDI+ekUmv3X6GQ
         AxWQ==
X-Gm-Message-State: AOJu0YyfU1MmE6amAG9uK4vLbUYFTxChmM3tvU8AKPzcBvI2S6rovgLi
	Q0XFkwVjcO8BXHktXECA4HoqBN4BBxPXVI9+Ie1BJwuK1ufU0S9TusGqqQ==
X-Google-Smtp-Source: AGHT+IGG7Kt2ffTbTlpf4ZZE7wIzZceTVykMXIudAgFiT/230/X1U/pcyuS6esfITR+ZzUKIZxeBMg==
X-Received: by 2002:a05:6870:3906:b0:254:bb5d:468c with SMTP id 586e51a60fabf-25d06c3156amr4969968fac.21.1719242562866;
        Mon, 24 Jun 2024 08:22:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd4b80c47sm1890279fac.39.2024.06.24.08.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:22:41 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 01/10] classes-recipe/image: Add image file manifest
Date: Mon, 24 Jun 2024 09:20:30 -0600
Message-ID: <20240624152236.1019980-2-JPEWhacker@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201091

Downstream tasks may want to know what image files were written by the
do_image family of tasks (e.g. SPDX) so have each task write out a
manifest file that describes the files it produced, then aggregate them
in do_image_complete

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/image.bbclass | 58 +++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 28be6c63623..fc9b6116650 100644
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
 
@@ -277,14 +282,28 @@ fakeroot python do_image () {
     execute_pre_post_process(d, pre_process_cmds)
 }
 do_image[dirs] = "${TOPDIR}"
+do_image[cleandirs] += "${IMGMANIFESTDIR}"
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
+    for manifest_path in image_manifest_dir.glob("*.json"):
+        with manifest_path.open("r") as f:
+            data.extend(json.load(f))
+
+    with open(d.getVar("IMAGE_FILE_MANIFEST"), "w") as f:
+        json.dump(data, f)
 }
 do_image_complete[dirs] = "${TOPDIR}"
 SSTATETASKS += "do_image_complete"
@@ -292,6 +311,8 @@ SSTATE_SKIP_CREATION:task-image-complete = '1'
 do_image_complete[sstate-inputdirs] = "${IMGDEPLOYDIR}"
 do_image_complete[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_image_complete[stamp-extra-info] = "${MACHINE_ARCH}"
+do_image_complete[sstate-plaindirs] += "${IMAGE_FILE_MANIFEST_DIR}"
+do_image_complete[dirs] += "${IMAGE_FILE_MANIFEST_DIR}"
 addtask do_image_complete after do_image before do_build
 python do_image_complete_setscene () {
     sstate_setscene(d)
@@ -507,12 +528,14 @@ python () {
         d.setVar(task, '\n'.join(cmds))
         d.setVarFlag(task, 'func', '1')
         d.setVarFlag(task, 'fakeroot', '1')
+        d.setVarFlag(task, 'imagetype', t)
 
         d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size')
         d.prependVarFlag(task, 'postfuncs', 'create_symlinks ')
         d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
         d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
         d.appendVarFlag(task, 'vardepsexclude', ' DATETIME DATE ' + ' '.join(vardepsexclude))
+        d.appendVarFlag(task, 'postfuncs', ' write_image_file_manifest')
 
         bb.debug(2, "Adding task %s before %s, after %s" % (task, 'do_image_complete', after))
         bb.build.addtask(task, 'do_image_complete', after, d)
@@ -610,6 +633,41 @@ python create_symlinks() {
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


