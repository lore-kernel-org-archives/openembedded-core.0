Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93ECDC0015E
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 21:14:08 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.19657.1691356446459433016
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Aug 2023 14:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=DxTuZUVd;
 spf=pass (domain: essensium.com, ip: 209.85.128.47, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fe4cdb727cso20758675e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 14:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1691356445; x=1691961245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IeDx4xZ10/rJV5piXYBSCWSCabdbEoFEH60J0TbGrR4=;
        b=DxTuZUVdg43C/+u5oCYT0lZd+gDomVyjwnOl+ELfScEbpHi67MOLoo4XCH4fHkMZhq
         3AMv9BNG8JbpAUTlecYyjmR7RpgzQwG6YGhjQidOHWvzEQLb+JFYpsKs6mTSdNbDaoyq
         qPpO8GBaoEmJ/RhEu6FuaBUtk4w0T/N2M3mqh4uID35eScg92giv+HZ+olnirRd0Q2Jd
         LensgdQvd3Xvv/ocLlMYT4+7eBpBqSPLISSlm3dapChlm3EVeRHDXuMsRjUV8SyC+61v
         Vg7xuNcjohA95dtdKDBFxQKZA6roqL3mBMmApR0lNtmbMOHzbxoQkhTgjMOMN3B5y1iu
         lZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691356445; x=1691961245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IeDx4xZ10/rJV5piXYBSCWSCabdbEoFEH60J0TbGrR4=;
        b=C9sTqe/9x83AoBq78zKvFITkomw54yjRUCqcasn9vFZ18mo4/F+juTzjVPF4AlHvUf
         v2AgLu8Vq7fa0s/YQlJElmgQfJML8Wgccw+cZFTjnF43iEC+9pdqHEpZxlXVrGcfKNrV
         QCNAx4WUVf4i/pJVi0Ob3BwvlVqwuWrNbBT7mkmuJwjH2WqoqqVe9xjre8FS/xg+kw2F
         JFXT5lNekDnHqHyLKrkKt69E5c+a9zGkRVfHrw4o007aArbL4m+yU9at7iJ+9VUH1cGt
         ewfU9i/BMuAgvCdwAuf+2Z2YzxFSbRJVu7xcBg5O3O8gqQyx+ihCbgDNWlioEhSro2iS
         bqUg==
X-Gm-Message-State: AOJu0YwkGmjHAaHyJgUBbO9pL873J7kCdQ4ts62XVaoIT/vZrmuKwsmV
	IM3biX/e36fcGN+V/e4MXU3ImDoJWxF+v+lYYYI=
X-Google-Smtp-Source: AGHT+IGX6+1R06v69V0yL5nsnlF0qtNJyvu/S1gUs7iSKJRhJ2oPJvoq+B2GtrZrqbD39Kmarkbz5g==
X-Received: by 2002:a7b:c5d2:0:b0:3fe:2011:a7bf with SMTP id n18-20020a7bc5d2000000b003fe2011a7bfmr5775270wmk.6.1691356445042;
        Sun, 06 Aug 2023 14:14:05 -0700 (PDT)
Received: from Bishop.fritz.box ([2a02:578:85c6:1101:e7a2:3f2c:a83f:5e92])
        by smtp.gmail.com with ESMTPSA id 21-20020a05600c021500b003fe1a092925sm8612055wmi.19.2023.08.06.14.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 14:14:04 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
Subject: [PATCH 5/5 v2] image: add check_image_max_size as post function to check file size against IMAGE_FILE_MAXSIZE
Date: Sun,  6 Aug 2023 23:13:46 +0200
Message-ID: <20230806211348.1191553-6-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230806211348.1191553-1-charles-antoine.couret@mind.be>
References: <20230806211348.1191553-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 21:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185579

Trigger an error if the final size is above IMAGE_FILE_MAXSIZE value. Which is relevant if the
partition size is fixed and the user wants to be sure that the image can be entirely installed
into its partition.

If the variable is not set, no error is trigger. It works for all filesystems.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 meta/classes-recipe/image.bbclass | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index e0dfba4a42..bf47f3dea3 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -509,6 +509,7 @@ python () {
 
         d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size')
         d.prependVarFlag(task, 'postfuncs', 'create_symlinks ')
+        d.prependVarFlag(task, 'postfuncs', 'check_image_max_size ')
         d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
         d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
         d.appendVarFlag(task, 'vardepsexclude', ' DATETIME DATE ' + ' '.join(vardepsexclude))
@@ -610,6 +611,35 @@ python create_symlinks() {
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
-- 
2.41.0


