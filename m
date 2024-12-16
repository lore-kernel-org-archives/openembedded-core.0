Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205A6E77184
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 17:44:31 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.62604.1734371063819331141
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 09:44:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MUFAJPN/;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385e06af753so2319399f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 09:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734371062; x=1734975862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoZy9XMkcTm1EvF1HwkxTMLORXt5c3yZSCOY7iD6tkQ=;
        b=MUFAJPN/At8dZONQb4UaGXqIQ7e98eVRVt7QAJp1pxCbP5hllenityHhccLvDrtF4C
         O9gprhUKppiVdTrLMaWx1nxdZYMOjNR9FWKMYJYr+gkhPNKfC84N/5Hwrx/fiYkcayxx
         3X+LFCJZYGgQx+7Kn9Aw7lbNcdtrCXUdxBhbKM4stjdfw9EJb9p29Q/G8arjoL6b3N2r
         Ghag9hGUCOj1EFE3uH8yAdHQKjaepwS1y2U3iaW1aIbxvNnpM70yCQ3ixdO0YA/x1Cwx
         sv01asqGYym5BemLuhEUG/6lbrygFJv1lpj24ny/RxVJ0TweDREN4Z/hRFj6gE7Uzw3j
         7W3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371062; x=1734975862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hoZy9XMkcTm1EvF1HwkxTMLORXt5c3yZSCOY7iD6tkQ=;
        b=Zy0MnxpqkjRsIwLn6Qa4YVIQkWo9ZvKulyK8PkUeBAZUrqbYLz8jakxrhAa1EUlBT6
         3VnMd0CaU1M42GypyD+9yBH/ei9/nRy4zXZcydWehqEfoZgCYPHJwXXSNu7ZZhjiNvcx
         48WJ439z9PLdiNaZt/AfvkEOfVr72abtFG1IAXBabjL55TIbgfeoLatu3/KwgN8eXhhW
         EyV1vkO59b5KRb/cqlkD09VsazufGajwKWMxFcZxJJuhq7+Sq/9xl8MljH4fpM0aeh9a
         gDodoLR6l0LkL9mzFWKjEF/mX8/6gzeGsukwf8sRFkiVr1u6DdD/k2KP0pI6htV45ZcK
         sROQ==
X-Gm-Message-State: AOJu0YwHrzR5SOv9UHVGPWXOdhZaVBmCmMllJy/qeNi6/hhKWi7+Q8mt
	5UtphRZdppZBLXedMUSWPY0+6V7KlYxYDpjURQ5aWoQfkRYpOQpBQ0o+OQ==
X-Gm-Gg: ASbGncv3D8ldQ8RhRByau9DtdTVx8TtZ9v81QpDrGvdfm2+483Ry9NZwyHU7fp+O9ZM
	FPq9mqi2dIsvkr/SUL2zXA/KSuCxfAhW8hagcmwtwfFDuUSZ0P5oGPiJSUnCW3cmH6KddK6WoyU
	ngucAUKSASEmQPwLzo52HY7hunXqwEH3pxR6B/bNn5MmLjI3Nm8htCMFqrKFjT0VrzS8izlxmMB
	QKogUo1RJ9iQffwmZ2xgSZ241RowVTYOKrCUo87v1DHN/sp1+da9N79A18tnAtJcJwmGk8XaZv8
X-Google-Smtp-Source: AGHT+IGxzYjnhqljkaTYkh+ukKGnFMxDFhUqywyztqosH6TgKPIDfvWiM+Rel1rIX/ZlXzbxHX/mAg==
X-Received: by 2002:a05:6000:2a6:b0:385:fb34:d59f with SMTP id ffacd0b85a97d-38880af1508mr10929770f8f.11.1734371061793;
        Mon, 16 Dec 2024 09:44:21 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8046c46sm8892338f8f.71.2024.12.16.09.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:44:21 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/4] devtool: ide-sdk recommend DEBUG_BUILD
Date: Mon, 16 Dec 2024 18:43:05 +0100
Message-ID: <20241216174406.3128556-4-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241216174406.3128556-1-adrian.freihofer@gmail.com>
References: <20241216174406.3128556-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 17:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208788

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The debug_build_config function was never called. Compiling with debug
optimized compiler flags was not working. Even with the
--debug-build-config flag set, the build configuration from the recipe
was used.

The devtool ide-sdk --debug-build-config approach didn't work very well
anyway. The problem is that changing the bbappend file doesn't work
while bitbake uses the bbappend file. As a workaround, it would be
possible to parse the recipe, get DEBUG_BUILD and the path to the append
file, exit tinfoil, change the bbappend file, reopen tinfoil and do what
ide-sdk is supposed to do. Such an implementation would be complicated
and slow.
Therefore, the code that was originally supposed to implement this is
removed from ide-sdk and the new --debug-build function of devtool
modify is used instead. Additionally, a hint should be given on how to
manually add DEBUG_BUILD = '1' to bbappend.

