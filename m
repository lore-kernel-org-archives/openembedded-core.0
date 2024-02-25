Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6486DC54E41
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 20:48:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.6009.1708894075025664263
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 12:47:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iq77Jf07;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-412a590d9b6so738725e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 12:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708894073; x=1709498873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eM1I+EwtrRptgZ6sjA/jer/bbg7erQRVasvvbhV9khU=;
        b=Iq77Jf07M9GPNiVOX0ODvW71dvrYqzNgeUKwC2wx8zh14uokuq+nPg809qc32Uid7k
         BYHwmR9Nh3RN7w/QHRRwFoFlmYCNjp9iy5KrmkYKRw998TF5Gu1TbPReU40gwOe/QPUw
         76j23q6e9SJ73ue2WBNkWn55P27lsbbcS9YujecJC7XRjM30uMth9mlSt2lt4/QswtGR
         AXD9nANKrifMtFndCXouISQ0GCul3PY1VCBg648+H195lJK8rd+0yfwglWoGr7BQ1/ys
         Z6ttPFH6VkBleWAJ2llYwmILXG0eKEO34ilRgargniwS51SLQSvQhUyxScNq/UlNKpP2
         vRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708894073; x=1709498873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eM1I+EwtrRptgZ6sjA/jer/bbg7erQRVasvvbhV9khU=;
        b=xJqh5Uu5UNJCgN3VFnJ/9q+DEU5Wg+i+ZWddJAsoZ+iECjFdIXupSXZSUHms0uyHPB
         FAcxf4XoQHisnv5N1qUU+haHvP2xeyi5arKr0o3mnIIHuOlowE4WQtLKvYPUWIfxVHsX
         iCo9EyPDMwOZdt5zE3JUYST1C20W+ca2pM12Di+OS8NJrvtkGHwAJfMMxahmNaCsBRKc
         U0Dp23nG8MwNzvVUu06WMZLqYupOdApgI8oT0DHHfZkjgVZ6r8eLSX2z3dI11Ps3u3D1
         So998bw3N7h1Tdc4YawYbg1Tp+EDTIkDLFfV4tzcKJi8I9MzgOhCyAc9zrlKZO2XxdQj
         2NhA==
X-Gm-Message-State: AOJu0YwBnYzZtrjszvPVDGT9eCM2BRQOH7m6KRtx2PUBM8MSTcfKKlrV
	7stvh9dNhPnuSTjTwdFTctpE1ZQrOL1ef8Wh0acmJhW5UTijFyDUgNjaynmk
X-Google-Smtp-Source: AGHT+IFn7A6S+T3PHI4RvHcx2Z2GNo9crMVK2H/TqYxjIPtCdnrXfYTDzulN0LasukosnCsmcwxe0Q==
X-Received: by 2002:a05:600c:5188:b0:412:9e3f:6632 with SMTP id fa8-20020a05600c518800b004129e3f6632mr2716952wmb.23.1708894072966;
        Sun, 25 Feb 2024 12:47:52 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id dq2-20020a0560000cc200b0033b483d1abcsm6005989wrb.53.2024.02.25.12.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 12:47:52 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/4] devtool: ide-sdk prefer sources from workspace
Date: Sun, 25 Feb 2024 21:47:02 +0100
Message-ID: <20240225204741.650070-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240225204741.650070-1-adrian.freihofer@siemens.com>
References: <20240225204741.650070-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 20:48:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196149

Improve the previous commit:
- log an error if some assumptions are not true
- Use TARGET_DBGSRC_DIR variable
- Do the same for ide none

Why the additional source mapping is required:

For example the cmake-example recipe refers to sources like this:
./recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-readelf \
  -wi image/usr/bin/cmake-example | grep -B1 DW_AT_comp_dir
    ...
    <560>   DW_AT_name        : (indirect line string, offset: 0x1da):
    /usr/src/debug/cmake-example/1.0/oe-local-files/cpp-example.cpp
    ...

Another example is powertop:
./recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-readelf \
  -wi image/usr/sbin/powertop | grep -B1 DW_AT_comp_dir
    ...
    <561>   DW_AT_name        : (indirect line string, offset: 0x1da):
    /usr/src/debug/powertop/2.15/src/devlist.cpp
    ...

For recipes with local files this works. The oe-local-files folder is
not available in the rootfs-dbg and therefore the sources are first
found in the workspace folder. GDB searches for source files in various
places:
https://sourceware.org/gdb/current/onlinedocs/gdb.html/Source-Path.html
However, for the powertop example the sources opened in the editor are
from the rootfs-dbg instead of from the workspace.

Bitbake calls the compiler with
  -fmacro-prefix-map=${S}=${TARGET_DBGSRC_DIR}
where TARGET_DBGSRC_DIR defaults to "/usr/src/debug/${PN}/${PV}".

