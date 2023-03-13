Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62775C6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 12:16:04 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.17703.1678709762979691063
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 05:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c+8MTVOe;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id x13so550786edd.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 05:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678709761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6ifxvTjVmLO6WCdj2emtiWk54cTg+OJhSureo9A9Zs=;
        b=c+8MTVOezHg3OBfzNLh5bxi4SwoRW+lnCKFN9eXkRutNtV8iJA8CQVyNAZnQQbypIW
         TgwxmMJlK+QESApXKJX1MxuZpEP8CY/9ccH2YWWDKrspAT86MLnpyGIqCSO5Uqr9EKcB
         hqIg0hHV+SLRe56wUmrrxjsKMM5gb5C6DdSFtbIeKJqyKh8XXyYPePWz5sNruLlv2OX3
         q7Px6cTldeb3U7QuXXbEr5dH+LD+Qk3SBBNWditVgKGdzwYIM+BDKkmTciZwNXx5/Y7W
         ic9MVNko2R1Kruu7foBHQNTvRce6vFQ3yrMDxq34oagS3+JNtDwfXd2fhK4dRiEJTvMY
         f31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678709761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6ifxvTjVmLO6WCdj2emtiWk54cTg+OJhSureo9A9Zs=;
        b=DBilaJBekiJJgRZ3aEBxdwoZOeYYg9Il0opmdbUKYOUbMUN+1LSQQnfMUUm+PcFztG
         GYSSNTbqy0+hd8cnRXZQCUOFYC3d95PjpnMgRgGQxffvboHzD9wE9HiwZyQVpLiAxOeH
         6o6Qrtgaxk4HFUZMDFkrMOYVWolM/ocDtanWZgrWW63A5YggUs7eqZrnc8HskTNMZtxD
         G3D8verloHiXW3MQCleO70OAPiO9Ni10tksU7p5v63qEhvgeF10Tz3N/jQli/+r/2NMR
         rupqkXvo+kXvZ6D+xInVUhmW8n5R03wxasBRy2YUkMqPNbM+qcR6CYUvHPB+nquuQlxF
         Ak/g==
X-Gm-Message-State: AO0yUKWVv1P9cwLW30RtOTWtUNFy08m6ffRF7hFBvuaqgFnozF3XsJYW
	A3qBuhOUhuQ/ZuiGOpSr4DONa4NjXto=
X-Google-Smtp-Source: AK7set/B/oXoEljzBAAwoASQoiUYqr7o1xXeqcFwaj/xJCHHr0nC4WteIf1D1qGKXxFKXXlF8z0tRQ==
X-Received: by 2002:a17:906:30d3:b0:878:7291:d558 with SMTP id b19-20020a17090630d300b008787291d558mr31057589ejb.34.1678709761465;
        Mon, 13 Mar 2023 05:16:01 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d2-20020a50f682000000b004fb1a83cb00sm2175588edn.75.2023.03.13.05.16.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 05:16:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/14] runqemu: get_first_file() rename cmd* to glob*
Date: Mon, 13 Mar 2023 13:15:40 +0100
Message-Id: <8f10918980e1e7ab6634b687f9c4325b71f1f319.1678709427.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678709427.git.Martin.Jansa@gmail.com>
References: <cover.1678709427.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 12:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178445

* to better indicate how it's used in get_first_file

* cmd* is used in other places for actual shell commands
  to execute

* RunQemuError('KERNEL not found: %s, %s or %s' % cmds)
  also looked weird to me, but that works (to my python-noob surprise)

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/runqemu | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 58b0c191e1..32b0c5699c 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -116,10 +116,10 @@ def check_tun():
     if not os.access(dev_tun, os.W_OK):
         raise RunQemuError("TUN control device %s is not writable, please fix (e.g. sudo chmod 666 %s)" % (dev_tun, dev_tun))
 
-def get_first_file(cmds):
-    """Return first file found in wildcard cmds"""
-    for cmd in cmds:
-        all_files = glob.glob(cmd)
+def get_first_file(globs):
+    """Return first file found in wildcard globs"""
+    for g in globs:
+        all_files = glob.glob(g)
         if all_files:
             for f in all_files:
                 if not os.path.isdir(f):
@@ -676,12 +676,12 @@ class BaseConfig(object):
                     self.rootfs, self.get('MACHINE'),
                     self.fstype)
         elif not self.rootfs:
-            cmd_name = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'), self.get('IMAGE_NAME'), self.fstype)
-            cmd_link = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'), self.get('IMAGE_LINK_NAME'), self.fstype)
-            cmds = (cmd_name, cmd_link)
-            self.rootfs = get_first_file(cmds)
+            glob_name = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'), self.get('IMAGE_NAME'), self.fstype)
+            glob_link = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'), self.get('IMAGE_LINK_NAME'), self.fstype)
+            globs = (glob_name, glob_link)
+            self.rootfs = get_first_file(globs)
             if not self.rootfs:
-                raise RunQemuError("Failed to find rootfs: %s or %s" % cmds)
+                raise RunQemuError("Failed to find rootfs: %s or %s" % globs)
 
         if not os.path.exists(self.rootfs):
             raise RunQemuError("Can't find rootfs: %s" % self.rootfs)
@@ -741,10 +741,10 @@ class BaseConfig(object):
             kernel_match_name = "%s/%s" % (deploy_dir_image, kernel_name)
             kernel_match_link = "%s/%s" % (deploy_dir_image, self.get('KERNEL_IMAGETYPE'))
             kernel_startswith = "%s/%s*" % (deploy_dir_image, self.get('KERNEL_IMAGETYPE'))
-            cmds = (kernel_match_name, kernel_match_link, kernel_startswith)
-            self.kernel = get_first_file(cmds)
+            globs = (kernel_match_name, kernel_match_link, kernel_startswith)
+            self.kernel = get_first_file(globs)
             if not self.kernel:
-                raise RunQemuError('KERNEL not found: %s, %s or %s' % cmds)
+                raise RunQemuError('KERNEL not found: %s, %s or %s' % globs)
 
         if not os.path.exists(self.kernel):
             raise RunQemuError("KERNEL %s not found" % self.kernel)
@@ -761,13 +761,13 @@ class BaseConfig(object):
         dtb = self.get('QB_DTB')
         if dtb:
             deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
-            cmd_match = "%s/%s" % (deploy_dir_image, dtb)
-            cmd_startswith = "%s/%s*" % (deploy_dir_image, dtb)
-            cmd_wild = "%s/*.dtb" % deploy_dir_image
-            cmds = (cmd_match, cmd_startswith, cmd_wild)
-            self.dtb = get_first_file(cmds)
+            glob_match = "%s/%s" % (deploy_dir_image, dtb)
+            glob_startswith = "%s/%s*" % (deploy_dir_image, dtb)
+            glob_wild = "%s/*.dtb" % deploy_dir_image
+            globs = (glob_match, glob_startswith, glob_wild)
+            self.dtb = get_first_file(globs)
             if not os.path.exists(self.dtb):
-                raise RunQemuError('DTB not found: %s, %s or %s' % cmds)
+                raise RunQemuError('DTB not found: %s, %s or %s' % globs)
 
     def check_bios(self):
         """Check and set bios"""
-- 
2.39.2