This is compatible with the VSCode Bitbake plug-in, which does not
support this parameter anyway.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 50 ++++++----------------------------
 1 file changed, 9 insertions(+), 41 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 42ee13b3e54..ee7c68dbbe9 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -288,6 +288,7 @@ class RecipeModified:
         self.bblayers = None
         self.bpn = None
         self.d = None
+        self.debug_build = None
         self.fakerootcmd = None
         self.fakerootenv = None
         self.libdir = None
@@ -348,6 +349,7 @@ class RecipeModified:
         self.bpn = recipe_d.getVar('BPN')
         self.cxx = recipe_d.getVar('CXX')
         self.d = recipe_d.getVar('D')
+        self.debug_build = recipe_d.getVar('DEBUG_BUILD')
         self.fakerootcmd = recipe_d.getVar('FAKEROOTCMD')
         self.fakerootenv = recipe_d.getVar('FAKEROOTENV')
         self.libdir = recipe_d.getVar('libdir')
@@ -389,17 +391,6 @@ class RecipeModified:
         self.recipe_id = self.bpn + "-" + self.package_arch
         self.recipe_id_pretty = self.bpn + ": " + self.package_arch
 
-    def append_to_bbappend(self, append_text):
-        with open(self.bbappend, 'a') as bbap:
-            bbap.write(append_text)
-
-    def remove_from_bbappend(self, append_text):
-        with open(self.bbappend, 'r') as bbap:
-            text = bbap.read()
-        new_text = text.replace(append_text, '')
-        with open(self.bbappend, 'w') as bbap:
-            bbap.write(new_text)
-
     @staticmethod
     def is_valid_shell_variable(var):
         """Skip strange shell variables like systemd
@@ -412,34 +403,6 @@ class RecipeModified:
             return True
         return False
 
-    def debug_build_config(self, args):
-        """Explicitely set for example CMAKE_BUILD_TYPE to Debug if not defined otherwise"""
-        if self.build_tool is BuildTool.CMAKE:
-            append_text = os.linesep + \
-                'OECMAKE_ARGS:append = " -DCMAKE_BUILD_TYPE:STRING=Debug"' + os.linesep
-            if args.debug_build_config and not 'CMAKE_BUILD_TYPE' in self.cmake_cache_vars:
-                self.cmake_cache_vars['CMAKE_BUILD_TYPE'] = {
-                    "type": "STRING",
-                    "value": "Debug",
-                }
-                self.append_to_bbappend(append_text)
-            elif 'CMAKE_BUILD_TYPE' in self.cmake_cache_vars:
-                del self.cmake_cache_vars['CMAKE_BUILD_TYPE']
-                self.remove_from_bbappend(append_text)
-        elif self.build_tool is BuildTool.MESON:
-            append_text = os.linesep + 'MESON_BUILDTYPE = "debug"' + os.linesep
-            if args.debug_build_config and self.meson_buildtype != "debug":
-                self.mesonopts.replace(
-                    '--buildtype ' + self.meson_buildtype, '--buildtype debug')
-                self.append_to_bbappend(append_text)
-            elif self.meson_buildtype == "debug":
-                self.mesonopts.replace(
-                    '--buildtype debug', '--buildtype plain')
-                self.remove_from_bbappend(append_text)
-        elif args.debug_build_config:
-            logger.warn(
-                "--debug-build-config is not implemented for this build tool yet.")
-
     def solib_search_path(self, image):
         """Search for debug symbols in the rootfs and rootfs-dbg
 
@@ -950,6 +913,13 @@ def ide_setup(args, config, basepath, workspace):
                 recipe_modified.gen_meson_wrapper()
             ide.setup_modified_recipe(
                 args, recipe_image, recipe_modified)
+
+            if recipe_modified.debug_build != '1':
+                logger.warn(
+                    'Recipe %s is compiled with release build configuration. '
+                    'You might want to add DEBUG_BUILD = "1" to %s. '
+                    'Note that devtool modify --debug-build can do this automatically.',
+                    recipe_modified.name, recipe_modified.bbappend)
     else:
         raise DevtoolError("Must not end up here.")
 
@@ -1027,6 +997,4 @@ def register_commands(subparsers, context):
         '-p', '--no-preserve', help='Do not preserve existing files', action='store_true')
     parser_ide_sdk.add_argument(
         '--no-check-space', help='Do not check for available space before deploying', action='store_true')
-    parser_ide_sdk.add_argument(
-        '--debug-build-config', help='Use debug build flags, for example set CMAKE_BUILD_TYPE=Debug', action='store_true')
     parser_ide_sdk.set_defaults(func=ide_setup)
-- 
2.47.0


