Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 054417CCF0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 13:37:03 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m1so9313583wml.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 05:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hDcJTNr7uGZuYowo/lOqcry9W1uATWp+ah1unliRUek=;
	b=cTNObVUlxhOoR3YN3izFQBn1XWmCsuJyZ0Am6qk5L/iIUnyhpBAHHyatlpR40OoxUb
	UN+2eaj758fD9HbyPClxu7sFi2Y0hp6eLLpeQO8bc+xMbdX+4k1NyoeIZLRPDINT+F2o
	1c76waPuzYpfC+jkr6TSNRTWymAcGs4HtKrWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hDcJTNr7uGZuYowo/lOqcry9W1uATWp+ah1unliRUek=;
	b=k6GorTnJeCJamN/+BLPu1HeLYYQ/NKemwP0s+86AAkc1jfA0t//M1gdkBS4whAHAMA
	Juln61zip19ALZ4rfx9QOU1LaONFO7UcDItgBoDE2Z0H2h90aQolVJ9sjRBaHfzeGPoe
	oANim1tlDQo70OI6SVmRncmE50H7PuKMrp3jcWJL6AyvTjpA1CGOQtb28IxpK/Fsz5ET
	sa153FXbWlVKwDiCdcujutPRsfiYhtRiWGqsUHStJZLlxSIGEQ6iPEAOPo2AWauCskqD
	NdqrXyXvjjJxsNm/IqkAQEQuQG5ZWDaMWBiDZL3/Q10RrWpXvECUK3SOAdxxJoJee1Zt
	QGxQ==
X-Gm-Message-State: AHQUAuZjhnWQJl5YCYhwtxspkHcbNWHv7nG1i1PMkfRTDrZj1dxuhZ5+
	D32DKL/KLkGxA+lugD3nA12FCmAP9dc=
X-Google-Smtp-Source: AHgI3IYzSgviBEdgwTX8L8Z9ROjB08DEFuJzjrJCYerzYrLxyvAAkp0mebr1u9fXzq14tIDVdB6BFQ==
X-Received: by 2002:a1c:c60b:: with SMTP id w11mr2957847wmf.39.1551361024221; 
	Thu, 28 Feb 2019 05:37:04 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k203sm4461214wmf.44.2019.02.28.05.37.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 05:37:03 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 13:37:00 +0000
Message-Id: <20190228133702.22445-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] scripts/wic: Be consistent about how we call bitbake
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
X-List-Received-Date: Thu, 28 Feb 2019 13:37:04 -0000
Content-Transfer-Encoding: 8bit

Whilst its tempting to call bitbake_main(), the script also directly executes
bitbake. By doing both this creates all kinds of races. Therefore
change to use subprocess execution in all cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/wic | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/scripts/wic b/scripts/wic
index 37dfe2dc589..b4b7212cfa0 100755
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
2.20.1


