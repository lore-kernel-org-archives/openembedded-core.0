Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 50D3B7D91D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:28 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 4so2568065wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QL2N/V+vei9HwgDYMxBx7X7/QBhh60cS2ZnkP0jBYuY=;
	b=lGI6YKQ3H3Q1D/7T1LafmbAkOvDeSp+vBq6pCFb+J4JEAyT+ZR15HXihXz8DZndfM+
	anDtm2jj3jke1/1B4QtrlI6wOH2QKcZOq7o+tM7e+4DIOJQUYBsjAKteIPRM6xulk2mb
	ARPBA9avp1R2U8uIeOaHZphqvjlSp75v3/dBmhazqwsQTM+ELyWKssvWLactYxy+0WoC
	PF9AW1JMkuBy3lp8dB4Zu4j/HaXQuz76iCbEQtsJvWwPjyDzSprGg/6x/Csr/Lo3rsV/
	nrF+mWKOlEUqGPwtGENAjr0CuoY39qqWbWMSHyr5zHzOgoeWsNTLAEoDgB2RYuNVjJ9n
	t8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QL2N/V+vei9HwgDYMxBx7X7/QBhh60cS2ZnkP0jBYuY=;
	b=i2JFJhzKsUlDVLG8I4YuYf2Pu+g7xDyr1fkg6VvOZOo4KmdeJjH7k2Y3SlSzLD3VRy
	ERUmcmIZ6caZ049K8/DjU5+jtLyUNFIofyyQnZaovx9PJVi4PosFKf+1RGVT48HR9bzE
	BOo3N2VQv4HcgFLurOZFUlnS+7KGs8sj/cPdIRerfIS5Xr3fTzpkMBxsYvElupKfKdzG
	EPpXeX33RBnwoXB/VgMtDiZ+cf5FsvgtE2lOCH3UtTBkfLPVsysy/gA2fgsq64Ifx2GR
	+IKD2TzBM27xz0i0/dfOWGruwU+04Kk290WBzGgCpATyqClzMAMl0e+LoCN+XNhBKGT4
	L1Wg==
X-Gm-Message-State: APjAAAUvsDCHqCB49gyQwDqhViCAsHsAwjVnUPppKOp6b41Z23dI7sGJ
	Ol0c/3DCAFmImhOhdbCcMt8KYw0u8zQ=
X-Google-Smtp-Source: APXvYqxKvI14xv48/Lu1mkIchX7d67EW4jmrvgauT2qxX0h2WE43gTSmnFkHweKtHQ3gRErejiKnKg==
X-Received: by 2002:a1c:20c1:: with SMTP id g184mr2826557wmg.137.1554901948743;
	Wed, 10 Apr 2019 06:12:28 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:41 +0530
Message-Id: <2f2d52a958d3e9d511a2f5b8b14ed46466dd0d23.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 22/33] scripts/wic: Be consistent about how we call bitbake
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2019 13:12:28 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Whilst its tempting to call bitbake_main(), the script also directly executes
bitbake. By doing both this creates all kinds of races. Therefore
change to use subprocess execution in all cases.

(From OE-Core rev: 0507ec4c6069490c9a503e9e2b65f0e7b1962d34)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/wic | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/scripts/wic b/scripts/wic
index 37dfe2d..b4b7212 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -35,6 +35,7 @@ import os
 import sys
 import argparse
 import logging
+import subprocess
 
 from collections import namedtuple
 from distutils import spawn
@@ -63,10 +64,7 @@ if os.environ.get('SDKTARGETSYSROOT'):
 bitbake_exe = spawn.find_executable('bitbake')
 if bitbake_exe:
     bitbake_path = scriptpath.add_bitbake_lib_path()
-    from bb import cookerdata
-    from bb.main import bitbake_main, BitBakeConfigParameters
-else:
-    bitbake_main = None
+    import bb
 
 from wic import WicError
 from wic.misc import get_bitbake_var, BB_VARS
@@ -124,7 +122,7 @@ def wic_create_subcommand(options, usage_str):
     Command-line handling for image creation.  The real work is done
     by image.engine.wic_create()
     """
-    if options.build_rootfs and not bitbake_main:
+    if options.build_rootfs and not bitbake_exe:
         raise WicError("Can't build rootfs as bitbake is not in the $PATH")
 
     if not options.image_name:
@@ -160,9 +158,7 @@ def wic_create_subcommand(options, usage_str):
                 argv.append("--debug")
 
             logger.info("Building rootfs...\n")
-            if bitbake_main(BitBakeConfigParameters(argv),
-                            cookerdata.CookerConfiguration()):
-                raise WicError("bitbake exited with error")
+            subprocess.check_call(argv)
 
         rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", options.image_name)
         kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE", options.image_name)
@@ -179,9 +175,7 @@ def wic_create_subcommand(options, usage_str):
 
     if not options.vars_dir and (not native_sysroot or not os.path.isdir(native_sysroot)):
         logger.info("Building wic-tools...\n")
-        if bitbake_main(BitBakeConfigParameters("bitbake wic-tools".split()),
-                        cookerdata.CookerConfiguration()):
-            raise WicError("bitbake wic-tools failed")
+        subprocess.check_call(["bitbake", "wic-tools"])
         native_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE", "wic-tools")
 
     if not native_sysroot:
-- 
2.7.4


