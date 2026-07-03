Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D935EC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 08:30:19 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87934.1783067409592681164
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 01:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NzzGwnq9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so1987935e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 01:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783067408; x=1783672208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xbSWPsH7X1qNygNXIkT2/R4lpzSZTrPW94Xy1lknDsc=;
        b=NzzGwnq9+L03uzrF/T0hqt+6foNQtY0+F2btF4F/c+c3IrVeUqi2XDlkFpuO879lZK
         0iHSpRtUVKrQ0YT7GGzngCKHH67VEH6uYR0tRC2z209BP61M2rGmmRrtxk3lcdZN1Zbd
         2O54bI45Ld9OBrl8suF2JMa/+dGX6/cyJWd0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067408; x=1783672208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xbSWPsH7X1qNygNXIkT2/R4lpzSZTrPW94Xy1lknDsc=;
        b=MEEYvNUSHPxqNTtXcaJxYoRSAFbeL2AuyYu64ReNTAEXEHM1pJVS3QtuHsqHa14dpw
         VFwwMbrvOio30Ajs+qUAZwg8XdboBP6t0c0OQjOgKswqv6BIoeALJlv6tzFIpEwia84N
         1LsY6tcat59KJI++aaznAAdXspgECtDBpq8rhVuqKH+TvWgyzRZkmI373rdNigrwqg22
         OTNpPPYecRdfj/wCTiSlN4m4tmSr44tT9x5lvnkTyN9PpjkAQ1FV+V+oye6CsCj4Z735
         GpZ3IgoHj20JALHlEn2q260zit3AF/SrfH59hdsFO8yDjB6OHD5hTlHeg56mAuioovbl
         12ZQ==
X-Gm-Message-State: AOJu0YyN0vJcla6dJhiRmnTfdbtXLwArz8zu1Ti/oy66RjAgHvyopw70
	G0w4tKSaHkmAZupGQsMUNjNhXgo+Ac6qYnyLykj5tRPYlHEqBL3W1b6mjyo+/bN07Q+tuqk+EVu
	nnVjUJz8=
X-Gm-Gg: AfdE7ckUUxcjI6WsE7wDLHWwX+BcAucco9o4hZmURJA3Z70s2BZQpiICSU0C9k7KVM7
	t+/rlGxahmgNrM2YzlJnPfTl324v/wEcXdtN1tYkQjIH2+UEX+H5d78j4HSJnmterGMTiFvHIvs
	pQREjysqA3tgjCUA9hWzXuJPfIzx3H54PYGXCN26auY+1aG1kyknIt1irij54Gus4FAiWronk8Q
	i95o13AMWEhbZZ/EVbeNIQIvZHo7RUtUYryK7eeSfbXPkm1HjCqL+A1/HbRhdPWiiYJqMIbSG6H
	g+W4Tbs44t43WAcsYWobmdzcTnIZxmgBjCuFY/gx1mPgBKvQgelppHor7lhb82Mm+rFMDm936if
	8ta+xw3iMQywrprxaz+oVHfuj4VA+ubOSbyiQY36REaI2K7s/WkOtxBsThaqDEvN1XvRGxc5ARA
	2XVo29y4jyCi2OLJq4gTTM1aZQaI6ShW6mLEPeYk725g==
X-Received: by 2002:a05:600c:64c6:b0:493:c337:db18 with SMTP id 5b1f17b1804b1-493c3e135a9mr113243785e9.16.1783067407628;
        Fri, 03 Jul 2026 01:30:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ad8d:cf49:9149:eae0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm15684554f8f.2.2026.07.03.01.30.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:30:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/15] python3-cython: upgrade 3.2.5 -> 3.2.8
