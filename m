Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37E2C0218D
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 02:51:46 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.7730.1738205496936060069
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 18:51:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aODJDBDH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2166022c5caso3972245ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738205496; x=1738810296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+F6BB0qRD0vhqAy8HOXNuvdBIlExc3dRkXfBllP5LE=;
        b=aODJDBDHSsiPoWaSjMmNdPpT1m3S9XiSXYIZ+Nz3upKzFfA9D8YF6NvF6caXwRYYsz
         BDR7zIICy56BdFoHlAXCvFk5m4lAmevRf6pkGVL8v9l5FELu6ezz4XtgxS1LwJsoOwCp
         1NNzpSrOEDN+f1JZuao6m62oz6kpHJfTzHY1E2QlYsn7ax+PtBEV2Udp3i5HV52KFbvJ
         IdW+trels/69QaS7BD2LLyndPTsYt71YT2n78S6p4+EGjFOG182Jn0D6ogar+uxkh1TA
         HMkRHjVjYrHEMSdu/O87X+vz0KnKmLzKWDBn3hb433mr1lGLL/M/UW4J+15BL2/PtdaT
         uBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738205496; x=1738810296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+F6BB0qRD0vhqAy8HOXNuvdBIlExc3dRkXfBllP5LE=;
        b=udaC2EDyKX2Xa4QBR3NtsZqTpCCjj0+/8Lt2EKxLiayqgvaWAimHiAtHTCPVtMfMr7
         eosPNGyXP1DX5oE84srPuZqoLZp1PdcwVY9r9eW3dsY7mGzvf2bME1+rOW+V8KqwedXR
         T867HVL+OISL+XnUhi1IWc4+VE/xeVxdRC+7YKMa+FKN1Rco5772PJhi2r6bIZ9QqNGg
         PTLqpFo6pQ2OaConMDv9y/8ITi3DEyLrIui0BHsUFJ3sojTLK85GiQN+tE/A/T3jvw6P
         Y99eRiWPFqN9QPA0Yp1qn+5gsKlxdDz4e0+gDb3rgXryKLGgF3aW5twUz0RDCGJPMWEg
         ZJWA==
X-Gm-Message-State: AOJu0YwcUb32KjizZwP2mLeOc4miyKYTsSNBl5C8lqk7+ZiN2AEXln6R
	g8MMnassTuTlvg+Sv+oPeC3xa/g5W0R9qJtF+bUfDj1qIDVvGbdMPdUScZdU8Z1mZpjpKQCWfMC
	Tg/Y=
X-Gm-Gg: ASbGncv6MxlHbVkCq6ySHWOkD4/5EnPRSC3Oso52USrKmaKAbJPs1Mnofm7WXBKO60/
	QU/SrmYeP4iAhNvo/ZpXgHMf9xS4auics2no+aG0oFxms7qfLQH/SeLWyigVrUhq8SinNmvuyTD
	2ULHBlPbS6wC1yblxi4Nvtham4RNT8kIOLoOeudqRF/oPN8EugHdLoiaUaSp+6FGaFptDAHHcX7
	XkXVw2qYJucswklG9CpOxSFlIvD8JHJgBEIT0cB9EvkJBON24VXa16oeb1XJeTWT5jR2HvR6n/p
	6+qP
X-Google-Smtp-Source: AGHT+IEt2vmnAOd3Tx54O0eVuKOsFPHmqGuH8GK5r+eyQYvY3rji7QtnF6StpSfRGDJktOJYuhcXwg==
X-Received: by 2002:a17:902:e809:b0:21c:e34:c8c3 with SMTP id d9443c01a7336-21dd7c671a3mr89052735ad.24.1738205496197;
        Wed, 29 Jan 2025 18:51:36 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04794a4sm249726a12.60.2025.01.29.18.51.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 18:51:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/12] devtool: ide-sdk recommend DEBUG_BUILD
Date: Wed, 29 Jan 2025 18:51:10 -0800
Message-ID: <23795962683c792347a17854fb0521734497d4a8.1738205405.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738205405.git.steve@sakoman.com>
References: <cover.1738205405.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 02:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210430

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


