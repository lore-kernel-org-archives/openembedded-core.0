Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A00C0219D
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:21 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.92682.1738600934806389271
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FYBX12GV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38a8b35e168so2786114f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600933; x=1739205733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYgPOySI1bqUFtkEfCoXxjQ/wocwMO7+jaioFJgU5TY=;
        b=FYBX12GVW+rXcsh1qhDsks8WBy7lBQio5tD4qpJzItjg3ZAPjuftKIUs0psN7P3Hpv
         4bU40CAY7rmK0pgXrGxvoan9Uvrip00KsPg0kaLSUaPihFn5u4yLtcjfUGXdsAltUn2T
         9/zks9t5ol4rDVjblm7etzBq2lCeV4VSgucis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600933; x=1739205733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jYgPOySI1bqUFtkEfCoXxjQ/wocwMO7+jaioFJgU5TY=;
        b=ad7T5zA1WXeCmqZLIZ6UhIaXtsBfUJ4ikUvy29dxh+x/0Ewry0rUPA4DvZxJSN9wz7
         OMjiz9Em8K+t+QOXzUn4nf9BLNfojiSxldxn90P0wT8dPMGU6XLlJP6yvpz6LdZOagv1
         IrjHZrm+pHdgkhe0g/3bdRq3E/SSNFPmaRIWP6nUaJlACUEIsLmIDTaIUXm4VFr+mWUS
         +BCbm/uceRd5rYtZAHSmX1pbV/gIo7GYx6ZXgcQAvDbRamOA7BeyZaRVcTlTah8JV8/V
         mDMB0fyCJK25Veai5L3H9cYsEnL7pW7fHI6S5peIBx3qlHzbZaleNDUdzlSjJjoOISyK
         OIFw==
X-Gm-Message-State: AOJu0Yw0iI/mlktFRPNZ6uCWTvp3KA42nBhOKqzxOzx3G3bk86ZjPeVz
	F7/+NQoS9ENp2/GsVfUPo1qMOvhxN4IwfrnA6cKcH9KakeM1pTp+G91ACveQFRhz3A7T6PdEsZY
	J
X-Gm-Gg: ASbGncvyafUER7bFN28z/JyM1POfD3PvGcEDmcOW2Py1m+prQNh0rKNgnFtClzo9Zrk
	46pxbOmztN2qKq3d3YWvP1Q/QhUpA8afoJidx71CBLA7lz+TdTTXHexDcvgDm15WTDkKUxJDVdi
	04l2LVQl0iS9LHEhyXf8jBfqZjCJOWVu+u/ORE1roh1AYes9pGjQi/KDqM/2NBEV2pPBhmsRqa0
	mmZaOeK0+GBprdQCYqMw9xVh1B4yCIcmjyeGKBU1M3sjJv8AM88IPfXcGUhU0eJCQw8iTyYGJEX
	S6E/ZYEfgnoKVNtfcyEmIX0ALfb7qufzVS7xl/7kM+Xm
X-Google-Smtp-Source: AGHT+IGdxMUQXzM/DbVf/GkShqn7l9in069Ahkfz5NOCo6yYEKbxBTlsUZJsdKjuuX/5L4Dwq9n5dg==
X-Received: by 2002:a5d:598d:0:b0:38b:ee18:dd46 with SMTP id ffacd0b85a97d-38c5a9a620amr14902951f8f.20.1738600932798;
        Mon, 03 Feb 2025 08:42:12 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.42.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:42:12 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 39/46] python3-setuptools: upgrade 75.6.0 -> 75.8.0
Date: Mon,  3 Feb 2025 16:41:23 +0000
Message-ID: <20250203164130.3403325-39-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210712

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-sysconfig.py-make-it-possible-to-substite.patch | 13 +++++--------
 ...tionally-do-not-fetch-code-by-easy_install.patch |  7 ++-----
 ...tools_75.6.0.bb => python3-setuptools_75.8.0.bb} |  2 +-
 3 files changed, 8 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_75.6.0.bb => python3-setuptools_75.8.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 68dca43e21a..f5f110d6915 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From a9f3483b492317959a35886308c31c078e350a35 Mon Sep 17 00:00:00 2001
+From b84b849dc72d2523f18fdbbbd28a2cd975596d08 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -20,10 +20,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
-index 7ebe67687..8039021a8 100644
+index da1eecb..bb02a09 100644
 --- a/setuptools/_distutils/sysconfig.py
 +++ b/setuptools/_distutils/sysconfig.py
-@@ -121,6 +121,8 @@ def get_python_inc(plat_specific=False, prefix=None):
+@@ -122,6 +122,8 @@ def get_python_inc(plat_specific=False, prefix=None):
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
      default_prefix = BASE_EXEC_PREFIX if plat_specific else BASE_PREFIX
@@ -32,7 +32,7 @@ index 7ebe67687..8039021a8 100644
      resolved_prefix = prefix if prefix is not None else default_prefix
      # MinGW imitates posix like layout, but os.name != posix
      os_name = "posix" if is_mingw() else os.name
-@@ -241,7 +243,13 @@ def get_python_lib(plat_specific=False, standard_lib=False, prefix=None):
+@@ -242,7 +244,13 @@ def get_python_lib(plat_specific=False, standard_lib=False, prefix=None):
  
      early_prefix = prefix
  
@@ -47,7 +47,7 @@ index 7ebe67687..8039021a8 100644
          if standard_lib:
              prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
          else:
-@@ -256,7 +264,7 @@ def get_python_lib(plat_specific=False, standard_lib=False, prefix=None):
+@@ -257,7 +265,7 @@ def get_python_lib(plat_specific=False, standard_lib=False, prefix=None):
              # Pure Python
              libdir = "lib"
          implementation = 'pypy' if IS_PYPY else 'python'
@@ -56,6 +56,3 @@ index 7ebe67687..8039021a8 100644
          return _posix_lib(standard_lib, libpython, early_prefix, prefix)
      elif os.name == "nt":
          if standard_lib:
--- 
-2.39.2
-
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 527160735f0..f320bf4e6fe 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 00611eb8151825632bc36c189109626d9223037f Mon Sep 17 00:00:00 2001
+From 9441848a121912b6627c7188ab95595684c8306b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -20,7 +20,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 66fe68f7a..8647c2082 100644
+index 66fe68f..8647c20 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -673,6 +673,11 @@ class easy_install(Command):
@@ -35,6 +35,3 @@ index 66fe68f7a..8647c2082 100644
          with self._tmpdir() as tmpdir:
              if not isinstance(spec, Requirement):
                  if URL_SCHEME(spec):
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb b/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_75.6.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_75.8.0.bb
index c0e4b7031d7..02e299d0beb 100644
--- a/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "8199222558df7c86216af4f84c30e9b34a61d8ba19366cc914424cdbd28252f6"
+SRC_URI[sha256sum] = "c5afc8f407c626b8313a86e10311dd3f661c6cd9c09d4bf8c15c0e11f9f2b0e6"
 
 DEPENDS += "python3"
 

