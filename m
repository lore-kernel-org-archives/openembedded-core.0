Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30658CD4F27
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:25:02 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.16009.1695367492391015940
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jVawi3z0;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so30206721fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367490; x=1695972290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QiWLtJ0JULx2UEUeFg+bwH7b9/0XorVZHAzTjjhYPs=;
        b=jVawi3z0MB1SFiSg001uY+SWzW8KyeLtR/DkZ/wN/BevALv3VDZWbmkMI6MlKS0JyV
         JTYWpDiVnEayuM9kAEbbzBTuaiQmUJHDhtfKJMXNTJKfT4OblVPwWZbOdry2ofhAoQEs
         074LT5iT8fuUe0CggossgeC31MLYcc3YRieW80K9qZszCkRMrHfw+8RQpbbxolAjUedT
         LVNZnACGkgOT9c0m8UhstFicPZiBdIGxJj6QGJPsdB/CEdQzYOgD4n5tjKFbNsxlomP/
         g6zfHKWKzUOExsbp4qgLIqFrsSSB4sWluWmfFLwcqsz9kV5fdkcLuo/RqtNNDTryjv0h
         fLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367490; x=1695972290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QiWLtJ0JULx2UEUeFg+bwH7b9/0XorVZHAzTjjhYPs=;
        b=AstmeBNskuvirRJmMYh1nJ5eZg4Moq/Fw6IgKhSDhzoXBXjai1+h31fNbEPgqayyne
         1gHkj1pewhQoq5LisCl8896zRqEEQkTkksj+FtnAadD4mTibNEg0z34nM4UdpWJV6mGb
         dzWKABhW/rzT2MqlI6iRBGspXovSv2NwWP5tXegUC5CRqgbI5X+W71JyPtarWqS/ZeHL
         cpKWE7+w4NRB61weT4H2yWKszVHEAkHzd+hAwXaqu5/yat/WTnYxV7cLM5ex+3ZmYN9a
         KDoJS606qFc2p7jpX/0Jjz1Qu4gE58o/zVAMiYOH5mKRlZ3eJry+yD6xybgEeWM+9sro
         c9Sw==
X-Gm-Message-State: AOJu0Yx5QpmHJOS9zWMtnp4VEV0gaFW3xXFG65Vd0A1Z1b5eUeS3+oRQ
	X3KD18uYyVRL0uOSE/2+2x/00bL64b0=
X-Google-Smtp-Source: AGHT+IGtjc1HO+up7pfHApb+d+2Hcr+pXAXw2gDICsF2j5dClL/RsqTZ9O3PelWnFRBegP0oyZn5iA==
X-Received: by 2002:a2e:9183:0:b0:2c0:1578:dc81 with SMTP id f3-20020a2e9183000000b002c01578dc81mr6532555ljg.14.1695367490562;
        Fri, 22 Sep 2023 00:24:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/40] meson: upgrade 1.1.1 -> 1.2.1
Date: Fri, 22 Sep 2023 09:24:16 +0200
Message-Id: <20230922072431.1481743-25-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188068

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Make-CPU-family-warnings-fatal.patch | 32 +++++++++----------
 .../meson/{meson_1.1.1.bb => meson_1.2.1.bb}  |  2 +-
 2 files changed, 17 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.1.1.bb => meson_1.2.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 848dccfbe72..8fbcb5a0a23 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From 6c4eef1d92e9e42fdbc888365cab3c95fb33c605 Mon Sep 17 00:00:00 2001
+From fcd3260c03f313676720e6219c5953d412fb0a2c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -7,15 +7,15 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 ---
- mesonbuild/envconfig.py   | 2 +-
- mesonbuild/environment.py | 4 +---
- 2 files changed, 2 insertions(+), 4 deletions(-)
+ mesonbuild/envconfig.py   | 4 ++--
+ mesonbuild/environment.py | 6 ++----
+ 2 files changed, 4 insertions(+), 6 deletions(-)
 
-Index: meson-0.60.2/mesonbuild/envconfig.py
-===================================================================
---- meson-0.60.2.orig/mesonbuild/envconfig.py
-+++ meson-0.60.2/mesonbuild/envconfig.py
-@@ -266,8 +266,8 @@ class MachineInfo(HoldableObject):
+diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
+index 7e0c567..a180065 100644
+--- a/mesonbuild/envconfig.py
++++ b/mesonbuild/envconfig.py
+@@ -284,8 +284,8 @@ class MachineInfo(HoldableObject):
                  'but is missing {}.'.format(minimum_literal - set(literal)))
  
          cpu_family = literal['cpu_family']
@@ -26,13 +26,13 @@ Index: meson-0.60.2/mesonbuild/envconfig.py
  
          endian = literal['endian']
          if endian not in ('little', 'big'):
-Index: meson-0.60.2/mesonbuild/environment.py
-===================================================================
---- meson-0.60.2.orig/mesonbuild/environment.py
-+++ meson-0.60.2/mesonbuild/environment.py
-@@ -354,10 +354,8 @@ def detect_cpu_family(compilers: Compile
-         if any_compiler_has_define(compilers, '__64BIT__'):
-             trial = 'ppc64'
+diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
+index e212c7a..9d2bff3 100644
+--- a/mesonbuild/environment.py
++++ b/mesonbuild/environment.py
+@@ -345,10 +345,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+         if compilers and not any_compiler_has_define(compilers, '__mips64'):
+             trial = 'mips'
  
 -    if trial not in known_cpu_families:
 -        mlog.warning(f'Unknown CPU family {trial!r}, please report this at '
diff --git a/meta/recipes-devtools/meson/meson_1.1.1.bb b/meta/recipes-devtools/meson/meson_1.2.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.1.1.bb
rename to meta/recipes-devtools/meson/meson_1.2.1.bb
index dd97f93aef6..fe452662029 100644
--- a/meta/recipes-devtools/meson/meson_1.1.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.2.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "d04b541f97ca439fb82fab7d0d480988be4bd4e62563a5ca35fadb5400727b1c"
+SRC_URI[sha256sum] = "b1db3a153087549497ee52b1c938d2134e0338214fe14f7efd16fecd57b639f5"
 
 inherit python_setuptools_build_meta github-releases
 
-- 
2.30.2