Date: Fri,  3 Jul 2026 09:29:50 +0100
Message-ID: <20260703082955.1585712-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
References: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240092

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ule-Use-SharedUtilitySourceDescripto.patch | 94 -------------------
 ...ictable-build-path-prefix-with-hardc.patch |  4 +-
 ...ython_3.2.5.bb => python3-cython_3.2.8.bb} |  7 +-
 3 files changed, 4 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-cython/0001-3.2.x-Shared-module-Use-SharedUtilitySourceDescripto.patch
 rename meta/recipes-devtools/python/{python3-cython_3.2.5.bb => python3-cython_3.2.8.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-cython/0001-3.2.x-Shared-module-Use-SharedUtilitySourceDescripto.patch b/meta/recipes-devtools/python/python3-cython/0001-3.2.x-Shared-module-Use-SharedUtilitySourceDescripto.patch
deleted file mode 100644
index b57acb69695..00000000000
--- a/meta/recipes-devtools/python/python3-cython/0001-3.2.x-Shared-module-Use-SharedUtilitySourceDescripto.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From f3cfdebd75374a29a930687c1f126282c51b7a92 Mon Sep 17 00:00:00 2001
-From: mv-python <matusvalo@users.noreply.github.com>
-Date: Fri, 12 Jun 2026 10:32:42 +0200
-Subject: [PATCH] [3.2.x] Shared module: Use `SharedUtilitySourceDescriptor`
- instead of temporary directory (#7723) (GH-7739)
-
-This PR uses `SharedUtilitySourceDescriptor` instead of an empty pyx
-file in the temp dir. This simplifies the logic and also assures that
-`__pyx_f` is unchanged across builds.
-
-Backport of https://github.com/cython/cython/pull/7723
-Alternative to https://github.com/cython/cython/pull/7634
-
-Upstream-Status: Backport [https://github.com/cython/cython/commit/f3cfdebd75374a29a930687c1f126282c51b7a92]
-
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- Cython/Build/SharedModule.py | 25 ++++++++-----------------
- Cython/Compiler/Scanning.py  |  9 +++++++++
- 2 files changed, 17 insertions(+), 17 deletions(-)
-
-diff --git a/Cython/Build/SharedModule.py b/Cython/Build/SharedModule.py
-index fed6263cd..45da4b462 100644
---- a/Cython/Build/SharedModule.py
-+++ b/Cython/Build/SharedModule.py
-@@ -1,13 +1,10 @@
- import os
--import re
--import shutil
--import tempfile
- 
- from Cython.Compiler import (
-     MemoryView, Code, Options, Pipeline, Errors, Main, Symtab
- )
- from Cython.Compiler.StringEncoding import EncodedString
--from Cython.Compiler.Scanning import FileSourceDescriptor
-+from Cython.Compiler.Scanning import SharedUtilitySourceDescriptor
- 
- 
- def create_shared_library_pipeline(context, scope, options, result):
-@@ -72,23 +69,17 @@ def generate_shared_module(options):
-     Errors.open_listing_file(None)
- 
-     dest_c_file = options.shared_c_file_path
-+    pyx_file = os.path.splitext(dest_c_file)[0] + '.pyx'
-     module_name = os.path.splitext(os.path.basename(dest_c_file))[0]
- 
-     context = Main.Context.from_options(options)
-     scope = Symtab.ModuleScope('MemoryView', parent_module = None, context = context, is_package=False)
- 
--    with tempfile.TemporaryDirectory() as tmpdirname:
--        pyx_file = os.path.join(tmpdirname, f'{module_name}.pyx')
--        c_file = os.path.join(tmpdirname, f'{module_name}.c')
--        with open(pyx_file, 'w'):
--            pass
--        source_desc = FileSourceDescriptor(pyx_file)
--        comp_src = Main.CompilationSource(source_desc, EncodedString(module_name), os.getcwd())
--        result = Main.create_default_resultobj(comp_src, options)
--
--        pipeline = create_shared_library_pipeline(context, scope, options, result)
--        err, enddata = Pipeline.run_pipeline(pipeline, comp_src)
--        if err is None:
--            shutil.copy(c_file, dest_c_file)
-+    source_desc = SharedUtilitySourceDescriptor(pyx_file)
-+    comp_src = Main.CompilationSource(source_desc, EncodedString(module_name), os.getcwd())
-+    result = Main.create_default_resultobj(comp_src, options)
-+
-+    pipeline = create_shared_library_pipeline(context, scope, options, result)
-+    err, enddata = Pipeline.run_pipeline(pipeline, comp_src)
- 
-     return err, enddata
-diff --git a/Cython/Compiler/Scanning.py b/Cython/Compiler/Scanning.py
-index 2a8cb5a93..4cec7d1ed 100644
---- a/Cython/Compiler/Scanning.py
-+++ b/Cython/Compiler/Scanning.py
-@@ -281,6 +281,15 @@ class StringSourceDescriptor(SourceDescriptor):
-         return "<StringSourceDescriptor:%s>" % self.name
- 
- 
-+class SharedUtilitySourceDescriptor(FileSourceDescriptor):
-+    """
-+    A specialized source descriptor for shared utility code only. Not part of public API.
-+    """
-+
-+    def get_file_object(self, encoding=None, error_handling=None):
-+        from io import StringIO
-+        return StringIO('')
-+
- #------------------------------------------------------------------
- 
- class PyrexScanner(Scanner):
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
index fad7f28a606..573a53ee561 100644
--- a/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
+++ b/meta/recipes-devtools/python/python3-cython/0001-Replace-not-predictable-build-path-prefix-with-hardc.patch
@@ -1,4 +1,4 @@
-From 949e3c185719c37b3a3e4c11664db16533f51dc8 Mon Sep 17 00:00:00 2001
+From a3b9d4303b6aaf5ef2ce9ffd1ba42a93f9cc68e0 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 17 Sep 2025 01:42:08 -0700
 Subject: [PATCH] Replace not predictable build path prefix with hardcode
@@ -53,7 +53,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Cython/Compiler/ModuleNode.py b/Cython/Compiler/ModuleNode.py
-index 30e67aa..ade6a7f 100644
+index 34f1b32..b09350b 100644
 --- a/Cython/Compiler/ModuleNode.py
 +++ b/Cython/Compiler/ModuleNode.py
 @@ -877,7 +877,9 @@ class ModuleNode(Nodes.Node, Nodes.BlockNode):
diff --git a/meta/recipes-devtools/python/python3-cython_3.2.5.bb b/meta/recipes-devtools/python/python3-cython_3.2.8.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-cython_3.2.5.bb
rename to meta/recipes-devtools/python/python3-cython_3.2.8.bb
index 8bd68bd4dff..e899fc411f8 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.5.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.2.8.bb
@@ -7,14 +7,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "3dd42e4cf36ad15f265bdfec2337cc00c688c8eb6d374ffd13bb19437c27bba1"
+SRC_URI[sha256sum] = "f4f23a56b25221a06f91817fe8f3114ab8b48a4fac73187dbb64bc2c4a87961f"
 
 inherit pypi setuptools3 cython
 
-SRC_URI += " \
-    file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch \
-    file://0001-3.2.x-Shared-module-Use-SharedUtilitySourceDescripto.patch \
-"
+SRC_URI += "file://0001-Replace-not-predictable-build-path-prefix-with-hardc.patch"
 
 # No need to depend on self
 DEPENDS:remove = "python3-cython-native"