A source map which maps the recipe specific path from TARGET_DBGSRC_DIR
to the workspace fixes this.
The already existing source map for /usr/src/debug applies for all other
recipes. It finds the sources (read only) in the rootfs-dbg folder.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py | 19 +++++++++++++++++--
 scripts/lib/devtool/ide_plugins/ide_code.py | 16 +++++++++++++---
 scripts/lib/devtool/ide_sdk.py              |  3 ++-
 3 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
index 02707bfc37b..19c2f61c5fd 100644
--- a/scripts/lib/devtool/ide_plugins/__init__.py
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -134,8 +134,23 @@ class GdbCrossConfig:
         if self.image_recipe.rootfs_dbg:
             gdbinit_lines.append(
                 'set solib-search-path "' + self.modified_recipe.solib_search_path_str(self.image_recipe) + '"')
-            gdbinit_lines.append('set substitute-path "/usr/src/debug" "' + os.path.join(
-                self.image_recipe.rootfs_dbg, 'usr', 'src', 'debug') + '"')
+            # First: Search for sources of this recipe in the workspace folder
+            if self.modified_recipe.pn in self.modified_recipe.target_dbgsrc_dir:
+                gdbinit_lines.append('set substitute-path "%s" "%s"' %
+                                     (self.modified_recipe.target_dbgsrc_dir, self.modified_recipe.real_srctree))
+            else:
+                logger.error(
+                    "TARGET_DBGSRC_DIR must contain the recipe name PN.")
+            # Second: Search for sources of other recipes in the rootfs-dbg
+            if self.modified_recipe.target_dbgsrc_dir.startswith("/usr/src/debug"):
+                gdbinit_lines.append('set substitute-path "/usr/src/debug" "%s"' % os.path.join(
+                    self.image_recipe.rootfs_dbg, "usr", "src", "debug"))
+            else:
+                logger.error(
+                    "TARGET_DBGSRC_DIR must start with /usr/src/debug.")
+        else:
+            logger.warning(
+                "Cannot setup debug symbols configuration for GDB. IMAGE_GEN_DEBUGFS is not enabled.")
         gdbinit_lines.append(
             '%s %s:%d' % (remote_cmd, self.gdb_cross.host, self.gdbserver_port))
         gdbinit_lines.append('set remote exec-file ' + self.binary)
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 09f0bb2a07e..a62b93224ee 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -242,9 +242,19 @@ class IdeVSCode(IdeBase):
         if gdb_cross_config.image_recipe.rootfs_dbg:
             launch_config['additionalSOLibSearchPath'] = modified_recipe.solib_search_path_str(
                 gdb_cross_config.image_recipe)
-            src_file_map[os.path.join("/usr/src/debug", modified_recipe.pn, modified_recipe.pv)] = "${workspaceFolder}"
-            src_file_map["/usr/src/debug"] = os.path.join(
-                gdb_cross_config.image_recipe.rootfs_dbg, "usr", "src", "debug")
+            # First: Search for sources of this recipe in the workspace folder
+            if modified_recipe.pn in modified_recipe.target_dbgsrc_dir:
+                src_file_map[modified_recipe.target_dbgsrc_dir] = "${workspaceFolder}"
+            else:
+                logger.error(
+                    "TARGET_DBGSRC_DIR must contain the recipe name PN.")
+            # Second: Search for sources of other recipes in the rootfs-dbg
+            if modified_recipe.target_dbgsrc_dir.startswith("/usr/src/debug"):
+                src_file_map["/usr/src/debug"] = os.path.join(
+                    gdb_cross_config.image_recipe.rootfs_dbg, "usr", "src", "debug")
+            else:
+                logger.error(
+                    "TARGET_DBGSRC_DIR must start with /usr/src/debug.")
         else:
             logger.warning(
                 "Cannot setup debug symbols configuration for GDB. IMAGE_GEN_DEBUGFS is not enabled.")
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 289bbbf47c2..7807b322b31 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -301,6 +301,7 @@ class RecipeModified:
         self.staging_incdir = None
         self.strip_cmd = None
         self.target_arch = None
+        self.target_dbgsrc_dir = None
         self.topdir = None
         self.workdir = None
         self.recipe_id = None
@@ -357,7 +358,6 @@ class RecipeModified:
             'PACKAGE_DEBUG_SPLIT_STYLE')
         self.path = recipe_d.getVar('PATH')
         self.pn = recipe_d.getVar('PN')
-        self.pv = recipe_d.getVar('PV')
         self.recipe_sysroot = os.path.realpath(
             recipe_d.getVar('RECIPE_SYSROOT'))
         self.recipe_sysroot_native = os.path.realpath(
@@ -368,6 +368,7 @@ class RecipeModified:
             recipe_d.getVar('STAGING_INCDIR'))
         self.strip_cmd = recipe_d.getVar('STRIP')
         self.target_arch = recipe_d.getVar('TARGET_ARCH')
+        self.target_dbgsrc_dir = recipe_d.getVar('TARGET_DBGSRC_DIR')
         self.topdir = recipe_d.getVar('TOPDIR')
         self.workdir = os.path.realpath(recipe_d.getVar('WORKDIR'))
 
-- 
2.43.1


