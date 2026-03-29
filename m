Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52CEFC97FA
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:38:07 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38375.1774823886598688298
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3KCL+gSz;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so32148795e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774823885; x=1775428685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9l50duf5zEDAhHdXAmfFwGnkBPanJVJv49TAJEdyPQ=;
        b=3KCL+gSzqHBOQXI5ZB5wZ4faGSJ3w+bjkmuFn3KNIwShBBZvGVwo2TceUoEAClVUUp
         OGQLBaLgkS5DZqDY6Y93VCYXbWDCbSakm2Sq+ThA7JrIhhH6P7XidWqSbE/uE96j3PGJ
         PaiRqbKlAh+8mbdyT0fhYAstebbjbIo8iMv3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774823885; x=1775428685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k9l50duf5zEDAhHdXAmfFwGnkBPanJVJv49TAJEdyPQ=;
        b=A/8LJwRUnpL9GfkshgtCXT4eaVrViLCP5Dz1MsmPS0GQ5HgDrYaa3mVQYrroSqDK0Q
         L8jE1qzJUGQN1hP7SwCS/g1k7XPmUZxhDpWAskvhxDwEQ5NKQJH0tgLp4Bs5zfN96TFi
         se4+g8hTpdI+Oxf00ZJbFg8VXc59QqduLhoW7wYqQZlpznS/NzHas1/25K9Cmcs57Epb
         YPf0kfrBXicJuKS6ALglrZ17ejmo9tMJPTpnoYsIljzgiktN5+v8zuBuC0OPGFDqSr0k
         9wKRzdgR9xdYsuPppxAZp5JpY7/BeT24vbZEac4P/U9+QhcTwHITT5RV4ctTqM4MkjT3
         /l1A==
X-Gm-Message-State: AOJu0YwWVr9lFEhtBuxa1uR4BKiBxhD3fVi/OQB1hN//h07SSouy4Riz
	9YVHlrmD1VZKkPrhNGk446euM5Ypk4Psriqy9R8Vh/rpPRdVIZafNJeo2kBEIb0G42UguyW+HAW
	Wa7QiQoU=
X-Gm-Gg: ATEYQzytrckX1X43fSReDZfAyzJpJQ1TjHuEqB7FIC3CGplbX18mmG3+cq15/UfIEgs
	PDk/ecpINhB96wgZyw96Jm1OeLtBtheDGKmEn7Whra79yW8Mkd9AayI2JR6z4ghSOb8B9prcIoW
	xWA+l+Dkl0Pjzw8T857dIRPWdQrzlA6Iw1XBsdlw2cNSYOMqy1tX0b5IUBCRPdzdTzymiIKxbVL
	flF7FnTNvJJvgKQD8KmBgXrLL6JG3pJkPiwwJipJh9flQxfTNqASfnCozqmxQoUr5hLa4EEnQLB
	W/dOIdrav8QbCdh6YXSyW6qb8H4S7EL5tLp4sdzvUvcQZRZtI/NQj+WSFLVMMZPHPoKVN0aLkgZ
	2fjSI0CQ00cEEinluWSIo/PXSZQ97ijFO/TYmcaDK0Vu/QO7zNkiZhBfZb9A469n88+ZoUHO+68
	tOgh9x299GAflCG40KAwAPxzVCnzYsR5B0WX7MgJ3ax1NDE33OAe8bEtt4jiLj8XIiS5O9MJlRz
	1KhOO5hAvUuKL1IgVHpG4hc/zE=
X-Received: by 2002:a05:600c:3e88:b0:487:1108:48b8 with SMTP id 5b1f17b1804b1-48727ee9897mr159236295e9.2.1774823884702;
        Sun, 29 Mar 2026 15:38:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm13038542f8f.29.2026.03.29.15.38.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:38:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/16] spdx: add option to include only compiled sources
Date: Mon, 30 Mar 2026 00:37:35 +0200
Message-ID: <50390bb45db8560bc9d2ee3ad37979924e0046c7.1774823430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774823430.git.yoann.congal@smile.fr>
References: <cover.1774823430.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234161

From: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>

When SPDX_INCLUDE_COMPILED_SOURCES is enabled, only include the
source code files that are used during compilation.

It uses debugsource information generated during do_package.

This enables an external tool to use the SPDX information to disregard
vulnerabilities that are not compiled.

As example, when used with the default config with linux-yocto, the spdx size is
reduced from 156MB to 61MB.

(From OE-Core rev: c6a2f1fca76fae4c3ea471a0c63d0b453beea968)
Adapted to existing files for SPDX3.0

Tested with:
- bitbake world on oe-core
- oe-selftest --run-tests spdx.SPDX30Check

Regarding SPDX2.2, the respective backport was already performed in
OE-Core rev: a2866934e58fb377a73e87576c8594988a63ad1b

Signed-off-by: João Marcos Costa (Schneider Electric) <joaomarcos.costa@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/spdx-common.bbclass |  3 +++
 meta/lib/oe/spdx30_tasks.py      | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 713a7fc651e..ca0416d1c7f 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -26,6 +26,7 @@ SPDX_TOOL_VERSION ??= "1.0"
 SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
 
 SPDX_INCLUDE_SOURCES ??= "0"
+SPDX_INCLUDE_COMPILED_SOURCES ??= "0"
 
 SPDX_UUID_NAMESPACE ??= "sbom.openembedded.org"
 SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdocs"
@@ -40,6 +41,8 @@ SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
 python () {
     from oe.cve_check import extend_cve_status
     extend_cve_status(d)
+    if d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") == "1":
+        d.setVar("SPDX_INCLUDE_SOURCES", "1")
 }
 
 def create_spdx_source_deps(d):
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index a8970dcca0f..9c422d17573 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -145,6 +145,8 @@ def add_package_files(
     ignore_dirs=[],
     ignore_top_level_dirs=[],
 ):
+    import oe.spdx
+
     source_date_epoch = d.getVar("SOURCE_DATE_EPOCH")
     if source_date_epoch:
         source_date_epoch = int(source_date_epoch)
@@ -156,6 +158,11 @@ def add_package_files(
         bb.note(f"Skip {topdir}")
         return spdx_files
 
+    check_compiled_sources = d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") == "1"
+    if check_compiled_sources:
+        compiled_sources, types = oe.spdx.get_compiled_sources(d)
+        bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
+
     for subdir, dirs, files in os.walk(topdir, onerror=walk_error):
         dirs[:] = [d for d in dirs if d not in ignore_dirs]
         if subdir == str(topdir):
@@ -171,6 +178,11 @@ def add_package_files(
             filename = str(filepath.relative_to(topdir))
             file_purposes = get_purposes(filepath)
 
+            # Check if file is compiled
+            if check_compiled_sources:
+                if not oe.spdx.is_compiled_source(filename, compiled_sources, types):
+                    continue
+
             spdx_file = objset.new_file(
                 get_spdxid(file_counter),
                 filename,

