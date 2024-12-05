Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF5BE77173
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 09:33:42 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.6627.1733391219234103457
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 01:33:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WRHrTKP7;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ffd6882dcbso5105841fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 01:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733391217; x=1733996017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTQqy92CRK7huhHuuH3An1Ib8ji4pq5bMBxnDrzsUlw=;
        b=WRHrTKP7JpIcefwIcicwHDr+A4N9/lWeDF62kbG1+GsttcyNVuvG/wSmaqCRQxPXqc
         z+nAwC3UXk/9vmwVXyVFtd7ys5gFREgCODqnWgi96Y8ECItc3Yd77HqNPxifJLx8F4GX
         uzh02IkcM1XoRbK1c9LC/QBEssiYWE+dm3Z/1xuv9AyWFX325RrhWP+u/9KIF8Hk8VVM
         5O3SoUn3BAMsgwBuSoLJE7yqOwdCFENd2A3M+GnVc2ioSg2w6uhEC38jAJZTjJnqoy61
         5ZyN3pRJIf0I4kb3UBnRk9CagBpGUsuHDuat1jPQByvXNkyomBN8AUMs7TlsuUVdkIWe
         xu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733391217; x=1733996017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTQqy92CRK7huhHuuH3An1Ib8ji4pq5bMBxnDrzsUlw=;
        b=aGZ+N8lSnMemRJxoLBEmjQbRKpZAu58t5d0MNI21EeHYCA3xP5+hoZGodm+DzcIowg
         NGsSeoasV6ziq8bTx9nM/vTEToVD9cp4MlHxlvATlP+bhYv5x2Z8U3p3azn9rRoDhvr/
         drZxj2bRZO/BBxuEfGYQYbo5n7McKJBqNQfN7C6/b64D5qk/EgTV7rtCiaclolSrWtz9
         LhwTT15/mdlI+3RlZ0hW4IvqpKFES85265WVMqqZT1fpZObMPRl4OKUvCC6nFrrpwOQt
         tCwRc0/xPyjV1TZJv0/TF67OkomPjB4M3OAA8nUlwZeZmdSlxfSRdvFUF/TgJCB0xrc7
         RIog==
X-Gm-Message-State: AOJu0Yyo0KBaHStCI9w3mBFWdWK/bFBLocKn0XuortiYSTyBT0f6/8B5
	4o6crbuCfr4giosJ2WtxycYW9TzdV8wAtwIWY7uLfLhpq0Kj5OkToG/ngzJcw6rORZO2krHk90I
	6
X-Gm-Gg: ASbGncsUbkRokWkX4fT51elkaEsE6FsbItB4w+0j9VU/1y2PyCvsL6gCFpgPtmzWWMp
	71XjzRbLq595vsfK1X8y/9EHCUDzqEGgXUrNm1UjFLaAMqHp2C3oYhx3Hdo4XpdiTbL9bnalFsp
	CbsPs5gO20vsh1+HYtqV/6NML0NG7/bHtjK8qbhlJfA8dcO7SQyx4cMmquIR7m8YchcUkc6M2qX
	vzQz2hfCQEMWDEMCA7Lru6GsnFcNy89edsNz7cizIamgvbS8gwtwGO6dK79+UUJlyuWmk5Qlyze
	dlCCoseFN4bQmFRYMTuGc1I=
X-Google-Smtp-Source: AGHT+IHomWQXv/a2OoXjZhGfjvjfC7RgZAhg/IgEZtYumeclaibT/S9ulVoNGvRry92CfzHcTvMOWQ==
X-Received: by 2002:a2e:b88d:0:b0:2ff:a7c1:8c55 with SMTP id 38308e7fff4ca-30014eaaa5amr30839051fa.28.1733391216413;
        Thu, 05 Dec 2024 01:33:36 -0800 (PST)
Received: from localhost.localdomain (2001-14ba-490-c700--133.rev.dnainternet.fi. [2001:14ba:490:c700::133])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020e5750dsm1648961fa.101.2024.12.05.01.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 01:33:34 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 3/3] dtc: update from 1.7.0 to 1.7.2
Date: Thu,  5 Dec 2024 11:32:37 +0200
Message-ID: <20241205093237.333818-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205093237.333818-1-mikko.rapeli@linaro.org>
References: <20241205093237.333818-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 09:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208369

To align with python3-dtc version. Changes:

https://github.com/dgibson/dtc/releases/tag/v1.7.2

Changes since v1.7.1 include:
 * Build
   - Fix automatic dependency handling for paths with spaces in them
   - Fix to allow compilation with swig 4.3.0
   - Disable pointless warnings on swig generated code
 * fdtoverlay
   - Improve error message with missing /__symbols__

https://github.com/dgibson/dtc/releases/tag/v1.7.1

