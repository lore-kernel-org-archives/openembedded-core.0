Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE95BC761AF
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 12:16:04 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.17698.1678709756204472166
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 05:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QVs3j0E6;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id cn21so17663531edb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 05:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678709754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FklETNJYSgxIablJBxOsB/0XN/yTU65l2qUMmM33Nho=;
        b=QVs3j0E6mPVlUT6CzX8zXtE2yPoBYGBUZZGILmi/3qqyg1pl/4CFF5dJgOGviaVsW9
         3N/WsTahSk5craZYAehOQ9d6+D7PxjcJGsld1n9AoLKj7a6xk5CFqiZJ+53hV67BNtjh
         cKZ4Vtz+d8kmV4fzjbYOekjNkJVISonSueeMAwS0zztvi1YpiKYZQKFH4kqezPBKdH8z
         lXuVkEbEpEUHeQNYqKuoSyWevkibgSV/F1wXiOC/z1/aEy7Utrl4Jfsj31282Z6wkfFA
         5teckPkfJm5oinQbXhByya4fnLOFnCO/iplj5UsdhHT1mkSjTKdaRffrFKBnXgsXU1mA
         0zPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678709754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FklETNJYSgxIablJBxOsB/0XN/yTU65l2qUMmM33Nho=;
        b=uaYvLdsFJJpdXPgqyTcLfghzH1AUVUAy6eerBWOf3Z+TtatEDi/y+rK2Uaor5fFGmv
         leHA6NCoOneUEEDJXxcc4NnTgK7ETHIdfldfYyM+T/qgY0kvbNrSZ7DEmFX3GboG/Vu5
         HxcxMTHPsnP6qNWHclPRABgv5Xnkcah4XQCy8i08i8Zv1WA4FD5HEzqaP8ZRLey7sMX1
         2Uny6T9gWXJ4IuTgZuw3XAcAK4SqBXjPrTzFp55uQ4tx7AeRn8IXKIK8Bz7lcTzl07z1
         GBpjI4TLryB21uSfxr2io/Ue2hDiZ1aKyI/9zrq+nK23va/gwZ6fYU6KxEt6hmg3xkOM
         CnWQ==
X-Gm-Message-State: AO0yUKWOwSK3suXsvsXK0vB8MOHMfaaPE/OJ7lDqla2dclLMl0UCuXW2
	XdnyxlVSXIQ1jcb0O5O/nIlG85oZJSo=
X-Google-Smtp-Source: AK7set/BAFyIL1nCbmHqJaxl0mO9P2Y4llWD5err61CRj3jiSQkuKzNDTehV0f0FvJAoO0xCASOGbQ==
X-Received: by 2002:a17:907:3186:b0:92b:dff4:f8e9 with SMTP id xe6-20020a170907318600b0092bdff4f8e9mr465196ejb.8.1678709754712;
        Mon, 13 Mar 2023 05:15:54 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ku16-20020a170907789000b0090e0a4e1bacsm3356347ejc.159.2023.03.13.05.15.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 05:15:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/14] selftest: wic: respect IMAGE_LINK_NAME
Date: Mon, 13 Mar 2023 13:15:30 +0100
Message-Id: <c0bbef2cf864152e71b40cda69cb0bc886d211a8.1678709427.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678709427.git.Martin.Jansa@gmail.com>
References: <cover.1678709427.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 12:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178435

* use IMAGE_LINK_NAME instead of hardcoding
  core-image-minimal-${MACHINE} assumption

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 38 ++++++++++++++---------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index b9430cdb3b..7c31848732 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -805,12 +805,13 @@ class Wic2(WicTestCase):
         config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "wic-image-minimal"\n'\
                  'MACHINE_FEATURES:append = " efi"\n'
         self.append_config(config)
-        bitbake('wic-image-minimal')
+        image = 'wic-image-minimal'
+        bitbake(image)
         self.remove_config(config)
 
-        deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = self.td['MACHINE']
-        prefix = os.path.join(deploy_dir, 'wic-image-minimal-%s.' % machine)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
+        prefix = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], '%s.' % bb_vars['IMAGE_LINK_NAME'])
+
         # check if we have result image and manifests symlinks
         # pointing to existing files
         for suffix in ('wic', 'manifest'):
@@ -1049,14 +1050,14 @@ class Wic2(WicTestCase):
 
     def _rawcopy_plugin(self, fstype):
         """Test rawcopy plugin"""
-        img = 'core-image-minimal'
-        machine = self.td["MACHINE"]
+        image = 'core-image-minimal'
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
         params = ',unpack' if fstype.endswith('.gz') else ''
         with NamedTemporaryFile("w", suffix=".wks") as wks:
-            wks.write('part / --source rawcopy --sourceparams="file=%s-%s.%s%s"\n'\
-                      % (img, machine, fstype, params))
+            wks.write('part / --source rawcopy --sourceparams="file=%s.%s%s"\n'\
+                      % (bb_vars['IMAGE_LINK_NAME'], fstype, params))
             wks.flush()
-            cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
+            cmd = "wic create %s -e %s -o %s" % (wks.name, image, self.resultdir)
             runCmd(cmd)
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(os.path.join(self.resultdir, "%s-*direct" % wksname))
@@ -1077,12 +1078,11 @@ class Wic2(WicTestCase):
         """Test empty plugin"""
         config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "test_empty_plugin.wks"\n'
         self.append_config(config)
-        bitbake('core-image-minimal')
+        image = 'core-image-minimal'
+        bitbake(image)
         self.remove_config(config)
-        deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = self.td['MACHINE']
-
-        image_path = os.path.join(deploy_dir, 'core-image-minimal-%s.wic' % machine)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
+        image_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], '%s.wic' % bb_vars['IMAGE_LINK_NAME'])
         self.assertTrue(os.path.exists(image_path))
 
         sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
@@ -1297,12 +1297,12 @@ class Wic2(WicTestCase):
         # build an image
         config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "directdisk.wks"\n'
         self.append_config(config)
-        bitbake('core-image-minimal')
+        image = 'core-image-minimal'
+        bitbake(image)
 
         # get path to the image
-        deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = self.td['MACHINE']
-        image_path = os.path.join(deploy_dir, 'core-image-minimal-%s.wic' % machine)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
+        image_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], '%s.wic' % bb_vars['IMAGE_LINK_NAME'])
 
         self.remove_config(config)
 
@@ -1310,7 +1310,7 @@ class Wic2(WicTestCase):
             # expand image to 1G
             new_image_path = None
             with NamedTemporaryFile(mode='wb', suffix='.wic.exp',
-                                    dir=deploy_dir, delete=False) as sparse:
+                                    dir=bb_vars['DEPLOY_DIR_IMAGE'], delete=False) as sparse:
                 sparse.truncate(1024 ** 3)
                 new_image_path = sparse.name
 
-- 
2.39.2


