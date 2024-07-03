Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30FEBC31D97
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 14:01:16 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.51050.1720015266119951650
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 07:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lgl3f0C/;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7f624e70870so292529339f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 07:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720015265; x=1720620065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ev+/83TYJtK21/pmzMESC9PzCYUOYVnNIt17ZOUIHdo=;
        b=lgl3f0C/HknDXTTT8UQH3NBxAwEsgpKQbPbuMZ99RG99zqgj9JV2nsz0hUkkudfrhf
         xfpjgtMt3BBtAG4r9O3FxXEG1qvpIiF5hzx1+KqVuToWtFnQB5+3z+CKe/wDhc7r8unv
         XrQGQAe80CXZkLsRH9BUd4kTl3yq32VeUYD/SC5ClU9PqjCcpINQhQ/cLkc/W3CCZ6Rj
         TLYKR7aS8pzHtnVUb8TvqM1pzioGAyBp0ZVA+JLqXzIgz/hlChHetqaa51gyLAzNJ7Sd
         9oDOI+JPFRkR354dwmSSbkkmqYH1JwEUODeneWB5hs747ZeeUyq48/u6dgJzxIfToXVk
         VuuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720015265; x=1720620065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ev+/83TYJtK21/pmzMESC9PzCYUOYVnNIt17ZOUIHdo=;
        b=OgJO070u/0GAE19Udw4ysuRMp8GZCzi+AKbL1YKw3xQLNHWbGJXTUVZeluoHN0dB60
         Xrgm13RPNCTgVkfCXJ+aMCXK5WrAHy5k+5G42EhgpXYWN3Jk8bHu2sZ9PlMWsU3Zggdr
         giXOaOouszkfSFSe5Kn/WaWvNUCGY4jkXQqRIiS4VjJ4DPqFty+NiXlpW4XWEpA1JtQt
         MVd2b01Ctei0X7lTEuOiPlWyc6XalJOguM8nxZEMoxqQzkm9YNhB0A7ygBMIVNDc0rta
         tmN3ugNEeXFUDZo1aG5gl7dT6FVHbBPuX4dL4hlXtZA47DsHyvjgetYZCqna5K8hVFC0
         byhg==
X-Gm-Message-State: AOJu0YyZxxVljBgGVg31bIKfsa2xeY+hR3wjQ6MttVEudYTzUhNb0PSU
	KYgx1j/a2C4A5av82e6g1vRDiCuEt8fZ6g8BlRnfGSNmKEmZ6p8xfGjKEQ==
X-Google-Smtp-Source: AGHT+IELN1cREG/fy1tpUtmFCDB1yHSKNrCpZKdk2BEZIPHgY0RG67cFfev9czB+tOGuZrgsvDIisg==
X-Received: by 2002:a05:6602:1d42:b0:7f6:1f20:f113 with SMTP id ca18e2360f4ac-7f62eea3026mr1316347139f.17.1720015264542;
        Wed, 03 Jul 2024 07:01:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::f949])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4bb742f1e77sm3407500173.179.2024.07.03.07.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 07:01:03 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 1/8] classes-recipe/image: Add image file manifest
Date: Wed,  3 Jul 2024 07:59:16 -0600
Message-ID: <20240703140059.4096394-2-JPEWhacker@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201481

Downstream tasks may want to know what image files were written by the
do_image family of tasks (e.g. SPDX) so have each task write out a
manifest file that describes the files it produced, then aggregate them
in do_image_complete

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/image.bbclass | 58 +++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 28be6c63623..32bafcdbbc3 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -88,6 +88,11 @@ PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
 
 IMGDEPLOYDIR = "${WORKDIR}/deploy-${PN}-image-complete"
 
+IMGMANIFESTDIR = "${WORKDIR}/image-task-manifest"
+
+IMAGE_OUTPUT_MANIFEST_DIR = "${WORKDIR}/deploy-image-output-manifest"
+IMAGE_OUTPUT_MANIFEST = "${IMAGE_OUTPUT_MANIFEST_DIR}/manifest.json"
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
+    with open(d.getVar("IMAGE_OUTPUT_MANIFEST"), "w") as f:
+        json.dump(data, f)
 }
 do_image_complete[dirs] = "${TOPDIR}"
 SSTATETASKS += "do_image_complete"
@@ -292,6 +311,8 @@ SSTATE_SKIP_CREATION:task-image-complete = '1'
 do_image_complete[sstate-inputdirs] = "${IMGDEPLOYDIR}"
 do_image_complete[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_image_complete[stamp-extra-info] = "${MACHINE_ARCH}"
+do_image_complete[sstate-plaindirs] += "${IMAGE_OUTPUT_MANIFEST_DIR}"
+do_image_complete[dirs] += "${IMAGE_OUTPUT_MANIFEST_DIR}"
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
+        d.appendVarFlag(task, 'postfuncs', ' write_image_output_manifest')
 
         bb.debug(2, "Adding task %s before %s, after %s" % (task, 'do_image_complete', after))
         bb.build.addtask(task, 'do_image_complete', after, d)
@@ -610,6 +633,41 @@ python create_symlinks() {
             bb.note("Skipping symlink, source does not exist: %s -> %s" % (dst, src))
 }
 
+python write_image_output_manifest() {
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
2.45.2


