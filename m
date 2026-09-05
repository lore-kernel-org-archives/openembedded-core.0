Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34738C624D6
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 09:21:37 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4764.1788600089880373653
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 02:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NgyqyA7q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so13818115e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 02:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788600088; x=1789204888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eVhCOPF/WCsdWJAxIlD6x94VkPIW1ek/LSOgSYJsqlY=;
        b=NgyqyA7qM+bXjkCKzazSl71NU7i412KCLwtz84EReluO9FRezTOvxUx+9QPwmKL6x+
         HvwPXfnMWKcrvSrPtb3oLHum2bcG2+8X8CCPaoguzU/nxSoY+N/P41aZF5snS2y/mB+y
         dNH8jlP/Mgo9yDjDsADlCf5raOji1YrE7hKvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788600088; x=1789204888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVhCOPF/WCsdWJAxIlD6x94VkPIW1ek/LSOgSYJsqlY=;
        b=BSv6uLyIPBT5FLisZdmJOPPrbKeyypqF85XXFFvT/GBoxxz7OqCF78YuV7JnfggOmc
         aiHWv7pw2xCLHt5CnZYp5RtIM5g1xk4Lkk9vBV/A+hLAu4jlyVGD4gub1w+rTAKRTWP/
         +X9r6bBMCT8LuAAsPqI7Dol4Z4FanRIoM+L+jxunu0A20lBJiLEJOQRAgUEFJXXlGJiM
         Yb7XDrUYy7tF466/1xxPzQMTvlBsni+GJv98milzKJrvLTQuo0Y302hvPiUR2RXxLxZ9
         ulaOViaf0fS5IfcP4jA67VcYWWi2adOi6Prrgv84bWyyCKsK+ztxaxN1kQoh8mkuJh+A
         C3dw==
X-Gm-Message-State: AFuF++mh8X/0IFuEDSG+6zInOOlZu6+/ijxH89k69TO4fQj5iLLhVMEY
	5zUOkQZ6sLDkBuZbUEKKynIUEE2/6K7dNNZos2cqVhdtbMQLQ3ggr8PIl64ahTZw6ClDcsrGuBu
	/5UMrQ2g=
X-Gm-Gg: AYBFou2nr4vjZPDarJLZRtiz4fwwkB3EAcqa9/gC4r90dt+CrGd2lw7WG1IjX9ZIK8h
	1D4fKgkEdPKi+P67qdb5wr7RVR0w3C3NBvcarV+LCIKTfTKjVwinOl9JtyvdVscWHTqaVggLJkb
	YKJcAsmO0MdvqkgdpacV16C/wFfpGFMqAwqE89z9sDMnf1SAUyOriFr6hXPAofETjXxZqny6LMB
	7J7td/YZkB+fHdb0c1ey8Gxak/zwDAfRrCQwb2nbic0Aw1MQ35AReZv6yocmIaO8gp6r15WHwjh
	qYjGIyaGO3GkQ88lgOxaMSNUtHAOuSBJXqiHhoYxkHX+6PBbX0SGoFWZ6lfwcSisKSCJ9w7FW/f
	fu2TySN6I0596Srft/ayGhEfJcFTK+J6LJpaE15FQe84rGRqOQPqcSEbRnZOuPBxXomsTsUeXMK
	Clie28s7kqqygA0+/9coTJ0SCLF+7E8Y71NqZOlHv5DXnjgl4uvasORbTKcKSWHHyMsKYRn5uhe
	xdSS/wlYIGXy3cD
X-Received: by 2002:a05:600d:4444:20b0:49c:fc6c:be0a with SMTP id 5b1f17b1804b1-49cfc6cc001mr66651165e9.33.1788600087958;
        Sat, 05 Sep 2026 02:21:27 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:98f:90b6:41a8:38d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm522657855e9.0.2026.09.05.02.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:21:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Anis Bougrine <anis.bougrine10@gmail.com>
Subject: [PATCH] kernel-module-split: Remove get_ext_mod
Date: Sat,  5 Sep 2026 10:21:25 +0100
Message-ID: <20260905092125.2771306-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 09:21:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245147

This function is calling make on the kernel makefiles. Even through --dry-run is
specificed, in my local tests it executes things and this is bad in itself.

The function is called from a shell function meaning it is always expanded during
parsing, which means we're executing make during every datastore parse, which is
also very bad.

Simplfy the function down to ${S} for now. If there is need to change that we can
parameterise it but we need working/safe builds and this is the least worse alternative
besides reverting the changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../kernel-module-split.bbclass               |  2 +-
 meta/lib/oe/kernel_module.py                  | 21 -------------------
 2 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 413f39d641a..99c2d129629 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -62,7 +62,7 @@ post_strip_kernel_modules_signing(){
         oe_runmake \
             -C ${KBUILD_OUTPUT}  \
             MODLIB=${PKGD}${KERNEL_MODULE_INSTALL_PREFIX} \
-            ${@'M=%s' % oe.kernel_module.get_ext_mod(d) if not "virtual/kernel" in d.getVar('PROVIDES') else ''} \
+            ${@'M=%s' % '${S}' if not "virtual/kernel" in d.getVar('PROVIDES') else ''} \
             modules_sign
     fi
 }
diff --git a/meta/lib/oe/kernel_module.py b/meta/lib/oe/kernel_module.py
index edf723033f1..0d27fbaa57f 100644
--- a/meta/lib/oe/kernel_module.py
+++ b/meta/lib/oe/kernel_module.py
@@ -25,24 +25,3 @@ def kernel_module_os_env(d, env_dict):
         env_dict['KBUILD_EXTRA_SYMBOLS'] = kbuild_extra_symbols
     else:
         env_dict['KBUILD_EXTRA_SYMBOLS'] = ''
-
-def get_ext_mod(d):
-    """
-    Extract the resolved Kbuild M= variable from an out of tree module Makefile variable database.
-    """
-    import re
-    import bb.process
-
-    try:
-        output = bb.process.run(
-            "make -C %s --dry-run --print-data-base" % d.getVar("B")
-        )[0]
-    except bb.process.ExecutionError:
-        return d.getVar("S")
-
-    for line in output.splitlines():
-        m = re.match(r'^M\s*=\s*(.*)$', line)
-        if m:
-            return m.group(1).strip()
-
-    return d.getVar("S")

