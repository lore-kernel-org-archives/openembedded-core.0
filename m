Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A263C001DB
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 23:11:23 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.2509.1698880282942016326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 16:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=gPMVVuoQ;
 spf=pass (domain: essensium.com, ip: 209.85.128.53, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40853c639abso2442425e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 16:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1698880281; x=1699485081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ljk/g3f+mwq6sFg3lD4Dg1L+bLMIEcW1+oVhI5Zy0Kg=;
        b=gPMVVuoQEwEqyNoW4lX/gv9c9x9sifBOmRgDKTHeKd1dxy1b42LIz9MnqtgIiML2eO
         zwiGQSZhGd5vvCRLYmXs/AnZgtr753thBQynAHWvpRF+ZsernEGsS8gStU3XUvpB//SV
         Kpp7tg70swvyiBGOriC2GGW+6kfmkoGmtWLs7+NryG5CxvheAEOMyleiL/XzMYlddE6u
         6gR5pDP6CJxWO3F6SyXAaFjuJdTNfTdgM2DEZxGrDJRakIFFrO4ruo6rl005yRkYvnAi
         FRsKRu9bmkc0xcr5Q1syOXM271nsYinFsfR2qeAGDZ7a1X6uOjqlFQ/qsvltC2Az5KHX
         E3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698880281; x=1699485081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ljk/g3f+mwq6sFg3lD4Dg1L+bLMIEcW1+oVhI5Zy0Kg=;
        b=Od54OOoFAtgZetCCabBOBorclUbr7an9gzaSsh1pk9AEh5YgUrfmc835bV7zCDGjtC
         q6UQrzd4fsYkIDvlu4QRJK/RflV99uEX7S31L61kXckUOaK4RZ4LC/ZZk+jZHcEC2IIm
         SVPwYYORczp9KJ4nPX60++K2/OlKVfvQJBR31CMI3xa4p0+cvv0Das1a+ped4KXX/P7R
         bA8IHo3ZECTQN5LEjvGjq4ic4Akul/Sn/9T+yt67mGGbn2WUdDnfpZspuhbrOwr5U5sr
         6ccN1ugKqAm5gUq4jLH4vFWmc+DtTxNkyEUdLc4D75RUq4lPcdAyIyiKthT4ZgEsMWxk
         kibg==
X-Gm-Message-State: AOJu0YyuUhjuWusjA9szBI+CNHZWn6reYtKJ9NoZhMOj9cqaNinuqeVf
	dvQk5MZ61b/aOmBXFyttXfa78Z6x8k5ChgfhofI=
X-Google-Smtp-Source: AGHT+IGle/MAf2Uh4JeYzPqUv34EoYhTZ1Xqh6/c0mizcLoS7OCUjyaZY+HIBYLx143mxPrOFDJskQ==
X-Received: by 2002:adf:eb0a:0:b0:32d:884b:7403 with SMTP id s10-20020adfeb0a000000b0032d884b7403mr12651625wrn.66.1698880281479;
        Wed, 01 Nov 2023 16:11:21 -0700 (PDT)
Received: from Bishop.fritz.box ([2a02:578:85c6:1101:e7a2:3f2c:a83f:5e92])
        by smtp.gmail.com with ESMTPSA id m11-20020adff38b000000b0032db4e660d9sm854601wro.56.2023.11.01.16.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 16:11:21 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 5/5 v3] image: add check_image_max_size as post function to check file size against IMAGE_FILE_MAXSIZE
Date: Thu,  2 Nov 2023 00:10:54 +0100
Message-ID: <20231101231058.86928-6-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101231058.86928-1-charles-antoine.couret@mind.be>
References: <20231101231058.86928-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 23:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190053

Trigger an error if the final size is above IMAGE_FILE_MAXSIZE value. Which is relevant if the
partition size is fixed and the user wants to be sure that the image can be entirely installed
into its partition.

