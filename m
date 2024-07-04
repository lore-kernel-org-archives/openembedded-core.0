Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84EDC3DA42
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 07:10:33 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.5047.1720077027602760071
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 00:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Og7eGiIK;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52e7693c369so329295e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 00:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720077025; x=1720681825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmzgSwhGEztT1SPlHvnNP+GCBIS9CyBgwvJgZdraN0M=;
        b=Og7eGiIKFIYbO88QkPUmaR0XwH1Bc4vOHVnYQOgqGU6i51JWfsvKOIjnlDsfRCXxjL
         KUUSCFlU0KugGEGZXmo9IdNl6m136GFxOxf8DxPyyJzOcmoNEiwrQCGIJGL0KXyBqMXd
         e0RY7TiAXeoC3gwqz2qYLp+U4gETtY6wb6+ugLoSNYnxwuJSkETex4hHwM3P1lN9Mwei
         3BypSiJUPI8ERJ5OK35G/NSgaNHlhmHjyW02Gw9PGEE8RC8gEezE8Q2HgEIgCr55otL7
         cb1RVVR3czjgFurHjyurWlFRJfT98jDYGdqD9NqBQ82Tf/8iXM+rY1p8XxTSvu6LGK85
         hAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720077025; x=1720681825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmzgSwhGEztT1SPlHvnNP+GCBIS9CyBgwvJgZdraN0M=;
        b=MYEDJ7Fo9lFqy+IPeNkxsZbOh+Ey0JW/anmIzVI9SIR7UJ4k6sXc/H99By3dQ+2rD/
         t7SQIq/k/ec7FF2ipwK+YepU84y6CmPXofgfXsvcDhYfa+dkOO3Db7L5cPCO91ly2Tju
         HfBzZomb0yWmq8IQRK/QBQIKQvz8CvM0Yp/ihS9x09O+Bs1AUV24nvUs/kRUdoHPqnjK
         F+7gbk7j2HxFNQPxn28rexZsAuSOtpwoAxVIF3OxN6wP5A5sJ8/OMU5I4J0tz7NenWNp
         V8USxeiDMYKvpyDsCEAJf/Y++nXQIENQJ7eDqVddU498HAbQ8JH+w4jOe9ZJVHB9T+Mh
         rdlQ==
X-Gm-Message-State: AOJu0YySelqXGs+mDdupp2nbhw0+0K0zyFSgSRAnlLalALjM1KIc2I3c
	fyjYvdyO9DMFtHVol+Br9YyqvyhO5/f7dflkFpm41Eq/a/kvTiE4TzO7fg==
X-Google-Smtp-Source: AGHT+IGU2ibA0/U8lv5LwqO85O3pjm7SRkmjkhezpsafMfz1EqscBjHPWZ4PgTGv9cm5j7ISIYfxIA==
X-Received: by 2002:a05:6512:6e:b0:52e:74d5:89ae with SMTP id 2adb3069b0e04-52ea0644675mr467932e87.39.1720077024900;
        Thu, 04 Jul 2024 00:10:24 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f23f9sm11597255e9.26.2024.07.04.00.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 00:10:24 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 08/14] kernel: execute do_bundle_initramfs only when needed
Date: Thu,  4 Jul 2024 09:09:44 +0200
Message-ID: <20240704071013.2982700-9-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
References: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 07:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201514

From: Adrian Freihofer <adrian.freihofer@siemens.com>

With INITRAMFS_IMAGE_BUNDLE = "1" the kernel Makefile is used to bundle
the kernel binary and the initramfs. This works only when the build
folder of the kernel is available. Building with sstate but with an
empty TMPDIR requires to rebuild the kernel from scratch whenever
something in the initramfs changes.

With INITRAMFS_IMAGE_BUNDLE = "" the fitImage generation is basically
independent from the kernel Makefile and could therefore work with
kernel binaries and tools provided by the sstate. But the dependency on
the do_bundle_initramfs tasks does not allow this. However, if the
INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set to 0 the
do_bundle_initramfs does nothing. There is no real argument for running
this tasks.
As a first step towards getting the kernel from sstate when building an
unbundled fitImage, the task dependencies need to be simplified.
The do_bundle_initramfs task is now scheduled only when needed.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass |  7 +++++--
 meta/classes-recipe/kernel.bbclass          | 14 ++++++++------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 664ebc65d7c..fbeb20596ea 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -36,6 +36,11 @@ python __anonymous () {
         if 'fitImage' in typeformake.split():
             d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', d.getVar('KERNEL_IMAGETYPE_REPLACEMENT')))
 
+        if bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
+            bb.build.addtask('assemble_fitimage_initramfs', 'do_deploy', 'do_bundle_initramfs', d)
+        else:
+            bb.build.addtask('assemble_fitimage_initramfs', 'do_deploy', 'do_install', d)
+
         image = d.getVar('INITRAMFS_IMAGE')
         if image:
             d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
@@ -794,8 +799,6 @@ do_assemble_fitimage_initramfs() {
 	fi
 }
 
-addtask assemble_fitimage_initramfs before do_deploy after do_bundle_initramfs
-
 do_kernel_generate_rsa_keys() {
 	if [ "${UBOOT_SIGN_ENABLE}" = "0" ] && [ "${FIT_GENERATE_KEYS}" = "1" ]; then
 		bbwarn "FIT_GENERATE_KEYS is set to 1 even though UBOOT_SIGN_ENABLE is set to 0. The keys will not be generated as they won't be used."
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 89badd90f18..6d242114852 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -139,15 +139,17 @@ set -e
 
     image = d.getVar('INITRAMFS_IMAGE')
     # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set to 0,
-    # the do_bundle_initramfs does nothing, but the INITRAMFS_IMAGE is built
-    # standalone for use by wic and other tools.
-    if image:
+    # the do_bundle_initramfs does nothing. Add the dependency only when needed.
+    if image and bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
+        bb.build.addtask('bundle_initramfs', 'do_deploy', 'do_install', d)
         if d.getVar('INITRAMFS_MULTICONFIG'):
             d.appendVarFlag('do_bundle_initramfs', 'mcdepends', ' mc::${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
         else:
             d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
-    if image and bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
         bb.build.addtask('do_transform_bundled_initramfs', 'do_deploy', 'do_bundle_initramfs', d)
+    else:
+        d.appendVarFlag('do_deploy', 'depends', ' ${PN}:do_install')
+
 
     # NOTE: setting INITRAMFS_TASK is for backward compatibility
     #       The preferred method is to set INITRAMFS_IMAGE, because
@@ -327,6 +329,8 @@ do_bundle_initramfs () {
 				mv -f ${KERNEL_OUTPUT_DIR}/$imageType.bak ${KERNEL_OUTPUT_DIR}/$imageType
 			fi
 		done
+	else
+		bbwarn "Calling do_bundle_initramfs with INITRAMFS_IMAGE_BUNDLE=1 is deprecated"
 	fi
 }
 do_bundle_initramfs[dirs] = "${B}"
@@ -347,8 +351,6 @@ python do_devshell:prepend () {
     os.environ["LDFLAGS"] = ''
 }
 
-addtask bundle_initramfs after do_install before do_deploy
-
 KERNEL_DEBUG_TIMESTAMPS ??= "0"
 
 kernel_do_compile() {
-- 
2.45.2


