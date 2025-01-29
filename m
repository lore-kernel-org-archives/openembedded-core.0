Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0118BC0218F
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 18:05:28 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.19284.1738173919116173342
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 10:05:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bcs2x00R;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-216401de828so134867415ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 10:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738173918; x=1738778718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+F6BB0qRD0vhqAy8HOXNuvdBIlExc3dRkXfBllP5LE=;
        b=bcs2x00Ri7g3X8FlzhfUSBCPni4xROnBQLWJJ8mSfAZjHUT++8i9MYXw0TgcVTRFOq
         o+RTUn7FVbMeTyKX35RUVaphlzC9fz3aamqEK5n/bUxfW0K29tkpeM/DctrozNgyIXVx
         yR3BMz4Mhjy506bnDinaA4OznYZIW8WiWC6Gd+hnGlSUqi/xRVVAh1dpbltqx5D1+ygR
         LthpK0QOc64OckyBw67gcJW8Y8QXmc/gIHKl7FHCnzX5kKPbkeUtwZrAOpTpdUVah1IB
         Wy4imrTVPRBiaMqyERatCLe3Wo9/SzhkfVVqOg60YKqPlbwnAorIIfybaixHAJlm76X9
         N+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738173918; x=1738778718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+F6BB0qRD0vhqAy8HOXNuvdBIlExc3dRkXfBllP5LE=;
        b=KQqv+ITQhnhueOLewBLcFpPBPkAXtIQM68SJk+Wj+tbwHInTvu3heHvPrgxsIxGP+J
         aZ1ZT5UNO8nGF51IrrPiI7Z2t5OXHT9YmMEev6XfWstIG1FGYQS0Izf0LUfMRr11NTMD
         s9PM9SJ78AufDQvhT0v9LvnIbMsKa4W3vSxqxzoyhfIzjISdJwMFbZH3jeJcjzj49QE6
         rkLWBww47YEkd5D2VpafOSbDwkYdm6awEovPQB/7kSicEEWPAedfH+X0lUvukGR8+VAL
         A/rBYB9eBwFLinZq5iTt+gphIy/iBymWE7uwCIpKsNz1kOfNYQGv4BBAtaUDev0tL8PP
         xtnw==
X-Gm-Message-State: AOJu0Yxtsp5NSDvwtK93iQ1xZB9TblPPopc4et9C1my4gK6B/i9+a1L3
	8OPVaW7yEujQ4uGsvVFUMneTtZcLZlEedBft1ZH6yJXR2PIiLVTzbehcZ5dlf/lusWxaoOuKMGd
	gVnw=
X-Gm-Gg: ASbGncvtCdulMC5oXtK6yyQ4dREckYCFZ9hZX6WnEZz2F9OILRCSZvIVgN2JW38vLlI
	EMba+tYoSUVnSCzPSEhzaZJblidNf703VRwZqUnuK85mSk9WBF/EyhDuCOYzQd7ILsxJbAcoX6Z
	yEWH9uZoRcTRLza60uomtEAfjVrlTDTDRU8Ryjnxv4BVeDOgkioXAP2vvnuKGuvYfz0AlEaDOIY
	KxEw5W04mWVqHHY4t7TxvTfb7RiKV+Y5a3NYoKqlMM8E/P+fShI7PdKEkxYRjix/maiqVJYb1LE
	jcBl
X-Google-Smtp-Source: AGHT+IEOYBdH46KuUxzVNeXAADkmGahGrk3YiPOVnRyIL/8OPKEyOXGtBySLq48xX/qwbSfOxGmA5w==
X-Received: by 2002:a05:6a20:9f45:b0:1ea:ddd1:2fcf with SMTP id adf61e73a8af0-1ed7a462e94mr6976862637.4.1738173918342;
        Wed, 29 Jan 2025 10:05:18 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a69fb24sm11496435b3a.8.2025.01.29.10.05.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 10:05:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 6/8] devtool: ide-sdk recommend DEBUG_BUILD
Date: Wed, 29 Jan 2025 10:04:55 -0800
Message-ID: <8753ddc7a42a09eec9b12af97b2b511b2970d83c.1738173760.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738173760.git.steve@sakoman.com>
References: <cover.1738173760.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210400

From: Adrian Freihofer <adrian.freihofer@gmail.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