If the variable is not set, no error is trigger. It works for all filesystems.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/classes-recipe/image.bbclass             | 30 +++++++++++
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 52 +++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 7231fad940..d2fcf078c9 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -509,6 +509,7 @@ python () {
 
         d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size')
         d.prependVarFlag(task, 'postfuncs', 'create_symlinks ')
+        d.prependVarFlag(task, 'postfuncs', 'check_image_max_size ')
         d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
         d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
         d.appendVarFlag(task, 'vardepsexclude', ' DATETIME DATE ' + ' '.join(vardepsexclude))
@@ -609,6 +610,35 @@ python create_symlinks() {
             bb.note("Skipping symlink, source does not exist: %s -> %s" % (dst, src))
 }
 
+#
+# Check if image size is lighter than maximum size
+#
+python check_image_max_size() {
+    def get_max_image_size(d, fs):
+        max_size = d.getVar("IMAGE_FILE_MAXSIZE:%s" % fs)
+        if max_size is not None:
+            return int(max_size)
+
+        return None
+
+    deploy_dir = d.getVar('IMGDEPLOYDIR')
+    img_name = d.getVar('IMAGE_NAME')
+    taskname = d.getVar("BB_CURRENTTASK")
+    subimages = (d.getVarFlag("do_" + taskname, 'subimages', False) or "").split()
+    imgsuffix = d.getVarFlag("do_" + taskname, 'imgsuffix') or d.expand("${IMAGE_NAME_SUFFIX}.")
+
+    for type in subimages:
+        file_name = os.path.join(deploy_dir, img_name + imgsuffix + type)
+
+        if os.path.exists(file_name):
+            file_size = os.stat(file_name).st_size / 1024
+            max_size = get_max_image_size(d, type)
+            if max_size is not None:
+                if file_size > max_size:
+                    bb.error("The image %s size %d(K) exceeds IMAGE_FILE_MAXSIZE: %d(K)" % \
+                    (file_name, file_size, max_size))
+}
+
 MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|${sysconfdir}|${nonarch_base_libdir}/udev|/lib/modules/[^/]*/modules.*|"
 MULTILIB_CHECK_FILE = "${WORKDIR}/multilib_check.py"
 MULTILIB_TEMP_ROOTFS = "${WORKDIR}/multilib"
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index dc88c222bd..afdc7a72fa 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -234,6 +234,58 @@ UBINIZE_ARGS_mtd_4_256 ?= "-m 4096 -p 256KiB"
                 self.assertTrue(os.path.exists(image_path),
                                 "%s image %s doesn't exist" % (itype, image_path))
 
+    def test_image_maxsize_success(self):
+        """
+        Summary:     Check if the image built is below maximum size if set
+        Expected:    image is built, size below the limit and no error are reported
+        Product:     oe-core
+        Author:      Charles-Antoine Couret <charles-antoine.couret@mind.be>
+        """
+        image = 'core-image-minimal'
+
+        config = """
+IMAGE_FSTYPES += "ext4"
+IMAGE_FILE_MAXSIZE:ext4 = "300000"
+"""
+        self.write_config(config)
+
+        res = bitbake(image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
+
+        image_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.%s" % (bb_vars['IMAGE_LINK_NAME'], "ext4"))
+        # check if result image is in deploy directory
+        self.assertTrue(os.path.exists(image_path),
+                        "%s image %s doesn't exist" % ("ext4", image_path))
+        # check if result image size is below than maximum value
+        self.assertTrue(os.stat(image_path).st_size / 1024 <= 300000)
+        # No error during execution
+        self.assertEqual(res.status, 0)
+
+    def test_image_maxsize_failure(self):
+        """
+        Summary:     Check if the image built with size above limit is triggering error
+        Expected:    the image size is above limit and triggers error
+        Product:     oe-core
+        Author:      Charles-Antoine Couret <charles-antoine.couret@mind.be>
+        """
+        image = 'core-image-minimal'
+
+        config = """
+IMAGE_FSTYPES += "ext4"
+IMAGE_FILE_MAXSIZE:ext4 = "1000"
+"""
+        self.write_config(config)
+
+        res = bitbake(image, ignore_status=True)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
+
+        image_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.%s" % (bb_vars['IMAGE_LINK_NAME'], "ext4"))
+        # check if result image is not generated
+        self.assertFalse(os.path.exists(image_path),
+                        "%s image %s doesn't exist" % ("ext4", image_path))
+        # Error triggered during execution
+        self.assertNotEqual(res.status, 0)
+
     def test_useradd_static(self):
         config = """
 USERADDEXTENSION = "useradd-staticids"
-- 
2.41.0