Changes sinve v1.7.0 include:
 * dtc
   * Fix check for 10-bit I2C addresses
   * Improve documentation of -@ option
   * Update to libyaml >= 0.2.3
   * Improvements & fixes for device graph checks
   * Add -L / --local-fixups option
   * Add check for length of interrupt-map properties
 * libfdt
   * Add fdt_path_getprop_namelen()
   * Add fdt_get_symbol() and fdt_get_symbol_namelen()
   * Correct documentation of fdt_path_offset()
   * Correct documentation of fdt_appendprop_addrrange()
   * Validate aliases is fdt_get_alias_namelen()
   * Don't overwrite phandles when applying overlays
   * Require Python 3
 * pylibfdt
   * Support boolean properties
   * Fixes for current Python versions
 * General
   * Assorted bugfixes
   * Assorted build improvements
   * Assorted typo fixes in docs
   * Some additional testcases
   * Move to GitHub Actions based CI

Drop patches which were upstreamed.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...01-meson.build-bump-version-to-1.7.0.patch | 29 --------------
 ...n-allow-building-from-shallow-clones.patch | 38 -------------------
 .../dtc/{dtc_1.7.0.bb => dtc_1.7.2.bb}        |  4 +-
 3 files changed, 1 insertion(+), 70 deletions(-)
 delete mode 100644 meta/recipes-kernel/dtc/dtc/0001-meson.build-bump-version-to-1.7.0.patch
 delete mode 100644 meta/recipes-kernel/dtc/dtc/0002-meson-allow-building-from-shallow-clones.patch
 rename meta/recipes-kernel/dtc/{dtc_1.7.0.bb => dtc_1.7.2.bb} (86%)

diff --git a/meta/recipes-kernel/dtc/dtc/0001-meson.build-bump-version-to-1.7.0.patch b/meta/recipes-kernel/dtc/dtc/0001-meson.build-bump-version-to-1.7.0.patch
deleted file mode 100644
index 79a3b92b44..0000000000
--- a/meta/recipes-kernel/dtc/dtc/0001-meson.build-bump-version-to-1.7.0.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9153522103bd4ed7e3299c4d073f66bb37cb2d42 Mon Sep 17 00:00:00 2001
-From: Nikolay Letov <letov.nikolay@gmail.com>
-Date: Wed, 22 Feb 2023 13:36:07 +0300
-Subject: [PATCH 1/2] meson.build: bump version to 1.7.0
-
-[This was botched in the actual 1.7.0 release :( - David Gibson]
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=64a907f08b9bedd89833c1eee674148cff2343c6]
-
-Signed-off-by: Nikolay Letov <letov.nikolay@gmail.com>
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 78251eb..d88cd9f 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,5 +1,5 @@
- project('dtc', 'c',
--  version: '1.6.0',
-+  version: '1.7.0',
-   license: ['GPL2+', 'BSD-2'],
-   default_options: 'werror=true',
- )
--- 
-2.30.2
-
diff --git a/meta/recipes-kernel/dtc/dtc/0002-meson-allow-building-from-shallow-clones.patch b/meta/recipes-kernel/dtc/dtc/0002-meson-allow-building-from-shallow-clones.patch
deleted file mode 100644
index 0284905913..0000000000
--- a/meta/recipes-kernel/dtc/dtc/0002-meson-allow-building-from-shallow-clones.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 4415b0baece3c4351a6d3637c2754abbefd4795d Mon Sep 17 00:00:00 2001
-From: Peter Marko <peter.marko@siemens.com>
-Date: Sat, 16 Dec 2023 18:58:31 +0100
-Subject: [PATCH 2/2] meson: allow building from shallow clones
-
-When building from shallow clone, tag is not available
-and version defaults to git hash.
-Problem is that some builds check DTC version and fail the comparison.
-Example is https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git
-Which fails to build with following error:
-dtc version too old (039a994), you need at least version 1.4.4
-
-Drop --always from git describe command, see
-https://github.com/mesonbuild/meson/blob/1.3.0/mesonbuild/utils/universal.py#L773
-This will make it more closer to build via Makefile.
-
-Upstream-Status: Submitted [https://github.com/dgibson/dtc/pull/122]
-
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/meson.build b/meson.build
-index 78251eb..fc0c92a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -56,6 +56,7 @@ py = py.find_installation(required: get_option('python'))
- swig = find_program('swig', required: get_option('python'))
- 
- version_gen_h = vcs_tag(
-+  command: ['git', 'describe', '--dirty=+'],
-   input: 'version_gen.h.in',
-   output: 'version_gen.h',
- )
--- 
-2.30.2
-
diff --git a/meta/recipes-kernel/dtc/dtc_1.7.0.bb b/meta/recipes-kernel/dtc/dtc_1.7.2.bb
similarity index 86%
rename from meta/recipes-kernel/dtc/dtc_1.7.0.bb
rename to meta/recipes-kernel/dtc/dtc_1.7.2.bb
index 0702fc16df..93668e5544 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.0.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.2.bb
@@ -10,10 +10,8 @@ LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = " \
     git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https \
-    file://0001-meson.build-bump-version-to-1.7.0.patch \
-    file://0002-meson-allow-building-from-shallow-clones.patch \
 "
-SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
+SRCREV = "2d10aa2afe35527728db30b35ec491ecb6959e5c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


