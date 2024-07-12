Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01626C2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 16:03:12 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.11469.1720800191022127867
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 09:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=abUTodHy;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2598001aae7so1130196fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 09:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720800189; x=1721404989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ev+/83TYJtK21/pmzMESC9PzCYUOYVnNIt17ZOUIHdo=;
        b=abUTodHySQBAsZIZxMrxVuc/4u2dCQyRu50zWKi03RBChAUYCZGbCfMqS99k+4yFaX
         nKErwc+mxtAAnJKwXRn7BgRODKz0AURmS0xXogvBKOCU5bCikzekoPM8xoUxNVIeUzgH
         tIzwBFF079c7AWaUA93vdz0LnLYbpN4XeHE4yVLQPhDdR6jQSoJ/6Nk3yMuPvO2oh8DF
         NRu0ffl2LMML7wNlIKZ0eVqGfV0kjFd+7MX7o1CPJ4kjmBhESBEiBZ319bv1xzwuS8Ff
         E72Ix2/NNyAXIo+SzHSmKhcAyd+Z44mhhoDbQOYS0SAc8HetkjZhNwdqX9KipI2brnjV
         eLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720800189; x=1721404989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ev+/83TYJtK21/pmzMESC9PzCYUOYVnNIt17ZOUIHdo=;
        b=F/NsQ/tIvTwnENvyguQxpA45gKsApx0tcxmDwAGmbhcBe1u6wFt5sD7WNZ+PJR+JbO
         /bKONJHrCpKoO5358PueTy9bv9SzX7R5Mwh/eUP0g5f3+BYooePJAVmRIjf42s7WTAgt
         l4WOqXmwytsojN4gwn2I6Kb9l6fVYTwiO3AM1fE/zqFHuZ6bc9ZVSOn+Uk18gJtjih8i
         HAYBN1JEnM470mj0yC2aULZz79abVFlvSFH09jhaLRM8fr6NReAzPgWfyjMrnz0Aah8r
         ACjFvm63pFzmZAEVy+bjzS7Zs76llWas/NHxczjqZSnKnBBrX8XzRwDw8u821qKsn3xU
         I0fw==
X-Gm-Message-State: AOJu0YwSg9r+Vrn8rcb2YhTQswQPNfxjLMqnDot2XfXlb5hb8rW41oQ3
	attmcbx1CaSZETlM5iEOB0WGU68OZo/zK9vCCk1nBMZX5DMDHnonrp2y+A==
X-Google-Smtp-Source: AGHT+IHuGHIpW4eN1mT/yAPr96LhA5A9QFnr4PhqJf3G7rU6vGU6MOQ+kfurAIbpNLnt1NjfC8h+3Q==
X-Received: by 2002:a05:6870:a454:b0:25e:b6dc:46a with SMTP id 586e51a60fabf-25eb6dc391fmr8586315fac.11.1720800189037;
        Fri, 12 Jul 2024 09:03:09 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4a71])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25eaa29d16dsm2267694fac.53.2024.07.12.09.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 09:03:08 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 01/12] classes-recipe/image: Add image file manifest
Date: Fri, 12 Jul 2024 09:58:11 -0600
Message-ID: <20240712160304.3514496-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712160304.3514496-1-JPEWhacker@gmail.com>
References: <20240703140059.4096394-1-JPEWhacker@gmail.com>
 <20240712160304.3514496-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 16:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201835

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


