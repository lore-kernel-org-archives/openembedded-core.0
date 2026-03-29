Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C04AF3D60C
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 13:47:57 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29642.1774792073512161281
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 06:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=BaTCRaZy;
 spf=pass (domain: essensium.com, ip: 209.85.221.52, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfbd17589so313800f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 06:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1774792072; x=1775396872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzQAqf6w0j08d70wxJNSzhxEpwxdWYNbRT0uzfDjNpo=;
        b=BaTCRaZyD/lEha50J8kQ+DIqbZuRxO4fD5eUNy0gd+uusnrnPOn8SaK8koKuAtodJg
         88IB64SF9aRgvVrzmxoVtlGKnUroAKX3Rl1FFMDWKI5mp0CRNbQlGko9vBuTu/QpzBSl
         xdM/raG/NpiOY8iflwU5pXintaUeN/Qg/J9lI0n//CWcMhcvw37TuMG1N19fx18FsvwA
         VgZ9bJHUaebgyYe1bLpgiRcfAACu6bQ+lZh/9mSBJQDodTU1nnXfzcFcKSVmgJgf93zt
         ykTXwvmR04qh55sjPR+l7Gg5AbsKFhVnIpBYGVPjo9tPFomYAJO6t5eRWEpKlUz+p5Xg
         IJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774792072; x=1775396872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CzQAqf6w0j08d70wxJNSzhxEpwxdWYNbRT0uzfDjNpo=;
        b=UwZLdK20kTdyzJXU5650u/3yDRRGUukw/kZll368+BkZvxfoAmQ//auAhM7Cu80D/0
         w0Xd9+t+O6Kdph+xS/3l2geqfQE6cDV5ViKao+HAb3FabYoO1SsOif2YQcTPxC4wOIB7
         dXae4GQ3nhX5vpi3MxDzAR48M+nAAfN+tFTI3u7wrYq+lhvFKfzp1C+D129Y7buxd3Rk
         ShtA2Lr6qq3x4qQ2MiVwGmdlK5sps9LQztNoSHeRKEnZjAImnjHScKsXYVxfucnviarK
         HMHR+OnElwLMEszJGlCAhXRZRB/hXmVqFvTOxthuC7yMeOq0dfOiaeP+QBVOnvWDS9lJ
         B36A==
X-Gm-Message-State: AOJu0YzdNfX5N+EM92xrDxh11ueqnr7V1kXPE4R6Fc5Rcj2An/wQfa7T
	ZObvvDBcO7Bnki9PTieVtorFFMyQ7vaeXolRF0vA0NyT1n1pq2f1iK8Ud+AHSq7af0INgYCnygK
	N9kFA
X-Gm-Gg: ATEYQzxwaz1xPj44r3yqhof/hSFglvk+MPIkUhAxnndRwzvqq9bKLb0wUKpfnagEo1r
	VuRAwCpLlKmpyRAx9LRq9ot+cvXU1KEFM8IBIhmIJ0AC3I1slqy/hVnb2gcYiqXQkyL5hGhcAcy
	SdTjV3SHOsQP563+z1NotBg2rOmItZwtvC1jmIdFLhJw/p7Wdo9AJxrw3Kee7165G22kw96LQNg
	WWiG0vePQ3i+sMB7DZhhcPVopbmblwZUWFjmLdGjd6GqWNipwHXjud2O3CRExifs8F3tbpWR2+n
	wAu9nSG0/14cTumIaF0Bn1A5NFHBT3u71gnkolJx2sa/YanzB97EzN5j+M/Z2BLbVMQow0Qyp19
	u0bQQni8d3lUARfAJ04EwT5wNSLQOSV2d2LVxLg4uc0bG+Z/kh8Yt0N1Hd1nk/pPLUvtiNOJ+dI
	8n2cTArKrAIH92Owu1dND9WYRQZ3530A5Qgj20rV2OClo=
X-Received: by 2002:a05:6000:2681:b0:43b:998c:d6ed with SMTP id ffacd0b85a97d-43b9ea4ae83mr14815128f8f.26.1774792071873;
        Sun, 29 Mar 2026 06:47:51 -0700 (PDT)
Received: from Jimmy.fritz.box ([2a02:578:85c6:1101:1ab9:445:1169:11e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e9e18sm11162908f8f.9.2026.03.29.06.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 06:47:51 -0700 (PDT)
From: charles-antoine.couret@mind.be
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH] image: add check_image_max_size as post function to check file size against IMAGE_FILE_MAXSIZE
Date: Sun, 29 Mar 2026 15:47:16 +0200
Message-ID: <20260329134716.3185469-7-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329134716.3185469-1-charles-antoine.couret@mind.be>
References: <20260329134716.3185469-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 13:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234149

From: Charles-Antoine Couret <charles-antoine.couret@mind.be>

Trigger an error if the final size is above IMAGE_FILE_MAXSIZE value. Which is relevant if the
partition size is fixed and the user wants to be sure that the image can be entirely installed
into its partition.

If the variable is not set, no error is trigger. It works for all filesystems.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/classes-recipe/image.bbclass             | 29 ++++++++++
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 53 +++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 53f1a9dc45..e0c66f0a31 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -524,6 +524,7 @@ python () {
         d.setVarFlag(task, 'imagetype', t)
 
         d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size')
+        d.prependVarFlag(task, 'postfuncs', 'check_image_max_size ')
         d.prependVarFlag(task, 'postfuncs', 'create_symlinks ')
         d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
         d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
@@ -626,6 +627,34 @@ python create_symlinks() {
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
+
+    for type in subimages:
+        file_name = os.path.join(deploy_dir, img_name + "." + type)
+
+        if os.path.exists(file_name):
+            file_size = os.stat(file_name).st_size / 1024
+            max_size = get_max_image_size(d, type)
+            if max_size is not None:
+                if file_size > max_size:
+                    bb.fatal("The image %s size %d(K) exceeds IMAGE_FILE_MAXSIZE: %d(K)" % \
+                   (file_name, file_size, max_size))
+}
+
 python write_image_output_manifest() {
     import json
     from pathlib import Path
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 87c3da228a..b956cfd32a 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -234,6 +234,59 @@ UBINIZE_ARGS_mtd_4_256 ?= "-m 4096 -p 256KiB"
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
+        link_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.%s" % (bb_vars['IMAGE_LINK_NAME'], "ext4"))
+        image_path = os.path.realpath(link_path)
+        # check if result image is in deploy directory
+        self.assertTrue(os.path.exists(link_path),
+                        "%s image %s does not exist" % ("ext4", link_path))
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
+        link_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.%s" % (bb_vars['IMAGE_LINK_NAME'], "ext4"))
+        # check if result image is not generated
+        self.assertFalse(os.path.exists(link_path),
+                        "%s image %s exists" % ("ext4", link_path))
+        # Error triggered during execution
+        self.assertNotEqual(res.status, 0)
+
     def test_useradd_static(self):
         config = """
 USERADDEXTENSION = "useradd-staticids"
-- 
2.53.0


