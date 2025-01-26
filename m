Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6547BC0218F
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 12:48:23 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.29397.1737895697054733198
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 04:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UfukfzED;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43635796b48so22587655e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 04:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737895695; x=1738500495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hg6BpZMxb+pcWWGbamsXngDjIY6+IEVUiHYk+8prPJ8=;
        b=UfukfzEDRnTIkUOXBv7eRopdoKU2HsfAGdsxqUmnsnJQ1UGNipCHe52rGO1UDrRWdz
         O9hZcFsBOGnwxSKdY2YBVl/U8AnEPjEsVyhF0sTh4bMq2uUwUyEUSUNd/KY9N45Ts0HY
         luhD8wa8E+iljeqn/DByVMD5SKEyQey/IT9hAvwaCBbvB0V9frvHFYCc8Tr86VGjwLMi
         P626V09dKFuyS4bRE8GMEdahaeKxNrqqRyytx3VE/5xZgg/XOE5LJgiFMRuFX1AO6NUw
         DihzOw0D8+WC7QI/TcPTgdK/JKvZ8YDAijeFMiD+MmRTe6n5LVW2tQh+Ky/SVTJIiHlB
         7u4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737895695; x=1738500495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hg6BpZMxb+pcWWGbamsXngDjIY6+IEVUiHYk+8prPJ8=;
        b=tNu88rhUwF66ukCn1lhWCabAVLv70+Jeaz+7qZapnlRDJ+pVtWW6jmdkFKuoTwcVhD
         kVaDvQiSZSF0xLdKAHaTWA7Mal2eDAb7RRh7TzRqVRQL5y9cAohExJiYVSpPrXFNAEd/
         ex3PEr5fl3GfwkkMevAd2jxWSX3ImuK+lWQNuPRRhvTg6RRorP0GZMrDeJyE3F7diF6b
         ybjDgyYbtOUFSDCTXfo2lm0ThBOGYq+VB8rCvOinfJFE0YVYtebfR20aszeFVyr10Q/7
         fIR9a4Ow1OM9QEIXEO/bn5Z+HdJcBx01gOnxiqU6lC56YxX1+S2B16VeAsHJUBg0ArGR
         WEsQ==
X-Gm-Message-State: AOJu0YydPkH0Pgzf+hJSSseP+Uj7dz8mmmzu3J/nWmeyOZZ5bLGMbQbg
	722dhQ2J5MHK9NeOoA3awa8PCFQOyv3uwfRw0hzyWWsf3iN0qDGmEW7HdQ==
X-Gm-Gg: ASbGncuvWLfZZ9zc9v6pTsp/2oIz8HixSHAbp29y81UEAnoTHz4liFGbrAVqMs6hYrA
	kNz4dCK0wv4wIK5mqkavgngYqp5HpBolVXfgZgjd7n0RR3vgi7+MdficZ5+kEdBUupmD1+VzAVA
	H2jeoxKU8q0MhPqZC7xKsmozsD6/ZFFeV0Dpjb8BBo7sv1aw2DaVhHbewJD7/NL9r6Geyf7qm7z
	fTiaFKmfuugR+d00INZtyISknIDqb7UAUiUbbmeVzkoqQFuoc2szLc6amND5XFY9IZHuZqPXYoK
	yn5YjyZfiDsXuc5vsat5Ih/R3Jw=
X-Google-Smtp-Source: AGHT+IEHI2+ImSygUGsit7Q/LwVVb2pbQ2BjmX2miWQXE4shtpANHRyH6+cFLuY1tG1zR5HOf7GTAQ==
X-Received: by 2002:a05:600c:154a:b0:42c:baf1:4c7 with SMTP id 5b1f17b1804b1-438bd061259mr85426165e9.4.1737895695038;
        Sun, 26 Jan 2025 04:48:15 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48a906sm95938295e9.18.2025.01.26.04.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 04:48:13 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap,styhead][PATCH 3/5] devtool: ide-sdk recommend DEBUG_BUILD
Date: Sun, 26 Jan 2025 13:48:04 +0100
Message-ID: <20250126124806.1453644-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250126124806.1453644-1-adrian.freihofer@siemens.com>
References: <20250126124806.1453644-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 12:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210282

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/devtool/ide_sdk.py | 50 ++++++----------------------------
 1 file changed, 9 insertions(+), 41 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index eee5425aa7..5e4c543275 100755
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
 
@@ -988,6 +951,13 @@ def ide_setup(args, config, basepath, workspace):
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
 
@@ -1065,6 +1035,4 @@ def register_commands(subparsers, context):
         '-p', '--no-preserve', help='Do not preserve existing files', action='store_true')
     parser_ide_sdk.add_argument(
         '--no-check-space', help='Do not check for available space before deploying', action='store_true')
-    parser_ide_sdk.add_argument(
-        '--debug-build-config', help='Use debug build flags, for example set CMAKE_BUILD_TYPE=Debug', action='store_true')
     parser_ide_sdk.set_defaults(func=ide_setup)
-- 
2.47.1


