Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9359FC27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 22:18:16 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.34245.1718835492373831103
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 15:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WzaH/S4F;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6f980c89db8so113027a34.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 15:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718835490; x=1719440290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/ossIerDv9jwhuA+w2p/nGEj4S93VLL7yyvYxvesEk=;
        b=WzaH/S4FzWvnbHhTwO9mGyaQGcdZoJirPNMPLVmiNtLx2CAd0cC1baFiKb4zIzdKSd
         uY8NNrTpDas3JiPRyAOOyfFML2tloDhv3wBxo4eOi3v8v1j9BX6g+ISnGuXNjSsMi40u
         KWYZ1nzPsg7oZ0YAa6MCF1heo+0l9UYbD+dBf4YMiFx4YFJ3XDRfR4I0AwLA5KNnYjCu
         qUy9hDH8u5OxzvA/gsVI+cVskop0EYzpaJ+xtGlMoZ6HG2otQSgJuquEx6qe4oZ9QdR8
         EL2Nk6oj2OFTnhsbL+C8i6O3U7fGXyS0v41G+DUJpKreRcc7Gt7g9AhNNNCHQwBO1lue
         I1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718835490; x=1719440290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/ossIerDv9jwhuA+w2p/nGEj4S93VLL7yyvYxvesEk=;
        b=n5AGCAVDoV+FzBlKzlKznlPy46qMsZ7eDc5wWuCgnjwb/oPFwP/LiKAYA+bZYg1XE8
         4A5c1cICek9AvgZGs/GFO1Ma41rHRRH0cGfIqm1mCWZbw2KPjwR4uP7ZIfIbNuKZkZmi
         +HF+Cih61iDVnP1wNTlMkd3mIbCvwAblRccXznQLpSJ1au7oRRT/RnGt5jJPVyEnhKYM
         fJClBrOx243SCXsqBMTzQv0mwicYIkvg9WbesXiVXGejISQ0VGpPN1N6tZ6ZfRtb6tQg
         oB4BR9D6k0eC1kNNbHWMzcEGDecrrLFwYYhu4i1yQUPrzCDn+Wg+IQpGcifuKeGEmIhJ
         HJMw==
X-Gm-Message-State: AOJu0Yz6aQKIwAYiWYxZ4iZAAwgxBeJ7kAtI8Ol8ew7tlimU9XENln2m
	DDeQ86NdZ6St4hqCzh2zMVC48y+NvIPNHbXER+lRnr8kCPOTqs/N3Nmamg==
X-Google-Smtp-Source: AGHT+IEZRja2Nb3k+kaNytFp0fcZXKArcRILUvne5dZzm09opniOdwPl1JhEDPzhBEZQ3sot6a4RYg==
X-Received: by 2002:a05:6870:829e:b0:250:171d:5c74 with SMTP id 586e51a60fabf-25c94a222fdmr4572473fac.26.1718835490434;
        Wed, 19 Jun 2024 15:18:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4189])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d2475e5359sm2321190b6e.3.2024.06.19.15.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 15:18:08 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 1/7] classes-recipe/image: Add image file manifest
Date: Wed, 19 Jun 2024 16:13:23 -0600
Message-ID: <20240619221805.3038528-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240619221805.3038528-1-JPEWhacker@gmail.com>
References: <20240610214456.2757397-1-JPEWhacker@gmail.com>
 <20240619221805.3038528-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 22:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200930

Downstream tasks may want to know what image files were written by the
do_image family of tasks (e.g. SPDX) so have each task write out a
manifest file that describes the files it produced, then aggregate them
in do_image_complete

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/image.bbclass | 58 +++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 28be6c63623..a9347adb832 100644
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
+do_image_complete[sstate-plaindirs] =  "${IMAGE_FILE_MANIFEST_DIR}"
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


