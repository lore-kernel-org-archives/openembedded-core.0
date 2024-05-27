Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0273DC25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 18:12:26 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.3635.1716833545406519718
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 11:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lfd8+PNp;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a620a28e95cso5158566b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 11:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716833544; x=1717438344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GLpizT9bTy8GGSoa9tPvVjcA3DNy853nzJx4uKeIsU=;
        b=lfd8+PNp/eLvEXbU/PDP+jqIckF/3Z+7t5wrtGd3F0pD2mLJMJzXsNnT57v8JLbood
         K30VxPZ+atEXlFhNQ4KGx/VkrIUu3iktYdcL7kzzvI1uq4Lt5M+PeGDUtLS2TwnsK5I5
         r8eC3T3hggK/Ttw98UO4l2xFpOYKHXvWagBa7Gq5tGoQHl/7GO1f0rxT1/g8FBf5kffp
         U4wDIgrVE/nMai4hMnQUFyPE/Sx7/51+mZk7OVOpRgrvGcXkNXcs8tOrbwCisg3WBXbF
         2HvOE7P3Bicn1A2Mua3CvzE2cILeVRDOb6wAhUOGyFANx7XLviPRGzaLKdc9BzibOeA/
         5zRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716833544; x=1717438344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GLpizT9bTy8GGSoa9tPvVjcA3DNy853nzJx4uKeIsU=;
        b=Q/crz2OdhHpW/xb6H7k/Epwr1xAbSDOjxgPIV339IrY/N0lzXMvVJBLDvfXSBuBLnE
         rtjBuhDUxE09lz0BleB2wvf0BmtJUkDDEV9pkzpxQVBODKaYUXhDrGwSvcEmSPscKV5F
         mZgRIuyWixSKeH2JNPNN+yPXbjhLoFUzW8XqJqge1r94w0aamt4wR3H5S3a8LvwbiAQS
         GrxVGRvUgBk3et+kVDluny0591Noaw4dKkPrMDXv3HnEFak3yJp2EGdOli4DAw18vYJ6
         zNsfmoroxQZ9xCJ4/QFwrPjxQq77bEVmZrU1a3/ScB7LiN0crXnMlTFhgtBQNvCByWRA
         DIRw==
X-Gm-Message-State: AOJu0Yw9OUU8nj5HmxFzZYOGkXVRrTsA5zaXjGI/uKNbVV71rdH9gMxa
	JT+erYm9GumLxcVS+DPP+fZEN2YO4NXbEAWr3EoHLRY8OW3SA3hBV2JtfQ==
X-Google-Smtp-Source: AGHT+IFEqBB4xZjyeEHovrBUGFLUsjnG3uUdgAlRSeEjdI9EYO3ajy/MNigqJJ9WgI403DmRFALtlw==
X-Received: by 2002:a17:906:f88b:b0:a5c:d67a:1e1c with SMTP id a640c23a62f3a-a62641b8ba2mr739268966b.20.1716833543727;
        Mon, 27 May 2024 11:12:23 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc50064sm510272466b.107.2024.05.27.11.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 11:12:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/13] meson: upgrade 1.3.1 -> 1.4.0
Date: Mon, 27 May 2024 20:12:11 +0200
Message-Id: <20240527181214.1778037-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240527181214.1778037-1-alex.kanavin@gmail.com>
References: <20240527181214.1778037-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 18:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199927

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../meson/0001-Make-CPU-family-warnings-fatal.patch   | 11 +++++------
 ...odule-do-not-manipulate-the-environment-when.patch |  9 ++++-----
 .../0002-Support-building-allarch-recipes-again.patch |  7 +++----
 .../meson/{meson_1.3.1.bb => meson_1.4.0.bb}          |  2 +-
 4 files changed, 13 insertions(+), 16 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.3.1.bb => meson_1.4.0.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index 8ea7c359505..94129b2f25f 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,21 +1,20 @@
-From b77cbe67df5fa0998946503f207c256ee740bb5f Mon Sep 17 00:00:00 2001
+From c61c93f43b70ba0670d41e841bff9f2a7186cc2f Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
 ---
  mesonbuild/envconfig.py   | 4 ++--
  mesonbuild/environment.py | 6 ++----
  2 files changed, 4 insertions(+), 6 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 07f1229..a35c356 100644
+index 0e9cd23..b44e60c 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -285,8 +285,8 @@ class MachineInfo(HoldableObject):
+@@ -276,8 +276,8 @@ class MachineInfo(HoldableObject):
                  'but is missing {}.'.format(minimum_literal - set(literal)))
  
          cpu_family = literal['cpu_family']
@@ -27,10 +26,10 @@ index 07f1229..a35c356 100644
          endian = literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 2ba2054..d798e3b 100644
+index af69f64..248d6dd 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -359,10 +359,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
+@@ -379,10 +379,8 @@ def detect_cpu_family(compilers: CompilersDict) -> str:
          if compilers and not any_compiler_has_define(compilers, '__mips64'):
              trial = 'mips'
  
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index 2e0a4b1bbe6..9f3f516a5c1 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From e85683698aa3556bf14fc6d35f2c067f16af520b Mon Sep 17 00:00:00 2001
+From b4c0602a56d3517ab66b98a7dbb69defe77d29a3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
@@ -6,16 +6,15 @@ Subject: [PATCH] python module: do not manipulate the environment when calling
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  mesonbuild/dependencies/python.py | 6 +-----
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/mesonbuild/dependencies/python.py b/mesonbuild/dependencies/python.py
-index 9aea6bd..8c13ede 100644
+index b9b17f8..a305afb 100644
 --- a/mesonbuild/dependencies/python.py
 +++ b/mesonbuild/dependencies/python.py
-@@ -380,9 +380,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -381,9 +381,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                      empty.name = 'python'
                      return empty
  
@@ -25,7 +24,7 @@ index 9aea6bd..8c13ede 100644
                  try:
                      return PythonPkgConfigDependency(name, env, kwargs, installation, True)
                  finally:
-@@ -391,8 +388,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+@@ -392,8 +389,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
                              os.environ[name] = value
                          elif name in os.environ:
                              del os.environ[name]
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index a8396f30bbe..fa5ea57d5b9 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 6fb8db54929b40e1fd7ac949ef44f0d37df0bae9 Mon Sep 17 00:00:00 2001
+From 7f69bfabb87d311d7409ea6699f7dee8e9b3a95b Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -7,16 +7,15 @@ This registers "allarch" as a known CPU family.
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
-
 ---
  mesonbuild/envconfig.py | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index a35c356..436355f 100644
+index b44e60c..c70e8cb 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -38,6 +38,7 @@ from pathlib import Path
+@@ -28,6 +28,7 @@ from pathlib import Path
  
  
  known_cpu_families = (
diff --git a/meta/recipes-devtools/meson/meson_1.3.1.bb b/meta/recipes-devtools/meson/meson_1.4.0.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.3.1.bb
rename to meta/recipes-devtools/meson/meson_1.4.0.bb
index 5b0d82fe9f5..5db100ff1cd 100644
--- a/meta/recipes-devtools/meson/meson_1.3.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.4.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "6020568bdede1643d4fb41e28215be38eff5d52da28ac7d125457c59e0032ad7"
+SRC_URI[sha256sum] = "8fd6630c25c27f1489a8a0392b311a60481a3c161aa699b330e25935b750138d"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.39.2


